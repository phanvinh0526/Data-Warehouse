/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2014 (12.0.5000)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [master]
GO
/****** Object:  Database [STAGING_FRED_POS]    Script Date: 14/09/2017 10:44:00 AM ******/
CREATE DATABASE [STAGING_FRED_POS]
GO
ALTER DATABASE [STAGING_FRED_POS] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [STAGING_FRED_POS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [STAGING_FRED_POS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [STAGING_FRED_POS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [STAGING_FRED_POS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [STAGING_FRED_POS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [STAGING_FRED_POS] SET ARITHABORT OFF 
GO
ALTER DATABASE [STAGING_FRED_POS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [STAGING_FRED_POS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [STAGING_FRED_POS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [STAGING_FRED_POS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [STAGING_FRED_POS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [STAGING_FRED_POS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [STAGING_FRED_POS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [STAGING_FRED_POS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [STAGING_FRED_POS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [STAGING_FRED_POS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [STAGING_FRED_POS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [STAGING_FRED_POS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [STAGING_FRED_POS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [STAGING_FRED_POS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [STAGING_FRED_POS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [STAGING_FRED_POS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [STAGING_FRED_POS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [STAGING_FRED_POS] SET RECOVERY FULL 
GO
ALTER DATABASE [STAGING_FRED_POS] SET  MULTI_USER 
GO
ALTER DATABASE [STAGING_FRED_POS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [STAGING_FRED_POS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [STAGING_FRED_POS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [STAGING_FRED_POS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [STAGING_FRED_POS] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'STAGING_FRED_POS', N'ON'
GO
USE [STAGING_FRED_POS]
GO
/****** Object:  User [dw_user]    Script Date: 14/09/2017 10:44:00 AM ******/
CREATE USER [dw_user] FOR LOGIN [dw_user] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [dw_user]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [dw_user]
GO
/****** Object:  Table [dbo].[Batch]    Script Date: 14/09/2017 10:44:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Batch](
	[CustomerDepositMade] [money] NOT NULL,
	[CustomerDepositRedeemed] [money] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[StoreID] [int] NOT NULL,
	[BatchNumber] [int] IDENTITY(1,1) NOT NULL,
	[Status] [smallint] NOT NULL,
	[RegisterID] [int] NOT NULL,
	[OpeningTime] [datetime] NULL,
	[ClosingTime] [datetime] NULL,
	[OpeningTotal] [money] NOT NULL,
	[ClosingTotal] [money] NOT NULL,
	[Sales] [money] NOT NULL,
	[Returns] [money] NOT NULL,
	[Tax] [money] NOT NULL,
	[SalesPlusTax] [money] NOT NULL,
	[Commission] [money] NOT NULL,
	[PaidOut] [money] NOT NULL,
	[Dropped] [money] NOT NULL,
	[PaidOnAccount] [money] NOT NULL,
	[PaidToAccount] [money] NOT NULL,
	[CustomerCount] [int] NOT NULL,
	[NoSalesCount] [int] NOT NULL,
	[AbortedTransCount] [int] NOT NULL,
	[TotalTendered] [money] NOT NULL,
	[TotalChange] [money] NOT NULL,
	[Discounts] [money] NOT NULL,
	[CostOfGoods] [money] NOT NULL,
	[LayawayPaid] [money] NOT NULL,
	[LayawayClosed] [money] NOT NULL,
	[Shipping] [money] NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[TenderRoundingError] [money] NOT NULL,
	[DebitSurcharge] [money] NOT NULL,
	[CashBackSurcharge] [money] NOT NULL,
	[NUSSkipUpdate] [bit] NOT NULL,
	[NUSSkipPOUpdate] [bit] NOT NULL,
 CONSTRAINT [PK_Batch] PRIMARY KEY NONCLUSTERED 
(
	[BatchNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cashier]    Script Date: 14/09/2017 10:44:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cashier](
	[HQID] [int] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[Number] [nvarchar](9) NOT NULL,
	[StoreID] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](12) NOT NULL,
	[FloorLimit] [money] NOT NULL,
	[ReturnLimit] [money] NOT NULL,
	[CashDrawerNumber] [smallint] NOT NULL,
	[SecurityLevel] [smallint] NOT NULL,
	[Privileges] [int] NOT NULL,
	[EmailAddress] [nvarchar](255) NOT NULL,
	[FailedLogonAttempts] [int] NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[MaxOverShortAmount] [money] NOT NULL,
	[MaxOverShortPercent] [float] NOT NULL,
	[OverShortLimitType] [int] NOT NULL,
	[Telephone] [nvarchar](30) NOT NULL,
	[NUSSkipUpdate] [bit] NOT NULL,
	[NUSSkipPOUpdate] [bit] NOT NULL,
 CONSTRAINT [PK_Cashier] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 14/09/2017 10:44:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[HQID] [int] NOT NULL,
	[ID] [int] NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Code] [nvarchar](17) NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[NUSSkipUpdate] [bit] NOT NULL,
	[NUSSkipPOUpdate] [bit] NOT NULL,
	[IID] [bigint] IDENTITY(1,1) NOT NULL,
	[Location] [int] NOT NULL,
	[UploadDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY NONCLUSTERED 
(
	[IID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 14/09/2017 10:44:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[AccountNumber] [nvarchar](20) NOT NULL,
	[AccountTypeID] [int] NOT NULL,
	[Address2] [nvarchar](50) NOT NULL,
	[AssessFinanceCharges] [bit] NOT NULL,
	[Company] [nvarchar](50) NOT NULL,
	[Country] [nvarchar](20) NOT NULL,
	[CustomDate1] [datetime] NULL,
	[CustomDate2] [datetime] NULL,
	[CustomDate3] [datetime] NULL,
	[CustomDate4] [datetime] NULL,
	[CustomDate5] [datetime] NULL,
	[CustomNumber1] [float] NOT NULL,
	[CustomNumber2] [float] NOT NULL,
	[CustomNumber3] [float] NOT NULL,
	[CustomNumber4] [float] NOT NULL,
	[CustomNumber5] [float] NOT NULL,
	[CustomText1] [nvarchar](30) NOT NULL,
	[CustomText2] [nvarchar](30) NOT NULL,
	[CustomText3] [nvarchar](30) NOT NULL,
	[CustomText4] [nvarchar](30) NOT NULL,
	[CustomText5] [nvarchar](30) NOT NULL,
	[GlobalCustomer] [bit] NOT NULL,
	[HQID] [int] NOT NULL,
	[LastStartingDate] [datetime] NULL,
	[LastClosingDate] [datetime] NULL,
	[LastUpdated] [datetime] NOT NULL,
	[LimitPurchase] [bit] NOT NULL,
	[LastClosingBalance] [money] NOT NULL,
	[PrimaryShipToID] [int] NOT NULL,
	[State] [nvarchar](20) NOT NULL,
	[StoreID] [int] NOT NULL,
	[ID] [int] NOT NULL,
	[LayawayCustomer] [bit] NOT NULL,
	[Employee] [bit] NOT NULL,
	[FirstName] [nvarchar](30) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Zip] [nvarchar](15) NOT NULL,
	[AccountBalance] [money] NOT NULL,
	[CreditLimit] [money] NOT NULL,
	[TotalSales] [money] NOT NULL,
	[AccountOpened] [datetime] NOT NULL,
	[LastVisit] [datetime] NOT NULL,
	[TotalVisits] [int] NOT NULL,
	[TotalSavings] [money] NOT NULL,
	[CurrentDiscount] [real] NOT NULL,
	[PriceLevel] [smallint] NOT NULL,
	[TaxExempt] [bit] NOT NULL,
	[Notes] [ntext] NULL,
	[Title] [nvarchar](20) NOT NULL,
	[EmailAddress] [nvarchar](255) NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[TaxNumber] [nvarchar](20) NOT NULL,
	[PictureName] [nvarchar](50) NOT NULL,
	[DefaultShippingServiceID] [int] NOT NULL,
	[PhoneNumber] [nvarchar](30) NOT NULL,
	[FaxNumber] [nvarchar](30) NOT NULL,
	[CashierID] [int] NOT NULL,
	[SalesRepID] [int] NOT NULL,
	[NUSSkipUpdate] [bit] NOT NULL,
	[NUSSkipPOUpdate] [bit] NOT NULL,
	[NUS_AccountTypeName] [nvarchar](4000) NOT NULL,
	[IID] [bigint] IDENTITY(1,1) NOT NULL,
	[Location] [int] NOT NULL,
	[UploadDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY NONCLUSTERED 
(
	[IID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DailySales]    Script Date: 14/09/2017 10:44:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DailySales](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Type] [int] NOT NULL,
	[TypeID] [int] NOT NULL,
	[Total] [money] NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[StoreID] [int] NOT NULL,
 CONSTRAINT [PK_DailySales] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 14/09/2017 10:44:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[HQID] [int] NOT NULL,
	[ID] [int] NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[code] [nvarchar](17) NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[NUSSkipUpdate] [bit] NOT NULL,
	[NUSSkipPOUpdate] [bit] NOT NULL,
	[IID] [bigint] IDENTITY(1,1) NOT NULL,
	[Location] [int] NOT NULL,
	[UploadDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY NONCLUSTERED 
(
	[IID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 14/09/2017 10:44:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[BinLocation] [nvarchar](20) NOT NULL,
	[BuydownPrice] [money] NOT NULL,
	[BuydownQuantity] [float] NOT NULL,
	[CommissionAmount] [money] NOT NULL,
	[CommissionMaximum] [money] NOT NULL,
	[CommissionMode] [int] NOT NULL,
	[CommissionPercentProfit] [real] NOT NULL,
	[CommissionPercentSale] [real] NOT NULL,
	[Description] [nvarchar](30) NOT NULL,
	[FoodStampable] [bit] NOT NULL,
	[HQID] [int] NOT NULL,
	[ItemNotDiscountable] [bit] NOT NULL,
	[LastReceived] [datetime] NULL,
	[LastUpdated] [datetime] NOT NULL,
	[Notes] [ntext] NULL,
	[QuantityCommitted] [float] NOT NULL,
	[SerialNumberCount] [int] NOT NULL,
	[TareWeightPercent] [float] NOT NULL,
	[ID] [int] NOT NULL,
	[ItemLookupCode] [nvarchar](25) NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[MessageID] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[PriceA] [money] NOT NULL,
	[PriceB] [money] NOT NULL,
	[PriceC] [money] NOT NULL,
	[SalePrice] [money] NOT NULL,
	[SaleStartDate] [datetime] NULL,
	[SaleEndDate] [datetime] NULL,
	[QuantityDiscountID] [int] NOT NULL,
	[TaxID] [int] NOT NULL,
	[ItemType] [smallint] NOT NULL,
	[Cost] [money] NOT NULL,
	[Quantity] [float] NOT NULL,
	[ReorderPoint] [float] NOT NULL,
	[RestockLevel] [float] NOT NULL,
	[TareWeight] [float] NOT NULL,
	[SupplierID] [int] NOT NULL,
	[TagAlongItem] [int] NOT NULL,
	[TagAlongQuantity] [float] NOT NULL,
	[ParentItem] [int] NOT NULL,
	[ParentQuantity] [float] NOT NULL,
	[BarcodeFormat] [smallint] NOT NULL,
	[PriceLowerBound] [money] NOT NULL,
	[PriceUpperBound] [money] NOT NULL,
	[PictureName] [nvarchar](50) NOT NULL,
	[LastSold] [datetime] NULL,
	[ExtendedDescription] [ntext] NOT NULL,
	[SubDescription1] [nvarchar](30) NOT NULL,
	[SubDescription2] [nvarchar](30) NOT NULL,
	[SubDescription3] [nvarchar](30) NOT NULL,
	[UnitOfMeasure] [nvarchar](4) NOT NULL,
	[SubCategoryID] [int] NOT NULL,
	[QuantityEntryNotAllowed] [bit] NOT NULL,
	[PriceMustBeEntered] [bit] NOT NULL,
	[BlockSalesReason] [nvarchar](30) NOT NULL,
	[BlockSalesAfterDate] [datetime] NULL,
	[Weight] [float] NOT NULL,
	[Taxable] [bit] NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[BlockSalesBeforeDate] [datetime] NULL,
	[LastCost] [money] NOT NULL,
	[ReplacementCost] [money] NOT NULL,
	[WebItem] [bit] NOT NULL,
	[BlockSalesType] [int] NOT NULL,
	[BlockSalesScheduleID] [int] NOT NULL,
	[SaleType] [int] NOT NULL,
	[SaleScheduleID] [int] NOT NULL,
	[Consignment] [bit] NOT NULL,
	[Inactive] [bit] NOT NULL,
	[LastCounted] [datetime] NULL,
	[DoNotOrder] [bit] NOT NULL,
	[MSRP] [money] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[Content] [ntext] NOT NULL,
	[UsuallyShip] [nvarchar](255) NOT NULL,
	[NUSSkipUpdate] [bit] NOT NULL,
	[NUSSkipPOUpdate] [bit] NOT NULL,
	[NUS_ExcludedFromLoyalty] [bit] NOT NULL,
	[IID] [bigint] IDENTITY(1,1) NOT NULL,
	[Location] [int] NOT NULL,
	[UploadDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY NONCLUSTERED 
(
	[IID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NUS_PO_Patient]    Script Date: 14/09/2017 10:44:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NUS_PO_Patient](
	[Id] [bigint] NOT NULL,
	[PatientNumber] [bigint] NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[Title] [varchar](6) NOT NULL,
	[Address] [varchar](40) NOT NULL,
	[Suburb] [varchar](50) NOT NULL,
	[PostCode] [int] NOT NULL,
	[NUSSkipPOUpdate] [bit] NOT NULL,
	[IID] [bigint] IDENTITY(1,1) NOT NULL,
	[Location] [int] NOT NULL,
	[UploadDate] [datetime] NOT NULL,
 CONSTRAINT [PK_NUS_PO_Patient] PRIMARY KEY CLUSTERED 
(
	[IID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NUS_PO_Script]    Script Date: 14/09/2017 10:44:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NUS_PO_Script](
	[Id] [bigint] NOT NULL,
	[ScriptNumber] [bigint] NOT NULL,
	[DispenseNumber] [int] NOT NULL,
	[PatientPrice] [money] NOT NULL,
	[GstIncluded] [bit] NOT NULL,
	[SaleCost] [money] NOT NULL,
	[DispenseDate] [datetime] NOT NULL,
	[Patient] [bigint] NOT NULL,
	[DrugItem] [bigint] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Packs] [float] NOT NULL,
	[NationalHealthSchemeCode] [varchar](6) NOT NULL,
	[ScriptType] [varchar](4) NOT NULL,
	[DrugDescription] [varchar](42) NOT NULL,
	[GovernmentRecoveryAmount] [money] NOT NULL,
	[RegisterId] [bigint] NOT NULL,
	[SaleActivityEntry] [bigint] NOT NULL,
	[ReturnActivityEntry] [bigint] NOT NULL,
	[WorkOrderId] [bigint] NOT NULL,
	[ChargeAccount] [bigint] NOT NULL,
	[ChargeAmount] [money] NOT NULL,
	[InstanceCount] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[Processed] [bit] NOT NULL,
	[Available] [bit] NOT NULL,
	[ActivityAction] [int] NOT NULL,
	[PerformStockMovement] [bit] NOT NULL,
	[VisibleSale]  AS (case when [ActivityAction]<>(8) AND [Available]=(1) AND [WorkOrderId]=(0) AND [SaleActivityEntry]=(0) then (1) else (0) end),
	[VisibleReturn]  AS (case when [ActivityAction]<>(8) AND [Available]=(1) AND [WorkOrderId]=(0) AND [SaleActivityEntry]>(0) then (1) else (0) end),
	[NUSSkipPOUpdate] [bit] NOT NULL,
	[Created] [datetime] NOT NULL,
	[IID] [bigint] IDENTITY(1,1) NOT NULL,
	[Location] [int] NOT NULL,
	[UploadDate] [datetime] NOT NULL,
 CONSTRAINT [PK_NUS_PO_Script] PRIMARY KEY CLUSTERED 
(
	[IID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NUS_PostCodeTransaction]    Script Date: 14/09/2017 10:44:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NUS_PostCodeTransaction](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[PostCode] [varchar](100) NOT NULL,
	[RegisterID] [int] NULL,
	[CashierID] [int] NULL,
	[CustomerID] [int] NULL,
	[TransactionNumber] [int] NULL,
	[NUSSkipUpdate] [bit] NOT NULL,
 CONSTRAINT [PK_NUS_PostCodeRegistration] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NUS_TransactionStats]    Script Date: 14/09/2017 10:44:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NUS_TransactionStats](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[DateTransactionStart] [datetime] NOT NULL,
	[RegisterID] [int] NULL,
	[CashierID] [int] NULL,
	[TransactionNumber] [int] NULL,
	[ChangeCount] [int] NULL,
 CONSTRAINT [PK_NUS_TransactionStats] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Register]    Script Date: 14/09/2017 10:44:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Register](
	[Description] [nvarchar](30) NOT NULL,
	[PoleDisplayEnabled] [bit] NOT NULL,
	[Receipt2ID] [int] NOT NULL,
	[ScaleEnabled] [bit] NOT NULL,
	[ScaleTimeout] [float] NOT NULL,
	[ScannerEnabled] [bit] NOT NULL,
	[ZZBatchNumber] [int] NOT NULL,
	[ID] [int] NOT NULL,
	[Number] [smallint] NOT NULL,
	[CurrentBatchNumber] [int] NOT NULL,
	[Receipt1ID] [int] NOT NULL,
	[PoleDisplayMessageID] [int] NOT NULL,
	[Printer1Name] [nvarchar](255) NOT NULL,
	[Printer1Options] [int] NOT NULL,
	[Printer2Name] [nvarchar](255) NOT NULL,
	[Printer2Options] [int] NOT NULL,
	[ChannelID] [int] NOT NULL,
	[NetDisplayEnabled] [bit] NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[DefaultPriceLevel] [int] NOT NULL,
	[PoleDisplayName] [nvarchar](255) NOT NULL,
	[ScaleName] [nvarchar](255) NOT NULL,
	[ScannerName] [nvarchar](255) NOT NULL,
	[Printer1Type] [int] NOT NULL,
	[Printer2Type] [int] NOT NULL,
	[CashDrawer1Name] [nvarchar](255) NOT NULL,
	[CashDrawer1Enabled] [bit] NOT NULL,
	[CashDrawer1WaitForClose] [bit] NOT NULL,
	[CashDrawer1OpenTimeout] [int] NOT NULL,
	[CashDrawer2Name] [nvarchar](255) NOT NULL,
	[CashDrawer2Enabled] [bit] NOT NULL,
	[CashDrawer2WaitForClose] [bit] NOT NULL,
	[CashDrawer2OpenTimeout] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[MICRName] [nvarchar](255) NOT NULL,
	[MICREnabled] [bit] NOT NULL,
	[MICRTimeout] [float] NOT NULL,
	[MSRName] [nvarchar](255) NOT NULL,
	[MSREnabled] [bit] NOT NULL,
	[SignatureCaptureName] [nvarchar](255) NOT NULL,
	[SignatureCaptureEnabled] [bit] NOT NULL,
	[SignatureCaptureFormName] [nvarchar](255) NOT NULL,
	[TouchScreenEnabled] [bit] NOT NULL,
	[KeyboardID] [int] NOT NULL,
	[DefaultServiceID] [int] NOT NULL,
	[PINPadEnabled] [bit] NOT NULL,
	[PINPadName] [nvarchar](255) NOT NULL,
	[PINPadSystem] [varchar](25) NOT NULL,
	[TransactionHost] [int] NOT NULL,
	[RealTimeSigCap] [bit] NOT NULL,
	[NUSSkipUpdate] [bit] NOT NULL,
	[NUSSkipPOUpdate] [bit] NOT NULL,
	[IID] [bigint] IDENTITY(1,1) NOT NULL,
	[Location] [int] NOT NULL,
	[UploadDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Register] PRIMARY KEY NONCLUSTERED 
(
	[IID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesRep]    Script Date: 14/09/2017 10:44:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesRep](
	[HQID] [int] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[Number] [nvarchar](10) NOT NULL,
	[StoreID] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[PercentOfSale] [real] NOT NULL,
	[PercentOfProfit] [real] NOT NULL,
	[FixedRate] [money] NOT NULL,
	[EmailAddress] [nvarchar](255) NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[Telephone] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_SalesRep] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Store]    Script Date: 14/09/2017 10:44:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Store](
	[ID] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[StoreCode] [varchar](30) NOT NULL,
	[Region] [varchar](50) NOT NULL,
	[Address1] [varchar](50) NOT NULL,
	[Address2] [varchar](50) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[Country] [varchar](20) NOT NULL,
	[FaxNumber] [varchar](30) NOT NULL,
	[PhoneNumber] [varchar](30) NOT NULL,
	[State] [varchar](20) NOT NULL,
	[Zip] [varchar](15) NOT NULL,
	[ParentStoreID] [int] NOT NULL,
	[ScheduleHourMask1] [int] NOT NULL,
	[ScheduleHourMask2] [int] NOT NULL,
	[ScheduleHourMask3] [int] NOT NULL,
	[ScheduleHourMask4] [int] NOT NULL,
	[ScheduleHourMask5] [int] NOT NULL,
	[ScheduleHourMask6] [int] NOT NULL,
	[ScheduleHourMask7] [int] NOT NULL,
	[ScheduleMinute] [int] NOT NULL,
	[RetryCount] [int] NOT NULL,
	[RetryDelay] [int] NOT NULL,
	[LastUpdated] [datetime] NULL,
	[AccountName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[DBTimeStamp] [timestamp] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 14/09/2017 10:44:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[Country] [nvarchar](20) NOT NULL,
	[HQID] [int] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[State] [nvarchar](20) NOT NULL,
	[ID] [int] NOT NULL,
	[SupplierName] [nvarchar](30) NOT NULL,
	[ContactName] [nvarchar](30) NOT NULL,
	[Address1] [nvarchar](30) NOT NULL,
	[Address2] [nvarchar](30) NOT NULL,
	[City] [nvarchar](30) NOT NULL,
	[Zip] [nvarchar](20) NOT NULL,
	[EmailAddress] [nvarchar](255) NOT NULL,
	[WebPageAddress] [nvarchar](255) NOT NULL,
	[Code] [nvarchar](17) NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[AccountNumber] [nvarchar](20) NOT NULL,
	[TaxNumber] [nvarchar](20) NOT NULL,
	[CurrencyID] [int] NOT NULL,
	[PhoneNumber] [nvarchar](30) NOT NULL,
	[FaxNumber] [nvarchar](30) NOT NULL,
	[CustomText1] [nvarchar](30) NOT NULL,
	[CustomText2] [nvarchar](30) NOT NULL,
	[CustomText3] [nvarchar](30) NOT NULL,
	[CustomText4] [nvarchar](30) NOT NULL,
	[CustomText5] [nvarchar](30) NOT NULL,
	[CustomNumber1] [float] NOT NULL,
	[CustomNumber2] [float] NOT NULL,
	[CustomNumber3] [float] NOT NULL,
	[CustomNumber4] [float] NOT NULL,
	[CustomNumber5] [float] NOT NULL,
	[CustomDate1] [datetime] NULL,
	[CustomDate2] [datetime] NULL,
	[CustomDate3] [datetime] NULL,
	[CustomDate4] [datetime] NULL,
	[CustomDate5] [datetime] NULL,
	[Notes] [ntext] NOT NULL,
	[Terms] [nvarchar](50) NOT NULL,
	[NUSSkipUpdate] [bit] NOT NULL,
	[NUSSkipPOUpdate] [bit] NOT NULL,
	[IID] [bigint] IDENTITY(1,1) NOT NULL,
	[Location] [int] NOT NULL,
	[UploadDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY NONCLUSTERED 
(
	[IID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tax]    Script Date: 14/09/2017 10:44:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tax](
	[FixedAmount] [money] NOT NULL,
	[HQID] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](25) NOT NULL,
	[Percentage] [real] NOT NULL,
	[UsePartialDollar] [bit] NOT NULL,
	[ItemMaximum] [money] NOT NULL,
	[IncludePreviousTax] [bit] NOT NULL,
	[Bracket00] [money] NOT NULL,
	[Bracket01] [money] NOT NULL,
	[Bracket02] [money] NOT NULL,
	[Bracket03] [money] NOT NULL,
	[Bracket04] [money] NOT NULL,
	[Bracket05] [money] NOT NULL,
	[Bracket06] [money] NOT NULL,
	[Bracket07] [money] NOT NULL,
	[Bracket08] [money] NOT NULL,
	[Bracket09] [money] NOT NULL,
	[Bracket10] [money] NOT NULL,
	[Code] [nvarchar](17) NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[ItemMinimum] [money] NOT NULL,
	[ApplyOverMinimum] [bit] NOT NULL,
	[Bracket11] [money] NOT NULL,
	[Bracket12] [money] NOT NULL,
	[Bracket13] [money] NOT NULL,
	[Bracket14] [money] NOT NULL,
	[Bracket15] [money] NOT NULL,
	[Bracket16] [money] NOT NULL,
	[Bracket17] [money] NOT NULL,
	[Bracket18] [money] NOT NULL,
	[Bracket19] [money] NOT NULL,
	[Bracket20] [money] NOT NULL,
	[Bracket21] [money] NOT NULL,
	[Bracket22] [money] NOT NULL,
	[Bracket23] [money] NOT NULL,
	[Bracket24] [money] NOT NULL,
	[Bracket25] [money] NOT NULL,
	[Bracket26] [money] NOT NULL,
	[Bracket27] [money] NOT NULL,
	[Bracket28] [money] NOT NULL,
	[Bracket29] [money] NOT NULL,
	[Bracket30] [money] NOT NULL,
	[BracketValue01] [money] NOT NULL,
	[BracketValue02] [money] NOT NULL,
	[BracketValue03] [money] NOT NULL,
	[BracketValue04] [money] NOT NULL,
	[BracketValue05] [money] NOT NULL,
	[BracketValue06] [money] NOT NULL,
	[BracketValue07] [money] NOT NULL,
	[BracketValue08] [money] NOT NULL,
	[BracketValue09] [money] NOT NULL,
	[BracketValue10] [money] NOT NULL,
	[BracketValue11] [money] NOT NULL,
	[BracketValue12] [money] NOT NULL,
	[BracketValue13] [money] NOT NULL,
	[BracketValue14] [money] NOT NULL,
	[BracketValue15] [money] NOT NULL,
	[BracketValue16] [money] NOT NULL,
	[BracketValue17] [money] NOT NULL,
	[BracketValue18] [money] NOT NULL,
	[BracketValue19] [money] NOT NULL,
	[BracketValue20] [money] NOT NULL,
	[BracketValue21] [money] NOT NULL,
	[BracketValue22] [money] NOT NULL,
	[BracketValue23] [money] NOT NULL,
	[BracketValue24] [money] NOT NULL,
	[BracketValue25] [money] NOT NULL,
	[BracketValue26] [money] NOT NULL,
	[BracketValue27] [money] NOT NULL,
	[BracketValue28] [money] NOT NULL,
	[BracketValue29] [money] NOT NULL,
	[BracketValue30] [money] NOT NULL,
	[NUSSkipUpdate] [bit] NOT NULL,
	[NUSSkipPOUpdate] [bit] NOT NULL,
 CONSTRAINT [PK_Tax] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaxEntry]    Script Date: 14/09/2017 10:44:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaxEntry](
	[StoreID] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TaxID] [int] NOT NULL,
	[TransactionNumber] [int] NOT NULL,
	[Tax] [money] NOT NULL,
	[TaxableAmount] [money] NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[TransactionEntryID] [int] NOT NULL,
	[NUSSkipUpdate] [bit] NOT NULL,
 CONSTRAINT [PK_TaxEntry] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tender]    Script Date: 14/09/2017 10:44:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tender](
	[HQID] [int] NOT NULL,
	[PreventOverTendering] [bit] NOT NULL,
	[VerificationType] [int] NOT NULL,
	[VerifyViaEDC] [bit] NOT NULL,
	[ID] [int] NOT NULL,
	[Description] [nvarchar](25) NOT NULL,
	[AdditionalDetailType] [smallint] NOT NULL,
	[PrinterValidation] [bit] NOT NULL,
	[ValidationLine1] [nvarchar](20) NOT NULL,
	[ValidationLine2] [nvarchar](20) NOT NULL,
	[ValidationLine3] [nvarchar](20) NOT NULL,
	[GLAccount] [nvarchar](20) NOT NULL,
	[ScanCode] [smallint] NOT NULL,
	[RoundToValue] [money] NOT NULL,
	[Code] [nvarchar](17) NOT NULL,
	[MaximumAmount] [money] NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[DoNotPopCashDrawer] [bit] NOT NULL,
	[CurrencyID] [int] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[ValidationMask] [nvarchar](25) NOT NULL,
	[SignatureRequired] [bit] NOT NULL,
	[AllowMultipleEntries] [bit] NOT NULL,
	[DebitSurcharge] [money] NOT NULL,
	[SupportCashBack] [bit] NOT NULL,
	[CashBackLimit] [money] NOT NULL,
	[CashBackFee] [money] NOT NULL,
	[NUSSkipUpdate] [bit] NOT NULL,
	[NUSSkipPOUpdate] [bit] NOT NULL,
	[IID] [bigint] IDENTITY(1,1) NOT NULL,
	[Location] [int] NOT NULL,
	[UploadDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Tender] PRIMARY KEY NONCLUSTERED 
(
	[IID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TenderEntry]    Script Date: 14/09/2017 10:44:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TenderEntry](
	[BatchNumber] [int] NOT NULL,
	[CreditCardExpiration] [nvarchar](10) NOT NULL,
	[OrderHistoryID] [int] NOT NULL,
	[DropPayoutID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ID] [int] NOT NULL,
	[TransactionNumber] [int] NOT NULL,
	[TenderID] [int] NOT NULL,
	[PaymentID] [int] NOT NULL,
	[Description] [nvarchar](30) NOT NULL,
	[CreditCardNumber] [nvarchar](25) NOT NULL,
	[CreditCardApprovalCode] [nvarchar](20) NOT NULL,
	[Amount] [money] NOT NULL,
	[AccountHolder] [nvarchar](40) NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[RoundingError] [money] NOT NULL,
	[AmountForeign] [money] NOT NULL,
	[BankNumber] [nvarchar](25) NOT NULL,
	[SerialNumber] [nvarchar](25) NOT NULL,
	[State] [nvarchar](10) NOT NULL,
	[License] [nvarchar](25) NOT NULL,
	[BirthDate] [datetime] NULL,
	[TransitNumber] [nvarchar](25) NOT NULL,
	[VisaNetAuthorizationID] [int] NOT NULL,
	[DebitSurcharge] [money] NOT NULL,
	[CashBackSurcharge] [money] NOT NULL,
	[NUSSkipUpdate] [bit] NOT NULL,
	[NUSSkipPOUpdate] [bit] NOT NULL,
	[IID] [bigint] IDENTITY(1,1) NOT NULL,
	[Location] [int] NOT NULL,
	[UploadDate] [datetime] NOT NULL,
 CONSTRAINT [PK_TenderEntry] PRIMARY KEY NONCLUSTERED 
(
	[IID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction]    Script Date: 14/09/2017 10:44:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction](
	[ShipToID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[TransactionNumber] [int] NOT NULL,
	[BatchNumber] [int] NOT NULL,
	[Time] [datetime] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[CashierID] [int] NOT NULL,
	[Total] [money] NOT NULL,
	[SalesTax] [money] NOT NULL,
	[Comment] [nvarchar](255) NOT NULL,
	[ReferenceNumber] [nvarchar](50) NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[Status] [int] NOT NULL,
	[ExchangeID] [int] NOT NULL,
	[ChannelType] [int] NOT NULL,
	[RecallID] [int] NOT NULL,
	[RecallType] [int] NOT NULL,
	[NUSSkipUpdate] [bit] NOT NULL,
	[NUSSkipPOUpdate] [bit] NOT NULL,
	[IID] [bigint] IDENTITY(1,1) NOT NULL,
	[Location] [int] NOT NULL,
	[UploadDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Transaction] PRIMARY KEY NONCLUSTERED 
(
	[IID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionEntry]    Script Date: 14/09/2017 10:44:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionEntry](
	[Commission] [money] NOT NULL,
	[Cost] [money] NOT NULL,
	[FullPrice] [money] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ID] [int] NOT NULL,
	[TransactionNumber] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[PriceSource] [smallint] NOT NULL,
	[Quantity] [float] NOT NULL,
	[SalesRepID] [int] NOT NULL,
	[Taxable] [bit] NOT NULL,
	[DetailID] [int] NOT NULL,
	[Comment] [nvarchar](255) NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[DiscountReasonCodeID] [int] NOT NULL,
	[ReturnReasonCodeID] [int] NOT NULL,
	[TaxChangeReasonCodeID] [int] NOT NULL,
	[SalesTax] [money] NOT NULL,
	[QuantityDiscountID] [int] NOT NULL,
	[NUSSkipUpdate] [bit] NOT NULL,
	[NUSSkipPOUpdate] [bit] NOT NULL,
	[IID] [bigint] IDENTITY(1,1) NOT NULL,
	[Location] [int] NOT NULL,
	[UploadDate] [datetime] NOT NULL,
 CONSTRAINT [PK_TransactionEntry] PRIMARY KEY NONCLUSTERED 
(
	[IID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_CustomerDepositMade]  DEFAULT ((0)) FOR [CustomerDepositMade]
GO
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_CustomerDepositRedeemed]  DEFAULT ((0)) FOR [CustomerDepositRedeemed]
GO
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_StoreID]  DEFAULT ((0)) FOR [StoreID]
GO
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_RegisterID]  DEFAULT ((0)) FOR [RegisterID]
GO
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_OpeningTime]  DEFAULT (getdate()) FOR [OpeningTime]
GO
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_ClosingTime]  DEFAULT (NULL) FOR [ClosingTime]
GO
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_OpeningTotal]  DEFAULT ((0)) FOR [OpeningTotal]
GO
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_ClosingTotal]  DEFAULT ((0)) FOR [ClosingTotal]
GO
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_Sales]  DEFAULT ((0)) FOR [Sales]
GO
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_Returns]  DEFAULT ((0)) FOR [Returns]
GO
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_Tax]  DEFAULT ((0)) FOR [Tax]
GO
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_SalesPlusTax]  DEFAULT ((0)) FOR [SalesPlusTax]
GO
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_Commission]  DEFAULT ((0)) FOR [Commission]
GO
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_PaidOut]  DEFAULT ((0)) FOR [PaidOut]
GO
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_Dropped]  DEFAULT ((0)) FOR [Dropped]
GO
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_PaidOnAccount]  DEFAULT ((0)) FOR [PaidOnAccount]
GO
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_PaidToAccount]  DEFAULT ((0)) FOR [PaidToAccount]
GO
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_CustomerCount]  DEFAULT ((0)) FOR [CustomerCount]
GO
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_NoSalesCount]  DEFAULT ((0)) FOR [NoSalesCount]
GO
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_AbortedTransCount]  DEFAULT ((0)) FOR [AbortedTransCount]
GO
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_TotalTendered]  DEFAULT ((0)) FOR [TotalTendered]
GO
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_TotalChange]  DEFAULT ((0)) FOR [TotalChange]
GO
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_Discounts]  DEFAULT ((0)) FOR [Discounts]
GO
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_CostOfGoods]  DEFAULT ((0)) FOR [CostOfGoods]
GO
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_LayawayPaid]  DEFAULT ((0)) FOR [LayawayPaid]
GO
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_LayawayClosed]  DEFAULT ((0)) FOR [LayawayClosed]
GO
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_Shipping]  DEFAULT ((0)) FOR [Shipping]
GO
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_TenderRoundingError]  DEFAULT ((0)) FOR [TenderRoundingError]
GO
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_DebitSurcharge]  DEFAULT ((0)) FOR [DebitSurcharge]
GO
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_CashBackSurcharge]  DEFAULT ((0)) FOR [CashBackSurcharge]
GO
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_batch_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
ALTER TABLE [dbo].[Cashier] ADD  CONSTRAINT [DF_Cashier_HQID]  DEFAULT ((0)) FOR [HQID]
GO
ALTER TABLE [dbo].[Cashier] ADD  CONSTRAINT [DF_Cashier_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
ALTER TABLE [dbo].[Cashier] ADD  CONSTRAINT [DF_Cashier_Number]  DEFAULT ('') FOR [Number]
GO
ALTER TABLE [dbo].[Cashier] ADD  CONSTRAINT [DF_Cashier_StoreID]  DEFAULT ((0)) FOR [StoreID]
GO
ALTER TABLE [dbo].[Cashier] ADD  CONSTRAINT [DF_Cashier_Name]  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[Cashier] ADD  CONSTRAINT [DF_Cashier_Password]  DEFAULT ('') FOR [Password]
GO
ALTER TABLE [dbo].[Cashier] ADD  CONSTRAINT [DF_Cashier_FloorLimit]  DEFAULT ((0)) FOR [FloorLimit]
GO
ALTER TABLE [dbo].[Cashier] ADD  CONSTRAINT [DF_Cashier_ReturnLimit]  DEFAULT ((0)) FOR [ReturnLimit]
GO
ALTER TABLE [dbo].[Cashier] ADD  CONSTRAINT [DF_Cashier_CashDrawerNumber]  DEFAULT ((0)) FOR [CashDrawerNumber]
GO
ALTER TABLE [dbo].[Cashier] ADD  CONSTRAINT [DF_Cashier_SecurityLevel]  DEFAULT ((0)) FOR [SecurityLevel]
GO
ALTER TABLE [dbo].[Cashier] ADD  CONSTRAINT [DF_Cashier_Privileges]  DEFAULT ((0)) FOR [Privileges]
GO
ALTER TABLE [dbo].[Cashier] ADD  CONSTRAINT [DF_Cashier_EmailAddress]  DEFAULT ('') FOR [EmailAddress]
GO
ALTER TABLE [dbo].[Cashier] ADD  CONSTRAINT [DF_Cashier_FailedLogonAttempts]  DEFAULT ((0)) FOR [FailedLogonAttempts]
GO
ALTER TABLE [dbo].[Cashier] ADD  CONSTRAINT [DF_Cashier_MaxOverShortAmount]  DEFAULT ((0)) FOR [MaxOverShortAmount]
GO
ALTER TABLE [dbo].[Cashier] ADD  CONSTRAINT [DF_Cashier_MaxOverShortPercent]  DEFAULT ((0)) FOR [MaxOverShortPercent]
GO
ALTER TABLE [dbo].[Cashier] ADD  CONSTRAINT [DF_Cashier_OverShortLimitType]  DEFAULT ((0)) FOR [OverShortLimitType]
GO
ALTER TABLE [dbo].[Cashier] ADD  CONSTRAINT [Df_Cashier_Telephone]  DEFAULT ('') FOR [Telephone]
GO
ALTER TABLE [dbo].[Cashier] ADD  CONSTRAINT [DF_cashier_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
ALTER TABLE [dbo].[Cashier] ADD  CONSTRAINT [DF_Cashier_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_HQID]  DEFAULT ((0)) FOR [HQID]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_DepartmentID]  DEFAULT ((0)) FOR [DepartmentID]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_Name]  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_Code]  DEFAULT ('') FOR [Code]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_category_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_AccountNumber]  DEFAULT ('') FOR [AccountNumber]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_AccountTypeID]  DEFAULT ((1)) FOR [AccountTypeID]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_Address2]  DEFAULT ('') FOR [Address2]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_AssessFinanceCharges]  DEFAULT ((0)) FOR [AssessFinanceCharges]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_Company]  DEFAULT ('') FOR [Company]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_Country]  DEFAULT ('') FOR [Country]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_CustomNumber1]  DEFAULT ((0)) FOR [CustomNumber1]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_CustomNumber2]  DEFAULT ((0)) FOR [CustomNumber2]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_CustomNumber3]  DEFAULT ((0)) FOR [CustomNumber3]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_CustomNumber4]  DEFAULT ((0)) FOR [CustomNumber4]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_CustomNumber5]  DEFAULT ((0)) FOR [CustomNumber5]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_CustomText1]  DEFAULT ('') FOR [CustomText1]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_CustomText2]  DEFAULT ('') FOR [CustomText2]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_CustomText3]  DEFAULT ('') FOR [CustomText3]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_CustomText4]  DEFAULT ('') FOR [CustomText4]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_CustomText5]  DEFAULT ('') FOR [CustomText5]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_GlobalCustomer]  DEFAULT ((0)) FOR [GlobalCustomer]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_HQID]  DEFAULT ((0)) FOR [HQID]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_LimitPurchase]  DEFAULT ((0)) FOR [LimitPurchase]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_PreviousBalance]  DEFAULT ((0)) FOR [LastClosingBalance]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_PrimaryShipToID]  DEFAULT ((0)) FOR [PrimaryShipToID]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_State]  DEFAULT ('') FOR [State]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_StoreID]  DEFAULT ((0)) FOR [StoreID]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_LayawayCustomer]  DEFAULT ((0)) FOR [LayawayCustomer]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_Employee]  DEFAULT ((0)) FOR [Employee]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_FirstName]  DEFAULT ('') FOR [FirstName]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_LastName]  DEFAULT ('') FOR [LastName]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_Address]  DEFAULT ('') FOR [Address]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_City]  DEFAULT ('') FOR [City]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_Zip]  DEFAULT ('') FOR [Zip]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_Balance]  DEFAULT ((0)) FOR [AccountBalance]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_CreditLimit]  DEFAULT ((0)) FOR [CreditLimit]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_TotalSales]  DEFAULT ((0)) FOR [TotalSales]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_AccountOpened]  DEFAULT (getdate()) FOR [AccountOpened]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_LastVisit]  DEFAULT (getdate()) FOR [LastVisit]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_TotalVisits]  DEFAULT ((0)) FOR [TotalVisits]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_TotalSavings]  DEFAULT ((0)) FOR [TotalSavings]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_CurrentDiscount]  DEFAULT ((0)) FOR [CurrentDiscount]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_PriceLevel]  DEFAULT ((0)) FOR [PriceLevel]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_TaxExempt]  DEFAULT ((0)) FOR [TaxExempt]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_Notes]  DEFAULT ('') FOR [Notes]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [Df_Customer_Title]  DEFAULT ('') FOR [Title]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_EmailAddress]  DEFAULT ('') FOR [EmailAddress]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_TaxNumber]  DEFAULT ('') FOR [TaxNumber]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_PictureName]  DEFAULT ('') FOR [PictureName]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_DefaultShippingServiceID]  DEFAULT ((0)) FOR [DefaultShippingServiceID]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [Df_Customer_PhoneNumber]  DEFAULT ('') FOR [PhoneNumber]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [Df_Customer_FaxNumber]  DEFAULT ('') FOR [FaxNumber]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [Df_Customer_CashierID]  DEFAULT ((0)) FOR [CashierID]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [Df_Customer_SalesRepID]  DEFAULT ((0)) FOR [SalesRepID]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_customer_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_NUS_AccountTypeName]  DEFAULT ('Personal') FOR [NUS_AccountTypeName]
GO
ALTER TABLE [dbo].[DailySales] ADD  CONSTRAINT [DF__DailySale__Store__7EB943E8]  DEFAULT ((0)) FOR [StoreID]
GO
ALTER TABLE [dbo].[Department] ADD  CONSTRAINT [DF_Department_HQID]  DEFAULT ((0)) FOR [HQID]
GO
ALTER TABLE [dbo].[Department] ADD  CONSTRAINT [DF_Department_Name]  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[Department] ADD  CONSTRAINT [DF_Department_Number]  DEFAULT ('') FOR [code]
GO
ALTER TABLE [dbo].[Department] ADD  CONSTRAINT [DF_department_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
ALTER TABLE [dbo].[Department] ADD  CONSTRAINT [DF_Department_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_BinLocation]  DEFAULT ('') FOR [BinLocation]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_BuydownPrice]  DEFAULT ((0)) FOR [BuydownPrice]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_BuydownQuantity]  DEFAULT ((0)) FOR [BuydownQuantity]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_CommissionAmount]  DEFAULT ((0)) FOR [CommissionAmount]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_CommissionMaximum]  DEFAULT ((0)) FOR [CommissionMaximum]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_CommissionMode]  DEFAULT ((0)) FOR [CommissionMode]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_CommissionPercentProfit]  DEFAULT ((0)) FOR [CommissionPercentProfit]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_CommissionPercentSale]  DEFAULT ((0)) FOR [CommissionPercentSale]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_Description]  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_FoodStampable]  DEFAULT ((0)) FOR [FoodStampable]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_HQID]  DEFAULT ((0)) FOR [HQID]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_ItemNotDiscountable]  DEFAULT ((0)) FOR [ItemNotDiscountable]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_QuantityCommitted]  DEFAULT ((0)) FOR [QuantityCommitted]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_SerialNumberCount]  DEFAULT ((0)) FOR [SerialNumberCount]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_TareWeightPercent]  DEFAULT ((0)) FOR [TareWeightPercent]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_ItemLookupCode]  DEFAULT ('') FOR [ItemLookupCode]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_DepartmentID]  DEFAULT ((0)) FOR [DepartmentID]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_CategoryID]  DEFAULT ((0)) FOR [CategoryID]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_MessageID]  DEFAULT ((0)) FOR [MessageID]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_PriceA]  DEFAULT ((0)) FOR [PriceA]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_PriceB]  DEFAULT ((0)) FOR [PriceB]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_PriceC]  DEFAULT ((0)) FOR [PriceC]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_SalePrice]  DEFAULT ((0)) FOR [SalePrice]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_QuantityDiscountID]  DEFAULT ((0)) FOR [QuantityDiscountID]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_TaxID]  DEFAULT ((0)) FOR [TaxID]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_ItemType]  DEFAULT ((0)) FOR [ItemType]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_Cost]  DEFAULT ((0)) FOR [Cost]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_ReorderPoint]  DEFAULT ((0)) FOR [ReorderPoint]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_RestockLevel]  DEFAULT ((0)) FOR [RestockLevel]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_TareWeight]  DEFAULT ((0)) FOR [TareWeight]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_SupplierID]  DEFAULT ((0)) FOR [SupplierID]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_TagAlongItem]  DEFAULT ((0)) FOR [TagAlongItem]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_TagAlongQuantity]  DEFAULT ((0)) FOR [TagAlongQuantity]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_ParentItem]  DEFAULT ((0)) FOR [ParentItem]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_ParentQuantity]  DEFAULT ((0)) FOR [ParentQuantity]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_BarcodeFormat]  DEFAULT ((0)) FOR [BarcodeFormat]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_PriceLowerBound]  DEFAULT ((0)) FOR [PriceLowerBound]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_PriceUpperBound]  DEFAULT ((0)) FOR [PriceUpperBound]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_PictureName]  DEFAULT ('') FOR [PictureName]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_ExtendedDescription]  DEFAULT ('') FOR [ExtendedDescription]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_SubDescription1]  DEFAULT ('') FOR [SubDescription1]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_SubDescription2]  DEFAULT ('') FOR [SubDescription2]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_SubDescription3]  DEFAULT ('') FOR [SubDescription3]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_UnitOfMeasure]  DEFAULT ('') FOR [UnitOfMeasure]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_SubCategoryID]  DEFAULT ((0)) FOR [SubCategoryID]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_QuantityEntryNotAllowed]  DEFAULT ((0)) FOR [QuantityEntryNotAllowed]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_PriceMustBeEntered]  DEFAULT ((0)) FOR [PriceMustBeEntered]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_BlockSalesReason]  DEFAULT ('') FOR [BlockSalesReason]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_Weight]  DEFAULT ((0)) FOR [Weight]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_Taxable]  DEFAULT ((1)) FOR [Taxable]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_LastCost]  DEFAULT ((0)) FOR [LastCost]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_ReplacementCost]  DEFAULT ((0)) FOR [ReplacementCost]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF__Item__WebItem__41EDCAC5]  DEFAULT ((0)) FOR [WebItem]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_BlockSalesType]  DEFAULT ((0)) FOR [BlockSalesType]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_BlockSalesScheduleID]  DEFAULT ((0)) FOR [BlockSalesScheduleID]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_SaleType]  DEFAULT ((0)) FOR [SaleType]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_SaleScheduleID]  DEFAULT ((0)) FOR [SaleScheduleID]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_Consignment]  DEFAULT ((0)) FOR [Consignment]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [Df_Item_Inactive]  DEFAULT ((0)) FOR [Inactive]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [Df_Item_DoNotOrder]  DEFAULT ((0)) FOR [DoNotOrder]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [Df_Item_MSRP]  DEFAULT ((0)) FOR [MSRP]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [Df_Item_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [Df_Item_Content]  DEFAULT ('') FOR [Content]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [Df_Item_UsuallyShip]  DEFAULT ('') FOR [UsuallyShip]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_item_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_NUS_ExcludedFromLoyalty]  DEFAULT ((0)) FOR [NUS_ExcludedFromLoyalty]
GO
ALTER TABLE [dbo].[NUS_PO_Patient] ADD  CONSTRAINT [DF_NUS_PO_Patient_PatientNumber]  DEFAULT ('') FOR [PatientNumber]
GO
ALTER TABLE [dbo].[NUS_PO_Patient] ADD  CONSTRAINT [DF_NUS_PO_Patient_LastName]  DEFAULT ('') FOR [LastName]
GO
ALTER TABLE [dbo].[NUS_PO_Patient] ADD  CONSTRAINT [DF_NUS_PO_Patient_FirstName]  DEFAULT ('') FOR [FirstName]
GO
ALTER TABLE [dbo].[NUS_PO_Patient] ADD  CONSTRAINT [DF_NUS_PO_Patient_Title]  DEFAULT ('') FOR [Title]
GO
ALTER TABLE [dbo].[NUS_PO_Patient] ADD  CONSTRAINT [DF_NUS_PO_Patient_Address]  DEFAULT ('') FOR [Address]
GO
ALTER TABLE [dbo].[NUS_PO_Patient] ADD  CONSTRAINT [DF_NUS_PO_Patient_Suburb]  DEFAULT ('') FOR [Suburb]
GO
ALTER TABLE [dbo].[NUS_PO_Patient] ADD  CONSTRAINT [DF_NUS_PO_Patient_PostCode]  DEFAULT ((0)) FOR [PostCode]
GO
ALTER TABLE [dbo].[NUS_PO_Patient] ADD  CONSTRAINT [DF_NUS_PO_Patient_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
ALTER TABLE [dbo].[NUS_PO_Script] ADD  CONSTRAINT [DF_NUS_PO_Script_ScriptNumber]  DEFAULT ((0)) FOR [ScriptNumber]
GO
ALTER TABLE [dbo].[NUS_PO_Script] ADD  CONSTRAINT [DF_NUS_PO_Script_DispenseNumber]  DEFAULT ((0)) FOR [DispenseNumber]
GO
ALTER TABLE [dbo].[NUS_PO_Script] ADD  CONSTRAINT [DF_NUS_PO_Script_PatientPrice]  DEFAULT ((0)) FOR [PatientPrice]
GO
ALTER TABLE [dbo].[NUS_PO_Script] ADD  CONSTRAINT [DF_NUS_PO_Script_GstIncluded]  DEFAULT ((0)) FOR [GstIncluded]
GO
ALTER TABLE [dbo].[NUS_PO_Script] ADD  CONSTRAINT [DF_NUS_PO_Script_DispenseDate]  DEFAULT (getdate()) FOR [DispenseDate]
GO
ALTER TABLE [dbo].[NUS_PO_Script] ADD  CONSTRAINT [DF_NUS_PO_Script_Patient]  DEFAULT ((0)) FOR [Patient]
GO
ALTER TABLE [dbo].[NUS_PO_Script] ADD  CONSTRAINT [DF_NUS_PO_Script_DrugItem]  DEFAULT ((0)) FOR [DrugItem]
GO
ALTER TABLE [dbo].[NUS_PO_Script] ADD  CONSTRAINT [DF_NUS_PO_Script_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[NUS_PO_Script] ADD  CONSTRAINT [DF_NUS_PO_Script_Packs]  DEFAULT ((0)) FOR [Packs]
GO
ALTER TABLE [dbo].[NUS_PO_Script] ADD  CONSTRAINT [DF_NUS_PO_Script_NationalHealthSchemeCode]  DEFAULT ('') FOR [NationalHealthSchemeCode]
GO
ALTER TABLE [dbo].[NUS_PO_Script] ADD  CONSTRAINT [DF_NUS_PO_Script_ScriptType]  DEFAULT ('') FOR [ScriptType]
GO
ALTER TABLE [dbo].[NUS_PO_Script] ADD  CONSTRAINT [DF_NUS_PO_Script_DrugDescription]  DEFAULT ('') FOR [DrugDescription]
GO
ALTER TABLE [dbo].[NUS_PO_Script] ADD  CONSTRAINT [DF_NUS_PO_Script_GovernmentRecoveryAmount]  DEFAULT ((0)) FOR [GovernmentRecoveryAmount]
GO
ALTER TABLE [dbo].[NUS_PO_Script] ADD  CONSTRAINT [DF_NUS_PO_Script_RegisterId]  DEFAULT ((0)) FOR [RegisterId]
GO
ALTER TABLE [dbo].[NUS_PO_Script] ADD  CONSTRAINT [DF_NUS_PO_Script_SaleActivityEntry]  DEFAULT ((0)) FOR [SaleActivityEntry]
GO
ALTER TABLE [dbo].[NUS_PO_Script] ADD  CONSTRAINT [DF_NUS_PO_Script_ReturnActivityEntry]  DEFAULT ((0)) FOR [ReturnActivityEntry]
GO
ALTER TABLE [dbo].[NUS_PO_Script] ADD  CONSTRAINT [DF_NUS_PO_Script_WorkOrderId]  DEFAULT ((0)) FOR [WorkOrderId]
GO
ALTER TABLE [dbo].[NUS_PO_Script] ADD  CONSTRAINT [DF_NUS_PO_Script_ChargeAccount]  DEFAULT ((0)) FOR [ChargeAccount]
GO
ALTER TABLE [dbo].[NUS_PO_Script] ADD  CONSTRAINT [DF_NUS_PO_Script_ChargeAmount]  DEFAULT ((0)) FOR [ChargeAmount]
GO
ALTER TABLE [dbo].[NUS_PO_Script] ADD  CONSTRAINT [DF_NUS_PO_Script_InstanceCount]  DEFAULT ((0)) FOR [InstanceCount]
GO
ALTER TABLE [dbo].[NUS_PO_Script] ADD  CONSTRAINT [DF_NUS_PO_Script_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[NUS_PO_Script] ADD  CONSTRAINT [DF_NUS_PO_Script_Processed]  DEFAULT ((0)) FOR [Processed]
GO
ALTER TABLE [dbo].[NUS_PO_Script] ADD  CONSTRAINT [DF_NUS_PO_Script_Available]  DEFAULT ((0)) FOR [Available]
GO
ALTER TABLE [dbo].[NUS_PO_Script] ADD  CONSTRAINT [DF_NUS_PO_Script_ActivityAction]  DEFAULT ((0)) FOR [ActivityAction]
GO
ALTER TABLE [dbo].[NUS_PO_Script] ADD  CONSTRAINT [DF_NUS_PO_Script_PerformStockMovement]  DEFAULT ((0)) FOR [PerformStockMovement]
GO
ALTER TABLE [dbo].[NUS_PO_Script] ADD  CONSTRAINT [DF_NUS_PO_Script_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
ALTER TABLE [dbo].[NUS_PO_Script] ADD  CONSTRAINT [DF__NUS_PO_Sc__Creat__74794A92]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[NUS_PostCodeTransaction] ADD  CONSTRAINT [DF_NUS_PostCodeRegistration_RegistrationDate]  DEFAULT (getdate()) FOR [LastUpdated]
GO
ALTER TABLE [dbo].[NUS_PostCodeTransaction] ADD  CONSTRAINT [DF_nus_postcodetransaction_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
ALTER TABLE [dbo].[NUS_TransactionStats] ADD  CONSTRAINT [DF_NUS_TransactionStats_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF_Register_Description]  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF_Register_PoleDisplayEnabled]  DEFAULT ((0)) FOR [PoleDisplayEnabled]
GO
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF_Register_ReceiptID2]  DEFAULT ((0)) FOR [Receipt2ID]
GO
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF_Register_ScaleEnabled]  DEFAULT ((0)) FOR [ScaleEnabled]
GO
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF_Register_ScaleTimeout]  DEFAULT ('') FOR [ScaleTimeout]
GO
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF_Register_ScannerEnabled]  DEFAULT ((0)) FOR [ScannerEnabled]
GO
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF_Register_ZZBatchNumber]  DEFAULT ((0)) FOR [ZZBatchNumber]
GO
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF_Register_Number]  DEFAULT ((0)) FOR [Number]
GO
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF_Register_CurrentBatchNumber]  DEFAULT ((0)) FOR [CurrentBatchNumber]
GO
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF_Register_ReceiptID]  DEFAULT ((0)) FOR [Receipt1ID]
GO
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF_Register_PoleDisplayMessageID]  DEFAULT ((0)) FOR [PoleDisplayMessageID]
GO
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF_Register_Printer1Name]  DEFAULT ('') FOR [Printer1Name]
GO
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF_Register_Printer1Options]  DEFAULT ((0)) FOR [Printer1Options]
GO
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF_Register_Printer2Name]  DEFAULT ('') FOR [Printer2Name]
GO
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF_Register_Printer2Options]  DEFAULT ((0)) FOR [Printer2Options]
GO
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF_Register_ChannelID]  DEFAULT ((0)) FOR [ChannelID]
GO
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF_Register_NetDisplayEnabled]  DEFAULT ((0)) FOR [NetDisplayEnabled]
GO
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF_Register_DefaultPriceLevel]  DEFAULT ((0)) FOR [DefaultPriceLevel]
GO
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF_Register_PoleDisplayName]  DEFAULT ('') FOR [PoleDisplayName]
GO
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [Df_Register_ScaleName]  DEFAULT ('') FOR [ScaleName]
GO
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [Df_Register_ScannerName]  DEFAULT ('') FOR [ScannerName]
GO
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [Df_Register_Printer1Type]  DEFAULT ((0)) FOR [Printer1Type]
GO
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [Df_Register_Printer2Type]  DEFAULT ((0)) FOR [Printer2Type]
GO
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [Df_Register_CasherDrawer1Name]  DEFAULT ('') FOR [CashDrawer1Name]
GO
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [Df_Register_CasherDrawer1Enabled]  DEFAULT ((0)) FOR [CashDrawer1Enabled]
GO
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [Df_Register_CasherDrawer1WaitForClose]  DEFAULT ((0)) FOR [CashDrawer1WaitForClose]
GO
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [Df_Register_CasherDrawer1OpenTimeout]  DEFAULT ((0)) FOR [CashDrawer1OpenTimeout]
GO
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [Df_Register_CasherDrawer2Name]  DEFAULT ('') FOR [CashDrawer2Name]
GO
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [Df_Register_CasherDrawer2Enabled]  DEFAULT ((0)) FOR [CashDrawer2Enabled]
GO
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [Df_Register_CasherDrawer2WaitForClose]  DEFAULT ((0)) FOR [CashDrawer2WaitForClose]
GO
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [Df_Register_CasherDrawer2OpenTimeout]  DEFAULT ((0)) FOR [CashDrawer2OpenTimeout]
GO
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF__Register__StoreI__1B9317B3]  DEFAULT ((0)) FOR [StoreID]
GO
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [Df_Register_MICRName]  DEFAULT ('') FOR [MICRName]
GO
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [Df_Register_MICREnabled]  DEFAULT ((0)) FOR [MICREnabled]
GO
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [Df_Register_MICRTimeout]  DEFAULT ((0)) FOR [MICRTimeout]
GO
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [Df_Register_MSRName]  DEFAULT ('') FOR [MSRName]
GO
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [Df_Register_MSREnabled]  DEFAULT ((0)) FOR [MSREnabled]
GO
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [Df_Register_SignatureCaptureName]  DEFAULT ('') FOR [SignatureCaptureName]
GO
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [Df_Register_SignatureCaptureEnabled]  DEFAULT ((0)) FOR [SignatureCaptureEnabled]
GO
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [Df_Register_SignatureCaptureFormName]  DEFAULT ('') FOR [SignatureCaptureFormName]
GO
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [Df_Register_TouchScreenEnabled]  DEFAULT ((0)) FOR [TouchScreenEnabled]
GO
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [Df_Register_KeyboardID]  DEFAULT ((0)) FOR [KeyboardID]
GO
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF_Register_DefaultServiceID]  DEFAULT ((0)) FOR [DefaultServiceID]
GO
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF_Register_PINPadEnabled]  DEFAULT ((0)) FOR [PINPadEnabled]
GO
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF_Register_PINPadName]  DEFAULT ('') FOR [PINPadName]
GO
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF_Register_PINPadSystem]  DEFAULT ('DUKPT') FOR [PINPadSystem]
GO
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF_TransactionHostID]  DEFAULT ((1)) FOR [TransactionHost]
GO
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF_RealTimeSigCap]  DEFAULT ((1)) FOR [RealTimeSigCap]
GO
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF_register_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF_Register_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
ALTER TABLE [dbo].[SalesRep] ADD  CONSTRAINT [DF_SalesRep_HQID]  DEFAULT ((0)) FOR [HQID]
GO
ALTER TABLE [dbo].[SalesRep] ADD  CONSTRAINT [DF_SalesRep_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
ALTER TABLE [dbo].[SalesRep] ADD  CONSTRAINT [DF_SalesRep_Number]  DEFAULT ('') FOR [Number]
GO
ALTER TABLE [dbo].[SalesRep] ADD  CONSTRAINT [DF_SalesRep_StoreID]  DEFAULT ((0)) FOR [StoreID]
GO
ALTER TABLE [dbo].[SalesRep] ADD  CONSTRAINT [DF_SalesRep_Name]  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[SalesRep] ADD  CONSTRAINT [DF_SalesRep_PercentOfSale]  DEFAULT ((0)) FOR [PercentOfSale]
GO
ALTER TABLE [dbo].[SalesRep] ADD  CONSTRAINT [DF_SalesRep_PercentOfProfit]  DEFAULT ((0)) FOR [PercentOfProfit]
GO
ALTER TABLE [dbo].[SalesRep] ADD  CONSTRAINT [DF_SalesRep_FixedRate]  DEFAULT ((0)) FOR [FixedRate]
GO
ALTER TABLE [dbo].[SalesRep] ADD  CONSTRAINT [DF_SalesRep_EmailAddress]  DEFAULT ('') FOR [EmailAddress]
GO
ALTER TABLE [dbo].[SalesRep] ADD  CONSTRAINT [Df_SalesRep_Telephone]  DEFAULT ('') FOR [Telephone]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_ID]  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_Name]  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_StoreCode]  DEFAULT ('') FOR [StoreCode]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_Region]  DEFAULT ('') FOR [Region]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_Address1]  DEFAULT ('') FOR [Address1]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_Address2]  DEFAULT ('') FOR [Address2]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_City]  DEFAULT ('') FOR [City]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_Country]  DEFAULT ('') FOR [Country]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_FaxNumber]  DEFAULT ('') FOR [FaxNumber]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_PhoneNumber]  DEFAULT ('') FOR [PhoneNumber]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_State]  DEFAULT ('') FOR [State]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_Zip]  DEFAULT ('') FOR [Zip]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_ParentStoreID]  DEFAULT ((0)) FOR [ParentStoreID]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_ScheduleHourMask1]  DEFAULT ((0)) FOR [ScheduleHourMask1]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_ScheduleHourMask2]  DEFAULT ((0)) FOR [ScheduleHourMask2]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_ScheduleHourMask3]  DEFAULT ((0)) FOR [ScheduleHourMask3]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_ScheduleHourMask4]  DEFAULT ((0)) FOR [ScheduleHourMask4]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_ScheduleHourMask5]  DEFAULT ((0)) FOR [ScheduleHourMask5]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_ScheduleHourMask6]  DEFAULT ((0)) FOR [ScheduleHourMask6]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_ScheduleHourMask7]  DEFAULT ((0)) FOR [ScheduleHourMask7]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_ScheduleMinute]  DEFAULT ((0)) FOR [ScheduleMinute]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_RetryCount]  DEFAULT ((0)) FOR [RetryCount]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_RetryDelay]  DEFAULT ((0)) FOR [RetryDelay]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_AccountName]  DEFAULT ('') FOR [AccountName]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_Password]  DEFAULT ('') FOR [Password]
GO
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_Supplier_Country]  DEFAULT ('') FOR [Country]
GO
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_Supplier_HQID]  DEFAULT ((0)) FOR [HQID]
GO
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_Supplier_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_Supplier_State]  DEFAULT ('') FOR [State]
GO
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_Supplier_SupplierName]  DEFAULT ('') FOR [SupplierName]
GO
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_Supplier_ContactName]  DEFAULT ('') FOR [ContactName]
GO
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_Supplier_Address1]  DEFAULT ('') FOR [Address1]
GO
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_Supplier_Address2]  DEFAULT ('') FOR [Address2]
GO
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_Supplier_City]  DEFAULT ('') FOR [City]
GO
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_Supplier_Zip]  DEFAULT ('') FOR [Zip]
GO
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_Supplier_EmailAddress]  DEFAULT ('') FOR [EmailAddress]
GO
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_Supplier_WebPageAddress]  DEFAULT ('') FOR [WebPageAddress]
GO
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_Supplier_Code]  DEFAULT ('') FOR [Code]
GO
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_Supplier_AccountNumber]  DEFAULT ('') FOR [AccountNumber]
GO
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_Supplier_TaxNumber]  DEFAULT ('') FOR [TaxNumber]
GO
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_Supplier_CurrencyID]  DEFAULT ((0)) FOR [CurrencyID]
GO
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [Df_Supplier_PhoneNumber]  DEFAULT ('') FOR [PhoneNumber]
GO
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [Df_Supplier_FaxNumber]  DEFAULT ('') FOR [FaxNumber]
GO
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [Df_Supplier_CustomText1]  DEFAULT ('') FOR [CustomText1]
GO
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [Df_Supplier_CustomText2]  DEFAULT ('') FOR [CustomText2]
GO
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [Df_Supplier_CustomText3]  DEFAULT ('') FOR [CustomText3]
GO
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [Df_Supplier_CustomText4]  DEFAULT ('') FOR [CustomText4]
GO
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [Df_Supplier_CustomText5]  DEFAULT ('') FOR [CustomText5]
GO
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [Df_Supplier_CustomNumber1]  DEFAULT ((0)) FOR [CustomNumber1]
GO
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [Df_Supplier_CustomNumber2]  DEFAULT ((0)) FOR [CustomNumber2]
GO
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [Df_Supplier_CustomNumber3]  DEFAULT ((0)) FOR [CustomNumber3]
GO
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [Df_Supplier_CustomNumber4]  DEFAULT ((0)) FOR [CustomNumber4]
GO
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [Df_Supplier_CustomNumber5]  DEFAULT ((0)) FOR [CustomNumber5]
GO
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [Df_Supplier_Notes]  DEFAULT ('') FOR [Notes]
GO
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_Supplier_Terms]  DEFAULT ('') FOR [Terms]
GO
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_supplier_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_Supplier_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_FixedAmount]  DEFAULT ((0)) FOR [FixedAmount]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_HQID]  DEFAULT ((0)) FOR [HQID]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Description]  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Percentage]  DEFAULT ((0)) FOR [Percentage]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_UsePartialDollar]  DEFAULT ((0)) FOR [UsePartialDollar]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_ItemMaximum]  DEFAULT ((0)) FOR [ItemMaximum]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_IncludePreviousTax]  DEFAULT ((0)) FOR [IncludePreviousTax]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket00]  DEFAULT ((0)) FOR [Bracket00]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket01]  DEFAULT ((0)) FOR [Bracket01]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket02]  DEFAULT ((0)) FOR [Bracket02]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket03]  DEFAULT ((0)) FOR [Bracket03]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket04]  DEFAULT ((0)) FOR [Bracket04]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket05]  DEFAULT ((0)) FOR [Bracket05]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket06]  DEFAULT ((0)) FOR [Bracket06]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket07]  DEFAULT ((0)) FOR [Bracket07]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket08]  DEFAULT ((0)) FOR [Bracket08]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket09]  DEFAULT ((0)) FOR [Bracket09]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket10]  DEFAULT ((0)) FOR [Bracket10]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Code]  DEFAULT ('') FOR [Code]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [Df_Tax_ItemMinimum]  DEFAULT ((0)) FOR [ItemMinimum]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [Df_Tax_ApplyOverMinimum]  DEFAULT ((0)) FOR [ApplyOverMinimum]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket11]  DEFAULT ((0)) FOR [Bracket11]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket12]  DEFAULT ((0)) FOR [Bracket12]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket13]  DEFAULT ((0)) FOR [Bracket13]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket14]  DEFAULT ((0)) FOR [Bracket14]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket15]  DEFAULT ((0)) FOR [Bracket15]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket16]  DEFAULT ((0)) FOR [Bracket16]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket17]  DEFAULT ((0)) FOR [Bracket17]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket18]  DEFAULT ((0)) FOR [Bracket18]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket19]  DEFAULT ((0)) FOR [Bracket19]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket20]  DEFAULT ((0)) FOR [Bracket20]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket21]  DEFAULT ((0)) FOR [Bracket21]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket22]  DEFAULT ((0)) FOR [Bracket22]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket23]  DEFAULT ((0)) FOR [Bracket23]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket24]  DEFAULT ((0)) FOR [Bracket24]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket25]  DEFAULT ((0)) FOR [Bracket25]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket26]  DEFAULT ((0)) FOR [Bracket26]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket27]  DEFAULT ((0)) FOR [Bracket27]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket28]  DEFAULT ((0)) FOR [Bracket28]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket29]  DEFAULT ((0)) FOR [Bracket29]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket30]  DEFAULT ((0)) FOR [Bracket30]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue01]  DEFAULT ((0)) FOR [BracketValue01]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue02]  DEFAULT ((0)) FOR [BracketValue02]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue03]  DEFAULT ((0)) FOR [BracketValue03]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue04]  DEFAULT ((0)) FOR [BracketValue04]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue05]  DEFAULT ((0)) FOR [BracketValue05]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue06]  DEFAULT ((0)) FOR [BracketValue06]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue07]  DEFAULT ((0)) FOR [BracketValue07]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue08]  DEFAULT ((0)) FOR [BracketValue08]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue09]  DEFAULT ((0)) FOR [BracketValue09]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue10]  DEFAULT ((0)) FOR [BracketValue10]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue11]  DEFAULT ((0)) FOR [BracketValue11]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue12]  DEFAULT ((0)) FOR [BracketValue12]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue13]  DEFAULT ((0)) FOR [BracketValue13]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue14]  DEFAULT ((0)) FOR [BracketValue14]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue15]  DEFAULT ((0)) FOR [BracketValue15]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue16]  DEFAULT ((0)) FOR [BracketValue16]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue17]  DEFAULT ((0)) FOR [BracketValue17]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue18]  DEFAULT ((0)) FOR [BracketValue18]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue19]  DEFAULT ((0)) FOR [BracketValue19]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue20]  DEFAULT ((0)) FOR [BracketValue20]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue21]  DEFAULT ((0)) FOR [BracketValue21]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue22]  DEFAULT ((0)) FOR [BracketValue22]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue23]  DEFAULT ((0)) FOR [BracketValue23]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue24]  DEFAULT ((0)) FOR [BracketValue24]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue25]  DEFAULT ((0)) FOR [BracketValue25]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue26]  DEFAULT ((0)) FOR [BracketValue26]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue27]  DEFAULT ((0)) FOR [BracketValue27]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue28]  DEFAULT ((0)) FOR [BracketValue28]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue29]  DEFAULT ((0)) FOR [BracketValue29]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue30]  DEFAULT ((0)) FOR [BracketValue30]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_tax_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
ALTER TABLE [dbo].[TaxEntry] ADD  CONSTRAINT [DF_TaxEntry_StoreID]  DEFAULT ((0)) FOR [StoreID]
GO
ALTER TABLE [dbo].[TaxEntry] ADD  CONSTRAINT [DF_TaxEntry_TaxID]  DEFAULT ((0)) FOR [TaxID]
GO
ALTER TABLE [dbo].[TaxEntry] ADD  CONSTRAINT [DF_TaxEntry_TransactionID]  DEFAULT ((0)) FOR [TransactionNumber]
GO
ALTER TABLE [dbo].[TaxEntry] ADD  CONSTRAINT [DF_TaxEntry_Amount]  DEFAULT ((0)) FOR [Tax]
GO
ALTER TABLE [dbo].[TaxEntry] ADD  CONSTRAINT [DF_TaxEntry_TAxableAmount]  DEFAULT ((0)) FOR [TaxableAmount]
GO
ALTER TABLE [dbo].[TaxEntry] ADD  CONSTRAINT [Df_TaxEntry_TransactionEntryID]  DEFAULT ((0)) FOR [TransactionEntryID]
GO
ALTER TABLE [dbo].[TaxEntry] ADD  CONSTRAINT [DF_taxentry_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
ALTER TABLE [dbo].[Tender] ADD  CONSTRAINT [DF_Tender_HQID]  DEFAULT ((0)) FOR [HQID]
GO
ALTER TABLE [dbo].[Tender] ADD  CONSTRAINT [DF_Tender_PreventOverTendering]  DEFAULT ((0)) FOR [PreventOverTendering]
GO
ALTER TABLE [dbo].[Tender] ADD  CONSTRAINT [DF_Tender_VerificationType]  DEFAULT ((0)) FOR [VerificationType]
GO
ALTER TABLE [dbo].[Tender] ADD  CONSTRAINT [DF_Tender_VerifyViaEDC]  DEFAULT ((0)) FOR [VerifyViaEDC]
GO
ALTER TABLE [dbo].[Tender] ADD  CONSTRAINT [DF_Tender_Description]  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[Tender] ADD  CONSTRAINT [DF_Tender_AdditionalDetailType]  DEFAULT ((1)) FOR [AdditionalDetailType]
GO
ALTER TABLE [dbo].[Tender] ADD  CONSTRAINT [DF_Tender_PrinterValidation]  DEFAULT ((0)) FOR [PrinterValidation]
GO
ALTER TABLE [dbo].[Tender] ADD  CONSTRAINT [DF_Tender_ValidationLine1]  DEFAULT ('') FOR [ValidationLine1]
GO
ALTER TABLE [dbo].[Tender] ADD  CONSTRAINT [DF_Tender_ValidationLine2]  DEFAULT ('') FOR [ValidationLine2]
GO
ALTER TABLE [dbo].[Tender] ADD  CONSTRAINT [DF_Tender_ValidationLine3]  DEFAULT ('') FOR [ValidationLine3]
GO
ALTER TABLE [dbo].[Tender] ADD  CONSTRAINT [DF_Tender_GLAccount]  DEFAULT ('') FOR [GLAccount]
GO
ALTER TABLE [dbo].[Tender] ADD  CONSTRAINT [DF_Tender_ScanCode]  DEFAULT ((0)) FOR [ScanCode]
GO
ALTER TABLE [dbo].[Tender] ADD  CONSTRAINT [DF_Tender_RoundToValue]  DEFAULT ((0)) FOR [RoundToValue]
GO
ALTER TABLE [dbo].[Tender] ADD  CONSTRAINT [DF_Tender_Code]  DEFAULT ('') FOR [Code]
GO
ALTER TABLE [dbo].[Tender] ADD  CONSTRAINT [DF_Tender_MaximumAmount]  DEFAULT ((0)) FOR [MaximumAmount]
GO
ALTER TABLE [dbo].[Tender] ADD  CONSTRAINT [DF_Tender_DoNotPopCashDrawer]  DEFAULT ((0)) FOR [DoNotPopCashDrawer]
GO
ALTER TABLE [dbo].[Tender] ADD  CONSTRAINT [DF_Tender_CurrencyID]  DEFAULT ((0)) FOR [CurrencyID]
GO
ALTER TABLE [dbo].[Tender] ADD  CONSTRAINT [DF_Tender_DisplayOrder]  DEFAULT ((0)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[Tender] ADD  CONSTRAINT [DF_Tender_ValidationMask]  DEFAULT ('') FOR [ValidationMask]
GO
ALTER TABLE [dbo].[Tender] ADD  CONSTRAINT [Df_Tender_SignatureRequired]  DEFAULT ((0)) FOR [SignatureRequired]
GO
ALTER TABLE [dbo].[Tender] ADD  CONSTRAINT [Df_Tender_AllowMultipleEntries]  DEFAULT ((0)) FOR [AllowMultipleEntries]
GO
ALTER TABLE [dbo].[Tender] ADD  CONSTRAINT [DF_Tender_DebitSurcharge]  DEFAULT ((0)) FOR [DebitSurcharge]
GO
ALTER TABLE [dbo].[Tender] ADD  CONSTRAINT [DF_Tender_SupportCashBack]  DEFAULT ((0)) FOR [SupportCashBack]
GO
ALTER TABLE [dbo].[Tender] ADD  CONSTRAINT [DF_Tender_CashBackLimit]  DEFAULT ((0)) FOR [CashBackLimit]
GO
ALTER TABLE [dbo].[Tender] ADD  CONSTRAINT [DF_Tender_CashBackFee]  DEFAULT ((0)) FOR [CashBackFee]
GO
ALTER TABLE [dbo].[Tender] ADD  CONSTRAINT [DF_tender_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
ALTER TABLE [dbo].[Tender] ADD  CONSTRAINT [DF_Tender_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
ALTER TABLE [dbo].[TenderEntry] ADD  CONSTRAINT [DF_TenderEntry_BatchNumber]  DEFAULT ((0)) FOR [BatchNumber]
GO
ALTER TABLE [dbo].[TenderEntry] ADD  CONSTRAINT [DF_TenderEntry_CreditCardExpiration]  DEFAULT ('') FOR [CreditCardExpiration]
GO
ALTER TABLE [dbo].[TenderEntry] ADD  CONSTRAINT [DF_TenderEntry_LayawayID]  DEFAULT ((0)) FOR [OrderHistoryID]
GO
ALTER TABLE [dbo].[TenderEntry] ADD  CONSTRAINT [DF_TenderEntry_DropPayoutID]  DEFAULT ((0)) FOR [DropPayoutID]
GO
ALTER TABLE [dbo].[TenderEntry] ADD  CONSTRAINT [DF_TenderEntry_StoreID]  DEFAULT ((0)) FOR [StoreID]
GO
ALTER TABLE [dbo].[TenderEntry] ADD  CONSTRAINT [DF_TenderEntry_TransactionID]  DEFAULT ((0)) FOR [TransactionNumber]
GO
ALTER TABLE [dbo].[TenderEntry] ADD  CONSTRAINT [DF_TenderEntry_TenderID]  DEFAULT ((0)) FOR [TenderID]
GO
ALTER TABLE [dbo].[TenderEntry] ADD  CONSTRAINT [DF_TenderEntry_ExchangeID]  DEFAULT ((0)) FOR [PaymentID]
GO
ALTER TABLE [dbo].[TenderEntry] ADD  CONSTRAINT [DF_TenderEntry_Description]  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[TenderEntry] ADD  CONSTRAINT [DF_TenderEntry_CreditCardNumber]  DEFAULT ('') FOR [CreditCardNumber]
GO
ALTER TABLE [dbo].[TenderEntry] ADD  CONSTRAINT [DF_TenderEntry_CreditCardApprovalCode]  DEFAULT ('') FOR [CreditCardApprovalCode]
GO
ALTER TABLE [dbo].[TenderEntry] ADD  CONSTRAINT [DF_TenderEntry_Amount]  DEFAULT ((0)) FOR [Amount]
GO
ALTER TABLE [dbo].[TenderEntry] ADD  CONSTRAINT [DF_TenderEntry_AccountHolder]  DEFAULT ('') FOR [AccountHolder]
GO
ALTER TABLE [dbo].[TenderEntry] ADD  CONSTRAINT [DF_TenderEntry_RoundingError]  DEFAULT ((0)) FOR [RoundingError]
GO
ALTER TABLE [dbo].[TenderEntry] ADD  CONSTRAINT [DF_TenderEntry_AmountForeign]  DEFAULT ((0)) FOR [AmountForeign]
GO
ALTER TABLE [dbo].[TenderEntry] ADD  CONSTRAINT [Df_TenderEntry_BankNumber]  DEFAULT ('') FOR [BankNumber]
GO
ALTER TABLE [dbo].[TenderEntry] ADD  CONSTRAINT [Df_TenderEntry_SerialNumber]  DEFAULT ('') FOR [SerialNumber]
GO
ALTER TABLE [dbo].[TenderEntry] ADD  CONSTRAINT [Df_TenderEntry_State]  DEFAULT ('') FOR [State]
GO
ALTER TABLE [dbo].[TenderEntry] ADD  CONSTRAINT [Df_TenderEntry_License]  DEFAULT ('') FOR [License]
GO
ALTER TABLE [dbo].[TenderEntry] ADD  CONSTRAINT [Df_TenderEntry_TransitNumber]  DEFAULT ('') FOR [TransitNumber]
GO
ALTER TABLE [dbo].[TenderEntry] ADD  CONSTRAINT [Df_TenderEntry_VisaNetAuthorizationID]  DEFAULT ((0)) FOR [VisaNetAuthorizationID]
GO
ALTER TABLE [dbo].[TenderEntry] ADD  CONSTRAINT [DF_TenderEntry_DebitSurcharge]  DEFAULT ((0)) FOR [DebitSurcharge]
GO
ALTER TABLE [dbo].[TenderEntry] ADD  CONSTRAINT [DF_TenderEntry_CashBackSurcharge]  DEFAULT ((0)) FOR [CashBackSurcharge]
GO
ALTER TABLE [dbo].[TenderEntry] ADD  CONSTRAINT [DF_tenderentry_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
ALTER TABLE [dbo].[TenderEntry] ADD  CONSTRAINT [DF_TenderEntry_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
ALTER TABLE [dbo].[Transaction] ADD  CONSTRAINT [DF_Transaction_ShipToID]  DEFAULT ((0)) FOR [ShipToID]
GO
ALTER TABLE [dbo].[Transaction] ADD  CONSTRAINT [DF_Transaction_StoreID]  DEFAULT ((0)) FOR [StoreID]
GO
ALTER TABLE [dbo].[Transaction] ADD  CONSTRAINT [DF_Transaction_BatchNumber]  DEFAULT ((0)) FOR [BatchNumber]
GO
ALTER TABLE [dbo].[Transaction] ADD  CONSTRAINT [DF_Transaction_Time]  DEFAULT (getdate()) FOR [Time]
GO
ALTER TABLE [dbo].[Transaction] ADD  CONSTRAINT [DF_Transaction_CustomerID]  DEFAULT ((0)) FOR [CustomerID]
GO
ALTER TABLE [dbo].[Transaction] ADD  CONSTRAINT [DF_Transaction_CashierID]  DEFAULT ((0)) FOR [CashierID]
GO
ALTER TABLE [dbo].[Transaction] ADD  CONSTRAINT [DF_Transaction_SubTotal]  DEFAULT ((0)) FOR [Total]
GO
ALTER TABLE [dbo].[Transaction] ADD  CONSTRAINT [DF_Transaction_SalesTax]  DEFAULT ((0)) FOR [SalesTax]
GO
ALTER TABLE [dbo].[Transaction] ADD  CONSTRAINT [DF_Transaction_Comment]  DEFAULT ('') FOR [Comment]
GO
ALTER TABLE [dbo].[Transaction] ADD  CONSTRAINT [DF_Transaction_ReferenceNumber]  DEFAULT ('') FOR [ReferenceNumber]
GO
ALTER TABLE [dbo].[Transaction] ADD  CONSTRAINT [DF__Transacti__Statu__61F08603]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Transaction] ADD  CONSTRAINT [Df_Transaction_ExchangeID]  DEFAULT ((0)) FOR [ExchangeID]
GO
ALTER TABLE [dbo].[Transaction] ADD  CONSTRAINT [Df_Transaction_ChannelType]  DEFAULT ((0)) FOR [ChannelType]
GO
ALTER TABLE [dbo].[Transaction] ADD  CONSTRAINT [DF_Transaction_RecallID]  DEFAULT ((0)) FOR [RecallID]
GO
ALTER TABLE [dbo].[Transaction] ADD  CONSTRAINT [DF_Transaction_RecallType]  DEFAULT ((0)) FOR [RecallType]
GO
ALTER TABLE [dbo].[Transaction] ADD  CONSTRAINT [DF_transaction_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
ALTER TABLE [dbo].[Transaction] ADD  CONSTRAINT [DF_Transaction_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
ALTER TABLE [dbo].[TransactionEntry] ADD  CONSTRAINT [DF_TransactionEntry_Commission]  DEFAULT ((0)) FOR [Commission]
GO
ALTER TABLE [dbo].[TransactionEntry] ADD  CONSTRAINT [DF_TransactionEntry_Cost]  DEFAULT ((0)) FOR [Cost]
GO
ALTER TABLE [dbo].[TransactionEntry] ADD  CONSTRAINT [DF_TransactionEntry_FullPrice]  DEFAULT ((0)) FOR [FullPrice]
GO
ALTER TABLE [dbo].[TransactionEntry] ADD  CONSTRAINT [DF_TransactionEntry_StoreID]  DEFAULT ((0)) FOR [StoreID]
GO
ALTER TABLE [dbo].[TransactionEntry] ADD  CONSTRAINT [DF_TransactionEntry_TransactionNumber]  DEFAULT ((0)) FOR [TransactionNumber]
GO
ALTER TABLE [dbo].[TransactionEntry] ADD  CONSTRAINT [DF_TransactionEntry_ItemID]  DEFAULT ((0)) FOR [ItemID]
GO
ALTER TABLE [dbo].[TransactionEntry] ADD  CONSTRAINT [DF_TransactionEntry_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[TransactionEntry] ADD  CONSTRAINT [DF_TransactionEntry_PriceSource]  DEFAULT ((0)) FOR [PriceSource]
GO
ALTER TABLE [dbo].[TransactionEntry] ADD  CONSTRAINT [DF_TransactionEntry_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[TransactionEntry] ADD  CONSTRAINT [DF_TransactionEntry_SalesRepID]  DEFAULT ((0)) FOR [SalesRepID]
GO
ALTER TABLE [dbo].[TransactionEntry] ADD  CONSTRAINT [DF_TransactionEntry_Taxable]  DEFAULT ((0)) FOR [Taxable]
GO
ALTER TABLE [dbo].[TransactionEntry] ADD  CONSTRAINT [DF_TransactionEntry_DetailID]  DEFAULT ((0)) FOR [DetailID]
GO
ALTER TABLE [dbo].[TransactionEntry] ADD  CONSTRAINT [DF_TransactionEntry_Comment]  DEFAULT ('') FOR [Comment]
GO
ALTER TABLE [dbo].[TransactionEntry] ADD  CONSTRAINT [DF_TransactionEntry_DiscountReasonCodeID]  DEFAULT ((0)) FOR [DiscountReasonCodeID]
GO
ALTER TABLE [dbo].[TransactionEntry] ADD  CONSTRAINT [DF_TransactionEntry_ReturnReasonCodeID]  DEFAULT ((0)) FOR [ReturnReasonCodeID]
GO
ALTER TABLE [dbo].[TransactionEntry] ADD  CONSTRAINT [DF_TransactionEntry_TaxChangeReasonCodeID]  DEFAULT ((0)) FOR [TaxChangeReasonCodeID]
GO
ALTER TABLE [dbo].[TransactionEntry] ADD  CONSTRAINT [Df_TransactionEntry_SalesTax]  DEFAULT ((0)) FOR [SalesTax]
GO
ALTER TABLE [dbo].[TransactionEntry] ADD  CONSTRAINT [DF_TransactionEntry_QuantityDiscountID]  DEFAULT ((0)) FOR [QuantityDiscountID]
GO
ALTER TABLE [dbo].[TransactionEntry] ADD  CONSTRAINT [DF_transactionentry_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
ALTER TABLE [dbo].[TransactionEntry] ADD  CONSTRAINT [DF_TransactionEntry_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
USE [master]
GO
ALTER DATABASE [STAGING_FRED_POS] SET  READ_WRITE 
GO
