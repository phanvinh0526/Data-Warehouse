
use LOTS_Sample_P@K
go
alter database LOTS_Sample_P@K
set change_tracking = on
(change_retention = 2 days, auto_cleanup = on);
go
alter table [dbo].[Sales]
enable change_tracking
with (track_columns_updated = on);

select *
from changetable(changes [dbo].[Sales], 0) as T;

select CHANGE_TRACKING_CURRENT_VERSION() as EndVersionId



delete from changetable(changes [dbo].[Sales], 0) as T;

68546

select COUNT(*) from Sales

