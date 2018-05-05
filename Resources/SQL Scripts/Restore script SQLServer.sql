execute rds_restore_database N'LOTS'

EXEC rds_restore_database
@restore_db_name='lots_pharknox_22042017',
@s3_arn_to_restore_from='arn:aws:s3:::autumngroup-rds-backup/PharKnox_Lots_22042017.bak'


arn:aws:s3:::autumngroup-rds-backup

PharKnox_Lots_22042017.bak


exec msdb.dbo.rds_task_status


