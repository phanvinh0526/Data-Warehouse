use SOURCE_RV_FredOffice
go

select top 10 * from doScript order by ID desc

select count(*) from doScript where ScriptClassification='<'

select distinct ScriptClassification from doScript
/*
	WHEN '<' THEN 'Safety Net' - WHEN 'E' THEN 'Entitlement' 
WHEN 'N' THEN 'General'        
	WHEN 'C' THEN 'Concession' - WHEN 'S' THEN 'Concession'        
WHEN 'B' THEN 'Doctors Bag'        
WHEN 'R' THEN 'Repatriation'        
WHEN 'P' THEN 'Private'        
WHEN 'T' THEN 'S3 Recordable

T
N	-	mostly
E
P
	U - private ? (only 3 P@K)
R
B
*/

use SOURCE_P@K_FredDispense
go
select sclass,* from script where srxno=099746

select count(*) from script where sclass = 'C'

select distinct stype from script

select top 10 sclass, * from script	where sclass='C' order by srxno desc


select top 20 sclass, * from script order by srxno desc

select count(*)  from script where sstatus='X'


select count(*) from script where srxno not in (select ScriptNumber from [SOURCE_LOTS_P@K].dbo.ScriptLink)
-- -> result should be over 12,000 scripts m ore than


use SOURCE_RV_FredOffice
go
select top 1 ScriptNumber,* from doScript order by ID desc
go
select top 10 ScriptNumber from doScript group by ScriptNumber having count(ScriptNumber)>=2

select count(*) from doScript -- 203180
go
select count(distinct ScriptNumber) from doScript


/*

use Storeops
go
CREATE TABLE #counts
(
    table_name varchar(255),
    row_count int
)
EXEC sp_MSForEachTable @command1='INSERT #counts (table_name, row_count) SELECT ''?'', COUNT(*) FROM ?'
SELECT table_name, row_count FROM #counts ORDER BY row_count DESC
DROP TABLE #counts



select count(*) from [TransactionEntry]
go
select top 10 * from TenderEntry order by ID



use SOURCE_LOTS_P@K
go
select top 10 * from ScriptLink order by ScriptLinkID desc
go
select distinct ScriptType from ScriptLink
go
select top 200 * from ScriptLink where ScriptType='N' order by ScriptLinkID desc
go
select top 10 ScriptNumber from ScriptLink group by ScriptNumber having count(ScriptNumber)>=2



use SOURCE_P@K_FredDispense
go
select count(*) from script



use SOURCE_TWK_FredOffice
go
select count(*)  from doScript
go
select count(*)  from doScript where ScriptClassification='N'
go
select count(*)  from doScript where ScriptClassification='C'

*/