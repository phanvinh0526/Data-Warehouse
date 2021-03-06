USE [master]
GO
/****** Object:  Database [Storeops]    Script Date: 12/11/2017 1:09:31 PM ******/
CREATE DATABASE [Storeops]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QSDB_Data', FILENAME = N'D:\MSSQLSERVER\DATA\SOURCE_TKW_POS' , SIZE = 9605312KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'QSDB_Log', FILENAME = N'D:\MSSQLSERVER\DATA\Storeops_LOG' , SIZE = 3456KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
GO
ALTER DATABASE [Storeops] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Storeops].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [Storeops] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Storeops] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Storeops] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Storeops] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Storeops] SET ARITHABORT OFF 
GO
ALTER DATABASE [Storeops] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Storeops] SET AUTO_SHRINK ON 
GO
ALTER DATABASE [Storeops] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Storeops] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Storeops] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Storeops] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Storeops] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Storeops] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Storeops] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Storeops] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Storeops] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Storeops] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Storeops] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Storeops] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Storeops] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Storeops] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Storeops] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Storeops] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Storeops] SET  MULTI_USER 
GO
ALTER DATABASE [Storeops] SET PAGE_VERIFY NONE  
GO
ALTER DATABASE [Storeops] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Storeops] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Storeops] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Storeops] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Storeops', N'ON'
GO
USE [Storeops]
GO
/****** Object:  Table [dbo].[Accounting]    Script Date: 12/11/2017 1:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounting](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TableName] [nvarchar](30) NOT NULL CONSTRAINT [DF_Accounting_TableName]  DEFAULT (''),
	[FieldName] [nvarchar](30) NOT NULL CONSTRAINT [DF_Accounting_FieldName]  DEFAULT (''),
	[DetailID] [int] NOT NULL CONSTRAINT [DF_Accounting_DetailID]  DEFAULT (0),
	[Description] [nvarchar](50) NOT NULL CONSTRAINT [DF_Accounting_Description]  DEFAULT (''),
	[DebitAccount] [nvarchar](100) NULL CONSTRAINT [DF_Accounting_DebitAccount]  DEFAULT (''),
	[CreditAccount] [nvarchar](100) NULL CONSTRAINT [DF_Accounting_CreditAccount]  DEFAULT (''),
	[DBTimeStamp] [timestamp] NULL,
	[StoreID] [int] NOT NULL DEFAULT (0),
	[DisplayPosition] [int] NOT NULL CONSTRAINT [DF_Accounting_DisplayPosition]  DEFAULT (0),
 CONSTRAINT [PK_Accounting] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AccountingAccounts]    Script Date: 12/11/2017 1:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountingAccounts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HQID] [int] NOT NULL,
	[AccountNumber] [nvarchar](7) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[DBTimeStamp] [timestamp] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AccountingTerms]    Script Date: 12/11/2017 1:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountingTerms](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HQID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[DBTimeStamp] [timestamp] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AccountReceivable]    Script Date: 12/11/2017 1:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountReceivable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [int] NOT NULL CONSTRAINT [DF_Invoice_StoreID]  DEFAULT (0),
	[CustomerID] [int] NOT NULL CONSTRAINT [DF_Invoice_CustomerID]  DEFAULT (0),
	[Date] [datetime] NOT NULL CONSTRAINT [DF_Invoice_Date]  DEFAULT (getdate()),
	[DueDate] [datetime] NOT NULL CONSTRAINT [DF_Invoice_DueDate]  DEFAULT (getdate()),
	[OriginalAmount] [money] NOT NULL CONSTRAINT [DF_Invoice_Balance]  DEFAULT (0),
	[TransactionNumber] [int] NOT NULL CONSTRAINT [DF_Invoice_TransactionNumber]  DEFAULT (0),
	[Type] [smallint] NOT NULL CONSTRAINT [DF_Invoice_IsFinanceCharge]  DEFAULT (0),
	[Balance] [money] NOT NULL CONSTRAINT [DF_Invoice_Balance_1]  DEFAULT (0),
	[DBTimeStamp] [timestamp] NULL,
	[NUSSkipUpdate] [bit] NOT NULL CONSTRAINT [DF_accountreceivable_NUSSkipUpdate]  DEFAULT ((0)),
	[NUSSkipPOUpdate] [bit] NOT NULL CONSTRAINT [DF_AccountReceivable_NUSSkipPOUpdate]  DEFAULT ((0)),
 CONSTRAINT [PK_AccountReceivable] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AccountReceivableHistory]    Script Date: 12/11/2017 1:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountReceivableHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [int] NOT NULL CONSTRAINT [DF_InvoiceHistory_StoreID]  DEFAULT (0),
	[AccountReceivableID] [int] NOT NULL CONSTRAINT [DF_InvoiceHistory_InvoiceID]  DEFAULT (0),
	[BatchNumber] [int] NOT NULL CONSTRAINT [DF_InvoiceHistory_BatchNumber]  DEFAULT (0),
	[Amount] [money] NOT NULL CONSTRAINT [DF_InvoiceHistory_Amount]  DEFAULT (0),
	[PaymentID] [int] NOT NULL CONSTRAINT [DF_InvoiceHistory_PaymentID]  DEFAULT (0),
	[Comment] [nvarchar](50) NOT NULL CONSTRAINT [DF_InvoiceHistory_Comment]  DEFAULT (''),
	[CashierID] [int] NOT NULL CONSTRAINT [DF_InvoiceHistory_CashierID]  DEFAULT (0),
	[Date] [datetime] NOT NULL CONSTRAINT [DF_InvoiceHistory_Date]  DEFAULT (getdate()),
	[DBTimeStamp] [timestamp] NULL,
	[HistoryType] [int] NOT NULL CONSTRAINT [Df_AccountReceivableHistory_HistoryType]  DEFAULT (0),
	[TransferArID] [int] NOT NULL CONSTRAINT [Df_AccountReceivableHistory_TransferArID]  DEFAULT (0),
	[ReasonCodeID] [int] NOT NULL CONSTRAINT [DF_AccountReceivableHistory_ReasonCodeID]  DEFAULT (0),
	[RemoteStoreID] [int] NOT NULL DEFAULT (0),
	[RemotePaymentID] [int] NOT NULL DEFAULT (0),
	[NUSSkipUpdate] [bit] NOT NULL CONSTRAINT [DF_accountreceivablehistory_NUSSkipUpdate]  DEFAULT ((0)),
	[NUSSkipPOUpdate] [bit] NOT NULL CONSTRAINT [DF_AccountReceivableHistory_NUSSkipPOUpdate]  DEFAULT ((0)),
 CONSTRAINT [PK_AccountReceivableHistory] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AccountType]    Script Date: 12/11/2017 1:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL CONSTRAINT [DF_CustomerAccountType_Description]  DEFAULT (''),
	[DateDueType] [int] NOT NULL CONSTRAINT [DF_CustomerAccount_DateDueType]  DEFAULT (1),
	[GracePeriod] [int] NOT NULL CONSTRAINT [DF_CustomerAccount_GracePeriod]  DEFAULT (0),
	[MinimumFinanceCharge] [money] NOT NULL CONSTRAINT [DF_CustomerAccount_MinimumFinanceCharge]  DEFAULT (0),
	[AnnualInterestRate] [float] NOT NULL CONSTRAINT [DF_CustomerAccountType_AnnualInterestRate]  DEFAULT (0),
	[ApplyFinanceChargesOnFinanceCharges] [bit] NOT NULL CONSTRAINT [DF_CustomerAccountType_ApplyFinanceChargesOnFinanceCharges]  DEFAULT (1),
	[MinimumPayment] [money] NOT NULL CONSTRAINT [DF_CustomerAccountType_MinimumPayment]  DEFAULT (0),
	[DBTimeStamp] [timestamp] NULL,
	[Code] [nvarchar](17) NOT NULL DEFAULT (''),
	[HQID] [int] NOT NULL DEFAULT (0),
	[NUSSkipUpdate] [bit] NOT NULL CONSTRAINT [DF_accounttype_NUSSkipUpdate]  DEFAULT ((0)),
 CONSTRAINT [PK_AccountType] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Alias]    Script Date: 12/11/2017 1:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alias](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ItemID] [int] NOT NULL CONSTRAINT [DF_Alias_ItemID]  DEFAULT (0),
	[Alias] [nvarchar](25) NOT NULL CONSTRAINT [DF_Alias_Alias]  DEFAULT (''),
	[DBTimeStamp] [timestamp] NULL,
	[NUSSkipUpdate] [bit] NOT NULL CONSTRAINT [DF_alias_NUSSkipUpdate]  DEFAULT ((0)),
	[NUSSkipPOUpdate] [bit] NOT NULL CONSTRAINT [DF_Alias_NUSSkipPOUpdate]  DEFAULT ((0)),
 CONSTRAINT [PK_Alias] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ARHistoryMirror]    Script Date: 12/11/2017 1:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ARHistoryMirror](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [int] NOT NULL,
	[LocalARHistoryType] [int] NOT NULL,
	[RemoteStoreID] [int] NOT NULL,
	[RemoteARID] [int] NOT NULL,
	[RemotePaymentID] [int] NOT NULL,
	[Payment] [money] NOT NULL,
	[IsProcessed] [bit] NOT NULL,
	[DBTimeStamp] [timestamp] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Batch]    Script Date: 12/11/2017 1:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Batch](
	[CustomerDepositMade] [money] NOT NULL CONSTRAINT [DF_Batch_CustomerDepositMade]  DEFAULT (0),
	[CustomerDepositRedeemed] [money] NOT NULL CONSTRAINT [DF_Batch_CustomerDepositRedeemed]  DEFAULT (0),
	[LastUpdated] [datetime] NOT NULL CONSTRAINT [DF_Batch_LastUpdated]  DEFAULT (getdate()),
	[StoreID] [int] NOT NULL CONSTRAINT [DF_Batch_StoreID]  DEFAULT (0),
	[BatchNumber] [int] IDENTITY(1,1) NOT NULL,
	[Status] [smallint] NOT NULL CONSTRAINT [DF_Batch_Status]  DEFAULT (0),
	[RegisterID] [int] NOT NULL CONSTRAINT [DF_Batch_RegisterID]  DEFAULT (0),
	[OpeningTime] [datetime] NULL CONSTRAINT [DF_Batch_OpeningTime]  DEFAULT (getdate()),
	[ClosingTime] [datetime] NULL CONSTRAINT [DF_Batch_ClosingTime]  DEFAULT (null),
	[OpeningTotal] [money] NOT NULL CONSTRAINT [DF_Batch_OpeningTotal]  DEFAULT (0),
	[ClosingTotal] [money] NOT NULL CONSTRAINT [DF_Batch_ClosingTotal]  DEFAULT (0),
	[Sales] [money] NOT NULL CONSTRAINT [DF_Batch_Sales]  DEFAULT (0),
	[Returns] [money] NOT NULL CONSTRAINT [DF_Batch_Returns]  DEFAULT (0),
	[Tax] [money] NOT NULL CONSTRAINT [DF_Batch_Tax]  DEFAULT (0),
	[SalesPlusTax] [money] NOT NULL CONSTRAINT [DF_Batch_SalesPlusTax]  DEFAULT (0),
	[Commission] [money] NOT NULL CONSTRAINT [DF_Batch_Commission]  DEFAULT (0),
	[PaidOut] [money] NOT NULL CONSTRAINT [DF_Batch_PaidOut]  DEFAULT (0),
	[Dropped] [money] NOT NULL CONSTRAINT [DF_Batch_Dropped]  DEFAULT (0),
	[PaidOnAccount] [money] NOT NULL CONSTRAINT [DF_Batch_PaidOnAccount]  DEFAULT (0),
	[PaidToAccount] [money] NOT NULL CONSTRAINT [DF_Batch_PaidToAccount]  DEFAULT (0),
	[CustomerCount] [int] NOT NULL CONSTRAINT [DF_Batch_CustomerCount]  DEFAULT (0),
	[NoSalesCount] [int] NOT NULL CONSTRAINT [DF_Batch_NoSalesCount]  DEFAULT (0),
	[AbortedTransCount] [int] NOT NULL CONSTRAINT [DF_Batch_AbortedTransCount]  DEFAULT (0),
	[TotalTendered] [money] NOT NULL CONSTRAINT [DF_Batch_TotalTendered]  DEFAULT (0),
	[TotalChange] [money] NOT NULL CONSTRAINT [DF_Batch_TotalChange]  DEFAULT (0),
	[Discounts] [money] NOT NULL CONSTRAINT [DF_Batch_Discounts]  DEFAULT (0),
	[CostOfGoods] [money] NOT NULL CONSTRAINT [DF_Batch_CostOfGoods]  DEFAULT (0),
	[LayawayPaid] [money] NOT NULL CONSTRAINT [DF_Batch_LayawayPaid]  DEFAULT (0),
	[LayawayClosed] [money] NOT NULL CONSTRAINT [DF_Batch_LayawayClosed]  DEFAULT (0),
	[Shipping] [money] NOT NULL CONSTRAINT [DF_Batch_Shipping]  DEFAULT (0),
	[DBTimeStamp] [timestamp] NULL,
	[TenderRoundingError] [money] NOT NULL CONSTRAINT [DF_Batch_TenderRoundingError]  DEFAULT (0),
	[DebitSurcharge] [money] NOT NULL CONSTRAINT [DF_Batch_DebitSurcharge]  DEFAULT (0),
	[CashBackSurcharge] [money] NOT NULL CONSTRAINT [DF_Batch_CashBackSurcharge]  DEFAULT (0),
	[NUSSkipUpdate] [bit] NOT NULL CONSTRAINT [DF_batch_NUSSkipUpdate]  DEFAULT ((0)),
	[NUSSkipPOUpdate] [bit] NOT NULL CONSTRAINT [DF_Batch_NUSSkipPOUpdate]  DEFAULT ((0)),
 CONSTRAINT [PK_Batch] PRIMARY KEY NONCLUSTERED 
(
	[BatchNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CalendarEvent]    Script Date: 12/11/2017 1:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CalendarEvent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [int] NOT NULL CONSTRAINT [DF_CalendarEvent_StoreID]  DEFAULT (0),
	[CashierID] [int] NOT NULL CONSTRAINT [DF_CalendarEvent_CashierID]  DEFAULT (0),
	[DateTime] [datetime] NOT NULL CONSTRAINT [DF_CalendarEvent_Date]  DEFAULT (getdate()),
	[Text] [nvarchar](255) NOT NULL CONSTRAINT [DF_CalendarEvent_Text]  DEFAULT (''),
	[ReminderEnabled] [bit] NOT NULL CONSTRAINT [DF_CalendarEvent_ReminderEnabled]  DEFAULT (0),
	[ReminderDate] [datetime] NOT NULL CONSTRAINT [DF_CalendarEvent_ReminderDate]  DEFAULT (getdate()),
	[IsPersonal] [bit] NOT NULL CONSTRAINT [DF_CalendarEvent_IsPersonal]  DEFAULT (0),
	[DBTimeStamp] [timestamp] NULL,
 CONSTRAINT [PK_CalendarEvent] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cashier]    Script Date: 12/11/2017 1:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cashier](
	[HQID] [int] NOT NULL CONSTRAINT [DF_Cashier_HQID]  DEFAULT (0),
	[LastUpdated] [datetime] NOT NULL CONSTRAINT [DF_Cashier_LastUpdated]  DEFAULT (getdate()),
	[Number] [nvarchar](9) NOT NULL CONSTRAINT [DF_Cashier_Number]  DEFAULT (''),
	[StoreID] [int] NOT NULL CONSTRAINT [DF_Cashier_StoreID]  DEFAULT (0),
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL CONSTRAINT [DF_Cashier_Name]  DEFAULT (''),
	[Password] [nvarchar](12) NOT NULL CONSTRAINT [DF_Cashier_Password]  DEFAULT (''),
	[FloorLimit] [money] NOT NULL CONSTRAINT [DF_Cashier_FloorLimit]  DEFAULT (0),
	[ReturnLimit] [money] NOT NULL CONSTRAINT [DF_Cashier_ReturnLimit]  DEFAULT (0),
	[CashDrawerNumber] [smallint] NOT NULL CONSTRAINT [DF_Cashier_CashDrawerNumber]  DEFAULT (0),
	[SecurityLevel] [smallint] NOT NULL CONSTRAINT [DF_Cashier_SecurityLevel]  DEFAULT (0),
	[Privileges] [int] NOT NULL CONSTRAINT [DF_Cashier_Privileges]  DEFAULT (0),
	[EmailAddress] [nvarchar](255) NOT NULL CONSTRAINT [DF_Cashier_EmailAddress]  DEFAULT (''),
	[FailedLogonAttempts] [int] NOT NULL CONSTRAINT [DF_Cashier_FailedLogonAttempts]  DEFAULT (0),
	[DBTimeStamp] [timestamp] NULL,
	[MaxOverShortAmount] [money] NOT NULL CONSTRAINT [DF_Cashier_MaxOverShortAmount]  DEFAULT (0),
	[MaxOverShortPercent] [float] NOT NULL CONSTRAINT [DF_Cashier_MaxOverShortPercent]  DEFAULT (0),
	[OverShortLimitType] [int] NOT NULL CONSTRAINT [DF_Cashier_OverShortLimitType]  DEFAULT (0),
	[Telephone] [nvarchar](30) NOT NULL CONSTRAINT [Df_Cashier_Telephone]  DEFAULT (''),
	[NUSSkipUpdate] [bit] NOT NULL CONSTRAINT [DF_cashier_NUSSkipUpdate]  DEFAULT ((0)),
	[NUSSkipPOUpdate] [bit] NOT NULL CONSTRAINT [DF_Cashier_NUSSkipPOUpdate]  DEFAULT ((0)),
 CONSTRAINT [PK_Cashier] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 12/11/2017 1:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[HQID] [int] NOT NULL CONSTRAINT [DF_Category_HQID]  DEFAULT (0),
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentID] [int] NOT NULL CONSTRAINT [DF_Category_DepartmentID]  DEFAULT (0),
	[Name] [nvarchar](30) NOT NULL CONSTRAINT [DF_Category_Name]  DEFAULT (''),
	[Code] [nvarchar](17) NOT NULL CONSTRAINT [DF_Category_Code]  DEFAULT (''),
	[DBTimeStamp] [timestamp] NULL,
	[NUSSkipUpdate] [bit] NOT NULL CONSTRAINT [DF_category_NUSSkipUpdate]  DEFAULT ((0)),
	[NUSSkipPOUpdate] [bit] NOT NULL CONSTRAINT [DF_Category_NUSSkipPOUpdate]  DEFAULT ((0)),
 CONSTRAINT [PK_Category] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Check]    Script Date: 12/11/2017 1:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Check](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LookupCode] [nvarchar](30) NOT NULL,
	[AccountName] [nvarchar](30) NOT NULL,
	[StatusCode] [smallint] NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[StoreID] [int] NOT NULL,
 CONSTRAINT [PK_Check] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Configuration]    Script Date: 12/11/2017 1:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Configuration](
	[AccountDefaultID] [int] NOT NULL CONSTRAINT [DF_Configuration_AccountDefaultID]  DEFAULT (0),
	[AccountMonthlyClosingDay] [smallint] NOT NULL CONSTRAINT [DF_Configuration_AccountMonthlyClosingDay]  DEFAULT (15),
	[CostUpdateMethod] [int] NOT NULL CONSTRAINT [DF_Configuration_CostUpdateMethod]  DEFAULT (0),
	[HQCreationDate] [datetime] NULL,
	[LastBackupMessage] [datetime] NULL,
	[LastUpdated] [datetime] NOT NULL CONSTRAINT [DF_Configuration_LastUpdated]  DEFAULT (getdate()),
	[LayawayDeposit] [real] NOT NULL CONSTRAINT [DF_Configuration_LayawayDeposit]  DEFAULT (0),
	[LimitItem] [float] NOT NULL CONSTRAINT [DF_Configuration_LimitItem]  DEFAULT (0),
	[LimitPurchase] [money] NOT NULL CONSTRAINT [DF_Configuration_LimitPurchase]  DEFAULT (0),
	[LimitTimeFrame] [int] NOT NULL CONSTRAINT [DF_Configuration_LimitTimeFrame]  DEFAULT (0),
	[LimitType] [int] NOT NULL CONSTRAINT [DF_Configuration_LimitType]  DEFAULT (0),
	[SerialNumber] [varchar](50) NULL,
	[StoreCountry] [nvarchar](20) NOT NULL CONSTRAINT [DF_Configuration_StoreCountry]  DEFAULT (''),
	[StoreID] [int] NOT NULL CONSTRAINT [DF_Configuration_StoreID]  DEFAULT (0),
	[StoreState] [nvarchar](20) NOT NULL CONSTRAINT [DF_Configuration_StoreState]  DEFAULT (''),
	[SyncID] [int] NOT NULL CONSTRAINT [DF_Configuration_SyncID]  DEFAULT (0),
	[TaxSystem] [int] NOT NULL CONSTRAINT [DF_Configuration_TaxSystem]  DEFAULT (1),
	[VATRegistrationNumber] [nvarchar](20) NOT NULL CONSTRAINT [DF_Configuration_VATRegistrationNumber]  DEFAULT (''),
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StoreName] [nvarchar](30) NOT NULL CONSTRAINT [DF_Configuration_StoreName]  DEFAULT (''),
	[StoreAddress1] [nvarchar](30) NOT NULL CONSTRAINT [DF_Configuration_StoreAddress1]  DEFAULT (''),
	[StoreAddress2] [nvarchar](30) NOT NULL CONSTRAINT [DF_Configuration_StoreAddress2]  DEFAULT (''),
	[StoreCity] [nvarchar](30) NOT NULL CONSTRAINT [DF_Configuration_StoreCity]  DEFAULT (''),
	[StoreZip] [nvarchar](15) NOT NULL CONSTRAINT [DF_Configuration_StoreZip]  DEFAULT (''),
	[StorePhone] [nvarchar](14) NOT NULL CONSTRAINT [DF_Configuration_StorePhone]  DEFAULT (''),
	[StoreFax] [nvarchar](14) NOT NULL CONSTRAINT [DF_Configuration_StoreFax]  DEFAULT (''),
	[QuoteExpirationDays] [smallint] NOT NULL CONSTRAINT [DF_Configuration_QuoteExpirationDays]  DEFAULT (0),
	[BackOrderExpirationDays] [smallint] NOT NULL CONSTRAINT [DF_Configuration_BackOrderExpirationDays]  DEFAULT (0),
	[LayawayExpirationDays] [smallint] NOT NULL CONSTRAINT [DF_Configuration_LayawayExpirationDays]  DEFAULT (0),
	[WorkOrderDueDays] [smallint] NOT NULL CONSTRAINT [DF_Configuration_WorkOrderDueDays]  DEFAULT (0),
	[LayawayFee] [money] NOT NULL CONSTRAINT [DF_Configuration_LayawayFee]  DEFAULT (0),
	[ReceiptCount] [int] NOT NULL CONSTRAINT [DF_Configuration_ReceiptCount]  DEFAULT (1),
	[ReceiptCount2] [int] NOT NULL CONSTRAINT [DF_Configuration_ReceiptCount2]  DEFAULT (0),
	[EDCTimeout] [int] NOT NULL CONSTRAINT [DF_Configuration_EDCTimeout]  DEFAULT (120),
	[WorkOrderDeposit] [float] NOT NULL CONSTRAINT [DF_Configuration_WorkOrderDeposit]  DEFAULT (0.1),
	[PriceCalculationRule] [int] NOT NULL CONSTRAINT [DF_Configuration_PriceCalculationRule]  DEFAULT (0),
	[Options] [int] NOT NULL CONSTRAINT [DF_Configuration_Options]  DEFAULT (0),
	[StoreEmail] [nvarchar](255) NOT NULL CONSTRAINT [DF_Configuration_StoreEmail]  DEFAULT (''),
	[TaxBasis] [int] NOT NULL CONSTRAINT [DF_Configuration_TaxBasis]  DEFAULT (0),
	[TaxField] [int] NOT NULL CONSTRAINT [DF_Configuration_TaxField]  DEFAULT (0),
	[ItemTaxID] [int] NOT NULL CONSTRAINT [DF_Configuration_ItemTaxID]  DEFAULT (0),
	[DBTimeStamp] [timestamp] NULL,
	[DefaultTenderID] [int] NOT NULL CONSTRAINT [DF_Configuration_DefaultTenderID]  DEFAULT (0),
	[Options2] [int] NOT NULL CONSTRAINT [DF_Configuration_Options2]  DEFAULT (0),
	[VoucherExpirationDays] [int] NOT NULL CONSTRAINT [DF_Configuration_VoucherExpirationDays]  DEFAULT (0),
	[EnableGlobalCustomers] [bit] NOT NULL DEFAULT (0),
	[DefaultGlobalCustomer] [bit] NOT NULL DEFAULT (0),
	[SoftwareValidation1] [varchar](128) NULL,
	[SoftwareValidation2] [varchar](128) NULL,
	[SoftwareValidation3] [varchar](128) NULL,
	[SoftwareValidation4] [varchar](128) NULL,
	[SoftwareValidation5] [varchar](128) NULL,
	[VATDetailID] [nvarchar](50) NOT NULL CONSTRAINT [DF_Configuration_VATDetailID]  DEFAULT (''),
	[Options3] [int] NOT NULL CONSTRAINT [Df_Configuration_Options3]  DEFAULT (0),
	[Options4] [int] NOT NULL CONSTRAINT [Df_Configuration_Options4]  DEFAULT (0),
	[NextAutoAccountNumber] [int] NOT NULL CONSTRAINT [DF_Configuration_NextAutoAccountNumber]  DEFAULT (0),
	[AccountingInterface] [int] NOT NULL CONSTRAINT [DF_Configuration_AccountingInterface]  DEFAULT (0),
	[BillPostingAccount] [nvarchar](100) NOT NULL CONSTRAINT [DF_Configuration_BillPostingAccount]  DEFAULT (''),
	[AccountingFilename] [nvarchar](150) NOT NULL CONSTRAINT [DF_Configuration_AccountingFilename]  DEFAULT (''),
	[AccountingCompany] [nvarchar](100) NOT NULL CONSTRAINT [DF_Configuration_AccountingCompany]  DEFAULT (''),
	[NUSSkipPOUpdate] [bit] NOT NULL CONSTRAINT [DF_Configuration_NUSSkipPOUpdate]  DEFAULT ((0)),
 CONSTRAINT [PK_Configuration] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Currency]    Script Date: 12/11/2017 1:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Currency](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HQID] [int] NOT NULL,
	[ExchangeRate] [float] NULL,
	[Description] [nvarchar](25) NOT NULL,
	[Code] [nvarchar](17) NOT NULL,
	[LocaleID] [int] NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[NUSSkipPOUpdate] [bit] NOT NULL,
 CONSTRAINT [PK_Currency] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomButtons]    Script Date: 12/11/2017 1:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomButtons](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Number] [int] NOT NULL,
	[Caption] [nvarchar](50) NOT NULL,
	[Command] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[Picture] [image] NULL,
	[Style] [int] NOT NULL CONSTRAINT [DF__CustomBut__Style__12CA5E36]  DEFAULT (0),
	[DBTimeStamp] [timestamp] NULL,
	[HQID] [int] NOT NULL DEFAULT (0),
	[MaskColor] [int] NOT NULL CONSTRAINT [Df_CustomPosButtons_MaskColor]  DEFAULT (0),
	[UseMask] [bit] NOT NULL CONSTRAINT [DF_CustomButtons_UseMask]  DEFAULT (0),
 CONSTRAINT [PK_CustomButtons] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomCaption]    Script Date: 12/11/2017 1:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomCaption](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HQID] [int] NOT NULL CONSTRAINT [DF_CustomCaption_HQID]  DEFAULT (0),
	[Style] [int] NOT NULL CONSTRAINT [DF_CustomCaption_Style]  DEFAULT (0),
	[Caption] [nvarchar](50) NOT NULL CONSTRAINT [DF_CustomCaption_Caption]  DEFAULT (''),
	[DBTimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_CustomCaption] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 12/11/2017 1:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[AccountNumber] [nvarchar](20) NOT NULL CONSTRAINT [DF_Customer_AccountNumber]  DEFAULT (''),
	[AccountTypeID] [int] NOT NULL CONSTRAINT [DF_Customer_AccountTypeID]  DEFAULT (1),
	[Address2] [nvarchar](50) NOT NULL CONSTRAINT [DF_Customer_Address2]  DEFAULT (''),
	[AssessFinanceCharges] [bit] NOT NULL CONSTRAINT [DF_Customer_AssessFinanceCharges]  DEFAULT (0),
	[Company] [nvarchar](50) NOT NULL CONSTRAINT [DF_Customer_Company]  DEFAULT (''),
	[Country] [nvarchar](20) NOT NULL CONSTRAINT [DF_Customer_Country]  DEFAULT (''),
	[CustomDate1] [datetime] NULL,
	[CustomDate2] [datetime] NULL,
	[CustomDate3] [datetime] NULL,
	[CustomDate4] [datetime] NULL,
	[CustomDate5] [datetime] NULL,
	[CustomNumber1] [float] NOT NULL CONSTRAINT [DF_Customer_CustomNumber1]  DEFAULT (0),
	[CustomNumber2] [float] NOT NULL CONSTRAINT [DF_Customer_CustomNumber2]  DEFAULT (0),
	[CustomNumber3] [float] NOT NULL CONSTRAINT [DF_Customer_CustomNumber3]  DEFAULT (0),
	[CustomNumber4] [float] NOT NULL CONSTRAINT [DF_Customer_CustomNumber4]  DEFAULT (0),
	[CustomNumber5] [float] NOT NULL CONSTRAINT [DF_Customer_CustomNumber5]  DEFAULT (0),
	[CustomText1] [nvarchar](30) NOT NULL CONSTRAINT [DF_Customer_CustomText1]  DEFAULT (''),
	[CustomText2] [nvarchar](30) NOT NULL CONSTRAINT [DF_Customer_CustomText2]  DEFAULT (''),
	[CustomText3] [nvarchar](30) NOT NULL CONSTRAINT [DF_Customer_CustomText3]  DEFAULT (''),
	[CustomText4] [nvarchar](30) NOT NULL CONSTRAINT [DF_Customer_CustomText4]  DEFAULT (''),
	[CustomText5] [nvarchar](30) NOT NULL CONSTRAINT [DF_Customer_CustomText5]  DEFAULT (''),
	[GlobalCustomer] [bit] NOT NULL CONSTRAINT [DF_Customer_GlobalCustomer]  DEFAULT (0),
	[HQID] [int] NOT NULL CONSTRAINT [DF_Customer_HQID]  DEFAULT (0),
	[LastStartingDate] [datetime] NULL,
	[LastClosingDate] [datetime] NULL,
	[LastUpdated] [datetime] NOT NULL CONSTRAINT [DF_Customer_LastUpdated]  DEFAULT (getdate()),
	[LimitPurchase] [bit] NOT NULL CONSTRAINT [DF_Customer_LimitPurchase]  DEFAULT (0),
	[LastClosingBalance] [money] NOT NULL CONSTRAINT [DF_Customer_PreviousBalance]  DEFAULT (0),
	[PrimaryShipToID] [int] NOT NULL CONSTRAINT [DF_Customer_PrimaryShipToID]  DEFAULT (0),
	[State] [nvarchar](20) NOT NULL CONSTRAINT [DF_Customer_State]  DEFAULT (''),
	[StoreID] [int] NOT NULL CONSTRAINT [DF_Customer_StoreID]  DEFAULT (0),
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LayawayCustomer] [bit] NOT NULL CONSTRAINT [DF_Customer_LayawayCustomer]  DEFAULT (0),
	[Employee] [bit] NOT NULL CONSTRAINT [DF_Customer_Employee]  DEFAULT (0),
	[FirstName] [nvarchar](30) NOT NULL CONSTRAINT [DF_Customer_FirstName]  DEFAULT (''),
	[LastName] [nvarchar](50) NOT NULL CONSTRAINT [DF_Customer_LastName]  DEFAULT (''),
	[Address] [nvarchar](50) NOT NULL CONSTRAINT [DF_Customer_Address]  DEFAULT (''),
	[City] [nvarchar](50) NOT NULL CONSTRAINT [DF_Customer_City]  DEFAULT (''),
	[Zip] [nvarchar](15) NOT NULL CONSTRAINT [DF_Customer_Zip]  DEFAULT (''),
	[AccountBalance] [money] NOT NULL CONSTRAINT [DF_Customer_Balance]  DEFAULT (0),
	[CreditLimit] [money] NOT NULL CONSTRAINT [DF_Customer_CreditLimit]  DEFAULT (0),
	[TotalSales] [money] NOT NULL CONSTRAINT [DF_Customer_TotalSales]  DEFAULT (0),
	[AccountOpened] [datetime] NOT NULL CONSTRAINT [DF_Customer_AccountOpened]  DEFAULT (getdate()),
	[LastVisit] [datetime] NOT NULL CONSTRAINT [DF_Customer_LastVisit]  DEFAULT (getdate()),
	[TotalVisits] [int] NOT NULL CONSTRAINT [DF_Customer_TotalVisits]  DEFAULT (0),
	[TotalSavings] [money] NOT NULL CONSTRAINT [DF_Customer_TotalSavings]  DEFAULT (0),
	[CurrentDiscount] [real] NOT NULL CONSTRAINT [DF_Customer_CurrentDiscount]  DEFAULT (0),
	[PriceLevel] [smallint] NOT NULL CONSTRAINT [DF_Customer_PriceLevel]  DEFAULT (0),
	[TaxExempt] [bit] NOT NULL CONSTRAINT [DF_Customer_TaxExempt]  DEFAULT (0),
	[Notes] [ntext] NULL CONSTRAINT [DF_Customer_Notes]  DEFAULT (''),
	[Title] [nvarchar](20) NOT NULL CONSTRAINT [Df_Customer_Title]  DEFAULT (''),
	[EmailAddress] [nvarchar](255) NOT NULL CONSTRAINT [DF_Customer_EmailAddress]  DEFAULT (''),
	[DBTimeStamp] [timestamp] NULL,
	[TaxNumber] [nvarchar](20) NOT NULL CONSTRAINT [DF_Customer_TaxNumber]  DEFAULT (''),
	[PictureName] [nvarchar](50) NOT NULL CONSTRAINT [DF_Customer_PictureName]  DEFAULT (''),
	[DefaultShippingServiceID] [int] NOT NULL CONSTRAINT [DF_Customer_DefaultShippingServiceID]  DEFAULT (0),
	[PhoneNumber] [nvarchar](30) NOT NULL CONSTRAINT [Df_Customer_PhoneNumber]  DEFAULT (''),
	[FaxNumber] [nvarchar](30) NOT NULL CONSTRAINT [Df_Customer_FaxNumber]  DEFAULT (''),
	[CashierID] [int] NOT NULL CONSTRAINT [Df_Customer_CashierID]  DEFAULT (0),
	[SalesRepID] [int] NOT NULL CONSTRAINT [Df_Customer_SalesRepID]  DEFAULT (0),
	[NUSSkipUpdate] [bit] NOT NULL CONSTRAINT [DF_customer_NUSSkipUpdate]  DEFAULT ((0)),
	[NUSSkipPOUpdate] [bit] NOT NULL CONSTRAINT [DF_Customer_NUSSkipPOUpdate]  DEFAULT ((0)),
	[NUS_AccountTypeName] [nvarchar](4000) NOT NULL CONSTRAINT [DF_Customer_NUS_AccountTypeName]  DEFAULT ('Personal'),
 CONSTRAINT [PK_Customer] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Index [IX_Customer_TimeStamp]    Script Date: 12/11/2017 1:09:31 PM ******/
