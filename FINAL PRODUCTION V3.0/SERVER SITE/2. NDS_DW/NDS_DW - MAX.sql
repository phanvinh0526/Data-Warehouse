USE [master]
GO

IF EXISTS(SELECT 1 FROM [sys].[databases] WHERE name ='NDS_DW')
	DROP DATABASE [NDS_DW]
GO

CREATE DATABASE [NDS_DW]
GO

USE [NDS_DW]
GO

--// Table [DataSource]
IF OBJECT_ID('[dbo].[DataSource]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[DataSource]
GO

CREATE TABLE [dbo].[DataSource]
(
	DataSourceKey	bigint PRIMARY KEY,
	DataSourceID	int,
	DataSourceName	varchar(MAX),
	CurrentFlag		bit,
	EffectiveDate	datetime,
	CreatedDate		datetime,
	UpdatedDate		datetime,
)
GO

INSERT INTO [dbo].[DataSource] (DataSourceKey,DataSourceID,DataSourceName,CurrentFlag ,EffectiveDate,CreatedDate,UpdatedDate) VALUES 
 (0, 0, 'Unknown', 1, '2000-01-01', '2000-01-01','2000-01-01')
,(1, 1, 'LOTs', 1, '2000-01-01', '2000-01-01','2000-01-01')
,(2, 2, 'FRED OFFICE', 1, '2000-01-01', '2000-01-01','2000-01-01')
,(3, 3, 'FRED POS', 1, '2000-01-01', '2000-01-01','2000-01-01')
,(4, 4, 'FRED DISPENSE', 1, '2000-01-01', '2000-01-01','2000-01-01')
,(5, 5, 'FRED CONNECT', 1, '2000-01-01', '2000-01-01','2000-01-01')
,(6, 6, 'BEST PRACTICE', 1, '2000-01-01', '2000-01-01','2000-01-01')

--// Table [Store]
IF OBJECT_ID('[dbo].[Store]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[Store]
GO

CREATE TABLE [dbo].[Store]
(
	StoreKey		bigint IDENTITY(1,1) PRIMARY KEY,
	StoreID			int,
	StoreName		varchar(MAX),
	--StoreCode		varchar(30),
	--StoreAddress	varchar(MAX),
	--City			varchar(MAX),
	--Region			varchar(MAX),
	--[State]			varchar(MAX),
	--Country			varchar(MAX),
	--Zip				varchar(MAX),
	--FaxNumber		varchar(MAX),
	--PhoneNumber		varchar(MAX),
	CurrentFlag		bit,
	EffectiveDate	datetime,
	ParentStoreKey	bigint,
	CreatedDate		datetime,
	UpdatedDate		datetime,
	FOREIGN KEY (ParentStoreKey) REFERENCES  [dbo].[Store] (StoreKey)
)
GO

SET IDENTITY_INSERT [dbo].[Store] ON

INSERT INTO [dbo].[Store] (StoreKey,StoreID,StoreName,CurrentFlag ,EffectiveDate,ParentStoreKey,CreatedDate,UpdatedDate)
VALUES (0, 0, 'Unknown', 1, '2000-01-01', NULL, '2000-01-01','2000-01-01')

SET IDENTITY_INSERT [dbo].[Store] OFF

--// Table [ProductAliasGlobal]
IF OBJECT_ID('[dbo].[ProductAliasGlobal]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[ProductAliasGlobal]
GO

CREATE TABLE [dbo].[ProductAliasGlobal]
(
	ProductAliasHQID		bigint PRIMARY KEY,
	ProductGlobalHQID		bigint,
	Barcode					nvarchar(20),
	LastApplied				datetime,
	LastUpdated				datetime,
	LastRemoved				datetime,
	IsFREDDrugCode			bit,
	CurrentFlag				bit,
	EffectiveDate			datetime,
	CreatedDate				datetime,
	UpdatedDate				datetime,
)
GO

INSERT INTO [dbo].[ProductAliasGlobal] (ProductAliasHQID,ProductGlobalHQID,Barcode,CurrentFlag,EffectiveDate,CreatedDate,UpdatedDate)
VALUES (0, 0, 'Unknown', 1, '2000-01-01','2000-01-01','2000-01-01')

--// Table [ProductDepartmentGlobal]
IF OBJECT_ID('[dbo].[ProductDepartmentGlobal]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[ProductDepartmentGlobal]
GO

CREATE TABLE [dbo].[ProductDepartmentGlobal]
(
	ProductDepartmentGlobalHQID	bigint PRIMARY KEY,
	ProductDepartmentGlobalName	nvarchar(MAX),
	CurrentFlag					bit,
	EffectiveDate				datetime,
	CreatedDate					datetime,
	UpdatedDate					datetime,
)
GO

INSERT INTO [dbo].[ProductDepartmentGlobal] (ProductDepartmentGlobalHQID,ProductDepartmentGlobalName,CurrentFlag,EffectiveDate,CreatedDate,UpdatedDate)
VALUES (0, 'Unknown', 1, '2000-01-01','2000-01-01','2000-01-01')

--// Table [ProductGroupGlobal]
IF OBJECT_ID('[dbo].[ProductGroupGlobal]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[ProductGroupGlobal]
GO

CREATE TABLE [dbo].[ProductGroupGlobal]
(
	ProductGroupGlobalHQID		bigint PRIMARY KEY,
	ProductGroupGlobalName		nvarchar(MAX),
	CurrentFlag					bit,
	EffectiveDate				datetime,
	ProductDepartmentGlobalHQID	bigint,
	CreatedDate					datetime,
	UpdatedDate					datetime,
	FOREIGN KEY (ProductDepartmentGlobalHQID) REFERENCES  [dbo].[ProductDepartmentGlobal] (ProductDepartmentGlobalHQID)
)
GO

INSERT INTO [dbo].[ProductGroupGlobal] (ProductGroupGlobalHQID,ProductGroupGlobalName,CurrentFlag,EffectiveDate,ProductDepartmentGlobalHQID,CreatedDate,UpdatedDate)
VALUES ( 0, 'Unknown', 1, '2000-01-01', 0, '2000-01-01','2000-01-01')

--// Table [ProductGlobal]
IF OBJECT_ID('[dbo].[ProductGlobal]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[ProductGlobal]
GO

CREATE TABLE [dbo].[ProductGlobal]
(
	ProductGlobalHQID			bigint PRIMARY KEY,
	ProductGlobalDescription	nvarchar(MAX),
	ItemnotDiscountable			bit,
	Sale_TAX					float,
	GST_TAX						char(1),
	CurrentFlag					bit,
	EffectiveDate				datetime,
	ProductGroupGlobalHQID		bigint,
	CreatedDate					datetime,
	UpdatedDate					datetime,
	FOREIGN KEY (ProductGroupGlobalHQID) REFERENCES  [dbo].[ProductGroupGlobal] (ProductGroupGlobalHQID)
)
GO

INSERT INTO [dbo].[ProductGlobal](ProductGlobalHQID,ProductGlobalDescription,CurrentFlag,EffectiveDate,ProductGroupGlobalHQID,CreatedDate,UpdatedDate)
VALUES ( 0, 'Unknown', 1, '2000-01-01', 0, '2000-01-01','2000-01-01')


--// Table [SupplierGlobal]
IF OBJECT_ID('[dbo].[SupplierGlobal]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[SupplierGlobal]
GO

CREATE TABLE [dbo].[SupplierGlobal]
(
	SupplierGlobalHQID		bigint PRIMARY KEY,
	SupplierGlobalName		nvarchar(MAX),
	ContactName				nvarchar(MAX),
	[Address]				nvarchar(MAX),
	[State]					nvarchar(MAX),
	City					nvarchar(MAX),
	PhoneNumber				nvarchar(MAX),
	FaxNumber				nvarchar(MAX),
	TaxNumber				nvarchar(MAX),
	PostCode				nvarchar(MAX),
	Email					nvarchar(MAX),
	CurrentFlag				bit,
	EffectiveDate			datetime,
	CreatedDate				datetime,
	UpdatedDate				datetime
)
GO

INSERT INTO [dbo].[SupplierGlobal] (SupplierGlobalHQID,SupplierGlobalName,CurrentFlag,EffectiveDate,CreatedDate,UpdatedDate)
VALUES ( 0, 'Unknown', 1, '2000-01-01', '2000-01-01','2000-01-01')

--// Table [Barcode]
IF OBJECT_ID('[dbo].[Barcode]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[Barcode]
GO

CREATE TABLE [dbo].[Barcode]
(
	BarcodeKey			bigint IDENTITY(1,1) PRIMARY KEY,
	BarcodeID			bigint,
	ProductID			bigint,
	Barcode				nvarchar(1000),
	CurrentFlag			bit,
	EffectiveDate		datetime,
	StoreKey			bigint,
	DataSourceKey		bigint,
	CreatedDate			datetime,
	UpdatedDate			datetime,
	FOREIGN KEY (DataSourceKey) REFERENCES  [dbo].[DataSource] (DataSourceKey),
	FOREIGN KEY (StoreKey) REFERENCES  [dbo].[Store] (StoreKey)
)
GO

SET IDENTITY_INSERT [dbo].[Barcode] ON

INSERT INTO [dbo].[Barcode] (BarcodeKey,BarcodeID,ProductID, Barcode,CurrentFlag ,EffectiveDate, StoreKey, DataSourceKey, CreatedDate,UpdatedDate)
VALUES (0, 0, 0, 'Unknown', 1, '2000-01-01', 0, 0, '2000-01-01','2000-01-01')

SET IDENTITY_INSERT [dbo].[Barcode] OFF

GO

--// Table [Register]
IF OBJECT_ID('[dbo].[Register]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[Register]
GO

CREATE TABLE [dbo].[Register]
(
	RegisterKey			bigint IDENTITY(1,1) PRIMARY KEY,
	RegisterID			bigint,
	Created				datetime,
	Modified			datetime,
	IsDefault			int,
	RecordStatus		bigint,
	[Description]		nvarchar(MAX),
	RegisterNumber		int,
	CurrentFlag			bit,
	EffectiveDate		datetime,
	StoreKey			bigint,
	DataSourceKey		bigint,
	CreatedDate			datetime,
	UpdatedDate			datetime,
	FOREIGN KEY (DataSourceKey) REFERENCES  [dbo].[DataSource] (DataSourceKey),
	FOREIGN KEY (StoreKey) REFERENCES  [dbo].[Store] (StoreKey)
)
GO

SET IDENTITY_INSERT [dbo].[Register] ON

INSERT INTO [dbo].[Register] (RegisterKey,RegisterID,CurrentFlag ,EffectiveDate, StoreKey, DataSourceKey, CreatedDate,UpdatedDate)
VALUES (0, 0, 1, '2000-01-01', 0, 0, '2000-01-01','2000-01-01')

SET IDENTITY_INSERT [dbo].[Register] OFF

--// Table [Batch]
IF OBJECT_ID('[dbo].[Batch]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[Batch]
GO

CREATE TABLE [dbo].[Batch]
(
	BatchKey					bigint IDENTITY(1,1) PRIMARY KEY,
	BatchID						bigint,
	Created						datetime,
	Modified					datetime,
	RecordStatus				bigint,
	AbortedTransactionCount		int,
	BatchNumber					int,
	BatchStatus					int,
	CashBackSurcharge			decimal(28, 10),
	ClosingTime					datetime,
	ClosingTotal				decimal(28, 10),
	Comments					nvarchar(MAX),
	CostOfGoods					decimal(28, 10),
	CustomerCount				int,
	CustomerDepositMade			decimal(28, 10),
	CustomerDepositRedeemed		decimal(28, 10),
	DebitSurcharge				decimal(28, 10),
	Discounts					decimal(28, 10),
	Dropped						decimal(28, 10),
	GovernmentRecovery			decimal(28, 10),
	LayawayClosed				decimal(28, 10),
	LayawayPaid					decimal(28, 10),
	Locked						datetime,
	NoSalesCount				int,
	OpeningTime					datetime,
	OpeningTotal				decimal(28, 10),
	OverUnder					decimal(28, 10),
	PaidOnAccount				decimal(28, 10),
	PaidOut						decimal(28, 10),
	PaidToAccount				decimal(28, 10),
	[Returns]					decimal(28, 10),	
	Sales						decimal(28, 10),
	SalesPlusTax				decimal(28, 10),
	Tax							decimal(28, 10),
	TenderRoundingError			decimal(28, 10),
	TotalChange					decimal(28, 10),
	TotalTendered				decimal(28, 10),
	CurrentFlag					bit,
	EffectiveDate				datetime,
	StoreKey					bigint,
	DataSourceKey				bigint,
	RegisterKey					bigint,
	CreatedDate					datetime,
	UpdatedDate					datetime,
	FOREIGN KEY (DataSourceKey) REFERENCES  [dbo].[DataSource] (DataSourceKey),
	FOREIGN KEY (StoreKey) REFERENCES  [dbo].[Store] (StoreKey),
	FOREIGN KEY (RegisterKey) REFERENCES  [dbo].[Register] (RegisterKey)
)
GO

SET IDENTITY_INSERT [dbo].[Batch] ON

INSERT INTO [dbo].[Batch] (BatchKey,BatchID,CurrentFlag ,EffectiveDate, StoreKey, DataSourceKey, RegisterKey, CreatedDate,UpdatedDate)
VALUES (0, 0, 1, '2000-01-01', 0, 0, 0, '2000-01-01','2000-01-01')

SET IDENTITY_INSERT [dbo].[Batch] OFF

--// Table [NursingHome]
IF OBJECT_ID('[dbo].[NursingHome]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[NursingHome]
GO

CREATE TABLE [dbo].[NursingHome]
(				
	NursingHomeKey						bigint IDENTITY(1,1) PRIMARY KEY,
	NursingHomeID						bigint,	
	Created								datetime,
	Modified							datetime,
	AccountCategory						nvarchar(MAX),
	AddressLine1						nvarchar(MAX),
	AddressLine2						nvarchar(MAX),
	AddressState						nvarchar(MAX),
	AlternateAddress					nvarchar(MAX),	
	AlternateSuburb						nvarchar(MAX),
	AutoCreateAccount					bit,
	AutoCreateNursingHomeAccount		bit,
	AutoCreatePatientAccount			bit,
	AutomaticallyPrintInvoice			bit,
	City								nvarchar(MAX),
	Code								nvarchar(MAX),
	Company								nvarchar(MAX),
	DefaultPrivateFee					decimal(28, 10),
	DefaultPrivateMarkup				decimal(28, 10),
	DefaultScriptType					nvarchar(MAX),
	EmailAddress						nvarchar(MAX),
	EndServicingDate					datetime,
	ExcludeRequired						nvarchar(MAX),
	FaxNumber							nvarchar(MAX),
	FirstName							nvarchar(MAX),
	GSTIncluded							bit,
	GroupedDescription					nvarchar(MAX),
	IsANursingHome						bit,
	LastName							nvarchar(MAX),
	MobileNumber						nvarchar(MAX),
	PackOldFormat						nvarchar(MAX),
	PackRequiresPrn						bit,
	PackSigningRequired					bit,
	PackSlot							decimal(28, 10),
	PackTimeSlot1						nvarchar(MAX),
	PackTimeSlot2						nvarchar(MAX),
	PackTimeSlot3						nvarchar(MAX),
	PackTimeSlot4						nvarchar(MAX),
	PackTimeSlot5						nvarchar(MAX),
	PackTimeSlot6						nvarchar(MAX),
	PackTimeSlot7						nvarchar(MAX),
	PackTimeSlot8						nvarchar(MAX),
	PackToDate							datetime,
	PackUnitDose						bit,
	PackWebsterSystem					bit,
	PackingStartOfWeek					decimal(28, 10),
	PackingType							nvarchar(MAX),
	PhoneNumber							nvarchar(MAX),
	PostCode							nvarchar(MAX),
	Reminderice							bit,
	RepatToSafetyNet					bit,
	StartServicingDate					datetime,
	Title								nvarchar(MAX),
	UseNursingHomeAddress				nvarchar(MAX),
	Web									nvarchar(MAX),
	CurrentFlag							bit,
	EffectiveDate						datetime,
	StoreKey							bigint,
	DataSourceKey						bigint,
	CreatedDate							datetime,
	UpdatedDate							datetime,
	FOREIGN KEY (DataSourceKey) REFERENCES  [dbo].[DataSource] (DataSourceKey),
	FOREIGN KEY (StoreKey) REFERENCES  [dbo].[Store] (StoreKey)
)
GO

SET IDENTITY_INSERT [dbo].[NursingHome] ON

INSERT INTO [dbo].[NursingHome] (NursingHomeKey,NursingHomeID,CurrentFlag ,EffectiveDate, StoreKey, DataSourceKey, CreatedDate,UpdatedDate)
VALUES (0, 0, 1, '2000-01-01', 0, 0, '2000-01-01','2000-01-01')

SET IDENTITY_INSERT [dbo].[NursingHome] OFF

--// Table [ProductDepartment]
IF OBJECT_ID('[dbo].[ProductDepartment]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[ProductDepartment]
GO

CREATE TABLE [dbo].[ProductDepartment]
(
	ProductDepartmentKey		bigint IDENTITY(1,1) PRIMARY KEY,
	ProductDepartmentID			bigint,
	Created						datetime,
	Modified					datetime,
	ProductDepartmentName		nvarchar(MAX),
	ProductDepartmentCode		nvarchar(MAX),
	CurrentFlag					bit,
	EffectiveDate				datetime,
	StoreKey					bigint,
	DataSourceKey				bigint,
	ProductDepartmentGlobalHQID	bigint,
	CreatedDate					datetime,
	UpdatedDate					datetime,
	FOREIGN KEY (DataSourceKey) REFERENCES  [dbo].[DataSource] (DataSourceKey),
	--FOREIGN KEY (ProductDepartmentGlobalHQID) REFERENCES  [dbo].[ProductDepartmentGlobal] (ProductDepartmentGlobalHQID),
	FOREIGN KEY (StoreKey) REFERENCES  [dbo].[Store] (StoreKey)
)
GO

SET IDENTITY_INSERT [dbo].[ProductDepartment] ON

INSERT INTO [dbo].[ProductDepartment] (ProductDepartmentKey,ProductDepartmentID,ProductDepartmentName,ProductDepartmentCode,CurrentFlag,EffectiveDate,StoreKey,ProductDepartmentGlobalHQID, CreatedDate,UpdatedDate)
VALUES (0, 0, 'Unknown', 'Unknown', 1, '2000-01-01', 0, 0, '2000-01-01','2000-01-01')

SET IDENTITY_INSERT [dbo].[ProductDepartment] OFF

--// Table [ProductGroup]
IF OBJECT_ID('[dbo].[ProductGroup]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[ProductGroup]
GO

CREATE TABLE [dbo].[ProductGroup]
(
	ProductGroupKey			bigint IDENTITY(1,1) PRIMARY KEY,
	ProductGroupID			bigint,
	Created					datetime,
	Modified				datetime,
	ProductGroupName		nvarchar(MAX),
	ProductGroupCode		nvarchar(MAX),
	GST						float,
	RegularDiscount			float,
	ExtraDiscount			float,
	Intensive				bit,
	CurrentFlag				bit,
	EffectiveDate			datetime,
	ProductDepartmentKey	bigint,
	StoreKey				bigint,
	DataSourceKey			bigint,
	ProductGroupGlobalHQID	bigint,
	CreatedDate				datetime,
	UpdatedDate				datetime,
	FOREIGN KEY (DataSourceKey) REFERENCES  [dbo].[DataSource] (DataSourceKey),
	FOREIGN KEY (ProductDepartmentKey) REFERENCES  [dbo].[ProductDepartment] (ProductDepartmentKey),
	--FOREIGN KEY (ProductGroupGlobalHQID) REFERENCES  [dbo].[ProductGroupGlobal] (ProductGroupGlobalHQID),
	FOREIGN KEY (StoreKey) REFERENCES  [dbo].[Store] (StoreKey) 
)
GO

SET IDENTITY_INSERT [dbo].[ProductGroup] ON

INSERT INTO [dbo].[ProductGroup] (ProductGroupKey,ProductGroupID,ProductGroupName,ProductGroupCode,GST,RegularDiscount,ExtraDiscount,Intensive,CurrentFlag,EffectiveDate,ProductDepartmentKey,StoreKey,ProductGroupGlobalHQID,CreatedDate,UpdatedDate)
VALUES (0, 0, 'Unknown', 'Unknown', 0, 0, 0, 0, 1, '2000-01-01', 0, 0, 0, '2000-01-01','2000-01-01')

SET IDENTITY_INSERT [dbo].[ProductGroup] OFF

GO
--// Table [Product]
IF OBJECT_ID('[dbo].[Product]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[Product]
GO

CREATE TABLE [dbo].[Product]
(
	ProductKey				bigint IDENTITY(1,1) PRIMARY KEY,
	ProductID				bigint,
	Created					datetime,
	Modified				datetime,
	ProductName				nvarchar(MAX),
	ProductCode				nvarchar(MAX),
	NoDiscount				bit,
	SOH						float,
	MTD						float,
	SOO						float,
	ValueMTD				float,
	QuantityCommitted		float,
	Tax						decimal(28, 10),
	IsTester				bit,
	Retail					decimal(28, 10),
	Cost					decimal(28, 10),
	RealCost				float,
	DateCreated				datetime,
	PLU						nvarchar(MAX),
	GSTGroupName			nvarchar(MAX),
	GSTTypeName				nvarchar(MAX),
	SaleTax					float,
	CurrentFlag				bit,
	EffectiveDate			datetime,
	ItemType				int,
	ProductGroupKey			bigint,
	ProductDepartmentKey	bigint,
	ProductTaxKey			bigint,
	SupplierKey				bigint,
	StoreKey				bigint,
	ProductGlobalHQID		bigint,
	DataSourceKey			bigint,
	CreatedDate				datetime,
	UpdatedDate				datetime,
	FOREIGN KEY (DataSourceKey) REFERENCES  [dbo].[DataSource] (DataSourceKey),
	FOREIGN KEY (ProductGroupKey) REFERENCES  [dbo].[ProductGroup] (ProductGroupKey),
	FOREIGN KEY (ProductDepartmentKey) REFERENCES  [dbo].[ProductDepartment] (ProductDepartmentKey),
	FOREIGN KEY (StoreKey) REFERENCES  [dbo].[Store] (StoreKey)
)
GO

SET IDENTITY_INSERT [dbo].[Product] ON

INSERT INTO [dbo].[Product](ProductKey,ProductID,ProductName,CurrentFlag,EffectiveDate,ProductGroupKey,ProductTaxKey,StoreKey,ProductGlobalHQID,ProductDepartmentKey,CreatedDate,UpdatedDate)
VALUES (0, 0, 'Unknown', 1, '2000-01-01', 0, 0, 0, 0, 0, '2000-01-01','2000-01-01')

SET IDENTITY_INSERT [dbo].[Product] OFF

--// Table [LotsProductHistory]
IF OBJECT_ID('[dbo].[LotsProductHistory]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[LotsProductHistory]
GO
CREATE TABLE [dbo].[LotsProductHistory]
(
	LotsProductHistoryKey	bigint IDENTITY(1,1) PRIMARY KEY,
	ProductKey				bigint,
	ProductID				bigint,
	ProductName				nvarchar(MAX),
	NoDiscount				bit,
	SOH						float,
	MTD						float,
	SOO						float,
	ValueMTD				float,
	Tax						decimal(28, 10),
	Retail					decimal(28, 10),
	Cost					decimal(28, 10),
	RealCost				float,
	DateCreated				datetime,
	PLU						nvarchar(MAX),
	SaleTax					float,
	CurrentFlag				bit,
	EffectiveDate			datetime,
	ProductGroupKey			bigint,
	ProductDepartmentKey	bigint,
	ProductGlobalHQID		bigint,
	DataSourceKey			bigint,
	StoreKey				bigint,
	AuditDate				datetime,
	AuditDay				smallint,
	AuditMonth				smallint,
	AuditYear				smallint
	FOREIGN KEY (StoreKey) REFERENCES  [dbo].[Store] (StoreKey)
)
GO

--// Table [Staff]
IF OBJECT_ID('[dbo].[Staff]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[Staff]
GO

CREATE TABLE [dbo].[Staff]
(
	StaffKey				bigint IDENTITY(1,1) PRIMARY KEY,
	StaffID					bigint,
	Created					datetime,
	Modified				datetime,
	StaffName				nvarchar(MAX),
	StaffNumber				nvarchar(MAX),
	StaffManager			int,
	InactiveStaff			int,
	SecurityLevel			int,
	CurrentFlag				bit,
	EffectiveDate			datetime,
	StoreKey				bigint,
	DataSourceKey			bigint,
	CreatedDate				datetime,
	UpdatedDate				datetime,
	FOREIGN KEY (DataSourceKey) REFERENCES  [dbo].[DataSource] (DataSourceKey),
	FOREIGN KEY (StoreKey) REFERENCES  [dbo].[Store] (StoreKey) 
)
GO

SET IDENTITY_INSERT [dbo].[Staff] ON

INSERT INTO [dbo].[Staff](StaffKey,StaffID,StaffName,StaffNumber,StaffManager,InactiveStaff,SecurityLevel,CurrentFlag,EffectiveDate,StoreKey,CreatedDate,UpdatedDate)
VALUES (0, 0, 'Unknown', 'Unknown', 0, 0, 0, 1, '2000-01-01', 0, '2000-01-01','2000-01-01')

SET IDENTITY_INSERT [dbo].[Staff] OFF

--// Table [Customer]
IF OBJECT_ID('[dbo].[Customer]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[Customer]
GO

CREATE TABLE [dbo].[Customer]
(
	CustomerKey				bigint IDENTITY(1,1) PRIMARY KEY,
	CustomerID				bigint,
	Created					datetime,
	Modified				datetime,
	FirstName				nvarchar(MAX),
	LastName				nvarchar(MAX),
	Title					nvarchar(MAX),
	[Address]				nvarchar(MAX),
	Suburb					nvarchar(MAX),
	City					nvarchar(MAX),
	PostCode				nvarchar(MAX),
	PhoneNumber				nvarchar(MAX),
	Birthdate				datetime,
	Email					nvarchar(MAX),
	Gender					bit,
	CurrentFlag				bit,
	EffectiveDate			datetime,
	StoreKey				bigint,
	DataSourceKey			bigint,
	CreatedDate				datetime,
	UpdatedDate				datetime,
	FOREIGN KEY (DataSourceKey) REFERENCES  [dbo].[DataSource] (DataSourceKey),
	FOREIGN KEY (StoreKey) REFERENCES  [dbo].[Store] (StoreKey) 
)
GO

SET IDENTITY_INSERT [dbo].[Customer] ON

INSERT INTO [dbo].[Customer] (CustomerKey,CustomerID,FirstName,LastName,Title,[Address],Suburb,City,PostCode,PhoneNumber,Birthdate,Email,Gender,CurrentFlag,EffectiveDate,StoreKey,CreatedDate,UpdatedDate)
VALUES (0, 0, 'Unknown', 'Unknown', 'Unknown', 'Unknown', 'Unknown', 'Unknown', 'Unknown', 'Unknown', '2000-01-01', 'Unknown', 0, 1, '2000-01-01', 0, '2000-01-01','2000-01-01')

SET IDENTITY_INSERT [dbo].[Customer] OFF

--// Table [Doctor]
IF OBJECT_ID('[dbo].[Doctor]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[Doctor]
GO

CREATE TABLE [dbo].[Doctor]
(
	DoctorKey				bigint IDENTITY(1,1) PRIMARY KEY,
	DoctorID				bigint,
	Created					datetime,
	Modified				datetime,
	DoctorCode				nvarchar(MAX),
	FirstName				nvarchar(MAX),
	LastName				nvarchar(MAX),
	[Address]				nvarchar(MAX),
	Suburb					nvarchar(MAX),
	PostCode				nvarchar(MAX),
	PhoneNumber				nvarchar(MAX),
	FaxNumber				nvarchar(MAX),
	Email					nvarchar(MAX),
	PrescriberNumber		bigint,
	CurrentFlag				bit,
	EffectiveDate			datetime,
	StoreKey				bigint,
	DataSourceKey			bigint,
	CreatedDate				datetime,
	UpdatedDate				datetime,
	FOREIGN KEY (DataSourceKey) REFERENCES  [dbo].[DataSource] (DataSourceKey),
	FOREIGN KEY (StoreKey) REFERENCES  [dbo].[Store] (StoreKey) 
)
GO

SET IDENTITY_INSERT [dbo].[Doctor] ON

INSERT INTO [dbo].[Doctor] (DoctorKey,DoctorID,DoctorCode,FirstName,LastName,[Address],Suburb,PostCode,PhoneNumber,FaxNumber,Email,PrescriberNumber,CurrentFlag,EffectiveDate,StoreKey,CreatedDate,UpdatedDate)
VALUES (0, 0, 'Unknown', 'Unknown', 'Unknown', 'Unknown', 'Unknown', 'Unknown', 'Unknown', 'Unknown', 'Unknown', 0, 1, '2000-01-01', 0, '2000-01-01','2000-01-01')

SET IDENTITY_INSERT [dbo].[Doctor] OFF

--// Table [Drug]
IF OBJECT_ID('[dbo].[Drug]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[Drug]
GO

CREATE TABLE [dbo].[Drug]
(
	DrugKey					bigint IDENTITY(1,1) PRIMARY KEY,
	DrugID					bigint,
	Created					datetime,
	Modified				datetime,
	GenericName				nvarchar(MAX),
	GenericCode				nvarchar(MAX),
	GenericCost				decimal(28, 10),
	APNCode					nvarchar(MAX),
	[Description]			nvarchar(MAX),
	Form					nvarchar(MAX),
	Strength				nvarchar(MAX),
	Packsize				decimal(28, 10),
	CurrentFlag				bit,
	EffectiveDate			datetime,
	ProductKey				bigint,
	StoreKey				bigint,
	DataSourceKey			bigint,
	CreatedDate				datetime,
	UpdatedDate				datetime,
	FOREIGN KEY (DataSourceKey) REFERENCES  [dbo].[DataSource] (DataSourceKey),
	FOREIGN KEY (StoreKey) REFERENCES  [dbo].[Store] (StoreKey),
	FOREIGN KEY (ProductKey) REFERENCES  [dbo].[Product] (ProductKey) 
)
GO

SET IDENTITY_INSERT [dbo].[Drug] ON

INSERT INTO [dbo].[Drug] (DrugKey,DrugID,GenericName,GenericCode,GenericCost,APNCode,CurrentFlag,EffectiveDate,ProductKey,StoreKey,CreatedDate,UpdatedDate)
VALUES (0, 0, 'Unknown', 'Unknown', 0, 'Unknown', 1, '2000-01-01', 0, 0, '2000-01-01','2000-01-01')

SET IDENTITY_INSERT [dbo].[Drug] OFF

--// Table [Pharmacist]
IF OBJECT_ID('[dbo].[Pharmacist]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[Pharmacist]
GO

CREATE TABLE [dbo].[Pharmacist]
(
	PharmacistKey			bigint IDENTITY(1,1) PRIMARY KEY,
	PharmacistID			bigint,
	Created					datetime,
	Modified				datetime,
	FirstName				nvarchar(MAX),
	LastName				nvarchar(MAX),
	PharmacistsInitials		nvarchar(MAX),
	RegistrationNumber		nvarchar(MAX),
	CurrentFlag				bit,
	EffectiveDate			datetime,
	StoreKey				bigint,
	DataSourceKey			bigint,
	CreatedDate				datetime,
	UpdatedDate				datetime,
	FOREIGN KEY (DataSourceKey) REFERENCES  [dbo].[DataSource] (DataSourceKey),
	FOREIGN KEY (StoreKey) REFERENCES  [dbo].[Store] (StoreKey) 
)
GO

SET IDENTITY_INSERT [dbo].[Pharmacist] ON

INSERT INTO [dbo].[Pharmacist] (PharmacistKey,PharmacistID,FirstName,LastName,PharmacistsInitials,RegistrationNumber,CurrentFlag,EffectiveDate,StoreKey,CreatedDate,UpdatedDate)
VALUES (0, 0, 'Unknown', 'Unknown', 'Unknown', 'Unknown', 1, '2000-01-01', 0, '2000-01-01','2000-01-01')

SET IDENTITY_INSERT [dbo].[Pharmacist] OFF

--// Table [Patient]
IF OBJECT_ID('[dbo].[Patient]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[Patient]
GO

CREATE TABLE [dbo].[Patient]
(
	PatientKey				bigint IDENTITY(1,1) PRIMARY KEY,
	PatientID				bigint,
	Created					datetime,
	Modified				datetime,
	PatienttNumber			bigint,
	PatientStatus			nvarchar(MAX),
	PatientType				nvarchar(MAX),
	Title					nvarchar(MAX),
	FirstName				nvarchar(MAX),
	LastName				nvarchar(MAX),
	[Address]				nvarchar(MAX),
	Suburb					nvarchar(MAX),
	Ward					int,
	PostCode				int,
	Birthdate				datetime,
	Email					nvarchar(MAX),
	Gender					int,
	PhoneNumber				nvarchar(MAX),
	Notes					nvarchar(MAX),
	FamilyCode				bigint,
	SafetyNetScriptAmount	decimal(28, 10),
	SafetyNetScriptCount	bigint,
	CurrentFlag				bit,
	EffectiveDate			datetime,
	StoreKey				bigint,
	DataSourceKey			bigint,
	CreatedDate				datetime,
	UpdatedDate				datetime,
	FOREIGN KEY (DataSourceKey) REFERENCES  [dbo].[DataSource] (DataSourceKey),
	FOREIGN KEY (StoreKey) REFERENCES  [dbo].[Store] (StoreKey) 
)
GO

SET IDENTITY_INSERT [dbo].[Patient] ON

INSERT INTO [dbo].[Patient] (PatientKey,PatientID,PatienttNumber,PatientStatus,PatientType,Title,FirstName,LastName,[Address],Suburb,Ward,PostCode,Birthdate,Email,Gender,PhoneNumber,Notes,FamilyCode,SafetyNetScriptAmount,SafetyNetScriptCount,CurrentFlag,EffectiveDate,StoreKey,CreatedDate,UpdatedDate)
VALUES (0, 0, 0, 'Unknown', 'Unknown', 'Unknown', 'Unknown', 'Unknown', 'Unknown', 'Unknown', 0, 0, '2000-01-01', 'Unknown', 0, 'Unknown', 'Unknown', 0, 0, 0, 1, '2000-01-01', 0, '2000-01-01','2000-01-01')

SET IDENTITY_INSERT [dbo].[Patient] OFF

--// Table [Supplier]
IF OBJECT_ID('[dbo].[Supplier]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[Supplier]
GO

CREATE TABLE [dbo].[Supplier]
(
	SupplierKey				bigint IDENTITY(1,1) PRIMARY KEY,
	SupplierID				bigint,
	Created					datetime,
	Modified				datetime,
	SupplierName			nvarchar(MAX),
	[Address]				nvarchar(MAX),
	City					nvarchar(MAX),
	PhoneNumber				nvarchar(MAX),
	FaxNumber				nvarchar(MAX),
	TaxNumber				nvarchar(MAX),
	AccountNumber			nvarchar(MAX),
	Email					nvarchar(MAX),
	Brand					nvarchar(MAX),
	CurrentFlag				bit,
	EffectiveDate			datetime,
	StoreKey				bigint,
	SupplierGlobalHQID		bigint,
	DataSourceKey			bigint,
	CreatedDate				datetime,
	UpdatedDate				datetime,
	FOREIGN KEY (DataSourceKey) REFERENCES  [dbo].[DataSource] (DataSourceKey),
	--FOREIGN KEY (SupplierGlobalHQID) REFERENCES  [dbo].[SupplierGlobal] (SupplierGlobalHQID),
	FOREIGN KEY (StoreKey) REFERENCES  [dbo].[Store] (StoreKey) 
)
GO

SET IDENTITY_INSERT [dbo].[Supplier] ON

INSERT INTO [dbo].[Supplier] (SupplierKey,SupplierID,SupplierName,[Address],City,PhoneNumber,FaxNumber,TaxNumber,AccountNumber,Email,Brand,CurrentFlag,EffectiveDate,StoreKey,SupplierGlobalHQID,CreatedDate,UpdatedDate)
VALUES (0, 0, 'Unknown', 'Unknown', 'Unknown', 'Unknown', 'Unknown', 'Unknown', 'Unknown', 'Unknown', 'Unknown', 1, '2000-01-01', 0, 0, '2000-01-01','2000-01-01')

SET IDENTITY_INSERT [dbo].[Supplier] OFF

--// Table [PricingPlan]
IF OBJECT_ID('[dbo].[PricingPlan]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[PricingPlan]
GO

CREATE TABLE [dbo].[PricingPlan]
(
	PricingPlanKey			bigint IDENTITY(1,1) PRIMARY KEY,
	PricingPlanID			bigint,
	Created					datetime,	
	Modified				datetime,
	[Description]			nvarchar(MAX),
	FixedRetail				decimal(28,10),
	MarginMarkup			int,
	MarginMarkupValue		decimal(28,10),
	[Name]					nvarchar(MAX),
	PlanType				int,
	PricingLevel			int,
	RoundingDenomination	decimal(28,10),	
	RoundingLowerBound		decimal(28,10),
	RoundingOption			int,
	RoundingUpperBound		decimal(28,10),
	CurrentFlag				bit,
	EffectiveDate			datetime,
	SupplierKey				bigint,	
	StoreKey				bigint,
	DataSourceKey			bigint,
	CreatedDate				datetime,
	UpdatedDate				datetime,
	FOREIGN KEY (DataSourceKey) REFERENCES  [dbo].[DataSource] (DataSourceKey),
	FOREIGN KEY (SupplierKey) REFERENCES  [dbo].[Supplier] (SupplierKey),
	FOREIGN KEY (StoreKey) REFERENCES  [dbo].[Store] (StoreKey) 
)
GO

SET IDENTITY_INSERT [dbo].[PricingPlan] ON

INSERT INTO [dbo].[PricingPlan] (PricingPlanKey,PricingPlanID,CurrentFlag,EffectiveDate,StoreKey,DataSourceKey,SupplierKey,CreatedDate,UpdatedDate)
VALUES (0, 0, 1, '2000-01-01', 0, 0, 0, '2000-01-01','2000-01-01')

SET IDENTITY_INSERT [dbo].[PricingPlan] OFF

GO
--// Table [Script]
IF OBJECT_ID('[dbo].[Script]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[Script]
GO

CREATE TABLE [dbo].[Script]
(
	ScriptKey				bigint IDENTITY(1,1) PRIMARY KEY,
	ScriptID				bigint,
	ScriptNumber			bigint,
	ScriptComment			nvarchar(MAX),
	ScriptType				nvarchar(MAX),
	ScriptStatus			nvarchar(MAX),
	ScriptClassification	nvarchar(MAX),
	Quantity				float,
	Cost					decimal(28, 10),
	SafetyNetAmount			decimal(28, 10),
	PatientPrice			decimal(28, 10),
	GovernmentRecoveryAmount	decimal(28, 10),
	WhosesaleCost			decimal(28, 10),
	GstIncluded				bit,
	DespenseDate			datetime,
	CurrentFlag				bit,
	Deleted					int,
	EffectiveDate			datetime,
	DoctorKey				bigint,
	DrugKey					bigint,
	DrugItemKey				bigint,
	PatientKey				bigint,
	PharmacistKey			bigint,
	StoreKey				bigint,
	DataSourceKey			bigint,
	CreatedDate				datetime,
	UpdatedDate				datetime,
	FOREIGN KEY (DataSourceKey) REFERENCES  [dbo].[DataSource] (DataSourceKey),
	FOREIGN KEY (DoctorKey) REFERENCES  [dbo].[Doctor] (DoctorKey),
	FOREIGN KEY (DrugKey) REFERENCES  [dbo].[Drug] (DrugKey),
	FOREIGN KEY (PatientKey) REFERENCES  [dbo].[Patient] (PatientKey),
	FOREIGN KEY (PharmacistKey) REFERENCES  [dbo].[Pharmacist] (PharmacistKey),
	FOREIGN KEY (StoreKey) REFERENCES  [dbo].[Store] (StoreKey) 
)
GO

SET IDENTITY_INSERT [dbo].[Script] ON

INSERT INTO [dbo].[Script] (ScriptKey,ScriptID,ScriptNumber,ScriptComment,Quantity,Cost,SafetyNetAmount,DespenseDate,CurrentFlag,EffectiveDate,DoctorKey,DrugKey,PatientKey,PharmacistKey,StoreKey,CreatedDate,UpdatedDate)
VALUES (0, 0, 0, 'Unknown', 0, 0, 0, '2000-01-01', 1, '2000-01-01', 0, 0, 0, 0, 0, '2000-01-01','2000-01-01')

SET IDENTITY_INSERT [dbo].[Script] OFF

--// Table [Transaction]
IF OBJECT_ID('[dbo].[Transaction]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[Transaction]
GO

CREATE TABLE [dbo].[Transaction]
(
	TransactionKey			bigint IDENTITY(1,1) PRIMARY KEY,
	TransactionID			bigint,
	CreatedAt				datetime,
	Total					decimal(28, 10),
	SaleTax					decimal(28, 10),
	TotalQuantity			decimal(28, 10),
	TotalCost				decimal(28, 10),
	TotalExtendedPrice		decimal(28, 10),
	TotalGovRecov			decimal(28, 10),
	TotalDiscount			decimal(28, 10),
	TotalProfit				decimal(28, 10),
	TotalPoints				decimal(28, 10),
	TransactionNumber		nvarchar(MAX),
	Comment					nvarchar(MAX),
	[Status]				int,
	[Type]					int,
	CurrentFlag				bit,
	EffectiveDate			datetime,
	CustomerKey				bigint,
	StaffKey				bigint,
	StoreKey				bigint,
	DataSourceKey			bigint,
	CreatedDate				datetime,
	UpdatedDate				datetime,
	FOREIGN KEY (DataSourceKey) REFERENCES  [dbo].[DataSource] (DataSourceKey),
	FOREIGN KEY (CustomerKey) REFERENCES  [dbo].[Customer] (CustomerKey),
	FOREIGN KEY (StaffKey) REFERENCES  [dbo].[Staff] (StaffKey),
	FOREIGN KEY (StoreKey) REFERENCES  [dbo].[Store] (StoreKey) 
)
GO

SET IDENTITY_INSERT [dbo].[Transaction] ON

INSERT INTO [dbo].[Transaction] (TransactionKey,TransactionID,CreatedAt,Total,SaleTax,Comment,[Status],[Type],CurrentFlag,EffectiveDate,CustomerKey,StaffKey,StoreKey,CreatedDate,UpdatedDate)
VALUES (0, 0, '2000-01-01', 0, 0, 'Unknown', 0, 0, 1, '2000-01-01', 0, 0, 0, '2000-01-01','2000-01-01')

SET IDENTITY_INSERT [dbo].[Transaction] OFF

--// Table [ScriptLink]
IF OBJECT_ID('[dbo].[ScriptLink]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[ScriptLink]
GO

CREATE TABLE [dbo].[ScriptLink]
(
	ScriptLinkKey			bigint IDENTITY(1,1) PRIMARY KEY,
	ScriptLinkID			bigint,
	ScriptNumber			nvarchar(MAX),
	ScriptType				nvarchar(MAX),
	CreatedAt				datetime,
	[Description]			nvarchar(MAX),
	Quantity				float,
	PDE						nvarchar(MAX),
	FirstName				nvarchar(MAX),
	LastName				nvarchar(MAX),
	NHSPrice				decimal(28, 10),
	GSTAmount				decimal(28, 10),
	PatientPrice			decimal(28, 10),
	PatientAddress			nvarchar(MAX),
	PatientNumber			int,
	AccountNumber			int,
	DirectDebit				int,
	CurrentFlag				bit,
	EffectiveDate			datetime,
	CustomerKey				bigint,
	TransactionKey			bigint,
	StoreKey				bigint,
	DataSourceKey			bigint,
	CreatedDate				datetime,
	UpdatedDate				datetime,
	FOREIGN KEY (DataSourceKey) REFERENCES  [dbo].[DataSource] (DataSourceKey),
	FOREIGN KEY (CustomerKey) REFERENCES  [dbo].[Customer] (CustomerKey),
	FOREIGN KEY (TransactionKey) REFERENCES  [dbo].[Transaction] (TransactionKey),
	FOREIGN KEY (StoreKey) REFERENCES  [dbo].[Store] (StoreKey) 
)
GO

SET IDENTITY_INSERT [dbo].[ScriptLink] ON

INSERT INTO [dbo].[ScriptLink] (ScriptLinkKey,ScriptLinkID,ScriptNumber,ScriptType,CreatedAt,[Description],Quantity,PDE,FirstName,LastName,NHSPrice,GSTAmount,PatientPrice,PatientAddress,PatientNumber,AccountNumber,DirectDebit,CurrentFlag,EffectiveDate,CustomerKey,TransactionKey,StoreKey,CreatedDate,UpdatedDate)
VALUES (0, 0, 'Unknown', 'Unknown', '2000-01-01', 'Unknown', 0, 'Unknown', 'Unknown', 'Unknown', 0, 0, 0, 'Unknown', 0, 0, 0, 1, '2000-01-01', 0, 0, 0, '2000-01-01','2000-01-01')

SET IDENTITY_INSERT [dbo].[ScriptLink] OFF

--// Table [TransactionEntry]
IF OBJECT_ID('[dbo].[TransactionEntry]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[TransactionEntry]
GO

CREATE TABLE [dbo].[TransactionEntry]
(
	TransactionEntryKey		bigint IDENTITY(1,1) PRIMARY KEY,
	TransactionEntryID		bigint,
	CreatedAt				datetime,
	[Description]			nvarchar(MAX),
	Cost					decimal(28, 10),
	Retail					decimal(28, 10),
	OriginalRetail			int,
	Price					decimal(28, 10),
	Quantity				float,
	Tax						decimal(28, 10),
	Discount				decimal(28, 10),
	isGovRecov				int,
	GovRecovAmt				decimal(28, 10),
	CurrentFlag				bit,
	EffectiveDate			datetime,
	TransactionKey			bigint,
	ScriptLinkKey			bigint,
	ScriptKey				bigint,
	ProductKey				bigint,
	StoreKey				bigint,
	DataSourceKey			bigint,
	CreatedDate				datetime,
	UpdatedDate				datetime,
	FOREIGN KEY (DataSourceKey) REFERENCES  [dbo].[DataSource] (DataSourceKey),
	FOREIGN KEY (TransactionKey) REFERENCES  [dbo].[Transaction] (TransactionKey),
	FOREIGN KEY (ScriptLinkKey) REFERENCES  [dbo].[ScriptLink] (ScriptLinkKey),
	FOREIGN KEY (ScriptKey) REFERENCES  [dbo].[Script] (ScriptKey),
	FOREIGN KEY (ProductKey) REFERENCES  [dbo].[Product] (ProductKey),
	FOREIGN KEY (StoreKey) REFERENCES  [dbo].[Store] (StoreKey) 
)
GO

--// Table [PurchaseOrder]
IF OBJECT_ID('[dbo].[PurchaseOrder]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[PurchaseOrder]
GO

CREATE TABLE [dbo].[PurchaseOrder]
(
	PurchaseOrderKey				bigint IDENTITY(1,1) PRIMARY KEY,
	PurchaseOrderID					bigint ,
	Created							datetime ,
	Modified						datetime ,
	AggregateSource					int ,
	--[Guid]							uniqueidentifier ,
	IsDefault						int,
	IBHeaderGuid					uniqueidentifier ,
	--RapidObjectGuid		uniqueidentifier ,
	--RapidSyncRequired	bit ,
	RecordStatus					bigint ,
	ApprovedBy						nvarchar(MAX) ,
	ApprovedDate					datetime ,
	CancelledDate					datetime ,
	CompletedDate					datetime ,
	CompletedValue					decimal(28, 10) ,
	CreatedBy						nvarchar(MAX) ,
	Currency						bigint ,
	DeliverAfter					datetime ,
	DeliverBefore					datetime ,
	ExchangeRate					float ,
	--GatewayId						bigint ,
	HasInvoice						bit ,
	HasOOSInvoice					bit ,
	IsAutoGenerated					bit ,
	IsBootstrapped					bit ,
	IsCancelled						bit ,
	IsPlaced						bit ,
	PharmXStatus					int ,
	PurchaseOrderEntryLastModified	bigint ,
	PurchaseOrderNumber				nvarchar(MAX) ,
	PurchaseOrderSource				int ,
	PurchaseOrderStatus				int ,
	PurchaseOrderType				int ,
	PurchaseOrderUpdateLevel		int ,
	Remarks							nvarchar(MAX) ,
	RequiredDate					datetime ,
	SentDate						datetime ,
	ShipFrom						nvarchar(MAX) ,
	ShipTo							nvarchar(MAX) ,
	ShipVia							nvarchar(MAX) ,
	Replacement						smallint ,
	Delivered						smallint ,
	Ordered							smallint ,
	Acknowledged					smallint ,
	TotalGSTPaid					int ,
	LinkedOrder						smallint ,
	Direct							smallint ,
	OrderPeriod						int ,
	CurrentFlag						bit,
	EffectiveDate					datetime,
	SupplierKey						bigint,
	StoreKey						bigint,
	DataSourceKey					bigint,
	CreatedDate						datetime ,
	UpdatedDate						datetime ,
	FOREIGN KEY (DataSourceKey) REFERENCES  [dbo].[DataSource] (DataSourceKey),
	FOREIGN KEY (SupplierKey) REFERENCES  [dbo].[Supplier] (SupplierKey) ,
	FOREIGN KEY (StoreKey) REFERENCES  [dbo].[Store] (StoreKey) 
)
GO

SET IDENTITY_INSERT [dbo].[PurchaseOrder] ON

INSERT INTO [dbo].[PurchaseOrder] (PurchaseOrderKey,PurchaseOrderID,CurrentFlag,EffectiveDate,SupplierKey,StoreKey,CreatedDate,UpdatedDate)
VALUES (0, 0, 1, '2000-01-01', 0, 0, '2000-01-01','2000-01-01')

SET IDENTITY_INSERT [dbo].[PurchaseOrder] OFF

--// Table [PurchaseOrderEntry]
IF OBJECT_ID('[dbo].[PurchaseOrderEntry]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[PurchaseOrderEntry]
GO

CREATE TABLE [dbo].[PurchaseOrderEntry]
(
	PurchaseOrderEntryKey			bigint IDENTITY(1,1) PRIMARY KEY ,
	PurchaseOrderEntryID			bigint,
	Created							datetime,
	Moified							datetime,
	RecordStatus					bigint,
	Comment							nvarchar(MAX),
	CurrentCost						decimal(28,10),
	ItemDescription					nvarchar(MAX),
	ItemTax							bigint,
	OrderCost						decimal(28,10),
	OrderCostTax					decimal(28,10),
	OriginalQuantityOrdered			float,
	PackQuantity					int,
	QuantityOrderd					float,
	QuantityReceivedToDate			float,
	QuantityReturnForCreditToDate	float,
	ReasonCode						bigint,
	ReorderNumber					nvarchar(MAX),
	PackSize						int,
	OuterSize						int,
	PDE								nvarchar(MAX),
	CurrentFlag						bit,
	EffectiveDate					datetime,
	StoreKey						bigint ,
	DataSourceKey					bigint,
	ProductKey						bigint,
	PurchaseOrderKey				bigint,
	CreatedDate						datetime ,
	UpdatedDate						datetime ,
	FOREIGN KEY (DataSourceKey) REFERENCES  [dbo].[DataSource] (DataSourceKey),
	FOREIGN KEY (StoreKey) REFERENCES  [dbo].[Store] (StoreKey), 
	FOREIGN KEY (ProductKey) REFERENCES  [dbo].[Product] (ProductKey), 
	FOREIGN KEY (PurchaseOrderKey) REFERENCES  [dbo].[PurchaseOrder] (PurchaseOrderKey) 
)
GO

SET IDENTITY_INSERT [dbo].[PurchaseOrderEntry] ON

INSERT INTO [dbo].[PurchaseOrderEntry] (PurchaseOrderEntryKey,PurchaseOrderEntryID, CurrentFlag,EffectiveDate,StoreKey,ProductKey,PurchaseOrderKey,CreatedDate,UpdatedDate)
VALUES (0, 0, 1, '2000-01-01', 0, 0, 0, '2000-01-01','2000-01-01')

SET IDENTITY_INSERT [dbo].[PurchaseOrderEntry] OFF

--// Table [PurchaseOrderInvoice]
IF OBJECT_ID('[dbo].[PurchaseOrderInvoice]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[PurchaseOrderInvoice]
GO

CREATE TABLE [dbo].[PurchaseOrderInvoice]
(
	PurchaseOrderInvoiceKey		bigint IDENTITY(1,1) PRIMARY KEY ,
	PurchaseOrderInvoiceID		bigint,
	Created						datetime,
	Modified					datetime,
	RecordStatus				bigint,
	Currency					bigint,
	ActualInvoiceValue			decimal(28,10),
	DeliverAfter				datetime,
	DeliverBefore				datetime,
	DeliverName					nvarchar(MAX),
	ExchangeRate				float,
	ExpectedDate				datetime,
	ExpectedInvoiceValue		decimal(28,10),
	InvoiceDate					datetime,
	InvoiceEntryLastModified	bigint,
	InvoiceGatewayID			bigint,
	InvoiceNumber				nvarchar(MAX),
	InvoiceType					int,
	IsClosed					bit,
	PurchaseOrderGatewayID		bigint,
	TransferReference			nvarchar(MAX),
	Variation					decimal(28,10),
	EndofDayID					nvarchar(MAX),
	CurrentFlag					bit,
	EffectiveDate				datetime,
	StoreKey					bigint ,
	ReceivedBy					nvarchar(MAX),	--// Staff
	DataSourceKey				bigint,
	SupplierKey					bigint,
	CreatedDate					datetime ,
	UpdatedDate					datetime ,
	FOREIGN KEY (DataSourceKey) REFERENCES  [dbo].[DataSource] (DataSourceKey),
	FOREIGN KEY (SupplierKey) REFERENCES  [dbo].[Supplier] (SupplierKey) ,
	FOREIGN KEY (StoreKey) REFERENCES  [dbo].[Store] (StoreKey) 
)
GO

SET IDENTITY_INSERT [dbo].[PurchaseOrderInvoice] ON

INSERT INTO [dbo].[PurchaseOrderInvoice] (PurchaseOrderInvoiceKey,PurchaseOrderInvoiceID,CurrentFlag,EffectiveDate,StoreKey,SupplierKey,CreatedDate,UpdatedDate)
VALUES (0, 0, 1, '2000-01-01', 0, 0, '2000-01-01','2000-01-01')

SET IDENTITY_INSERT [dbo].[PurchaseOrderInvoice] OFF

--// Table [PurchaseOrderInvoiceEntry]
IF OBJECT_ID('[dbo].[PurchaseOrderInvoiceEntry]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[PurchaseOrderInvoiceEntry]
GO

CREATE TABLE [dbo].[PurchaseOrderInvoiceEntry]
(
	PurchaseOrderInvoiceEntryKey		bigint IDENTITY(1,1) PRIMARY KEY ,
	PurchaseOrderInvoiceEntryID			bigint,
	Created								datetime,
	Modified							datetime,
	AggregateSource						int,
	IsDefault							int,
	RapidSyncRequired					bit,
	RecordStatus						bigint,
	Class								nvarchar(MAX),
	DiscountIncGst						decimal(28,10),
	Ean									nvarchar(MAX),
	ExtSupplierCostTax					decimal(28,10),
	ExtendedForeignCost					decimal(28,10),
	ForeignCost							decimal(28,10),
	GatewayResponse						nvarchar(MAX),
	ItemDescription						nvarchar(MAX),
	ItemTax								bigint,
	Manufacturer						nvarchar(MAX),
	NetInStoreCost						decimal(28,10),
	NormalCostExGst						decimal(28,10),
	NormalCostGst						decimal(28,10),
	NormalCostIncGst					decimal(28,10),
	OrderedQuantity						float,
	OriginalQuantityOrdered				float,
	PacksBackordered					int, 
	PacksOrdered						int, 
	PacksOutOfStock						int, 
	PacksSupplied						int, 
	QuantityInvoiced					float,
	QuantityOutOfStock					float,
	QuantityReceived					float,
	QuantityReturnForCredit				float,
	QuantityScanned						float,
	Reference							nvarchar(MAX),
	ReorderNumber						nvarchar(MAX),
	RetailPrice							decimal(28,10),
	SupplierCost						decimal(28,10),
	SupplierCostTax						decimal(28,10),
	SurchargeIncGst						decimal(28,10),
	Tote								nvarchar(MAX),
	Tun									nvarchar(MAX),
	Warehouse							nvarchar(MAX),
	PDE									nvarchar(MAX),
	GSTPaid								int,
	Transferred							smallint,
	ListCost							int,
	RealCost							int,
	SubTotal							int,
	PackSize							int,
	OuterSize							int,
	Delivered							smallint,
	CurrentFlag							bit,
	EffectiveDate						datetime,
	StoreKey							bigint ,
	DataSourceKey						bigint,
	ProductKey							bigint,
	PurchaseOrderInvoiceKey				bigint,
	CreatedDate							datetime ,
	UpdatedDate							datetime ,
	FOREIGN KEY (DataSourceKey) REFERENCES  [dbo].[DataSource] (DataSourceKey),
	FOREIGN KEY (ProductKey) REFERENCES  [dbo].[Product] (ProductKey) ,
	FOREIGN KEY (PurchaseOrderInvoiceKey) REFERENCES  [dbo].[PurchaseOrderInvoice] (PurchaseOrderInvoiceKey) ,
	FOREIGN KEY (StoreKey) REFERENCES  [dbo].[Store] (StoreKey) 
)
GO

SET IDENTITY_INSERT [dbo].[PurchaseOrderInvoiceEntry] ON

INSERT INTO [dbo].[PurchaseOrderInvoiceEntry] (PurchaseOrderInvoiceEntryKey,PurchaseOrderInvoiceEntryID,CurrentFlag,EffectiveDate,StoreKey,CreatedDate,UpdatedDate)
VALUES (0, 0, 1, '2000-01-01', 0, '2000-01-01','2000-01-01')

SET IDENTITY_INSERT [dbo].[PurchaseOrderInvoiceEntry] OFF


--// Table [StockMovement]
IF OBJECT_ID('[dbo].[StockMovement]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[StockMovement]
GO

CREATE TABLE [dbo].[StockMovement]
(
	StockMovementKey	bigint IDENTITY(1,1) PRIMARY KEY ,
	StockMovementID		bigint ,
	RecordStatus		bigint ,
	AdjustmentQuantity	float ,
	SOHAfterAdj			float ,
	Cost				decimal(28, 10) ,
	[Date]				datetime ,
	Reason				bigint ,
	Retail				decimal(28, 10) ,
	StoreKey			bigint ,
	DataSourceKey		bigint,
	ProductKey			bigint,
	CurrentFlag			bit,
	EffectiveDate		datetime,
	CreatedDate			datetime ,
	UpdatedDate			datetime ,
	FOREIGN KEY (DataSourceKey) REFERENCES  [dbo].[DataSource] (DataSourceKey),
	FOREIGN KEY (StoreKey) REFERENCES  [dbo].[Store] (StoreKey),
	FOREIGN KEY (ProductKey) REFERENCES  [dbo].[Product] (ProductKey), 
)
GO

SET IDENTITY_INSERT [dbo].[StockMovement] ON

INSERT INTO [dbo].[StockMovement] (StockMovementKey,CurrentFlag,EffectiveDate,StoreKey,CreatedDate,UpdatedDate)
VALUES (0, 1, '2000-01-01', 0, '2000-01-01','2000-01-01')

SET IDENTITY_INSERT [dbo].[StockMovement] OFF

--// Table [StockTake]
IF OBJECT_ID('[dbo].[StockTake]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[StockTake]
GO

CREATE TABLE [dbo].[StockTake]
(
	StockTakeKey bigint IDENTITY(1,1) PRIMARY KEY ,
	StockTakeID bigint ,
	Created datetime ,
	Modified datetime ,
	CommittedDate datetime ,
	[Description] nvarchar(MAX) ,
	ImportedDataTable image ,
	[Name] nvarchar(MAX) ,
	ProtectedDate datetime ,
	SatScanCode int ,
	StocktakeType int ,
	CurrentFlag			bit,
	EffectiveDate		datetime,
	StoreKey bigint ,
	DataSourceKey			bigint,
	CreatedDate datetime ,
	UpdatedDate datetime,
	FOREIGN KEY (DataSourceKey) REFERENCES  [dbo].[DataSource] (DataSourceKey),
	FOREIGN KEY (StoreKey) REFERENCES  [dbo].[Store] (StoreKey) 
)
GO

SET IDENTITY_INSERT [dbo].[StockTake] ON

INSERT INTO [dbo].[StockTake] (StockTakeKey,CurrentFlag,EffectiveDate,StoreKey,CreatedDate,UpdatedDate)
VALUES (0, 1, '2000-01-01', 0, '2000-01-01','2000-01-01')

SET IDENTITY_INSERT [dbo].[StockTake] OFF

--// Table [StockTakeEntry]
IF OBJECT_ID('[dbo].[StockTakeEntry]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[StockTakeEntry]
GO

CREATE TABLE [dbo].[StockTakeEntry]
(
	StockTakeEntryKey bigint IDENTITY(1,1) PRIMARY KEY ,
	StockTakeEntryID bigint ,
	Created datetime2(0) ,
	Modified datetime ,
	ChangeCount int ,
	Code nvarchar(MAX) ,
	Cost decimal(28, 10) ,
	[Description] nvarchar(MAX) ,
	LastCounted datetime ,
	QuantityCounted float ,
	QuantityOnHand float ,
	CurrentFlag			bit,
	EffectiveDate		datetime,
	StoreKey bigint ,
	DataSourceKey			bigint,
	StockTakeKey bigint ,
	ProductKey	bigint,
	CreatedDate datetime ,
	UpdatedDate datetime ,
	FOREIGN KEY (DataSourceKey) REFERENCES  [dbo].[DataSource] (DataSourceKey),
	FOREIGN KEY (StoreKey) REFERENCES  [dbo].[Store] (StoreKey),
	FOREIGN KEY (StockTakeKey) REFERENCES  [dbo].[StockTake] (StockTakeKey),
	FOREIGN KEY (ProductKey) REFERENCES  [dbo].[Product] (ProductKey)  
)
GO

SET IDENTITY_INSERT [dbo].[StockTakeEntry] ON

INSERT INTO [dbo].[StockTakeEntry] (StockTakeEntryKey,CurrentFlag,EffectiveDate,StoreKey,StockTakeKey,ProductKey,CreatedDate,UpdatedDate)
VALUES (0, 1, '2000-01-01', 0, 0, 0, '2000-01-01','2000-01-01')

SET IDENTITY_INSERT [dbo].[StockTakeEntry] OFF

GO
--// Table [BusinessUnit-AuditHistory]
IF OBJECT_ID('[dbo].[BusinessUnit-AuditHistory]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[BusinessUnit-AuditHistory]
GO

CREATE TABLE [dbo].[BusinessUnit-AuditHistory]
(
	[BusinessUnit-AuditHistoryKey]	bigint IDENTITY(1,1) PRIMARY KEY ,
	[BusinessUnit-AuditHistoryID]	bigint ,
	AuditDate						datetime,
	AuditType						int,
	Field							nvarchar(MAX),
	FriendlyName					nvarchar(MAX),
	FromValue						nvarchar(MAX),
	ToValue							nvarchar(MAX),
	ObjectType						nvarchar(MAX),
	SourceName						nvarchar(MAX),
	StoreKey						bigint ,
	DataSourceKey					bigint,
	ProductKey						bigint,
	CurrentFlag						bit,
	EffectiveDate					datetime,
	CreatedDate						datetime ,
	UpdatedDate						datetime ,
	FOREIGN KEY (DataSourceKey) REFERENCES  [dbo].[DataSource] (DataSourceKey),
	FOREIGN KEY (StoreKey) REFERENCES  [dbo].[Store] (StoreKey),
	FOREIGN KEY (ProductKey) REFERENCES  [dbo].[Product] (ProductKey)  
)
GO

SET IDENTITY_INSERT [dbo].[BusinessUnit-AuditHistory] ON

INSERT INTO [dbo].[BusinessUnit-AuditHistory] ([BusinessUnit-AuditHistoryKey],CurrentFlag,EffectiveDate,StoreKey,DataSourceKey,ProductKey,CreatedDate,UpdatedDate)
VALUES (0, 1, '2000-01-01', 0, 0, 0, '2000-01-01','2000-01-01')

SET IDENTITY_INSERT [dbo].[BusinessUnit-AuditHistory] OFF

GO

--// Table [Group-GroupEntries]
IF OBJECT_ID('[dbo].[Group-GroupEntries]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[Group-GroupEntries]
GO

CREATE TABLE [dbo].[Group-GroupEntries]
(
	[Group-GroupEntriesKey]			bigint IDENTITY(1,1) PRIMARY KEY ,
	CurrentFlag						bit,
	EffectiveDate					datetime,
	StoreKey						bigint ,
	DataSourceKey					bigint,
	ProductKey						bigint,
	GroupKey						bigint,
	CreatedDate						datetime ,
	UpdatedDate						datetime ,
	FOREIGN KEY (DataSourceKey) REFERENCES  [dbo].[DataSource] (DataSourceKey),
	FOREIGN KEY (StoreKey) REFERENCES  [dbo].[Store] (StoreKey),
	FOREIGN KEY (ProductKey) REFERENCES  [dbo].[Product] (ProductKey)
)
GO

SET IDENTITY_INSERT [dbo].[Group-GroupEntries] ON

INSERT INTO [dbo].[Group-GroupEntries] ([Group-GroupEntriesKey],CurrentFlag,EffectiveDate,StoreKey,DataSourceKey,ProductKey,GroupKey,CreatedDate,UpdatedDate)
VALUES (0, 1, '2000-01-01', 0, 0, 0, 0,  '2000-01-01','2000-01-01')

SET IDENTITY_INSERT [dbo].[Group-GroupEntries] OFF

GO
--// Table [PricingReview]
IF OBJECT_ID('[dbo].[PricingReview]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[PricingReview]
GO

CREATE TABLE [dbo].[PricingReview]
(
	PricingReviewKey		bigint IDENTITY(1,1) PRIMARY KEY,
	PricingReviewID			bigint,
	Created					datetime,	
	Modified				datetime,
	RecordStatus			bigint,
	Code					nvarchar(MAX),
	CommittedBy				nvarchar(MAX),
	CommittedDate			datetime,
	[Description]			nvarchar(MAX),
	InActive				bit,
	IsApplied				bit,
	PricingReviewSourceType	int,
	CurrentFlag				bit,
	EffectiveDate			datetime,
	StoreKey				bigint,
	DataSourceKey			bigint,
	CreatedDate				datetime,
	UpdatedDate				datetime,
	FOREIGN KEY (DataSourceKey) REFERENCES  [dbo].[DataSource] (DataSourceKey),
	FOREIGN KEY (StoreKey) REFERENCES  [dbo].[Store] (StoreKey) 
)
GO

SET IDENTITY_INSERT [dbo].[PricingReview] ON

INSERT INTO [dbo].[PricingReview] (PricingReviewKey,PricingReviewID,CurrentFlag,EffectiveDate,StoreKey,DataSourceKey,CreatedDate,UpdatedDate)
VALUES (0, 0, 1, '2000-01-01', 0, 0, '2000-01-01','2000-01-01')

SET IDENTITY_INSERT [dbo].[PricingReview] OFF

GO
--// Table [PricingReviewEntry]
IF OBJECT_ID('[dbo].[PricingReviewEntry]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[PricingReviewEntry]
GO

CREATE TABLE [dbo].[PricingReviewEntry]
(
	PricingReviewEntryKey		bigint IDENTITY(1,1) PRIMARY KEY,
	PricingReviewEntryID		bigint,
	Created						datetime,	
	Modified					datetime,
	RecordStatus				bigint,
	AcceptStatus				int,
	AutoCalcPriceLevel			bit,
	InActive					bit,
	NewCost						decimal(28, 10),
	NewMSRP						decimal(28, 10),
	NewPriceA					decimal(28, 10),
	NewPriceB					decimal(28, 10),
	NewPriceC					decimal(28, 10),
	NewRetail					decimal(28, 10),
	NewSupplierCost				decimal(28, 10),
	OldCost						decimal(28, 10),
	OldMSRP						decimal(28, 10),
	OldPriceA					decimal(28, 10),
	OldPriceB					decimal(28, 10),
	OldPriceC					decimal(28, 10),
	OldRetail					decimal(28, 10),
	OldSupplierCost				decimal(28, 10),
	[Source]					nvarchar(MAX),	
	CurrentFlag					bit,
	EffectiveDate				datetime,
	StoreKey					bigint,
	DataSourceKey				bigint,
	ProductKey					bigint,
	PricingReviewKey			bigint,
	CreatedDate					datetime,
	UpdatedDate					datetime,
	FOREIGN KEY (DataSourceKey) REFERENCES  [dbo].[DataSource] (DataSourceKey),
	FOREIGN KEY (StoreKey) REFERENCES  [dbo].[Store] (StoreKey),
	FOREIGN KEY (ProductKey) REFERENCES  [dbo].[Product] (ProductKey),
	FOREIGN KEY (PricingReviewKey) REFERENCES  [dbo].[PricingReview] (PricingReviewKey) 
)
GO

SET IDENTITY_INSERT [dbo].[PricingReviewEntry] ON

INSERT INTO [dbo].[PricingReviewEntry] (PricingReviewEntryKey,PricingReviewEntryID,CurrentFlag,EffectiveDate,StoreKey,DataSourceKey,ProductKey,PricingReviewKey,CreatedDate,UpdatedDate)
VALUES (0, 0, 1, '2000-01-01', 0, 0, 0, 0, '2000-01-01','2000-01-01')

SET IDENTITY_INSERT [dbo].[PricingReviewEntry] OFF

GO

GO
--// Table [ProductReference]
IF OBJECT_ID('[dbo].[ProductReference]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[ProductReference]
GO

CREATE TABLE [dbo].[ProductReference]
(
	ProductReferenceKey			bigint IDENTITY(1,1) PRIMARY KEY,
	ProductReferenceID			bigint,
	ActivePromotionEntry		bigint,
	AppCatHQID					bigint,
	AppCatHQLastMatched			datetime,
	AutoCalcPriceLevel			bit,
	BarcodeFormat				int,
	BlockSalesAfterDate			datetime,
	BlockSalesBeforeDate		datetime,
	BlockSalesReason			nvarchar(MAX),
	BlockSalesType				int,
	BuydownPrice				decimal(28, 10),
	BuydownQuantity				float,
	CatalogueReferenceID		nvarchar(MAX),
	CommissionAmount			decimal(28, 10),
	CommissionMaximum			decimal(28, 10),
	CommissionMode				int,
	CommissionPercentProfit		float,
	CommissionPercentSale		float,
	Consignment					bit,
	Content						nvarchar(MAX),
	Detail1						nvarchar(MAX),
	Detail2						nvarchar(MAX),
	Detail3						nvarchar(MAX),
	Dimension1					bigint,
	Dimension2					bigint,
	Dimension3					bigint,
	Dimensions					int,
	DontCalculateROUValue		bit,
	ExcludedFromLoyalty			bit,
	ExtendedDescription			nvarchar(MAX),
	FixedPrice					bit,
	FoodStampable				bit,
	ForeignCost					decimal(28, 10),
	GroupedDescription			nvarchar(MAX),
	HideOnNetDisplay			bit,
	ImportDescription			nvarchar(MAX),
	ItemAddedDate				datetime,
	ItemDiscountable			bit,
	LabelTemplate				bigint,
	LastCost					decimal(28, 10),
	LastCounted					datetime,
	LastStockCount				float,
	MSRP						decimal(28, 10),
	ParentItem					bigint,
	ParentQuantity				float,
	PictureName					nvarchar(MAX),
	PriceLevelA					decimal(28, 10),
	PriceLevelB					decimal(28, 10),
	PriceLevelC					decimal(28, 10),
	PriceMustBeEntered			bit,
	PriceType					int,
	PricingPolicy				nvarchar(MAX),
	QuantityEntryAllowed		bit,
	ROULastUpdated				datetime,
	ROUScheme					bigint,
	ROUValue					decimal(28, 10),
	ReCalcROPRestockLvlFromROU	bit,
	RebateAmount				decimal(28, 10),
	Remarks						nvarchar(MAX),
	ReplacementCost				decimal(28, 10),
	SaleEndDate					datetime,
	SalePrice					decimal(28, 10),
	SaleStartDate				datetime,
	SaleType					int,
	SerialNumberCount			int,
	TWManaged					bit,
	TagAlongItem				bigint,
	TagAlongQuantity			float,
	TareWeight					float,
	TareWeightPercent			float,
	Taxable						bit,
	Title1						nvarchar(MAX),
	Title2						nvarchar(MAX),
	Title3						nvarchar(MAX),
	TransferAvailable			bit,
	TransferOutMinOrder			int,
	TransferOutPackQuantity		int,
	UnitOfMeasure				nvarchar(MAX),
	UseComponentCost			bit,
	UseComponentPrice			bit,
	UsuallyShip					nvarchar(MAX),
	WebItem						bit,
	Weighed						bit,
	[Weight]					float,
	CurrentFlag					bit,
	EffectiveDate				datetime,
	StoreKey					bigint,
	DataSourceKey				bigint,
	CreatedDate					datetime,
	UpdatedDate					datetime,
	FOREIGN KEY (DataSourceKey) REFERENCES  [dbo].[DataSource] (DataSourceKey),
	FOREIGN KEY (StoreKey) REFERENCES  [dbo].[Store] (StoreKey)
)
GO

SET IDENTITY_INSERT [dbo].[ProductReference] ON

INSERT INTO [dbo].[ProductReference] (ProductReferenceKey,ProductReferenceID,CurrentFlag,EffectiveDate,StoreKey,DataSourceKey,CreatedDate, UpdatedDate)
VALUES (0, 0, 1, '2000-01-01', 0, 0, '2000-01-01','2000-01-01')

SET IDENTITY_INSERT [dbo].[ProductReference] OFF

GO
--// Table [SupplierProduct]
IF OBJECT_ID('[dbo].[SupplierProduct]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[SupplierProduct]
GO

CREATE TABLE [dbo].[SupplierProduct]
(
	SupplierProductKey		bigint IDENTITY(1,1) PRIMARY KEY,
	SupplierProductID		bigint,
	Created					datetime,
	Modified				datetime,
	RecordStatus			bigint,
	Cost					decimal(28, 10),
	CostPrice1				decimal(28, 10),
	CostPrice2				decimal(28, 10),
	CostPrice3				decimal(28, 10),
	CostPrice4				decimal(28, 10),
	CostPrice5				decimal(28, 10),
	CostPriceQuantity1		float,
	CostPriceQuantity2		float,
	CostPriceQuantity3		float,
	CostPriceQuantity4		float,
	CostPriceQuantity5		float,
	DealCatalogueName		nvarchar(MAX),
	DealCost				decimal(28, 10),
	DealEndDate				datetime,
	DealMinDOQ				float,
	DealStartDate			datetime,
	ItemTax					bigint,
	LastCost				decimal(28, 10),
	LastExchangeRate		decimal(28, 10),
	LastForeignCost			decimal(28, 10),
	LastReceivedDate		datetime,
	MinimumOrder			int,
	NeverAutoMatch			bit,
	PackQuantity			int,
	PurchaseTax				bigint,
	Quantity				float,
	RRP						decimal(28, 10),
	ReceiveItemQuantity		float,
	ReorderNumber			nvarchar(MAX),
	SupplierDescription		nvarchar(MAX),
	TaxInc					bit,
	TaxRate					float,
	CurrentFlag				bit,
	EffectiveDate			datetime,
	StoreKey				bigint,
	DataSourceKey			bigint,
	ProductKey				bigint,
	SupplierKey				bigint,
	CreatedDate				datetime,
	UpdatedDate				datetime,
	FOREIGN KEY (DataSourceKey) REFERENCES  [dbo].[DataSource] (DataSourceKey),
	--FOREIGN KEY (SupplierGlobalHQID) REFERENCES  [dbo].[SupplierGlobal] (SupplierGlobalHQID),
	FOREIGN KEY (StoreKey) REFERENCES  [dbo].[Store] (StoreKey) 
)
GO

SET IDENTITY_INSERT [dbo].[SupplierProduct] ON

INSERT INTO [dbo].[SupplierProduct] (SupplierProductKey,SupplierProductID,CurrentFlag,EffectiveDate,StoreKey,DataSourceKey,ProductKey,SupplierKey,CreatedDate,UpdatedDate)
VALUES (0, 0, 1 , '2000-01-01', 0, 0, 0, 0, '2000-01-01','2000-01-01')

SET IDENTITY_INSERT [dbo].[SupplierProduct] OFF

GO
--// Table [Tender]
IF OBJECT_ID('[dbo].[Tender]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[Tender]
GO

CREATE TABLE [dbo].[Tender]
(
	TenderKey		bigint IDENTITY(1,1) PRIMARY KEY,
	TenderID		bigint,
	Created			datetime,
	Modified		datetime,
	Activity		bigint,
	Amount			decimal(28, 10),
	DropPayout		bigint,
	TenderAction	int,
	TenderType		bigint,
	CurrentFlag		bit,
	EffectiveDate	datetime,
	StoreKey		bigint,
	DataSourceKey	bigint,
	CreatedDate		datetime,
	UpdatedDate		datetime,
	FOREIGN KEY (DataSourceKey) REFERENCES  [dbo].[DataSource] (DataSourceKey),
	FOREIGN KEY (StoreKey) REFERENCES  [dbo].[Store] (StoreKey)
)
GO

SET IDENTITY_INSERT [dbo].[Tender] ON

INSERT INTO [dbo].[Tender] (TenderKey,TenderID,CurrentFlag,EffectiveDate,StoreKey,DataSourceKey, CreatedDate,UpdatedDate)
VALUES (0, 0, 1, '2000-01-01', 0, 0, '2000-01-01','2000-01-01')

SET IDENTITY_INSERT [dbo].[Tender] OFF