--Before running the test, we should update the server status of NDS_Metadata on Stage
use AG_METADATA
go
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
WHERE StoreID in (9)


--select * from logpackage where type <> 'INFO'

--select * from logdataflow where type <> 'INFO'

/******************************  BrimBank  **********************************/

/********************  FRED OFFICE  **********************************/
----ETL data from FRED OFFICE source to BOX_COMPUTER (store 9)
GO
EXEC [dbo].[p_ExtractData_Source_Box] 37, 9 -- finished

----ETL data from BOX_COMPUTER to Stage server(store 9)
GO 
EXEC [dbo].[p_ExtractData_Box_Staging] 38,9 -- finished

/********************  POS  **********************************/
----ETL data from POS source to BOX_COMPUTER (store 9)
GO
EXEC [dbo].[p_ExtractData_Source_Box] 39, 9 -- finished

----ETL data from BOX_COMPUTER to Stage server(store 9)
GO 
EXEC [dbo].[p_ExtractData_Box_Staging] 40,9 -- finished



/********************  FRED CONNECT  **********************************/
----ETL data from FRED CONNECT source to BOX_COMPUTER (store 9)
GO
EXEC [dbo].[p_ExtractData_Source_Box] 41, 9 -- finished

----ETL data from BOX_COMPUTER to Stage server(store 9)
GO 
EXEC [dbo].[p_ExtractData_Box_Staging] 42,9 -- finished
