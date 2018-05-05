@ECHO OFF

SET SCRIPT_PATH=C:\AutumnGroup\exec\exec_script.sql
SET SQLCMD_PATH="C:\Program Files (x86)\Microsoft SQL Server\Client SDK\ODBC\130\Tools\Binn"

%SQLCMD_PATH%\SQLCMD -E -S STAGING01-PC\AG_PK_BOX -i %SCRIPT_PATH%


PAUSE
