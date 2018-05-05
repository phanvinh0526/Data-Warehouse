--// TRUNCATE LOG TABLE
USE [AG_METADATA]
GO
TRUNCATE TABLE [AG_METADATA].[dbo].[LogPackage]
TRUNCATE TABLE [AG_METADATA].[dbo].[LogDataFlow]

--// Update Metadata
UPDATE [AG_METADATA].[dbo].[DataFlow]
SET
	 LSEI = -1 
	,LSET = '1970-01-01'
	,LChangeTrackingID = -1

--// Update Server status
UPDATE [AG_METADATA].[dbo].[ServerStatus]
SET [Status] = 0 
WHERE StoreID = 6


-- first parameter: package 
-- seconds parameter: storeID
GO
EXEC [dbo].[p_ExtractData_Source_Box] 100, 6

-- first parameter: package 
-- seconds parameter: storeID
GO 
EXEC [dbo].[p_ExtractData_Box_Staging] 101,6

--------------------------------------------------------------



select count(*) from [BOX_COMPUTER].dbo.OFFICE_doScript
go
select count(*) from [DW-SERVER\AUTUMNGROUP, 5434].STAGING_DW.dbo.OFFICE_doScript
go
select count(*) from [DW-SERVER\AUTUMNGROUP, 5434].SAMPLE_FRED_OFFICE.dbo.doScript



--	Truncate all tables in a schema

use AG_METADATA
go
Exec Sp_msforeachtable @command1='Truncate Table ?',@whereand='and Schema_Id=Schema_id(''dbo'')'


-- leave it to me
-- please fix
-- please show me, where the LS_BOX comes from?
-- it is not used i this case
--leave it to me
select * from LogDataFlow
;

ERROR: Could not find server 'LS_BOX' in sys.servers. Verify that the correct server name was specified. If necessary, execute the stored procedure sp_addlinkedserver to add the server to sys.servers.
;

ERROR: Could not find server 'LS_BOX' in sys.servers. Verify that the correct server name was specified. If necessary, execute the stored procedure sp_addlinkedserver to add the server to sys.servers.

select * from [databases];
select * from [tables];
select * from dataflow;
select * from 
;

DELETE FROM [LS_BOX].[BOX_COMPUTER].[dbo].[OFFICE_doScript]
						
						INSERT INTO [LS_BOX].[BOX_COMPUTER].[dbo].[OFFICE_doScript]
						SELECT [ID], [Created], [Modified], [DispenseDate], [DispenseNumber], [Doctor], [Drug], [DrugCode], [GenericCode], [ManufacturerCode], [Patient], [PatientNumber], [PatientPrice], [Pharmacist], [PharmacistsInitials], [Quantity], [RepeatFastCode], [RepeatScriptNumber], [SafetyNetAmount], [SaleCost], [ScriptClassification], [ScriptNumber], [ScriptProcessLogic], [ScriptStatus], [ScriptType], [WADDVerified], [Ward], [WardNumber], [WholesaleCost]
						FROM [SAMPLE_FRED_OFFICE].[dbo].[doScript] WITH (NOLOCK)
						;
--we got a real problem, wait me for some minutes