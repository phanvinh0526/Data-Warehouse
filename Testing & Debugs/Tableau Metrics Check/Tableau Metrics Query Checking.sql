use Sale_DDS_DW

-- TWK: 7, Brimbank: 9
go
--------- No of Customers (exc Scripts Only Patients) 2016 vs 2015 ---------
-- From NDS_DW
	-- 2/2015 = 21740
	-- 2/2016 = 21300
-- From FredOffice at TWK
	-- 2/2015	21740
	-- 2/2016	21300
-- => Ratio is 3.2%


--------- Total Sales FY17 ------------
-- Query at FredOffice TWK
/*use FredOffice
go
select sum(TotalExtendedPrice-TotalTax+TotalGovRecov) as TotalSales from doActivity
where TimeOccured between '2016-07-01 00:00:01' and '2017-06-30 23:59:59'

=>	13049982.7900622728
=>	Count: 321825 */

-- Tableau Results 
/*
12,373,445 - Hailey's Tableau
12,371,788 - DW including items returned
12,763,201 - DW excluding items returned (QtySold > 0)
13,049,982 - From [Transaction] table TWK FredOffice
------
select sum(Sales_Ex+Gov_Recov) from View_Itemies_Transaction_Detail 
where StoreKey=7 and TransactionDate between '2016-07-01 00:00:01' and '2017-06-30 23:59:59' 
				and QtySold > 0
	=>	Result: 12,763,201

select sum(TotalExtendedPrice-TotalSaleTax+TotalGovRecov) from FactTransaction f join DimTime on f.TimeKey=DimTime.TimeKey 
	where StoreKey=7 and DimTime.Date between '2016-07-01 00:00:01' and '2017-06-30 23:59:59'
	=>	Result: 13,049,982	(BETTER)

=>	Solution: use [Transaction] table instead of TransactionEntry
=>	Result: 13,049,982
*/

select sum(Sales_Ex+Gov_Recov) from View_Itemies_Transaction_Detail 
where StoreKey=7 and TransactionDate between '2016-07-01 00:00:01' and '2017-06-30 23:59:59' 
			-- 12,763,201.3005770000 excluding QtySold 
			-- 12,371,787.6673350000 including QtySold <= 0

select sum(TotalExtendedPrice-TotalSaleTax+TotalGovRecov) from FactTransaction f join DimTime on f.TimeKey=DimTime.TimeKey 
	where StoreKey=7 and DimTime.Date between '2016-07-01 00:00:01' and '2017-06-30 23:59:59'
	-- =>	Result: 13,049,982	(BETTER)

Use NDS_DW
go
select top 10 te.CreatedAt,t.CreatedAt,* from TransactionEntry te join [Transaction] t on t.TransactionKey=te.TransactionKey
where t.TransactionNumber=1415897 and t.StoreKey=7


use NDS_DW
go
select * from Doctor where FirstName like '%QUOC%' and Lastname like '%Duong%'

select top 10 * from Doctor d join Script s on s.DoctorKey = d.DoctorKey


use FredOffice_Brimbank_9
go
select top 10 DoctorPrescriberNumber, sum(ae.ExtendedPrice) as Sales
from doScript s full outer join doActivityEntry ae on ae.Script=s.ID
group by ae.ItemTransacted
order by Sales desc


select top 10 *
from doActivityEntry ae
group by ae.Script

select top 10 * from doDoctor where PrescriberNumber=2247171

select top 10 sum(ae.ExtendedPrice) from doActivityEntry ae inner join doScript s on s.ID=ae.Script  where s.DoctorPrescriberNumber=2247171
group by DoctorPrescriberNumber




DoctorPrescriberNumber	Sales
2247171	69266.1374040000
528335	63071.6903600000