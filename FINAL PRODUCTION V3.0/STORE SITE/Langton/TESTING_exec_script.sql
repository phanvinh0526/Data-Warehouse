--Before running the test, we should update the server status of NDS_Metadata on Stage
use AG_METADATA

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
WHERE StoreID in (1)


/******************************  Autumn Place  **********************************/

/********************  FRED OFFICE  **********************************/
----ETL data from FRED OFFICE source to BOX_COMPUTER (store 1)
GO
EXEC [dbo].[p_ExtractData_Source_Box] 1, 1 -- finished

----ETL data from BOX_COMPUTER to Stage server(store 1)
GO 
EXEC [dbo].[p_ExtractData_Box_Staging] 2, 1 -- finished

/********************  POS  **********************************/
----ETL data from POS source to BOX_COMPUTER (store 1)
GO
EXEC [dbo].[p_ExtractData_Source_Box] 3, 1 -- finished

----ETL data from BOX_COMPUTER to Stage server(store 1)
GO 
EXEC [dbo].[p_ExtractData_Box_Staging] 4, 1 -- finished



/********************  FRED CONNECT  **********************************/
----ETL data from FRED CONNECT source to BOX_COMPUTER (store 1)
GO
EXEC [dbo].[p_ExtractData_Source_Box] 5, 1 -- finished

----ETL data from BOX_COMPUTER to Stage server(store 1)
GO 
EXEC [dbo].[p_ExtractData_Box_Staging] 6, 1 -- finished


