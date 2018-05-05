USE [master]
GO

/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [dw_box]    Script Date: 12/11/2017 2:36:16 PM ******/
CREATE LOGIN [dw_box] WITH PASSWORD=N'AutumnGroup', DEFAULT_DATABASE=[AG_METADATA], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO

ALTER LOGIN [dw_box] DISABLE
GO

ALTER SERVER ROLE [sysadmin] ADD MEMBER [dw_box]
GO

/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [dw_user]    Script Date: 12/11/2017 2:36:19 PM ******/
CREATE LOGIN [dw_user] WITH PASSWORD=N'AutumnGroup', DEFAULT_DATABASE=[AG_METADATA], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO

ALTER LOGIN [dw_user] DISABLE
GO


