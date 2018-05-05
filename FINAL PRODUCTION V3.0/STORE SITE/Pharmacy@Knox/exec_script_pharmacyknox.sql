--Before running the test, we should update the server status of NDS_Metadata on Stage
USE [AG_METADATA]

--select * from logpackage where type <> 'INFO'

--select * from logdataflow where type <> 'INFO'

/********************  Pharmacy Knox  **********************************/
----ETL data from LOTS source to BOX_COMPUTER (store 9)
GO
EXEC [dbo].[p_ExtractData_Source_Box] 23, 6

----ETL data from BOX_COMPUTER to Stage server(store 9)
GO 
EXEC [dbo].[p_ExtractData_Box_Staging] 24,6
