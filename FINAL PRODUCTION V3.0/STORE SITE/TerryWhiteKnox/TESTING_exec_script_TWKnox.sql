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
WHERE StoreID in (7)



/******************************  TWKnox  **********************************/

/********************  FRED OFFICE  **********************************/
----ETL data from FRED OFFICE source to BOX_COMPUTER (store 7)
GO
EXEC [dbo].[p_ExtractData_Source_Box] 25, 7

----ETL data from BOX_COMPUTER to Stage server(store 7)
GO 
EXEC [dbo].[p_ExtractData_Box_Staging] 26, 7

/********************  POS  **********************************/
----ETL data from POS source to BOX_COMPUTER (store 7)
GO
EXEC [dbo].[p_ExtractData_Source_Box] 27, 7

----ETL data from BOX_COMPUTER to Stage server(store 7)
GO 
EXEC [dbo].[p_ExtractData_Box_Staging] 28, 7



/********************  FRED CONNECT  **********************************/
----ETL data from FRED CONNECT source to BOX_COMPUTER (store 7)
GO
EXEC [dbo].[p_ExtractData_Source_Box] 29, 7

----ETL data from BOX_COMPUTER to Stage server(store 7)
GO 
EXEC [dbo].[p_ExtractData_Box_Staging] 30, 7

