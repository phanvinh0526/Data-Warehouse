USE [AG_METADATA]
GO
/****** Object:  StoredProcedure [dbo].[p_ExtractData_Source_Box]    Script Date: 08/10/2017 11:21:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[p_ExtractData_Source_Box]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[p_ExtractData_Source_Box] AS' 
END
GO

ALTER PROCEDURE [dbo].[p_ExtractData_Source_Box]
	@PackageID		int,
	@StoreID		int
AS
BEGIN
	DECLARE @sqlStatement			nvarchar(4000)
	DECLARE @linkedServer			varchar(50)
	DECLARE @isWaitingForNDS		int = 0
	
	SET @linkedServer = 'LS_STAGE'
	
	--// Update package run status
	UPDATE
		[AG_METADATA].[dbo].[Packages]
	SET 
		[Status] = 0
	WHERE
		PackageID = @PackageID
	
	--// Check server status, if it equals to 1 -> do not run package
	SET @sqlStatement = 'SELECT @isWaitingForNDS = 1 FROM [{linkedServer}].[NDS_METADATA].[dbo].[ServerStatus] WITH (NOLOCK) WHERE StoreID = {StoreID} AND [Status] = 1'
	SET @sqlStatement = REPLACE(REPLACE(@sqlStatement, '{linkedServer}',@linkedServer), '{StoreID}', @StoreID)
	
	exec sp_executesql @sqlStatement, 
                    N'@isWaitingForNDS int output', @isWaitingForNDS output;
	
	IF (@isWaitingForNDS = 1)
	BEGIN
		INSERT INTO [AG_METADATA].[dbo].[LogPackage] 
		VALUES (@PackageID, GETDATE(), 'ERROR', 'Fail. Wait to push data on Staging to NDS.')
		RETURN;
	END
		

	--// Update package status & Log package
	DECLARE @TimeRun	datetime = GETDATE();

	INSERT INTO [AG_METADATA].[dbo].[LogPackage] 
	VALUES (@PackageID, @TimeRun, 'INFO', 'Running')

	--// Get DatabaseID to Extract & Load data 
	DECLARE @SourceDatabaseID	int
	DECLARE @DestDatabaseID		int

	SELECT 
		 @SourceDatabaseID = SourceDatabaseID
		,@DestDatabaseID = DestDatabaseID 
	FROM 
		[AG_METADATA].[dbo].[Packages] WITH (NOLOCK) 
	WHERE 
		PackageID = @PackageID;

	--// Freeze data to extract on source database
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
	DECLARE @DataFlowID				int
	DECLARE @SourceLinkServer		varchar(50)
	DECLARE @SourceDatabaseName		varchar(50)
	DECLARE @SourceSchema			varchar(20)
	DECLARE @SourceTableName		varchar(50)
	DECLARE @DestLinkServer			varchar(50)
	DECLARE @DestDatabaseName		varchar(50)
	DECLARE @DestSchema				varchar(20)
	DECLARE @DestTableName			varchar(50)
	DECLARE @ExtractMethod			int
	DECLARE @ColumnEffect			varchar(50)
	DECLARE @ColumnList				varchar(4000)
	DECLARE @LSET					datetime
	DECLARE @CET					datetime
	DECLARE @LSEI					bigint
	DECLARE @CEI					bigint
	DECLARE @LastCTID				bigint
	DECLARE @CurrentCTID			bigint
	DECLARE @LTVersion		varbinary(50)
	DECLARE @CTVersion		varbinary(50)

	SELECT @NumberTable = COUNT(1) FROM #temp 

	--// TimeStamp
	UPDATE
		[AG_METADATA].[dbo].[DataFlow]
	SET 
		CET = @TimeRun
	WHERE
		PackageID = @PackageID;

	WHILE (@Count <= @NumberTable)
	BEGIN
		SELECT 
			 @DataFlowID = DataFlowID
			,@SourceLinkServer = Source_LinkedServer
			,@SourceDatabaseName = Source_DatabaseName
			,@SourceSchema = Source_SchemaName
			,@SourceTableName = Source_TableName 
			,@ExtractMethod = ExtractMethod
			,@ColumnEffect = ColumnName
		FROM	
			#temp
		WHERE 
			PackageID = @PackageID
		AND
			RowNo = @Count

		--// If extract method is Identity (2), then update CEI = max ID from source table
		IF @ExtractMethod = 2
		BEGIN
			--// Get MAX ID from source table and Update value into CEI
			SET @sqlStatement = '
			UPDATE
				[AG_METADATA].[dbo].[DataFlow]
			SET CEI = 
			( SELECT MAX([{columnEffect}]) 
			  FROM [{linkedServer}].[{databaseName}].[{schemaName}].[{tableName}])
		    WHERE 
				DataFlowID = {dataFlowID}'

			SET @sqlStatement = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(@sqlStatement, '{columnEffect}', @ColumnEffect), '{linkedServer}', @SourceLinkServer), '{databaseName}', @SourceDatabaseName), '{schemaName}', @SourceSchema), '{tableName}', @SourceTableName), '{dataFlowID}', @DataFlowID)

			EXECUTE (@sqlStatement)

		END
		--// Else use trantracking on table
		ELSE IF @ExtractMethod = 3
		BEGIN
			--// Get CurrentID Change Tracking and Update to CurrentID Change Tracking
			--// Get MAX ID from source table and Update value into CEI
			SET @sqlStatement = '
			UPDATE
				[AG_METADATA].[dbo].[DataFlow]
			SET CChangeTrackingID = 
			( SELECT MAX(SYS_CHANGE_VERSION) FROM OPENQUERY ( [{linkedServer}], ''SELECT SYS_CHANGE_VERSION FROM CHANGETABLE(CHANGES [{databaseName}].[{schemaName}].[{tableName}], 0) AS ct'') AS temp)
		    WHERE 
				DataFlowID = {dataFlowID}'

			SET @sqlStatement = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(@sqlStatement, '{linkedServer}', @SourceLinkServer), '{databaseName}', @SourceDatabaseName), '{schemaName}', @SourceSchema), '{tableName}', @SourceTableName), '{dataFlowID}', @DataFlowID)
			
			EXECUTE (@sqlStatement)

		END
		--// If extract method is TimestampVersion(4), then update CTimestampVersion = Current version of database
		ELSE IF @ExtractMethod = 4
		BEGIN
			--// Get current version from database and Update value into CTimestampVersion
			  --@CTVersion

		-- 	DECLARE @sSQL nvarchar(500)
		-- 	DECLARE @ParmDefinition nvarchar(500)
		-- 	SELECT @sSQL = N'SELECT @retvalOUT = MIN_ACTIVE_ROWVERSION()'
			
		-- 	SET @ParmDefinition = N'@retvalOUT varbinary(50) OUTPUT'
		-- 	EXEC [LS_STORE].[Storeops].[dbo].sp_executesql @sSQL, @ParmDefinition, @retvalOUT=@CTVersion OUTPUT;
			
			SET @sqlStatement = '
			UPDATE
				[AG_METADATA].[dbo].[DataFlow]
			SET CTimestampVersion = (SELECT ISNULL(MAX([{columnEffect}]),cast(0 as varbinary(50))) FROM  [{linkedServer}].[{databaseName}].[{schemaName}].[{tableName}])
		    WHERE 
				DataFlowID = {dataFlowID}'
			
			SET @sqlStatement = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(@sqlStatement, '{columnEffect}', @ColumnEffect), '{linkedServer}', @SourceLinkServer), '{databaseName}', @SourceDatabaseName), '{schemaName}', @SourceSchema), '{tableName}', @SourceTableName), '{dataFlowID}', @DataFlowID)
			
			EXECUTE (@sqlStatement)

		END
		
		SET @Count = @Count + 1
	END

	--// Extract data for each table based on the CET, CEI
	SET @Count = 1

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
			,@ExtractMethod			= ExtractMethod
			,@ColumnEffect			= ColumnName
		FROM	
			#temp
		WHERE 
			PackageID = @PackageID
		AND
			RowNo = @Count

		--// Log data flow
		INSERT INTO [AG_METADATA].[dbo].[LogDataFlow] (DataFlowID, CreatedTime, Type, Message)
		VALUES (@DataFlowID, GETDATE(), 'INFO', 'Running')

		--// Check extract method to know the strategy to extract
		--// 0 - Extract all
		IF (@ExtractMethod = 0)
		BEGIN
			BEGIN TRY
				BEGIN TRANSACTION
					SET @sqlStatement = 
						'
						 IF OBJECT_ID(''[{dest_databaseName}].[{dest_schemaName}].[{dest_tableName}]'', ''U'') IS NOT NULL 
							DROP TABLE [{dest_databaseName}].[{dest_schemaName}].[{dest_tableName}]

						 SELECT 
							{columnList}, {storeID} AS [StoreID]
						 INTO 
							[{dest_databaseName}].[{dest_schemaName}].[{dest_tableName}]
						 FROM 
							[{source_linkedServer}].[{source_databaseName}].[{source_schemaName}].[{source_tableName}] WITH (NOLOCK)
						' 
					
					SET @sqlStatement = REPLACE(REPLACE(@sqlStatement, '{columnList}', @ColumnList), '{storeID}', @StoreID)
					SET @sqlStatement = REPLACE(REPLACE(REPLACE(REPLACE(@sqlStatement, '{source_linkedServer}', @SourceLinkServer), '{source_databaseName}', @SourceDatabaseName), '{source_schemaName}', @SourceSchema), '{source_tableName}', @SourceTableName)
					SET @sqlStatement = REPLACE(REPLACE(REPLACE(@sqlStatement, '{dest_databaseName}', @DestDatabaseName), '{dest_schemaName}', @DestSchema), '{dest_tableName}', @DestTableName)
					
					EXECUTE (@sqlStatement)

					INSERT INTO [AG_METADATA].[dbo].[LogDataFlow] (DataFlowID, CreatedTime, Type, Message, RowCounts)
					VALUES (@DataFlowID, GETDATE(), 'INFO', 'Success', @@ROWCOUNT)
					
					SET @Count = @Count + 1
				COMMIT
			END TRY
			BEGIN CATCH
				ROLLBACK
				
				INSERT INTO [AG_METADATA].[dbo].[LogDataFlow] (DataFlowID, CreatedTime, Type, Message)
				VALUES (@DataFlowID, GETDATE(), 'ERROR', ERROR_MESSAGE())

				INSERT INTO [AG_METADATA].[dbo].[LogPackage] 
				VALUES (@PackageID, GETDATE(), 'ERROR', ERROR_MESSAGE())

				RETURN
			END CATCH
		END
		--// 1: Extract by Timestamp
		ELSE IF @ExtractMethod = 1
		BEGIN
			BEGIN TRY
				BEGIN TRANSACTION
					SELECT 
						 @CET = CET
						,@LSET = LSET
					FROM 
						[AG_METADATA].[dbo].[DataFlow] WITH (NOLOCK)
					WHERE 
						DataFlowID = @DataFlowID;

					IF @SourceTableName = 'doItemBase'
					BEGIN
						SET @sqlStatement = 
							'
							 IF OBJECT_ID(''[{dest_databaseName}].[{dest_schemaName}].[{dest_tableName}]'', ''U'') IS NOT NULL 
								DROP TABLE [{dest_databaseName}].[{dest_schemaName}].[{dest_tableName}]

							 SELECT 
								a.*, {storeID}  AS [StoreID], b.AppCatHQID AS [ProductGlobalHQID]
							 INTO 
								[{dest_databaseName}].[{dest_schemaName}].[{dest_tableName}]
							 FROM 
								[{source_linkedServer}].[{source_databaseName}].[{source_schemaName}].[{source_tableName}] AS a WITH (NOLOCK)
							 LEFT OUTER JOIN
								[{source_linkedServer}].[{source_databaseName}].[{source_schemaName}].[doItem] AS b WITH (NOLOCK) ON a.ID = b.ID
							 WHERE 
								a.[{EffectColumn}] > ''{LSET}'' AND a.[{EffectColumn}] <= ''{CET}''
							 '
					
						SET @sqlStatement = REPLACE(REPLACE(@sqlStatement, '{columnList}', @ColumnList), '{storeID}', @StoreID)
						SET @sqlStatement = REPLACE(REPLACE(REPLACE(REPLACE(@sqlStatement, '{source_linkedServer}', @SourceLinkServer), '{source_databaseName}', @SourceDatabaseName), '{source_schemaName}', @SourceSchema), '{source_tableName}', @SourceTableName)
						SET @sqlStatement = REPLACE(REPLACE(REPLACE(@sqlStatement, '{dest_databaseName}', @DestDatabaseName), '{dest_schemaName}', @DestSchema), '{dest_tableName}', @DestTableName)
						SET @sqlStatement = REPLACE(REPLACE(REPLACE(@sqlStatement, '{LSET}', @LSET), '{CET}', @CET), '{EffectColumn}', @ColumnEffect)

						EXECUTE (@sqlStatement)
					END
					ELSE
					BEGIN
						SET @sqlStatement = 
							'
							 IF OBJECT_ID(''[{dest_databaseName}].[{dest_schemaName}].[{dest_tableName}]'', ''U'') IS NOT NULL 
								DROP TABLE [{dest_databaseName}].[{dest_schemaName}].[{dest_tableName}]

							 SELECT 
								{columnList}, {storeID}  AS [StoreID]
							 INTO 
								[{dest_databaseName}].[{dest_schemaName}].[{dest_tableName}]
							 FROM 
								[{source_linkedServer}].[{source_databaseName}].[{source_schemaName}].[{source_tableName}] WITH (NOLOCK)
							 WHERE 
								[{EffectColumn}] > ''{LSET}'' AND [{EffectColumn}] <= ''{CET}''
							 '
					
						SET @sqlStatement = REPLACE(REPLACE(@sqlStatement, '{columnList}', @ColumnList), '{storeID}', @StoreID)
						SET @sqlStatement = REPLACE(REPLACE(REPLACE(REPLACE(@sqlStatement, '{source_linkedServer}', @SourceLinkServer), '{source_databaseName}', @SourceDatabaseName), '{source_schemaName}', @SourceSchema), '{source_tableName}', @SourceTableName)
						SET @sqlStatement = REPLACE(REPLACE(REPLACE(@sqlStatement, '{dest_databaseName}', @DestDatabaseName), '{dest_schemaName}', @DestSchema), '{dest_tableName}', @DestTableName)
						SET @sqlStatement = REPLACE(REPLACE(REPLACE(@sqlStatement, '{LSET}', @LSET), '{CET}', @CET), '{EffectColumn}', @ColumnEffect)

						EXECUTE (@sqlStatement)
					END
					INSERT INTO [AG_METADATA].[dbo].[LogDataFlow] (DataFlowID, CreatedTime, Type, Message, RowCounts)
					VALUES (@DataFlowID, GETDATE(), 'INFO', 'Success', @@ROWCOUNT)
					
					SET @Count = @Count + 1
				COMMIT
			END TRY
			BEGIN CATCH
				ROLLBACK
				
				INSERT INTO [AG_METADATA].[dbo].[LogDataFlow] (DataFlowID, CreatedTime, Type, Message)
				VALUES (@DataFlowID, GETDATE(), 'ERROR', ERROR_MESSAGE())

				INSERT INTO [AG_METADATA].[dbo].[LogPackage] 
				VALUES (@PackageID, GETDATE(), 'ERROR', ERROR_MESSAGE())

				RETURN
			END CATCH
		END
		--// Extract by ID
		ELSE IF @ExtractMethod = 2
		BEGIN
			BEGIN TRY
				BEGIN TRANSACTION
					SELECT 
						 @CEI = CEI
						,@LSEI = LSEI
					FROM 
						[AG_METADATA].[dbo].[DataFlow] WITH (NOLOCK)
					WHERE 
						DataFlowID = @DataFlowID;	

					SET @sqlStatement = 
						'
						 IF OBJECT_ID(''[{dest_databaseName}].[{dest_schemaName}].[{dest_tableName}]'', ''U'') IS NOT NULL 
							DROP TABLE [{dest_databaseName}].[{dest_schemaName}].[{dest_tableName}]

						 SELECT 
							{columnList}, {storeID}  AS [StoreID]
						 INTO 
							[{dest_databaseName}].[{dest_schemaName}].[{dest_tableName}]
						 FROM 
							[{source_linkedServer}].[{source_databaseName}].[{source_schemaName}].[{source_tableName}] WITH (NOLOCK)
						 WHERE 
							[{EffectColumn}] > {LSEI} AND [{EffectColumn}] <= {CEI}
						 '

					SET @sqlStatement = REPLACE(REPLACE(@sqlStatement, '{columnList}', @ColumnList), '{storeID}', @StoreID)
					SET @sqlStatement = REPLACE(REPLACE(REPLACE(REPLACE(@sqlStatement, '{source_linkedServer}', @SourceLinkServer), '{source_databaseName}', @SourceDatabaseName), '{source_schemaName}', @SourceSchema), '{source_tableName}', @SourceTableName)
					SET @sqlStatement = REPLACE(REPLACE(REPLACE(@sqlStatement, '{dest_databaseName}', @DestDatabaseName), '{dest_schemaName}', @DestSchema), '{dest_tableName}', @DestTableName)
					SET @sqlStatement = REPLACE(REPLACE(REPLACE(@sqlStatement, '{LSEI}', @LSEI), '{CEI}', ISNULL(@CEI,0)), '{EffectColumn}', @ColumnEffect)

					--PRINT @sqlStatement

					EXECUTE (@sqlStatement)

					INSERT INTO [AG_METADATA].[dbo].[LogDataFlow] (DataFlowID, CreatedTime, Type, Message, RowCounts)
					VALUES (@DataFlowID, GETDATE(), 'INFO', 'Success', @@ROWCOUNT)
					
					SET @Count = @Count + 1
				COMMIT
			END TRY
			BEGIN CATCH
				ROLLBACK
				
				INSERT INTO [AG_METADATA].[dbo].[LogDataFlow] (DataFlowID, CreatedTime, Type, Message)
				VALUES (@DataFlowID, GETDATE(), 'ERROR', ERROR_MESSAGE())

				INSERT INTO [AG_METADATA].[dbo].[LogPackage] 
				VALUES (@PackageID, GETDATE(), 'ERROR', ERROR_MESSAGE())

				RETURN
			END CATCH
		END
		--// 3: Extract by Change Tracking
		ELSE IF @ExtractMethod = 3
		BEGIN
			BEGIN TRY
				BEGIN TRANSACTION
					SELECT 
						 @CurrentCTID   = CChangeTrackingID
						,@LastCTID		= LChangeTrackingID
					FROM 
						[AG_METADATA].[dbo].[DataFlow] WITH (NOLOCK)
					WHERE 
						DataFlowID = @DataFlowID;

					IF @LastCTID = -1
					BEGIN
						SET @sqlStatement = 
						'
						 IF OBJECT_ID(''[{dest_databaseName}].[{dest_schemaName}].[{dest_tableName}]'', ''U'') IS NOT NULL 
							DROP TABLE [{dest_databaseName}].[{dest_schemaName}].[{dest_tableName}]

						 SELECT 
							{columnList}, {storeID} AS [StoreID]
						 INTO 
							[{dest_databaseName}].[{dest_schemaName}].[{dest_tableName}]
						 FROM 
							[{source_linkedServer}].[{source_databaseName}].[{source_schemaName}].[{source_tableName}] WITH (NOLOCK)
						 '
					
						SET @sqlStatement = REPLACE(REPLACE(@sqlStatement, '{columnList}', @ColumnList), '{storeID}', @StoreID)
						SET @sqlStatement = REPLACE(REPLACE(REPLACE(REPLACE(@sqlStatement, '{source_linkedServer}', @SourceLinkServer), '{source_databaseName}', @SourceDatabaseName), '{source_schemaName}', @SourceSchema), '{source_tableName}', @SourceTableName)
						SET @sqlStatement = REPLACE(REPLACE(REPLACE(@sqlStatement, '{dest_databaseName}', @DestDatabaseName), '{dest_schemaName}', @DestSchema), '{dest_tableName}', @DestTableName)
						SET @sqlStatement = REPLACE(REPLACE(REPLACE(@sqlStatement, '{LastCTID}', @LastCTID), '{CurrentCTID}', ISNULL(@CurrentCTID,0)), '{EffectColumn}', @ColumnEffect)

						--PRINT @sqlStatement

						EXECUTE (@sqlStatement)
					END
					ELSE
					BEGIN
						SET @sqlStatement = 
						'
						 IF OBJECT_ID(''[{dest_databaseName}].[{dest_schemaName}].[{dest_tableName}]'', ''U'') IS NOT NULL 
							DROP TABLE [{dest_databaseName}].[{dest_schemaName}].[{dest_tableName}]

						 SELECT 
							Source_Data.{columnList}, {storeID} AS [StoreID]
						 INTO 
							[{dest_databaseName}].[{dest_schemaName}].[{dest_tableName}]
						 FROM 
							[{source_linkedServer}].[{source_databaseName}].[{source_schemaName}].[{source_tableName}] AS Source_Data WITH (NOLOCK)
						 INNER JOIN
							(SELECT [{EffectColumn}]
							 FROM OPENQUERY ( [{source_linkedServer}], ''SELECT * FROM CHANGETABLE(CHANGES [{source_databaseName}].[{source_schemaName}].[{source_tableName}], 0) AS ChTbl 
							 WHERE SYS_CHANGE_VERSION > {LastCTID} AND SYS_CHANGE_VERSION <= {CurrentCTID}'' )) AS CT_Data ON  Source_Data.[{EffectColumn}] = CT_Data.[{EffectColumn}]
						 '
					
						SET @sqlStatement = REPLACE(REPLACE(@sqlStatement, '{columnList}', @ColumnList), '{storeID}', @StoreID)
						SET @sqlStatement = REPLACE(REPLACE(REPLACE(REPLACE(@sqlStatement, '{source_linkedServer}', @SourceLinkServer), '{source_databaseName}', @SourceDatabaseName), '{source_schemaName}', @SourceSchema), '{source_tableName}', @SourceTableName)
						SET @sqlStatement = REPLACE(REPLACE(REPLACE(@sqlStatement, '{dest_databaseName}', @DestDatabaseName), '{dest_schemaName}', @DestSchema), '{dest_tableName}', @DestTableName)
						SET @sqlStatement = REPLACE(REPLACE(REPLACE(@sqlStatement, '{LastCTID}', @LastCTID), '{CurrentCTID}', ISNULL(@CurrentCTID,0)), '{EffectColumn}', @ColumnEffect)

						--PRINT @sqlStatement

						EXECUTE (@sqlStatement)
					END
					
					INSERT INTO [AG_METADATA].[dbo].[LogDataFlow] (DataFlowID, CreatedTime, Type, Message, RowCounts)
					VALUES (@DataFlowID, GETDATE(), 'INFO', 'Success', @@ROWCOUNT)
					
					SET @Count = @Count + 1
				COMMIT
			END TRY
			BEGIN CATCH
				ROLLBACK
				
				INSERT INTO [AG_METADATA].[dbo].[LogDataFlow] (DataFlowID, CreatedTime, Type, Message)
				VALUES (@DataFlowID, GETDATE(),'ERROR', ERROR_MESSAGE())

				INSERT INTO [AG_METADATA].[dbo].[LogPackage] 
				VALUES (@PackageID, GETDATE(), 'ERROR', ERROR_MESSAGE())

				RETURN
			END CATCH
		END
	--// 4: Extract by Timestamp version
		ELSE IF @ExtractMethod = 4
		BEGIN
			BEGIN TRY
				BEGIN TRANSACTION
					SELECT 
						 @CTVersion   = CTimestampVersion
						,@LTVersion		= LTimestampVersion
					FROM 
						[AG_METADATA].[dbo].[DataFlow] WITH (NOLOCK)
					WHERE 
						DataFlowID = @DataFlowID;

					SET @sqlStatement = 
						'
						 IF OBJECT_ID(''[{dest_databaseName}].[{dest_schemaName}].[{dest_tableName}]'', ''U'') IS NOT NULL 
							DROP TABLE [{dest_databaseName}].[{dest_schemaName}].[{dest_tableName}]

						 SELECT 
							{columnList}, {storeID}  AS [StoreID]
						 INTO 
							[{dest_databaseName}].[{dest_schemaName}].[{dest_tableName}]
						 FROM 
							[{source_linkedServer}].[{source_databaseName}].[{source_schemaName}].[{source_tableName}] WITH (NOLOCK)
						 WHERE 
							[{EffectColumn}] > {LTVersion} AND [{EffectColumn}] <= {CTVersion}
						 '
					
					SET @sqlStatement = REPLACE(REPLACE(@sqlStatement, '{columnList}', @ColumnList), '{storeID}', @StoreID)
					SET @sqlStatement = REPLACE(REPLACE(REPLACE(REPLACE(@sqlStatement, '{source_linkedServer}', @SourceLinkServer), '{source_databaseName}', @SourceDatabaseName), '{source_schemaName}', @SourceSchema), '{source_tableName}', @SourceTableName)
					SET @sqlStatement = REPLACE(REPLACE(REPLACE(@sqlStatement, '{dest_databaseName}', @DestDatabaseName), '{dest_schemaName}', @DestSchema), '{dest_tableName}', @DestTableName)
					SET @sqlStatement = REPLACE(REPLACE(REPLACE(@sqlStatement, '{LTVersion}', CONVERT(NVARCHAR(50), CONVERT(BINARY(8), @LTVersion), 1)), '{CTVersion}', CONVERT(NVARCHAR(50), CONVERT(BINARY(8), @CTVersion), 1)), '{EffectColumn}', @ColumnEffect)
					
					EXECUTE (@sqlStatement)
					
					INSERT INTO [AG_METADATA].[dbo].[LogDataFlow] (DataFlowID, CreatedTime, Type, Message, RowCounts)
					VALUES (@DataFlowID, GETDATE(), 'INFO', 'Success', @@ROWCOUNT)
					
					SET @Count = @Count + 1
				COMMIT
			END TRY
			BEGIN CATCH
				ROLLBACK
				
				INSERT INTO [AG_METADATA].[dbo].[LogDataFlow] (DataFlowID, CreatedTime, Type, Message)
				VALUES (@DataFlowID, GETDATE(),'ERROR', ERROR_MESSAGE())

				INSERT INTO [AG_METADATA].[dbo].[LogPackage] 
				VALUES (@PackageID, GETDATE(), 'ERROR', ERROR_MESSAGE())

				RETURN
			END CATCH
		END
	END
	

	--// IF NOT ERROR, update package status & log 
	INSERT INTO [AG_METADATA].[dbo].[LogPackage] 
	VALUES (@PackageID, GETDATE(), 'INFO', 'Success')

	UPDATE
		[AG_METADATA].[dbo].[Packages]
	SET 
		[Status] = 1
		,LastSuccessRuntime = GETDATE()
	WHERE
		PackageID = @PackageID;
END

