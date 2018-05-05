/*
	COMPANY:		AutumnGroup
	VERSION:		2.0
	LAST_UPDATE:	Sep 21, 2017
	DESCRIPTION: 	This script is used to create a user and grant read permission on specific database
*/

USE [master]
GO

DECLARE @UserName				varchar(50)
DECLARE @Password				varchar(50)
DECLARE @DefaultDataBaseName	varchar(50)
DECLARE @FirstDataBaseName		varchar(50)
DECLARE @SecondDataBaseName		varchar(50)
DECLARE @ThirdDataBaseName		varchar(50)
DECLARE @FourthDataBaseName		varchar(50)
DECLARE @LoginCreationScript	varchar(MAX)
DECLARE @UserCreationScript		varchar(MAX)
DECLARE @UserMappingScript		varchar(MAX)
DECLARE @TempUserCreationScript	varchar(MAX)
DECLARE @TempUserMappingScript	varchar(MAX)

/*	Please configure these variables */
SET @DefaultDataBaseName = 'P@K_FredDispense';
SET @UserName = 'dw_user_7';
SET @Password = 'AutumnGroup';
SET @FirstDataBaseName = 'SAMPLE_FRED_DISPENSE';
SET @SecondDataBaseName = 'SAMPLE_FRED_POS';
SET @ThirdDataBaseName  = 'NULL';
SET @FourthDataBaseName = 'NULL';

/* ******************************************* */
/*Login creation*/
IF NOT EXISTS (SELECT * FROM [dbo].[syslogins] WHERE name = @UserName)
BEGIN
	SET @LoginCreationScript = 
	'CREATE LOGIN [{userName}]
	 WITH PASSWORD = ''{enterStrongPasswordHere}'',
	 DEFAULT_DATABASE = [{dataBaseName}]'

	SET @LoginCreationScript = REPLACE(REPLACE(REPLACE(@LoginCreationScript, '{enterStrongPasswordHere}', @Password), '{userName}', @userName), '{dataBaseName}', @defaultDataBaseName)

	EXECUTE (@LoginCreationScript)
END

/*	User creation and role assignment --//  EXEC sp_addrolemember ''db_datawriter'', ''{userName}''; : use it if you want to grant write permission to user */
SET @UserCreationScript = 
	'IF NOT EXISTS (SELECT 1 FROM [{dataBaseName}].[sys].[database_principals] WHERE name = ''{userName}'')
	BEGIN
		USE {dataBaseName};
		CREATE USER [{userName}] FOR LOGIN [{userName}];
		EXEC sp_addrolemember ''db_datareader'', ''{userName}'';
		GRANT EXECUTE ON SCHEMA :: dbo TO [{userName}];
	END'

/*	Mapping Schemas for the User	*/
SET @UserMappingScript = 
	'BEGIN
		USE {exDataBaseName};
		CREATE USER [{userName}] FOR LOGIN [{userName}];
		EXEC sp_addrolemember ''db_datareader'', ''{userName}'';
		GRANT EXECUTE ON SCHEMA :: dbo TO [{userName}];
	END'
	
	
SET @TempUserCreationScript = REPLACE(REPLACE(@UserCreationScript, '{userName}', @userName), '{dataBaseName}', @defaultDataBaseName)

EXECUTE (@TempUserCreationScript)

IF @FirstDataBaseName != (SELECT 'NULL')
BEGIN
	SET @TempUserMappingScript = REPLACE(REPLACE(@UserMappingScript, '{userName}', @userName), '{exDataBaseName}', @FirstDataBaseName)
	EXECUTE (@TempUserMappingScript)
END

IF @SecondDataBaseName != (SELECT 'NULL')
BEGIN
	SET @TempUserMappingScript = REPLACE(REPLACE(@UserMappingScript, '{userName}', @userName), '{exDataBaseName}', @SecondDataBaseName)
	EXECUTE (@TempUserMappingScript)
END

IF @ThirdDataBaseName != (SELECT 'NULL')
BEGIN
	SET @TempUserMappingScript = REPLACE(REPLACE(@UserMappingScript, '{userName}', @userName), '{exDataBaseName}', @ThirdDataBaseName)
	EXECUTE (@TempUserMappingScript)
END

IF @FourthDataBaseName != (SELECT 'NULL')
BEGIN
	SET @TempUserMappingScript = REPLACE(REPLACE(@UserMappingScript, '{userName}', @userName), '{exDataBaseName}', @FourthDataBaseName)
	EXECUTE (@TempUserMappingScript)
END