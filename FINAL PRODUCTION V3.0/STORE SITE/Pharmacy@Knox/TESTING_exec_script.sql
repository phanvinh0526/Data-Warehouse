--Before running the test, we should update the server status of NDS_Metadata on Stage
USE [AG_METADATA]
--// TRUNCATE LOG TABLE
TRUNCATE TABLE [AG_METADATA].[dbo].[LogPackage]
TRUNCATE TABLE [AG_METADATA].[dbo].[LogDataFlow]

--// Update Metadata
UPDATE [AG_METADATA].[dbo].[DataFlow]
SET
	 LSEI = -1 
	,LSET = '1970-01-01'
	,LChangeTrackingID = -1
	,LTimestampVersion = cast(0 as varbinary(50))
	

--// Update Server status
UPDATE [AG_METADATA].[dbo].[Packages]
SET [Status] = 0 
WHERE StoreID in (6)

--select * from logpackage where type <> 'INFO'

--select * from logdataflow where type <> 'INFO'

/********************  Pharmacy Knox  **********************************/
----ETL data from LOTS source to BOX_COMPUTER (store 9)
GO
EXEC [dbo].[p_ExtractData_Source_Box] 23, 6

----ETL data from BOX_COMPUTER to Stage server(store 9)
GO 
EXEC [dbo].[p_ExtractData_Box_Staging] 24,6
