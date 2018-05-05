USE [master]
GO

IF EXISTS(SELECT 1 FROM [sys].[databases] WHERE name ='Sale_DDS_DW')
	DROP DATABASE [Sale_DDS_DW]
GO

CREATE DATABASE [Sale_DDS_DW]
GO

USE [Sale_DDS_DW]
GO

--// Table [DimTime]
IF OBJECT_ID('[dbo].[DimTime]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[DimTime]

CREATE TABLE [dbo].[DimTime]
(
	TimeKey					bigint IDENTITY(1,1) PRIMARY KEY,
	TimeCode				nvarchar(MAX),
	FullDate				nvarchar(MAX),
	[Date]					date,
	CaledarYear				int,
	[Quarter]				int,
	QuarterName				nvarchar(MAX),
	[Month]					int,
	MonthFullName			nvarchar(MAX),
	MonthShortName			nvarchar(MAX),
	[Week]					int,
	WeekName				nvarchar(MAX),
	[DayOfMonth]			int,
	[DayOfWeek]				int,
	DayOfWeekName			nvarchar(MAX),
	DayOfWeekShortName		nvarchar(MAX),
	IsWeekend				bit,
	[Hour]					int
)
GO

SET IDENTITY_INSERT [dbo].[DimTime] ON

INSERT INTO [dbo].[DimTime] (TimeKey,TimeCode)
VALUES (0, 0)

SET IDENTITY_INSERT [dbo].[DimTime] OFF

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
	FOREIGN KEY (ProductDepartmentKey) REFERENCES  [dbo].[DimProductDepartment] (ProductDepartmentKey),
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
	StoreKey				bigint,
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
	SupplierKey				bigint,
	ProductGroupKey			bigint,
	ProductGlobalHQID		bigint,	
	ProductDepartmentKey	bigint,
	CreatedDate				datetime,
	UpdatedDate				datetime,
	FOREIGN KEY (ProductGroupKey) REFERENCES  [dbo].DimProductGroup (ProductGroupKey),
	FOREIGN KEY (ProductDepartmentKey) REFERENCES  [dbo].DimProductDepartment (ProductDepartmentKey),
	FOREIGN KEY (StoreKey) REFERENCES [dbo].DimStore (StoreKey)
)
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
	CreatedDate				datetime,
	UpdatedDate				datetime
)
GO

