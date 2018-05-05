
/*
[Doctor]="AUSTIN CHOW" 		2271556
OR [Doctor]="IRENE TAN"		2282594
OR [Doctor]="JOHNSON HSU"	2234874
OR [Doctor]="QUOC DUONG"	2103347
OR [Doctor]="SARULATHA VISNUMOGAN"	2513320
OR [Doctor]="HELEN HSU"				2211118
OR [Doctor]="PALLAVI PRATHIVADI"	2659602
OR [Doctor]="SHIVATHI SIVAPALAN"	N/A
OR [Doctor]="SHIVANTHI SIVAPALAN"	2788290
OR [Doctor]="MARINA TADROSS"		2544421
OR [Doctor]="MONICA FOONG"			2793133
OR [Doctor]="ZAHIN ILAHEE"			2738947

StoreKey	StoreID	StoreName
1	1	Autumn Place
2	2	Linden
3	3	Raymond
4	4	Risdon Vale
5	5	St George
6	6	P@K
7	7	TWKnox
8	8	Langton
9	9	TWBrimbank
10	10	D@K
11	11	Medcentral
*/
------------------------------------------------
--	Department Profit Report at TWK
------------------------------------------------
use Sale_DDS_DW
go
select sum(fe.Price - (fe.Cost * fe.Quantity) - fe.Tax + fe.GovRecovAmt) from FactTransactionEntry fe
	join DimProductDepartment dd on dd.ProductDepartmentKey=fe.ProductDepartmentKey
	join DimTime dt on dt.TimeKey=fe.TimeKey
where StoreKey=7 and dd.ProductDepartmentKey = 181 and dt.Month=1 and dt.CaledarYear=2018
-- 2017: 123282.314078999
-- 2018: 133845.636873998
-- =>	10,563

select sum(v.Profit) from View_Itemies_Transaction_Detail v
where StoreKey=7 and MONTH(v.TransactionDate)=1 and YEAR(v.TransactionDate)=2017 and v.Department like '%dispensary%'

-- 2017:	123282.309079
-- 2018:	133845.636874
-- =>	10,563

-- Root Problem
select top 10 * from DimProductDepartment where ProductDepartmentName like '%pain relief%' -- NULL
go
select top 10 * from DimProductGroup where ProductGroupName like '%pain relief%' -- Got 1


------------------------------------------------
--	 at TWK
------------------------------------------------


