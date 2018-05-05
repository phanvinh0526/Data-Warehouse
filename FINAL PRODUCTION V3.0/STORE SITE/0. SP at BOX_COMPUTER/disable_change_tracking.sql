USE [LOTS]
GO
IF EXISTS (SELECT 1 FROM sys.change_tracking_tables 
               WHERE object_id = OBJECT_ID('dbo.ScriptLink'))
BEGIN
	alter table [dbo].[ScriptLink]
	disable change_tracking;
END
GO