CREATE UNIQUE CLUSTERED INDEX [IX_Customer_TimeStamp] ON [dbo].[Customer]
(
	[DBTimeStamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DailySales]    Script Date: 12/11/2017 1:09:31 PM ******/
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
	[StoreID] [int] NOT NULL CONSTRAINT [DF__DailySale__Store__7EB943E8]  DEFAULT (0),
 CONSTRAINT [PK_DailySales] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DatabaseMetaData]    Script Date: 12/11/2017 1:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatabaseMetaData](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PropertyName] [nvarchar](50) NOT NULL,
	[PropertyValue] [sql_variant] NOT NULL,
	[PropertyValueEx] [ntext] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Department]    Script Date: 12/11/2017 1:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[HQID] [int] NOT NULL CONSTRAINT [DF_Department_HQID]  DEFAULT (0),
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL CONSTRAINT [DF_Department_Name]  DEFAULT (''),
	[code] [nvarchar](17) NOT NULL CONSTRAINT [DF_Department_Number]  DEFAULT (''),
	[DBTimeStamp] [timestamp] NULL,
	[NUSSkipUpdate] [bit] NOT NULL CONSTRAINT [DF_department_NUSSkipUpdate]  DEFAULT ((0)),
	[NUSSkipPOUpdate] [bit] NOT NULL CONSTRAINT [DF_Department_NUSSkipPOUpdate]  DEFAULT ((0)),
 CONSTRAINT [PK_Department] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Dimension]    Script Date: 12/11/2017 1:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dimension](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DimensionName] [nvarchar](40) NOT NULL,
	[Description] [nvarchar](40) NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[NUSSkipPOUpdate] [bit] NOT NULL,
 CONSTRAINT [PK_Dimension] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DimensionAttribute]    Script Date: 12/11/2017 1:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimensionAttribute](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Attribute] [nvarchar](60) NOT NULL,
	[Code] [nvarchar](5) NOT NULL,
	[DisplayOrder] [int] NULL,
	[DimensionId] [int] NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[NUSSkipPOUpdate] [bit] NOT NULL,
 CONSTRAINT [PK_DimensionAttribute] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DropPayout]    Script Date: 12/11/2017 1:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DropPayout](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [int] NOT NULL CONSTRAINT [DF_DropPayout_StoreID]  DEFAULT (0),
	[BatchNumber] [int] NOT NULL CONSTRAINT [DF_DropPayout_BatchNumber]  DEFAULT (0),
	[Time] [datetime] NOT NULL CONSTRAINT [DF_DropPayout_Time]  DEFAULT (getdate()),
	[CashierID] [int] NOT NULL CONSTRAINT [DF_DropPayout_CashierID]  DEFAULT (0),
	[Amount] [money] NOT NULL CONSTRAINT [DF_DropPayout_Amount]  DEFAULT (0),
	[Comment] [nvarchar](50) NOT NULL CONSTRAINT [DF_DropPayout_Comment]  DEFAULT (''),
	[Recipient] [nvarchar](50) NOT NULL CONSTRAINT [DF_DropPayout_Recipient]  DEFAULT (''),
	[DBTimeStamp] [timestamp] NULL,
	[ReasonCodeID] [int] NOT NULL CONSTRAINT [DF_DropPayout_ReasonCodeID]  DEFAULT (0),
	[NUSSkipUpdate] [bit] NOT NULL CONSTRAINT [DF_droppayout_NUSSkipUpdate]  DEFAULT ((0)),
	[NUSSkipPOUpdate] [bit] NOT NULL CONSTRAINT [DF_DropPayout_NUSSkipPOUpdate]  DEFAULT ((0)),
 CONSTRAINT [PK_DropPayout] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Exchange]    Script Date: 12/11/2017 1:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exchange](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DBTimeStamp] [timestamp] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[ProcessorCode] [nvarchar](50) NOT NULL,
	[Data] [ntext] NOT NULL,
	[Status] [int] NOT NULL,
	[Comment] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Exchange] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HQMessage]    Script Date: 12/11/2017 1:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HQMessage](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [smallint] NOT NULL,
	[Title] [nvarchar](40) NOT NULL,
	[Message] [nvarchar](255) NOT NULL,
	[Style] [smallint] NOT NULL,
	[FromStoreID] [int] NOT NULL,
	[ToStoreID] [int] NOT NULL,
	[AttachmentID] [int] NOT NULL,
	[DateSent] [datetime] NULL,
	[DateReceived] [datetime] NULL,
	[DBTimeStamp] [timestamp] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Import]    Script Date: 12/11/2017 1:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Import](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Type] [smallint] NOT NULL,
	[Filename] [nvarchar](128) NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
 CONSTRAINT [PK_Import] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ImportEntry]    Script Date: 12/11/2017 1:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImportEntry](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ImportID] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
	[Previous] [float] NOT NULL,
	[New] [float] NOT NULL,
	[Field] [nvarchar](15) NOT NULL,
	[AdditionalInfo] [nvarchar](50) NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
 CONSTRAINT [PK_ImportEntry] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InventoryOffline]    Script Date: 12/11/2017 1:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryOffline](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
	[DetailID] [int] NOT NULL,
	[ReasonCodeID] [int] NOT NULL,
	[Quantity] [float] NOT NULL,
	[Comment] [nvarchar](25) NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[PurchaseOrderID] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_InventoryOffline] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InventoryTransferLog]    Script Date: 12/11/2017 1:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryTransferLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ItemID] [int] NOT NULL CONSTRAINT [DF_InventoryTransferLog_ItemID]  DEFAULT (0),
	[DetailID] [int] NOT NULL CONSTRAINT [DF_InventoryTransferLog_DetailID]  DEFAULT (0),
	[Quantity] [float] NOT NULL CONSTRAINT [DF_InventoryTransferLog_Quantity]  DEFAULT (0),
	[DateTransferred] [datetime] NOT NULL CONSTRAINT [DF_InventoryTransferLog_DateTransferred]  DEFAULT (getdate()),
	[StoreID] [int] NOT NULL CONSTRAINT [DF_InventoryTransferLog_StoreID]  DEFAULT (0),
	[DBTimeStamp] [timestamp] NULL,
	[ReferenceID] [int] NOT NULL CONSTRAINT [DF_InventoryTransferLog_ReferenceID]  DEFAULT (0),
	[ReasonCodeID] [int] NOT NULL CONSTRAINT [DF_InventoryTransferLog_ReasonCodeID]  DEFAULT (0),
	[CashierID] [int] NOT NULL CONSTRAINT [DF_InventoryTransferLog_CashierID]  DEFAULT (0),
	[Type] [int] NOT NULL CONSTRAINT [DF_InventoryTransferLog_Type]  DEFAULT (0),
	[ReferenceEntryID] [int] NOT NULL CONSTRAINT [DF_InventoryTransferLog_ReferenceEntryID]  DEFAULT (0),
	[Cost] [money] NOT NULL CONSTRAINT [DF_InventoryTransferLog_Cost]  DEFAULT (0),
	[BatchNumber] [int] NOT NULL CONSTRAINT [DF_InventoryTransferLog_BatchNumber]  DEFAULT (0),
	[NUSSource] [tinyint] NULL,
	[NUSNewQty] [float] NULL,
	[NUSSkipUpdate] [bit] NOT NULL CONSTRAINT [DF_inventorytransferlog_NUSSkipUpdate]  DEFAULT ((0)),
	[NUSSkipPOUpdate] [bit] NOT NULL CONSTRAINT [DF_InventoryTransferLog_NUSSkipPOUpdate]  DEFAULT ((0)),
 CONSTRAINT [PK_InventoryTransferLog] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Item]    Script Date: 12/11/2017 1:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[BinLocation] [nvarchar](20) NOT NULL CONSTRAINT [DF_Item_BinLocation]  DEFAULT (''),
	[BuydownPrice] [money] NOT NULL CONSTRAINT [DF_Item_BuydownPrice]  DEFAULT (0),
	[BuydownQuantity] [float] NOT NULL CONSTRAINT [DF_Item_BuydownQuantity]  DEFAULT (0),
	[CommissionAmount] [money] NOT NULL CONSTRAINT [DF_Item_CommissionAmount]  DEFAULT (0),
	[CommissionMaximum] [money] NOT NULL CONSTRAINT [DF_Item_CommissionMaximum]  DEFAULT (0),
	[CommissionMode] [int] NOT NULL CONSTRAINT [DF_Item_CommissionMode]  DEFAULT (0),
	[CommissionPercentProfit] [real] NOT NULL CONSTRAINT [DF_Item_CommissionPercentProfit]  DEFAULT (0),
	[CommissionPercentSale] [real] NOT NULL CONSTRAINT [DF_Item_CommissionPercentSale]  DEFAULT (0),
	[Description] [nvarchar](30) NOT NULL CONSTRAINT [DF_Item_Description]  DEFAULT (''),
	[FoodStampable] [bit] NOT NULL CONSTRAINT [DF_Item_FoodStampable]  DEFAULT (0),
	[HQID] [int] NOT NULL CONSTRAINT [DF_Item_HQID]  DEFAULT (0),
	[ItemNotDiscountable] [bit] NOT NULL CONSTRAINT [DF_Item_ItemNotDiscountable]  DEFAULT (0),
	[LastReceived] [datetime] NULL,
	[LastUpdated] [datetime] NOT NULL CONSTRAINT [DF_Item_LastUpdated]  DEFAULT (getdate()),
	[Notes] [ntext] NULL,
	[QuantityCommitted] [float] NOT NULL CONSTRAINT [DF_Item_QuantityCommitted]  DEFAULT (0),
	[SerialNumberCount] [int] NOT NULL CONSTRAINT [DF_Item_SerialNumberCount]  DEFAULT (0),
	[TareWeightPercent] [float] NOT NULL CONSTRAINT [DF_Item_TareWeightPercent]  DEFAULT (0),
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ItemLookupCode] [nvarchar](25) NOT NULL CONSTRAINT [DF_Item_ItemLookupCode]  DEFAULT (''),
	[DepartmentID] [int] NOT NULL CONSTRAINT [DF_Item_DepartmentID]  DEFAULT (0),
	[CategoryID] [int] NOT NULL CONSTRAINT [DF_Item_CategoryID]  DEFAULT (0),
	[MessageID] [int] NOT NULL CONSTRAINT [DF_Item_MessageID]  DEFAULT (0),
	[Price] [money] NOT NULL CONSTRAINT [DF_Item_Price]  DEFAULT (0),
	[PriceA] [money] NOT NULL CONSTRAINT [DF_Item_PriceA]  DEFAULT (0),
	[PriceB] [money] NOT NULL CONSTRAINT [DF_Item_PriceB]  DEFAULT (0),
	[PriceC] [money] NOT NULL CONSTRAINT [DF_Item_PriceC]  DEFAULT (0),
	[SalePrice] [money] NOT NULL CONSTRAINT [DF_Item_SalePrice]  DEFAULT (0),
	[SaleStartDate] [datetime] NULL,
	[SaleEndDate] [datetime] NULL,
	[QuantityDiscountID] [int] NOT NULL CONSTRAINT [DF_Item_QuantityDiscountID]  DEFAULT (0),
	[TaxID] [int] NOT NULL CONSTRAINT [DF_Item_TaxID]  DEFAULT (0),
	[ItemType] [smallint] NOT NULL CONSTRAINT [DF_Item_ItemType]  DEFAULT (0),
	[Cost] [money] NOT NULL CONSTRAINT [DF_Item_Cost]  DEFAULT (0),
	[Quantity] [float] NOT NULL CONSTRAINT [DF_Item_Quantity]  DEFAULT (0),
	[ReorderPoint] [float] NOT NULL CONSTRAINT [DF_Item_ReorderPoint]  DEFAULT (0),
	[RestockLevel] [float] NOT NULL CONSTRAINT [DF_Item_RestockLevel]  DEFAULT (0),
	[TareWeight] [float] NOT NULL CONSTRAINT [DF_Item_TareWeight]  DEFAULT (0),
	[SupplierID] [int] NOT NULL CONSTRAINT [DF_Item_SupplierID]  DEFAULT (0),
	[TagAlongItem] [int] NOT NULL CONSTRAINT [DF_Item_TagAlongItem]  DEFAULT (0),
	[TagAlongQuantity] [float] NOT NULL CONSTRAINT [DF_Item_TagAlongQuantity]  DEFAULT (0),
	[ParentItem] [int] NOT NULL CONSTRAINT [DF_Item_ParentItem]  DEFAULT (0),
	[ParentQuantity] [float] NOT NULL CONSTRAINT [DF_Item_ParentQuantity]  DEFAULT (0),
	[BarcodeFormat] [smallint] NOT NULL CONSTRAINT [DF_Item_BarcodeFormat]  DEFAULT (0),
	[PriceLowerBound] [money] NOT NULL CONSTRAINT [DF_Item_PriceLowerBound]  DEFAULT (0),
	[PriceUpperBound] [money] NOT NULL CONSTRAINT [DF_Item_PriceUpperBound]  DEFAULT (0),
	[PictureName] [nvarchar](50) NOT NULL CONSTRAINT [DF_Item_PictureName]  DEFAULT (''),
	[LastSold] [datetime] NULL,
	[ExtendedDescription] [ntext] NOT NULL CONSTRAINT [DF_Item_ExtendedDescription]  DEFAULT (''),
	[SubDescription1] [nvarchar](30) NOT NULL CONSTRAINT [DF_Item_SubDescription1]  DEFAULT (''),
	[SubDescription2] [nvarchar](30) NOT NULL CONSTRAINT [DF_Item_SubDescription2]  DEFAULT (''),
	[SubDescription3] [nvarchar](30) NOT NULL CONSTRAINT [DF_Item_SubDescription3]  DEFAULT (''),
	[UnitOfMeasure] [nvarchar](4) NOT NULL CONSTRAINT [DF_Item_UnitOfMeasure]  DEFAULT (''),
	[SubCategoryID] [int] NOT NULL CONSTRAINT [DF_Item_SubCategoryID]  DEFAULT (0),
	[QuantityEntryNotAllowed] [bit] NOT NULL CONSTRAINT [DF_Item_QuantityEntryNotAllowed]  DEFAULT (0),
	[PriceMustBeEntered] [bit] NOT NULL CONSTRAINT [DF_Item_PriceMustBeEntered]  DEFAULT (0),
	[BlockSalesReason] [nvarchar](30) NOT NULL CONSTRAINT [DF_Item_BlockSalesReason]  DEFAULT (''),
	[BlockSalesAfterDate] [datetime] NULL,
	[Weight] [float] NOT NULL CONSTRAINT [DF_Item_Weight]  DEFAULT (0),
	[Taxable] [bit] NOT NULL CONSTRAINT [DF_Item_Taxable]  DEFAULT (1),
	[DBTimeStamp] [timestamp] NULL,
	[BlockSalesBeforeDate] [datetime] NULL,
	[LastCost] [money] NOT NULL CONSTRAINT [DF_Item_LastCost]  DEFAULT (0),
	[ReplacementCost] [money] NOT NULL CONSTRAINT [DF_Item_ReplacementCost]  DEFAULT (0),
	[WebItem] [bit] NOT NULL DEFAULT (0),
	[BlockSalesType] [int] NOT NULL CONSTRAINT [DF_Item_BlockSalesType]  DEFAULT (0),
	[BlockSalesScheduleID] [int] NOT NULL CONSTRAINT [DF_Item_BlockSalesScheduleID]  DEFAULT (0),
	[SaleType] [int] NOT NULL CONSTRAINT [DF_Item_SaleType]  DEFAULT (0),
	[SaleScheduleID] [int] NOT NULL CONSTRAINT [DF_Item_SaleScheduleID]  DEFAULT (0),
	[Consignment] [bit] NOT NULL CONSTRAINT [DF_Item_Consignment]  DEFAULT (0),
	[Inactive] [bit] NOT NULL CONSTRAINT [Df_Item_Inactive]  DEFAULT (0),
	[LastCounted] [datetime] NULL,
	[DoNotOrder] [bit] NOT NULL CONSTRAINT [Df_Item_DoNotOrder]  DEFAULT (0),
	[MSRP] [money] NOT NULL CONSTRAINT [Df_Item_MSRP]  DEFAULT (0),
	[DateCreated] [datetime] NOT NULL CONSTRAINT [Df_Item_DateCreated]  DEFAULT (getdate()),
	[Content] [ntext] NOT NULL CONSTRAINT [Df_Item_Content]  DEFAULT (''),
	[UsuallyShip] [nvarchar](255) NOT NULL CONSTRAINT [Df_Item_UsuallyShip]  DEFAULT (''),
	[NUSSkipUpdate] [bit] NOT NULL CONSTRAINT [DF_item_NUSSkipUpdate]  DEFAULT ((0)),
	[NUSSkipPOUpdate] [bit] NOT NULL CONSTRAINT [DF_Item_NUSSkipPOUpdate]  DEFAULT ((0)),
	[NUS_ExcludedFromLoyalty] [bit] NOT NULL CONSTRAINT [DF_Item_NUS_ExcludedFromLoyalty]  DEFAULT ((0)),
 CONSTRAINT [PK_Item] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Index [IX_Item_TimeStamp]    Script Date: 12/11/2017 1:09:31 PM ******/
