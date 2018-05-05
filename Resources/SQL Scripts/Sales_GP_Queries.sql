select top 10 * from SalePayment where SaleID=68544 order by SaleID desc;
go
select top 10 * from Sales where SaleID=68544 order by SaleID desc;
go
select top 10 * from SaleItem where SaleID=68544 order by SaleItemID desc;
go
select top 10 * from Stock where PLU='891967' order by StockID desc;
go
select top 10 * from Stock where PLU='952508';
go
select top 20 * from SaleItem where StockID=64811 and DATEPART(mm,DateAdded) = 10;
go
select top 20 Discount,* from SaleItem where SaleItemID=357;
go
select top 20 * from SalePayment where SaleID=43771 or SaleID=44837 or SaleID=45347;
go
select top 20 * from ScriptLink where ScriptLinkID=67717
go
select distinct Discount*si.Retail/100, Discount, Retail from Sales s 
left join SaleItem si
on s.SaleId=si.SaleID
where si.SaleItemID=103452;
go
select * from Stock s where s.TradeName like '%ACCU CHEK%';
go
select (si.Retail-si.GSTPaid-si.Discount*si.Retail/100) as Sale_Value
from SaleItem si
where si.SaleItemID=157206;
go
select * from ScriptLink where ScriptLinkID=61369;
go
select * from SaleItem where SaleItemID=79431;
go
select * from Stock where StockID=65092;
go
select * from Stock where TradeName like '%MISCELLANEOUS%';
go
select * from SalePayment where SaleID=32119;
go
select top 100 * from SaleItem order by SaleID desc;
go
select top 100 * from SaleItem where SaleID=69433 order by SaleID desc;
go
select * from SalePayment where SaleID=69433; 
go
select * from Stock where StockID=3065;
go
select top 100 * from ScriptLink order by SaleID desc;
go
select top 10 PLU, * from SaleItem si, Stock s where ScriptLinkID=91030 and s.StockID=si.StockID
go
select PLU, StockID, Cost, RealCost, AverageCost, Retail, AverageCost, LastOrderDate, DateCreated, LastCountDate, * from Stock s where StockID=2521;
go
select * from SaleItem where StockID=2521 and DATEPART(mm,DateAdded) = 5 and DATEPART(yyyy, DateAdded) = 2017 order by DateAdded desc;
go
select top 100 * from SalePayment order by SaleID desc;
go
select top 100 * from ScriptLink order by DateTimeTransferred desc;
go
select top 10 * from Stock where TradeName like '%MISCELLANEOUS%';
go
select top 1000 * from SaleItem si where si.Cost=0 or si.Cost = null order by DateAdded desc;
go
select ScriptLinkID, DateAdded,  * from SaleItem si where StockID=65419 order by SaleItemID desc;
go
select * from Department order by DeptName ASC;
go
select * from External_Department order by Name ASC;



scriptlink unmatch



