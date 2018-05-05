--Before running the test, we should update the server status of NDS_Metadata on Stage

--// TRUNCATE LOG TABLE
TRUNCATE TABLE [AG_Metadata].[dbo].[LogPackage]
TRUNCATE TABLE [AG_Metadata].[dbo].[LogDataFlow]

--// Update Metadata
UPDATE [AG_Metadata].[dbo].[DataFlow]
SET
	 LSEI = -1 
	,LSET = '1970-01-01'
	,LChangeTrackingID = -1
	,LTimestampVersion = cast(0 as varbinary(50))
	

--// Update Server status
UPDATE [AG_Metadata].[dbo].[Packages]
SET [Status] = 0 
WHERE StoreID in (2)

/******************************  Linden  **********************************/

/********************  LOTS  **********************************/
----ETL data from FRED CONNECT source to BOX_COMPUTER (store 2)
GO
EXEC [dbo].[p_ExtractData_Source_Box] 7, 2

----ETL data from BOX_COMPUTER to Stage server(store 2)
GO 
EXEC [dbo].[p_ExtractData_Box_Staging] 8, 2
