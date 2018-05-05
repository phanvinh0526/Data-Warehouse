@ECHO OFF

SET SCRIPT_PATH=C:\AutumnGroup\exec\exec_script_autumnplace.sql
SET SQLCMD_PATH="C:\Program Files\Microsoft SQL Server\Client SDK\ODBC\110\Tools\Binn"

%SQLCMD_PATH%\SQLCMD -S DW_ADMIN\AUTUMNGROUP,5434 -U dw_box -P AutumnGroup -i %SCRIPT_PATH%


