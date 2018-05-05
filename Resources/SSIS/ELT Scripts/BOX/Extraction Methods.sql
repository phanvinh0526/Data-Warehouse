/*	Change Data Capture	*/
USE []
GO
EXEC sys.sp_cdc_enable_db
GO
EXEC sys.sp_cdc_enable_table
@source_schema 	= 'dbo',
@source_name	= 'DimAccount',
@role_name		= 'MyRole',
@filegroup_name = 'Primary',
@supports_net_changes = 1
GO
/*Notes
		When we run the script, it will come out with the changes, 
		and use attribute "operation" to know which one is older and newer
*/


/*	Change Tracking */
USE []
GO
ALTER DATABASE Lots
GO
SET CHANGE_TRACKING = ON
(CHANGE_RETENTION = 2 DAYS, AUTO_CLEANUP = ON);

ALTER TABLE [dbo].[TableName]
ENABLE CHANGE TRACKING
WITH (TRACK_COLUMNS_UPDATE = ON);



/*	*/