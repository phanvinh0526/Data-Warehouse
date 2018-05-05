USE [master]
GO

/****** Object:  LinkedServer [LS_STORE]    Script Date: 12/11/2017 2:53:31 PM ******/
EXEC master.dbo.sp_addlinkedserver @server = N'LS_STORE', @srvproduct=N'SQL Server'
 /* For security reasons the linked server remote logins password is changed with ######## */
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'LS_STORE',@useself=N'False',@locallogin=NULL,@rmtuser=N'dw_user',@rmtpassword='AutumnGroup'
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'LS_STORE',@useself=N'False',@locallogin=N'dw_box',@rmtuser=N'dw_user',@rmtpassword='AutumnGroup'

GO

EXEC master.dbo.sp_serveroption @server=N'LS_STORE', @optname=N'collation compatible', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'LS_STORE', @optname=N'data access', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'LS_STORE', @optname=N'dist', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'LS_STORE', @optname=N'pub', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'LS_STORE', @optname=N'rpc', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'LS_STORE', @optname=N'rpc out', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'LS_STORE', @optname=N'sub', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'LS_STORE', @optname=N'connect timeout', @optvalue=N'0'
GO

EXEC master.dbo.sp_serveroption @server=N'LS_STORE', @optname=N'collation name', @optvalue=null
GO

EXEC master.dbo.sp_serveroption @server=N'LS_STORE', @optname=N'lazy schema validation', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'LS_STORE', @optname=N'query timeout', @optvalue=N'0'
GO

EXEC master.dbo.sp_serveroption @server=N'LS_STORE', @optname=N'use remote collation', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'LS_STORE', @optname=N'remote proc transaction promotion', @optvalue=N'true'
GO


