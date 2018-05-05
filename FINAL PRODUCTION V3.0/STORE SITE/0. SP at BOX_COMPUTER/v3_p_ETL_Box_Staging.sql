
USE [AG_METADATA]
GO

/****** Object:  StoredProcedure [dbo].[p_ExtractData_Box_Staging]    Script Date: 30/09/2017 4:04:04 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[p_ExtractData_Box_Staging]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[p_ExtractData_Box_Staging] AS' 
END
GO

ALTER PROCEDURE [dbo].[p_ExtractData_Box_Staging]
	@PackageID		int,
	@StoreID		int
AS
BEGIN
	--// Update package run status
	UPDATE
		[AG_METADATA].[dbo].[Packages]
	SET 
		[Status] = 0
	WHERE
		PackageID = @PackageID

	--// Check if previous package run not success --> Not run this package
	IF (SELECT ISNULL([Status], 0)
		FROM [AG_METADATA].[dbo].[Packages] WITH (NOLOCK)
		WHERE PackageID = (SELECT ParentPackageID FROM [AG_METADATA].[dbo].[Packages] WITH (NOLOCK) WHERE PackageID = @PackageID )) <> 1
	BEGIN
		INSERT INTO [AG_METADATA].[dbo].[LogPackage] 
		VALUES (@PackageID, GETDATE(), 'ERROR', 'Fail. The parent package must be run success first.')

		RETURN;
	END

	--// Update package status & Log package
	DECLARE @TimeRun	datetime = GETDATE();

	INSERT INTO [AG_METADATA].[dbo].[LogPackage] 
	VALUES (@PackageID, @TimeRun, 'INFO', 'Running')

	--// Get list all dataflow to extract data from package
	SELECT 
		 DataFlowID
		,PackageID
		,D_Source.LinkedServerName	AS 'Source_LinkedServer'
		,D_Source.DatabaseName		AS 'Source_DatabaseName'
		,T_Source.SchemaName		AS 'Source_SchemaName'
		,T_Source.TableName			AS 'Source_TableName'
		,T_Source.ColumnList		AS 'Source_ColumnList'
		,D_Dest.LinkedServerName	AS 'Dest_LinkedServer'
		,D_Dest.DatabaseName		AS 'Dest_DatabaseName'
		,T_Dest.SchemaName			AS 'Dest_SchemaName'
		,T_Dest.TableName			AS 'Dest_TableName'
		,ColumnName
		,ExtractMethod
		,PriorityRun
		,ROW_NUMBER() OVER(ORDER BY PriorityRun ASC) AS RowNo
	INTO
		#temp
	FROM
		[AG_METADATA].[dbo].[DataFlow] AS DF WITH (NOLOCK)
	LEFT OUTER JOIN
		[AG_METADATA].[dbo].[Tables] AS T_Source WITH (NOLOCK) ON T_Source.TableID = DF.SourceTableID
	LEFT OUTER JOIN
		[AG_METADATA].[dbo].[Databases] AS D_Source WITH (NOLOCK) ON D_Source.DatabaseID = T_Source.DatabaseID
	LEFT OUTER JOIN
		[AG_METADATA].[dbo].[Tables] AS T_Dest WITH (NOLOCK) ON T_Dest.TableID = DF.DestTableID
	LEFT OUTER JOIN
		[AG_METADATA].[dbo].[Databases] AS D_Dest WITH (NOLOCK) ON D_Dest.DatabaseID = T_Dest.DatabaseID
	WHERE
		PackageID = @PackageID;

	--// Freeze data for each table to extract from source
	DECLARE @Count					int = 1
	DECLARE @NumberTable			int
	DECLARE @sqlStatement			nvarchar(max)
	DECLARE @DataFlowID				int
	DECLARE @SourceLinkServer		varchar(50)
	DECLARE @SourceDatabaseName		varchar(50)
	DECLARE @SourceSchema			varchar(20)
	DECLARE @SourceTableName		varchar(50)
	DECLARE @DestLinkServer			varchar(50)
	DECLARE @DestDatabaseName		varchar(50)
	DECLARE @DestSchema				varchar(20)
	DECLARE @DestTableName			varchar(50)
	DECLARE @ColumnList				nvarchar(max)

	SELECT @NumberTable = COUNT(1) FROM #temp 

	WHILE (@Count <= @NumberTable)
	BEGIN
		SELECT 
			 @DataFlowID			= DataFlowID
			,@SourceLinkServer		= Source_LinkedServer
			,@SourceDatabaseName	= Source_DatabaseName
			,@SourceSchema			= Source_SchemaName
			,@SourceTableName		= Source_TableName
			,@ColumnList			= Source_ColumnList 
			,@DestLinkServer		= Dest_LinkedServer
			,@DestDatabaseName		= Dest_DatabaseName
			,@DestSchema			= Dest_SchemaName
			,@DestTableName			= Dest_TableName 
		FROM	
			#temp
		WHERE 
			PackageID = @PackageID
		AND
			RowNo = @Count

		--// Log data flow
		INSERT INTO [AG_METADATA].[dbo].[LogDataFlow] (DataFlowID, CreatedTime, Type, Message)
		VALUES (@DataFlowID, GETDATE(), 'INFO', 'Running')

		--// Check extract method to know the strategy to extract --> Alway extract all 
		BEGIN TRY
				
				SET @sqlStatement = 
					'
						DELETE FROM [{dest_linkedServer}].[{dest_DatabaseName}].[{dest_SchemaName}].[{dest_TableName}] WHERE [StoreID] = {storeID}
						
						INSERT INTO [{dest_linkedServer}].[{dest_DatabaseName}].[{dest_SchemaName}].[{dest_TableName}] ({columnList})
						
						SELECT {columnList}
						FROM [{source_DatabaseName}].[{source_SchemaName}].[{source_TableName}] WITH (NOLOCK)
					' 
					
				SET @sqlStatement = REPLACE(REPLACE(@sqlStatement, '{columnList}', @ColumnList), '{storeID}', @StoreID)
				SET @sqlStatement = REPLACE(REPLACE(REPLACE(@sqlStatement , '{source_databaseName}', @SourceDatabaseName), '{source_schemaName}', @SourceSchema), '{source_tableName}', @SourceTableName)
				SET @sqlStatement = REPLACE(REPLACE(REPLACE(REPLACE(@sqlStatement,  '{dest_linkedServer}', @DestLinkServer),'{dest_databaseName}', @DestDatabaseName), '{dest_schemaName}', @DestSchema), '{dest_tableName}', @DestTableName)
					

				EXECUTE (@sqlStatement)

				INSERT INTO [AG_METADATA].[dbo].[LogDataFlow] (DataFlowID, CreatedTime, Type, Message, RowCounts)
				VALUES (@DataFlowID, GETDATE(), 'INFO', 'Success', @@ROWCOUNT)
					
				SET @Count = @Count + 1
				
		END TRY
		BEGIN CATCH
				
			INSERT INTO [AG_METADATA].[dbo].[LogDataFlow] (DataFlowID, CreatedTime, Type, Message)
			VALUES (@DataFlowID, GETDATE(), 'ERROR', ERROR_MESSAGE() )

			INSERT INTO [AG_METADATA].[dbo].[LogPackage] 
			VALUES (@PackageID, GETDATE(), 'ERROR', ERROR_MESSAGE())

			RETURN
		END CATCH
	END

	--// IF NO ERROR, update package status & log 
	INSERT INTO [AG_METADATA].[dbo].[LogPackage] 
	VALUES (@PackageID, GETDATE(), 'INFO', 'Success')

	UPDATE
		[AG_METADATA].[dbo].[Packages]
	SET 
		[Status] = 1
		,LastSuccessRuntime = GETDATE()
	WHERE
		PackageID = @PackageID;

	--// Update Server status if all package of this store is run success
	declare @sql_stm nvarchar(4000)
	SELECT @DestLinkServer = Dest_LinkedServer
		FROM 
			#temp 
			
	IF EXISTS (SELECT 1 FROM [AG_METADATA].[dbo].[Packages] WITH (NOLOCK) WHERE StoreID = @StoreID AND [Status] = 0)
	BEGIN
		
		--Set the Server status to 0 (not ready for ETL from stage to NDS)
		SET @sql_stm = '
		UPDATE 
			[{linkedServer}].[NDS_METADATA].[dbo].[ServerStatus]
		SET 
			[Status] = 0
		WHERE
			StoreID = {StoreID}'
		
		SET  @sql_stm = REPLACE(REPLACE(@sql_stm, '{linkedServer}',@DestLinkServer), '{StoreID}', @StoreID)
		
		EXECUTE (@sql_stm)
	END
	ELSE
	BEGIN
	

		--// Update all metadata: LSEI, CEI, LChangeTrackingID
		UPDATE
			[AG_METADATA].[dbo].[DataFlow]
		SET
			 LSET = CET
			,LSEI = CEI
			,LChangeTrackingID = CChangeTrackingID
			,LTimestampVersion = CTimestampVersion
		FROM
			[AG_METADATA].[dbo].[DataFlow] AS D
		INNER JOIN
			[AG_METADATA].[dbo].[Packages] AS P ON P.PackageID = D.PackageID
		WHERE
			P.StoreID = @StoreID;
		
		
		SET @sql_stm = '
		UPDATE 
			[{linkedServer}].[NDS_METADATA].[dbo].[ServerStatus]
		SET 
			[Status] = 1
		WHERE
			StoreID = {StoreID}'
		
		SET  @sql_stm = REPLACE(REPLACE(@sql_stm, '{linkedServer}',@DestLinkServer), '{StoreID}', @StoreID)
		
		EXECUTE (@sql_stm)
		
		--reset all packages status to 0 to avoid missing etl of second source
		 SET @sql_stm = '
		 UPDATE 
		 	[AG_METADATA].[dbo].[Packages]
		 SET 
		 	[Status] = 0
		 WHERE
		 	StoreID = {StoreID}'
		
		 SET  @sql_stm = REPLACE(@sql_stm, '{StoreID}', @StoreID)
		
		 EXECUTE (@sql_stm)
		
	END
END

GO
