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
/****** Object:  Database [FredOffice]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE DATABASE [FredOffice]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FredOffice', FILENAME = N'G:\MSSQLSERVER\DATA\FredOffice' , SIZE = 37721408KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FredOffice_log', FILENAME = N'G:\MSSQLSERVER\DATA\FredOffice.LDS' , SIZE = 2160960KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FredOffice] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FredOffice].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FredOffice] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FredOffice] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FredOffice] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FredOffice] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FredOffice] SET ARITHABORT OFF 
GO
ALTER DATABASE [FredOffice] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FredOffice] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FredOffice] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FredOffice] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FredOffice] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FredOffice] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FredOffice] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FredOffice] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FredOffice] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FredOffice] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FredOffice] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FredOffice] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FredOffice] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FredOffice] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [FredOffice] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FredOffice] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FredOffice] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FredOffice] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FredOffice] SET  MULTI_USER 
GO
ALTER DATABASE [FredOffice] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FredOffice] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FredOffice] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FredOffice] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [FredOffice] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'FredOffice', N'ON'
GO
USE [FredOffice]
GO
/****** Object:  Table [dbo].[doAccount]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doAccount](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[AccountFormat] [int] NOT NULL,
	[AccountNumber] [int] NOT NULL,
	[AccountOwner] [bigint] NOT NULL,
	[AccountType] [bigint] NOT NULL,
	[AddressLine1] [nvarchar](4000) NOT NULL,
	[AddressLine2] [nvarchar](4000) NOT NULL,
	[AddressSource] [int] NOT NULL,
	[AddressState] [nvarchar](4000) NOT NULL,
	[Balance] [decimal](28, 10) NOT NULL,
	[City] [nvarchar](4000) NOT NULL,
	[ClosedDate] [datetime] NOT NULL,
	[Company] [nvarchar](4000) NOT NULL,
	[CreditLimit] [decimal](28, 10) NOT NULL,
	[Customer] [bigint] NOT NULL,
	[CustomerAddressLine1] [nvarchar](4000) NOT NULL,
	[CustomerAddressLine2] [nvarchar](4000) NOT NULL,
	[CustomerAddressState] [nvarchar](4000) NOT NULL,
	[CustomerCity] [nvarchar](4000) NOT NULL,
	[CustomerCompany] [nvarchar](4000) NOT NULL,
	[CustomerEmailAddress] [nvarchar](4000) NOT NULL,
	[CustomerFaxNumber] [nvarchar](4000) NOT NULL,
	[CustomerFirstName] [nvarchar](4000) NOT NULL,
	[CustomerLastName] [nvarchar](4000) NOT NULL,
	[CustomerMobileNumber] [nvarchar](4000) NOT NULL,
	[CustomerPhoneNumber] [nvarchar](4000) NOT NULL,
	[CustomerPostCode] [nvarchar](4000) NOT NULL,
	[CustomerTitle] [nvarchar](4000) NOT NULL,
	[CustomerWeb] [nvarchar](4000) NOT NULL,
	[Discount] [decimal](28, 10) NOT NULL,
	[EmailAddress] [nvarchar](4000) NOT NULL,
	[FaxNumber] [nvarchar](4000) NOT NULL,
	[FirstName] [nvarchar](4000) NOT NULL,
	[GroupedDescription] [nvarchar](4000) NOT NULL,
	[ImportDescription] [nvarchar](4000) NOT NULL,
	[ImportedBalance] [decimal](28, 10) NOT NULL,
	[LastName] [nvarchar](4000) NOT NULL,
	[MobileNumber] [nvarchar](4000) NOT NULL,
	[OpenedDate] [datetime] NOT NULL,
	[PhoneNumber] [nvarchar](4000) NOT NULL,
	[PostCode] [nvarchar](4000) NOT NULL,
	[PriceLevel] [int] NOT NULL,
	[PrintByPatient] [bit] NOT NULL,
	[ProviderNumber] [nvarchar](4000) NOT NULL,
	[Reference] [nvarchar](4000) NOT NULL,
	[Remarks] [nvarchar](4000) NOT NULL,
	[SendStatementsByEmail] [bit] NOT NULL,
	[StatementEmail] [nvarchar](4000) NOT NULL,
	[TAC] [nvarchar](4000) NOT NULL,
	[Title] [nvarchar](4000) NOT NULL,
	[Web] [nvarchar](4000) NOT NULL,
 CONSTRAINT [PK_doAccount] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doAccountAllocation]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doAccountAllocation](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[AccountType] [bigint] NOT NULL,
	[AccountTypeOwner] [bigint] NOT NULL,
	[ChargeAccount] [bigint] NOT NULL,
	[ChargeType] [bigint] NOT NULL,
 CONSTRAINT [PK_doAccountAllocation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doAccountType]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doAccountType](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[CreditLimit] [decimal](28, 10) NOT NULL,
	[Description] [nvarchar](4000) NOT NULL,
 CONSTRAINT [PK_doAccountType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doActivity]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doActivity](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[IBHeaderGuid] [uniqueidentifier] NOT NULL,
	[RapidObjectGuid] [uniqueidentifier] NOT NULL,
	[RapidSyncRequired] [bit] NOT NULL,
	[RecordStatus] [bigint] NOT NULL,
	[AcceptedBy] [nvarchar](4000) NOT NULL,
	[ActivityType] [int] NOT NULL,
	[Batch] [bigint] NOT NULL,
	[Cashier] [bigint] NOT NULL,
	[ChargeAccount] [bigint] NOT NULL,
	[Customer] [bigint] NOT NULL,
	[HiddenReverseActivity] [bigint] NOT NULL,
	[LaybyAccount] [bigint] NOT NULL,
	[LoyaltyAccount] [bigint] NOT NULL,
	[PostCode] [nvarchar](4000) NOT NULL,
	[Reference] [nvarchar](128) NULL,
	[Register] [bigint] NOT NULL,
	[Remarks] [nvarchar](128) NULL,
	[Statement] [bigint] NOT NULL,
	[TimeOccured] [datetime] NOT NULL,
	[TotalCharged] [decimal](28, 10) NOT NULL,
	[TotalCost] [decimal](28, 10) NOT NULL,
	[TotalDiscount] [decimal](28, 10) NOT NULL,
	[TotalExtendedPrice] [decimal](28, 10) NOT NULL,
	[TotalGovRecov] [decimal](28, 10) NOT NULL,
	[TotalLayby] [decimal](28, 10) NOT NULL,
	[TotalLines] [int] NOT NULL,
	[TotalPoints] [decimal](28, 10) NOT NULL,
	[TotalProfit] [decimal](28, 10) NOT NULL,
	[TotalQuantity] [float] NOT NULL,
	[TotalRetailPrice] [decimal](28, 10) NOT NULL,
	[TotalScripts] [int] NOT NULL,
	[TotalTax] [decimal](28, 10) NOT NULL,
	[TransactionNumber] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_doActivity] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doActivityEntry]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doActivityEntry](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[Activity] [bigint] NOT NULL,
	[Cost] [decimal](28, 10) NOT NULL,
	[Discount] [decimal](28, 10) NOT NULL,
	[ExtendedPrice] [decimal](28, 10) NOT NULL,
	[GovRecov] [decimal](28, 10) NOT NULL,
	[ItemTransacted] [bigint] NOT NULL,
	[Points] [decimal](28, 10) NOT NULL,
	[Quantity] [float] NOT NULL,
	[QuantityDiscountScheme] [bigint] NOT NULL,
	[Remarks] [nvarchar](1024) NOT NULL,
	[RetailPrice] [decimal](28, 10) NOT NULL,
	[SaleDescription] [nvarchar](4000) NOT NULL,
	[Script] [bigint] NOT NULL,
	[Tax] [decimal](28, 10) NOT NULL,
 CONSTRAINT [PK_doActivityEntry] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doActivityEntry-ReconcileEntry]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doActivityEntry-ReconcileEntry](
	[ID] [bigint] NOT NULL,
	[Owner] [bigint] NOT NULL,
	[AdjustmentActivity] [bigint] NOT NULL,
	[PaidAmount] [decimal](28, 10) NOT NULL,
	[PaymentActivity] [bigint] NOT NULL,
	[Remarks] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_doActivityEntry-ReconcileEntry] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doActivityEntryReconcileEntry$IdGenerator]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doActivityEntryReconcileEntry$IdGenerator](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_doActivityEntryReconcileEntry$IdGenerator] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doAlert]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doAlert](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AlertDate] [datetime] NOT NULL,
	[AlertTriggerType] [int] NOT NULL,
	[AlertedObject] [bigint] NOT NULL,
	[AssignedTo] [bigint] NOT NULL,
	[Priority] [int] NOT NULL,
	[RaisedCount] [int] NOT NULL,
 CONSTRAINT [PK_doAlert] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doAlertTrigger]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doAlertTrigger](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AlertTriggerType] [int] NOT NULL,
	[AssignedTo] [bigint] NOT NULL,
	[Priority] [int] NOT NULL,
	[TriggerValue1] [varbinary](max) NOT NULL,
	[TriggerValue2] [varbinary](max) NOT NULL,
	[Unique] [bit] NOT NULL,
 CONSTRAINT [PK_doAlertTrigger] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doAlias]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doAlias](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[IBHeaderGuid] [uniqueidentifier] NOT NULL,
	[RapidObjectGuid] [uniqueidentifier] NOT NULL,
	[RapidSyncRequired] [bit] NOT NULL,
	[RecordStatus] [bigint] NOT NULL,
	[Code] [nvarchar](20) NOT NULL,
	[IsLabelOnly] [bit] NOT NULL,
	[IsNumeric] [bit] NOT NULL,
	[ItemAliased] [bigint] NOT NULL,
	[LastItemAliased] [bigint] NOT NULL,
 CONSTRAINT [PK_doAlias] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doAssistantTask]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doAssistantTask](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_doAssistantTask] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doAudit]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doAudit](
	[ID] [bigint] NOT NULL,
	[AuditActionType] [int] NOT NULL,
	[AuditDate] [datetime] NOT NULL,
	[AuditType] [int] NOT NULL,
	[AuditedObject] [bigint] NOT NULL,
	[Field] [nvarchar](128) NULL,
	[FriendlyName] [nvarchar](256) NOT NULL,
	[FromValue] [nvarchar](500) NULL,
	[Message] [nvarchar](500) NOT NULL,
	[ObjectType] [nvarchar](128) NOT NULL,
	[SourceName] [nvarchar](128) NOT NULL,
	[ToValue] [nvarchar](500) NULL,
 CONSTRAINT [PK_doAudit] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doAuditAggregateDataObject]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doAuditAggregateDataObject](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
 CONSTRAINT [PK_doAuditAggregateDataObject] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doAuditDataObject]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doAuditDataObject](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
 CONSTRAINT [PK_doAuditDataObject] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doBatch]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doBatch](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[IBHeaderGuid] [uniqueidentifier] NOT NULL,
	[RapidObjectGuid] [uniqueidentifier] NOT NULL,
	[RapidSyncRequired] [bit] NOT NULL,
	[RecordStatus] [bigint] NOT NULL,
	[AbortedTransactionCount] [int] NOT NULL,
	[BatchNumber] [int] NOT NULL,
	[BatchStatus] [int] NOT NULL,
	[CashBackSurcharge] [decimal](28, 10) NOT NULL,
	[ClosingTime] [datetime] NOT NULL,
	[ClosingTotal] [decimal](28, 10) NOT NULL,
	[Comments] [nvarchar](4000) NOT NULL,
	[CostOfGoods] [decimal](28, 10) NOT NULL,
	[CustomerCount] [int] NOT NULL,
	[CustomerDepositMade] [decimal](28, 10) NOT NULL,
	[CustomerDepositRedeemed] [decimal](28, 10) NOT NULL,
	[DebitSurcharge] [decimal](28, 10) NOT NULL,
	[Discounts] [decimal](28, 10) NOT NULL,
	[Dropped] [decimal](28, 10) NOT NULL,
	[GovernmentRecovery] [decimal](28, 10) NOT NULL,
	[LayawayClosed] [decimal](28, 10) NOT NULL,
	[LayawayPaid] [decimal](28, 10) NOT NULL,
	[Locked] [datetime] NOT NULL,
	[NoSalesCount] [int] NOT NULL,
	[OpeningTime] [datetime] NOT NULL,
	[OpeningTotal] [decimal](28, 10) NOT NULL,
	[OverUnder] [decimal](28, 10) NOT NULL,
	[PaidOnAccount] [decimal](28, 10) NOT NULL,
	[PaidOut] [decimal](28, 10) NOT NULL,
	[PaidToAccount] [decimal](28, 10) NOT NULL,
	[Register] [bigint] NOT NULL,
	[Returns] [decimal](28, 10) NOT NULL,
	[Sales] [decimal](28, 10) NOT NULL,
	[SalesPlusTax] [decimal](28, 10) NOT NULL,
	[Tax] [decimal](28, 10) NOT NULL,
	[TenderRoundingError] [decimal](28, 10) NOT NULL,
	[TotalChange] [decimal](28, 10) NOT NULL,
	[TotalTendered] [decimal](28, 10) NOT NULL,
 CONSTRAINT [PK_doBatch] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doBusinessUnit]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doBusinessUnit](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[IBHeaderGuid] [uniqueidentifier] NOT NULL,
	[RapidObjectGuid] [uniqueidentifier] NOT NULL,
	[RapidSyncRequired] [bit] NOT NULL,
	[RecordStatus] [bigint] NOT NULL,
	[ABN] [nvarchar](50) NOT NULL,
	[Account] [nvarchar](50) NOT NULL,
	[AddressLine1] [nvarchar](50) NOT NULL,
	[AddressLine2] [nvarchar](50) NOT NULL,
	[AddressState] [nvarchar](20) NOT NULL,
	[BSB] [nvarchar](50) NOT NULL,
	[City] [nvarchar](20) NOT NULL,
	[Company] [nvarchar](128) NOT NULL,
	[ConfigXML] [nvarchar](max) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
	[EmailAddress] [nvarchar](255) NOT NULL,
	[FaxNumber] [nvarchar](30) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[ForceDomainBuild3_7v3] [int] NOT NULL,
	[FridayCloseTime] [datetime] NOT NULL,
	[FridayOpenTime] [datetime] NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Master] [bit] NOT NULL,
	[MobileNumber] [nvarchar](30) NOT NULL,
	[MondayCloseTime] [datetime] NOT NULL,
	[MondayOpenTime] [datetime] NOT NULL,
	[NextAccountNumber] [int] NOT NULL,
	[NextCampaignCode] [int] NOT NULL,
	[NextCategoryCode] [int] NOT NULL,
	[NextDepartmentCode] [int] NOT NULL,
	[NextItemCode] [int] NOT NULL,
	[NextOfferCampaignCode] [int] NOT NULL,
	[NextOfferCode] [int] NOT NULL,
	[NextPurchaseOrderCode] [int] NOT NULL,
	[NextPurchaseOrderRFCCode] [int] NOT NULL,
	[NextReasonCode] [int] NOT NULL,
	[NextReturnOrderCode] [int] NOT NULL,
	[NextSatScanCode] [int] NOT NULL,
	[NextSupplierCode] [int] NOT NULL,
	[NextTenderTypeCode] [int] NOT NULL,
	[NextTransferInCode] [int] NOT NULL,
	[NextTransferOutCode] [int] NOT NULL,
	[NextTransferOutInvoiceCode] [int] NOT NULL,
	[ParentABN] [nvarchar](50) NOT NULL,
	[ParentCompany] [nvarchar](128) NOT NULL,
	[PhoneNumber] [nvarchar](30) NOT NULL,
	[PostCode] [nvarchar](20) NOT NULL,
	[PurchaseOrderCodePrefix] [nvarchar](4000) NOT NULL,
	[PurchaseOrderDefaultRequiredDays] [int] NOT NULL,
	[PurchaseOrderRFCCodePrefix] [nvarchar](4000) NOT NULL,
	[PurchaseOrderVariationPercent] [decimal](28, 10) NOT NULL,
	[ReturnOrderCodePrefix] [nvarchar](4000) NOT NULL,
	[SaturdayCloseTime] [datetime] NOT NULL,
	[SaturdayOpenTime] [datetime] NOT NULL,
	[SiteGuid] [uniqueidentifier] NOT NULL,
	[StoreID] [int] NOT NULL,
	[SundayCloseTime] [datetime] NOT NULL,
	[SundayOpenTime] [datetime] NOT NULL,
	[SystemGSTFreeItemTax] [bigint] NOT NULL,
	[SystemGSTItemTax] [bigint] NOT NULL,
	[SystemNoGSTItemTax] [bigint] NOT NULL,
	[ThursdayCloseTime] [datetime] NOT NULL,
	[ThursdayOpenTime] [datetime] NOT NULL,
	[TimeAdded] [datetime] NOT NULL,
	[TimeRemoved] [datetime] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[TransferInCodePrefix] [nvarchar](4000) NOT NULL,
	[TransferOutCodePrefix] [nvarchar](4000) NOT NULL,
	[TransferOutInvoiceCodePrefix] [nvarchar](4000) NOT NULL,
	[TuesdayCloseTime] [datetime] NOT NULL,
	[TuesdayOpenTime] [datetime] NOT NULL,
	[Web] [nvarchar](255) NOT NULL,
	[WednesdayCloseTime] [datetime] NOT NULL,
	[WednesdayOpenTime] [datetime] NOT NULL,
 CONSTRAINT [PK_doBusinessUnit] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doBusinessUnit-AuditHistory]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doBusinessUnit-AuditHistory](
	[ID] [bigint] NOT NULL,
	[Owner] [bigint] NOT NULL,
	[AuditActionType] [int] NOT NULL,
	[AuditDate] [datetime] NOT NULL,
	[AuditType] [int] NOT NULL,
	[AuditedObject] [bigint] NOT NULL,
	[Field] [nvarchar](128) NULL,
	[FriendlyName] [nvarchar](256) NOT NULL,
	[FromValue] [nvarchar](500) NULL,
	[Message] [nvarchar](500) NOT NULL,
	[ObjectType] [nvarchar](128) NOT NULL,
	[SourceName] [nvarchar](128) NOT NULL,
	[ToValue] [nvarchar](500) NULL,
 CONSTRAINT [PK_doBusinessUnit-AuditHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doBusinessUnitAuditHistory$IdGenerator]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doBusinessUnitAuditHistory$IdGenerator](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_doBusinessUnitAuditHistory$IdGenerator] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doBusinessUnit-Events]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doBusinessUnit-Events](
	[ID] [bigint] NOT NULL,
	[Owner] [bigint] NOT NULL,
	[AggregateObject] [bigint] NOT NULL,
	[AggregateObjectType] [nvarchar](4000) NOT NULL,
	[EventSource] [nvarchar](4000) NOT NULL,
	[EventType] [int] NOT NULL,
	[Message] [nvarchar](4000) NOT NULL,
	[Relationship] [bigint] NOT NULL,
	[TimeOccurred] [datetime] NOT NULL,
 CONSTRAINT [PK_doBusinessUnit-Events] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doBusinessUnitEvents$IdGenerator]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doBusinessUnitEvents$IdGenerator](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_doBusinessUnitEvents$IdGenerator] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doBusinessUnit-MandatoryFields]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doBusinessUnit-MandatoryFields](
	[ID] [bigint] NOT NULL,
	[Owner] [bigint] NOT NULL,
	[Description] [nvarchar](4000) NOT NULL,
	[FieldName] [nvarchar](4000) NOT NULL,
	[IsMandatory] [bit] NOT NULL,
	[IsSystem] [bit] NOT NULL,
	[TypeName] [nvarchar](4000) NOT NULL,
 CONSTRAINT [PK_doBusinessUnit-MandatoryFields] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doBusinessUnitMandatoryFields$IdGenerator]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doBusinessUnitMandatoryFields$IdGenerator](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_doBusinessUnitMandatoryFields$IdGenerator] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doCashier]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doCashier](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[CashDrawerNumber] [int] NOT NULL,
	[EmailAddress] [nvarchar](255) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[FloorLimit] [float] NOT NULL,
	[GroupedDescription] [nvarchar](4000) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[MaxOverShortAmount] [float] NOT NULL,
	[MaxOverShortPercent] [float] NOT NULL,
	[OverShortLimitType] [int] NOT NULL,
	[Password] [nvarchar](4000) NOT NULL,
	[PhoneNumber] [nvarchar](30) NOT NULL,
	[Privileges] [int] NOT NULL,
	[ReturnLimit] [float] NOT NULL,
	[SecurityLevel] [int] NOT NULL,
	[UserName] [nvarchar](4000) NOT NULL,
 CONSTRAINT [PK_doCashier] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doCategory]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doCategory](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[IBHeaderGuid] [uniqueidentifier] NOT NULL,
	[RapidObjectGuid] [uniqueidentifier] NOT NULL,
	[RapidSyncRequired] [bit] NOT NULL,
	[RecordStatus] [bigint] NOT NULL,
	[Active] [bit] NOT NULL,
	[AppCatHQID] [bigint] NOT NULL,
	[AppCatHQLastMatched] [datetime] NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Department] [bigint] NOT NULL,
	[Markup] [decimal](28, 10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_doCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doChargeType]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doChargeType](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[Active] [bit] NOT NULL,
	[Code] [nvarchar](1) NOT NULL,
	[ColorCode] [nvarchar](20) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[PrivateFee] [decimal](28, 10) NOT NULL,
	[PrivateMarkup] [decimal](28, 10) NOT NULL,
	[SortOrder] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_doChargeType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doClaim]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doClaim](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[Amount] [decimal](28, 10) NOT NULL,
	[Category] [nchar](1) NOT NULL,
	[ClaimDate] [datetime] NOT NULL,
	[ClaimKey] [bigint] NOT NULL,
	[ClaimNumber] [decimal](28, 10) NOT NULL,
	[ClaimPart] [decimal](28, 10) NOT NULL,
	[FormCategory] [decimal](28, 10) NOT NULL,
	[IsPaid] [bit] NOT NULL,
	[MedicareFirstName] [nvarchar](12) NOT NULL,
	[MedicareLastName] [nvarchar](24) NOT NULL,
	[MedicareNumber] [bigint] NOT NULL,
	[PBSAcceptCode] [nchar](1) NOT NULL,
	[PBSAcknowledge] [nchar](1) NOT NULL,
	[PBSPayDate] [datetime] NOT NULL,
	[PBSPaymentAdjustment] [decimal](28, 10) NOT NULL,
	[PBSPaymentAmount] [decimal](28, 10) NOT NULL,
	[PBSPaymentID] [nvarchar](12) NOT NULL,
	[PBSProcessingCode] [nvarchar](2) NOT NULL,
	[PBSProcessingCodeHistory] [nvarchar](2) NOT NULL,
	[PBSReferenceNumber] [nvarchar](12) NOT NULL,
	[PBSResubmit] [nchar](1) NOT NULL,
	[PayCategory] [decimal](28, 10) NOT NULL,
	[ProblemReturnCode] [nvarchar](59) NOT NULL,
	[Reference] [decimal](28, 10) NOT NULL,
	[ReferencePeriod] [decimal](28, 10) NOT NULL,
	[ScriptNumber] [decimal](28, 10) NOT NULL,
	[SerialNumber] [nvarchar](11) NOT NULL,
	[Status] [nchar](1) NOT NULL,
 CONSTRAINT [PK_doClaim] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doCurrency]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doCurrency](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[IBHeaderGuid] [uniqueidentifier] NOT NULL,
	[RapidObjectGuid] [uniqueidentifier] NOT NULL,
	[RapidSyncRequired] [bit] NOT NULL,
	[RecordStatus] [bigint] NOT NULL,
	[Code] [nvarchar](17) NOT NULL,
	[Description] [nvarchar](25) NOT NULL,
	[ExchangeRate] [float] NOT NULL,
	[LocaleId] [bigint] NOT NULL,
 CONSTRAINT [PK_doCurrency] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doCustomer]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doCustomer](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[AddressLine1] [nvarchar](4000) NOT NULL,
	[AddressLine2] [nvarchar](4000) NOT NULL,
	[AddressState] [nvarchar](4000) NOT NULL,
	[City] [nvarchar](4000) NOT NULL,
	[Company] [nvarchar](4000) NOT NULL,
	[CustomDate1] [datetime] NOT NULL,
	[CustomDate2] [datetime] NOT NULL,
	[CustomDate3] [datetime] NOT NULL,
	[CustomDate4] [datetime] NOT NULL,
	[CustomDate5] [datetime] NOT NULL,
	[CustomNumber1] [decimal](28, 10) NOT NULL,
	[CustomNumber2] [decimal](28, 10) NOT NULL,
	[CustomNumber3] [decimal](28, 10) NOT NULL,
	[CustomNumber4] [decimal](28, 10) NOT NULL,
	[CustomNumber5] [decimal](28, 10) NOT NULL,
	[CustomText1] [nvarchar](50) NOT NULL,
	[CustomText2] [nvarchar](50) NOT NULL,
	[CustomText3] [nvarchar](50) NOT NULL,
	[CustomText4] [nvarchar](50) NOT NULL,
	[CustomText5] [nvarchar](50) NOT NULL,
	[DateOfBirth] [datetime] NOT NULL,
	[EmailAddress] [nvarchar](4000) NOT NULL,
	[FaxNumber] [nvarchar](4000) NOT NULL,
	[FirstName] [nvarchar](4000) NOT NULL,
	[GroupedDescription] [nvarchar](4000) NOT NULL,
	[LastName] [nvarchar](4000) NOT NULL,
	[MobileNumber] [nvarchar](4000) NOT NULL,
	[PhoneNumber] [nvarchar](4000) NOT NULL,
	[PostCode] [nvarchar](4000) NOT NULL,
	[Remarks] [nvarchar](1000) NOT NULL,
	[Title] [nvarchar](4000) NOT NULL,
	[Web] [nvarchar](4000) NOT NULL,
 CONSTRAINT [PK_doCustomer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doDataAssistantTemplate]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doDataAssistantTemplate](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[ColumnCount] [int] NOT NULL,
	[DataAssistantType] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDefault] [bit] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[TemplateXML] [ntext] NOT NULL,
 CONSTRAINT [PK_doDataAssistantTemplate] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doDataObject]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doDataObject](
	[ID] [bigint] NOT NULL,
	[TypeID] [int] NOT NULL,
	[VersionID] [int] NOT NULL,
	[Permissions] [varbinary](max) NULL,
	[FastLoadData] [varbinary](max) NULL,
 CONSTRAINT [PK_doDataObject] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doDepartment]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doDepartment](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[IBHeaderGuid] [uniqueidentifier] NOT NULL,
	[RapidObjectGuid] [uniqueidentifier] NOT NULL,
	[RapidSyncRequired] [bit] NOT NULL,
	[RecordStatus] [bigint] NOT NULL,
	[Active] [bit] NOT NULL,
	[AppCatHQID] [bigint] NOT NULL,
	[AppCatHQLastMatched] [datetime] NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[IsOtherCostDepartment] [bit] NOT NULL,
	[Markup] [decimal](28, 10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_doDepartment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doDimension]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doDimension](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[IBHeaderGuid] [uniqueidentifier] NOT NULL,
	[RapidObjectGuid] [uniqueidentifier] NOT NULL,
	[RapidSyncRequired] [bit] NOT NULL,
	[RecordStatus] [bigint] NOT NULL,
	[Description] [nvarchar](40) NOT NULL,
	[InActive] [bit] NOT NULL,
	[Name] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK_doDimension] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doDimensionAttribute]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doDimensionAttribute](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[IBHeaderGuid] [uniqueidentifier] NOT NULL,
	[RapidObjectGuid] [uniqueidentifier] NOT NULL,
	[RapidSyncRequired] [bit] NOT NULL,
	[RecordStatus] [bigint] NOT NULL,
	[Attribute] [nvarchar](60) NOT NULL,
	[Code] [nvarchar](5) NOT NULL,
	[Dimension] [bigint] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[InActive] [bit] NOT NULL,
 CONSTRAINT [PK_doDimensionAttribute] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doDoctor]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doDoctor](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[Address] [nvarchar](24) NOT NULL,
	[DoctorCode] [nvarchar](4) NOT NULL,
	[DoctorOnLabel] [bit] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[FaxNumber] [nvarchar](11) NOT NULL,
	[FirstName] [nvarchar](16) NOT NULL,
	[GroupedDescription] [nvarchar](4000) NOT NULL,
	[LastName] [nvarchar](16) NOT NULL,
	[MobileNumber] [nvarchar](11) NOT NULL,
	[PhoneNumber] [nvarchar](11) NOT NULL,
	[PostCode] [bigint] NOT NULL,
	[PrescriberNumber] [bigint] NOT NULL,
	[StolenScriptPads] [bit] NOT NULL,
	[Suburb] [nvarchar](24) NOT NULL,
 CONSTRAINT [PK_doDoctor] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doDraft]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doDraft](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[DraftType] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Remarks] [nvarchar](512) NULL,
	[UserAccount] [bigint] NOT NULL,
 CONSTRAINT [PK_doDraft] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doDraftEntry]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doDraftEntry](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[Comment] [nvarchar](4000) NOT NULL,
	[Cost] [decimal](28, 10) NOT NULL,
	[Draft] [bigint] NOT NULL,
	[DraftEntrySource] [int] NOT NULL,
	[DraftItem] [bigint] NOT NULL,
	[Price] [decimal](28, 10) NOT NULL,
	[QuantityOrdered] [int] NOT NULL,
	[Supplier] [bigint] NOT NULL,
	[SupplierItem] [bigint] NOT NULL,
 CONSTRAINT [PK_doDraftEntry] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doDropPayout]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doDropPayout](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[Amount] [decimal](28, 10) NOT NULL,
	[Batch] [bigint] NOT NULL,
	[Cashier] [bigint] NOT NULL,
	[Comment] [nvarchar](4000) NOT NULL,
	[ReasonCode] [bigint] NOT NULL,
	[Recipient] [nvarchar](4000) NOT NULL,
 CONSTRAINT [PK_doDropPayout] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doDrug]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doDrug](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[APNCode] [nvarchar](13) NOT NULL,
	[AustralianRegistrationNumber] [nvarchar](5) NOT NULL,
	[Code] [nvarchar](6) NOT NULL,
	[ContractSupplier] [nvarchar](3) NOT NULL,
	[ContractWholesalePrice] [decimal](28, 10) NOT NULL,
	[DeletedDate] [nvarchar](4) NOT NULL,
	[DifferentNHSCodes] [nchar](1) NOT NULL,
	[DiscountRate] [decimal](28, 10) NOT NULL,
	[DrugItem] [bigint] NOT NULL,
	[ExtempIndicator] [nchar](1) NOT NULL,
	[Form] [nvarchar](10) NOT NULL,
	[GSTIncluded] [bit] NOT NULL,
	[GenericCode] [nvarchar](6) NOT NULL,
	[GenericName] [nvarchar](30) NOT NULL,
	[GenericSubstitutionIndicator] [nchar](1) NOT NULL,
	[GroupedDescription] [nvarchar](4000) NOT NULL,
	[HBFCode] [nvarchar](5) NOT NULL,
	[InteractionGroup] [decimal](28, 10) NOT NULL,
	[InteractionGroup2] [decimal](28, 10) NOT NULL,
	[IsUserDrug] [bit] NOT NULL,
	[LabelSize] [nchar](1) NOT NULL,
	[ManufacturerCode] [nvarchar](2) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Notes] [nvarchar](4000) NOT NULL,
	[OTCPrice] [decimal](28, 10) NOT NULL,
	[OurWholesale] [bit] NOT NULL,
	[OwnWarnings] [nvarchar](10) NOT NULL,
	[PDENumber] [nvarchar](6) NOT NULL,
	[PDENumber2] [nvarchar](6) NOT NULL,
	[PackSize] [decimal](28, 10) NOT NULL,
	[PrivateDispensingFeeCategory] [decimal](28, 10) NOT NULL,
	[PrivateMarkupCategory] [decimal](28, 10) NOT NULL,
	[PrivatePrice] [decimal](28, 10) NOT NULL,
	[Ranking] [decimal](28, 10) NOT NULL,
	[RecommendedWarningLabels] [nvarchar](30) NOT NULL,
	[Schedule] [nvarchar](2) NOT NULL,
	[Schedule3RPrice] [decimal](28, 10) NOT NULL,
	[SearchStrength] [nvarchar](7) NOT NULL,
	[Status] [nchar](1) NOT NULL,
	[StockGroup] [decimal](28, 10) NOT NULL,
	[Strength] [nvarchar](20) NOT NULL,
	[SupplierCode] [nvarchar](3) NOT NULL,
	[SupplierCode2] [nvarchar](3) NOT NULL,
	[UseNHSGeneric] [bit] NOT NULL,
	[UserDrugCode] [nvarchar](6) NOT NULL,
	[WholesalePrice] [decimal](28, 10) NOT NULL,
 CONSTRAINT [PK_doDrug] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doEmailTemplate]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doEmailTemplate](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[EmailBodyHtml] [ntext] NOT NULL,
	[EmailSubject] [nvarchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_doEmailTemplate] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doEmailTemplate-EmailImage]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doEmailTemplate-EmailImage](
	[ID] [bigint] NOT NULL,
	[Owner] [bigint] NOT NULL,
	[ImageBytes] [varbinary](max) NOT NULL,
	[ImageName] [nvarchar](4000) NOT NULL,
	[MediaContentType] [nvarchar](4000) NOT NULL,
 CONSTRAINT [PK_doEmailTemplate-EmailImage] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doEmailTemplateEmailImage$IdGenerator]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doEmailTemplateEmailImage$IdGenerator](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_doEmailTemplateEmailImage$IdGenerator] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doFtObject]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doFtObject](
	[ID] [bigint] NOT NULL,
	[FtRecordIsUpToDate] [bit] NOT NULL,
	[TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_doFtObject] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doFtRecord]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doFtRecord](
	[ID] [bigint] NOT NULL,
	[FtData-En] [nvarchar](max) NOT NULL,
	[FtObject] [bigint] NOT NULL,
	[IsIndexed] [bit] NOT NULL,
 CONSTRAINT [PK_doFtRecord] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doGroup]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doGroup](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
	[GroupType] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_doGroup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doGroup-GroupEntries]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doGroup-GroupEntries](
	[ID-1] [bigint] NOT NULL,
	[ID-2] [bigint] NOT NULL,
 CONSTRAINT [PK_doGroup-GroupEntries] PRIMARY KEY CLUSTERED 
(
	[ID-1] ASC,
	[ID-2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doIAccountOwner]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doIAccountOwner](
	[ID] [bigint] NOT NULL,
	[VersionID] [int] NOT NULL,
	[Permissions] [varbinary](max) NULL,
	[FastLoadData] [varbinary](max) NULL,
	[AddressLine1] [nvarchar](4000) NOT NULL,
	[AddressLine2] [nvarchar](4000) NOT NULL,
	[AddressState] [nvarchar](4000) NOT NULL,
	[City] [nvarchar](4000) NOT NULL,
	[Company] [nvarchar](4000) NOT NULL,
	[EmailAddress] [nvarchar](4000) NOT NULL,
	[FaxNumber] [nvarchar](4000) NOT NULL,
	[FirstName] [nvarchar](4000) NOT NULL,
	[LastName] [nvarchar](4000) NOT NULL,
	[MobileNumber] [nvarchar](4000) NOT NULL,
	[PhoneNumber] [nvarchar](4000) NOT NULL,
	[PostCode] [nvarchar](4000) NOT NULL,
	[Title] [nvarchar](4000) NOT NULL,
	[Web] [nvarchar](4000) NOT NULL,
 CONSTRAINT [PK_doIAccountOwner] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doIAccountTypeOwner]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doIAccountTypeOwner](
	[ID] [bigint] NOT NULL,
	[VersionID] [int] NOT NULL,
	[Permissions] [varbinary](max) NULL,
	[FastLoadData] [varbinary](max) NULL,
	[AddressLine1] [nvarchar](4000) NOT NULL,
	[AddressLine2] [nvarchar](4000) NOT NULL,
	[AddressState] [nvarchar](4000) NOT NULL,
	[City] [nvarchar](4000) NOT NULL,
	[Company] [nvarchar](4000) NOT NULL,
	[EmailAddress] [nvarchar](4000) NOT NULL,
	[FaxNumber] [nvarchar](4000) NOT NULL,
	[FirstName] [nvarchar](4000) NOT NULL,
	[LastName] [nvarchar](4000) NOT NULL,
	[MobileNumber] [nvarchar](4000) NOT NULL,
	[PhoneNumber] [nvarchar](4000) NOT NULL,
	[PostCode] [nvarchar](4000) NOT NULL,
	[Title] [nvarchar](4000) NOT NULL,
	[Web] [nvarchar](4000) NOT NULL,
 CONSTRAINT [PK_doIAccountTypeOwner] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doIAggregate]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doIAggregate](
	[ID] [bigint] NOT NULL,
	[VersionID] [int] NOT NULL,
	[Permissions] [varbinary](max) NULL,
	[FastLoadData] [varbinary](max) NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
 CONSTRAINT [PK_doIAggregate] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doIAppCat]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doIAppCat](
	[ID] [bigint] NOT NULL,
	[VersionID] [int] NOT NULL,
	[Permissions] [varbinary](max) NULL,
	[FastLoadData] [varbinary](max) NULL,
	[AppCatHQID] [bigint] NOT NULL,
	[AppCatHQLastMatched] [datetime] NOT NULL,
 CONSTRAINT [PK_doIAppCat] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doIDataObject]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doIDataObject](
	[ID] [bigint] NOT NULL,
	[TypeID] [int] NOT NULL,
	[VersionID] [int] NOT NULL,
	[Permissions] [varbinary](max) NULL,
	[FastLoadData] [varbinary](max) NULL,
 CONSTRAINT [PK_doIDataObject] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doIdGenerator]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doIdGenerator](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_doIdGenerator] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doIFtObject]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doIFtObject](
	[ID] [bigint] NOT NULL,
	[VersionID] [int] NOT NULL,
	[Permissions] [varbinary](max) NULL,
	[FastLoadData] [varbinary](max) NULL,
	[FtRecordIsUpToDate] [bit] NOT NULL,
 CONSTRAINT [PK_doIFtObject] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doIGroupable]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doIGroupable](
	[ID] [bigint] NOT NULL,
	[VersionID] [int] NOT NULL,
	[Permissions] [varbinary](max) NULL,
	[FastLoadData] [varbinary](max) NULL,
	[GroupedDescription] [nvarchar](4000) NOT NULL,
 CONSTRAINT [PK_doIGroupable] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doIHasNoAccessControlList]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doIHasNoAccessControlList](
	[ID] [bigint] NOT NULL,
	[VersionID] [int] NOT NULL,
	[Permissions] [varbinary](max) NULL,
	[FastLoadData] [varbinary](max) NULL,
 CONSTRAINT [PK_doIHasNoAccessControlList] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doIImportable]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doIImportable](
	[ID] [bigint] NOT NULL,
	[VersionID] [int] NOT NULL,
	[Permissions] [varbinary](max) NULL,
	[FastLoadData] [varbinary](max) NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[ImportDescription] [nvarchar](4000) NOT NULL,
 CONSTRAINT [PK_doIImportable] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doILabelSource]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doILabelSource](
	[ID] [bigint] NOT NULL,
	[VersionID] [int] NOT NULL,
	[Permissions] [varbinary](max) NULL,
	[FastLoadData] [varbinary](max) NULL,
 CONSTRAINT [PK_doILabelSource] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doILabelSourceEntry]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doILabelSourceEntry](
	[ID] [bigint] NOT NULL,
	[VersionID] [int] NOT NULL,
	[Permissions] [varbinary](max) NULL,
	[FastLoadData] [varbinary](max) NULL,
 CONSTRAINT [PK_doILabelSourceEntry] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doILabelSource-LabelQueues]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doILabelSource-LabelQueues](
	[ID-1] [bigint] NOT NULL,
	[ID-2] [bigint] NOT NULL,
 CONSTRAINT [PK_doILabelSource-LabelQueues] PRIMARY KEY CLUSTERED 
(
	[ID-1] ASC,
	[ID-2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doIMailingAddress]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doIMailingAddress](
	[ID] [bigint] NOT NULL,
	[VersionID] [int] NOT NULL,
	[Permissions] [varbinary](max) NULL,
	[FastLoadData] [varbinary](max) NULL,
	[AddressLine1] [nvarchar](4000) NOT NULL,
	[AddressLine2] [nvarchar](4000) NOT NULL,
	[AddressState] [nvarchar](4000) NOT NULL,
	[City] [nvarchar](4000) NOT NULL,
	[Company] [nvarchar](4000) NOT NULL,
	[EmailAddress] [nvarchar](4000) NOT NULL,
	[FaxNumber] [nvarchar](4000) NOT NULL,
	[FirstName] [nvarchar](4000) NOT NULL,
	[LastName] [nvarchar](4000) NOT NULL,
	[MobileNumber] [nvarchar](4000) NOT NULL,
	[PhoneNumber] [nvarchar](4000) NOT NULL,
	[PostCode] [nvarchar](4000) NOT NULL,
	[Title] [nvarchar](4000) NOT NULL,
	[Web] [nvarchar](4000) NOT NULL,
 CONSTRAINT [PK_doIMailingAddress] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doInvoice]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doInvoice](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[IBHeaderGuid] [uniqueidentifier] NOT NULL,
	[RapidObjectGuid] [uniqueidentifier] NOT NULL,
	[RapidSyncRequired] [bit] NOT NULL,
	[RecordStatus] [bigint] NOT NULL,
	[ActualInvoiceValue] [decimal](28, 10) NOT NULL,
	[Currency] [bigint] NOT NULL,
	[DeliverAfter] [datetime] NOT NULL,
	[DeliverBefore] [datetime] NOT NULL,
	[DriverName] [nvarchar](100) NOT NULL,
	[ExchangeRate] [float] NOT NULL,
	[ExpectedDate] [datetime] NOT NULL,
	[ExpectedInvoiceValue] [decimal](28, 10) NOT NULL,
	[ForceExpectedInvoiceValueUpdate] [bit] NOT NULL,
	[HasOrder] [bit] NOT NULL,
	[InvoiceDate] [datetime] NOT NULL,
	[InvoiceEntryLastModified] [bigint] NOT NULL,
	[InvoiceGatewayID] [bigint] NOT NULL,
	[InvoiceNumber] [nvarchar](100) NOT NULL,
	[InvoiceType] [int] NOT NULL,
	[IsAboveVariationLimit] [bit] NOT NULL,
	[IsApproved] [bit] NOT NULL,
	[IsClosed] [bit] NOT NULL,
	[PurchaseOrderGatewayID] [bigint] NOT NULL,
	[ReceivedBy] [nvarchar](100) NOT NULL,
	[Supplier] [bigint] NOT NULL,
	[TransferActivity] [bigint] NOT NULL,
	[TransferReference] [nvarchar](50) NOT NULL,
	[Variation] [decimal](28, 10) NOT NULL,
 CONSTRAINT [PK_doInvoice] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doInvoiceEntry]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doInvoiceEntry](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[IBHeaderGuid] [uniqueidentifier] NOT NULL,
	[RapidObjectGuid] [uniqueidentifier] NOT NULL,
	[RapidSyncRequired] [bit] NOT NULL,
	[RecordStatus] [bigint] NOT NULL,
	[Class] [nvarchar](4000) NOT NULL,
	[DiscountIncGst] [decimal](28, 10) NOT NULL,
	[Ean] [nvarchar](4000) NOT NULL,
	[ExtSupplierCostTax] [decimal](28, 10) NOT NULL,
	[ExtendedForeignCost] [decimal](28, 10) NOT NULL,
	[ForeignCost] [decimal](28, 10) NOT NULL,
	[GatewayResponse] [nvarchar](255) NOT NULL,
	[Invoice] [bigint] NOT NULL,
	[InvoicedItem] [bigint] NOT NULL,
	[ItemDescription] [nvarchar](50) NOT NULL,
	[ItemTax] [bigint] NOT NULL,
	[Manufacturer] [nvarchar](4000) NOT NULL,
	[NetInStoreCost] [decimal](28, 10) NOT NULL,
	[NormalCostExGst] [decimal](28, 10) NOT NULL,
	[NormalCostGst] [decimal](28, 10) NOT NULL,
	[NormalCostIncGst] [decimal](28, 10) NOT NULL,
	[OrderedQuantity] [float] NOT NULL,
	[OriginalQuantityOrdered] [float] NOT NULL,
	[PacksBackordered] [int] NOT NULL,
	[PacksOrdered] [int] NOT NULL,
	[PacksOutOfStock] [int] NOT NULL,
	[PacksSupplied] [int] NOT NULL,
	[QuantityInvoiced] [float] NOT NULL,
	[QuantityOutOfStock] [float] NOT NULL,
	[QuantityReceived] [float] NOT NULL,
	[QuantityReturnForCredit] [float] NOT NULL,
	[QuantityScanned] [float] NOT NULL,
	[Reference] [nvarchar](50) NOT NULL,
	[ReorderNumber] [nvarchar](25) NOT NULL,
	[RetailPrice] [decimal](28, 10) NOT NULL,
	[SupplierCost] [decimal](28, 10) NOT NULL,
	[SupplierCostTax] [decimal](28, 10) NOT NULL,
	[SurchargeIncGst] [decimal](28, 10) NOT NULL,
	[Tote] [nvarchar](4000) NOT NULL,
	[Tun] [nvarchar](4000) NOT NULL,
	[Warehouse] [nvarchar](4000) NOT NULL,
 CONSTRAINT [PK_doInvoiceEntry] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doInvoiceEntryReceive]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doInvoiceEntryReceive](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[IBHeaderGuid] [uniqueidentifier] NOT NULL,
	[RapidObjectGuid] [uniqueidentifier] NOT NULL,
	[RapidSyncRequired] [bit] NOT NULL,
	[RecordStatus] [bigint] NOT NULL,
	[InvoiceEntry] [bigint] NOT NULL,
	[PurchaseOrderEntry] [bigint] NOT NULL,
	[QuantityInvoiced] [float] NOT NULL,
	[QuantityOutOfStock] [float] NOT NULL,
	[QuantityReceived] [float] NOT NULL,
	[QuantityReturnForCredit] [float] NOT NULL,
 CONSTRAINT [PK_doInvoiceEntryReceive] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doInvoiceOtherCost]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doInvoiceOtherCost](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[IBHeaderGuid] [uniqueidentifier] NOT NULL,
	[RapidObjectGuid] [uniqueidentifier] NOT NULL,
	[RapidSyncRequired] [bit] NOT NULL,
	[RecordStatus] [bigint] NOT NULL,
	[Amount] [decimal](28, 10) NOT NULL,
	[Code] [nvarchar](4000) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[DistributeToAll] [bit] NOT NULL,
	[Invoice] [bigint] NOT NULL,
	[ItemTax] [bigint] NOT NULL,
	[Tax] [decimal](28, 10) NOT NULL,
 CONSTRAINT [PK_doInvoiceOtherCost] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doInvoiceOtherCost-PurchaseOrderEntries]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doInvoiceOtherCost-PurchaseOrderEntries](
	[ID-1] [bigint] NOT NULL,
	[ID-2] [bigint] NOT NULL,
 CONSTRAINT [PK_doInvoiceOtherCost-PurchaseOrderEntries] PRIMARY KEY CLUSTERED 
(
	[ID-1] ASC,
	[ID-2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doIRapid]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doIRapid](
	[ID] [bigint] NOT NULL,
	[VersionID] [int] NOT NULL,
	[Permissions] [varbinary](max) NULL,
	[FastLoadData] [varbinary](max) NULL,
	[IBHeaderGuid] [uniqueidentifier] NOT NULL,
	[RapidObjectGuid] [uniqueidentifier] NOT NULL,
	[RapidSyncRequired] [bit] NOT NULL,
	[RecordStatus] [bigint] NOT NULL,
 CONSTRAINT [PK_doIRapid] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doISecurityRoot]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doISecurityRoot](
	[ID] [bigint] NOT NULL,
	[VersionID] [int] NOT NULL,
	[Permissions] [varbinary](max) NULL,
	[FastLoadData] [varbinary](max) NULL,
 CONSTRAINT [PK_doISecurityRoot] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doItem]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doItem](
	[ID] [bigint] NOT NULL,
	[ActivePromotionEntry] [bigint] NOT NULL,
	[AppCatHQID] [bigint] NOT NULL,
	[AppCatHQLastMatched] [datetime] NOT NULL,
	[AutoCalcPriceLevel] [bit] NOT NULL,
	[BarcodeFormat] [int] NOT NULL,
	[BlockSalesAfterDate] [datetime] NOT NULL,
	[BlockSalesBeforeDate] [datetime] NOT NULL,
	[BlockSalesReason] [nvarchar](30) NOT NULL,
	[BlockSalesType] [int] NOT NULL,
	[BuydownPrice] [decimal](28, 10) NOT NULL,
	[BuydownQuantity] [float] NOT NULL,
	[CatalogueReferenceID] [nvarchar](200) NOT NULL,
	[CommissionAmount] [decimal](28, 10) NOT NULL,
	[CommissionMaximum] [decimal](28, 10) NOT NULL,
	[CommissionMode] [int] NOT NULL,
	[CommissionPercentProfit] [float] NOT NULL,
	[CommissionPercentSale] [float] NOT NULL,
	[Consignment] [bit] NOT NULL,
	[Content] [ntext] NOT NULL,
	[Detail1] [nvarchar](60) NOT NULL,
	[Detail2] [nvarchar](60) NOT NULL,
	[Detail3] [nvarchar](60) NOT NULL,
	[Dimension1] [bigint] NOT NULL,
	[Dimension2] [bigint] NOT NULL,
	[Dimension3] [bigint] NOT NULL,
	[Dimensions] [int] NOT NULL,
	[DontCalculateROUValue] [bit] NOT NULL,
	[ExcludedFromLoyalty] [bit] NOT NULL,
	[ExtendedDescription] [ntext] NOT NULL,
	[FixedPrice] [bit] NOT NULL,
	[FoodStampable] [bit] NOT NULL,
	[ForeignCost] [decimal](28, 10) NOT NULL,
	[GroupedDescription] [nvarchar](4000) NOT NULL,
	[HideOnNetDisplay] [bit] NOT NULL,
	[ImportDescription] [nvarchar](4000) NOT NULL,
	[ItemAddedDate] [datetime] NOT NULL,
	[ItemNotDiscountable] [bit] NOT NULL,
	[LabelTemplate] [bigint] NOT NULL,
	[LastCost] [decimal](28, 10) NOT NULL,
	[LastCounted] [datetime] NOT NULL,
	[LastStockCount] [float] NOT NULL,
	[MSRP] [decimal](28, 10) NOT NULL,
	[ParentItem] [bigint] NOT NULL,
	[ParentQuantity] [float] NOT NULL,
	[PictureName] [nvarchar](30) NOT NULL,
	[PriceLevelA] [decimal](28, 10) NOT NULL,
	[PriceLevelB] [decimal](28, 10) NOT NULL,
	[PriceLevelC] [decimal](28, 10) NOT NULL,
	[PriceMustBeEntered] [bit] NOT NULL,
	[PriceType] [int] NOT NULL,
	[PricingPolicy] [nvarchar](50) NOT NULL,
	[QuantityDiscountScheme] [bigint] NOT NULL,
	[QuantityEntryNotAllowed] [bit] NOT NULL,
	[ROULastUpdated] [datetime] NOT NULL,
	[ROUScheme] [bigint] NOT NULL,
	[ROUValue] [decimal](28, 10) NOT NULL,
	[ReCalcROPRestockLvlFromROU] [bit] NOT NULL,
	[RebateAmount] [decimal](28, 10) NOT NULL,
	[Remarks] [ntext] NOT NULL,
	[ReplacementCost] [decimal](28, 10) NOT NULL,
	[SaleEndDate] [datetime] NOT NULL,
	[SalePrice] [decimal](28, 10) NOT NULL,
	[SaleStartDate] [datetime] NOT NULL,
	[SaleType] [int] NOT NULL,
	[SerialNumberCount] [int] NOT NULL,
	[TagAlongItem] [bigint] NOT NULL,
	[TagAlongQuantity] [float] NOT NULL,
	[TareWeight] [float] NOT NULL,
	[TareWeightPercent] [float] NOT NULL,
	[Taxable] [bit] NOT NULL,
	[Title1] [nvarchar](20) NOT NULL,
	[Title2] [nvarchar](20) NOT NULL,
	[Title3] [nvarchar](20) NOT NULL,
	[TransferAvailable] [bit] NOT NULL,
	[TransferOutMinOrder] [int] NOT NULL,
	[TransferOutPackQuantity] [int] NOT NULL,
	[UnitOfMeasure] [nvarchar](4) NOT NULL,
	[UseComponentCost] [bit] NOT NULL,
	[UseComponentPrice] [bit] NOT NULL,
	[UsuallyShip] [nvarchar](255) NOT NULL,
	[WebItem] [bit] NOT NULL,
	[Weighed] [bit] NOT NULL,
	[Weight] [float] NOT NULL,
 CONSTRAINT [PK_doItem] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doItemBase]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doItemBase](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[IBHeaderGuid] [uniqueidentifier] NOT NULL,
	[RapidObjectGuid] [uniqueidentifier] NOT NULL,
	[RapidSyncRequired] [bit] NOT NULL,
	[RecordStatus] [bigint] NOT NULL,
	[AutoOrder] [bit] NOT NULL,
	[AutoOrderEndDate] [datetime] NOT NULL,
	[AutoOrderStartDate] [datetime] NOT NULL,
	[Category] [bigint] NOT NULL,
	[Code] [nvarchar](25) NOT NULL,
	[Cost] [decimal](28, 10) NOT NULL,
	[DefaultSupplier] [bigint] NOT NULL,
	[Department] [bigint] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[DoNotOrder] [bit] NOT NULL,
	[InActive] [bit] NOT NULL,
	[IsTester] [bit] NOT NULL,
	[ItemClassification] [bigint] NOT NULL,
	[ItemLocation] [nvarchar](20) NOT NULL,
	[ItemMessage] [bigint] NOT NULL,
	[ItemTax] [bigint] NOT NULL,
	[ItemType] [int] NOT NULL,
	[LastOrdered] [datetime] NOT NULL,
	[LastReceived] [datetime] NOT NULL,
	[LastSoldDate] [datetime] NOT NULL,
	[LowerBound] [decimal](28, 10) NOT NULL,
	[Manufacturer] [bigint] NOT NULL,
	[Merged] [bigint] NOT NULL,
	[Moved] [bigint] NOT NULL,
	[OutOfStock] [bigint] NOT NULL,
	[PreferredSupplier] [bigint] NOT NULL,
	[Price] [decimal](28, 10) NOT NULL,
	[PricingPlan] [bigint] NOT NULL,
	[ProductStatus] [int] NOT NULL,
	[PurchaseTax] [bigint] NOT NULL,
	[QuantityCommitted] [float] NOT NULL,
	[QuantityOnDraft] [float] NOT NULL,
	[QuantityOnHand] [float] NOT NULL,
	[QuantityOnOrder] [float] NOT NULL,
	[QuantityOnReturnForCredit] [float] NOT NULL,
	[QuantityOnTransferIn] [float] NOT NULL,
	[QuantityOnTransferOut] [float] NOT NULL,
	[ReorderPoint] [float] NOT NULL,
	[RestockLevel] [float] NOT NULL,
	[SubCategory] [bigint] NOT NULL,
	[Tax] [decimal](28, 10) NOT NULL,
	[UpperBound] [decimal](28, 10) NOT NULL,
 CONSTRAINT [PK_doItemBase] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doItemClassComponent]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doItemClassComponent](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[IBHeaderGuid] [uniqueidentifier] NOT NULL,
	[RapidObjectGuid] [uniqueidentifier] NOT NULL,
	[RapidSyncRequired] [bit] NOT NULL,
	[RecordStatus] [bigint] NOT NULL,
	[Active] [bit] NOT NULL,
	[Detail1] [nvarchar](30) NOT NULL,
	[Detail2] [nvarchar](30) NOT NULL,
	[Detail3] [nvarchar](30) NOT NULL,
	[ItemClass] [bigint] NOT NULL,
	[ItemComponent] [bigint] NOT NULL,
	[Price] [decimal](28, 10) NOT NULL,
	[Quantity] [float] NOT NULL,
 CONSTRAINT [PK_doItemClassComponent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doItemClassification]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doItemClassification](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[IBHeaderGuid] [uniqueidentifier] NOT NULL,
	[RapidObjectGuid] [uniqueidentifier] NOT NULL,
	[RapidSyncRequired] [bit] NOT NULL,
	[RecordStatus] [bigint] NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[DefaultClassification] [bit] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_doItemClassification] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doItemCodeScheme]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doItemCodeScheme](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[IsDefaultScheme] [bit] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Prefix] [nvarchar](8) NOT NULL,
	[PrefixSeparator] [nvarchar](1) NOT NULL,
	[Suffix] [nvarchar](8) NOT NULL,
	[SuffixSeparator] [nvarchar](1) NOT NULL,
 CONSTRAINT [PK_doItemCodeScheme] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doItem-ItemUsage]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doItem-ItemUsage](
	[ID] [bigint] NOT NULL,
	[ActivityCount] [bigint] NOT NULL,
	[GovernmentRecovery] [decimal](28, 10) NOT NULL,
	[ItemUsed] [bigint] NOT NULL,
	[MaxPrice] [decimal](28, 10) NOT NULL,
	[MinPrice] [decimal](28, 10) NOT NULL,
	[Month] [int] NOT NULL,
	[TotalCost] [decimal](28, 10) NOT NULL,
	[TotalDiscounts] [decimal](28, 10) NOT NULL,
	[TotalPrice] [decimal](28, 10) NOT NULL,
	[TotalProfit] [decimal](28, 10) NOT NULL,
	[TotalQuantity] [float] NOT NULL,
	[TotalSalesTax] [decimal](28, 10) NOT NULL,
	[Year] [int] NOT NULL,
 CONSTRAINT [PK_doItem-ItemUsage] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_ItemUsage_IYM]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE UNIQUE CLUSTERED INDEX [IX_ItemUsage_IYM] ON [dbo].[doItem-ItemUsage]
(
	[ItemUsed] ASC,
	[Year] ASC,
	[Month] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doItemItemUsage$IdGenerator]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doItemItemUsage$IdGenerator](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_doItemItemUsage$IdGenerator] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doItemManager]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doItemManager](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[CommittedBy] [nvarchar](50) NOT NULL,
	[CommittedDate] [datetime] NOT NULL,
	[Description] [nvarchar](1024) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_doItemManager] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doItemManagerEntry]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doItemManagerEntry](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[AutoCalcPriceLevel] [bit] NOT NULL,
	[Category] [bigint] NOT NULL,
	[Cost] [decimal](28, 10) NOT NULL,
	[Department] [bigint] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[Detail1] [nvarchar](60) NOT NULL,
	[Detail2] [nvarchar](60) NOT NULL,
	[Detail3] [nvarchar](60) NOT NULL,
	[DoNotOrder] [bit] NOT NULL,
	[ExtendedDescription] [nvarchar](1024) NOT NULL,
	[HideOnNetDisplay] [bit] NOT NULL,
	[InActive] [bit] NOT NULL,
	[Item] [bigint] NOT NULL,
	[ItemLocation] [nvarchar](20) NOT NULL,
	[ItemManager] [bigint] NOT NULL,
	[ItemNotDiscountable] [bit] NOT NULL,
	[ItemTax] [bigint] NOT NULL,
	[Price] [decimal](28, 10) NOT NULL,
	[PriceLevelA] [decimal](28, 10) NOT NULL,
	[PriceLevelB] [decimal](28, 10) NOT NULL,
	[PriceLevelC] [decimal](28, 10) NOT NULL,
	[PriceMustBeEntered] [bit] NOT NULL,
	[ROUScheme] [bigint] NOT NULL,
	[ReCalcROPRestockLvlFromROU] [bit] NOT NULL,
	[ReorderPoint] [float] NOT NULL,
	[RestockLevel] [float] NOT NULL,
 CONSTRAINT [PK_doItemManagerEntry] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doItemMergeQueue]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doItemMergeQueue](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AliasMergeState] [int] NOT NULL,
	[DestinationItemID] [bigint] NOT NULL,
	[IsComplete] [bit] NOT NULL,
	[KeepSourceDetails] [bit] NOT NULL,
	[KeepSourcePrices] [bit] NOT NULL,
	[MergeCounter] [int] NOT NULL,
	[MoveHistory] [bit] NOT NULL,
	[Remarks] [nvarchar](30) NOT NULL,
	[SourceItemID] [bigint] NOT NULL,
	[StockMergeState] [int] NOT NULL,
 CONSTRAINT [PK_doItemMergeQueue] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doItemMergeQueue-SupplierItems]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doItemMergeQueue-SupplierItems](
	[ID] [bigint] NOT NULL,
	[Owner] [bigint] NOT NULL,
	[SupplierItemIdKeep] [bigint] NOT NULL,
	[SupplierItemIdRemove] [bigint] NOT NULL,
 CONSTRAINT [PK_doItemMergeQueue-SupplierItems] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doItemMergeQueueSupplierItems$IdGenerator]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doItemMergeQueueSupplierItems$IdGenerator](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_doItemMergeQueueSupplierItems$IdGenerator] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doItemMessage]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doItemMessage](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[IBHeaderGuid] [uniqueidentifier] NOT NULL,
	[RapidObjectGuid] [uniqueidentifier] NOT NULL,
	[RapidSyncRequired] [bit] NOT NULL,
	[RecordStatus] [bigint] NOT NULL,
	[AgeLimit] [int] NOT NULL,
	[Code] [nvarchar](30) NOT NULL,
	[Message] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_doItemMessage] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doItemMovementHistory]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doItemMovementHistory](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[IBHeaderGuid] [uniqueidentifier] NOT NULL,
	[RapidObjectGuid] [uniqueidentifier] NOT NULL,
	[RapidSyncRequired] [bit] NOT NULL,
	[RecordStatus] [bigint] NOT NULL,
	[AdjustmentQuantity] [float] NOT NULL,
	[AfterQuantity] [float] NOT NULL,
	[Cost] [decimal](28, 10) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Historical] [bit] NOT NULL,
	[ItemUsed] [bigint] NOT NULL,
	[MovementSource] [bigint] NOT NULL,
	[MovementType] [int] NOT NULL,
	[Reason] [bigint] NOT NULL,
	[Remarks] [nvarchar](1000) NOT NULL,
	[Retail] [decimal](28, 10) NOT NULL,
 CONSTRAINT [PK_doItemMovementHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doItemPricingHistory]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doItemPricingHistory](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[AfterCost] [decimal](28, 10) NOT NULL,
	[AfterPrice] [decimal](28, 10) NOT NULL,
	[BeforeCost] [decimal](28, 10) NOT NULL,
	[BeforePrice] [decimal](28, 10) NOT NULL,
	[Date] [datetime] NOT NULL,
	[ItemUsed] [bigint] NOT NULL,
	[Message] [nvarchar](128) NOT NULL,
	[SourceName] [nvarchar](4000) NOT NULL,
 CONSTRAINT [PK_doItemPricingHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doItemTax]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doItemTax](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[IBHeaderGuid] [uniqueidentifier] NOT NULL,
	[RapidObjectGuid] [uniqueidentifier] NOT NULL,
	[RapidSyncRequired] [bit] NOT NULL,
	[RecordStatus] [bigint] NOT NULL,
	[Active] [bit] NOT NULL,
	[Code] [nvarchar](17) NOT NULL,
	[Description] [nvarchar](20) NOT NULL,
	[Options] [int] NOT NULL,
	[ShowOnReceipt01] [bit] NOT NULL,
	[ShowOnReceipt02] [bit] NOT NULL,
	[ShowOnReceipt03] [bit] NOT NULL,
	[ShowOnReceipt04] [bit] NOT NULL,
	[ShowOnReceipt05] [bit] NOT NULL,
	[ShowOnReceipt06] [bit] NOT NULL,
	[ShowOnReceipt07] [bit] NOT NULL,
	[ShowOnReceipt08] [bit] NOT NULL,
	[ShowOnReceipt09] [bit] NOT NULL,
	[ShowOnReceipt10] [bit] NOT NULL,
	[Tax01] [bigint] NOT NULL,
	[Tax02] [bigint] NOT NULL,
	[Tax03] [bigint] NOT NULL,
	[Tax04] [bigint] NOT NULL,
	[Tax05] [bigint] NOT NULL,
	[Tax06] [bigint] NOT NULL,
	[Tax07] [bigint] NOT NULL,
	[Tax08] [bigint] NOT NULL,
	[Tax09] [bigint] NOT NULL,
	[Tax10] [bigint] NOT NULL,
 CONSTRAINT [PK_doItemTax] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doIValidationStartCallback]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doIValidationStartCallback](
	[ID] [bigint] NOT NULL,
	[VersionID] [int] NOT NULL,
	[Permissions] [varbinary](max) NULL,
	[FastLoadData] [varbinary](max) NULL,
 CONSTRAINT [PK_doIValidationStartCallback] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doKit]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doKit](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[ComponentItem] [bigint] NOT NULL,
	[KitItem] [bigint] NOT NULL,
	[Quantity] [float] NOT NULL,
 CONSTRAINT [PK_doKit] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doLabelElement]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doLabelElement](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[BarCodeDisplayText] [bit] NOT NULL,
	[FontBold] [bit] NOT NULL,
	[FontSize] [int] NOT NULL,
	[IsBarCode] [bit] NOT NULL,
	[IsMoneyFormat] [bit] NOT NULL,
	[ItemPropertyName] [nvarchar](100) NOT NULL,
	[LineText] [nvarchar](100) NOT NULL,
	[RowHeight] [int] NOT NULL,
	[RowWidth] [int] NOT NULL,
	[RowXPosition] [int] NOT NULL,
	[RowYPosition] [int] NOT NULL,
	[TextAlignment] [int] NOT NULL,
 CONSTRAINT [PK_doLabelElement] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doLabelPrinting]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doLabelPrinting](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[Editable] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[LabelType] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[PrintWaitingTimeout] [int] NOT NULL,
	[PrinterName] [nvarchar](100) NOT NULL,
	[QuantityType] [int] NOT NULL,
	[TemplateName] [nvarchar](1000) NOT NULL,
	[TemplateType] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_doLabelPrinting] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doLabelPrinting-LabelElements]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doLabelPrinting-LabelElements](
	[ID-1] [bigint] NOT NULL,
	[ID-2] [bigint] NOT NULL,
 CONSTRAINT [PK_doLabelPrinting-LabelElements] PRIMARY KEY CLUSTERED 
(
	[ID-1] ASC,
	[ID-2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doLabelQueue]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doLabelQueue](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Description] [nvarchar](4000) NOT NULL,
	[DeviceID] [nvarchar](4000) NOT NULL,
	[EffectiveDate] [datetime] NOT NULL,
	[Item] [bigint] NOT NULL,
	[LabelTemplate] [bigint] NOT NULL,
	[Price] [decimal](28, 10) NOT NULL,
	[PrintDate] [datetime] NOT NULL,
	[PrintError] [nvarchar](4000) NOT NULL,
	[Quantity] [int] NOT NULL,
	[QuantityType] [int] NOT NULL,
	[Source] [bigint] NOT NULL,
	[SourceType] [int] NOT NULL,
 CONSTRAINT [PK_doLabelQueue] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doMatrixAttributeDisplayOrder]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doMatrixAttributeDisplayOrder](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[IBHeaderGuid] [uniqueidentifier] NOT NULL,
	[RapidObjectGuid] [uniqueidentifier] NOT NULL,
	[RapidSyncRequired] [bit] NOT NULL,
	[RecordStatus] [bigint] NOT NULL,
	[Attribute] [nvarchar](30) NOT NULL,
	[Code] [nvarchar](5) NOT NULL,
	[Dimension] [bigint] NOT NULL,
	[DimensionAttribute] [bigint] NOT NULL,
	[DimensionName] [nvarchar](4000) NOT NULL,
	[DimensionOrder] [bigint] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[InActive] [bit] NOT NULL,
	[ItemClass] [bigint] NOT NULL,
 CONSTRAINT [PK_doMatrixAttributeDisplayOrder] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doNameValuePair]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doNameValuePair](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[Name] [nvarchar](4000) NOT NULL,
	[Value] [varbinary](max) NULL,
 CONSTRAINT [PK_doNameValuePair] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doNursingHome]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doNursingHome](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[AccountCategory] [nvarchar](2) NOT NULL,
	[AddressLine1] [nvarchar](4000) NOT NULL,
	[AddressLine2] [nvarchar](4000) NOT NULL,
	[AddressState] [nvarchar](4000) NOT NULL,
	[AlternateAddress] [nvarchar](22) NOT NULL,
	[AlternateSuburb] [nvarchar](18) NOT NULL,
	[AutoCreateAccount] [bit] NOT NULL,
	[AutoCreateNursingHomeAccount] [bit] NOT NULL,
	[AutoCreatePatientAccount] [bit] NOT NULL,
	[AutomaticallyPrintInvoice] [bit] NOT NULL,
	[City] [nvarchar](4000) NOT NULL,
	[Code] [nvarchar](4) NOT NULL,
	[Company] [nvarchar](4000) NOT NULL,
	[DefaultPrivateFee] [decimal](28, 10) NOT NULL,
	[DefaultPrivateMarkup] [decimal](28, 10) NOT NULL,
	[DefaultScriptType] [nvarchar](4) NOT NULL,
	[EmailAddress] [nvarchar](4000) NOT NULL,
	[EndServicingDate] [datetime] NOT NULL,
	[ExcludeRequired] [nchar](1) NOT NULL,
	[FaxNumber] [nvarchar](4000) NOT NULL,
	[FirstName] [nvarchar](4000) NOT NULL,
	[GSTIncluded] [bit] NOT NULL,
	[GroupedDescription] [nvarchar](4000) NOT NULL,
	[IsANursingHome] [bit] NOT NULL,
	[LastName] [nvarchar](4000) NOT NULL,
	[MobileNumber] [nvarchar](4000) NOT NULL,
	[PackOldFormat] [nchar](1) NOT NULL,
	[PackRequiresPrn] [bit] NOT NULL,
	[PackSigningRequired] [bit] NOT NULL,
	[PackSlot] [decimal](28, 10) NOT NULL,
	[PackTimeSlot1] [nvarchar](6) NOT NULL,
	[PackTimeSlot2] [nvarchar](6) NOT NULL,
	[PackTimeSlot3] [nvarchar](6) NOT NULL,
	[PackTimeSlot4] [nvarchar](6) NOT NULL,
	[PackTimeSlot5] [nvarchar](6) NOT NULL,
	[PackTimeSlot6] [nvarchar](6) NOT NULL,
	[PackTimeSlot7] [nvarchar](6) NOT NULL,
	[PackTimeSlot8] [nvarchar](6) NOT NULL,
	[PackToDate] [datetime] NOT NULL,
	[PackUnitDose] [bit] NOT NULL,
	[PackWebsterSystem] [bit] NOT NULL,
	[PackingStartOfWeek] [decimal](28, 10) NOT NULL,
	[PackingType] [nchar](1) NOT NULL,
	[PhoneNumber] [nvarchar](4000) NOT NULL,
	[PostCode] [nvarchar](4000) NOT NULL,
	[ReminderNotice] [bit] NOT NULL,
	[RepatToSafetyNet] [bit] NOT NULL,
	[StartServicingDate] [datetime] NOT NULL,
	[Title] [nvarchar](4000) NOT NULL,
	[UseNursingHomeAddress] [bit] NOT NULL,
	[Web] [nvarchar](4000) NOT NULL,
 CONSTRAINT [PK_doNursingHome] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doOffer]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doOffer](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[Campaign] [bigint] NOT NULL,
	[Code] [nvarchar](4000) NOT NULL,
	[Description] [nvarchar](60) NOT NULL,
	[DivideDiscount] [bit] NOT NULL,
	[DollarOffDiscount] [decimal](28, 10) NOT NULL,
	[DollarThreshold] [real] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[IsDiscountable] [bit] NOT NULL,
	[IsLoyalty] [bit] NOT NULL,
	[MultiBuyXQuantity] [int] NOT NULL,
	[MultiBuyYDollarAmount] [decimal](28, 10) NOT NULL,
	[MultiBuyYQuantity] [int] NOT NULL,
	[MultipleRedemptions] [bit] NOT NULL,
	[Name] [nvarchar](40) NOT NULL,
	[OfferCategory] [int] NOT NULL,
	[OfferType] [int] NOT NULL,
	[PercentOffDiscount] [real] NOT NULL,
	[Priority] [int] NOT NULL,
	[QuantityThreshold] [bit] NOT NULL,
	[StartDate] [datetime] NOT NULL,
 CONSTRAINT [PK_doOffer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doOfferCampaign]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doOfferCampaign](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[Code] [nvarchar](4000) NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[Name] [nvarchar](40) NOT NULL,
	[Source] [int] NOT NULL,
 CONSTRAINT [PK_doOfferCampaign] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doOfferEntry]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doOfferEntry](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[BuyDownQuantity] [float] NOT NULL,
	[Cost] [decimal](28, 10) NOT NULL,
	[IsDiscountItem] [bit] NOT NULL,
	[IsQualifyingItem] [bit] NOT NULL,
	[Offer] [bigint] NOT NULL,
	[OfferItem] [bigint] NOT NULL,
	[Price] [decimal](28, 10) NOT NULL,
	[SourceItem] [bigint] NOT NULL,
	[SourcePrice] [decimal](28, 10) NOT NULL,
 CONSTRAINT [PK_doOfferEntry] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doOrderTemplate]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doOrderTemplate](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[TemplateXml] [ntext] NOT NULL,
 CONSTRAINT [PK_doOrderTemplate] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doOutOfStockItem]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doOutOfStockItem](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[Item] [bigint] NOT NULL,
	[LastOOSQuantity] [float] NOT NULL,
	[LastSupplier] [bigint] NOT NULL,
	[OrderCount] [int] NOT NULL,
	[PurchaseOrder] [bigint] NOT NULL,
	[Reason] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_doOutOfStockItem] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doPatient]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doPatient](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[AccountNumber] [bigint] NOT NULL,
	[AccountType] [nvarchar](4000) NOT NULL,
	[Address] [nvarchar](40) NOT NULL,
	[AdmissionNumber] [bigint] NOT NULL,
	[Allergies] [nvarchar](128) NOT NULL,
	[ApplyGST] [bit] NOT NULL,
	[AutoChargeAccount] [bit] NOT NULL,
	[AutomaticReceiptPrinting] [bit] NOT NULL,
	[BirthDate] [datetime] NOT NULL,
	[ConcessionExpiryDate] [datetime] NOT NULL,
	[ConcessionNumber] [nvarchar](11) NOT NULL,
	[ConcessionType] [nchar](1) NOT NULL,
	[Customer] [bigint] NOT NULL,
	[Email] [nvarchar](128) NOT NULL,
	[FamilyCode] [bigint] NOT NULL,
	[FamilyIndicator] [nchar](1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[Gender] [int] NOT NULL,
	[GenericOnly] [bit] NOT NULL,
	[GroupedDescription] [nvarchar](4000) NOT NULL,
	[HealthFundIdentifaction] [nvarchar](10) NOT NULL,
	[HealthFundLevelOfCover] [nvarchar](10) NOT NULL,
	[HealthFundMemberNumber] [nvarchar](10) NOT NULL,
	[InsuranceValidToDate] [datetime] NOT NULL,
	[IsDiscount] [bit] NOT NULL,
	[IsDoctor] [bit] NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[MailCategory] [nvarchar](4) NOT NULL,
	[MedicareConsent] [nchar](1) NOT NULL,
	[MedicareExpiryDate] [datetime] NOT NULL,
	[MedicareNumber] [bigint] NOT NULL,
	[Notes] [nvarchar](4000) NOT NULL,
	[NursingHome] [bigint] NOT NULL,
	[NursingHomeBedNumber] [nvarchar](10) NOT NULL,
	[NursingHomeCode] [nvarchar](4) NOT NULL,
	[NursingHomeRoomNumber] [nvarchar](10) NOT NULL,
	[NursingHomeURNumber] [nvarchar](10) NOT NULL,
	[NursingHomeWardNumber] [nvarchar](10) NOT NULL,
	[OutSideScriptAmount] [decimal](28, 10) NOT NULL,
	[OutSideScriptCount] [bigint] NOT NULL,
	[OwesScript] [bit] NOT NULL,
	[PatientNumber] [bigint] NOT NULL,
	[PatientStatus] [nchar](1) NOT NULL,
	[PatientType] [nchar](1) NOT NULL,
	[PhoneNumber] [nvarchar](15) NOT NULL,
	[PostCode] [bigint] NOT NULL,
	[PrivateFeeMarkUp] [nvarchar](3) NOT NULL,
	[RepatCardColour] [nchar](1) NOT NULL,
	[RepatNumber] [nvarchar](11) NOT NULL,
	[RepeatsOnFile] [bit] NOT NULL,
	[SafetyNetScriptAmount] [decimal](28, 10) NOT NULL,
	[SafetyNetScriptCount] [bigint] NOT NULL,
	[SafteyNetEntitlementNumber] [nvarchar](11) NOT NULL,
	[Suburb] [nvarchar](40) NOT NULL,
	[Title] [nvarchar](6) NOT NULL,
	[Ward] [bigint] NOT NULL,
 CONSTRAINT [PK_doPatient] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doPharmacist]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doPharmacist](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[FirstName] [nvarchar](20) NOT NULL,
	[GroupedDescription] [nvarchar](4000) NOT NULL,
	[LastName] [nvarchar](20) NOT NULL,
	[PharmacistsInitials] [nvarchar](2) NOT NULL,
	[RegistrationNumber] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_doPharmacist] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doPharmXAccount]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doPharmXAccount](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[Name] [nvarchar](4000) NOT NULL,
	[SupplierID] [int] NOT NULL,
 CONSTRAINT [PK_doPharmXAccount] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doPlanogram]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doPlanogram](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[HorizontalFacings] [nvarchar](4000) NOT NULL,
	[MinimumDepth] [nvarchar](4000) NOT NULL,
	[PlanogramItem] [bigint] NOT NULL,
	[PlanogramLocation] [bigint] NOT NULL,
	[ShelfNumber] [nvarchar](4000) NOT NULL,
	[ShelfPosition] [nvarchar](4000) NOT NULL,
 CONSTRAINT [PK_doPlanogram] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doPlanogramLocation]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doPlanogramLocation](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[Description] [nvarchar](4000) NOT NULL,
 CONSTRAINT [PK_doPlanogramLocation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doPricingPlan]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doPricingPlan](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
	[FixedRetail] [decimal](28, 10) NOT NULL,
	[MarginMarkup] [int] NOT NULL,
	[MarginMarkupValue] [decimal](28, 10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[PlanType] [int] NOT NULL,
	[PricingLevel] [int] NOT NULL,
	[RoundingDenomination] [decimal](28, 10) NOT NULL,
	[RoundingLowerBound] [decimal](28, 10) NOT NULL,
	[RoundingOption] [int] NOT NULL,
	[RoundingUpperBound] [decimal](28, 10) NOT NULL,
	[Supplier] [bigint] NOT NULL,
 CONSTRAINT [PK_doPricingPlan] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doPricingReview]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doPricingReview](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[IBHeaderGuid] [uniqueidentifier] NOT NULL,
	[RapidObjectGuid] [uniqueidentifier] NOT NULL,
	[RapidSyncRequired] [bit] NOT NULL,
	[RecordStatus] [bigint] NOT NULL,
	[Code] [nvarchar](30) NOT NULL,
	[CommittedBy] [nvarchar](50) NOT NULL,
	[CommittedDate] [datetime] NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[EffectiveDate] [datetime] NOT NULL,
	[InActive] [bit] NOT NULL,
	[IsApplied] [bit] NOT NULL,
	[PricingReviewSourceType] [int] NOT NULL,
 CONSTRAINT [PK_doPricingReview] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doPricingReviewEntry]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doPricingReviewEntry](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[IBHeaderGuid] [uniqueidentifier] NOT NULL,
	[RapidObjectGuid] [uniqueidentifier] NOT NULL,
	[RapidSyncRequired] [bit] NOT NULL,
	[RecordStatus] [bigint] NOT NULL,
	[AcceptStatus] [int] NOT NULL,
	[AutoCalcPriceLevel] [bit] NOT NULL,
	[InActive] [bit] NOT NULL,
	[Item] [bigint] NOT NULL,
	[NewCost] [decimal](28, 10) NOT NULL,
	[NewMSRP] [decimal](28, 10) NOT NULL,
	[NewPriceA] [decimal](28, 10) NOT NULL,
	[NewPriceB] [decimal](28, 10) NOT NULL,
	[NewPriceC] [decimal](28, 10) NOT NULL,
	[NewRetail] [decimal](28, 10) NOT NULL,
	[NewSupplierCost] [decimal](28, 10) NOT NULL,
	[OldCost] [decimal](28, 10) NOT NULL,
	[OldMSRP] [decimal](28, 10) NOT NULL,
	[OldPriceA] [decimal](28, 10) NOT NULL,
	[OldPriceB] [decimal](28, 10) NOT NULL,
	[OldPriceC] [decimal](28, 10) NOT NULL,
	[OldRetail] [decimal](28, 10) NOT NULL,
	[OldSupplierCost] [decimal](28, 10) NOT NULL,
	[PricingReview] [bigint] NOT NULL,
	[Source] [nvarchar](4000) NOT NULL,
 CONSTRAINT [PK_doPricingReviewEntry] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doPrincipal]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doPrincipal](
	[ID] [bigint] NOT NULL,
	[Description] [ntext] NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_doPrincipal] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doPrincipal-Roles]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doPrincipal-Roles](
	[ID-1] [bigint] NOT NULL,
	[ID-2] [bigint] NOT NULL,
 CONSTRAINT [PK_doPrincipal-Roles] PRIMARY KEY CLUSTERED 
(
	[ID-1] ASC,
	[ID-2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doPromotion]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doPromotion](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[IBHeaderGuid] [uniqueidentifier] NOT NULL,
	[RapidObjectGuid] [uniqueidentifier] NOT NULL,
	[RapidSyncRequired] [bit] NOT NULL,
	[RecordStatus] [bigint] NOT NULL,
	[CampaignCode] [nvarchar](100) NOT NULL,
	[CampaignName] [nvarchar](100) NOT NULL,
	[CommittedDate] [datetime] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[PromotionLevel] [int] NOT NULL,
	[PromotionType] [int] NOT NULL,
	[ProtectedDate] [datetime] NOT NULL,
	[Remarks] [nvarchar](200) NOT NULL,
	[SaleEndDate] [datetime] NOT NULL,
	[SaleStartDate] [datetime] NOT NULL,
	[Supplier] [bigint] NOT NULL,
 CONSTRAINT [PK_doPromotion] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doPromotionEntry]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doPromotionEntry](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[IBHeaderGuid] [uniqueidentifier] NOT NULL,
	[RapidObjectGuid] [uniqueidentifier] NOT NULL,
	[RapidSyncRequired] [bit] NOT NULL,
	[RecordStatus] [bigint] NOT NULL,
	[BuyDownPrice] [decimal](28, 10) NOT NULL,
	[BuyDownQuantity] [float] NOT NULL,
	[DealMinDOQ] [float] NOT NULL,
	[DiscountPercent] [float] NOT NULL,
	[ItemNotDiscountableBeforePromo] [bit] NOT NULL,
	[ItemNotDiscountableDuringPromo] [bit] NOT NULL,
	[Promotion] [bigint] NOT NULL,
	[PromotionItem] [bigint] NOT NULL,
	[QuantityDiscountScheme] [bigint] NOT NULL,
	[SalePrice] [decimal](28, 10) NOT NULL,
	[SourceItem] [bigint] NOT NULL,
	[SourcePrice] [decimal](28, 10) NOT NULL,
 CONSTRAINT [PK_doPromotionEntry] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doPurchaseOrder]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doPurchaseOrder](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[IBHeaderGuid] [uniqueidentifier] NOT NULL,
	[RapidObjectGuid] [uniqueidentifier] NOT NULL,
	[RapidSyncRequired] [bit] NOT NULL,
	[RecordStatus] [bigint] NOT NULL,
	[ApprovedBy] [nvarchar](4000) NOT NULL,
	[ApprovedDate] [datetime] NOT NULL,
	[CancelledDate] [datetime] NOT NULL,
	[CompletedDate] [datetime] NOT NULL,
	[CompletedValue] [decimal](28, 10) NOT NULL,
	[CreatedBy] [nvarchar](20) NOT NULL,
	[Currency] [bigint] NOT NULL,
	[DeliverAfter] [datetime] NOT NULL,
	[DeliverBefore] [datetime] NOT NULL,
	[ExchangeRate] [float] NOT NULL,
	[GatewayId] [bigint] NOT NULL,
	[HasInvoice] [bit] NOT NULL,
	[HasOOSInvoice] [bit] NOT NULL,
	[IsAutoGenerated] [bit] NOT NULL,
	[IsBootstrapped] [bit] NOT NULL,
	[IsCancelled] [bit] NOT NULL,
	[IsPlaced] [bit] NOT NULL,
	[PharmXStatus] [int] NOT NULL,
	[PurchaseOrderEntryLastModified] [bigint] NOT NULL,
	[PurchaseOrderNumber] [nvarchar](20) NOT NULL,
	[PurchaseOrderSource] [int] NOT NULL,
	[PurchaseOrderStatus] [int] NOT NULL,
	[PurchaseOrderType] [int] NOT NULL,
	[PurchaseOrderUpdateLevel] [int] NOT NULL,
	[Remarks] [nvarchar](255) NOT NULL,
	[RequiredDate] [datetime] NOT NULL,
	[ReturnApprovalNumber] [nvarchar](50) NOT NULL,
	[SentDate] [datetime] NOT NULL,
	[ShipFrom] [nvarchar](255) NOT NULL,
	[ShipTo] [nvarchar](255) NOT NULL,
	[ShipVia] [nvarchar](20) NOT NULL,
	[Supplier] [bigint] NOT NULL,
	[SupplierResponse] [nvarchar](512) NOT NULL,
	[Terms] [nvarchar](20) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[TransferReason] [bigint] NOT NULL,
	[WorksheetID] [bigint] NOT NULL,
 CONSTRAINT [PK_doPurchaseOrder] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doPurchaseOrderEntry]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doPurchaseOrderEntry](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[IBHeaderGuid] [uniqueidentifier] NOT NULL,
	[RapidObjectGuid] [uniqueidentifier] NOT NULL,
	[RapidSyncRequired] [bit] NOT NULL,
	[RecordStatus] [bigint] NOT NULL,
	[Comment] [nvarchar](255) NOT NULL,
	[CurrentCost] [decimal](28, 10) NOT NULL,
	[DealCatalogueName] [nvarchar](4000) NOT NULL,
	[DealMinDOQ] [float] NOT NULL,
	[ExtOrderCostTax] [decimal](28, 10) NOT NULL,
	[GatewayResponse] [nvarchar](255) NOT NULL,
	[ItemDescription] [nvarchar](50) NOT NULL,
	[ItemTax] [bigint] NOT NULL,
	[OrderCost] [decimal](28, 10) NOT NULL,
	[OrderCostTax] [decimal](28, 10) NOT NULL,
	[OrderedItem] [bigint] NOT NULL,
	[OriginalQuantityOrdered] [float] NOT NULL,
	[PackQuantity] [int] NOT NULL,
	[PurchaseOrder] [bigint] NOT NULL,
	[QuantityOrdered] [float] NOT NULL,
	[QuantityReceivedToDate] [float] NOT NULL,
	[QuantityReturnForCreditToDate] [float] NOT NULL,
	[ReasonCode] [bigint] NOT NULL,
	[ReorderNumber] [nvarchar](50) NOT NULL,
	[SentForPricing] [int] NOT NULL,
	[ShowOnOrder] [bit] NOT NULL,
 CONSTRAINT [PK_doPurchaseOrderEntry] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doQuantityDiscountScheme]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doQuantityDiscountScheme](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[IBHeaderGuid] [uniqueidentifier] NOT NULL,
	[RapidObjectGuid] [uniqueidentifier] NOT NULL,
	[RapidSyncRequired] [bit] NOT NULL,
	[RecordStatus] [bigint] NOT NULL,
	[Active] [bit] NOT NULL,
	[Code] [nvarchar](30) NOT NULL,
	[Description] [nvarchar](30) NOT NULL,
	[DiscountOddItems] [bit] NOT NULL,
	[DiscountSchemeType] [int] NOT NULL,
	[ExtendedPriceDiscount] [bit] NOT NULL,
	[PercentOffPrice1] [float] NOT NULL,
	[PercentOffPrice1A] [float] NOT NULL,
	[PercentOffPrice1B] [float] NOT NULL,
	[PercentOffPrice1C] [float] NOT NULL,
	[PercentOffPrice2] [float] NOT NULL,
	[PercentOffPrice2A] [float] NOT NULL,
	[PercentOffPrice2B] [float] NOT NULL,
	[PercentOffPrice2C] [float] NOT NULL,
	[PercentOffPrice3] [float] NOT NULL,
	[PercentOffPrice3A] [float] NOT NULL,
	[PercentOffPrice3B] [float] NOT NULL,
	[PercentOffPrice3C] [float] NOT NULL,
	[PercentOffPrice4] [float] NOT NULL,
	[PercentOffPrice4A] [float] NOT NULL,
	[PercentOffPrice4B] [float] NOT NULL,
	[PercentOffPrice4C] [float] NOT NULL,
	[Price1] [decimal](28, 10) NOT NULL,
	[Price1A] [decimal](28, 10) NOT NULL,
	[Price1B] [decimal](28, 10) NOT NULL,
	[Price1C] [decimal](28, 10) NOT NULL,
	[Price2] [decimal](28, 10) NOT NULL,
	[Price2A] [decimal](28, 10) NOT NULL,
	[Price2B] [decimal](28, 10) NOT NULL,
	[Price2C] [decimal](28, 10) NOT NULL,
	[Price3] [decimal](28, 10) NOT NULL,
	[Price3A] [decimal](28, 10) NOT NULL,
	[Price3B] [decimal](28, 10) NOT NULL,
	[Price3C] [decimal](28, 10) NOT NULL,
	[Price4] [decimal](28, 10) NOT NULL,
	[Price4A] [decimal](28, 10) NOT NULL,
	[Price4B] [decimal](28, 10) NOT NULL,
	[Price4C] [decimal](28, 10) NOT NULL,
	[Quantity1] [float] NOT NULL,
	[Quantity2] [float] NOT NULL,
	[Quantity3] [float] NOT NULL,
	[Quantity4] [float] NOT NULL,
 CONSTRAINT [PK_doQuantityDiscountScheme] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doRapid]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doRapid](
	[ID] [bigint] NOT NULL,
	[EnableInbound] [bit] NOT NULL,
	[EnterpriseGuid] [uniqueidentifier] NOT NULL,
	[InBoundPollFrequency] [int] NOT NULL,
	[InBoundWorksheetConfiguration] [varbinary](max) NOT NULL,
	[LastInboundProcessDateTime] [datetime] NOT NULL,
	[LastOutboundProcessDateTime] [datetime] NOT NULL,
	[OperationalState] [int] NOT NULL,
	[OutBoundPollFrequency] [int] NOT NULL,
	[OutBoundRowsPerCycle] [int] NOT NULL,
	[ProgressText] [nvarchar](4000) NOT NULL,
	[RapidServerURL] [nvarchar](4000) NOT NULL,
	[StoreCode] [nvarchar](4000) NOT NULL,
	[StoreGuid] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_doRapid] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doRapidAuditAggregateDataObject]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doRapidAuditAggregateDataObject](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[IBHeaderGuid] [uniqueidentifier] NOT NULL,
	[RapidObjectGuid] [uniqueidentifier] NOT NULL,
	[RapidSyncRequired] [bit] NOT NULL,
	[RecordStatus] [bigint] NOT NULL,
 CONSTRAINT [PK_doRapidAuditAggregateDataObject] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doRapidRecordStatus]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doRapidRecordStatus](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_doRapidRecordStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doRapid-Worksheets]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doRapid-Worksheets](
	[ID] [bigint] NOT NULL,
	[Owner] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](4000) NOT NULL,
	[Description] [nvarchar](4000) NOT NULL,
	[EffectiveDate] [datetime] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[ProcessDuration] [nvarchar](4000) NOT NULL,
	[Processed] [datetime] NOT NULL,
	[RecordCount] [int] NOT NULL,
	[RecordsTable] [varbinary](max) NOT NULL,
	[Remarks] [nvarchar](4000) NOT NULL,
	[RowTotal] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[TypeName] [nvarchar](4000) NOT NULL,
	[WorksheetType] [int] NOT NULL,
 CONSTRAINT [PK_doRapid-Worksheets] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doRapidWorksheets$IdGenerator]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doRapidWorksheets$IdGenerator](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_doRapidWorksheets$IdGenerator] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doRateOfUsageDateDefinition]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doRateOfUsageDateDefinition](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[DayOffset] [int] NOT NULL,
	[Name] [nvarchar](4000) NOT NULL,
	[RangeSpan] [int] NOT NULL,
	[RateOfUsageScheme] [bigint] NOT NULL,
	[Weight] [decimal](28, 10) NOT NULL,
 CONSTRAINT [PK_doRateOfUsageDateDefinition] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doRateOfUsageScheme]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doRateOfUsageScheme](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[Description] [nvarchar](128) NOT NULL,
	[IncludeTransfersInCalc] [bit] NOT NULL,
	[IsDefaultScheme] [bit] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ROUSchemeType] [int] NOT NULL,
	[ReOrderPointDays] [int] NOT NULL,
	[ReStockLevelDays] [int] NOT NULL,
 CONSTRAINT [PK_doRateOfUsageScheme] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doReasonCode]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doReasonCode](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[Code] [nvarchar](4000) NOT NULL,
	[Description] [nvarchar](4000) NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[InActive] [bit] NOT NULL,
	[ReasonCodeType] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
 CONSTRAINT [PK_doReasonCode] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doRegister]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doRegister](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[IBHeaderGuid] [uniqueidentifier] NOT NULL,
	[RapidObjectGuid] [uniqueidentifier] NOT NULL,
	[RapidSyncRequired] [bit] NOT NULL,
	[RecordStatus] [bigint] NOT NULL,
	[Description] [nvarchar](4000) NOT NULL,
	[RegisterNumber] [int] NOT NULL,
 CONSTRAINT [PK_doRegister] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doRelationship]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doRelationship](
	[ID] [bigint] NOT NULL,
	[ActivatingRelationship] [bigint] NOT NULL,
	[ActivityLastCycle] [bit] NOT NULL,
	[ConnectorType] [nvarchar](100) NOT NULL,
	[Count] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[LastError] [nvarchar](4000) NOT NULL,
	[MaxRecordsPerIteration] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[NextExecute] [datetime] NOT NULL,
	[Operation] [int] NOT NULL,
	[Paused] [bit] NOT NULL,
	[Processed] [int] NOT NULL,
	[Properties] [varbinary](max) NOT NULL,
	[Receive] [bit] NOT NULL,
	[RelationshipState] [int] NOT NULL,
	[Send] [bit] NOT NULL,
 CONSTRAINT [PK_doRelationship] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doRelationship-Actions]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doRelationship-Actions](
	[ID] [bigint] NOT NULL,
	[Owner] [bigint] NOT NULL,
	[BusinessAction] [varbinary](max) NOT NULL,
	[Created] [datetime] NOT NULL,
	[EntityName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_doRelationship-Actions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doRelationshipActions$IdGenerator]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doRelationshipActions$IdGenerator](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_doRelationshipActions$IdGenerator] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doRelationship-AggregateKeys]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doRelationship-AggregateKeys](
	[ID] [bigint] NOT NULL,
	[Owner] [bigint] NOT NULL,
	[AggregateObject] [bigint] NOT NULL,
	[AggregateObjectGuid] [uniqueidentifier] NOT NULL,
	[Entity] [nvarchar](4000) NOT NULL,
	[ForeignKey] [nvarchar](4000) NOT NULL,
	[ParentKey] [nvarchar](4000) NOT NULL,
	[Relation] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_doRelationship-AggregateKeys] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doRelationshipAggregateKeys$IdGenerator]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doRelationshipAggregateKeys$IdGenerator](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_doRelationshipAggregateKeys$IdGenerator] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doRelationship-Conflicts]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doRelationship-Conflicts](
	[ID] [bigint] NOT NULL,
	[Owner] [bigint] NOT NULL,
	[AggregateField] [nvarchar](256) NOT NULL,
	[AggregateObject] [bigint] NOT NULL,
	[AggregateObjectType] [nvarchar](4000) NOT NULL,
	[ConflictPending] [bit] NOT NULL,
	[ConflictType] [int] NOT NULL,
	[EntityKey] [nvarchar](256) NOT NULL,
	[IgnoreConflict] [bit] NOT NULL,
	[Message] [ntext] NOT NULL,
	[RelatedObject] [bigint] NOT NULL,
	[Relation] [uniqueidentifier] NOT NULL,
	[TimeConflicted] [datetime] NOT NULL,
 CONSTRAINT [PK_doRelationship-Conflicts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doRelationshipConflicts$IdGenerator]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doRelationshipConflicts$IdGenerator](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_doRelationshipConflicts$IdGenerator] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doReport]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doReport](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[Author] [bigint] NOT NULL,
	[ColumnListXml] [ntext] NOT NULL,
	[CommonUses] [ntext] NOT NULL,
	[Description] [nvarchar](150) NOT NULL,
	[Group] [nvarchar](4000) NOT NULL,
	[IsAdvanced] [bit] NOT NULL,
	[IsSystemReport] [bit] NOT NULL,
	[LastRunDate] [datetime] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ScheduledEnabled] [bit] NOT NULL,
	[ScheduledFormat] [nvarchar](4000) NOT NULL,
	[ScheduledFrom] [nvarchar](4000) NOT NULL,
	[ScheduledLastRun] [datetime] NOT NULL,
	[ScheduledMessage] [nvarchar](4000) NOT NULL,
	[ScheduledRecurrencePattern] [nvarchar](4000) NOT NULL,
	[ScheduledSubject] [nvarchar](4000) NOT NULL,
	[ScheduledTime] [datetime] NOT NULL,
	[ScheduledTo] [nvarchar](4000) NOT NULL,
	[SendCollapsedGroups] [bit] NOT NULL,
	[SharedRoleList] [nvarchar](4000) NOT NULL,
	[SharedUserList] [nvarchar](4000) NOT NULL,
	[Xml] [ntext] NOT NULL,
 CONSTRAINT [PK_doReport] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doReturnToSupplier]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doReturnToSupplier](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[AuthorizationNumber] [nvarchar](4000) NOT NULL,
	[RTVNumber] [nvarchar](4000) NOT NULL,
	[ReturnedDate] [datetime] NOT NULL,
	[Supplier] [bigint] NOT NULL,
 CONSTRAINT [PK_doReturnToSupplier] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doReturnToSupplierEntry]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doReturnToSupplierEntry](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[AuthorizationNumber] [nvarchar](4000) NOT NULL,
	[Cost] [decimal](28, 10) NOT NULL,
	[ItemReturned] [bigint] NOT NULL,
	[Quantity] [float] NOT NULL,
	[ReturnToSupplier] [bigint] NOT NULL,
 CONSTRAINT [PK_doReturnToSupplierEntry] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doRole]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doRole](
	[ID] [bigint] NOT NULL,
 CONSTRAINT [PK_doRole] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doSatScanDeviceOptionGral]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doSatScanDeviceOptionGral](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[Description] [nvarchar](4000) NOT NULL,
	[DevID] [smallint] NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Executed] [bit] NOT NULL,
	[SatID] [smallint] NOT NULL,
	[SettingAlias] [nvarchar](4000) NOT NULL,
	[TagAlias] [nvarchar](4000) NOT NULL,
 CONSTRAINT [PK_doSatScanDeviceOptionGral] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doSatScanDeviceOptionStockTake]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doSatScanDeviceOptionStockTake](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[Description] [nvarchar](4000) NOT NULL,
	[DevID] [smallint] NOT NULL,
	[SatID] [smallint] NOT NULL,
	[Value] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_doSatScanDeviceOptionStockTake] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doSatScanGunLog]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doSatScanGunLog](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[Action] [int] NOT NULL,
	[ActionDescription] [nvarchar](255) NOT NULL,
	[GunID] [int] NOT NULL,
	[LogDateRequest] [datetime] NOT NULL,
	[LogDateResponse] [datetime] NOT NULL,
	[Request] [nvarchar](255) NOT NULL,
	[Response] [nvarchar](255) NOT NULL,
	[UserLoggedIn] [bigint] NOT NULL,
 CONSTRAINT [PK_doSatScanGunLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doSatScanSettingsGlobal]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doSatScanSettingsGlobal](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[LoginRequired] [bit] NOT NULL,
	[LoginTimeout] [int] NOT NULL,
 CONSTRAINT [PK_doSatScanSettingsGlobal] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doSatScanSettingsLocal]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doSatScanSettingsLocal](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[BaudRate] [nvarchar](4000) NOT NULL,
	[Comport] [nvarchar](4000) NOT NULL,
	[MachineName] [nvarchar](4000) NOT NULL,
	[SatelliteID] [nvarchar](4000) NOT NULL,
 CONSTRAINT [PK_doSatScanSettingsLocal] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doScript]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doScript](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[ActivityAction] [int] NOT NULL,
	[AuthorityNumber] [bigint] NOT NULL,
	[ChargeAccount] [bigint] NOT NULL,
	[ChargeAmount] [decimal](28, 10) NOT NULL,
	[ChargeType] [nvarchar](1) NOT NULL,
	[DDRepeatInterval] [bigint] NOT NULL,
	[Deferred] [bit] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DispenseDate] [datetime] NOT NULL,
	[DispenseNumber] [bigint] NOT NULL,
	[Doctor] [bigint] NOT NULL,
	[DoctorCode] [nvarchar](4) NOT NULL,
	[DoctorName] [nvarchar](20) NOT NULL,
	[DoctorPrescriberNumber] [bigint] NOT NULL,
	[Drug] [bigint] NOT NULL,
	[DrugAlternateDescription] [nvarchar](30) NOT NULL,
	[DrugCode] [nvarchar](6) NOT NULL,
	[DrugDescription] [nvarchar](42) NOT NULL,
	[DrugDispenseType] [nchar](1) NOT NULL,
	[DrugInteractionGroup] [bigint] NOT NULL,
	[DrugItem] [bigint] NOT NULL,
	[FreeIndex1] [nvarchar](20) NOT NULL,
	[FreeIndex2] [nvarchar](20) NOT NULL,
	[FreeIndex3] [nvarchar](20) NOT NULL,
	[FreeIndex4] [nvarchar](20) NOT NULL,
	[GenericCode] [nvarchar](20) NOT NULL,
	[GlassBottle] [bit] NOT NULL,
	[GovernmentRecoveryAmount] [decimal](28, 10) NOT NULL,
	[GstIncluded] [bit] NOT NULL,
	[HBFRecoveryAmount] [decimal](28, 10) NOT NULL,
	[HospitalProviderNumber] [nvarchar](8) NOT NULL,
	[Ignore] [bit] NOT NULL,
	[ImmediateSupply] [bit] NOT NULL,
	[IsAuthority] [bit] NOT NULL,
	[IsNarcotic] [bit] NOT NULL,
	[IsOutsideRepeat] [bit] NOT NULL,
	[LargeLabelSigs] [nvarchar](1024) NOT NULL,
	[LargeLabelType] [nvarchar](6) NOT NULL,
	[ManufacturerCode] [nvarchar](2) NOT NULL,
	[MaximumDispensings] [bigint] NOT NULL,
	[NationalHealthSchemeCode] [nvarchar](6) NOT NULL,
	[NursingHome] [bigint] NOT NULL,
	[NursingHomeCode] [nvarchar](4000) NOT NULL,
	[OriginalScriptNumber] [nvarchar](4000) NOT NULL,
	[OriginalSupplyingPharmacy] [nvarchar](6) NOT NULL,
	[POSTransferQuantity] [bigint] NOT NULL,
	[Packs] [float] NOT NULL,
	[Patient] [bigint] NOT NULL,
	[PatientInstructions] [nvarchar](4000) NOT NULL,
	[PatientNumber] [nvarchar](4000) NOT NULL,
	[PatientPrice] [decimal](28, 10) NOT NULL,
	[PerformStockMovement] [bit] NOT NULL,
	[Pharmacist] [bigint] NOT NULL,
	[PharmacistsInitials] [nvarchar](2) NOT NULL,
	[PrescriptionDate] [datetime] NOT NULL,
	[Quantity] [bigint] NOT NULL,
	[RepeatFastCode] [nvarchar](6) NOT NULL,
	[RepeatScriptNumber] [bigint] NOT NULL,
	[SafetyNetAmount] [decimal](28, 10) NOT NULL,
	[SaleCost] [decimal](28, 10) NOT NULL,
	[ScriptClassification] [nchar](1) NOT NULL,
	[ScriptNumber] [bigint] NOT NULL,
	[ScriptProcessLogic] [ntext] NULL,
	[ScriptStatus] [nchar](1) NOT NULL,
	[ScriptType] [nvarchar](4) NOT NULL,
	[WADDVerified] [nvarchar](1) NOT NULL,
	[Ward] [bigint] NOT NULL,
	[WardNumber] [nvarchar](4) NOT NULL,
	[WholesaleCost] [decimal](28, 10) NOT NULL,
 CONSTRAINT [PK_doScript] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doScriptConditionOption]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doScriptConditionOption](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[ConditionValueType] [int] NOT NULL,
	[Description] [nvarchar](4000) NOT NULL,
 CONSTRAINT [PK_doScriptConditionOption] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doScriptProcess]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doScriptProcess](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[ActivityAction] [int] NOT NULL,
	[PerformStockMovement] [bit] NOT NULL,
	[ProcessOrder] [int] NOT NULL,
	[ScriptRule] [bigint] NOT NULL,
 CONSTRAINT [PK_doScriptProcess] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doScriptRule]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doScriptRule](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[Description] [nvarchar](4000) NOT NULL,
 CONSTRAINT [PK_doScriptRule] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doScriptRuleEntry]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doScriptRuleEntry](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[ConditionValue] [varbinary](max) NOT NULL,
	[ConditionValueType] [int] NOT NULL,
	[Description] [nvarchar](4000) NOT NULL,
	[ScriptRule] [bigint] NOT NULL,
 CONSTRAINT [PK_doScriptRuleEntry] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doSecurityRoot]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doSecurityRoot](
	[ID] [bigint] NOT NULL,
 CONSTRAINT [PK_doSecurityRoot] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doSerial]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doSerial](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[Item] [bigint] NOT NULL,
	[SerialNumber1] [nvarchar](4000) NOT NULL,
	[SerialNumber2] [nvarchar](4000) NOT NULL,
	[SerialNumber3] [nvarchar](4000) NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_doSerial] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doStatement]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doStatement](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[Account] [bigint] NOT NULL,
	[Adjustments] [decimal](28, 10) NOT NULL,
	[Charges] [decimal](28, 10) NOT NULL,
	[Closed] [bit] NOT NULL,
	[ClosingBalance] [decimal](28, 10) NOT NULL,
	[Days30] [decimal](28, 10) NOT NULL,
	[Days60] [decimal](28, 10) NOT NULL,
	[Days90] [decimal](28, 10) NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[GeneratedDate] [datetime] NOT NULL,
	[OpeningBalance] [decimal](28, 10) NOT NULL,
	[Payments] [decimal](28, 10) NOT NULL,
	[Sales] [decimal](28, 10) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[StatementBatch] [bigint] NOT NULL,
	[StatementNumber] [bigint] NOT NULL,
	[StatementXml] [varbinary](max) NULL,
	[Tax] [decimal](28, 10) NOT NULL,
	[Transfers] [decimal](28, 10) NOT NULL,
 CONSTRAINT [PK_doStatement] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doStatementBatch]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doStatementBatch](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[BatchName] [nvarchar](4000) NOT NULL,
	[BatchNumber] [bigint] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[GeneratedCount] [bigint] NOT NULL,
	[RunDate] [datetime] NOT NULL,
	[StatementCount] [bigint] NOT NULL,
	[StatementSchedule] [bigint] NOT NULL,
	[TotalAmount] [decimal](28, 10) NOT NULL,
 CONSTRAINT [PK_doStatementBatch] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doStatement-EmailQueue]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doStatement-EmailQueue](
	[ID] [bigint] NOT NULL,
	[Owner] [bigint] NOT NULL,
	[EffectiveDate] [datetime] NOT NULL,
	[EmailError] [nvarchar](4000) NOT NULL,
	[EmailStatus] [int] NOT NULL,
	[EmailTemplate] [bigint] NOT NULL,
	[EmailTo] [nvarchar](4000) NOT NULL,
 CONSTRAINT [PK_doStatement-EmailQueue] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doStatementEmailQueue$IdGenerator]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doStatementEmailQueue$IdGenerator](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_doStatementEmailQueue$IdGenerator] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doStatementSchedule]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doStatementSchedule](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AccountFormat] [int] NOT NULL,
	[AccountFormatRestricted] [bit] NOT NULL,
	[AccountGroup] [bigint] NOT NULL,
	[AccountGroupRestricted] [bit] NOT NULL,
	[AccountType] [bigint] NOT NULL,
	[ClosePolicy] [int] NOT NULL,
	[Enabled] [bit] NOT NULL,
	[LastRun] [datetime] NOT NULL,
	[Name] [nvarchar](4000) NOT NULL,
	[NursingHome] [bigint] NOT NULL,
	[NursingHomeRestricted] [bit] NOT NULL,
	[RunPolicy] [int] NOT NULL,
	[StatementSendOption] [int] NOT NULL,
 CONSTRAINT [PK_doStatementSchedule] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doStdUser]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doStdUser](
	[ID] [bigint] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_doStdUser] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doStocktake]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doStocktake](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[CommittedDate] [datetime] NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
	[ImportedDataTable] [image] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ProtectedDate] [datetime] NOT NULL,
	[SatScanCode] [int] NOT NULL,
	[StocktakeType] [int] NOT NULL,
 CONSTRAINT [PK_doStocktake] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doStocktakeEntry]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doStocktakeEntry](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[ChangeCount] [int] NOT NULL,
	[Code] [nvarchar](25) NOT NULL,
	[Cost] [decimal](28, 10) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[LastCounted] [datetime] NOT NULL,
	[QuantityCounted] [float] NOT NULL,
	[QuantityOnHand] [float] NOT NULL,
	[Stocktake] [bigint] NOT NULL,
	[StocktakedItem] [bigint] NOT NULL,
 CONSTRAINT [PK_doStocktakeEntry] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doSubstitute]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doSubstitute](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[IBHeaderGuid] [uniqueidentifier] NOT NULL,
	[RapidObjectGuid] [uniqueidentifier] NOT NULL,
	[RapidSyncRequired] [bit] NOT NULL,
	[RecordStatus] [bigint] NOT NULL,
	[Item] [bigint] NOT NULL,
	[SubstituteItem] [bigint] NOT NULL,
 CONSTRAINT [PK_doSubstitute] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doSupplier]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doSupplier](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[IBHeaderGuid] [uniqueidentifier] NOT NULL,
	[RapidObjectGuid] [uniqueidentifier] NOT NULL,
	[RapidSyncRequired] [bit] NOT NULL,
	[RecordStatus] [bigint] NOT NULL,
	[ABN] [nvarchar](30) NOT NULL,
	[AccountNumber] [nvarchar](32) NOT NULL,
	[AddressLine1] [nvarchar](4000) NOT NULL,
	[AddressLine2] [nvarchar](4000) NOT NULL,
	[AddressState] [nvarchar](4000) NOT NULL,
	[AppCatHQID] [bigint] NOT NULL,
	[AppCatHQLastMatched] [datetime] NOT NULL,
	[ApplyTax] [bit] NOT NULL,
	[City] [nvarchar](4000) NOT NULL,
	[Code] [nvarchar](17) NOT NULL,
	[Company] [nvarchar](4000) NOT NULL,
	[ContactName] [nvarchar](128) NOT NULL,
	[Country] [nvarchar](128) NOT NULL,
	[Currency] [bigint] NOT NULL,
	[CustomDate1] [datetime] NOT NULL,
	[CustomDate2] [datetime] NOT NULL,
	[CustomDate3] [datetime] NOT NULL,
	[CustomDate4] [datetime] NOT NULL,
	[CustomDate5] [datetime] NOT NULL,
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
	[DeliveringSupplier] [bigint] NOT NULL,
	[EmailAddress] [nvarchar](4000) NOT NULL,
	[FaxNumber] [nvarchar](4000) NOT NULL,
	[FirstName] [nvarchar](4000) NOT NULL,
	[GroupedDescription] [nvarchar](4000) NOT NULL,
	[InActive] [bit] NOT NULL,
	[IsBanner] [bit] NOT NULL,
	[IsBuyingGroup] [bit] NOT NULL,
	[IsDirectSupplier] [bit] NOT NULL,
	[IsManufacturer] [bit] NOT NULL,
	[IsWholesaler] [bit] NOT NULL,
	[LastName] [nvarchar](4000) NOT NULL,
	[LocalKey] [nvarchar](50) NOT NULL,
	[MinimumOrderAmount] [decimal](28, 10) NOT NULL,
	[MobileNumber] [nvarchar](4000) NOT NULL,
	[NoGateway] [bit] NOT NULL,
	[ObeyAccountCreditLimit] [bit] NOT NULL,
	[OrderingCode] [nvarchar](30) NOT NULL,
	[PhoneNumber] [nvarchar](4000) NOT NULL,
	[PostCode] [nvarchar](4000) NOT NULL,
	[PricelineSupplierType] [int] NOT NULL,
	[Remarks] [nvarchar](1000) NOT NULL,
	[RemoteHost] [nvarchar](150) NOT NULL,
	[RemoteKey] [nvarchar](50) NOT NULL,
	[RemotePort] [nvarchar](10) NOT NULL,
	[SendOrdersViaProxySupplier] [bit] NOT NULL,
	[ShowCostPrice] [bit] NOT NULL,
	[Terms] [nvarchar](50) NOT NULL,
	[Title] [nvarchar](4000) NOT NULL,
	[TransferOutChargeAccount] [bigint] NOT NULL,
	[TransferType] [int] NOT NULL,
	[UpdateCost] [bit] NOT NULL,
	[Web] [nvarchar](4000) NOT NULL,
 CONSTRAINT [PK_doSupplier] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doSupplierAccount]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doSupplierAccount](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[AccountNumber] [nvarchar](30) NOT NULL,
	[BackupSupplyType] [nchar](1) NOT NULL,
	[Code] [nvarchar](4000) NOT NULL,
	[Disabled] [bit] NOT NULL,
	[GroupType] [nchar](1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[OrderType] [nvarchar](2) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Supplier] [bigint] NOT NULL,
	[SupplierID] [int] NOT NULL,
	[SupplyMethod] [nchar](1) NOT NULL,
	[SupplyType] [nchar](1) NOT NULL,
	[UseAPIOrderingOptions] [bit] NOT NULL,
	[UseSigmaOrderingOptions] [bit] NOT NULL,
 CONSTRAINT [PK_doSupplierAccount] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doSupplierItem]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doSupplierItem](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[IBHeaderGuid] [uniqueidentifier] NOT NULL,
	[RapidObjectGuid] [uniqueidentifier] NOT NULL,
	[RapidSyncRequired] [bit] NOT NULL,
	[RecordStatus] [bigint] NOT NULL,
	[Cost] [decimal](28, 10) NOT NULL,
	[CostPrice1] [decimal](28, 10) NOT NULL,
	[CostPrice2] [decimal](28, 10) NOT NULL,
	[CostPrice3] [decimal](28, 10) NOT NULL,
	[CostPrice4] [decimal](28, 10) NOT NULL,
	[CostPrice5] [decimal](28, 10) NOT NULL,
	[CostPriceQuantity1] [float] NOT NULL,
	[CostPriceQuantity2] [float] NOT NULL,
	[CostPriceQuantity3] [float] NOT NULL,
	[CostPriceQuantity4] [float] NOT NULL,
	[CostPriceQuantity5] [float] NOT NULL,
	[DealCatalogueName] [nvarchar](4000) NOT NULL,
	[DealCost] [decimal](28, 10) NOT NULL,
	[DealEndDate] [datetime] NOT NULL,
	[DealMinDOQ] [float] NOT NULL,
	[DealStartDate] [datetime] NOT NULL,
	[ItemSupplied] [bigint] NOT NULL,
	[ItemTax] [bigint] NOT NULL,
	[LastCost] [decimal](28, 10) NOT NULL,
	[LastExchangeRate] [decimal](28, 10) NOT NULL,
	[LastForeignCost] [decimal](28, 10) NOT NULL,
	[LastReceivedDate] [datetime] NOT NULL,
	[MinimumOrder] [int] NOT NULL,
	[NeverAutoMatch] [bit] NOT NULL,
	[PackQuantity] [int] NOT NULL,
	[PurchaseTax] [bigint] NOT NULL,
	[Quantity] [float] NOT NULL,
	[RRP] [decimal](28, 10) NOT NULL,
	[ReceiveItemQuantity] [float] NOT NULL,
	[ReorderNumber] [nvarchar](4000) NOT NULL,
	[Supplier] [bigint] NOT NULL,
	[SupplierDescription] [nvarchar](128) NOT NULL,
	[TaxInc] [bit] NOT NULL,
	[TaxRate] [float] NOT NULL,
 CONSTRAINT [PK_doSupplierItem] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doSysInfo]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doSysInfo](
	[Name] [nvarchar](250) NOT NULL,
	[Value] [ntext] NULL,
 CONSTRAINT [PK_doSysInfo] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doSysObjectDefs]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doSysObjectDefs](
	[OBJECT_CATALOG] [nvarchar](128) NOT NULL,
	[OBJECT_SCHEMA] [nvarchar](128) NOT NULL,
	[OBJECT_NAME] [nvarchar](128) NOT NULL,
	[OBJECT_DEFINITION] [nvarchar](4000) NOT NULL,
	[OBJECT_DEFINITION_CHECKSUM] [varchar](8) NOT NULL,
 CONSTRAINT [PK_doSysObjectDefs] PRIMARY KEY CLUSTERED 
(
	[OBJECT_CATALOG] ASC,
	[OBJECT_SCHEMA] ASC,
	[OBJECT_NAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doSysTypes]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doSysTypes](
	[ID] [int] NOT NULL,
	[Value] [nvarchar](440) NULL,
 CONSTRAINT [PK_doSysTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doTax]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doTax](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[IBHeaderGuid] [uniqueidentifier] NOT NULL,
	[RapidObjectGuid] [uniqueidentifier] NOT NULL,
	[RapidSyncRequired] [bit] NOT NULL,
	[RecordStatus] [bigint] NOT NULL,
	[ApplyOverMinimum] [bit] NOT NULL,
	[ApplyToSubTotal] [bit] NOT NULL,
	[Bracket00] [decimal](28, 10) NOT NULL,
	[Bracket01] [decimal](28, 10) NOT NULL,
	[Bracket02] [decimal](28, 10) NOT NULL,
	[Bracket03] [decimal](28, 10) NOT NULL,
	[Bracket04] [decimal](28, 10) NOT NULL,
	[Bracket05] [decimal](28, 10) NOT NULL,
	[Bracket06] [decimal](28, 10) NOT NULL,
	[Bracket07] [decimal](28, 10) NOT NULL,
	[Bracket08] [decimal](28, 10) NOT NULL,
	[Bracket09] [decimal](28, 10) NOT NULL,
	[Bracket10] [decimal](28, 10) NOT NULL,
	[Bracket11] [decimal](28, 10) NOT NULL,
	[Bracket12] [decimal](28, 10) NOT NULL,
	[Bracket13] [decimal](28, 10) NOT NULL,
	[Bracket14] [decimal](28, 10) NOT NULL,
	[Bracket15] [decimal](28, 10) NOT NULL,
	[Bracket16] [decimal](28, 10) NOT NULL,
	[Bracket17] [decimal](28, 10) NOT NULL,
	[Bracket18] [decimal](28, 10) NOT NULL,
	[Bracket19] [decimal](28, 10) NOT NULL,
	[Bracket20] [decimal](28, 10) NOT NULL,
	[Bracket21] [decimal](28, 10) NOT NULL,
	[Bracket22] [decimal](28, 10) NOT NULL,
	[Bracket23] [decimal](28, 10) NOT NULL,
	[Bracket24] [decimal](28, 10) NOT NULL,
	[Bracket25] [decimal](28, 10) NOT NULL,
	[Bracket26] [decimal](28, 10) NOT NULL,
	[Bracket27] [decimal](28, 10) NOT NULL,
	[Bracket28] [decimal](28, 10) NOT NULL,
	[Bracket29] [decimal](28, 10) NOT NULL,
	[Bracket30] [decimal](28, 10) NOT NULL,
	[BracketValue01] [decimal](28, 10) NOT NULL,
	[BracketValue02] [decimal](28, 10) NOT NULL,
	[BracketValue03] [decimal](28, 10) NOT NULL,
	[BracketValue04] [decimal](28, 10) NOT NULL,
	[BracketValue05] [decimal](28, 10) NOT NULL,
	[BracketValue06] [decimal](28, 10) NOT NULL,
	[BracketValue07] [decimal](28, 10) NOT NULL,
	[BracketValue08] [decimal](28, 10) NOT NULL,
	[BracketValue09] [decimal](28, 10) NOT NULL,
	[BracketValue10] [decimal](28, 10) NOT NULL,
	[BracketValue11] [decimal](28, 10) NOT NULL,
	[BracketValue12] [decimal](28, 10) NOT NULL,
	[BracketValue13] [decimal](28, 10) NOT NULL,
	[BracketValue14] [decimal](28, 10) NOT NULL,
	[BracketValue15] [decimal](28, 10) NOT NULL,
	[BracketValue16] [decimal](28, 10) NOT NULL,
	[BracketValue17] [decimal](28, 10) NOT NULL,
	[BracketValue18] [decimal](28, 10) NOT NULL,
	[BracketValue19] [decimal](28, 10) NOT NULL,
	[BracketValue20] [decimal](28, 10) NOT NULL,
	[BracketValue21] [decimal](28, 10) NOT NULL,
	[BracketValue22] [decimal](28, 10) NOT NULL,
	[BracketValue23] [decimal](28, 10) NOT NULL,
	[BracketValue24] [decimal](28, 10) NOT NULL,
	[BracketValue25] [decimal](28, 10) NOT NULL,
	[BracketValue26] [decimal](28, 10) NOT NULL,
	[BracketValue27] [decimal](28, 10) NOT NULL,
	[BracketValue28] [decimal](28, 10) NOT NULL,
	[BracketValue29] [decimal](28, 10) NOT NULL,
	[BracketValue30] [decimal](28, 10) NOT NULL,
	[Code] [nvarchar](17) NOT NULL,
	[Description] [nvarchar](25) NOT NULL,
	[FixedAmount] [decimal](28, 10) NOT NULL,
	[IncludePreviousTax] [bit] NOT NULL,
	[ItemMaximum] [decimal](28, 10) NOT NULL,
	[ItemMinimum] [decimal](28, 10) NOT NULL,
	[Percentage] [float] NOT NULL,
	[TaxLimit] [int] NOT NULL,
	[UsePartialDollar] [bit] NOT NULL,
 CONSTRAINT [PK_doTax] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doTender]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doTender](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[Activity] [bigint] NOT NULL,
	[Amount] [decimal](28, 10) NOT NULL,
	[DropPayout] [bigint] NOT NULL,
	[TenderAction] [int] NOT NULL,
	[TenderType] [bigint] NOT NULL,
 CONSTRAINT [PK_doTender] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doTenderDenominations]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doTenderDenominations](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[DenominationValue] [decimal](28, 10) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[TypeOfTender] [int] NOT NULL,
 CONSTRAINT [PK_doTenderDenominations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doTenderTotal]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doTenderTotal](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[Banking] [decimal](28, 10) NOT NULL,
	[Batch] [bigint] NOT NULL,
	[Close] [decimal](28, 10) NOT NULL,
	[Count] [int] NOT NULL,
	[Dropped] [decimal](28, 10) NOT NULL,
	[Open] [decimal](28, 10) NOT NULL,
	[Shift] [decimal](28, 10) NOT NULL,
	[TenderType] [bigint] NOT NULL,
 CONSTRAINT [PK_doTenderTotal] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doTenderType]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doTenderType](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[Code] [nvarchar](17) NOT NULL,
	[Description] [nvarchar](4000) NOT NULL,
	[MaximumTender] [decimal](28, 10) NOT NULL,
	[PopCashDraw] [bit] NOT NULL,
	[PreventOverTendering] [bit] NOT NULL,
	[RegisterDisplayOrder] [int] NOT NULL,
	[Remarks] [nvarchar](1024) NOT NULL,
	[TypeOfTender] [int] NOT NULL,
 CONSTRAINT [PK_doTenderType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doTransactionInfo]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doTransactionInfo](
	[ID] [bigint] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[User] [bigint] NOT NULL,
 CONSTRAINT [PK_doTransactionInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doUser]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doUser](
	[ID] [bigint] NOT NULL,
	[IsDisabled] [bit] NOT NULL,
 CONSTRAINT [PK_doUser] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doUserAccount]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doUserAccount](
	[ID] [bigint] NOT NULL,
	[AddressLine1] [nvarchar](4000) NOT NULL,
	[AddressLine2] [nvarchar](4000) NOT NULL,
	[AddressState] [nvarchar](4000) NOT NULL,
	[AllowTaskAllocation] [bit] NOT NULL,
	[Cashier] [bigint] NOT NULL,
	[City] [nvarchar](4000) NOT NULL,
	[Company] [nvarchar](4000) NOT NULL,
	[EmailAddress] [nvarchar](255) NOT NULL,
	[FaxNumber] [nvarchar](30) NOT NULL,
	[FirstName] [nvarchar](80) NOT NULL,
	[LastName] [nvarchar](80) NOT NULL,
	[MobileNumber] [nvarchar](30) NOT NULL,
	[PhoneNumber] [nvarchar](30) NOT NULL,
	[PinCode] [nvarchar](4) NOT NULL,
	[PostCode] [nvarchar](4) NOT NULL,
	[ResourceColour] [nvarchar](4000) NOT NULL,
	[Title] [nvarchar](5) NOT NULL,
	[UserName] [nvarchar](4000) NOT NULL,
	[Web] [nvarchar](4000) NOT NULL,
 CONSTRAINT [PK_doUserAccount] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doUserAccount-Appointments]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doUserAccount-Appointments](
	[ID] [bigint] NOT NULL,
	[Owner] [bigint] NOT NULL,
	[AllDay] [bit] NOT NULL,
	[Description] [nvarchar](4000) NOT NULL,
	[End] [datetime] NOT NULL,
	[EventType] [int] NOT NULL,
	[Label] [bigint] NOT NULL,
	[Location] [nvarchar](4000) NOT NULL,
	[RecurrenceInfo] [nvarchar](4000) NOT NULL,
	[ReminderInfo] [nvarchar](4000) NOT NULL,
	[ResourceId] [nvarchar](4000) NOT NULL,
	[Start] [datetime] NOT NULL,
	[Subject] [nvarchar](4000) NOT NULL,
 CONSTRAINT [PK_doUserAccount-Appointments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doUserAccountAppointments$IdGenerator]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doUserAccountAppointments$IdGenerator](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_doUserAccountAppointments$IdGenerator] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doUserAccount-Tasks]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doUserAccount-Tasks](
	[ID] [bigint] NOT NULL,
	[Owner] [bigint] NOT NULL,
	[Description] [nvarchar](4000) NOT NULL,
	[Done] [bit] NOT NULL,
	[DoneBy] [nvarchar](4000) NOT NULL,
	[DueDate] [datetime] NOT NULL,
	[RecurrencePattern] [nvarchar](4000) NOT NULL,
	[ReminderDateTime] [datetime] NOT NULL,
	[ReminderEnabled] [bit] NOT NULL,
	[SharedUserList] [nvarchar](4000) NOT NULL,
	[Subject] [nvarchar](4000) NOT NULL,
 CONSTRAINT [PK_doUserAccount-Tasks] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doUserAccountTasks$IdGenerator]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doUserAccountTasks$IdGenerator](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_doUserAccountTasks$IdGenerator] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doUserAccount-UserSettings]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doUserAccount-UserSettings](
	[ID-1] [bigint] NOT NULL,
	[ID-2] [bigint] NOT NULL,
 CONSTRAINT [PK_doUserAccount-UserSettings] PRIMARY KEY CLUSTERED 
(
	[ID-1] ASC,
	[ID-2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doWard]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doWard](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[WardDescription] [nvarchar](40) NOT NULL,
	[WardNumber] [nvarchar](4) NOT NULL,
	[Wardcharge] [nchar](1) NOT NULL,
	[Wardhiccat] [nchar](1) NOT NULL,
	[Wardhosp] [nvarchar](4) NOT NULL,
 CONSTRAINT [PK_doWard] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doWilliamActivityHistory]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doWilliamActivityHistory](
	[ID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[AggregateSource] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[Account] [bigint] NOT NULL,
	[AccountNumber] [nvarchar](4000) NOT NULL,
	[Amount] [decimal](28, 10) NOT NULL,
	[ChargeType] [nvarchar](4000) NOT NULL,
	[Description] [nvarchar](4000) NOT NULL,
	[DiscPoss] [nvarchar](4000) NOT NULL,
	[Discount] [decimal](28, 10) NOT NULL,
	[GSTIncluded] [bit] NOT NULL,
	[HistoryType] [nvarchar](4000) NOT NULL,
	[Operator] [nvarchar](4000) NOT NULL,
	[PatientNumber] [bigint] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ReferenceNumber] [nvarchar](4000) NOT NULL,
	[TimeOccured] [datetime] NOT NULL,
	[TransactionClass] [nvarchar](4000) NOT NULL,
	[TransactionNumber] [bigint] NOT NULL,
	[WardNumber] [bigint] NOT NULL,
 CONSTRAINT [PK_doWilliamActivityHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[doAccountAllocation-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doAccountAllocation-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[AccountType] as [AccountType], A0.[AccountTypeOwner] as [AccountTypeOwner], A0.[ChargeAccount] as [ChargeAccount], A0.[ChargeType] as [ChargeType] from [dbo].[doAccountAllocation] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doAccountType-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doAccountType-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[CreditLimit] as [CreditLimit], A0.[Description] as [Description] from [dbo].[doAccountType] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doAccount-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doAccount-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[AccountFormat] as [AccountFormat], A0.[AccountNumber] as [AccountNumber], A0.[AccountOwner] as [AccountOwner], A0.[AccountType] as [AccountType], A0.[AddressLine1] as [AddressLine1], A0.[AddressLine2] as [AddressLine2], A0.[AddressSource] as [AddressSource], A0.[AddressState] as [AddressState], A0.[Balance] as [Balance], A0.[City] as [City], A0.[ClosedDate] as [ClosedDate], A0.[Company] as [Company], A0.[CreditLimit] as [CreditLimit], A0.[Customer] as [Customer], A0.[CustomerAddressLine1] as [CustomerAddressLine1], A0.[CustomerAddressLine2] as [CustomerAddressLine2], A0.[CustomerAddressState] as [CustomerAddressState], A0.[CustomerCity] as [CustomerCity], A0.[CustomerCompany] as [CustomerCompany], A0.[CustomerEmailAddress] as [CustomerEmailAddress], A0.[CustomerFaxNumber] as [CustomerFaxNumber], A0.[CustomerFirstName] as [CustomerFirstName], A0.[CustomerLastName] as [CustomerLastName], A0.[CustomerMobileNumber] as [CustomerMobileNumber], A0.[CustomerPhoneNumber] as [CustomerPhoneNumber], A0.[CustomerPostCode] as [CustomerPostCode], A0.[CustomerTitle] as [CustomerTitle], A0.[CustomerWeb] as [CustomerWeb], A0.[Discount] as [Discount], A0.[EmailAddress] as [EmailAddress], A0.[FaxNumber] as [FaxNumber], A0.[FirstName] as [FirstName], A0.[GroupedDescription] as [GroupedDescription], A0.[ImportDescription] as [ImportDescription], A0.[ImportedBalance] as [ImportedBalance], A0.[LastName] as [LastName], A0.[MobileNumber] as [MobileNumber], A0.[OpenedDate] as [OpenedDate], A0.[PhoneNumber] as [PhoneNumber], A0.[PostCode] as [PostCode], A0.[PriceLevel] as [PriceLevel], A0.[PrintByPatient] as [PrintByPatient], A0.[ProviderNumber] as [ProviderNumber], A0.[Reference] as [Reference], A0.[Remarks] as [Remarks], A0.[SendStatementsByEmail] as [SendStatementsByEmail], A0.[StatementEmail] as [StatementEmail], A0.[TAC] as [TAC], A0.[Title] as [Title], A0.[Web] as [Web] from [dbo].[doAccount] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doActivityEntry-ReconcileEntry-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doActivityEntry-ReconcileEntry-View] as 
Select A0.[ID] as [ID], A0.[Owner] as [Owner], A0.[AdjustmentActivity] as [AdjustmentActivity], A0.[PaidAmount] as [PaidAmount], A0.[PaymentActivity] as [PaymentActivity], A0.[Remarks] as [Remarks] from [dbo].[doActivityEntry-ReconcileEntry] A0 
GO
/****** Object:  View [dbo].[doActivityEntry-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doActivityEntry-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[Activity] as [Activity], A0.[Cost] as [Cost], A0.[Discount] as [Discount], A0.[ExtendedPrice] as [ExtendedPrice], A0.[GovRecov] as [GovRecov], A0.[ItemTransacted] as [ItemTransacted], A0.[Points] as [Points], A0.[Quantity] as [Quantity], A0.[QuantityDiscountScheme] as [QuantityDiscountScheme], A0.[Remarks] as [Remarks], A0.[RetailPrice] as [RetailPrice], A0.[SaleDescription] as [SaleDescription], A0.[Script] as [Script], A0.[Tax] as [Tax] from [dbo].[doActivityEntry] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doActivity-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doActivity-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus], A0.[AcceptedBy] as [AcceptedBy], A0.[ActivityType] as [ActivityType], A0.[Batch] as [Batch], A0.[Cashier] as [Cashier], A0.[ChargeAccount] as [ChargeAccount], A0.[Customer] as [Customer], A0.[HiddenReverseActivity] as [HiddenReverseActivity], A0.[LaybyAccount] as [LaybyAccount], A0.[LoyaltyAccount] as [LoyaltyAccount], A0.[PostCode] as [PostCode], A0.[Reference] as [Reference], A0.[Register] as [Register], A0.[Remarks] as [Remarks], A0.[Statement] as [Statement], A0.[TimeOccured] as [TimeOccured], A0.[TotalCharged] as [TotalCharged], A0.[TotalCost] as [TotalCost], A0.[TotalDiscount] as [TotalDiscount], A0.[TotalExtendedPrice] as [TotalExtendedPrice], A0.[TotalGovRecov] as [TotalGovRecov], A0.[TotalLayby] as [TotalLayby], A0.[TotalLines] as [TotalLines], A0.[TotalPoints] as [TotalPoints], A0.[TotalProfit] as [TotalProfit], A0.[TotalQuantity] as [TotalQuantity], A0.[TotalRetailPrice] as [TotalRetailPrice], A0.[TotalScripts] as [TotalScripts], A0.[TotalTax] as [TotalTax], A0.[TransactionNumber] as [TransactionNumber] from [dbo].[doActivity] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doAlertTrigger-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doAlertTrigger-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AlertTriggerType] as [AlertTriggerType], A0.[AssignedTo] as [AssignedTo], A0.[Priority] as [Priority], A0.[TriggerValue1] as [TriggerValue1], A0.[TriggerValue2] as [TriggerValue2], A0.[Unique] as [Unique] from [dbo].[doAlertTrigger] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doAlert-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doAlert-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AlertDate] as [AlertDate], A0.[AlertTriggerType] as [AlertTriggerType], A0.[AlertedObject] as [AlertedObject], A0.[AssignedTo] as [AssignedTo], A0.[Priority] as [Priority], A0.[RaisedCount] as [RaisedCount] from [dbo].[doAlert] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doAlias-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doAlias-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus], A0.[Code] as [Code], A0.[IsLabelOnly] as [IsLabelOnly], A0.[IsNumeric] as [IsNumeric], A0.[ItemAliased] as [ItemAliased], A0.[LastItemAliased] as [LastItemAliased] from [dbo].[doAlias] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doAssistantTask-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doAssistantTask-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[Description] as [Description], A0.[Name] as [Name] from [dbo].[doAssistantTask] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doAuditAggregateDataObject-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doAuditAggregateDataObject-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doAuditAggregateDataObject] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doRapidAuditAggregateDataObject] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doActivity] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doOffer] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doOfferEntry] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doOfferCampaign] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doItemManager] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doItemManagerEntry] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doCurrency] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doDropPayout] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doInvoice] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doInvoiceEntry] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doInvoiceEntryReceive] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doInvoiceOtherCost] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doItemClassification] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doItemPricingHistory] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doPricingReview] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doPricingReviewEntry] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doPurchaseOrder] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doPurchaseOrderEntry] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doRapidRecordStatus] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doItemTax] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doTax] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doSerial] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doKit] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doSubstitute] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doPromotionEntry] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doPromotion] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doItemBase] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doPricingPlan] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doQuantityDiscountScheme] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doTenderDenominations] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doDimensionAttribute] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doMatrixAttributeDisplayOrder] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doDimension] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doItemClassComponent] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doWilliamActivityHistory] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doGroup] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doReturnToSupplierEntry] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doReturnToSupplier] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doClaim] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doChargeType] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doAccountAllocation] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doAccountType] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doBatch] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doReasonCode] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doTenderTotal] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doRegister] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doRateOfUsageDateDefinition] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doWard] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doPharmacist] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doNursingHome] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doDrug] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doDoctor] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doPatient] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doAlias] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doBusinessUnit] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doCashier] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doCategory] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doDepartment] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doAccount] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doTender] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doTenderType] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doCustomer] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doItemMessage] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doItemMovementHistory] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doOrderTemplate] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doRateOfUsageScheme] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doScript] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doSupplier] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doSupplierAccount] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doSupplierItem] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doActivityEntry] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doAuditDataObject-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doAuditDataObject-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doAuditDataObject] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doAuditAggregateDataObject] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doRapidAuditAggregateDataObject] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doActivity] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doAlertTrigger] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doAssistantTask] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doItemMergeQueue] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doEmailTemplate] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doOffer] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doOfferEntry] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doOfferCampaign] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doItemManager] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doItemManagerEntry] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doCurrency] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doDropPayout] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doInvoice] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doInvoiceEntry] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doInvoiceEntryReceive] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doInvoiceOtherCost] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doItemClassification] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doItemPricingHistory] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doLabelQueue] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doOutOfStockItem] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doPricingReview] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doPricingReviewEntry] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doPurchaseOrder] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doPurchaseOrderEntry] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doRapidRecordStatus] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doAlert] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doItemTax] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doTax] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doItemCodeScheme] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doSerial] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doKit] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doSubstitute] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doPromotionEntry] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doPromotion] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doItemBase] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doPricingPlan] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doQuantityDiscountScheme] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doStocktakeEntry] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doStocktake] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doTenderDenominations] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doDataAssistantTemplate] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doDimensionAttribute] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doMatrixAttributeDisplayOrder] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doDimension] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doItemClassComponent] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doWilliamActivityHistory] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doGroup] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doReturnToSupplierEntry] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doReturnToSupplier] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doClaim] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doChargeType] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doAccountAllocation] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doAccountType] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doBatch] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doReasonCode] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doTenderTotal] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doPlanogramLocation] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doRegister] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doStatementSchedule] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doStatementBatch] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doScriptProcess] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doScriptConditionOption] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doScriptRuleEntry] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doScriptRule] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doDraft] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doDraftEntry] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doPharmXAccount] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doRateOfUsageDateDefinition] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doWard] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doPharmacist] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doNursingHome] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doDrug] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doDoctor] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doPatient] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doAlias] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doBusinessUnit] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doCashier] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doCategory] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doDepartment] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doLabelElement] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doLabelPrinting] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doAccount] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doNameValuePair] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doTender] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doTenderType] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doStatement] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doPlanogram] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doSatScanGunLog] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doSatScanDeviceOptionStockTake] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doCustomer] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doReport] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doItemMessage] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doItemMovementHistory] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doOrderTemplate] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doSatScanDeviceOptionGral] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doSatScanSettingsGlobal] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doSatScanSettingsLocal] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doRateOfUsageScheme] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doScript] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doSupplier] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doSupplierAccount] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doSupplierItem] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified] from [dbo].[doActivityEntry] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doAudit-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doAudit-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AuditActionType] as [AuditActionType], A0.[AuditDate] as [AuditDate], A0.[AuditType] as [AuditType], A0.[AuditedObject] as [AuditedObject], A0.[Field] as [Field], A0.[FriendlyName] as [FriendlyName], A0.[FromValue] as [FromValue], A0.[Message] as [Message], A0.[ObjectType] as [ObjectType], A0.[SourceName] as [SourceName], A0.[ToValue] as [ToValue] from [dbo].[doAudit] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doBatch-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doBatch-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus], A0.[AbortedTransactionCount] as [AbortedTransactionCount], A0.[BatchNumber] as [BatchNumber], A0.[BatchStatus] as [BatchStatus], A0.[CashBackSurcharge] as [CashBackSurcharge], A0.[ClosingTime] as [ClosingTime], A0.[ClosingTotal] as [ClosingTotal], A0.[Comments] as [Comments], A0.[CostOfGoods] as [CostOfGoods], A0.[CustomerCount] as [CustomerCount], A0.[CustomerDepositMade] as [CustomerDepositMade], A0.[CustomerDepositRedeemed] as [CustomerDepositRedeemed], A0.[DebitSurcharge] as [DebitSurcharge], A0.[Discounts] as [Discounts], A0.[Dropped] as [Dropped], A0.[GovernmentRecovery] as [GovernmentRecovery], A0.[LayawayClosed] as [LayawayClosed], A0.[LayawayPaid] as [LayawayPaid], A0.[Locked] as [Locked], A0.[NoSalesCount] as [NoSalesCount], A0.[OpeningTime] as [OpeningTime], A0.[OpeningTotal] as [OpeningTotal], A0.[OverUnder] as [OverUnder], A0.[PaidOnAccount] as [PaidOnAccount], A0.[PaidOut] as [PaidOut], A0.[PaidToAccount] as [PaidToAccount], A0.[Register] as [Register], A0.[Returns] as [Returns], A0.[Sales] as [Sales], A0.[SalesPlusTax] as [SalesPlusTax], A0.[Tax] as [Tax], A0.[TenderRoundingError] as [TenderRoundingError], A0.[TotalChange] as [TotalChange], A0.[TotalTendered] as [TotalTendered] from [dbo].[doBatch] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doBusinessUnit-AuditHistory-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doBusinessUnit-AuditHistory-View] as 
Select A0.[ID] as [ID], A0.[Owner] as [Owner], A0.[AuditActionType] as [AuditActionType], A0.[AuditDate] as [AuditDate], A0.[AuditType] as [AuditType], A0.[AuditedObject] as [AuditedObject], A0.[Field] as [Field], A0.[FriendlyName] as [FriendlyName], A0.[FromValue] as [FromValue], A0.[Message] as [Message], A0.[ObjectType] as [ObjectType], A0.[SourceName] as [SourceName], A0.[ToValue] as [ToValue] from [dbo].[doBusinessUnit-AuditHistory] A0 
GO
/****** Object:  View [dbo].[doBusinessUnit-Events-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doBusinessUnit-Events-View] as 
Select A0.[ID] as [ID], A0.[Owner] as [Owner], A0.[AggregateObject] as [AggregateObject], A0.[AggregateObjectType] as [AggregateObjectType], A0.[EventSource] as [EventSource], A0.[EventType] as [EventType], A0.[Message] as [Message], A0.[Relationship] as [Relationship], A0.[TimeOccurred] as [TimeOccurred] from [dbo].[doBusinessUnit-Events] A0 
GO
/****** Object:  View [dbo].[doBusinessUnit-MandatoryFields-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doBusinessUnit-MandatoryFields-View] as 
Select A0.[ID] as [ID], A0.[Owner] as [Owner], A0.[Description] as [Description], A0.[FieldName] as [FieldName], A0.[IsMandatory] as [IsMandatory], A0.[IsSystem] as [IsSystem], A0.[TypeName] as [TypeName] from [dbo].[doBusinessUnit-MandatoryFields] A0 
GO
/****** Object:  View [dbo].[doBusinessUnit-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doBusinessUnit-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus], A0.[ABN] as [ABN], A0.[Account] as [Account], A0.[AddressLine1] as [AddressLine1], A0.[AddressLine2] as [AddressLine2], A0.[AddressState] as [AddressState], A0.[BSB] as [BSB], A0.[City] as [City], A0.[Company] as [Company], A0.[ConfigXML] as [ConfigXML], A0.[Country] as [Country], A0.[EmailAddress] as [EmailAddress], A0.[FaxNumber] as [FaxNumber], A0.[FirstName] as [FirstName], A0.[ForceDomainBuild3_7v3] as [ForceDomainBuild3_7v3], A0.[FridayCloseTime] as [FridayCloseTime], A0.[FridayOpenTime] as [FridayOpenTime], A0.[LastName] as [LastName], A0.[Master] as [Master], A0.[MobileNumber] as [MobileNumber], A0.[MondayCloseTime] as [MondayCloseTime], A0.[MondayOpenTime] as [MondayOpenTime], A0.[NextAccountNumber] as [NextAccountNumber], A0.[NextCampaignCode] as [NextCampaignCode], A0.[NextCategoryCode] as [NextCategoryCode], A0.[NextDepartmentCode] as [NextDepartmentCode], A0.[NextItemCode] as [NextItemCode], A0.[NextOfferCampaignCode] as [NextOfferCampaignCode], A0.[NextOfferCode] as [NextOfferCode], A0.[NextPurchaseOrderCode] as [NextPurchaseOrderCode], A0.[NextPurchaseOrderRFCCode] as [NextPurchaseOrderRFCCode], A0.[NextReasonCode] as [NextReasonCode], A0.[NextReturnOrderCode] as [NextReturnOrderCode], A0.[NextSatScanCode] as [NextSatScanCode], A0.[NextSupplierCode] as [NextSupplierCode], A0.[NextTenderTypeCode] as [NextTenderTypeCode], A0.[NextTransferInCode] as [NextTransferInCode], A0.[NextTransferOutCode] as [NextTransferOutCode], A0.[NextTransferOutInvoiceCode] as [NextTransferOutInvoiceCode], A0.[ParentABN] as [ParentABN], A0.[ParentCompany] as [ParentCompany], A0.[PhoneNumber] as [PhoneNumber], A0.[PostCode] as [PostCode], A0.[PurchaseOrderCodePrefix] as [PurchaseOrderCodePrefix], A0.[PurchaseOrderDefaultRequiredDays] as [PurchaseOrderDefaultRequiredDays], A0.[PurchaseOrderRFCCodePrefix] as [PurchaseOrderRFCCodePrefix], A0.[PurchaseOrderVariationPercent] as [PurchaseOrderVariationPercent], A0.[ReturnOrderCodePrefix] as [ReturnOrderCodePrefix], A0.[SaturdayCloseTime] as [SaturdayCloseTime], A0.[SaturdayOpenTime] as [SaturdayOpenTime], A0.[SiteGuid] as [SiteGuid], A0.[StoreID] as [StoreID], A0.[SundayCloseTime] as [SundayCloseTime], A0.[SundayOpenTime] as [SundayOpenTime], A0.[SystemGSTFreeItemTax] as [SystemGSTFreeItemTax], A0.[SystemGSTItemTax] as [SystemGSTItemTax], A0.[SystemNoGSTItemTax] as [SystemNoGSTItemTax], A0.[ThursdayCloseTime] as [ThursdayCloseTime], A0.[ThursdayOpenTime] as [ThursdayOpenTime], A0.[TimeAdded] as [TimeAdded], A0.[TimeRemoved] as [TimeRemoved], A0.[Title] as [Title], A0.[TransferInCodePrefix] as [TransferInCodePrefix], A0.[TransferOutCodePrefix] as [TransferOutCodePrefix], A0.[TransferOutInvoiceCodePrefix] as [TransferOutInvoiceCodePrefix], A0.[TuesdayCloseTime] as [TuesdayCloseTime], A0.[TuesdayOpenTime] as [TuesdayOpenTime], A0.[Web] as [Web], A0.[WednesdayCloseTime] as [WednesdayCloseTime], A0.[WednesdayOpenTime] as [WednesdayOpenTime] from [dbo].[doBusinessUnit] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doCashier-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doCashier-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[CashDrawerNumber] as [CashDrawerNumber], A0.[EmailAddress] as [EmailAddress], A0.[FirstName] as [FirstName], A0.[FloorLimit] as [FloorLimit], A0.[GroupedDescription] as [GroupedDescription], A0.[LastName] as [LastName], A0.[MaxOverShortAmount] as [MaxOverShortAmount], A0.[MaxOverShortPercent] as [MaxOverShortPercent], A0.[OverShortLimitType] as [OverShortLimitType], A0.[Password] as [Password], A0.[PhoneNumber] as [PhoneNumber], A0.[Privileges] as [Privileges], A0.[ReturnLimit] as [ReturnLimit], A0.[SecurityLevel] as [SecurityLevel], A0.[UserName] as [UserName] from [dbo].[doCashier] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doCategory-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doCategory-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus], A0.[Active] as [Active], A0.[AppCatHQID] as [AppCatHQID], A0.[AppCatHQLastMatched] as [AppCatHQLastMatched], A0.[Code] as [Code], A0.[Department] as [Department], A0.[Markup] as [Markup], A0.[Name] as [Name] from [dbo].[doCategory] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doChargeType-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doChargeType-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[Active] as [Active], A0.[Code] as [Code], A0.[ColorCode] as [ColorCode], A0.[Name] as [Name], A0.[PrivateFee] as [PrivateFee], A0.[PrivateMarkup] as [PrivateMarkup], A0.[SortOrder] as [SortOrder] from [dbo].[doChargeType] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doClaim-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doClaim-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[Amount] as [Amount], A0.[Category] as [Category], A0.[ClaimDate] as [ClaimDate], A0.[ClaimKey] as [ClaimKey], A0.[ClaimNumber] as [ClaimNumber], A0.[ClaimPart] as [ClaimPart], A0.[FormCategory] as [FormCategory], A0.[IsPaid] as [IsPaid], A0.[MedicareFirstName] as [MedicareFirstName], A0.[MedicareLastName] as [MedicareLastName], A0.[MedicareNumber] as [MedicareNumber], A0.[PBSAcceptCode] as [PBSAcceptCode], A0.[PBSAcknowledge] as [PBSAcknowledge], A0.[PBSPayDate] as [PBSPayDate], A0.[PBSPaymentAdjustment] as [PBSPaymentAdjustment], A0.[PBSPaymentAmount] as [PBSPaymentAmount], A0.[PBSPaymentID] as [PBSPaymentID], A0.[PBSProcessingCode] as [PBSProcessingCode], A0.[PBSProcessingCodeHistory] as [PBSProcessingCodeHistory], A0.[PBSReferenceNumber] as [PBSReferenceNumber], A0.[PBSResubmit] as [PBSResubmit], A0.[PayCategory] as [PayCategory], A0.[ProblemReturnCode] as [ProblemReturnCode], A0.[Reference] as [Reference], A0.[ReferencePeriod] as [ReferencePeriod], A0.[ScriptNumber] as [ScriptNumber], A0.[SerialNumber] as [SerialNumber], A0.[Status] as [Status] from [dbo].[doClaim] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doCurrency-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doCurrency-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus], A0.[Code] as [Code], A0.[Description] as [Description], A0.[ExchangeRate] as [ExchangeRate], A0.[LocaleId] as [LocaleId] from [dbo].[doCurrency] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doCustomer-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doCustomer-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[AddressLine1] as [AddressLine1], A0.[AddressLine2] as [AddressLine2], A0.[AddressState] as [AddressState], A0.[City] as [City], A0.[Company] as [Company], A0.[CustomDate1] as [CustomDate1], A0.[CustomDate2] as [CustomDate2], A0.[CustomDate3] as [CustomDate3], A0.[CustomDate4] as [CustomDate4], A0.[CustomDate5] as [CustomDate5], A0.[CustomNumber1] as [CustomNumber1], A0.[CustomNumber2] as [CustomNumber2], A0.[CustomNumber3] as [CustomNumber3], A0.[CustomNumber4] as [CustomNumber4], A0.[CustomNumber5] as [CustomNumber5], A0.[CustomText1] as [CustomText1], A0.[CustomText2] as [CustomText2], A0.[CustomText3] as [CustomText3], A0.[CustomText4] as [CustomText4], A0.[CustomText5] as [CustomText5], A0.[DateOfBirth] as [DateOfBirth], A0.[EmailAddress] as [EmailAddress], A0.[FaxNumber] as [FaxNumber], A0.[FirstName] as [FirstName], A0.[GroupedDescription] as [GroupedDescription], A0.[LastName] as [LastName], A0.[MobileNumber] as [MobileNumber], A0.[PhoneNumber] as [PhoneNumber], A0.[PostCode] as [PostCode], A0.[Remarks] as [Remarks], A0.[Title] as [Title], A0.[Web] as [Web] from [dbo].[doCustomer] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doDataAssistantTemplate-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doDataAssistantTemplate-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[ColumnCount] as [ColumnCount], A0.[DataAssistantType] as [DataAssistantType], A0.[IsActive] as [IsActive], A0.[IsDefault] as [IsDefault], A0.[Name] as [Name], A0.[TemplateXML] as [TemplateXML] from [dbo].[doDataAssistantTemplate] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doDataObject-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doDataObject-View] as 
Select A0.[ID] as [ID], A0.[TypeID] as [TypeID], A0.[VersionID] as [VersionID], A0.[Permissions] as [Permissions], A0.[FastLoadData] as [FastLoadData] from [dbo].[doDataObject] A0 
GO
/****** Object:  View [dbo].[doDepartment-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doDepartment-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus], A0.[Active] as [Active], A0.[AppCatHQID] as [AppCatHQID], A0.[AppCatHQLastMatched] as [AppCatHQLastMatched], A0.[Code] as [Code], A0.[IsOtherCostDepartment] as [IsOtherCostDepartment], A0.[Markup] as [Markup], A0.[Name] as [Name] from [dbo].[doDepartment] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doDimensionAttribute-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doDimensionAttribute-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus], A0.[Attribute] as [Attribute], A0.[Code] as [Code], A0.[Dimension] as [Dimension], A0.[DisplayOrder] as [DisplayOrder], A0.[InActive] as [InActive] from [dbo].[doDimensionAttribute] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doDimension-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doDimension-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus], A0.[Description] as [Description], A0.[InActive] as [InActive], A0.[Name] as [Name] from [dbo].[doDimension] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doDoctor-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doDoctor-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[Address] as [Address], A0.[DoctorCode] as [DoctorCode], A0.[DoctorOnLabel] as [DoctorOnLabel], A0.[Email] as [Email], A0.[FaxNumber] as [FaxNumber], A0.[FirstName] as [FirstName], A0.[GroupedDescription] as [GroupedDescription], A0.[LastName] as [LastName], A0.[MobileNumber] as [MobileNumber], A0.[PhoneNumber] as [PhoneNumber], A0.[PostCode] as [PostCode], A0.[PrescriberNumber] as [PrescriberNumber], A0.[StolenScriptPads] as [StolenScriptPads], A0.[Suburb] as [Suburb] from [dbo].[doDoctor] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doDraftEntry-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doDraftEntry-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[Comment] as [Comment], A0.[Cost] as [Cost], A0.[Draft] as [Draft], A0.[DraftEntrySource] as [DraftEntrySource], A0.[DraftItem] as [DraftItem], A0.[Price] as [Price], A0.[QuantityOrdered] as [QuantityOrdered], A0.[Supplier] as [Supplier], A0.[SupplierItem] as [SupplierItem] from [dbo].[doDraftEntry] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doDraft-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doDraft-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[DraftType] as [DraftType], A0.[Name] as [Name], A0.[Remarks] as [Remarks], A0.[UserAccount] as [UserAccount] from [dbo].[doDraft] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doDropPayout-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doDropPayout-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[Amount] as [Amount], A0.[Batch] as [Batch], A0.[Cashier] as [Cashier], A0.[Comment] as [Comment], A0.[ReasonCode] as [ReasonCode], A0.[Recipient] as [Recipient] from [dbo].[doDropPayout] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doDrug-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doDrug-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[APNCode] as [APNCode], A0.[AustralianRegistrationNumber] as [AustralianRegistrationNumber], A0.[Code] as [Code], A0.[ContractSupplier] as [ContractSupplier], A0.[ContractWholesalePrice] as [ContractWholesalePrice], A0.[DeletedDate] as [DeletedDate], A0.[DifferentNHSCodes] as [DifferentNHSCodes], A0.[DiscountRate] as [DiscountRate], A0.[DrugItem] as [DrugItem], A0.[ExtempIndicator] as [ExtempIndicator], A0.[Form] as [Form], A0.[GSTIncluded] as [GSTIncluded], A0.[GenericCode] as [GenericCode], A0.[GenericName] as [GenericName], A0.[GenericSubstitutionIndicator] as [GenericSubstitutionIndicator], A0.[GroupedDescription] as [GroupedDescription], A0.[HBFCode] as [HBFCode], A0.[InteractionGroup] as [InteractionGroup], A0.[InteractionGroup2] as [InteractionGroup2], A0.[IsUserDrug] as [IsUserDrug], A0.[LabelSize] as [LabelSize], A0.[ManufacturerCode] as [ManufacturerCode], A0.[Name] as [Name], A0.[Notes] as [Notes], A0.[OTCPrice] as [OTCPrice], A0.[OurWholesale] as [OurWholesale], A0.[OwnWarnings] as [OwnWarnings], A0.[PDENumber] as [PDENumber], A0.[PDENumber2] as [PDENumber2], A0.[PackSize] as [PackSize], A0.[PrivateDispensingFeeCategory] as [PrivateDispensingFeeCategory], A0.[PrivateMarkupCategory] as [PrivateMarkupCategory], A0.[PrivatePrice] as [PrivatePrice], A0.[Ranking] as [Ranking], A0.[RecommendedWarningLabels] as [RecommendedWarningLabels], A0.[Schedule] as [Schedule], A0.[Schedule3RPrice] as [Schedule3RPrice], A0.[SearchStrength] as [SearchStrength], A0.[Status] as [Status], A0.[StockGroup] as [StockGroup], A0.[Strength] as [Strength], A0.[SupplierCode] as [SupplierCode], A0.[SupplierCode2] as [SupplierCode2], A0.[UseNHSGeneric] as [UseNHSGeneric], A0.[UserDrugCode] as [UserDrugCode], A0.[WholesalePrice] as [WholesalePrice] from [dbo].[doDrug] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doEmailTemplate-EmailImage-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doEmailTemplate-EmailImage-View] as 
Select A0.[ID] as [ID], A0.[Owner] as [Owner], A0.[ImageBytes] as [ImageBytes], A0.[ImageName] as [ImageName], A0.[MediaContentType] as [MediaContentType] from [dbo].[doEmailTemplate-EmailImage] A0 
GO
/****** Object:  View [dbo].[doEmailTemplate-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doEmailTemplate-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[EmailBodyHtml] as [EmailBodyHtml], A0.[EmailSubject] as [EmailSubject], A0.[IsActive] as [IsActive], A0.[Name] as [Name] from [dbo].[doEmailTemplate] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doFtObject-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doFtObject-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[FtRecordIsUpToDate] as [FtRecordIsUpToDate] from [dbo].[doFtObject] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doFtRecord-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doFtRecord-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[FtData-En] as [FtData-En], A0.[FtObject] as [FtObject], A0.[IsIndexed] as [IsIndexed] from [dbo].[doFtRecord] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doGroup-GroupEntries-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doGroup-GroupEntries-View] as 
Select A0.[ID-1] as [ID-1], A0.[ID-2] as [ID-2] from [dbo].[doGroup-GroupEntries] A0 
GO
/****** Object:  View [dbo].[doGroup-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doGroup-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[Description] as [Description], A0.[GroupType] as [GroupType], A0.[Name] as [Name] from [dbo].[doGroup] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doIAccountOwner-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doIAccountOwner-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AddressLine1] as [AddressLine1], A0.[AddressLine2] as [AddressLine2], A0.[AddressState] as [AddressState], A0.[City] as [City], A0.[Company] as [Company], A0.[EmailAddress] as [EmailAddress], A0.[FaxNumber] as [FaxNumber], A0.[FirstName] as [FirstName], A0.[LastName] as [LastName], A0.[MobileNumber] as [MobileNumber], A0.[PhoneNumber] as [PhoneNumber], A0.[PostCode] as [PostCode], A0.[Title] as [Title], A0.[Web] as [Web] from [dbo].[doNursingHome] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AddressLine1] as [AddressLine1], A0.[AddressLine2] as [AddressLine2], A0.[AddressState] as [AddressState], A0.[City] as [City], A0.[Company] as [Company], A0.[EmailAddress] as [EmailAddress], A0.[FaxNumber] as [FaxNumber], A0.[FirstName] as [FirstName], A0.[LastName] as [LastName], A0.[MobileNumber] as [MobileNumber], A0.[PhoneNumber] as [PhoneNumber], A0.[PostCode] as [PostCode], A0.[Title] as [Title], A0.[Web] as [Web] from [dbo].[doCustomer] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doIAccountTypeOwner-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doIAccountTypeOwner-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AddressLine1] as [AddressLine1], A0.[AddressLine2] as [AddressLine2], A0.[AddressState] as [AddressState], A0.[City] as [City], A0.[Company] as [Company], A0.[EmailAddress] as [EmailAddress], A0.[FaxNumber] as [FaxNumber], A0.[FirstName] as [FirstName], A0.[LastName] as [LastName], A0.[MobileNumber] as [MobileNumber], A0.[PhoneNumber] as [PhoneNumber], A0.[PostCode] as [PostCode], A0.[Title] as [Title], A0.[Web] as [Web] from [dbo].[doNursingHome] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doIAggregate-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doIAggregate-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doAuditAggregateDataObject] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doRapidAuditAggregateDataObject] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doActivity] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doOffer] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doOfferEntry] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doOfferCampaign] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doItemManager] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doItemManagerEntry] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doCurrency] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doDropPayout] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doInvoice] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doInvoiceEntry] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doInvoiceEntryReceive] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doInvoiceOtherCost] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doItemClassification] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doItemPricingHistory] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doPricingReview] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doPricingReviewEntry] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doPurchaseOrder] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doPurchaseOrderEntry] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doRapidRecordStatus] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doItemTax] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doTax] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doSerial] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doKit] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doSubstitute] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doPromotionEntry] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doPromotion] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doItemBase] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doPricingPlan] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doQuantityDiscountScheme] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doTenderDenominations] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doDimensionAttribute] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doMatrixAttributeDisplayOrder] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doDimension] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doItemClassComponent] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doWilliamActivityHistory] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doGroup] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doReturnToSupplierEntry] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doReturnToSupplier] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doClaim] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doChargeType] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doAccountAllocation] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doAccountType] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doBatch] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doReasonCode] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doTenderTotal] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doRegister] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doRateOfUsageDateDefinition] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doWard] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doPharmacist] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doNursingHome] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doDrug] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doDoctor] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doPatient] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doAlias] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doBusinessUnit] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doCashier] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doCategory] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doDepartment] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doAccount] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doTender] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doTenderType] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doCustomer] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doItemMessage] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doItemMovementHistory] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doOrderTemplate] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doRateOfUsageScheme] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doScript] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doSupplier] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doSupplierAccount] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doSupplierItem] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault] from [dbo].[doActivityEntry] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doIAppCat-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doIAppCat-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AppCatHQID] as [AppCatHQID], A0.[AppCatHQLastMatched] as [AppCatHQLastMatched] from [dbo].[doCategory] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AppCatHQID] as [AppCatHQID], A0.[AppCatHQLastMatched] as [AppCatHQLastMatched] from [dbo].[doDepartment] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AppCatHQID] as [AppCatHQID], A0.[AppCatHQLastMatched] as [AppCatHQLastMatched] from [dbo].[doItem] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AppCatHQID] as [AppCatHQID], A0.[AppCatHQLastMatched] as [AppCatHQLastMatched] from [dbo].[doSupplier] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doIDataObject-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doIDataObject-View] as 
Select A0.[ID] as [ID], A0.[TypeID] as [TypeID], A0.[VersionID] as [VersionID], A0.[Permissions] as [Permissions], A0.[FastLoadData] as [FastLoadData] from [dbo].[doDataObject] A0 
GO
/****** Object:  View [dbo].[doIFtObject-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doIFtObject-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[FtRecordIsUpToDate] as [FtRecordIsUpToDate] from [dbo].[doFtObject] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doIGroupable-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doIGroupable-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[GroupedDescription] as [GroupedDescription] from [dbo].[doPharmacist] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[GroupedDescription] as [GroupedDescription] from [dbo].[doNursingHome] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[GroupedDescription] as [GroupedDescription] from [dbo].[doDrug] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[GroupedDescription] as [GroupedDescription] from [dbo].[doDoctor] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[GroupedDescription] as [GroupedDescription] from [dbo].[doPatient] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[GroupedDescription] as [GroupedDescription] from [dbo].[doCashier] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[GroupedDescription] as [GroupedDescription] from [dbo].[doAccount] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[GroupedDescription] as [GroupedDescription] from [dbo].[doCustomer] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[GroupedDescription] as [GroupedDescription] from [dbo].[doItem] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[GroupedDescription] as [GroupedDescription] from [dbo].[doSupplier] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doIHasNoAccessControlList-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doIHasNoAccessControlList-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData] from [dbo].[doFtRecord] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doIImportable-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doIImportable-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A2.[AggregateSource] as [AggregateSource], A2.[Guid] as [Guid], A2.[IsDefault] as [IsDefault], A0.[ImportDescription] as [ImportDescription] from [dbo].[doItem] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  left outer join [dbo].[doItemBase] A2 on A0.[ID]=A2.[ID]
GO
/****** Object:  View [dbo].[doILabelSourceEntry-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doILabelSourceEntry-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData] from [dbo].[doOfferEntry] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData] from [dbo].[doInvoiceEntryReceive] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData] from [dbo].[doPricingReviewEntry] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData] from [dbo].[doPromotionEntry] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doILabelSource-LabelQueues-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doILabelSource-LabelQueues-View] as 
Select A0.[Source] as [ID-1], A0.[ID] as [ID-2] from [dbo].[doLabelQueue] A0 
GO
/****** Object:  View [dbo].[doILabelSource-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doILabelSource-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData] from [dbo].[doOffer] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData] from [dbo].[doInvoice] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData] from [dbo].[doPricingReview] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData] from [dbo].[doPromotion] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doIMailingAddress-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doIMailingAddress-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AddressLine1] as [AddressLine1], A0.[AddressLine2] as [AddressLine2], A0.[AddressState] as [AddressState], A0.[City] as [City], A0.[Company] as [Company], A0.[EmailAddress] as [EmailAddress], A0.[FaxNumber] as [FaxNumber], A0.[FirstName] as [FirstName], A0.[LastName] as [LastName], A0.[MobileNumber] as [MobileNumber], A0.[PhoneNumber] as [PhoneNumber], A0.[PostCode] as [PostCode], A0.[Title] as [Title], A0.[Web] as [Web] from [dbo].[doNursingHome] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AddressLine1] as [AddressLine1], A0.[AddressLine2] as [AddressLine2], A0.[AddressState] as [AddressState], A0.[City] as [City], A0.[Company] as [Company], A0.[EmailAddress] as [EmailAddress], A0.[FaxNumber] as [FaxNumber], A0.[FirstName] as [FirstName], A0.[LastName] as [LastName], A0.[MobileNumber] as [MobileNumber], A0.[PhoneNumber] as [PhoneNumber], A0.[PostCode] as [PostCode], A0.[Title] as [Title], A0.[Web] as [Web] from [dbo].[doBusinessUnit] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AddressLine1] as [AddressLine1], A0.[AddressLine2] as [AddressLine2], A0.[AddressState] as [AddressState], A0.[City] as [City], A0.[Company] as [Company], A0.[EmailAddress] as [EmailAddress], A0.[FaxNumber] as [FaxNumber], A0.[FirstName] as [FirstName], A0.[LastName] as [LastName], A0.[MobileNumber] as [MobileNumber], A0.[PhoneNumber] as [PhoneNumber], A0.[PostCode] as [PostCode], A0.[Title] as [Title], A0.[Web] as [Web] from [dbo].[doAccount] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AddressLine1] as [AddressLine1], A0.[AddressLine2] as [AddressLine2], A0.[AddressState] as [AddressState], A0.[City] as [City], A0.[Company] as [Company], A0.[EmailAddress] as [EmailAddress], A0.[FaxNumber] as [FaxNumber], A0.[FirstName] as [FirstName], A0.[LastName] as [LastName], A0.[MobileNumber] as [MobileNumber], A0.[PhoneNumber] as [PhoneNumber], A0.[PostCode] as [PostCode], A0.[Title] as [Title], A0.[Web] as [Web] from [dbo].[doUserAccount] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AddressLine1] as [AddressLine1], A0.[AddressLine2] as [AddressLine2], A0.[AddressState] as [AddressState], A0.[City] as [City], A0.[Company] as [Company], A0.[EmailAddress] as [EmailAddress], A0.[FaxNumber] as [FaxNumber], A0.[FirstName] as [FirstName], A0.[LastName] as [LastName], A0.[MobileNumber] as [MobileNumber], A0.[PhoneNumber] as [PhoneNumber], A0.[PostCode] as [PostCode], A0.[Title] as [Title], A0.[Web] as [Web] from [dbo].[doCustomer] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[AddressLine1] as [AddressLine1], A0.[AddressLine2] as [AddressLine2], A0.[AddressState] as [AddressState], A0.[City] as [City], A0.[Company] as [Company], A0.[EmailAddress] as [EmailAddress], A0.[FaxNumber] as [FaxNumber], A0.[FirstName] as [FirstName], A0.[LastName] as [LastName], A0.[MobileNumber] as [MobileNumber], A0.[PhoneNumber] as [PhoneNumber], A0.[PostCode] as [PostCode], A0.[Title] as [Title], A0.[Web] as [Web] from [dbo].[doSupplier] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doInvoiceEntryReceive-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doInvoiceEntryReceive-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus], A0.[InvoiceEntry] as [InvoiceEntry], A0.[PurchaseOrderEntry] as [PurchaseOrderEntry], A0.[QuantityInvoiced] as [QuantityInvoiced], A0.[QuantityOutOfStock] as [QuantityOutOfStock], A0.[QuantityReceived] as [QuantityReceived], A0.[QuantityReturnForCredit] as [QuantityReturnForCredit] from [dbo].[doInvoiceEntryReceive] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doInvoiceEntry-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doInvoiceEntry-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus], A0.[Class] as [Class], A0.[DiscountIncGst] as [DiscountIncGst], A0.[Ean] as [Ean], A0.[ExtSupplierCostTax] as [ExtSupplierCostTax], A0.[ExtendedForeignCost] as [ExtendedForeignCost], A0.[ForeignCost] as [ForeignCost], A0.[GatewayResponse] as [GatewayResponse], A0.[Invoice] as [Invoice], A0.[InvoicedItem] as [InvoicedItem], A0.[ItemDescription] as [ItemDescription], A0.[ItemTax] as [ItemTax], A0.[Manufacturer] as [Manufacturer], A0.[NetInStoreCost] as [NetInStoreCost], A0.[NormalCostExGst] as [NormalCostExGst], A0.[NormalCostGst] as [NormalCostGst], A0.[NormalCostIncGst] as [NormalCostIncGst], A0.[OrderedQuantity] as [OrderedQuantity], A0.[OriginalQuantityOrdered] as [OriginalQuantityOrdered], A0.[PacksBackordered] as [PacksBackordered], A0.[PacksOrdered] as [PacksOrdered], A0.[PacksOutOfStock] as [PacksOutOfStock], A0.[PacksSupplied] as [PacksSupplied], A0.[QuantityInvoiced] as [QuantityInvoiced], A0.[QuantityOutOfStock] as [QuantityOutOfStock], A0.[QuantityReceived] as [QuantityReceived], A0.[QuantityReturnForCredit] as [QuantityReturnForCredit], A0.[QuantityScanned] as [QuantityScanned], A0.[Reference] as [Reference], A0.[ReorderNumber] as [ReorderNumber], A0.[RetailPrice] as [RetailPrice], A0.[SupplierCost] as [SupplierCost], A0.[SupplierCostTax] as [SupplierCostTax], A0.[SurchargeIncGst] as [SurchargeIncGst], A0.[Tote] as [Tote], A0.[Tun] as [Tun], A0.[Warehouse] as [Warehouse] from [dbo].[doInvoiceEntry] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doInvoiceOtherCost-PurchaseOrderEntries-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doInvoiceOtherCost-PurchaseOrderEntries-View] as 
Select A0.[ID-1] as [ID-1], A0.[ID-2] as [ID-2] from [dbo].[doInvoiceOtherCost-PurchaseOrderEntries] A0 
GO
/****** Object:  View [dbo].[doInvoiceOtherCost-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doInvoiceOtherCost-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus], A0.[Amount] as [Amount], A0.[Code] as [Code], A0.[Description] as [Description], A0.[DistributeToAll] as [DistributeToAll], A0.[Invoice] as [Invoice], A0.[ItemTax] as [ItemTax], A0.[Tax] as [Tax] from [dbo].[doInvoiceOtherCost] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doInvoice-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doInvoice-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus], A0.[ActualInvoiceValue] as [ActualInvoiceValue], A0.[Currency] as [Currency], A0.[DeliverAfter] as [DeliverAfter], A0.[DeliverBefore] as [DeliverBefore], A0.[DriverName] as [DriverName], A0.[ExchangeRate] as [ExchangeRate], A0.[ExpectedDate] as [ExpectedDate], A0.[ExpectedInvoiceValue] as [ExpectedInvoiceValue], A0.[ForceExpectedInvoiceValueUpdate] as [ForceExpectedInvoiceValueUpdate], A0.[HasOrder] as [HasOrder], A0.[InvoiceDate] as [InvoiceDate], A0.[InvoiceEntryLastModified] as [InvoiceEntryLastModified], A0.[InvoiceGatewayID] as [InvoiceGatewayID], A0.[InvoiceNumber] as [InvoiceNumber], A0.[InvoiceType] as [InvoiceType], A0.[IsAboveVariationLimit] as [IsAboveVariationLimit], A0.[IsApproved] as [IsApproved], A0.[IsClosed] as [IsClosed], A0.[PurchaseOrderGatewayID] as [PurchaseOrderGatewayID], A0.[ReceivedBy] as [ReceivedBy], A0.[Supplier] as [Supplier], A0.[TransferActivity] as [TransferActivity], A0.[TransferReference] as [TransferReference], A0.[Variation] as [Variation] from [dbo].[doInvoice] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doIRapid-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doIRapid-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doRapidAuditAggregateDataObject] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doActivity] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doCurrency] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doInvoice] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doInvoiceEntry] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doInvoiceEntryReceive] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doInvoiceOtherCost] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doItemClassification] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doPricingReview] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doPricingReviewEntry] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doPurchaseOrder] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doPurchaseOrderEntry] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doItemTax] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doTax] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doSubstitute] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doPromotionEntry] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doPromotion] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doItemBase] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doQuantityDiscountScheme] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doDimensionAttribute] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doMatrixAttributeDisplayOrder] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doDimension] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doItemClassComponent] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doBatch] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doRegister] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doAlias] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doBusinessUnit] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doCategory] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doDepartment] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doItemMessage] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doItemMovementHistory] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doSupplier] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doSupplierItem] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doISecurityRoot-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doISecurityRoot-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData] from [dbo].[doSecurityRoot] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doItemBase-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doItemBase-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus], A0.[AutoOrder] as [AutoOrder], A0.[AutoOrderEndDate] as [AutoOrderEndDate], A0.[AutoOrderStartDate] as [AutoOrderStartDate], A0.[Category] as [Category], A0.[Code] as [Code], A0.[Cost] as [Cost], A0.[DefaultSupplier] as [DefaultSupplier], A0.[Department] as [Department], A0.[Description] as [Description], A0.[DoNotOrder] as [DoNotOrder], A0.[InActive] as [InActive], A0.[IsTester] as [IsTester], A0.[ItemClassification] as [ItemClassification], A0.[ItemLocation] as [ItemLocation], A0.[ItemMessage] as [ItemMessage], A0.[ItemTax] as [ItemTax], A0.[ItemType] as [ItemType], A0.[LastOrdered] as [LastOrdered], A0.[LastReceived] as [LastReceived], A0.[LastSoldDate] as [LastSoldDate], A0.[LowerBound] as [LowerBound], A0.[Manufacturer] as [Manufacturer], A0.[Merged] as [Merged], A0.[Moved] as [Moved], A0.[OutOfStock] as [OutOfStock], A0.[PreferredSupplier] as [PreferredSupplier], A0.[Price] as [Price], A0.[PricingPlan] as [PricingPlan], A0.[ProductStatus] as [ProductStatus], A0.[PurchaseTax] as [PurchaseTax], A0.[QuantityCommitted] as [QuantityCommitted], A0.[QuantityOnDraft] as [QuantityOnDraft], A0.[QuantityOnHand] as [QuantityOnHand], A0.[QuantityOnOrder] as [QuantityOnOrder], A0.[QuantityOnReturnForCredit] as [QuantityOnReturnForCredit], A0.[QuantityOnTransferIn] as [QuantityOnTransferIn], A0.[QuantityOnTransferOut] as [QuantityOnTransferOut], A0.[ReorderPoint] as [ReorderPoint], A0.[RestockLevel] as [RestockLevel], A0.[SubCategory] as [SubCategory], A0.[Tax] as [Tax], A0.[UpperBound] as [UpperBound] from [dbo].[doItemBase] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doItemClassComponent-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doItemClassComponent-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus], A0.[Active] as [Active], A0.[Detail1] as [Detail1], A0.[Detail2] as [Detail2], A0.[Detail3] as [Detail3], A0.[ItemClass] as [ItemClass], A0.[ItemComponent] as [ItemComponent], A0.[Price] as [Price], A0.[Quantity] as [Quantity] from [dbo].[doItemClassComponent] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doItemClassification-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doItemClassification-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus], A0.[Code] as [Code], A0.[DefaultClassification] as [DefaultClassification], A0.[Name] as [Name] from [dbo].[doItemClassification] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doItemCodeScheme-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doItemCodeScheme-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[IsDefaultScheme] as [IsDefaultScheme], A0.[Name] as [Name], A0.[Prefix] as [Prefix], A0.[PrefixSeparator] as [PrefixSeparator], A0.[Suffix] as [Suffix], A0.[SuffixSeparator] as [SuffixSeparator] from [dbo].[doItemCodeScheme] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doItem-ItemUsage-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doItem-ItemUsage-View] as 
Select A0.[ID] as [ID], A0.[ActivityCount] as [ActivityCount], A0.[GovernmentRecovery] as [GovernmentRecovery], A0.[ItemUsed] as [ItemUsed], A0.[MaxPrice] as [MaxPrice], A0.[MinPrice] as [MinPrice], A0.[Month] as [Month], A0.[TotalCost] as [TotalCost], A0.[TotalDiscounts] as [TotalDiscounts], A0.[TotalPrice] as [TotalPrice], A0.[TotalProfit] as [TotalProfit], A0.[TotalQuantity] as [TotalQuantity], A0.[TotalSalesTax] as [TotalSalesTax], A0.[Year] as [Year] from [dbo].[doItem-ItemUsage] A0 
GO
/****** Object:  View [dbo].[doItemManagerEntry-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doItemManagerEntry-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[AutoCalcPriceLevel] as [AutoCalcPriceLevel], A0.[Category] as [Category], A0.[Cost] as [Cost], A0.[Department] as [Department], A0.[Description] as [Description], A0.[Detail1] as [Detail1], A0.[Detail2] as [Detail2], A0.[Detail3] as [Detail3], A0.[DoNotOrder] as [DoNotOrder], A0.[ExtendedDescription] as [ExtendedDescription], A0.[HideOnNetDisplay] as [HideOnNetDisplay], A0.[InActive] as [InActive], A0.[Item] as [Item], A0.[ItemLocation] as [ItemLocation], A0.[ItemManager] as [ItemManager], A0.[ItemNotDiscountable] as [ItemNotDiscountable], A0.[ItemTax] as [ItemTax], A0.[Price] as [Price], A0.[PriceLevelA] as [PriceLevelA], A0.[PriceLevelB] as [PriceLevelB], A0.[PriceLevelC] as [PriceLevelC], A0.[PriceMustBeEntered] as [PriceMustBeEntered], A0.[ROUScheme] as [ROUScheme], A0.[ReCalcROPRestockLvlFromROU] as [ReCalcROPRestockLvlFromROU], A0.[ReorderPoint] as [ReorderPoint], A0.[RestockLevel] as [RestockLevel] from [dbo].[doItemManagerEntry] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doItemManager-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doItemManager-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[CommittedBy] as [CommittedBy], A0.[CommittedDate] as [CommittedDate], A0.[Description] as [Description], A0.[Name] as [Name] from [dbo].[doItemManager] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doItemMergeQueue-SupplierItems-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doItemMergeQueue-SupplierItems-View] as 
Select A0.[ID] as [ID], A0.[Owner] as [Owner], A0.[SupplierItemIdKeep] as [SupplierItemIdKeep], A0.[SupplierItemIdRemove] as [SupplierItemIdRemove] from [dbo].[doItemMergeQueue-SupplierItems] A0 
GO
/****** Object:  View [dbo].[doItemMergeQueue-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doItemMergeQueue-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AliasMergeState] as [AliasMergeState], A0.[DestinationItemID] as [DestinationItemID], A0.[IsComplete] as [IsComplete], A0.[KeepSourceDetails] as [KeepSourceDetails], A0.[KeepSourcePrices] as [KeepSourcePrices], A0.[MergeCounter] as [MergeCounter], A0.[MoveHistory] as [MoveHistory], A0.[Remarks] as [Remarks], A0.[SourceItemID] as [SourceItemID], A0.[StockMergeState] as [StockMergeState] from [dbo].[doItemMergeQueue] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doItemMessage-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doItemMessage-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus], A0.[AgeLimit] as [AgeLimit], A0.[Code] as [Code], A0.[Message] as [Message] from [dbo].[doItemMessage] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doItemMovementHistory-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doItemMovementHistory-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus], A0.[AdjustmentQuantity] as [AdjustmentQuantity], A0.[AfterQuantity] as [AfterQuantity], A0.[Cost] as [Cost], A0.[Date] as [Date], A0.[Historical] as [Historical], A0.[ItemUsed] as [ItemUsed], A0.[MovementSource] as [MovementSource], A0.[MovementType] as [MovementType], A0.[Reason] as [Reason], A0.[Remarks] as [Remarks], A0.[Retail] as [Retail] from [dbo].[doItemMovementHistory] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doItemPricingHistory-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doItemPricingHistory-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[AfterCost] as [AfterCost], A0.[AfterPrice] as [AfterPrice], A0.[BeforeCost] as [BeforeCost], A0.[BeforePrice] as [BeforePrice], A0.[Date] as [Date], A0.[ItemUsed] as [ItemUsed], A0.[Message] as [Message], A0.[SourceName] as [SourceName] from [dbo].[doItemPricingHistory] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doItemTax-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doItemTax-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus], A0.[Active] as [Active], A0.[Code] as [Code], A0.[Description] as [Description], A0.[Options] as [Options], A0.[ShowOnReceipt01] as [ShowOnReceipt01], A0.[ShowOnReceipt02] as [ShowOnReceipt02], A0.[ShowOnReceipt03] as [ShowOnReceipt03], A0.[ShowOnReceipt04] as [ShowOnReceipt04], A0.[ShowOnReceipt05] as [ShowOnReceipt05], A0.[ShowOnReceipt06] as [ShowOnReceipt06], A0.[ShowOnReceipt07] as [ShowOnReceipt07], A0.[ShowOnReceipt08] as [ShowOnReceipt08], A0.[ShowOnReceipt09] as [ShowOnReceipt09], A0.[ShowOnReceipt10] as [ShowOnReceipt10], A0.[Tax01] as [Tax01], A0.[Tax02] as [Tax02], A0.[Tax03] as [Tax03], A0.[Tax04] as [Tax04], A0.[Tax05] as [Tax05], A0.[Tax06] as [Tax06], A0.[Tax07] as [Tax07], A0.[Tax08] as [Tax08], A0.[Tax09] as [Tax09], A0.[Tax10] as [Tax10] from [dbo].[doItemTax] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doItem-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doItem-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A2.[Created] as [Created], A2.[Modified] as [Modified], A2.[AggregateSource] as [AggregateSource], A2.[Guid] as [Guid], A2.[IsDefault] as [IsDefault], A2.[IBHeaderGuid] as [IBHeaderGuid], A2.[RapidObjectGuid] as [RapidObjectGuid], A2.[RapidSyncRequired] as [RapidSyncRequired], A2.[RecordStatus] as [RecordStatus], A2.[AutoOrder] as [AutoOrder], A2.[AutoOrderEndDate] as [AutoOrderEndDate], A2.[AutoOrderStartDate] as [AutoOrderStartDate], A2.[Category] as [Category], A2.[Code] as [Code], A2.[Cost] as [Cost], A2.[DefaultSupplier] as [DefaultSupplier], A2.[Department] as [Department], A2.[Description] as [Description], A2.[DoNotOrder] as [DoNotOrder], A2.[InActive] as [InActive], A2.[IsTester] as [IsTester], A2.[ItemClassification] as [ItemClassification], A2.[ItemLocation] as [ItemLocation], A2.[ItemMessage] as [ItemMessage], A2.[ItemTax] as [ItemTax], A2.[ItemType] as [ItemType], A2.[LastOrdered] as [LastOrdered], A2.[LastReceived] as [LastReceived], A2.[LastSoldDate] as [LastSoldDate], A2.[LowerBound] as [LowerBound], A2.[Manufacturer] as [Manufacturer], A2.[Merged] as [Merged], A2.[Moved] as [Moved], A2.[OutOfStock] as [OutOfStock], A2.[PreferredSupplier] as [PreferredSupplier], A2.[Price] as [Price], A2.[PricingPlan] as [PricingPlan], A2.[ProductStatus] as [ProductStatus], A2.[PurchaseTax] as [PurchaseTax], A2.[QuantityCommitted] as [QuantityCommitted], A2.[QuantityOnDraft] as [QuantityOnDraft], A2.[QuantityOnHand] as [QuantityOnHand], A2.[QuantityOnOrder] as [QuantityOnOrder], A2.[QuantityOnReturnForCredit] as [QuantityOnReturnForCredit], A2.[QuantityOnTransferIn] as [QuantityOnTransferIn], A2.[QuantityOnTransferOut] as [QuantityOnTransferOut], A2.[ReorderPoint] as [ReorderPoint], A2.[RestockLevel] as [RestockLevel], A2.[SubCategory] as [SubCategory], A2.[Tax] as [Tax], A2.[UpperBound] as [UpperBound], A0.[ActivePromotionEntry] as [ActivePromotionEntry], A0.[AppCatHQID] as [AppCatHQID], A0.[AppCatHQLastMatched] as [AppCatHQLastMatched], A0.[AutoCalcPriceLevel] as [AutoCalcPriceLevel], A0.[BarcodeFormat] as [BarcodeFormat], A0.[BlockSalesAfterDate] as [BlockSalesAfterDate], A0.[BlockSalesBeforeDate] as [BlockSalesBeforeDate], A0.[BlockSalesReason] as [BlockSalesReason], A0.[BlockSalesType] as [BlockSalesType], A0.[BuydownPrice] as [BuydownPrice], A0.[BuydownQuantity] as [BuydownQuantity], A0.[CatalogueReferenceID] as [CatalogueReferenceID], A0.[CommissionAmount] as [CommissionAmount], A0.[CommissionMaximum] as [CommissionMaximum], A0.[CommissionMode] as [CommissionMode], A0.[CommissionPercentProfit] as [CommissionPercentProfit], A0.[CommissionPercentSale] as [CommissionPercentSale], A0.[Consignment] as [Consignment], A0.[Content] as [Content], A0.[Detail1] as [Detail1], A0.[Detail2] as [Detail2], A0.[Detail3] as [Detail3], A0.[Dimension1] as [Dimension1], A0.[Dimension2] as [Dimension2], A0.[Dimension3] as [Dimension3], A0.[Dimensions] as [Dimensions], A0.[DontCalculateROUValue] as [DontCalculateROUValue], A0.[ExcludedFromLoyalty] as [ExcludedFromLoyalty], A0.[ExtendedDescription] as [ExtendedDescription], A0.[FixedPrice] as [FixedPrice], A0.[FoodStampable] as [FoodStampable], A0.[ForeignCost] as [ForeignCost], A0.[GroupedDescription] as [GroupedDescription], A0.[HideOnNetDisplay] as [HideOnNetDisplay], A0.[ImportDescription] as [ImportDescription], A0.[ItemAddedDate] as [ItemAddedDate], A0.[ItemNotDiscountable] as [ItemNotDiscountable], A0.[LabelTemplate] as [LabelTemplate], A0.[LastCost] as [LastCost], A0.[LastCounted] as [LastCounted], A0.[LastStockCount] as [LastStockCount], A0.[MSRP] as [MSRP], A0.[ParentItem] as [ParentItem], A0.[ParentQuantity] as [ParentQuantity], A0.[PictureName] as [PictureName], A0.[PriceLevelA] as [PriceLevelA], A0.[PriceLevelB] as [PriceLevelB], A0.[PriceLevelC] as [PriceLevelC], A0.[PriceMustBeEntered] as [PriceMustBeEntered], A0.[PriceType] as [PriceType], A0.[PricingPolicy] as [PricingPolicy], A0.[QuantityDiscountScheme] as [QuantityDiscountScheme], A0.[QuantityEntryNotAllowed] as [QuantityEntryNotAllowed], A0.[ROULastUpdated] as [ROULastUpdated], A0.[ROUScheme] as [ROUScheme], A0.[ROUValue] as [ROUValue], A0.[ReCalcROPRestockLvlFromROU] as [ReCalcROPRestockLvlFromROU], A0.[RebateAmount] as [RebateAmount], A0.[Remarks] as [Remarks], A0.[ReplacementCost] as [ReplacementCost], A0.[SaleEndDate] as [SaleEndDate], A0.[SalePrice] as [SalePrice], A0.[SaleStartDate] as [SaleStartDate], A0.[SaleType] as [SaleType], A0.[SerialNumberCount] as [SerialNumberCount], A0.[TagAlongItem] as [TagAlongItem], A0.[TagAlongQuantity] as [TagAlongQuantity], A0.[TareWeight] as [TareWeight], A0.[TareWeightPercent] as [TareWeightPercent], A0.[Taxable] as [Taxable], A0.[Title1] as [Title1], A0.[Title2] as [Title2], A0.[Title3] as [Title3], A0.[TransferAvailable] as [TransferAvailable], A0.[TransferOutMinOrder] as [TransferOutMinOrder], A0.[TransferOutPackQuantity] as [TransferOutPackQuantity], A0.[UnitOfMeasure] as [UnitOfMeasure], A0.[UseComponentCost] as [UseComponentCost], A0.[UseComponentPrice] as [UseComponentPrice], A0.[UsuallyShip] as [UsuallyShip], A0.[WebItem] as [WebItem], A0.[Weighed] as [Weighed], A0.[Weight] as [Weight] from [dbo].[doItem] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  left outer join [dbo].[doItemBase] A2 on A0.[ID]=A2.[ID]
GO
/****** Object:  View [dbo].[doIValidationStartCallback-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doIValidationStartCallback-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A0.[VersionID] as [VersionID], A0.[Permissions] as [Permissions], A0.[FastLoadData] as [FastLoadData] from [dbo].[doIValidationStartCallback] A0 
  left outer join [dbo].[doIDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doKit-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doKit-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[ComponentItem] as [ComponentItem], A0.[KitItem] as [KitItem], A0.[Quantity] as [Quantity] from [dbo].[doKit] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doLabelElement-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doLabelElement-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[BarCodeDisplayText] as [BarCodeDisplayText], A0.[FontBold] as [FontBold], A0.[FontSize] as [FontSize], A0.[IsBarCode] as [IsBarCode], A0.[IsMoneyFormat] as [IsMoneyFormat], A0.[ItemPropertyName] as [ItemPropertyName], A0.[LineText] as [LineText], A0.[RowHeight] as [RowHeight], A0.[RowWidth] as [RowWidth], A0.[RowXPosition] as [RowXPosition], A0.[RowYPosition] as [RowYPosition], A0.[TextAlignment] as [TextAlignment] from [dbo].[doLabelElement] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doLabelPrinting-LabelElements-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doLabelPrinting-LabelElements-View] as 
Select A0.[ID-1] as [ID-1], A0.[ID-2] as [ID-2] from [dbo].[doLabelPrinting-LabelElements] A0 
GO
/****** Object:  View [dbo].[doLabelPrinting-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doLabelPrinting-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[Editable] as [Editable], A0.[IsActive] as [IsActive], A0.[LabelType] as [LabelType], A0.[Name] as [Name], A0.[PrintWaitingTimeout] as [PrintWaitingTimeout], A0.[PrinterName] as [PrinterName], A0.[QuantityType] as [QuantityType], A0.[TemplateName] as [TemplateName], A0.[TemplateType] as [TemplateType] from [dbo].[doLabelPrinting] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doLabelQueue-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doLabelQueue-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[CreatedDate] as [CreatedDate], A0.[Description] as [Description], A0.[DeviceID] as [DeviceID], A0.[EffectiveDate] as [EffectiveDate], A0.[Item] as [Item], A0.[LabelTemplate] as [LabelTemplate], A0.[Price] as [Price], A0.[PrintDate] as [PrintDate], A0.[PrintError] as [PrintError], A0.[Quantity] as [Quantity], A0.[QuantityType] as [QuantityType], A0.[Source] as [Source], A0.[SourceType] as [SourceType] from [dbo].[doLabelQueue] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doMatrixAttributeDisplayOrder-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doMatrixAttributeDisplayOrder-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus], A0.[Attribute] as [Attribute], A0.[Code] as [Code], A0.[Dimension] as [Dimension], A0.[DimensionAttribute] as [DimensionAttribute], A0.[DimensionName] as [DimensionName], A0.[DimensionOrder] as [DimensionOrder], A0.[DisplayOrder] as [DisplayOrder], A0.[InActive] as [InActive], A0.[ItemClass] as [ItemClass] from [dbo].[doMatrixAttributeDisplayOrder] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doNameValuePair-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doNameValuePair-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[Name] as [Name], A0.[Value] as [Value] from [dbo].[doNameValuePair] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doNursingHome-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doNursingHome-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[AccountCategory] as [AccountCategory], A0.[AddressLine1] as [AddressLine1], A0.[AddressLine2] as [AddressLine2], A0.[AddressState] as [AddressState], A0.[AlternateAddress] as [AlternateAddress], A0.[AlternateSuburb] as [AlternateSuburb], A0.[AutoCreateAccount] as [AutoCreateAccount], A0.[AutoCreateNursingHomeAccount] as [AutoCreateNursingHomeAccount], A0.[AutoCreatePatientAccount] as [AutoCreatePatientAccount], A0.[AutomaticallyPrintInvoice] as [AutomaticallyPrintInvoice], A0.[City] as [City], A0.[Code] as [Code], A0.[Company] as [Company], A0.[DefaultPrivateFee] as [DefaultPrivateFee], A0.[DefaultPrivateMarkup] as [DefaultPrivateMarkup], A0.[DefaultScriptType] as [DefaultScriptType], A0.[EmailAddress] as [EmailAddress], A0.[EndServicingDate] as [EndServicingDate], A0.[ExcludeRequired] as [ExcludeRequired], A0.[FaxNumber] as [FaxNumber], A0.[FirstName] as [FirstName], A0.[GSTIncluded] as [GSTIncluded], A0.[GroupedDescription] as [GroupedDescription], A0.[IsANursingHome] as [IsANursingHome], A0.[LastName] as [LastName], A0.[MobileNumber] as [MobileNumber], A0.[PackOldFormat] as [PackOldFormat], A0.[PackRequiresPrn] as [PackRequiresPrn], A0.[PackSigningRequired] as [PackSigningRequired], A0.[PackSlot] as [PackSlot], A0.[PackTimeSlot1] as [PackTimeSlot1], A0.[PackTimeSlot2] as [PackTimeSlot2], A0.[PackTimeSlot3] as [PackTimeSlot3], A0.[PackTimeSlot4] as [PackTimeSlot4], A0.[PackTimeSlot5] as [PackTimeSlot5], A0.[PackTimeSlot6] as [PackTimeSlot6], A0.[PackTimeSlot7] as [PackTimeSlot7], A0.[PackTimeSlot8] as [PackTimeSlot8], A0.[PackToDate] as [PackToDate], A0.[PackUnitDose] as [PackUnitDose], A0.[PackWebsterSystem] as [PackWebsterSystem], A0.[PackingStartOfWeek] as [PackingStartOfWeek], A0.[PackingType] as [PackingType], A0.[PhoneNumber] as [PhoneNumber], A0.[PostCode] as [PostCode], A0.[ReminderNotice] as [ReminderNotice], A0.[RepatToSafetyNet] as [RepatToSafetyNet], A0.[StartServicingDate] as [StartServicingDate], A0.[Title] as [Title], A0.[UseNursingHomeAddress] as [UseNursingHomeAddress], A0.[Web] as [Web] from [dbo].[doNursingHome] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doOfferCampaign-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doOfferCampaign-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[Code] as [Code], A0.[Description] as [Description], A0.[Name] as [Name], A0.[Source] as [Source] from [dbo].[doOfferCampaign] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doOfferEntry-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doOfferEntry-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[BuyDownQuantity] as [BuyDownQuantity], A0.[Cost] as [Cost], A0.[IsDiscountItem] as [IsDiscountItem], A0.[IsQualifyingItem] as [IsQualifyingItem], A0.[Offer] as [Offer], A0.[OfferItem] as [OfferItem], A0.[Price] as [Price], A0.[SourceItem] as [SourceItem], A0.[SourcePrice] as [SourcePrice] from [dbo].[doOfferEntry] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doOffer-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doOffer-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[Campaign] as [Campaign], A0.[Code] as [Code], A0.[Description] as [Description], A0.[DivideDiscount] as [DivideDiscount], A0.[DollarOffDiscount] as [DollarOffDiscount], A0.[DollarThreshold] as [DollarThreshold], A0.[EndDate] as [EndDate], A0.[IsDiscountable] as [IsDiscountable], A0.[IsLoyalty] as [IsLoyalty], A0.[MultiBuyXQuantity] as [MultiBuyXQuantity], A0.[MultiBuyYDollarAmount] as [MultiBuyYDollarAmount], A0.[MultiBuyYQuantity] as [MultiBuyYQuantity], A0.[MultipleRedemptions] as [MultipleRedemptions], A0.[Name] as [Name], A0.[OfferCategory] as [OfferCategory], A0.[OfferType] as [OfferType], A0.[PercentOffDiscount] as [PercentOffDiscount], A0.[Priority] as [Priority], A0.[QuantityThreshold] as [QuantityThreshold], A0.[StartDate] as [StartDate] from [dbo].[doOffer] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doOrderTemplate-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doOrderTemplate-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[Name] as [Name], A0.[TemplateXml] as [TemplateXml] from [dbo].[doOrderTemplate] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doOutOfStockItem-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doOutOfStockItem-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[Item] as [Item], A0.[LastOOSQuantity] as [LastOOSQuantity], A0.[LastSupplier] as [LastSupplier], A0.[OrderCount] as [OrderCount], A0.[PurchaseOrder] as [PurchaseOrder], A0.[Reason] as [Reason] from [dbo].[doOutOfStockItem] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doPatient-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doPatient-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[AccountNumber] as [AccountNumber], A0.[AccountType] as [AccountType], A0.[Address] as [Address], A0.[AdmissionNumber] as [AdmissionNumber], A0.[Allergies] as [Allergies], A0.[ApplyGST] as [ApplyGST], A0.[AutoChargeAccount] as [AutoChargeAccount], A0.[AutomaticReceiptPrinting] as [AutomaticReceiptPrinting], A0.[BirthDate] as [BirthDate], A0.[ConcessionExpiryDate] as [ConcessionExpiryDate], A0.[ConcessionNumber] as [ConcessionNumber], A0.[ConcessionType] as [ConcessionType], A0.[Customer] as [Customer], A0.[Email] as [Email], A0.[FamilyCode] as [FamilyCode], A0.[FamilyIndicator] as [FamilyIndicator], A0.[FirstName] as [FirstName], A0.[Gender] as [Gender], A0.[GenericOnly] as [GenericOnly], A0.[GroupedDescription] as [GroupedDescription], A0.[HealthFundIdentifaction] as [HealthFundIdentifaction], A0.[HealthFundLevelOfCover] as [HealthFundLevelOfCover], A0.[HealthFundMemberNumber] as [HealthFundMemberNumber], A0.[InsuranceValidToDate] as [InsuranceValidToDate], A0.[IsDiscount] as [IsDiscount], A0.[IsDoctor] as [IsDoctor], A0.[LastName] as [LastName], A0.[MailCategory] as [MailCategory], A0.[MedicareConsent] as [MedicareConsent], A0.[MedicareExpiryDate] as [MedicareExpiryDate], A0.[MedicareNumber] as [MedicareNumber], A0.[Notes] as [Notes], A0.[NursingHome] as [NursingHome], A0.[NursingHomeBedNumber] as [NursingHomeBedNumber], A0.[NursingHomeCode] as [NursingHomeCode], A0.[NursingHomeRoomNumber] as [NursingHomeRoomNumber], A0.[NursingHomeURNumber] as [NursingHomeURNumber], A0.[NursingHomeWardNumber] as [NursingHomeWardNumber], A0.[OutSideScriptAmount] as [OutSideScriptAmount], A0.[OutSideScriptCount] as [OutSideScriptCount], A0.[OwesScript] as [OwesScript], A0.[PatientNumber] as [PatientNumber], A0.[PatientStatus] as [PatientStatus], A0.[PatientType] as [PatientType], A0.[PhoneNumber] as [PhoneNumber], A0.[PostCode] as [PostCode], A0.[PrivateFeeMarkUp] as [PrivateFeeMarkUp], A0.[RepatCardColour] as [RepatCardColour], A0.[RepatNumber] as [RepatNumber], A0.[RepeatsOnFile] as [RepeatsOnFile], A0.[SafetyNetScriptAmount] as [SafetyNetScriptAmount], A0.[SafetyNetScriptCount] as [SafetyNetScriptCount], A0.[SafteyNetEntitlementNumber] as [SafteyNetEntitlementNumber], A0.[Suburb] as [Suburb], A0.[Title] as [Title], A0.[Ward] as [Ward] from [dbo].[doPatient] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doPharmacist-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doPharmacist-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[FirstName] as [FirstName], A0.[GroupedDescription] as [GroupedDescription], A0.[LastName] as [LastName], A0.[PharmacistsInitials] as [PharmacistsInitials], A0.[RegistrationNumber] as [RegistrationNumber] from [dbo].[doPharmacist] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doPharmXAccount-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doPharmXAccount-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[Name] as [Name], A0.[SupplierID] as [SupplierID] from [dbo].[doPharmXAccount] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doPlanogramLocation-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doPlanogramLocation-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[Description] as [Description] from [dbo].[doPlanogramLocation] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doPlanogram-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doPlanogram-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[HorizontalFacings] as [HorizontalFacings], A0.[MinimumDepth] as [MinimumDepth], A0.[PlanogramItem] as [PlanogramItem], A0.[PlanogramLocation] as [PlanogramLocation], A0.[ShelfNumber] as [ShelfNumber], A0.[ShelfPosition] as [ShelfPosition] from [dbo].[doPlanogram] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doPricingPlan-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doPricingPlan-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[Description] as [Description], A0.[FixedRetail] as [FixedRetail], A0.[MarginMarkup] as [MarginMarkup], A0.[MarginMarkupValue] as [MarginMarkupValue], A0.[Name] as [Name], A0.[PlanType] as [PlanType], A0.[PricingLevel] as [PricingLevel], A0.[RoundingDenomination] as [RoundingDenomination], A0.[RoundingLowerBound] as [RoundingLowerBound], A0.[RoundingOption] as [RoundingOption], A0.[RoundingUpperBound] as [RoundingUpperBound], A0.[Supplier] as [Supplier] from [dbo].[doPricingPlan] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doPricingReviewEntry-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doPricingReviewEntry-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus], A0.[AcceptStatus] as [AcceptStatus], A0.[AutoCalcPriceLevel] as [AutoCalcPriceLevel], A0.[InActive] as [InActive], A0.[Item] as [Item], A0.[NewCost] as [NewCost], A0.[NewMSRP] as [NewMSRP], A0.[NewPriceA] as [NewPriceA], A0.[NewPriceB] as [NewPriceB], A0.[NewPriceC] as [NewPriceC], A0.[NewRetail] as [NewRetail], A0.[NewSupplierCost] as [NewSupplierCost], A0.[OldCost] as [OldCost], A0.[OldMSRP] as [OldMSRP], A0.[OldPriceA] as [OldPriceA], A0.[OldPriceB] as [OldPriceB], A0.[OldPriceC] as [OldPriceC], A0.[OldRetail] as [OldRetail], A0.[OldSupplierCost] as [OldSupplierCost], A0.[PricingReview] as [PricingReview], A0.[Source] as [Source] from [dbo].[doPricingReviewEntry] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doPricingReview-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doPricingReview-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus], A0.[Code] as [Code], A0.[CommittedBy] as [CommittedBy], A0.[CommittedDate] as [CommittedDate], A0.[Description] as [Description], A0.[EffectiveDate] as [EffectiveDate], A0.[InActive] as [InActive], A0.[IsApplied] as [IsApplied], A0.[PricingReviewSourceType] as [PricingReviewSourceType] from [dbo].[doPricingReview] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doPrincipal-Roles-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doPrincipal-Roles-View] as 
Select A0.[ID-1] as [ID-1], A0.[ID-2] as [ID-2] from [dbo].[doPrincipal-Roles] A0 
GO
/****** Object:  View [dbo].[doPrincipal-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doPrincipal-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A2.[FtRecordIsUpToDate] as [FtRecordIsUpToDate], A0.[Description] as [Description], A0.[Name] as [Name] from [dbo].[doPrincipal] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  left outer join [dbo].[doFtObject] A2 on A0.[ID]=A2.[ID]
GO
/****** Object:  View [dbo].[doPromotionEntry-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doPromotionEntry-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus], A0.[BuyDownPrice] as [BuyDownPrice], A0.[BuyDownQuantity] as [BuyDownQuantity], A0.[DealMinDOQ] as [DealMinDOQ], A0.[DiscountPercent] as [DiscountPercent], A0.[ItemNotDiscountableBeforePromo] as [ItemNotDiscountableBeforePromo], A0.[ItemNotDiscountableDuringPromo] as [ItemNotDiscountableDuringPromo], A0.[Promotion] as [Promotion], A0.[PromotionItem] as [PromotionItem], A0.[QuantityDiscountScheme] as [QuantityDiscountScheme], A0.[SalePrice] as [SalePrice], A0.[SourceItem] as [SourceItem], A0.[SourcePrice] as [SourcePrice] from [dbo].[doPromotionEntry] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doPromotion-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doPromotion-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus], A0.[CampaignCode] as [CampaignCode], A0.[CampaignName] as [CampaignName], A0.[CommittedDate] as [CommittedDate], A0.[Description] as [Description], A0.[IsActive] as [IsActive], A0.[Name] as [Name], A0.[PromotionLevel] as [PromotionLevel], A0.[PromotionType] as [PromotionType], A0.[ProtectedDate] as [ProtectedDate], A0.[Remarks] as [Remarks], A0.[SaleEndDate] as [SaleEndDate], A0.[SaleStartDate] as [SaleStartDate], A0.[Supplier] as [Supplier] from [dbo].[doPromotion] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doPurchaseOrderEntry-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doPurchaseOrderEntry-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus], A0.[Comment] as [Comment], A0.[CurrentCost] as [CurrentCost], A0.[DealCatalogueName] as [DealCatalogueName], A0.[DealMinDOQ] as [DealMinDOQ], A0.[ExtOrderCostTax] as [ExtOrderCostTax], A0.[GatewayResponse] as [GatewayResponse], A0.[ItemDescription] as [ItemDescription], A0.[ItemTax] as [ItemTax], A0.[OrderCost] as [OrderCost], A0.[OrderCostTax] as [OrderCostTax], A0.[OrderedItem] as [OrderedItem], A0.[OriginalQuantityOrdered] as [OriginalQuantityOrdered], A0.[PackQuantity] as [PackQuantity], A0.[PurchaseOrder] as [PurchaseOrder], A0.[QuantityOrdered] as [QuantityOrdered], A0.[QuantityReceivedToDate] as [QuantityReceivedToDate], A0.[QuantityReturnForCreditToDate] as [QuantityReturnForCreditToDate], A0.[ReasonCode] as [ReasonCode], A0.[ReorderNumber] as [ReorderNumber], A0.[SentForPricing] as [SentForPricing], A0.[ShowOnOrder] as [ShowOnOrder] from [dbo].[doPurchaseOrderEntry] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doPurchaseOrder-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doPurchaseOrder-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus], A0.[ApprovedBy] as [ApprovedBy], A0.[ApprovedDate] as [ApprovedDate], A0.[CancelledDate] as [CancelledDate], A0.[CompletedDate] as [CompletedDate], A0.[CompletedValue] as [CompletedValue], A0.[CreatedBy] as [CreatedBy], A0.[Currency] as [Currency], A0.[DeliverAfter] as [DeliverAfter], A0.[DeliverBefore] as [DeliverBefore], A0.[ExchangeRate] as [ExchangeRate], A0.[GatewayId] as [GatewayId], A0.[HasInvoice] as [HasInvoice], A0.[HasOOSInvoice] as [HasOOSInvoice], A0.[IsAutoGenerated] as [IsAutoGenerated], A0.[IsBootstrapped] as [IsBootstrapped], A0.[IsCancelled] as [IsCancelled], A0.[IsPlaced] as [IsPlaced], A0.[PharmXStatus] as [PharmXStatus], A0.[PurchaseOrderEntryLastModified] as [PurchaseOrderEntryLastModified], A0.[PurchaseOrderNumber] as [PurchaseOrderNumber], A0.[PurchaseOrderSource] as [PurchaseOrderSource], A0.[PurchaseOrderStatus] as [PurchaseOrderStatus], A0.[PurchaseOrderType] as [PurchaseOrderType], A0.[PurchaseOrderUpdateLevel] as [PurchaseOrderUpdateLevel], A0.[Remarks] as [Remarks], A0.[RequiredDate] as [RequiredDate], A0.[ReturnApprovalNumber] as [ReturnApprovalNumber], A0.[SentDate] as [SentDate], A0.[ShipFrom] as [ShipFrom], A0.[ShipTo] as [ShipTo], A0.[ShipVia] as [ShipVia], A0.[Supplier] as [Supplier], A0.[SupplierResponse] as [SupplierResponse], A0.[Terms] as [Terms], A0.[Title] as [Title], A0.[TransferReason] as [TransferReason], A0.[WorksheetID] as [WorksheetID] from [dbo].[doPurchaseOrder] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doQuantityDiscountScheme-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doQuantityDiscountScheme-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus], A0.[Active] as [Active], A0.[Code] as [Code], A0.[Description] as [Description], A0.[DiscountOddItems] as [DiscountOddItems], A0.[DiscountSchemeType] as [DiscountSchemeType], A0.[ExtendedPriceDiscount] as [ExtendedPriceDiscount], A0.[PercentOffPrice1] as [PercentOffPrice1], A0.[PercentOffPrice1A] as [PercentOffPrice1A], A0.[PercentOffPrice1B] as [PercentOffPrice1B], A0.[PercentOffPrice1C] as [PercentOffPrice1C], A0.[PercentOffPrice2] as [PercentOffPrice2], A0.[PercentOffPrice2A] as [PercentOffPrice2A], A0.[PercentOffPrice2B] as [PercentOffPrice2B], A0.[PercentOffPrice2C] as [PercentOffPrice2C], A0.[PercentOffPrice3] as [PercentOffPrice3], A0.[PercentOffPrice3A] as [PercentOffPrice3A], A0.[PercentOffPrice3B] as [PercentOffPrice3B], A0.[PercentOffPrice3C] as [PercentOffPrice3C], A0.[PercentOffPrice4] as [PercentOffPrice4], A0.[PercentOffPrice4A] as [PercentOffPrice4A], A0.[PercentOffPrice4B] as [PercentOffPrice4B], A0.[PercentOffPrice4C] as [PercentOffPrice4C], A0.[Price1] as [Price1], A0.[Price1A] as [Price1A], A0.[Price1B] as [Price1B], A0.[Price1C] as [Price1C], A0.[Price2] as [Price2], A0.[Price2A] as [Price2A], A0.[Price2B] as [Price2B], A0.[Price2C] as [Price2C], A0.[Price3] as [Price3], A0.[Price3A] as [Price3A], A0.[Price3B] as [Price3B], A0.[Price3C] as [Price3C], A0.[Price4] as [Price4], A0.[Price4A] as [Price4A], A0.[Price4B] as [Price4B], A0.[Price4C] as [Price4C], A0.[Quantity1] as [Quantity1], A0.[Quantity2] as [Quantity2], A0.[Quantity3] as [Quantity3], A0.[Quantity4] as [Quantity4] from [dbo].[doQuantityDiscountScheme] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doRapidAuditAggregateDataObject-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doRapidAuditAggregateDataObject-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doRapidAuditAggregateDataObject] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doActivity] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doCurrency] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doInvoice] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doInvoiceEntry] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doInvoiceEntryReceive] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doInvoiceOtherCost] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doItemClassification] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doPricingReview] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doPricingReviewEntry] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doPurchaseOrder] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doPurchaseOrderEntry] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doItemTax] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doTax] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doSubstitute] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doPromotionEntry] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doPromotion] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doItemBase] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doQuantityDiscountScheme] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doDimensionAttribute] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doMatrixAttributeDisplayOrder] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doDimension] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doItemClassComponent] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doBatch] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doRegister] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doAlias] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doBusinessUnit] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doCategory] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doDepartment] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doItemMessage] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doItemMovementHistory] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doSupplier] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  union all Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus] from [dbo].[doSupplierItem] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doRapidRecordStatus-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doRapidRecordStatus-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[Name] as [Name] from [dbo].[doRapidRecordStatus] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doRapid-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doRapid-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[EnableInbound] as [EnableInbound], A0.[EnterpriseGuid] as [EnterpriseGuid], A0.[InBoundPollFrequency] as [InBoundPollFrequency], A0.[InBoundWorksheetConfiguration] as [InBoundWorksheetConfiguration], A0.[LastInboundProcessDateTime] as [LastInboundProcessDateTime], A0.[LastOutboundProcessDateTime] as [LastOutboundProcessDateTime], A0.[OperationalState] as [OperationalState], A0.[OutBoundPollFrequency] as [OutBoundPollFrequency], A0.[OutBoundRowsPerCycle] as [OutBoundRowsPerCycle], A0.[ProgressText] as [ProgressText], A0.[RapidServerURL] as [RapidServerURL], A0.[StoreCode] as [StoreCode], A0.[StoreGuid] as [StoreGuid] from [dbo].[doRapid] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doRapid-Worksheets-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doRapid-Worksheets-View] as 
Select A0.[ID] as [ID], A0.[Owner] as [Owner], A0.[Created] as [Created], A0.[CreatedBy] as [CreatedBy], A0.[Description] as [Description], A0.[EffectiveDate] as [EffectiveDate], A0.[Guid] as [Guid], A0.[Modified] as [Modified], A0.[ProcessDuration] as [ProcessDuration], A0.[Processed] as [Processed], A0.[RecordCount] as [RecordCount], A0.[RecordsTable] as [RecordsTable], A0.[Remarks] as [Remarks], A0.[RowTotal] as [RowTotal], A0.[Status] as [Status], A0.[TypeName] as [TypeName], A0.[WorksheetType] as [WorksheetType] from [dbo].[doRapid-Worksheets] A0 
GO
/****** Object:  View [dbo].[doRateOfUsageDateDefinition-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doRateOfUsageDateDefinition-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[DayOffset] as [DayOffset], A0.[Name] as [Name], A0.[RangeSpan] as [RangeSpan], A0.[RateOfUsageScheme] as [RateOfUsageScheme], A0.[Weight] as [Weight] from [dbo].[doRateOfUsageDateDefinition] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doRateOfUsageScheme-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doRateOfUsageScheme-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[Description] as [Description], A0.[IncludeTransfersInCalc] as [IncludeTransfersInCalc], A0.[IsDefaultScheme] as [IsDefaultScheme], A0.[Name] as [Name], A0.[ROUSchemeType] as [ROUSchemeType], A0.[ReOrderPointDays] as [ReOrderPointDays], A0.[ReStockLevelDays] as [ReStockLevelDays] from [dbo].[doRateOfUsageScheme] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doReasonCode-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doReasonCode-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[Code] as [Code], A0.[Description] as [Description], A0.[EndDate] as [EndDate], A0.[InActive] as [InActive], A0.[ReasonCodeType] as [ReasonCodeType], A0.[StartDate] as [StartDate] from [dbo].[doReasonCode] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doRegister-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doRegister-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus], A0.[Description] as [Description], A0.[RegisterNumber] as [RegisterNumber] from [dbo].[doRegister] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doRelationship-Actions-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doRelationship-Actions-View] as 
Select A0.[ID] as [ID], A0.[Owner] as [Owner], A0.[BusinessAction] as [BusinessAction], A0.[Created] as [Created], A0.[EntityName] as [EntityName] from [dbo].[doRelationship-Actions] A0 
GO
/****** Object:  View [dbo].[doRelationship-AggregateKeys-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doRelationship-AggregateKeys-View] as 
Select A0.[ID] as [ID], A0.[Owner] as [Owner], A0.[AggregateObject] as [AggregateObject], A0.[AggregateObjectGuid] as [AggregateObjectGuid], A0.[Entity] as [Entity], A0.[ForeignKey] as [ForeignKey], A0.[ParentKey] as [ParentKey], A0.[Relation] as [Relation] from [dbo].[doRelationship-AggregateKeys] A0 
GO
/****** Object:  View [dbo].[doRelationship-Conflicts-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doRelationship-Conflicts-View] as 
Select A0.[ID] as [ID], A0.[Owner] as [Owner], A0.[AggregateField] as [AggregateField], A0.[AggregateObject] as [AggregateObject], A0.[AggregateObjectType] as [AggregateObjectType], A0.[ConflictPending] as [ConflictPending], A0.[ConflictType] as [ConflictType], A0.[EntityKey] as [EntityKey], A0.[IgnoreConflict] as [IgnoreConflict], A0.[Message] as [Message], A0.[RelatedObject] as [RelatedObject], A0.[Relation] as [Relation], A0.[TimeConflicted] as [TimeConflicted] from [dbo].[doRelationship-Conflicts] A0 
GO
/****** Object:  View [dbo].[doRelationship-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doRelationship-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[ActivatingRelationship] as [ActivatingRelationship], A0.[ActivityLastCycle] as [ActivityLastCycle], A0.[ConnectorType] as [ConnectorType], A0.[Count] as [Count], A0.[Guid] as [Guid], A0.[LastError] as [LastError], A0.[MaxRecordsPerIteration] as [MaxRecordsPerIteration], A0.[Name] as [Name], A0.[NextExecute] as [NextExecute], A0.[Operation] as [Operation], A0.[Paused] as [Paused], A0.[Processed] as [Processed], A0.[Properties] as [Properties], A0.[Receive] as [Receive], A0.[RelationshipState] as [RelationshipState], A0.[Send] as [Send] from [dbo].[doRelationship] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doReport-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doReport-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[Author] as [Author], A0.[ColumnListXml] as [ColumnListXml], A0.[CommonUses] as [CommonUses], A0.[Description] as [Description], A0.[Group] as [Group], A0.[IsAdvanced] as [IsAdvanced], A0.[IsSystemReport] as [IsSystemReport], A0.[LastRunDate] as [LastRunDate], A0.[Name] as [Name], A0.[ScheduledEnabled] as [ScheduledEnabled], A0.[ScheduledFormat] as [ScheduledFormat], A0.[ScheduledFrom] as [ScheduledFrom], A0.[ScheduledLastRun] as [ScheduledLastRun], A0.[ScheduledMessage] as [ScheduledMessage], A0.[ScheduledRecurrencePattern] as [ScheduledRecurrencePattern], A0.[ScheduledSubject] as [ScheduledSubject], A0.[ScheduledTime] as [ScheduledTime], A0.[ScheduledTo] as [ScheduledTo], A0.[SendCollapsedGroups] as [SendCollapsedGroups], A0.[SharedRoleList] as [SharedRoleList], A0.[SharedUserList] as [SharedUserList], A0.[Xml] as [Xml] from [dbo].[doReport] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doReturnToSupplierEntry-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doReturnToSupplierEntry-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[AuthorizationNumber] as [AuthorizationNumber], A0.[Cost] as [Cost], A0.[ItemReturned] as [ItemReturned], A0.[Quantity] as [Quantity], A0.[ReturnToSupplier] as [ReturnToSupplier] from [dbo].[doReturnToSupplierEntry] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doReturnToSupplier-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doReturnToSupplier-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[AuthorizationNumber] as [AuthorizationNumber], A0.[RTVNumber] as [RTVNumber], A0.[ReturnedDate] as [ReturnedDate], A0.[Supplier] as [Supplier] from [dbo].[doReturnToSupplier] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doRole-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doRole-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A2.[FtRecordIsUpToDate] as [FtRecordIsUpToDate], A3.[Description] as [Description], A3.[Name] as [Name] from [dbo].[doRole] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  left outer join [dbo].[doFtObject] A2 on A0.[ID]=A2.[ID]
  left outer join [dbo].[doPrincipal] A3 on A0.[ID]=A3.[ID]
GO
/****** Object:  View [dbo].[doSatScanDeviceOptionGral-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doSatScanDeviceOptionGral-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[Description] as [Description], A0.[DevID] as [DevID], A0.[Enabled] as [Enabled], A0.[Executed] as [Executed], A0.[SatID] as [SatID], A0.[SettingAlias] as [SettingAlias], A0.[TagAlias] as [TagAlias] from [dbo].[doSatScanDeviceOptionGral] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doSatScanDeviceOptionStockTake-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doSatScanDeviceOptionStockTake-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[Description] as [Description], A0.[DevID] as [DevID], A0.[SatID] as [SatID], A0.[Value] as [Value] from [dbo].[doSatScanDeviceOptionStockTake] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doSatScanGunLog-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doSatScanGunLog-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[Action] as [Action], A0.[ActionDescription] as [ActionDescription], A0.[GunID] as [GunID], A0.[LogDateRequest] as [LogDateRequest], A0.[LogDateResponse] as [LogDateResponse], A0.[Request] as [Request], A0.[Response] as [Response], A0.[UserLoggedIn] as [UserLoggedIn] from [dbo].[doSatScanGunLog] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doSatScanSettingsGlobal-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doSatScanSettingsGlobal-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[LoginRequired] as [LoginRequired], A0.[LoginTimeout] as [LoginTimeout] from [dbo].[doSatScanSettingsGlobal] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doSatScanSettingsLocal-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doSatScanSettingsLocal-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[BaudRate] as [BaudRate], A0.[Comport] as [Comport], A0.[MachineName] as [MachineName], A0.[SatelliteID] as [SatelliteID] from [dbo].[doSatScanSettingsLocal] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doScriptConditionOption-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doScriptConditionOption-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[ConditionValueType] as [ConditionValueType], A0.[Description] as [Description] from [dbo].[doScriptConditionOption] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doScriptProcess-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doScriptProcess-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[ActivityAction] as [ActivityAction], A0.[PerformStockMovement] as [PerformStockMovement], A0.[ProcessOrder] as [ProcessOrder], A0.[ScriptRule] as [ScriptRule] from [dbo].[doScriptProcess] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doScriptRuleEntry-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doScriptRuleEntry-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[ConditionValue] as [ConditionValue], A0.[ConditionValueType] as [ConditionValueType], A0.[Description] as [Description], A0.[ScriptRule] as [ScriptRule] from [dbo].[doScriptRuleEntry] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doScriptRule-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doScriptRule-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[Description] as [Description] from [dbo].[doScriptRule] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doScript-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doScript-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[ActivityAction] as [ActivityAction], A0.[AuthorityNumber] as [AuthorityNumber], A0.[ChargeAccount] as [ChargeAccount], A0.[ChargeAmount] as [ChargeAmount], A0.[ChargeType] as [ChargeType], A0.[DDRepeatInterval] as [DDRepeatInterval], A0.[Deferred] as [Deferred], A0.[Deleted] as [Deleted], A0.[DispenseDate] as [DispenseDate], A0.[DispenseNumber] as [DispenseNumber], A0.[Doctor] as [Doctor], A0.[DoctorCode] as [DoctorCode], A0.[DoctorName] as [DoctorName], A0.[DoctorPrescriberNumber] as [DoctorPrescriberNumber], A0.[Drug] as [Drug], A0.[DrugAlternateDescription] as [DrugAlternateDescription], A0.[DrugCode] as [DrugCode], A0.[DrugDescription] as [DrugDescription], A0.[DrugDispenseType] as [DrugDispenseType], A0.[DrugInteractionGroup] as [DrugInteractionGroup], A0.[DrugItem] as [DrugItem], A0.[FreeIndex1] as [FreeIndex1], A0.[FreeIndex2] as [FreeIndex2], A0.[FreeIndex3] as [FreeIndex3], A0.[FreeIndex4] as [FreeIndex4], A0.[GenericCode] as [GenericCode], A0.[GlassBottle] as [GlassBottle], A0.[GovernmentRecoveryAmount] as [GovernmentRecoveryAmount], A0.[GstIncluded] as [GstIncluded], A0.[HBFRecoveryAmount] as [HBFRecoveryAmount], A0.[HospitalProviderNumber] as [HospitalProviderNumber], A0.[Ignore] as [Ignore], A0.[ImmediateSupply] as [ImmediateSupply], A0.[IsAuthority] as [IsAuthority], A0.[IsNarcotic] as [IsNarcotic], A0.[IsOutsideRepeat] as [IsOutsideRepeat], A0.[LargeLabelSigs] as [LargeLabelSigs], A0.[LargeLabelType] as [LargeLabelType], A0.[ManufacturerCode] as [ManufacturerCode], A0.[MaximumDispensings] as [MaximumDispensings], A0.[NationalHealthSchemeCode] as [NationalHealthSchemeCode], A0.[NursingHome] as [NursingHome], A0.[NursingHomeCode] as [NursingHomeCode], A0.[OriginalScriptNumber] as [OriginalScriptNumber], A0.[OriginalSupplyingPharmacy] as [OriginalSupplyingPharmacy], A0.[POSTransferQuantity] as [POSTransferQuantity], A0.[Packs] as [Packs], A0.[Patient] as [Patient], A0.[PatientInstructions] as [PatientInstructions], A0.[PatientNumber] as [PatientNumber], A0.[PatientPrice] as [PatientPrice], A0.[PerformStockMovement] as [PerformStockMovement], A0.[Pharmacist] as [Pharmacist], A0.[PharmacistsInitials] as [PharmacistsInitials], A0.[PrescriptionDate] as [PrescriptionDate], A0.[Quantity] as [Quantity], A0.[RepeatFastCode] as [RepeatFastCode], A0.[RepeatScriptNumber] as [RepeatScriptNumber], A0.[SafetyNetAmount] as [SafetyNetAmount], A0.[SaleCost] as [SaleCost], A0.[ScriptClassification] as [ScriptClassification], A0.[ScriptNumber] as [ScriptNumber], A0.[ScriptProcessLogic] as [ScriptProcessLogic], A0.[ScriptStatus] as [ScriptStatus], A0.[ScriptType] as [ScriptType], A0.[WADDVerified] as [WADDVerified], A0.[Ward] as [Ward], A0.[WardNumber] as [WardNumber], A0.[WholesaleCost] as [WholesaleCost] from [dbo].[doScript] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doSecurityRoot-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doSecurityRoot-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData] from [dbo].[doSecurityRoot] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doSerial-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doSerial-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[Item] as [Item], A0.[SerialNumber1] as [SerialNumber1], A0.[SerialNumber2] as [SerialNumber2], A0.[SerialNumber3] as [SerialNumber3], A0.[Status] as [Status] from [dbo].[doSerial] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doStatementBatch-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doStatementBatch-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[BatchName] as [BatchName], A0.[BatchNumber] as [BatchNumber], A0.[EndDate] as [EndDate], A0.[GeneratedCount] as [GeneratedCount], A0.[RunDate] as [RunDate], A0.[StatementCount] as [StatementCount], A0.[StatementSchedule] as [StatementSchedule], A0.[TotalAmount] as [TotalAmount] from [dbo].[doStatementBatch] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doStatement-EmailQueue-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doStatement-EmailQueue-View] as 
Select A0.[ID] as [ID], A0.[Owner] as [Owner], A0.[EffectiveDate] as [EffectiveDate], A0.[EmailError] as [EmailError], A0.[EmailStatus] as [EmailStatus], A0.[EmailTemplate] as [EmailTemplate], A0.[EmailTo] as [EmailTo] from [dbo].[doStatement-EmailQueue] A0 
GO
/****** Object:  View [dbo].[doStatementSchedule-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doStatementSchedule-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AccountFormat] as [AccountFormat], A0.[AccountFormatRestricted] as [AccountFormatRestricted], A0.[AccountGroup] as [AccountGroup], A0.[AccountGroupRestricted] as [AccountGroupRestricted], A0.[AccountType] as [AccountType], A0.[ClosePolicy] as [ClosePolicy], A0.[Enabled] as [Enabled], A0.[LastRun] as [LastRun], A0.[Name] as [Name], A0.[NursingHome] as [NursingHome], A0.[NursingHomeRestricted] as [NursingHomeRestricted], A0.[RunPolicy] as [RunPolicy], A0.[StatementSendOption] as [StatementSendOption] from [dbo].[doStatementSchedule] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doStatement-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doStatement-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[Account] as [Account], A0.[Adjustments] as [Adjustments], A0.[Charges] as [Charges], A0.[Closed] as [Closed], A0.[ClosingBalance] as [ClosingBalance], A0.[Days30] as [Days30], A0.[Days60] as [Days60], A0.[Days90] as [Days90], A0.[EndDate] as [EndDate], A0.[GeneratedDate] as [GeneratedDate], A0.[OpeningBalance] as [OpeningBalance], A0.[Payments] as [Payments], A0.[Sales] as [Sales], A0.[StartDate] as [StartDate], A0.[StatementBatch] as [StatementBatch], A0.[StatementNumber] as [StatementNumber], A0.[StatementXml] as [StatementXml], A0.[Tax] as [Tax], A0.[Transfers] as [Transfers] from [dbo].[doStatement] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doStdUser-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doStdUser-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A2.[FtRecordIsUpToDate] as [FtRecordIsUpToDate], A3.[Description] as [Description], A3.[Name] as [Name], A4.[IsDisabled] as [IsDisabled], A0.[Password] as [Password] from [dbo].[doStdUser] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  left outer join [dbo].[doFtObject] A2 on A0.[ID]=A2.[ID]
  left outer join [dbo].[doPrincipal] A3 on A0.[ID]=A3.[ID]
  left outer join [dbo].[doUser] A4 on A0.[ID]=A4.[ID]
GO
/****** Object:  View [dbo].[doStocktakeEntry-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doStocktakeEntry-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[ChangeCount] as [ChangeCount], A0.[Code] as [Code], A0.[Cost] as [Cost], A0.[Description] as [Description], A0.[LastCounted] as [LastCounted], A0.[QuantityCounted] as [QuantityCounted], A0.[QuantityOnHand] as [QuantityOnHand], A0.[Stocktake] as [Stocktake], A0.[StocktakedItem] as [StocktakedItem] from [dbo].[doStocktakeEntry] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doStocktake-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doStocktake-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[CommittedDate] as [CommittedDate], A0.[Description] as [Description], A0.[ImportedDataTable] as [ImportedDataTable], A0.[Name] as [Name], A0.[ProtectedDate] as [ProtectedDate], A0.[SatScanCode] as [SatScanCode], A0.[StocktakeType] as [StocktakeType] from [dbo].[doStocktake] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doSubstitute-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doSubstitute-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus], A0.[Item] as [Item], A0.[SubstituteItem] as [SubstituteItem] from [dbo].[doSubstitute] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doSupplierAccount-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doSupplierAccount-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[AccountNumber] as [AccountNumber], A0.[BackupSupplyType] as [BackupSupplyType], A0.[Code] as [Code], A0.[Disabled] as [Disabled], A0.[GroupType] as [GroupType], A0.[Name] as [Name], A0.[OrderType] as [OrderType], A0.[Password] as [Password], A0.[Supplier] as [Supplier], A0.[SupplierID] as [SupplierID], A0.[SupplyMethod] as [SupplyMethod], A0.[SupplyType] as [SupplyType], A0.[UseAPIOrderingOptions] as [UseAPIOrderingOptions], A0.[UseSigmaOrderingOptions] as [UseSigmaOrderingOptions] from [dbo].[doSupplierAccount] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doSupplierItem-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doSupplierItem-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus], A0.[Cost] as [Cost], A0.[CostPrice1] as [CostPrice1], A0.[CostPrice2] as [CostPrice2], A0.[CostPrice3] as [CostPrice3], A0.[CostPrice4] as [CostPrice4], A0.[CostPrice5] as [CostPrice5], A0.[CostPriceQuantity1] as [CostPriceQuantity1], A0.[CostPriceQuantity2] as [CostPriceQuantity2], A0.[CostPriceQuantity3] as [CostPriceQuantity3], A0.[CostPriceQuantity4] as [CostPriceQuantity4], A0.[CostPriceQuantity5] as [CostPriceQuantity5], A0.[DealCatalogueName] as [DealCatalogueName], A0.[DealCost] as [DealCost], A0.[DealEndDate] as [DealEndDate], A0.[DealMinDOQ] as [DealMinDOQ], A0.[DealStartDate] as [DealStartDate], A0.[ItemSupplied] as [ItemSupplied], A0.[ItemTax] as [ItemTax], A0.[LastCost] as [LastCost], A0.[LastExchangeRate] as [LastExchangeRate], A0.[LastForeignCost] as [LastForeignCost], A0.[LastReceivedDate] as [LastReceivedDate], A0.[MinimumOrder] as [MinimumOrder], A0.[NeverAutoMatch] as [NeverAutoMatch], A0.[PackQuantity] as [PackQuantity], A0.[PurchaseTax] as [PurchaseTax], A0.[Quantity] as [Quantity], A0.[RRP] as [RRP], A0.[ReceiveItemQuantity] as [ReceiveItemQuantity], A0.[ReorderNumber] as [ReorderNumber], A0.[Supplier] as [Supplier], A0.[SupplierDescription] as [SupplierDescription], A0.[TaxInc] as [TaxInc], A0.[TaxRate] as [TaxRate] from [dbo].[doSupplierItem] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doSupplier-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doSupplier-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus], A0.[ABN] as [ABN], A0.[AccountNumber] as [AccountNumber], A0.[AddressLine1] as [AddressLine1], A0.[AddressLine2] as [AddressLine2], A0.[AddressState] as [AddressState], A0.[AppCatHQID] as [AppCatHQID], A0.[AppCatHQLastMatched] as [AppCatHQLastMatched], A0.[ApplyTax] as [ApplyTax], A0.[City] as [City], A0.[Code] as [Code], A0.[Company] as [Company], A0.[ContactName] as [ContactName], A0.[Country] as [Country], A0.[Currency] as [Currency], A0.[CustomDate1] as [CustomDate1], A0.[CustomDate2] as [CustomDate2], A0.[CustomDate3] as [CustomDate3], A0.[CustomDate4] as [CustomDate4], A0.[CustomDate5] as [CustomDate5], A0.[CustomNumber1] as [CustomNumber1], A0.[CustomNumber2] as [CustomNumber2], A0.[CustomNumber3] as [CustomNumber3], A0.[CustomNumber4] as [CustomNumber4], A0.[CustomNumber5] as [CustomNumber5], A0.[CustomText1] as [CustomText1], A0.[CustomText2] as [CustomText2], A0.[CustomText3] as [CustomText3], A0.[CustomText4] as [CustomText4], A0.[CustomText5] as [CustomText5], A0.[DeliveringSupplier] as [DeliveringSupplier], A0.[EmailAddress] as [EmailAddress], A0.[FaxNumber] as [FaxNumber], A0.[FirstName] as [FirstName], A0.[GroupedDescription] as [GroupedDescription], A0.[InActive] as [InActive], A0.[IsBanner] as [IsBanner], A0.[IsBuyingGroup] as [IsBuyingGroup], A0.[IsDirectSupplier] as [IsDirectSupplier], A0.[IsManufacturer] as [IsManufacturer], A0.[IsWholesaler] as [IsWholesaler], A0.[LastName] as [LastName], A0.[LocalKey] as [LocalKey], A0.[MinimumOrderAmount] as [MinimumOrderAmount], A0.[MobileNumber] as [MobileNumber], A0.[NoGateway] as [NoGateway], A0.[ObeyAccountCreditLimit] as [ObeyAccountCreditLimit], A0.[OrderingCode] as [OrderingCode], A0.[PhoneNumber] as [PhoneNumber], A0.[PostCode] as [PostCode], A0.[PricelineSupplierType] as [PricelineSupplierType], A0.[Remarks] as [Remarks], A0.[RemoteHost] as [RemoteHost], A0.[RemoteKey] as [RemoteKey], A0.[RemotePort] as [RemotePort], A0.[SendOrdersViaProxySupplier] as [SendOrdersViaProxySupplier], A0.[ShowCostPrice] as [ShowCostPrice], A0.[Terms] as [Terms], A0.[Title] as [Title], A0.[TransferOutChargeAccount] as [TransferOutChargeAccount], A0.[TransferType] as [TransferType], A0.[UpdateCost] as [UpdateCost], A0.[Web] as [Web] from [dbo].[doSupplier] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doTax-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doTax-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[IBHeaderGuid] as [IBHeaderGuid], A0.[RapidObjectGuid] as [RapidObjectGuid], A0.[RapidSyncRequired] as [RapidSyncRequired], A0.[RecordStatus] as [RecordStatus], A0.[ApplyOverMinimum] as [ApplyOverMinimum], A0.[ApplyToSubTotal] as [ApplyToSubTotal], A0.[Bracket00] as [Bracket00], A0.[Bracket01] as [Bracket01], A0.[Bracket02] as [Bracket02], A0.[Bracket03] as [Bracket03], A0.[Bracket04] as [Bracket04], A0.[Bracket05] as [Bracket05], A0.[Bracket06] as [Bracket06], A0.[Bracket07] as [Bracket07], A0.[Bracket08] as [Bracket08], A0.[Bracket09] as [Bracket09], A0.[Bracket10] as [Bracket10], A0.[Bracket11] as [Bracket11], A0.[Bracket12] as [Bracket12], A0.[Bracket13] as [Bracket13], A0.[Bracket14] as [Bracket14], A0.[Bracket15] as [Bracket15], A0.[Bracket16] as [Bracket16], A0.[Bracket17] as [Bracket17], A0.[Bracket18] as [Bracket18], A0.[Bracket19] as [Bracket19], A0.[Bracket20] as [Bracket20], A0.[Bracket21] as [Bracket21], A0.[Bracket22] as [Bracket22], A0.[Bracket23] as [Bracket23], A0.[Bracket24] as [Bracket24], A0.[Bracket25] as [Bracket25], A0.[Bracket26] as [Bracket26], A0.[Bracket27] as [Bracket27], A0.[Bracket28] as [Bracket28], A0.[Bracket29] as [Bracket29], A0.[Bracket30] as [Bracket30], A0.[BracketValue01] as [BracketValue01], A0.[BracketValue02] as [BracketValue02], A0.[BracketValue03] as [BracketValue03], A0.[BracketValue04] as [BracketValue04], A0.[BracketValue05] as [BracketValue05], A0.[BracketValue06] as [BracketValue06], A0.[BracketValue07] as [BracketValue07], A0.[BracketValue08] as [BracketValue08], A0.[BracketValue09] as [BracketValue09], A0.[BracketValue10] as [BracketValue10], A0.[BracketValue11] as [BracketValue11], A0.[BracketValue12] as [BracketValue12], A0.[BracketValue13] as [BracketValue13], A0.[BracketValue14] as [BracketValue14], A0.[BracketValue15] as [BracketValue15], A0.[BracketValue16] as [BracketValue16], A0.[BracketValue17] as [BracketValue17], A0.[BracketValue18] as [BracketValue18], A0.[BracketValue19] as [BracketValue19], A0.[BracketValue20] as [BracketValue20], A0.[BracketValue21] as [BracketValue21], A0.[BracketValue22] as [BracketValue22], A0.[BracketValue23] as [BracketValue23], A0.[BracketValue24] as [BracketValue24], A0.[BracketValue25] as [BracketValue25], A0.[BracketValue26] as [BracketValue26], A0.[BracketValue27] as [BracketValue27], A0.[BracketValue28] as [BracketValue28], A0.[BracketValue29] as [BracketValue29], A0.[BracketValue30] as [BracketValue30], A0.[Code] as [Code], A0.[Description] as [Description], A0.[FixedAmount] as [FixedAmount], A0.[IncludePreviousTax] as [IncludePreviousTax], A0.[ItemMaximum] as [ItemMaximum], A0.[ItemMinimum] as [ItemMinimum], A0.[Percentage] as [Percentage], A0.[TaxLimit] as [TaxLimit], A0.[UsePartialDollar] as [UsePartialDollar] from [dbo].[doTax] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doTenderDenominations-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doTenderDenominations-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[DenominationValue] as [DenominationValue], A0.[Description] as [Description], A0.[TypeOfTender] as [TypeOfTender] from [dbo].[doTenderDenominations] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doTenderTotal-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doTenderTotal-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[Banking] as [Banking], A0.[Batch] as [Batch], A0.[Close] as [Close], A0.[Count] as [Count], A0.[Dropped] as [Dropped], A0.[Open] as [Open], A0.[Shift] as [Shift], A0.[TenderType] as [TenderType] from [dbo].[doTenderTotal] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doTenderType-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doTenderType-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[Code] as [Code], A0.[Description] as [Description], A0.[MaximumTender] as [MaximumTender], A0.[PopCashDraw] as [PopCashDraw], A0.[PreventOverTendering] as [PreventOverTendering], A0.[RegisterDisplayOrder] as [RegisterDisplayOrder], A0.[Remarks] as [Remarks], A0.[TypeOfTender] as [TypeOfTender] from [dbo].[doTenderType] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doTender-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doTender-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[Activity] as [Activity], A0.[Amount] as [Amount], A0.[DropPayout] as [DropPayout], A0.[TenderAction] as [TenderAction], A0.[TenderType] as [TenderType] from [dbo].[doTender] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doTransactionInfo-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doTransactionInfo-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[StartTime] as [StartTime], A0.[User] as [User] from [dbo].[doTransactionInfo] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doUserAccount-Appointments-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doUserAccount-Appointments-View] as 
Select A0.[ID] as [ID], A0.[Owner] as [Owner], A0.[AllDay] as [AllDay], A0.[Description] as [Description], A0.[End] as [End], A0.[EventType] as [EventType], A0.[Label] as [Label], A0.[Location] as [Location], A0.[RecurrenceInfo] as [RecurrenceInfo], A0.[ReminderInfo] as [ReminderInfo], A0.[ResourceId] as [ResourceId], A0.[Start] as [Start], A0.[Subject] as [Subject] from [dbo].[doUserAccount-Appointments] A0 
GO
/****** Object:  View [dbo].[doUserAccount-Tasks-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doUserAccount-Tasks-View] as 
Select A0.[ID] as [ID], A0.[Owner] as [Owner], A0.[Description] as [Description], A0.[Done] as [Done], A0.[DoneBy] as [DoneBy], A0.[DueDate] as [DueDate], A0.[RecurrencePattern] as [RecurrencePattern], A0.[ReminderDateTime] as [ReminderDateTime], A0.[ReminderEnabled] as [ReminderEnabled], A0.[SharedUserList] as [SharedUserList], A0.[Subject] as [Subject] from [dbo].[doUserAccount-Tasks] A0 
GO
/****** Object:  View [dbo].[doUserAccount-UserSettings-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doUserAccount-UserSettings-View] as 
Select A0.[ID-1] as [ID-1], A0.[ID-2] as [ID-2] from [dbo].[doUserAccount-UserSettings] A0 
GO
/****** Object:  View [dbo].[doUserAccount-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doUserAccount-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A2.[FtRecordIsUpToDate] as [FtRecordIsUpToDate], A3.[Description] as [Description], A3.[Name] as [Name], A4.[IsDisabled] as [IsDisabled], A5.[Password] as [Password], A0.[AddressLine1] as [AddressLine1], A0.[AddressLine2] as [AddressLine2], A0.[AddressState] as [AddressState], A0.[AllowTaskAllocation] as [AllowTaskAllocation], A0.[Cashier] as [Cashier], A0.[City] as [City], A0.[Company] as [Company], A0.[EmailAddress] as [EmailAddress], A0.[FaxNumber] as [FaxNumber], A0.[FirstName] as [FirstName], A0.[LastName] as [LastName], A0.[MobileNumber] as [MobileNumber], A0.[PhoneNumber] as [PhoneNumber], A0.[PinCode] as [PinCode], A0.[PostCode] as [PostCode], A0.[ResourceColour] as [ResourceColour], A0.[Title] as [Title], A0.[UserName] as [UserName], A0.[Web] as [Web] from [dbo].[doUserAccount] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  left outer join [dbo].[doFtObject] A2 on A0.[ID]=A2.[ID]
  left outer join [dbo].[doPrincipal] A3 on A0.[ID]=A3.[ID]
  left outer join [dbo].[doUser] A4 on A0.[ID]=A4.[ID]
  left outer join [dbo].[doStdUser] A5 on A0.[ID]=A5.[ID]
GO
/****** Object:  View [dbo].[doUser-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doUser-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A2.[FtRecordIsUpToDate] as [FtRecordIsUpToDate], A3.[Description] as [Description], A3.[Name] as [Name], A0.[IsDisabled] as [IsDisabled] from [dbo].[doUser] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
  left outer join [dbo].[doFtObject] A2 on A0.[ID]=A2.[ID]
  left outer join [dbo].[doPrincipal] A3 on A0.[ID]=A3.[ID]
GO
/****** Object:  View [dbo].[doWard-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doWard-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[WardDescription] as [WardDescription], A0.[WardNumber] as [WardNumber], A0.[Wardcharge] as [Wardcharge], A0.[Wardhiccat] as [Wardhiccat], A0.[Wardhosp] as [Wardhosp] from [dbo].[doWard] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  View [dbo].[doWilliamActivityHistory-View]    Script Date: 11/11/2017 5:32:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[doWilliamActivityHistory-View] as 
Select A1.[ID] as [ID], A1.[TypeID] as [TypeID], A1.[VersionID] as [VersionID], A1.[Permissions] as [Permissions], A1.[FastLoadData] as [FastLoadData], A0.[Created] as [Created], A0.[Modified] as [Modified], A0.[AggregateSource] as [AggregateSource], A0.[Guid] as [Guid], A0.[IsDefault] as [IsDefault], A0.[Account] as [Account], A0.[AccountNumber] as [AccountNumber], A0.[Amount] as [Amount], A0.[ChargeType] as [ChargeType], A0.[Description] as [Description], A0.[DiscPoss] as [DiscPoss], A0.[Discount] as [Discount], A0.[GSTIncluded] as [GSTIncluded], A0.[HistoryType] as [HistoryType], A0.[Operator] as [Operator], A0.[PatientNumber] as [PatientNumber], A0.[Quantity] as [Quantity], A0.[ReferenceNumber] as [ReferenceNumber], A0.[TimeOccured] as [TimeOccured], A0.[TransactionClass] as [TransactionClass], A0.[TransactionNumber] as [TransactionNumber], A0.[WardNumber] as [WardNumber] from [dbo].[doWilliamActivityHistory] A0 
  left outer join [dbo].[doDataObject] A1 on A0.[ID]=A1.[ID]
GO
/****** Object:  Index [IX_AccountNumber]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_AccountNumber] ON [dbo].[doAccount]
(
	[AccountNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AccountOwner]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_AccountOwner] ON [dbo].[doAccount]
(
	[AccountOwner] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AccountType]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_AccountType] ON [dbo].[doAccount]
(
	[AccountType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doAccount]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Customer]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Customer] ON [dbo].[doAccount]
(
	[Customer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doAccount]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doAccount]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AccountType]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_AccountType] ON [dbo].[doAccountAllocation]
(
	[AccountType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AccountTypeOwner]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_AccountTypeOwner] ON [dbo].[doAccountAllocation]
(
	[AccountTypeOwner] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ChargeAccount]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_ChargeAccount] ON [dbo].[doAccountAllocation]
(
	[ChargeAccount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ChargeType]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_ChargeType] ON [dbo].[doAccountAllocation]
(
	[ChargeType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doAccountAllocation]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doAccountAllocation]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doAccountAllocation]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doAccountType]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doAccountType]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doAccountType]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Batch]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Batch] ON [dbo].[doActivity]
(
	[Batch] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Cashier]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Cashier] ON [dbo].[doActivity]
(
	[Cashier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doActivity]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Customer]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Customer] ON [dbo].[doActivity]
(
	[Customer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doActivity]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_HiddenReverseActivity]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_HiddenReverseActivity] ON [dbo].[doActivity]
(
	[HiddenReverseActivity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IBHeaderGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IBHeaderGuid] ON [dbo].[doActivity]
(
	[IBHeaderGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doActivity]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_LaybyAccount]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_LaybyAccount] ON [dbo].[doActivity]
(
	[LaybyAccount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_LoyaltyAccount]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_LoyaltyAccount] ON [dbo].[doActivity]
(
	[LoyaltyAccount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RapidObjectGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RapidObjectGuid] ON [dbo].[doActivity]
(
	[RapidObjectGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RecordStatus]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RecordStatus] ON [dbo].[doActivity]
(
	[RecordStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Register]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Register] ON [dbo].[doActivity]
(
	[Register] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Statement]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Statement] ON [dbo].[doActivity]
(
	[Statement] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TimeOccured]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_TimeOccured] ON [dbo].[doActivity]
(
	[TimeOccured] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_WiniFredPatient]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_WiniFredPatient] ON [dbo].[doActivity]
(
	[ChargeAccount] ASC,
	[TimeOccured] ASC,
	[ActivityType] ASC,
	[TotalCharged] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doActivityEntry]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doActivityEntry]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doActivityEntry]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ItemTransacted]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_ItemTransacted] ON [dbo].[doActivityEntry]
(
	[ItemTransacted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_ItemTransactedQuantity]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_ItemTransactedQuantity] ON [dbo].[doActivityEntry]
(
	[Activity] ASC,
	[ItemTransacted] ASC,
	[Quantity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_QuantityDiscountScheme]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_QuantityDiscountScheme] ON [dbo].[doActivityEntry]
(
	[QuantityDiscountScheme] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Script]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Script] ON [dbo].[doActivityEntry]
(
	[Script] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Owner]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Owner] ON [dbo].[doActivityEntry-ReconcileEntry]
(
	[Owner] ASC,
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AlertedObject]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_AlertedObject] ON [dbo].[doAlert]
(
	[AlertedObject] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AssignedTo]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_AssignedTo] ON [dbo].[doAlert]
(
	[AssignedTo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doAlert]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AssignedTo]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_AssignedTo] ON [dbo].[doAlertTrigger]
(
	[AssignedTo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doAlertTrigger]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Alias_CIA]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Alias_CIA] ON [dbo].[doAlias]
(
	[Code] ASC,
	[ItemAliased] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doAlias]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doAlias]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_IBHeaderGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IBHeaderGuid] ON [dbo].[doAlias]
(
	[IBHeaderGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doAlias]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ItemAliased]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_ItemAliased] ON [dbo].[doAlias]
(
	[ItemAliased] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_LastItemAliased]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_LastItemAliased] ON [dbo].[doAlias]
(
	[LastItemAliased] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RapidObjectGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RapidObjectGuid] ON [dbo].[doAlias]
(
	[RapidObjectGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RecordStatus]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RecordStatus] ON [dbo].[doAlias]
(
	[RecordStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doAssistantTask]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AuditActionType]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_AuditActionType] ON [dbo].[doAudit]
(
	[AuditActionType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AuditedObject]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_AuditedObject] ON [dbo].[doAudit]
(
	[AuditedObject] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AuditType]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_AuditType] ON [dbo].[doAudit]
(
	[AuditType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ObjectType]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_ObjectType] ON [dbo].[doAudit]
(
	[ObjectType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SourceName]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_SourceName] ON [dbo].[doAudit]
(
	[SourceName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doAuditAggregateDataObject]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doAuditAggregateDataObject]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doAuditAggregateDataObject]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doAuditDataObject]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BatchNumber]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_BatchNumber] ON [dbo].[doBatch]
(
	[BatchNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doBatch]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doBatch]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_IBHeaderGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IBHeaderGuid] ON [dbo].[doBatch]
(
	[IBHeaderGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doBatch]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_RapidObjectGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RapidObjectGuid] ON [dbo].[doBatch]
(
	[RapidObjectGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_RecordStatus]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RecordStatus] ON [dbo].[doBatch]
(
	[RecordStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Register]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Register] ON [dbo].[doBatch]
(
	[Register] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doBusinessUnit]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doBusinessUnit]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IBHeaderGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IBHeaderGuid] ON [dbo].[doBusinessUnit]
(
	[IBHeaderGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doBusinessUnit]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RapidObjectGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RapidObjectGuid] ON [dbo].[doBusinessUnit]
(
	[RapidObjectGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RecordStatus]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RecordStatus] ON [dbo].[doBusinessUnit]
(
	[RecordStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SystemGSTFreeItemTax]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_SystemGSTFreeItemTax] ON [dbo].[doBusinessUnit]
(
	[SystemGSTFreeItemTax] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SystemGSTItemTax]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_SystemGSTItemTax] ON [dbo].[doBusinessUnit]
(
	[SystemGSTItemTax] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SystemNoGSTItemTax]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_SystemNoGSTItemTax] ON [dbo].[doBusinessUnit]
(
	[SystemNoGSTItemTax] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Audit_AO]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Audit_AO] ON [dbo].[doBusinessUnit-AuditHistory]
(
	[AuditedObject] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Audit_AOD]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Audit_AOD] ON [dbo].[doBusinessUnit-AuditHistory]
(
	[AuditedObject] ASC,
	[AuditDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Audit_FLD_OBJ_AD_AO]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Audit_FLD_OBJ_AD_AO] ON [dbo].[doBusinessUnit-AuditHistory]
(
	[Field] ASC,
	[ObjectType] ASC,
	[AuditDate] ASC,
	[AuditedObject] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Owner]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Owner] ON [dbo].[doBusinessUnit-AuditHistory]
(
	[Owner] ASC,
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Event_AGO]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Event_AGO] ON [dbo].[doBusinessUnit-Events]
(
	[AggregateObject] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Event_EVT]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Event_EVT] ON [dbo].[doBusinessUnit-Events]
(
	[EventType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Event_REL]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Event_REL] ON [dbo].[doBusinessUnit-Events]
(
	[Relationship] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Owner]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Owner] ON [dbo].[doBusinessUnit-Events]
(
	[Owner] ASC,
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Owner]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Owner] ON [dbo].[doBusinessUnit-MandatoryFields]
(
	[Owner] ASC,
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doCashier]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doCashier]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doCashier]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doCategory]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Department]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Department] ON [dbo].[doCategory]
(
	[Department] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doCategory]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IBHeaderGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IBHeaderGuid] ON [dbo].[doCategory]
(
	[IBHeaderGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doCategory]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Name]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Name] ON [dbo].[doCategory]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RapidObjectGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RapidObjectGuid] ON [dbo].[doCategory]
(
	[RapidObjectGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RecordStatus]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RecordStatus] ON [dbo].[doCategory]
(
	[RecordStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Code]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Code] ON [dbo].[doChargeType]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doChargeType]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doChargeType]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doChargeType]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doClaim]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doClaim]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doClaim]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doCurrency]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Description]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Description] ON [dbo].[doCurrency]
(
	[Description] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doCurrency]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IBHeaderGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IBHeaderGuid] ON [dbo].[doCurrency]
(
	[IBHeaderGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doCurrency]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RapidObjectGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RapidObjectGuid] ON [dbo].[doCurrency]
(
	[RapidObjectGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RecordStatus]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RecordStatus] ON [dbo].[doCurrency]
(
	[RecordStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doCustomer]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doCustomer]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doCustomer]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doDataAssistantTemplate]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Name]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Name] ON [dbo].[doDataAssistantTemplate]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TypeID]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_TypeID] ON [dbo].[doDataObject]
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doDepartment]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doDepartment]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IBHeaderGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IBHeaderGuid] ON [dbo].[doDepartment]
(
	[IBHeaderGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doDepartment]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RapidObjectGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RapidObjectGuid] ON [dbo].[doDepartment]
(
	[RapidObjectGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RecordStatus]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RecordStatus] ON [dbo].[doDepartment]
(
	[RecordStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doDimension]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doDimension]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IBHeaderGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IBHeaderGuid] ON [dbo].[doDimension]
(
	[IBHeaderGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doDimension]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RapidObjectGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RapidObjectGuid] ON [dbo].[doDimension]
(
	[RapidObjectGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RecordStatus]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RecordStatus] ON [dbo].[doDimension]
(
	[RecordStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doDimensionAttribute]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Dimension]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Dimension] ON [dbo].[doDimensionAttribute]
(
	[Dimension] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doDimensionAttribute]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IBHeaderGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IBHeaderGuid] ON [dbo].[doDimensionAttribute]
(
	[IBHeaderGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doDimensionAttribute]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RapidObjectGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RapidObjectGuid] ON [dbo].[doDimensionAttribute]
(
	[RapidObjectGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RecordStatus]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RecordStatus] ON [dbo].[doDimensionAttribute]
(
	[RecordStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doDoctor]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DoctorCode]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_DoctorCode] ON [dbo].[doDoctor]
(
	[DoctorCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doDoctor]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doDoctor]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PrescriberNumber]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_PrescriberNumber] ON [dbo].[doDoctor]
(
	[PrescriberNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doDraft]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserAccount]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserAccount] ON [dbo].[doDraft]
(
	[UserAccount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doDraftEntry]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Draft]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Draft] ON [dbo].[doDraftEntry]
(
	[Draft] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DraftItem]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_DraftItem] ON [dbo].[doDraftEntry]
(
	[DraftItem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Supplier]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Supplier] ON [dbo].[doDraftEntry]
(
	[Supplier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SupplierItem]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_SupplierItem] ON [dbo].[doDraftEntry]
(
	[SupplierItem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Batch]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Batch] ON [dbo].[doDropPayout]
(
	[Batch] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Cashier]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Cashier] ON [dbo].[doDropPayout]
(
	[Cashier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doDropPayout]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doDropPayout]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doDropPayout]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_ReasonCode]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_ReasonCode] ON [dbo].[doDropPayout]
(
	[ReasonCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Code]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Code] ON [dbo].[doDrug]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doDrug]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DrugItem]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_DrugItem] ON [dbo].[doDrug]
(
	[DrugItem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doDrug]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doDrug]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doEmailTemplate]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Name]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Name] ON [dbo].[doEmailTemplate]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Owner]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Owner] ON [dbo].[doEmailTemplate-EmailImage]
(
	[Owner] ASC,
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FTRU]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_FTRU] ON [dbo].[doFtObject]
(
	[FtRecordIsUpToDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FtObject]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_FtObject] ON [dbo].[doFtRecord]
(
	[FtObject] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsIndexed]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsIndexed] ON [dbo].[doFtRecord]
(
	[IsIndexed] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doGroup]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_GroupType]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_GroupType] ON [dbo].[doGroup]
(
	[GroupType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doGroup]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doGroup]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXR]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IXR] ON [dbo].[doGroup-GroupEntries]
(
	[ID-2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IXR]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IXR] ON [dbo].[doILabelSource-LabelQueues]
(
	[ID-2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doInvoice]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Currency]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Currency] ON [dbo].[doInvoice]
(
	[Currency] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doInvoice]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_IBHeaderGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IBHeaderGuid] ON [dbo].[doInvoice]
(
	[IBHeaderGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Invoice_ITICID]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Invoice_ITICID] ON [dbo].[doInvoice]
(
	[InvoiceType] ASC,
	[IsClosed] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_InvoiceGatewayID]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_InvoiceGatewayID] ON [dbo].[doInvoice]
(
	[InvoiceGatewayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_InvoiceType]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_InvoiceType] ON [dbo].[doInvoice]
(
	[InvoiceType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doInvoice]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_PurchaseOrderGatewayID]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_PurchaseOrderGatewayID] ON [dbo].[doInvoice]
(
	[PurchaseOrderGatewayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_RapidObjectGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RapidObjectGuid] ON [dbo].[doInvoice]
(
	[RapidObjectGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RecordStatus]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RecordStatus] ON [dbo].[doInvoice]
(
	[RecordStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Supplier]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Supplier] ON [dbo].[doInvoice]
(
	[Supplier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_TransferActivity]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_TransferActivity] ON [dbo].[doInvoice]
(
	[TransferActivity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_TransferReference]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_TransferReference] ON [dbo].[doInvoice]
(
	[TransferReference] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doInvoiceEntry]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doInvoiceEntry]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_IBHeaderGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IBHeaderGuid] ON [dbo].[doInvoiceEntry]
(
	[IBHeaderGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Invoice]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Invoice] ON [dbo].[doInvoiceEntry]
(
	[Invoice] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_InvoicedItem]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_InvoicedItem] ON [dbo].[doInvoiceEntry]
(
	[InvoicedItem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doInvoiceEntry]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ItemTax]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_ItemTax] ON [dbo].[doInvoiceEntry]
(
	[ItemTax] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RapidObjectGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RapidObjectGuid] ON [dbo].[doInvoiceEntry]
(
	[RapidObjectGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RecordStatus]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RecordStatus] ON [dbo].[doInvoiceEntry]
(
	[RecordStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Reference]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Reference] ON [dbo].[doInvoiceEntry]
(
	[Reference] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doInvoiceEntryReceive]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doInvoiceEntryReceive]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_IBHeaderGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IBHeaderGuid] ON [dbo].[doInvoiceEntryReceive]
(
	[IBHeaderGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_InvoicePurchaseOrderEntry]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_InvoicePurchaseOrderEntry] ON [dbo].[doInvoiceEntryReceive]
(
	[InvoiceEntry] ASC,
	[PurchaseOrderEntry] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doInvoiceEntryReceive]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_PurchaseOrderEntryInvoice]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_PurchaseOrderEntryInvoice] ON [dbo].[doInvoiceEntryReceive]
(
	[PurchaseOrderEntry] ASC,
	[InvoiceEntry] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_RapidObjectGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RapidObjectGuid] ON [dbo].[doInvoiceEntryReceive]
(
	[RapidObjectGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RecordStatus]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RecordStatus] ON [dbo].[doInvoiceEntryReceive]
(
	[RecordStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doInvoiceOtherCost]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doInvoiceOtherCost]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_IBHeaderGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IBHeaderGuid] ON [dbo].[doInvoiceOtherCost]
(
	[IBHeaderGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Invoice]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Invoice] ON [dbo].[doInvoiceOtherCost]
(
	[Invoice] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doInvoiceOtherCost]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_ItemTax]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_ItemTax] ON [dbo].[doInvoiceOtherCost]
(
	[ItemTax] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_RapidObjectGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RapidObjectGuid] ON [dbo].[doInvoiceOtherCost]
(
	[RapidObjectGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_RecordStatus]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RecordStatus] ON [dbo].[doInvoiceOtherCost]
(
	[RecordStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IXR]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IXR] ON [dbo].[doInvoiceOtherCost-PurchaseOrderEntries]
(
	[ID-2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ActivePromotionEntry]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_ActivePromotionEntry] ON [dbo].[doItem]
(
	[ActivePromotionEntry] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AppCatHQID]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_AppCatHQID] ON [dbo].[doItem]
(
	[AppCatHQID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Dimension1]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Dimension1] ON [dbo].[doItem]
(
	[Dimension1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Dimension2]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Dimension2] ON [dbo].[doItem]
(
	[Dimension2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Dimension3]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Dimension3] ON [dbo].[doItem]
(
	[Dimension3] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Item_SearchCovering]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Item_SearchCovering] ON [dbo].[doItem]
(
	[AppCatHQID] ASC,
	[FixedPrice] ASC,
	[ID] ASC,
	[MSRP] ASC,
	[HideOnNetDisplay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_LabelTemplate]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_LabelTemplate] ON [dbo].[doItem]
(
	[LabelTemplate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_ParentItem]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_ParentItem] ON [dbo].[doItem]
(
	[ParentItem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_QuantityDiscountScheme]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_QuantityDiscountScheme] ON [dbo].[doItem]
(
	[QuantityDiscountScheme] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ROU]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_ROU] ON [dbo].[doItem]
(
	[ROUScheme] ASC,
	[ROUValue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_StockTake]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_StockTake] ON [dbo].[doItem]
(
	[LastCounted] ASC,
	[ID] ASC,
	[LastStockCount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_TagAlongItem]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_TagAlongItem] ON [dbo].[doItem]
(
	[TagAlongItem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Category]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Category] ON [dbo].[doItemBase]
(
	[Category] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_CodeDescription]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_CodeDescription] ON [dbo].[doItemBase]
(
	[Code] ASC,
	[Description] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doItemBase]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_CreatedCostQOH]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_CreatedCostQOH] ON [dbo].[doItemBase]
(
	[Created] ASC,
	[Cost] ASC,
	[QuantityOnHand] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_DefaultSupplier]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_DefaultSupplier] ON [dbo].[doItemBase]
(
	[DefaultSupplier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Department]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Department] ON [dbo].[doItemBase]
(
	[Department] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Description]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Description] ON [dbo].[doItemBase]
(
	[Description] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doItemBase]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_IBHeaderGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IBHeaderGuid] ON [dbo].[doItemBase]
(
	[IBHeaderGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doItemBase]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ItemClassification]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_ItemClassification] ON [dbo].[doItemBase]
(
	[ItemClassification] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_ItemMessage]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_ItemMessage] ON [dbo].[doItemBase]
(
	[ItemMessage] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ItemTax]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_ItemTax] ON [dbo].[doItemBase]
(
	[ItemTax] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_ItemType]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_ItemType] ON [dbo].[doItemBase]
(
	[ItemType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Manufacturer]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Manufacturer] ON [dbo].[doItemBase]
(
	[Manufacturer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Merged]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Merged] ON [dbo].[doItemBase]
(
	[Merged] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Moved]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Moved] ON [dbo].[doItemBase]
(
	[Moved] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OutOfStock]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_OutOfStock] ON [dbo].[doItemBase]
(
	[OutOfStock] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_PreferredSupplier]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_PreferredSupplier] ON [dbo].[doItemBase]
(
	[PreferredSupplier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_PricingPlan]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_PricingPlan] ON [dbo].[doItemBase]
(
	[PricingPlan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PurchaseTax]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_PurchaseTax] ON [dbo].[doItemBase]
(
	[PurchaseTax] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_RapidObjectGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RapidObjectGuid] ON [dbo].[doItemBase]
(
	[RapidObjectGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RecordStatus]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RecordStatus] ON [dbo].[doItemBase]
(
	[RecordStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SubCategory]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_SubCategory] ON [dbo].[doItemBase]
(
	[SubCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doItemClassComponent]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doItemClassComponent]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IBHeaderGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IBHeaderGuid] ON [dbo].[doItemClassComponent]
(
	[IBHeaderGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doItemClassComponent]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ItemClass]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_ItemClass] ON [dbo].[doItemClassComponent]
(
	[ItemClass] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ItemComponent]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_ItemComponent] ON [dbo].[doItemClassComponent]
(
	[ItemComponent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RapidObjectGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RapidObjectGuid] ON [dbo].[doItemClassComponent]
(
	[RapidObjectGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RecordStatus]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RecordStatus] ON [dbo].[doItemClassComponent]
(
	[RecordStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doItemClassification]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doItemClassification]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IBHeaderGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IBHeaderGuid] ON [dbo].[doItemClassification]
(
	[IBHeaderGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doItemClassification]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RapidObjectGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RapidObjectGuid] ON [dbo].[doItemClassification]
(
	[RapidObjectGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RecordStatus]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RecordStatus] ON [dbo].[doItemClassification]
(
	[RecordStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doItemCodeScheme]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ItemUsed]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ItemUsed] ON [dbo].[doItem-ItemUsage]
(
	[ItemUsed] ASC,
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doItemManager]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doItemManager]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doItemManager]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Category]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Category] ON [dbo].[doItemManagerEntry]
(
	[Category] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doItemManagerEntry]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Department]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Department] ON [dbo].[doItemManagerEntry]
(
	[Department] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doItemManagerEntry]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doItemManagerEntry]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Item]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Item] ON [dbo].[doItemManagerEntry]
(
	[Item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_ItemManager]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_ItemManager] ON [dbo].[doItemManagerEntry]
(
	[ItemManager] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_ItemTax]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_ItemTax] ON [dbo].[doItemManagerEntry]
(
	[ItemTax] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_ROUScheme]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_ROUScheme] ON [dbo].[doItemManagerEntry]
(
	[ROUScheme] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doItemMergeQueue]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Owner]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Owner] ON [dbo].[doItemMergeQueue-SupplierItems]
(
	[Owner] ASC,
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doItemMessage]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doItemMessage]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IBHeaderGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IBHeaderGuid] ON [dbo].[doItemMessage]
(
	[IBHeaderGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doItemMessage]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RapidObjectGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RapidObjectGuid] ON [dbo].[doItemMessage]
(
	[RapidObjectGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RecordStatus]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RecordStatus] ON [dbo].[doItemMessage]
(
	[RecordStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AFTQTY]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_AFTQTY] ON [dbo].[doItemMovementHistory]
(
	[AfterQuantity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doItemMovementHistory]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Date]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Date] ON [dbo].[doItemMovementHistory]
(
	[Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_DATE_ITEM]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_DATE_ITEM] ON [dbo].[doItemMovementHistory]
(
	[Date] ASC,
	[ItemUsed] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doItemMovementHistory]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_IBHeaderGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IBHeaderGuid] ON [dbo].[doItemMovementHistory]
(
	[IBHeaderGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doItemMovementHistory]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ItemUsed]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_ItemUsed] ON [dbo].[doItemMovementHistory]
(
	[ItemUsed] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_ItemUsedDateMovementType]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_ItemUsedDateMovementType] ON [dbo].[doItemMovementHistory]
(
	[MovementType] ASC,
	[ItemUsed] ASC,
	[Date] ASC,
	[AdjustmentQuantity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_MovementSource]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_MovementSource] ON [dbo].[doItemMovementHistory]
(
	[MovementSource] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_RapidObjectGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RapidObjectGuid] ON [dbo].[doItemMovementHistory]
(
	[RapidObjectGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Reason]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Reason] ON [dbo].[doItemMovementHistory]
(
	[Reason] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RecordStatus]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RecordStatus] ON [dbo].[doItemMovementHistory]
(
	[RecordStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doItemPricingHistory]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doItemPricingHistory]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doItemPricingHistory]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_ItemUsed]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_ItemUsed] ON [dbo].[doItemPricingHistory]
(
	[ItemUsed] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doItemTax]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doItemTax]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IBHeaderGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IBHeaderGuid] ON [dbo].[doItemTax]
(
	[IBHeaderGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doItemTax]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RapidObjectGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RapidObjectGuid] ON [dbo].[doItemTax]
(
	[RapidObjectGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RecordStatus]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RecordStatus] ON [dbo].[doItemTax]
(
	[RecordStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Tax01]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Tax01] ON [dbo].[doItemTax]
(
	[Tax01] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Tax02]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Tax02] ON [dbo].[doItemTax]
(
	[Tax02] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Tax03]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Tax03] ON [dbo].[doItemTax]
(
	[Tax03] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Tax04]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Tax04] ON [dbo].[doItemTax]
(
	[Tax04] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Tax05]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Tax05] ON [dbo].[doItemTax]
(
	[Tax05] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Tax06]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Tax06] ON [dbo].[doItemTax]
(
	[Tax06] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Tax07]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Tax07] ON [dbo].[doItemTax]
(
	[Tax07] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Tax08]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Tax08] ON [dbo].[doItemTax]
(
	[Tax08] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Tax09]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Tax09] ON [dbo].[doItemTax]
(
	[Tax09] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Tax10]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Tax10] ON [dbo].[doItemTax]
(
	[Tax10] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ComponentItem]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_ComponentItem] ON [dbo].[doKit]
(
	[ComponentItem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doKit]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doKit]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doKit]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_KitItem]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_KitItem] ON [dbo].[doKit]
(
	[KitItem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doLabelElement]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doLabelPrinting]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Name]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Name] ON [dbo].[doLabelPrinting]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXR]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IXR] ON [dbo].[doLabelPrinting-LabelElements]
(
	[ID-2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doLabelQueue]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_LabelQueue_Item_Source]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_LabelQueue_Item_Source] ON [dbo].[doLabelQueue]
(
	[Item] ASC,
	[Source] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_LabelTemplate]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_LabelTemplate] ON [dbo].[doLabelQueue]
(
	[LabelTemplate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Source]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Source] ON [dbo].[doLabelQueue]
(
	[Source] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doMatrixAttributeDisplayOrder]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Dimension]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Dimension] ON [dbo].[doMatrixAttributeDisplayOrder]
(
	[Dimension] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DimensionAttribute]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimensionAttribute] ON [dbo].[doMatrixAttributeDisplayOrder]
(
	[DimensionAttribute] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doMatrixAttributeDisplayOrder]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IBHeaderGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IBHeaderGuid] ON [dbo].[doMatrixAttributeDisplayOrder]
(
	[IBHeaderGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doMatrixAttributeDisplayOrder]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ItemClass]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_ItemClass] ON [dbo].[doMatrixAttributeDisplayOrder]
(
	[ItemClass] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RapidObjectGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RapidObjectGuid] ON [dbo].[doMatrixAttributeDisplayOrder]
(
	[RapidObjectGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RecordStatus]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RecordStatus] ON [dbo].[doMatrixAttributeDisplayOrder]
(
	[RecordStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doNameValuePair]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Name]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Name] ON [dbo].[doNameValuePair]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Code]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Code] ON [dbo].[doNursingHome]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doNursingHome]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doNursingHome]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doNursingHome]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Campaign]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Campaign] ON [dbo].[doOffer]
(
	[Campaign] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Code]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Code] ON [dbo].[doOffer]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doOffer]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doOffer]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doOffer]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_StartEndDates]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_StartEndDates] ON [dbo].[doOffer]
(
	[StartDate] ASC,
	[EndDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doOfferCampaign]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doOfferCampaign]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doOfferCampaign]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Name]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Name] ON [dbo].[doOfferCampaign]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doOfferEntry]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doOfferEntry]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doOfferEntry]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Offer]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Offer] ON [dbo].[doOfferEntry]
(
	[Offer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_OfferItem]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_OfferItem] ON [dbo].[doOfferEntry]
(
	[OfferItem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_SourceItem]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_SourceItem] ON [dbo].[doOfferEntry]
(
	[SourceItem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doOrderTemplate]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doOrderTemplate]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doOrderTemplate]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doOutOfStockItem]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Item]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Item] ON [dbo].[doOutOfStockItem]
(
	[Item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_LastSupplier]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_LastSupplier] ON [dbo].[doOutOfStockItem]
(
	[LastSupplier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PurchaseOrder]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_PurchaseOrder] ON [dbo].[doOutOfStockItem]
(
	[PurchaseOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doPatient]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Customer]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Customer] ON [dbo].[doPatient]
(
	[Customer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_FirstName]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_FirstName] ON [dbo].[doPatient]
(
	[FirstName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doPatient]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doPatient]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_LastName]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_LastName] ON [dbo].[doPatient]
(
	[LastName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientNumber]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_PatientNumber] ON [dbo].[doPatient]
(
	[PatientNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientScriptRule]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_PatientScriptRule] ON [dbo].[doPatient]
(
	[NursingHome] ASC,
	[PatientNumber] ASC,
	[Customer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Ward]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Ward] ON [dbo].[doPatient]
(
	[Ward] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doPharmacist]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doPharmacist]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doPharmacist]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PharmacistsInitials]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_PharmacistsInitials] ON [dbo].[doPharmacist]
(
	[PharmacistsInitials] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doPharmXAccount]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doPlanogram]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PlanogramItem]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_PlanogramItem] ON [dbo].[doPlanogram]
(
	[PlanogramItem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PlanogramLocation]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_PlanogramLocation] ON [dbo].[doPlanogram]
(
	[PlanogramLocation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doPlanogramLocation]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doPricingPlan]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doPricingPlan]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doPricingPlan]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Supplier]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Supplier] ON [dbo].[doPricingPlan]
(
	[Supplier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doPricingReview]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doPricingReview]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_IBHeaderGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IBHeaderGuid] ON [dbo].[doPricingReview]
(
	[IBHeaderGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doPricingReview]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_PricingReviewLookup]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_PricingReviewLookup] ON [dbo].[doPricingReview]
(
	[PricingReviewSourceType] ASC,
	[InActive] ASC,
	[IsApplied] ASC,
	[CommittedDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_RapidObjectGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RapidObjectGuid] ON [dbo].[doPricingReview]
(
	[RapidObjectGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_RecordStatus]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RecordStatus] ON [dbo].[doPricingReview]
(
	[RecordStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doPricingReviewEntry]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doPricingReviewEntry]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_IBHeaderGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IBHeaderGuid] ON [dbo].[doPricingReviewEntry]
(
	[IBHeaderGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doPricingReviewEntry]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Item]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Item] ON [dbo].[doPricingReviewEntry]
(
	[Item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_PricingGrid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_PricingGrid] ON [dbo].[doPricingReviewEntry]
(
	[InActive] ASC,
	[AcceptStatus] ASC,
	[ID] ASC,
	[PricingReview] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_PricingReview]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_PricingReview] ON [dbo].[doPricingReviewEntry]
(
	[PricingReview] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_RapidObjectGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RapidObjectGuid] ON [dbo].[doPricingReviewEntry]
(
	[RapidObjectGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_RecordStatus]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RecordStatus] ON [dbo].[doPricingReviewEntry]
(
	[RecordStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Name]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Name] ON [dbo].[doPrincipal]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXR]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IXR] ON [dbo].[doPrincipal-Roles]
(
	[ID-2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doPromotion]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doPromotion]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IBHeaderGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IBHeaderGuid] ON [dbo].[doPromotion]
(
	[IBHeaderGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doPromotion]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RapidObjectGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RapidObjectGuid] ON [dbo].[doPromotion]
(
	[RapidObjectGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RecordStatus]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RecordStatus] ON [dbo].[doPromotion]
(
	[RecordStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Supplier]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Supplier] ON [dbo].[doPromotion]
(
	[Supplier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doPromotionEntry]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doPromotionEntry]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IBHeaderGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IBHeaderGuid] ON [dbo].[doPromotionEntry]
(
	[IBHeaderGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doPromotionEntry]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Promotion]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Promotion] ON [dbo].[doPromotionEntry]
(
	[Promotion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PromotionItem]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_PromotionItem] ON [dbo].[doPromotionEntry]
(
	[PromotionItem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_QuantityDiscountScheme]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_QuantityDiscountScheme] ON [dbo].[doPromotionEntry]
(
	[QuantityDiscountScheme] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RapidObjectGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RapidObjectGuid] ON [dbo].[doPromotionEntry]
(
	[RapidObjectGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RecordStatus]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RecordStatus] ON [dbo].[doPromotionEntry]
(
	[RecordStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SourceItem]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_SourceItem] ON [dbo].[doPromotionEntry]
(
	[SourceItem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doPurchaseOrder]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Currency]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Currency] ON [dbo].[doPurchaseOrder]
(
	[Currency] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doPurchaseOrder]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_IBHeaderGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IBHeaderGuid] ON [dbo].[doPurchaseOrder]
(
	[IBHeaderGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doPurchaseOrder]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_PurchaseOrder]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_PurchaseOrder] ON [dbo].[doPurchaseOrder]
(
	[PurchaseOrderStatus] ASC,
	[PurchaseOrderType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_PurchaseOrderSource]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_PurchaseOrderSource] ON [dbo].[doPurchaseOrder]
(
	[PurchaseOrderSource] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_PurchaseOrderStatus]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_PurchaseOrderStatus] ON [dbo].[doPurchaseOrder]
(
	[PurchaseOrderStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_PurchaseOrderType]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_PurchaseOrderType] ON [dbo].[doPurchaseOrder]
(
	[PurchaseOrderType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_RapidObjectGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RapidObjectGuid] ON [dbo].[doPurchaseOrder]
(
	[RapidObjectGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_RecordStatus]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RecordStatus] ON [dbo].[doPurchaseOrder]
(
	[RecordStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Supplier]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Supplier] ON [dbo].[doPurchaseOrder]
(
	[Supplier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_TransferReason]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_TransferReason] ON [dbo].[doPurchaseOrder]
(
	[TransferReason] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_CostCalculations]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_CostCalculations] ON [dbo].[doPurchaseOrderEntry]
(
	[PurchaseOrder] ASC,
	[OrderCost] ASC,
	[ExtOrderCostTax] ASC,
	[QuantityOrdered] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doPurchaseOrderEntry]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doPurchaseOrderEntry]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_IBHeaderGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IBHeaderGuid] ON [dbo].[doPurchaseOrderEntry]
(
	[IBHeaderGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doPurchaseOrderEntry]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ItemTax]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_ItemTax] ON [dbo].[doPurchaseOrderEntry]
(
	[ItemTax] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderedItem]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_OrderedItem] ON [dbo].[doPurchaseOrderEntry]
(
	[OrderedItem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_RapidObjectGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RapidObjectGuid] ON [dbo].[doPurchaseOrderEntry]
(
	[RapidObjectGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ReasonCode]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_ReasonCode] ON [dbo].[doPurchaseOrderEntry]
(
	[ReasonCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RecordStatus]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RecordStatus] ON [dbo].[doPurchaseOrderEntry]
(
	[RecordStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doQuantityDiscountScheme]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Description]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Description] ON [dbo].[doQuantityDiscountScheme]
(
	[Description] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doQuantityDiscountScheme]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IBHeaderGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IBHeaderGuid] ON [dbo].[doQuantityDiscountScheme]
(
	[IBHeaderGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doQuantityDiscountScheme]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RapidObjectGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RapidObjectGuid] ON [dbo].[doQuantityDiscountScheme]
(
	[RapidObjectGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RecordStatus]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RecordStatus] ON [dbo].[doQuantityDiscountScheme]
(
	[RecordStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doRapidAuditAggregateDataObject]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doRapidAuditAggregateDataObject]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IBHeaderGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IBHeaderGuid] ON [dbo].[doRapidAuditAggregateDataObject]
(
	[IBHeaderGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doRapidAuditAggregateDataObject]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RapidObjectGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RapidObjectGuid] ON [dbo].[doRapidAuditAggregateDataObject]
(
	[RapidObjectGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RecordStatus]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RecordStatus] ON [dbo].[doRapidAuditAggregateDataObject]
(
	[RecordStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doRapidRecordStatus]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doRapidRecordStatus]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doRapidRecordStatus]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Owner]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Owner] ON [dbo].[doRapid-Worksheets]
(
	[Owner] ASC,
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Rapid_PWT]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Rapid_PWT] ON [dbo].[doRapid-Worksheets]
(
	[Processed] ASC,
	[WorksheetType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doRateOfUsageDateDefinition]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doRateOfUsageDateDefinition]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doRateOfUsageDateDefinition]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RateOfUsageScheme]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RateOfUsageScheme] ON [dbo].[doRateOfUsageDateDefinition]
(
	[RateOfUsageScheme] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doRateOfUsageScheme]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Description]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Description] ON [dbo].[doRateOfUsageScheme]
(
	[Description] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doRateOfUsageScheme]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doRateOfUsageScheme]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doReasonCode]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doReasonCode]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doReasonCode]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doRegister]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doRegister]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IBHeaderGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IBHeaderGuid] ON [dbo].[doRegister]
(
	[IBHeaderGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doRegister]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RapidObjectGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RapidObjectGuid] ON [dbo].[doRegister]
(
	[RapidObjectGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RecordStatus]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RecordStatus] ON [dbo].[doRegister]
(
	[RecordStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RegisterNumber]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RegisterNumber] ON [dbo].[doRegister]
(
	[RegisterNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ActivatingRelationship]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_ActivatingRelationship] ON [dbo].[doRelationship]
(
	[ActivatingRelationship] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Operation]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Operation] ON [dbo].[doRelationship]
(
	[Operation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RelationshipState]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RelationshipState] ON [dbo].[doRelationship]
(
	[RelationshipState] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Actions_EC]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Actions_EC] ON [dbo].[doRelationship-Actions]
(
	[EntityName] ASC,
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Owner]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Owner] ON [dbo].[doRelationship-Actions]
(
	[Owner] ASC,
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AggregateKey_AGO]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_AggregateKey_AGO] ON [dbo].[doRelationship-AggregateKeys]
(
	[AggregateObject] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AggregateKey_EKR]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_AggregateKey_EKR] ON [dbo].[doRelationship-AggregateKeys]
(
	[Relation] ASC,
	[Entity] ASC,
	[ParentKey] ASC,
	[ForeignKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_AggregateKey_RAO]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_AggregateKey_RAO] ON [dbo].[doRelationship-AggregateKeys]
(
	[Relation] ASC,
	[AggregateObjectGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Owner]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Owner] ON [dbo].[doRelationship-AggregateKeys]
(
	[Owner] ASC,
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Conflict_AGO]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Conflict_AGO] ON [dbo].[doRelationship-Conflicts]
(
	[AggregateObject] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Conflict_RLO]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Conflict_RLO] ON [dbo].[doRelationship-Conflicts]
(
	[RelatedObject] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Owner]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Owner] ON [dbo].[doRelationship-Conflicts]
(
	[Owner] ASC,
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Author]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Author] ON [dbo].[doReport]
(
	[Author] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doReport]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Name]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Name] ON [dbo].[doReport]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doReturnToSupplier]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doReturnToSupplier]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doReturnToSupplier]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Supplier]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Supplier] ON [dbo].[doReturnToSupplier]
(
	[Supplier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doReturnToSupplierEntry]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doReturnToSupplierEntry]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doReturnToSupplierEntry]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ItemReturned]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_ItemReturned] ON [dbo].[doReturnToSupplierEntry]
(
	[ItemReturned] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ReturnToSupplier]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_ReturnToSupplier] ON [dbo].[doReturnToSupplierEntry]
(
	[ReturnToSupplier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doSatScanDeviceOptionGral]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doSatScanDeviceOptionStockTake]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doSatScanGunLog]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserLoggedIn]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserLoggedIn] ON [dbo].[doSatScanGunLog]
(
	[UserLoggedIn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doSatScanSettingsGlobal]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doSatScanSettingsLocal]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ActivityAction]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_ActivityAction] ON [dbo].[doScript]
(
	[ActivityAction] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ChargeAccount]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_ChargeAccount] ON [dbo].[doScript]
(
	[ChargeAccount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doScript]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_DispenseDate]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_DispenseDate] ON [dbo].[doScript]
(
	[DispenseDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_DispenseNumber]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_DispenseNumber] ON [dbo].[doScript]
(
	[DispenseNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Doctor]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Doctor] ON [dbo].[doScript]
(
	[Doctor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Drug]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Drug] ON [dbo].[doScript]
(
	[Drug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_DrugItem]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_DrugItem] ON [dbo].[doScript]
(
	[DrugItem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doScript]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doScript]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_NursingHome]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_NursingHome] ON [dbo].[doScript]
(
	[NursingHome] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Patient]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Patient] ON [dbo].[doScript]
(
	[Patient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Pharmacist]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Pharmacist] ON [dbo].[doScript]
(
	[Pharmacist] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Script_DSD]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Script_DSD] ON [dbo].[doScript]
(
	[DispenseDate] ASC,
	[ScriptStatus] ASC,
	[Deleted] ASC,
	[DrugDispenseType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Script_DSPR]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Script_DSPR] ON [dbo].[doScript]
(
	[ActivityAction] ASC,
	[Deleted] ASC,
	[DispenseNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_ScriptNumber]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_ScriptNumber] ON [dbo].[doScript]
(
	[ScriptNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Ward]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Ward] ON [dbo].[doScript]
(
	[Ward] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doScriptConditionOption]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doScriptProcess]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ScriptRule]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_ScriptRule] ON [dbo].[doScriptProcess]
(
	[ScriptRule] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doScriptRule]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doScriptRuleEntry]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ScriptRule]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_ScriptRule] ON [dbo].[doScriptRuleEntry]
(
	[ScriptRule] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doSerial]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doSerial]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doSerial]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Item]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Item] ON [dbo].[doSerial]
(
	[Item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doStatement]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Statement_AED]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Statement_AED] ON [dbo].[doStatement]
(
	[Account] ASC,
	[EndDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Statement_AGD]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Statement_AGD] ON [dbo].[doStatement]
(
	[Account] ASC,
	[GeneratedDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Statement_ASN]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Statement_ASN] ON [dbo].[doStatement]
(
	[Account] ASC,
	[StatementNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_StatementBatch]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_StatementBatch] ON [dbo].[doStatement]
(
	[StatementBatch] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doStatementBatch]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_StatementSchedule]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_StatementSchedule] ON [dbo].[doStatementBatch]
(
	[StatementSchedule] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Owner]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Owner] ON [dbo].[doStatement-EmailQueue]
(
	[Owner] ASC,
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AccountGroup]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_AccountGroup] ON [dbo].[doStatementSchedule]
(
	[AccountGroup] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AccountType]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_AccountType] ON [dbo].[doStatementSchedule]
(
	[AccountType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doStatementSchedule]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_NursingHome]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_NursingHome] ON [dbo].[doStatementSchedule]
(
	[NursingHome] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Password]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Password] ON [dbo].[doStdUser]
(
	[Password] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doStocktake]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doStocktakeEntry]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Stocktake]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Stocktake] ON [dbo].[doStocktakeEntry]
(
	[Stocktake] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_StocktakedItem]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_StocktakedItem] ON [dbo].[doStocktakeEntry]
(
	[StocktakedItem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doSubstitute]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doSubstitute]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IBHeaderGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IBHeaderGuid] ON [dbo].[doSubstitute]
(
	[IBHeaderGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doSubstitute]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Item]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Item] ON [dbo].[doSubstitute]
(
	[Item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RapidObjectGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RapidObjectGuid] ON [dbo].[doSubstitute]
(
	[RapidObjectGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RecordStatus]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RecordStatus] ON [dbo].[doSubstitute]
(
	[RecordStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SubstituteItem]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_SubstituteItem] ON [dbo].[doSubstitute]
(
	[SubstituteItem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AppCatHQID]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_AppCatHQID] ON [dbo].[doSupplier]
(
	[AppCatHQID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doSupplier]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Currency]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Currency] ON [dbo].[doSupplier]
(
	[Currency] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DeliveringSupplier]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_DeliveringSupplier] ON [dbo].[doSupplier]
(
	[DeliveringSupplier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doSupplier]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IBHeaderGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IBHeaderGuid] ON [dbo].[doSupplier]
(
	[IBHeaderGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doSupplier]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RapidObjectGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RapidObjectGuid] ON [dbo].[doSupplier]
(
	[RapidObjectGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RecordStatus]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RecordStatus] ON [dbo].[doSupplier]
(
	[RecordStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TransferOutChargeAccount]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_TransferOutChargeAccount] ON [dbo].[doSupplier]
(
	[TransferOutChargeAccount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doSupplierAccount]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doSupplierAccount]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doSupplierAccount]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Supplier]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Supplier] ON [dbo].[doSupplierAccount]
(
	[Supplier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doSupplierItem]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doSupplierItem]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_IBHeaderGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IBHeaderGuid] ON [dbo].[doSupplierItem]
(
	[IBHeaderGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doSupplierItem]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ItemSupplied]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_ItemSupplied] ON [dbo].[doSupplierItem]
(
	[ItemSupplied] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_ItemTax]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_ItemTax] ON [dbo].[doSupplierItem]
(
	[ItemTax] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PurchaseTax]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_PurchaseTax] ON [dbo].[doSupplierItem]
(
	[PurchaseTax] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_RapidObjectGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RapidObjectGuid] ON [dbo].[doSupplierItem]
(
	[RapidObjectGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RecordStatus]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RecordStatus] ON [dbo].[doSupplierItem]
(
	[RecordStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ReorderNumber]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_ReorderNumber] ON [dbo].[doSupplierItem]
(
	[ReorderNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_SupplierItem_IO]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_SupplierItem_IO] ON [dbo].[doSupplierItem]
(
	[Supplier] ASC,
	[ItemSupplied] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SupplierItem_SR]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_SupplierItem_SR] ON [dbo].[doSupplierItem]
(
	[Supplier] ASC,
	[ReorderNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Name]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Name] ON [dbo].[doSysObjectDefs]
(
	[OBJECT_NAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Value]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Value] ON [dbo].[doSysTypes]
(
	[Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doTax]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doTax]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IBHeaderGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IBHeaderGuid] ON [dbo].[doTax]
(
	[IBHeaderGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doTax]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RapidObjectGuid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RapidObjectGuid] ON [dbo].[doTax]
(
	[RapidObjectGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RecordStatus]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_RecordStatus] ON [dbo].[doTax]
(
	[RecordStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Activity]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Activity] ON [dbo].[doTender]
(
	[Activity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doTender]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DropPayout]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_DropPayout] ON [dbo].[doTender]
(
	[DropPayout] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doTender]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doTender]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TenderType]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_TenderType] ON [dbo].[doTender]
(
	[TenderType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doTenderDenominations]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doTenderDenominations]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doTenderDenominations]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Batch]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Batch] ON [dbo].[doTenderTotal]
(
	[Batch] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doTenderTotal]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doTenderTotal]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doTenderTotal]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_TenderType]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_TenderType] ON [dbo].[doTenderTotal]
(
	[TenderType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doTenderType]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doTenderType]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doTenderType]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_StartTime]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_StartTime] ON [dbo].[doTransactionInfo]
(
	[StartTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_User]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_User] ON [dbo].[doTransactionInfo]
(
	[User] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Cashier]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Cashier] ON [dbo].[doUserAccount]
(
	[Cashier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Owner]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Owner] ON [dbo].[doUserAccount-Appointments]
(
	[Owner] ASC,
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Owner]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Owner] ON [dbo].[doUserAccount-Tasks]
(
	[Owner] ASC,
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXR]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IXR] ON [dbo].[doUserAccount-UserSettings]
(
	[ID-2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doWard]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doWard]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doWard]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Account]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Account] ON [dbo].[doWilliamActivityHistory]
(
	[Account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Created] ON [dbo].[doWilliamActivityHistory]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Guid]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[doWilliamActivityHistory]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsDefault]    Script Date: 11/11/2017 5:32:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_IsDefault] ON [dbo].[doWilliamActivityHistory]
(
	[IsDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ((0)) FOR [AccountFormat]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ((0)) FOR [AccountNumber]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ((0)) FOR [AccountOwner]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ((0)) FOR [AccountType]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ('') FOR [AddressLine1]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ('') FOR [AddressLine2]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ((0)) FOR [AddressSource]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ('') FOR [AddressState]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ((0.0)) FOR [Balance]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ('') FOR [City]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [ClosedDate]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ('') FOR [Company]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ((0.0)) FOR [CreditLimit]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ((0)) FOR [Customer]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ('') FOR [CustomerAddressLine1]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ('') FOR [CustomerAddressLine2]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ('') FOR [CustomerAddressState]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ('') FOR [CustomerCity]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ('') FOR [CustomerCompany]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ('') FOR [CustomerEmailAddress]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ('') FOR [CustomerFaxNumber]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ('') FOR [CustomerFirstName]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ('') FOR [CustomerLastName]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ('') FOR [CustomerMobileNumber]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ('') FOR [CustomerPhoneNumber]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ('') FOR [CustomerPostCode]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ('') FOR [CustomerTitle]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ('') FOR [CustomerWeb]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ((0.0)) FOR [Discount]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ('') FOR [EmailAddress]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ('') FOR [FaxNumber]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ('') FOR [FirstName]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ('') FOR [GroupedDescription]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ('') FOR [ImportDescription]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ((0.0)) FOR [ImportedBalance]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ('') FOR [LastName]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ('') FOR [MobileNumber]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [OpenedDate]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ('') FOR [PhoneNumber]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ('') FOR [PostCode]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ((0)) FOR [PriceLevel]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ((0)) FOR [PrintByPatient]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ('') FOR [ProviderNumber]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ('') FOR [Reference]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ('') FOR [Remarks]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ((0)) FOR [SendStatementsByEmail]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ('') FOR [StatementEmail]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ('') FOR [TAC]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ('') FOR [Title]
GO
ALTER TABLE [dbo].[doAccount] ADD  DEFAULT ('') FOR [Web]
GO
ALTER TABLE [dbo].[doAccountAllocation] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doAccountAllocation] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doAccountAllocation] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doAccountAllocation] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doAccountAllocation] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doAccountAllocation] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doAccountAllocation] ADD  DEFAULT ((0)) FOR [AccountType]
GO
ALTER TABLE [dbo].[doAccountAllocation] ADD  DEFAULT ((0)) FOR [AccountTypeOwner]
GO
ALTER TABLE [dbo].[doAccountAllocation] ADD  DEFAULT ((0)) FOR [ChargeAccount]
GO
ALTER TABLE [dbo].[doAccountAllocation] ADD  DEFAULT ((0)) FOR [ChargeType]
GO
ALTER TABLE [dbo].[doAccountType] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doAccountType] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doAccountType] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doAccountType] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doAccountType] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doAccountType] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doAccountType] ADD  DEFAULT ((0.0)) FOR [CreditLimit]
GO
ALTER TABLE [dbo].[doAccountType] ADD  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[doActivity] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doActivity] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doActivity] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doActivity] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doActivity] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doActivity] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doActivity] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [IBHeaderGuid]
GO
ALTER TABLE [dbo].[doActivity] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [RapidObjectGuid]
GO
ALTER TABLE [dbo].[doActivity] ADD  DEFAULT ((0)) FOR [RapidSyncRequired]
GO
ALTER TABLE [dbo].[doActivity] ADD  DEFAULT ((0)) FOR [RecordStatus]
GO
ALTER TABLE [dbo].[doActivity] ADD  DEFAULT ('') FOR [AcceptedBy]
GO
ALTER TABLE [dbo].[doActivity] ADD  DEFAULT ((0)) FOR [ActivityType]
GO
ALTER TABLE [dbo].[doActivity] ADD  DEFAULT ((0)) FOR [Batch]
GO
ALTER TABLE [dbo].[doActivity] ADD  DEFAULT ((0)) FOR [Cashier]
GO
ALTER TABLE [dbo].[doActivity] ADD  DEFAULT ((0)) FOR [ChargeAccount]
GO
ALTER TABLE [dbo].[doActivity] ADD  DEFAULT ((0)) FOR [Customer]
GO
ALTER TABLE [dbo].[doActivity] ADD  DEFAULT ((0)) FOR [HiddenReverseActivity]
GO
ALTER TABLE [dbo].[doActivity] ADD  DEFAULT ((0)) FOR [LaybyAccount]
GO
ALTER TABLE [dbo].[doActivity] ADD  DEFAULT ((0)) FOR [LoyaltyAccount]
GO
ALTER TABLE [dbo].[doActivity] ADD  DEFAULT ('') FOR [PostCode]
GO
ALTER TABLE [dbo].[doActivity] ADD  DEFAULT (NULL) FOR [Reference]
GO
ALTER TABLE [dbo].[doActivity] ADD  DEFAULT ((0)) FOR [Register]
GO
ALTER TABLE [dbo].[doActivity] ADD  DEFAULT (NULL) FOR [Remarks]
GO
ALTER TABLE [dbo].[doActivity] ADD  DEFAULT ((0)) FOR [Statement]
GO
ALTER TABLE [dbo].[doActivity] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [TimeOccured]
GO
ALTER TABLE [dbo].[doActivity] ADD  DEFAULT ((0.0)) FOR [TotalCharged]
GO
ALTER TABLE [dbo].[doActivity] ADD  DEFAULT ((0.0)) FOR [TotalCost]
GO
ALTER TABLE [dbo].[doActivity] ADD  DEFAULT ((0.0)) FOR [TotalDiscount]
GO
ALTER TABLE [dbo].[doActivity] ADD  DEFAULT ((0.0)) FOR [TotalExtendedPrice]
GO
ALTER TABLE [dbo].[doActivity] ADD  DEFAULT ((0.0)) FOR [TotalGovRecov]
GO
ALTER TABLE [dbo].[doActivity] ADD  DEFAULT ((0.0)) FOR [TotalLayby]
GO
ALTER TABLE [dbo].[doActivity] ADD  DEFAULT ((0)) FOR [TotalLines]
GO
ALTER TABLE [dbo].[doActivity] ADD  DEFAULT ((0.0)) FOR [TotalPoints]
GO
ALTER TABLE [dbo].[doActivity] ADD  DEFAULT ((0.0)) FOR [TotalProfit]
GO
ALTER TABLE [dbo].[doActivity] ADD  DEFAULT ((0.0)) FOR [TotalQuantity]
GO
ALTER TABLE [dbo].[doActivity] ADD  DEFAULT ((0.0)) FOR [TotalRetailPrice]
GO
ALTER TABLE [dbo].[doActivity] ADD  DEFAULT ((0)) FOR [TotalScripts]
GO
ALTER TABLE [dbo].[doActivity] ADD  DEFAULT ((0.0)) FOR [TotalTax]
GO
ALTER TABLE [dbo].[doActivity] ADD  DEFAULT ('') FOR [TransactionNumber]
GO
ALTER TABLE [dbo].[doActivityEntry] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doActivityEntry] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doActivityEntry] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doActivityEntry] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doActivityEntry] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doActivityEntry] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doActivityEntry] ADD  DEFAULT ((0)) FOR [Activity]
GO
ALTER TABLE [dbo].[doActivityEntry] ADD  DEFAULT ((0.0)) FOR [Cost]
GO
ALTER TABLE [dbo].[doActivityEntry] ADD  DEFAULT ((0.0)) FOR [Discount]
GO
ALTER TABLE [dbo].[doActivityEntry] ADD  DEFAULT ((0.0)) FOR [ExtendedPrice]
GO
ALTER TABLE [dbo].[doActivityEntry] ADD  DEFAULT ((0.0)) FOR [GovRecov]
GO
ALTER TABLE [dbo].[doActivityEntry] ADD  DEFAULT ((0)) FOR [ItemTransacted]
GO
ALTER TABLE [dbo].[doActivityEntry] ADD  DEFAULT ((0.0)) FOR [Points]
GO
ALTER TABLE [dbo].[doActivityEntry] ADD  DEFAULT ((0.0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[doActivityEntry] ADD  DEFAULT ((0)) FOR [QuantityDiscountScheme]
GO
ALTER TABLE [dbo].[doActivityEntry] ADD  DEFAULT ('') FOR [Remarks]
GO
ALTER TABLE [dbo].[doActivityEntry] ADD  DEFAULT ((0.0)) FOR [RetailPrice]
GO
ALTER TABLE [dbo].[doActivityEntry] ADD  DEFAULT ('') FOR [SaleDescription]
GO
ALTER TABLE [dbo].[doActivityEntry] ADD  DEFAULT ((0)) FOR [Script]
GO
ALTER TABLE [dbo].[doActivityEntry] ADD  DEFAULT ((0.0)) FOR [Tax]
GO
ALTER TABLE [dbo].[doActivityEntry-ReconcileEntry] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doActivityEntry-ReconcileEntry] ADD  DEFAULT ((0)) FOR [Owner]
GO
ALTER TABLE [dbo].[doActivityEntry-ReconcileEntry] ADD  DEFAULT ((0)) FOR [AdjustmentActivity]
GO
ALTER TABLE [dbo].[doActivityEntry-ReconcileEntry] ADD  DEFAULT ((0.0)) FOR [PaidAmount]
GO
ALTER TABLE [dbo].[doActivityEntry-ReconcileEntry] ADD  DEFAULT ((0)) FOR [PaymentActivity]
GO
ALTER TABLE [dbo].[doActivityEntry-ReconcileEntry] ADD  DEFAULT ('') FOR [Remarks]
GO
ALTER TABLE [dbo].[doAlert] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doAlert] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doAlert] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doAlert] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [AlertDate]
GO
ALTER TABLE [dbo].[doAlert] ADD  DEFAULT ((0)) FOR [AlertTriggerType]
GO
ALTER TABLE [dbo].[doAlert] ADD  DEFAULT ((0)) FOR [AlertedObject]
GO
ALTER TABLE [dbo].[doAlert] ADD  DEFAULT ((0)) FOR [AssignedTo]
GO
ALTER TABLE [dbo].[doAlert] ADD  DEFAULT ((0)) FOR [Priority]
GO
ALTER TABLE [dbo].[doAlert] ADD  DEFAULT ((0)) FOR [RaisedCount]
GO
ALTER TABLE [dbo].[doAlertTrigger] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doAlertTrigger] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doAlertTrigger] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doAlertTrigger] ADD  DEFAULT ((0)) FOR [AlertTriggerType]
GO
ALTER TABLE [dbo].[doAlertTrigger] ADD  DEFAULT ((0)) FOR [AssignedTo]
GO
ALTER TABLE [dbo].[doAlertTrigger] ADD  DEFAULT ((0)) FOR [Priority]
GO
ALTER TABLE [dbo].[doAlertTrigger] ADD  DEFAULT (CONVERT([varbinary](max),'',0)) FOR [TriggerValue1]
GO
ALTER TABLE [dbo].[doAlertTrigger] ADD  DEFAULT (CONVERT([varbinary](max),'',0)) FOR [TriggerValue2]
GO
ALTER TABLE [dbo].[doAlertTrigger] ADD  DEFAULT ((0)) FOR [Unique]
GO
ALTER TABLE [dbo].[doAlias] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doAlias] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doAlias] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doAlias] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doAlias] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doAlias] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doAlias] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [IBHeaderGuid]
GO
ALTER TABLE [dbo].[doAlias] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [RapidObjectGuid]
GO
ALTER TABLE [dbo].[doAlias] ADD  DEFAULT ((0)) FOR [RapidSyncRequired]
GO
ALTER TABLE [dbo].[doAlias] ADD  DEFAULT ((0)) FOR [RecordStatus]
GO
ALTER TABLE [dbo].[doAlias] ADD  DEFAULT ('') FOR [Code]
GO
ALTER TABLE [dbo].[doAlias] ADD  DEFAULT ((0)) FOR [IsLabelOnly]
GO
ALTER TABLE [dbo].[doAlias] ADD  DEFAULT ((0)) FOR [IsNumeric]
GO
ALTER TABLE [dbo].[doAlias] ADD  DEFAULT ((0)) FOR [ItemAliased]
GO
ALTER TABLE [dbo].[doAlias] ADD  DEFAULT ((0)) FOR [LastItemAliased]
GO
ALTER TABLE [dbo].[doAssistantTask] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doAssistantTask] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doAssistantTask] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doAssistantTask] ADD  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[doAssistantTask] ADD  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[doAudit] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doAudit] ADD  DEFAULT ((0)) FOR [AuditActionType]
GO
ALTER TABLE [dbo].[doAudit] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [AuditDate]
GO
ALTER TABLE [dbo].[doAudit] ADD  DEFAULT ((0)) FOR [AuditType]
GO
ALTER TABLE [dbo].[doAudit] ADD  DEFAULT ((0)) FOR [AuditedObject]
GO
ALTER TABLE [dbo].[doAudit] ADD  DEFAULT (NULL) FOR [Field]
GO
ALTER TABLE [dbo].[doAudit] ADD  DEFAULT ('') FOR [FriendlyName]
GO
ALTER TABLE [dbo].[doAudit] ADD  DEFAULT (NULL) FOR [FromValue]
GO
ALTER TABLE [dbo].[doAudit] ADD  DEFAULT ('') FOR [Message]
GO
ALTER TABLE [dbo].[doAudit] ADD  DEFAULT ('') FOR [ObjectType]
GO
ALTER TABLE [dbo].[doAudit] ADD  DEFAULT ('') FOR [SourceName]
GO
ALTER TABLE [dbo].[doAudit] ADD  DEFAULT (NULL) FOR [ToValue]
GO
ALTER TABLE [dbo].[doAuditAggregateDataObject] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doAuditAggregateDataObject] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doAuditAggregateDataObject] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doAuditAggregateDataObject] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doAuditAggregateDataObject] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doAuditAggregateDataObject] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doAuditDataObject] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doAuditDataObject] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doAuditDataObject] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doBatch] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doBatch] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doBatch] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doBatch] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doBatch] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doBatch] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doBatch] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [IBHeaderGuid]
GO
ALTER TABLE [dbo].[doBatch] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [RapidObjectGuid]
GO
ALTER TABLE [dbo].[doBatch] ADD  DEFAULT ((0)) FOR [RapidSyncRequired]
GO
ALTER TABLE [dbo].[doBatch] ADD  DEFAULT ((0)) FOR [RecordStatus]
GO
ALTER TABLE [dbo].[doBatch] ADD  DEFAULT ((0)) FOR [AbortedTransactionCount]
GO
ALTER TABLE [dbo].[doBatch] ADD  DEFAULT ((0)) FOR [BatchNumber]
GO
ALTER TABLE [dbo].[doBatch] ADD  DEFAULT ((0)) FOR [BatchStatus]
GO
ALTER TABLE [dbo].[doBatch] ADD  DEFAULT ((0.0)) FOR [CashBackSurcharge]
GO
ALTER TABLE [dbo].[doBatch] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [ClosingTime]
GO
ALTER TABLE [dbo].[doBatch] ADD  DEFAULT ((0.0)) FOR [ClosingTotal]
GO
ALTER TABLE [dbo].[doBatch] ADD  DEFAULT ('') FOR [Comments]
GO
ALTER TABLE [dbo].[doBatch] ADD  DEFAULT ((0.0)) FOR [CostOfGoods]
GO
ALTER TABLE [dbo].[doBatch] ADD  DEFAULT ((0)) FOR [CustomerCount]
GO
ALTER TABLE [dbo].[doBatch] ADD  DEFAULT ((0.0)) FOR [CustomerDepositMade]
GO
ALTER TABLE [dbo].[doBatch] ADD  DEFAULT ((0.0)) FOR [CustomerDepositRedeemed]
GO
ALTER TABLE [dbo].[doBatch] ADD  DEFAULT ((0.0)) FOR [DebitSurcharge]
GO
ALTER TABLE [dbo].[doBatch] ADD  DEFAULT ((0.0)) FOR [Discounts]
GO
ALTER TABLE [dbo].[doBatch] ADD  DEFAULT ((0.0)) FOR [Dropped]
GO
ALTER TABLE [dbo].[doBatch] ADD  DEFAULT ((0.0)) FOR [GovernmentRecovery]
GO
ALTER TABLE [dbo].[doBatch] ADD  DEFAULT ((0.0)) FOR [LayawayClosed]
GO
ALTER TABLE [dbo].[doBatch] ADD  DEFAULT ((0.0)) FOR [LayawayPaid]
GO
ALTER TABLE [dbo].[doBatch] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Locked]
GO
ALTER TABLE [dbo].[doBatch] ADD  DEFAULT ((0)) FOR [NoSalesCount]
GO
ALTER TABLE [dbo].[doBatch] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [OpeningTime]
GO
ALTER TABLE [dbo].[doBatch] ADD  DEFAULT ((0.0)) FOR [OpeningTotal]
GO
ALTER TABLE [dbo].[doBatch] ADD  DEFAULT ((0.0)) FOR [OverUnder]
GO
ALTER TABLE [dbo].[doBatch] ADD  DEFAULT ((0.0)) FOR [PaidOnAccount]
GO
ALTER TABLE [dbo].[doBatch] ADD  DEFAULT ((0.0)) FOR [PaidOut]
GO
ALTER TABLE [dbo].[doBatch] ADD  DEFAULT ((0.0)) FOR [PaidToAccount]
GO
ALTER TABLE [dbo].[doBatch] ADD  DEFAULT ((0)) FOR [Register]
GO
ALTER TABLE [dbo].[doBatch] ADD  DEFAULT ((0.0)) FOR [Returns]
GO
ALTER TABLE [dbo].[doBatch] ADD  DEFAULT ((0.0)) FOR [Sales]
GO
ALTER TABLE [dbo].[doBatch] ADD  DEFAULT ((0.0)) FOR [SalesPlusTax]
GO
ALTER TABLE [dbo].[doBatch] ADD  DEFAULT ((0.0)) FOR [Tax]
GO
ALTER TABLE [dbo].[doBatch] ADD  DEFAULT ((0.0)) FOR [TenderRoundingError]
GO
ALTER TABLE [dbo].[doBatch] ADD  DEFAULT ((0.0)) FOR [TotalChange]
GO
ALTER TABLE [dbo].[doBatch] ADD  DEFAULT ((0.0)) FOR [TotalTendered]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [IBHeaderGuid]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [RapidObjectGuid]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ((0)) FOR [RapidSyncRequired]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ((0)) FOR [RecordStatus]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ('') FOR [ABN]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ('') FOR [Account]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ('') FOR [AddressLine1]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ('') FOR [AddressLine2]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ('') FOR [AddressState]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ('') FOR [BSB]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ('') FOR [City]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ('') FOR [Company]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ('') FOR [ConfigXML]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ('') FOR [Country]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ('') FOR [EmailAddress]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ('') FOR [FaxNumber]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ('') FOR [FirstName]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ((0)) FOR [ForceDomainBuild3_7v3]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [FridayCloseTime]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [FridayOpenTime]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ('') FOR [LastName]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ((0)) FOR [Master]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ('') FOR [MobileNumber]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [MondayCloseTime]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [MondayOpenTime]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ((0)) FOR [NextAccountNumber]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ((0)) FOR [NextCampaignCode]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ((0)) FOR [NextCategoryCode]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ((0)) FOR [NextDepartmentCode]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ((0)) FOR [NextItemCode]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ((0)) FOR [NextOfferCampaignCode]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ((0)) FOR [NextOfferCode]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ((0)) FOR [NextPurchaseOrderCode]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ((0)) FOR [NextPurchaseOrderRFCCode]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ((0)) FOR [NextReasonCode]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ((0)) FOR [NextReturnOrderCode]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ((0)) FOR [NextSatScanCode]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ((0)) FOR [NextSupplierCode]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ((0)) FOR [NextTenderTypeCode]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ((0)) FOR [NextTransferInCode]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ((0)) FOR [NextTransferOutCode]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ((0)) FOR [NextTransferOutInvoiceCode]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ('') FOR [ParentABN]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ('') FOR [ParentCompany]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ('') FOR [PhoneNumber]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ('') FOR [PostCode]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ('') FOR [PurchaseOrderCodePrefix]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ((0)) FOR [PurchaseOrderDefaultRequiredDays]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ('') FOR [PurchaseOrderRFCCodePrefix]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ((0.0)) FOR [PurchaseOrderVariationPercent]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ('') FOR [ReturnOrderCodePrefix]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [SaturdayCloseTime]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [SaturdayOpenTime]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [SiteGuid]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ((0)) FOR [StoreID]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [SundayCloseTime]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [SundayOpenTime]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ((0)) FOR [SystemGSTFreeItemTax]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ((0)) FOR [SystemGSTItemTax]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ((0)) FOR [SystemNoGSTItemTax]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [ThursdayCloseTime]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [ThursdayOpenTime]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [TimeAdded]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [TimeRemoved]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ('') FOR [Title]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ('') FOR [TransferInCodePrefix]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ('') FOR [TransferOutCodePrefix]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ('') FOR [TransferOutInvoiceCodePrefix]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [TuesdayCloseTime]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [TuesdayOpenTime]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ('') FOR [Web]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [WednesdayCloseTime]
GO
ALTER TABLE [dbo].[doBusinessUnit] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [WednesdayOpenTime]
GO
ALTER TABLE [dbo].[doBusinessUnit-AuditHistory] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doBusinessUnit-AuditHistory] ADD  DEFAULT ((0)) FOR [Owner]
GO
ALTER TABLE [dbo].[doBusinessUnit-AuditHistory] ADD  DEFAULT ((0)) FOR [AuditActionType]
GO
ALTER TABLE [dbo].[doBusinessUnit-AuditHistory] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [AuditDate]
GO
ALTER TABLE [dbo].[doBusinessUnit-AuditHistory] ADD  DEFAULT ((0)) FOR [AuditType]
GO
ALTER TABLE [dbo].[doBusinessUnit-AuditHistory] ADD  DEFAULT ((0)) FOR [AuditedObject]
GO
ALTER TABLE [dbo].[doBusinessUnit-AuditHistory] ADD  DEFAULT (NULL) FOR [Field]
GO
ALTER TABLE [dbo].[doBusinessUnit-AuditHistory] ADD  DEFAULT ('') FOR [FriendlyName]
GO
ALTER TABLE [dbo].[doBusinessUnit-AuditHistory] ADD  DEFAULT (NULL) FOR [FromValue]
GO
ALTER TABLE [dbo].[doBusinessUnit-AuditHistory] ADD  DEFAULT ('') FOR [Message]
GO
ALTER TABLE [dbo].[doBusinessUnit-AuditHistory] ADD  DEFAULT ('') FOR [ObjectType]
GO
ALTER TABLE [dbo].[doBusinessUnit-AuditHistory] ADD  DEFAULT ('') FOR [SourceName]
GO
ALTER TABLE [dbo].[doBusinessUnit-AuditHistory] ADD  DEFAULT (NULL) FOR [ToValue]
GO
ALTER TABLE [dbo].[doBusinessUnit-Events] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doBusinessUnit-Events] ADD  DEFAULT ((0)) FOR [Owner]
GO
ALTER TABLE [dbo].[doBusinessUnit-Events] ADD  DEFAULT ((0)) FOR [AggregateObject]
GO
ALTER TABLE [dbo].[doBusinessUnit-Events] ADD  DEFAULT ('') FOR [AggregateObjectType]
GO
ALTER TABLE [dbo].[doBusinessUnit-Events] ADD  DEFAULT ('') FOR [EventSource]
GO
ALTER TABLE [dbo].[doBusinessUnit-Events] ADD  DEFAULT ((0)) FOR [EventType]
GO
ALTER TABLE [dbo].[doBusinessUnit-Events] ADD  DEFAULT ('') FOR [Message]
GO
ALTER TABLE [dbo].[doBusinessUnit-Events] ADD  DEFAULT ((0)) FOR [Relationship]
GO
ALTER TABLE [dbo].[doBusinessUnit-Events] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [TimeOccurred]
GO
ALTER TABLE [dbo].[doBusinessUnit-MandatoryFields] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doBusinessUnit-MandatoryFields] ADD  DEFAULT ((0)) FOR [Owner]
GO
ALTER TABLE [dbo].[doBusinessUnit-MandatoryFields] ADD  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[doBusinessUnit-MandatoryFields] ADD  DEFAULT ('') FOR [FieldName]
GO
ALTER TABLE [dbo].[doBusinessUnit-MandatoryFields] ADD  DEFAULT ((0)) FOR [IsMandatory]
GO
ALTER TABLE [dbo].[doBusinessUnit-MandatoryFields] ADD  DEFAULT ((0)) FOR [IsSystem]
GO
ALTER TABLE [dbo].[doBusinessUnit-MandatoryFields] ADD  DEFAULT ('') FOR [TypeName]
GO
ALTER TABLE [dbo].[doCashier] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doCashier] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doCashier] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doCashier] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doCashier] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doCashier] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doCashier] ADD  DEFAULT ((0)) FOR [CashDrawerNumber]
GO
ALTER TABLE [dbo].[doCashier] ADD  DEFAULT ('') FOR [EmailAddress]
GO
ALTER TABLE [dbo].[doCashier] ADD  DEFAULT ('') FOR [FirstName]
GO
ALTER TABLE [dbo].[doCashier] ADD  DEFAULT ((0.0)) FOR [FloorLimit]
GO
ALTER TABLE [dbo].[doCashier] ADD  DEFAULT ('') FOR [GroupedDescription]
GO
ALTER TABLE [dbo].[doCashier] ADD  DEFAULT ('') FOR [LastName]
GO
ALTER TABLE [dbo].[doCashier] ADD  DEFAULT ((0.0)) FOR [MaxOverShortAmount]
GO
ALTER TABLE [dbo].[doCashier] ADD  DEFAULT ((0.0)) FOR [MaxOverShortPercent]
GO
ALTER TABLE [dbo].[doCashier] ADD  DEFAULT ((0)) FOR [OverShortLimitType]
GO
ALTER TABLE [dbo].[doCashier] ADD  DEFAULT ('') FOR [Password]
GO
ALTER TABLE [dbo].[doCashier] ADD  DEFAULT ('') FOR [PhoneNumber]
GO
ALTER TABLE [dbo].[doCashier] ADD  DEFAULT ((0)) FOR [Privileges]
GO
ALTER TABLE [dbo].[doCashier] ADD  DEFAULT ((0.0)) FOR [ReturnLimit]
GO
ALTER TABLE [dbo].[doCashier] ADD  DEFAULT ((0)) FOR [SecurityLevel]
GO
ALTER TABLE [dbo].[doCashier] ADD  DEFAULT ('') FOR [UserName]
GO
ALTER TABLE [dbo].[doCategory] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doCategory] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doCategory] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doCategory] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doCategory] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doCategory] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doCategory] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [IBHeaderGuid]
GO
ALTER TABLE [dbo].[doCategory] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [RapidObjectGuid]
GO
ALTER TABLE [dbo].[doCategory] ADD  DEFAULT ((0)) FOR [RapidSyncRequired]
GO
ALTER TABLE [dbo].[doCategory] ADD  DEFAULT ((0)) FOR [RecordStatus]
GO
ALTER TABLE [dbo].[doCategory] ADD  DEFAULT ((0)) FOR [Active]
GO
ALTER TABLE [dbo].[doCategory] ADD  DEFAULT ((0)) FOR [AppCatHQID]
GO
ALTER TABLE [dbo].[doCategory] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [AppCatHQLastMatched]
GO
ALTER TABLE [dbo].[doCategory] ADD  DEFAULT ('') FOR [Code]
GO
ALTER TABLE [dbo].[doCategory] ADD  DEFAULT ((0)) FOR [Department]
GO
ALTER TABLE [dbo].[doCategory] ADD  DEFAULT ((0.0)) FOR [Markup]
GO
ALTER TABLE [dbo].[doCategory] ADD  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[doChargeType] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doChargeType] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doChargeType] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doChargeType] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doChargeType] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doChargeType] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doChargeType] ADD  DEFAULT ((0)) FOR [Active]
GO
ALTER TABLE [dbo].[doChargeType] ADD  DEFAULT ('') FOR [Code]
GO
ALTER TABLE [dbo].[doChargeType] ADD  DEFAULT ('') FOR [ColorCode]
GO
ALTER TABLE [dbo].[doChargeType] ADD  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[doChargeType] ADD  DEFAULT ((0.0)) FOR [PrivateFee]
GO
ALTER TABLE [dbo].[doChargeType] ADD  DEFAULT ((0.0)) FOR [PrivateMarkup]
GO
ALTER TABLE [dbo].[doChargeType] ADD  DEFAULT ('') FOR [SortOrder]
GO
ALTER TABLE [dbo].[doClaim] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doClaim] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doClaim] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doClaim] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doClaim] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doClaim] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doClaim] ADD  DEFAULT ((0.0)) FOR [Amount]
GO
ALTER TABLE [dbo].[doClaim] ADD  DEFAULT ('') FOR [Category]
GO
ALTER TABLE [dbo].[doClaim] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [ClaimDate]
GO
ALTER TABLE [dbo].[doClaim] ADD  DEFAULT ((0)) FOR [ClaimKey]
GO
ALTER TABLE [dbo].[doClaim] ADD  DEFAULT ((0.0)) FOR [ClaimNumber]
GO
ALTER TABLE [dbo].[doClaim] ADD  DEFAULT ((0.0)) FOR [ClaimPart]
GO
ALTER TABLE [dbo].[doClaim] ADD  DEFAULT ((0.0)) FOR [FormCategory]
GO
ALTER TABLE [dbo].[doClaim] ADD  DEFAULT ((0)) FOR [IsPaid]
GO
ALTER TABLE [dbo].[doClaim] ADD  DEFAULT ('') FOR [MedicareFirstName]
GO
ALTER TABLE [dbo].[doClaim] ADD  DEFAULT ('') FOR [MedicareLastName]
GO
ALTER TABLE [dbo].[doClaim] ADD  DEFAULT ((0)) FOR [MedicareNumber]
GO
ALTER TABLE [dbo].[doClaim] ADD  DEFAULT ('') FOR [PBSAcceptCode]
GO
ALTER TABLE [dbo].[doClaim] ADD  DEFAULT ('') FOR [PBSAcknowledge]
GO
ALTER TABLE [dbo].[doClaim] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [PBSPayDate]
GO
ALTER TABLE [dbo].[doClaim] ADD  DEFAULT ((0.0)) FOR [PBSPaymentAdjustment]
GO
ALTER TABLE [dbo].[doClaim] ADD  DEFAULT ((0.0)) FOR [PBSPaymentAmount]
GO
ALTER TABLE [dbo].[doClaim] ADD  DEFAULT ('') FOR [PBSPaymentID]
GO
ALTER TABLE [dbo].[doClaim] ADD  DEFAULT ('') FOR [PBSProcessingCode]
GO
ALTER TABLE [dbo].[doClaim] ADD  DEFAULT ('') FOR [PBSProcessingCodeHistory]
GO
ALTER TABLE [dbo].[doClaim] ADD  DEFAULT ('') FOR [PBSReferenceNumber]
GO
ALTER TABLE [dbo].[doClaim] ADD  DEFAULT ('') FOR [PBSResubmit]
GO
ALTER TABLE [dbo].[doClaim] ADD  DEFAULT ((0.0)) FOR [PayCategory]
GO
ALTER TABLE [dbo].[doClaim] ADD  DEFAULT ('') FOR [ProblemReturnCode]
GO
ALTER TABLE [dbo].[doClaim] ADD  DEFAULT ((0.0)) FOR [Reference]
GO
ALTER TABLE [dbo].[doClaim] ADD  DEFAULT ((0.0)) FOR [ReferencePeriod]
GO
ALTER TABLE [dbo].[doClaim] ADD  DEFAULT ((0.0)) FOR [ScriptNumber]
GO
ALTER TABLE [dbo].[doClaim] ADD  DEFAULT ('') FOR [SerialNumber]
GO
ALTER TABLE [dbo].[doClaim] ADD  DEFAULT ('') FOR [Status]
GO
ALTER TABLE [dbo].[doCurrency] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doCurrency] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doCurrency] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doCurrency] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doCurrency] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doCurrency] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doCurrency] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [IBHeaderGuid]
GO
ALTER TABLE [dbo].[doCurrency] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [RapidObjectGuid]
GO
ALTER TABLE [dbo].[doCurrency] ADD  DEFAULT ((0)) FOR [RapidSyncRequired]
GO
ALTER TABLE [dbo].[doCurrency] ADD  DEFAULT ((0)) FOR [RecordStatus]
GO
ALTER TABLE [dbo].[doCurrency] ADD  DEFAULT ('') FOR [Code]
GO
ALTER TABLE [dbo].[doCurrency] ADD  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[doCurrency] ADD  DEFAULT ((0.0)) FOR [ExchangeRate]
GO
ALTER TABLE [dbo].[doCurrency] ADD  DEFAULT ((0)) FOR [LocaleId]
GO
ALTER TABLE [dbo].[doCustomer] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doCustomer] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doCustomer] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doCustomer] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doCustomer] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doCustomer] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doCustomer] ADD  DEFAULT ('') FOR [AddressLine1]
GO
ALTER TABLE [dbo].[doCustomer] ADD  DEFAULT ('') FOR [AddressLine2]
GO
ALTER TABLE [dbo].[doCustomer] ADD  DEFAULT ('') FOR [AddressState]
GO
ALTER TABLE [dbo].[doCustomer] ADD  DEFAULT ('') FOR [City]
GO
ALTER TABLE [dbo].[doCustomer] ADD  DEFAULT ('') FOR [Company]
GO
ALTER TABLE [dbo].[doCustomer] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [CustomDate1]
GO
ALTER TABLE [dbo].[doCustomer] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [CustomDate2]
GO
ALTER TABLE [dbo].[doCustomer] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [CustomDate3]
GO
ALTER TABLE [dbo].[doCustomer] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [CustomDate4]
GO
ALTER TABLE [dbo].[doCustomer] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [CustomDate5]
GO
ALTER TABLE [dbo].[doCustomer] ADD  DEFAULT ((0.0)) FOR [CustomNumber1]
GO
ALTER TABLE [dbo].[doCustomer] ADD  DEFAULT ((0.0)) FOR [CustomNumber2]
GO
ALTER TABLE [dbo].[doCustomer] ADD  DEFAULT ((0.0)) FOR [CustomNumber3]
GO
ALTER TABLE [dbo].[doCustomer] ADD  DEFAULT ((0.0)) FOR [CustomNumber4]
GO
ALTER TABLE [dbo].[doCustomer] ADD  DEFAULT ((0.0)) FOR [CustomNumber5]
GO
ALTER TABLE [dbo].[doCustomer] ADD  DEFAULT ('') FOR [CustomText1]
GO
ALTER TABLE [dbo].[doCustomer] ADD  DEFAULT ('') FOR [CustomText2]
GO
ALTER TABLE [dbo].[doCustomer] ADD  DEFAULT ('') FOR [CustomText3]
GO
ALTER TABLE [dbo].[doCustomer] ADD  DEFAULT ('') FOR [CustomText4]
GO
ALTER TABLE [dbo].[doCustomer] ADD  DEFAULT ('') FOR [CustomText5]
GO
ALTER TABLE [dbo].[doCustomer] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [DateOfBirth]
GO
ALTER TABLE [dbo].[doCustomer] ADD  DEFAULT ('') FOR [EmailAddress]
GO
ALTER TABLE [dbo].[doCustomer] ADD  DEFAULT ('') FOR [FaxNumber]
GO
ALTER TABLE [dbo].[doCustomer] ADD  DEFAULT ('') FOR [FirstName]
GO
ALTER TABLE [dbo].[doCustomer] ADD  DEFAULT ('') FOR [GroupedDescription]
GO
ALTER TABLE [dbo].[doCustomer] ADD  DEFAULT ('') FOR [LastName]
GO
ALTER TABLE [dbo].[doCustomer] ADD  DEFAULT ('') FOR [MobileNumber]
GO
ALTER TABLE [dbo].[doCustomer] ADD  DEFAULT ('') FOR [PhoneNumber]
GO
ALTER TABLE [dbo].[doCustomer] ADD  DEFAULT ('') FOR [PostCode]
GO
ALTER TABLE [dbo].[doCustomer] ADD  DEFAULT ('') FOR [Remarks]
GO
ALTER TABLE [dbo].[doCustomer] ADD  DEFAULT ('') FOR [Title]
GO
ALTER TABLE [dbo].[doCustomer] ADD  DEFAULT ('') FOR [Web]
GO
ALTER TABLE [dbo].[doDataAssistantTemplate] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doDataAssistantTemplate] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doDataAssistantTemplate] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doDataAssistantTemplate] ADD  DEFAULT ((0)) FOR [ColumnCount]
GO
ALTER TABLE [dbo].[doDataAssistantTemplate] ADD  DEFAULT ((0)) FOR [DataAssistantType]
GO
ALTER TABLE [dbo].[doDataAssistantTemplate] ADD  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[doDataAssistantTemplate] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doDataAssistantTemplate] ADD  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[doDataAssistantTemplate] ADD  DEFAULT ('') FOR [TemplateXML]
GO
ALTER TABLE [dbo].[doDataObject] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doDataObject] ADD  DEFAULT ((0)) FOR [TypeID]
GO
ALTER TABLE [dbo].[doDataObject] ADD  DEFAULT ((0)) FOR [VersionID]
GO
ALTER TABLE [dbo].[doDataObject] ADD  DEFAULT (NULL) FOR [Permissions]
GO
ALTER TABLE [dbo].[doDataObject] ADD  DEFAULT (NULL) FOR [FastLoadData]
GO
ALTER TABLE [dbo].[doDepartment] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doDepartment] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doDepartment] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doDepartment] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doDepartment] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doDepartment] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doDepartment] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [IBHeaderGuid]
GO
ALTER TABLE [dbo].[doDepartment] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [RapidObjectGuid]
GO
ALTER TABLE [dbo].[doDepartment] ADD  DEFAULT ((0)) FOR [RapidSyncRequired]
GO
ALTER TABLE [dbo].[doDepartment] ADD  DEFAULT ((0)) FOR [RecordStatus]
GO
ALTER TABLE [dbo].[doDepartment] ADD  DEFAULT ((0)) FOR [Active]
GO
ALTER TABLE [dbo].[doDepartment] ADD  DEFAULT ((0)) FOR [AppCatHQID]
GO
ALTER TABLE [dbo].[doDepartment] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [AppCatHQLastMatched]
GO
ALTER TABLE [dbo].[doDepartment] ADD  DEFAULT ('') FOR [Code]
GO
ALTER TABLE [dbo].[doDepartment] ADD  DEFAULT ((0)) FOR [IsOtherCostDepartment]
GO
ALTER TABLE [dbo].[doDepartment] ADD  DEFAULT ((0.0)) FOR [Markup]
GO
ALTER TABLE [dbo].[doDepartment] ADD  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[doDimension] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doDimension] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doDimension] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doDimension] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doDimension] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doDimension] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doDimension] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [IBHeaderGuid]
GO
ALTER TABLE [dbo].[doDimension] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [RapidObjectGuid]
GO
ALTER TABLE [dbo].[doDimension] ADD  DEFAULT ((0)) FOR [RapidSyncRequired]
GO
ALTER TABLE [dbo].[doDimension] ADD  DEFAULT ((0)) FOR [RecordStatus]
GO
ALTER TABLE [dbo].[doDimension] ADD  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[doDimension] ADD  DEFAULT ((0)) FOR [InActive]
GO
ALTER TABLE [dbo].[doDimension] ADD  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[doDimensionAttribute] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doDimensionAttribute] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doDimensionAttribute] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doDimensionAttribute] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doDimensionAttribute] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doDimensionAttribute] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doDimensionAttribute] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [IBHeaderGuid]
GO
ALTER TABLE [dbo].[doDimensionAttribute] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [RapidObjectGuid]
GO
ALTER TABLE [dbo].[doDimensionAttribute] ADD  DEFAULT ((0)) FOR [RapidSyncRequired]
GO
ALTER TABLE [dbo].[doDimensionAttribute] ADD  DEFAULT ((0)) FOR [RecordStatus]
GO
ALTER TABLE [dbo].[doDimensionAttribute] ADD  DEFAULT ('') FOR [Attribute]
GO
ALTER TABLE [dbo].[doDimensionAttribute] ADD  DEFAULT ('') FOR [Code]
GO
ALTER TABLE [dbo].[doDimensionAttribute] ADD  DEFAULT ((0)) FOR [Dimension]
GO
ALTER TABLE [dbo].[doDimensionAttribute] ADD  DEFAULT ((0)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[doDimensionAttribute] ADD  DEFAULT ((0)) FOR [InActive]
GO
ALTER TABLE [dbo].[doDoctor] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doDoctor] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doDoctor] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doDoctor] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doDoctor] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doDoctor] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doDoctor] ADD  DEFAULT ('') FOR [Address]
GO
ALTER TABLE [dbo].[doDoctor] ADD  DEFAULT ('') FOR [DoctorCode]
GO
ALTER TABLE [dbo].[doDoctor] ADD  DEFAULT ((0)) FOR [DoctorOnLabel]
GO
ALTER TABLE [dbo].[doDoctor] ADD  DEFAULT ('') FOR [Email]
GO
ALTER TABLE [dbo].[doDoctor] ADD  DEFAULT ('') FOR [FaxNumber]
GO
ALTER TABLE [dbo].[doDoctor] ADD  DEFAULT ('') FOR [FirstName]
GO
ALTER TABLE [dbo].[doDoctor] ADD  DEFAULT ('') FOR [GroupedDescription]
GO
ALTER TABLE [dbo].[doDoctor] ADD  DEFAULT ('') FOR [LastName]
GO
ALTER TABLE [dbo].[doDoctor] ADD  DEFAULT ('') FOR [MobileNumber]
GO
ALTER TABLE [dbo].[doDoctor] ADD  DEFAULT ('') FOR [PhoneNumber]
GO
ALTER TABLE [dbo].[doDoctor] ADD  DEFAULT ((0)) FOR [PostCode]
GO
ALTER TABLE [dbo].[doDoctor] ADD  DEFAULT ((0)) FOR [PrescriberNumber]
GO
ALTER TABLE [dbo].[doDoctor] ADD  DEFAULT ((0)) FOR [StolenScriptPads]
GO
ALTER TABLE [dbo].[doDoctor] ADD  DEFAULT ('') FOR [Suburb]
GO
ALTER TABLE [dbo].[doDraft] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doDraft] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doDraft] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doDraft] ADD  DEFAULT ((0)) FOR [DraftType]
GO
ALTER TABLE [dbo].[doDraft] ADD  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[doDraft] ADD  DEFAULT (NULL) FOR [Remarks]
GO
ALTER TABLE [dbo].[doDraft] ADD  DEFAULT ((0)) FOR [UserAccount]
GO
ALTER TABLE [dbo].[doDraftEntry] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doDraftEntry] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doDraftEntry] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doDraftEntry] ADD  DEFAULT ('') FOR [Comment]
GO
ALTER TABLE [dbo].[doDraftEntry] ADD  DEFAULT ((0.0)) FOR [Cost]
GO
ALTER TABLE [dbo].[doDraftEntry] ADD  DEFAULT ((0)) FOR [Draft]
GO
ALTER TABLE [dbo].[doDraftEntry] ADD  DEFAULT ((0)) FOR [DraftEntrySource]
GO
ALTER TABLE [dbo].[doDraftEntry] ADD  DEFAULT ((0)) FOR [DraftItem]
GO
ALTER TABLE [dbo].[doDraftEntry] ADD  DEFAULT ((0.0)) FOR [Price]
GO
ALTER TABLE [dbo].[doDraftEntry] ADD  DEFAULT ((0)) FOR [QuantityOrdered]
GO
ALTER TABLE [dbo].[doDraftEntry] ADD  DEFAULT ((0)) FOR [Supplier]
GO
ALTER TABLE [dbo].[doDraftEntry] ADD  DEFAULT ((0)) FOR [SupplierItem]
GO
ALTER TABLE [dbo].[doDropPayout] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doDropPayout] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doDropPayout] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doDropPayout] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doDropPayout] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doDropPayout] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doDropPayout] ADD  DEFAULT ((0.0)) FOR [Amount]
GO
ALTER TABLE [dbo].[doDropPayout] ADD  DEFAULT ((0)) FOR [Batch]
GO
ALTER TABLE [dbo].[doDropPayout] ADD  DEFAULT ((0)) FOR [Cashier]
GO
ALTER TABLE [dbo].[doDropPayout] ADD  DEFAULT ('') FOR [Comment]
GO
ALTER TABLE [dbo].[doDropPayout] ADD  DEFAULT ((0)) FOR [ReasonCode]
GO
ALTER TABLE [dbo].[doDropPayout] ADD  DEFAULT ('') FOR [Recipient]
GO
ALTER TABLE [dbo].[doDrug] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doDrug] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doDrug] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doDrug] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doDrug] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doDrug] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doDrug] ADD  DEFAULT ('') FOR [APNCode]
GO
ALTER TABLE [dbo].[doDrug] ADD  DEFAULT ('') FOR [AustralianRegistrationNumber]
GO
ALTER TABLE [dbo].[doDrug] ADD  DEFAULT ('') FOR [Code]
GO
ALTER TABLE [dbo].[doDrug] ADD  DEFAULT ('') FOR [ContractSupplier]
GO
ALTER TABLE [dbo].[doDrug] ADD  DEFAULT ((0.0)) FOR [ContractWholesalePrice]
GO
ALTER TABLE [dbo].[doDrug] ADD  DEFAULT ('') FOR [DeletedDate]
GO
ALTER TABLE [dbo].[doDrug] ADD  DEFAULT ('') FOR [DifferentNHSCodes]
GO
ALTER TABLE [dbo].[doDrug] ADD  DEFAULT ((0.0)) FOR [DiscountRate]
GO
ALTER TABLE [dbo].[doDrug] ADD  DEFAULT ((0)) FOR [DrugItem]
GO
ALTER TABLE [dbo].[doDrug] ADD  DEFAULT ('') FOR [ExtempIndicator]
GO
ALTER TABLE [dbo].[doDrug] ADD  DEFAULT ('') FOR [Form]
GO
ALTER TABLE [dbo].[doDrug] ADD  DEFAULT ((0)) FOR [GSTIncluded]
GO
ALTER TABLE [dbo].[doDrug] ADD  DEFAULT ('') FOR [GenericCode]
GO
ALTER TABLE [dbo].[doDrug] ADD  DEFAULT ('') FOR [GenericName]
GO
ALTER TABLE [dbo].[doDrug] ADD  DEFAULT ('') FOR [GenericSubstitutionIndicator]
GO
ALTER TABLE [dbo].[doDrug] ADD  DEFAULT ('') FOR [GroupedDescription]
GO
ALTER TABLE [dbo].[doDrug] ADD  DEFAULT ('') FOR [HBFCode]
GO
ALTER TABLE [dbo].[doDrug] ADD  DEFAULT ((0.0)) FOR [InteractionGroup]
GO
ALTER TABLE [dbo].[doDrug] ADD  DEFAULT ((0.0)) FOR [InteractionGroup2]
GO
ALTER TABLE [dbo].[doDrug] ADD  DEFAULT ((0)) FOR [IsUserDrug]
GO
ALTER TABLE [dbo].[doDrug] ADD  DEFAULT ('') FOR [LabelSize]
GO
ALTER TABLE [dbo].[doDrug] ADD  DEFAULT ('') FOR [ManufacturerCode]
GO
ALTER TABLE [dbo].[doDrug] ADD  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[doDrug] ADD  DEFAULT ('') FOR [Notes]
GO
ALTER TABLE [dbo].[doDrug] ADD  DEFAULT ((0.0)) FOR [OTCPrice]
GO
ALTER TABLE [dbo].[doDrug] ADD  DEFAULT ((0)) FOR [OurWholesale]
GO
ALTER TABLE [dbo].[doDrug] ADD  DEFAULT ('') FOR [OwnWarnings]
GO
ALTER TABLE [dbo].[doDrug] ADD  DEFAULT ('') FOR [PDENumber]
GO
ALTER TABLE [dbo].[doDrug] ADD  DEFAULT ('') FOR [PDENumber2]
GO
ALTER TABLE [dbo].[doDrug] ADD  DEFAULT ((0.0)) FOR [PackSize]
GO
ALTER TABLE [dbo].[doDrug] ADD  DEFAULT ((0.0)) FOR [PrivateDispensingFeeCategory]
GO
ALTER TABLE [dbo].[doDrug] ADD  DEFAULT ((0.0)) FOR [PrivateMarkupCategory]
GO
ALTER TABLE [dbo].[doDrug] ADD  DEFAULT ((0.0)) FOR [PrivatePrice]
GO
ALTER TABLE [dbo].[doDrug] ADD  DEFAULT ((0.0)) FOR [Ranking]
GO
ALTER TABLE [dbo].[doDrug] ADD  DEFAULT ('') FOR [RecommendedWarningLabels]
GO
ALTER TABLE [dbo].[doDrug] ADD  DEFAULT ('') FOR [Schedule]
GO
ALTER TABLE [dbo].[doDrug] ADD  DEFAULT ((0.0)) FOR [Schedule3RPrice]
GO
ALTER TABLE [dbo].[doDrug] ADD  DEFAULT ('') FOR [SearchStrength]
GO
ALTER TABLE [dbo].[doDrug] ADD  DEFAULT ('') FOR [Status]
GO
ALTER TABLE [dbo].[doDrug] ADD  DEFAULT ((0.0)) FOR [StockGroup]
GO
ALTER TABLE [dbo].[doDrug] ADD  DEFAULT ('') FOR [Strength]
GO
ALTER TABLE [dbo].[doDrug] ADD  DEFAULT ('') FOR [SupplierCode]
GO
ALTER TABLE [dbo].[doDrug] ADD  DEFAULT ('') FOR [SupplierCode2]
GO
ALTER TABLE [dbo].[doDrug] ADD  DEFAULT ((0)) FOR [UseNHSGeneric]
GO
ALTER TABLE [dbo].[doDrug] ADD  DEFAULT ('') FOR [UserDrugCode]
GO
ALTER TABLE [dbo].[doDrug] ADD  DEFAULT ((0.0)) FOR [WholesalePrice]
GO
ALTER TABLE [dbo].[doEmailTemplate] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doEmailTemplate] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doEmailTemplate] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doEmailTemplate] ADD  DEFAULT ('') FOR [EmailBodyHtml]
GO
ALTER TABLE [dbo].[doEmailTemplate] ADD  DEFAULT ('') FOR [EmailSubject]
GO
ALTER TABLE [dbo].[doEmailTemplate] ADD  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[doEmailTemplate] ADD  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[doEmailTemplate-EmailImage] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doEmailTemplate-EmailImage] ADD  DEFAULT ((0)) FOR [Owner]
GO
ALTER TABLE [dbo].[doEmailTemplate-EmailImage] ADD  DEFAULT (CONVERT([varbinary](max),'',0)) FOR [ImageBytes]
GO
ALTER TABLE [dbo].[doEmailTemplate-EmailImage] ADD  DEFAULT ('') FOR [ImageName]
GO
ALTER TABLE [dbo].[doEmailTemplate-EmailImage] ADD  DEFAULT ('') FOR [MediaContentType]
GO
ALTER TABLE [dbo].[doFtObject] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doFtObject] ADD  DEFAULT ((0)) FOR [FtRecordIsUpToDate]
GO
ALTER TABLE [dbo].[doFtRecord] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doFtRecord] ADD  DEFAULT ('') FOR [FtData-En]
GO
ALTER TABLE [dbo].[doFtRecord] ADD  DEFAULT ((0)) FOR [FtObject]
GO
ALTER TABLE [dbo].[doFtRecord] ADD  DEFAULT ((0)) FOR [IsIndexed]
GO
ALTER TABLE [dbo].[doGroup] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doGroup] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doGroup] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doGroup] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doGroup] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doGroup] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doGroup] ADD  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[doGroup] ADD  DEFAULT ('') FOR [GroupType]
GO
ALTER TABLE [dbo].[doGroup] ADD  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[doGroup-GroupEntries] ADD  DEFAULT ((0)) FOR [ID-1]
GO
ALTER TABLE [dbo].[doGroup-GroupEntries] ADD  DEFAULT ((0)) FOR [ID-2]
GO
ALTER TABLE [dbo].[doIAccountOwner] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doIAccountOwner] ADD  DEFAULT ((0)) FOR [VersionID]
GO
ALTER TABLE [dbo].[doIAccountOwner] ADD  DEFAULT (NULL) FOR [Permissions]
GO
ALTER TABLE [dbo].[doIAccountOwner] ADD  DEFAULT (NULL) FOR [FastLoadData]
GO
ALTER TABLE [dbo].[doIAccountOwner] ADD  DEFAULT ('') FOR [AddressLine1]
GO
ALTER TABLE [dbo].[doIAccountOwner] ADD  DEFAULT ('') FOR [AddressLine2]
GO
ALTER TABLE [dbo].[doIAccountOwner] ADD  DEFAULT ('') FOR [AddressState]
GO
ALTER TABLE [dbo].[doIAccountOwner] ADD  DEFAULT ('') FOR [City]
GO
ALTER TABLE [dbo].[doIAccountOwner] ADD  DEFAULT ('') FOR [Company]
GO
ALTER TABLE [dbo].[doIAccountOwner] ADD  DEFAULT ('') FOR [EmailAddress]
GO
ALTER TABLE [dbo].[doIAccountOwner] ADD  DEFAULT ('') FOR [FaxNumber]
GO
ALTER TABLE [dbo].[doIAccountOwner] ADD  DEFAULT ('') FOR [FirstName]
GO
ALTER TABLE [dbo].[doIAccountOwner] ADD  DEFAULT ('') FOR [LastName]
GO
ALTER TABLE [dbo].[doIAccountOwner] ADD  DEFAULT ('') FOR [MobileNumber]
GO
ALTER TABLE [dbo].[doIAccountOwner] ADD  DEFAULT ('') FOR [PhoneNumber]
GO
ALTER TABLE [dbo].[doIAccountOwner] ADD  DEFAULT ('') FOR [PostCode]
GO
ALTER TABLE [dbo].[doIAccountOwner] ADD  DEFAULT ('') FOR [Title]
GO
ALTER TABLE [dbo].[doIAccountOwner] ADD  DEFAULT ('') FOR [Web]
GO
ALTER TABLE [dbo].[doIAccountTypeOwner] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doIAccountTypeOwner] ADD  DEFAULT ((0)) FOR [VersionID]
GO
ALTER TABLE [dbo].[doIAccountTypeOwner] ADD  DEFAULT (NULL) FOR [Permissions]
GO
ALTER TABLE [dbo].[doIAccountTypeOwner] ADD  DEFAULT (NULL) FOR [FastLoadData]
GO
ALTER TABLE [dbo].[doIAccountTypeOwner] ADD  DEFAULT ('') FOR [AddressLine1]
GO
ALTER TABLE [dbo].[doIAccountTypeOwner] ADD  DEFAULT ('') FOR [AddressLine2]
GO
ALTER TABLE [dbo].[doIAccountTypeOwner] ADD  DEFAULT ('') FOR [AddressState]
GO
ALTER TABLE [dbo].[doIAccountTypeOwner] ADD  DEFAULT ('') FOR [City]
GO
ALTER TABLE [dbo].[doIAccountTypeOwner] ADD  DEFAULT ('') FOR [Company]
GO
ALTER TABLE [dbo].[doIAccountTypeOwner] ADD  DEFAULT ('') FOR [EmailAddress]
GO
ALTER TABLE [dbo].[doIAccountTypeOwner] ADD  DEFAULT ('') FOR [FaxNumber]
GO
ALTER TABLE [dbo].[doIAccountTypeOwner] ADD  DEFAULT ('') FOR [FirstName]
GO
ALTER TABLE [dbo].[doIAccountTypeOwner] ADD  DEFAULT ('') FOR [LastName]
GO
ALTER TABLE [dbo].[doIAccountTypeOwner] ADD  DEFAULT ('') FOR [MobileNumber]
GO
ALTER TABLE [dbo].[doIAccountTypeOwner] ADD  DEFAULT ('') FOR [PhoneNumber]
GO
ALTER TABLE [dbo].[doIAccountTypeOwner] ADD  DEFAULT ('') FOR [PostCode]
GO
ALTER TABLE [dbo].[doIAccountTypeOwner] ADD  DEFAULT ('') FOR [Title]
GO
ALTER TABLE [dbo].[doIAccountTypeOwner] ADD  DEFAULT ('') FOR [Web]
GO
ALTER TABLE [dbo].[doIAggregate] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doIAggregate] ADD  DEFAULT ((0)) FOR [VersionID]
GO
ALTER TABLE [dbo].[doIAggregate] ADD  DEFAULT (NULL) FOR [Permissions]
GO
ALTER TABLE [dbo].[doIAggregate] ADD  DEFAULT (NULL) FOR [FastLoadData]
GO
ALTER TABLE [dbo].[doIAggregate] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doIAggregate] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doIAggregate] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doIAppCat] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doIAppCat] ADD  DEFAULT ((0)) FOR [VersionID]
GO
ALTER TABLE [dbo].[doIAppCat] ADD  DEFAULT (NULL) FOR [Permissions]
GO
ALTER TABLE [dbo].[doIAppCat] ADD  DEFAULT (NULL) FOR [FastLoadData]
GO
ALTER TABLE [dbo].[doIAppCat] ADD  DEFAULT ((0)) FOR [AppCatHQID]
GO
ALTER TABLE [dbo].[doIAppCat] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [AppCatHQLastMatched]
GO
ALTER TABLE [dbo].[doIDataObject] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doIDataObject] ADD  DEFAULT ((0)) FOR [TypeID]
GO
ALTER TABLE [dbo].[doIDataObject] ADD  DEFAULT ((0)) FOR [VersionID]
GO
ALTER TABLE [dbo].[doIDataObject] ADD  DEFAULT (NULL) FOR [Permissions]
GO
ALTER TABLE [dbo].[doIDataObject] ADD  DEFAULT (NULL) FOR [FastLoadData]
GO
ALTER TABLE [dbo].[doIFtObject] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doIFtObject] ADD  DEFAULT ((0)) FOR [VersionID]
GO
ALTER TABLE [dbo].[doIFtObject] ADD  DEFAULT (NULL) FOR [Permissions]
GO
ALTER TABLE [dbo].[doIFtObject] ADD  DEFAULT (NULL) FOR [FastLoadData]
GO
ALTER TABLE [dbo].[doIFtObject] ADD  DEFAULT ((0)) FOR [FtRecordIsUpToDate]
GO
ALTER TABLE [dbo].[doIGroupable] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doIGroupable] ADD  DEFAULT ((0)) FOR [VersionID]
GO
ALTER TABLE [dbo].[doIGroupable] ADD  DEFAULT (NULL) FOR [Permissions]
GO
ALTER TABLE [dbo].[doIGroupable] ADD  DEFAULT (NULL) FOR [FastLoadData]
GO
ALTER TABLE [dbo].[doIGroupable] ADD  DEFAULT ('') FOR [GroupedDescription]
GO
ALTER TABLE [dbo].[doIHasNoAccessControlList] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doIHasNoAccessControlList] ADD  DEFAULT ((0)) FOR [VersionID]
GO
ALTER TABLE [dbo].[doIHasNoAccessControlList] ADD  DEFAULT (NULL) FOR [Permissions]
GO
ALTER TABLE [dbo].[doIHasNoAccessControlList] ADD  DEFAULT (NULL) FOR [FastLoadData]
GO
ALTER TABLE [dbo].[doIImportable] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doIImportable] ADD  DEFAULT ((0)) FOR [VersionID]
GO
ALTER TABLE [dbo].[doIImportable] ADD  DEFAULT (NULL) FOR [Permissions]
GO
ALTER TABLE [dbo].[doIImportable] ADD  DEFAULT (NULL) FOR [FastLoadData]
GO
ALTER TABLE [dbo].[doIImportable] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doIImportable] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doIImportable] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doIImportable] ADD  DEFAULT ('') FOR [ImportDescription]
GO
ALTER TABLE [dbo].[doILabelSource] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doILabelSource] ADD  DEFAULT ((0)) FOR [VersionID]
GO
ALTER TABLE [dbo].[doILabelSource] ADD  DEFAULT (NULL) FOR [Permissions]
GO
ALTER TABLE [dbo].[doILabelSource] ADD  DEFAULT (NULL) FOR [FastLoadData]
GO
ALTER TABLE [dbo].[doILabelSourceEntry] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doILabelSourceEntry] ADD  DEFAULT ((0)) FOR [VersionID]
GO
ALTER TABLE [dbo].[doILabelSourceEntry] ADD  DEFAULT (NULL) FOR [Permissions]
GO
ALTER TABLE [dbo].[doILabelSourceEntry] ADD  DEFAULT (NULL) FOR [FastLoadData]
GO
ALTER TABLE [dbo].[doILabelSource-LabelQueues] ADD  DEFAULT ((0)) FOR [ID-1]
GO
ALTER TABLE [dbo].[doILabelSource-LabelQueues] ADD  DEFAULT ((0)) FOR [ID-2]
GO
ALTER TABLE [dbo].[doIMailingAddress] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doIMailingAddress] ADD  DEFAULT ((0)) FOR [VersionID]
GO
ALTER TABLE [dbo].[doIMailingAddress] ADD  DEFAULT (NULL) FOR [Permissions]
GO
ALTER TABLE [dbo].[doIMailingAddress] ADD  DEFAULT (NULL) FOR [FastLoadData]
GO
ALTER TABLE [dbo].[doIMailingAddress] ADD  DEFAULT ('') FOR [AddressLine1]
GO
ALTER TABLE [dbo].[doIMailingAddress] ADD  DEFAULT ('') FOR [AddressLine2]
GO
ALTER TABLE [dbo].[doIMailingAddress] ADD  DEFAULT ('') FOR [AddressState]
GO
ALTER TABLE [dbo].[doIMailingAddress] ADD  DEFAULT ('') FOR [City]
GO
ALTER TABLE [dbo].[doIMailingAddress] ADD  DEFAULT ('') FOR [Company]
GO
ALTER TABLE [dbo].[doIMailingAddress] ADD  DEFAULT ('') FOR [EmailAddress]
GO
ALTER TABLE [dbo].[doIMailingAddress] ADD  DEFAULT ('') FOR [FaxNumber]
GO
ALTER TABLE [dbo].[doIMailingAddress] ADD  DEFAULT ('') FOR [FirstName]
GO
ALTER TABLE [dbo].[doIMailingAddress] ADD  DEFAULT ('') FOR [LastName]
GO
ALTER TABLE [dbo].[doIMailingAddress] ADD  DEFAULT ('') FOR [MobileNumber]
GO
ALTER TABLE [dbo].[doIMailingAddress] ADD  DEFAULT ('') FOR [PhoneNumber]
GO
ALTER TABLE [dbo].[doIMailingAddress] ADD  DEFAULT ('') FOR [PostCode]
GO
ALTER TABLE [dbo].[doIMailingAddress] ADD  DEFAULT ('') FOR [Title]
GO
ALTER TABLE [dbo].[doIMailingAddress] ADD  DEFAULT ('') FOR [Web]
GO
ALTER TABLE [dbo].[doInvoice] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doInvoice] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doInvoice] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doInvoice] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doInvoice] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doInvoice] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doInvoice] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [IBHeaderGuid]
GO
ALTER TABLE [dbo].[doInvoice] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [RapidObjectGuid]
GO
ALTER TABLE [dbo].[doInvoice] ADD  DEFAULT ((0)) FOR [RapidSyncRequired]
GO
ALTER TABLE [dbo].[doInvoice] ADD  DEFAULT ((0)) FOR [RecordStatus]
GO
ALTER TABLE [dbo].[doInvoice] ADD  DEFAULT ((0.0)) FOR [ActualInvoiceValue]
GO
ALTER TABLE [dbo].[doInvoice] ADD  DEFAULT ((0)) FOR [Currency]
GO
ALTER TABLE [dbo].[doInvoice] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [DeliverAfter]
GO
ALTER TABLE [dbo].[doInvoice] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [DeliverBefore]
GO
ALTER TABLE [dbo].[doInvoice] ADD  DEFAULT ('') FOR [DriverName]
GO
ALTER TABLE [dbo].[doInvoice] ADD  DEFAULT ((0.0)) FOR [ExchangeRate]
GO
ALTER TABLE [dbo].[doInvoice] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [ExpectedDate]
GO
ALTER TABLE [dbo].[doInvoice] ADD  DEFAULT ((0.0)) FOR [ExpectedInvoiceValue]
GO
ALTER TABLE [dbo].[doInvoice] ADD  DEFAULT ((0)) FOR [ForceExpectedInvoiceValueUpdate]
GO
ALTER TABLE [dbo].[doInvoice] ADD  DEFAULT ((0)) FOR [HasOrder]
GO
ALTER TABLE [dbo].[doInvoice] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [InvoiceDate]
GO
ALTER TABLE [dbo].[doInvoice] ADD  DEFAULT ((0)) FOR [InvoiceEntryLastModified]
GO
ALTER TABLE [dbo].[doInvoice] ADD  DEFAULT ((0)) FOR [InvoiceGatewayID]
GO
ALTER TABLE [dbo].[doInvoice] ADD  DEFAULT ('') FOR [InvoiceNumber]
GO
ALTER TABLE [dbo].[doInvoice] ADD  DEFAULT ((0)) FOR [InvoiceType]
GO
ALTER TABLE [dbo].[doInvoice] ADD  DEFAULT ((0)) FOR [IsAboveVariationLimit]
GO
ALTER TABLE [dbo].[doInvoice] ADD  DEFAULT ((0)) FOR [IsApproved]
GO
ALTER TABLE [dbo].[doInvoice] ADD  DEFAULT ((0)) FOR [IsClosed]
GO
ALTER TABLE [dbo].[doInvoice] ADD  DEFAULT ((0)) FOR [PurchaseOrderGatewayID]
GO
ALTER TABLE [dbo].[doInvoice] ADD  DEFAULT ('') FOR [ReceivedBy]
GO
ALTER TABLE [dbo].[doInvoice] ADD  DEFAULT ((0)) FOR [Supplier]
GO
ALTER TABLE [dbo].[doInvoice] ADD  DEFAULT ((0)) FOR [TransferActivity]
GO
ALTER TABLE [dbo].[doInvoice] ADD  DEFAULT ('') FOR [TransferReference]
GO
ALTER TABLE [dbo].[doInvoice] ADD  DEFAULT ((0.0)) FOR [Variation]
GO
ALTER TABLE [dbo].[doInvoiceEntry] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doInvoiceEntry] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doInvoiceEntry] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doInvoiceEntry] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doInvoiceEntry] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doInvoiceEntry] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doInvoiceEntry] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [IBHeaderGuid]
GO
ALTER TABLE [dbo].[doInvoiceEntry] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [RapidObjectGuid]
GO
ALTER TABLE [dbo].[doInvoiceEntry] ADD  DEFAULT ((0)) FOR [RapidSyncRequired]
GO
ALTER TABLE [dbo].[doInvoiceEntry] ADD  DEFAULT ((0)) FOR [RecordStatus]
GO
ALTER TABLE [dbo].[doInvoiceEntry] ADD  DEFAULT ('') FOR [Class]
GO
ALTER TABLE [dbo].[doInvoiceEntry] ADD  DEFAULT ((0.0)) FOR [DiscountIncGst]
GO
ALTER TABLE [dbo].[doInvoiceEntry] ADD  DEFAULT ('') FOR [Ean]
GO
ALTER TABLE [dbo].[doInvoiceEntry] ADD  DEFAULT ((0.0)) FOR [ExtSupplierCostTax]
GO
ALTER TABLE [dbo].[doInvoiceEntry] ADD  DEFAULT ((0.0)) FOR [ExtendedForeignCost]
GO
ALTER TABLE [dbo].[doInvoiceEntry] ADD  DEFAULT ((0.0)) FOR [ForeignCost]
GO
ALTER TABLE [dbo].[doInvoiceEntry] ADD  DEFAULT ('') FOR [GatewayResponse]
GO
ALTER TABLE [dbo].[doInvoiceEntry] ADD  DEFAULT ((0)) FOR [Invoice]
GO
ALTER TABLE [dbo].[doInvoiceEntry] ADD  DEFAULT ((0)) FOR [InvoicedItem]
GO
ALTER TABLE [dbo].[doInvoiceEntry] ADD  DEFAULT ('') FOR [ItemDescription]
GO
ALTER TABLE [dbo].[doInvoiceEntry] ADD  DEFAULT ((0)) FOR [ItemTax]
GO
ALTER TABLE [dbo].[doInvoiceEntry] ADD  DEFAULT ('') FOR [Manufacturer]
GO
ALTER TABLE [dbo].[doInvoiceEntry] ADD  DEFAULT ((0.0)) FOR [NetInStoreCost]
GO
ALTER TABLE [dbo].[doInvoiceEntry] ADD  DEFAULT ((0.0)) FOR [NormalCostExGst]
GO
ALTER TABLE [dbo].[doInvoiceEntry] ADD  DEFAULT ((0.0)) FOR [NormalCostGst]
GO
ALTER TABLE [dbo].[doInvoiceEntry] ADD  DEFAULT ((0.0)) FOR [NormalCostIncGst]
GO
ALTER TABLE [dbo].[doInvoiceEntry] ADD  DEFAULT ((0.0)) FOR [OrderedQuantity]
GO
ALTER TABLE [dbo].[doInvoiceEntry] ADD  DEFAULT ((0.0)) FOR [OriginalQuantityOrdered]
GO
ALTER TABLE [dbo].[doInvoiceEntry] ADD  DEFAULT ((0)) FOR [PacksBackordered]
GO
ALTER TABLE [dbo].[doInvoiceEntry] ADD  DEFAULT ((0)) FOR [PacksOrdered]
GO
ALTER TABLE [dbo].[doInvoiceEntry] ADD  DEFAULT ((0)) FOR [PacksOutOfStock]
GO
ALTER TABLE [dbo].[doInvoiceEntry] ADD  DEFAULT ((0)) FOR [PacksSupplied]
GO
ALTER TABLE [dbo].[doInvoiceEntry] ADD  DEFAULT ((0.0)) FOR [QuantityInvoiced]
GO
ALTER TABLE [dbo].[doInvoiceEntry] ADD  DEFAULT ((0.0)) FOR [QuantityOutOfStock]
GO
ALTER TABLE [dbo].[doInvoiceEntry] ADD  DEFAULT ((0.0)) FOR [QuantityReceived]
GO
ALTER TABLE [dbo].[doInvoiceEntry] ADD  DEFAULT ((0.0)) FOR [QuantityReturnForCredit]
GO
ALTER TABLE [dbo].[doInvoiceEntry] ADD  DEFAULT ((0.0)) FOR [QuantityScanned]
GO
ALTER TABLE [dbo].[doInvoiceEntry] ADD  DEFAULT ('') FOR [Reference]
GO
ALTER TABLE [dbo].[doInvoiceEntry] ADD  DEFAULT ('') FOR [ReorderNumber]
GO
ALTER TABLE [dbo].[doInvoiceEntry] ADD  DEFAULT ((0.0)) FOR [RetailPrice]
GO
ALTER TABLE [dbo].[doInvoiceEntry] ADD  DEFAULT ((0.0)) FOR [SupplierCost]
GO
ALTER TABLE [dbo].[doInvoiceEntry] ADD  DEFAULT ((0.0)) FOR [SupplierCostTax]
GO
ALTER TABLE [dbo].[doInvoiceEntry] ADD  DEFAULT ((0.0)) FOR [SurchargeIncGst]
GO
ALTER TABLE [dbo].[doInvoiceEntry] ADD  DEFAULT ('') FOR [Tote]
GO
ALTER TABLE [dbo].[doInvoiceEntry] ADD  DEFAULT ('') FOR [Tun]
GO
ALTER TABLE [dbo].[doInvoiceEntry] ADD  DEFAULT ('') FOR [Warehouse]
GO
ALTER TABLE [dbo].[doInvoiceEntryReceive] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doInvoiceEntryReceive] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doInvoiceEntryReceive] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doInvoiceEntryReceive] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doInvoiceEntryReceive] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doInvoiceEntryReceive] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doInvoiceEntryReceive] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [IBHeaderGuid]
GO
ALTER TABLE [dbo].[doInvoiceEntryReceive] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [RapidObjectGuid]
GO
ALTER TABLE [dbo].[doInvoiceEntryReceive] ADD  DEFAULT ((0)) FOR [RapidSyncRequired]
GO
ALTER TABLE [dbo].[doInvoiceEntryReceive] ADD  DEFAULT ((0)) FOR [RecordStatus]
GO
ALTER TABLE [dbo].[doInvoiceEntryReceive] ADD  DEFAULT ((0)) FOR [InvoiceEntry]
GO
ALTER TABLE [dbo].[doInvoiceEntryReceive] ADD  DEFAULT ((0)) FOR [PurchaseOrderEntry]
GO
ALTER TABLE [dbo].[doInvoiceEntryReceive] ADD  DEFAULT ((0.0)) FOR [QuantityInvoiced]
GO
ALTER TABLE [dbo].[doInvoiceEntryReceive] ADD  DEFAULT ((0.0)) FOR [QuantityOutOfStock]
GO
ALTER TABLE [dbo].[doInvoiceEntryReceive] ADD  DEFAULT ((0.0)) FOR [QuantityReceived]
GO
ALTER TABLE [dbo].[doInvoiceEntryReceive] ADD  DEFAULT ((0.0)) FOR [QuantityReturnForCredit]
GO
ALTER TABLE [dbo].[doInvoiceOtherCost] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doInvoiceOtherCost] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doInvoiceOtherCost] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doInvoiceOtherCost] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doInvoiceOtherCost] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doInvoiceOtherCost] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doInvoiceOtherCost] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [IBHeaderGuid]
GO
ALTER TABLE [dbo].[doInvoiceOtherCost] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [RapidObjectGuid]
GO
ALTER TABLE [dbo].[doInvoiceOtherCost] ADD  DEFAULT ((0)) FOR [RapidSyncRequired]
GO
ALTER TABLE [dbo].[doInvoiceOtherCost] ADD  DEFAULT ((0)) FOR [RecordStatus]
GO
ALTER TABLE [dbo].[doInvoiceOtherCost] ADD  DEFAULT ((0.0)) FOR [Amount]
GO
ALTER TABLE [dbo].[doInvoiceOtherCost] ADD  DEFAULT ('') FOR [Code]
GO
ALTER TABLE [dbo].[doInvoiceOtherCost] ADD  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[doInvoiceOtherCost] ADD  DEFAULT ((0)) FOR [DistributeToAll]
GO
ALTER TABLE [dbo].[doInvoiceOtherCost] ADD  DEFAULT ((0)) FOR [Invoice]
GO
ALTER TABLE [dbo].[doInvoiceOtherCost] ADD  DEFAULT ((0)) FOR [ItemTax]
GO
ALTER TABLE [dbo].[doInvoiceOtherCost] ADD  DEFAULT ((0.0)) FOR [Tax]
GO
ALTER TABLE [dbo].[doInvoiceOtherCost-PurchaseOrderEntries] ADD  DEFAULT ((0)) FOR [ID-1]
GO
ALTER TABLE [dbo].[doInvoiceOtherCost-PurchaseOrderEntries] ADD  DEFAULT ((0)) FOR [ID-2]
GO
ALTER TABLE [dbo].[doIRapid] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doIRapid] ADD  DEFAULT ((0)) FOR [VersionID]
GO
ALTER TABLE [dbo].[doIRapid] ADD  DEFAULT (NULL) FOR [Permissions]
GO
ALTER TABLE [dbo].[doIRapid] ADD  DEFAULT (NULL) FOR [FastLoadData]
GO
ALTER TABLE [dbo].[doIRapid] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [IBHeaderGuid]
GO
ALTER TABLE [dbo].[doIRapid] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [RapidObjectGuid]
GO
ALTER TABLE [dbo].[doIRapid] ADD  DEFAULT ((0)) FOR [RapidSyncRequired]
GO
ALTER TABLE [dbo].[doIRapid] ADD  DEFAULT ((0)) FOR [RecordStatus]
GO
ALTER TABLE [dbo].[doISecurityRoot] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doISecurityRoot] ADD  DEFAULT ((0)) FOR [VersionID]
GO
ALTER TABLE [dbo].[doISecurityRoot] ADD  DEFAULT (NULL) FOR [Permissions]
GO
ALTER TABLE [dbo].[doISecurityRoot] ADD  DEFAULT (NULL) FOR [FastLoadData]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0)) FOR [ActivePromotionEntry]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0)) FOR [AppCatHQID]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [AppCatHQLastMatched]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0)) FOR [AutoCalcPriceLevel]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0)) FOR [BarcodeFormat]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [BlockSalesAfterDate]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [BlockSalesBeforeDate]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ('') FOR [BlockSalesReason]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0)) FOR [BlockSalesType]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0.0)) FOR [BuydownPrice]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0.0)) FOR [BuydownQuantity]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ('') FOR [CatalogueReferenceID]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0.0)) FOR [CommissionAmount]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0.0)) FOR [CommissionMaximum]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0)) FOR [CommissionMode]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0.0)) FOR [CommissionPercentProfit]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0.0)) FOR [CommissionPercentSale]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0)) FOR [Consignment]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ('') FOR [Content]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ('') FOR [Detail1]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ('') FOR [Detail2]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ('') FOR [Detail3]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0)) FOR [Dimension1]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0)) FOR [Dimension2]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0)) FOR [Dimension3]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0)) FOR [Dimensions]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0)) FOR [DontCalculateROUValue]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0)) FOR [ExcludedFromLoyalty]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ('') FOR [ExtendedDescription]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0)) FOR [FixedPrice]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0)) FOR [FoodStampable]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0.0)) FOR [ForeignCost]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ('') FOR [GroupedDescription]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0)) FOR [HideOnNetDisplay]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ('') FOR [ImportDescription]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [ItemAddedDate]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0)) FOR [ItemNotDiscountable]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0)) FOR [LabelTemplate]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0.0)) FOR [LastCost]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [LastCounted]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0.0)) FOR [LastStockCount]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0.0)) FOR [MSRP]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0)) FOR [ParentItem]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0.0)) FOR [ParentQuantity]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ('') FOR [PictureName]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0.0)) FOR [PriceLevelA]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0.0)) FOR [PriceLevelB]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0.0)) FOR [PriceLevelC]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0)) FOR [PriceMustBeEntered]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0)) FOR [PriceType]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ('') FOR [PricingPolicy]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0)) FOR [QuantityDiscountScheme]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0)) FOR [QuantityEntryNotAllowed]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [ROULastUpdated]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0)) FOR [ROUScheme]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0.0)) FOR [ROUValue]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0)) FOR [ReCalcROPRestockLvlFromROU]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0.0)) FOR [RebateAmount]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ('') FOR [Remarks]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0.0)) FOR [ReplacementCost]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [SaleEndDate]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0.0)) FOR [SalePrice]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [SaleStartDate]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0)) FOR [SaleType]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0)) FOR [SerialNumberCount]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0)) FOR [TagAlongItem]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0.0)) FOR [TagAlongQuantity]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0.0)) FOR [TareWeight]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0.0)) FOR [TareWeightPercent]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0)) FOR [Taxable]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ('') FOR [Title1]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ('') FOR [Title2]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ('') FOR [Title3]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0)) FOR [TransferAvailable]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0)) FOR [TransferOutMinOrder]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0)) FOR [TransferOutPackQuantity]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ('') FOR [UnitOfMeasure]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0)) FOR [UseComponentCost]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0)) FOR [UseComponentPrice]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ('') FOR [UsuallyShip]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0)) FOR [WebItem]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0)) FOR [Weighed]
GO
ALTER TABLE [dbo].[doItem] ADD  DEFAULT ((0.0)) FOR [Weight]
GO
ALTER TABLE [dbo].[doItemBase] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doItemBase] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doItemBase] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doItemBase] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doItemBase] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doItemBase] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doItemBase] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [IBHeaderGuid]
GO
ALTER TABLE [dbo].[doItemBase] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [RapidObjectGuid]
GO
ALTER TABLE [dbo].[doItemBase] ADD  DEFAULT ((0)) FOR [RapidSyncRequired]
GO
ALTER TABLE [dbo].[doItemBase] ADD  DEFAULT ((0)) FOR [RecordStatus]
GO
ALTER TABLE [dbo].[doItemBase] ADD  DEFAULT ((0)) FOR [AutoOrder]
GO
ALTER TABLE [dbo].[doItemBase] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [AutoOrderEndDate]
GO
ALTER TABLE [dbo].[doItemBase] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [AutoOrderStartDate]
GO
ALTER TABLE [dbo].[doItemBase] ADD  DEFAULT ((0)) FOR [Category]
GO
ALTER TABLE [dbo].[doItemBase] ADD  DEFAULT ('') FOR [Code]
GO
ALTER TABLE [dbo].[doItemBase] ADD  DEFAULT ((0.0)) FOR [Cost]
GO
ALTER TABLE [dbo].[doItemBase] ADD  DEFAULT ((0)) FOR [DefaultSupplier]
GO
ALTER TABLE [dbo].[doItemBase] ADD  DEFAULT ((0)) FOR [Department]
GO
ALTER TABLE [dbo].[doItemBase] ADD  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[doItemBase] ADD  DEFAULT ((0)) FOR [DoNotOrder]
GO
ALTER TABLE [dbo].[doItemBase] ADD  DEFAULT ((0)) FOR [InActive]
GO
ALTER TABLE [dbo].[doItemBase] ADD  DEFAULT ((0)) FOR [IsTester]
GO
ALTER TABLE [dbo].[doItemBase] ADD  DEFAULT ((0)) FOR [ItemClassification]
GO
ALTER TABLE [dbo].[doItemBase] ADD  DEFAULT ('') FOR [ItemLocation]
GO
ALTER TABLE [dbo].[doItemBase] ADD  DEFAULT ((0)) FOR [ItemMessage]
GO
ALTER TABLE [dbo].[doItemBase] ADD  DEFAULT ((0)) FOR [ItemTax]
GO
ALTER TABLE [dbo].[doItemBase] ADD  DEFAULT ((0)) FOR [ItemType]
GO
ALTER TABLE [dbo].[doItemBase] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [LastOrdered]
GO
ALTER TABLE [dbo].[doItemBase] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [LastReceived]
GO
ALTER TABLE [dbo].[doItemBase] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [LastSoldDate]
GO
ALTER TABLE [dbo].[doItemBase] ADD  DEFAULT ((0.0)) FOR [LowerBound]
GO
ALTER TABLE [dbo].[doItemBase] ADD  DEFAULT ((0)) FOR [Manufacturer]
GO
ALTER TABLE [dbo].[doItemBase] ADD  DEFAULT ((0)) FOR [Merged]
GO
ALTER TABLE [dbo].[doItemBase] ADD  DEFAULT ((0)) FOR [Moved]
GO
ALTER TABLE [dbo].[doItemBase] ADD  DEFAULT ((0)) FOR [OutOfStock]
GO
ALTER TABLE [dbo].[doItemBase] ADD  DEFAULT ((0)) FOR [PreferredSupplier]
GO
ALTER TABLE [dbo].[doItemBase] ADD  DEFAULT ((0.0)) FOR [Price]
GO
ALTER TABLE [dbo].[doItemBase] ADD  DEFAULT ((0)) FOR [PricingPlan]
GO
ALTER TABLE [dbo].[doItemBase] ADD  DEFAULT ((0)) FOR [ProductStatus]
GO
ALTER TABLE [dbo].[doItemBase] ADD  DEFAULT ((0)) FOR [PurchaseTax]
GO
ALTER TABLE [dbo].[doItemBase] ADD  DEFAULT ((0.0)) FOR [QuantityCommitted]
GO
ALTER TABLE [dbo].[doItemBase] ADD  DEFAULT ((0.0)) FOR [QuantityOnDraft]
GO
ALTER TABLE [dbo].[doItemBase] ADD  DEFAULT ((0.0)) FOR [QuantityOnHand]
GO
ALTER TABLE [dbo].[doItemBase] ADD  DEFAULT ((0.0)) FOR [QuantityOnOrder]
GO
ALTER TABLE [dbo].[doItemBase] ADD  DEFAULT ((0.0)) FOR [QuantityOnReturnForCredit]
GO
ALTER TABLE [dbo].[doItemBase] ADD  DEFAULT ((0.0)) FOR [QuantityOnTransferIn]
GO
ALTER TABLE [dbo].[doItemBase] ADD  DEFAULT ((0.0)) FOR [QuantityOnTransferOut]
GO
ALTER TABLE [dbo].[doItemBase] ADD  DEFAULT ((0.0)) FOR [ReorderPoint]
GO
ALTER TABLE [dbo].[doItemBase] ADD  DEFAULT ((0.0)) FOR [RestockLevel]
GO
ALTER TABLE [dbo].[doItemBase] ADD  DEFAULT ((0)) FOR [SubCategory]
GO
ALTER TABLE [dbo].[doItemBase] ADD  DEFAULT ((0.0)) FOR [Tax]
GO
ALTER TABLE [dbo].[doItemBase] ADD  DEFAULT ((0.0)) FOR [UpperBound]
GO
ALTER TABLE [dbo].[doItemClassComponent] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doItemClassComponent] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doItemClassComponent] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doItemClassComponent] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doItemClassComponent] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doItemClassComponent] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doItemClassComponent] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [IBHeaderGuid]
GO
ALTER TABLE [dbo].[doItemClassComponent] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [RapidObjectGuid]
GO
ALTER TABLE [dbo].[doItemClassComponent] ADD  DEFAULT ((0)) FOR [RapidSyncRequired]
GO
ALTER TABLE [dbo].[doItemClassComponent] ADD  DEFAULT ((0)) FOR [RecordStatus]
GO
ALTER TABLE [dbo].[doItemClassComponent] ADD  DEFAULT ((0)) FOR [Active]
GO
ALTER TABLE [dbo].[doItemClassComponent] ADD  DEFAULT ('') FOR [Detail1]
GO
ALTER TABLE [dbo].[doItemClassComponent] ADD  DEFAULT ('') FOR [Detail2]
GO
ALTER TABLE [dbo].[doItemClassComponent] ADD  DEFAULT ('') FOR [Detail3]
GO
ALTER TABLE [dbo].[doItemClassComponent] ADD  DEFAULT ((0)) FOR [ItemClass]
GO
ALTER TABLE [dbo].[doItemClassComponent] ADD  DEFAULT ((0)) FOR [ItemComponent]
GO
ALTER TABLE [dbo].[doItemClassComponent] ADD  DEFAULT ((0.0)) FOR [Price]
GO
ALTER TABLE [dbo].[doItemClassComponent] ADD  DEFAULT ((0.0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[doItemClassification] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doItemClassification] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doItemClassification] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doItemClassification] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doItemClassification] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doItemClassification] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doItemClassification] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [IBHeaderGuid]
GO
ALTER TABLE [dbo].[doItemClassification] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [RapidObjectGuid]
GO
ALTER TABLE [dbo].[doItemClassification] ADD  DEFAULT ((0)) FOR [RapidSyncRequired]
GO
ALTER TABLE [dbo].[doItemClassification] ADD  DEFAULT ((0)) FOR [RecordStatus]
GO
ALTER TABLE [dbo].[doItemClassification] ADD  DEFAULT ('') FOR [Code]
GO
ALTER TABLE [dbo].[doItemClassification] ADD  DEFAULT ((0)) FOR [DefaultClassification]
GO
ALTER TABLE [dbo].[doItemClassification] ADD  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[doItemCodeScheme] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doItemCodeScheme] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doItemCodeScheme] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doItemCodeScheme] ADD  DEFAULT ((0)) FOR [IsDefaultScheme]
GO
ALTER TABLE [dbo].[doItemCodeScheme] ADD  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[doItemCodeScheme] ADD  DEFAULT ('') FOR [Prefix]
GO
ALTER TABLE [dbo].[doItemCodeScheme] ADD  DEFAULT ('') FOR [PrefixSeparator]
GO
ALTER TABLE [dbo].[doItemCodeScheme] ADD  DEFAULT ('') FOR [Suffix]
GO
ALTER TABLE [dbo].[doItemCodeScheme] ADD  DEFAULT ('') FOR [SuffixSeparator]
GO
ALTER TABLE [dbo].[doItem-ItemUsage] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doItem-ItemUsage] ADD  DEFAULT ((0)) FOR [ActivityCount]
GO
ALTER TABLE [dbo].[doItem-ItemUsage] ADD  DEFAULT ((0.0)) FOR [GovernmentRecovery]
GO
ALTER TABLE [dbo].[doItem-ItemUsage] ADD  DEFAULT ((0)) FOR [ItemUsed]
GO
ALTER TABLE [dbo].[doItem-ItemUsage] ADD  DEFAULT ((0.0)) FOR [MaxPrice]
GO
ALTER TABLE [dbo].[doItem-ItemUsage] ADD  DEFAULT ((0.0)) FOR [MinPrice]
GO
ALTER TABLE [dbo].[doItem-ItemUsage] ADD  DEFAULT ((0)) FOR [Month]
GO
ALTER TABLE [dbo].[doItem-ItemUsage] ADD  DEFAULT ((0.0)) FOR [TotalCost]
GO
ALTER TABLE [dbo].[doItem-ItemUsage] ADD  DEFAULT ((0.0)) FOR [TotalDiscounts]
GO
ALTER TABLE [dbo].[doItem-ItemUsage] ADD  DEFAULT ((0.0)) FOR [TotalPrice]
GO
ALTER TABLE [dbo].[doItem-ItemUsage] ADD  DEFAULT ((0.0)) FOR [TotalProfit]
GO
ALTER TABLE [dbo].[doItem-ItemUsage] ADD  DEFAULT ((0.0)) FOR [TotalQuantity]
GO
ALTER TABLE [dbo].[doItem-ItemUsage] ADD  DEFAULT ((0.0)) FOR [TotalSalesTax]
GO
ALTER TABLE [dbo].[doItem-ItemUsage] ADD  DEFAULT ((0)) FOR [Year]
GO
ALTER TABLE [dbo].[doItemManager] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doItemManager] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doItemManager] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doItemManager] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doItemManager] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doItemManager] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doItemManager] ADD  DEFAULT ('') FOR [CommittedBy]
GO
ALTER TABLE [dbo].[doItemManager] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [CommittedDate]
GO
ALTER TABLE [dbo].[doItemManager] ADD  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[doItemManager] ADD  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[doItemManagerEntry] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doItemManagerEntry] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doItemManagerEntry] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doItemManagerEntry] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doItemManagerEntry] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doItemManagerEntry] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doItemManagerEntry] ADD  DEFAULT ((0)) FOR [AutoCalcPriceLevel]
GO
ALTER TABLE [dbo].[doItemManagerEntry] ADD  DEFAULT ((0)) FOR [Category]
GO
ALTER TABLE [dbo].[doItemManagerEntry] ADD  DEFAULT ((0.0)) FOR [Cost]
GO
ALTER TABLE [dbo].[doItemManagerEntry] ADD  DEFAULT ((0)) FOR [Department]
GO
ALTER TABLE [dbo].[doItemManagerEntry] ADD  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[doItemManagerEntry] ADD  DEFAULT ('') FOR [Detail1]
GO
ALTER TABLE [dbo].[doItemManagerEntry] ADD  DEFAULT ('') FOR [Detail2]
GO
ALTER TABLE [dbo].[doItemManagerEntry] ADD  DEFAULT ('') FOR [Detail3]
GO
ALTER TABLE [dbo].[doItemManagerEntry] ADD  DEFAULT ((0)) FOR [DoNotOrder]
GO
ALTER TABLE [dbo].[doItemManagerEntry] ADD  DEFAULT ('') FOR [ExtendedDescription]
GO
ALTER TABLE [dbo].[doItemManagerEntry] ADD  DEFAULT ((0)) FOR [HideOnNetDisplay]
GO
ALTER TABLE [dbo].[doItemManagerEntry] ADD  DEFAULT ((0)) FOR [InActive]
GO
ALTER TABLE [dbo].[doItemManagerEntry] ADD  DEFAULT ((0)) FOR [Item]
GO
ALTER TABLE [dbo].[doItemManagerEntry] ADD  DEFAULT ('') FOR [ItemLocation]
GO
ALTER TABLE [dbo].[doItemManagerEntry] ADD  DEFAULT ((0)) FOR [ItemManager]
GO
ALTER TABLE [dbo].[doItemManagerEntry] ADD  DEFAULT ((0)) FOR [ItemNotDiscountable]
GO
ALTER TABLE [dbo].[doItemManagerEntry] ADD  DEFAULT ((0)) FOR [ItemTax]
GO
ALTER TABLE [dbo].[doItemManagerEntry] ADD  DEFAULT ((0.0)) FOR [Price]
GO
ALTER TABLE [dbo].[doItemManagerEntry] ADD  DEFAULT ((0.0)) FOR [PriceLevelA]
GO
ALTER TABLE [dbo].[doItemManagerEntry] ADD  DEFAULT ((0.0)) FOR [PriceLevelB]
GO
ALTER TABLE [dbo].[doItemManagerEntry] ADD  DEFAULT ((0.0)) FOR [PriceLevelC]
GO
ALTER TABLE [dbo].[doItemManagerEntry] ADD  DEFAULT ((0)) FOR [PriceMustBeEntered]
GO
ALTER TABLE [dbo].[doItemManagerEntry] ADD  DEFAULT ((0)) FOR [ROUScheme]
GO
ALTER TABLE [dbo].[doItemManagerEntry] ADD  DEFAULT ((0)) FOR [ReCalcROPRestockLvlFromROU]
GO
ALTER TABLE [dbo].[doItemManagerEntry] ADD  DEFAULT ((0.0)) FOR [ReorderPoint]
GO
ALTER TABLE [dbo].[doItemManagerEntry] ADD  DEFAULT ((0.0)) FOR [RestockLevel]
GO
ALTER TABLE [dbo].[doItemMergeQueue] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doItemMergeQueue] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doItemMergeQueue] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doItemMergeQueue] ADD  DEFAULT ((0)) FOR [AliasMergeState]
GO
ALTER TABLE [dbo].[doItemMergeQueue] ADD  DEFAULT ((0)) FOR [DestinationItemID]
GO
ALTER TABLE [dbo].[doItemMergeQueue] ADD  DEFAULT ((0)) FOR [IsComplete]
GO
ALTER TABLE [dbo].[doItemMergeQueue] ADD  DEFAULT ((0)) FOR [KeepSourceDetails]
GO
ALTER TABLE [dbo].[doItemMergeQueue] ADD  DEFAULT ((0)) FOR [KeepSourcePrices]
GO
ALTER TABLE [dbo].[doItemMergeQueue] ADD  DEFAULT ((0)) FOR [MergeCounter]
GO
ALTER TABLE [dbo].[doItemMergeQueue] ADD  DEFAULT ((0)) FOR [MoveHistory]
GO
ALTER TABLE [dbo].[doItemMergeQueue] ADD  DEFAULT ('') FOR [Remarks]
GO
ALTER TABLE [dbo].[doItemMergeQueue] ADD  DEFAULT ((0)) FOR [SourceItemID]
GO
ALTER TABLE [dbo].[doItemMergeQueue] ADD  DEFAULT ((0)) FOR [StockMergeState]
GO
ALTER TABLE [dbo].[doItemMergeQueue-SupplierItems] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doItemMergeQueue-SupplierItems] ADD  DEFAULT ((0)) FOR [Owner]
GO
ALTER TABLE [dbo].[doItemMergeQueue-SupplierItems] ADD  DEFAULT ((0)) FOR [SupplierItemIdKeep]
GO
ALTER TABLE [dbo].[doItemMergeQueue-SupplierItems] ADD  DEFAULT ((0)) FOR [SupplierItemIdRemove]
GO
ALTER TABLE [dbo].[doItemMessage] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doItemMessage] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doItemMessage] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doItemMessage] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doItemMessage] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doItemMessage] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doItemMessage] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [IBHeaderGuid]
GO
ALTER TABLE [dbo].[doItemMessage] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [RapidObjectGuid]
GO
ALTER TABLE [dbo].[doItemMessage] ADD  DEFAULT ((0)) FOR [RapidSyncRequired]
GO
ALTER TABLE [dbo].[doItemMessage] ADD  DEFAULT ((0)) FOR [RecordStatus]
GO
ALTER TABLE [dbo].[doItemMessage] ADD  DEFAULT ((0)) FOR [AgeLimit]
GO
ALTER TABLE [dbo].[doItemMessage] ADD  DEFAULT ('') FOR [Code]
GO
ALTER TABLE [dbo].[doItemMessage] ADD  DEFAULT ('') FOR [Message]
GO
ALTER TABLE [dbo].[doItemMovementHistory] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doItemMovementHistory] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doItemMovementHistory] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doItemMovementHistory] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doItemMovementHistory] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doItemMovementHistory] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doItemMovementHistory] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [IBHeaderGuid]
GO
ALTER TABLE [dbo].[doItemMovementHistory] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [RapidObjectGuid]
GO
ALTER TABLE [dbo].[doItemMovementHistory] ADD  DEFAULT ((0)) FOR [RapidSyncRequired]
GO
ALTER TABLE [dbo].[doItemMovementHistory] ADD  DEFAULT ((0)) FOR [RecordStatus]
GO
ALTER TABLE [dbo].[doItemMovementHistory] ADD  DEFAULT ((0.0)) FOR [AdjustmentQuantity]
GO
ALTER TABLE [dbo].[doItemMovementHistory] ADD  DEFAULT ((0.0)) FOR [AfterQuantity]
GO
ALTER TABLE [dbo].[doItemMovementHistory] ADD  DEFAULT ((0.0)) FOR [Cost]
GO
ALTER TABLE [dbo].[doItemMovementHistory] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Date]
GO
ALTER TABLE [dbo].[doItemMovementHistory] ADD  DEFAULT ((0)) FOR [Historical]
GO
ALTER TABLE [dbo].[doItemMovementHistory] ADD  DEFAULT ((0)) FOR [ItemUsed]
GO
ALTER TABLE [dbo].[doItemMovementHistory] ADD  DEFAULT ((0)) FOR [MovementSource]
GO
ALTER TABLE [dbo].[doItemMovementHistory] ADD  DEFAULT ((1)) FOR [MovementType]
GO
ALTER TABLE [dbo].[doItemMovementHistory] ADD  DEFAULT ((0)) FOR [Reason]
GO
ALTER TABLE [dbo].[doItemMovementHistory] ADD  DEFAULT ('') FOR [Remarks]
GO
ALTER TABLE [dbo].[doItemMovementHistory] ADD  DEFAULT ((0.0)) FOR [Retail]
GO
ALTER TABLE [dbo].[doItemPricingHistory] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doItemPricingHistory] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doItemPricingHistory] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doItemPricingHistory] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doItemPricingHistory] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doItemPricingHistory] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doItemPricingHistory] ADD  DEFAULT ((0.0)) FOR [AfterCost]
GO
ALTER TABLE [dbo].[doItemPricingHistory] ADD  DEFAULT ((0.0)) FOR [AfterPrice]
GO
ALTER TABLE [dbo].[doItemPricingHistory] ADD  DEFAULT ((0.0)) FOR [BeforeCost]
GO
ALTER TABLE [dbo].[doItemPricingHistory] ADD  DEFAULT ((0.0)) FOR [BeforePrice]
GO
ALTER TABLE [dbo].[doItemPricingHistory] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Date]
GO
ALTER TABLE [dbo].[doItemPricingHistory] ADD  DEFAULT ((0)) FOR [ItemUsed]
GO
ALTER TABLE [dbo].[doItemPricingHistory] ADD  DEFAULT ('') FOR [Message]
GO
ALTER TABLE [dbo].[doItemPricingHistory] ADD  DEFAULT ('') FOR [SourceName]
GO
ALTER TABLE [dbo].[doItemTax] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doItemTax] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doItemTax] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doItemTax] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doItemTax] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doItemTax] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doItemTax] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [IBHeaderGuid]
GO
ALTER TABLE [dbo].[doItemTax] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [RapidObjectGuid]
GO
ALTER TABLE [dbo].[doItemTax] ADD  DEFAULT ((0)) FOR [RapidSyncRequired]
GO
ALTER TABLE [dbo].[doItemTax] ADD  DEFAULT ((0)) FOR [RecordStatus]
GO
ALTER TABLE [dbo].[doItemTax] ADD  DEFAULT ((0)) FOR [Active]
GO
ALTER TABLE [dbo].[doItemTax] ADD  DEFAULT ('') FOR [Code]
GO
ALTER TABLE [dbo].[doItemTax] ADD  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[doItemTax] ADD  DEFAULT ((0)) FOR [Options]
GO
ALTER TABLE [dbo].[doItemTax] ADD  DEFAULT ((0)) FOR [ShowOnReceipt01]
GO
ALTER TABLE [dbo].[doItemTax] ADD  DEFAULT ((0)) FOR [ShowOnReceipt02]
GO
ALTER TABLE [dbo].[doItemTax] ADD  DEFAULT ((0)) FOR [ShowOnReceipt03]
GO
ALTER TABLE [dbo].[doItemTax] ADD  DEFAULT ((0)) FOR [ShowOnReceipt04]
GO
ALTER TABLE [dbo].[doItemTax] ADD  DEFAULT ((0)) FOR [ShowOnReceipt05]
GO
ALTER TABLE [dbo].[doItemTax] ADD  DEFAULT ((0)) FOR [ShowOnReceipt06]
GO
ALTER TABLE [dbo].[doItemTax] ADD  DEFAULT ((0)) FOR [ShowOnReceipt07]
GO
ALTER TABLE [dbo].[doItemTax] ADD  DEFAULT ((0)) FOR [ShowOnReceipt08]
GO
ALTER TABLE [dbo].[doItemTax] ADD  DEFAULT ((0)) FOR [ShowOnReceipt09]
GO
ALTER TABLE [dbo].[doItemTax] ADD  DEFAULT ((0)) FOR [ShowOnReceipt10]
GO
ALTER TABLE [dbo].[doItemTax] ADD  DEFAULT ((0)) FOR [Tax01]
GO
ALTER TABLE [dbo].[doItemTax] ADD  DEFAULT ((0)) FOR [Tax02]
GO
ALTER TABLE [dbo].[doItemTax] ADD  DEFAULT ((0)) FOR [Tax03]
GO
ALTER TABLE [dbo].[doItemTax] ADD  DEFAULT ((0)) FOR [Tax04]
GO
ALTER TABLE [dbo].[doItemTax] ADD  DEFAULT ((0)) FOR [Tax05]
GO
ALTER TABLE [dbo].[doItemTax] ADD  DEFAULT ((0)) FOR [Tax06]
GO
ALTER TABLE [dbo].[doItemTax] ADD  DEFAULT ((0)) FOR [Tax07]
GO
ALTER TABLE [dbo].[doItemTax] ADD  DEFAULT ((0)) FOR [Tax08]
GO
ALTER TABLE [dbo].[doItemTax] ADD  DEFAULT ((0)) FOR [Tax09]
GO
ALTER TABLE [dbo].[doItemTax] ADD  DEFAULT ((0)) FOR [Tax10]
GO
ALTER TABLE [dbo].[doIValidationStartCallback] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doIValidationStartCallback] ADD  DEFAULT ((0)) FOR [VersionID]
GO
ALTER TABLE [dbo].[doIValidationStartCallback] ADD  DEFAULT (NULL) FOR [Permissions]
GO
ALTER TABLE [dbo].[doIValidationStartCallback] ADD  DEFAULT (NULL) FOR [FastLoadData]
GO
ALTER TABLE [dbo].[doKit] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doKit] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doKit] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doKit] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doKit] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doKit] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doKit] ADD  DEFAULT ((0)) FOR [ComponentItem]
GO
ALTER TABLE [dbo].[doKit] ADD  DEFAULT ((0)) FOR [KitItem]
GO
ALTER TABLE [dbo].[doKit] ADD  DEFAULT ((0.0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[doLabelElement] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doLabelElement] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doLabelElement] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doLabelElement] ADD  DEFAULT ((0)) FOR [BarCodeDisplayText]
GO
ALTER TABLE [dbo].[doLabelElement] ADD  DEFAULT ((0)) FOR [FontBold]
GO
ALTER TABLE [dbo].[doLabelElement] ADD  DEFAULT ((0)) FOR [FontSize]
GO
ALTER TABLE [dbo].[doLabelElement] ADD  DEFAULT ((0)) FOR [IsBarCode]
GO
ALTER TABLE [dbo].[doLabelElement] ADD  DEFAULT ((0)) FOR [IsMoneyFormat]
GO
ALTER TABLE [dbo].[doLabelElement] ADD  DEFAULT ('') FOR [ItemPropertyName]
GO
ALTER TABLE [dbo].[doLabelElement] ADD  DEFAULT ('') FOR [LineText]
GO
ALTER TABLE [dbo].[doLabelElement] ADD  DEFAULT ((0)) FOR [RowHeight]
GO
ALTER TABLE [dbo].[doLabelElement] ADD  DEFAULT ((0)) FOR [RowWidth]
GO
ALTER TABLE [dbo].[doLabelElement] ADD  DEFAULT ((0)) FOR [RowXPosition]
GO
ALTER TABLE [dbo].[doLabelElement] ADD  DEFAULT ((0)) FOR [RowYPosition]
GO
ALTER TABLE [dbo].[doLabelElement] ADD  DEFAULT ((1)) FOR [TextAlignment]
GO
ALTER TABLE [dbo].[doLabelPrinting] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doLabelPrinting] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doLabelPrinting] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doLabelPrinting] ADD  DEFAULT ((0)) FOR [Editable]
GO
ALTER TABLE [dbo].[doLabelPrinting] ADD  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[doLabelPrinting] ADD  DEFAULT ((0)) FOR [LabelType]
GO
ALTER TABLE [dbo].[doLabelPrinting] ADD  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[doLabelPrinting] ADD  DEFAULT ((0)) FOR [PrintWaitingTimeout]
GO
ALTER TABLE [dbo].[doLabelPrinting] ADD  DEFAULT ('') FOR [PrinterName]
GO
ALTER TABLE [dbo].[doLabelPrinting] ADD  DEFAULT ((0)) FOR [QuantityType]
GO
ALTER TABLE [dbo].[doLabelPrinting] ADD  DEFAULT ('') FOR [TemplateName]
GO
ALTER TABLE [dbo].[doLabelPrinting] ADD  DEFAULT ('') FOR [TemplateType]
GO
ALTER TABLE [dbo].[doLabelPrinting-LabelElements] ADD  DEFAULT ((0)) FOR [ID-1]
GO
ALTER TABLE [dbo].[doLabelPrinting-LabelElements] ADD  DEFAULT ((0)) FOR [ID-2]
GO
ALTER TABLE [dbo].[doLabelQueue] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doLabelQueue] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doLabelQueue] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doLabelQueue] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [CreatedDate]
GO
ALTER TABLE [dbo].[doLabelQueue] ADD  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[doLabelQueue] ADD  DEFAULT ('') FOR [DeviceID]
GO
ALTER TABLE [dbo].[doLabelQueue] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [EffectiveDate]
GO
ALTER TABLE [dbo].[doLabelQueue] ADD  DEFAULT ((0)) FOR [Item]
GO
ALTER TABLE [dbo].[doLabelQueue] ADD  DEFAULT ((0)) FOR [LabelTemplate]
GO
ALTER TABLE [dbo].[doLabelQueue] ADD  DEFAULT ((0.0)) FOR [Price]
GO
ALTER TABLE [dbo].[doLabelQueue] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [PrintDate]
GO
ALTER TABLE [dbo].[doLabelQueue] ADD  DEFAULT ('') FOR [PrintError]
GO
ALTER TABLE [dbo].[doLabelQueue] ADD  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[doLabelQueue] ADD  DEFAULT ((0)) FOR [QuantityType]
GO
ALTER TABLE [dbo].[doLabelQueue] ADD  DEFAULT ((0)) FOR [Source]
GO
ALTER TABLE [dbo].[doLabelQueue] ADD  DEFAULT ((0)) FOR [SourceType]
GO
ALTER TABLE [dbo].[doMatrixAttributeDisplayOrder] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doMatrixAttributeDisplayOrder] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doMatrixAttributeDisplayOrder] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doMatrixAttributeDisplayOrder] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doMatrixAttributeDisplayOrder] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doMatrixAttributeDisplayOrder] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doMatrixAttributeDisplayOrder] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [IBHeaderGuid]
GO
ALTER TABLE [dbo].[doMatrixAttributeDisplayOrder] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [RapidObjectGuid]
GO
ALTER TABLE [dbo].[doMatrixAttributeDisplayOrder] ADD  DEFAULT ((0)) FOR [RapidSyncRequired]
GO
ALTER TABLE [dbo].[doMatrixAttributeDisplayOrder] ADD  DEFAULT ((0)) FOR [RecordStatus]
GO
ALTER TABLE [dbo].[doMatrixAttributeDisplayOrder] ADD  DEFAULT ('') FOR [Attribute]
GO
ALTER TABLE [dbo].[doMatrixAttributeDisplayOrder] ADD  DEFAULT ('') FOR [Code]
GO
ALTER TABLE [dbo].[doMatrixAttributeDisplayOrder] ADD  DEFAULT ((0)) FOR [Dimension]
GO
ALTER TABLE [dbo].[doMatrixAttributeDisplayOrder] ADD  DEFAULT ((0)) FOR [DimensionAttribute]
GO
ALTER TABLE [dbo].[doMatrixAttributeDisplayOrder] ADD  DEFAULT ('') FOR [DimensionName]
GO
ALTER TABLE [dbo].[doMatrixAttributeDisplayOrder] ADD  DEFAULT ((0)) FOR [DimensionOrder]
GO
ALTER TABLE [dbo].[doMatrixAttributeDisplayOrder] ADD  DEFAULT ((0)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[doMatrixAttributeDisplayOrder] ADD  DEFAULT ((0)) FOR [InActive]
GO
ALTER TABLE [dbo].[doMatrixAttributeDisplayOrder] ADD  DEFAULT ((0)) FOR [ItemClass]
GO
ALTER TABLE [dbo].[doNameValuePair] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doNameValuePair] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doNameValuePair] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doNameValuePair] ADD  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[doNameValuePair] ADD  DEFAULT (NULL) FOR [Value]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ('') FOR [AccountCategory]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ('') FOR [AddressLine1]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ('') FOR [AddressLine2]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ('') FOR [AddressState]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ('') FOR [AlternateAddress]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ('') FOR [AlternateSuburb]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ((0)) FOR [AutoCreateAccount]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ((0)) FOR [AutoCreateNursingHomeAccount]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ((0)) FOR [AutoCreatePatientAccount]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ((0)) FOR [AutomaticallyPrintInvoice]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ('') FOR [City]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ('') FOR [Code]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ('') FOR [Company]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ((0.0)) FOR [DefaultPrivateFee]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ((0.0)) FOR [DefaultPrivateMarkup]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ('') FOR [DefaultScriptType]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ('') FOR [EmailAddress]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [EndServicingDate]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ('') FOR [ExcludeRequired]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ('') FOR [FaxNumber]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ('') FOR [FirstName]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ((0)) FOR [GSTIncluded]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ('') FOR [GroupedDescription]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ((0)) FOR [IsANursingHome]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ('') FOR [LastName]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ('') FOR [MobileNumber]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ('') FOR [PackOldFormat]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ((0)) FOR [PackRequiresPrn]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ((0)) FOR [PackSigningRequired]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ((0.0)) FOR [PackSlot]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ('') FOR [PackTimeSlot1]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ('') FOR [PackTimeSlot2]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ('') FOR [PackTimeSlot3]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ('') FOR [PackTimeSlot4]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ('') FOR [PackTimeSlot5]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ('') FOR [PackTimeSlot6]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ('') FOR [PackTimeSlot7]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ('') FOR [PackTimeSlot8]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [PackToDate]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ((0)) FOR [PackUnitDose]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ((0)) FOR [PackWebsterSystem]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ((0.0)) FOR [PackingStartOfWeek]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ('') FOR [PackingType]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ('') FOR [PhoneNumber]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ('') FOR [PostCode]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ((0)) FOR [ReminderNotice]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ((0)) FOR [RepatToSafetyNet]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [StartServicingDate]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ('') FOR [Title]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ((0)) FOR [UseNursingHomeAddress]
GO
ALTER TABLE [dbo].[doNursingHome] ADD  DEFAULT ('') FOR [Web]
GO
ALTER TABLE [dbo].[doOffer] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doOffer] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doOffer] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doOffer] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doOffer] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doOffer] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doOffer] ADD  DEFAULT ((0)) FOR [Campaign]
GO
ALTER TABLE [dbo].[doOffer] ADD  DEFAULT ('') FOR [Code]
GO
ALTER TABLE [dbo].[doOffer] ADD  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[doOffer] ADD  DEFAULT ((0)) FOR [DivideDiscount]
GO
ALTER TABLE [dbo].[doOffer] ADD  DEFAULT ((0.0)) FOR [DollarOffDiscount]
GO
ALTER TABLE [dbo].[doOffer] ADD  DEFAULT ((0.0)) FOR [DollarThreshold]
GO
ALTER TABLE [dbo].[doOffer] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [EndDate]
GO
ALTER TABLE [dbo].[doOffer] ADD  DEFAULT ((0)) FOR [IsDiscountable]
GO
ALTER TABLE [dbo].[doOffer] ADD  DEFAULT ((0)) FOR [IsLoyalty]
GO
ALTER TABLE [dbo].[doOffer] ADD  DEFAULT ((0)) FOR [MultiBuyXQuantity]
GO
ALTER TABLE [dbo].[doOffer] ADD  DEFAULT ((0.0)) FOR [MultiBuyYDollarAmount]
GO
ALTER TABLE [dbo].[doOffer] ADD  DEFAULT ((0)) FOR [MultiBuyYQuantity]
GO
ALTER TABLE [dbo].[doOffer] ADD  DEFAULT ((0)) FOR [MultipleRedemptions]
GO
ALTER TABLE [dbo].[doOffer] ADD  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[doOffer] ADD  DEFAULT ((1)) FOR [OfferCategory]
GO
ALTER TABLE [dbo].[doOffer] ADD  DEFAULT ((0)) FOR [OfferType]
GO
ALTER TABLE [dbo].[doOffer] ADD  DEFAULT ((0.0)) FOR [PercentOffDiscount]
GO
ALTER TABLE [dbo].[doOffer] ADD  DEFAULT ((0)) FOR [Priority]
GO
ALTER TABLE [dbo].[doOffer] ADD  DEFAULT ((0)) FOR [QuantityThreshold]
GO
ALTER TABLE [dbo].[doOffer] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [StartDate]
GO
ALTER TABLE [dbo].[doOfferCampaign] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doOfferCampaign] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doOfferCampaign] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doOfferCampaign] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doOfferCampaign] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doOfferCampaign] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doOfferCampaign] ADD  DEFAULT ('') FOR [Code]
GO
ALTER TABLE [dbo].[doOfferCampaign] ADD  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[doOfferCampaign] ADD  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[doOfferCampaign] ADD  DEFAULT ((0)) FOR [Source]
GO
ALTER TABLE [dbo].[doOfferEntry] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doOfferEntry] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doOfferEntry] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doOfferEntry] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doOfferEntry] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doOfferEntry] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doOfferEntry] ADD  DEFAULT ((0.0)) FOR [BuyDownQuantity]
GO
ALTER TABLE [dbo].[doOfferEntry] ADD  DEFAULT ((0.0)) FOR [Cost]
GO
ALTER TABLE [dbo].[doOfferEntry] ADD  DEFAULT ((0)) FOR [IsDiscountItem]
GO
ALTER TABLE [dbo].[doOfferEntry] ADD  DEFAULT ((0)) FOR [IsQualifyingItem]
GO
ALTER TABLE [dbo].[doOfferEntry] ADD  DEFAULT ((0)) FOR [Offer]
GO
ALTER TABLE [dbo].[doOfferEntry] ADD  DEFAULT ((0)) FOR [OfferItem]
GO
ALTER TABLE [dbo].[doOfferEntry] ADD  DEFAULT ((0.0)) FOR [Price]
GO
ALTER TABLE [dbo].[doOfferEntry] ADD  DEFAULT ((0)) FOR [SourceItem]
GO
ALTER TABLE [dbo].[doOfferEntry] ADD  DEFAULT ((0.0)) FOR [SourcePrice]
GO
ALTER TABLE [dbo].[doOrderTemplate] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doOrderTemplate] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doOrderTemplate] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doOrderTemplate] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doOrderTemplate] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doOrderTemplate] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doOrderTemplate] ADD  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[doOrderTemplate] ADD  DEFAULT ('') FOR [TemplateXml]
GO
ALTER TABLE [dbo].[doOutOfStockItem] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doOutOfStockItem] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doOutOfStockItem] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doOutOfStockItem] ADD  DEFAULT ((0)) FOR [Item]
GO
ALTER TABLE [dbo].[doOutOfStockItem] ADD  DEFAULT ((0.0)) FOR [LastOOSQuantity]
GO
ALTER TABLE [dbo].[doOutOfStockItem] ADD  DEFAULT ((0)) FOR [LastSupplier]
GO
ALTER TABLE [dbo].[doOutOfStockItem] ADD  DEFAULT ((0)) FOR [OrderCount]
GO
ALTER TABLE [dbo].[doOutOfStockItem] ADD  DEFAULT ((0)) FOR [PurchaseOrder]
GO
ALTER TABLE [dbo].[doOutOfStockItem] ADD  DEFAULT ('') FOR [Reason]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ((0)) FOR [AccountNumber]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ('') FOR [AccountType]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ('') FOR [Address]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ((0)) FOR [AdmissionNumber]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ('') FOR [Allergies]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ((0)) FOR [ApplyGST]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ((0)) FOR [AutoChargeAccount]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ((0)) FOR [AutomaticReceiptPrinting]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [BirthDate]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [ConcessionExpiryDate]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ('') FOR [ConcessionNumber]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ('') FOR [ConcessionType]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ((0)) FOR [Customer]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ('') FOR [Email]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ((0)) FOR [FamilyCode]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ('') FOR [FamilyIndicator]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ('') FOR [FirstName]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ((70)) FOR [Gender]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ((0)) FOR [GenericOnly]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ('') FOR [GroupedDescription]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ('') FOR [HealthFundIdentifaction]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ('') FOR [HealthFundLevelOfCover]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ('') FOR [HealthFundMemberNumber]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [InsuranceValidToDate]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ((0)) FOR [IsDiscount]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ((0)) FOR [IsDoctor]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ('') FOR [LastName]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ('') FOR [MailCategory]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ('') FOR [MedicareConsent]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [MedicareExpiryDate]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ((0)) FOR [MedicareNumber]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ('') FOR [Notes]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ((0)) FOR [NursingHome]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ('') FOR [NursingHomeBedNumber]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ('') FOR [NursingHomeCode]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ('') FOR [NursingHomeRoomNumber]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ('') FOR [NursingHomeURNumber]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ('') FOR [NursingHomeWardNumber]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ((0.0)) FOR [OutSideScriptAmount]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ((0)) FOR [OutSideScriptCount]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ((0)) FOR [OwesScript]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ((0)) FOR [PatientNumber]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ('') FOR [PatientStatus]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ('') FOR [PatientType]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ('') FOR [PhoneNumber]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ((0)) FOR [PostCode]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ('') FOR [PrivateFeeMarkUp]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ('') FOR [RepatCardColour]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ('') FOR [RepatNumber]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ((0)) FOR [RepeatsOnFile]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ((0.0)) FOR [SafetyNetScriptAmount]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ((0)) FOR [SafetyNetScriptCount]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ('') FOR [SafteyNetEntitlementNumber]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ('') FOR [Suburb]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ('') FOR [Title]
GO
ALTER TABLE [dbo].[doPatient] ADD  DEFAULT ((0)) FOR [Ward]
GO
ALTER TABLE [dbo].[doPharmacist] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doPharmacist] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doPharmacist] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doPharmacist] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doPharmacist] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doPharmacist] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doPharmacist] ADD  DEFAULT ('') FOR [FirstName]
GO
ALTER TABLE [dbo].[doPharmacist] ADD  DEFAULT ('') FOR [GroupedDescription]
GO
ALTER TABLE [dbo].[doPharmacist] ADD  DEFAULT ('') FOR [LastName]
GO
ALTER TABLE [dbo].[doPharmacist] ADD  DEFAULT ('') FOR [PharmacistsInitials]
GO
ALTER TABLE [dbo].[doPharmacist] ADD  DEFAULT ('') FOR [RegistrationNumber]
GO
ALTER TABLE [dbo].[doPharmXAccount] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doPharmXAccount] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doPharmXAccount] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doPharmXAccount] ADD  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[doPharmXAccount] ADD  DEFAULT ((0)) FOR [SupplierID]
GO
ALTER TABLE [dbo].[doPlanogram] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doPlanogram] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doPlanogram] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doPlanogram] ADD  DEFAULT ('') FOR [HorizontalFacings]
GO
ALTER TABLE [dbo].[doPlanogram] ADD  DEFAULT ('') FOR [MinimumDepth]
GO
ALTER TABLE [dbo].[doPlanogram] ADD  DEFAULT ((0)) FOR [PlanogramItem]
GO
ALTER TABLE [dbo].[doPlanogram] ADD  DEFAULT ((0)) FOR [PlanogramLocation]
GO
ALTER TABLE [dbo].[doPlanogram] ADD  DEFAULT ('') FOR [ShelfNumber]
GO
ALTER TABLE [dbo].[doPlanogram] ADD  DEFAULT ('') FOR [ShelfPosition]
GO
ALTER TABLE [dbo].[doPlanogramLocation] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doPlanogramLocation] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doPlanogramLocation] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doPlanogramLocation] ADD  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[doPricingPlan] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doPricingPlan] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doPricingPlan] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doPricingPlan] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doPricingPlan] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doPricingPlan] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doPricingPlan] ADD  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[doPricingPlan] ADD  DEFAULT ((0.0)) FOR [FixedRetail]
GO
ALTER TABLE [dbo].[doPricingPlan] ADD  DEFAULT ((0)) FOR [MarginMarkup]
GO
ALTER TABLE [dbo].[doPricingPlan] ADD  DEFAULT ((0.0)) FOR [MarginMarkupValue]
GO
ALTER TABLE [dbo].[doPricingPlan] ADD  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[doPricingPlan] ADD  DEFAULT ((0)) FOR [PlanType]
GO
ALTER TABLE [dbo].[doPricingPlan] ADD  DEFAULT ((0)) FOR [PricingLevel]
GO
ALTER TABLE [dbo].[doPricingPlan] ADD  DEFAULT ((0.0)) FOR [RoundingDenomination]
GO
ALTER TABLE [dbo].[doPricingPlan] ADD  DEFAULT ((0.0)) FOR [RoundingLowerBound]
GO
ALTER TABLE [dbo].[doPricingPlan] ADD  DEFAULT ((0)) FOR [RoundingOption]
GO
ALTER TABLE [dbo].[doPricingPlan] ADD  DEFAULT ((0.0)) FOR [RoundingUpperBound]
GO
ALTER TABLE [dbo].[doPricingPlan] ADD  DEFAULT ((0)) FOR [Supplier]
GO
ALTER TABLE [dbo].[doPricingReview] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doPricingReview] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doPricingReview] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doPricingReview] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doPricingReview] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doPricingReview] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doPricingReview] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [IBHeaderGuid]
GO
ALTER TABLE [dbo].[doPricingReview] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [RapidObjectGuid]
GO
ALTER TABLE [dbo].[doPricingReview] ADD  DEFAULT ((0)) FOR [RapidSyncRequired]
GO
ALTER TABLE [dbo].[doPricingReview] ADD  DEFAULT ((0)) FOR [RecordStatus]
GO
ALTER TABLE [dbo].[doPricingReview] ADD  DEFAULT ('') FOR [Code]
GO
ALTER TABLE [dbo].[doPricingReview] ADD  DEFAULT ('') FOR [CommittedBy]
GO
ALTER TABLE [dbo].[doPricingReview] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [CommittedDate]
GO
ALTER TABLE [dbo].[doPricingReview] ADD  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[doPricingReview] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [EffectiveDate]
GO
ALTER TABLE [dbo].[doPricingReview] ADD  DEFAULT ((0)) FOR [InActive]
GO
ALTER TABLE [dbo].[doPricingReview] ADD  DEFAULT ((0)) FOR [IsApplied]
GO
ALTER TABLE [dbo].[doPricingReview] ADD  DEFAULT ((0)) FOR [PricingReviewSourceType]
GO
ALTER TABLE [dbo].[doPricingReviewEntry] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doPricingReviewEntry] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doPricingReviewEntry] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doPricingReviewEntry] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doPricingReviewEntry] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doPricingReviewEntry] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doPricingReviewEntry] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [IBHeaderGuid]
GO
ALTER TABLE [dbo].[doPricingReviewEntry] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [RapidObjectGuid]
GO
ALTER TABLE [dbo].[doPricingReviewEntry] ADD  DEFAULT ((0)) FOR [RapidSyncRequired]
GO
ALTER TABLE [dbo].[doPricingReviewEntry] ADD  DEFAULT ((0)) FOR [RecordStatus]
GO
ALTER TABLE [dbo].[doPricingReviewEntry] ADD  DEFAULT ((0)) FOR [AcceptStatus]
GO
ALTER TABLE [dbo].[doPricingReviewEntry] ADD  DEFAULT ((0)) FOR [AutoCalcPriceLevel]
GO
ALTER TABLE [dbo].[doPricingReviewEntry] ADD  DEFAULT ((0)) FOR [InActive]
GO
ALTER TABLE [dbo].[doPricingReviewEntry] ADD  DEFAULT ((0)) FOR [Item]
GO
ALTER TABLE [dbo].[doPricingReviewEntry] ADD  DEFAULT ((0.0)) FOR [NewCost]
GO
ALTER TABLE [dbo].[doPricingReviewEntry] ADD  DEFAULT ((0.0)) FOR [NewMSRP]
GO
ALTER TABLE [dbo].[doPricingReviewEntry] ADD  DEFAULT ((0.0)) FOR [NewPriceA]
GO
ALTER TABLE [dbo].[doPricingReviewEntry] ADD  DEFAULT ((0.0)) FOR [NewPriceB]
GO
ALTER TABLE [dbo].[doPricingReviewEntry] ADD  DEFAULT ((0.0)) FOR [NewPriceC]
GO
ALTER TABLE [dbo].[doPricingReviewEntry] ADD  DEFAULT ((0.0)) FOR [NewRetail]
GO
ALTER TABLE [dbo].[doPricingReviewEntry] ADD  DEFAULT ((0.0)) FOR [NewSupplierCost]
GO
ALTER TABLE [dbo].[doPricingReviewEntry] ADD  DEFAULT ((0.0)) FOR [OldCost]
GO
ALTER TABLE [dbo].[doPricingReviewEntry] ADD  DEFAULT ((0.0)) FOR [OldMSRP]
GO
ALTER TABLE [dbo].[doPricingReviewEntry] ADD  DEFAULT ((0.0)) FOR [OldPriceA]
GO
ALTER TABLE [dbo].[doPricingReviewEntry] ADD  DEFAULT ((0.0)) FOR [OldPriceB]
GO
ALTER TABLE [dbo].[doPricingReviewEntry] ADD  DEFAULT ((0.0)) FOR [OldPriceC]
GO
ALTER TABLE [dbo].[doPricingReviewEntry] ADD  DEFAULT ((0.0)) FOR [OldRetail]
GO
ALTER TABLE [dbo].[doPricingReviewEntry] ADD  DEFAULT ((0.0)) FOR [OldSupplierCost]
GO
ALTER TABLE [dbo].[doPricingReviewEntry] ADD  DEFAULT ((0)) FOR [PricingReview]
GO
ALTER TABLE [dbo].[doPricingReviewEntry] ADD  DEFAULT ('') FOR [Source]
GO
ALTER TABLE [dbo].[doPrincipal] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doPrincipal] ADD  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[doPrincipal] ADD  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[doPrincipal-Roles] ADD  DEFAULT ((0)) FOR [ID-1]
GO
ALTER TABLE [dbo].[doPrincipal-Roles] ADD  DEFAULT ((0)) FOR [ID-2]
GO
ALTER TABLE [dbo].[doPromotion] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doPromotion] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doPromotion] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doPromotion] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doPromotion] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doPromotion] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doPromotion] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [IBHeaderGuid]
GO
ALTER TABLE [dbo].[doPromotion] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [RapidObjectGuid]
GO
ALTER TABLE [dbo].[doPromotion] ADD  DEFAULT ((0)) FOR [RapidSyncRequired]
GO
ALTER TABLE [dbo].[doPromotion] ADD  DEFAULT ((0)) FOR [RecordStatus]
GO
ALTER TABLE [dbo].[doPromotion] ADD  DEFAULT ('') FOR [CampaignCode]
GO
ALTER TABLE [dbo].[doPromotion] ADD  DEFAULT ('') FOR [CampaignName]
GO
ALTER TABLE [dbo].[doPromotion] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [CommittedDate]
GO
ALTER TABLE [dbo].[doPromotion] ADD  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[doPromotion] ADD  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[doPromotion] ADD  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[doPromotion] ADD  DEFAULT ((0)) FOR [PromotionLevel]
GO
ALTER TABLE [dbo].[doPromotion] ADD  DEFAULT ((0)) FOR [PromotionType]
GO
ALTER TABLE [dbo].[doPromotion] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [ProtectedDate]
GO
ALTER TABLE [dbo].[doPromotion] ADD  DEFAULT ('') FOR [Remarks]
GO
ALTER TABLE [dbo].[doPromotion] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [SaleEndDate]
GO
ALTER TABLE [dbo].[doPromotion] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [SaleStartDate]
GO
ALTER TABLE [dbo].[doPromotion] ADD  DEFAULT ((0)) FOR [Supplier]
GO
ALTER TABLE [dbo].[doPromotionEntry] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doPromotionEntry] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doPromotionEntry] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doPromotionEntry] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doPromotionEntry] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doPromotionEntry] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doPromotionEntry] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [IBHeaderGuid]
GO
ALTER TABLE [dbo].[doPromotionEntry] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [RapidObjectGuid]
GO
ALTER TABLE [dbo].[doPromotionEntry] ADD  DEFAULT ((0)) FOR [RapidSyncRequired]
GO
ALTER TABLE [dbo].[doPromotionEntry] ADD  DEFAULT ((0)) FOR [RecordStatus]
GO
ALTER TABLE [dbo].[doPromotionEntry] ADD  DEFAULT ((0.0)) FOR [BuyDownPrice]
GO
ALTER TABLE [dbo].[doPromotionEntry] ADD  DEFAULT ((0.0)) FOR [BuyDownQuantity]
GO
ALTER TABLE [dbo].[doPromotionEntry] ADD  DEFAULT ((0.0)) FOR [DealMinDOQ]
GO
ALTER TABLE [dbo].[doPromotionEntry] ADD  DEFAULT ((0.0)) FOR [DiscountPercent]
GO
ALTER TABLE [dbo].[doPromotionEntry] ADD  DEFAULT ((0)) FOR [ItemNotDiscountableBeforePromo]
GO
ALTER TABLE [dbo].[doPromotionEntry] ADD  DEFAULT ((0)) FOR [ItemNotDiscountableDuringPromo]
GO
ALTER TABLE [dbo].[doPromotionEntry] ADD  DEFAULT ((0)) FOR [Promotion]
GO
ALTER TABLE [dbo].[doPromotionEntry] ADD  DEFAULT ((0)) FOR [PromotionItem]
GO
ALTER TABLE [dbo].[doPromotionEntry] ADD  DEFAULT ((0)) FOR [QuantityDiscountScheme]
GO
ALTER TABLE [dbo].[doPromotionEntry] ADD  DEFAULT ((0.0)) FOR [SalePrice]
GO
ALTER TABLE [dbo].[doPromotionEntry] ADD  DEFAULT ((0)) FOR [SourceItem]
GO
ALTER TABLE [dbo].[doPromotionEntry] ADD  DEFAULT ((0.0)) FOR [SourcePrice]
GO
ALTER TABLE [dbo].[doPurchaseOrder] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doPurchaseOrder] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doPurchaseOrder] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doPurchaseOrder] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doPurchaseOrder] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doPurchaseOrder] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doPurchaseOrder] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [IBHeaderGuid]
GO
ALTER TABLE [dbo].[doPurchaseOrder] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [RapidObjectGuid]
GO
ALTER TABLE [dbo].[doPurchaseOrder] ADD  DEFAULT ((0)) FOR [RapidSyncRequired]
GO
ALTER TABLE [dbo].[doPurchaseOrder] ADD  DEFAULT ((0)) FOR [RecordStatus]
GO
ALTER TABLE [dbo].[doPurchaseOrder] ADD  DEFAULT ('') FOR [ApprovedBy]
GO
ALTER TABLE [dbo].[doPurchaseOrder] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [ApprovedDate]
GO
ALTER TABLE [dbo].[doPurchaseOrder] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [CancelledDate]
GO
ALTER TABLE [dbo].[doPurchaseOrder] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [CompletedDate]
GO
ALTER TABLE [dbo].[doPurchaseOrder] ADD  DEFAULT ((0.0)) FOR [CompletedValue]
GO
ALTER TABLE [dbo].[doPurchaseOrder] ADD  DEFAULT ('') FOR [CreatedBy]
GO
ALTER TABLE [dbo].[doPurchaseOrder] ADD  DEFAULT ((0)) FOR [Currency]
GO
ALTER TABLE [dbo].[doPurchaseOrder] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [DeliverAfter]
GO
ALTER TABLE [dbo].[doPurchaseOrder] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [DeliverBefore]
GO
ALTER TABLE [dbo].[doPurchaseOrder] ADD  DEFAULT ((0.0)) FOR [ExchangeRate]
GO
ALTER TABLE [dbo].[doPurchaseOrder] ADD  DEFAULT ((0)) FOR [GatewayId]
GO
ALTER TABLE [dbo].[doPurchaseOrder] ADD  DEFAULT ((0)) FOR [HasInvoice]
GO
ALTER TABLE [dbo].[doPurchaseOrder] ADD  DEFAULT ((0)) FOR [HasOOSInvoice]
GO
ALTER TABLE [dbo].[doPurchaseOrder] ADD  DEFAULT ((0)) FOR [IsAutoGenerated]
GO
ALTER TABLE [dbo].[doPurchaseOrder] ADD  DEFAULT ((0)) FOR [IsBootstrapped]
GO
ALTER TABLE [dbo].[doPurchaseOrder] ADD  DEFAULT ((0)) FOR [IsCancelled]
GO
ALTER TABLE [dbo].[doPurchaseOrder] ADD  DEFAULT ((0)) FOR [IsPlaced]
GO
ALTER TABLE [dbo].[doPurchaseOrder] ADD  DEFAULT ((0)) FOR [PharmXStatus]
GO
ALTER TABLE [dbo].[doPurchaseOrder] ADD  DEFAULT ((0)) FOR [PurchaseOrderEntryLastModified]
GO
ALTER TABLE [dbo].[doPurchaseOrder] ADD  DEFAULT ('') FOR [PurchaseOrderNumber]
GO
ALTER TABLE [dbo].[doPurchaseOrder] ADD  DEFAULT ((0)) FOR [PurchaseOrderSource]
GO
ALTER TABLE [dbo].[doPurchaseOrder] ADD  DEFAULT ((0)) FOR [PurchaseOrderStatus]
GO
ALTER TABLE [dbo].[doPurchaseOrder] ADD  DEFAULT ((0)) FOR [PurchaseOrderType]
GO
ALTER TABLE [dbo].[doPurchaseOrder] ADD  DEFAULT ((0)) FOR [PurchaseOrderUpdateLevel]
GO
ALTER TABLE [dbo].[doPurchaseOrder] ADD  DEFAULT ('') FOR [Remarks]
GO
ALTER TABLE [dbo].[doPurchaseOrder] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [RequiredDate]
GO
ALTER TABLE [dbo].[doPurchaseOrder] ADD  DEFAULT ('') FOR [ReturnApprovalNumber]
GO
ALTER TABLE [dbo].[doPurchaseOrder] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [SentDate]
GO
ALTER TABLE [dbo].[doPurchaseOrder] ADD  DEFAULT ('') FOR [ShipFrom]
GO
ALTER TABLE [dbo].[doPurchaseOrder] ADD  DEFAULT ('') FOR [ShipTo]
GO
ALTER TABLE [dbo].[doPurchaseOrder] ADD  DEFAULT ('') FOR [ShipVia]
GO
ALTER TABLE [dbo].[doPurchaseOrder] ADD  DEFAULT ((0)) FOR [Supplier]
GO
ALTER TABLE [dbo].[doPurchaseOrder] ADD  DEFAULT ('') FOR [SupplierResponse]
GO
ALTER TABLE [dbo].[doPurchaseOrder] ADD  DEFAULT ('') FOR [Terms]
GO
ALTER TABLE [dbo].[doPurchaseOrder] ADD  DEFAULT ('') FOR [Title]
GO
ALTER TABLE [dbo].[doPurchaseOrder] ADD  DEFAULT ((0)) FOR [TransferReason]
GO
ALTER TABLE [dbo].[doPurchaseOrder] ADD  DEFAULT ((0)) FOR [WorksheetID]
GO
ALTER TABLE [dbo].[doPurchaseOrderEntry] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doPurchaseOrderEntry] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doPurchaseOrderEntry] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doPurchaseOrderEntry] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doPurchaseOrderEntry] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doPurchaseOrderEntry] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doPurchaseOrderEntry] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [IBHeaderGuid]
GO
ALTER TABLE [dbo].[doPurchaseOrderEntry] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [RapidObjectGuid]
GO
ALTER TABLE [dbo].[doPurchaseOrderEntry] ADD  DEFAULT ((0)) FOR [RapidSyncRequired]
GO
ALTER TABLE [dbo].[doPurchaseOrderEntry] ADD  DEFAULT ((0)) FOR [RecordStatus]
GO
ALTER TABLE [dbo].[doPurchaseOrderEntry] ADD  DEFAULT ('') FOR [Comment]
GO
ALTER TABLE [dbo].[doPurchaseOrderEntry] ADD  DEFAULT ((0.0)) FOR [CurrentCost]
GO
ALTER TABLE [dbo].[doPurchaseOrderEntry] ADD  DEFAULT ('') FOR [DealCatalogueName]
GO
ALTER TABLE [dbo].[doPurchaseOrderEntry] ADD  DEFAULT ((0.0)) FOR [DealMinDOQ]
GO
ALTER TABLE [dbo].[doPurchaseOrderEntry] ADD  DEFAULT ((0.0)) FOR [ExtOrderCostTax]
GO
ALTER TABLE [dbo].[doPurchaseOrderEntry] ADD  DEFAULT ('') FOR [GatewayResponse]
GO
ALTER TABLE [dbo].[doPurchaseOrderEntry] ADD  DEFAULT ('') FOR [ItemDescription]
GO
ALTER TABLE [dbo].[doPurchaseOrderEntry] ADD  DEFAULT ((0)) FOR [ItemTax]
GO
ALTER TABLE [dbo].[doPurchaseOrderEntry] ADD  DEFAULT ((0.0)) FOR [OrderCost]
GO
ALTER TABLE [dbo].[doPurchaseOrderEntry] ADD  DEFAULT ((0.0)) FOR [OrderCostTax]
GO
ALTER TABLE [dbo].[doPurchaseOrderEntry] ADD  DEFAULT ((0)) FOR [OrderedItem]
GO
ALTER TABLE [dbo].[doPurchaseOrderEntry] ADD  DEFAULT ((0.0)) FOR [OriginalQuantityOrdered]
GO
ALTER TABLE [dbo].[doPurchaseOrderEntry] ADD  DEFAULT ((0)) FOR [PackQuantity]
GO
ALTER TABLE [dbo].[doPurchaseOrderEntry] ADD  DEFAULT ((0)) FOR [PurchaseOrder]
GO
ALTER TABLE [dbo].[doPurchaseOrderEntry] ADD  DEFAULT ((0.0)) FOR [QuantityOrdered]
GO
ALTER TABLE [dbo].[doPurchaseOrderEntry] ADD  DEFAULT ((0.0)) FOR [QuantityReceivedToDate]
GO
ALTER TABLE [dbo].[doPurchaseOrderEntry] ADD  DEFAULT ((0.0)) FOR [QuantityReturnForCreditToDate]
GO
ALTER TABLE [dbo].[doPurchaseOrderEntry] ADD  DEFAULT ((0)) FOR [ReasonCode]
GO
ALTER TABLE [dbo].[doPurchaseOrderEntry] ADD  DEFAULT ('') FOR [ReorderNumber]
GO
ALTER TABLE [dbo].[doPurchaseOrderEntry] ADD  DEFAULT ((0)) FOR [SentForPricing]
GO
ALTER TABLE [dbo].[doPurchaseOrderEntry] ADD  DEFAULT ((0)) FOR [ShowOnOrder]
GO
ALTER TABLE [dbo].[doQuantityDiscountScheme] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doQuantityDiscountScheme] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doQuantityDiscountScheme] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doQuantityDiscountScheme] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doQuantityDiscountScheme] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doQuantityDiscountScheme] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doQuantityDiscountScheme] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [IBHeaderGuid]
GO
ALTER TABLE [dbo].[doQuantityDiscountScheme] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [RapidObjectGuid]
GO
ALTER TABLE [dbo].[doQuantityDiscountScheme] ADD  DEFAULT ((0)) FOR [RapidSyncRequired]
GO
ALTER TABLE [dbo].[doQuantityDiscountScheme] ADD  DEFAULT ((0)) FOR [RecordStatus]
GO
ALTER TABLE [dbo].[doQuantityDiscountScheme] ADD  DEFAULT ((0)) FOR [Active]
GO
ALTER TABLE [dbo].[doQuantityDiscountScheme] ADD  DEFAULT ('') FOR [Code]
GO
ALTER TABLE [dbo].[doQuantityDiscountScheme] ADD  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[doQuantityDiscountScheme] ADD  DEFAULT ((0)) FOR [DiscountOddItems]
GO
ALTER TABLE [dbo].[doQuantityDiscountScheme] ADD  DEFAULT ((0)) FOR [DiscountSchemeType]
GO
ALTER TABLE [dbo].[doQuantityDiscountScheme] ADD  DEFAULT ((0)) FOR [ExtendedPriceDiscount]
GO
ALTER TABLE [dbo].[doQuantityDiscountScheme] ADD  DEFAULT ((0.0)) FOR [PercentOffPrice1]
GO
ALTER TABLE [dbo].[doQuantityDiscountScheme] ADD  DEFAULT ((0.0)) FOR [PercentOffPrice1A]
GO
ALTER TABLE [dbo].[doQuantityDiscountScheme] ADD  DEFAULT ((0.0)) FOR [PercentOffPrice1B]
GO
ALTER TABLE [dbo].[doQuantityDiscountScheme] ADD  DEFAULT ((0.0)) FOR [PercentOffPrice1C]
GO
ALTER TABLE [dbo].[doQuantityDiscountScheme] ADD  DEFAULT ((0.0)) FOR [PercentOffPrice2]
GO
ALTER TABLE [dbo].[doQuantityDiscountScheme] ADD  DEFAULT ((0.0)) FOR [PercentOffPrice2A]
GO
ALTER TABLE [dbo].[doQuantityDiscountScheme] ADD  DEFAULT ((0.0)) FOR [PercentOffPrice2B]
GO
ALTER TABLE [dbo].[doQuantityDiscountScheme] ADD  DEFAULT ((0.0)) FOR [PercentOffPrice2C]
GO
ALTER TABLE [dbo].[doQuantityDiscountScheme] ADD  DEFAULT ((0.0)) FOR [PercentOffPrice3]
GO
ALTER TABLE [dbo].[doQuantityDiscountScheme] ADD  DEFAULT ((0.0)) FOR [PercentOffPrice3A]
GO
ALTER TABLE [dbo].[doQuantityDiscountScheme] ADD  DEFAULT ((0.0)) FOR [PercentOffPrice3B]
GO
ALTER TABLE [dbo].[doQuantityDiscountScheme] ADD  DEFAULT ((0.0)) FOR [PercentOffPrice3C]
GO
ALTER TABLE [dbo].[doQuantityDiscountScheme] ADD  DEFAULT ((0.0)) FOR [PercentOffPrice4]
GO
ALTER TABLE [dbo].[doQuantityDiscountScheme] ADD  DEFAULT ((0.0)) FOR [PercentOffPrice4A]
GO
ALTER TABLE [dbo].[doQuantityDiscountScheme] ADD  DEFAULT ((0.0)) FOR [PercentOffPrice4B]
GO
ALTER TABLE [dbo].[doQuantityDiscountScheme] ADD  DEFAULT ((0.0)) FOR [PercentOffPrice4C]
GO
ALTER TABLE [dbo].[doQuantityDiscountScheme] ADD  DEFAULT ((0.0)) FOR [Price1]
GO
ALTER TABLE [dbo].[doQuantityDiscountScheme] ADD  DEFAULT ((0.0)) FOR [Price1A]
GO
ALTER TABLE [dbo].[doQuantityDiscountScheme] ADD  DEFAULT ((0.0)) FOR [Price1B]
GO
ALTER TABLE [dbo].[doQuantityDiscountScheme] ADD  DEFAULT ((0.0)) FOR [Price1C]
GO
ALTER TABLE [dbo].[doQuantityDiscountScheme] ADD  DEFAULT ((0.0)) FOR [Price2]
GO
ALTER TABLE [dbo].[doQuantityDiscountScheme] ADD  DEFAULT ((0.0)) FOR [Price2A]
GO
ALTER TABLE [dbo].[doQuantityDiscountScheme] ADD  DEFAULT ((0.0)) FOR [Price2B]
GO
ALTER TABLE [dbo].[doQuantityDiscountScheme] ADD  DEFAULT ((0.0)) FOR [Price2C]
GO
ALTER TABLE [dbo].[doQuantityDiscountScheme] ADD  DEFAULT ((0.0)) FOR [Price3]
GO
ALTER TABLE [dbo].[doQuantityDiscountScheme] ADD  DEFAULT ((0.0)) FOR [Price3A]
GO
ALTER TABLE [dbo].[doQuantityDiscountScheme] ADD  DEFAULT ((0.0)) FOR [Price3B]
GO
ALTER TABLE [dbo].[doQuantityDiscountScheme] ADD  DEFAULT ((0.0)) FOR [Price3C]
GO
ALTER TABLE [dbo].[doQuantityDiscountScheme] ADD  DEFAULT ((0.0)) FOR [Price4]
GO
ALTER TABLE [dbo].[doQuantityDiscountScheme] ADD  DEFAULT ((0.0)) FOR [Price4A]
GO
ALTER TABLE [dbo].[doQuantityDiscountScheme] ADD  DEFAULT ((0.0)) FOR [Price4B]
GO
ALTER TABLE [dbo].[doQuantityDiscountScheme] ADD  DEFAULT ((0.0)) FOR [Price4C]
GO
ALTER TABLE [dbo].[doQuantityDiscountScheme] ADD  DEFAULT ((0.0)) FOR [Quantity1]
GO
ALTER TABLE [dbo].[doQuantityDiscountScheme] ADD  DEFAULT ((0.0)) FOR [Quantity2]
GO
ALTER TABLE [dbo].[doQuantityDiscountScheme] ADD  DEFAULT ((0.0)) FOR [Quantity3]
GO
ALTER TABLE [dbo].[doQuantityDiscountScheme] ADD  DEFAULT ((0.0)) FOR [Quantity4]
GO
ALTER TABLE [dbo].[doRapid] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doRapid] ADD  DEFAULT ((0)) FOR [EnableInbound]
GO
ALTER TABLE [dbo].[doRapid] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [EnterpriseGuid]
GO
ALTER TABLE [dbo].[doRapid] ADD  DEFAULT ((0)) FOR [InBoundPollFrequency]
GO
ALTER TABLE [dbo].[doRapid] ADD  DEFAULT (CONVERT([varbinary](max),'',0)) FOR [InBoundWorksheetConfiguration]
GO
ALTER TABLE [dbo].[doRapid] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [LastInboundProcessDateTime]
GO
ALTER TABLE [dbo].[doRapid] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [LastOutboundProcessDateTime]
GO
ALTER TABLE [dbo].[doRapid] ADD  DEFAULT ((0)) FOR [OperationalState]
GO
ALTER TABLE [dbo].[doRapid] ADD  DEFAULT ((0)) FOR [OutBoundPollFrequency]
GO
ALTER TABLE [dbo].[doRapid] ADD  DEFAULT ((0)) FOR [OutBoundRowsPerCycle]
GO
ALTER TABLE [dbo].[doRapid] ADD  DEFAULT ('') FOR [ProgressText]
GO
ALTER TABLE [dbo].[doRapid] ADD  DEFAULT ('') FOR [RapidServerURL]
GO
ALTER TABLE [dbo].[doRapid] ADD  DEFAULT ('') FOR [StoreCode]
GO
ALTER TABLE [dbo].[doRapid] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [StoreGuid]
GO
ALTER TABLE [dbo].[doRapidAuditAggregateDataObject] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doRapidAuditAggregateDataObject] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doRapidAuditAggregateDataObject] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doRapidAuditAggregateDataObject] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doRapidAuditAggregateDataObject] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doRapidAuditAggregateDataObject] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doRapidAuditAggregateDataObject] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [IBHeaderGuid]
GO
ALTER TABLE [dbo].[doRapidAuditAggregateDataObject] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [RapidObjectGuid]
GO
ALTER TABLE [dbo].[doRapidAuditAggregateDataObject] ADD  DEFAULT ((0)) FOR [RapidSyncRequired]
GO
ALTER TABLE [dbo].[doRapidAuditAggregateDataObject] ADD  DEFAULT ((0)) FOR [RecordStatus]
GO
ALTER TABLE [dbo].[doRapidRecordStatus] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doRapidRecordStatus] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doRapidRecordStatus] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doRapidRecordStatus] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doRapidRecordStatus] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doRapidRecordStatus] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doRapidRecordStatus] ADD  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[doRapid-Worksheets] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doRapid-Worksheets] ADD  DEFAULT ((0)) FOR [Owner]
GO
ALTER TABLE [dbo].[doRapid-Worksheets] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doRapid-Worksheets] ADD  DEFAULT ('') FOR [CreatedBy]
GO
ALTER TABLE [dbo].[doRapid-Worksheets] ADD  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[doRapid-Worksheets] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [EffectiveDate]
GO
ALTER TABLE [dbo].[doRapid-Worksheets] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doRapid-Worksheets] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doRapid-Worksheets] ADD  DEFAULT ('') FOR [ProcessDuration]
GO
ALTER TABLE [dbo].[doRapid-Worksheets] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Processed]
GO
ALTER TABLE [dbo].[doRapid-Worksheets] ADD  DEFAULT ((0)) FOR [RecordCount]
GO
ALTER TABLE [dbo].[doRapid-Worksheets] ADD  DEFAULT (CONVERT([varbinary](max),'',0)) FOR [RecordsTable]
GO
ALTER TABLE [dbo].[doRapid-Worksheets] ADD  DEFAULT ('') FOR [Remarks]
GO
ALTER TABLE [dbo].[doRapid-Worksheets] ADD  DEFAULT ((0)) FOR [RowTotal]
GO
ALTER TABLE [dbo].[doRapid-Worksheets] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[doRapid-Worksheets] ADD  DEFAULT ('') FOR [TypeName]
GO
ALTER TABLE [dbo].[doRapid-Worksheets] ADD  DEFAULT ((0)) FOR [WorksheetType]
GO
ALTER TABLE [dbo].[doRateOfUsageDateDefinition] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doRateOfUsageDateDefinition] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doRateOfUsageDateDefinition] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doRateOfUsageDateDefinition] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doRateOfUsageDateDefinition] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doRateOfUsageDateDefinition] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doRateOfUsageDateDefinition] ADD  DEFAULT ((0)) FOR [DayOffset]
GO
ALTER TABLE [dbo].[doRateOfUsageDateDefinition] ADD  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[doRateOfUsageDateDefinition] ADD  DEFAULT ((0)) FOR [RangeSpan]
GO
ALTER TABLE [dbo].[doRateOfUsageDateDefinition] ADD  DEFAULT ((0)) FOR [RateOfUsageScheme]
GO
ALTER TABLE [dbo].[doRateOfUsageDateDefinition] ADD  DEFAULT ((0.0)) FOR [Weight]
GO
ALTER TABLE [dbo].[doRateOfUsageScheme] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doRateOfUsageScheme] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doRateOfUsageScheme] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doRateOfUsageScheme] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doRateOfUsageScheme] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doRateOfUsageScheme] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doRateOfUsageScheme] ADD  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[doRateOfUsageScheme] ADD  DEFAULT ((0)) FOR [IncludeTransfersInCalc]
GO
ALTER TABLE [dbo].[doRateOfUsageScheme] ADD  DEFAULT ((0)) FOR [IsDefaultScheme]
GO
ALTER TABLE [dbo].[doRateOfUsageScheme] ADD  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[doRateOfUsageScheme] ADD  DEFAULT ((0)) FOR [ROUSchemeType]
GO
ALTER TABLE [dbo].[doRateOfUsageScheme] ADD  DEFAULT ((0)) FOR [ReOrderPointDays]
GO
ALTER TABLE [dbo].[doRateOfUsageScheme] ADD  DEFAULT ((0)) FOR [ReStockLevelDays]
GO
ALTER TABLE [dbo].[doReasonCode] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doReasonCode] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doReasonCode] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doReasonCode] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doReasonCode] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doReasonCode] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doReasonCode] ADD  DEFAULT ('') FOR [Code]
GO
ALTER TABLE [dbo].[doReasonCode] ADD  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[doReasonCode] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [EndDate]
GO
ALTER TABLE [dbo].[doReasonCode] ADD  DEFAULT ((0)) FOR [InActive]
GO
ALTER TABLE [dbo].[doReasonCode] ADD  DEFAULT ((0)) FOR [ReasonCodeType]
GO
ALTER TABLE [dbo].[doReasonCode] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [StartDate]
GO
ALTER TABLE [dbo].[doRegister] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doRegister] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doRegister] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doRegister] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doRegister] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doRegister] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doRegister] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [IBHeaderGuid]
GO
ALTER TABLE [dbo].[doRegister] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [RapidObjectGuid]
GO
ALTER TABLE [dbo].[doRegister] ADD  DEFAULT ((0)) FOR [RapidSyncRequired]
GO
ALTER TABLE [dbo].[doRegister] ADD  DEFAULT ((0)) FOR [RecordStatus]
GO
ALTER TABLE [dbo].[doRegister] ADD  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[doRegister] ADD  DEFAULT ((0)) FOR [RegisterNumber]
GO
ALTER TABLE [dbo].[doRelationship] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doRelationship] ADD  DEFAULT ((0)) FOR [ActivatingRelationship]
GO
ALTER TABLE [dbo].[doRelationship] ADD  DEFAULT ((0)) FOR [ActivityLastCycle]
GO
ALTER TABLE [dbo].[doRelationship] ADD  DEFAULT ('') FOR [ConnectorType]
GO
ALTER TABLE [dbo].[doRelationship] ADD  DEFAULT ((0)) FOR [Count]
GO
ALTER TABLE [dbo].[doRelationship] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doRelationship] ADD  DEFAULT ('') FOR [LastError]
GO
ALTER TABLE [dbo].[doRelationship] ADD  DEFAULT ((0)) FOR [MaxRecordsPerIteration]
GO
ALTER TABLE [dbo].[doRelationship] ADD  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[doRelationship] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [NextExecute]
GO
ALTER TABLE [dbo].[doRelationship] ADD  DEFAULT ((0)) FOR [Operation]
GO
ALTER TABLE [dbo].[doRelationship] ADD  DEFAULT ((0)) FOR [Paused]
GO
ALTER TABLE [dbo].[doRelationship] ADD  DEFAULT ((0)) FOR [Processed]
GO
ALTER TABLE [dbo].[doRelationship] ADD  DEFAULT (CONVERT([varbinary](max),'',0)) FOR [Properties]
GO
ALTER TABLE [dbo].[doRelationship] ADD  DEFAULT ((0)) FOR [Receive]
GO
ALTER TABLE [dbo].[doRelationship] ADD  DEFAULT ((0)) FOR [RelationshipState]
GO
ALTER TABLE [dbo].[doRelationship] ADD  DEFAULT ((0)) FOR [Send]
GO
ALTER TABLE [dbo].[doRelationship-Actions] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doRelationship-Actions] ADD  DEFAULT ((0)) FOR [Owner]
GO
ALTER TABLE [dbo].[doRelationship-Actions] ADD  DEFAULT (CONVERT([varbinary](max),'',0)) FOR [BusinessAction]
GO
ALTER TABLE [dbo].[doRelationship-Actions] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doRelationship-Actions] ADD  DEFAULT ('') FOR [EntityName]
GO
ALTER TABLE [dbo].[doRelationship-AggregateKeys] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doRelationship-AggregateKeys] ADD  DEFAULT ((0)) FOR [Owner]
GO
ALTER TABLE [dbo].[doRelationship-AggregateKeys] ADD  DEFAULT ((0)) FOR [AggregateObject]
GO
ALTER TABLE [dbo].[doRelationship-AggregateKeys] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [AggregateObjectGuid]
GO
ALTER TABLE [dbo].[doRelationship-AggregateKeys] ADD  DEFAULT ('') FOR [Entity]
GO
ALTER TABLE [dbo].[doRelationship-AggregateKeys] ADD  DEFAULT ('') FOR [ForeignKey]
GO
ALTER TABLE [dbo].[doRelationship-AggregateKeys] ADD  DEFAULT ('') FOR [ParentKey]
GO
ALTER TABLE [dbo].[doRelationship-AggregateKeys] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Relation]
GO
ALTER TABLE [dbo].[doRelationship-Conflicts] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doRelationship-Conflicts] ADD  DEFAULT ((0)) FOR [Owner]
GO
ALTER TABLE [dbo].[doRelationship-Conflicts] ADD  DEFAULT ('') FOR [AggregateField]
GO
ALTER TABLE [dbo].[doRelationship-Conflicts] ADD  DEFAULT ((0)) FOR [AggregateObject]
GO
ALTER TABLE [dbo].[doRelationship-Conflicts] ADD  DEFAULT ('') FOR [AggregateObjectType]
GO
ALTER TABLE [dbo].[doRelationship-Conflicts] ADD  DEFAULT ((0)) FOR [ConflictPending]
GO
ALTER TABLE [dbo].[doRelationship-Conflicts] ADD  DEFAULT ((0)) FOR [ConflictType]
GO
ALTER TABLE [dbo].[doRelationship-Conflicts] ADD  DEFAULT ('') FOR [EntityKey]
GO
ALTER TABLE [dbo].[doRelationship-Conflicts] ADD  DEFAULT ((0)) FOR [IgnoreConflict]
GO
ALTER TABLE [dbo].[doRelationship-Conflicts] ADD  DEFAULT ('') FOR [Message]
GO
ALTER TABLE [dbo].[doRelationship-Conflicts] ADD  DEFAULT ((0)) FOR [RelatedObject]
GO
ALTER TABLE [dbo].[doRelationship-Conflicts] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Relation]
GO
ALTER TABLE [dbo].[doRelationship-Conflicts] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [TimeConflicted]
GO
ALTER TABLE [dbo].[doReport] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doReport] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doReport] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doReport] ADD  DEFAULT ((0)) FOR [Author]
GO
ALTER TABLE [dbo].[doReport] ADD  DEFAULT ('') FOR [ColumnListXml]
GO
ALTER TABLE [dbo].[doReport] ADD  DEFAULT ('') FOR [CommonUses]
GO
ALTER TABLE [dbo].[doReport] ADD  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[doReport] ADD  DEFAULT ('') FOR [Group]
GO
ALTER TABLE [dbo].[doReport] ADD  DEFAULT ((0)) FOR [IsAdvanced]
GO
ALTER TABLE [dbo].[doReport] ADD  DEFAULT ((0)) FOR [IsSystemReport]
GO
ALTER TABLE [dbo].[doReport] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [LastRunDate]
GO
ALTER TABLE [dbo].[doReport] ADD  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[doReport] ADD  DEFAULT ((0)) FOR [ScheduledEnabled]
GO
ALTER TABLE [dbo].[doReport] ADD  DEFAULT ('') FOR [ScheduledFormat]
GO
ALTER TABLE [dbo].[doReport] ADD  DEFAULT ('') FOR [ScheduledFrom]
GO
ALTER TABLE [dbo].[doReport] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [ScheduledLastRun]
GO
ALTER TABLE [dbo].[doReport] ADD  DEFAULT ('') FOR [ScheduledMessage]
GO
ALTER TABLE [dbo].[doReport] ADD  DEFAULT ('') FOR [ScheduledRecurrencePattern]
GO
ALTER TABLE [dbo].[doReport] ADD  DEFAULT ('') FOR [ScheduledSubject]
GO
ALTER TABLE [dbo].[doReport] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [ScheduledTime]
GO
ALTER TABLE [dbo].[doReport] ADD  DEFAULT ('') FOR [ScheduledTo]
GO
ALTER TABLE [dbo].[doReport] ADD  DEFAULT ((0)) FOR [SendCollapsedGroups]
GO
ALTER TABLE [dbo].[doReport] ADD  DEFAULT ('') FOR [SharedRoleList]
GO
ALTER TABLE [dbo].[doReport] ADD  DEFAULT ('') FOR [SharedUserList]
GO
ALTER TABLE [dbo].[doReport] ADD  DEFAULT ('') FOR [Xml]
GO
ALTER TABLE [dbo].[doReturnToSupplier] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doReturnToSupplier] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doReturnToSupplier] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doReturnToSupplier] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doReturnToSupplier] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doReturnToSupplier] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doReturnToSupplier] ADD  DEFAULT ('') FOR [AuthorizationNumber]
GO
ALTER TABLE [dbo].[doReturnToSupplier] ADD  DEFAULT ('') FOR [RTVNumber]
GO
ALTER TABLE [dbo].[doReturnToSupplier] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [ReturnedDate]
GO
ALTER TABLE [dbo].[doReturnToSupplier] ADD  DEFAULT ((0)) FOR [Supplier]
GO
ALTER TABLE [dbo].[doReturnToSupplierEntry] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doReturnToSupplierEntry] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doReturnToSupplierEntry] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doReturnToSupplierEntry] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doReturnToSupplierEntry] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doReturnToSupplierEntry] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doReturnToSupplierEntry] ADD  DEFAULT ('') FOR [AuthorizationNumber]
GO
ALTER TABLE [dbo].[doReturnToSupplierEntry] ADD  DEFAULT ((0.0)) FOR [Cost]
GO
ALTER TABLE [dbo].[doReturnToSupplierEntry] ADD  DEFAULT ((0)) FOR [ItemReturned]
GO
ALTER TABLE [dbo].[doReturnToSupplierEntry] ADD  DEFAULT ((0.0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[doReturnToSupplierEntry] ADD  DEFAULT ((0)) FOR [ReturnToSupplier]
GO
ALTER TABLE [dbo].[doRole] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doSatScanDeviceOptionGral] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doSatScanDeviceOptionGral] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doSatScanDeviceOptionGral] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doSatScanDeviceOptionGral] ADD  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[doSatScanDeviceOptionGral] ADD  DEFAULT ((0)) FOR [DevID]
GO
ALTER TABLE [dbo].[doSatScanDeviceOptionGral] ADD  DEFAULT ((0)) FOR [Enabled]
GO
ALTER TABLE [dbo].[doSatScanDeviceOptionGral] ADD  DEFAULT ((0)) FOR [Executed]
GO
ALTER TABLE [dbo].[doSatScanDeviceOptionGral] ADD  DEFAULT ((0)) FOR [SatID]
GO
ALTER TABLE [dbo].[doSatScanDeviceOptionGral] ADD  DEFAULT ('') FOR [SettingAlias]
GO
ALTER TABLE [dbo].[doSatScanDeviceOptionGral] ADD  DEFAULT ('') FOR [TagAlias]
GO
ALTER TABLE [dbo].[doSatScanDeviceOptionStockTake] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doSatScanDeviceOptionStockTake] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doSatScanDeviceOptionStockTake] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doSatScanDeviceOptionStockTake] ADD  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[doSatScanDeviceOptionStockTake] ADD  DEFAULT ((0)) FOR [DevID]
GO
ALTER TABLE [dbo].[doSatScanDeviceOptionStockTake] ADD  DEFAULT ((0)) FOR [SatID]
GO
ALTER TABLE [dbo].[doSatScanDeviceOptionStockTake] ADD  DEFAULT (CONVERT([varbinary](max),'',0)) FOR [Value]
GO
ALTER TABLE [dbo].[doSatScanGunLog] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doSatScanGunLog] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doSatScanGunLog] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doSatScanGunLog] ADD  DEFAULT ((0)) FOR [Action]
GO
ALTER TABLE [dbo].[doSatScanGunLog] ADD  DEFAULT ('') FOR [ActionDescription]
GO
ALTER TABLE [dbo].[doSatScanGunLog] ADD  DEFAULT ((0)) FOR [GunID]
GO
ALTER TABLE [dbo].[doSatScanGunLog] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [LogDateRequest]
GO
ALTER TABLE [dbo].[doSatScanGunLog] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [LogDateResponse]
GO
ALTER TABLE [dbo].[doSatScanGunLog] ADD  DEFAULT ('') FOR [Request]
GO
ALTER TABLE [dbo].[doSatScanGunLog] ADD  DEFAULT ('') FOR [Response]
GO
ALTER TABLE [dbo].[doSatScanGunLog] ADD  DEFAULT ((0)) FOR [UserLoggedIn]
GO
ALTER TABLE [dbo].[doSatScanSettingsGlobal] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doSatScanSettingsGlobal] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doSatScanSettingsGlobal] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doSatScanSettingsGlobal] ADD  DEFAULT ((0)) FOR [LoginRequired]
GO
ALTER TABLE [dbo].[doSatScanSettingsGlobal] ADD  DEFAULT ((0)) FOR [LoginTimeout]
GO
ALTER TABLE [dbo].[doSatScanSettingsLocal] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doSatScanSettingsLocal] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doSatScanSettingsLocal] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doSatScanSettingsLocal] ADD  DEFAULT ('') FOR [BaudRate]
GO
ALTER TABLE [dbo].[doSatScanSettingsLocal] ADD  DEFAULT ('') FOR [Comport]
GO
ALTER TABLE [dbo].[doSatScanSettingsLocal] ADD  DEFAULT ('') FOR [MachineName]
GO
ALTER TABLE [dbo].[doSatScanSettingsLocal] ADD  DEFAULT ('') FOR [SatelliteID]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ((4)) FOR [ActivityAction]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ((0)) FOR [AuthorityNumber]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ((0)) FOR [ChargeAccount]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ((0.0)) FOR [ChargeAmount]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ('') FOR [ChargeType]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ((0)) FOR [DDRepeatInterval]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ((0)) FOR [Deferred]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [DispenseDate]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ((0)) FOR [DispenseNumber]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ((0)) FOR [Doctor]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ('') FOR [DoctorCode]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ('') FOR [DoctorName]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ((0)) FOR [DoctorPrescriberNumber]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ((0)) FOR [Drug]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ('') FOR [DrugAlternateDescription]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ('') FOR [DrugCode]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ('') FOR [DrugDescription]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ('') FOR [DrugDispenseType]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ((0)) FOR [DrugInteractionGroup]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ((0)) FOR [DrugItem]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ('') FOR [FreeIndex1]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ('') FOR [FreeIndex2]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ('') FOR [FreeIndex3]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ('') FOR [FreeIndex4]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ('') FOR [GenericCode]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ((0)) FOR [GlassBottle]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ((0.0)) FOR [GovernmentRecoveryAmount]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ((0)) FOR [GstIncluded]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ((0.0)) FOR [HBFRecoveryAmount]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ('') FOR [HospitalProviderNumber]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ((0)) FOR [Ignore]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ((0)) FOR [ImmediateSupply]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ((0)) FOR [IsAuthority]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ((0)) FOR [IsNarcotic]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ((0)) FOR [IsOutsideRepeat]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ('') FOR [LargeLabelSigs]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ('') FOR [LargeLabelType]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ('') FOR [ManufacturerCode]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ((0)) FOR [MaximumDispensings]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ('') FOR [NationalHealthSchemeCode]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ((0)) FOR [NursingHome]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ('') FOR [NursingHomeCode]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ('') FOR [OriginalScriptNumber]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ('') FOR [OriginalSupplyingPharmacy]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ((0)) FOR [POSTransferQuantity]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ((0.0)) FOR [Packs]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ((0)) FOR [Patient]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ('') FOR [PatientInstructions]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ('') FOR [PatientNumber]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ((0.0)) FOR [PatientPrice]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ((0)) FOR [PerformStockMovement]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ((0)) FOR [Pharmacist]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ('') FOR [PharmacistsInitials]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [PrescriptionDate]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ('') FOR [RepeatFastCode]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ((0)) FOR [RepeatScriptNumber]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ((0.0)) FOR [SafetyNetAmount]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ((0.0)) FOR [SaleCost]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ('') FOR [ScriptClassification]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ((0)) FOR [ScriptNumber]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT (NULL) FOR [ScriptProcessLogic]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ('') FOR [ScriptStatus]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ('') FOR [ScriptType]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ('') FOR [WADDVerified]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ((0)) FOR [Ward]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ('') FOR [WardNumber]
GO
ALTER TABLE [dbo].[doScript] ADD  DEFAULT ((0.0)) FOR [WholesaleCost]
GO
ALTER TABLE [dbo].[doScriptConditionOption] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doScriptConditionOption] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doScriptConditionOption] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doScriptConditionOption] ADD  DEFAULT ((0)) FOR [ConditionValueType]
GO
ALTER TABLE [dbo].[doScriptConditionOption] ADD  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[doScriptProcess] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doScriptProcess] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doScriptProcess] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doScriptProcess] ADD  DEFAULT ((4)) FOR [ActivityAction]
GO
ALTER TABLE [dbo].[doScriptProcess] ADD  DEFAULT ((0)) FOR [PerformStockMovement]
GO
ALTER TABLE [dbo].[doScriptProcess] ADD  DEFAULT ((0)) FOR [ProcessOrder]
GO
ALTER TABLE [dbo].[doScriptProcess] ADD  DEFAULT ((0)) FOR [ScriptRule]
GO
ALTER TABLE [dbo].[doScriptRule] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doScriptRule] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doScriptRule] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doScriptRule] ADD  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[doScriptRuleEntry] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doScriptRuleEntry] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doScriptRuleEntry] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doScriptRuleEntry] ADD  DEFAULT (CONVERT([varbinary](max),'',0)) FOR [ConditionValue]
GO
ALTER TABLE [dbo].[doScriptRuleEntry] ADD  DEFAULT ((0)) FOR [ConditionValueType]
GO
ALTER TABLE [dbo].[doScriptRuleEntry] ADD  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[doScriptRuleEntry] ADD  DEFAULT ((0)) FOR [ScriptRule]
GO
ALTER TABLE [dbo].[doSecurityRoot] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doSerial] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doSerial] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doSerial] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doSerial] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doSerial] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doSerial] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doSerial] ADD  DEFAULT ((0)) FOR [Item]
GO
ALTER TABLE [dbo].[doSerial] ADD  DEFAULT ('') FOR [SerialNumber1]
GO
ALTER TABLE [dbo].[doSerial] ADD  DEFAULT ('') FOR [SerialNumber2]
GO
ALTER TABLE [dbo].[doSerial] ADD  DEFAULT ('') FOR [SerialNumber3]
GO
ALTER TABLE [dbo].[doSerial] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[doStatement] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doStatement] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doStatement] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doStatement] ADD  DEFAULT ((0)) FOR [Account]
GO
ALTER TABLE [dbo].[doStatement] ADD  DEFAULT ((0.0)) FOR [Adjustments]
GO
ALTER TABLE [dbo].[doStatement] ADD  DEFAULT ((0.0)) FOR [Charges]
GO
ALTER TABLE [dbo].[doStatement] ADD  DEFAULT ((0)) FOR [Closed]
GO
ALTER TABLE [dbo].[doStatement] ADD  DEFAULT ((0.0)) FOR [ClosingBalance]
GO
ALTER TABLE [dbo].[doStatement] ADD  DEFAULT ((0.0)) FOR [Days30]
GO
ALTER TABLE [dbo].[doStatement] ADD  DEFAULT ((0.0)) FOR [Days60]
GO
ALTER TABLE [dbo].[doStatement] ADD  DEFAULT ((0.0)) FOR [Days90]
GO
ALTER TABLE [dbo].[doStatement] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [EndDate]
GO
ALTER TABLE [dbo].[doStatement] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [GeneratedDate]
GO
ALTER TABLE [dbo].[doStatement] ADD  DEFAULT ((0.0)) FOR [OpeningBalance]
GO
ALTER TABLE [dbo].[doStatement] ADD  DEFAULT ((0.0)) FOR [Payments]
GO
ALTER TABLE [dbo].[doStatement] ADD  DEFAULT ((0.0)) FOR [Sales]
GO
ALTER TABLE [dbo].[doStatement] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [StartDate]
GO
ALTER TABLE [dbo].[doStatement] ADD  DEFAULT ((0)) FOR [StatementBatch]
GO
ALTER TABLE [dbo].[doStatement] ADD  DEFAULT ((0)) FOR [StatementNumber]
GO
ALTER TABLE [dbo].[doStatement] ADD  DEFAULT (NULL) FOR [StatementXml]
GO
ALTER TABLE [dbo].[doStatement] ADD  DEFAULT ((0.0)) FOR [Tax]
GO
ALTER TABLE [dbo].[doStatement] ADD  DEFAULT ((0.0)) FOR [Transfers]
GO
ALTER TABLE [dbo].[doStatementBatch] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doStatementBatch] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doStatementBatch] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doStatementBatch] ADD  DEFAULT ('') FOR [BatchName]
GO
ALTER TABLE [dbo].[doStatementBatch] ADD  DEFAULT ((0)) FOR [BatchNumber]
GO
ALTER TABLE [dbo].[doStatementBatch] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [EndDate]
GO
ALTER TABLE [dbo].[doStatementBatch] ADD  DEFAULT ((0)) FOR [GeneratedCount]
GO
ALTER TABLE [dbo].[doStatementBatch] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [RunDate]
GO
ALTER TABLE [dbo].[doStatementBatch] ADD  DEFAULT ((0)) FOR [StatementCount]
GO
ALTER TABLE [dbo].[doStatementBatch] ADD  DEFAULT ((0)) FOR [StatementSchedule]
GO
ALTER TABLE [dbo].[doStatementBatch] ADD  DEFAULT ((0.0)) FOR [TotalAmount]
GO
ALTER TABLE [dbo].[doStatement-EmailQueue] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doStatement-EmailQueue] ADD  DEFAULT ((0)) FOR [Owner]
GO
ALTER TABLE [dbo].[doStatement-EmailQueue] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [EffectiveDate]
GO
ALTER TABLE [dbo].[doStatement-EmailQueue] ADD  DEFAULT ('') FOR [EmailError]
GO
ALTER TABLE [dbo].[doStatement-EmailQueue] ADD  DEFAULT ((0)) FOR [EmailStatus]
GO
ALTER TABLE [dbo].[doStatement-EmailQueue] ADD  DEFAULT ((0)) FOR [EmailTemplate]
GO
ALTER TABLE [dbo].[doStatement-EmailQueue] ADD  DEFAULT ('') FOR [EmailTo]
GO
ALTER TABLE [dbo].[doStatementSchedule] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doStatementSchedule] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doStatementSchedule] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doStatementSchedule] ADD  DEFAULT ((0)) FOR [AccountFormat]
GO
ALTER TABLE [dbo].[doStatementSchedule] ADD  DEFAULT ((0)) FOR [AccountFormatRestricted]
GO
ALTER TABLE [dbo].[doStatementSchedule] ADD  DEFAULT ((0)) FOR [AccountGroup]
GO
ALTER TABLE [dbo].[doStatementSchedule] ADD  DEFAULT ((0)) FOR [AccountGroupRestricted]
GO
ALTER TABLE [dbo].[doStatementSchedule] ADD  DEFAULT ((0)) FOR [AccountType]
GO
ALTER TABLE [dbo].[doStatementSchedule] ADD  DEFAULT ((0)) FOR [ClosePolicy]
GO
ALTER TABLE [dbo].[doStatementSchedule] ADD  DEFAULT ((0)) FOR [Enabled]
GO
ALTER TABLE [dbo].[doStatementSchedule] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [LastRun]
GO
ALTER TABLE [dbo].[doStatementSchedule] ADD  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[doStatementSchedule] ADD  DEFAULT ((0)) FOR [NursingHome]
GO
ALTER TABLE [dbo].[doStatementSchedule] ADD  DEFAULT ((0)) FOR [NursingHomeRestricted]
GO
ALTER TABLE [dbo].[doStatementSchedule] ADD  DEFAULT ((0)) FOR [RunPolicy]
GO
ALTER TABLE [dbo].[doStatementSchedule] ADD  DEFAULT ((0)) FOR [StatementSendOption]
GO
ALTER TABLE [dbo].[doStdUser] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doStdUser] ADD  DEFAULT ('') FOR [Password]
GO
ALTER TABLE [dbo].[doStocktake] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doStocktake] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doStocktake] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doStocktake] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [CommittedDate]
GO
ALTER TABLE [dbo].[doStocktake] ADD  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[doStocktake] ADD  DEFAULT ('') FOR [ImportedDataTable]
GO
ALTER TABLE [dbo].[doStocktake] ADD  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[doStocktake] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [ProtectedDate]
GO
ALTER TABLE [dbo].[doStocktake] ADD  DEFAULT ((0)) FOR [SatScanCode]
GO
ALTER TABLE [dbo].[doStocktake] ADD  DEFAULT ((0)) FOR [StocktakeType]
GO
ALTER TABLE [dbo].[doStocktakeEntry] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doStocktakeEntry] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doStocktakeEntry] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doStocktakeEntry] ADD  DEFAULT ((0)) FOR [ChangeCount]
GO
ALTER TABLE [dbo].[doStocktakeEntry] ADD  DEFAULT ('') FOR [Code]
GO
ALTER TABLE [dbo].[doStocktakeEntry] ADD  DEFAULT ((0.0)) FOR [Cost]
GO
ALTER TABLE [dbo].[doStocktakeEntry] ADD  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[doStocktakeEntry] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [LastCounted]
GO
ALTER TABLE [dbo].[doStocktakeEntry] ADD  DEFAULT ((0.0)) FOR [QuantityCounted]
GO
ALTER TABLE [dbo].[doStocktakeEntry] ADD  DEFAULT ((0.0)) FOR [QuantityOnHand]
GO
ALTER TABLE [dbo].[doStocktakeEntry] ADD  DEFAULT ((0)) FOR [Stocktake]
GO
ALTER TABLE [dbo].[doStocktakeEntry] ADD  DEFAULT ((0)) FOR [StocktakedItem]
GO
ALTER TABLE [dbo].[doSubstitute] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doSubstitute] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doSubstitute] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doSubstitute] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doSubstitute] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doSubstitute] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doSubstitute] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [IBHeaderGuid]
GO
ALTER TABLE [dbo].[doSubstitute] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [RapidObjectGuid]
GO
ALTER TABLE [dbo].[doSubstitute] ADD  DEFAULT ((0)) FOR [RapidSyncRequired]
GO
ALTER TABLE [dbo].[doSubstitute] ADD  DEFAULT ((0)) FOR [RecordStatus]
GO
ALTER TABLE [dbo].[doSubstitute] ADD  DEFAULT ((0)) FOR [Item]
GO
ALTER TABLE [dbo].[doSubstitute] ADD  DEFAULT ((0)) FOR [SubstituteItem]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [IBHeaderGuid]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [RapidObjectGuid]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ((0)) FOR [RapidSyncRequired]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ((0)) FOR [RecordStatus]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ('') FOR [ABN]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ('') FOR [AccountNumber]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ('') FOR [AddressLine1]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ('') FOR [AddressLine2]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ('') FOR [AddressState]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ((0)) FOR [AppCatHQID]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [AppCatHQLastMatched]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ((0)) FOR [ApplyTax]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ('') FOR [City]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ('') FOR [Code]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ('') FOR [Company]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ('') FOR [ContactName]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ('') FOR [Country]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ((0)) FOR [Currency]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [CustomDate1]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [CustomDate2]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [CustomDate3]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [CustomDate4]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [CustomDate5]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ((0.0)) FOR [CustomNumber1]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ((0.0)) FOR [CustomNumber2]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ((0.0)) FOR [CustomNumber3]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ((0.0)) FOR [CustomNumber4]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ((0.0)) FOR [CustomNumber5]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ('') FOR [CustomText1]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ('') FOR [CustomText2]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ('') FOR [CustomText3]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ('') FOR [CustomText4]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ('') FOR [CustomText5]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ((0)) FOR [DeliveringSupplier]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ('') FOR [EmailAddress]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ('') FOR [FaxNumber]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ('') FOR [FirstName]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ('') FOR [GroupedDescription]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ((0)) FOR [InActive]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ((0)) FOR [IsBanner]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ((0)) FOR [IsBuyingGroup]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ((0)) FOR [IsDirectSupplier]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ((0)) FOR [IsManufacturer]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ((0)) FOR [IsWholesaler]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ('') FOR [LastName]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ('') FOR [LocalKey]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ((0.0)) FOR [MinimumOrderAmount]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ('') FOR [MobileNumber]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ((0)) FOR [NoGateway]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ((0)) FOR [ObeyAccountCreditLimit]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ('') FOR [OrderingCode]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ('') FOR [PhoneNumber]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ('') FOR [PostCode]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ((0)) FOR [PricelineSupplierType]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ('') FOR [Remarks]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ('') FOR [RemoteHost]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ('') FOR [RemoteKey]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ('') FOR [RemotePort]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ((0)) FOR [SendOrdersViaProxySupplier]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ((0)) FOR [ShowCostPrice]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ('') FOR [Terms]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ('') FOR [Title]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ((0)) FOR [TransferOutChargeAccount]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ((0)) FOR [TransferType]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ((0)) FOR [UpdateCost]
GO
ALTER TABLE [dbo].[doSupplier] ADD  DEFAULT ('') FOR [Web]
GO
ALTER TABLE [dbo].[doSupplierAccount] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doSupplierAccount] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doSupplierAccount] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doSupplierAccount] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doSupplierAccount] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doSupplierAccount] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doSupplierAccount] ADD  DEFAULT ('') FOR [AccountNumber]
GO
ALTER TABLE [dbo].[doSupplierAccount] ADD  DEFAULT ('') FOR [BackupSupplyType]
GO
ALTER TABLE [dbo].[doSupplierAccount] ADD  DEFAULT ('') FOR [Code]
GO
ALTER TABLE [dbo].[doSupplierAccount] ADD  DEFAULT ((0)) FOR [Disabled]
GO
ALTER TABLE [dbo].[doSupplierAccount] ADD  DEFAULT ('') FOR [GroupType]
GO
ALTER TABLE [dbo].[doSupplierAccount] ADD  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[doSupplierAccount] ADD  DEFAULT ('') FOR [OrderType]
GO
ALTER TABLE [dbo].[doSupplierAccount] ADD  DEFAULT ('') FOR [Password]
GO
ALTER TABLE [dbo].[doSupplierAccount] ADD  DEFAULT ((0)) FOR [Supplier]
GO
ALTER TABLE [dbo].[doSupplierAccount] ADD  DEFAULT ((0)) FOR [SupplierID]
GO
ALTER TABLE [dbo].[doSupplierAccount] ADD  DEFAULT ('') FOR [SupplyMethod]
GO
ALTER TABLE [dbo].[doSupplierAccount] ADD  DEFAULT ('') FOR [SupplyType]
GO
ALTER TABLE [dbo].[doSupplierAccount] ADD  DEFAULT ((0)) FOR [UseAPIOrderingOptions]
GO
ALTER TABLE [dbo].[doSupplierAccount] ADD  DEFAULT ((0)) FOR [UseSigmaOrderingOptions]
GO
ALTER TABLE [dbo].[doSupplierItem] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doSupplierItem] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doSupplierItem] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doSupplierItem] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doSupplierItem] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doSupplierItem] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doSupplierItem] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [IBHeaderGuid]
GO
ALTER TABLE [dbo].[doSupplierItem] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [RapidObjectGuid]
GO
ALTER TABLE [dbo].[doSupplierItem] ADD  DEFAULT ((0)) FOR [RapidSyncRequired]
GO
ALTER TABLE [dbo].[doSupplierItem] ADD  DEFAULT ((0)) FOR [RecordStatus]
GO
ALTER TABLE [dbo].[doSupplierItem] ADD  DEFAULT ((0.0)) FOR [Cost]
GO
ALTER TABLE [dbo].[doSupplierItem] ADD  DEFAULT ((0.0)) FOR [CostPrice1]
GO
ALTER TABLE [dbo].[doSupplierItem] ADD  DEFAULT ((0.0)) FOR [CostPrice2]
GO
ALTER TABLE [dbo].[doSupplierItem] ADD  DEFAULT ((0.0)) FOR [CostPrice3]
GO
ALTER TABLE [dbo].[doSupplierItem] ADD  DEFAULT ((0.0)) FOR [CostPrice4]
GO
ALTER TABLE [dbo].[doSupplierItem] ADD  DEFAULT ((0.0)) FOR [CostPrice5]
GO
ALTER TABLE [dbo].[doSupplierItem] ADD  DEFAULT ((0.0)) FOR [CostPriceQuantity1]
GO
ALTER TABLE [dbo].[doSupplierItem] ADD  DEFAULT ((0.0)) FOR [CostPriceQuantity2]
GO
ALTER TABLE [dbo].[doSupplierItem] ADD  DEFAULT ((0.0)) FOR [CostPriceQuantity3]
GO
ALTER TABLE [dbo].[doSupplierItem] ADD  DEFAULT ((0.0)) FOR [CostPriceQuantity4]
GO
ALTER TABLE [dbo].[doSupplierItem] ADD  DEFAULT ((0.0)) FOR [CostPriceQuantity5]
GO
ALTER TABLE [dbo].[doSupplierItem] ADD  DEFAULT ('') FOR [DealCatalogueName]
GO
ALTER TABLE [dbo].[doSupplierItem] ADD  DEFAULT ((0.0)) FOR [DealCost]
GO
ALTER TABLE [dbo].[doSupplierItem] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [DealEndDate]
GO
ALTER TABLE [dbo].[doSupplierItem] ADD  DEFAULT ((0.0)) FOR [DealMinDOQ]
GO
ALTER TABLE [dbo].[doSupplierItem] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [DealStartDate]
GO
ALTER TABLE [dbo].[doSupplierItem] ADD  DEFAULT ((0)) FOR [ItemSupplied]
GO
ALTER TABLE [dbo].[doSupplierItem] ADD  DEFAULT ((0)) FOR [ItemTax]
GO
ALTER TABLE [dbo].[doSupplierItem] ADD  DEFAULT ((0.0)) FOR [LastCost]
GO
ALTER TABLE [dbo].[doSupplierItem] ADD  DEFAULT ((0.0)) FOR [LastExchangeRate]
GO
ALTER TABLE [dbo].[doSupplierItem] ADD  DEFAULT ((0.0)) FOR [LastForeignCost]
GO
ALTER TABLE [dbo].[doSupplierItem] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [LastReceivedDate]
GO
ALTER TABLE [dbo].[doSupplierItem] ADD  DEFAULT ((0)) FOR [MinimumOrder]
GO
ALTER TABLE [dbo].[doSupplierItem] ADD  DEFAULT ((0)) FOR [NeverAutoMatch]
GO
ALTER TABLE [dbo].[doSupplierItem] ADD  DEFAULT ((0)) FOR [PackQuantity]
GO
ALTER TABLE [dbo].[doSupplierItem] ADD  DEFAULT ((0)) FOR [PurchaseTax]
GO
ALTER TABLE [dbo].[doSupplierItem] ADD  DEFAULT ((0.0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[doSupplierItem] ADD  DEFAULT ((0.0)) FOR [RRP]
GO
ALTER TABLE [dbo].[doSupplierItem] ADD  DEFAULT ((0.0)) FOR [ReceiveItemQuantity]
GO
ALTER TABLE [dbo].[doSupplierItem] ADD  DEFAULT ('') FOR [ReorderNumber]
GO
ALTER TABLE [dbo].[doSupplierItem] ADD  DEFAULT ((0)) FOR [Supplier]
GO
ALTER TABLE [dbo].[doSupplierItem] ADD  DEFAULT ('') FOR [SupplierDescription]
GO
ALTER TABLE [dbo].[doSupplierItem] ADD  DEFAULT ((0)) FOR [TaxInc]
GO
ALTER TABLE [dbo].[doSupplierItem] ADD  DEFAULT ((0.0)) FOR [TaxRate]
GO
ALTER TABLE [dbo].[doSysInfo] ADD  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[doSysInfo] ADD  DEFAULT (NULL) FOR [Value]
GO
ALTER TABLE [dbo].[doSysObjectDefs] ADD  DEFAULT ('') FOR [OBJECT_CATALOG]
GO
ALTER TABLE [dbo].[doSysObjectDefs] ADD  DEFAULT ('') FOR [OBJECT_SCHEMA]
GO
ALTER TABLE [dbo].[doSysObjectDefs] ADD  DEFAULT ('') FOR [OBJECT_NAME]
GO
ALTER TABLE [dbo].[doSysObjectDefs] ADD  DEFAULT ('') FOR [OBJECT_DEFINITION]
GO
ALTER TABLE [dbo].[doSysObjectDefs] ADD  DEFAULT ('') FOR [OBJECT_DEFINITION_CHECKSUM]
GO
ALTER TABLE [dbo].[doSysTypes] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doSysTypes] ADD  DEFAULT (NULL) FOR [Value]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [IBHeaderGuid]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [RapidObjectGuid]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0)) FOR [RapidSyncRequired]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0)) FOR [RecordStatus]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0)) FOR [ApplyOverMinimum]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0)) FOR [ApplyToSubTotal]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [Bracket00]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [Bracket01]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [Bracket02]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [Bracket03]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [Bracket04]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [Bracket05]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [Bracket06]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [Bracket07]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [Bracket08]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [Bracket09]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [Bracket10]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [Bracket11]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [Bracket12]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [Bracket13]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [Bracket14]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [Bracket15]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [Bracket16]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [Bracket17]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [Bracket18]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [Bracket19]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [Bracket20]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [Bracket21]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [Bracket22]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [Bracket23]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [Bracket24]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [Bracket25]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [Bracket26]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [Bracket27]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [Bracket28]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [Bracket29]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [Bracket30]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [BracketValue01]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [BracketValue02]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [BracketValue03]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [BracketValue04]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [BracketValue05]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [BracketValue06]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [BracketValue07]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [BracketValue08]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [BracketValue09]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [BracketValue10]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [BracketValue11]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [BracketValue12]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [BracketValue13]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [BracketValue14]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [BracketValue15]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [BracketValue16]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [BracketValue17]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [BracketValue18]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [BracketValue19]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [BracketValue20]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [BracketValue21]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [BracketValue22]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [BracketValue23]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [BracketValue24]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [BracketValue25]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [BracketValue26]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [BracketValue27]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [BracketValue28]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [BracketValue29]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [BracketValue30]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ('') FOR [Code]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [FixedAmount]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0)) FOR [IncludePreviousTax]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [ItemMaximum]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [ItemMinimum]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0.0)) FOR [Percentage]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0)) FOR [TaxLimit]
GO
ALTER TABLE [dbo].[doTax] ADD  DEFAULT ((0)) FOR [UsePartialDollar]
GO
ALTER TABLE [dbo].[doTender] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doTender] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doTender] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doTender] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doTender] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doTender] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doTender] ADD  DEFAULT ((0)) FOR [Activity]
GO
ALTER TABLE [dbo].[doTender] ADD  DEFAULT ((0.0)) FOR [Amount]
GO
ALTER TABLE [dbo].[doTender] ADD  DEFAULT ((0)) FOR [DropPayout]
GO
ALTER TABLE [dbo].[doTender] ADD  DEFAULT ((0)) FOR [TenderAction]
GO
ALTER TABLE [dbo].[doTender] ADD  DEFAULT ((0)) FOR [TenderType]
GO
ALTER TABLE [dbo].[doTenderDenominations] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doTenderDenominations] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doTenderDenominations] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doTenderDenominations] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doTenderDenominations] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doTenderDenominations] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doTenderDenominations] ADD  DEFAULT ((0.0)) FOR [DenominationValue]
GO
ALTER TABLE [dbo].[doTenderDenominations] ADD  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[doTenderDenominations] ADD  DEFAULT ((0)) FOR [TypeOfTender]
GO
ALTER TABLE [dbo].[doTenderTotal] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doTenderTotal] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doTenderTotal] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doTenderTotal] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doTenderTotal] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doTenderTotal] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doTenderTotal] ADD  DEFAULT ((0.0)) FOR [Banking]
GO
ALTER TABLE [dbo].[doTenderTotal] ADD  DEFAULT ((0)) FOR [Batch]
GO
ALTER TABLE [dbo].[doTenderTotal] ADD  DEFAULT ((0.0)) FOR [Close]
GO
ALTER TABLE [dbo].[doTenderTotal] ADD  DEFAULT ((0)) FOR [Count]
GO
ALTER TABLE [dbo].[doTenderTotal] ADD  DEFAULT ((0.0)) FOR [Dropped]
GO
ALTER TABLE [dbo].[doTenderTotal] ADD  DEFAULT ((0.0)) FOR [Open]
GO
ALTER TABLE [dbo].[doTenderTotal] ADD  DEFAULT ((0.0)) FOR [Shift]
GO
ALTER TABLE [dbo].[doTenderTotal] ADD  DEFAULT ((0)) FOR [TenderType]
GO
ALTER TABLE [dbo].[doTenderType] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doTenderType] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doTenderType] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doTenderType] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doTenderType] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doTenderType] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doTenderType] ADD  DEFAULT ('') FOR [Code]
GO
ALTER TABLE [dbo].[doTenderType] ADD  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[doTenderType] ADD  DEFAULT ((0.0)) FOR [MaximumTender]
GO
ALTER TABLE [dbo].[doTenderType] ADD  DEFAULT ((0)) FOR [PopCashDraw]
GO
ALTER TABLE [dbo].[doTenderType] ADD  DEFAULT ((0)) FOR [PreventOverTendering]
GO
ALTER TABLE [dbo].[doTenderType] ADD  DEFAULT ((0)) FOR [RegisterDisplayOrder]
GO
ALTER TABLE [dbo].[doTenderType] ADD  DEFAULT ('') FOR [Remarks]
GO
ALTER TABLE [dbo].[doTenderType] ADD  DEFAULT ((0)) FOR [TypeOfTender]
GO
ALTER TABLE [dbo].[doTransactionInfo] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doTransactionInfo] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [StartTime]
GO
ALTER TABLE [dbo].[doTransactionInfo] ADD  DEFAULT ((0)) FOR [User]
GO
ALTER TABLE [dbo].[doUser] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doUser] ADD  DEFAULT ((0)) FOR [IsDisabled]
GO
ALTER TABLE [dbo].[doUserAccount] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doUserAccount] ADD  DEFAULT ('') FOR [AddressLine1]
GO
ALTER TABLE [dbo].[doUserAccount] ADD  DEFAULT ('') FOR [AddressLine2]
GO
ALTER TABLE [dbo].[doUserAccount] ADD  DEFAULT ('') FOR [AddressState]
GO
ALTER TABLE [dbo].[doUserAccount] ADD  DEFAULT ((0)) FOR [AllowTaskAllocation]
GO
ALTER TABLE [dbo].[doUserAccount] ADD  DEFAULT ((0)) FOR [Cashier]
GO
ALTER TABLE [dbo].[doUserAccount] ADD  DEFAULT ('') FOR [City]
GO
ALTER TABLE [dbo].[doUserAccount] ADD  DEFAULT ('') FOR [Company]
GO
ALTER TABLE [dbo].[doUserAccount] ADD  DEFAULT ('') FOR [EmailAddress]
GO
ALTER TABLE [dbo].[doUserAccount] ADD  DEFAULT ('') FOR [FaxNumber]
GO
ALTER TABLE [dbo].[doUserAccount] ADD  DEFAULT ('') FOR [FirstName]
GO
ALTER TABLE [dbo].[doUserAccount] ADD  DEFAULT ('') FOR [LastName]
GO
ALTER TABLE [dbo].[doUserAccount] ADD  DEFAULT ('') FOR [MobileNumber]
GO
ALTER TABLE [dbo].[doUserAccount] ADD  DEFAULT ('') FOR [PhoneNumber]
GO
ALTER TABLE [dbo].[doUserAccount] ADD  DEFAULT ('') FOR [PinCode]
GO
ALTER TABLE [dbo].[doUserAccount] ADD  DEFAULT ('') FOR [PostCode]
GO
ALTER TABLE [dbo].[doUserAccount] ADD  DEFAULT ('') FOR [ResourceColour]
GO
ALTER TABLE [dbo].[doUserAccount] ADD  DEFAULT ('') FOR [Title]
GO
ALTER TABLE [dbo].[doUserAccount] ADD  DEFAULT ('') FOR [UserName]
GO
ALTER TABLE [dbo].[doUserAccount] ADD  DEFAULT ('') FOR [Web]
GO
ALTER TABLE [dbo].[doUserAccount-Appointments] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doUserAccount-Appointments] ADD  DEFAULT ((0)) FOR [Owner]
GO
ALTER TABLE [dbo].[doUserAccount-Appointments] ADD  DEFAULT ((0)) FOR [AllDay]
GO
ALTER TABLE [dbo].[doUserAccount-Appointments] ADD  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[doUserAccount-Appointments] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [End]
GO
ALTER TABLE [dbo].[doUserAccount-Appointments] ADD  DEFAULT ((0)) FOR [EventType]
GO
ALTER TABLE [dbo].[doUserAccount-Appointments] ADD  DEFAULT ((0)) FOR [Label]
GO
ALTER TABLE [dbo].[doUserAccount-Appointments] ADD  DEFAULT ('') FOR [Location]
GO
ALTER TABLE [dbo].[doUserAccount-Appointments] ADD  DEFAULT ('') FOR [RecurrenceInfo]
GO
ALTER TABLE [dbo].[doUserAccount-Appointments] ADD  DEFAULT ('') FOR [ReminderInfo]
GO
ALTER TABLE [dbo].[doUserAccount-Appointments] ADD  DEFAULT ('') FOR [ResourceId]
GO
ALTER TABLE [dbo].[doUserAccount-Appointments] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Start]
GO
ALTER TABLE [dbo].[doUserAccount-Appointments] ADD  DEFAULT ('') FOR [Subject]
GO
ALTER TABLE [dbo].[doUserAccount-Tasks] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doUserAccount-Tasks] ADD  DEFAULT ((0)) FOR [Owner]
GO
ALTER TABLE [dbo].[doUserAccount-Tasks] ADD  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[doUserAccount-Tasks] ADD  DEFAULT ((0)) FOR [Done]
GO
ALTER TABLE [dbo].[doUserAccount-Tasks] ADD  DEFAULT ('') FOR [DoneBy]
GO
ALTER TABLE [dbo].[doUserAccount-Tasks] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [DueDate]
GO
ALTER TABLE [dbo].[doUserAccount-Tasks] ADD  DEFAULT ('') FOR [RecurrencePattern]
GO
ALTER TABLE [dbo].[doUserAccount-Tasks] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [ReminderDateTime]
GO
ALTER TABLE [dbo].[doUserAccount-Tasks] ADD  DEFAULT ((0)) FOR [ReminderEnabled]
GO
ALTER TABLE [dbo].[doUserAccount-Tasks] ADD  DEFAULT ('') FOR [SharedUserList]
GO
ALTER TABLE [dbo].[doUserAccount-Tasks] ADD  DEFAULT ('') FOR [Subject]
GO
ALTER TABLE [dbo].[doUserAccount-UserSettings] ADD  DEFAULT ((0)) FOR [ID-1]
GO
ALTER TABLE [dbo].[doUserAccount-UserSettings] ADD  DEFAULT ((0)) FOR [ID-2]
GO
ALTER TABLE [dbo].[doWard] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doWard] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doWard] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doWard] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doWard] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doWard] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doWard] ADD  DEFAULT ('') FOR [WardDescription]
GO
ALTER TABLE [dbo].[doWard] ADD  DEFAULT ('') FOR [WardNumber]
GO
ALTER TABLE [dbo].[doWard] ADD  DEFAULT ('') FOR [Wardcharge]
GO
ALTER TABLE [dbo].[doWard] ADD  DEFAULT ('') FOR [Wardhiccat]
GO
ALTER TABLE [dbo].[doWard] ADD  DEFAULT ('') FOR [Wardhosp]
GO
ALTER TABLE [dbo].[doWilliamActivityHistory] ADD  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[doWilliamActivityHistory] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Created]
GO
ALTER TABLE [dbo].[doWilliamActivityHistory] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [Modified]
GO
ALTER TABLE [dbo].[doWilliamActivityHistory] ADD  DEFAULT ((0)) FOR [AggregateSource]
GO
ALTER TABLE [dbo].[doWilliamActivityHistory] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Guid]
GO
ALTER TABLE [dbo].[doWilliamActivityHistory] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[doWilliamActivityHistory] ADD  DEFAULT ((0)) FOR [Account]
GO
ALTER TABLE [dbo].[doWilliamActivityHistory] ADD  DEFAULT ('') FOR [AccountNumber]
GO
ALTER TABLE [dbo].[doWilliamActivityHistory] ADD  DEFAULT ((0.0)) FOR [Amount]
GO
ALTER TABLE [dbo].[doWilliamActivityHistory] ADD  DEFAULT ('') FOR [ChargeType]
GO
ALTER TABLE [dbo].[doWilliamActivityHistory] ADD  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[doWilliamActivityHistory] ADD  DEFAULT ('') FOR [DiscPoss]
GO
ALTER TABLE [dbo].[doWilliamActivityHistory] ADD  DEFAULT ((0.0)) FOR [Discount]
GO
ALTER TABLE [dbo].[doWilliamActivityHistory] ADD  DEFAULT ((0)) FOR [GSTIncluded]
GO
ALTER TABLE [dbo].[doWilliamActivityHistory] ADD  DEFAULT ('') FOR [HistoryType]
GO
ALTER TABLE [dbo].[doWilliamActivityHistory] ADD  DEFAULT ('') FOR [Operator]
GO
ALTER TABLE [dbo].[doWilliamActivityHistory] ADD  DEFAULT ((0)) FOR [PatientNumber]
GO
ALTER TABLE [dbo].[doWilliamActivityHistory] ADD  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[doWilliamActivityHistory] ADD  DEFAULT ('') FOR [ReferenceNumber]
GO
ALTER TABLE [dbo].[doWilliamActivityHistory] ADD  DEFAULT ('1800-01-01 00:00:00') FOR [TimeOccured]
GO
ALTER TABLE [dbo].[doWilliamActivityHistory] ADD  DEFAULT ('') FOR [TransactionClass]
GO
ALTER TABLE [dbo].[doWilliamActivityHistory] ADD  DEFAULT ((0)) FOR [TransactionNumber]
GO
ALTER TABLE [dbo].[doWilliamActivityHistory] ADD  DEFAULT ((0)) FOR [WardNumber]
GO
USE [master]
GO
ALTER DATABASE [FredOffice] SET  READ_WRITE 
GO
