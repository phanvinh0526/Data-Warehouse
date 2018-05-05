
/*
	Enable Change Tracking for LOTS Database


*/

USE [LOTS]
GO

IF ((SELECT count(*)
FROM sys.change_tracking_databases 
WHERE database_id=DB_ID('LOTS'))  =0)
BEGIN 
	alter database [LOTS] set change_tracking = on (change_retention = 7 days, auto_cleanup = on);
END
GO

IF NOT EXISTS (SELECT 1 FROM sys.change_tracking_tables 
               WHERE object_id = OBJECT_ID('dbo.ScriptLink'))
BEGIN
	alter table [dbo].[ScriptLink]
	enable change_tracking
	with (track_columns_updated = on);
	GRANT VIEW CHANGE TRACKING ON [dbo].[ScriptLink] TO dw_user
END
GO

IF NOT EXISTS (SELECT 1 FROM sys.change_tracking_tables 
               WHERE object_id = OBJECT_ID('dbo.OrderItems'))
BEGIN
	alter table [dbo].[OrderItems]
	enable change_tracking
	with (track_columns_updated = on);
	GRANT VIEW CHANGE TRACKING ON [dbo].[OrderItems] TO dw_user
END
GO

IF NOT EXISTS (SELECT 1 FROM sys.change_tracking_tables 
               WHERE object_id = OBJECT_ID('dbo.PriceParsed'))
BEGIN
	alter table [dbo].[PriceParsed]
	enable change_tracking
	with (track_columns_updated = on);
	GRANT VIEW CHANGE TRACKING ON [dbo].[PriceParsed] TO dw_user
END
GO

IF NOT EXISTS (SELECT 1 FROM sys.change_tracking_tables 
               WHERE object_id = OBJECT_ID('dbo.Stock'))
BEGIN
	alter table [dbo].[Stock]
	enable change_tracking
	with (track_columns_updated = on);
	GRANT VIEW CHANGE TRACKING ON [dbo].[Stock] TO dw_user
END
GO


IF NOT EXISTS (SELECT 1 FROM sys.change_tracking_tables 
               WHERE object_id = OBJECT_ID('dbo.Drug'))
BEGIN
	alter table [dbo].[Drug]
	enable change_tracking
	with (track_columns_updated = on);
	GRANT VIEW CHANGE TRACKING ON [dbo].[Drug] TO dw_user
END
GO
