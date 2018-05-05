USE [master] 
GO 
EXEC sp_configure 'show advanced options', 1
RECONFIGURE
GO
EXEC sp_configure 'ad hoc distributed queries', 1
RECONFIGURE
GO


USE [master] 
GO 
EXEC master.dbo.sp_MSset_oledb_prop N'VFPOLEDB', N'AllowInProcess', 1 
GO

CMD

C:\Program Files (x86)\Common Files\System\Ole DB>regsvr32 vfpoledb.dll


SELECT * into script
FROM OPENROWSET('MSDASQL', 'Driver=Microsoft Visual FoxPro Driver;
SourceDB=E:\script.dbf;
SourceType=DBF',
'SELECT * FROM script'