--// Table [DimDoctor]
IF OBJECT_ID('[dbo].[DimDoctor]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[DimDoctor]
GO

CREATE TABLE [dbo].[DimDoctor]
(
	DoctorKey				bigint PRIMARY KEY,
	DoctorID				bigint,
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
	CreatedDate				datetime,
	UpdatedDate				datetime,
)
GO

--// Table [DimPatient]
IF OBJECT_ID('[dbo].[DimPatient]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[DimPatient]
GO

CREATE TABLE [dbo].[DimPatient]
(
	PatientKey				bigint PRIMARY KEY,
	PatientID				bigint,
	PatientNumber			bigint,
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
	CreatedDate				datetime,
	UpdatedDate				datetime,
)
GO

--// Table [DimPharmacist]
IF OBJECT_ID('[dbo].[DimPharmacist]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[DimPharmacist]
GO

CREATE TABLE [dbo].[DimPharmacist]
(
	PharmacistKey			bigint PRIMARY KEY,
	PharmacistID			bigint,
	FirstName				nvarchar(MAX),
	LastName				nvarchar(MAX),
	PharmacistsInitials		nvarchar(MAX),
	RegistrationNumber		nvarchar(MAX),
	CreatedDate				datetime,
	UpdatedDate				datetime,
)
GO

--// Table [DimCustomer]
IF OBJECT_ID('[dbo].[DimCustomer]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[DimCustomer]
GO

CREATE TABLE [dbo].[DimCustomer]
(
	CustomerKey				bigint PRIMARY KEY,
	CustomerID				bigint,
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
	CreatedDate				datetime,
	UpdatedDate				datetime
)
GO

--// Table [DimStaff]
IF OBJECT_ID('[dbo].[DimStaff]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[DimStaff]
GO

CREATE TABLE [dbo].[DimStaff]
(
	StaffKey				bigint PRIMARY KEY,
	StaffID					bigint,
	StaffName				nvarchar(MAX),
	StaffNumber				nvarchar(MAX),
	StaffManager			int,
	InactiveStaff			int,
	SecurityLevel			int,
	CreatedDate				datetime,
	UpdatedDate				datetime
)
GO

--// Table [DimScript]
IF OBJECT_ID('[dbo].[DimScript]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[DimScript]
GO

CREATE TABLE [dbo].[DimScript]
(
	ScriptKey					bigint PRIMARY KEY,
	ScriptID					bigint,
	ScriptNumber				bigint,
	ScriptComment				nvarchar(MAX),
	ScriptType					nvarchar(MAX),
	ScriptStatus				nvarchar(MAX),
	ScriptClassification		nvarchar(MAX),
	Quantity					float,
	Cost						decimal(28, 10),
	SafetyNetAmount				decimal(28, 10),
	PatientPrice				decimal(28, 10),
	GovernmentRecoveryAmount	decimal(28, 10),
	WhosesaleCost				decimal(28, 10),
	GstIncluded					bit,
	Deleted						int,
	DispenseDate				datetime,
	TimeKey						bigint, -- DispenseDate
	DoctorKey					bigint,
	DrugKey						bigint,
	DrugItemKey					bigint,
	PatientKey					bigint,
	PharmacistKey				bigint,
	StoreKey					bigint,
	DataSourceKey				bigint,
	CreatedDate					datetime,
	UpdatedDate					datetime
)
GO

--// Table [DimScriptLink]
IF OBJECT_ID('[dbo].[DimScriptLink]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[DimScriptLink]
GO

CREATE TABLE [dbo].[DimScriptLink]
(
	ScriptLinkKey			bigint PRIMARY KEY,
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
	CreatedDate				datetime,
	UpdatedDate				datetime,
)
GO

--// Table [FactTransaction]
IF OBJECT_ID('[dbo].[FactTransaction]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[FactTransaction]
GO

CREATE TABLE [dbo].[FactTransaction]
(
	[TransactionKey] [bigint] NOT NULL,
	[TimeKey] [bigint] NULL,
	[StaffKey] [bigint] NULL,
	[StoreKey] [bigint] NULL,
	[CustomerKey] [bigint] NULL,
	[DataSourceKey] [bigint] NULL,
	[TransactionID] [bigint] NULL,
	[TotalRetailPrice] [decimal](28, 10) NULL,
	[TotalSaleTax] [decimal](28, 10) NULL,
	[TransactionNumber] [nvarchar](max) NULL,
	[Comment] [nvarchar](max) NULL,
	[Status] [int] NULL,
	[Type] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[TotalQuantity] [decimal](28, 10) NULL,
	[TotalCost] [decimal](28, 10) NULL,
	[TotalExtendedPrice] [decimal](28, 10) NULL,
	[TotalGovRecov] [decimal](28, 10) NULL,
	[TotalDiscount] [decimal](28, 10) NULL,
	[TotalProfit] [decimal](28, 10) NULL,
	[TotalPoints] [decimal](28, 10) NULL,
	FOREIGN KEY (StaffKey) REFERENCES  [dbo].[DimStaff] (StaffKey),
	FOREIGN KEY (CustomerKey) REFERENCES  [dbo].[DimCustomer] (CustomerKey),
	FOREIGN KEY (DataSourceKey) REFERENCES  [dbo].[DimDataSource] (DataSourceKey),
	FOREIGN KEY (StoreKey) REFERENCES  [dbo].[DimStore] (StoreKey), 
	FOREIGN KEY (TimeKey) REFERENCES  [dbo].[DimTime] (TimeKey) 
)
GO

--// Table [FactTransactionEntry]
IF OBJECT_ID('[dbo].[FactTransactionEntry]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[FactTransactionEntry]
GO

CREATE TABLE [dbo].[FactTransactionEntry]
(
	TransactionEntryKey		bigint PRIMARY KEY,
	TransactionKey			bigint,
	ScriptKey				bigint,
	ScriptLinkKey			bigint,
	ProductKey				bigint,
	ProductGlobalHQID		bigint,
	ProductDepartmentKey	bigint,
	DrugKey					bigint,
	DoctorKey				bigint,
	PatientKey				bigint,
	PharmacistKey			bigint,
	CustomerKey				bigint,
	StaffKey				bigint,
	StoreKey				bigint,
	DataSourceKey			bigint,
	TimeKey					bigint,
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
	CreatedDate				datetime,
	UpdatedDate				datetime,
	FOREIGN KEY (DataSourceKey) REFERENCES  [dbo].[DimDataSource] (DataSourceKey),
	FOREIGN KEY (TransactionKey) REFERENCES  [dbo].[FactTransaction] (TransactionKey),
	FOREIGN KEY (ScriptKey) REFERENCES  [dbo].[DimScript] (ScriptKey),
	FOREIGN KEY (ScriptLinkKey) REFERENCES  [dbo].[DimScriptLink] (ScriptLinkKey),
	FOREIGN KEY (ProductKey) REFERENCES  [dbo].[DimProduct] (ProductKey),
	FOREIGN KEY (ProductGlobalHQID) REFERENCES  [dbo].[DimProductGlobal] (ProductGlobalHQID),
	FOREIGN KEY (ProductDepartmentKey) REFERENCES  [dbo].[DimProductDepartment] (ProductDepartmentKey),
	FOREIGN KEY (ProductKey) REFERENCES  [dbo].[DimProduct] (ProductKey),
	FOREIGN KEY (StoreKey) REFERENCES  [dbo].[DimStore] (StoreKey), 
	FOREIGN KEY (DrugKey) REFERENCES  [dbo].[DimDrug] (DrugKey),
	FOREIGN KEY (DoctorKey) REFERENCES  [dbo].[DimDoctor] (DoctorKey),
	FOREIGN KEY (PatientKey) REFERENCES  [dbo].[DimPatient] (PatientKey),
	FOREIGN KEY (PharmacistKey) REFERENCES  [dbo].[DimPharmacist] (PharmacistKey),
	FOREIGN KEY (TimeKey) REFERENCES  [dbo].[DimTime] (TimeKey) 
)
GO


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