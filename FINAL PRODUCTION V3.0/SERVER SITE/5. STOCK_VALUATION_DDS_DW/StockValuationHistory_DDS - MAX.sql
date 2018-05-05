USE [master]
GO

IF EXISTS(SELECT 1 FROM [sys].[databases] WHERE name ='DDS_Stock_Valuation_History')
	DROP DATABASE DDS_Stock_Valuation_History
GO

CREATE DATABASE DDS_Stock_Valuation_History
GO

USE DDS_Stock_Valuation_History
GO
--// Table [DimDataSource]
IF OBJECT_ID('[dbo].[DimDataSource]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[DimDataSource]

CREATE TABLE [dbo].[DimDataSource]
(
	DataSourceKey	bigint PRIMARY KEY,
	DataSourceID	int,
	DataSourceName	varchar(MAX),
	CreatedDate		datetime,
	UpdatedDate		datetime,
)
GO
--// Table [DimStore]
IF OBJECT_ID('[dbo].[DimStore]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[DimStore]
GO

CREATE TABLE [dbo].[DimStore]
(
	StoreKey		bigint PRIMARY KEY,
	StoreID			int,
	StoreName		varchar(MAX),
	CreatedDate		datetime,
	UpdatedDate		datetime,
)
GO

--// Table [DimSupplier]
IF OBJECT_ID('[dbo].[DimSupplier]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[DimSupplier]
GO

CREATE TABLE [dbo].[DimSupplier]
(
	[SupplierKey] [bigint] PRIMARY KEY,
	[SupplierID] [bigint],
	[SupplierName] [nvarchar](max),
	[Address] [nvarchar](max),
	[City] [nvarchar](max),
	[PhoneNumber] [nvarchar](max),
	[FaxNumber] [nvarchar](max),
	[TaxNumber] [nvarchar](max),
	[AccountNumber] [nvarchar](max),
	[Email] [nvarchar](max),
	[Brand] [nvarchar](max),
	[SupplierGlobalHQID] [bigint],
	[CreatedDate] [datetime],
	[UpdatedDate] [datetime]
)
GO

--// Table [DimSupplierGlobal]
IF OBJECT_ID('[dbo].[DimSupplierGlobal]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[DimSupplierGlobal]
GO

CREATE TABLE [dbo].[DimSupplierGlobal](
	[SupplierGlobalHQID] [bigint] PRIMARY KEY,
	[SupplierGlobalName] [nvarchar](max) NULL,
	[ContactName] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[State] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[FaxNumber] [nvarchar](max) NULL,
	[TaxNumber] [nvarchar](max) NULL,
	[PostCode] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
)
GO

--// Table [DimProductDepartmentGlobal]
IF OBJECT_ID('[dbo].[DimProductDepartmentGlobal]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[DimProductDepartmentGlobal]
GO

CREATE TABLE [dbo].[DimProductDepartmentGlobal]
(
	ProductDepartmentGlobalHQID	bigint PRIMARY KEY,
	ProductDepartmentGlobalName	nvarchar(MAX),
	CreatedDate					datetime,
	UpdatedDate					datetime,
)
GO

--// Table [DimProductGroupGlobal]
IF OBJECT_ID('[dbo].[DimProductGroupGlobal]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[DimProductGroupGlobal]
GO

CREATE TABLE [dbo].[DimProductGroupGlobal]
(
	ProductGroupGlobalHQID		bigint PRIMARY KEY,
	ProductGroupGlobalName		nvarchar(MAX),
	ProductDepartmentGlobalHQID	bigint,
	CreatedDate					datetime,
	UpdatedDate					datetime,
	FOREIGN KEY (ProductDepartmentGlobalHQID) REFERENCES  [dbo].[DimProductDepartmentGlobal] (ProductDepartmentGlobalHQID)
)
GO

--// Table [DimProductGlobal]
IF OBJECT_ID('[dbo].[DimProductGlobal]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[DimProductGlobal]
GO

CREATE TABLE [dbo].[DimProductGlobal]
(
	ProductGlobalHQID			bigint PRIMARY KEY,
	ProductGlobalDescription	nvarchar(MAX),
	ItemnotDiscountable			bit,
	Sale_TAX					float,
	GST_TAX						char(1),
	ProductGroupGlobalHQID		bigint,
	CreatedDate					datetime,
	UpdatedDate					datetime,
	FOREIGN KEY (ProductGroupGlobalHQID) REFERENCES  [dbo].[DimProductGroupGlobal] (ProductGroupGlobalHQID)
)
GO

--// Table [DimProductDepartment]
IF OBJECT_ID('[dbo].[DimProductDepartment]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[DimProductDepartment]
GO

CREATE TABLE [dbo].[DimProductDepartment]
(
	ProductDepartmentKey		bigint PRIMARY KEY,
	ProductDepartmentID			bigint,
	ProductDepartmentName		nvarchar(MAX),
	ProductDepartmentCode		nvarchar(MAX),
	ProductDepartmentGlobalHQID	bigint,
	CreatedDate					datetime,
	UpdatedDate					datetime,
)
GO

--// Table [DimProductGroup]
IF OBJECT_ID('[dbo].[DimProductGroup]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[DimProductGroup]
GO

CREATE TABLE [dbo].[DimProductGroup]
(
	ProductGroupKey			bigint PRIMARY KEY,
	ProductGroupID			bigint,
	ProductGroupName		nvarchar(MAX),
	ProductGroupCode		nvarchar(MAX),
	GST						float,
	RegularDiscount			float,
	ExtraDiscount			float,
	Intensive				bit,
	ProductDepartmentKey	bigint,
	ProductGroupGlobalHQID	bigint,
	CreatedDate				datetime,
	UpdatedDate				datetime,
	FOREIGN KEY (ProductDepartmentKey) REFERENCES  [dbo].[DimProductDepartment] (ProductDepartmentKey)
)
GO

--// Table [DimProduct]
IF OBJECT_ID('[dbo].[DimProduct]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[DimProduct]
GO

CREATE TABLE [dbo].[DimProduct]
(
	ProductKey				bigint PRIMARY KEY,
	ProductID				bigint,
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
	ItemType				int,
	ProductGroupKey			bigint,
	ProductGlobalHQID		bigint,	
	ProductDepartmentKey	bigint,
	SupplierKey				bigint,
	StoreKey				bigint,
	CreatedDate				datetime,
	UpdatedDate				datetime,
	FOREIGN KEY (ProductGroupKey) REFERENCES  [dbo].DimProductGroup (ProductGroupKey),
	FOREIGN KEY (ProductDepartmentKey) REFERENCES  [dbo].DimProductDepartment (ProductDepartmentKey),
	FOREIGN KEY (SupplierKey) REFERENCES  [dbo].DimSupplier (SupplierKey),

)
GO

--// Table DimProductReferece
CREATE TABLE [dbo].[DimProductReference](
	[ProductReferenceKey] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductReferenceID] [bigint] NULL,
	[ProductKey] [bigint] NULL,
	[AppCatHQID] [bigint] NULL,
	[AppCatHQLastMatched] [datetime] NULL,
	[Detail1] [nvarchar](max) NULL,
	[Detail2] [nvarchar](max) NULL,
	[Detail3] [nvarchar](max) NULL,
	[FixedPrice] [bit] NULL,
	[MSRP] [decimal](28, 10) NULL,
	[ParentItem] [bigint] NULL,
	[ParentQuantity] [float] NULL,
	[PictureName] [nvarchar](max) NULL,
	[PriceLevelA] [decimal](28, 10) NULL,
	[PriceLevelB] [decimal](28, 10) NULL,
	[PriceLevelC] [decimal](28, 10) NULL,
	[PriceMustBeEntered] [bit] NULL,
	[PriceType] [int] NULL,
	[PricingPolicy] [nvarchar](max) NULL,
	[ReplacementCost] [decimal](28, 10) NULL,
	[SaleEndDate] [datetime] NULL,
	[SalePrice] [decimal](28, 10) NULL,
	[SaleStartDate] [datetime] NULL,
	[SaleType] [int] NULL,
	[SerialNumberCount] [int] NULL,
	[Taxable] [bit] NULL,
	[CurrentFlag] [bit] NULL,
	[EffectiveDate] [datetime] NULL,
	[StoreKey] [bigint] NULL,
	[DataSourceKey] [bigint] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductReferenceKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[DimProductReference]  WITH CHECK ADD FOREIGN KEY([ProductKey])
REFERENCES [dbo].[DimProduct] ([ProductKey])
GO

--// Table [DimDrug]
IF OBJECT_ID('[dbo].[DimDrug]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[DimDrug]
GO

CREATE TABLE [dbo].[DimDrug]
(
	DrugKey					bigint PRIMARY KEY,
	DrugID					bigint,
	GenericName				nvarchar(MAX),
	GenericCode				nvarchar(MAX),
	GenericCost				decimal(28, 10),
	APNCode					nvarchar(MAX),
	[Description]			nvarchar(MAX),
	Form					nvarchar(MAX),
	Strength				nvarchar(MAX),
	Packsize				decimal(28, 10),
	ProductKey				bigint,
	StoreKey				bigint,
	CreatedDate				datetime,
	UpdatedDate				datetime,
	FOREIGN KEY (ProductKey) REFERENCES [dbo].[DimProduct] (ProductKey)
)
GO

--// Table [FactStockMovement]
IF OBJECT_ID('[dbo].[FactStockMovement]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[FactStockMovement]
GO

CREATE TABLE [dbo].[FactStockMovement]
(
	StockMovementKey		bigint PRIMARY KEY,
	StockMovementID			bigint,
	RecordStatus			bigint,
	AdjustmentQuantity		decimal(28, 10),
	AfterQuantity			decimal(28, 10),
	Cost 					decimal(28, 10),
	DateAdded				datetime,
	Retail					decimal(28, 10),
	ProductKey 				bigint,
	ProductGlobalHQID		bigint,
	Reason 					bigint,
	StoreKey 				bigint,
	DataSourceKey			bigint,
	CreatedDate				datetime,
	UpdatedDate				datetime,

	FOREIGN KEY (StoreKey) REFERENCES [dbo].[DimStore] (StoreKey),
	FOREIGN KEY (ProductKey) REFERENCES [dbo].[DimProduct] (ProductKey)
)
GO

--// Table [FactBusinessAuditHistory]
IF OBJECT_ID('[dbo].[FactBusinessAuditHistory]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[FactBusinessAuditHistory]
GO

CREATE TABLE [dbo].[FactBusinessAuditHistory]
(
	BusinessAuditHistoryKey	bigint PRIMARY KEY,
	BusinessAuditHistoryID	bigint,
	AuditDate				datetime,
	AuditType				int,
	Field					nvarchar(MAX),
	Description 			nvarchar(MAX),
	FromValue				nvarchar(MAX),
	ObjectType				nvarchar(MAX),
	ToValue					nvarchar(MAX),
	ProductKey 				bigint,
	StoreKey 				bigint,
	DataSourceKey			bigint,
	ProductGlobalHQID		bigint,
	CreatedDate 			datetime,
	UpdatedDate 			datetime

	FOREIGN KEY (DataSourceKey) REFERENCES [dbo].[DimDataSource] (DataSourceKey),
	FOREIGN KEY (StoreKey) REFERENCES [dbo].[DimStore] (StoreKey),
	FOREIGN KEY (ProductKey) REFERENCES [dbo].[DimProduct] (ProductKey)
)
GO

--// Temporary Table [ResultStockValuation_Ext]
CREATE TABLE [dbo].[ResultStockValuation_Ext](
	[StoreKey] [int] NOT NULL,
	[AuditYear] [int] NOT NULL,
	[AuditMonth] [int] NOT NULL,
	[ProductKey] [bigint] NOT NULL,
	[ProductCode] [nvarchar](50) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[Department] [nvarchar](50) NOT NULL,
	[Category] [nvarchar](50) NOT NULL,
	[Cost] [decimal](9, 2) NOT NULL,
	[QuantityOnHand] [float] NOT NULL,
	[TotalCost] [decimal](9, 2) NOT NULL,
	[TotalLastCostPCT] [decimal](9, 2) NOT NULL,
 CONSTRAINT [PK_ResultStockValuation_Extension] PRIMARY KEY CLUSTERED 
(
	[StoreKey] ASC,
	[AuditYear] ASC,
	[AuditMonth] ASC,
	[ProductKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
		
		
----------------------------------------------------------------------------------------------------------------------------------
-- ************************************************************************************************************************** ----
-- ************************************************   STORED PROCEDURE    ***************************************************** ----
-- ************************************************************************************************************************** ----
----------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[p_generate_DimTime]
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @StartDate		date
	DECLARE @EndDate		date
	DECLARE @CurrentDate	date
	DECLARE @Hour			int
	DECLARE @Count			int

	--// Check if DimTime has data or not
	IF NOT EXISTS (SELECT 1 FROM [Sale_DDS_DW].[dbo].[DimTime] WHERE TimeKey <> 0)
		SET @StartDate = '2010-01-01'
	ELSE
	BEGIN
		--// Check if current date < Max date on DimTime
		DECLARE @MaxDate date
		SELECT @MaxDate = MAX([Date]) FROM [Sale_DDS_DW].[dbo].[DimTime]
		
		IF (@MaxDate > CONVERT(date, GETDATE()))
			RETURN
		ELSE
			SET @StartDate = CONVERT(date, GETDATE())
	END	

	SELECT  @EndDate = DATEADD(YEAR, 10, @StartDate)
		   ,@CurrentDate = @StartDate
		   ,@Hour = 0

	WHILE @CurrentDate <= @EndDate
	BEGIN 
		WHILE @Hour < 24
		BEGIN
			INSERT INTO [Sale_DDS_DW].[dbo].[DimTime] (TimeCode, FullDate, [Date], CaledarYear, [Quarter], QuarterName, [Month], MonthFullName, MonthShortName, [Week], WeekName, [DayOfMonth], [DayOfWeek], DayOfWeekName, DayOfWeekShortName, IsWeekend, [Hour]) 
			VALUES	( 
						 YEAR(@CurrentDate) * 1000000 + MONTH(@CurrentDate) * 10000 + DAY(@CurrentDate) * 100 + @Hour
						,YEAR(@CurrentDate) * 10000 + MONTH(@CurrentDate) * 100 + DAY(@CurrentDate)
						,@CurrentDate
						,YEAR(@CurrentDate)
						,DATENAME(QUARTER,@CurrentDate)
						,CONCAT('Quater-',DATENAME(QUARTER,@CurrentDate))
						,MONTH(@CurrentDate)
						,DATENAME(MONTH, @CurrentDate)
						,LEFT(DATENAME(MONTH, @CurrentDate), 3) 
						,DATEPART(ISO_WEEK, @CurrentDate) 
						,CONCAT('Week-#-',(CASE WHEN DATEPART(ISO_WEEK, @CurrentDate) < 10 THEN CONCAT('0', DATEPART(ISO_WEEK, @CurrentDate)) ELSE DATEPART(ISO_WEEK, @CurrentDate) END))
						,DAY(@CurrentDate)
						,DATEPART(DW, @CurrentDate) 
						,DATENAME(WEEKDAY,@CurrentDate)
						,LEFT(DATENAME(WEEKDAY,@CurrentDate), 3)
						,CASE WHEN DATEPART(DW, @CurrentDate) in (1,7) Then 1 ELSE 0 END
						,@Hour
					)
			SET @Hour = @Hour + 1
		END	
		SET @Hour = 0
		SET	@CurrentDate = DATEADD(DAY, 1, @CurrentDate)
	END
END