use DW_STAGE
go
truncate table LOTS_Department
go
truncate table LOTS_Doctor
go
truncate table LOTS_Drug
go
truncate table LOTS_External_Department
go
truncate table LOTS_External_SubDepartment
go
truncate table LOTS_History
go
truncate table LOTS_IncomingStock
go
truncate table LOTS_OrderInvoice
go
truncate table LOTS_OrderInvoiceItems
go
truncate table LOTS_OrderItems
go
truncate table LOTS_Orders
go
truncate table LOTS_Partcode
go
truncate table LOTS_Person
go
truncate table LOTS_PriceParsed
go
truncate table LOTS_ProductGroup
go
truncate table LOTS_SaleItem
go
truncate table LOTS_SalePayment
go
truncate table LOTS_Sales
go
truncate table LOTS_Script
go
truncate table LOTS_ScriptLink
go
truncate table LOTS_Staff
go
truncate table LOTS_Statement
go
truncate table LOTS_Stock
go
truncate table LOTS_StockAdjustment
go
truncate table LOTS_StockTake
go
truncate table LOTS_StockTakeItems
go
truncate table LOTS_Supplier
go
truncate table LOTS_SupplierDetails

------------------------------------
use NDS_DW
go
delete from Supplier where StoreKey=6
go
delete from Staff where StoreKey=6
go
delete from Doctor where StoreKey=6
go
delete from Customer where StoreKey=6
go
delete from Barcode where StoreKey=6
go
delete from Drug where StoreKey=6
go
delete from ProductDepartment where StoreKey=6
go
delete from Script where StoreKey=6
go
delete from ProductGroup where StoreKey=6
go
delete from Product where StoreKey=6
go
delete from PurchaseOrder where StoreKey=6
go
delete from PurchaseOrderEntry where StoreKey=6
go
delete from PurchaseOrderInvoice where StoreKey=6
go
delete from PurchaseOrderInvoiceEntry where StoreKey=6
go
delete from StockTake where StoreKey=6
go
delete from StockTakeEntry where StoreKey=6
go
delete from [Transaction] where StoreKey=6
go
delete from ScriptLink where StoreKey=6
go
delete from TransactionEntry where StoreKey=6
go