CREATE UNIQUE CLUSTERED INDEX [IX_Item_TimeStamp] ON [dbo].[Item]
(
	[DBTimeStamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemClass]    Script Date: 12/11/2017 1:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemClass](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](30) NOT NULL,
	[Dimensions] [smallint] NOT NULL,
	[Title1] [nvarchar](20) NOT NULL,
	[Title2] [nvarchar](20) NOT NULL,
	[Title3] [nvarchar](20) NOT NULL,
	[ClassType] [smallint] NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[UseComponentPrice] [bit] NOT NULL,
	[HQID] [int] NOT NULL,
	[ItemLookupCode] [nvarchar](25) NOT NULL,
	[Notes] [ntext] NULL,
	[DepartmentID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[Cost] [money] NOT NULL,
	[SupplierID] [int] NOT NULL,
	[BarcodeFormat] [smallint] NOT NULL,
	[SubDescription1] [nvarchar](30) NOT NULL,
	[SubDescription2] [nvarchar](30) NOT NULL,
	[SubDescription3] [nvarchar](30) NOT NULL,
	[TaxID] [int] NOT NULL,
	[NUSSkipUpdate] [bit] NOT NULL,
	[NUSSkipPOUpdate] [bit] NOT NULL,
 CONSTRAINT [PK_ItemClass] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ItemClassComponent]    Script Date: 12/11/2017 1:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemClassComponent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ItemClassID] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
	[Quantity] [float] NOT NULL,
	[Detail1] [nvarchar](30) NOT NULL,
	[Detail2] [nvarchar](30) NOT NULL,
	[Detail3] [nvarchar](30) NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[Price] [money] NOT NULL,
	[NUSSkipUpdate] [bit] NOT NULL,
	[NUSSkipPOUpdate] [bit] NOT NULL,
 CONSTRAINT [PK_ItemClassComponent] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ItemMessage]    Script Date: 12/11/2017 1:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemMessage](
	[HQID] [int] NOT NULL CONSTRAINT [DF_ItemMessage_HQID]  DEFAULT (0),
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](30) NOT NULL CONSTRAINT [DF_ItemMessage_Title]  DEFAULT (''),
	[AgeLimit] [smallint] NOT NULL CONSTRAINT [DF_ItemMessage_AgeLimit]  DEFAULT (0),
	[Message] [nvarchar](255) NOT NULL CONSTRAINT [DF_ItemMessage_Message]  DEFAULT (''),
	[DBTimeStamp] [timestamp] NULL,
	[NUSSkipUpdate] [bit] NOT NULL CONSTRAINT [DF_itemmessage_NUSSkipUpdate]  DEFAULT ((0)),
	[NUSSkipPOUpdate] [bit] NOT NULL CONSTRAINT [DF_ItemMessage_NUSSkipPOUpdate]  DEFAULT ((0)),
 CONSTRAINT [PK_ItemMessage] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ItemTax]    Script Date: 12/11/2017 1:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemTax](
	[HQID] [int] NOT NULL CONSTRAINT [DF_ItemTax_HQID]  DEFAULT (0),
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](20) NOT NULL CONSTRAINT [DF_ItemTax_Description]  DEFAULT (''),
	[Options] [int] NOT NULL CONSTRAINT [DF_ItemTax_ApplyOnProfit]  DEFAULT (0),
	[TaxID01] [int] NOT NULL CONSTRAINT [DF_ItemTax_TaxID01]  DEFAULT (0),
	[ShowOnReceipt01] [bit] NOT NULL CONSTRAINT [DF_ItemTax_ShowOnReceipt01]  DEFAULT (0),
	[TaxID02] [int] NOT NULL CONSTRAINT [DF_ItemTax_TaxID02]  DEFAULT (0),
	[ShowOnReceipt02] [bit] NOT NULL CONSTRAINT [DF_ItemTax_ShowOnReceipt02]  DEFAULT (0),
	[TaxID03] [int] NOT NULL CONSTRAINT [DF_ItemTax_TaxID03]  DEFAULT (0),
	[ShowOnReceipt03] [bit] NOT NULL CONSTRAINT [DF_ItemTax_ShowOnReceipt03]  DEFAULT (0),
	[TaxID04] [int] NOT NULL CONSTRAINT [DF_ItemTax_TaxID04]  DEFAULT (0),
	[ShowOnReceipt04] [bit] NOT NULL CONSTRAINT [DF_ItemTax_ShowOnReceipt04]  DEFAULT (0),
	[TaxID05] [int] NOT NULL CONSTRAINT [DF_ItemTax_TaxID05]  DEFAULT (0),
	[ShowOnReceipt05] [bit] NOT NULL CONSTRAINT [DF_ItemTax_ShowOnReceipt05]  DEFAULT (0),
	[TaxID06] [int] NOT NULL CONSTRAINT [DF_ItemTax_TaxID06]  DEFAULT (0),
	[ShowOnReceipt06] [bit] NOT NULL CONSTRAINT [DF_ItemTax_ShowOnReceipt06]  DEFAULT (0),
	[TaxID07] [int] NOT NULL CONSTRAINT [DF_ItemTax_TaxID07]  DEFAULT (0),
	[ShowOnReceipt07] [bit] NOT NULL CONSTRAINT [DF_ItemTax_ShowOnReceipt07]  DEFAULT (0),
	[TaxID08] [int] NOT NULL CONSTRAINT [DF_ItemTax_TaxID08]  DEFAULT (0),
	[ShowOnReceipt08] [bit] NOT NULL CONSTRAINT [DF_ItemTax_ShowOnReceipt08]  DEFAULT (0),
	[TaxID09] [int] NOT NULL CONSTRAINT [DF_ItemTax_TaxID09]  DEFAULT (0),
	[ShowOnReceipt09] [bit] NOT NULL CONSTRAINT [DF_ItemTax_ShowOnReceipt09]  DEFAULT (0),
	[TaxID10] [int] NOT NULL CONSTRAINT [DF_ItemTax_TaxID10]  DEFAULT (0),
	[ShowOnReceipt10] [bit] NOT NULL CONSTRAINT [DF_ItemTax_ShowOnReceipt10]  DEFAULT (0),
	[Code] [nvarchar](17) NOT NULL CONSTRAINT [DF_ItemTax_Code]  DEFAULT (''),
	[DBTimeStamp] [timestamp] NULL,
	[NUSSkipUpdate] [bit] NOT NULL CONSTRAINT [DF_itemtax_NUSSkipUpdate]  DEFAULT ((0)),
	[NUSSkipPOUpdate] [bit] NOT NULL CONSTRAINT [DF_ItemTax_NUSSkipPOUpdate]  DEFAULT ((0)),
 CONSTRAINT [PK_ItemTax] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Journal]    Script Date: 12/11/2017 1:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Journal](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [int] NOT NULL CONSTRAINT [DF_Journal_StoreID]  DEFAULT (0),
	[Time] [datetime] NOT NULL CONSTRAINT [DF_Journal_Time]  DEFAULT (getdate()),
	[TransactionType] [int] NOT NULL CONSTRAINT [DF_Journal_TransactionType]  DEFAULT (0),
	[ReferenceID] [int] NOT NULL CONSTRAINT [DF_Journal_ReferenceID]  DEFAULT (0),
	[CashierID] [int] NOT NULL CONSTRAINT [DF_Journal_CashierID]  DEFAULT (0),
	[CustomerID] [int] NOT NULL CONSTRAINT [DF_Journal_CustomerID]  DEFAULT (0),
	[OrderHistoryID] [int] NOT NULL CONSTRAINT [DF_Journal_OrderHistoryID]  DEFAULT (0),
	[BatchNumber] [int] NOT NULL CONSTRAINT [DF_Journal_BatchNumber]  DEFAULT (0),
	[ReceiptText] [ntext] NOT NULL CONSTRAINT [DF_Journal_ReceiptText]  DEFAULT (''),
	[DBTimeStamp] [timestamp] NULL,
	[Compressed] [bit] NOT NULL CONSTRAINT [DF_Journal_Compressed]  DEFAULT (0),
	[ReceiptCompressed] [image] NULL,
	[NUSSkipUpdate] [bit] NOT NULL CONSTRAINT [DF_journal_NUSSkipUpdate]  DEFAULT ((0)),
 CONSTRAINT [PK_Journal] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Kit]    Script Date: 12/11/2017 1:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kit](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KitItemID] [int] NOT NULL,
	[ComponentItemID] [int] NOT NULL,
	[Quantity] [float] NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[NUSSkipUpdate] [bit] NOT NULL,
	[NUSSkipPOUpdate] [bit] NOT NULL,
 CONSTRAINT [PK_Kit] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LimitEntry]    Script Date: 12/11/2017 1:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LimitEntry](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ItemID] [int] NOT NULL,
	[Units] [float] NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
 CONSTRAINT [PK_LimitEntry] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Macro]    Script Date: 12/11/2017 1:09:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Macro](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RegisterID] [int] NOT NULL CONSTRAINT [DF_Macro_RegisterID]  DEFAULT (0),
	[Caption] [nvarchar](50) NOT NULL CONSTRAINT [DF_Macro_Name]  DEFAULT (''),
	[AssignmentNumber] [int] NOT NULL CONSTRAINT [DF_Macro_AssignmentNumber]  DEFAULT (0),
	[DBTimeStamp] [timestamp] NULL,
 CONSTRAINT [PK_Macro] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MacroEvent]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MacroEvent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MacroID] [int] NOT NULL CONSTRAINT [DF_MacroEvent_MacroID]  DEFAULT (0),
	[Message] [int] NOT NULL CONSTRAINT [DF_MacroEvent_Message]  DEFAULT (0),
	[ParamL] [int] NOT NULL CONSTRAINT [DF_MacroEvent_ParamL]  DEFAULT (0),
	[ParamH] [int] NOT NULL CONSTRAINT [DF_MacroEvent_ParamH]  DEFAULT (0),
	[Time] [int] NOT NULL CONSTRAINT [DF_MacroEvent_Time]  DEFAULT (0),
	[hWnd] [int] NOT NULL CONSTRAINT [DF_MacroEvent_hWnd]  DEFAULT (0),
	[DBTimeStamp] [timestamp] NULL,
 CONSTRAINT [PK_MacroEvent] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MatrixAttributeDisplayOrder]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MatrixAttributeDisplayOrder](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ItemClassID] [int] NOT NULL,
	[Dimension] [int] NOT NULL,
	[Attribute] [nvarchar](30) NOT NULL,
	[Code] [nvarchar](5) NOT NULL,
	[DisplayOrder] [int] NULL,
	[Inactive] [bit] NOT NULL,
	[HQID] [int] NOT NULL,
	[NUSSkipPOUpdate] [bit] NOT NULL,
 CONSTRAINT [PK_MatrixAttributeDisplayOrder] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Message]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FromCashierID] [int] NOT NULL CONSTRAINT [DF_Message_FromCashierID]  DEFAULT (0),
	[ToCashierID] [int] NOT NULL CONSTRAINT [DF_Message_ToCashierID]  DEFAULT (0),
	[Title] [nvarchar](30) NOT NULL CONSTRAINT [DF_Message_Title]  DEFAULT (''),
	[Text] [nvarchar](2000) NOT NULL CONSTRAINT [DF_Message_Message]  DEFAULT (''),
	[DateSent] [datetime] NOT NULL CONSTRAINT [DF_Message_DateSent]  DEFAULT (getdate()),
	[DateRead] [datetime] NOT NULL CONSTRAINT [DF_Message_DateRead]  DEFAULT (getdate()),
	[Deleted] [bit] NOT NULL CONSTRAINT [DF_Message_Deleted]  DEFAULT (0),
	[DBTimeStamp] [timestamp] NULL,
	[StoreID] [int] NOT NULL DEFAULT (0),
 CONSTRAINT [PK_Message] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NetDisplayChannel]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NetDisplayChannel](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL CONSTRAINT [DF_NetDisplayChannel_Name]  DEFAULT (''),
	[ShowCurrentItem] [bit] NOT NULL CONSTRAINT [DF_NetDisplayChannel_ShowCurrentItem]  DEFAULT (0),
	[LastUpdated] [datetime] NULL CONSTRAINT [DF_NetDisplayChannel_LastUpdated]  DEFAULT (getdate()),
	[DBTimeStamp] [timestamp] NULL,
 CONSTRAINT [PK_NetDisplayChannel] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NetDisplayURL]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NetDisplayURL](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ChannelID] [int] NOT NULL CONSTRAINT [DF_NetDisplayURL_ChannelID]  DEFAULT (0),
	[URL] [nvarchar](255) NOT NULL CONSTRAINT [DF_NetDisplayURL_URL]  DEFAULT (''),
	[Seconds] [int] NOT NULL CONSTRAINT [DF_NetDisplayURL_Seconds]  DEFAULT (0),
	[LastUpdated] [datetime] NULL CONSTRAINT [DF_NetDisplayURL_LastUpdated]  DEFAULT (getdate()),
	[OrderPosition] [int] NOT NULL CONSTRAINT [DF_NetDisplayURL_OrderPosition]  DEFAULT (0),
	[DBTimeStamp] [timestamp] NULL,
 CONSTRAINT [PK_NetDisplayURL] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NonTenderTransaction]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NonTenderTransaction](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [int] NOT NULL CONSTRAINT [DF_NoSaleAborted_StoreID]  DEFAULT (0),
	[TransactionType] [smallint] NOT NULL CONSTRAINT [DF_NoSaleAborted_IsNoSale]  DEFAULT (0),
	[BatchNumber] [int] NOT NULL CONSTRAINT [DF_NoSaleAborted_BatchNumber]  DEFAULT (0),
	[Time] [datetime] NOT NULL CONSTRAINT [DF_NoSaleAborted_Time]  DEFAULT (getdate()),
	[CashierID] [int] NOT NULL CONSTRAINT [DF_NoSaleAborted_CashierID]  DEFAULT (0),
	[Comment] [nvarchar](50) NOT NULL CONSTRAINT [DF_NoSaleAborted_Comment]  DEFAULT (''),
	[DBTimeStamp] [timestamp] NULL,
	[ReasonCodeID] [int] NOT NULL CONSTRAINT [Df_NonTenderTransaction_ReasonCodeID]  DEFAULT (0),
 CONSTRAINT [PK_NonTenderTransaction] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NUS_Active_Programs]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NUS_Active_Programs](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Program_Name] [nvarchar](250) NULL,
	[Computer_Name] [nvarchar](250) NULL,
	[Command_Request] [nvarchar](250) NULL,
	[Message] [nvarchar](250) NULL,
	[Cashier_ID] [int] NULL,
	[Last_Updated] [nvarchar](30) NULL,
	[Program_Status] [nvarchar](250) NULL,
	[Version] [nvarchar](20) NULL,
	[Text_value] [nvarchar](255) NULL,
 CONSTRAINT [PK_NUS_Active_Programs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NUS_Banner_Ads]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NUS_Banner_Ads](
	[HQID] [int] NULL,
	[File_Name] [nvarchar](255) NULL,
	[Duration] [int] NULL,
	[Display_Order] [int] NULL,
	[Enabled] [bit] NULL,
	[Total_Time_Displayed] [bigint] NULL,
	[Num_Times_Displayed] [int] NULL,
	[First_Time_Displayed] [datetime] NULL,
	[Last_Time_Displayed] [datetime] NULL,
	[LastUpdated] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NUS_Clients]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NUS_Clients](
	[MachineGuid] [uniqueidentifier] NOT NULL,
	[MachineName] [varchar](128) NOT NULL,
	[RegisterNumber] [int] NOT NULL,
	[CurrentVersion] [varchar](64) NOT NULL,
	[IsMaster] [bit] NOT NULL,
	[IsUpdating] [bit] NOT NULL,
	[LastPolled] [datetime] NOT NULL,
 CONSTRAINT [PK_NUS_Clients] PRIMARY KEY CLUSTERED 
(
	[MachineGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NUS_DBVersion]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NUS_DBVersion](
	[Version] [varchar](64) NOT NULL CONSTRAINT [DF_NUS_DBVersion_Version]  DEFAULT ('')
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NUS_FieldMap]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NUS_FieldMap](
	[id] [int] NOT NULL,
	[nuhqtable] [nvarchar](255) NULL,
	[nuhqfield] [nvarchar](255) NULL,
	[sotable] [nvarchar](255) NULL,
	[sofield] [nvarchar](255) NULL,
	[action] [nvarchar](50) NULL,
	[lastupdated] [datetime] NULL,
	[soisKey] [bit] NULL CONSTRAINT [DF_NUS_FieldMap_soisKey]  DEFAULT ((0)),
	[Nuhqiskey] [bit] NULL CONSTRAINT [DF_NUS_FieldMap_Nuhqiskey]  DEFAULT ((0)),
	[Nuhqenc] [bit] NULL CONSTRAINT [DF_NUS_FieldMap_Nuhqenc]  DEFAULT ((0))
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NUS_Fred2Pos_Dat]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NUS_Fred2Pos_Dat](
	[SRXNO] [int] NOT NULL,
	[ITEMID] [int] NOT NULL,
	[ITEMLOOKUPCODE] [nvarchar](25) NOT NULL,
	[REGISTERID] [int] NULL,
	[CUSTOMERID] [int] NOT NULL,
	[WORKORDER] [bit] NOT NULL,
	[COMPLETED] [bit] NOT NULL,
	[ADDEDDATE] [datetime] NOT NULL,
	[DEDUCTSTK] [bit] NOT NULL,
	[STOCKLOCN] [nvarchar](4) NOT NULL,
	[SDISPDATE] [datetime] NOT NULL,
	[STYPE] [nvarchar](1) NOT NULL,
	[SPATPRICE] [money] NOT NULL,
	[SSNAMT] [money] NOT NULL,
	[SWSCOST] [money] NOT NULL,
	[SGOVRECOV] [money] NOT NULL,
	[SDRUGDESC] [nvarchar](40) NOT NULL,
	[SALTDESC] [nvarchar](30) NOT NULL,
	[SLDRUGORD] [nvarchar](1) NOT NULL,
	[DDRUGCODE] [nvarchar](6) NOT NULL,
	[DAPNCODE1] [nvarchar](13) NOT NULL,
	[DAPNCODE2] [nvarchar](13) NOT NULL,
	[DSCODE1] [nvarchar](3) NOT NULL,
	[DPDENO1] [nvarchar](6) NOT NULL,
	[DSCODE2] [nvarchar](3) NOT NULL,
	[DPDENO2] [nvarchar](6) NOT NULL,
	[DUSERCODE] [nvarchar](6) NOT NULL,
	[DNAME] [nvarchar](30) NOT NULL,
	[DFORMABB] [nvarchar](10) NOT NULL,
	[DSTRENGTH] [nvarchar](20) NOT NULL,
	[DGENNAME] [nvarchar](30) NOT NULL,
	[DPACKSIZE] [int] NOT NULL,
	[DWSPRC] [money] NOT NULL,
	[DOTCPRC] [money] NOT NULL,
	[DPRIVPRC] [money] NOT NULL,
	[DS3RPRC] [money] NOT NULL,
	[DDISCRATE] [money] NOT NULL,
	[DPROFNO] [int] NOT NULL,
	[DMONOGRPH] [int] NOT NULL,
	[DAUSREGNO] [nvarchar](5) NOT NULL,
	[DPPGUIDE] [nvarchar](6) NOT NULL,
	[DHBFNO] [nvarchar](5) NOT NULL,
	[DSCHEDULE] [nvarchar](2) NOT NULL,
	[DINTGRP] [int] NOT NULL,
	[DINTGRP2] [int] NOT NULL,
	[DSTKGROUP] [int] NOT NULL,
	[DMANFCODE] [nvarchar](2) NOT NULL,
	[DWARNLBLS] [nvarchar](30) NOT NULL,
	[SDOCCODE] [nvarchar](4) NOT NULL,
	[SDPRESCNO] [int] NOT NULL,
	[SDOCNAME] [nvarchar](20) NOT NULL,
	[SNHSCODE] [nvarchar](5) NOT NULL,
	[SQTY] [int] NOT NULL,
	[SPACKS] [money] NOT NULL,
	[SSIGS] [nvarchar](10) NOT NULL,
	[SPHMINIT] [nvarchar](2) NOT NULL,
	[SORIGINIT] [nvarchar](2) NOT NULL,
	[SMAXDISP] [int] NOT NULL,
	[SDISPNO] [int] NOT NULL,
	[SAUTHNO] [int] NOT NULL,
	[SAUTHORTY] [bit] NOT NULL,
	[SCLASS] [nvarchar](1) NOT NULL,
	[SNARCOTIC] [bit] NOT NULL,
	[SGSTINC] [nvarchar](1) NOT NULL,
	[SWARDNO] [nvarchar](4) NOT NULL,
	[SHOSPNPAT] [nvarchar](1) NOT NULL,
	[PNUMBER] [int] NOT NULL,
	[PURNUMBER] [int] NOT NULL,
	[PADMISSNO] [int] NOT NULL,
	[PSEX] [nvarchar](1) NOT NULL,
	[PTITLE] [nvarchar](6) NOT NULL,
	[PSURNAME] [nvarchar](18) NOT NULL,
	[PFIRSTNAM] [nvarchar](18) NOT NULL,
	[PADDRESS] [nvarchar](22) NOT NULL,
	[PSUBURB] [nvarchar](18) NOT NULL,
	[PPOSTCODE] [nvarchar](4) NOT NULL,
	[PPHONE] [nvarchar](12) NOT NULL,
	[PPOSACCT] [int] NOT NULL,
	[PDIRCHRGE] [nvarchar](1) NOT NULL,
	[PDISCOUNT] [money] NOT NULL,
	[PFAMCODE] [int] NOT NULL,
	[PPTYPE] [nvarchar](1) NOT NULL,
	[PCONCNO] [nvarchar](11) NOT NULL,
	[PCONCVDTE] [datetime] NOT NULL,
	[PREPATNO] [nvarchar](10) NOT NULL,
	[PSAFENTNO] [nvarchar](11) NOT NULL,
	[PMEDICARE] [nvarchar](11) NOT NULL,
	[PDOB] [datetime] NOT NULL,
	[PALLERGY] [nvarchar](25) NOT NULL,
	[PNURSCODE] [nvarchar](4) NOT NULL,
	[PWARDNO] [nvarchar](4) NOT NULL,
	[PMAILCAT] [nvarchar](4) NOT NULL,
	[PHFUNDID] [nvarchar](4) NOT NULL,
	[PHFUNDTBL] [nvarchar](6) NOT NULL,
	[PHFUNDMNO] [int] NOT NULL,
	[PINSVDATE] [datetime] NOT NULL,
	[POWERXS] [nvarchar](1) NOT NULL,
	[PPATGRP] [nvarchar](3) NOT NULL,
	[PRPTSHERE] [nvarchar](1) NOT NULL,
	[PREPATCOL] [nvarchar](1) NOT NULL,
	[PGENSONLY] [nvarchar](1) NOT NULL,
	[PRECEIPT] [nvarchar](1) NOT NULL,
	[PPOPORINH] [nvarchar](1) NOT NULL,
	[PRXCNT] [int] NOT NULL,
	[PSAFEAMT] [money] NOT NULL,
	[POUTRXCNT] [int] NOT NULL,
	[POUTSNAMT] [money] NOT NULL,
	[PNOTES] [nvarchar](10) NOT NULL,
	[DEBUG] [text] NULL,
	[WORKORDERID] [int] NOT NULL,
	[TransactionNumber] [int] NOT NULL,
 CONSTRAINT [PK_NUS_Fred2Pos_Dat] PRIMARY KEY CLUSTERED 
(
	[SRXNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NUS_Hire]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NUS_Hire](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[barcode] [char](10) NOT NULL,
	[type] [char](7) NOT NULL,
	[deposit] [money] NOT NULL,
	[paid] [money] NOT NULL,
 CONSTRAINT [PK_NUS_Hire] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NUS_Installers]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NUS_Installers](
	[Version] [varchar](64) NOT NULL,
	[Installer] [image] NOT NULL,
 CONSTRAINT [PK_NUS_Installers] PRIMARY KEY CLUSTERED 
(
	[Version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NUS_Labels]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NUS_Labels](
	[itemID] [int] NOT NULL,
	[Lastupdated] [datetime] NOT NULL,
	[updatedby] [nvarchar](50) NULL,
	[format] [nvarchar](50) NOT NULL,
	[barcode] [tinyint] NOT NULL,
	[barcodecaption] [tinyint] NOT NULL,
	[barwidth] [tinyint] NOT NULL,
	[pricesource] [tinyint] NOT NULL,
	[BarcodeValue] [varchar](32) NOT NULL,
	[Description] [varchar](255) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NUS_LicenceLog]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NUS_LicenceLog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MachineGuid] [uniqueidentifier] NOT NULL,
	[LicenceLogXml] [ntext] NOT NULL,
 CONSTRAINT [PK_NUS_LicenceLog] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NUS_MarketSmart_Transaction]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NUS_MarketSmart_Transaction](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CardNumber] [varchar](100) NOT NULL,
	[TransactionNumber] [int] NOT NULL,
	[RegisterID] [int] NOT NULL,
	[CashierID] [int] NOT NULL,
	[CustomerID] [int] NULL,
	[DeviceID] [varchar](100) NULL,
	[DateSendLast] [datetime] NULL,
	[DateSendComplete] [datetime] NULL,
	[SendError] [varchar](512) NULL,
	[SendAttemptCount] [int] NOT NULL,
 CONSTRAINT [PK_NUS_MarketSmart_Transaction] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NUS_Monitor]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NUS_Monitor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type] [tinyint] NOT NULL,
	[computer] [varchar](255) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[status] [tinyint] NOT NULL,
	[statusupdated] [datetime] NOT NULL,
 CONSTRAINT [PK_NUS_Monitor] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NUS_MonitorCommand]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NUS_MonitorCommand](
	[NUSMonitorID] [int] NULL,
	[Sent] [datetime] NOT NULL,
	[Responded] [datetime] NULL,
	[Command] [varchar](50) NOT NULL,
	[Computer] [varchar](255) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NUS_NUHQ_Log]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NUS_NUHQ_Log](
	[Table] [nvarchar](50) NULL,
	[Fields] [nvarchar](2000) NULL,
	[Key] [int] NULL,
	[updated] [datetime] NULL,
	[insert] [bit] NULL,
	[delete] [bit] NULL,
	[Retry] [tinyint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NUS_NUHQ_Requests]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NUS_NUHQ_Requests](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[NUHQ_ID] [bigint] NOT NULL,
	[Lastupdated] [datetime] NULL,
	[RequestTypeID] [int] NULL,
	[value1] [text] NULL,
	[Performed] [bit] NULL,
	[FromUserID] [int] NULL,
	[firstupdated] [datetime] NULL,
	[fromstoreid] [int] NULL,
	[value2] [text] NULL,
	[value3] [text] NULL,
	[Performautomatically] [bit] NOT NULL,
	[Itemid] [int] NULL,
	[Storeitemid] [int] NULL,
	[itemhqid] [int] NULL,
	[confirmation] [bit] NULL,
	[received] [bit] NULL,
	[fromstatus] [tinyint] NULL,
	[tostatus] [tinyint] NULL,
	[answerreturned] [bit] NOT NULL,
 CONSTRAINT [PK_NUS_NUHQ_Requests] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NUS_NUHQ_RequestTypes]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NUS_NUHQ_RequestTypes](
	[ID] [int] NOT NULL,
	[alias] [nvarchar](50) NOT NULL,
	[shortdescription] [nvarchar](50) NOT NULL,
	[Longdescription] [nvarchar](500) NULL,
	[lastupdated] [datetime] NULL,
 CONSTRAINT [PK_NUS_NUHQ_RequestTypes] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [IX_NUS_NUHQ_RequestTypes]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE CLUSTERED INDEX [IX_NUS_NUHQ_RequestTypes] ON [dbo].[NUS_NUHQ_RequestTypes]
(
	[lastupdated] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NUS_PO_Log]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NUS_PO_Log](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[table] [varchar](50) NOT NULL,
	[key] [int] NOT NULL,
	[field] [varchar](75) NULL,
	[value] [sql_variant] NULL,
	[action] [tinyint] NOT NULL,
	[performed] [datetime] NOT NULL,
 CONSTRAINT [PK_NUS_PO_Log] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NUS_PO_Loyalty]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NUS_PO_Loyalty](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TransactionNumber] [bigint] NOT NULL,
	[LoyaltyTokenID] [varchar](14) NOT NULL,
	[AwardDocument] [text] NOT NULL,
 CONSTRAINT [PK_NUS_PO_Loyalty] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NUS_PO_Offer]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NUS_PO_Offer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NOT NULL CONSTRAINT [NUS_PO_Offer_Code]  DEFAULT (''),
	[Name] [nvarchar](40) NOT NULL CONSTRAINT [NUS_PO_Offer_Name]  DEFAULT (''),
	[Description] [nvarchar](60) NOT NULL CONSTRAINT [NUS_PO_Offer_Description]  DEFAULT (''),
	[StartDate] [datetime] NOT NULL CONSTRAINT [NUS_PO_Offer_StartDate]  DEFAULT ('1800-01-01 00:00:00'),
	[EndDate] [datetime] NOT NULL CONSTRAINT [NUS_PO_Offer_EndDate]  DEFAULT ('1800-01-01 00:00:00'),
	[Priority] [int] NOT NULL CONSTRAINT [NUS_PO_Offer_Priority]  DEFAULT ((0)),
	[DivideDiscount] [bit] NOT NULL CONSTRAINT [NUS_PO_Offer_DivideDiscount]  DEFAULT ((0)),
	[DollarOffDiscount] [decimal](28, 10) NOT NULL CONSTRAINT [NUS_PO_Offer_DollarOffDiscount]  DEFAULT ((0.0)),
	[DollarThreshold] [real] NOT NULL CONSTRAINT [NUS_PO_Offer_DollarThreshold]  DEFAULT ((0.0)),
	[IsDiscountable] [bit] NOT NULL CONSTRAINT [NUS_PO_Offer_IsDiscountable]  DEFAULT ((0)),
	[IsLoyalty] [bit] NOT NULL CONSTRAINT [NUS_PO_Offer_IsLoyalty]  DEFAULT ((0)),
	[MultiBuyXQuantity] [int] NOT NULL CONSTRAINT [NUS_PO_Offer_MultiBuyXQuantity]  DEFAULT ((0)),
	[MultiBuyYDollarAmount] [decimal](28, 10) NOT NULL CONSTRAINT [NUS_PO_Offer_MultiBuyYDollarAmount]  DEFAULT ((0.0)),
	[MultiBuyYQuantity] [int] NOT NULL CONSTRAINT [NUS_PO_Offer_MultiBuyYQuantity]  DEFAULT ((0)),
	[MultipleRedemptions] [bit] NOT NULL CONSTRAINT [NUS_PO_Offer_MultipleRedemptions]  DEFAULT ((0)),
	[OfferCategory] [int] NOT NULL CONSTRAINT [NUS_PO_Offer_OfferCategory]  DEFAULT ((1)),
	[OfferType] [int] NOT NULL CONSTRAINT [NUS_PO_Offer_OfferType]  DEFAULT ((0)),
	[PercentOffDiscount] [real] NOT NULL CONSTRAINT [NUS_PO_Offer_PercentOffDiscount]  DEFAULT ((0.0)),
	[QuantityThreshold] [bit] NOT NULL CONSTRAINT [NUS_PO_Offer_QuantityThreshold]  DEFAULT ((0)),
	[NUSSkipPOUpdate] [bit] NOT NULL CONSTRAINT [DF_NUS_PO_Offer_NUSSkipPOUpdate]  DEFAULT ((0)),
 CONSTRAINT [PK_NUS_PO_Offer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NUS_PO_OfferEntry]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NUS_PO_OfferEntry](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Offer] [int] NOT NULL CONSTRAINT [NUS_PO_OfferEntry_Offer]  DEFAULT ((0)),
	[OfferItem] [bigint] NOT NULL CONSTRAINT [NUS_PO_OfferEntry_OfferItem]  DEFAULT ((0)),
	[BuyDownQuantity] [float] NOT NULL CONSTRAINT [NUS_PO_OfferEntry_BuyDownQuantity]  DEFAULT ((0)),
	[Cost] [decimal](28, 10) NOT NULL CONSTRAINT [NUS_PO_OfferEntry_Cost]  DEFAULT ((0.0)),
	[IsDiscountItem] [bit] NOT NULL CONSTRAINT [NUS_PO_OfferEntry_IsDiscountItem]  DEFAULT ((0)),
	[Price] [decimal](28, 10) NOT NULL CONSTRAINT [NUS_PO_OfferEntry_Price]  DEFAULT ((0.0)),
	[IsQualifyingItem] [bit] NOT NULL CONSTRAINT [NUS_PO_OfferEntry_IsQualifyingItem]  DEFAULT ((0)),
	[NUSSkipPOUpdate] [bit] NOT NULL CONSTRAINT [DF_NUS_PO_OfferEntry_NUSSkipPOUpdate]  DEFAULT ((0)),
 CONSTRAINT [PK_NUS_PO_OfferEntry] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NUS_PO_Patient]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NUS_PO_Patient](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PatientNumber] [bigint] NOT NULL CONSTRAINT [DF_NUS_PO_Patient_PatientNumber]  DEFAULT (''),
	[LastName] [varchar](50) NOT NULL CONSTRAINT [DF_NUS_PO_Patient_LastName]  DEFAULT (''),
	[FirstName] [varchar](50) NOT NULL CONSTRAINT [DF_NUS_PO_Patient_FirstName]  DEFAULT (''),
	[Title] [varchar](6) NOT NULL CONSTRAINT [DF_NUS_PO_Patient_Title]  DEFAULT (''),
	[Address] [varchar](40) NOT NULL CONSTRAINT [DF_NUS_PO_Patient_Address]  DEFAULT (''),
	[Suburb] [varchar](50) NOT NULL CONSTRAINT [DF_NUS_PO_Patient_Suburb]  DEFAULT (''),
	[PostCode] [int] NOT NULL CONSTRAINT [DF_NUS_PO_Patient_PostCode]  DEFAULT ((0)),
	[NUSSkipPOUpdate] [bit] NOT NULL CONSTRAINT [DF_NUS_PO_Patient_NUSSkipPOUpdate]  DEFAULT ((0)),
 CONSTRAINT [PK_NUS_PO_Patient] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NUS_PO_Script]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NUS_PO_Script](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ScriptNumber] [bigint] NOT NULL CONSTRAINT [DF_NUS_PO_Script_ScriptNumber]  DEFAULT ((0)),
	[DispenseNumber] [int] NOT NULL CONSTRAINT [DF_NUS_PO_Script_DispenseNumber]  DEFAULT ((0)),
	[PatientPrice] [money] NOT NULL CONSTRAINT [DF_NUS_PO_Script_PatientPrice]  DEFAULT ((0)),
	[GstIncluded] [bit] NOT NULL CONSTRAINT [DF_NUS_PO_Script_GstIncluded]  DEFAULT ((0)),
	[SaleCost] [money] NOT NULL,
	[DispenseDate] [datetime] NOT NULL CONSTRAINT [DF_NUS_PO_Script_DispenseDate]  DEFAULT (getdate()),
	[Created] [datetime] NOT NULL CONSTRAINT [DF_NUS_PO_Script_Created]  DEFAULT (getdate()),
	[Patient] [bigint] NOT NULL CONSTRAINT [DF_NUS_PO_Script_Patient]  DEFAULT ((0)),
	[DrugItem] [bigint] NOT NULL CONSTRAINT [DF_NUS_PO_Script_DrugItem]  DEFAULT ((0)),
	[Quantity] [int] NOT NULL CONSTRAINT [DF_NUS_PO_Script_Quantity]  DEFAULT ((0)),
	[Packs] [float] NOT NULL CONSTRAINT [DF_NUS_PO_Script_Packs]  DEFAULT ((0)),
	[NationalHealthSchemeCode] [varchar](6) NOT NULL CONSTRAINT [DF_NUS_PO_Script_NationalHealthSchemeCode]  DEFAULT (''),
	[ScriptType] [varchar](4) NOT NULL CONSTRAINT [DF_NUS_PO_Script_ScriptType]  DEFAULT (''),
	[DrugDescription] [varchar](42) NOT NULL CONSTRAINT [DF_NUS_PO_Script_DrugDescription]  DEFAULT (''),
	[GovernmentRecoveryAmount] [money] NOT NULL CONSTRAINT [DF_NUS_PO_Script_GovernmentRecoveryAmount]  DEFAULT ((0)),
	[RegisterId] [bigint] NOT NULL CONSTRAINT [DF_NUS_PO_Script_RegisterId]  DEFAULT ((0)),
	[SaleActivityEntry] [bigint] NOT NULL CONSTRAINT [DF_NUS_PO_Script_SaleActivityEntry]  DEFAULT ((0)),
	[ReturnActivityEntry] [bigint] NOT NULL CONSTRAINT [DF_NUS_PO_Script_ReturnActivityEntry]  DEFAULT ((0)),
	[WorkOrderId] [bigint] NOT NULL CONSTRAINT [DF_NUS_PO_Script_WorkOrderId]  DEFAULT ((0)),
	[ChargeAccount] [bigint] NOT NULL CONSTRAINT [DF_NUS_PO_Script_ChargeAccount]  DEFAULT ((0)),
	[ChargeAmount] [money] NOT NULL CONSTRAINT [DF_NUS_PO_Script_ChargeAmount]  DEFAULT ((0)),
	[InstanceCount] [int] NOT NULL CONSTRAINT [DF_NUS_PO_Script_InstanceCount]  DEFAULT ((0)),
	[Deleted] [bit] NOT NULL CONSTRAINT [DF_NUS_PO_Script_Deleted]  DEFAULT ((0)),
	[Processed] [bit] NOT NULL CONSTRAINT [DF_NUS_PO_Script_Processed]  DEFAULT ((0)),
	[Available] [bit] NOT NULL CONSTRAINT [DF_NUS_PO_Script_Available]  DEFAULT ((0)),
	[ActivityAction] [int] NOT NULL CONSTRAINT [DF_NUS_PO_Script_ActivityAction]  DEFAULT ((0)),
	[PerformStockMovement] [bit] NOT NULL CONSTRAINT [DF_NUS_PO_Script_PerformStockMovement]  DEFAULT ((0)),
	[VisibleSale]  AS (case when [ActivityAction]<>(8) AND [Available]=(1) AND [WorkOrderId]=(0) AND [SaleActivityEntry]=(0) then (1) else (0) end),
	[VisibleReturn]  AS (case when [ActivityAction]<>(8) AND [Available]=(1) AND [WorkOrderId]=(0) AND [SaleActivityEntry]>(0) then (1) else (0) end),
	[NUSSkipPOUpdate] [bit] NOT NULL CONSTRAINT [DF_NUS_PO_Script_NUSSkipPOUpdate]  DEFAULT ((0)),
 CONSTRAINT [PK_NUS_PO_Script] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NUS_PostCodeTransaction]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NUS_PostCodeTransaction](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[LastUpdated] [datetime] NOT NULL CONSTRAINT [DF_NUS_PostCodeRegistration_RegistrationDate]  DEFAULT (getdate()),
	[PostCode] [varchar](100) NOT NULL,
	[RegisterID] [int] NULL,
	[CashierID] [int] NULL,
	[CustomerID] [int] NULL,
	[TransactionNumber] [int] NULL,
	[NUSSkipUpdate] [bit] NOT NULL CONSTRAINT [DF_nus_postcodetransaction_NUSSkipUpdate]  DEFAULT ((0)),
 CONSTRAINT [PK_NUS_PostCodeRegistration] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NUS_Reason_Codes]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NUS_Reason_Codes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](25) NULL,
	[Description] [nvarchar](50) NULL,
	[DBTimeStamp] [datetime] NULL,
	[Type] [int] NULL,
 CONSTRAINT [PK_NUS_Reason_Codes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NUS_Settings]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NUS_Settings](
	[alias] [nvarchar](100) NOT NULL,
	[description] [nvarchar](255) NULL,
	[format] [nvarchar](50) NULL,
	[group] [nvarchar](255) NULL,
	[section] [nvarchar](255) NULL,
	[hidden] [bit] NOT NULL CONSTRAINT [DF_NU_Settings_hidden]  DEFAULT ((0)),
	[tooltip] [nvarchar](500) NULL,
	[type] [tinyint] NOT NULL CONSTRAINT [DF_NUS_Settings_type]  DEFAULT ((0)),
	[Source] [tinyint] NOT NULL CONSTRAINT [DF_NUS_Settings_Source]  DEFAULT ((0)),
 CONSTRAINT [PK_NUS_Settings] PRIMARY KEY NONCLUSTERED 
(
	[alias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NUS_Settings_Entry]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NUS_Settings_Entry](
	[NUS_Settings_Alias] [nvarchar](50) NOT NULL,
	[Value] [nvarchar](500) NULL,
	[Restriction] [nvarchar](255) NULL,
	[Default] [bit] NOT NULL CONSTRAINT [DF_NUS_Settings_Entry_Default]  DEFAULT ((0))
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NUS_TransactionStats]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NUS_TransactionStats](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[LastUpdated] [datetime] NOT NULL CONSTRAINT [DF_NUS_TransactionStats_LastUpdated]  DEFAULT (getdate()),
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
/****** Object:  Table [dbo].[NUS_Unmatched_Scripts]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NUS_Unmatched_Scripts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[drugcode] [char](6) NULL,
	[pdenumber1] [char](6) NULL,
	[pdenumber2] [char](6) NULL,
	[drugname] [char](30) NULL,
	[NUSSkipUpdate] [bit] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OldJournal]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OldJournal](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [int] NOT NULL CONSTRAINT [DF_OldJournal_StoreID]  DEFAULT (0),
	[BatchNumber] [int] NOT NULL,
	[ClosingTime] [datetime] NOT NULL,
	[Journal] [image] NULL,
	[DBTimeStamp] [timestamp] NULL,
 CONSTRAINT [PK_OldJournal] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[StoreID] [int] NOT NULL CONSTRAINT [DF_Order_StoreID]  DEFAULT (0),
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Closed] [bit] NOT NULL CONSTRAINT [DF_Order_Open]  DEFAULT (1),
	[Time] [datetime] NOT NULL CONSTRAINT [DF_Order_Time]  DEFAULT (getdate()),
	[Type] [int] NOT NULL CONSTRAINT [DF_Order_Type]  DEFAULT (0),
	[Comment] [nvarchar](255) NOT NULL CONSTRAINT [DF_Order_Comment]  DEFAULT (''),
	[CustomerID] [int] NOT NULL CONSTRAINT [DF_Order_CustomerID]  DEFAULT (0),
	[ShipToID] [int] NOT NULL CONSTRAINT [DF_Order_ShipToID]  DEFAULT (0),
	[DepositOverride] [bit] NOT NULL CONSTRAINT [DF_Order_DepositOverride]  DEFAULT (0),
	[Deposit] [money] NOT NULL CONSTRAINT [DF_Order_Deposit]  DEFAULT (0),
	[Tax] [money] NOT NULL CONSTRAINT [DF_Order_Tax]  DEFAULT (0),
	[Total] [money] NOT NULL CONSTRAINT [DF_Order_Total]  DEFAULT (0),
	[LastUpdated] [datetime] NOT NULL CONSTRAINT [DF_Order_LastUpdated]  DEFAULT (getdate()),
	[ExpirationOrDueDate] [datetime] NOT NULL CONSTRAINT [DF_Order_DueDate]  DEFAULT (getdate()),
	[Taxable] [bit] NOT NULL CONSTRAINT [DF_Order_Taxable]  DEFAULT (1),
	[SalesRepID] [int] NOT NULL CONSTRAINT [DF_Order_SalesRepID]  DEFAULT (0),
	[ReferenceNumber] [nvarchar](50) NOT NULL CONSTRAINT [DF_Order_PONumber]  DEFAULT (''),
	[ShippingChargeOnOrder] [money] NOT NULL CONSTRAINT [DF_Order_ShippingCharge]  DEFAULT (0),
	[ShippingChargeOverride] [bit] NOT NULL CONSTRAINT [DF_Order_ShippingChargeOverride]  DEFAULT (0),
	[ShippingServiceID] [int] NOT NULL CONSTRAINT [DF_Order_ShippingServiceID]  DEFAULT (0),
	[ShippingTrackingNumber] [nvarchar](255) NOT NULL CONSTRAINT [DF_Order_ShippingTrackingNumber]  DEFAULT (''),
	[ShippingNotes] [ntext] NOT NULL CONSTRAINT [DF_Order_ShippingNotes]  DEFAULT (''),
	[DBTimeStamp] [timestamp] NULL,
	[ReasonCodeID] [int] NOT NULL CONSTRAINT [DF_Order_ReasonCodeID]  DEFAULT (0),
	[ExchangeID] [int] NOT NULL CONSTRAINT [Df_Order_ExchangeID]  DEFAULT (0),
	[ChannelType] [int] NOT NULL CONSTRAINT [Df_Order_ChannelType]  DEFAULT (0),
	[DefaultDiscountReasonCodeID] [int] NOT NULL CONSTRAINT [DF_Order_DefaultDiscountReasonCodeID]  DEFAULT (0),
	[DefaultReturnReasonCodeID] [int] NOT NULL CONSTRAINT [DF_Order_DefaultReturnReasonCodeID]  DEFAULT (0),
	[DefaultTaxChangeReasonCodeID] [int] NOT NULL CONSTRAINT [DF_Order_DefaultTaxChangeReasonCodeID]  DEFAULT (0),
	[NUSSkipPOUpdate] [bit] NOT NULL CONSTRAINT [DF_Order_NUSSkipPOUpdate]  DEFAULT ((0)),
 CONSTRAINT [PK_Order] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderEntry]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderEntry](
	[Cost] [money] NOT NULL CONSTRAINT [DF_OrderEntry_Cost]  DEFAULT (0),
	[StoreID] [int] NOT NULL CONSTRAINT [DF_OrderEntry_StoreID]  DEFAULT (0),
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL CONSTRAINT [DF_OrderEntry_OrderID]  DEFAULT (0),
	[ItemID] [int] NOT NULL CONSTRAINT [DF_OrderEntry_ItemID]  DEFAULT (0),
	[FullPrice] [money] NOT NULL CONSTRAINT [DF_OrderEntry_FullPrice]  DEFAULT (0),
	[PriceSource] [smallint] NOT NULL CONSTRAINT [DF_OrderEntry_PriceSource]  DEFAULT (1),
	[Price] [money] NOT NULL CONSTRAINT [DF_OrderEntry_Price]  DEFAULT (0),
	[QuantityOnOrder] [float] NOT NULL CONSTRAINT [DF_OrderEntry_QuantityBackorder]  DEFAULT (0),
	[SalesRepID] [int] NOT NULL CONSTRAINT [DF_OrderEntry_SalesRepID]  DEFAULT (0),
	[Taxable] [int] NOT NULL CONSTRAINT [DF_OrderEntry_Taxable]  DEFAULT (0),
	[DetailID] [int] NOT NULL CONSTRAINT [DF_OrderEntry_DetailID]  DEFAULT (0),
	[Description] [nvarchar](30) NOT NULL CONSTRAINT [DF_OrderEntry_Description]  DEFAULT (''),
	[QuantityRTD] [float] NOT NULL CONSTRAINT [DF_OrderEntry_QuantityRTD]  DEFAULT (0),
	[LastUpdated] [datetime] NOT NULL CONSTRAINT [DF_OrderEntry_LastUpdated]  DEFAULT (getdate()),
	[Comment] [nvarchar](255) NOT NULL CONSTRAINT [DF_OrderEntry_Comment]  DEFAULT (''),
	[DBTimeStamp] [timestamp] NULL,
	[DiscountReasonCodeID] [int] NOT NULL CONSTRAINT [DF_OrderEntry_DiscountReasonCodeID]  DEFAULT (0),
	[ReturnReasonCodeID] [int] NOT NULL CONSTRAINT [DF_OrderEntry_ReturnReasonCodeID]  DEFAULT (0),
	[TaxChangeReasonCodeID] [int] NOT NULL CONSTRAINT [DF_OrderEntry_TaxChangeReasonCodeID]  DEFAULT (0),
	[NUSSkipPOUpdate] [bit] NOT NULL CONSTRAINT [DF_OrderEntry_NUSSkipPOUpdate]  DEFAULT ((0)),
 CONSTRAINT [PK_OrderEntry] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderHistory]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [int] NOT NULL CONSTRAINT [DF_OrderHistory_StoreID]  DEFAULT (0),
	[BatchNumber] [int] NOT NULL CONSTRAINT [DF_OrderHistory_BatchNumber]  DEFAULT (0),
	[Date] [datetime] NOT NULL CONSTRAINT [DF_OrderHistory_Date]  DEFAULT (getdate()),
	[OrderID] [int] NOT NULL CONSTRAINT [DF_OrderHistory_OrderID]  DEFAULT (0),
	[CashierID] [int] NOT NULL CONSTRAINT [DF_OrderHistory_CashierID]  DEFAULT (0),
	[DeltaDeposit] [money] NOT NULL CONSTRAINT [DF_OrderHistory_Amount]  DEFAULT (0),
	[TransactionNumber] [int] NOT NULL CONSTRAINT [DF_OrderHistory_TransactionNumber]  DEFAULT (0),
	[Comment] [nvarchar](30) NOT NULL CONSTRAINT [DF_OrderHistory_Comment]  DEFAULT (''),
	[DBTimeStamp] [timestamp] NULL,
	[NUSSkipPOUpdate] [bit] NOT NULL CONSTRAINT [DF_OrderHistory_NUSSkipPOUpdate]  DEFAULT ((0)),
 CONSTRAINT [PK_OrderHistory] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Payment]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BatchNumber] [int] NOT NULL CONSTRAINT [DF_Exchange_BatchNumber]  DEFAULT (0),
	[CashierID] [int] NOT NULL CONSTRAINT [DF_Exchange_CashierID]  DEFAULT (0),
	[StoreID] [int] NOT NULL CONSTRAINT [DF_Exchange_StoreID]  DEFAULT (0),
	[CustomerID] [int] NOT NULL CONSTRAINT [DF_Exchange_CustomerID]  DEFAULT (0),
	[Time] [datetime] NOT NULL CONSTRAINT [DF_Exchange_Time]  DEFAULT (getdate()),
	[Amount] [money] NOT NULL CONSTRAINT [DF_Exchange_Amount]  DEFAULT (0),
	[Comment] [nvarchar](50) NOT NULL CONSTRAINT [DF_Exchange_Comment]  DEFAULT (''),
	[DBTimeStamp] [timestamp] NULL,
	[NUSSkipUpdate] [bit] NOT NULL CONSTRAINT [DF_payment_NUSSkipUpdate]  DEFAULT ((0)),
	[NUSSkipPOUpdate] [bit] NOT NULL CONSTRAINT [DF_Payment_NUSSkipPOUpdate]  DEFAULT ((0)),
 CONSTRAINT [PK_Payment] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhysicalInventory]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhysicalInventory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [int] NOT NULL CONSTRAINT [DF_PhysicalInventory_StoreID]  DEFAULT (0),
	[OpenTime] [datetime] NULL,
	[CloseTime] [datetime] NULL,
	[Status] [int] NOT NULL CONSTRAINT [DF_PhysicalInventory_Status]  DEFAULT (0),
	[LastRefresh] [datetime] NULL,
	[Description] [nvarchar](100) NOT NULL CONSTRAINT [DF_PhysicalInventory_Description]  DEFAULT (''),
	[Code] [nvarchar](17) NOT NULL CONSTRAINT [DF_PhysicalInventory_Code]  DEFAULT (''),
	[DBTimeStamp] [timestamp] NULL,
	[NUSSkipUpdate] [bit] NOT NULL CONSTRAINT [DF_physicalinventory_NUSSkipUpdate]  DEFAULT ((0)),
 CONSTRAINT [PK_PhysicalInventory] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhysicalInventoryEntry]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhysicalInventoryEntry](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [int] NOT NULL CONSTRAINT [DF_PhysicalInventoryEntry_StoreID]  DEFAULT (0),
	[PhysicalInventoryID] [int] NOT NULL CONSTRAINT [DF_PhysicalInventoryEntry_PhysicalInventoryID]  DEFAULT (0),
	[ReasonCodeID] [int] NOT NULL CONSTRAINT [DF_PhysicalInventoryEntry_ReasonCodeID]  DEFAULT (0),
	[CountTime] [datetime] NULL,
	[ItemID] [int] NOT NULL CONSTRAINT [DF_PhysicalInventoryEntry_ItemID]  DEFAULT (0),
	[BinLocation] [nvarchar](100) NOT NULL CONSTRAINT [DF_PhysicalInventoryEntry_BinLocation]  DEFAULT (''),
	[Price] [money] NOT NULL CONSTRAINT [DF_PhysicalInventoryEntry_Price]  DEFAULT (0),
	[Cost] [money] NOT NULL CONSTRAINT [DF_PhysicalInventoryEntry_Cost]  DEFAULT (0),
	[QuantityCounted] [float] NOT NULL CONSTRAINT [DF_PhysicalInventoryEntry_QuantityCounted]  DEFAULT (0),
	[QuantitySold] [float] NOT NULL CONSTRAINT [DF_PhysicalInventoryEntry_QuantitySold]  DEFAULT (0),
	[QuantityReturned] [float] NOT NULL CONSTRAINT [DF_PhysicalInventoryEntry_QuantityReturned]  DEFAULT (0),
	[QuantityXferIn] [float] NOT NULL CONSTRAINT [DF_PhysicalInventoryEntry_QuantityXferIn]  DEFAULT (0),
	[QuantityXferOut] [float] NOT NULL CONSTRAINT [DF_PhysicalInventoryEntry_QuantityXferOut]  DEFAULT (0),
	[QuantityAdjusted] [float] NOT NULL CONSTRAINT [DF_PhysicalInventoryEntry_QuantityAdjusted]  DEFAULT (0),
	[QuantityToOffline] [float] NOT NULL CONSTRAINT [DF_PhysicalInventoryEntry_QuantityToOffline]  DEFAULT (0),
	[QuantityFromOffline] [float] NOT NULL CONSTRAINT [DF_PhysicalInventoryEntry_QuantityFromOffline]  DEFAULT (0),
	[QuantityRefreshed] [float] NOT NULL CONSTRAINT [DF_PhysicalInventoryEntry_Refreshed]  DEFAULT (0),
	[DBTimeStamp] [timestamp] NULL,
	[NUSSkipUpdate] [bit] NOT NULL CONSTRAINT [DF_physicalinventoryentry_NUSSkipUpdate]  DEFAULT ((0)),
 CONSTRAINT [PK_PhysicalInventoryEntry] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PoleDisplayMessage]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PoleDisplayMessage](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](25) NOT NULL CONSTRAINT [DF_PoleDisplayMessage_Description]  DEFAULT (''),
	[MessageLine1] [nvarchar](255) NOT NULL CONSTRAINT [DF_PoleDisplayMessage_MessageLine1]  DEFAULT (''),
	[EffectLine1] [smallint] NOT NULL CONSTRAINT [DF_PoleDisplayMessage_EffectLine1]  DEFAULT (0),
	[UpdateRateLine1] [smallint] NOT NULL CONSTRAINT [DF_PoleDisplayMessage_UpdateRateLine1]  DEFAULT (0),
	[DateAndTimeLine1] [bit] NOT NULL CONSTRAINT [DF_PoleDisplayMessage_DateAndTimeLine1]  DEFAULT (0),
	[ScrollChangeSizeLine1] [smallint] NOT NULL CONSTRAINT [DF_PoleDisplayMessage_ScrollChangeSizeLine1]  DEFAULT (0),
	[MessageLine2] [nvarchar](255) NOT NULL CONSTRAINT [DF_PoleDisplayMessage_MessageLine2]  DEFAULT (''),
	[EffectLine2] [smallint] NOT NULL CONSTRAINT [DF_PoleDisplayMessage_EffectLine2]  DEFAULT (0),
	[UpdateRateLine2] [smallint] NOT NULL CONSTRAINT [DF_PoleDisplayMessage_UpdateRateLine2]  DEFAULT (0),
	[DateAndTimeLine2] [bit] NOT NULL CONSTRAINT [DF_PoleDisplayMessage_DateAndTimeLine2]  DEFAULT (0),
	[ScrollChangeSizeLine2] [smallint] NOT NULL CONSTRAINT [DF_PoleDisplayMessage_ScrollChangeSizeLine2]  DEFAULT (0),
	[DBTimeStamp] [timestamp] NULL,
	[StoreID] [int] NOT NULL DEFAULT (0),
 CONSTRAINT [PK_PoleDisplayMessage] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PriceRounding]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PriceRounding](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HQID] [int] NOT NULL,
	[PriceFrom] [money] NOT NULL,
	[PriceTo] [money] NOT NULL,
	[UseMultipleOfRule] [bit] NOT NULL,
	[MultipleOf] [money] NOT NULL,
	[UseEndsInRule] [bit] NOT NULL,
	[EndsIn] [money] NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
 CONSTRAINT [PK_PriceRounding] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PurchaseOrder]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrder](
	[LastUpdated] [datetime] NOT NULL,
	[POTitle] [nvarchar](50) NOT NULL,
	[POType] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[WorksheetID] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PONumber] [nvarchar](20) NOT NULL,
	[Status] [smallint] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[To] [nvarchar](255) NOT NULL,
	[ShipTo] [nvarchar](255) NOT NULL,
	[Requisitioner] [nvarchar](20) NOT NULL,
	[ShipVia] [nvarchar](20) NOT NULL,
	[FOBPoint] [nvarchar](20) NOT NULL,
	[Terms] [nvarchar](20) NOT NULL,
	[TaxRate] [real] NOT NULL,
	[Shipping] [money] NOT NULL,
	[Freight] [nvarchar](20) NOT NULL,
	[RequiredDate] [datetime] NULL,
	[ConfirmingTo] [nvarchar](20) NOT NULL,
	[Remarks] [nvarchar](30) NOT NULL,
	[SupplierID] [int] NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[OtherStoreID] [int] NOT NULL,
	[CurrencyID] [int] NOT NULL,
	[ExchangeRate] [float] NOT NULL,
	[OtherPOID] [int] NOT NULL,
	[InventoryLocation] [int] NOT NULL,
	[IsPlaced] [bit] NOT NULL,
	[DatePlaced] [datetime] NULL,
	[BatchNumber] [int] NOT NULL,
	[NUSSkipUpdate] [bit] NOT NULL,
 CONSTRAINT [PK_PurchaseOrder] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PurchaseOrderEntry]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrderEntry](
	[ItemDescription] [nvarchar](30) NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[QuantityReceivedToDate] [float] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseOrderID] [int] NOT NULL,
	[QuantityOrdered] [float] NOT NULL,
	[QuantityReceived] [float] NOT NULL,
	[ItemID] [int] NOT NULL,
	[OrderNumber] [nvarchar](25) NULL,
	[Price] [money] NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[TaxRate] [float] NOT NULL,
	[InventoryOfflineID] [int] NOT NULL,
	[NUS_Source] [nvarchar](250) NULL,
	[NUSSkipUpdate] [bit] NOT NULL,
 CONSTRAINT [PK_PurchaseOrderEntry] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PurchaseOrderEntryDetail]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrderEntryDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [int] NOT NULL,
	[PurchaseOrderEntryID] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Status] [smallint] NOT NULL,
	[SerialID] [int] NOT NULL,
	[SerialNumber1] [nvarchar](20) NOT NULL,
	[SerialNumber2] [nvarchar](20) NOT NULL,
	[SerialNumber3] [nvarchar](20) NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[InventoryOfflineID] [int] NOT NULL,
 CONSTRAINT [PK_PurchaseOrderEntryDetail] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuantityDiscount]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuantityDiscount](
	[Description] [nvarchar](30) NOT NULL,
	[HQID] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DiscountOddItems] [bit] NOT NULL,
	[Quantity1] [float] NOT NULL,
	[Price1] [money] NOT NULL,
	[Price1A] [money] NOT NULL,
	[Price1B] [money] NOT NULL,
	[Price1C] [money] NOT NULL,
	[Quantity2] [float] NOT NULL,
	[Price2] [money] NOT NULL,
	[Price2A] [money] NOT NULL,
	[Price2B] [money] NOT NULL,
	[Price2C] [money] NOT NULL,
	[Quantity3] [float] NOT NULL,
	[Price3] [money] NOT NULL,
	[Price3A] [money] NOT NULL,
	[Price3B] [money] NOT NULL,
	[Price3C] [money] NOT NULL,
	[Quantity4] [float] NOT NULL,
	[Price4] [money] NOT NULL,
	[Price4A] [money] NOT NULL,
	[Price4B] [money] NOT NULL,
	[Price4C] [money] NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[Type] [int] NOT NULL,
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
	[NUSSkipUpdate] [bit] NOT NULL,
	[NUSSkipPOUpdate] [bit] NOT NULL,
 CONSTRAINT [PK_QuantityDiscount] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuoteTenderEntry]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuoteTenderEntry](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[TenderID] [int] NOT NULL,
	[CreditCardExpiration] [nvarchar](10) NOT NULL,
	[CreditCardNumber] [nvarchar](25) NOT NULL,
	[CreditCardApprovalCode] [nvarchar](20) NOT NULL,
	[Amount] [money] NOT NULL,
	[RoundingError] [money] NOT NULL,
	[AccountHolder] [nvarchar](40) NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
 CONSTRAINT [PK_QuoteTenderEntry] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ReasonCode]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReasonCode](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HQID] [int] NOT NULL CONSTRAINT [DF_ReasonCode_HQID]  DEFAULT (0),
	[Code] [nvarchar](25) NOT NULL CONSTRAINT [DF_ReasonCode_Code]  DEFAULT (''),
	[Description] [nvarchar](50) NOT NULL CONSTRAINT [DF_ReasonCode_Description]  DEFAULT (''),
	[DBTimeStamp] [timestamp] NULL,
	[Type] [int] NOT NULL CONSTRAINT [DF_ReasonCode_Type]  DEFAULT (0),
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[NUSSkipUpdate] [bit] NOT NULL CONSTRAINT [DF_reasoncode_NUSSkipUpdate]  DEFAULT ((0)),
	[NUSSkipPOUpdate] [bit] NOT NULL CONSTRAINT [DF_ReasonCode_NUSSkipPOUpdate]  DEFAULT ((0)),
 CONSTRAINT [PK_ReasonCode] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Receipt]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receipt](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL CONSTRAINT [DF_Receipt_Description]  DEFAULT (''),
	[Title] [nvarchar](38) NOT NULL CONSTRAINT [DF_Receipt_Title]  DEFAULT (''),
	[TemplateCancel] [ntext] NOT NULL CONSTRAINT [DF_Receipt_Template]  DEFAULT (''),
	[TemplateDrop] [ntext] NOT NULL CONSTRAINT [DF_Receipt_TemplateDrop]  DEFAULT (''),
	[TemplateLayaway] [ntext] NOT NULL CONSTRAINT [DF_Receipt_TemplateLayaway]  DEFAULT (''),
	[TemplatePayment] [ntext] NOT NULL CONSTRAINT [DF_Receipt_TemplatePayment]  DEFAULT (''),
	[TemplatePayout] [ntext] NOT NULL CONSTRAINT [DF_Receipt_TemplatePayout]  DEFAULT (''),
	[TemplateQuote] [ntext] NOT NULL CONSTRAINT [DF_Receipt_TemplateQuote]  DEFAULT (''),
	[TemplateSale] [ntext] NOT NULL CONSTRAINT [DF_Receipt_TemplateSale]  DEFAULT (''),
	[TemplateWorkOrder] [ntext] NOT NULL CONSTRAINT [DF_Receipt_TemplateWorkOrder]  DEFAULT (''),
	[TemplateReport] [ntext] NOT NULL CONSTRAINT [DF_Receipt_TemplateReport]  DEFAULT (''),
	[DBTimeStamp] [timestamp] NULL,
	[StoreID] [int] NOT NULL DEFAULT (0),
 CONSTRAINT [PK_Receipt] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RecordDeletedLog]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordDeletedLog](
	[TableName] [nvarchar](30) NOT NULL CONSTRAINT [DF_RecordDeletedLog_TableName]  DEFAULT (''),
	[IDFieldName] [nvarchar](30) NOT NULL CONSTRAINT [DF_RecordDeletedLog_IDFieldName]  DEFAULT (''),
	[RecordID] [int] NOT NULL CONSTRAINT [DF_RecordDeletedLog_RecordID]  DEFAULT (0),
	[WhenDeleted] [datetime] NOT NULL CONSTRAINT [DF_RecordDeletedLog_WhenDeleted]  DEFAULT (getdate()),
	[StoreID] [int] NOT NULL CONSTRAINT [DF_RecordDeletedLog_StoreID]  DEFAULT (0),
	[DBTimeStamp] [timestamp] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_TableName]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE CLUSTERED INDEX [IX_TableName] ON [dbo].[RecordDeletedLog]
(
	[TableName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Register]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Register](
	[Description] [nvarchar](30) NOT NULL CONSTRAINT [DF_Register_Description]  DEFAULT (''),
	[PoleDisplayEnabled] [bit] NOT NULL CONSTRAINT [DF_Register_PoleDisplayEnabled]  DEFAULT (0),
	[Receipt2ID] [int] NOT NULL CONSTRAINT [DF_Register_ReceiptID2]  DEFAULT (0),
	[ScaleEnabled] [bit] NOT NULL CONSTRAINT [DF_Register_ScaleEnabled]  DEFAULT (0),
	[ScaleTimeout] [float] NOT NULL CONSTRAINT [DF_Register_ScaleTimeout]  DEFAULT (''),
	[ScannerEnabled] [bit] NOT NULL CONSTRAINT [DF_Register_ScannerEnabled]  DEFAULT (0),
	[ZZBatchNumber] [int] NOT NULL CONSTRAINT [DF_Register_ZZBatchNumber]  DEFAULT (0),
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Number] [smallint] NOT NULL CONSTRAINT [DF_Register_Number]  DEFAULT (0),
	[CurrentBatchNumber] [int] NOT NULL CONSTRAINT [DF_Register_CurrentBatchNumber]  DEFAULT (0),
	[Receipt1ID] [int] NOT NULL CONSTRAINT [DF_Register_ReceiptID]  DEFAULT (0),
	[PoleDisplayMessageID] [int] NOT NULL CONSTRAINT [DF_Register_PoleDisplayMessageID]  DEFAULT (0),
	[Printer1Name] [nvarchar](255) NOT NULL CONSTRAINT [DF_Register_Printer1Name]  DEFAULT (''),
	[Printer1Options] [int] NOT NULL CONSTRAINT [DF_Register_Printer1Options]  DEFAULT (0),
	[Printer2Name] [nvarchar](255) NOT NULL CONSTRAINT [DF_Register_Printer2Name]  DEFAULT (''),
	[Printer2Options] [int] NOT NULL CONSTRAINT [DF_Register_Printer2Options]  DEFAULT (0),
	[ChannelID] [int] NOT NULL CONSTRAINT [DF_Register_ChannelID]  DEFAULT (0),
	[NetDisplayEnabled] [bit] NOT NULL CONSTRAINT [DF_Register_NetDisplayEnabled]  DEFAULT (0),
	[DBTimeStamp] [timestamp] NULL,
	[DefaultPriceLevel] [int] NOT NULL CONSTRAINT [DF_Register_DefaultPriceLevel]  DEFAULT (0),
	[PoleDisplayName] [nvarchar](255) NOT NULL CONSTRAINT [DF_Register_PoleDisplayName]  DEFAULT (''),
	[ScaleName] [nvarchar](255) NOT NULL CONSTRAINT [Df_Register_ScaleName]  DEFAULT (''),
	[ScannerName] [nvarchar](255) NOT NULL CONSTRAINT [Df_Register_ScannerName]  DEFAULT (''),
	[Printer1Type] [int] NOT NULL CONSTRAINT [Df_Register_Printer1Type]  DEFAULT (0),
	[Printer2Type] [int] NOT NULL CONSTRAINT [Df_Register_Printer2Type]  DEFAULT (0),
	[CashDrawer1Name] [nvarchar](255) NOT NULL CONSTRAINT [Df_Register_CasherDrawer1Name]  DEFAULT (''),
	[CashDrawer1Enabled] [bit] NOT NULL CONSTRAINT [Df_Register_CasherDrawer1Enabled]  DEFAULT (0),
	[CashDrawer1WaitForClose] [bit] NOT NULL CONSTRAINT [Df_Register_CasherDrawer1WaitForClose]  DEFAULT (0),
	[CashDrawer1OpenTimeout] [int] NOT NULL CONSTRAINT [Df_Register_CasherDrawer1OpenTimeout]  DEFAULT (0),
	[CashDrawer2Name] [nvarchar](255) NOT NULL CONSTRAINT [Df_Register_CasherDrawer2Name]  DEFAULT (''),
	[CashDrawer2Enabled] [bit] NOT NULL CONSTRAINT [Df_Register_CasherDrawer2Enabled]  DEFAULT (0),
	[CashDrawer2WaitForClose] [bit] NOT NULL CONSTRAINT [Df_Register_CasherDrawer2WaitForClose]  DEFAULT (0),
	[CashDrawer2OpenTimeout] [int] NOT NULL CONSTRAINT [Df_Register_CasherDrawer2OpenTimeout]  DEFAULT (0),
	[StoreID] [int] NOT NULL DEFAULT (0),
	[MICRName] [nvarchar](255) NOT NULL CONSTRAINT [Df_Register_MICRName]  DEFAULT (''),
	[MICREnabled] [bit] NOT NULL CONSTRAINT [Df_Register_MICREnabled]  DEFAULT (0),
	[MICRTimeout] [float] NOT NULL CONSTRAINT [Df_Register_MICRTimeout]  DEFAULT (0),
	[MSRName] [nvarchar](255) NOT NULL CONSTRAINT [Df_Register_MSRName]  DEFAULT (''),
	[MSREnabled] [bit] NOT NULL CONSTRAINT [Df_Register_MSREnabled]  DEFAULT (0),
	[SignatureCaptureName] [nvarchar](255) NOT NULL CONSTRAINT [Df_Register_SignatureCaptureName]  DEFAULT (''),
	[SignatureCaptureEnabled] [bit] NOT NULL CONSTRAINT [Df_Register_SignatureCaptureEnabled]  DEFAULT (0),
	[SignatureCaptureFormName] [nvarchar](255) NOT NULL CONSTRAINT [Df_Register_SignatureCaptureFormName]  DEFAULT (''),
	[TouchScreenEnabled] [bit] NOT NULL CONSTRAINT [Df_Register_TouchScreenEnabled]  DEFAULT (0),
	[KeyboardID] [int] NOT NULL CONSTRAINT [Df_Register_KeyboardID]  DEFAULT (0),
	[DefaultServiceID] [int] NOT NULL CONSTRAINT [DF_Register_DefaultServiceID]  DEFAULT (0),
	[PINPadEnabled] [bit] NOT NULL CONSTRAINT [DF_Register_PINPadEnabled]  DEFAULT (0),
	[PINPadName] [nvarchar](255) NOT NULL CONSTRAINT [DF_Register_PINPadName]  DEFAULT (''),
	[PINPadSystem] [varchar](25) NOT NULL CONSTRAINT [DF_Register_PINPadSystem]  DEFAULT ('DUKPT'),
	[TransactionHost] [int] NOT NULL CONSTRAINT [DF_TransactionHostID]  DEFAULT (1),
	[RealTimeSigCap] [bit] NOT NULL CONSTRAINT [DF_RealTimeSigCap]  DEFAULT (1),
	[NUSSkipUpdate] [bit] NOT NULL CONSTRAINT [DF_register_NUSSkipUpdate]  DEFAULT ((0)),
	[NUSSkipPOUpdate] [bit] NOT NULL CONSTRAINT [DF_Register_NUSSkipPOUpdate]  DEFAULT ((0)),
 CONSTRAINT [PK_Register] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Report]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ReportFilename] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](30) NOT NULL,
	[Settings] [ntext] NULL,
	[DBTimeStamp] [timestamp] NULL,
	[StoreID] [int] NOT NULL,
 CONSTRAINT [PK_Report] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalesRep]    Script Date: 12/11/2017 1:09:32 PM ******/
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
/****** Object:  Table [dbo].[Schedule]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HQID] [int] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[Increment] [int] NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
 CONSTRAINT [PK_Schedule] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ScheduleSegment]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScheduleSegment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HQID] [int] NOT NULL,
	[ScheduleID] [int] NOT NULL,
	[StartDay] [int] NOT NULL,
	[EndDay] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
 CONSTRAINT [PK_ScheduleSegment] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Security]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Security](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FormName] [nvarchar](30) NOT NULL CONSTRAINT [DF_Security_FormName]  DEFAULT (''),
	[ClassName] [nvarchar](30) NOT NULL CONSTRAINT [DF_Security_ClassName]  DEFAULT (''),
	[ControlType] [nvarchar](30) NOT NULL CONSTRAINT [DF_Security_ControlType]  DEFAULT (''),
	[ControlName] [nvarchar](30) NOT NULL CONSTRAINT [DF_Security_ControlName]  DEFAULT (''),
	[ControlIndex] [int] NOT NULL CONSTRAINT [DF_Security_ControlIndex]  DEFAULT (0),
	[ReadDisableCode] [int] NOT NULL CONSTRAINT [DF_Security_ReadDisableCode]  DEFAULT (0),
	[ChangeDisableCode] [int] NOT NULL CONSTRAINT [DF_Security_ChangeDisableCode]  DEFAULT (0),
	[ColumnTitle] [nvarchar](30) NOT NULL CONSTRAINT [DF_Security_ColumnTitle]  DEFAULT (''),
	[DBTimeStamp] [timestamp] NULL,
	[StoreID] [int] NOT NULL DEFAULT (0),
 CONSTRAINT [PK_Security] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Serial]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Serial](
	[HQID] [int] NOT NULL CONSTRAINT [DF_Serial_HQID]  DEFAULT (0),
	[LastUpdated] [datetime] NOT NULL CONSTRAINT [DF_Serial_LastUpdated]  DEFAULT (getdate()),
	[SerialNumber2] [nvarchar](20) NOT NULL CONSTRAINT [DF_Serial_SerialNumber2]  DEFAULT (''),
	[SerialNumber3] [nvarchar](20) NOT NULL CONSTRAINT [DF_Serial_SerialNumber3]  DEFAULT (''),
	[StoreID] [int] NOT NULL CONSTRAINT [DF_Serial_StoreID]  DEFAULT (0),
	[TransactionEntryID] [int] NOT NULL CONSTRAINT [DF_Serial_TransactionEntryID]  DEFAULT (0),
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ItemID] [int] NOT NULL CONSTRAINT [DF_Serial_ItemID]  DEFAULT (0),
	[SerialNumber] [nvarchar](20) NOT NULL CONSTRAINT [DF_Serial_SerialNumber]  DEFAULT (''),
	[DBTimeStamp] [timestamp] NULL,
	[Status] [int] NOT NULL CONSTRAINT [DF_Serial_Status]  DEFAULT (0),
	[NUSSkipUpdate] [bit] NOT NULL CONSTRAINT [DF_serial_NUSSkipUpdate]  DEFAULT ((0)),
	[NUSSkipPOUpdate] [bit] NOT NULL CONSTRAINT [DF_Serial_NUSSkipPOUpdate]  DEFAULT ((0)),
 CONSTRAINT [PK_Serial] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shipping]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipping](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
	[TransactionNumber] [int] NOT NULL,
	[OrderHistoryID] [int] NOT NULL,
	[Charge] [money] NOT NULL,
	[TrackingNumber] [nvarchar](255) NOT NULL,
	[Notes] [ntext] NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Company] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Address2] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[State] [nvarchar](20) NOT NULL,
	[Zip] [nvarchar](15) NOT NULL,
	[Country] [nvarchar](20) NOT NULL,
	[EmailAddress] [nvarchar](255) NOT NULL,
	[Status] [int] NOT NULL,
	[CODReturnTrackingNumber] [nvarchar](255) NOT NULL,
	[PackagingDate] [datetime] NULL,
	[NetShipCost] [money] NOT NULL,
	[CarrierName] [nvarchar](255) NOT NULL,
	[ServiceName] [nvarchar](255) NOT NULL,
	[TotalWeight] [float] NOT NULL,
	[DeclaredValue] [money] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateProcessed] [datetime] NULL,
	[PhoneNumber] [nvarchar](30) NOT NULL,
	[FaxNumber] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Shipping] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ShippingCarrier]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingCarrier](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[URL] [nvarchar](255) NOT NULL,
	[TrackingURL] [nvarchar](255) NOT NULL,
	[ShippingURL] [nvarchar](255) NOT NULL,
	[LastUpdated] [datetime] NULL,
	[DBTimeStamp] [timestamp] NULL,
	[HQID] [int] NOT NULL,
	[Code] [nvarchar](17) NOT NULL,
 CONSTRAINT [PK_ShippingCarrier] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ShippingService]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CarrierID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ChargeByWeight] [bit] NOT NULL,
	[Interpolate] [bit] NOT NULL,
	[Value1] [float] NOT NULL,
	[Charge1] [money] NOT NULL,
	[Value2] [float] NOT NULL,
	[Charge2] [money] NOT NULL,
	[Value3] [float] NOT NULL,
	[Charge3] [money] NOT NULL,
	[Value4] [float] NOT NULL,
	[Charge4] [money] NOT NULL,
	[Value5] [float] NOT NULL,
	[Charge5] [money] NOT NULL,
	[Value6] [float] NOT NULL,
	[Charge6] [money] NOT NULL,
	[Value7] [float] NOT NULL,
	[Charge7] [money] NOT NULL,
	[Value8] [float] NOT NULL,
	[Charge8] [money] NOT NULL,
	[Value9] [float] NOT NULL,
	[Charge9] [money] NOT NULL,
	[Value10] [float] NOT NULL,
	[Charge10] [money] NOT NULL,
	[Value11] [float] NOT NULL,
	[Charge11] [money] NOT NULL,
	[Value12] [float] NOT NULL,
	[Charge12] [money] NOT NULL,
	[Value13] [float] NOT NULL,
	[Charge13] [money] NOT NULL,
	[Value14] [float] NOT NULL,
	[Charge14] [money] NOT NULL,
	[Value15] [float] NOT NULL,
	[Charge15] [money] NOT NULL,
	[LastUpdated] [datetime] NULL,
	[DBTimeStamp] [timestamp] NULL,
	[HQID] [int] NOT NULL,
	[Code] [nvarchar](17) NOT NULL,
 CONSTRAINT [PK_ShippingService] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ShippingWebPair]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingWebPair](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CarrierID] [int] NOT NULL,
	[Variable] [nvarchar](255) NOT NULL,
	[Value] [nvarchar](255) NOT NULL,
	[LastUpdated] [datetime] NULL,
	[DBTimeStamp] [timestamp] NULL,
	[URL] [nvarchar](255) NOT NULL,
	[Direction] [int] NOT NULL,
 CONSTRAINT [PK_ShippingWebPair] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ShipTo]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShipTo](
	[Address] [nvarchar](50) NOT NULL,
	[Address2] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Company] [nvarchar](50) NOT NULL,
	[Country] [nvarchar](20) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[HQID] [int] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[State] [nvarchar](20) NOT NULL,
	[StoreID] [int] NOT NULL,
	[Zip] [nvarchar](15) NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[EmailAddress] [nvarchar](255) NOT NULL,
	[PhoneNumber] [nvarchar](30) NOT NULL,
	[FaxNumber] [nvarchar](30) NOT NULL,
	[NUSSkipUpdate] [bit] NOT NULL,
	[NUSSkipPOUpdate] [bit] NOT NULL,
 CONSTRAINT [PK_ShipTo] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SignatureCapture]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SignatureCapture](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [int] NOT NULL,
	[TenderEntryID] [int] NOT NULL,
	[ScaleWidth] [int] NOT NULL,
	[ScaleHeight] [int] NOT NULL,
	[Signature] [nvarchar](4000) NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
 CONSTRAINT [PK_SignatureCapture] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Store]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Substitute]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Substitute](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ItemID] [int] NOT NULL,
	[SubstituteItemID] [int] NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[NUSSkipPOUpdate] [bit] NOT NULL,
 CONSTRAINT [PK_Substitute] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[Country] [nvarchar](20) NOT NULL CONSTRAINT [DF_Supplier_Country]  DEFAULT (''),
	[HQID] [int] NOT NULL CONSTRAINT [DF_Supplier_HQID]  DEFAULT (0),
	[LastUpdated] [datetime] NOT NULL CONSTRAINT [DF_Supplier_LastUpdated]  DEFAULT (getdate()),
	[State] [nvarchar](20) NOT NULL CONSTRAINT [DF_Supplier_State]  DEFAULT (''),
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierName] [nvarchar](30) NOT NULL CONSTRAINT [DF_Supplier_SupplierName]  DEFAULT (''),
	[ContactName] [nvarchar](30) NOT NULL CONSTRAINT [DF_Supplier_ContactName]  DEFAULT (''),
	[Address1] [nvarchar](30) NOT NULL CONSTRAINT [DF_Supplier_Address1]  DEFAULT (''),
	[Address2] [nvarchar](30) NOT NULL CONSTRAINT [DF_Supplier_Address2]  DEFAULT (''),
	[City] [nvarchar](30) NOT NULL CONSTRAINT [DF_Supplier_City]  DEFAULT (''),
	[Zip] [nvarchar](20) NOT NULL CONSTRAINT [DF_Supplier_Zip]  DEFAULT (''),
	[EmailAddress] [nvarchar](255) NOT NULL CONSTRAINT [DF_Supplier_EmailAddress]  DEFAULT (''),
	[WebPageAddress] [nvarchar](255) NOT NULL CONSTRAINT [DF_Supplier_WebPageAddress]  DEFAULT (''),
	[Code] [nvarchar](17) NOT NULL CONSTRAINT [DF_Supplier_Code]  DEFAULT (''),
	[DBTimeStamp] [timestamp] NULL,
	[AccountNumber] [nvarchar](20) NOT NULL CONSTRAINT [DF_Supplier_AccountNumber]  DEFAULT (''),
	[TaxNumber] [nvarchar](20) NOT NULL CONSTRAINT [DF_Supplier_TaxNumber]  DEFAULT (''),
	[CurrencyID] [int] NOT NULL CONSTRAINT [DF_Supplier_CurrencyID]  DEFAULT (0),
	[PhoneNumber] [nvarchar](30) NOT NULL CONSTRAINT [Df_Supplier_PhoneNumber]  DEFAULT (''),
	[FaxNumber] [nvarchar](30) NOT NULL CONSTRAINT [Df_Supplier_FaxNumber]  DEFAULT (''),
	[CustomText1] [nvarchar](30) NOT NULL CONSTRAINT [Df_Supplier_CustomText1]  DEFAULT (''),
	[CustomText2] [nvarchar](30) NOT NULL CONSTRAINT [Df_Supplier_CustomText2]  DEFAULT (''),
	[CustomText3] [nvarchar](30) NOT NULL CONSTRAINT [Df_Supplier_CustomText3]  DEFAULT (''),
	[CustomText4] [nvarchar](30) NOT NULL CONSTRAINT [Df_Supplier_CustomText4]  DEFAULT (''),
	[CustomText5] [nvarchar](30) NOT NULL CONSTRAINT [Df_Supplier_CustomText5]  DEFAULT (''),
	[CustomNumber1] [float] NOT NULL CONSTRAINT [Df_Supplier_CustomNumber1]  DEFAULT (0),
	[CustomNumber2] [float] NOT NULL CONSTRAINT [Df_Supplier_CustomNumber2]  DEFAULT (0),
	[CustomNumber3] [float] NOT NULL CONSTRAINT [Df_Supplier_CustomNumber3]  DEFAULT (0),
	[CustomNumber4] [float] NOT NULL CONSTRAINT [Df_Supplier_CustomNumber4]  DEFAULT (0),
	[CustomNumber5] [float] NOT NULL CONSTRAINT [Df_Supplier_CustomNumber5]  DEFAULT (0),
	[CustomDate1] [datetime] NULL,
	[CustomDate2] [datetime] NULL,
	[CustomDate3] [datetime] NULL,
	[CustomDate4] [datetime] NULL,
	[CustomDate5] [datetime] NULL,
	[Notes] [ntext] NOT NULL CONSTRAINT [Df_Supplier_Notes]  DEFAULT (''),
	[Terms] [nvarchar](50) NOT NULL CONSTRAINT [DF_Supplier_Terms]  DEFAULT (''),
	[NUSSkipUpdate] [bit] NOT NULL CONSTRAINT [DF_supplier_NUSSkipUpdate]  DEFAULT ((0)),
	[NUSSkipPOUpdate] [bit] NOT NULL CONSTRAINT [DF_Supplier_NUSSkipPOUpdate]  DEFAULT ((0)),
 CONSTRAINT [PK_Supplier] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SupplierList]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplierList](
	[MinimumOrder] [float] NOT NULL CONSTRAINT [DF_SupplierList_MinimumOrder]  DEFAULT (0),
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ItemID] [int] NOT NULL CONSTRAINT [DF_SupplierList_ItemID]  DEFAULT (0),
	[SupplierID] [int] NOT NULL CONSTRAINT [DF_SupplierList_SupplierID]  DEFAULT (0),
	[Cost] [money] NOT NULL CONSTRAINT [DF_SupplierList_Cost]  DEFAULT (0),
	[ReorderNumber] [nvarchar](25) NOT NULL CONSTRAINT [DF_SupplierList_ReorderNumber]  DEFAULT (''),
	[MasterPackQuantity] [int] NOT NULL CONSTRAINT [DF_SupplierList_MasterPackQuantity]  DEFAULT (1),
	[DBTimeStamp] [timestamp] NULL,
	[TaxRate] [float] NOT NULL CONSTRAINT [DF_SupplierList_TaxRate]  DEFAULT (0),
	[NUSSkipUpdate] [bit] NOT NULL CONSTRAINT [DF_supplierlist_NUSSkipUpdate]  DEFAULT ((0)),
	[NUSSkipPOUpdate] [bit] NOT NULL CONSTRAINT [DF_SupplierList_NUSSkipPOUpdate]  DEFAULT ((0)),
 CONSTRAINT [PK_SupplierList] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tax]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tax](
	[FixedAmount] [money] NOT NULL CONSTRAINT [DF_Tax_FixedAmount]  DEFAULT (0),
	[HQID] [int] NOT NULL CONSTRAINT [DF_Tax_HQID]  DEFAULT (0),
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](25) NOT NULL CONSTRAINT [DF_Tax_Description]  DEFAULT (''),
	[Percentage] [real] NOT NULL CONSTRAINT [DF_Tax_Percentage]  DEFAULT (0),
	[UsePartialDollar] [bit] NOT NULL CONSTRAINT [DF_Tax_UsePartialDollar]  DEFAULT (0),
	[ItemMaximum] [money] NOT NULL CONSTRAINT [DF_Tax_ItemMaximum]  DEFAULT (0),
	[IncludePreviousTax] [bit] NOT NULL CONSTRAINT [DF_Tax_IncludePreviousTax]  DEFAULT (0),
	[Bracket00] [money] NOT NULL CONSTRAINT [DF_Tax_Bracket00]  DEFAULT (0),
	[Bracket01] [money] NOT NULL CONSTRAINT [DF_Tax_Bracket01]  DEFAULT (0),
	[Bracket02] [money] NOT NULL CONSTRAINT [DF_Tax_Bracket02]  DEFAULT (0),
	[Bracket03] [money] NOT NULL CONSTRAINT [DF_Tax_Bracket03]  DEFAULT (0),
	[Bracket04] [money] NOT NULL CONSTRAINT [DF_Tax_Bracket04]  DEFAULT (0),
	[Bracket05] [money] NOT NULL CONSTRAINT [DF_Tax_Bracket05]  DEFAULT (0),
	[Bracket06] [money] NOT NULL CONSTRAINT [DF_Tax_Bracket06]  DEFAULT (0),
	[Bracket07] [money] NOT NULL CONSTRAINT [DF_Tax_Bracket07]  DEFAULT (0),
	[Bracket08] [money] NOT NULL CONSTRAINT [DF_Tax_Bracket08]  DEFAULT (0),
	[Bracket09] [money] NOT NULL CONSTRAINT [DF_Tax_Bracket09]  DEFAULT (0),
	[Bracket10] [money] NOT NULL CONSTRAINT [DF_Tax_Bracket10]  DEFAULT (0),
	[Code] [nvarchar](17) NOT NULL CONSTRAINT [DF_Tax_Code]  DEFAULT (''),
	[DBTimeStamp] [timestamp] NULL,
	[ItemMinimum] [money] NOT NULL CONSTRAINT [Df_Tax_ItemMinimum]  DEFAULT (0),
	[ApplyOverMinimum] [bit] NOT NULL CONSTRAINT [Df_Tax_ApplyOverMinimum]  DEFAULT (0),
	[Bracket11] [money] NOT NULL CONSTRAINT [DF_Tax_Bracket11]  DEFAULT (0),
	[Bracket12] [money] NOT NULL CONSTRAINT [DF_Tax_Bracket12]  DEFAULT (0),
	[Bracket13] [money] NOT NULL CONSTRAINT [DF_Tax_Bracket13]  DEFAULT (0),
	[Bracket14] [money] NOT NULL CONSTRAINT [DF_Tax_Bracket14]  DEFAULT (0),
	[Bracket15] [money] NOT NULL CONSTRAINT [DF_Tax_Bracket15]  DEFAULT (0),
	[Bracket16] [money] NOT NULL CONSTRAINT [DF_Tax_Bracket16]  DEFAULT (0),
	[Bracket17] [money] NOT NULL CONSTRAINT [DF_Tax_Bracket17]  DEFAULT (0),
	[Bracket18] [money] NOT NULL CONSTRAINT [DF_Tax_Bracket18]  DEFAULT (0),
	[Bracket19] [money] NOT NULL CONSTRAINT [DF_Tax_Bracket19]  DEFAULT (0),
	[Bracket20] [money] NOT NULL CONSTRAINT [DF_Tax_Bracket20]  DEFAULT (0),
	[Bracket21] [money] NOT NULL CONSTRAINT [DF_Tax_Bracket21]  DEFAULT (0),
	[Bracket22] [money] NOT NULL CONSTRAINT [DF_Tax_Bracket22]  DEFAULT (0),
	[Bracket23] [money] NOT NULL CONSTRAINT [DF_Tax_Bracket23]  DEFAULT (0),
	[Bracket24] [money] NOT NULL CONSTRAINT [DF_Tax_Bracket24]  DEFAULT (0),
	[Bracket25] [money] NOT NULL CONSTRAINT [DF_Tax_Bracket25]  DEFAULT (0),
	[Bracket26] [money] NOT NULL CONSTRAINT [DF_Tax_Bracket26]  DEFAULT (0),
	[Bracket27] [money] NOT NULL CONSTRAINT [DF_Tax_Bracket27]  DEFAULT (0),
	[Bracket28] [money] NOT NULL CONSTRAINT [DF_Tax_Bracket28]  DEFAULT (0),
	[Bracket29] [money] NOT NULL CONSTRAINT [DF_Tax_Bracket29]  DEFAULT (0),
	[Bracket30] [money] NOT NULL CONSTRAINT [DF_Tax_Bracket30]  DEFAULT (0),
	[BracketValue01] [money] NOT NULL CONSTRAINT [DF_Tax_BracketValue01]  DEFAULT (0),
	[BracketValue02] [money] NOT NULL CONSTRAINT [DF_Tax_BracketValue02]  DEFAULT (0),
	[BracketValue03] [money] NOT NULL CONSTRAINT [DF_Tax_BracketValue03]  DEFAULT (0),
	[BracketValue04] [money] NOT NULL CONSTRAINT [DF_Tax_BracketValue04]  DEFAULT (0),
	[BracketValue05] [money] NOT NULL CONSTRAINT [DF_Tax_BracketValue05]  DEFAULT (0),
	[BracketValue06] [money] NOT NULL CONSTRAINT [DF_Tax_BracketValue06]  DEFAULT (0),
	[BracketValue07] [money] NOT NULL CONSTRAINT [DF_Tax_BracketValue07]  DEFAULT (0),
	[BracketValue08] [money] NOT NULL CONSTRAINT [DF_Tax_BracketValue08]  DEFAULT (0),
	[BracketValue09] [money] NOT NULL CONSTRAINT [DF_Tax_BracketValue09]  DEFAULT (0),
	[BracketValue10] [money] NOT NULL CONSTRAINT [DF_Tax_BracketValue10]  DEFAULT (0),
	[BracketValue11] [money] NOT NULL CONSTRAINT [DF_Tax_BracketValue11]  DEFAULT (0),
	[BracketValue12] [money] NOT NULL CONSTRAINT [DF_Tax_BracketValue12]  DEFAULT (0),
	[BracketValue13] [money] NOT NULL CONSTRAINT [DF_Tax_BracketValue13]  DEFAULT (0),
	[BracketValue14] [money] NOT NULL CONSTRAINT [DF_Tax_BracketValue14]  DEFAULT (0),
	[BracketValue15] [money] NOT NULL CONSTRAINT [DF_Tax_BracketValue15]  DEFAULT (0),
	[BracketValue16] [money] NOT NULL CONSTRAINT [DF_Tax_BracketValue16]  DEFAULT (0),
	[BracketValue17] [money] NOT NULL CONSTRAINT [DF_Tax_BracketValue17]  DEFAULT (0),
	[BracketValue18] [money] NOT NULL CONSTRAINT [DF_Tax_BracketValue18]  DEFAULT (0),
	[BracketValue19] [money] NOT NULL CONSTRAINT [DF_Tax_BracketValue19]  DEFAULT (0),
	[BracketValue20] [money] NOT NULL CONSTRAINT [DF_Tax_BracketValue20]  DEFAULT (0),
	[BracketValue21] [money] NOT NULL CONSTRAINT [DF_Tax_BracketValue21]  DEFAULT (0),
	[BracketValue22] [money] NOT NULL CONSTRAINT [DF_Tax_BracketValue22]  DEFAULT (0),
	[BracketValue23] [money] NOT NULL CONSTRAINT [DF_Tax_BracketValue23]  DEFAULT (0),
	[BracketValue24] [money] NOT NULL CONSTRAINT [DF_Tax_BracketValue24]  DEFAULT (0),
	[BracketValue25] [money] NOT NULL CONSTRAINT [DF_Tax_BracketValue25]  DEFAULT (0),
	[BracketValue26] [money] NOT NULL CONSTRAINT [DF_Tax_BracketValue26]  DEFAULT (0),
	[BracketValue27] [money] NOT NULL CONSTRAINT [DF_Tax_BracketValue27]  DEFAULT (0),
	[BracketValue28] [money] NOT NULL CONSTRAINT [DF_Tax_BracketValue28]  DEFAULT (0),
	[BracketValue29] [money] NOT NULL CONSTRAINT [DF_Tax_BracketValue29]  DEFAULT (0),
	[BracketValue30] [money] NOT NULL CONSTRAINT [DF_Tax_BracketValue30]  DEFAULT (0),
	[NUSSkipUpdate] [bit] NOT NULL CONSTRAINT [DF_tax_NUSSkipUpdate]  DEFAULT ((0)),
	[NUSSkipPOUpdate] [bit] NOT NULL CONSTRAINT [DF_Tax_NUSSkipPOUpdate]  DEFAULT ((0)),
 CONSTRAINT [PK_Tax] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaxEntry]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaxEntry](
	[StoreID] [int] NOT NULL CONSTRAINT [DF_TaxEntry_StoreID]  DEFAULT (0),
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TaxID] [int] NOT NULL CONSTRAINT [DF_TaxEntry_TaxID]  DEFAULT (0),
	[TransactionNumber] [int] NOT NULL CONSTRAINT [DF_TaxEntry_TransactionID]  DEFAULT (0),
	[Tax] [money] NOT NULL CONSTRAINT [DF_TaxEntry_Amount]  DEFAULT (0),
	[TaxableAmount] [money] NOT NULL CONSTRAINT [DF_TaxEntry_TAxableAmount]  DEFAULT (0),
	[DBTimeStamp] [timestamp] NULL,
	[TransactionEntryID] [int] NOT NULL CONSTRAINT [Df_TaxEntry_TransactionEntryID]  DEFAULT (0),
	[NUSSkipUpdate] [bit] NOT NULL CONSTRAINT [DF_taxentry_NUSSkipUpdate]  DEFAULT ((0)),
 CONSTRAINT [PK_TaxEntry] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaxTotals]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaxTotals](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL CONSTRAINT [DF_TaxTotals_Date]  DEFAULT (getdate()),
	[StoreID] [int] NOT NULL CONSTRAINT [DF_TaxTotals_StoreID]  DEFAULT (0),
	[BatchNumber] [int] NOT NULL CONSTRAINT [DF_TaxTotals_BatchNumber]  DEFAULT (0),
	[TaxID] [int] NOT NULL CONSTRAINT [DF_TaxTotals_TaxID]  DEFAULT (0),
	[Total] [money] NOT NULL CONSTRAINT [DF_TaxTotals_Total]  DEFAULT (0),
	[DBTimeStamp] [timestamp] NULL,
	[NUSSkipUpdate] [bit] NOT NULL CONSTRAINT [DF_taxtotals_NUSSkipUpdate]  DEFAULT ((0)),
 CONSTRAINT [PK_TaxTotals] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tender]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tender](
	[HQID] [int] NOT NULL CONSTRAINT [DF_Tender_HQID]  DEFAULT (0),
	[PreventOverTendering] [bit] NOT NULL CONSTRAINT [DF_Tender_PreventOverTendering]  DEFAULT (0),
	[VerificationType] [int] NOT NULL CONSTRAINT [DF_Tender_VerificationType]  DEFAULT (0),
	[VerifyViaEDC] [bit] NOT NULL CONSTRAINT [DF_Tender_VerifyViaEDC]  DEFAULT (0),
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](25) NOT NULL CONSTRAINT [DF_Tender_Description]  DEFAULT (''),
	[AdditionalDetailType] [smallint] NOT NULL CONSTRAINT [DF_Tender_AdditionalDetailType]  DEFAULT (1),
	[PrinterValidation] [bit] NOT NULL CONSTRAINT [DF_Tender_PrinterValidation]  DEFAULT (0),
	[ValidationLine1] [nvarchar](20) NOT NULL CONSTRAINT [DF_Tender_ValidationLine1]  DEFAULT (''),
	[ValidationLine2] [nvarchar](20) NOT NULL CONSTRAINT [DF_Tender_ValidationLine2]  DEFAULT (''),
	[ValidationLine3] [nvarchar](20) NOT NULL CONSTRAINT [DF_Tender_ValidationLine3]  DEFAULT (''),
	[GLAccount] [nvarchar](20) NOT NULL CONSTRAINT [DF_Tender_GLAccount]  DEFAULT (''),
	[ScanCode] [smallint] NOT NULL CONSTRAINT [DF_Tender_ScanCode]  DEFAULT (0),
	[RoundToValue] [money] NOT NULL CONSTRAINT [DF_Tender_RoundToValue]  DEFAULT (0),
	[Code] [nvarchar](17) NOT NULL CONSTRAINT [DF_Tender_Code]  DEFAULT (''),
	[MaximumAmount] [money] NOT NULL CONSTRAINT [DF_Tender_MaximumAmount]  DEFAULT (0),
	[DBTimeStamp] [timestamp] NULL,
	[DoNotPopCashDrawer] [bit] NOT NULL CONSTRAINT [DF_Tender_DoNotPopCashDrawer]  DEFAULT (0),
	[CurrencyID] [int] NOT NULL CONSTRAINT [DF_Tender_CurrencyID]  DEFAULT (0),
	[DisplayOrder] [int] NOT NULL CONSTRAINT [DF_Tender_DisplayOrder]  DEFAULT (0),
	[ValidationMask] [nvarchar](25) NOT NULL CONSTRAINT [DF_Tender_ValidationMask]  DEFAULT (''),
	[SignatureRequired] [bit] NOT NULL CONSTRAINT [Df_Tender_SignatureRequired]  DEFAULT (0),
	[AllowMultipleEntries] [bit] NOT NULL CONSTRAINT [Df_Tender_AllowMultipleEntries]  DEFAULT (0),
	[DebitSurcharge] [money] NOT NULL CONSTRAINT [DF_Tender_DebitSurcharge]  DEFAULT (0),
	[SupportCashBack] [bit] NOT NULL CONSTRAINT [DF_Tender_SupportCashBack]  DEFAULT (0),
	[CashBackLimit] [money] NOT NULL CONSTRAINT [DF_Tender_CashBackLimit]  DEFAULT (0),
	[CashBackFee] [money] NOT NULL CONSTRAINT [DF_Tender_CashBackFee]  DEFAULT (0),
	[NUSSkipUpdate] [bit] NOT NULL CONSTRAINT [DF_tender_NUSSkipUpdate]  DEFAULT ((0)),
	[NUSSkipPOUpdate] [bit] NOT NULL CONSTRAINT [DF_Tender_NUSSkipPOUpdate]  DEFAULT ((0)),
 CONSTRAINT [PK_Tender] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TenderDenominations]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TenderDenominations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenderID] [int] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[Value] [money] NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
 CONSTRAINT [PK_TenderDenominations] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TenderEntry]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TenderEntry](
	[BatchNumber] [int] NOT NULL CONSTRAINT [DF_TenderEntry_BatchNumber]  DEFAULT (0),
	[CreditCardExpiration] [nvarchar](10) NOT NULL CONSTRAINT [DF_TenderEntry_CreditCardExpiration]  DEFAULT (''),
	[OrderHistoryID] [int] NOT NULL CONSTRAINT [DF_TenderEntry_LayawayID]  DEFAULT (0),
	[DropPayoutID] [int] NOT NULL CONSTRAINT [DF_TenderEntry_DropPayoutID]  DEFAULT (0),
	[StoreID] [int] NOT NULL CONSTRAINT [DF_TenderEntry_StoreID]  DEFAULT (0),
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TransactionNumber] [int] NOT NULL CONSTRAINT [DF_TenderEntry_TransactionID]  DEFAULT (0),
	[TenderID] [int] NOT NULL CONSTRAINT [DF_TenderEntry_TenderID]  DEFAULT (0),
	[PaymentID] [int] NOT NULL CONSTRAINT [DF_TenderEntry_ExchangeID]  DEFAULT (0),
	[Description] [nvarchar](30) NOT NULL CONSTRAINT [DF_TenderEntry_Description]  DEFAULT (''),
	[CreditCardNumber] [nvarchar](25) NOT NULL CONSTRAINT [DF_TenderEntry_CreditCardNumber]  DEFAULT (''),
	[CreditCardApprovalCode] [nvarchar](20) NOT NULL CONSTRAINT [DF_TenderEntry_CreditCardApprovalCode]  DEFAULT (''),
	[Amount] [money] NOT NULL CONSTRAINT [DF_TenderEntry_Amount]  DEFAULT (0),
	[AccountHolder] [nvarchar](40) NOT NULL CONSTRAINT [DF_TenderEntry_AccountHolder]  DEFAULT (''),
	[DBTimeStamp] [timestamp] NULL,
	[RoundingError] [money] NOT NULL CONSTRAINT [DF_TenderEntry_RoundingError]  DEFAULT (0),
	[AmountForeign] [money] NOT NULL CONSTRAINT [DF_TenderEntry_AmountForeign]  DEFAULT (0),
	[BankNumber] [nvarchar](25) NOT NULL CONSTRAINT [Df_TenderEntry_BankNumber]  DEFAULT (''),
	[SerialNumber] [nvarchar](25) NOT NULL CONSTRAINT [Df_TenderEntry_SerialNumber]  DEFAULT (''),
	[State] [nvarchar](10) NOT NULL CONSTRAINT [Df_TenderEntry_State]  DEFAULT (''),
	[License] [nvarchar](25) NOT NULL CONSTRAINT [Df_TenderEntry_License]  DEFAULT (''),
	[BirthDate] [datetime] NULL,
	[TransitNumber] [nvarchar](25) NOT NULL CONSTRAINT [Df_TenderEntry_TransitNumber]  DEFAULT (''),
	[VisaNetAuthorizationID] [int] NOT NULL CONSTRAINT [Df_TenderEntry_VisaNetAuthorizationID]  DEFAULT (0),
	[DebitSurcharge] [money] NOT NULL CONSTRAINT [DF_TenderEntry_DebitSurcharge]  DEFAULT (0),
	[CashBackSurcharge] [money] NOT NULL CONSTRAINT [DF_TenderEntry_CashBackSurcharge]  DEFAULT (0),
	[NUSSkipUpdate] [bit] NOT NULL CONSTRAINT [DF_tenderentry_NUSSkipUpdate]  DEFAULT ((0)),
	[NUSSkipPOUpdate] [bit] NOT NULL CONSTRAINT [DF_TenderEntry_NUSSkipPOUpdate]  DEFAULT ((0)),
 CONSTRAINT [PK_TenderEntry] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TenderTotals]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TenderTotals](
	[StoreID] [int] NOT NULL CONSTRAINT [DF_TenderTotals_StoreID]  DEFAULT (0),
	[BatchNumber] [int] NOT NULL CONSTRAINT [DF_TenderTotals_BatchNumber]  DEFAULT (0),
	[TenderID] [int] NOT NULL CONSTRAINT [DF_TenderTotals_TenderID]  DEFAULT (0),
	[Open] [money] NOT NULL CONSTRAINT [DF_TenderTotals_Open]  DEFAULT (0),
	[Shift] [money] NOT NULL CONSTRAINT [DF_TenderTotals_Shift]  DEFAULT (0),
	[Close] [money] NOT NULL CONSTRAINT [DF_TenderTotals_Close]  DEFAULT (0),
	[Count] [int] NOT NULL CONSTRAINT [DF_TenderTotals_Count]  DEFAULT (0),
	[DBTimeStamp] [timestamp] NULL,
	[OpenForeign] [money] NOT NULL CONSTRAINT [DF_TenderTotals_OpenForeign]  DEFAULT (0),
	[CloseForeign] [money] NOT NULL CONSTRAINT [DF_TenderTotals_CloseForeign]  DEFAULT (0),
	[ShiftForeign] [money] NOT NULL CONSTRAINT [DF_TenderTotals_ShiftForeign]  DEFAULT (0),
	[ShiftRoundingError] [money] NOT NULL CONSTRAINT [DF_TenderTotals_ShiftRoundingError]  DEFAULT (0),
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NUSSkipUpdate] [bit] NOT NULL CONSTRAINT [DF_tendertotals_NUSSkipUpdate]  DEFAULT ((0)),
	[NUSSkipPOUpdate] [bit] NOT NULL CONSTRAINT [DF_TenderTotals_NUSSkipPOUpdate]  DEFAULT ((0))
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TimeCard]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeCard](
	[StoreID] [int] NOT NULL CONSTRAINT [DF_TimeCard_StoreID]  DEFAULT (0),
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CashierID] [int] NOT NULL CONSTRAINT [DF_TimeCard_CashierID]  DEFAULT (0),
	[RegisterID] [int] NOT NULL CONSTRAINT [DF_TimeCard_RegisterID]  DEFAULT (0),
	[TimeIn] [datetime] NOT NULL CONSTRAINT [DF_TimeCard_TimeIn]  DEFAULT (''),
	[TimeOut] [datetime] NOT NULL CONSTRAINT [DF_TimeCard_TimeOut]  DEFAULT (''),
	[Hours] [real] NOT NULL CONSTRAINT [DF_TimeCard_Hours]  DEFAULT (0),
	[DBTimeStamp] [timestamp] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TimeClock]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeClock](
	[StoreID] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CashierID] [int] NOT NULL,
	[TimeIn] [datetime] NOT NULL,
	[TimeOut] [datetime] NULL,
	[BatchNumber] [int] NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
 CONSTRAINT [PK_TimeClock] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TimeStampLog]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TimeStampLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServerTime] [datetime] NOT NULL DEFAULT (getdate()),
	[ServerTimeStamp] [varbinary](8) NOT NULL DEFAULT (@@dbts),
	[DBTimeStamp] [timestamp] NULL,
	[StoreID] [int] NOT NULL CONSTRAINT [DF_TimeStampLog_StoreID]  DEFAULT (0)
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [IX_ServerTime]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE CLUSTERED INDEX [IX_ServerTime] ON [dbo].[TimeStampLog]
(
	[ServerTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TouchScreenKeyboard]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TouchScreenKeyboard](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[LastUpdated] [datetime] NULL,
	[DBTimeStamp] [timestamp] NULL,
 CONSTRAINT [PK_TouchScreenKeyboard] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TouchScreenKeyboardEntry]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TouchScreenKeyboardEntry](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TouchScreenKeyboardID] [int] NOT NULL,
	[OrderPosition] [int] NOT NULL,
	[KeyCode] [int] NOT NULL,
	[Caption] [nvarchar](100) NOT NULL,
	[Color] [int] NOT NULL,
	[ColorDown] [int] NOT NULL,
	[Picture] [image] NULL,
	[LastUpdated] [datetime] NULL,
	[DBTimeStamp] [timestamp] NULL,
	[Style] [int] NOT NULL CONSTRAINT [Df_TouchscreenKeyboardEntry_Style]  DEFAULT (0),
 CONSTRAINT [PK_TouchScreenKeyboardEntry] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Transaction]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction](
	[ShipToID] [int] NOT NULL CONSTRAINT [DF_Transaction_ShipToID]  DEFAULT (0),
	[StoreID] [int] NOT NULL CONSTRAINT [DF_Transaction_StoreID]  DEFAULT (0),
	[TransactionNumber] [int] IDENTITY(1,1) NOT NULL,
	[BatchNumber] [int] NOT NULL CONSTRAINT [DF_Transaction_BatchNumber]  DEFAULT (0),
	[Time] [datetime] NOT NULL CONSTRAINT [DF_Transaction_Time]  DEFAULT (getdate()),
	[CustomerID] [int] NOT NULL CONSTRAINT [DF_Transaction_CustomerID]  DEFAULT (0),
	[CashierID] [int] NOT NULL CONSTRAINT [DF_Transaction_CashierID]  DEFAULT (0),
	[Total] [money] NOT NULL CONSTRAINT [DF_Transaction_SubTotal]  DEFAULT (0),
	[SalesTax] [money] NOT NULL CONSTRAINT [DF_Transaction_SalesTax]  DEFAULT (0),
	[Comment] [nvarchar](255) NOT NULL CONSTRAINT [DF_Transaction_Comment]  DEFAULT (''),
	[ReferenceNumber] [nvarchar](50) NOT NULL CONSTRAINT [DF_Transaction_ReferenceNumber]  DEFAULT (''),
	[DBTimeStamp] [timestamp] NULL,
	[Status] [int] NOT NULL DEFAULT (0),
	[ExchangeID] [int] NOT NULL CONSTRAINT [Df_Transaction_ExchangeID]  DEFAULT (0),
	[ChannelType] [int] NOT NULL CONSTRAINT [Df_Transaction_ChannelType]  DEFAULT (0),
	[RecallID] [int] NOT NULL CONSTRAINT [DF_Transaction_RecallID]  DEFAULT (0),
	[RecallType] [int] NOT NULL CONSTRAINT [DF_Transaction_RecallType]  DEFAULT (0),
	[NUSSkipUpdate] [bit] NOT NULL CONSTRAINT [DF_transaction_NUSSkipUpdate]  DEFAULT ((0)),
	[NUSSkipPOUpdate] [bit] NOT NULL CONSTRAINT [DF_Transaction_NUSSkipPOUpdate]  DEFAULT ((0)),
 CONSTRAINT [PK_Transaction] PRIMARY KEY NONCLUSTERED 
(
	[TransactionNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TransactionEntry]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionEntry](
	[Commission] [money] NOT NULL CONSTRAINT [DF_TransactionEntry_Commission]  DEFAULT (0),
	[Cost] [money] NOT NULL CONSTRAINT [DF_TransactionEntry_Cost]  DEFAULT (0),
	[FullPrice] [money] NOT NULL CONSTRAINT [DF_TransactionEntry_FullPrice]  DEFAULT (0),
	[StoreID] [int] NOT NULL CONSTRAINT [DF_TransactionEntry_StoreID]  DEFAULT (0),
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TransactionNumber] [int] NOT NULL CONSTRAINT [DF_TransactionEntry_TransactionNumber]  DEFAULT (0),
	[ItemID] [int] NOT NULL CONSTRAINT [DF_TransactionEntry_ItemID]  DEFAULT (0),
	[Price] [money] NOT NULL CONSTRAINT [DF_TransactionEntry_Price]  DEFAULT (0),
	[PriceSource] [smallint] NOT NULL CONSTRAINT [DF_TransactionEntry_PriceSource]  DEFAULT (0),
	[Quantity] [float] NOT NULL CONSTRAINT [DF_TransactionEntry_Quantity]  DEFAULT (0),
	[SalesRepID] [int] NOT NULL CONSTRAINT [DF_TransactionEntry_SalesRepID]  DEFAULT (0),
	[Taxable] [bit] NOT NULL CONSTRAINT [DF_TransactionEntry_Taxable]  DEFAULT (0),
	[DetailID] [int] NOT NULL CONSTRAINT [DF_TransactionEntry_DetailID]  DEFAULT (0),
	[Comment] [nvarchar](255) NOT NULL CONSTRAINT [DF_TransactionEntry_Comment]  DEFAULT (''),
	[DBTimeStamp] [timestamp] NULL,
	[DiscountReasonCodeID] [int] NOT NULL CONSTRAINT [DF_TransactionEntry_DiscountReasonCodeID]  DEFAULT (0),
	[ReturnReasonCodeID] [int] NOT NULL CONSTRAINT [DF_TransactionEntry_ReturnReasonCodeID]  DEFAULT (0),
	[TaxChangeReasonCodeID] [int] NOT NULL CONSTRAINT [DF_TransactionEntry_TaxChangeReasonCodeID]  DEFAULT (0),
	[SalesTax] [money] NOT NULL CONSTRAINT [Df_TransactionEntry_SalesTax]  DEFAULT (0),
	[QuantityDiscountID] [int] NOT NULL CONSTRAINT [DF_TransactionEntry_QuantityDiscountID]  DEFAULT (0),
	[NUSSkipUpdate] [bit] NOT NULL CONSTRAINT [DF_transactionentry_NUSSkipUpdate]  DEFAULT ((0)),
	[NUSSkipPOUpdate] [bit] NOT NULL CONSTRAINT [DF_TransactionEntry_NUSSkipPOUpdate]  DEFAULT ((0)),
 CONSTRAINT [PK_TransactionEntry] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TransactionHold]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionHold](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [int] NOT NULL CONSTRAINT [DF_TransactionHold_StoreID]  DEFAULT (0),
	[TransactionType] [smallint] NOT NULL CONSTRAINT [DF_TransactionHold_Type]  DEFAULT (1),
	[HoldComment] [nvarchar](255) NOT NULL CONSTRAINT [DF_TransactionHold_HoldComment]  DEFAULT (''),
	[RecallID] [int] NOT NULL CONSTRAINT [DF_TransactionHold_RecallID]  DEFAULT (0),
	[Comment] [nvarchar](50) NOT NULL CONSTRAINT [DF_TransactionHold_Comment]  DEFAULT (''),
	[PriceLevel] [smallint] NOT NULL CONSTRAINT [DF_TransactionHold_PriceLevel]  DEFAULT (1),
	[DiscountMethod] [smallint] NOT NULL CONSTRAINT [DF_TransactionHold_DiscountMethod]  DEFAULT (1),
	[DiscountPercent] [float] NOT NULL CONSTRAINT [DF_TransactionHold_DiscountPercent]  DEFAULT (0),
	[Taxable] [bit] NOT NULL CONSTRAINT [DF_TransactionHold_Taxable]  DEFAULT (1),
	[CustomerID] [int] NOT NULL CONSTRAINT [DF_TransactionHold_CustomerID]  DEFAULT (0),
	[DeltaDeposit] [money] NOT NULL CONSTRAINT [DF_TransactionHold_Deposit]  DEFAULT (0),
	[DepositOverride] [bit] NOT NULL CONSTRAINT [DF_TransactionHold_DepositOverride]  DEFAULT (0),
	[DepositPrevious] [money] NOT NULL CONSTRAINT [DF_TransactionHold_DepositPrevious]  DEFAULT (0),
	[PaymentsPrevious] [money] NOT NULL CONSTRAINT [DF_TransactionHold_PaymentsPrevious]  DEFAULT (0),
	[TaxPrevious] [money] NOT NULL CONSTRAINT [DF_TransactionHold_TaxPrevioius]  DEFAULT (0),
	[SalesRepID] [int] NOT NULL CONSTRAINT [DF_TransactionHold_SalesRepID]  DEFAULT (0),
	[ShipToID] [int] NOT NULL CONSTRAINT [DF_TransactionHold_ShipToID]  DEFAULT (0),
	[TransactionTime] [datetime] NOT NULL CONSTRAINT [DF_TransactionHold_TransactionTime]  DEFAULT (getdate()),
	[ExpirationOrDueDate] [datetime] NOT NULL CONSTRAINT [DF_TransactionHold_DueDate]  DEFAULT (getdate()),
	[ReturnMode] [bit] NOT NULL CONSTRAINT [DF_TransactionHold_ReturnMode]  DEFAULT (0),
	[ReferenceNumber] [nvarchar](50) NOT NULL CONSTRAINT [DF_TransactionHold_PONumber]  DEFAULT (''),
	[ShippingChargePurchased] [money] NOT NULL CONSTRAINT [DF_TransactionHold_ShippingCharge]  DEFAULT (0),
	[ShippingChargeOverride] [bit] NOT NULL CONSTRAINT [DF_TransactionHold_ShippingChargeOverride]  DEFAULT (0),
	[ShippingServiceID] [int] NOT NULL CONSTRAINT [DF_TransactionHold_ShippingServiceID]  DEFAULT (0),
	[ShippingTrackingNumber] [nvarchar](255) NOT NULL CONSTRAINT [DF_TransactionHold_ShippingTrackingNumber]  DEFAULT (''),
	[ShippingNotes] [ntext] NOT NULL CONSTRAINT [DF_TransactionHold_ShippingNotes]  DEFAULT (''),
	[DBTimeStamp] [timestamp] NULL,
	[ReasonCodeID] [int] NOT NULL CONSTRAINT [DF_TransactionHold_ReasonCodeID]  DEFAULT (0),
	[ExchangeID] [int] NOT NULL CONSTRAINT [Df_TransactionHold_ExchangeID]  DEFAULT (0),
	[ChannelType] [int] NOT NULL CONSTRAINT [Df_TransactionHold_ChannelType]  DEFAULT (0),
	[DefaultDiscountReasonCodeID] [int] NOT NULL CONSTRAINT [DF_TransactionHold_DefaultDiscountReasonCodeID]  DEFAULT (0),
	[DefaultReturnReasonCodeID] [int] NOT NULL CONSTRAINT [DF_TransactionHold_DefaultReturnReasonCodeID]  DEFAULT (0),
	[DefaultTaxChangeReasonCodeID] [int] NOT NULL CONSTRAINT [DF_TransactionHold_DefaultTaxChangeReasonCodeID]  DEFAULT (0),
	[BatchNumber] [int] NOT NULL CONSTRAINT [Df_TransactionHold_BatchNumber]  DEFAULT (0),
 CONSTRAINT [PK_TransactionHold] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TransactionHoldEntry]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionHoldEntry](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EntryKey] [nvarchar](10) NOT NULL CONSTRAINT [DF_TransactionHoldEntry_EntryKey]  DEFAULT (''),
	[StoreID] [int] NOT NULL CONSTRAINT [DF_TransactionEntryHold_StoreID]  DEFAULT (0),
	[TransactionHoldID] [int] NOT NULL CONSTRAINT [DF_TransactionEntryOnHold_TransactionID]  DEFAULT (0),
	[RecallID] [int] NOT NULL CONSTRAINT [DF_TransactionEntryOnHold_RecallID]  DEFAULT (0),
	[Description] [nvarchar](30) NOT NULL CONSTRAINT [DF_TransactionEntryOnHold_Description]  DEFAULT (''),
	[QuantityPurchased] [float] NOT NULL CONSTRAINT [DF_TransactionEntryOnHold_QuantityPurchased]  DEFAULT (0),
	[QuantityOnOrder] [float] NOT NULL CONSTRAINT [DF_TransactionEntryOnHold_QuantityOnOrder]  DEFAULT (0),
	[QuantityRTD] [float] NOT NULL CONSTRAINT [DF_TransactionEntryOnHold_QuantityRTD]  DEFAULT (0),
	[QuantityReserved] [float] NOT NULL CONSTRAINT [DF_TransactionEntryOnHold_QuantityReserved]  DEFAULT (0),
	[Price] [money] NOT NULL CONSTRAINT [DF_TransactionEntryOnHold_Price]  DEFAULT (0),
	[FullPrice] [money] NOT NULL CONSTRAINT [DF_TransactionEntryOnHold_FullPrice]  DEFAULT (0),
	[PriceSource] [smallint] NOT NULL CONSTRAINT [DF_TransactionEntryOnHold_PriceSource]  DEFAULT (1),
	[Comment] [nvarchar](255) NOT NULL CONSTRAINT [DF_TransactionEntryOnHold_Comment]  DEFAULT (''),
	[DetailID] [int] NOT NULL CONSTRAINT [DF_TransactionEntryOnHold_DetailID]  DEFAULT (0),
	[Taxable] [bit] NOT NULL CONSTRAINT [DF_TransactionEntryOnHold_Taxable]  DEFAULT (1),
	[ItemID] [int] NOT NULL CONSTRAINT [DF_TransactionEntryOnHold_ItemID]  DEFAULT (0),
	[SalesRepID] [int] NOT NULL CONSTRAINT [DF_TransactionEntryOnHold_SalesRepID]  DEFAULT (0),
	[SerialNumber1] [nvarchar](20) NOT NULL CONSTRAINT [DF_TransactionEntryOnHold_SerialNumber1]  DEFAULT (''),
	[SerialNumber2] [nvarchar](20) NOT NULL CONSTRAINT [DF_TransactionEntryOnHold_SerialNumber2]  DEFAULT (''),
	[SerialNumber3] [nvarchar](20) NOT NULL CONSTRAINT [DF_TransactionEntryOnHold_SerialNumber3]  DEFAULT (''),
	[VoucherNumber] [nvarchar](20) NOT NULL CONSTRAINT [DF_TransactionHoldEntry_VoucherNumber]  DEFAULT (''),
	[VoucherExpirationDate] [datetime] NULL,
	[DBTimeStamp] [timestamp] NULL,
	[DiscountReasonCodeID] [int] NOT NULL CONSTRAINT [DF_TransactionHoldEntry_DiscountReasonCodeID]  DEFAULT (0),
	[ReturnReasonCodeID] [int] NOT NULL CONSTRAINT [DF_TransactionHoldEntry_ReturnReasonCodeID]  DEFAULT (0),
	[TaxChangeReasonCodeID] [int] NOT NULL CONSTRAINT [DF_TransactionHoldEntry_TaxChangeReasonCodeID]  DEFAULT (0),
	[ItemTaxID] [int] NOT NULL CONSTRAINT [Df_TransactionHoldEntry_ItemTaxID]  DEFAULT (0),
	[ComponentQuantityReserved] [float] NOT NULL CONSTRAINT [DF_TransactionHoldEntry_ComponentQuantityReserved]  DEFAULT (0),
 CONSTRAINT [PK_TransactionHoldEntry] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserTopic]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTopic](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ContextID] [smallint] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Text] [ntext] NULL,
	[DBTimeStamp] [timestamp] NULL,
 CONSTRAINT [PK_UserTopic] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VersionHistory]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VersionHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Version] [nvarchar](10) NOT NULL CONSTRAINT [DF_VersionHistory_Version]  DEFAULT (''),
	[Description] [ntext] NULL,
	[Date] [datetime] NOT NULL CONSTRAINT [DF_VersionHistory_Date]  DEFAULT (getdate()),
	[DBTimeStamp] [timestamp] NULL,
	[StoreID] [int] NOT NULL DEFAULT (0),
 CONSTRAINT [PK_VersionHistory] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VisaNetAuthorization]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VisaNetAuthorization](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [int] NOT NULL,
	[RequestRecordFormat] [nchar](1) NULL,
	[RequestApplicationType] [nchar](1) NULL,
	[RequestAcquirerBIN] [nchar](6) NULL,
	[RequestMerchantNumber] [nchar](12) NULL,
	[RequestStoreNumber] [nchar](4) NULL,
	[RequestTerminalNumber] [nchar](4) NULL,
	[RequestDeviceCode] [nchar](1) NULL,
	[RequestIndustryCode] [nchar](1) NULL,
	[RequestCurrencyCode] [nchar](3) NULL,
	[RequestCountryCode] [nchar](3) NULL,
	[RequestCityCode] [nchar](9) NULL,
	[RequestLanguageIndicator] [nchar](2) NULL,
	[RequestTimeZoneDifferential] [nchar](3) NULL,
	[RequestMerchantCategoryCode] [nchar](4) NULL,
	[RequestRequestedACI] [nchar](1) NULL,
	[RequestTransactionSequenceNumber] [nchar](4) NULL,
	[RequestAuthorizationTransactionCode] [nchar](2) NULL,
	[RequestCardholderIdentificationCode] [nchar](2) NULL,
	[RequestAccountDataSource] [nchar](1) NULL,
	[RequestTrack1Data] [nvarchar](255) NULL,
	[RequestTrack2Data] [nvarchar](255) NULL,
	[RequestManualAccountData] [nvarchar](512) NULL,
	[RequestManualExpirationDate] [nchar](4) NULL,
	[RequestCardholderIdentificationData] [nvarchar](128) NULL,
	[RequestReceivingInstitutionID] [nvarchar](6) NULL,
	[RequestTransactionAmount] [money] NULL,
	[RequestSecondaryAmount] [money] NULL,
	[RequestMarketSpecificData] [nvarchar](4) NULL,
	[RequestCardAcceptorData] [nvarchar](40) NULL,
	[RequestReversalTranID] [nvarchar](15) NULL,
	[RequestReversalData] [nvarchar](30) NULL,
	[RequestPurchaseIdentifier] [nchar](25) NULL,
	[RequestGroupIIIVersionNumber] [nchar](3) NULL,
	[ResponseRecordFormat] [nchar](1) NULL,
	[ResponseApplicationType] [nchar](1) NULL,
	[ResponseReturnedACI] [nchar](1) NULL,
	[ResponseStoreNumber] [nchar](4) NULL,
	[ResponseTerminalNumber] [nchar](4) NULL,
	[ResponseAuthorizationSourceCode] [nchar](1) NULL,
	[ResponseTransactionSequenceNumber] [nchar](4) NULL,
	[ResponseResponseCode] [nchar](2) NULL,
	[ResponseApprovalCode] [nchar](6) NULL,
	[ResponseLocalTransactionDateTime] [datetime] NULL,
	[ResponseAuthorizationResponseText] [nchar](16) NULL,
	[ResponseAVSResultCode] [nchar](1) NULL,
	[ResponseRetrievalReferenceNumber] [nchar](12) NULL,
	[ResponseMarketSpecificDataID] [nchar](1) NULL,
	[ResponseTransactionID] [nvarchar](15) NULL,
	[ResponseValidationCode] [nvarchar](4) NULL,
	[VisaNetBatchID] [int] NULL,
	[Status] [int] NULL,
	[DBTimeStamp] [timestamp] NULL,
	[RequestSharingGroup] [nvarchar](30) NULL,
	[ResponseSharingGroup] [char](1) NULL,
	[ResponseSystemTraceAuditNumber] [char](6) NULL,
	[ResponseHostMessageIdentifier] [char](8) NULL,
	[ResponseTransactionStatusCode] [nvarchar](2) NOT NULL,
	[SettlementDate] [nvarchar](4) NULL,
 CONSTRAINT [PK_VisaNetAuthorization] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VisaNetBatch]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VisaNetBatch](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [int] NOT NULL,
	[RequestTerminalNumber] [int] NULL,
	[RequestTransmissionDate] [datetime] NULL,
	[RequestBatchNumber] [int] NULL,
	[ResponseRecordFormat] [nchar](1) NULL,
	[ResponseApplicationType] [nchar](1) NULL,
	[ResponseX25RoutingID] [nchar](1) NULL,
	[ResponseRecordType] [nchar](5) NULL,
	[ResponseBatchRecordCount] [nchar](9) NULL,
	[ResponseBatchNetDeposit] [money] NULL,
	[ResponseBatchResponseCode] [nchar](2) NULL,
	[ResponseBatchNumber] [nchar](3) NULL,
	[ResponseBatchResponseText] [nchar](9) NULL,
	[DBTimeStamp] [timestamp] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Voucher]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voucher](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [int] NOT NULL CONSTRAINT [DF_Voucher_StoreID]  DEFAULT (0),
	[Number] [nvarchar](20) NOT NULL CONSTRAINT [DF_Voucher_Number]  DEFAULT (''),
	[ExpirationDate] [datetime] NULL,
	[DBTimeStamp] [timestamp] NULL,
	[ItemID] [int] NOT NULL CONSTRAINT [DF_Voucher_ItemID]  DEFAULT (0),
	[Balance] [money] NOT NULL CONSTRAINT [DF_Voucher_Balance]  DEFAULT (0),
 CONSTRAINT [PK_Voucher] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VoucherEntry]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VoucherEntry](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [int] NOT NULL CONSTRAINT [DF_VoucherEntry_StoreID]  DEFAULT (0),
	[VoucherID] [int] NOT NULL CONSTRAINT [DF_VoucherEntry_VoucherID]  DEFAULT (0),
	[TransactionEntryID] [int] NOT NULL CONSTRAINT [DF_VoucherEntry_TransactionEntryID]  DEFAULT (0),
	[TenderEntryID] [int] NOT NULL CONSTRAINT [DF_VoucherEntry_TenderEntryID]  DEFAULT (0),
	[Date] [datetime] NOT NULL CONSTRAINT [DF_VoucherEntry_Date]  DEFAULT (getdate()),
	[Amount] [money] NOT NULL CONSTRAINT [DF_VoucherEntry_Amount]  DEFAULT (0),
	[DBTimeStamp] [timestamp] NULL,
	[TransactionNumber] [int] NOT NULL CONSTRAINT [DF_VoucherEntry_TransactionNumber]  DEFAULT (0),
 CONSTRAINT [PK_VoucherEntry] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[PUBLIC_Cashier]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PUBLIC_Cashier] AS SELECT [LastUpdated], [Number], [StoreID], [ID], [Name], [Password], [FloorLimit], [ReturnLimit], [CashDrawerNumber], [SecurityLevel], [Privileges], [EmailAddress], [FailedLogonAttempts], [DBTimeStamp], [MaxOverShortAmount], [MaxOverShortPercent] , [OverShortLimitType], [Telephone] FROM [Cashier] 
GO
/****** Object:  View [dbo].[PUBLIC_Category]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PUBLIC_Category] AS SELECT [ID], [DepartmentID], [Name], [Code], [DBTimeStamp] FROM [Category]
GO
/****** Object:  View [dbo].[PUBLIC_Customer]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PUBLIC_Customer] AS SELECT [AccountNumber], [AccountTypeID], [Address2], [AssessFinanceCharges], [Company], [Country], [CustomDate1], [CustomDate2], [CustomDate3], [CustomDate4], [CustomDate5], [CustomNumber1], [CustomNumber2], [CustomNumber3], [CustomNumber4], [CustomNumber5], [CustomText1], [CustomText2], [CustomText3], [CustomText4], [CustomText5], [GlobalCustomer], [LastStartingDate], [LastClosingDate], [LastUpdated], [LimitPurchase], [LastClosingBalance], [PrimaryShipToID], [State], [StoreID], [ID], [LayawayCustomer], [Employee], [FirstName], [LastName], [Address], [City], [Zip], [AccountBalance], [CreditLimit], [TotalSales], [AccountOpened], [LastVisit], [TotalVisits], [TotalSavings], [CurrentDiscount], [PriceLevel], [TaxExempt], [Notes], [Title], [EmailAddress], [DBTimeStamp], [TaxNumber], [PictureName], [DefaultShippingServiceID], [PhoneNumber], [FaxNumber] , [CashierID] FROM [Customer]
GO
/****** Object:  View [dbo].[PUBLIC_Department]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PUBLIC_Department] AS SELECT [ID], [Name], [code], [DBTimeStamp]From [Department]
GO
/****** Object:  View [dbo].[PUBLIC_Item]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PUBLIC_Item] AS SELECT [BinLocation], [BuydownPrice], [BuydownQuantity], [CommissionAmount], [CommissionMaximum], [CommissionMode], [CommissionPercentProfit], [CommissionPercentSale], [Description], [FoodStampable], [ItemNotDiscountable], [LastReceived], [LastUpdated], [Notes], [QuantityCommitted], [SerialNumberCount], [TareWeightPercent], [ID], [ItemLookupCode], [DepartmentID], [CategoryID], [MessageID], [Price], [PriceA], [PriceB], [PriceC], [SalePrice], [SaleStartDate], [SaleEndDate], [QuantityDiscountID], [TaxID], [ItemType], [Cost], [Quantity], [ReorderPoint], [RestockLevel], [TareWeight], [SupplierID], [TagAlongItem], [TagAlongQuantity], [ParentItem], [ParentQuantity], [BarcodeFormat], [PriceLowerBound], [PriceUpperBound], [PictureName], [LastSold], [ExtendedDescription], [SubDescription1], [SubDescription2], [SubDescription3], [UnitOfMeasure], [SubCategoryID], [QuantityEntryNotAllowed], [PriceMustBeEntered], [BlockSalesReason], [BlockSalesAfterDate], [Weight], [Taxable], [DBTimeStamp], [BlockSalesBeforeDate], [LastCost], [ReplacementCost], [WebItem], [BlockSalesType], [BlockSalesScheduleID] , [SaleType], [SaleScheduleID], [Consignment] From [Item]
GO
/****** Object:  View [dbo].[PUBLIC_Register]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PUBLIC_Register] AS SELECT [Description], [PoleDisplayEnabled], [Receipt2ID], [ScaleEnabled], [ScaleTimeout], [ScannerEnabled], [ZZBatchNumber], [ID], [Number], [CurrentBatchNumber], [Receipt1ID], [PoleDisplayMessageID], [Printer1Name], [Printer1Options], [Printer2Name], [Printer2Options], [ChannelID], [NetDisplayEnabled], [DBTimeStamp], [DefaultPriceLevel], [PoleDisplayName], [ScaleName], [ScannerName], [Printer1Type], [Printer2Type], [StoreID], [CashDrawer1Name], [CashDrawer1Enabled], [CashDrawer1WaitForClose], [CashDrawer1OpenTimeout], [CashDrawer2Name], [CashDrawer2Enabled], [CashDrawer2WaitForClose], [CashDrawer2OpenTimeout], [MICRName], [MICREnabled], [MICRTimeout], [MSRName], [MSREnabled], [SignatureCaptureName], [SignatureCaptureEnabled] , [SignatureCaptureFormName], [TouchScreenEnabled], [KeyboardID] FROM [Register]
GO
/****** Object:  View [dbo].[PUBLIC_SalesRep]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PUBLIC_SalesRep] AS SELECT [LastUpdated], [Number], [StoreID], [ID], [Name], [PercentOfSale], [PercentOfProfit], [FixedRate], [EmailAddress], [DBTimeStamp] , [Telephone] FROM [SalesRep]
GO
/****** Object:  View [dbo].[PUBLIC_Store]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PUBLIC_Store] AS SELECT [ID], [Name], [StoreCode], [Region], [Address1], [Address2], [City], [Country], [FaxNumber], [PhoneNumber], [State], [Zip], [ParentStoreID], [ScheduleHourMask1], [ScheduleHourMask2], [ScheduleHourMask3], [ScheduleHourMask4], [ScheduleHourMask5], [ScheduleHourMask6], [ScheduleHourMask7], [ScheduleMinute], [RetryCount], [RetryDelay],[LastUpdated], [DBTimeStamp], [AccountName] , [Password] FROM [Store] 
GO
/****** Object:  View [dbo].[PUBLIC_Supplier]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PUBLIC_Supplier] AS SELECT [Country], [LastUpdated], [State], [ID], [SupplierName], [ContactName], [Address1], [Address2], [City], [Zip], [EmailAddress], [WebPageAddress], [Code], [DBTimeStamp], [AccountNumber], [TaxNumber], [CurrencyID], [PhoneNumber] , [FaxNumber] FROM [Supplier]
GO
/****** Object:  View [dbo].[PUBLIC_Tax]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PUBLIC_Tax] AS SELECT [FixedAmount], [ID], [Description], [Percentage], [UsePartialDollar], [ItemMaximum], [IncludePreviousTax],  [Bracket00], [Bracket01], [Bracket02], [Bracket03], [Bracket04],  [Bracket05], [Bracket06], [Bracket07], [Bracket08], [Bracket09],  [Bracket10], [Code], [DBTimeStamp], [ItemMinimum], [ApplyOverMinimum] From [Tax]
GO
/****** Object:  View [dbo].[PUBLIC_TaxEntry]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PUBLIC_TaxEntry] AS SELECT [StoreID], [ID], [TaxID], [TransactionNumber], [Tax], [TaxableAmount] , [DBTimeStamp], [TransactionEntryID] From [TaxEntry] 
GO
/****** Object:  View [dbo].[PUBLIC_Tender]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PUBLIC_Tender] AS SELECT [PreventOverTendering], [VerificationType],  [VerifyViaEDC], [ID], [Description], [AdditionalDetailType],  [PrinterValidation], [ValidationLine1], [ValidationLine2], [ValidationLine3], [GLAccount], [ScanCode], [RoundToValue], [Code], [MaximumAmount],  [DBTimeStamp], [DoNotPopCashDrawer], [CurrencyID] , [DisplayOrder],  [ValidationMask], [SignatureRequired] FROM [Tender]
GO
/****** Object:  View [dbo].[PUBLIC_TenderEntry]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PUBLIC_TenderEntry] AS SELECT [BatchNumber], [CreditCardExpiration], [OrderHistoryID], [DropPayoutID], [StoreID], [ID], [TransactionNumber], [TenderID], [PaymentID], [Description], [CreditCardNumber], [CreditCardApprovalCode], [Amount], [AccountHolder], [DBTimeStamp], [RoundingError], [AmountForeign], [BankNumber], [SerialNumber], [State], [License], [BirthDate], [TransitNumber] , [VisaNetAuthorizationID] FROM [TenderEntry]
GO
/****** Object:  View [dbo].[PUBLIC_Transaction]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PUBLIC_Transaction] AS SELECT [ShipToID], [StoreID], [TransactionNumber], [BatchNumber], [Time],  [CustomerID], [CashierID], [Total], [SalesTax], [Comment], [ReferenceNumber], [DBTimeStamp], [Status], [ExchangeID], [ChannelType] FROM [Transaction]
GO
/****** Object:  View [dbo].[PUBLIC_TransactionEntry]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PUBLIC_TransactionEntry] AS SELECT [Commission], [Cost], [FullPrice], [StoreID], [ID], [TransactionNumber], [ItemID], [Price], [PriceSource], [Quantity], [SalesRepID], [Taxable], [DetailID], [Comment], [DBTimeStamp], [DiscountReasonCodeID], [ReturnReasonCodeID] , [TaxChangeReasonCodeID], [SalesTax] From [TransactionEntry]
GO
/****** Object:  Index [IX_CustomerID]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_CustomerID] ON [dbo].[AccountReceivable]
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AccountReceivableID]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_AccountReceivableID] ON [dbo].[AccountReceivableHistory]
(
	[AccountReceivableID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ALIAS]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ALIAS] ON [dbo].[Alias]
(
	[Alias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ItemID]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_ItemID] ON [dbo].[Alias]
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RegisterID]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_RegisterID] ON [dbo].[Batch]
(
	[RegisterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CashierID]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_CashierID] ON [dbo].[CalendarEvent]
(
	[CashierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AccountNumber]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_AccountNumber] ON [dbo].[Customer]
(
	[AccountNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Company]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_Company] ON [dbo].[Customer]
(
	[Company] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HQID]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_HQID] ON [dbo].[Customer]
(
	[HQID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TypeID]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_TypeID] ON [dbo].[DailySales]
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HQID]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_HQID] ON [dbo].[Department]
(
	[HQID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BatchNumber]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_BatchNumber] ON [dbo].[DropPayout]
(
	[BatchNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ItemID]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_ItemID] ON [dbo].[InventoryTransferLog]
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_BinLocation]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_BinLocation] ON [dbo].[Item]
(
	[BinLocation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CategoryID]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_CategoryID] ON [dbo].[Item]
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DepartmentID]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_DepartmentID] ON [dbo].[Item]
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Description]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_Description] ON [dbo].[Item]
(
	[Description] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HQID]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_HQID] ON [dbo].[Item]
(
	[HQID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ItemLookupCode]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ItemLookupCode] ON [dbo].[Item]
(
	[ItemLookupCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [IX_SupplierID]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_SupplierID] ON [dbo].[Item]
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Description]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_Description] ON [dbo].[ItemClass]
(
	[Description] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ItemClassLookupCode]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_ItemClassLookupCode] ON [dbo].[ItemClass]
(
	[ItemLookupCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ItemClassID]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_ItemClassID] ON [dbo].[ItemClassComponent]
(
	[ItemClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ItemID]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_ItemID] ON [dbo].[ItemClassComponent]
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HQID]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_HQID] ON [dbo].[ItemMessage]
(
	[HQID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HQID]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_HQID] ON [dbo].[ItemTax]
(
	[HQID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BatchNumber]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_BatchNumber] ON [dbo].[Journal]
(
	[BatchNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CustomerID]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_CustomerID] ON [dbo].[Journal]
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ReferenceID]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_ReferenceID] ON [dbo].[Journal]
(
	[ReferenceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ComponentItemID]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_ComponentItemID] ON [dbo].[Kit]
(
	[ComponentItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_KitItemID]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_KitItemID] ON [dbo].[Kit]
(
	[KitItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ItemID]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_ItemID] ON [dbo].[LimitEntry]
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BatchNumber]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_BatchNumber] ON [dbo].[NonTenderTransaction]
(
	[BatchNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NUS_MarketSmart_Transaction_DateSendComplete]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [NUS_MarketSmart_Transaction_DateSendComplete] ON [dbo].[NUS_MarketSmart_Transaction]
(
	[DateSendComplete] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IDX_NUS_NUHQ_LOG]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IDX_NUS_NUHQ_LOG] ON [dbo].[NUS_NUHQ_Log]
(
	[Table] ASC,
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_NUS_NUHQ_Requests]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_NUS_NUHQ_Requests] ON [dbo].[NUS_NUHQ_Requests]
(
	[NUHQ_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_StartEndDates]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IDX_StartEndDates] ON [dbo].[NUS_PO_Offer]
(
	[StartDate] ASC,
	[EndDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_APE_Item]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IDX_APE_Item] ON [dbo].[NUS_PO_OfferEntry]
(
	[OfferItem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_APE_Offer]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IDX_APE_Offer] ON [dbo].[NUS_PO_OfferEntry]
(
	[Offer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IDX_LastName]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IDX_LastName] ON [dbo].[NUS_PO_Patient]
(
	[LastName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_ChargeAccount]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IDX_ChargeAccount] ON [dbo].[NUS_PO_Script]
(
	[ChargeAccount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_InstanceCount]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IDX_InstanceCount] ON [dbo].[NUS_PO_Script]
(
	[InstanceCount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_Patient]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Patient] ON [dbo].[NUS_PO_Script]
(
	[Patient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_RegisterId]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IDX_RegisterId] ON [dbo].[NUS_PO_Script]
(
	[RegisterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_ReturnActivityEntry]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IDX_ReturnActivityEntry] ON [dbo].[NUS_PO_Script]
(
	[ReturnActivityEntry] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_SaleActivityEntry]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IDX_SaleActivityEntry] ON [dbo].[NUS_PO_Script]
(
	[SaleActivityEntry] ASC,
	[ActivityAction] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_ScriptNumber]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IDX_ScriptNumber] ON [dbo].[NUS_PO_Script]
(
	[ScriptNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_WorkOrderId]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IDX_WorkOrderId] ON [dbo].[NUS_PO_Script]
(
	[WorkOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_NUS_Settings_Entry_v2]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_NUS_Settings_Entry_v2] ON [dbo].[NUS_Settings_Entry]
(
	[NUS_Settings_Alias] ASC,
	[Restriction] ASC,
	[Default] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CustomerID]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_CustomerID] ON [dbo].[Order]
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ReferenceNumber]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_ReferenceNumber] ON [dbo].[Order]
(
	[ReferenceNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ShippingTrackingNumber]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_ShippingTrackingNumber] ON [dbo].[Order]
(
	[ShippingTrackingNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ItemID]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_ItemID] ON [dbo].[OrderEntry]
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderID]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderID] ON [dbo].[OrderEntry]
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderID]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderID] ON [dbo].[OrderHistory]
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TransactionNumber]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_TransactionNumber] ON [dbo].[OrderHistory]
(
	[TransactionNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BatchNumber]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_BatchNumber] ON [dbo].[Payment]
(
	[BatchNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CustomerID]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_CustomerID] ON [dbo].[Payment]
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_PONumber]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_PONumber] ON [dbo].[PurchaseOrder]
(
	[PONumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SupplierID]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_SupplierID] ON [dbo].[PurchaseOrder]
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_WorksheetID]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_WorksheetID] ON [dbo].[PurchaseOrder]
(
	[WorksheetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ItemID]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_ItemID] ON [dbo].[PurchaseOrderEntry]
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PurchaseOrderID]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_PurchaseOrderID] ON [dbo].[PurchaseOrderEntry]
(
	[PurchaseOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PurchaseOrderEntryID]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_PurchaseOrderEntryID] ON [dbo].[PurchaseOrderEntryDetail]
(
	[PurchaseOrderEntryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Description]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_Description] ON [dbo].[Report]
(
	[Description] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ClassName]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_ClassName] ON [dbo].[Security]
(
	[ClassName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_FormName]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_FormName] ON [dbo].[Security]
(
	[FormName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HQID]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_HQID] ON [dbo].[Serial]
(
	[HQID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ItemID]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_ItemID] ON [dbo].[Serial]
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_SerialNumber]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_SerialNumber] ON [dbo].[Serial]
(
	[SerialNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ServiceID]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_ServiceID] ON [dbo].[Shipping]
(
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_TrackingNumber]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_TrackingNumber] ON [dbo].[Shipping]
(
	[TrackingNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TransactionNumber]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_TransactionNumber] ON [dbo].[Shipping]
(
	[TransactionNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Name]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_Name] ON [dbo].[ShippingCarrier]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CarrierID]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_CarrierID] ON [dbo].[ShippingService]
(
	[CarrierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Name]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_Name] ON [dbo].[ShippingService]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CarrierID]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_CarrierID] ON [dbo].[ShippingWebPair]
(
	[CarrierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CustomerID]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_CustomerID] ON [dbo].[ShipTo]
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HQID]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_HQID] ON [dbo].[ShipTo]
(
	[HQID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ItemID]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_ItemID] ON [dbo].[Substitute]
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SubstituteItemID]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_SubstituteItemID] ON [dbo].[Substitute]
(
	[SubstituteItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Code]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_Code] ON [dbo].[Supplier]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HQID]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_HQID] ON [dbo].[Supplier]
(
	[HQID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_SupplierName]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_SupplierName] ON [dbo].[Supplier]
(
	[SupplierName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Item_Supplier_ReorderNumber]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Item_Supplier_ReorderNumber] ON [dbo].[SupplierList]
(
	[ItemID] ASC,
	[SupplierID] ASC,
	[ReorderNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ItemID]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_ItemID] ON [dbo].[SupplierList]
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SupplierID]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_SupplierID] ON [dbo].[SupplierList]
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TaxID]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_TaxID] ON [dbo].[TaxEntry]
(
	[TaxID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TransactionNumber]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_TransactionNumber] ON [dbo].[TaxEntry]
(
	[TransactionNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BatchNumber]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_BatchNumber] ON [dbo].[TaxTotals]
(
	[BatchNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TaxID]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_TaxID] ON [dbo].[TaxTotals]
(
	[TaxID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TenderEntry_VisaNetAuthID]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_TenderEntry_VisaNetAuthID] ON [dbo].[TenderEntry]
(
	[VisaNetAuthorizationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TransactionNumber]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_TransactionNumber] ON [dbo].[TenderEntry]
(
	[TransactionNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BatchNumber]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_BatchNumber] ON [dbo].[TenderTotals]
(
	[BatchNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TenderID]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_TenderID] ON [dbo].[TenderTotals]
(
	[TenderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CashierID]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_CashierID] ON [dbo].[TimeCard]
(
	[CashierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CashierID]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_CashierID] ON [dbo].[TimeClock]
(
	[CashierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_NUS_ClubTransaction]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IDX_NUS_ClubTransaction] ON [dbo].[Transaction]
(
	[TransactionNumber] ASC,
	[Time] ASC,
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BatchNumber]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_BatchNumber] ON [dbo].[Transaction]
(
	[BatchNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CustomerID]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_CustomerID] ON [dbo].[Transaction]
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ReferenceNumber]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_ReferenceNumber] ON [dbo].[Transaction]
(
	[ReferenceNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_NUS_ClubTransactionEntry]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IDX_NUS_ClubTransactionEntry] ON [dbo].[TransactionEntry]
(
	[ID] ASC,
	[FullPrice] ASC,
	[Price] ASC,
	[TransactionNumber] ASC,
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ItemID]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_ItemID] ON [dbo].[TransactionEntry]
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TransactionEntryTransactionNumber]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_TransactionEntryTransactionNumber] ON [dbo].[TransactionEntry]
(
	[TransactionNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TransactionNumber]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_TransactionNumber] ON [dbo].[TransactionEntry]
(
	[TransactionNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Number]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_Number] ON [dbo].[Voucher]
(
	[Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_VoucherID]    Script Date: 12/11/2017 1:09:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_VoucherID] ON [dbo].[VoucherEntry]
(
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AccountingAccounts] ADD  CONSTRAINT [DF_AccountingAccounts_HQID]  DEFAULT (0) FOR [HQID]
GO
ALTER TABLE [dbo].[AccountingAccounts] ADD  CONSTRAINT [DF_AccountingAccounts_AccountNumber]  DEFAULT ('') FOR [AccountNumber]
GO
ALTER TABLE [dbo].[AccountingAccounts] ADD  CONSTRAINT [DF_AccountingAccounts_Name]  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[AccountingTerms] ADD  CONSTRAINT [DF_AccountingTerms_HQID]  DEFAULT (0) FOR [HQID]
GO
ALTER TABLE [dbo].[AccountingTerms] ADD  CONSTRAINT [DF_AccountingTerms_Name]  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[ARHistoryMirror] ADD  CONSTRAINT [DF_ARHistoryMirror_LocalStoreID]  DEFAULT (0) FOR [StoreID]
GO
ALTER TABLE [dbo].[ARHistoryMirror] ADD  CONSTRAINT [DF_ARHistoryMirror_IsProcessed]  DEFAULT (0) FOR [IsProcessed]
GO
ALTER TABLE [dbo].[Check] ADD  CONSTRAINT [DF_Check_LookupCode]  DEFAULT ('') FOR [LookupCode]
GO
ALTER TABLE [dbo].[Check] ADD  CONSTRAINT [DF_Check_AccountName]  DEFAULT ('') FOR [AccountName]
GO
ALTER TABLE [dbo].[Check] ADD  CONSTRAINT [DF_Check_StatusCode]  DEFAULT (0) FOR [StatusCode]
GO
ALTER TABLE [dbo].[Check] ADD  DEFAULT (0) FOR [StoreID]
GO
ALTER TABLE [dbo].[Currency] ADD  CONSTRAINT [DF_Currency_HQID]  DEFAULT (0) FOR [HQID]
GO
ALTER TABLE [dbo].[Currency] ADD  CONSTRAINT [Df_Currency_ExchangeRate]  DEFAULT (1) FOR [ExchangeRate]
GO
ALTER TABLE [dbo].[Currency] ADD  CONSTRAINT [DF_Currency_Description]  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[Currency] ADD  CONSTRAINT [DF_Currency_Code]  DEFAULT ('') FOR [Code]
GO
ALTER TABLE [dbo].[Currency] ADD  CONSTRAINT [DF_Currency_LocaleID]  DEFAULT (0) FOR [LocaleID]
GO
ALTER TABLE [dbo].[Currency] ADD  CONSTRAINT [DF_Currency_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
ALTER TABLE [dbo].[Dimension] ADD  CONSTRAINT [DF_Dimension_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
ALTER TABLE [dbo].[DimensionAttribute] ADD  CONSTRAINT [DF_DimensionAttribute_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
ALTER TABLE [dbo].[Exchange] ADD  CONSTRAINT [DF_Exchange_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Exchange] ADD  CONSTRAINT [DF_Exchange_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
ALTER TABLE [dbo].[Exchange] ADD  CONSTRAINT [DF_Exchange_ProcessorCode]  DEFAULT ('') FOR [ProcessorCode]
GO
ALTER TABLE [dbo].[Exchange] ADD  CONSTRAINT [DF_Exchange_Data]  DEFAULT ('') FOR [Data]
GO
ALTER TABLE [dbo].[Exchange] ADD  CONSTRAINT [DF_Exchange_Processed]  DEFAULT (0) FOR [Status]
GO
ALTER TABLE [dbo].[Exchange] ADD  CONSTRAINT [Df_Exchange_Comment_1]  DEFAULT ('') FOR [Comment]
GO
ALTER TABLE [dbo].[HQMessage] ADD  CONSTRAINT [DF_HQMessage_Status]  DEFAULT (0) FOR [Status]
GO
ALTER TABLE [dbo].[HQMessage] ADD  CONSTRAINT [DF_HQMessage_Title]  DEFAULT ('') FOR [Title]
GO
ALTER TABLE [dbo].[HQMessage] ADD  CONSTRAINT [DF_HQMessage_Message]  DEFAULT ('') FOR [Message]
GO
ALTER TABLE [dbo].[HQMessage] ADD  CONSTRAINT [DF_HQMessage_Style]  DEFAULT (0) FOR [Style]
GO
ALTER TABLE [dbo].[HQMessage] ADD  CONSTRAINT [DF_HQMessage_FromStoreID]  DEFAULT (0) FOR [FromStoreID]
GO
ALTER TABLE [dbo].[HQMessage] ADD  CONSTRAINT [DF_HQMessage_ToStoreID]  DEFAULT (0) FOR [ToStoreID]
GO
ALTER TABLE [dbo].[HQMessage] ADD  CONSTRAINT [DF_HQMessage_AttachmentID]  DEFAULT (0) FOR [AttachmentID]
GO
ALTER TABLE [dbo].[Import] ADD  CONSTRAINT [DF_Import_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[Import] ADD  CONSTRAINT [DF_Import_Type]  DEFAULT (0) FOR [Type]
GO
ALTER TABLE [dbo].[Import] ADD  CONSTRAINT [DF_Import_Filename]  DEFAULT ('') FOR [Filename]
GO
ALTER TABLE [dbo].[ImportEntry] ADD  CONSTRAINT [DF_ImportEntry_ImportID]  DEFAULT (0) FOR [ImportID]
GO
ALTER TABLE [dbo].[ImportEntry] ADD  CONSTRAINT [DF_ImportEntry_ItemID]  DEFAULT (0) FOR [ItemID]
GO
ALTER TABLE [dbo].[ImportEntry] ADD  CONSTRAINT [DF_ImportEntry_Previous]  DEFAULT (0) FOR [Previous]
GO
ALTER TABLE [dbo].[ImportEntry] ADD  CONSTRAINT [DF_ImportEntry_New]  DEFAULT (0) FOR [New]
GO
ALTER TABLE [dbo].[ImportEntry] ADD  CONSTRAINT [DF_ImportEntry_Field]  DEFAULT ('') FOR [Field]
GO
ALTER TABLE [dbo].[ImportEntry] ADD  CONSTRAINT [DF_ImportEntry_AdditionalInfo]  DEFAULT ('') FOR [AdditionalInfo]
GO
ALTER TABLE [dbo].[InventoryOffline] ADD  CONSTRAINT [DF_InventoryOffline_StoreID]  DEFAULT (0) FOR [StoreID]
GO
ALTER TABLE [dbo].[InventoryOffline] ADD  CONSTRAINT [DF_InventoryOffline_ItemID]  DEFAULT (0) FOR [ItemID]
GO
ALTER TABLE [dbo].[InventoryOffline] ADD  CONSTRAINT [DF_InventoryOffline_DetailID]  DEFAULT (0) FOR [DetailID]
GO
ALTER TABLE [dbo].[InventoryOffline] ADD  CONSTRAINT [DF_InventoryOffline_ReasonCodeID]  DEFAULT (0) FOR [ReasonCodeID]
GO
ALTER TABLE [dbo].[InventoryOffline] ADD  CONSTRAINT [DF_InventoryOffline_Quantity]  DEFAULT (0) FOR [Quantity]
GO
ALTER TABLE [dbo].[InventoryOffline] ADD  CONSTRAINT [DF_InventoryOffline_Comment]  DEFAULT ('') FOR [Comment]
GO
ALTER TABLE [dbo].[InventoryOffline] ADD  CONSTRAINT [DF_InventoryOffline_PurchaseOrderID]  DEFAULT (0) FOR [PurchaseOrderID]
GO
ALTER TABLE [dbo].[InventoryOffline] ADD  CONSTRAINT [Df_InventoryOffline_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[ItemClass] ADD  CONSTRAINT [DF_ItemClass_Description]  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[ItemClass] ADD  CONSTRAINT [DF_ItemClass_Dimensions]  DEFAULT (0) FOR [Dimensions]
GO
ALTER TABLE [dbo].[ItemClass] ADD  CONSTRAINT [DF_ItemClass_Title1]  DEFAULT ('') FOR [Title1]
GO
ALTER TABLE [dbo].[ItemClass] ADD  CONSTRAINT [DF_ItemClass_Title2]  DEFAULT ('') FOR [Title2]
GO
ALTER TABLE [dbo].[ItemClass] ADD  CONSTRAINT [DF_ItemClass_Title3]  DEFAULT ('') FOR [Title3]
GO
ALTER TABLE [dbo].[ItemClass] ADD  CONSTRAINT [DF_ItemClass_ClassType]  DEFAULT (0) FOR [ClassType]
GO
ALTER TABLE [dbo].[ItemClass] ADD  CONSTRAINT [Df_ItemClass_UseComponentPrice]  DEFAULT (0) FOR [UseComponentPrice]
GO
ALTER TABLE [dbo].[ItemClass] ADD  DEFAULT (0) FOR [HQID]
GO
ALTER TABLE [dbo].[ItemClass] ADD  CONSTRAINT [Df_ItemClass_ItemLookupCode]  DEFAULT ('') FOR [ItemLookupCode]
GO
ALTER TABLE [dbo].[ItemClass] ADD  CONSTRAINT [DF_ItemClass_DepartmentID]  DEFAULT (0) FOR [DepartmentID]
GO
ALTER TABLE [dbo].[ItemClass] ADD  CONSTRAINT [DF_ItemClass_CategoryID]  DEFAULT (0) FOR [CategoryID]
GO
ALTER TABLE [dbo].[ItemClass] ADD  CONSTRAINT [DF_ItemClass_Price]  DEFAULT (0) FOR [Price]
GO
ALTER TABLE [dbo].[ItemClass] ADD  CONSTRAINT [DF_ItemClass_Cost]  DEFAULT (0) FOR [Cost]
GO
ALTER TABLE [dbo].[ItemClass] ADD  CONSTRAINT [DF_ItemClass_SupplierID]  DEFAULT (0) FOR [SupplierID]
GO
ALTER TABLE [dbo].[ItemClass] ADD  CONSTRAINT [DF_ItemClass_BarcodeFormat]  DEFAULT (0) FOR [BarcodeFormat]
GO
ALTER TABLE [dbo].[ItemClass] ADD  CONSTRAINT [DF_ItemClass_SubDescription1]  DEFAULT ('') FOR [SubDescription1]
GO
ALTER TABLE [dbo].[ItemClass] ADD  CONSTRAINT [DF_ItemClass_SubDescription2]  DEFAULT ('') FOR [SubDescription2]
GO
ALTER TABLE [dbo].[ItemClass] ADD  CONSTRAINT [DF_ItemClass_SubDescription3]  DEFAULT ('') FOR [SubDescription3]
GO
ALTER TABLE [dbo].[ItemClass] ADD  CONSTRAINT [DF_ItemClass_TaxID]  DEFAULT (0) FOR [TaxID]
GO
ALTER TABLE [dbo].[ItemClass] ADD  CONSTRAINT [DF_itemclass_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
ALTER TABLE [dbo].[ItemClass] ADD  CONSTRAINT [DF_ItemClass_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
ALTER TABLE [dbo].[ItemClassComponent] ADD  CONSTRAINT [DF_ItemClassComponent_ItemClassID]  DEFAULT (0) FOR [ItemClassID]
GO
ALTER TABLE [dbo].[ItemClassComponent] ADD  CONSTRAINT [DF_ItemClassComponent_ItemID]  DEFAULT (0) FOR [ItemID]
GO
ALTER TABLE [dbo].[ItemClassComponent] ADD  CONSTRAINT [DF_ItemClassComponent_Quantity]  DEFAULT (0) FOR [Quantity]
GO
ALTER TABLE [dbo].[ItemClassComponent] ADD  CONSTRAINT [DF_ItemClassComponent_Detail1]  DEFAULT ('') FOR [Detail1]
GO
ALTER TABLE [dbo].[ItemClassComponent] ADD  CONSTRAINT [DF_ItemClassComponent_Detail2]  DEFAULT ('') FOR [Detail2]
GO
ALTER TABLE [dbo].[ItemClassComponent] ADD  CONSTRAINT [DF_ItemClassComponent_Detail3]  DEFAULT ('') FOR [Detail3]
GO
ALTER TABLE [dbo].[ItemClassComponent] ADD  CONSTRAINT [DF_ItemClassComponent_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
ALTER TABLE [dbo].[ItemClassComponent] ADD  CONSTRAINT [Df_ItemClassComponent_Price]  DEFAULT (0) FOR [Price]
GO
ALTER TABLE [dbo].[ItemClassComponent] ADD  CONSTRAINT [DF_itemclasscomponent_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
ALTER TABLE [dbo].[ItemClassComponent] ADD  CONSTRAINT [DF_ItemClassComponent_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
ALTER TABLE [dbo].[Kit] ADD  CONSTRAINT [DF_Kit_KitItemID]  DEFAULT (0) FOR [KitItemID]
GO
ALTER TABLE [dbo].[Kit] ADD  CONSTRAINT [DF_Kit_ComponentItemID]  DEFAULT (0) FOR [ComponentItemID]
GO
ALTER TABLE [dbo].[Kit] ADD  CONSTRAINT [DF_Kit_Quantity]  DEFAULT (0) FOR [Quantity]
GO
ALTER TABLE [dbo].[Kit] ADD  CONSTRAINT [DF_kit_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
ALTER TABLE [dbo].[Kit] ADD  CONSTRAINT [DF_Kit_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
ALTER TABLE [dbo].[LimitEntry] ADD  CONSTRAINT [DF_LimitEntry_ItemID]  DEFAULT (0) FOR [ItemID]
GO
ALTER TABLE [dbo].[LimitEntry] ADD  CONSTRAINT [DF_LimitEntry_Units]  DEFAULT (0) FOR [Units]
GO
ALTER TABLE [dbo].[MatrixAttributeDisplayOrder] ADD  CONSTRAINT [DF_MatrixAttributeDisplayOrder_ItemClassID]  DEFAULT (0) FOR [ItemClassID]
GO
ALTER TABLE [dbo].[MatrixAttributeDisplayOrder] ADD  CONSTRAINT [DF_MatrixAttributeDisplayOrder_Attribute]  DEFAULT ('') FOR [Attribute]
GO
ALTER TABLE [dbo].[MatrixAttributeDisplayOrder] ADD  CONSTRAINT [DF_MatrixAttributeDisplayOrder_Code]  DEFAULT ('') FOR [Code]
GO
ALTER TABLE [dbo].[MatrixAttributeDisplayOrder] ADD  CONSTRAINT [DF_MatrixAttributeDisplayOrder_HQID]  DEFAULT (0) FOR [HQID]
GO
ALTER TABLE [dbo].[MatrixAttributeDisplayOrder] ADD  CONSTRAINT [DF_MatrixAttributeDisplayOrder_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
ALTER TABLE [dbo].[NUS_Banner_Ads] ADD  CONSTRAINT [DF_NUS_Banner_Ads_Total_Time_Displayed]  DEFAULT ((0)) FOR [Total_Time_Displayed]
GO
ALTER TABLE [dbo].[NUS_Banner_Ads] ADD  CONSTRAINT [DF_NUS_Banner_Ads_Num_Times_Displayed]  DEFAULT ((0)) FOR [Num_Times_Displayed]
GO
ALTER TABLE [dbo].[NUS_Clients] ADD  CONSTRAINT [DF_NUS_Clients_MachineName]  DEFAULT ('') FOR [MachineName]
GO
ALTER TABLE [dbo].[NUS_Clients] ADD  CONSTRAINT [DF_NUS_Clients_RegisterNumber]  DEFAULT ((0)) FOR [RegisterNumber]
GO
ALTER TABLE [dbo].[NUS_Clients] ADD  CONSTRAINT [DF_NUS_Clients_CurrentVersion]  DEFAULT ('') FOR [CurrentVersion]
GO
ALTER TABLE [dbo].[NUS_Clients] ADD  CONSTRAINT [DF_NUS_Clients_IsMaster]  DEFAULT ((0)) FOR [IsMaster]
GO
ALTER TABLE [dbo].[NUS_Clients] ADD  CONSTRAINT [DF_NUS_Clients_IsUpdating]  DEFAULT ((0)) FOR [IsUpdating]
GO
ALTER TABLE [dbo].[NUS_Clients] ADD  CONSTRAINT [DF_NUS_Clients_LastPolled]  DEFAULT (getdate()) FOR [LastPolled]
GO
ALTER TABLE [dbo].[NUS_Fred2Pos_Dat] ADD  CONSTRAINT [DF_NUS_Fred2Pos_Dat_CUSTOMERID]  DEFAULT ((0)) FOR [CUSTOMERID]
GO
ALTER TABLE [dbo].[NUS_Fred2Pos_Dat] ADD  CONSTRAINT [DF_NUS_Fred2Pos_Dat_WORKORDER]  DEFAULT ((0)) FOR [WORKORDER]
GO
ALTER TABLE [dbo].[NUS_Fred2Pos_Dat] ADD  CONSTRAINT [DF_NUS_Fred2Pos_Dat_COMPLETED]  DEFAULT ((0)) FOR [COMPLETED]
GO
ALTER TABLE [dbo].[NUS_Fred2Pos_Dat] ADD  DEFAULT ((0)) FOR [WORKORDERID]
GO
ALTER TABLE [dbo].[NUS_Fred2Pos_Dat] ADD  DEFAULT ((0)) FOR [TransactionNumber]
GO
ALTER TABLE [dbo].[NUS_Hire] ADD  CONSTRAINT [DF_NUS_Hire_paid]  DEFAULT ((0)) FOR [paid]
GO
ALTER TABLE [dbo].[NUS_Labels] ADD  CONSTRAINT [DF_NUS_Labels_Lastupdated]  DEFAULT (getdate()) FOR [Lastupdated]
GO
ALTER TABLE [dbo].[NUS_Labels] ADD  CONSTRAINT [DF_NUS_Labels_format]  DEFAULT ('') FOR [format]
GO
ALTER TABLE [dbo].[NUS_Labels] ADD  CONSTRAINT [DF_NUS_Labels_barcode]  DEFAULT ((11)) FOR [barcode]
GO
ALTER TABLE [dbo].[NUS_Labels] ADD  CONSTRAINT [DF_NUS_Labels_barcodecaption]  DEFAULT ((0)) FOR [barcodecaption]
GO
ALTER TABLE [dbo].[NUS_Labels] ADD  CONSTRAINT [DF_NUS_Labels_barwidth]  DEFAULT ((0)) FOR [barwidth]
GO
ALTER TABLE [dbo].[NUS_Labels] ADD  CONSTRAINT [DF_NUS_Labels_pricesource]  DEFAULT ((0)) FOR [pricesource]
GO
ALTER TABLE [dbo].[NUS_Labels] ADD  DEFAULT ('') FOR [BarcodeValue]
GO
ALTER TABLE [dbo].[NUS_Labels] ADD  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[NUS_LicenceLog] ADD  CONSTRAINT [DF_NUS_LicenceLog_MachineGuid]  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [MachineGuid]
GO
ALTER TABLE [dbo].[NUS_MarketSmart_Transaction] ADD  CONSTRAINT [DF_NUS_MarketSmart_Transaction_SendAttemptCount]  DEFAULT ((0)) FOR [SendAttemptCount]
GO
ALTER TABLE [dbo].[NUS_Monitor] ADD  CONSTRAINT [DF_NUS_Monitor_status]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[NUS_Monitor] ADD  CONSTRAINT [DF_NUS_Monitor_statusupated]  DEFAULT (getdate()) FOR [statusupdated]
GO
ALTER TABLE [dbo].[NUS_MonitorCommand] ADD  CONSTRAINT [DF_NUS_MonitorCommand_Sent]  DEFAULT (getdate()) FOR [Sent]
GO
ALTER TABLE [dbo].[NUS_MonitorCommand] ADD  CONSTRAINT [DF_NUS_MonitorCommand_Command]  DEFAULT ('ping') FOR [Command]
GO
ALTER TABLE [dbo].[NUS_NUHQ_Log] ADD  CONSTRAINT [DF_NUS_NUHQ_Log_updated]  DEFAULT (getdate()) FOR [updated]
GO
ALTER TABLE [dbo].[NUS_NUHQ_Requests] ADD  CONSTRAINT [DF_NUS_NUHQ_Requests_answerreturned]  DEFAULT ((0)) FOR [answerreturned]
GO
ALTER TABLE [dbo].[NUS_PO_Log] ADD  DEFAULT ('') FOR [field]
GO
ALTER TABLE [dbo].[NUS_PO_Log] ADD  DEFAULT ((0)) FOR [action]
GO
ALTER TABLE [dbo].[NUS_PO_Log] ADD  DEFAULT (getdate()) FOR [performed]
GO
ALTER TABLE [dbo].[NUS_Unmatched_Scripts] ADD  CONSTRAINT [DF_nus_unmatched_scripts_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
ALTER TABLE [dbo].[PriceRounding] ADD  CONSTRAINT [DF_PriceRounding_HQID]  DEFAULT (0) FOR [HQID]
GO
ALTER TABLE [dbo].[PriceRounding] ADD  CONSTRAINT [DF_PriceRounding_PriceFrom]  DEFAULT (0) FOR [PriceFrom]
GO
ALTER TABLE [dbo].[PriceRounding] ADD  CONSTRAINT [DF_PriceRounding_PriceTo]  DEFAULT (0) FOR [PriceTo]
GO
ALTER TABLE [dbo].[PriceRounding] ADD  CONSTRAINT [DF_PriceRounding_UseMultipleOfRule]  DEFAULT (0) FOR [UseMultipleOfRule]
GO
ALTER TABLE [dbo].[PriceRounding] ADD  CONSTRAINT [DF_PriceRounding_MultipleOf]  DEFAULT (0) FOR [MultipleOf]
GO
ALTER TABLE [dbo].[PriceRounding] ADD  CONSTRAINT [DF_PriceRounding_UseEndsInRule]  DEFAULT (0) FOR [UseEndsInRule]
GO
ALTER TABLE [dbo].[PriceRounding] ADD  CONSTRAINT [DF_PriceRounding_EndsIn]  DEFAULT (0) FOR [EndsIn]
GO
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_POTitle]  DEFAULT ('') FOR [POTitle]
GO
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_POType]  DEFAULT (0) FOR [POType]
GO
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_StoreID]  DEFAULT (0) FOR [StoreID]
GO
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_WorksheetID]  DEFAULT (0) FOR [WorksheetID]
GO
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_PONumber]  DEFAULT ('') FOR [PONumber]
GO
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_Status]  DEFAULT (0) FOR [Status]
GO
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_To]  DEFAULT ('') FOR [To]
GO
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_ShipTo]  DEFAULT ('') FOR [ShipTo]
GO
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_Requisitioner]  DEFAULT ('') FOR [Requisitioner]
GO
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_ShipVia]  DEFAULT ('') FOR [ShipVia]
GO
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_FOBPoint]  DEFAULT ('') FOR [FOBPoint]
GO
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_Terms]  DEFAULT ('') FOR [Terms]
GO
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_TaxRate]  DEFAULT (0) FOR [TaxRate]
GO
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_Shipping]  DEFAULT (0) FOR [Shipping]
GO
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_Freight]  DEFAULT ('') FOR [Freight]
GO
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_ConfirmingTo]  DEFAULT ('') FOR [ConfirmingTo]
GO
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_Remarks]  DEFAULT ('') FOR [Remarks]
GO
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_SupplierID]  DEFAULT (0) FOR [SupplierID]
GO
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF__PurchaseO__Other__7DC51FAF]  DEFAULT (0) FOR [OtherStoreID]
GO
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_CurrencyID]  DEFAULT (0) FOR [CurrencyID]
GO
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_ExchangeRate]  DEFAULT (1.0) FOR [ExchangeRate]
GO
ALTER TABLE [dbo].[PurchaseOrder] ADD  DEFAULT (0) FOR [OtherPOID]
GO
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_InventoryLocation]  DEFAULT (0) FOR [InventoryLocation]
GO
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [Df_PurchaseOrder_IsPlaced]  DEFAULT (0) FOR [IsPlaced]
GO
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_BatchNumber]  DEFAULT (0) FOR [BatchNumber]
GO
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_purchaseorder_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
ALTER TABLE [dbo].[PurchaseOrderEntry] ADD  CONSTRAINT [DF_PurchaseOrderEntry_ItemDescription]  DEFAULT ('') FOR [ItemDescription]
GO
ALTER TABLE [dbo].[PurchaseOrderEntry] ADD  CONSTRAINT [DF_PurchaseOrderEntry_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
ALTER TABLE [dbo].[PurchaseOrderEntry] ADD  CONSTRAINT [DF_PurchaseOrderEntry_QuantityReceivedToDate]  DEFAULT (0) FOR [QuantityReceivedToDate]
GO
ALTER TABLE [dbo].[PurchaseOrderEntry] ADD  CONSTRAINT [DF_PurchaseOrderEntry_StoreID]  DEFAULT (0) FOR [StoreID]
GO
ALTER TABLE [dbo].[PurchaseOrderEntry] ADD  CONSTRAINT [DF_PurchaseOrderEntry_PurchaseOrderID]  DEFAULT (0) FOR [PurchaseOrderID]
GO
ALTER TABLE [dbo].[PurchaseOrderEntry] ADD  CONSTRAINT [DF_PurchaseOrderEntry_QuantityOrdered]  DEFAULT (0) FOR [QuantityOrdered]
GO
ALTER TABLE [dbo].[PurchaseOrderEntry] ADD  CONSTRAINT [DF_PurchaseOrderEntry_QuantityReceived]  DEFAULT (0) FOR [QuantityReceived]
GO
ALTER TABLE [dbo].[PurchaseOrderEntry] ADD  CONSTRAINT [DF_PurchaseOrderEntry_ItemID]  DEFAULT (0) FOR [ItemID]
GO
ALTER TABLE [dbo].[PurchaseOrderEntry] ADD  CONSTRAINT [Df_PurchaseOrderEntry_OrderNumber]  DEFAULT ('') FOR [OrderNumber]
GO
ALTER TABLE [dbo].[PurchaseOrderEntry] ADD  CONSTRAINT [DF_PurchaseOrderEntry_Price]  DEFAULT (0) FOR [Price]
GO
ALTER TABLE [dbo].[PurchaseOrderEntry] ADD  CONSTRAINT [DF_PurchaseOrderEntry_Tax]  DEFAULT (0) FOR [TaxRate]
GO
ALTER TABLE [dbo].[PurchaseOrderEntry] ADD  CONSTRAINT [DF_PurchaseOrderEntry_InventoryOfflineID]  DEFAULT (0) FOR [InventoryOfflineID]
GO
ALTER TABLE [dbo].[PurchaseOrderEntry] ADD  CONSTRAINT [DF_purchaseorderentry_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
ALTER TABLE [dbo].[PurchaseOrderEntryDetail] ADD  CONSTRAINT [DF_ItemDetailHistory_StoreID]  DEFAULT (0) FOR [StoreID]
GO
ALTER TABLE [dbo].[PurchaseOrderEntryDetail] ADD  CONSTRAINT [DF_ItemDetailHistory_PurchaseOrderEntryID]  DEFAULT (0) FOR [PurchaseOrderEntryID]
GO
ALTER TABLE [dbo].[PurchaseOrderEntryDetail] ADD  CONSTRAINT [DF_ItemDetailHistory_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[PurchaseOrderEntryDetail] ADD  CONSTRAINT [DF_ItemDetailHistory_HistoryType]  DEFAULT (0) FOR [Status]
GO
ALTER TABLE [dbo].[PurchaseOrderEntryDetail] ADD  CONSTRAINT [DF_PurchaseOrderEntryDetail_SerialID]  DEFAULT (0) FOR [SerialID]
GO
ALTER TABLE [dbo].[PurchaseOrderEntryDetail] ADD  CONSTRAINT [DF_PurchaseOrderEntryDetail_SerialNumber1]  DEFAULT ('') FOR [SerialNumber1]
GO
ALTER TABLE [dbo].[PurchaseOrderEntryDetail] ADD  CONSTRAINT [DF_PurchaseOrderEntryDetail_SerialNumber2]  DEFAULT ('') FOR [SerialNumber2]
GO
ALTER TABLE [dbo].[PurchaseOrderEntryDetail] ADD  CONSTRAINT [DF_PurchaseOrderEntryDetail_SerialNumber3]  DEFAULT ('') FOR [SerialNumber3]
GO
ALTER TABLE [dbo].[PurchaseOrderEntryDetail] ADD  CONSTRAINT [DF_PurchaseOrderEntryDetail_InventoryOfflineID]  DEFAULT (0) FOR [InventoryOfflineID]
GO
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_Description]  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_HQID]  DEFAULT (0) FOR [HQID]
GO
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_DiscountOddItems]  DEFAULT (0) FOR [DiscountOddItems]
GO
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_Quantity1]  DEFAULT (0) FOR [Quantity1]
GO
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_Price1]  DEFAULT (0) FOR [Price1]
GO
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_Price1A]  DEFAULT (0) FOR [Price1A]
GO
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_Price1B]  DEFAULT (0) FOR [Price1B]
GO
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_Price1C]  DEFAULT (0) FOR [Price1C]
GO
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_Quantity2]  DEFAULT (0) FOR [Quantity2]
GO
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_Price2]  DEFAULT (0) FOR [Price2]
GO
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_Price2A]  DEFAULT (0) FOR [Price2A]
GO
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_Price2B]  DEFAULT (0) FOR [Price2B]
GO
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_Price2C]  DEFAULT (0) FOR [Price2C]
GO
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_Quantity3]  DEFAULT (0) FOR [Quantity3]
GO
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_Price3]  DEFAULT (0) FOR [Price3]
GO
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_Price3A]  DEFAULT (0) FOR [Price3A]
GO
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_Price3B]  DEFAULT (0) FOR [Price3B]
GO
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_Price3C]  DEFAULT (0) FOR [Price3C]
GO
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_Quantity4]  DEFAULT (0) FOR [Quantity4]
GO
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_Price4]  DEFAULT (0) FOR [Price4]
GO
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_Price4A]  DEFAULT (0) FOR [Price4A]
GO
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_Price4B]  DEFAULT (0) FOR [Price4B]
GO
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_Price4C]  DEFAULT (0) FOR [Price4C]
GO
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_Type]  DEFAULT (0) FOR [Type]
GO
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_PercentOffPrice1]  DEFAULT (0) FOR [PercentOffPrice1]
GO
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_PercentOffPrice1A]  DEFAULT (0) FOR [PercentOffPrice1A]
GO
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_PercentOffPrice1B]  DEFAULT (0) FOR [PercentOffPrice1B]
GO
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_PercentOffPrice1C]  DEFAULT (0) FOR [PercentOffPrice1C]
GO
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_PercentOffPrice2]  DEFAULT (0) FOR [PercentOffPrice2]
GO
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_PercentOffPrice2A]  DEFAULT (0) FOR [PercentOffPrice2A]
GO
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_PercentOffPrice2B]  DEFAULT (0) FOR [PercentOffPrice2B]
GO
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_PercentOffPrice2C]  DEFAULT (0) FOR [PercentOffPrice2C]
GO
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_PercentOffPrice3]  DEFAULT (0) FOR [PercentOffPrice3]
GO
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_PercentOffPrice3A]  DEFAULT (0) FOR [PercentOffPrice3A]
GO
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_PercentOffPrice3B]  DEFAULT (0) FOR [PercentOffPrice3B]
GO
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_PercentOffPrice3C]  DEFAULT (0) FOR [PercentOffPrice3C]
GO
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_PercentOffPrice4]  DEFAULT (0) FOR [PercentOffPrice4]
GO
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_PercentOffPricer4A]  DEFAULT (0) FOR [PercentOffPrice4A]
GO
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_PercentOffPrice4B]  DEFAULT (0) FOR [PercentOffPrice4B]
GO
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_PercentOffPrice4C]  DEFAULT (0) FOR [PercentOffPrice4C]
GO
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_quantitydiscount_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
ALTER TABLE [dbo].[QuoteTenderEntry] ADD  CONSTRAINT [DF_QuoteTenderEntry_OrderID]  DEFAULT (0) FOR [OrderID]
GO
ALTER TABLE [dbo].[QuoteTenderEntry] ADD  CONSTRAINT [DF_QuoteTenderEntry_TenderID]  DEFAULT (0) FOR [TenderID]
GO
ALTER TABLE [dbo].[QuoteTenderEntry] ADD  CONSTRAINT [DF_QuoteTenderEntry_CreditCardExpiration]  DEFAULT ('') FOR [CreditCardExpiration]
GO
ALTER TABLE [dbo].[QuoteTenderEntry] ADD  CONSTRAINT [DF_QuoteTenderEntry_CreditCardNumber]  DEFAULT ('') FOR [CreditCardNumber]
GO
ALTER TABLE [dbo].[QuoteTenderEntry] ADD  CONSTRAINT [DF_QuoteTenderEntry_CreditCardApprovalCode]  DEFAULT ('') FOR [CreditCardApprovalCode]
GO
ALTER TABLE [dbo].[QuoteTenderEntry] ADD  CONSTRAINT [DF_QuoteTenderEntry_Amount]  DEFAULT (0) FOR [Amount]
GO
ALTER TABLE [dbo].[QuoteTenderEntry] ADD  CONSTRAINT [DF_QuoteTenderEntry_RoundingError]  DEFAULT (0) FOR [RoundingError]
GO
ALTER TABLE [dbo].[QuoteTenderEntry] ADD  CONSTRAINT [DF_QuoteTenderEntry_AccountHolder]  DEFAULT ('') FOR [AccountHolder]
GO
ALTER TABLE [dbo].[Report] ADD  CONSTRAINT [DF_Report_ReportFilename]  DEFAULT ('') FOR [ReportFilename]
GO
ALTER TABLE [dbo].[Report] ADD  CONSTRAINT [DF_Report_Description]  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[Report] ADD  DEFAULT (0) FOR [StoreID]
GO
ALTER TABLE [dbo].[SalesRep] ADD  CONSTRAINT [DF_SalesRep_HQID]  DEFAULT (0) FOR [HQID]
GO
ALTER TABLE [dbo].[SalesRep] ADD  CONSTRAINT [DF_SalesRep_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
ALTER TABLE [dbo].[SalesRep] ADD  CONSTRAINT [DF_SalesRep_Number]  DEFAULT ('') FOR [Number]
GO
ALTER TABLE [dbo].[SalesRep] ADD  CONSTRAINT [DF_SalesRep_StoreID]  DEFAULT (0) FOR [StoreID]
GO
ALTER TABLE [dbo].[SalesRep] ADD  CONSTRAINT [DF_SalesRep_Name]  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[SalesRep] ADD  CONSTRAINT [DF_SalesRep_PercentOfSale]  DEFAULT (0) FOR [PercentOfSale]
GO
ALTER TABLE [dbo].[SalesRep] ADD  CONSTRAINT [DF_SalesRep_PercentOfProfit]  DEFAULT (0) FOR [PercentOfProfit]
GO
ALTER TABLE [dbo].[SalesRep] ADD  CONSTRAINT [DF_SalesRep_FixedRate]  DEFAULT (0) FOR [FixedRate]
GO
ALTER TABLE [dbo].[SalesRep] ADD  CONSTRAINT [DF_SalesRep_EmailAddress]  DEFAULT ('') FOR [EmailAddress]
GO
ALTER TABLE [dbo].[SalesRep] ADD  CONSTRAINT [Df_SalesRep_Telephone]  DEFAULT ('') FOR [Telephone]
GO
ALTER TABLE [dbo].[Schedule] ADD  CONSTRAINT [DF_Schedule_HQID]  DEFAULT (0) FOR [HQID]
GO
ALTER TABLE [dbo].[Schedule] ADD  CONSTRAINT [DF_Schedule_Description]  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[Schedule] ADD  CONSTRAINT [DF_Schedule_Increment]  DEFAULT (0) FOR [Increment]
GO
ALTER TABLE [dbo].[ScheduleSegment] ADD  CONSTRAINT [DF_ScheduleSegment_HQID]  DEFAULT (0) FOR [HQID]
GO
ALTER TABLE [dbo].[ScheduleSegment] ADD  CONSTRAINT [DF_ScheduleSegment_ScheduleID]  DEFAULT (0) FOR [ScheduleID]
GO
ALTER TABLE [dbo].[ScheduleSegment] ADD  CONSTRAINT [DF_ScheduleSegment_StartDay]  DEFAULT (0) FOR [StartDay]
GO
ALTER TABLE [dbo].[ScheduleSegment] ADD  CONSTRAINT [DF_ScheduleSegment_EndDay]  DEFAULT (0) FOR [EndDay]
GO
ALTER TABLE [dbo].[ScheduleSegment] ADD  CONSTRAINT [DF_ScheduleSegment_StartTime]  DEFAULT (getdate()) FOR [StartTime]
GO
ALTER TABLE [dbo].[ScheduleSegment] ADD  CONSTRAINT [DF_ScheduleSegment_EndTime]  DEFAULT (getdate()) FOR [EndTime]
GO
ALTER TABLE [dbo].[Shipping] ADD  CONSTRAINT [DF_Shipping_StoreID]  DEFAULT (0) FOR [StoreID]
GO
ALTER TABLE [dbo].[Shipping] ADD  CONSTRAINT [DF_Shipping_ServiceID]  DEFAULT (0) FOR [ServiceID]
GO
ALTER TABLE [dbo].[Shipping] ADD  CONSTRAINT [DF_Shipping_TransactionNumber]  DEFAULT (0) FOR [TransactionNumber]
GO
ALTER TABLE [dbo].[Shipping] ADD  CONSTRAINT [DF_Shipping_OrderHistoryID]  DEFAULT (0) FOR [OrderHistoryID]
GO
ALTER TABLE [dbo].[Shipping] ADD  CONSTRAINT [DF_Shipping_Charge]  DEFAULT (0) FOR [Charge]
GO
ALTER TABLE [dbo].[Shipping] ADD  CONSTRAINT [DF_Shipping_TrackingNumber]  DEFAULT ('') FOR [TrackingNumber]
GO
ALTER TABLE [dbo].[Shipping] ADD  CONSTRAINT [DF_Shipping_Notes]  DEFAULT ('') FOR [Notes]
GO
ALTER TABLE [dbo].[Shipping] ADD  CONSTRAINT [DF_Shipping_Name]  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[Shipping] ADD  CONSTRAINT [DF_Shipping_Company]  DEFAULT ('') FOR [Company]
GO
ALTER TABLE [dbo].[Shipping] ADD  CONSTRAINT [DF_Shipping_Address]  DEFAULT ('') FOR [Address]
GO
ALTER TABLE [dbo].[Shipping] ADD  CONSTRAINT [DF_Shipping_Address2]  DEFAULT ('') FOR [Address2]
GO
ALTER TABLE [dbo].[Shipping] ADD  CONSTRAINT [DF_Shipping_City]  DEFAULT ('') FOR [City]
GO
ALTER TABLE [dbo].[Shipping] ADD  CONSTRAINT [DF_Shipping_State]  DEFAULT ('') FOR [State]
GO
ALTER TABLE [dbo].[Shipping] ADD  CONSTRAINT [DF_Shipping_Zip]  DEFAULT ('') FOR [Zip]
GO
ALTER TABLE [dbo].[Shipping] ADD  CONSTRAINT [DF_Shipping_Country]  DEFAULT ('') FOR [Country]
GO
ALTER TABLE [dbo].[Shipping] ADD  CONSTRAINT [DF_Shipping_EmailAddress]  DEFAULT ('') FOR [EmailAddress]
GO
ALTER TABLE [dbo].[Shipping] ADD  CONSTRAINT [DF_Shipping_Status]  DEFAULT (0) FOR [Status]
GO
ALTER TABLE [dbo].[Shipping] ADD  CONSTRAINT [DF_Shipping_CODReturnTrackingNumber]  DEFAULT ('') FOR [CODReturnTrackingNumber]
GO
ALTER TABLE [dbo].[Shipping] ADD  CONSTRAINT [DF_Shipping_NetShipCost]  DEFAULT (0) FOR [NetShipCost]
GO
ALTER TABLE [dbo].[Shipping] ADD  CONSTRAINT [DF_Shipping_CarrierName]  DEFAULT ('') FOR [CarrierName]
GO
ALTER TABLE [dbo].[Shipping] ADD  CONSTRAINT [DF_Shipping_ServiceName]  DEFAULT ('') FOR [ServiceName]
GO
ALTER TABLE [dbo].[Shipping] ADD  CONSTRAINT [Df_Shipping_TotalWeight]  DEFAULT (0) FOR [TotalWeight]
GO
ALTER TABLE [dbo].[Shipping] ADD  CONSTRAINT [Df_Shipping_DeclaredValue]  DEFAULT (0) FOR [DeclaredValue]
GO
ALTER TABLE [dbo].[Shipping] ADD  CONSTRAINT [Df_Shipping_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Shipping] ADD  CONSTRAINT [Df_Shipping_PhoneNumber]  DEFAULT ('') FOR [PhoneNumber]
GO
ALTER TABLE [dbo].[Shipping] ADD  CONSTRAINT [Df_Shipping_FaxNumber]  DEFAULT ('') FOR [FaxNumber]
GO
ALTER TABLE [dbo].[ShippingCarrier] ADD  CONSTRAINT [DF_Carrier_Name]  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[ShippingCarrier] ADD  CONSTRAINT [DF_Carrier_URL]  DEFAULT ('') FOR [URL]
GO
ALTER TABLE [dbo].[ShippingCarrier] ADD  CONSTRAINT [DF_Carrier_TrackingURL]  DEFAULT ('') FOR [TrackingURL]
GO
ALTER TABLE [dbo].[ShippingCarrier] ADD  CONSTRAINT [DF_Carrier_ShippingURL]  DEFAULT ('') FOR [ShippingURL]
GO
ALTER TABLE [dbo].[ShippingCarrier] ADD  CONSTRAINT [DF_ShippingCarrier_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
ALTER TABLE [dbo].[ShippingCarrier] ADD  DEFAULT (0) FOR [HQID]
GO
ALTER TABLE [dbo].[ShippingCarrier] ADD  DEFAULT ('') FOR [Code]
GO
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_CarrierID]  DEFAULT (0) FOR [CarrierID]
GO
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Name]  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_ChargeByWeight]  DEFAULT (0) FOR [ChargeByWeight]
GO
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Interpolate]  DEFAULT (0) FOR [Interpolate]
GO
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Value1]  DEFAULT (0) FOR [Value1]
GO
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Charge1]  DEFAULT (0) FOR [Charge1]
GO
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Value2]  DEFAULT (0) FOR [Value2]
GO
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Charge2]  DEFAULT (0) FOR [Charge2]
GO
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Value3]  DEFAULT (0) FOR [Value3]
GO
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Charge3]  DEFAULT (0) FOR [Charge3]
GO
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Value4]  DEFAULT (0) FOR [Value4]
GO
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Charge4]  DEFAULT (0) FOR [Charge4]
GO
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Value5]  DEFAULT (0) FOR [Value5]
GO
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Charge5]  DEFAULT (0) FOR [Charge5]
GO
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Value6]  DEFAULT (0) FOR [Value6]
GO
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Charge6]  DEFAULT (0) FOR [Charge6]
GO
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Value7]  DEFAULT (0) FOR [Value7]
GO
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Charge7]  DEFAULT (0) FOR [Charge7]
GO
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Value8]  DEFAULT (0) FOR [Value8]
GO
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Charge8]  DEFAULT (0) FOR [Charge8]
GO
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Value9]  DEFAULT (0) FOR [Value9]
GO
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Charge9]  DEFAULT (0) FOR [Charge9]
GO
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Value10]  DEFAULT (0) FOR [Value10]
GO
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Charge10]  DEFAULT (0) FOR [Charge10]
GO
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Value11]  DEFAULT (0) FOR [Value11]
GO
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Charge11]  DEFAULT (0) FOR [Charge11]
GO
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Value12]  DEFAULT (0) FOR [Value12]
GO
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Charge12]  DEFAULT (0) FOR [Charge12]
GO
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Value13]  DEFAULT (0) FOR [Value13]
GO
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Charge13]  DEFAULT (0) FOR [Charge13]
GO
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Value14]  DEFAULT (0) FOR [Value14]
GO
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Charge14]  DEFAULT (0) FOR [Charge14]
GO
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Value15]  DEFAULT (0) FOR [Value15]
GO
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Charge15]  DEFAULT (0) FOR [Charge15]
GO
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_ShippingService_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
ALTER TABLE [dbo].[ShippingService] ADD  DEFAULT (0) FOR [HQID]
GO
ALTER TABLE [dbo].[ShippingService] ADD  DEFAULT ('') FOR [Code]
GO
ALTER TABLE [dbo].[ShippingWebPair] ADD  CONSTRAINT [DF_CarrierWebPairs_CarrierID]  DEFAULT (0) FOR [CarrierID]
GO
ALTER TABLE [dbo].[ShippingWebPair] ADD  CONSTRAINT [DF_CarrierWebPairs_Variable]  DEFAULT ('') FOR [Variable]
GO
ALTER TABLE [dbo].[ShippingWebPair] ADD  CONSTRAINT [DF_CarrierWebPairs_Value]  DEFAULT ('') FOR [Value]
GO
ALTER TABLE [dbo].[ShippingWebPair] ADD  CONSTRAINT [DF_ShippingWebPair_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
ALTER TABLE [dbo].[ShippingWebPair] ADD  CONSTRAINT [Df_ShippingWebPair_URL]  DEFAULT ('') FOR [URL]
GO
ALTER TABLE [dbo].[ShippingWebPair] ADD  CONSTRAINT [Df_ShippingWebPair_Direction]  DEFAULT (0) FOR [Direction]
GO
ALTER TABLE [dbo].[ShipTo] ADD  CONSTRAINT [DF_ShipTo_Address]  DEFAULT ('') FOR [Address]
GO
ALTER TABLE [dbo].[ShipTo] ADD  CONSTRAINT [DF_ShipTo_Address2]  DEFAULT ('') FOR [Address2]
GO
ALTER TABLE [dbo].[ShipTo] ADD  CONSTRAINT [DF_ShipTo_City]  DEFAULT ('') FOR [City]
GO
ALTER TABLE [dbo].[ShipTo] ADD  CONSTRAINT [DF_ShipTo_Company]  DEFAULT ('') FOR [Company]
GO
ALTER TABLE [dbo].[ShipTo] ADD  CONSTRAINT [DF_ShipTo_Country]  DEFAULT ('') FOR [Country]
GO
ALTER TABLE [dbo].[ShipTo] ADD  CONSTRAINT [DF_ShipTo_CustomerID]  DEFAULT (0) FOR [CustomerID]
GO
ALTER TABLE [dbo].[ShipTo] ADD  CONSTRAINT [DF_ShipTo_HQID]  DEFAULT (0) FOR [HQID]
GO
ALTER TABLE [dbo].[ShipTo] ADD  CONSTRAINT [DF_ShipTo_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
ALTER TABLE [dbo].[ShipTo] ADD  CONSTRAINT [DF_ShipTo_Name]  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[ShipTo] ADD  CONSTRAINT [DF_ShipTo_State]  DEFAULT ('') FOR [State]
GO
ALTER TABLE [dbo].[ShipTo] ADD  CONSTRAINT [DF_ShipTo_StoreID]  DEFAULT (0) FOR [StoreID]
GO
ALTER TABLE [dbo].[ShipTo] ADD  CONSTRAINT [DF_ShipTo_Zip]  DEFAULT ('') FOR [Zip]
GO
ALTER TABLE [dbo].[ShipTo] ADD  CONSTRAINT [DF_ShipTo_EmailAddress]  DEFAULT ('') FOR [EmailAddress]
GO
ALTER TABLE [dbo].[ShipTo] ADD  CONSTRAINT [Df_ShipTo_PhoneNumber]  DEFAULT ('') FOR [PhoneNumber]
GO
ALTER TABLE [dbo].[ShipTo] ADD  CONSTRAINT [Df_ShipTo_FaxNumber]  DEFAULT ('') FOR [FaxNumber]
GO
ALTER TABLE [dbo].[ShipTo] ADD  CONSTRAINT [DF_shipto_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
ALTER TABLE [dbo].[ShipTo] ADD  CONSTRAINT [DF_ShipTo_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_ID]  DEFAULT (0) FOR [ID]
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
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_ParentStoreID]  DEFAULT (0) FOR [ParentStoreID]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_ScheduleHourMask1]  DEFAULT (0) FOR [ScheduleHourMask1]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_ScheduleHourMask2]  DEFAULT (0) FOR [ScheduleHourMask2]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_ScheduleHourMask3]  DEFAULT (0) FOR [ScheduleHourMask3]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_ScheduleHourMask4]  DEFAULT (0) FOR [ScheduleHourMask4]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_ScheduleHourMask5]  DEFAULT (0) FOR [ScheduleHourMask5]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_ScheduleHourMask6]  DEFAULT (0) FOR [ScheduleHourMask6]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_ScheduleHourMask7]  DEFAULT (0) FOR [ScheduleHourMask7]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_ScheduleMinute]  DEFAULT (0) FOR [ScheduleMinute]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_RetryCount]  DEFAULT (0) FOR [RetryCount]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_RetryDelay]  DEFAULT (0) FOR [RetryDelay]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_AccountName]  DEFAULT ('') FOR [AccountName]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_Password]  DEFAULT ('') FOR [Password]
GO
ALTER TABLE [dbo].[Substitute] ADD  CONSTRAINT [DF_Subsitute_ItemID]  DEFAULT (0) FOR [ItemID]
GO
ALTER TABLE [dbo].[Substitute] ADD  CONSTRAINT [DF_Subsitute_SubsituteItemID]  DEFAULT (0) FOR [SubstituteItemID]
GO
ALTER TABLE [dbo].[Substitute] ADD  CONSTRAINT [DF_Substitute_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
ALTER TABLE [dbo].[TenderDenominations] ADD  CONSTRAINT [DF_TenderDenominations_TenderID]  DEFAULT (0) FOR [TenderID]
GO
ALTER TABLE [dbo].[TenderDenominations] ADD  CONSTRAINT [DF_TenderDenominations_Description]  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[TenderDenominations] ADD  CONSTRAINT [DF_TenderDenominations_Value]  DEFAULT (0) FOR [Value]
GO
ALTER TABLE [dbo].[TimeClock] ADD  CONSTRAINT [DF_TimeClock_StoreID]  DEFAULT (0) FOR [StoreID]
GO
ALTER TABLE [dbo].[TimeClock] ADD  CONSTRAINT [DF_TimeClock_CashierID]  DEFAULT (0) FOR [CashierID]
GO
ALTER TABLE [dbo].[TimeClock] ADD  CONSTRAINT [DF_TimeClock_TimeIn]  DEFAULT (getdate()) FOR [TimeIn]
GO
ALTER TABLE [dbo].[TimeClock] ADD  CONSTRAINT [DF_TimeClock_BatchNumber]  DEFAULT (0) FOR [BatchNumber]
GO
ALTER TABLE [dbo].[UserTopic] ADD  CONSTRAINT [DF_UserTopic_ContextID]  DEFAULT (0) FOR [ContextID]
GO
ALTER TABLE [dbo].[UserTopic] ADD  CONSTRAINT [DF_UserTopic_Title]  DEFAULT ('') FOR [Title]
GO
ALTER TABLE [dbo].[VisaNetAuthorization] ADD  CONSTRAINT [DF_VisaNetAuthorization_ResponseTransactionStatusCode]  DEFAULT ('') FOR [ResponseTransactionStatusCode]
GO
/****** Object:  StoredProcedure [dbo].[makePayment]    Script Date: 12/11/2017 1:09:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[makePayment] @RegisterNumber     INT, @PaymentAmount      MONEY, @StoreARAmount      MONEY, @CustomerID         INT, @CashierID          INT, @OverPayAmt         MONEY, @PartPayID          INT, @PartPayAmt         MONEY, @Transactions       VARCHAR(7168), @DirectDebit        BIT, @PayOutId           INT ASBEGIN /* ************************************** Inserted by NU Upgrade 3.0.0 Date 04-Dec-2016 10:03:48 http://www.pcanu.com.au ************************************** */ Set NoCount On DECLARE @PrintVar           AS VARCHAR(10) DECLARE @PrintVar2          AS VARCHAR(10) DECLARE @RegisterID         AS INT DECLARE @ErrorSave          AS INT    DECLARE @TransactionsLength AS INT DECLARE @OrigStoreARAmount  AS MONEY DECLARE @ARID               AS INT SET @ErrorSave = 0 IF @StoreARAmount IS NULL      BEGIN         RAISERROR ('Total amount must be defined', 16, 1)         RETURN (1)     END SET @OrigStoreARAmount = @StoreARAmount IF @PaymentAmount IS NOT NULL AND @PaymentAmount < 0     BEGIN         RAISERROR ('Payment amount must be greater or equal to 0.00', 16, 1)         RETURN (2)     END IF NOT EXISTS( select [customer].[id] from [customer] with (NOLOCK) where [customer].[id] = @CustomerID )     BEGIN         RAISERROR ('Customer (%d) is invalid', 16, 1,  @CustomerID)         RETURN (3)     END IF @CashierID <> 0 AND @CashierID IS NOT NULL AND NOT EXISTS( select [cashier].[id] from [cashier] with (NOLOCK) where [cashier].[id] = @CashierID )     BEGIN         RAISERROR ('Cashier (%d) is invalid', 16, 1, @CashierID)         RETURN (4)     END IF NOT EXISTS( select [register].[id] from [register] with (NOLOCK) where [register].[number] = @RegisterNumber )     BEGIN         RAISERROR ('Register number (%d) is invalid', 16, 1, @RegisterNumber)         RETURN (5)     END select @RegisterID = [register].[id] from [register] with (NOLOCK) where [register].[number] = @RegisterNumber IF @PartPayID IS NOT NULL AND NOT EXISTS( SELECT[accountreceivable].[id] FROM [accountreceivable] with (NOLOCK) WHERE [accountreceivable].[id] = @PartPayID )     BEGIN         RAISERROR ('Part payment account receivable id (%d) is invalid', 16, 1, @PartPayID)         RETURN (6)     END IF @PartPayID IS NOT NULL AND @PartPayAmt IS NULL     BEGIN         SET @PrintVar = cast(@PartPayAmt as varchar(10))         RAISERROR ('Inconsistent part payment amount (%s) and id (%d)', 16, 1, @PrintVar , @PartPayID )         RETURN (7)     END IF @PartPayID IS NULL AND @PartPayAmt IS NOT NULL     BEGIN         SET @PrintVar = cast(@PartPayAmt as varchar(10))         RAISERROR ('Inconsistent part payment amount (%s) and id (%d)', 16, 1, @PrintVar , @PartPayID )         RETURN (8)     END IF @OverPayAmt IS NULL      SET @OverPayAmt = 0.0 BEGIN TRANSACTION PAYMENT DECLARE @BatchNumber int DECLARE @PaymentID   int IF NOT EXISTS( select [batch].[batchnumber] from [batch] with (NOLOCK) where [batch].[status] = 0 and [batch].[registerid] = @RegisterID )     BEGIN         INSERT INTO [batch] ( [registerid] ) values ( @RegisterID )          IF (@@ERROR <> 0)             BEGIN                 SET @ErrorSave = @@ERROR                 ROLLBACK TRANSACTION PAYMENT                 RAISERROR ('Error inserting into batch', 16, 1)                 RETURN (@ErrorSave)             END         SELECT @BatchNumber = @@IDENTITY     END ELSE     BEGIN         SELECT @BatchNumber = [batch].[batchnumber] from [batch] with (NOLOCK) where [batch].[status] = 0 and [batch].[registerid] = @RegisterID         IF (@@ERROR <> 0)             BEGIN                 SET @ErrorSave = @@ERROR                 ROLLBACK TRANSACTION PAYMENT                 RAISERROR ('Error fetching batch batch record', 16, 1)                 RETURN (@ErrorSave)             END     END IF @PaymentAmount IS NOT NULL AND @PaymentAmount > 0.00     BEGIN         IF (@DirectDebit = 1)             BEGIN                 INSERT INTO [payment] ( [batchnumber], [cashierid], [customerid], [amount], [comment] )                        VALUES ( @BatchNumber, @CashierID, @CustomerID, @PaymentAmount, 'Direct Debit Payment' )             END         ELSE             BEGIN                 INSERT INTO [payment] ( [batchnumber], [cashierid], [customerid], [amount] )                        VALUES ( @BatchNumber, @CashierID, @CustomerID, @PaymentAmount )             END         IF (@@ERROR <> 0)             BEGIN                 SET @ErrorSave = @@ERROR                 ROLLBACK TRANSACTION PAYMENT                 RAISERROR ('Error inserting payment', 16, 1)                 RETURN (@ErrorSave)             END         SELECT @PaymentID = @@IDENTITY         IF @PayOutId IS NOT NULL         begin             UPDATE [journal] SET [transactiontype] = 15, [referenceid] = @PaymentId WHERE [transactiontype] = 12 and [referenceid] = @PayOutId         End     END ELSE SET @PaymentID = 0 DECLARE @Offset           INT DECLARE @CurrentChar      CHAR DECLARE @StrARID          VARCHAR(128) DECLARE @ARBalance        MONEY SET @Offset = 1    SET @TransactionsLength = DATALENGTH(@Transactions) SET @StrARID = '' IF @StoreARAmount <> 0.00      BEGIN         IF @TransactionsLength > 0               BEGIN                 WHILE @Offset <= @TransactionsLength                  BEGIN                     SET @CurrentChar = SUBSTRING(@Transactions, @Offset, 1)                     IF @CurrentChar = ','                         BEGIN                             SET @ARID = CAST(@StrARID AS INT)                             SELECT @ARBalance = [accountreceivable].[balance] from [accountreceivable] with (NOLOCK) where [accountreceivable].[id] = @ARID                             IF (@@ERROR <> 0)                                 BEGIN                                     SET @ErrorSave = @@ERROR                                     ROLLBACK TRANSACTION PAYMENT                                     RAISERROR ('Unable to locate account receivable transaction (%s)', 16, 1, @StrARID)                                     RETURN (@ErrorSave)                                 END                             IF ( @ARBalance IS NULL )                                 BEGIN                                     ROLLBACK TRANSACTION PAYMENT                                     RAISERROR ('Unable to find account receivable transaction (%s)', 16, 1, @StrARID)                                     RETURN (14)                                 END                                                          INSERT INTO [accountreceivablehistory] ( [accountreceivableid], [batchnumber], [amount], [paymentid], [comment], [cashierid], [historytype] )                                    VALUES ( @ARID, @BatchNumber, -@ARBalance, @PaymentID, 'NUHQ: Auto multistore payment', @CashierID, 2 )                             IF (@@ERROR <> 0)                                 BEGIN                                     SET @ErrorSave = @@ERROR                                     ROLLBACK TRANSACTION PAYMENT                                     RAISERROR ('Unable to insert transaction accountreceivablehistory for account receivable (%s)', 16, 1, @StrARID)                                     RETURN (@ErrorSave)                                 END                                  UPDATE [accountreceivable] SET [accountreceivable].[balance] = 0 WHERE [accountreceivable].[id] = @ARID                             IF (@@ERROR <> 0)                                 BEGIN                                     SET @ErrorSave = @@ERROR                                     ROLLBACK TRANSACTION PAYMENT                                     RAISERROR ('Unable to update accountreceivable for account receivable (%s)', 16, 1, @StrARID)                                     RETURN (@ErrorSave)                                 END                             SET @StoreARAmount = @StoreARAmount - @ARBalance                             SET @StrARID = ''                         END                     ELSE                          SET @StrARID = @StrARID + @CurrentChar                     SET @Offset = @Offset + 1                 END                 SET @ARID = CAST(@StrARID AS INT)                 SELECT @ARBalance = [accountreceivable].[balance] from [accountreceivable] with (NOLOCK) where [accountreceivable].[id] = @ARID                 IF (@@ERROR <> 0)                     BEGIN                         SET @ErrorSave = @@ERROR                         ROLLBACK TRANSACTION PAYMENT                         RAISERROR ('Unable to locate account receivable transaction (%s)', 16, 1, @StrARID)                         RETURN (@ErrorSave)                     END                 IF ( @ARBalance IS NULL )                     BEGIN                         ROLLBACK TRANSACTION PAYMENT                         RAISERROR ('Unable to find account receivable transaction (%s)', 16, 1, @StrARID)                         RETURN (14)                     END                 INSERT INTO [accountreceivablehistory] ( [accountreceivableid], [batchnumber], [amount], [paymentid], [comment], [cashierid], [historytype] )                        VALUES ( @ARID, @BatchNumber, -@ARBalance, @PaymentID, 'NUHQ: Auto multistore payment', @CashierID, 2 )                 IF (@@ERROR <> 0)                     BEGIN                         SET @ErrorSave = @@ERROR                         ROLLBACK TRANSACTION PAYMENT                         RAISERROR ('Unable to insert final transaction accountreceivablehistory for account receivable (%s)', 16, 1, @StrARID)                         RETURN (@ErrorSave)                     END                      UPDATE [accountreceivable] SET [accountreceivable].[balance] = 0 WHERE [accountreceivable].[id] = @ARID                 IF (@@ERROR <> 0)                     BEGIN                         SET @ErrorSave = @@ERROR                         ROLLBACK TRANSACTION PAYMENT                         RAISERROR ('Unable to update accountreceivable for account receivable (%s)', 16, 1, @StrARID)                         RETURN (@ErrorSave)                     END                 SET @StoreARAmount = @StoreARAmount - @ARBalance                 SET @StrARID = ''             END         ELSE             BEGIN                 DECLARE @FIFOARID    INT                 DECLARE @FIFOBalance MONEY                 DECLARE @FIFOLeft    MONEY                 DECLARE @FIFOPayAmt  MONEY                 SET @FIFOLeft = 0.0                 IF @STOREARAmount IS NOT NULL                     SET @FIFOLeft = @StoreARAmount                 IF @PartPayAmt  IS NOT NULL                     SET @FIFOLeft = @FIFOLeft - @PartPayAmt                     DECLARE TransCursor CURSOR FORWARD_ONLY STATIC FOR                     SELECT  [ar].id, [ar].balance                     FROM    [customer] with (NOLOCK) left join [accountReceivable] [ar] with (NOLOCK) on [ar].customerid = [customer].id                                          LEFT OUTER JOIN [transaction] with (NOLOCK) on [ar].transactionnumber = [transaction].transactionnumber                                          Where [AR].balance Is Not Null                                          AND     [ar].balance > 0.0                     AND     [customer].id = @CustomerID                     AND     ( [transaction].[exchangeid] is null or [transaction].[exchangeid] <> 1 )                     ORDER BY [ar].[date] ASC                 OPEN TransCursor                 FETCH NEXT FROM TransCursor                 INTO @FIFOARID, @FIFOBalance                 WHILE (@@FETCH_STATUS = 0 AND @FIFOLeft > 0.00)                 BEGIN                     IF @FIFOLeft - @FIFOBalance < 0                         BEGIN                             SET @FIFOPayAmt = @FIFOLeft                         END                     ELSE                         BEGIN                             SET @FIFOPayAmt = @FIFOBalance                         END                     INSERT INTO [accountreceivablehistory] ( [accountreceivableid], [batchnumber], [amount], [paymentid], [comment], [cashierid], [historytype] )                            VALUES ( @FIFOARID, @BatchNumber, -@FIFOPayAmt, @PaymentID, 'NUHQ: Auto multistore payment', @CashierID, 2 )                     IF (@@ERROR <> 0)                         BEGIN                             SET @ErrorSave = @@ERROR                             ROLLBACK TRANSACTION PAYMENT                             RAISERROR ('Unable to insert fifo accountreceivablehistory for account receivable (%d)', 16, 1, @FIFOARID )                             RETURN (@ErrorSave)                         END                          UPDATE [accountreceivable] SET [accountreceivable].[balance] = [accountreceivable].[balance] - @FIFOPayAmt WHERE [accountreceivable].[id] = @FIFOARID                     IF (@@ERROR <> 0)                         BEGIN                             SET @ErrorSave = @@ERROR                             ROLLBACK TRANSACTION PAYMENT                             RAISERROR ('Unable to update accountreceivable for account receivable (%d)', 16, 1, @FIFOARID)                             RETURN (@ErrorSave)                         END                     SET @FIFOLeft = @FIFOLeft - @FIFOPayAmt                     FETCH NEXT FROM TransCursor                     INTO @FIFOARID, @FIFOBalance                 END                 CLOSE TransCursor                 DEALLOCATE TransCursor                 SET @OverPayAmt = @OverPayAmt + @FIFOLeft                 SET @StoreARAmount = 0.00             END      END IF @PartPayID IS NOT NULL AND @PartPayID > 0     BEGIN         SELECT @ARBalance = [accountreceivable].[balance] FROM [accountreceivable] with (NOLOCK) WHERE [accountreceivable].[id] = @PartPayID         IF (@@ERROR <> 0)             BEGIN                 SET @ErrorSave = @@ERROR                 ROLLBACK TRANSACTION PAYMENT                 RAISERROR ('Unable to fetch part payment accountreceivable id for account receivable (%s)', 16, 1, @StrARID)                 RETURN (@ErrorSave)             END         IF ( @ARBalance IS NULL )             BEGIN                 ROLLBACK TRANSACTION PAYMENT                 RAISERROR ('Unable to find account receivable transaction (%s)', 16, 1, @StrARID)                 RETURN (14)             END         IF (@ARBalance < @PartPayAmt)             BEGIN                 SET @PrintVar = CAST(@PartPayAmt AS varchar(10))                 SET @PrintVar2 = CAST(@ARBalance AS varchar(10))                 ROLLBACK TRANSACTION PAYMENT                 RAISERROR ('Part payment for account receivable (%d) is too much. Max is (%s-%s)', 16, 1, @PartPayID, @PrintVar, @PrintVar2 )                 RETURN (13)             END         INSERT INTO [accountreceivablehistory] ( [accountreceivableid], [batchnumber], [amount], [paymentid], [comment], [cashierid], [historytype] )                VALUES ( @PartPayID, @BatchNumber, -@PartPayAmt, @PaymentID, 'NUHQ: Auto multistore part payment', @CashierID, 2 )         IF (@@ERROR <> 0)             BEGIN                 SET @ErrorSave = @@ERROR                 ROLLBACK TRANSACTION PAYMENT                 RAISERROR ('Unable to insert part payment accountreceivablehistory for account receivable (%d)', 16, 1, @PartPayID)                 RETURN (@ErrorSave)             END              UPDATE [accountreceivable] SET [accountreceivable].[balance] = [accountreceivable].[balance] - @PartPayAmt WHERE [accountreceivable].[id] = @PartPayID         IF (@@ERROR <> 0)             BEGIN                 SET @ErrorSave = @@ERROR                 ROLLBACK TRANSACTION PAYMENT                 RAISERROR ('Unable to update part payment accountreceivable for account receivable (%d)', 16, 1, @PartPayID)                 RETURN (@ErrorSave)             END         SET @StoreARAmount = @StoreARAmount - @PartPayAmt     END IF 0.00 <> @StoreARAmount BEGIN     SET @PrintVar = CAST(@StoreARAmount AS varchar(10))     ROLLBACK TRANSACTION PAYMENT     RAISERROR ('Incorrect balance at end of payments. Expected (0) got (%s)', 16, 1, @PrintVar)     RETURN (14) END      IF @OverPayAmt IS NOT NULL AND @OverPayAmt > 0.00     BEGIN         INSERT INTO [accountreceivable] ( [customerid], [originalamount], [transactionnumber], [type], [balance] )                VALUES ( @CustomerID, -@OverPayAmt, 0, 2, -@OverPayAmt )         IF (@@ERROR <> 0)             BEGIN                 SET @ErrorSave = @@ERROR                 ROLLBACK TRANSACTION PAYMENT                 RAISERROR ('Error inserting overpayment into accountreceivable', 16, 1)                 RETURN (@ErrorSave)             END         SELECT @ARID = @@IDENTITY         INSERT INTO [accountreceivablehistory] ( [accountreceivableid], [batchnumber], [amount], [paymentid], [comment], [cashierid], [historytype] )                VALUES ( @ARID, @BatchNumber, -@OverPayAmt, @PaymentID, 'NUHQ: Auto multistore credit payment', @CashierID, 2 )         IF (@@ERROR <> 0)             BEGIN                 SET @ErrorSave = @@ERROR                 ROLLBACK TRANSACTION PAYMENT                 RAISERROR ('Unable to insert overpayment accountreceivablehistory', 16, 1)                 RETURN (@ErrorSave)             END          END IF (@OrigStoreARAmount IS NOT NULL AND @OrigStoreARAmount <> 0.00)     BEGIN         UPDATE [customer] set [customer].[accountbalance] = [customer].[accountbalance] - @OrigStoreARAmount,                               [customer].[totalvisits]    = [customer].[totalvisits]    + 1,                               [customer].[lastvisit]      = CURRENT_TIMESTAMP,                               [customer].[lastupdated]    = CURRENT_TIMESTAMP                 where [customer].[id] = @CustomerID         IF (@@ERROR <> 0)             BEGIN                 SET @ErrorSave = @@ERROR                 ROLLBACK TRANSACTION PAYMENT                 RAISERROR ('Error updating customer account balance', 16, 1)                 RETURN (@ErrorSave)             END     END COMMIT TRANSACTION PAYMENT RETURN (0)END
GO
USE [master]
GO
ALTER DATABASE [Storeops] SET  READ_WRITE 
GO
