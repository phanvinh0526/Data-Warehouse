/* *****************************
	CREATE BOX_COMPUTER
***************************** */
use [master]
go
IF NOT EXISTS (SELECT name 
	FROM master.dbo.sysdatabases WHERE name = N'BOX_COMPUTER')
	CREATE DATABASE [BOX_COMPUTER]
GO
USE [BOX_COMPUTER]