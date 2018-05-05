USE [master]
GO

IF EXISTS(SELECT 1 FROM [sys].[databases] WHERE name ='NDS_METADATA')
	DROP DATABASE [NDS_METADATA]
GO

CREATE DATABASE [NDS_METADATA]
GO

USE [NDS_METADATA]
GO

--// DROP ALL FK FOR A DATABASE
DECLARE @sql nvarchar(MAX) = (
    SELECT 
        'ALTER TABLE ' + quotename(schema_name(schema_id)) + '.' +
        quotename(object_name(parent_object_id)) +
        ' DROP CONSTRAINT '+quotename(name) + ';'
    FROM sys.foreign_keys
    FOR XML PATH('')
);

EXEC sp_executesql @sql; 
GO

USE [NDS_METADATA]
GO

IF OBJECT_ID('[dbo].[Stores]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[Stores];
GO

CREATE TABLE [dbo].[Stores]
(
	StoreID				int PRIMARY KEY,
	StoreName			varchar(50),
	[Description]		varchar(4000),
	[Status]			int,		--// 1: Active, 0: InActive
	CreatedDate			datetime,
	UpdatedDate			datetime
)

GO
INSERT INTO [dbo].[Stores] VALUES
 (1, 'Autumn Place'	, 'Autumn Place', 1, GETDATE(), GETDATE())
,(2, 'Linden'		, 'Linden'		, 1, GETDATE(), GETDATE())
,(3, 'Raymond'		, 'Raymond'		, 1, GETDATE(), GETDATE())
,(4, 'Risdon Vale'	, 'Risdon Vale'	, 1, GETDATE(), GETDATE())
,(5, 'St George'	, 'St George'	, 1, GETDATE(), GETDATE())
,(6, 'P@K'			, 'P@K'			, 1, GETDATE(), GETDATE())
,(7, 'TWKnox'		, 'TWKnox'		, 1, GETDATE(), GETDATE())
,(8, 'Langton'		, 'Langton'		, 1, GETDATE(), GETDATE())
,(9, 'TWBrimbank'	, 'TWBrimbank'	, 1, GETDATE(), GETDATE())
,(10, 'D@K'			, 'D@K'			, 1, GETDATE(), GETDATE())
,(11, 'Medcentral'	, 'Medcentral'	, 1, GETDATE(), GETDATE())
GO

IF OBJECT_ID('[dbo].[ServerStatus]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[ServerStatus];
GO

CREATE TABLE [dbo].[ServerStatus]
(
	ServerStatusID		int PRIMARY KEY,
	[Description]		varchar(4000),
	[Status]			int,		--// 0: Fail, 1: Ready, 2: Done
	StoreID				int,
	PriorityRun			int,
	CreatedDate			datetime,
	UpdatedDate			datetime,
	FOREIGN KEY (StoreID) REFERENCES  [dbo].[Stores] (StoreID)
)

GO

INSERT INTO [dbo].[ServerStatus] VALUES
 (1, 'Status for Autumn Place'	, 1, 1,  2, GETDATE(), GETDATE())
,(2, 'Status for Linden'		, 0, 2,  1, GETDATE(), GETDATE())
,(3, 'Status for Raymond'		, 0, 3,  1, GETDATE(), GETDATE())
,(4, 'Status for Risdon Vale'	, 0, 4,  2, GETDATE(), GETDATE())
,(5, 'Status for St George'		, 0, 5,  2, GETDATE(), GETDATE())
,(6, 'Status for P@K'			, 0, 6,  1, GETDATE(), GETDATE())
,(7, 'Status for TWKnox'		, 0, 7,  2, GETDATE(), GETDATE())
,(8, 'Status for Langton'		, 0, 8,  2, GETDATE(), GETDATE())
,(9, 'Status for TWBrimbank'	, 0, 9,  2, GETDATE(), GETDATE())
,(10, 'Status for D@K'			, 0, 10, 2, GETDATE(), GETDATE())
,(11, 'Status for Medcentral'	, 0, 11, 0, GETDATE(), GETDATE())

GO 

IF OBJECT_ID('[dbo].[DataStore]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[DataStore];
GO

CREATE TABLE [dbo].[DataStore]
(
	DataStoreID			int PRIMARY KEY,
	DataStoreName		varchar(50),
	[Description]		varchar(4000),
	CreatedDate			datetime,
	UpdatedDate			datetime,
)

GO

INSERT INTO [dbo].[DataStore] VALUES
 (1, 'Stage'	, 'Staging area'			, GETDATE(), GETDATE())
,(2, 'NDS'		, 'Normalized data store'	, GETDATE(), GETDATE())
,(3, 'DDS'		, 'Dimensional data store'	, GETDATE(), GETDATE())
,(4, 'Metadata'	, 'Metadata'				, GETDATE(), GETDATE())

GO 

IF OBJECT_ID('[dbo].[Databases]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[Databases];
GO

CREATE TABLE [dbo].[Databases]
(
	DatabaseID			int PRIMARY KEY,
	DatabaseName		varchar(50),
	[Description]		varchar(4000),
	[Status]			int,	--// 1: Active, 0: InActive
	DataStoreID			int,
	CreatedDate			datetime,
	UpdatedDate			datetime,
	FOREIGN KEY (DataStoreID) REFERENCES  [dbo].[DataStore] (DataStoreID)
)

GO

INSERT INTO [dbo].[Databases] VALUES
  (1, 'NDS_METADATA'	, 'Metadata database'	, 1, 4, GETDATE(), GETDATE())
 ,(2, 'STAGING_DW'		, 'Staging database'	, 1, 1, GETDATE(), GETDATE())
 ,(3, 'NDS_DW'			, 'NDS database'		, 1, 2, GETDATE(), GETDATE())
 ,(4, 'SALE_DDS_DW'		, 'Sale DDS database'	, 1, 3, GETDATE(), GETDATE())
 ,(5, 'STOCK_VALUATION_DDS_DW', 'Stock Valuation DDS database'	, 1, 3, GETDATE(), GETDATE())
 GO 

 IF OBJECT_ID('[dbo].[TableType]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[TableType];
GO

CREATE TABLE [dbo].[TableType]
(
	TableTypeID			int PRIMARY KEY,
	TableTypeName		varchar(50),
	[Description]		varchar(4000),
	CreatedDate			datetime,
	UpdatedDate			datetime,
)

GO

INSERT INTO [dbo].[TableType] VALUES
 (1, 'Dimension'	, 'Dimension table'		, GETDATE(), GETDATE())
,(2, 'Fact'			, 'Fact table'			, GETDATE(), GETDATE())
,(3, 'Master'		, 'Master table'		, GETDATE(), GETDATE())
,(4, 'Transaction'	, 'Transaction table'	, GETDATE(), GETDATE())
,(5, 'Stage'		, 'Stage table'			, GETDATE(), GETDATE())
,(6, 'Metadata'		, 'Metadata table'		, GETDATE(), GETDATE())

GO

IF OBJECT_ID('[dbo].[Tables]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[Tables];
GO

CREATE TABLE [dbo].[Tables]
(
	TableID				int PRIMARY KEY,
	TableName			varchar(100),
	[Description]		varchar(4000),
	[Status]			int,		--// 1: Active, 0: inActive
	DatabaseID			int,
	TableTypeID			int,
	CreatedDate			datetime,
	UpdatedDate			datetime,
	FOREIGN KEY (DatabaseID) REFERENCES  [dbo].[Databases] (DatabaseID),
	FOREIGN KEY (TableTypeID) REFERENCES  [dbo].[TableType] (TableTypeID)						
)

GO

INSERT INTO [dbo].[Tables] VALUES
--// NDS_Metadata
 (1,	'ServerStatus'					, '', 1, 1, 6, GETDATE(), GETDATE())
,(2,	'Stores'						, '', 1, 1, 6, GETDATE(), GETDATE())
,(3,	'DataStore'						, '', 1, 1, 6, GETDATE(), GETDATE())
,(4,	'Databases'						, '', 1, 1, 6, GETDATE(), GETDATE())
,(5,	'TableType'						, '', 1, 1, 6, GETDATE(), GETDATE())
,(6,	'Tables'						, '', 1, 1, 6, GETDATE(), GETDATE())
,(7,	'ColumnType'					, '', 1, 1, 6, GETDATE(), GETDATE())
,(8,	'Columns'						, '', 1, 1, 6, GETDATE(), GETDATE())
,(9,	'Status'						, '', 1, 1, 6, GETDATE(), GETDATE())
,(10,	'DataFlow'						, '', 1, 1, 6, GETDATE(), GETDATE())
,(11,	'Packages'						, '', 1, 1, 6, GETDATE(), GETDATE())
,(12,	'LogPackage'					, '', 1, 1, 6, GETDATE(), GETDATE())
--// Stage_FredOffice
,(13,	'OFFICE_doAccount'				, '', 1, 2, 5, GETDATE(), GETDATE())
,(14,	'OFFICE_doActivity'				, '', 1, 2, 5, GETDATE(), GETDATE())
,(15,	'OFFICE_doActivityEntry'		, '', 1, 2, 5, GETDATE(), GETDATE())
,(16,	'OFFICE_doCashier'				, '', 1, 2, 5, GETDATE(), GETDATE())
,(17,	'OFFICE_doCategory'				, '', 1, 2, 5, GETDATE(), GETDATE())
,(18,	'OFFICE_doClaim'				, '', 1, 2, 5, GETDATE(), GETDATE())
,(19,	'OFFICE_doCustomer'				, '', 1, 2, 5, GETDATE(), GETDATE())
,(20,	'OFFICE_doDepartment'			, '', 1, 2, 5, GETDATE(), GETDATE())
,(21,	'OFFICE_doDoctor'				, '', 1, 2, 5, GETDATE(), GETDATE())
,(22,	'OFFICE_doDrug'					, '', 1, 2, 5, GETDATE(), GETDATE())
,(23,	'OFFICE_doInvoice'				, '', 1, 2, 5, GETDATE(), GETDATE())
,(24,	'OFFICE_doInvoiceEntry'			, '', 1, 2, 5, GETDATE(), GETDATE())
,(25,	'OFFICE_doItemBase'				, '', 1, 2, 5, GETDATE(), GETDATE())
,(26,	'OFFICE_doItemPricingHistory'	, '', 1, 2, 5, GETDATE(), GETDATE())
,(27,	'OFFICE_doPatient'				, '', 1, 2, 5, GETDATE(), GETDATE())
,(28,	'OFFICE_doPharmacist'			, '', 1, 2, 5, GETDATE(), GETDATE())
,(29,	'OFFICE_doPurchaseOrder'		, '', 1, 2, 5, GETDATE(), GETDATE())
,(30,	'OFFICE_doPurchaseOrderEntry'	, '', 1, 2, 5, GETDATE(), GETDATE())
,(31,	'OFFICE_doScript'				, '', 1, 2, 5, GETDATE(), GETDATE())
,(32,	'OFFICE_doStatement'			, '', 1, 2, 5, GETDATE(), GETDATE())
,(33,	'OFFICE_doSupplier'				, '', 1, 2, 5, GETDATE(), GETDATE())
--// Stage_LOTs
,(34,	'LOTs_Department'				, '', 1, 2, 5, GETDATE(), GETDATE())
,(35,	'LOTs_Drug'						, '', 1, 2, 5, GETDATE(), GETDATE())
,(36,	'LOTs_External_Department'		, '', 1, 2, 5, GETDATE(), GETDATE())
,(37,	'LOTs_External_SubDepartment'	, '', 1, 2, 5, GETDATE(), GETDATE())
,(38,	'LOTs_History'					, '', 1, 2, 5, GETDATE(), GETDATE())
,(39,	'LOTs_IncomingStock'			, '', 1, 2, 5, GETDATE(), GETDATE())
,(40,	'LOTs_OrderInvoice'				, '', 1, 2, 5, GETDATE(), GETDATE())
,(41,	'LOTs_OrderInvoiceItems'		, '', 1, 2, 5, GETDATE(), GETDATE())
,(42,	'LOTs_OrderItems'				, '', 1, 2, 5, GETDATE(), GETDATE())
,(43,	'LOTs_Orders'					, '', 1, 2, 5, GETDATE(), GETDATE())
,(44,	'LOTs_Partcode'					, '', 1, 2, 5, GETDATE(), GETDATE())
,(45,	'LOTs_Person'					, '', 1, 2, 5, GETDATE(), GETDATE())
,(46,	'LOTs_PriceParsed'				, '', 1, 2, 5, GETDATE(), GETDATE())
,(47,	'LOTs_ProductGroup'				, '', 1, 2, 5, GETDATE(), GETDATE())
,(48,	'LOTs_SaleItem'					, '', 1, 2, 5, GETDATE(), GETDATE())
,(49,	'LOTs_SalePayment'				, '', 1, 2, 5, GETDATE(), GETDATE())
,(50,	'LOTs_Sales'					, '', 1, 2, 5, GETDATE(), GETDATE())
,(51,	'LOTs_ScriptLink'				, '', 1, 2, 5, GETDATE(), GETDATE())
,(52,	'LOTs_Staff'					, '', 1, 2, 5, GETDATE(), GETDATE())
,(53,	'LOTs_Statement'				, '', 1, 2, 5, GETDATE(), GETDATE())
,(54,	'LOTs_Stock'					, '', 1, 2, 5, GETDATE(), GETDATE())
,(55,	'LOTs_StockAdjustment'			, '', 1, 2, 5, GETDATE(), GETDATE())
,(56,	'LOTs_Supplier'					, '', 1, 2, 5, GETDATE(), GETDATE())
,(57,	'LOTs_SupplierDetails'			, '', 1, 2, 5, GETDATE(), GETDATE())
--// Stage_POS
,(58,	'POS_Batch'						, '', 1, 2, 5, GETDATE(), GETDATE())
,(59,	'POS_Cashier'					, '', 1, 2, 5, GETDATE(), GETDATE())
,(60,	'POS_Category'					, '', 1, 2, 5, GETDATE(), GETDATE())
,(61,	'POS_Customer'					, '', 1, 2, 5, GETDATE(), GETDATE())
,(62,	'POS_Department'				, '', 1, 2, 5, GETDATE(), GETDATE())
,(63,	'POS_Item'						, '', 1, 2, 5, GETDATE(), GETDATE())
,(64,	'POS_NUS_PO_Patient'			, '', 1, 2, 5, GETDATE(), GETDATE())
,(65,	'POS_NUS_PO_Script'				, '', 1, 2, 5, GETDATE(), GETDATE())
,(66,	'POS_NUS_PostCodeTransaction'	, '', 1, 2, 5, GETDATE(), GETDATE())
,(67,	'POS_NUS_TransactionStats'		, '', 1, 2, 5, GETDATE(), GETDATE())
,(68,	'POS_Register'					, '', 1, 2, 5, GETDATE(), GETDATE())
,(69,	'POS_SalesRep'					, '', 1, 2, 5, GETDATE(), GETDATE())
,(70,	'POS_Store'						, '', 1, 2, 5, GETDATE(), GETDATE())
,(71,	'POS_Supplier'					, '', 1, 2, 5, GETDATE(), GETDATE())
,(72,	'POS_Tax'						, '', 1, 2, 5, GETDATE(), GETDATE())
,(73,	'POS_TaxEntry'					, '', 1, 2, 5, GETDATE(), GETDATE())
,(74,	'POS_Tender'					, '', 1, 2, 5, GETDATE(), GETDATE())
,(75,	'POS_TenderEntry'				, '', 1, 2, 5, GETDATE(), GETDATE())
,(76,	'POS_Transaction'				, '', 1, 2, 5, GETDATE(), GETDATE())
,(77,	'POS_TransactionEntry'			, '', 1, 2, 5, GETDATE(), GETDATE())
--// NDS_DW
,(78,	'Customer'						, '', 1, 3, 3, GETDATE(), GETDATE())
,(79,	'Doctor'						, '', 1, 3, 3, GETDATE(), GETDATE())
,(80,	'Drug'							, '', 1, 3, 3, GETDATE(), GETDATE())
,(81,	'Patient'						, '', 1, 3, 3, GETDATE(), GETDATE())
,(82,	'Pharmacist'					, '', 1, 3, 3, GETDATE(), GETDATE())
,(83,	'Product'						, '', 1, 3, 3, GETDATE(), GETDATE())
,(84,	'ProductDepartment'				, '', 1, 3, 3, GETDATE(), GETDATE())
,(85,	'ProductGroup'					, '', 1, 3, 3, GETDATE(), GETDATE())
,(86,	'ProductTax'					, '', 1, 3, 3, GETDATE(), GETDATE())
,(87,	'Script'						, '', 1, 3, 3, GETDATE(), GETDATE())
,(88,	'ScriptLink'					, '', 1, 3, 4, GETDATE(), GETDATE())
,(89,	'Staff'							, '', 1, 3, 3, GETDATE(), GETDATE())
,(90,	'Store'							, '', 1, 3, 3, GETDATE(), GETDATE())
,(91,	'Supplier'						, '', 1, 3, 3, GETDATE(), GETDATE())
,(92,	'Transaction'					, '', 1, 3, 4, GETDATE(), GETDATE())
,(93,	'TransactionEntry'				, '', 1, 3, 4, GETDATE(), GETDATE())
,(94,	'DataSource'					, '', 1, 3,	3, GETDATE(), GETDATE())
,(95,	'ProductDepartmentGlobal'		, '', 1, 3,	3, GETDATE(), GETDATE())
,(96,	'ProductGroupGlobal'			, '', 1, 3,	3, GETDATE(), GETDATE())
,(97,	'ProductGlobal'					, '', 1, 3,	3, GETDATE(), GETDATE())
,(98,	'SupplierGlobal'				, '', 1, 3,	3, GETDATE(), GETDATE())
,(99,	'PurchaseOrder'					, '', 1, 3,	4, GETDATE(), GETDATE())
,(100,	'PurchaseOrderEntry'			, '', 1, 3,	4, GETDATE(), GETDATE())
,(101,	'PurchaseOrderInvoice'			, '', 1, 3,	4, GETDATE(), GETDATE())
,(102,	'PurchaseOrderInvoiceEntry'		, '', 1, 3,	4, GETDATE(), GETDATE())
,(103,	'StockMovement'					, '', 1, 3,	4, GETDATE(), GETDATE())
,(104,	'StockTake'						, '', 1, 3,	4, GETDATE(), GETDATE())
,(105,	'StockTakeEntry'				, '', 1, 3,	4, GETDATE(), GETDATE())
--// Stage_CONNECT
,(106,	'CONNECT_AppCat_Category'		, '', 1, 2, 5, GETDATE(), GETDATE())
,(107,	'CONNECT_AppCat_Department'		, '', 1, 2, 5, GETDATE(), GETDATE())
,(108,	'CONNECT_AppCat_Item'			, '', 1, 2, 5, GETDATE(), GETDATE())
,(109,	'CONNECT_AppCat_Supplier'		, '', 1, 2, 5, GETDATE(), GETDATE())
,(110,	'CONNECT_AppCat_SupplierList'	, '', 1, 2, 5, GETDATE(), GETDATE())
--// SALE_DDS_DW
,(111,	'DimTime'						, '', 1, 4, 1, GETDATE(), GETDATE())
,(112,	'DimDataSource'					, '', 1, 4, 1, GETDATE(), GETDATE())
,(113,	'DimStore'						, '', 1, 4, 1, GETDATE(), GETDATE())
,(114,	'DimProductDepartmentGobal'		, '', 1, 4, 1, GETDATE(), GETDATE())
,(115,	'DimProductGroupGlobal'			, '', 1, 4, 1, GETDATE(), GETDATE())
,(116,	'DimProductGlobal'				, '', 1, 4, 1, GETDATE(), GETDATE())
,(117,	'DimProductDepartment'			, '', 1, 4, 1, GETDATE(), GETDATE())
,(118,	'DimProductGroup'				, '', 1, 4, 1, GETDATE(), GETDATE())
,(119,	'DimProduct'					, '', 1, 4, 1, GETDATE(), GETDATE())
,(120,	'DimStaff'						, '', 1, 4, 1, GETDATE(), GETDATE())
,(121,	'DimCustomer'					, '', 1, 4, 1, GETDATE(), GETDATE())
,(122,	'DimScriptLink'					, '', 1, 4, 1, GETDATE(), GETDATE())
,(123,	'DimTransaction'				, '', 1, 4, 1, GETDATE(), GETDATE())
,(124,	'FactTransactionEntry'			, '', 1, 4, 2, GETDATE(), GETDATE())
--// STOCK_VALUATION_DDS_DW
,(125,	'DimTime'						, '', 1, 5, 1, GETDATE(), GETDATE())
,(126,	'DimDataSource'					, '', 1, 5, 1, GETDATE(), GETDATE())
,(127,	'DimStore'						, '', 1, 5, 1, GETDATE(), GETDATE())
,(128,	'DimProductDepartmentGobal'		, '', 1, 5, 1, GETDATE(), GETDATE())
,(129,	'DimProductGroupGlobal'			, '', 1, 5, 1, GETDATE(), GETDATE())
,(130,	'DimProductGlobal'				, '', 1, 5, 1, GETDATE(), GETDATE())
,(131,	'DimProductDepartment'			, '', 1, 5, 1, GETDATE(), GETDATE())
,(132,	'DimProductGroup'				, '', 1, 5, 1, GETDATE(), GETDATE())
,(133,	'DimProduct'					, '', 1, 5, 1, GETDATE(), GETDATE())
,(136,	'DimDrug'						, '', 1, 5, 1, GETDATE(), GETDATE())
,(138,	'DimSupplierGlobal'				, '', 1, 5, 1, GETDATE(), GETDATE())
,(139,	'DimSupplier'					, '', 1, 5, 1, GETDATE(), GETDATE())
,(142,	'FactStockMovement'				, '', 1, 5, 2, GETDATE(), GETDATE())
,(143,	'FactBusinessAuditHistory'		, '', 1, 5, 2, GETDATE(), GETDATE())

--// ADDITION Stage_FredOffice
,(146,	'OFFICE_doBusinessUnit-AuditHistory'	, '', 1, 2, 5, GETDATE(), GETDATE())
,(147,	'OFFICE_doBatch'				, '', 1, 2, 5, GETDATE(), GETDATE())
,(148,	'OFFICE_doGroup-GroupEntries'	, '', 1, 2, 5, GETDATE(), GETDATE())
,(149,	'OFFICE_doGroup'				, '', 1, 2, 5, GETDATE(), GETDATE())		--//TODO
,(150,	'OFFICE_doPricingReview'		, '', 1, 2, 5, GETDATE(), GETDATE())
,(151,	'OFFICE_doPricingReviewEntry'	, '', 1, 2, 5, GETDATE(), GETDATE())
,(152,	'OFFICE_doItemClassification'	, '', 1, 2, 5, GETDATE(), GETDATE())
,(153,	'OFFICE_doItem'					, '', 1, 2, 5, GETDATE(), GETDATE())
,(154,	'OFFICE_doItemMessage'			, '', 1, 2, 5, GETDATE(), GETDATE())
,(155,	'OFFICE_doQuantityDiscountScheme'	, '', 1, 2, 5, GETDATE(), GETDATE())
,(156,	'OFFICE_doItemMovementHistory'	, '', 1, 2, 5, GETDATE(), GETDATE())
,(157,	'OFFICE_doStocktake'			, '', 1, 2, 5, GETDATE(), GETDATE())
,(158,	'OFFICE_doStocktakeEntry'		, '', 1, 2, 5, GETDATE(), GETDATE())
,(159,	'OFFICE_doSupplierItem'			, '', 1, 2, 5, GETDATE(), GETDATE())
,(160,	'OFFICE_doTender'				, '', 1, 2, 5, GETDATE(), GETDATE())

--// ADDITION NDS_DW
,(161,	'Batch'							, '', 1, 3, 3, GETDATE(), GETDATE())
,(162,	'BusinessUnit-AuditHistory'		, '', 1, 3, 3, GETDATE(), GETDATE())
,(163,	'Group'							, '', 1, 3, 3, GETDATE(), GETDATE())
,(164,	'Group-GroupEntries'			, '', 1, 3, 3, GETDATE(), GETDATE())
,(165,	'NursingHome'					, '', 1, 3, 3, GETDATE(), GETDATE())
,(166,	'PricingPlan'					, '', 1, 3, 3, GETDATE(), GETDATE())
,(167,	'PricingReview'					, '', 1, 3, 3, GETDATE(), GETDATE())
,(168,	'PricingReviewEntry'			, '', 1, 3, 3, GETDATE(), GETDATE())
,(169,	'ProductClassification'			, '', 1, 3, 3, GETDATE(), GETDATE())
,(170,	'ProductMessage'				, '', 1, 3, 3, GETDATE(), GETDATE())
,(171,	'ProductReference'				, '', 1, 3, 3, GETDATE(), GETDATE())
,(172,	'QuantityDiscountScheme'		, '', 1, 3, 3, GETDATE(), GETDATE())
,(173,	'Register'						, '', 1, 3, 3, GETDATE(), GETDATE())
,(174,	'SupplierProduct'				, '', 1, 3, 3, GETDATE(), GETDATE())
,(175,	'Tender'						, '', 1, 3, 3, GETDATE(), GETDATE())

GO 

IF OBJECT_ID('[dbo].[ColumnType]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[ColumnType];
GO

CREATE TABLE [dbo].[ColumnType]
(
	ColumnTypeID		int PRIMARY KEY,
	ColumnTypeName		varchar(50),
	[Location]			varchar(50),
	[Description]		varchar(4000),
	CreatedDate			datetime,
	UpdatedDate			datetime,
)

GO

INSERT INTO [dbo].[ColumnType] VALUES
 (1, 'Surrogate key'		, 'DDS dimension tables', 'A single not null column that uniquely identifies a row in a dimension table.', GETDATE(), GETDATE())
,(2, 'Natural key'			, 'DDS dimension tables', 'Uniquely identifies a dimension row in the source system.'			, GETDATE(), GETDATE())
,(3, 'Dimensional attribute', 'DDS dimension tables', 'Describes a particular property of a dimension.' , GETDATE(), GETDATE())
,(4, 'Degenerate dimension'	, 'DDS fact tables'		, 'Identifies a transaction in the source system. A natural key of a dimension without any attributes' , GETDATE(), GETDATE())
,(5, 'SCD support'			, 'DDS dimension tables', 'Columns that support slowly changing dimension such as is_active, effective_date, and expiry_date.'	, GETDATE(), GETDATE())
,(6, 'Measure'				, 'DDS fact tables'		, 'Columns in the fact table that contain business measurements or transaction values.'		, GETDATE(), GETDATE())
,(7, 'Fact key'				, 'DDS fact tables'		, 'A single not null column that uniquely identifies a row on a fact table.'		, GETDATE(), GETDATE())
,(8, 'System'				, 'All data stores'		, 'Auxiliary columns created by the system for system usage such as create_timestamp and update_timestamp.'		, GETDATE(), GETDATE())
,(9, 'Transaction'			, 'ODS and NDS tables'	, 'Column in normalized tables containing business transaction values, such as order tables.'		, GETDATE(), GETDATE())
,(10, 'Master'				, 'ODS and NDS tables'	, 'Columns in normalized tables that contain master data such as stores, products, and campaigns.'		, GETDATE(), GETDATE())
,(11, 'Stage'				, 'Stage tables'		, 'Columns in stage tables containing business data.'		, GETDATE(), GETDATE())
,(12, 'Metadata'			, 'Metadata tables'		, 'Columns in metadata tables.'	, GETDATE(), GETDATE())
GO

IF OBJECT_ID('[dbo].[Columns]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[Columns];
GO

CREATE TABLE [dbo].[Columns]
(
	ColumnID			int IDENTITY (1,1) PRIMARY KEY,
	ColumnName			varchar(50),
	DataType			varchar(50),
	[Description]		varchar(4000),
	IsPK				varchar(1),
	IsFK				varchar(1),
	[IsNull]			varchar(1),
	IsIdentity			varchar(1),
	SCDType				int,
	UnknownMember		varchar(50),	
	ExampleValue		varchar(50),	
	TableID				int,
	ColumnTypeID		int,
	CreatedDate			datetime,
	UpdatedDate			datetime,
	FOREIGN KEY (TableID) REFERENCES  [dbo].[Tables] (TableID),	
	FOREIGN KEY (ColumnTypeID) REFERENCES  [dbo].[ColumnType] (ColumnTypeID)	
)

GO

--INSERT INTO [dbo].[Columns] VALUES

GO 

IF OBJECT_ID('[dbo].[Status]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[Status];
GO

CREATE TABLE [dbo].[Status]
(
	StatusID			int PRIMARY KEY,
	StatusName			varchar(50),
	CreatedDate			datetime,
	UpdatedDate			datetime,
)

GO

INSERT INTO [dbo].[Status] VALUES
 (0, 'Unknown'		, GETDATE(), GETDATE())
,(1, 'Success'		, GETDATE(), GETDATE())
,(2, 'Failed'		, GETDATE(), GETDATE())
,(3, 'In progress'	, GETDATE(), GETDATE())

GO

IF OBJECT_ID('[dbo].[Packages]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[Packages];
GO

CREATE TABLE [dbo].[Packages]
(
	PackageID			int	PRIMARY KEY,
	PackageName			varchar(50),
	[Description]		varchar(4000),
	StatusID			int,		
	StoreID				int,	
	LastSuccessRuntime	datetime,
	CreatedDate			datetime,
	UpdatedDate			datetime,
	FOREIGN KEY (StoreID) REFERENCES  [dbo].[Stores] (StoreID),
	FOREIGN KEY (StatusID) REFERENCES  [dbo].[Status] (StatusID)	
)

GO

INSERT INTO [dbo].[Packages] VALUES
  (1	,'NDSToSaleDDS			','', 1,	NULL	,NULL,	GETDATE(), GETDATE())
, (2	,'NDSToStockValuationDDS		','', 1,	NULL	,NULL,	GETDATE(), GETDATE())

--// Store Autumn Place
, (3	,'StageToNDS			','', 1,	1		,NULL,	GETDATE(), GETDATE())
, (4	,'StageToNDS_OFFICE		','', 1,	1		,NULL,	GETDATE(), GETDATE())
, (5	,'StageToNDS_POS		','', 1,	1		,NULL,	GETDATE(), GETDATE())
, (6	,'StageToNDS_DISPENSE	','', 0,	1		,NULL,	GETDATE(), GETDATE())
, (7	,'StageToNDS_CONNECT	','', 1,	1		,NULL,	GETDATE(), GETDATE())

--// Store Linden
, (8	,'StageToNDS			','', 1,	2		,NULL,	GETDATE(), GETDATE())
, (9	,'StageToNDS_LOTS		','', 1,	2		,NULL,	GETDATE(), GETDATE())
, (10	,'StageToNDS_DISPENSE	','', 0,	2		,NULL,	GETDATE(), GETDATE())

--// Store Raymond
, (11	,'StageToNDS			','', 1,	3		,NULL,	GETDATE(), GETDATE())
, (12	,'StageToNDS_LOTS		','', 1,	3		,NULL,	GETDATE(), GETDATE())
, (13	,'StageToNDS_DISPENSE	','', 0,	3		,NULL,	GETDATE(), GETDATE())

--// Store Risdon Vale
, (14	,'StageToNDS			','', 1,	4		,NULL,	GETDATE(), GETDATE())
, (15	,'StageToNDS_OFFICE		','', 1,	4		,NULL,	GETDATE(), GETDATE())
, (16	,'StageToNDS_POS		','', 1,	4		,NULL,	GETDATE(), GETDATE())
, (17	,'StageToNDS_DISPENSE	','', 0,	4		,NULL,	GETDATE(), GETDATE())
, (18	,'StageToNDS_CONNECT	','', 1,	4		,NULL,	GETDATE(), GETDATE())

--// Store St George
, (19	,'StageToNDS			','', 1,	5		,NULL,	GETDATE(), GETDATE())
, (20	,'StageToNDS_OFFICE		','', 1,	5		,NULL,	GETDATE(), GETDATE())
, (21	,'StageToNDS_POS		','', 1,	5		,NULL,	GETDATE(), GETDATE())
, (22	,'StageToNDS_DISPENSE	','', 0,	5		,NULL,	GETDATE(), GETDATE())
, (23	,'StageToNDS_CONNECT	','', 1,	5		,NULL,	GETDATE(), GETDATE())

--// Store P@K
, (24	,'StageToNDS			','', 1,	6		,NULL,	GETDATE(), GETDATE())
, (25	,'StageToNDS_LOTS		','', 1,	6		,NULL,	GETDATE(), GETDATE())

--// Store TWKnox
, (26	,'StageToNDS			','', 1,	7		,NULL,	GETDATE(), GETDATE())
, (27	,'StageToNDS_OFFICE		','', 1,	7		,NULL,	GETDATE(), GETDATE())
, (28	,'StageToNDS_POS		','', 1,	7		,NULL,	GETDATE(), GETDATE())
, (29	,'StageToNDS_DISPENSE	','', 0,	7		,NULL,	GETDATE(), GETDATE())
, (30	,'StageToNDS_CONNECT	','', 1,	7		,NULL,	GETDATE(), GETDATE())

--// Store Langton
, (31	,'StageToNDS			','', 1,	8		,NULL,	GETDATE(), GETDATE())
, (32	,'StageToNDS_OFFICE		','', 1,	8		,NULL,	GETDATE(), GETDATE())
, (33	,'StageToNDS_POS		','', 1,	8		,NULL,	GETDATE(), GETDATE())
, (34	,'StageToNDS_DISPENSE	','', 0,	8		,NULL,	GETDATE(), GETDATE())
, (35	,'StageToNDS_CONNECT	','', 1,	8		,NULL,	GETDATE(), GETDATE())

--// Store TWBrimbank
, (36	,'StageToNDS			','', 1,	9		,NULL,	GETDATE(), GETDATE())
, (37	,'StageToNDS_OFFICE		','', 1,	9		,NULL,	GETDATE(), GETDATE())
, (38	,'StageToNDS_POS		','', 1,	9		,NULL,	GETDATE(), GETDATE())
, (39	,'StageToNDS_DISPENSE	','', 0,	9		,NULL,	GETDATE(), GETDATE())
, (40	,'StageToNDS_CONNECT	','', 1,	9		,NULL,	GETDATE(), GETDATE())

--// Store Medcentral
, (41	,'StageToNDS			','', 0,	11		,NULL,	GETDATE(), GETDATE())
, (42	,'StageToNDS_BESTPRACTICE		', '', 0,	11,	NULL,	GETDATE(), GETDATE())


GO

IF OBJECT_ID('[dbo].[DataFlow]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[DataFlow];
GO

CREATE TABLE [dbo].[DataFlow]
(
	DataFlowID			int PRIMARY KEY,
	DataFlowName		varchar(50),
	[Description]		varchar(4000),
	SourceTable			int,
	TargetTable			int,
	LSET				datetime,
	CET					datetime,
	PackageID			int,
	StatusID			int,
	CreatedDate			datetime,
	UpdatedDate			datetime,
	FOREIGN KEY (PackageID) REFERENCES  [dbo].[Packages] (PackageID),
	FOREIGN KEY (SourceTable) REFERENCES  [dbo].[Tables] (TableID),
	FOREIGN KEY (TargetTable) REFERENCES  [dbo].[Tables] (TableID),
	FOREIGN KEY (StatusID) REFERENCES  [dbo].[Status] (StatusID)
)

GO

INSERT INTO [dbo].[DataFlow] VALUES
--// Sale DDS
 (1,	'SALE_DDS_DimDataSource'				, '' ,94	 ,112	,'1900-01-01'	,'1900-01-01'	,1	 ,1	 ,GETDATE(),	GETDATE())
,(2,	'SALE_DDS_DimStore'						, '' ,90	 ,113	,'1900-01-01'	,'1900-01-01'	,1	 ,1	 ,GETDATE(),	GETDATE())
,(3,	'SALE_DDS_DimProductDepartmentGlobal'	, '' ,95	 ,114	,'1900-01-01'	,'1900-01-01'	,1	 ,1	 ,GETDATE(),	GETDATE())
,(4,	'SALE_DDS_DimProductGroupGlobal'		, '' ,96	 ,115	,'1900-01-01'	,'1900-01-01'	,1	 ,1	 ,GETDATE(),	GETDATE())
,(5,	'SALE_DDS_DimProductGlobal'				, '' ,97	 ,116	,'1900-01-01'	,'1900-01-01'	,1	 ,1	 ,GETDATE(),	GETDATE())
,(6,	'SALE_DDS_DimProductDepartment'			, '' ,84	 ,117	,'1900-01-01'	,'1900-01-01'	,1	 ,1	 ,GETDATE(),	GETDATE())
,(7,	'SALE_DDS_DimProductGroup'				, '' ,85	 ,118	,'1900-01-01'	,'1900-01-01'	,1	 ,1	 ,GETDATE(),	GETDATE())
,(8,	'SALE_DDS_DimProduct'					, '' ,83	 ,119	,'1900-01-01'	,'1900-01-01'	,1	 ,1	 ,GETDATE(),	GETDATE())
,(9,	'SALE_DDS_DimStaff'						, '' ,89	 ,120	,'1900-01-01'	,'1900-01-01'	,1	 ,1	 ,GETDATE(),	GETDATE())
,(10,	'SALE_DDS_DimCustomer'					, '' ,78	 ,121	,'1900-01-01'	,'1900-01-01'	,1	 ,1	 ,GETDATE(),	GETDATE())
,(11,	'SALE_DDS_DimScriptLink'				, '' ,88	 ,122	,'1900-01-01'	,'1900-01-01'	,1	 ,1	 ,GETDATE(),	GETDATE())
,(12,	'SALE_DDS_FactTransaction'				, '' ,92	 ,123	,'1900-01-01'	,'1900-01-01'	,1	 ,1	 ,GETDATE(),	GETDATE())
,(13,	'SALE_DDS_FactTransactionEntry'			, '' ,93	 ,124	,'1900-01-01'	,'1900-01-01'	,1	 ,1	 ,GETDATE(),	GETDATE())

--// Inventory DDS
--// UPDATE 2017-12-19
,(14,	'STOCK_VALUATION_DDS_DimDataSource'				, '' ,94	 ,126	,'1900-01-01'	,'1900-01-01'	,2	 ,1	 ,GETDATE(),	GETDATE())
,(15,	'STOCK_VALUATION_DDS_DimStore'					, '' ,90	 ,127	,'1900-01-01'	,'1900-01-01'	,2	 ,1	 ,GETDATE(),	GETDATE())
,(16,	'STOCK_VALUATION_DDS_DimProductDepartmentGlobal'	, '' ,95	 ,128	,'1900-01-01'	,'1900-01-01'	,2	 ,1	 ,GETDATE(),	GETDATE())
,(19,	'STOCK_VALUATION_DDS_DimProductDepartment'		, '' ,84	 ,131	,'1900-01-01'	,'1900-01-01'	,2	 ,1	 ,GETDATE(),	GETDATE())
,(17,	'STOCK_VALUATION_DDS_DimProductGroupGlobal'		, '' ,96	 ,129	,'1900-01-01'	,'1900-01-01'	,2	 ,1	 ,GETDATE(),	GETDATE())
,(20,	'STOCK_VALUATION_DDS_DimProductGroup'				, '' ,85	 ,132	,'1900-01-01'	,'1900-01-01'	,2	 ,1	 ,GETDATE(),	GETDATE())
,(18,	'STOCK_VALUATION_DDS_DimProductGlobal'			, '' ,97	 ,130	,'1900-01-01'	,'1900-01-01'	,2	 ,1	 ,GETDATE(),	GETDATE())
,(21,	'STOCK_VALUATION_DDS_DimProduct'					, '' ,83	 ,133	,'1900-01-01'	,'1900-01-01'	,2	 ,1	 ,GETDATE(),	GETDATE())
,(26,	'STOCK_VALUATION_DDS_DimSupplierGlobal'			, '' ,98	 ,138	,'1900-01-01'	,'1900-01-01'	,2	 ,1	 ,GETDATE(),	GETDATE())
,(27,	'STOCK_VALUATION_DDS_DimSupplier'					, '' ,91	 ,139	,'1900-01-01'	,'1900-01-01'	,2	 ,1	 ,GETDATE(),	GETDATE())
,(28,	'STOCK_VALUATION_DDS_DimDrug'						, '' ,80	 ,136	,'1900-01-01'	,'1900-01-01'	,2	 ,1	 ,GETDATE(),	GETDATE())
,(30,	'STOCK_VALUATION_DDS_FactStoctMovement'			, '' ,103	 ,142	,'1900-01-01'	,'1900-01-01'	,2	 ,1	 ,GETDATE(),	GETDATE())
,(40,	'STOCK_VALUATION_DDS_FactBusinessAuditHistory'	, '' ,162	 ,143	,'1900-01-01'	,'1900-01-01'	,2	 ,1	 ,GETDATE(),	GETDATE())

--// UPDATE 2017-11-28
INSERT INTO [dbo].[DataFlow] VALUES
(46,	'SALE_DDS_DimScript'						, '' ,88	 ,122	,'1900-01-01'	,'1900-01-01'	,1	 ,1	 ,GETDATE(),	GETDATE())

--// UPDATE 2017-12-28
INSERT INTO [dbo].[DataFlow] VALUES
(47,	'SALE_DDS_DimDrug'							, '' ,NULL	 ,NULL	,'1900-01-01'	,'1900-01-01'	,1	 ,1	 ,GETDATE(),	GETDATE())
,(48,	'SALE_DDS_DimDoctor'						, '' ,NULL	 ,NULL	,'1900-01-01'	,'1900-01-01'	,1	 ,1	 ,GETDATE(),	GETDATE())
,(49,	'SALE_DDS_DimPatient'						, '' ,NULL	 ,NULL	,'1900-01-01'	,'1900-01-01'	,1	 ,1	 ,GETDATE(),	GETDATE())
,(50,	'SALE_DDS_DimPharmacist'					, '' ,NULL	 ,NULL	,'1900-01-01'	,'1900-01-01'	,1	 ,1	 ,GETDATE(),	GETDATE())

--/******************************************************************
---------------------- STORE 1 - Autumn Place ***********************
--*******************************************************************/
----// OFFICE_DATABASE 
--,(1,	'OFFICE_Stage_NDS_Product'				, '',	25, 83, '1900-01-01', '1900-01-01', 4, 1, GETDATE(), GETDATE())
--,(2,	'OFFICE_Stage_NDS_ProductGroup'			, '',	17, 85, '1900-01-01', '1900-01-01', 4, 1, GETDATE(), GETDATE())
--,(3,	'OFFICE_Stage_NDS_ProductDepartment'	, '',	20, 84, '1900-01-01', '1900-01-01', 4, 1, GETDATE(), GETDATE())
--,(4,	'OFFICE_Stage_NDS_Transaction'			, '',	14, 93, '1900-01-01', '1900-01-01', 4, 1, GETDATE(), GETDATE())
--,(5,	'OFFICE_Stage_NDS_TransactionEntry'		, '',	15, 94, '1900-01-01', '1900-01-01', 4, 1, GETDATE(), GETDATE())
--,(6,	'OFFICE_Stage_NDS_Script'				, '',	31, 87, '1900-01-01', '1900-01-01', 4, 1, GETDATE(), GETDATE())
--,(7,	'OFFICE_Stage_NDS_Doctor'				, '',	21, 79, '1900-01-01', '1900-01-01', 4, 1, GETDATE(), GETDATE())
--,(9,	'OFFICE_Stage_NDS_Pharmacist'			, '',	28, 82, '1900-01-01', '1900-01-01', 4, 1, GETDATE(), GETDATE())
--,(10,	'OFFICE_Stage_NDS_Patient'				, '',	27, 81, '1900-01-01', '1900-01-01', 4, 1, GETDATE(), GETDATE())
--,(11,	'OFFICE_Stage_NDS_Drug'					, '',	22, 80, '1900-01-01', '1900-01-01', 4, 1, GETDATE(), GETDATE())
--,(12,	'OFFICE_Stage_NDS_Staff'				, '',	16, 90, '1900-01-01', '1900-01-01', 4, 1, GETDATE(), GETDATE())
--,(13,	'OFFICE_Stage_NDS_Customer'				, '',	19, 70, '1900-01-01', '1900-01-01', 4, 1, GETDATE(), GETDATE())
--,(14,	'OFFICE_Stage_NDS_Supplier'				, '',	33, 92, '1900-01-01', '1900-01-01', 4, 1, GETDATE(), GETDATE())
----// LOT_DATABASE
--,(15,	'LOTs_Stage_NDS_Product'				, '',	54, 83, '1900-01-01', '1900-01-01', 3, 1, GETDATE(), GETDATE())
--,(16,	'LOTs_Stage_NDS_ProductGroup'			, '',	47, 85, '1900-01-01', '1900-01-01', 3, 1, GETDATE(), GETDATE())
--,(17,	'LOTs_Stage_NDS_ProductDepartment'		, '',	34, 84, '1900-01-01', '1900-01-01', 3, 1, GETDATE(), GETDATE())
--,(19,	'LOTs_Stage_NDS_Transaction'			, '',	50, 93, '1900-01-01', '1900-01-01', 3, 1, GETDATE(), GETDATE())
--,(20,	'LOTs_Stage_NDS_TransactionEntry'		, '',	48, 94, '1900-01-01', '1900-01-01', 3, 1, GETDATE(), GETDATE())
--,(21,	'LOTs_Stage_NDS_ScriptLink'				, '',	51, 88, '1900-01-01', '1900-01-01', 3, 1, GETDATE(), GETDATE())
--,(22,	'LOTs_Stage_NDS_Staff'					, '',	52, 90, '1900-01-01', '1900-01-01', 2, 1, GETDATE(), GETDATE())
--,(23,	'LOTs_Stage_NDS_Customer'				, '',	45, 70, '1900-01-01', '1900-01-01', 2, 1, GETDATE(), GETDATE())
--,(24,	'LOTs_Stage_NDS_Supplier'				, '',	56, 92, '1900-01-01', '1900-01-01', 2, 1, GETDATE(), GETDATE())
----// POS
--,(25,	'POS_Stage_NDS_Product'					, '',	63, 83, '1900-01-01', '1900-01-01', 5, 1, GETDATE(), GETDATE())
--,(26,	'POS_Stage_NDS_ProductGroup'			, '',	60, 85, '1900-01-01', '1900-01-01', 5, 1, GETDATE(), GETDATE())
--,(27,	'POS_Stage_NDS_ProductDepartment'		, '',	62, 84, '1900-01-01', '1900-01-01', 5, 1, GETDATE(), GETDATE())
--,(28,	'POS_Stage_NDS_Transaction'				, '',	76, 93, '1900-01-01', '1900-01-01', 5, 1, GETDATE(), GETDATE())
--,(29,	'POS_Stage_NDS_TransactionEntry'		, '',	77, 94, '1900-01-01', '1900-01-01', 5, 1, GETDATE(), GETDATE())
--,(30,	'POS_Stage_NDS_Staff'					, '',	59, 90, '1900-01-01', '1900-01-01', 5, 1, GETDATE(), GETDATE())
--,(31,	'POS_Stage_NDS_Customer'				, '',	61, 70, '1900-01-01', '1900-01-01', 5, 1, GETDATE(), GETDATE())
--,(32,	'POS_Stage_NDS_Supplier'				, '',	71, 92, '1900-01-01', '1900-01-01', 5, 1, GETDATE(), GETDATE())

GO

IF OBJECT_ID('[dbo].[LogPackage]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[LogPackage];
GO

CREATE TABLE [dbo].[LogPackage]
(
	LogPackageID		int IDENTITY(1, 1),
	PackageID			int,
	CreatedTime			datetime,
	RunningStatus		varchar(20),
	FOREIGN KEY (PackageID) REFERENCES  [dbo].[Packages] (PackageID),
)

GO

----// Insert data for column
----// Metadata
--INSERT INTO [dbo].[Columns]
--SELECT DISTINCT 
--	 c.name AS 'ColumnName'
--	,CASE 
--		WHEN ty.name IN ('char', 'varchar', 'nvarchar')  THEN ty.name + '(' + CONVERT(varchar, c.max_length) + ')'
--		WHEN ty.name IN ('decimal', 'float')			 THEN ty.name + '(' + CONVERT(varchar, c.PRECISION) + ',' + CONVERT(varchar, c.SCALE) + ')'
--		ELSE ty.name
--	 END AS 'DataType'
--	,'' AS 'Description'
--	,CASE COALESCE(a.INDEX_COLUMN_ID, 0)    WHEN 0 THEN 'N' ELSE 'Y' END AS 'IsPK'
--	,CASE COALESCE(fkc.PARENT_COLUMN_ID, 0) WHEN 0 THEN 'N' ELSE 'Y' END AS 'IsFK'
--	,CASE c.IS_NULLABLE						WHEN 0 THEN 'N' ELSE 'Y' END AS 'IsNULL'
--	,CASE c.IS_IDENTITY						WHEN 0 THEN 'N' ELSE 'Y' END AS 'IsIdentity'
--	,NULL	AS 'SCDType'
--	,''		AS 'UnknownMember'
--	,''		AS 'ExampleValue'
--	,COALESCE(t2.TableID, 0) AS 'TableID'
--	,12		AS 'ColumnTypeID'
--	,GETDATE()	AS 'CreatedDate'
--	,GETDATE()	AS 'UpdatedDate'
--FROM 
--	[NDS_METADATA].[sys].[tables] t
--INNER JOIN 
--	[NDS_METADATA].[sys].[columns] c ON t.object_id = c.object_id
--INNER JOIN
--	[NDS_METADATA].[sys].[types] ty ON c.system_type_id = ty.system_type_id
--LEFT JOIN
--(
--	SELECT 
--		 i.object_id
--		,ic.index_column_id
--	FROM 
--		[NDS_METADATA].[sys].[indexes] i
--	INNER JOIN 
--		[NDS_METADATA].[sys].[index_columns] ic ON i.object_id = ic.object_id AND i.index_id = ic.index_id AND i.is_primary_key = 1
--) a ON t.object_id = a.object_id AND c.column_id = a.index_column_id
--LEFT OUTER JOIN 
--	[NDS_METADATA].[sys].[foreign_key_columns] fkc ON t.object_id = fkc.parent_object_id AND c.column_id = fkc.parent_column_id 
--LEFT OUTER JOIN 
--	[NDS_METADATA].[dbo].[Tables] t2 ON t.name = t2.TableName 
--WHERE 
--	t2.TableID IS NOT NULL
--AND
--	t2.DatabaseID =	1	--// NDS_METADATA
--AND
--	ty.name <> 'sysname'
--ORDER BY
--	TableID

----// Stage
--INSERT INTO [dbo].[Columns]
--SELECT DISTINCT 
--	 c.name AS 'ColumnName'
--	,CASE 
--		WHEN ty.name IN ('char', 'varchar', 'nvarchar')  THEN ty.name + '(' + CONVERT(varchar, c.max_length) + ')'
--		WHEN ty.name IN ('decimal', 'float')			 THEN ty.name + '(' + CONVERT(varchar, c.PRECISION) + ',' + CONVERT(varchar, c.SCALE) + ')'
--		ELSE ty.name
--	 END AS 'DataType'
--	,'' AS 'Description'
--	,CASE COALESCE(a.INDEX_COLUMN_ID, 0)    WHEN 0 THEN 'N' ELSE 'Y' END AS 'IsPK'
--	,CASE COALESCE(fkc.PARENT_COLUMN_ID, 0) WHEN 0 THEN 'N' ELSE 'Y' END AS 'IsFK'
--	,CASE c.IS_NULLABLE						WHEN 0 THEN 'N' ELSE 'Y' END AS 'IsNULL'
--	,CASE c.IS_IDENTITY						WHEN 0 THEN 'N' ELSE 'Y' END AS 'IsIdentity'
--	,NULL	AS 'SCDType'
--	,''		AS 'UnknownMember'
--	,''		AS 'ExampleValue'
--	,COALESCE(t2.TableID, 0) AS 'TableID'
--	,11		AS 'ColumnTypeID'
--	,GETDATE()	AS 'CreatedDate'
--	,GETDATE()	AS 'UpdatedDate'
--FROM 
--	[DW_STAGE].[sys].[tables] t
--INNER JOIN 
--	[DW_STAGE].[sys].[columns] c ON t.object_id = c.object_id
--INNER JOIN
--	[DW_STAGE].[sys].[types] ty ON c.system_type_id = ty.system_type_id
--LEFT OUTER JOIN
--(
--	SELECT 
--		 i.object_id
--		,ic.index_column_id
--	FROM 
--		[DW_STAGE].[sys].[indexes] i
--	INNER JOIN 
--		[DW_STAGE].[sys].[index_columns] ic ON i.object_id = ic.object_id AND i.index_id = ic.index_id AND i.is_primary_key = 1
--) a ON t.object_id = a.object_id AND c.column_id = a.index_column_id
--LEFT OUTER JOIN 
--	[DW_STAGE].[sys].[foreign_key_columns] fkc ON t.object_id = fkc.parent_object_id AND c.column_id = fkc.parent_column_id 
--LEFT OUTER JOIN
--	[NDS_METADATA].[dbo].[Tables] t2 ON t.name = t2.TableName 
--WHERE 
--	t2.TableID IS NOT NULL
--AND
--	t2.DatabaseID = 2	--// STAGING_DW
--AND
--	ty.name <> 'sysname'
--ORDER BY
--	TableID

----// NDS
--INSERT INTO [dbo].[Columns]
--SELECT DISTINCT 
--	 c.name AS 'ColumnName'
--	,CASE 
--		WHEN ty.name IN ('char', 'varchar', 'nvarchar')  THEN ty.name + '(' + CONVERT(varchar, c.max_length) + ')'
--		WHEN ty.name IN ('decimal', 'float')			 THEN ty.name + '(' + CONVERT(varchar, c.PRECISION) + ',' + CONVERT(varchar, c.SCALE) + ')'
--		ELSE ty.name
--	 END AS 'DataType'
--	,'' AS 'Description'
--	,CASE COALESCE(a.INDEX_COLUMN_ID, 0)    WHEN 0 THEN 'N' ELSE 'Y' END AS 'IsPK'
--	,CASE COALESCE(fkc.PARENT_COLUMN_ID, 0) WHEN 0 THEN 'N' ELSE 'Y' END AS 'IsFK'
--	,CASE c.IS_NULLABLE						WHEN 0 THEN 'N' ELSE 'Y' END AS 'IsNULL'
--	,CASE c.IS_IDENTITY						WHEN 0 THEN 'N' ELSE 'Y' END AS 'IsIdentity'
--	,NULL	AS 'SCDType'
--	,''		AS 'UnknownMember'
--	,''		AS 'ExampleValue'
--	,COALESCE(t2.TableID, 0) AS 'TableID'
--	,11		AS 'ColumnTypeID'
--	,GETDATE()	AS 'CreatedDate'
--	,GETDATE()	AS 'UpdatedDate'
--FROM 
--	[NDS_DW].[sys].[tables] t
--INNER JOIN 
--	[NDS_DW].[sys].[columns] c ON t.object_id = c.object_id
--INNER JOIN
--	[NDS_DW].[sys].[types] ty ON c.system_type_id = ty.system_type_id
--LEFT OUTER JOIN
--(
--	SELECT 
--		 i.object_id
--		,ic.index_column_id
--	FROM 
--		[NDS_DW].[sys].[indexes] i
--	INNER JOIN 
--		[NDS_DW].[sys].[index_columns] ic ON i.object_id = ic.object_id AND i.index_id = ic.index_id AND i.is_primary_key = 1
--) a ON t.object_id = a.object_id AND c.column_id = a.index_column_id
--LEFT OUTER JOIN 
--	[NDS_DW].[sys].[foreign_key_columns] fkc ON t.object_id = fkc.parent_object_id AND c.column_id = fkc.parent_column_id 
--LEFT OUTER JOIN
--	[NDS_METADATA].[dbo].[Tables] t2 ON t.name = t2.TableName 
--WHERE 
--	t2.TableID IS NOT NULL
--AND
--	t2.DatabaseID = 3	--// STAGING_DW
--AND
--	ty.name <> 'sysname'
--ORDER BY
--	TableID

----// Sale DDS
--INSERT INTO [dbo].[Columns]
--SELECT DISTINCT 
--	 c.name AS 'ColumnName'
--	,CASE 
--		WHEN ty.name IN ('char', 'varchar', 'nvarchar')  THEN ty.name + '(' + CONVERT(varchar, c.max_length) + ')'
--		WHEN ty.name IN ('decimal', 'float')			 THEN ty.name + '(' + CONVERT(varchar, c.PRECISION) + ',' + CONVERT(varchar, c.SCALE) + ')'
--		ELSE ty.name
--	 END AS 'DataType'
--	,'' AS 'Description'
--	,CASE COALESCE(a.INDEX_COLUMN_ID, 0)    WHEN 0 THEN 'N' ELSE 'Y' END AS 'IsPK'
--	,CASE COALESCE(fkc.PARENT_COLUMN_ID, 0) WHEN 0 THEN 'N' ELSE 'Y' END AS 'IsFK'
--	,CASE c.IS_NULLABLE						WHEN 0 THEN 'N' ELSE 'Y' END AS 'IsNULL'
--	,CASE c.IS_IDENTITY						WHEN 0 THEN 'N' ELSE 'Y' END AS 'IsIdentity'
--	,NULL	AS 'SCDType'
--	,''		AS 'UnknownMember'
--	,''		AS 'ExampleValue'
--	,COALESCE(t2.TableID, 0) AS 'TableID'
--	,11		AS 'ColumnTypeID'
--	,GETDATE()	AS 'CreatedDate'
--	,GETDATE()	AS 'UpdatedDate'
--FROM 
--	[Sale_DDS_DW].[sys].[tables] t
--INNER JOIN 
--	[Sale_DDS_DW].[sys].[columns] c ON t.object_id = c.object_id
--INNER JOIN
--	[Sale_DDS_DW].[sys].[types] ty ON c.system_type_id = ty.system_type_id
--LEFT OUTER JOIN
--(
--	SELECT 
--		 i.object_id
--		,ic.index_column_id
--	FROM 
--		[Sale_DDS_DW].[sys].[indexes] i
--	INNER JOIN 
--		[Sale_DDS_DW].[sys].[index_columns] ic ON i.object_id = ic.object_id AND i.index_id = ic.index_id AND i.is_primary_key = 1
--) a ON t.object_id = a.object_id AND c.column_id = a.index_column_id
--LEFT OUTER JOIN 
--	[Sale_DDS_DW].[sys].[foreign_key_columns] fkc ON t.object_id = fkc.parent_object_id AND c.column_id = fkc.parent_column_id 
--LEFT OUTER JOIN
--	[NDS_METADATA].[dbo].[Tables] t2 ON t.name = t2.TableName 
--WHERE 
--	t2.TableID IS NOT NULL
--AND
--	t2.DatabaseID = 4	--// SALE_DDS_DW
--AND
--	ty.name <> 'sysname'
--ORDER BY
--	TableID

--GO

----// Inventory DDS
--INSERT INTO [dbo].[Columns]
--SELECT DISTINCT 
--	 c.name AS 'ColumnName'
--	,CASE 
--		WHEN ty.name IN ('char', 'varchar', 'nvarchar')  THEN ty.name + '(' + CONVERT(varchar, c.max_length) + ')'
--		WHEN ty.name IN ('decimal', 'float')			 THEN ty.name + '(' + CONVERT(varchar, c.PRECISION) + ',' + CONVERT(varchar, c.SCALE) + ')'
--		ELSE ty.name
--	 END AS 'DataType'
--	,'' AS 'Description'
--	,CASE COALESCE(a.INDEX_COLUMN_ID, 0)    WHEN 0 THEN 'N' ELSE 'Y' END AS 'IsPK'
--	,CASE COALESCE(fkc.PARENT_COLUMN_ID, 0) WHEN 0 THEN 'N' ELSE 'Y' END AS 'IsFK'
--	,CASE c.IS_NULLABLE						WHEN 0 THEN 'N' ELSE 'Y' END AS 'IsNULL'
--	,CASE c.IS_IDENTITY						WHEN 0 THEN 'N' ELSE 'Y' END AS 'IsIdentity'
--	,NULL	AS 'SCDType'
--	,''		AS 'UnknownMember'
--	,''		AS 'ExampleValue'
--	,COALESCE(t2.TableID, 0) AS 'TableID'
--	,11		AS 'ColumnTypeID'
--	,GETDATE()	AS 'CreatedDate'
--	,GETDATE()	AS 'UpdatedDate'
--FROM 
--	[Inventory_DDS_DW].[sys].[tables] t
--INNER JOIN 
--	[Inventory_DDS_DW].[sys].[columns] c ON t.object_id = c.object_id
--INNER JOIN
--	[Inventory_DDS_DW].[sys].[types] ty ON c.system_type_id = ty.system_type_id
--LEFT OUTER JOIN
--(
--	SELECT 
--		 i.object_id
--		,ic.index_column_id
--	FROM 
--		[Inventory_DDS_DW].[sys].[indexes] i
--	INNER JOIN 
--		[Inventory_DDS_DW].[sys].[index_columns] ic ON i.object_id = ic.object_id AND i.index_id = ic.index_id AND i.is_primary_key = 1
--) a ON t.object_id = a.object_id AND c.column_id = a.index_column_id
--LEFT OUTER JOIN 
--	[Inventory_DDS_DW].[sys].[foreign_key_columns] fkc ON t.object_id = fkc.parent_object_id AND c.column_id = fkc.parent_column_id 
--LEFT OUTER JOIN
--	[NDS_METADATA].[dbo].[Tables] t2 ON t.name = t2.TableName 
--WHERE 
--	t2.TableID IS NOT NULL
--AND
--	t2.DatabaseID = 5	--// INVENTORY_DDS_DW
--AND
--	ty.name <> 'sysname'
--ORDER BY
--	TableID

 GO
--// ****************************************************************************************
--// StoredProcedure
--// ****************************************************************************************
CREATE PROCEDURE [dbo].[p_getMetadataLSET]
	@DataFlowID		bigint
AS
BEGIN
	SELECT
		LSET
	FROM
		[dbo].[DataFlow] WITH (NOLOCK)
	WHERE
		DataFlowID = @DataFlowID
END


GO

CREATE PROC [dbo].[p_setMetadataCET]
	 @DataFlowID	int
	,@CET			datetime
AS
BEGIN
	UPDATE
		[dbo].[DataFlow]
	SET
		CET = @CET
	WHERE
		DataFlowID = @DataFlowID
END


/* ****************************************
*	Trigger Update ServerStatus
*
**************************************** */
USE NDS_METADATA
GO
CREATE TRIGGER dbo.ServerStatus_UpdatedTime
ON dbo.ServerStatus
AFTER UPDATE
AS
BEGIN
	/*
		Check if this is an update action on ServerStatus
			Update the current time of UpdatedDate column
	*/
	UPDATE dbo.ServerStatus
	SET UpdatedDate = GETDATE()
	FROM dbo.ServerStatus ss
	WHERE EXISTS(SELECT 1 FROM inserted i WHERE i.ServerStatusID=ss.ServerStatusID)
END
