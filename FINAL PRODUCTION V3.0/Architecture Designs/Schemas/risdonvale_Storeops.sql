USE [master]
GO
/****** Object:  Database [Storeops]    Script Date: 11/09/2017 15:37:46 ******/
CREATE DATABASE [Storeops] ON  PRIMARY 
( NAME = N'QSDB_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Storeops.mdf' , SIZE = 1265472KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'QSDB_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Storeops_1.ldf' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
GO
ALTER DATABASE [Storeops] SET COMPATIBILITY_LEVEL = 80
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
ALTER DATABASE [Storeops] SET AUTO_CREATE_STATISTICS ON
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
ALTER DATABASE [Storeops] SET  READ_WRITE
GO
ALTER DATABASE [Storeops] SET RECOVERY SIMPLE
GO
ALTER DATABASE [Storeops] SET  MULTI_USER
GO
ALTER DATABASE [Storeops] SET PAGE_VERIFY NONE
GO
ALTER DATABASE [Storeops] SET DB_CHAINING OFF
GO
USE [Storeops]
GO
/****** Object:  User [ims]    Script Date: 11/09/2017 15:37:46 ******/
CREATE USER [ims] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [dw_user]    Script Date: 11/09/2017 15:37:46 ******/
CREATE USER [dw_user] FOR LOGIN [dw_user] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[QuoteTenderEntry]    Script Date: 11/09/2017 15:37:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Message]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FromCashierID] [int] NOT NULL,
	[ToCashierID] [int] NOT NULL,
	[Title] [nvarchar](30) NOT NULL,
	[Text] [nvarchar](2000) NOT NULL,
	[DateSent] [datetime] NOT NULL,
	[DateRead] [datetime] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[StoreID] [int] NOT NULL,
 CONSTRAINT [PK_Message] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImportEntry]    Script Date: 11/09/2017 15:37:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Import]    Script Date: 11/09/2017 15:37:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhysicalInventoryEntry]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhysicalInventoryEntry](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [int] NOT NULL,
	[PhysicalInventoryID] [int] NOT NULL,
	[ReasonCodeID] [int] NOT NULL,
	[CountTime] [datetime] NULL,
	[ItemID] [int] NOT NULL,
	[BinLocation] [nvarchar](100) NOT NULL,
	[Price] [money] NOT NULL,
	[Cost] [money] NOT NULL,
	[QuantityCounted] [float] NOT NULL,
	[QuantitySold] [float] NOT NULL,
	[QuantityReturned] [float] NOT NULL,
	[QuantityXferIn] [float] NOT NULL,
	[QuantityXferOut] [float] NOT NULL,
	[QuantityAdjusted] [float] NOT NULL,
	[QuantityToOffline] [float] NOT NULL,
	[QuantityFromOffline] [float] NOT NULL,
	[QuantityRefreshed] [float] NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[NUSSkipUpdate] [bit] NOT NULL,
 CONSTRAINT [PK_PhysicalInventoryEntry] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OldJournal]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OldJournal](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [int] NOT NULL,
	[BatchNumber] [int] NOT NULL,
	[ClosingTime] [datetime] NOT NULL,
	[Journal] [image] NULL,
	[DBTimeStamp] [timestamp] NULL,
 CONSTRAINT [PK_OldJournal] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NUS_Unmatched_Scripts]    Script Date: 11/09/2017 15:37:49 ******/
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
/****** Object:  Table [dbo].[NUS_TransactionStats]    Script Date: 11/09/2017 15:37:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NUS_Settings_Entry]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NUS_Settings_Entry](
	[NUS_Settings_Alias] [nvarchar](50) NOT NULL,
	[Value] [nvarchar](500) NULL,
	[Restriction] [nvarchar](255) NULL,
	[Default] [bit] NOT NULL
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_NUS_Settings_Entry_v2] ON [dbo].[NUS_Settings_Entry] 
(
	[NUS_Settings_Alias] ASC,
	[Restriction] ASC,
	[Default] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NUS_Settings]    Script Date: 11/09/2017 15:37:49 ******/
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
	[hidden] [bit] NOT NULL,
	[tooltip] [nvarchar](500) NULL,
	[type] [tinyint] NOT NULL,
	[Source] [tinyint] NOT NULL,
 CONSTRAINT [PK_NUS_Settings] PRIMARY KEY NONCLUSTERED 
(
	[alias] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NUS_Reason_Codes]    Script Date: 11/09/2017 15:37:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NUS_PostCodeTransaction]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RecordDeletedLog]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordDeletedLog](
	[TableName] [nvarchar](30) NOT NULL,
	[IDFieldName] [nvarchar](30) NOT NULL,
	[RecordID] [int] NOT NULL,
	[WhenDeleted] [datetime] NOT NULL,
	[StoreID] [int] NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [IX_TableName] ON [dbo].[RecordDeletedLog] 
(
	[TableName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ARHistoryMirror]    Script Date: 11/09/2017 15:37:49 ******/
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
/****** Object:  Table [dbo].[AccountingTerms]    Script Date: 11/09/2017 15:37:49 ******/
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
/****** Object:  Table [dbo].[AccountingAccounts]    Script Date: 11/09/2017 15:37:49 ******/
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
/****** Object:  Table [dbo].[CalendarEvent]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CalendarEvent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [int] NOT NULL,
	[CashierID] [int] NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[Text] [nvarchar](255) NOT NULL,
	[ReminderEnabled] [bit] NOT NULL,
	[ReminderDate] [datetime] NOT NULL,
	[IsPersonal] [bit] NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
 CONSTRAINT [PK_CalendarEvent] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_CashierID] ON [dbo].[CalendarEvent] 
(
	[CashierID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomCaption]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomCaption](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HQID] [int] NOT NULL,
	[Style] [int] NOT NULL,
	[Caption] [nvarchar](50) NOT NULL,
	[DBTimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_CustomCaption] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DatabaseMetaData]    Script Date: 11/09/2017 15:37:49 ******/
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
/****** Object:  Table [dbo].[DailySales]    Script Date: 11/09/2017 15:37:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TypeID] ON [dbo].[DailySales] 
(
	[TypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exchange]    Script Date: 11/09/2017 15:37:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MacroEvent]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MacroEvent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MacroID] [int] NOT NULL,
	[Message] [int] NOT NULL,
	[ParamL] [int] NOT NULL,
	[ParamH] [int] NOT NULL,
	[Time] [int] NOT NULL,
	[hWnd] [int] NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
 CONSTRAINT [PK_MacroEvent] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Macro]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Macro](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RegisterID] [int] NOT NULL,
	[Caption] [nvarchar](50) NOT NULL,
	[AssignmentNumber] [int] NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
 CONSTRAINT [PK_Macro] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LimitEntry]    Script Date: 11/09/2017 15:37:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ItemID] ON [dbo].[LimitEntry] 
(
	[ItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NUS_PO_Log]    Script Date: 11/09/2017 15:37:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NUS_NUHQ_RequestTypes]    Script Date: 11/09/2017 15:37:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [IX_NUS_NUHQ_RequestTypes] ON [dbo].[NUS_NUHQ_RequestTypes] 
(
	[lastupdated] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NUS_NUHQ_Requests]    Script Date: 11/09/2017 15:37:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_NUS_NUHQ_Requests] ON [dbo].[NUS_NUHQ_Requests] 
(
	[NUHQ_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NUS_NUHQ_Log]    Script Date: 11/09/2017 15:37:49 ******/
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
CREATE NONCLUSTERED INDEX [IDX_NUS_NUHQ_LOG] ON [dbo].[NUS_NUHQ_Log] 
(
	[Table] ASC,
	[Key] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NUS_MonitorCommand]    Script Date: 11/09/2017 15:37:49 ******/
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
/****** Object:  Table [dbo].[NUS_Monitor]    Script Date: 11/09/2017 15:37:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NUS_MarketSmart_Transaction]    Script Date: 11/09/2017 15:37:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [NUS_MarketSmart_Transaction_DateSendComplete] ON [dbo].[NUS_MarketSmart_Transaction] 
(
	[DateSendComplete] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NUS_LicenceLog]    Script Date: 11/09/2017 15:37:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NUS_Labels]    Script Date: 11/09/2017 15:37:49 ******/
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
/****** Object:  Table [dbo].[NUS_Installers]    Script Date: 11/09/2017 15:37:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NUS_Hire]    Script Date: 11/09/2017 15:37:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NUS_Fred2Pos_Dat]    Script Date: 11/09/2017 15:37:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NUS_FieldMap]    Script Date: 11/09/2017 15:37:49 ******/
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
	[soisKey] [bit] NULL,
	[Nuhqiskey] [bit] NULL,
	[Nuhqenc] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NUS_DBVersion]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NUS_DBVersion](
	[Version] [varchar](64) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NUS_Clients]    Script Date: 11/09/2017 15:37:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NUS_Banner_Ads]    Script Date: 11/09/2017 15:37:49 ******/
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
/****** Object:  Table [dbo].[NUS_Active_Programs]    Script Date: 11/09/2017 15:37:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NonTenderTransaction]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NonTenderTransaction](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [int] NOT NULL,
	[TransactionType] [smallint] NOT NULL,
	[BatchNumber] [int] NOT NULL,
	[Time] [datetime] NOT NULL,
	[CashierID] [int] NOT NULL,
	[Comment] [nvarchar](50) NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[ReasonCodeID] [int] NOT NULL,
 CONSTRAINT [PK_NonTenderTransaction] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_BatchNumber] ON [dbo].[NonTenderTransaction] 
(
	[BatchNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Report]    Script Date: 11/09/2017 15:37:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Description] ON [dbo].[Report] 
(
	[Description] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Security]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Security](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FormName] [nvarchar](30) NOT NULL,
	[ClassName] [nvarchar](30) NOT NULL,
	[ControlType] [nvarchar](30) NOT NULL,
	[ControlName] [nvarchar](30) NOT NULL,
	[ControlIndex] [int] NOT NULL,
	[ReadDisableCode] [int] NOT NULL,
	[ChangeDisableCode] [int] NOT NULL,
	[ColumnTitle] [nvarchar](30) NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[StoreID] [int] NOT NULL,
 CONSTRAINT [PK_Security] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ClassName] ON [dbo].[Security] 
(
	[ClassName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FormName] ON [dbo].[Security] 
(
	[FormName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaxTotals]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaxTotals](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[StoreID] [int] NOT NULL,
	[BatchNumber] [int] NOT NULL,
	[TaxID] [int] NOT NULL,
	[Total] [money] NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[NUSSkipUpdate] [bit] NOT NULL,
 CONSTRAINT [PK_TaxTotals] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_BatchNumber] ON [dbo].[TaxTotals] 
(
	[BatchNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TaxID] ON [dbo].[TaxTotals] 
(
	[TaxID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaxEntry]    Script Date: 11/09/2017 15:37:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TaxID] ON [dbo].[TaxEntry] 
(
	[TaxID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TransactionNumber] ON [dbo].[TaxEntry] 
(
	[TransactionNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SignatureCapture]    Script Date: 11/09/2017 15:37:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeCard]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeCard](
	[StoreID] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CashierID] [int] NOT NULL,
	[RegisterID] [int] NOT NULL,
	[TimeIn] [datetime] NOT NULL,
	[TimeOut] [datetime] NOT NULL,
	[Hours] [real] NOT NULL,
	[DBTimeStamp] [timestamp] NULL
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_CashierID] ON [dbo].[TimeCard] 
(
	[CashierID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VoucherEntry]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VoucherEntry](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [int] NOT NULL,
	[VoucherID] [int] NOT NULL,
	[TransactionEntryID] [int] NOT NULL,
	[TenderEntryID] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Amount] [money] NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[TransactionNumber] [int] NOT NULL,
 CONSTRAINT [PK_VoucherEntry] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_VoucherID] ON [dbo].[VoucherEntry] 
(
	[VoucherID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Voucher]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voucher](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [int] NOT NULL,
	[Number] [nvarchar](20) NOT NULL,
	[ExpirationDate] [datetime] NULL,
	[DBTimeStamp] [timestamp] NULL,
	[ItemID] [int] NOT NULL,
	[Balance] [money] NOT NULL,
 CONSTRAINT [PK_Voucher] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Number] ON [dbo].[Voucher] 
(
	[Number] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VisaNetBatch]    Script Date: 11/09/2017 15:37:49 ******/
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
/****** Object:  Table [dbo].[VisaNetAuthorization]    Script Date: 11/09/2017 15:37:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VersionHistory]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VersionHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Version] [nvarchar](10) NOT NULL,
	[Description] [ntext] NULL,
	[Date] [datetime] NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[StoreID] [int] NOT NULL,
 CONSTRAINT [PK_VersionHistory] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTopic]    Script Date: 11/09/2017 15:37:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionHoldEntry]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionHoldEntry](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EntryKey] [nvarchar](10) NOT NULL,
	[StoreID] [int] NOT NULL,
	[TransactionHoldID] [int] NOT NULL,
	[RecallID] [int] NOT NULL,
	[Description] [nvarchar](30) NOT NULL,
	[QuantityPurchased] [float] NOT NULL,
	[QuantityOnOrder] [float] NOT NULL,
	[QuantityRTD] [float] NOT NULL,
	[QuantityReserved] [float] NOT NULL,
	[Price] [money] NOT NULL,
	[FullPrice] [money] NOT NULL,
	[PriceSource] [smallint] NOT NULL,
	[Comment] [nvarchar](255) NOT NULL,
	[DetailID] [int] NOT NULL,
	[Taxable] [bit] NOT NULL,
	[ItemID] [int] NOT NULL,
	[SalesRepID] [int] NOT NULL,
	[SerialNumber1] [nvarchar](20) NOT NULL,
	[SerialNumber2] [nvarchar](20) NOT NULL,
	[SerialNumber3] [nvarchar](20) NOT NULL,
	[VoucherNumber] [nvarchar](20) NOT NULL,
	[VoucherExpirationDate] [datetime] NULL,
	[DBTimeStamp] [timestamp] NULL,
	[DiscountReasonCodeID] [int] NOT NULL,
	[ReturnReasonCodeID] [int] NOT NULL,
	[TaxChangeReasonCodeID] [int] NOT NULL,
	[ItemTaxID] [int] NOT NULL,
	[ComponentQuantityReserved] [float] NOT NULL,
 CONSTRAINT [PK_TransactionHoldEntry] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionHold]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionHold](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [int] NOT NULL,
	[TransactionType] [smallint] NOT NULL,
	[HoldComment] [nvarchar](255) NOT NULL,
	[RecallID] [int] NOT NULL,
	[Comment] [nvarchar](50) NOT NULL,
	[PriceLevel] [smallint] NOT NULL,
	[DiscountMethod] [smallint] NOT NULL,
	[DiscountPercent] [float] NOT NULL,
	[Taxable] [bit] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[DeltaDeposit] [money] NOT NULL,
	[DepositOverride] [bit] NOT NULL,
	[DepositPrevious] [money] NOT NULL,
	[PaymentsPrevious] [money] NOT NULL,
	[TaxPrevious] [money] NOT NULL,
	[SalesRepID] [int] NOT NULL,
	[ShipToID] [int] NOT NULL,
	[TransactionTime] [datetime] NOT NULL,
	[ExpirationOrDueDate] [datetime] NOT NULL,
	[ReturnMode] [bit] NOT NULL,
	[ReferenceNumber] [nvarchar](50) NOT NULL,
	[ShippingChargePurchased] [money] NOT NULL,
	[ShippingChargeOverride] [bit] NOT NULL,
	[ShippingServiceID] [int] NOT NULL,
	[ShippingTrackingNumber] [nvarchar](255) NOT NULL,
	[ShippingNotes] [ntext] NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[ReasonCodeID] [int] NOT NULL,
	[ExchangeID] [int] NOT NULL,
	[ChannelType] [int] NOT NULL,
	[DefaultDiscountReasonCodeID] [int] NOT NULL,
	[DefaultReturnReasonCodeID] [int] NOT NULL,
	[DefaultTaxChangeReasonCodeID] [int] NOT NULL,
	[BatchNumber] [int] NOT NULL,
 CONSTRAINT [PK_TransactionHold] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeStampLog]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TimeStampLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServerTime] [datetime] NOT NULL,
	[ServerTimeStamp] [varbinary](8) NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[StoreID] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE CLUSTERED INDEX [IX_ServerTime] ON [dbo].[TimeStampLog] 
(
	[ServerTime] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeClock]    Script Date: 11/09/2017 15:37:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_CashierID] ON [dbo].[TimeClock] 
(
	[CashierID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PriceRounding]    Script Date: 11/09/2017 15:37:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PoleDisplayMessage]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PoleDisplayMessage](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](25) NOT NULL,
	[MessageLine1] [nvarchar](255) NOT NULL,
	[EffectLine1] [smallint] NOT NULL,
	[UpdateRateLine1] [smallint] NOT NULL,
	[DateAndTimeLine1] [bit] NOT NULL,
	[ScrollChangeSizeLine1] [smallint] NOT NULL,
	[MessageLine2] [nvarchar](255) NOT NULL,
	[EffectLine2] [smallint] NOT NULL,
	[UpdateRateLine2] [smallint] NOT NULL,
	[DateAndTimeLine2] [bit] NOT NULL,
	[ScrollChangeSizeLine2] [smallint] NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[StoreID] [int] NOT NULL,
 CONSTRAINT [PK_PoleDisplayMessage] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionEntry]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionEntry](
	[Commission] [money] NOT NULL,
	[Cost] [money] NOT NULL,
	[FullPrice] [money] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
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
 CONSTRAINT [PK_TransactionEntry] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDX_NUS_ClubTransactionEntry] ON [dbo].[TransactionEntry] 
(
	[ID] ASC,
	[FullPrice] ASC,
	[Price] ASC,
	[TransactionNumber] ASC,
	[ItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ItemID] ON [dbo].[TransactionEntry] 
(
	[ItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TransactionEntryTransactionNumber] ON [dbo].[TransactionEntry] 
(
	[TransactionNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TransactionNumber] ON [dbo].[TransactionEntry] 
(
	[TransactionNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction](
	[ShipToID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[TransactionNumber] [int] IDENTITY(1,1) NOT NULL,
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
 CONSTRAINT [PK_Transaction] PRIMARY KEY NONCLUSTERED 
(
	[TransactionNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDX_NUS_ClubTransaction] ON [dbo].[Transaction] 
(
	[TransactionNumber] ASC,
	[Time] ASC,
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_BatchNumber] ON [dbo].[Transaction] 
(
	[BatchNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_CustomerID] ON [dbo].[Transaction] 
(
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ReferenceNumber] ON [dbo].[Transaction] 
(
	[ReferenceNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TouchScreenKeyboardEntry]    Script Date: 11/09/2017 15:37:49 ******/
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
	[Style] [int] NOT NULL,
 CONSTRAINT [PK_TouchScreenKeyboardEntry] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TouchScreenKeyboard]    Script Date: 11/09/2017 15:37:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TenderTotals]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TenderTotals](
	[StoreID] [int] NOT NULL,
	[BatchNumber] [int] NOT NULL,
	[TenderID] [int] NOT NULL,
	[Open] [money] NOT NULL,
	[Shift] [money] NOT NULL,
	[Close] [money] NOT NULL,
	[Count] [int] NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[OpenForeign] [money] NOT NULL,
	[CloseForeign] [money] NOT NULL,
	[ShiftForeign] [money] NOT NULL,
	[ShiftRoundingError] [money] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NUSSkipUpdate] [bit] NOT NULL,
	[NUSSkipPOUpdate] [bit] NOT NULL
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_BatchNumber] ON [dbo].[TenderTotals] 
(
	[BatchNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TenderID] ON [dbo].[TenderTotals] 
(
	[TenderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TenderEntry]    Script Date: 11/09/2017 15:37:49 ******/
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
	[ID] [int] IDENTITY(1,1) NOT NULL,
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
 CONSTRAINT [PK_TenderEntry] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TenderEntry_VisaNetAuthID] ON [dbo].[TenderEntry] 
(
	[VisaNetAuthorizationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TransactionNumber] ON [dbo].[TenderEntry] 
(
	[TransactionNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TenderDenominations]    Script Date: 11/09/2017 15:37:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tender]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tender](
	[HQID] [int] NOT NULL,
	[PreventOverTendering] [bit] NOT NULL,
	[VerificationType] [int] NOT NULL,
	[VerifyViaEDC] [bit] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
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
 CONSTRAINT [PK_Tender] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShipTo]    Script Date: 11/09/2017 15:37:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_CustomerID] ON [dbo].[ShipTo] 
(
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_HQID] ON [dbo].[ShipTo] 
(
	[HQID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShippingWebPair]    Script Date: 11/09/2017 15:37:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_CarrierID] ON [dbo].[ShippingWebPair] 
(
	[CarrierID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShippingService]    Script Date: 11/09/2017 15:37:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_CarrierID] ON [dbo].[ShippingService] 
(
	[CarrierID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Name] ON [dbo].[ShippingService] 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShippingCarrier]    Script Date: 11/09/2017 15:37:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Name] ON [dbo].[ShippingCarrier] 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipping]    Script Date: 11/09/2017 15:37:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ServiceID] ON [dbo].[Shipping] 
(
	[ServiceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TrackingNumber] ON [dbo].[Shipping] 
(
	[TrackingNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TransactionNumber] ON [dbo].[Shipping] 
(
	[TransactionNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Serial]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Serial](
	[HQID] [int] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[SerialNumber2] [nvarchar](20) NOT NULL,
	[SerialNumber3] [nvarchar](20) NOT NULL,
	[StoreID] [int] NOT NULL,
	[TransactionEntryID] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ItemID] [int] NOT NULL,
	[SerialNumber] [nvarchar](20) NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[Status] [int] NOT NULL,
	[NUSSkipUpdate] [bit] NOT NULL,
	[NUSSkipPOUpdate] [bit] NOT NULL,
 CONSTRAINT [PK_Serial] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_HQID] ON [dbo].[Serial] 
(
	[HQID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ItemID] ON [dbo].[Serial] 
(
	[ItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_SerialNumber] ON [dbo].[Serial] 
(
	[SerialNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tax]    Script Date: 11/09/2017 15:37:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupplierList]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplierList](
	[MinimumOrder] [float] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ItemID] [int] NOT NULL,
	[SupplierID] [int] NOT NULL,
	[Cost] [money] NOT NULL,
	[ReorderNumber] [nvarchar](25) NOT NULL,
	[MasterPackQuantity] [int] NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[TaxRate] [float] NOT NULL,
	[NUSSkipUpdate] [bit] NOT NULL,
	[NUSSkipPOUpdate] [bit] NOT NULL,
 CONSTRAINT [PK_SupplierList] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Item_Supplier_ReorderNumber] ON [dbo].[SupplierList] 
(
	[ItemID] ASC,
	[SupplierID] ASC,
	[ReorderNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ItemID] ON [dbo].[SupplierList] 
(
	[ItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_SupplierID] ON [dbo].[SupplierList] 
(
	[SupplierID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[Country] [nvarchar](20) NOT NULL,
	[HQID] [int] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[State] [nvarchar](20) NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
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
 CONSTRAINT [PK_Supplier] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Code] ON [dbo].[Supplier] 
(
	[Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_HQID] ON [dbo].[Supplier] 
(
	[HQID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_SupplierName] ON [dbo].[Supplier] 
(
	[SupplierName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Substitute]    Script Date: 11/09/2017 15:37:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ItemID] ON [dbo].[Substitute] 
(
	[ItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_SubstituteItemID] ON [dbo].[Substitute] 
(
	[SubstituteItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Store]    Script Date: 11/09/2017 15:37:49 ******/
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
/****** Object:  Table [dbo].[ScheduleSegment]    Script Date: 11/09/2017 15:37:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 11/09/2017 15:37:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesRep]    Script Date: 11/09/2017 15:37:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Register]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Register](
	[Description] [nvarchar](30) NOT NULL,
	[PoleDisplayEnabled] [bit] NOT NULL,
	[Receipt2ID] [int] NOT NULL,
	[ScaleEnabled] [bit] NOT NULL,
	[ScaleTimeout] [float] NOT NULL,
	[ScannerEnabled] [bit] NOT NULL,
	[ZZBatchNumber] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
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
 CONSTRAINT [PK_Register] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NetDisplayURL]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NetDisplayURL](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ChannelID] [int] NOT NULL,
	[URL] [nvarchar](255) NOT NULL,
	[Seconds] [int] NOT NULL,
	[LastUpdated] [datetime] NULL,
	[OrderPosition] [int] NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
 CONSTRAINT [PK_NetDisplayURL] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NetDisplayChannel]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NetDisplayChannel](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ShowCurrentItem] [bit] NOT NULL,
	[LastUpdated] [datetime] NULL,
	[DBTimeStamp] [timestamp] NULL,
 CONSTRAINT [PK_NetDisplayChannel] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kit]    Script Date: 11/09/2017 15:37:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ComponentItemID] ON [dbo].[Kit] 
(
	[ComponentItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_KitItemID] ON [dbo].[Kit] 
(
	[KitItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Journal]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Journal](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [int] NOT NULL,
	[Time] [datetime] NOT NULL,
	[TransactionType] [int] NOT NULL,
	[ReferenceID] [int] NOT NULL,
	[CashierID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[OrderHistoryID] [int] NOT NULL,
	[BatchNumber] [int] NOT NULL,
	[ReceiptText] [ntext] NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[Compressed] [bit] NOT NULL,
	[ReceiptCompressed] [image] NULL,
	[NUSSkipUpdate] [bit] NOT NULL,
 CONSTRAINT [PK_Journal] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_BatchNumber] ON [dbo].[Journal] 
(
	[BatchNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_CustomerID] ON [dbo].[Journal] 
(
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ReferenceID] ON [dbo].[Journal] 
(
	[ReferenceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemTax]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemTax](
	[HQID] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](20) NOT NULL,
	[Options] [int] NOT NULL,
	[TaxID01] [int] NOT NULL,
	[ShowOnReceipt01] [bit] NOT NULL,
	[TaxID02] [int] NOT NULL,
	[ShowOnReceipt02] [bit] NOT NULL,
	[TaxID03] [int] NOT NULL,
	[ShowOnReceipt03] [bit] NOT NULL,
	[TaxID04] [int] NOT NULL,
	[ShowOnReceipt04] [bit] NOT NULL,
	[TaxID05] [int] NOT NULL,
	[ShowOnReceipt05] [bit] NOT NULL,
	[TaxID06] [int] NOT NULL,
	[ShowOnReceipt06] [bit] NOT NULL,
	[TaxID07] [int] NOT NULL,
	[ShowOnReceipt07] [bit] NOT NULL,
	[TaxID08] [int] NOT NULL,
	[ShowOnReceipt08] [bit] NOT NULL,
	[TaxID09] [int] NOT NULL,
	[ShowOnReceipt09] [bit] NOT NULL,
	[TaxID10] [int] NOT NULL,
	[ShowOnReceipt10] [bit] NOT NULL,
	[Code] [nvarchar](17) NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[NUSSkipUpdate] [bit] NOT NULL,
	[NUSSkipPOUpdate] [bit] NOT NULL,
 CONSTRAINT [PK_ItemTax] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_HQID] ON [dbo].[ItemTax] 
(
	[HQID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemMessage]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemMessage](
	[HQID] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](30) NOT NULL,
	[AgeLimit] [smallint] NOT NULL,
	[Message] [nvarchar](255) NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[NUSSkipUpdate] [bit] NOT NULL,
	[NUSSkipPOUpdate] [bit] NOT NULL,
 CONSTRAINT [PK_ItemMessage] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_HQID] ON [dbo].[ItemMessage] 
(
	[HQID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemClassComponent]    Script Date: 11/09/2017 15:37:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ItemClassID] ON [dbo].[ItemClassComponent] 
(
	[ItemClassID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ItemID] ON [dbo].[ItemClassComponent] 
(
	[ItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemClass]    Script Date: 11/09/2017 15:37:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Description] ON [dbo].[ItemClass] 
(
	[Description] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ItemClassLookupCode] ON [dbo].[ItemClass] 
(
	[ItemLookupCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 11/09/2017 15:37:49 ******/
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
	[ID] [int] IDENTITY(1,1) NOT NULL,
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
 CONSTRAINT [PK_Item] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [IX_Item_TimeStamp] ON [dbo].[Item] 
(
	[DBTimeStamp] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_BinLocation] ON [dbo].[Item] 
(
	[BinLocation] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_CategoryID] ON [dbo].[Item] 
(
	[CategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DepartmentID] ON [dbo].[Item] 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Description] ON [dbo].[Item] 
(
	[Description] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_HQID] ON [dbo].[Item] 
(
	[HQID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_ItemLookupCode] ON [dbo].[Item] 
(
	[ItemLookupCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_SupplierID] ON [dbo].[Item] 
(
	[SupplierID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryTransferLog]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryTransferLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ItemID] [int] NOT NULL,
	[DetailID] [int] NOT NULL,
	[Quantity] [float] NOT NULL,
	[DateTransferred] [datetime] NOT NULL,
	[StoreID] [int] NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[ReferenceID] [int] NOT NULL,
	[ReasonCodeID] [int] NOT NULL,
	[CashierID] [int] NOT NULL,
	[Type] [int] NOT NULL,
	[ReferenceEntryID] [int] NOT NULL,
	[Cost] [money] NOT NULL,
	[BatchNumber] [int] NOT NULL,
	[NUSSource] [tinyint] NULL,
	[NUSNewQty] [float] NULL,
	[NUSSkipUpdate] [bit] NOT NULL,
	[NUSSkipPOUpdate] [bit] NOT NULL,
 CONSTRAINT [PK_InventoryTransferLog] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ItemID] ON [dbo].[InventoryTransferLog] 
(
	[ItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryOffline]    Script Date: 11/09/2017 15:37:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DropPayout]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DropPayout](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [int] NOT NULL,
	[BatchNumber] [int] NOT NULL,
	[Time] [datetime] NOT NULL,
	[CashierID] [int] NOT NULL,
	[Amount] [money] NOT NULL,
	[Comment] [nvarchar](50) NOT NULL,
	[Recipient] [nvarchar](50) NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[ReasonCodeID] [int] NOT NULL,
	[NUSSkipUpdate] [bit] NOT NULL,
	[NUSSkipPOUpdate] [bit] NOT NULL,
 CONSTRAINT [PK_DropPayout] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_BatchNumber] ON [dbo].[DropPayout] 
(
	[BatchNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimensionAttribute]    Script Date: 11/09/2017 15:37:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dimension]    Script Date: 11/09/2017 15:37:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[HQID] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[code] [nvarchar](17) NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[NUSSkipUpdate] [bit] NOT NULL,
	[NUSSkipPOUpdate] [bit] NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_HQID] ON [dbo].[Department] 
(
	[HQID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 11/09/2017 15:37:49 ******/
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
	[ID] [int] IDENTITY(1,1) NOT NULL,
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
 CONSTRAINT [PK_Customer] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [IX_Customer_TimeStamp] ON [dbo].[Customer] 
(
	[DBTimeStamp] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_AccountNumber] ON [dbo].[Customer] 
(
	[AccountNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Company] ON [dbo].[Customer] 
(
	[Company] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_HQID] ON [dbo].[Customer] 
(
	[HQID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomButtons]    Script Date: 11/09/2017 15:37:49 ******/
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
	[Style] [int] NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[HQID] [int] NOT NULL,
	[MaskColor] [int] NOT NULL,
	[UseMask] [bit] NOT NULL,
 CONSTRAINT [PK_CustomButtons] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Currency]    Script Date: 11/09/2017 15:37:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configuration]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Configuration](
	[AccountDefaultID] [int] NOT NULL,
	[AccountMonthlyClosingDay] [smallint] NOT NULL,
	[CostUpdateMethod] [int] NOT NULL,
	[HQCreationDate] [datetime] NULL,
	[LastBackupMessage] [datetime] NULL,
	[LastUpdated] [datetime] NOT NULL,
	[LayawayDeposit] [real] NOT NULL,
	[LimitItem] [float] NOT NULL,
	[LimitPurchase] [money] NOT NULL,
	[LimitTimeFrame] [int] NOT NULL,
	[LimitType] [int] NOT NULL,
	[SerialNumber] [varchar](50) NULL,
	[StoreCountry] [nvarchar](20) NOT NULL,
	[StoreID] [int] NOT NULL,
	[StoreState] [nvarchar](20) NOT NULL,
	[SyncID] [int] NOT NULL,
	[TaxSystem] [int] NOT NULL,
	[VATRegistrationNumber] [nvarchar](20) NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StoreName] [nvarchar](30) NOT NULL,
	[StoreAddress1] [nvarchar](30) NOT NULL,
	[StoreAddress2] [nvarchar](30) NOT NULL,
	[StoreCity] [nvarchar](30) NOT NULL,
	[StoreZip] [nvarchar](15) NOT NULL,
	[StorePhone] [nvarchar](14) NOT NULL,
	[StoreFax] [nvarchar](14) NOT NULL,
	[QuoteExpirationDays] [smallint] NOT NULL,
	[BackOrderExpirationDays] [smallint] NOT NULL,
	[LayawayExpirationDays] [smallint] NOT NULL,
	[WorkOrderDueDays] [smallint] NOT NULL,
	[LayawayFee] [money] NOT NULL,
	[ReceiptCount] [int] NOT NULL,
	[ReceiptCount2] [int] NOT NULL,
	[EDCTimeout] [int] NOT NULL,
	[WorkOrderDeposit] [float] NOT NULL,
	[PriceCalculationRule] [int] NOT NULL,
	[Options] [int] NOT NULL,
	[StoreEmail] [nvarchar](255) NOT NULL,
	[TaxBasis] [int] NOT NULL,
	[TaxField] [int] NOT NULL,
	[ItemTaxID] [int] NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[DefaultTenderID] [int] NOT NULL,
	[Options2] [int] NOT NULL,
	[VoucherExpirationDays] [int] NOT NULL,
	[EnableGlobalCustomers] [bit] NOT NULL,
	[DefaultGlobalCustomer] [bit] NOT NULL,
	[SoftwareValidation1] [varchar](128) NULL,
	[SoftwareValidation2] [varchar](128) NULL,
	[SoftwareValidation3] [varchar](128) NULL,
	[SoftwareValidation4] [varchar](128) NULL,
	[SoftwareValidation5] [varchar](128) NULL,
	[VATDetailID] [nvarchar](50) NOT NULL,
	[Options3] [int] NOT NULL,
	[Options4] [int] NOT NULL,
	[NextAutoAccountNumber] [int] NOT NULL,
	[AccountingInterface] [int] NOT NULL,
	[BillPostingAccount] [nvarchar](100) NOT NULL,
	[AccountingFilename] [nvarchar](150) NOT NULL,
	[AccountingCompany] [nvarchar](100) NOT NULL,
	[NUSSkipPOUpdate] [bit] NOT NULL,
 CONSTRAINT [PK_Configuration] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Check]    Script Date: 11/09/2017 15:37:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[HQID] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Code] [nvarchar](17) NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[NUSSkipUpdate] [bit] NOT NULL,
	[NUSSkipPOUpdate] [bit] NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cashier]    Script Date: 11/09/2017 15:37:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Batch]    Script Date: 11/09/2017 15:37:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_RegisterID] ON [dbo].[Batch] 
(
	[RegisterID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Accounting]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounting](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TableName] [nvarchar](30) NOT NULL,
	[FieldName] [nvarchar](30) NOT NULL,
	[DetailID] [int] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[DebitAccount] [nvarchar](100) NULL,
	[CreditAccount] [nvarchar](100) NULL,
	[DBTimeStamp] [timestamp] NULL,
	[StoreID] [int] NOT NULL,
	[DisplayPosition] [int] NOT NULL,
 CONSTRAINT [PK_Accounting] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Alias]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alias](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ItemID] [int] NOT NULL,
	[Alias] [nvarchar](25) NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[NUSSkipUpdate] [bit] NOT NULL,
	[NUSSkipPOUpdate] [bit] NOT NULL,
 CONSTRAINT [PK_Alias] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_ALIAS] ON [dbo].[Alias] 
(
	[Alias] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ItemID] ON [dbo].[Alias] 
(
	[ItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountType]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[DateDueType] [int] NOT NULL,
	[GracePeriod] [int] NOT NULL,
	[MinimumFinanceCharge] [money] NOT NULL,
	[AnnualInterestRate] [float] NOT NULL,
	[ApplyFinanceChargesOnFinanceCharges] [bit] NOT NULL,
	[MinimumPayment] [money] NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[Code] [nvarchar](17) NOT NULL,
	[HQID] [int] NOT NULL,
	[NUSSkipUpdate] [bit] NOT NULL,
 CONSTRAINT [PK_AccountType] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountReceivableHistory]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountReceivableHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [int] NOT NULL,
	[AccountReceivableID] [int] NOT NULL,
	[BatchNumber] [int] NOT NULL,
	[Amount] [money] NOT NULL,
	[PaymentID] [int] NOT NULL,
	[Comment] [nvarchar](50) NOT NULL,
	[CashierID] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[HistoryType] [int] NOT NULL,
	[TransferArID] [int] NOT NULL,
	[ReasonCodeID] [int] NOT NULL,
	[RemoteStoreID] [int] NOT NULL,
	[RemotePaymentID] [int] NOT NULL,
	[NUSSkipUpdate] [bit] NOT NULL,
	[NUSSkipPOUpdate] [bit] NOT NULL,
 CONSTRAINT [PK_AccountReceivableHistory] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AccountReceivableID] ON [dbo].[AccountReceivableHistory] 
(
	[AccountReceivableID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountReceivable]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountReceivable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[DueDate] [datetime] NOT NULL,
	[OriginalAmount] [money] NOT NULL,
	[TransactionNumber] [int] NOT NULL,
	[Type] [smallint] NOT NULL,
	[Balance] [money] NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[NUSSkipUpdate] [bit] NOT NULL,
	[NUSSkipPOUpdate] [bit] NOT NULL,
 CONSTRAINT [PK_AccountReceivable] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_CustomerID] ON [dbo].[AccountReceivable] 
(
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receipt]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receipt](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[Title] [nvarchar](38) NOT NULL,
	[TemplateCancel] [ntext] NOT NULL,
	[TemplateDrop] [ntext] NOT NULL,
	[TemplateLayaway] [ntext] NOT NULL,
	[TemplatePayment] [ntext] NOT NULL,
	[TemplatePayout] [ntext] NOT NULL,
	[TemplateQuote] [ntext] NOT NULL,
	[TemplateSale] [ntext] NOT NULL,
	[TemplateWorkOrder] [ntext] NOT NULL,
	[TemplateReport] [ntext] NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[StoreID] [int] NOT NULL,
 CONSTRAINT [PK_Receipt] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReasonCode]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReasonCode](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HQID] [int] NOT NULL,
	[Code] [nvarchar](25) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[Type] [int] NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[NUSSkipUpdate] [bit] NOT NULL,
	[NUSSkipPOUpdate] [bit] NOT NULL,
 CONSTRAINT [PK_ReasonCode] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NUS_PO_Script]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NUS_PO_Script](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
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
 CONSTRAINT [PK_NUS_PO_Script] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IDX_ChargeAccount] ON [dbo].[NUS_PO_Script] 
(
	[ChargeAccount] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDX_InstanceCount] ON [dbo].[NUS_PO_Script] 
(
	[InstanceCount] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDX_Patient] ON [dbo].[NUS_PO_Script] 
(
	[Patient] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDX_RegisterId] ON [dbo].[NUS_PO_Script] 
(
	[RegisterId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDX_ReturnActivityEntry] ON [dbo].[NUS_PO_Script] 
(
	[ReturnActivityEntry] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDX_SaleActivityEntry] ON [dbo].[NUS_PO_Script] 
(
	[SaleActivityEntry] ASC,
	[ActivityAction] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDX_ScriptNumber] ON [dbo].[NUS_PO_Script] 
(
	[ScriptNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDX_WorkOrderId] ON [dbo].[NUS_PO_Script] 
(
	[WorkOrderId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NUS_PO_Patient]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NUS_PO_Patient](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PatientNumber] [bigint] NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[Title] [varchar](6) NOT NULL,
	[Address] [varchar](40) NOT NULL,
	[Suburb] [varchar](50) NOT NULL,
	[PostCode] [int] NOT NULL,
	[NUSSkipPOUpdate] [bit] NOT NULL,
 CONSTRAINT [PK_NUS_PO_Patient] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IDX_LastName] ON [dbo].[NUS_PO_Patient] 
(
	[LastName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NUS_PO_OfferEntry]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NUS_PO_OfferEntry](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Offer] [int] NOT NULL,
	[OfferItem] [bigint] NOT NULL,
	[BuyDownQuantity] [float] NOT NULL,
	[Cost] [decimal](28, 10) NOT NULL,
	[IsDiscountItem] [bit] NOT NULL,
	[Price] [decimal](28, 10) NOT NULL,
	[IsQualifyingItem] [bit] NOT NULL,
	[NUSSkipPOUpdate] [bit] NOT NULL,
 CONSTRAINT [PK_NUS_PO_OfferEntry] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDX_APE_Item] ON [dbo].[NUS_PO_OfferEntry] 
(
	[OfferItem] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDX_APE_Offer] ON [dbo].[NUS_PO_OfferEntry] 
(
	[Offer] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NUS_PO_Offer]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NUS_PO_Offer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](40) NOT NULL,
	[Description] [nvarchar](60) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Priority] [int] NOT NULL,
	[DivideDiscount] [bit] NOT NULL,
	[DollarOffDiscount] [decimal](28, 10) NOT NULL,
	[DollarThreshold] [real] NOT NULL,
	[IsDiscountable] [bit] NOT NULL,
	[IsLoyalty] [bit] NOT NULL,
	[MultiBuyXQuantity] [int] NOT NULL,
	[MultiBuyYDollarAmount] [decimal](28, 10) NOT NULL,
	[MultiBuyYQuantity] [int] NOT NULL,
	[MultipleRedemptions] [bit] NOT NULL,
	[OfferCategory] [int] NOT NULL,
	[OfferType] [int] NOT NULL,
	[PercentOffDiscount] [real] NOT NULL,
	[QuantityThreshold] [bit] NOT NULL,
	[NUSSkipPOUpdate] [bit] NOT NULL,
 CONSTRAINT [PK_NUS_PO_Offer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDX_StartEndDates] ON [dbo].[NUS_PO_Offer] 
(
	[StartDate] ASC,
	[EndDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhysicalInventory]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhysicalInventory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [int] NOT NULL,
	[OpenTime] [datetime] NULL,
	[CloseTime] [datetime] NULL,
	[Status] [int] NOT NULL,
	[LastRefresh] [datetime] NULL,
	[Description] [nvarchar](100) NOT NULL,
	[Code] [nvarchar](17) NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[NUSSkipUpdate] [bit] NOT NULL,
 CONSTRAINT [PK_PhysicalInventory] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BatchNumber] [int] NOT NULL,
	[CashierID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[Time] [datetime] NOT NULL,
	[Amount] [money] NOT NULL,
	[Comment] [nvarchar](50) NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[NUSSkipUpdate] [bit] NOT NULL,
	[NUSSkipPOUpdate] [bit] NOT NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_BatchNumber] ON [dbo].[Payment] 
(
	[BatchNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_CustomerID] ON [dbo].[Payment] 
(
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderHistory]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [int] NOT NULL,
	[BatchNumber] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[OrderID] [int] NOT NULL,
	[CashierID] [int] NOT NULL,
	[DeltaDeposit] [money] NOT NULL,
	[TransactionNumber] [int] NOT NULL,
	[Comment] [nvarchar](30) NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[NUSSkipPOUpdate] [bit] NOT NULL,
 CONSTRAINT [PK_OrderHistory] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_OrderID] ON [dbo].[OrderHistory] 
(
	[OrderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TransactionNumber] ON [dbo].[OrderHistory] 
(
	[TransactionNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderEntry]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderEntry](
	[Cost] [money] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
	[FullPrice] [money] NOT NULL,
	[PriceSource] [smallint] NOT NULL,
	[Price] [money] NOT NULL,
	[QuantityOnOrder] [float] NOT NULL,
	[SalesRepID] [int] NOT NULL,
	[Taxable] [int] NOT NULL,
	[DetailID] [int] NOT NULL,
	[Description] [nvarchar](30) NOT NULL,
	[QuantityRTD] [float] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[Comment] [nvarchar](255) NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[DiscountReasonCodeID] [int] NOT NULL,
	[ReturnReasonCodeID] [int] NOT NULL,
	[TaxChangeReasonCodeID] [int] NOT NULL,
	[NUSSkipPOUpdate] [bit] NOT NULL,
 CONSTRAINT [PK_OrderEntry] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ItemID] ON [dbo].[OrderEntry] 
(
	[ItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_OrderID] ON [dbo].[OrderEntry] 
(
	[OrderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 11/09/2017 15:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[StoreID] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Closed] [bit] NOT NULL,
	[Time] [datetime] NOT NULL,
	[Type] [int] NOT NULL,
	[Comment] [nvarchar](255) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[ShipToID] [int] NOT NULL,
	[DepositOverride] [bit] NOT NULL,
	[Deposit] [money] NOT NULL,
	[Tax] [money] NOT NULL,
	[Total] [money] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[ExpirationOrDueDate] [datetime] NOT NULL,
	[Taxable] [bit] NOT NULL,
	[SalesRepID] [int] NOT NULL,
	[ReferenceNumber] [nvarchar](50) NOT NULL,
	[ShippingChargeOnOrder] [money] NOT NULL,
	[ShippingChargeOverride] [bit] NOT NULL,
	[ShippingServiceID] [int] NOT NULL,
	[ShippingTrackingNumber] [nvarchar](255) NOT NULL,
	[ShippingNotes] [ntext] NOT NULL,
	[DBTimeStamp] [timestamp] NULL,
	[ReasonCodeID] [int] NOT NULL,
	[ExchangeID] [int] NOT NULL,
	[ChannelType] [int] NOT NULL,
	[DefaultDiscountReasonCodeID] [int] NOT NULL,
	[DefaultReturnReasonCodeID] [int] NOT NULL,
	[DefaultTaxChangeReasonCodeID] [int] NOT NULL,
	[NUSSkipPOUpdate] [bit] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_CustomerID] ON [dbo].[Order] 
(
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ReferenceNumber] ON [dbo].[Order] 
(
	[ReferenceNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ShippingTrackingNumber] ON [dbo].[Order] 
(
	[ShippingTrackingNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HQMessage]    Script Date: 11/09/2017 15:37:49 ******/
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
/****** Object:  Table [dbo].[MatrixAttributeDisplayOrder]    Script Date: 11/09/2017 15:37:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[PUBLIC_TaxEntry]    Script Date: 11/09/2017 15:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PUBLIC_TaxEntry] AS SELECT [StoreID], [ID], [TaxID], [TransactionNumber], [Tax], [TaxableAmount] , [DBTimeStamp], [TransactionEntryID] From [TaxEntry]
GO
/****** Object:  Table [dbo].[QuantityDiscount]    Script Date: 11/09/2017 15:37:51 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseOrderEntryDetail]    Script Date: 11/09/2017 15:37:51 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_PurchaseOrderEntryID] ON [dbo].[PurchaseOrderEntryDetail] 
(
	[PurchaseOrderEntryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseOrderEntry]    Script Date: 11/09/2017 15:37:51 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ItemID] ON [dbo].[PurchaseOrderEntry] 
(
	[ItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_PurchaseOrderID] ON [dbo].[PurchaseOrderEntry] 
(
	[PurchaseOrderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseOrder]    Script Date: 11/09/2017 15:37:51 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_PONumber] ON [dbo].[PurchaseOrder] 
(
	[PONumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_SupplierID] ON [dbo].[PurchaseOrder] 
(
	[SupplierID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_WorksheetID] ON [dbo].[PurchaseOrder] 
(
	[WorksheetID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  View [dbo].[PUBLIC_TransactionEntry]    Script Date: 11/09/2017 15:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PUBLIC_TransactionEntry] AS SELECT [Commission], [Cost], [FullPrice], [StoreID], [ID], [TransactionNumber], [ItemID], [Price], [PriceSource], [Quantity], [SalesRepID], [Taxable], [DetailID], [Comment], [DBTimeStamp], [DiscountReasonCodeID], [ReturnReasonCodeID] , [TaxChangeReasonCodeID], [SalesTax] From [TransactionEntry]
GO
/****** Object:  View [dbo].[PUBLIC_Transaction]    Script Date: 11/09/2017 15:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PUBLIC_Transaction] AS SELECT [ShipToID], [StoreID], [TransactionNumber], [BatchNumber], [Time],  [CustomerID], [CashierID], [Total], [SalesTax], [Comment], [ReferenceNumber], [DBTimeStamp], [Status], [ExchangeID], [ChannelType] FROM [Transaction]
GO
/****** Object:  View [dbo].[PUBLIC_TenderEntry]    Script Date: 11/09/2017 15:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PUBLIC_TenderEntry] AS SELECT [BatchNumber], [CreditCardExpiration], [OrderHistoryID], [DropPayoutID], [StoreID], [ID], [TransactionNumber], [TenderID], [PaymentID], [Description], [CreditCardNumber], [CreditCardApprovalCode], [Amount], [AccountHolder], [DBTimeStamp], [RoundingError], [AmountForeign], [BankNumber], [SerialNumber], [State], [License], [BirthDate], [TransitNumber] , [VisaNetAuthorizationID] FROM [TenderEntry]
GO
/****** Object:  View [dbo].[PUBLIC_Tender]    Script Date: 11/09/2017 15:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PUBLIC_Tender] AS SELECT [PreventOverTendering], [VerificationType],  [VerifyViaEDC], [ID], [Description], [AdditionalDetailType],  [PrinterValidation], [ValidationLine1], [ValidationLine2], [ValidationLine3], [GLAccount], [ScanCode], [RoundToValue], [Code], [MaximumAmount],  [DBTimeStamp], [DoNotPopCashDrawer], [CurrencyID] , [DisplayOrder],  [ValidationMask], [SignatureRequired] FROM [Tender]
GO
/****** Object:  View [dbo].[PUBLIC_Tax]    Script Date: 11/09/2017 15:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PUBLIC_Tax] AS SELECT [FixedAmount], [ID], [Description], [Percentage], [UsePartialDollar], [ItemMaximum], [IncludePreviousTax],  [Bracket00], [Bracket01], [Bracket02], [Bracket03], [Bracket04],  [Bracket05], [Bracket06], [Bracket07], [Bracket08], [Bracket09],  [Bracket10], [Code], [DBTimeStamp], [ItemMinimum], [ApplyOverMinimum] From [Tax]
GO
/****** Object:  View [dbo].[PUBLIC_Supplier]    Script Date: 11/09/2017 15:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PUBLIC_Supplier] AS SELECT [Country], [LastUpdated], [State], [ID], [SupplierName], [ContactName], [Address1], [Address2], [City], [Zip], [EmailAddress], [WebPageAddress], [Code], [DBTimeStamp], [AccountNumber], [TaxNumber], [CurrencyID], [PhoneNumber] , [FaxNumber] FROM [Supplier]
GO
/****** Object:  View [dbo].[PUBLIC_Store]    Script Date: 11/09/2017 15:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PUBLIC_Store] AS SELECT [ID], [Name], [StoreCode], [Region], [Address1], [Address2], [City], [Country], [FaxNumber], [PhoneNumber], [State], [Zip], [ParentStoreID], [ScheduleHourMask1], [ScheduleHourMask2], [ScheduleHourMask3], [ScheduleHourMask4], [ScheduleHourMask5], [ScheduleHourMask6], [ScheduleHourMask7], [ScheduleMinute], [RetryCount], [RetryDelay],[LastUpdated], [DBTimeStamp], [AccountName] , [Password] FROM [Store]
GO
/****** Object:  View [dbo].[PUBLIC_SalesRep]    Script Date: 11/09/2017 15:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PUBLIC_SalesRep] AS SELECT [LastUpdated], [Number], [StoreID], [ID], [Name], [PercentOfSale], [PercentOfProfit], [FixedRate], [EmailAddress], [DBTimeStamp] , [Telephone] FROM [SalesRep]
GO
/****** Object:  View [dbo].[PUBLIC_Register]    Script Date: 11/09/2017 15:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PUBLIC_Register] AS SELECT [Description], [PoleDisplayEnabled], [Receipt2ID], [ScaleEnabled], [ScaleTimeout], [ScannerEnabled], [ZZBatchNumber], [ID], [Number], [CurrentBatchNumber], [Receipt1ID], [PoleDisplayMessageID], [Printer1Name], [Printer1Options], [Printer2Name], [Printer2Options], [ChannelID], [NetDisplayEnabled], [DBTimeStamp], [DefaultPriceLevel], [PoleDisplayName], [ScaleName], [ScannerName], [Printer1Type], [Printer2Type], [StoreID], [CashDrawer1Name], [CashDrawer1Enabled], [CashDrawer1WaitForClose], [CashDrawer1OpenTimeout], [CashDrawer2Name], [CashDrawer2Enabled], [CashDrawer2WaitForClose], [CashDrawer2OpenTimeout], [MICRName], [MICREnabled], [MICRTimeout], [MSRName], [MSREnabled], [SignatureCaptureName], [SignatureCaptureEnabled] , [SignatureCaptureFormName], [TouchScreenEnabled], [KeyboardID] FROM [Register]
GO
/****** Object:  View [dbo].[PUBLIC_Item]    Script Date: 11/09/2017 15:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PUBLIC_Item] AS SELECT [BinLocation], [BuydownPrice], [BuydownQuantity], [CommissionAmount], [CommissionMaximum], [CommissionMode], [CommissionPercentProfit], [CommissionPercentSale], [Description], [FoodStampable], [ItemNotDiscountable], [LastReceived], [LastUpdated], [Notes], [QuantityCommitted], [SerialNumberCount], [TareWeightPercent], [ID], [ItemLookupCode], [DepartmentID], [CategoryID], [MessageID], [Price], [PriceA], [PriceB], [PriceC], [SalePrice], [SaleStartDate], [SaleEndDate], [QuantityDiscountID], [TaxID], [ItemType], [Cost], [Quantity], [ReorderPoint], [RestockLevel], [TareWeight], [SupplierID], [TagAlongItem], [TagAlongQuantity], [ParentItem], [ParentQuantity], [BarcodeFormat], [PriceLowerBound], [PriceUpperBound], [PictureName], [LastSold], [ExtendedDescription], [SubDescription1], [SubDescription2], [SubDescription3], [UnitOfMeasure], [SubCategoryID], [QuantityEntryNotAllowed], [PriceMustBeEntered], [BlockSalesReason], [BlockSalesAfterDate], [Weight], [Taxable], [DBTimeStamp], [BlockSalesBeforeDate], [LastCost], [ReplacementCost], [WebItem], [BlockSalesType], [BlockSalesScheduleID] , [SaleType], [SaleScheduleID], [Consignment] From [Item]
GO
/****** Object:  View [dbo].[PUBLIC_Department]    Script Date: 11/09/2017 15:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PUBLIC_Department] AS SELECT [ID], [Name], [code], [DBTimeStamp]From [Department]
GO
/****** Object:  View [dbo].[PUBLIC_Customer]    Script Date: 11/09/2017 15:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PUBLIC_Customer] AS SELECT [AccountNumber], [AccountTypeID], [Address2], [AssessFinanceCharges], [Company], [Country], [CustomDate1], [CustomDate2], [CustomDate3], [CustomDate4], [CustomDate5], [CustomNumber1], [CustomNumber2], [CustomNumber3], [CustomNumber4], [CustomNumber5], [CustomText1], [CustomText2], [CustomText3], [CustomText4], [CustomText5], [GlobalCustomer], [LastStartingDate], [LastClosingDate], [LastUpdated], [LimitPurchase], [LastClosingBalance], [PrimaryShipToID], [State], [StoreID], [ID], [LayawayCustomer], [Employee], [FirstName], [LastName], [Address], [City], [Zip], [AccountBalance], [CreditLimit], [TotalSales], [AccountOpened], [LastVisit], [TotalVisits], [TotalSavings], [CurrentDiscount], [PriceLevel], [TaxExempt], [Notes], [Title], [EmailAddress], [DBTimeStamp], [TaxNumber], [PictureName], [DefaultShippingServiceID], [PhoneNumber], [FaxNumber] , [CashierID] FROM [Customer]
GO
/****** Object:  View [dbo].[PUBLIC_Category]    Script Date: 11/09/2017 15:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PUBLIC_Category] AS SELECT [ID], [DepartmentID], [Name], [Code], [DBTimeStamp] FROM [Category]
GO
/****** Object:  View [dbo].[PUBLIC_Cashier]    Script Date: 11/09/2017 15:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PUBLIC_Cashier] AS SELECT [LastUpdated], [Number], [StoreID], [ID], [Name], [Password], [FloorLimit], [ReturnLimit], [CashDrawerNumber], [SecurityLevel], [Privileges], [EmailAddress], [FailedLogonAttempts], [DBTimeStamp], [MaxOverShortAmount], [MaxOverShortPercent] , [OverShortLimitType], [Telephone] FROM [Cashier]
GO
/****** Object:  StoredProcedure [dbo].[makePayment]    Script Date: 11/09/2017 15:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[makePayment] @RegisterNumber     INT, @PaymentAmount      MONEY, @StoreARAmount      MONEY, @CustomerID         INT, @CashierID          INT, @OverPayAmt         MONEY, @PartPayID          INT, @PartPayAmt         MONEY, @Transactions       VARCHAR(7168), @DirectDebit        BIT, @PayOutId           INT ASBEGIN /* ************************************** Inserted by NU Upgrade 2.6.65 Date 02-Aug-2011 08:21:14 http://www.pcanu.com.au ************************************** */ Set NoCount On DECLARE @PrintVar           AS VARCHAR(10) DECLARE @PrintVar2          AS VARCHAR(10) DECLARE @RegisterID         AS INT DECLARE @ErrorSave          AS INT    DECLARE @TransactionsLength AS INT DECLARE @OrigStoreARAmount  AS MONEY DECLARE @ARID               AS INT SET @ErrorSave = 0 IF @StoreARAmount IS NULL      BEGIN         RAISERROR ('Total amount must be defined', 16, 1)         RETURN (1)     END SET @OrigStoreARAmount = @StoreARAmount IF @PaymentAmount IS NOT NULL AND @PaymentAmount < 0     BEGIN         RAISERROR ('Payment amount must be greater or equal to 0.00', 16, 1)         RETURN (2)     END IF NOT EXISTS( select [customer].[id] from [customer] with (NOLOCK) where [customer].[id] = @CustomerID )     BEGIN         RAISERROR ('Customer (%d) is invalid', 16, 1,  @CustomerID)         RETURN (3)     END IF @CashierID <> 0 AND @CashierID IS NOT NULL AND NOT EXISTS( select [cashier].[id] from [cashier] with (NOLOCK) where [cashier].[id] = @CashierID )     BEGIN         RAISERROR ('Cashier (%d) is invalid', 16, 1, @CashierID)         RETURN (4)     END IF NOT EXISTS( select [register].[id] from [register] with (NOLOCK) where [register].[number] = @RegisterNumber )     BEGIN         RAISERROR ('Register number (%d) is invalid', 16, 1, @RegisterNumber)         RETURN (5)     END select @RegisterID = [register].[id] from [register] with (NOLOCK) where [register].[number] = @RegisterNumber IF @PartPayID IS NOT NULL AND NOT EXISTS( SELECT[accountreceivable].[id] FROM [accountreceivable] with (NOLOCK) WHERE [accountreceivable].[id] = @PartPayID )     BEGIN         RAISERROR ('Part payment account receivable id (%d) is invalid', 16, 1, @PartPayID)         RETURN (6)     END IF @PartPayID IS NOT NULL AND @PartPayAmt IS NULL     BEGIN         SET @PrintVar = cast(@PartPayAmt as varchar(10))         RAISERROR ('Inconsistent part payment amount (%s) and id (%d)', 16, 1, @PrintVar , @PartPayID )         RETURN (7)     END IF @PartPayID IS NULL AND @PartPayAmt IS NOT NULL     BEGIN         SET @PrintVar = cast(@PartPayAmt as varchar(10))         RAISERROR ('Inconsistent part payment amount (%s) and id (%d)', 16, 1, @PrintVar , @PartPayID )         RETURN (8)     END IF @OverPayAmt IS NULL      SET @OverPayAmt = 0.0 BEGIN TRANSACTION PAYMENT DECLARE @BatchNumber int DECLARE @PaymentID   int IF NOT EXISTS( select [batch].[batchnumber] from [batch] with (NOLOCK) where [batch].[status] = 0 and [batch].[registerid] = @RegisterID )     BEGIN         INSERT INTO [batch] ( [registerid] ) values ( @RegisterID )          IF (@@ERROR <> 0)             BEGIN                 SET @ErrorSave = @@ERROR                 ROLLBACK TRANSACTION PAYMENT                 RAISERROR ('Error inserting into batch', 16, 1)                 RETURN (@ErrorSave)             END         SELECT @BatchNumber = @@IDENTITY     END ELSE     BEGIN         SELECT @BatchNumber = [batch].[batchnumber] from [batch] with (NOLOCK) where [batch].[status] = 0 and [batch].[registerid] = @RegisterID         IF (@@ERROR <> 0)             BEGIN                 SET @ErrorSave = @@ERROR                 ROLLBACK TRANSACTION PAYMENT                 RAISERROR ('Error fetching batch batch record', 16, 1)                 RETURN (@ErrorSave)             END     END IF @PaymentAmount IS NOT NULL AND @PaymentAmount > 0.00     BEGIN         IF (@DirectDebit = 1)             BEGIN                 INSERT INTO [payment] ( [batchnumber], [cashierid], [customerid], [amount], [comment] )                        VALUES ( @BatchNumber, @CashierID, @CustomerID, @PaymentAmount, 'Direct Debit Payment' )             END         ELSE             BEGIN                 INSERT INTO [payment] ( [batchnumber], [cashierid], [customerid], [amount] )                        VALUES ( @BatchNumber, @CashierID, @CustomerID, @PaymentAmount )             END         IF (@@ERROR <> 0)             BEGIN                 SET @ErrorSave = @@ERROR                 ROLLBACK TRANSACTION PAYMENT                 RAISERROR ('Error inserting payment', 16, 1)                 RETURN (@ErrorSave)             END         SELECT @PaymentID = @@IDENTITY         IF @PayOutId IS NOT NULL         begin             UPDATE [journal] SET [transactiontype] = 15, [referenceid] = @PaymentId WHERE [transactiontype] = 12 and [referenceid] = @PayOutId         End     END ELSE SET @PaymentID = 0 DECLARE @Offset           INT DECLARE @CurrentChar      CHAR DECLARE @StrARID          VARCHAR(128) DECLARE @ARBalance        MONEY SET @Offset = 1    SET @TransactionsLength = DATALENGTH(@Transactions) SET @StrARID = '' IF @StoreARAmount <> 0.00      BEGIN         IF @TransactionsLength > 0               BEGIN                 WHILE @Offset <= @TransactionsLength                  BEGIN                     SET @CurrentChar = SUBSTRING(@Transactions, @Offset, 1)                     IF @CurrentChar = ','                         BEGIN                             SET @ARID = CAST(@StrARID AS INT)                             SELECT @ARBalance = [accountreceivable].[balance] from [accountreceivable] with (NOLOCK) where [accountreceivable].[id] = @ARID                             IF (@@ERROR <> 0)                                 BEGIN                                     SET @ErrorSave = @@ERROR                                     ROLLBACK TRANSACTION PAYMENT                                     RAISERROR ('Unable to locate account receivable transaction (%s)', 16, 1, @StrARID)                                     RETURN (@ErrorSave)                                 END                             IF ( @ARBalance IS NULL )                                 BEGIN                                     ROLLBACK TRANSACTION PAYMENT                                     RAISERROR ('Unable to find account receivable transaction (%s)', 16, 1, @StrARID)                                     RETURN (14)                                 END                                                          INSERT INTO [accountreceivablehistory] ( [accountreceivableid], [batchnumber], [amount], [paymentid], [comment], [cashierid], [historytype] )                                    VALUES ( @ARID, @BatchNumber, -@ARBalance, @PaymentID, 'NUHQ: Auto multistore payment', @CashierID, 2 )                             IF (@@ERROR <> 0)                                 BEGIN                                     SET @ErrorSave = @@ERROR                                     ROLLBACK TRANSACTION PAYMENT                                     RAISERROR ('Unable to insert transaction accountreceivablehistory for account receivable (%s)', 16, 1, @StrARID)                                     RETURN (@ErrorSave)                                 END                                  UPDATE [accountreceivable] SET [accountreceivable].[balance] = 0 WHERE [accountreceivable].[id] = @ARID                             IF (@@ERROR <> 0)                                 BEGIN                                     SET @ErrorSave = @@ERROR                                     ROLLBACK TRANSACTION PAYMENT                                     RAISERROR ('Unable to update accountreceivable for account receivable (%s)', 16, 1, @StrARID)                                     RETURN (@ErrorSave)                                 END                             SET @StoreARAmount = @StoreARAmount - @ARBalance                             SET @StrARID = ''                         END                     ELSE                          SET @StrARID = @StrARID + @CurrentChar                     SET @Offset = @Offset + 1                 END                 SET @ARID = CAST(@StrARID AS INT)                 SELECT @ARBalance = [accountreceivable].[balance] from [accountreceivable] with (NOLOCK) where [accountreceivable].[id] = @ARID                 IF (@@ERROR <> 0)                     BEGIN                         SET @ErrorSave = @@ERROR                         ROLLBACK TRANSACTION PAYMENT                         RAISERROR ('Unable to locate account receivable transaction (%s)', 16, 1, @StrARID)                         RETURN (@ErrorSave)                     END                 IF ( @ARBalance IS NULL )                     BEGIN                         ROLLBACK TRANSACTION PAYMENT                         RAISERROR ('Unable to find account receivable transaction (%s)', 16, 1, @StrARID)                         RETURN (14)                     END                 INSERT INTO [accountreceivablehistory] ( [accountreceivableid], [batchnumber], [amount], [paymentid], [comment], [cashierid], [historytype] )                        VALUES ( @ARID, @BatchNumber, -@ARBalance, @PaymentID, 'NUHQ: Auto multistore payment', @CashierID, 2 )                 IF (@@ERROR <> 0)                     BEGIN                         SET @ErrorSave = @@ERROR                         ROLLBACK TRANSACTION PAYMENT                         RAISERROR ('Unable to insert final transaction accountreceivablehistory for account receivable (%s)', 16, 1, @StrARID)                         RETURN (@ErrorSave)                     END                      UPDATE [accountreceivable] SET [accountreceivable].[balance] = 0 WHERE [accountreceivable].[id] = @ARID                 IF (@@ERROR <> 0)                     BEGIN                         SET @ErrorSave = @@ERROR                         ROLLBACK TRANSACTION PAYMENT                         RAISERROR ('Unable to update accountreceivable for account receivable (%s)', 16, 1, @StrARID)                         RETURN (@ErrorSave)                     END                 SET @StoreARAmount = @StoreARAmount - @ARBalance                 SET @StrARID = ''             END         ELSE             BEGIN                 DECLARE @FIFOARID    INT                 DECLARE @FIFOBalance MONEY                 DECLARE @FIFOLeft    MONEY                 DECLARE @FIFOPayAmt  MONEY                 SET @FIFOLeft = 0.0                 IF @STOREARAmount IS NOT NULL                     SET @FIFOLeft = @StoreARAmount                 IF @PartPayAmt  IS NOT NULL                     SET @FIFOLeft = @FIFOLeft - @PartPayAmt                     DECLARE TransCursor CURSOR FORWARD_ONLY STATIC FOR                     SELECT  [ar].id, [ar].balance                     FROM    [customer] with (NOLOCK) left join [accountReceivable] [ar] with (NOLOCK) on [ar].customerid = [customer].id                                          LEFT OUTER JOIN [transaction] with (NOLOCK) on [ar].transactionnumber = [transaction].transactionnumber                                          Where [AR].balance Is Not Null                                          AND     [ar].balance > 0.0                     AND     [customer].id = @CustomerID                     AND     ( [transaction].[exchangeid] is null or [transaction].[exchangeid] <> 1 )                     ORDER BY [ar].[date] ASC                 OPEN TransCursor                 FETCH NEXT FROM TransCursor                 INTO @FIFOARID, @FIFOBalance                 WHILE (@@FETCH_STATUS = 0 AND @FIFOLeft > 0.00)                 BEGIN                     IF @FIFOLeft - @FIFOBalance < 0                         BEGIN                             SET @FIFOPayAmt = @FIFOLeft                         END                     ELSE                         BEGIN                             SET @FIFOPayAmt = @FIFOBalance                         END                     INSERT INTO [accountreceivablehistory] ( [accountreceivableid], [batchnumber], [amount], [paymentid], [comment], [cashierid], [historytype] )                            VALUES ( @FIFOARID, @BatchNumber, -@FIFOPayAmt, @PaymentID, 'NUHQ: Auto multistore payment', @CashierID, 2 )                     IF (@@ERROR <> 0)                         BEGIN                             SET @ErrorSave = @@ERROR                             ROLLBACK TRANSACTION PAYMENT                             RAISERROR ('Unable to insert fifo accountreceivablehistory for account receivable (%d)', 16, 1, @FIFOARID )                             RETURN (@ErrorSave)                         END                          UPDATE [accountreceivable] SET [accountreceivable].[balance] = [accountreceivable].[balance] - @FIFOPayAmt WHERE [accountreceivable].[id] = @FIFOARID                     IF (@@ERROR <> 0)                         BEGIN                             SET @ErrorSave = @@ERROR                             ROLLBACK TRANSACTION PAYMENT                             RAISERROR ('Unable to update accountreceivable for account receivable (%d)', 16, 1, @FIFOARID)                             RETURN (@ErrorSave)                         END                     SET @FIFOLeft = @FIFOLeft - @FIFOPayAmt                     FETCH NEXT FROM TransCursor                     INTO @FIFOARID, @FIFOBalance                 END                 CLOSE TransCursor                 DEALLOCATE TransCursor                 SET @OverPayAmt = @OverPayAmt + @FIFOLeft                 SET @StoreARAmount = 0.00             END      END IF @PartPayID IS NOT NULL AND @PartPayID > 0     BEGIN         SELECT @ARBalance = [accountreceivable].[balance] FROM [accountreceivable] with (NOLOCK) WHERE [accountreceivable].[id] = @PartPayID         IF (@@ERROR <> 0)             BEGIN                 SET @ErrorSave = @@ERROR                 ROLLBACK TRANSACTION PAYMENT                 RAISERROR ('Unable to fetch part payment accountreceivable id for account receivable (%s)', 16, 1, @StrARID)                 RETURN (@ErrorSave)             END         IF ( @ARBalance IS NULL )             BEGIN                 ROLLBACK TRANSACTION PAYMENT                 RAISERROR ('Unable to find account receivable transaction (%s)', 16, 1, @StrARID)                 RETURN (14)             END         IF (@ARBalance < @PartPayAmt)             BEGIN                 SET @PrintVar = CAST(@PartPayAmt AS varchar(10))                 SET @PrintVar2 = CAST(@ARBalance AS varchar(10))                 ROLLBACK TRANSACTION PAYMENT                 RAISERROR ('Part payment for account receivable (%d) is too much. Max is (%s-%s)', 16, 1, @PartPayID, @PrintVar, @PrintVar2 )                 RETURN (13)             END         INSERT INTO [accountreceivablehistory] ( [accountreceivableid], [batchnumber], [amount], [paymentid], [comment], [cashierid], [historytype] )                VALUES ( @PartPayID, @BatchNumber, -@PartPayAmt, @PaymentID, 'NUHQ: Auto multistore part payment', @CashierID, 2 )         IF (@@ERROR <> 0)             BEGIN                 SET @ErrorSave = @@ERROR                 ROLLBACK TRANSACTION PAYMENT                 RAISERROR ('Unable to insert part payment accountreceivablehistory for account receivable (%d)', 16, 1, @PartPayID)                 RETURN (@ErrorSave)             END              UPDATE [accountreceivable] SET [accountreceivable].[balance] = [accountreceivable].[balance] - @PartPayAmt WHERE [accountreceivable].[id] = @PartPayID         IF (@@ERROR <> 0)             BEGIN                 SET @ErrorSave = @@ERROR                 ROLLBACK TRANSACTION PAYMENT                 RAISERROR ('Unable to update part payment accountreceivable for account receivable (%d)', 16, 1, @PartPayID)                 RETURN (@ErrorSave)             END         SET @StoreARAmount = @StoreARAmount - @PartPayAmt     END IF 0.00 <> @StoreARAmount BEGIN     SET @PrintVar = CAST(@StoreARAmount AS varchar(10))     ROLLBACK TRANSACTION PAYMENT     RAISERROR ('Incorrect balance at end of payments. Expected (0) got (%s)', 16, 1, @PrintVar)     RETURN (14) END      IF @OverPayAmt IS NOT NULL AND @OverPayAmt > 0.00     BEGIN         INSERT INTO [accountreceivable] ( [customerid], [originalamount], [transactionnumber], [type], [balance] )                VALUES ( @CustomerID, -@OverPayAmt, 0, 2, -@OverPayAmt )         IF (@@ERROR <> 0)             BEGIN                 SET @ErrorSave = @@ERROR                 ROLLBACK TRANSACTION PAYMENT                 RAISERROR ('Error inserting overpayment into accountreceivable', 16, 1)                 RETURN (@ErrorSave)             END         SELECT @ARID = @@IDENTITY         INSERT INTO [accountreceivablehistory] ( [accountreceivableid], [batchnumber], [amount], [paymentid], [comment], [cashierid], [historytype] )                VALUES ( @ARID, @BatchNumber, -@OverPayAmt, @PaymentID, 'NUHQ: Auto multistore credit payment', @CashierID, 2 )         IF (@@ERROR <> 0)             BEGIN                 SET @ErrorSave = @@ERROR                 ROLLBACK TRANSACTION PAYMENT                 RAISERROR ('Unable to insert overpayment accountreceivablehistory', 16, 1)                 RETURN (@ErrorSave)             END          END IF (@OrigStoreARAmount IS NOT NULL AND @OrigStoreARAmount <> 0.00)     BEGIN         UPDATE [customer] set [customer].[accountbalance] = [customer].[accountbalance] - @OrigStoreARAmount,                               [customer].[totalvisits]    = [customer].[totalvisits]    + 1,                               [customer].[lastvisit]      = CURRENT_TIMESTAMP,                               [customer].[lastupdated]    = CURRENT_TIMESTAMP                 where [customer].[id] = @CustomerID         IF (@@ERROR <> 0)             BEGIN                 SET @ErrorSave = @@ERROR                 ROLLBACK TRANSACTION PAYMENT                 RAISERROR ('Error updating customer account balance', 16, 1)                 RETURN (@ErrorSave)             END     END COMMIT TRANSACTION PAYMENT RETURN (0)END
GO
/****** Object:  Default [DF_QuoteTenderEntry_OrderID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[QuoteTenderEntry] ADD  CONSTRAINT [DF_QuoteTenderEntry_OrderID]  DEFAULT (0) FOR [OrderID]
GO
/****** Object:  Default [DF_QuoteTenderEntry_TenderID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[QuoteTenderEntry] ADD  CONSTRAINT [DF_QuoteTenderEntry_TenderID]  DEFAULT (0) FOR [TenderID]
GO
/****** Object:  Default [DF_QuoteTenderEntry_CreditCardExpiration]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[QuoteTenderEntry] ADD  CONSTRAINT [DF_QuoteTenderEntry_CreditCardExpiration]  DEFAULT ('') FOR [CreditCardExpiration]
GO
/****** Object:  Default [DF_QuoteTenderEntry_CreditCardNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[QuoteTenderEntry] ADD  CONSTRAINT [DF_QuoteTenderEntry_CreditCardNumber]  DEFAULT ('') FOR [CreditCardNumber]
GO
/****** Object:  Default [DF_QuoteTenderEntry_CreditCardApprovalCode]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[QuoteTenderEntry] ADD  CONSTRAINT [DF_QuoteTenderEntry_CreditCardApprovalCode]  DEFAULT ('') FOR [CreditCardApprovalCode]
GO
/****** Object:  Default [DF_QuoteTenderEntry_Amount]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[QuoteTenderEntry] ADD  CONSTRAINT [DF_QuoteTenderEntry_Amount]  DEFAULT (0) FOR [Amount]
GO
/****** Object:  Default [DF_QuoteTenderEntry_RoundingError]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[QuoteTenderEntry] ADD  CONSTRAINT [DF_QuoteTenderEntry_RoundingError]  DEFAULT (0) FOR [RoundingError]
GO
/****** Object:  Default [DF_QuoteTenderEntry_AccountHolder]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[QuoteTenderEntry] ADD  CONSTRAINT [DF_QuoteTenderEntry_AccountHolder]  DEFAULT ('') FOR [AccountHolder]
GO
/****** Object:  Default [DF_Message_FromCashierID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Message] ADD  CONSTRAINT [DF_Message_FromCashierID]  DEFAULT (0) FOR [FromCashierID]
GO
/****** Object:  Default [DF_Message_ToCashierID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Message] ADD  CONSTRAINT [DF_Message_ToCashierID]  DEFAULT (0) FOR [ToCashierID]
GO
/****** Object:  Default [DF_Message_Title]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Message] ADD  CONSTRAINT [DF_Message_Title]  DEFAULT ('') FOR [Title]
GO
/****** Object:  Default [DF_Message_Message]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Message] ADD  CONSTRAINT [DF_Message_Message]  DEFAULT ('') FOR [Text]
GO
/****** Object:  Default [DF_Message_DateSent]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Message] ADD  CONSTRAINT [DF_Message_DateSent]  DEFAULT (getdate()) FOR [DateSent]
GO
/****** Object:  Default [DF_Message_DateRead]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Message] ADD  CONSTRAINT [DF_Message_DateRead]  DEFAULT (getdate()) FOR [DateRead]
GO
/****** Object:  Default [DF_Message_Deleted]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Message] ADD  CONSTRAINT [DF_Message_Deleted]  DEFAULT (0) FOR [Deleted]
GO
/****** Object:  Default [DF__Message__StoreID__76D69450]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Message] ADD  DEFAULT (0) FOR [StoreID]
GO
/****** Object:  Default [DF_ImportEntry_ImportID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ImportEntry] ADD  CONSTRAINT [DF_ImportEntry_ImportID]  DEFAULT (0) FOR [ImportID]
GO
/****** Object:  Default [DF_ImportEntry_ItemID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ImportEntry] ADD  CONSTRAINT [DF_ImportEntry_ItemID]  DEFAULT (0) FOR [ItemID]
GO
/****** Object:  Default [DF_ImportEntry_Previous]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ImportEntry] ADD  CONSTRAINT [DF_ImportEntry_Previous]  DEFAULT (0) FOR [Previous]
GO
/****** Object:  Default [DF_ImportEntry_New]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ImportEntry] ADD  CONSTRAINT [DF_ImportEntry_New]  DEFAULT (0) FOR [New]
GO
/****** Object:  Default [DF_ImportEntry_Field]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ImportEntry] ADD  CONSTRAINT [DF_ImportEntry_Field]  DEFAULT ('') FOR [Field]
GO
/****** Object:  Default [DF_ImportEntry_AdditionalInfo]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ImportEntry] ADD  CONSTRAINT [DF_ImportEntry_AdditionalInfo]  DEFAULT ('') FOR [AdditionalInfo]
GO
/****** Object:  Default [DF_Import_Date]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Import] ADD  CONSTRAINT [DF_Import_Date]  DEFAULT (getdate()) FOR [Date]
GO
/****** Object:  Default [DF_Import_Type]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Import] ADD  CONSTRAINT [DF_Import_Type]  DEFAULT (0) FOR [Type]
GO
/****** Object:  Default [DF_Import_Filename]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Import] ADD  CONSTRAINT [DF_Import_Filename]  DEFAULT ('') FOR [Filename]
GO
/****** Object:  Default [DF_PhysicalInventoryEntry_StoreID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[PhysicalInventoryEntry] ADD  CONSTRAINT [DF_PhysicalInventoryEntry_StoreID]  DEFAULT (0) FOR [StoreID]
GO
/****** Object:  Default [DF_PhysicalInventoryEntry_PhysicalInventoryID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[PhysicalInventoryEntry] ADD  CONSTRAINT [DF_PhysicalInventoryEntry_PhysicalInventoryID]  DEFAULT (0) FOR [PhysicalInventoryID]
GO
/****** Object:  Default [DF_PhysicalInventoryEntry_ReasonCodeID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[PhysicalInventoryEntry] ADD  CONSTRAINT [DF_PhysicalInventoryEntry_ReasonCodeID]  DEFAULT (0) FOR [ReasonCodeID]
GO
/****** Object:  Default [DF_PhysicalInventoryEntry_ItemID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[PhysicalInventoryEntry] ADD  CONSTRAINT [DF_PhysicalInventoryEntry_ItemID]  DEFAULT (0) FOR [ItemID]
GO
/****** Object:  Default [DF_PhysicalInventoryEntry_BinLocation]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[PhysicalInventoryEntry] ADD  CONSTRAINT [DF_PhysicalInventoryEntry_BinLocation]  DEFAULT ('') FOR [BinLocation]
GO
/****** Object:  Default [DF_PhysicalInventoryEntry_Price]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[PhysicalInventoryEntry] ADD  CONSTRAINT [DF_PhysicalInventoryEntry_Price]  DEFAULT (0) FOR [Price]
GO
/****** Object:  Default [DF_PhysicalInventoryEntry_Cost]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[PhysicalInventoryEntry] ADD  CONSTRAINT [DF_PhysicalInventoryEntry_Cost]  DEFAULT (0) FOR [Cost]
GO
/****** Object:  Default [DF_PhysicalInventoryEntry_QuantityCounted]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[PhysicalInventoryEntry] ADD  CONSTRAINT [DF_PhysicalInventoryEntry_QuantityCounted]  DEFAULT (0) FOR [QuantityCounted]
GO
/****** Object:  Default [DF_PhysicalInventoryEntry_QuantitySold]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[PhysicalInventoryEntry] ADD  CONSTRAINT [DF_PhysicalInventoryEntry_QuantitySold]  DEFAULT (0) FOR [QuantitySold]
GO
/****** Object:  Default [DF_PhysicalInventoryEntry_QuantityReturned]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[PhysicalInventoryEntry] ADD  CONSTRAINT [DF_PhysicalInventoryEntry_QuantityReturned]  DEFAULT (0) FOR [QuantityReturned]
GO
/****** Object:  Default [DF_PhysicalInventoryEntry_QuantityXferIn]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[PhysicalInventoryEntry] ADD  CONSTRAINT [DF_PhysicalInventoryEntry_QuantityXferIn]  DEFAULT (0) FOR [QuantityXferIn]
GO
/****** Object:  Default [DF_PhysicalInventoryEntry_QuantityXferOut]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[PhysicalInventoryEntry] ADD  CONSTRAINT [DF_PhysicalInventoryEntry_QuantityXferOut]  DEFAULT (0) FOR [QuantityXferOut]
GO
/****** Object:  Default [DF_PhysicalInventoryEntry_QuantityAdjusted]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[PhysicalInventoryEntry] ADD  CONSTRAINT [DF_PhysicalInventoryEntry_QuantityAdjusted]  DEFAULT (0) FOR [QuantityAdjusted]
GO
/****** Object:  Default [DF_PhysicalInventoryEntry_QuantityToOffline]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[PhysicalInventoryEntry] ADD  CONSTRAINT [DF_PhysicalInventoryEntry_QuantityToOffline]  DEFAULT (0) FOR [QuantityToOffline]
GO
/****** Object:  Default [DF_PhysicalInventoryEntry_QuantityFromOffline]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[PhysicalInventoryEntry] ADD  CONSTRAINT [DF_PhysicalInventoryEntry_QuantityFromOffline]  DEFAULT (0) FOR [QuantityFromOffline]
GO
/****** Object:  Default [DF_PhysicalInventoryEntry_Refreshed]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[PhysicalInventoryEntry] ADD  CONSTRAINT [DF_PhysicalInventoryEntry_Refreshed]  DEFAULT (0) FOR [QuantityRefreshed]
GO
/****** Object:  Default [DF_physicalinventoryentry_NUSSkipUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[PhysicalInventoryEntry] ADD  CONSTRAINT [DF_physicalinventoryentry_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
/****** Object:  Default [DF_OldJournal_StoreID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[OldJournal] ADD  CONSTRAINT [DF_OldJournal_StoreID]  DEFAULT (0) FOR [StoreID]
GO
/****** Object:  Default [DF_nus_unmatched_scripts_NUSSkipUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_Unmatched_Scripts] ADD  CONSTRAINT [DF_nus_unmatched_scripts_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
/****** Object:  Default [DF_NUS_TransactionStats_LastUpdated]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_TransactionStats] ADD  CONSTRAINT [DF_NUS_TransactionStats_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
/****** Object:  Default [DF_NUS_Settings_Entry_Default]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_Settings_Entry] ADD  CONSTRAINT [DF_NUS_Settings_Entry_Default]  DEFAULT ((0)) FOR [Default]
GO
/****** Object:  Default [DF_NU_Settings_hidden]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_Settings] ADD  CONSTRAINT [DF_NU_Settings_hidden]  DEFAULT ((0)) FOR [hidden]
GO
/****** Object:  Default [DF_NUS_Settings_type]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_Settings] ADD  CONSTRAINT [DF_NUS_Settings_type]  DEFAULT ((0)) FOR [type]
GO
/****** Object:  Default [DF_NUS_Settings_Source]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_Settings] ADD  CONSTRAINT [DF_NUS_Settings_Source]  DEFAULT ((0)) FOR [Source]
GO
/****** Object:  Default [DF_NUS_PostCodeRegistration_RegistrationDate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PostCodeTransaction] ADD  CONSTRAINT [DF_NUS_PostCodeRegistration_RegistrationDate]  DEFAULT (getdate()) FOR [LastUpdated]
GO
/****** Object:  Default [DF_nus_postcodetransaction_NUSSkipUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PostCodeTransaction] ADD  CONSTRAINT [DF_nus_postcodetransaction_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
/****** Object:  Default [DF_RecordDeletedLog_TableName]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[RecordDeletedLog] ADD  CONSTRAINT [DF_RecordDeletedLog_TableName]  DEFAULT ('') FOR [TableName]
GO
/****** Object:  Default [DF_RecordDeletedLog_IDFieldName]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[RecordDeletedLog] ADD  CONSTRAINT [DF_RecordDeletedLog_IDFieldName]  DEFAULT ('') FOR [IDFieldName]
GO
/****** Object:  Default [DF_RecordDeletedLog_RecordID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[RecordDeletedLog] ADD  CONSTRAINT [DF_RecordDeletedLog_RecordID]  DEFAULT (0) FOR [RecordID]
GO
/****** Object:  Default [DF_RecordDeletedLog_WhenDeleted]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[RecordDeletedLog] ADD  CONSTRAINT [DF_RecordDeletedLog_WhenDeleted]  DEFAULT (getdate()) FOR [WhenDeleted]
GO
/****** Object:  Default [DF_RecordDeletedLog_StoreID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[RecordDeletedLog] ADD  CONSTRAINT [DF_RecordDeletedLog_StoreID]  DEFAULT (0) FOR [StoreID]
GO
/****** Object:  Default [DF_ARHistoryMirror_LocalStoreID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ARHistoryMirror] ADD  CONSTRAINT [DF_ARHistoryMirror_LocalStoreID]  DEFAULT (0) FOR [StoreID]
GO
/****** Object:  Default [DF_ARHistoryMirror_IsProcessed]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ARHistoryMirror] ADD  CONSTRAINT [DF_ARHistoryMirror_IsProcessed]  DEFAULT (0) FOR [IsProcessed]
GO
/****** Object:  Default [DF_AccountingTerms_HQID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[AccountingTerms] ADD  CONSTRAINT [DF_AccountingTerms_HQID]  DEFAULT (0) FOR [HQID]
GO
/****** Object:  Default [DF_AccountingTerms_Name]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[AccountingTerms] ADD  CONSTRAINT [DF_AccountingTerms_Name]  DEFAULT ('') FOR [Name]
GO
/****** Object:  Default [DF_AccountingAccounts_HQID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[AccountingAccounts] ADD  CONSTRAINT [DF_AccountingAccounts_HQID]  DEFAULT (0) FOR [HQID]
GO
/****** Object:  Default [DF_AccountingAccounts_AccountNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[AccountingAccounts] ADD  CONSTRAINT [DF_AccountingAccounts_AccountNumber]  DEFAULT ('') FOR [AccountNumber]
GO
/****** Object:  Default [DF_AccountingAccounts_Name]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[AccountingAccounts] ADD  CONSTRAINT [DF_AccountingAccounts_Name]  DEFAULT ('') FOR [Name]
GO
/****** Object:  Default [DF_CalendarEvent_StoreID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[CalendarEvent] ADD  CONSTRAINT [DF_CalendarEvent_StoreID]  DEFAULT (0) FOR [StoreID]
GO
/****** Object:  Default [DF_CalendarEvent_CashierID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[CalendarEvent] ADD  CONSTRAINT [DF_CalendarEvent_CashierID]  DEFAULT (0) FOR [CashierID]
GO
/****** Object:  Default [DF_CalendarEvent_Date]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[CalendarEvent] ADD  CONSTRAINT [DF_CalendarEvent_Date]  DEFAULT (getdate()) FOR [DateTime]
GO
/****** Object:  Default [DF_CalendarEvent_Text]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[CalendarEvent] ADD  CONSTRAINT [DF_CalendarEvent_Text]  DEFAULT ('') FOR [Text]
GO
/****** Object:  Default [DF_CalendarEvent_ReminderEnabled]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[CalendarEvent] ADD  CONSTRAINT [DF_CalendarEvent_ReminderEnabled]  DEFAULT (0) FOR [ReminderEnabled]
GO
/****** Object:  Default [DF_CalendarEvent_ReminderDate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[CalendarEvent] ADD  CONSTRAINT [DF_CalendarEvent_ReminderDate]  DEFAULT (getdate()) FOR [ReminderDate]
GO
/****** Object:  Default [DF_CalendarEvent_IsPersonal]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[CalendarEvent] ADD  CONSTRAINT [DF_CalendarEvent_IsPersonal]  DEFAULT (0) FOR [IsPersonal]
GO
/****** Object:  Default [DF_CustomCaption_HQID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[CustomCaption] ADD  CONSTRAINT [DF_CustomCaption_HQID]  DEFAULT (0) FOR [HQID]
GO
/****** Object:  Default [DF_CustomCaption_Style]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[CustomCaption] ADD  CONSTRAINT [DF_CustomCaption_Style]  DEFAULT (0) FOR [Style]
GO
/****** Object:  Default [DF_CustomCaption_Caption]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[CustomCaption] ADD  CONSTRAINT [DF_CustomCaption_Caption]  DEFAULT ('') FOR [Caption]
GO
/****** Object:  Default [DF__DailySale__Store__7EB943E8]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[DailySales] ADD  CONSTRAINT [DF__DailySale__Store__7EB943E8]  DEFAULT (0) FOR [StoreID]
GO
/****** Object:  Default [DF_Exchange_DateCreated]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Exchange] ADD  CONSTRAINT [DF_Exchange_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Exchange_LastUpdated]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Exchange] ADD  CONSTRAINT [DF_Exchange_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
/****** Object:  Default [DF_Exchange_ProcessorCode]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Exchange] ADD  CONSTRAINT [DF_Exchange_ProcessorCode]  DEFAULT ('') FOR [ProcessorCode]
GO
/****** Object:  Default [DF_Exchange_Data]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Exchange] ADD  CONSTRAINT [DF_Exchange_Data]  DEFAULT ('') FOR [Data]
GO
/****** Object:  Default [DF_Exchange_Processed]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Exchange] ADD  CONSTRAINT [DF_Exchange_Processed]  DEFAULT (0) FOR [Status]
GO
/****** Object:  Default [Df_Exchange_Comment_1]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Exchange] ADD  CONSTRAINT [Df_Exchange_Comment_1]  DEFAULT ('') FOR [Comment]
GO
/****** Object:  Default [DF_MacroEvent_MacroID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[MacroEvent] ADD  CONSTRAINT [DF_MacroEvent_MacroID]  DEFAULT (0) FOR [MacroID]
GO
/****** Object:  Default [DF_MacroEvent_Message]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[MacroEvent] ADD  CONSTRAINT [DF_MacroEvent_Message]  DEFAULT (0) FOR [Message]
GO
/****** Object:  Default [DF_MacroEvent_ParamL]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[MacroEvent] ADD  CONSTRAINT [DF_MacroEvent_ParamL]  DEFAULT (0) FOR [ParamL]
GO
/****** Object:  Default [DF_MacroEvent_ParamH]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[MacroEvent] ADD  CONSTRAINT [DF_MacroEvent_ParamH]  DEFAULT (0) FOR [ParamH]
GO
/****** Object:  Default [DF_MacroEvent_Time]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[MacroEvent] ADD  CONSTRAINT [DF_MacroEvent_Time]  DEFAULT (0) FOR [Time]
GO
/****** Object:  Default [DF_MacroEvent_hWnd]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[MacroEvent] ADD  CONSTRAINT [DF_MacroEvent_hWnd]  DEFAULT (0) FOR [hWnd]
GO
/****** Object:  Default [DF_Macro_RegisterID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Macro] ADD  CONSTRAINT [DF_Macro_RegisterID]  DEFAULT (0) FOR [RegisterID]
GO
/****** Object:  Default [DF_Macro_Name]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Macro] ADD  CONSTRAINT [DF_Macro_Name]  DEFAULT ('') FOR [Caption]
GO
/****** Object:  Default [DF_Macro_AssignmentNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Macro] ADD  CONSTRAINT [DF_Macro_AssignmentNumber]  DEFAULT (0) FOR [AssignmentNumber]
GO
/****** Object:  Default [DF_LimitEntry_ItemID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[LimitEntry] ADD  CONSTRAINT [DF_LimitEntry_ItemID]  DEFAULT (0) FOR [ItemID]
GO
/****** Object:  Default [DF_LimitEntry_Units]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[LimitEntry] ADD  CONSTRAINT [DF_LimitEntry_Units]  DEFAULT (0) FOR [Units]
GO
/****** Object:  Default [DF__NUS_PO_Lo__field__37661AB1]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Log] ADD  DEFAULT ('') FOR [field]
GO
/****** Object:  Default [DF__NUS_PO_Lo__actio__385A3EEA]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Log] ADD  DEFAULT ((0)) FOR [action]
GO
/****** Object:  Default [DF__NUS_PO_Lo__perfo__394E6323]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Log] ADD  DEFAULT (getdate()) FOR [performed]
GO
/****** Object:  Default [DF_NUS_NUHQ_Requests_answerreturned]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_NUHQ_Requests] ADD  CONSTRAINT [DF_NUS_NUHQ_Requests_answerreturned]  DEFAULT ((0)) FOR [answerreturned]
GO
/****** Object:  Default [DF_NUS_NUHQ_Log_updated]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_NUHQ_Log] ADD  CONSTRAINT [DF_NUS_NUHQ_Log_updated]  DEFAULT (getdate()) FOR [updated]
GO
/****** Object:  Default [DF_NUS_MonitorCommand_Sent]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_MonitorCommand] ADD  CONSTRAINT [DF_NUS_MonitorCommand_Sent]  DEFAULT (getdate()) FOR [Sent]
GO
/****** Object:  Default [DF_NUS_MonitorCommand_Command]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_MonitorCommand] ADD  CONSTRAINT [DF_NUS_MonitorCommand_Command]  DEFAULT ('ping') FOR [Command]
GO
/****** Object:  Default [DF_NUS_Monitor_status]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_Monitor] ADD  CONSTRAINT [DF_NUS_Monitor_status]  DEFAULT ((0)) FOR [status]
GO
/****** Object:  Default [DF_NUS_Monitor_statusupated]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_Monitor] ADD  CONSTRAINT [DF_NUS_Monitor_statusupated]  DEFAULT (getdate()) FOR [statusupdated]
GO
/****** Object:  Default [DF_NUS_MarketSmart_Transaction_SendAttemptCount]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_MarketSmart_Transaction] ADD  CONSTRAINT [DF_NUS_MarketSmart_Transaction_SendAttemptCount]  DEFAULT ((0)) FOR [SendAttemptCount]
GO
/****** Object:  Default [DF_NUS_LicenceLog_MachineGuid]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_LicenceLog] ADD  CONSTRAINT [DF_NUS_LicenceLog_MachineGuid]  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [MachineGuid]
GO
/****** Object:  Default [DF_NUS_Labels_Lastupdated]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_Labels] ADD  CONSTRAINT [DF_NUS_Labels_Lastupdated]  DEFAULT (getdate()) FOR [Lastupdated]
GO
/****** Object:  Default [DF_NUS_Labels_format]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_Labels] ADD  CONSTRAINT [DF_NUS_Labels_format]  DEFAULT ('') FOR [format]
GO
/****** Object:  Default [DF_NUS_Labels_barcode]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_Labels] ADD  CONSTRAINT [DF_NUS_Labels_barcode]  DEFAULT ((11)) FOR [barcode]
GO
/****** Object:  Default [DF_NUS_Labels_barcodecaption]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_Labels] ADD  CONSTRAINT [DF_NUS_Labels_barcodecaption]  DEFAULT ((0)) FOR [barcodecaption]
GO
/****** Object:  Default [DF_NUS_Labels_barwidth]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_Labels] ADD  CONSTRAINT [DF_NUS_Labels_barwidth]  DEFAULT ((0)) FOR [barwidth]
GO
/****** Object:  Default [DF_NUS_Labels_pricesource]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_Labels] ADD  CONSTRAINT [DF_NUS_Labels_pricesource]  DEFAULT ((0)) FOR [pricesource]
GO
/****** Object:  Default [DF__NUS_Label__Barco__15B0212B]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_Labels] ADD  DEFAULT ('') FOR [BarcodeValue]
GO
/****** Object:  Default [DF__NUS_Label__Descr__16A44564]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_Labels] ADD  DEFAULT ('') FOR [Description]
GO
/****** Object:  Default [DF_NUS_Hire_paid]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_Hire] ADD  CONSTRAINT [DF_NUS_Hire_paid]  DEFAULT ((0)) FOR [paid]
GO
/****** Object:  Default [DF_NUS_Fred2Pos_Dat_CUSTOMERID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_Fred2Pos_Dat] ADD  CONSTRAINT [DF_NUS_Fred2Pos_Dat_CUSTOMERID]  DEFAULT ((0)) FOR [CUSTOMERID]
GO
/****** Object:  Default [DF_NUS_Fred2Pos_Dat_WORKORDER]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_Fred2Pos_Dat] ADD  CONSTRAINT [DF_NUS_Fred2Pos_Dat_WORKORDER]  DEFAULT ((0)) FOR [WORKORDER]
GO
/****** Object:  Default [DF_NUS_Fred2Pos_Dat_COMPLETED]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_Fred2Pos_Dat] ADD  CONSTRAINT [DF_NUS_Fred2Pos_Dat_COMPLETED]  DEFAULT ((0)) FOR [COMPLETED]
GO
/****** Object:  Default [DF__NUS_Fred2__WORKO__2D87AABC]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_Fred2Pos_Dat] ADD  DEFAULT ((0)) FOR [WORKORDERID]
GO
/****** Object:  Default [DF__NUS_Fred2__Trans__2E7BCEF5]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_Fred2Pos_Dat] ADD  DEFAULT ((0)) FOR [TransactionNumber]
GO
/****** Object:  Default [DF_NUS_FieldMap_soisKey]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_FieldMap] ADD  CONSTRAINT [DF_NUS_FieldMap_soisKey]  DEFAULT ((0)) FOR [soisKey]
GO
/****** Object:  Default [DF_NUS_FieldMap_Nuhqiskey]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_FieldMap] ADD  CONSTRAINT [DF_NUS_FieldMap_Nuhqiskey]  DEFAULT ((0)) FOR [Nuhqiskey]
GO
/****** Object:  Default [DF_NUS_FieldMap_Nuhqenc]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_FieldMap] ADD  CONSTRAINT [DF_NUS_FieldMap_Nuhqenc]  DEFAULT ((0)) FOR [Nuhqenc]
GO
/****** Object:  Default [DF_NUS_DBVersion_Version]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_DBVersion] ADD  CONSTRAINT [DF_NUS_DBVersion_Version]  DEFAULT ('') FOR [Version]
GO
/****** Object:  Default [DF_NUS_Clients_MachineName]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_Clients] ADD  CONSTRAINT [DF_NUS_Clients_MachineName]  DEFAULT ('') FOR [MachineName]
GO
/****** Object:  Default [DF_NUS_Clients_RegisterNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_Clients] ADD  CONSTRAINT [DF_NUS_Clients_RegisterNumber]  DEFAULT ((0)) FOR [RegisterNumber]
GO
/****** Object:  Default [DF_NUS_Clients_CurrentVersion]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_Clients] ADD  CONSTRAINT [DF_NUS_Clients_CurrentVersion]  DEFAULT ('') FOR [CurrentVersion]
GO
/****** Object:  Default [DF_NUS_Clients_IsMaster]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_Clients] ADD  CONSTRAINT [DF_NUS_Clients_IsMaster]  DEFAULT ((0)) FOR [IsMaster]
GO
/****** Object:  Default [DF_NUS_Clients_IsUpdating]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_Clients] ADD  CONSTRAINT [DF_NUS_Clients_IsUpdating]  DEFAULT ((0)) FOR [IsUpdating]
GO
/****** Object:  Default [DF_NUS_Clients_LastPolled]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_Clients] ADD  CONSTRAINT [DF_NUS_Clients_LastPolled]  DEFAULT (getdate()) FOR [LastPolled]
GO
/****** Object:  Default [DF_NUS_Banner_Ads_Total_Time_Displayed]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_Banner_Ads] ADD  CONSTRAINT [DF_NUS_Banner_Ads_Total_Time_Displayed]  DEFAULT ((0)) FOR [Total_Time_Displayed]
GO
/****** Object:  Default [DF_NUS_Banner_Ads_Num_Times_Displayed]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_Banner_Ads] ADD  CONSTRAINT [DF_NUS_Banner_Ads_Num_Times_Displayed]  DEFAULT ((0)) FOR [Num_Times_Displayed]
GO
/****** Object:  Default [DF_NoSaleAborted_StoreID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NonTenderTransaction] ADD  CONSTRAINT [DF_NoSaleAborted_StoreID]  DEFAULT (0) FOR [StoreID]
GO
/****** Object:  Default [DF_NoSaleAborted_IsNoSale]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NonTenderTransaction] ADD  CONSTRAINT [DF_NoSaleAborted_IsNoSale]  DEFAULT (0) FOR [TransactionType]
GO
/****** Object:  Default [DF_NoSaleAborted_BatchNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NonTenderTransaction] ADD  CONSTRAINT [DF_NoSaleAborted_BatchNumber]  DEFAULT (0) FOR [BatchNumber]
GO
/****** Object:  Default [DF_NoSaleAborted_Time]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NonTenderTransaction] ADD  CONSTRAINT [DF_NoSaleAborted_Time]  DEFAULT (getdate()) FOR [Time]
GO
/****** Object:  Default [DF_NoSaleAborted_CashierID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NonTenderTransaction] ADD  CONSTRAINT [DF_NoSaleAborted_CashierID]  DEFAULT (0) FOR [CashierID]
GO
/****** Object:  Default [DF_NoSaleAborted_Comment]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NonTenderTransaction] ADD  CONSTRAINT [DF_NoSaleAborted_Comment]  DEFAULT ('') FOR [Comment]
GO
/****** Object:  Default [Df_NonTenderTransaction_ReasonCodeID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NonTenderTransaction] ADD  CONSTRAINT [Df_NonTenderTransaction_ReasonCodeID]  DEFAULT (0) FOR [ReasonCodeID]
GO
/****** Object:  Default [DF_Report_ReportFilename]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Report] ADD  CONSTRAINT [DF_Report_ReportFilename]  DEFAULT ('') FOR [ReportFilename]
GO
/****** Object:  Default [DF_Report_Description]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Report] ADD  CONSTRAINT [DF_Report_Description]  DEFAULT ('') FOR [Description]
GO
/****** Object:  Default [DF__Report__StoreID__7C8F6DA6]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Report] ADD  DEFAULT (0) FOR [StoreID]
GO
/****** Object:  Default [DF_Security_FormName]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Security] ADD  CONSTRAINT [DF_Security_FormName]  DEFAULT ('') FOR [FormName]
GO
/****** Object:  Default [DF_Security_ClassName]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Security] ADD  CONSTRAINT [DF_Security_ClassName]  DEFAULT ('') FOR [ClassName]
GO
/****** Object:  Default [DF_Security_ControlType]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Security] ADD  CONSTRAINT [DF_Security_ControlType]  DEFAULT ('') FOR [ControlType]
GO
/****** Object:  Default [DF_Security_ControlName]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Security] ADD  CONSTRAINT [DF_Security_ControlName]  DEFAULT ('') FOR [ControlName]
GO
/****** Object:  Default [DF_Security_ControlIndex]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Security] ADD  CONSTRAINT [DF_Security_ControlIndex]  DEFAULT (0) FOR [ControlIndex]
GO
/****** Object:  Default [DF_Security_ReadDisableCode]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Security] ADD  CONSTRAINT [DF_Security_ReadDisableCode]  DEFAULT (0) FOR [ReadDisableCode]
GO
/****** Object:  Default [DF_Security_ChangeDisableCode]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Security] ADD  CONSTRAINT [DF_Security_ChangeDisableCode]  DEFAULT (0) FOR [ChangeDisableCode]
GO
/****** Object:  Default [DF_Security_ColumnTitle]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Security] ADD  CONSTRAINT [DF_Security_ColumnTitle]  DEFAULT ('') FOR [ColumnTitle]
GO
/****** Object:  Default [DF__Security__StoreI__7D8391DF]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Security] ADD  DEFAULT (0) FOR [StoreID]
GO
/****** Object:  Default [DF_TaxTotals_Date]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TaxTotals] ADD  CONSTRAINT [DF_TaxTotals_Date]  DEFAULT (getdate()) FOR [Date]
GO
/****** Object:  Default [DF_TaxTotals_StoreID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TaxTotals] ADD  CONSTRAINT [DF_TaxTotals_StoreID]  DEFAULT (0) FOR [StoreID]
GO
/****** Object:  Default [DF_TaxTotals_BatchNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TaxTotals] ADD  CONSTRAINT [DF_TaxTotals_BatchNumber]  DEFAULT (0) FOR [BatchNumber]
GO
/****** Object:  Default [DF_TaxTotals_TaxID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TaxTotals] ADD  CONSTRAINT [DF_TaxTotals_TaxID]  DEFAULT (0) FOR [TaxID]
GO
/****** Object:  Default [DF_TaxTotals_Total]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TaxTotals] ADD  CONSTRAINT [DF_TaxTotals_Total]  DEFAULT (0) FOR [Total]
GO
/****** Object:  Default [DF_taxtotals_NUSSkipUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TaxTotals] ADD  CONSTRAINT [DF_taxtotals_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
/****** Object:  Default [DF_TaxEntry_StoreID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TaxEntry] ADD  CONSTRAINT [DF_TaxEntry_StoreID]  DEFAULT (0) FOR [StoreID]
GO
/****** Object:  Default [DF_TaxEntry_TaxID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TaxEntry] ADD  CONSTRAINT [DF_TaxEntry_TaxID]  DEFAULT (0) FOR [TaxID]
GO
/****** Object:  Default [DF_TaxEntry_TransactionID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TaxEntry] ADD  CONSTRAINT [DF_TaxEntry_TransactionID]  DEFAULT (0) FOR [TransactionNumber]
GO
/****** Object:  Default [DF_TaxEntry_Amount]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TaxEntry] ADD  CONSTRAINT [DF_TaxEntry_Amount]  DEFAULT (0) FOR [Tax]
GO
/****** Object:  Default [DF_TaxEntry_TAxableAmount]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TaxEntry] ADD  CONSTRAINT [DF_TaxEntry_TAxableAmount]  DEFAULT (0) FOR [TaxableAmount]
GO
/****** Object:  Default [Df_TaxEntry_TransactionEntryID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TaxEntry] ADD  CONSTRAINT [Df_TaxEntry_TransactionEntryID]  DEFAULT (0) FOR [TransactionEntryID]
GO
/****** Object:  Default [DF_taxentry_NUSSkipUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TaxEntry] ADD  CONSTRAINT [DF_taxentry_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
/****** Object:  Default [DF_TimeCard_StoreID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TimeCard] ADD  CONSTRAINT [DF_TimeCard_StoreID]  DEFAULT (0) FOR [StoreID]
GO
/****** Object:  Default [DF_TimeCard_CashierID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TimeCard] ADD  CONSTRAINT [DF_TimeCard_CashierID]  DEFAULT (0) FOR [CashierID]
GO
/****** Object:  Default [DF_TimeCard_RegisterID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TimeCard] ADD  CONSTRAINT [DF_TimeCard_RegisterID]  DEFAULT (0) FOR [RegisterID]
GO
/****** Object:  Default [DF_TimeCard_TimeIn]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TimeCard] ADD  CONSTRAINT [DF_TimeCard_TimeIn]  DEFAULT ('') FOR [TimeIn]
GO
/****** Object:  Default [DF_TimeCard_TimeOut]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TimeCard] ADD  CONSTRAINT [DF_TimeCard_TimeOut]  DEFAULT ('') FOR [TimeOut]
GO
/****** Object:  Default [DF_TimeCard_Hours]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TimeCard] ADD  CONSTRAINT [DF_TimeCard_Hours]  DEFAULT (0) FOR [Hours]
GO
/****** Object:  Default [DF_VoucherEntry_StoreID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[VoucherEntry] ADD  CONSTRAINT [DF_VoucherEntry_StoreID]  DEFAULT (0) FOR [StoreID]
GO
/****** Object:  Default [DF_VoucherEntry_VoucherID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[VoucherEntry] ADD  CONSTRAINT [DF_VoucherEntry_VoucherID]  DEFAULT (0) FOR [VoucherID]
GO
/****** Object:  Default [DF_VoucherEntry_TransactionEntryID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[VoucherEntry] ADD  CONSTRAINT [DF_VoucherEntry_TransactionEntryID]  DEFAULT (0) FOR [TransactionEntryID]
GO
/****** Object:  Default [DF_VoucherEntry_TenderEntryID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[VoucherEntry] ADD  CONSTRAINT [DF_VoucherEntry_TenderEntryID]  DEFAULT (0) FOR [TenderEntryID]
GO
/****** Object:  Default [DF_VoucherEntry_Date]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[VoucherEntry] ADD  CONSTRAINT [DF_VoucherEntry_Date]  DEFAULT (getdate()) FOR [Date]
GO
/****** Object:  Default [DF_VoucherEntry_Amount]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[VoucherEntry] ADD  CONSTRAINT [DF_VoucherEntry_Amount]  DEFAULT (0) FOR [Amount]
GO
/****** Object:  Default [DF_VoucherEntry_TransactionNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[VoucherEntry] ADD  CONSTRAINT [DF_VoucherEntry_TransactionNumber]  DEFAULT (0) FOR [TransactionNumber]
GO
/****** Object:  Default [DF_Voucher_StoreID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Voucher] ADD  CONSTRAINT [DF_Voucher_StoreID]  DEFAULT (0) FOR [StoreID]
GO
/****** Object:  Default [DF_Voucher_Number]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Voucher] ADD  CONSTRAINT [DF_Voucher_Number]  DEFAULT ('') FOR [Number]
GO
/****** Object:  Default [DF_Voucher_ItemID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Voucher] ADD  CONSTRAINT [DF_Voucher_ItemID]  DEFAULT (0) FOR [ItemID]
GO
/****** Object:  Default [DF_Voucher_Balance]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Voucher] ADD  CONSTRAINT [DF_Voucher_Balance]  DEFAULT (0) FOR [Balance]
GO
/****** Object:  Default [DF_VisaNetAuthorization_ResponseTransactionStatusCode]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[VisaNetAuthorization] ADD  CONSTRAINT [DF_VisaNetAuthorization_ResponseTransactionStatusCode]  DEFAULT ('') FOR [ResponseTransactionStatusCode]
GO
/****** Object:  Default [DF_VersionHistory_Version]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[VersionHistory] ADD  CONSTRAINT [DF_VersionHistory_Version]  DEFAULT ('') FOR [Version]
GO
/****** Object:  Default [DF_VersionHistory_Date]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[VersionHistory] ADD  CONSTRAINT [DF_VersionHistory_Date]  DEFAULT (getdate()) FOR [Date]
GO
/****** Object:  Default [DF__VersionHi__Store__024846FC]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[VersionHistory] ADD  DEFAULT (0) FOR [StoreID]
GO
/****** Object:  Default [DF_UserTopic_ContextID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[UserTopic] ADD  CONSTRAINT [DF_UserTopic_ContextID]  DEFAULT (0) FOR [ContextID]
GO
/****** Object:  Default [DF_UserTopic_Title]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[UserTopic] ADD  CONSTRAINT [DF_UserTopic_Title]  DEFAULT ('') FOR [Title]
GO
/****** Object:  Default [DF_TransactionHoldEntry_EntryKey]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHoldEntry] ADD  CONSTRAINT [DF_TransactionHoldEntry_EntryKey]  DEFAULT ('') FOR [EntryKey]
GO
/****** Object:  Default [DF_TransactionEntryHold_StoreID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHoldEntry] ADD  CONSTRAINT [DF_TransactionEntryHold_StoreID]  DEFAULT (0) FOR [StoreID]
GO
/****** Object:  Default [DF_TransactionEntryOnHold_TransactionID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHoldEntry] ADD  CONSTRAINT [DF_TransactionEntryOnHold_TransactionID]  DEFAULT (0) FOR [TransactionHoldID]
GO
/****** Object:  Default [DF_TransactionEntryOnHold_RecallID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHoldEntry] ADD  CONSTRAINT [DF_TransactionEntryOnHold_RecallID]  DEFAULT (0) FOR [RecallID]
GO
/****** Object:  Default [DF_TransactionEntryOnHold_Description]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHoldEntry] ADD  CONSTRAINT [DF_TransactionEntryOnHold_Description]  DEFAULT ('') FOR [Description]
GO
/****** Object:  Default [DF_TransactionEntryOnHold_QuantityPurchased]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHoldEntry] ADD  CONSTRAINT [DF_TransactionEntryOnHold_QuantityPurchased]  DEFAULT (0) FOR [QuantityPurchased]
GO
/****** Object:  Default [DF_TransactionEntryOnHold_QuantityOnOrder]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHoldEntry] ADD  CONSTRAINT [DF_TransactionEntryOnHold_QuantityOnOrder]  DEFAULT (0) FOR [QuantityOnOrder]
GO
/****** Object:  Default [DF_TransactionEntryOnHold_QuantityRTD]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHoldEntry] ADD  CONSTRAINT [DF_TransactionEntryOnHold_QuantityRTD]  DEFAULT (0) FOR [QuantityRTD]
GO
/****** Object:  Default [DF_TransactionEntryOnHold_QuantityReserved]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHoldEntry] ADD  CONSTRAINT [DF_TransactionEntryOnHold_QuantityReserved]  DEFAULT (0) FOR [QuantityReserved]
GO
/****** Object:  Default [DF_TransactionEntryOnHold_Price]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHoldEntry] ADD  CONSTRAINT [DF_TransactionEntryOnHold_Price]  DEFAULT (0) FOR [Price]
GO
/****** Object:  Default [DF_TransactionEntryOnHold_FullPrice]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHoldEntry] ADD  CONSTRAINT [DF_TransactionEntryOnHold_FullPrice]  DEFAULT (0) FOR [FullPrice]
GO
/****** Object:  Default [DF_TransactionEntryOnHold_PriceSource]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHoldEntry] ADD  CONSTRAINT [DF_TransactionEntryOnHold_PriceSource]  DEFAULT (1) FOR [PriceSource]
GO
/****** Object:  Default [DF_TransactionEntryOnHold_Comment]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHoldEntry] ADD  CONSTRAINT [DF_TransactionEntryOnHold_Comment]  DEFAULT ('') FOR [Comment]
GO
/****** Object:  Default [DF_TransactionEntryOnHold_DetailID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHoldEntry] ADD  CONSTRAINT [DF_TransactionEntryOnHold_DetailID]  DEFAULT (0) FOR [DetailID]
GO
/****** Object:  Default [DF_TransactionEntryOnHold_Taxable]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHoldEntry] ADD  CONSTRAINT [DF_TransactionEntryOnHold_Taxable]  DEFAULT (1) FOR [Taxable]
GO
/****** Object:  Default [DF_TransactionEntryOnHold_ItemID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHoldEntry] ADD  CONSTRAINT [DF_TransactionEntryOnHold_ItemID]  DEFAULT (0) FOR [ItemID]
GO
/****** Object:  Default [DF_TransactionEntryOnHold_SalesRepID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHoldEntry] ADD  CONSTRAINT [DF_TransactionEntryOnHold_SalesRepID]  DEFAULT (0) FOR [SalesRepID]
GO
/****** Object:  Default [DF_TransactionEntryOnHold_SerialNumber1]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHoldEntry] ADD  CONSTRAINT [DF_TransactionEntryOnHold_SerialNumber1]  DEFAULT ('') FOR [SerialNumber1]
GO
/****** Object:  Default [DF_TransactionEntryOnHold_SerialNumber2]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHoldEntry] ADD  CONSTRAINT [DF_TransactionEntryOnHold_SerialNumber2]  DEFAULT ('') FOR [SerialNumber2]
GO
/****** Object:  Default [DF_TransactionEntryOnHold_SerialNumber3]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHoldEntry] ADD  CONSTRAINT [DF_TransactionEntryOnHold_SerialNumber3]  DEFAULT ('') FOR [SerialNumber3]
GO
/****** Object:  Default [DF_TransactionHoldEntry_VoucherNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHoldEntry] ADD  CONSTRAINT [DF_TransactionHoldEntry_VoucherNumber]  DEFAULT ('') FOR [VoucherNumber]
GO
/****** Object:  Default [DF_TransactionHoldEntry_DiscountReasonCodeID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHoldEntry] ADD  CONSTRAINT [DF_TransactionHoldEntry_DiscountReasonCodeID]  DEFAULT (0) FOR [DiscountReasonCodeID]
GO
/****** Object:  Default [DF_TransactionHoldEntry_ReturnReasonCodeID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHoldEntry] ADD  CONSTRAINT [DF_TransactionHoldEntry_ReturnReasonCodeID]  DEFAULT (0) FOR [ReturnReasonCodeID]
GO
/****** Object:  Default [DF_TransactionHoldEntry_TaxChangeReasonCodeID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHoldEntry] ADD  CONSTRAINT [DF_TransactionHoldEntry_TaxChangeReasonCodeID]  DEFAULT (0) FOR [TaxChangeReasonCodeID]
GO
/****** Object:  Default [Df_TransactionHoldEntry_ItemTaxID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHoldEntry] ADD  CONSTRAINT [Df_TransactionHoldEntry_ItemTaxID]  DEFAULT (0) FOR [ItemTaxID]
GO
/****** Object:  Default [DF_TransactionHoldEntry_ComponentQuantityReserved]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHoldEntry] ADD  CONSTRAINT [DF_TransactionHoldEntry_ComponentQuantityReserved]  DEFAULT (0) FOR [ComponentQuantityReserved]
GO
/****** Object:  Default [DF_TransactionHold_StoreID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHold] ADD  CONSTRAINT [DF_TransactionHold_StoreID]  DEFAULT (0) FOR [StoreID]
GO
/****** Object:  Default [DF_TransactionHold_Type]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHold] ADD  CONSTRAINT [DF_TransactionHold_Type]  DEFAULT (1) FOR [TransactionType]
GO
/****** Object:  Default [DF_TransactionHold_HoldComment]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHold] ADD  CONSTRAINT [DF_TransactionHold_HoldComment]  DEFAULT ('') FOR [HoldComment]
GO
/****** Object:  Default [DF_TransactionHold_RecallID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHold] ADD  CONSTRAINT [DF_TransactionHold_RecallID]  DEFAULT (0) FOR [RecallID]
GO
/****** Object:  Default [DF_TransactionHold_Comment]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHold] ADD  CONSTRAINT [DF_TransactionHold_Comment]  DEFAULT ('') FOR [Comment]
GO
/****** Object:  Default [DF_TransactionHold_PriceLevel]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHold] ADD  CONSTRAINT [DF_TransactionHold_PriceLevel]  DEFAULT (1) FOR [PriceLevel]
GO
/****** Object:  Default [DF_TransactionHold_DiscountMethod]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHold] ADD  CONSTRAINT [DF_TransactionHold_DiscountMethod]  DEFAULT (1) FOR [DiscountMethod]
GO
/****** Object:  Default [DF_TransactionHold_DiscountPercent]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHold] ADD  CONSTRAINT [DF_TransactionHold_DiscountPercent]  DEFAULT (0) FOR [DiscountPercent]
GO
/****** Object:  Default [DF_TransactionHold_Taxable]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHold] ADD  CONSTRAINT [DF_TransactionHold_Taxable]  DEFAULT (1) FOR [Taxable]
GO
/****** Object:  Default [DF_TransactionHold_CustomerID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHold] ADD  CONSTRAINT [DF_TransactionHold_CustomerID]  DEFAULT (0) FOR [CustomerID]
GO
/****** Object:  Default [DF_TransactionHold_Deposit]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHold] ADD  CONSTRAINT [DF_TransactionHold_Deposit]  DEFAULT (0) FOR [DeltaDeposit]
GO
/****** Object:  Default [DF_TransactionHold_DepositOverride]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHold] ADD  CONSTRAINT [DF_TransactionHold_DepositOverride]  DEFAULT (0) FOR [DepositOverride]
GO
/****** Object:  Default [DF_TransactionHold_DepositPrevious]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHold] ADD  CONSTRAINT [DF_TransactionHold_DepositPrevious]  DEFAULT (0) FOR [DepositPrevious]
GO
/****** Object:  Default [DF_TransactionHold_PaymentsPrevious]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHold] ADD  CONSTRAINT [DF_TransactionHold_PaymentsPrevious]  DEFAULT (0) FOR [PaymentsPrevious]
GO
/****** Object:  Default [DF_TransactionHold_TaxPrevioius]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHold] ADD  CONSTRAINT [DF_TransactionHold_TaxPrevioius]  DEFAULT (0) FOR [TaxPrevious]
GO
/****** Object:  Default [DF_TransactionHold_SalesRepID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHold] ADD  CONSTRAINT [DF_TransactionHold_SalesRepID]  DEFAULT (0) FOR [SalesRepID]
GO
/****** Object:  Default [DF_TransactionHold_ShipToID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHold] ADD  CONSTRAINT [DF_TransactionHold_ShipToID]  DEFAULT (0) FOR [ShipToID]
GO
/****** Object:  Default [DF_TransactionHold_TransactionTime]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHold] ADD  CONSTRAINT [DF_TransactionHold_TransactionTime]  DEFAULT (getdate()) FOR [TransactionTime]
GO
/****** Object:  Default [DF_TransactionHold_DueDate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHold] ADD  CONSTRAINT [DF_TransactionHold_DueDate]  DEFAULT (getdate()) FOR [ExpirationOrDueDate]
GO
/****** Object:  Default [DF_TransactionHold_ReturnMode]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHold] ADD  CONSTRAINT [DF_TransactionHold_ReturnMode]  DEFAULT (0) FOR [ReturnMode]
GO
/****** Object:  Default [DF_TransactionHold_PONumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHold] ADD  CONSTRAINT [DF_TransactionHold_PONumber]  DEFAULT ('') FOR [ReferenceNumber]
GO
/****** Object:  Default [DF_TransactionHold_ShippingCharge]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHold] ADD  CONSTRAINT [DF_TransactionHold_ShippingCharge]  DEFAULT (0) FOR [ShippingChargePurchased]
GO
/****** Object:  Default [DF_TransactionHold_ShippingChargeOverride]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHold] ADD  CONSTRAINT [DF_TransactionHold_ShippingChargeOverride]  DEFAULT (0) FOR [ShippingChargeOverride]
GO
/****** Object:  Default [DF_TransactionHold_ShippingServiceID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHold] ADD  CONSTRAINT [DF_TransactionHold_ShippingServiceID]  DEFAULT (0) FOR [ShippingServiceID]
GO
/****** Object:  Default [DF_TransactionHold_ShippingTrackingNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHold] ADD  CONSTRAINT [DF_TransactionHold_ShippingTrackingNumber]  DEFAULT ('') FOR [ShippingTrackingNumber]
GO
/****** Object:  Default [DF_TransactionHold_ShippingNotes]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHold] ADD  CONSTRAINT [DF_TransactionHold_ShippingNotes]  DEFAULT ('') FOR [ShippingNotes]
GO
/****** Object:  Default [DF_TransactionHold_ReasonCodeID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHold] ADD  CONSTRAINT [DF_TransactionHold_ReasonCodeID]  DEFAULT (0) FOR [ReasonCodeID]
GO
/****** Object:  Default [Df_TransactionHold_ExchangeID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHold] ADD  CONSTRAINT [Df_TransactionHold_ExchangeID]  DEFAULT (0) FOR [ExchangeID]
GO
/****** Object:  Default [Df_TransactionHold_ChannelType]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHold] ADD  CONSTRAINT [Df_TransactionHold_ChannelType]  DEFAULT (0) FOR [ChannelType]
GO
/****** Object:  Default [DF_TransactionHold_DefaultDiscountReasonCodeID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHold] ADD  CONSTRAINT [DF_TransactionHold_DefaultDiscountReasonCodeID]  DEFAULT (0) FOR [DefaultDiscountReasonCodeID]
GO
/****** Object:  Default [DF_TransactionHold_DefaultReturnReasonCodeID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHold] ADD  CONSTRAINT [DF_TransactionHold_DefaultReturnReasonCodeID]  DEFAULT (0) FOR [DefaultReturnReasonCodeID]
GO
/****** Object:  Default [DF_TransactionHold_DefaultTaxChangeReasonCodeID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHold] ADD  CONSTRAINT [DF_TransactionHold_DefaultTaxChangeReasonCodeID]  DEFAULT (0) FOR [DefaultTaxChangeReasonCodeID]
GO
/****** Object:  Default [Df_TransactionHold_BatchNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionHold] ADD  CONSTRAINT [Df_TransactionHold_BatchNumber]  DEFAULT (0) FOR [BatchNumber]
GO
/****** Object:  Default [DF__TimeStamp__Serve__0618D7E0]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TimeStampLog] ADD  DEFAULT (getdate()) FOR [ServerTime]
GO
/****** Object:  Default [DF__TimeStamp__Serve__070CFC19]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TimeStampLog] ADD  DEFAULT (@@dbts) FOR [ServerTimeStamp]
GO
/****** Object:  Default [DF_TimeStampLog_StoreID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TimeStampLog] ADD  CONSTRAINT [DF_TimeStampLog_StoreID]  DEFAULT (0) FOR [StoreID]
GO
/****** Object:  Default [DF_TimeClock_StoreID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TimeClock] ADD  CONSTRAINT [DF_TimeClock_StoreID]  DEFAULT (0) FOR [StoreID]
GO
/****** Object:  Default [DF_TimeClock_CashierID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TimeClock] ADD  CONSTRAINT [DF_TimeClock_CashierID]  DEFAULT (0) FOR [CashierID]
GO
/****** Object:  Default [DF_TimeClock_TimeIn]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TimeClock] ADD  CONSTRAINT [DF_TimeClock_TimeIn]  DEFAULT (getdate()) FOR [TimeIn]
GO
/****** Object:  Default [DF_TimeClock_BatchNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TimeClock] ADD  CONSTRAINT [DF_TimeClock_BatchNumber]  DEFAULT (0) FOR [BatchNumber]
GO
/****** Object:  Default [DF_PriceRounding_HQID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[PriceRounding] ADD  CONSTRAINT [DF_PriceRounding_HQID]  DEFAULT (0) FOR [HQID]
GO
/****** Object:  Default [DF_PriceRounding_PriceFrom]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[PriceRounding] ADD  CONSTRAINT [DF_PriceRounding_PriceFrom]  DEFAULT (0) FOR [PriceFrom]
GO
/****** Object:  Default [DF_PriceRounding_PriceTo]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[PriceRounding] ADD  CONSTRAINT [DF_PriceRounding_PriceTo]  DEFAULT (0) FOR [PriceTo]
GO
/****** Object:  Default [DF_PriceRounding_UseMultipleOfRule]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[PriceRounding] ADD  CONSTRAINT [DF_PriceRounding_UseMultipleOfRule]  DEFAULT (0) FOR [UseMultipleOfRule]
GO
/****** Object:  Default [DF_PriceRounding_MultipleOf]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[PriceRounding] ADD  CONSTRAINT [DF_PriceRounding_MultipleOf]  DEFAULT (0) FOR [MultipleOf]
GO
/****** Object:  Default [DF_PriceRounding_UseEndsInRule]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[PriceRounding] ADD  CONSTRAINT [DF_PriceRounding_UseEndsInRule]  DEFAULT (0) FOR [UseEndsInRule]
GO
/****** Object:  Default [DF_PriceRounding_EndsIn]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[PriceRounding] ADD  CONSTRAINT [DF_PriceRounding_EndsIn]  DEFAULT (0) FOR [EndsIn]
GO
/****** Object:  Default [DF_PoleDisplayMessage_Description]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[PoleDisplayMessage] ADD  CONSTRAINT [DF_PoleDisplayMessage_Description]  DEFAULT ('') FOR [Description]
GO
/****** Object:  Default [DF_PoleDisplayMessage_MessageLine1]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[PoleDisplayMessage] ADD  CONSTRAINT [DF_PoleDisplayMessage_MessageLine1]  DEFAULT ('') FOR [MessageLine1]
GO
/****** Object:  Default [DF_PoleDisplayMessage_EffectLine1]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[PoleDisplayMessage] ADD  CONSTRAINT [DF_PoleDisplayMessage_EffectLine1]  DEFAULT (0) FOR [EffectLine1]
GO
/****** Object:  Default [DF_PoleDisplayMessage_UpdateRateLine1]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[PoleDisplayMessage] ADD  CONSTRAINT [DF_PoleDisplayMessage_UpdateRateLine1]  DEFAULT (0) FOR [UpdateRateLine1]
GO
/****** Object:  Default [DF_PoleDisplayMessage_DateAndTimeLine1]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[PoleDisplayMessage] ADD  CONSTRAINT [DF_PoleDisplayMessage_DateAndTimeLine1]  DEFAULT (0) FOR [DateAndTimeLine1]
GO
/****** Object:  Default [DF_PoleDisplayMessage_ScrollChangeSizeLine1]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[PoleDisplayMessage] ADD  CONSTRAINT [DF_PoleDisplayMessage_ScrollChangeSizeLine1]  DEFAULT (0) FOR [ScrollChangeSizeLine1]
GO
/****** Object:  Default [DF_PoleDisplayMessage_MessageLine2]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[PoleDisplayMessage] ADD  CONSTRAINT [DF_PoleDisplayMessage_MessageLine2]  DEFAULT ('') FOR [MessageLine2]
GO
/****** Object:  Default [DF_PoleDisplayMessage_EffectLine2]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[PoleDisplayMessage] ADD  CONSTRAINT [DF_PoleDisplayMessage_EffectLine2]  DEFAULT (0) FOR [EffectLine2]
GO
/****** Object:  Default [DF_PoleDisplayMessage_UpdateRateLine2]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[PoleDisplayMessage] ADD  CONSTRAINT [DF_PoleDisplayMessage_UpdateRateLine2]  DEFAULT (0) FOR [UpdateRateLine2]
GO
/****** Object:  Default [DF_PoleDisplayMessage_DateAndTimeLine2]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[PoleDisplayMessage] ADD  CONSTRAINT [DF_PoleDisplayMessage_DateAndTimeLine2]  DEFAULT (0) FOR [DateAndTimeLine2]
GO
/****** Object:  Default [DF_PoleDisplayMessage_ScrollChangeSizeLine2]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[PoleDisplayMessage] ADD  CONSTRAINT [DF_PoleDisplayMessage_ScrollChangeSizeLine2]  DEFAULT (0) FOR [ScrollChangeSizeLine2]
GO
/****** Object:  Default [DF__PoleDispl__Store__78BEDCC2]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[PoleDisplayMessage] ADD  DEFAULT (0) FOR [StoreID]
GO
/****** Object:  Default [DF_TransactionEntry_Commission]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionEntry] ADD  CONSTRAINT [DF_TransactionEntry_Commission]  DEFAULT (0) FOR [Commission]
GO
/****** Object:  Default [DF_TransactionEntry_Cost]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionEntry] ADD  CONSTRAINT [DF_TransactionEntry_Cost]  DEFAULT (0) FOR [Cost]
GO
/****** Object:  Default [DF_TransactionEntry_FullPrice]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionEntry] ADD  CONSTRAINT [DF_TransactionEntry_FullPrice]  DEFAULT (0) FOR [FullPrice]
GO
/****** Object:  Default [DF_TransactionEntry_StoreID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionEntry] ADD  CONSTRAINT [DF_TransactionEntry_StoreID]  DEFAULT (0) FOR [StoreID]
GO
/****** Object:  Default [DF_TransactionEntry_TransactionNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionEntry] ADD  CONSTRAINT [DF_TransactionEntry_TransactionNumber]  DEFAULT (0) FOR [TransactionNumber]
GO
/****** Object:  Default [DF_TransactionEntry_ItemID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionEntry] ADD  CONSTRAINT [DF_TransactionEntry_ItemID]  DEFAULT (0) FOR [ItemID]
GO
/****** Object:  Default [DF_TransactionEntry_Price]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionEntry] ADD  CONSTRAINT [DF_TransactionEntry_Price]  DEFAULT (0) FOR [Price]
GO
/****** Object:  Default [DF_TransactionEntry_PriceSource]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionEntry] ADD  CONSTRAINT [DF_TransactionEntry_PriceSource]  DEFAULT (0) FOR [PriceSource]
GO
/****** Object:  Default [DF_TransactionEntry_Quantity]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionEntry] ADD  CONSTRAINT [DF_TransactionEntry_Quantity]  DEFAULT (0) FOR [Quantity]
GO
/****** Object:  Default [DF_TransactionEntry_SalesRepID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionEntry] ADD  CONSTRAINT [DF_TransactionEntry_SalesRepID]  DEFAULT (0) FOR [SalesRepID]
GO
/****** Object:  Default [DF_TransactionEntry_Taxable]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionEntry] ADD  CONSTRAINT [DF_TransactionEntry_Taxable]  DEFAULT (0) FOR [Taxable]
GO
/****** Object:  Default [DF_TransactionEntry_DetailID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionEntry] ADD  CONSTRAINT [DF_TransactionEntry_DetailID]  DEFAULT (0) FOR [DetailID]
GO
/****** Object:  Default [DF_TransactionEntry_Comment]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionEntry] ADD  CONSTRAINT [DF_TransactionEntry_Comment]  DEFAULT ('') FOR [Comment]
GO
/****** Object:  Default [DF_TransactionEntry_DiscountReasonCodeID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionEntry] ADD  CONSTRAINT [DF_TransactionEntry_DiscountReasonCodeID]  DEFAULT (0) FOR [DiscountReasonCodeID]
GO
/****** Object:  Default [DF_TransactionEntry_ReturnReasonCodeID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionEntry] ADD  CONSTRAINT [DF_TransactionEntry_ReturnReasonCodeID]  DEFAULT (0) FOR [ReturnReasonCodeID]
GO
/****** Object:  Default [DF_TransactionEntry_TaxChangeReasonCodeID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionEntry] ADD  CONSTRAINT [DF_TransactionEntry_TaxChangeReasonCodeID]  DEFAULT (0) FOR [TaxChangeReasonCodeID]
GO
/****** Object:  Default [Df_TransactionEntry_SalesTax]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionEntry] ADD  CONSTRAINT [Df_TransactionEntry_SalesTax]  DEFAULT (0) FOR [SalesTax]
GO
/****** Object:  Default [DF_TransactionEntry_QuantityDiscountID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionEntry] ADD  CONSTRAINT [DF_TransactionEntry_QuantityDiscountID]  DEFAULT (0) FOR [QuantityDiscountID]
GO
/****** Object:  Default [DF_transactionentry_NUSSkipUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionEntry] ADD  CONSTRAINT [DF_transactionentry_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
/****** Object:  Default [DF_TransactionEntry_NUSSkipPOUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TransactionEntry] ADD  CONSTRAINT [DF_TransactionEntry_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
/****** Object:  Default [DF_Transaction_ShipToID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Transaction] ADD  CONSTRAINT [DF_Transaction_ShipToID]  DEFAULT (0) FOR [ShipToID]
GO
/****** Object:  Default [DF_Transaction_StoreID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Transaction] ADD  CONSTRAINT [DF_Transaction_StoreID]  DEFAULT (0) FOR [StoreID]
GO
/****** Object:  Default [DF_Transaction_BatchNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Transaction] ADD  CONSTRAINT [DF_Transaction_BatchNumber]  DEFAULT (0) FOR [BatchNumber]
GO
/****** Object:  Default [DF_Transaction_Time]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Transaction] ADD  CONSTRAINT [DF_Transaction_Time]  DEFAULT (getdate()) FOR [Time]
GO
/****** Object:  Default [DF_Transaction_CustomerID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Transaction] ADD  CONSTRAINT [DF_Transaction_CustomerID]  DEFAULT (0) FOR [CustomerID]
GO
/****** Object:  Default [DF_Transaction_CashierID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Transaction] ADD  CONSTRAINT [DF_Transaction_CashierID]  DEFAULT (0) FOR [CashierID]
GO
/****** Object:  Default [DF_Transaction_SubTotal]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Transaction] ADD  CONSTRAINT [DF_Transaction_SubTotal]  DEFAULT (0) FOR [Total]
GO
/****** Object:  Default [DF_Transaction_SalesTax]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Transaction] ADD  CONSTRAINT [DF_Transaction_SalesTax]  DEFAULT (0) FOR [SalesTax]
GO
/****** Object:  Default [DF_Transaction_Comment]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Transaction] ADD  CONSTRAINT [DF_Transaction_Comment]  DEFAULT ('') FOR [Comment]
GO
/****** Object:  Default [DF_Transaction_ReferenceNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Transaction] ADD  CONSTRAINT [DF_Transaction_ReferenceNumber]  DEFAULT ('') FOR [ReferenceNumber]
GO
/****** Object:  Default [DF__Transacti__Statu__711DBAFA]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Transaction] ADD  DEFAULT (0) FOR [Status]
GO
/****** Object:  Default [Df_Transaction_ExchangeID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Transaction] ADD  CONSTRAINT [Df_Transaction_ExchangeID]  DEFAULT (0) FOR [ExchangeID]
GO
/****** Object:  Default [Df_Transaction_ChannelType]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Transaction] ADD  CONSTRAINT [Df_Transaction_ChannelType]  DEFAULT (0) FOR [ChannelType]
GO
/****** Object:  Default [DF_Transaction_RecallID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Transaction] ADD  CONSTRAINT [DF_Transaction_RecallID]  DEFAULT (0) FOR [RecallID]
GO
/****** Object:  Default [DF_Transaction_RecallType]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Transaction] ADD  CONSTRAINT [DF_Transaction_RecallType]  DEFAULT (0) FOR [RecallType]
GO
/****** Object:  Default [DF_transaction_NUSSkipUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Transaction] ADD  CONSTRAINT [DF_transaction_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
/****** Object:  Default [DF_Transaction_NUSSkipPOUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Transaction] ADD  CONSTRAINT [DF_Transaction_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
/****** Object:  Default [Df_TouchscreenKeyboardEntry_Style]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TouchScreenKeyboardEntry] ADD  CONSTRAINT [Df_TouchscreenKeyboardEntry_Style]  DEFAULT (0) FOR [Style]
GO
/****** Object:  Default [DF_TenderTotals_StoreID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TenderTotals] ADD  CONSTRAINT [DF_TenderTotals_StoreID]  DEFAULT (0) FOR [StoreID]
GO
/****** Object:  Default [DF_TenderTotals_BatchNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TenderTotals] ADD  CONSTRAINT [DF_TenderTotals_BatchNumber]  DEFAULT (0) FOR [BatchNumber]
GO
/****** Object:  Default [DF_TenderTotals_TenderID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TenderTotals] ADD  CONSTRAINT [DF_TenderTotals_TenderID]  DEFAULT (0) FOR [TenderID]
GO
/****** Object:  Default [DF_TenderTotals_Open]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TenderTotals] ADD  CONSTRAINT [DF_TenderTotals_Open]  DEFAULT (0) FOR [Open]
GO
/****** Object:  Default [DF_TenderTotals_Shift]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TenderTotals] ADD  CONSTRAINT [DF_TenderTotals_Shift]  DEFAULT (0) FOR [Shift]
GO
/****** Object:  Default [DF_TenderTotals_Close]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TenderTotals] ADD  CONSTRAINT [DF_TenderTotals_Close]  DEFAULT (0) FOR [Close]
GO
/****** Object:  Default [DF_TenderTotals_Count]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TenderTotals] ADD  CONSTRAINT [DF_TenderTotals_Count]  DEFAULT (0) FOR [Count]
GO
/****** Object:  Default [DF_TenderTotals_OpenForeign]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TenderTotals] ADD  CONSTRAINT [DF_TenderTotals_OpenForeign]  DEFAULT (0) FOR [OpenForeign]
GO
/****** Object:  Default [DF_TenderTotals_CloseForeign]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TenderTotals] ADD  CONSTRAINT [DF_TenderTotals_CloseForeign]  DEFAULT (0) FOR [CloseForeign]
GO
/****** Object:  Default [DF_TenderTotals_ShiftForeign]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TenderTotals] ADD  CONSTRAINT [DF_TenderTotals_ShiftForeign]  DEFAULT (0) FOR [ShiftForeign]
GO
/****** Object:  Default [DF_TenderTotals_ShiftRoundingError]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TenderTotals] ADD  CONSTRAINT [DF_TenderTotals_ShiftRoundingError]  DEFAULT (0) FOR [ShiftRoundingError]
GO
/****** Object:  Default [DF_tendertotals_NUSSkipUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TenderTotals] ADD  CONSTRAINT [DF_tendertotals_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
/****** Object:  Default [DF_TenderTotals_NUSSkipPOUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TenderTotals] ADD  CONSTRAINT [DF_TenderTotals_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
/****** Object:  Default [DF_TenderEntry_BatchNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TenderEntry] ADD  CONSTRAINT [DF_TenderEntry_BatchNumber]  DEFAULT (0) FOR [BatchNumber]
GO
/****** Object:  Default [DF_TenderEntry_CreditCardExpiration]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TenderEntry] ADD  CONSTRAINT [DF_TenderEntry_CreditCardExpiration]  DEFAULT ('') FOR [CreditCardExpiration]
GO
/****** Object:  Default [DF_TenderEntry_LayawayID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TenderEntry] ADD  CONSTRAINT [DF_TenderEntry_LayawayID]  DEFAULT (0) FOR [OrderHistoryID]
GO
/****** Object:  Default [DF_TenderEntry_DropPayoutID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TenderEntry] ADD  CONSTRAINT [DF_TenderEntry_DropPayoutID]  DEFAULT (0) FOR [DropPayoutID]
GO
/****** Object:  Default [DF_TenderEntry_StoreID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TenderEntry] ADD  CONSTRAINT [DF_TenderEntry_StoreID]  DEFAULT (0) FOR [StoreID]
GO
/****** Object:  Default [DF_TenderEntry_TransactionID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TenderEntry] ADD  CONSTRAINT [DF_TenderEntry_TransactionID]  DEFAULT (0) FOR [TransactionNumber]
GO
/****** Object:  Default [DF_TenderEntry_TenderID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TenderEntry] ADD  CONSTRAINT [DF_TenderEntry_TenderID]  DEFAULT (0) FOR [TenderID]
GO
/****** Object:  Default [DF_TenderEntry_ExchangeID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TenderEntry] ADD  CONSTRAINT [DF_TenderEntry_ExchangeID]  DEFAULT (0) FOR [PaymentID]
GO
/****** Object:  Default [DF_TenderEntry_Description]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TenderEntry] ADD  CONSTRAINT [DF_TenderEntry_Description]  DEFAULT ('') FOR [Description]
GO
/****** Object:  Default [DF_TenderEntry_CreditCardNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TenderEntry] ADD  CONSTRAINT [DF_TenderEntry_CreditCardNumber]  DEFAULT ('') FOR [CreditCardNumber]
GO
/****** Object:  Default [DF_TenderEntry_CreditCardApprovalCode]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TenderEntry] ADD  CONSTRAINT [DF_TenderEntry_CreditCardApprovalCode]  DEFAULT ('') FOR [CreditCardApprovalCode]
GO
/****** Object:  Default [DF_TenderEntry_Amount]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TenderEntry] ADD  CONSTRAINT [DF_TenderEntry_Amount]  DEFAULT (0) FOR [Amount]
GO
/****** Object:  Default [DF_TenderEntry_AccountHolder]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TenderEntry] ADD  CONSTRAINT [DF_TenderEntry_AccountHolder]  DEFAULT ('') FOR [AccountHolder]
GO
/****** Object:  Default [DF_TenderEntry_RoundingError]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TenderEntry] ADD  CONSTRAINT [DF_TenderEntry_RoundingError]  DEFAULT (0) FOR [RoundingError]
GO
/****** Object:  Default [DF_TenderEntry_AmountForeign]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TenderEntry] ADD  CONSTRAINT [DF_TenderEntry_AmountForeign]  DEFAULT (0) FOR [AmountForeign]
GO
/****** Object:  Default [Df_TenderEntry_BankNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TenderEntry] ADD  CONSTRAINT [Df_TenderEntry_BankNumber]  DEFAULT ('') FOR [BankNumber]
GO
/****** Object:  Default [Df_TenderEntry_SerialNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TenderEntry] ADD  CONSTRAINT [Df_TenderEntry_SerialNumber]  DEFAULT ('') FOR [SerialNumber]
GO
/****** Object:  Default [Df_TenderEntry_State]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TenderEntry] ADD  CONSTRAINT [Df_TenderEntry_State]  DEFAULT ('') FOR [State]
GO
/****** Object:  Default [Df_TenderEntry_License]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TenderEntry] ADD  CONSTRAINT [Df_TenderEntry_License]  DEFAULT ('') FOR [License]
GO
/****** Object:  Default [Df_TenderEntry_TransitNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TenderEntry] ADD  CONSTRAINT [Df_TenderEntry_TransitNumber]  DEFAULT ('') FOR [TransitNumber]
GO
/****** Object:  Default [Df_TenderEntry_VisaNetAuthorizationID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TenderEntry] ADD  CONSTRAINT [Df_TenderEntry_VisaNetAuthorizationID]  DEFAULT (0) FOR [VisaNetAuthorizationID]
GO
/****** Object:  Default [DF_TenderEntry_DebitSurcharge]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TenderEntry] ADD  CONSTRAINT [DF_TenderEntry_DebitSurcharge]  DEFAULT (0) FOR [DebitSurcharge]
GO
/****** Object:  Default [DF_TenderEntry_CashBackSurcharge]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TenderEntry] ADD  CONSTRAINT [DF_TenderEntry_CashBackSurcharge]  DEFAULT (0) FOR [CashBackSurcharge]
GO
/****** Object:  Default [DF_tenderentry_NUSSkipUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TenderEntry] ADD  CONSTRAINT [DF_tenderentry_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
/****** Object:  Default [DF_TenderEntry_NUSSkipPOUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TenderEntry] ADD  CONSTRAINT [DF_TenderEntry_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
/****** Object:  Default [DF_TenderDenominations_TenderID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TenderDenominations] ADD  CONSTRAINT [DF_TenderDenominations_TenderID]  DEFAULT (0) FOR [TenderID]
GO
/****** Object:  Default [DF_TenderDenominations_Description]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TenderDenominations] ADD  CONSTRAINT [DF_TenderDenominations_Description]  DEFAULT ('') FOR [Description]
GO
/****** Object:  Default [DF_TenderDenominations_Value]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[TenderDenominations] ADD  CONSTRAINT [DF_TenderDenominations_Value]  DEFAULT (0) FOR [Value]
GO
/****** Object:  Default [DF_Tender_HQID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tender] ADD  CONSTRAINT [DF_Tender_HQID]  DEFAULT (0) FOR [HQID]
GO
/****** Object:  Default [DF_Tender_PreventOverTendering]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tender] ADD  CONSTRAINT [DF_Tender_PreventOverTendering]  DEFAULT (0) FOR [PreventOverTendering]
GO
/****** Object:  Default [DF_Tender_VerificationType]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tender] ADD  CONSTRAINT [DF_Tender_VerificationType]  DEFAULT (0) FOR [VerificationType]
GO
/****** Object:  Default [DF_Tender_VerifyViaEDC]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tender] ADD  CONSTRAINT [DF_Tender_VerifyViaEDC]  DEFAULT (0) FOR [VerifyViaEDC]
GO
/****** Object:  Default [DF_Tender_Description]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tender] ADD  CONSTRAINT [DF_Tender_Description]  DEFAULT ('') FOR [Description]
GO
/****** Object:  Default [DF_Tender_AdditionalDetailType]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tender] ADD  CONSTRAINT [DF_Tender_AdditionalDetailType]  DEFAULT (1) FOR [AdditionalDetailType]
GO
/****** Object:  Default [DF_Tender_PrinterValidation]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tender] ADD  CONSTRAINT [DF_Tender_PrinterValidation]  DEFAULT (0) FOR [PrinterValidation]
GO
/****** Object:  Default [DF_Tender_ValidationLine1]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tender] ADD  CONSTRAINT [DF_Tender_ValidationLine1]  DEFAULT ('') FOR [ValidationLine1]
GO
/****** Object:  Default [DF_Tender_ValidationLine2]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tender] ADD  CONSTRAINT [DF_Tender_ValidationLine2]  DEFAULT ('') FOR [ValidationLine2]
GO
/****** Object:  Default [DF_Tender_ValidationLine3]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tender] ADD  CONSTRAINT [DF_Tender_ValidationLine3]  DEFAULT ('') FOR [ValidationLine3]
GO
/****** Object:  Default [DF_Tender_GLAccount]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tender] ADD  CONSTRAINT [DF_Tender_GLAccount]  DEFAULT ('') FOR [GLAccount]
GO
/****** Object:  Default [DF_Tender_ScanCode]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tender] ADD  CONSTRAINT [DF_Tender_ScanCode]  DEFAULT (0) FOR [ScanCode]
GO
/****** Object:  Default [DF_Tender_RoundToValue]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tender] ADD  CONSTRAINT [DF_Tender_RoundToValue]  DEFAULT (0) FOR [RoundToValue]
GO
/****** Object:  Default [DF_Tender_Code]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tender] ADD  CONSTRAINT [DF_Tender_Code]  DEFAULT ('') FOR [Code]
GO
/****** Object:  Default [DF_Tender_MaximumAmount]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tender] ADD  CONSTRAINT [DF_Tender_MaximumAmount]  DEFAULT (0) FOR [MaximumAmount]
GO
/****** Object:  Default [DF_Tender_DoNotPopCashDrawer]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tender] ADD  CONSTRAINT [DF_Tender_DoNotPopCashDrawer]  DEFAULT (0) FOR [DoNotPopCashDrawer]
GO
/****** Object:  Default [DF_Tender_CurrencyID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tender] ADD  CONSTRAINT [DF_Tender_CurrencyID]  DEFAULT (0) FOR [CurrencyID]
GO
/****** Object:  Default [DF_Tender_DisplayOrder]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tender] ADD  CONSTRAINT [DF_Tender_DisplayOrder]  DEFAULT (0) FOR [DisplayOrder]
GO
/****** Object:  Default [DF_Tender_ValidationMask]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tender] ADD  CONSTRAINT [DF_Tender_ValidationMask]  DEFAULT ('') FOR [ValidationMask]
GO
/****** Object:  Default [Df_Tender_SignatureRequired]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tender] ADD  CONSTRAINT [Df_Tender_SignatureRequired]  DEFAULT (0) FOR [SignatureRequired]
GO
/****** Object:  Default [Df_Tender_AllowMultipleEntries]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tender] ADD  CONSTRAINT [Df_Tender_AllowMultipleEntries]  DEFAULT (0) FOR [AllowMultipleEntries]
GO
/****** Object:  Default [DF_Tender_DebitSurcharge]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tender] ADD  CONSTRAINT [DF_Tender_DebitSurcharge]  DEFAULT (0) FOR [DebitSurcharge]
GO
/****** Object:  Default [DF_Tender_SupportCashBack]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tender] ADD  CONSTRAINT [DF_Tender_SupportCashBack]  DEFAULT (0) FOR [SupportCashBack]
GO
/****** Object:  Default [DF_Tender_CashBackLimit]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tender] ADD  CONSTRAINT [DF_Tender_CashBackLimit]  DEFAULT (0) FOR [CashBackLimit]
GO
/****** Object:  Default [DF_Tender_CashBackFee]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tender] ADD  CONSTRAINT [DF_Tender_CashBackFee]  DEFAULT (0) FOR [CashBackFee]
GO
/****** Object:  Default [DF_tender_NUSSkipUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tender] ADD  CONSTRAINT [DF_tender_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
/****** Object:  Default [DF_Tender_NUSSkipPOUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tender] ADD  CONSTRAINT [DF_Tender_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
/****** Object:  Default [DF_ShipTo_Address]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShipTo] ADD  CONSTRAINT [DF_ShipTo_Address]  DEFAULT ('') FOR [Address]
GO
/****** Object:  Default [DF_ShipTo_Address2]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShipTo] ADD  CONSTRAINT [DF_ShipTo_Address2]  DEFAULT ('') FOR [Address2]
GO
/****** Object:  Default [DF_ShipTo_City]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShipTo] ADD  CONSTRAINT [DF_ShipTo_City]  DEFAULT ('') FOR [City]
GO
/****** Object:  Default [DF_ShipTo_Company]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShipTo] ADD  CONSTRAINT [DF_ShipTo_Company]  DEFAULT ('') FOR [Company]
GO
/****** Object:  Default [DF_ShipTo_Country]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShipTo] ADD  CONSTRAINT [DF_ShipTo_Country]  DEFAULT ('') FOR [Country]
GO
/****** Object:  Default [DF_ShipTo_CustomerID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShipTo] ADD  CONSTRAINT [DF_ShipTo_CustomerID]  DEFAULT (0) FOR [CustomerID]
GO
/****** Object:  Default [DF_ShipTo_HQID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShipTo] ADD  CONSTRAINT [DF_ShipTo_HQID]  DEFAULT (0) FOR [HQID]
GO
/****** Object:  Default [DF_ShipTo_LastUpdated]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShipTo] ADD  CONSTRAINT [DF_ShipTo_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
/****** Object:  Default [DF_ShipTo_Name]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShipTo] ADD  CONSTRAINT [DF_ShipTo_Name]  DEFAULT ('') FOR [Name]
GO
/****** Object:  Default [DF_ShipTo_State]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShipTo] ADD  CONSTRAINT [DF_ShipTo_State]  DEFAULT ('') FOR [State]
GO
/****** Object:  Default [DF_ShipTo_StoreID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShipTo] ADD  CONSTRAINT [DF_ShipTo_StoreID]  DEFAULT (0) FOR [StoreID]
GO
/****** Object:  Default [DF_ShipTo_Zip]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShipTo] ADD  CONSTRAINT [DF_ShipTo_Zip]  DEFAULT ('') FOR [Zip]
GO
/****** Object:  Default [DF_ShipTo_EmailAddress]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShipTo] ADD  CONSTRAINT [DF_ShipTo_EmailAddress]  DEFAULT ('') FOR [EmailAddress]
GO
/****** Object:  Default [Df_ShipTo_PhoneNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShipTo] ADD  CONSTRAINT [Df_ShipTo_PhoneNumber]  DEFAULT ('') FOR [PhoneNumber]
GO
/****** Object:  Default [Df_ShipTo_FaxNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShipTo] ADD  CONSTRAINT [Df_ShipTo_FaxNumber]  DEFAULT ('') FOR [FaxNumber]
GO
/****** Object:  Default [DF_shipto_NUSSkipUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShipTo] ADD  CONSTRAINT [DF_shipto_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
/****** Object:  Default [DF_ShipTo_NUSSkipPOUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShipTo] ADD  CONSTRAINT [DF_ShipTo_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
/****** Object:  Default [DF_CarrierWebPairs_CarrierID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShippingWebPair] ADD  CONSTRAINT [DF_CarrierWebPairs_CarrierID]  DEFAULT (0) FOR [CarrierID]
GO
/****** Object:  Default [DF_CarrierWebPairs_Variable]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShippingWebPair] ADD  CONSTRAINT [DF_CarrierWebPairs_Variable]  DEFAULT ('') FOR [Variable]
GO
/****** Object:  Default [DF_CarrierWebPairs_Value]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShippingWebPair] ADD  CONSTRAINT [DF_CarrierWebPairs_Value]  DEFAULT ('') FOR [Value]
GO
/****** Object:  Default [DF_ShippingWebPair_LastUpdated]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShippingWebPair] ADD  CONSTRAINT [DF_ShippingWebPair_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
/****** Object:  Default [Df_ShippingWebPair_URL]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShippingWebPair] ADD  CONSTRAINT [Df_ShippingWebPair_URL]  DEFAULT ('') FOR [URL]
GO
/****** Object:  Default [Df_ShippingWebPair_Direction]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShippingWebPair] ADD  CONSTRAINT [Df_ShippingWebPair_Direction]  DEFAULT (0) FOR [Direction]
GO
/****** Object:  Default [DF_Service_CarrierID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_CarrierID]  DEFAULT (0) FOR [CarrierID]
GO
/****** Object:  Default [DF_Service_Name]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Name]  DEFAULT ('') FOR [Name]
GO
/****** Object:  Default [DF_Service_ChargeByWeight]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_ChargeByWeight]  DEFAULT (0) FOR [ChargeByWeight]
GO
/****** Object:  Default [DF_Service_Interpolate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Interpolate]  DEFAULT (0) FOR [Interpolate]
GO
/****** Object:  Default [DF_Service_Value1]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Value1]  DEFAULT (0) FOR [Value1]
GO
/****** Object:  Default [DF_Service_Charge1]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Charge1]  DEFAULT (0) FOR [Charge1]
GO
/****** Object:  Default [DF_Service_Value2]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Value2]  DEFAULT (0) FOR [Value2]
GO
/****** Object:  Default [DF_Service_Charge2]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Charge2]  DEFAULT (0) FOR [Charge2]
GO
/****** Object:  Default [DF_Service_Value3]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Value3]  DEFAULT (0) FOR [Value3]
GO
/****** Object:  Default [DF_Service_Charge3]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Charge3]  DEFAULT (0) FOR [Charge3]
GO
/****** Object:  Default [DF_Service_Value4]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Value4]  DEFAULT (0) FOR [Value4]
GO
/****** Object:  Default [DF_Service_Charge4]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Charge4]  DEFAULT (0) FOR [Charge4]
GO
/****** Object:  Default [DF_Service_Value5]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Value5]  DEFAULT (0) FOR [Value5]
GO
/****** Object:  Default [DF_Service_Charge5]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Charge5]  DEFAULT (0) FOR [Charge5]
GO
/****** Object:  Default [DF_Service_Value6]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Value6]  DEFAULT (0) FOR [Value6]
GO
/****** Object:  Default [DF_Service_Charge6]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Charge6]  DEFAULT (0) FOR [Charge6]
GO
/****** Object:  Default [DF_Service_Value7]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Value7]  DEFAULT (0) FOR [Value7]
GO
/****** Object:  Default [DF_Service_Charge7]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Charge7]  DEFAULT (0) FOR [Charge7]
GO
/****** Object:  Default [DF_Service_Value8]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Value8]  DEFAULT (0) FOR [Value8]
GO
/****** Object:  Default [DF_Service_Charge8]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Charge8]  DEFAULT (0) FOR [Charge8]
GO
/****** Object:  Default [DF_Service_Value9]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Value9]  DEFAULT (0) FOR [Value9]
GO
/****** Object:  Default [DF_Service_Charge9]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Charge9]  DEFAULT (0) FOR [Charge9]
GO
/****** Object:  Default [DF_Service_Value10]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Value10]  DEFAULT (0) FOR [Value10]
GO
/****** Object:  Default [DF_Service_Charge10]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Charge10]  DEFAULT (0) FOR [Charge10]
GO
/****** Object:  Default [DF_Service_Value11]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Value11]  DEFAULT (0) FOR [Value11]
GO
/****** Object:  Default [DF_Service_Charge11]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Charge11]  DEFAULT (0) FOR [Charge11]
GO
/****** Object:  Default [DF_Service_Value12]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Value12]  DEFAULT (0) FOR [Value12]
GO
/****** Object:  Default [DF_Service_Charge12]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Charge12]  DEFAULT (0) FOR [Charge12]
GO
/****** Object:  Default [DF_Service_Value13]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Value13]  DEFAULT (0) FOR [Value13]
GO
/****** Object:  Default [DF_Service_Charge13]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Charge13]  DEFAULT (0) FOR [Charge13]
GO
/****** Object:  Default [DF_Service_Value14]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Value14]  DEFAULT (0) FOR [Value14]
GO
/****** Object:  Default [DF_Service_Charge14]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Charge14]  DEFAULT (0) FOR [Charge14]
GO
/****** Object:  Default [DF_Service_Value15]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Value15]  DEFAULT (0) FOR [Value15]
GO
/****** Object:  Default [DF_Service_Charge15]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_Service_Charge15]  DEFAULT (0) FOR [Charge15]
GO
/****** Object:  Default [DF_ShippingService_LastUpdated]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShippingService] ADD  CONSTRAINT [DF_ShippingService_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
/****** Object:  Default [DF__ShippingSe__HQID__005FFE8A]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShippingService] ADD  DEFAULT (0) FOR [HQID]
GO
/****** Object:  Default [DF__ShippingSe__Code__015422C3]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShippingService] ADD  DEFAULT ('') FOR [Code]
GO
/****** Object:  Default [DF_Carrier_Name]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShippingCarrier] ADD  CONSTRAINT [DF_Carrier_Name]  DEFAULT ('') FOR [Name]
GO
/****** Object:  Default [DF_Carrier_URL]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShippingCarrier] ADD  CONSTRAINT [DF_Carrier_URL]  DEFAULT ('') FOR [URL]
GO
/****** Object:  Default [DF_Carrier_TrackingURL]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShippingCarrier] ADD  CONSTRAINT [DF_Carrier_TrackingURL]  DEFAULT ('') FOR [TrackingURL]
GO
/****** Object:  Default [DF_Carrier_ShippingURL]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShippingCarrier] ADD  CONSTRAINT [DF_Carrier_ShippingURL]  DEFAULT ('') FOR [ShippingURL]
GO
/****** Object:  Default [DF_ShippingCarrier_LastUpdated]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShippingCarrier] ADD  CONSTRAINT [DF_ShippingCarrier_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
/****** Object:  Default [DF__ShippingCa__HQID__7E77B618]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShippingCarrier] ADD  DEFAULT (0) FOR [HQID]
GO
/****** Object:  Default [DF__ShippingCa__Code__7F6BDA51]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ShippingCarrier] ADD  DEFAULT ('') FOR [Code]
GO
/****** Object:  Default [DF_Shipping_StoreID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Shipping] ADD  CONSTRAINT [DF_Shipping_StoreID]  DEFAULT (0) FOR [StoreID]
GO
/****** Object:  Default [DF_Shipping_ServiceID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Shipping] ADD  CONSTRAINT [DF_Shipping_ServiceID]  DEFAULT (0) FOR [ServiceID]
GO
/****** Object:  Default [DF_Shipping_TransactionNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Shipping] ADD  CONSTRAINT [DF_Shipping_TransactionNumber]  DEFAULT (0) FOR [TransactionNumber]
GO
/****** Object:  Default [DF_Shipping_OrderHistoryID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Shipping] ADD  CONSTRAINT [DF_Shipping_OrderHistoryID]  DEFAULT (0) FOR [OrderHistoryID]
GO
/****** Object:  Default [DF_Shipping_Charge]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Shipping] ADD  CONSTRAINT [DF_Shipping_Charge]  DEFAULT (0) FOR [Charge]
GO
/****** Object:  Default [DF_Shipping_TrackingNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Shipping] ADD  CONSTRAINT [DF_Shipping_TrackingNumber]  DEFAULT ('') FOR [TrackingNumber]
GO
/****** Object:  Default [DF_Shipping_Notes]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Shipping] ADD  CONSTRAINT [DF_Shipping_Notes]  DEFAULT ('') FOR [Notes]
GO
/****** Object:  Default [DF_Shipping_Name]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Shipping] ADD  CONSTRAINT [DF_Shipping_Name]  DEFAULT ('') FOR [Name]
GO
/****** Object:  Default [DF_Shipping_Company]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Shipping] ADD  CONSTRAINT [DF_Shipping_Company]  DEFAULT ('') FOR [Company]
GO
/****** Object:  Default [DF_Shipping_Address]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Shipping] ADD  CONSTRAINT [DF_Shipping_Address]  DEFAULT ('') FOR [Address]
GO
/****** Object:  Default [DF_Shipping_Address2]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Shipping] ADD  CONSTRAINT [DF_Shipping_Address2]  DEFAULT ('') FOR [Address2]
GO
/****** Object:  Default [DF_Shipping_City]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Shipping] ADD  CONSTRAINT [DF_Shipping_City]  DEFAULT ('') FOR [City]
GO
/****** Object:  Default [DF_Shipping_State]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Shipping] ADD  CONSTRAINT [DF_Shipping_State]  DEFAULT ('') FOR [State]
GO
/****** Object:  Default [DF_Shipping_Zip]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Shipping] ADD  CONSTRAINT [DF_Shipping_Zip]  DEFAULT ('') FOR [Zip]
GO
/****** Object:  Default [DF_Shipping_Country]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Shipping] ADD  CONSTRAINT [DF_Shipping_Country]  DEFAULT ('') FOR [Country]
GO
/****** Object:  Default [DF_Shipping_EmailAddress]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Shipping] ADD  CONSTRAINT [DF_Shipping_EmailAddress]  DEFAULT ('') FOR [EmailAddress]
GO
/****** Object:  Default [DF_Shipping_Status]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Shipping] ADD  CONSTRAINT [DF_Shipping_Status]  DEFAULT (0) FOR [Status]
GO
/****** Object:  Default [DF_Shipping_CODReturnTrackingNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Shipping] ADD  CONSTRAINT [DF_Shipping_CODReturnTrackingNumber]  DEFAULT ('') FOR [CODReturnTrackingNumber]
GO
/****** Object:  Default [DF_Shipping_NetShipCost]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Shipping] ADD  CONSTRAINT [DF_Shipping_NetShipCost]  DEFAULT (0) FOR [NetShipCost]
GO
/****** Object:  Default [DF_Shipping_CarrierName]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Shipping] ADD  CONSTRAINT [DF_Shipping_CarrierName]  DEFAULT ('') FOR [CarrierName]
GO
/****** Object:  Default [DF_Shipping_ServiceName]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Shipping] ADD  CONSTRAINT [DF_Shipping_ServiceName]  DEFAULT ('') FOR [ServiceName]
GO
/****** Object:  Default [Df_Shipping_TotalWeight]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Shipping] ADD  CONSTRAINT [Df_Shipping_TotalWeight]  DEFAULT (0) FOR [TotalWeight]
GO
/****** Object:  Default [Df_Shipping_DeclaredValue]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Shipping] ADD  CONSTRAINT [Df_Shipping_DeclaredValue]  DEFAULT (0) FOR [DeclaredValue]
GO
/****** Object:  Default [Df_Shipping_DateCreated]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Shipping] ADD  CONSTRAINT [Df_Shipping_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [Df_Shipping_PhoneNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Shipping] ADD  CONSTRAINT [Df_Shipping_PhoneNumber]  DEFAULT ('') FOR [PhoneNumber]
GO
/****** Object:  Default [Df_Shipping_FaxNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Shipping] ADD  CONSTRAINT [Df_Shipping_FaxNumber]  DEFAULT ('') FOR [FaxNumber]
GO
/****** Object:  Default [DF_Serial_HQID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Serial] ADD  CONSTRAINT [DF_Serial_HQID]  DEFAULT (0) FOR [HQID]
GO
/****** Object:  Default [DF_Serial_LastUpdated]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Serial] ADD  CONSTRAINT [DF_Serial_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
/****** Object:  Default [DF_Serial_SerialNumber2]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Serial] ADD  CONSTRAINT [DF_Serial_SerialNumber2]  DEFAULT ('') FOR [SerialNumber2]
GO
/****** Object:  Default [DF_Serial_SerialNumber3]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Serial] ADD  CONSTRAINT [DF_Serial_SerialNumber3]  DEFAULT ('') FOR [SerialNumber3]
GO
/****** Object:  Default [DF_Serial_StoreID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Serial] ADD  CONSTRAINT [DF_Serial_StoreID]  DEFAULT (0) FOR [StoreID]
GO
/****** Object:  Default [DF_Serial_TransactionEntryID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Serial] ADD  CONSTRAINT [DF_Serial_TransactionEntryID]  DEFAULT (0) FOR [TransactionEntryID]
GO
/****** Object:  Default [DF_Serial_ItemID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Serial] ADD  CONSTRAINT [DF_Serial_ItemID]  DEFAULT (0) FOR [ItemID]
GO
/****** Object:  Default [DF_Serial_SerialNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Serial] ADD  CONSTRAINT [DF_Serial_SerialNumber]  DEFAULT ('') FOR [SerialNumber]
GO
/****** Object:  Default [DF_Serial_Status]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Serial] ADD  CONSTRAINT [DF_Serial_Status]  DEFAULT (0) FOR [Status]
GO
/****** Object:  Default [DF_serial_NUSSkipUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Serial] ADD  CONSTRAINT [DF_serial_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
/****** Object:  Default [DF_Serial_NUSSkipPOUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Serial] ADD  CONSTRAINT [DF_Serial_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
/****** Object:  Default [DF_Tax_FixedAmount]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_FixedAmount]  DEFAULT (0) FOR [FixedAmount]
GO
/****** Object:  Default [DF_Tax_HQID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_HQID]  DEFAULT (0) FOR [HQID]
GO
/****** Object:  Default [DF_Tax_Description]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Description]  DEFAULT ('') FOR [Description]
GO
/****** Object:  Default [DF_Tax_Percentage]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Percentage]  DEFAULT (0) FOR [Percentage]
GO
/****** Object:  Default [DF_Tax_UsePartialDollar]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_UsePartialDollar]  DEFAULT (0) FOR [UsePartialDollar]
GO
/****** Object:  Default [DF_Tax_ItemMaximum]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_ItemMaximum]  DEFAULT (0) FOR [ItemMaximum]
GO
/****** Object:  Default [DF_Tax_IncludePreviousTax]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_IncludePreviousTax]  DEFAULT (0) FOR [IncludePreviousTax]
GO
/****** Object:  Default [DF_Tax_Bracket00]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket00]  DEFAULT (0) FOR [Bracket00]
GO
/****** Object:  Default [DF_Tax_Bracket01]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket01]  DEFAULT (0) FOR [Bracket01]
GO
/****** Object:  Default [DF_Tax_Bracket02]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket02]  DEFAULT (0) FOR [Bracket02]
GO
/****** Object:  Default [DF_Tax_Bracket03]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket03]  DEFAULT (0) FOR [Bracket03]
GO
/****** Object:  Default [DF_Tax_Bracket04]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket04]  DEFAULT (0) FOR [Bracket04]
GO
/****** Object:  Default [DF_Tax_Bracket05]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket05]  DEFAULT (0) FOR [Bracket05]
GO
/****** Object:  Default [DF_Tax_Bracket06]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket06]  DEFAULT (0) FOR [Bracket06]
GO
/****** Object:  Default [DF_Tax_Bracket07]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket07]  DEFAULT (0) FOR [Bracket07]
GO
/****** Object:  Default [DF_Tax_Bracket08]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket08]  DEFAULT (0) FOR [Bracket08]
GO
/****** Object:  Default [DF_Tax_Bracket09]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket09]  DEFAULT (0) FOR [Bracket09]
GO
/****** Object:  Default [DF_Tax_Bracket10]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket10]  DEFAULT (0) FOR [Bracket10]
GO
/****** Object:  Default [DF_Tax_Code]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Code]  DEFAULT ('') FOR [Code]
GO
/****** Object:  Default [Df_Tax_ItemMinimum]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [Df_Tax_ItemMinimum]  DEFAULT (0) FOR [ItemMinimum]
GO
/****** Object:  Default [Df_Tax_ApplyOverMinimum]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [Df_Tax_ApplyOverMinimum]  DEFAULT (0) FOR [ApplyOverMinimum]
GO
/****** Object:  Default [DF_Tax_Bracket11]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket11]  DEFAULT (0) FOR [Bracket11]
GO
/****** Object:  Default [DF_Tax_Bracket12]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket12]  DEFAULT (0) FOR [Bracket12]
GO
/****** Object:  Default [DF_Tax_Bracket13]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket13]  DEFAULT (0) FOR [Bracket13]
GO
/****** Object:  Default [DF_Tax_Bracket14]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket14]  DEFAULT (0) FOR [Bracket14]
GO
/****** Object:  Default [DF_Tax_Bracket15]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket15]  DEFAULT (0) FOR [Bracket15]
GO
/****** Object:  Default [DF_Tax_Bracket16]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket16]  DEFAULT (0) FOR [Bracket16]
GO
/****** Object:  Default [DF_Tax_Bracket17]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket17]  DEFAULT (0) FOR [Bracket17]
GO
/****** Object:  Default [DF_Tax_Bracket18]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket18]  DEFAULT (0) FOR [Bracket18]
GO
/****** Object:  Default [DF_Tax_Bracket19]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket19]  DEFAULT (0) FOR [Bracket19]
GO
/****** Object:  Default [DF_Tax_Bracket20]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket20]  DEFAULT (0) FOR [Bracket20]
GO
/****** Object:  Default [DF_Tax_Bracket21]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket21]  DEFAULT (0) FOR [Bracket21]
GO
/****** Object:  Default [DF_Tax_Bracket22]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket22]  DEFAULT (0) FOR [Bracket22]
GO
/****** Object:  Default [DF_Tax_Bracket23]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket23]  DEFAULT (0) FOR [Bracket23]
GO
/****** Object:  Default [DF_Tax_Bracket24]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket24]  DEFAULT (0) FOR [Bracket24]
GO
/****** Object:  Default [DF_Tax_Bracket25]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket25]  DEFAULT (0) FOR [Bracket25]
GO
/****** Object:  Default [DF_Tax_Bracket26]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket26]  DEFAULT (0) FOR [Bracket26]
GO
/****** Object:  Default [DF_Tax_Bracket27]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket27]  DEFAULT (0) FOR [Bracket27]
GO
/****** Object:  Default [DF_Tax_Bracket28]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket28]  DEFAULT (0) FOR [Bracket28]
GO
/****** Object:  Default [DF_Tax_Bracket29]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket29]  DEFAULT (0) FOR [Bracket29]
GO
/****** Object:  Default [DF_Tax_Bracket30]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_Bracket30]  DEFAULT (0) FOR [Bracket30]
GO
/****** Object:  Default [DF_Tax_BracketValue01]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue01]  DEFAULT (0) FOR [BracketValue01]
GO
/****** Object:  Default [DF_Tax_BracketValue02]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue02]  DEFAULT (0) FOR [BracketValue02]
GO
/****** Object:  Default [DF_Tax_BracketValue03]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue03]  DEFAULT (0) FOR [BracketValue03]
GO
/****** Object:  Default [DF_Tax_BracketValue04]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue04]  DEFAULT (0) FOR [BracketValue04]
GO
/****** Object:  Default [DF_Tax_BracketValue05]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue05]  DEFAULT (0) FOR [BracketValue05]
GO
/****** Object:  Default [DF_Tax_BracketValue06]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue06]  DEFAULT (0) FOR [BracketValue06]
GO
/****** Object:  Default [DF_Tax_BracketValue07]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue07]  DEFAULT (0) FOR [BracketValue07]
GO
/****** Object:  Default [DF_Tax_BracketValue08]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue08]  DEFAULT (0) FOR [BracketValue08]
GO
/****** Object:  Default [DF_Tax_BracketValue09]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue09]  DEFAULT (0) FOR [BracketValue09]
GO
/****** Object:  Default [DF_Tax_BracketValue10]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue10]  DEFAULT (0) FOR [BracketValue10]
GO
/****** Object:  Default [DF_Tax_BracketValue11]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue11]  DEFAULT (0) FOR [BracketValue11]
GO
/****** Object:  Default [DF_Tax_BracketValue12]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue12]  DEFAULT (0) FOR [BracketValue12]
GO
/****** Object:  Default [DF_Tax_BracketValue13]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue13]  DEFAULT (0) FOR [BracketValue13]
GO
/****** Object:  Default [DF_Tax_BracketValue14]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue14]  DEFAULT (0) FOR [BracketValue14]
GO
/****** Object:  Default [DF_Tax_BracketValue15]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue15]  DEFAULT (0) FOR [BracketValue15]
GO
/****** Object:  Default [DF_Tax_BracketValue16]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue16]  DEFAULT (0) FOR [BracketValue16]
GO
/****** Object:  Default [DF_Tax_BracketValue17]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue17]  DEFAULT (0) FOR [BracketValue17]
GO
/****** Object:  Default [DF_Tax_BracketValue18]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue18]  DEFAULT (0) FOR [BracketValue18]
GO
/****** Object:  Default [DF_Tax_BracketValue19]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue19]  DEFAULT (0) FOR [BracketValue19]
GO
/****** Object:  Default [DF_Tax_BracketValue20]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue20]  DEFAULT (0) FOR [BracketValue20]
GO
/****** Object:  Default [DF_Tax_BracketValue21]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue21]  DEFAULT (0) FOR [BracketValue21]
GO
/****** Object:  Default [DF_Tax_BracketValue22]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue22]  DEFAULT (0) FOR [BracketValue22]
GO
/****** Object:  Default [DF_Tax_BracketValue23]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue23]  DEFAULT (0) FOR [BracketValue23]
GO
/****** Object:  Default [DF_Tax_BracketValue24]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue24]  DEFAULT (0) FOR [BracketValue24]
GO
/****** Object:  Default [DF_Tax_BracketValue25]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue25]  DEFAULT (0) FOR [BracketValue25]
GO
/****** Object:  Default [DF_Tax_BracketValue26]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue26]  DEFAULT (0) FOR [BracketValue26]
GO
/****** Object:  Default [DF_Tax_BracketValue27]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue27]  DEFAULT (0) FOR [BracketValue27]
GO
/****** Object:  Default [DF_Tax_BracketValue28]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue28]  DEFAULT (0) FOR [BracketValue28]
GO
/****** Object:  Default [DF_Tax_BracketValue29]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue29]  DEFAULT (0) FOR [BracketValue29]
GO
/****** Object:  Default [DF_Tax_BracketValue30]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_BracketValue30]  DEFAULT (0) FOR [BracketValue30]
GO
/****** Object:  Default [DF_tax_NUSSkipUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_tax_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
/****** Object:  Default [DF_Tax_NUSSkipPOUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Tax] ADD  CONSTRAINT [DF_Tax_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
/****** Object:  Default [DF_SupplierList_MinimumOrder]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[SupplierList] ADD  CONSTRAINT [DF_SupplierList_MinimumOrder]  DEFAULT (0) FOR [MinimumOrder]
GO
/****** Object:  Default [DF_SupplierList_ItemID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[SupplierList] ADD  CONSTRAINT [DF_SupplierList_ItemID]  DEFAULT (0) FOR [ItemID]
GO
/****** Object:  Default [DF_SupplierList_SupplierID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[SupplierList] ADD  CONSTRAINT [DF_SupplierList_SupplierID]  DEFAULT (0) FOR [SupplierID]
GO
/****** Object:  Default [DF_SupplierList_Cost]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[SupplierList] ADD  CONSTRAINT [DF_SupplierList_Cost]  DEFAULT (0) FOR [Cost]
GO
/****** Object:  Default [DF_SupplierList_ReorderNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[SupplierList] ADD  CONSTRAINT [DF_SupplierList_ReorderNumber]  DEFAULT ('') FOR [ReorderNumber]
GO
/****** Object:  Default [DF_SupplierList_MasterPackQuantity]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[SupplierList] ADD  CONSTRAINT [DF_SupplierList_MasterPackQuantity]  DEFAULT (1) FOR [MasterPackQuantity]
GO
/****** Object:  Default [DF_SupplierList_TaxRate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[SupplierList] ADD  CONSTRAINT [DF_SupplierList_TaxRate]  DEFAULT (0) FOR [TaxRate]
GO
/****** Object:  Default [DF_supplierlist_NUSSkipUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[SupplierList] ADD  CONSTRAINT [DF_supplierlist_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
/****** Object:  Default [DF_SupplierList_NUSSkipPOUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[SupplierList] ADD  CONSTRAINT [DF_SupplierList_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
/****** Object:  Default [DF_Supplier_Country]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_Supplier_Country]  DEFAULT ('') FOR [Country]
GO
/****** Object:  Default [DF_Supplier_HQID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_Supplier_HQID]  DEFAULT (0) FOR [HQID]
GO
/****** Object:  Default [DF_Supplier_LastUpdated]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_Supplier_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
/****** Object:  Default [DF_Supplier_State]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_Supplier_State]  DEFAULT ('') FOR [State]
GO
/****** Object:  Default [DF_Supplier_SupplierName]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_Supplier_SupplierName]  DEFAULT ('') FOR [SupplierName]
GO
/****** Object:  Default [DF_Supplier_ContactName]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_Supplier_ContactName]  DEFAULT ('') FOR [ContactName]
GO
/****** Object:  Default [DF_Supplier_Address1]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_Supplier_Address1]  DEFAULT ('') FOR [Address1]
GO
/****** Object:  Default [DF_Supplier_Address2]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_Supplier_Address2]  DEFAULT ('') FOR [Address2]
GO
/****** Object:  Default [DF_Supplier_City]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_Supplier_City]  DEFAULT ('') FOR [City]
GO
/****** Object:  Default [DF_Supplier_Zip]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_Supplier_Zip]  DEFAULT ('') FOR [Zip]
GO
/****** Object:  Default [DF_Supplier_EmailAddress]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_Supplier_EmailAddress]  DEFAULT ('') FOR [EmailAddress]
GO
/****** Object:  Default [DF_Supplier_WebPageAddress]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_Supplier_WebPageAddress]  DEFAULT ('') FOR [WebPageAddress]
GO
/****** Object:  Default [DF_Supplier_Code]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_Supplier_Code]  DEFAULT ('') FOR [Code]
GO
/****** Object:  Default [DF_Supplier_AccountNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_Supplier_AccountNumber]  DEFAULT ('') FOR [AccountNumber]
GO
/****** Object:  Default [DF_Supplier_TaxNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_Supplier_TaxNumber]  DEFAULT ('') FOR [TaxNumber]
GO
/****** Object:  Default [DF_Supplier_CurrencyID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_Supplier_CurrencyID]  DEFAULT (0) FOR [CurrencyID]
GO
/****** Object:  Default [Df_Supplier_PhoneNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [Df_Supplier_PhoneNumber]  DEFAULT ('') FOR [PhoneNumber]
GO
/****** Object:  Default [Df_Supplier_FaxNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [Df_Supplier_FaxNumber]  DEFAULT ('') FOR [FaxNumber]
GO
/****** Object:  Default [Df_Supplier_CustomText1]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [Df_Supplier_CustomText1]  DEFAULT ('') FOR [CustomText1]
GO
/****** Object:  Default [Df_Supplier_CustomText2]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [Df_Supplier_CustomText2]  DEFAULT ('') FOR [CustomText2]
GO
/****** Object:  Default [Df_Supplier_CustomText3]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [Df_Supplier_CustomText3]  DEFAULT ('') FOR [CustomText3]
GO
/****** Object:  Default [Df_Supplier_CustomText4]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [Df_Supplier_CustomText4]  DEFAULT ('') FOR [CustomText4]
GO
/****** Object:  Default [Df_Supplier_CustomText5]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [Df_Supplier_CustomText5]  DEFAULT ('') FOR [CustomText5]
GO
/****** Object:  Default [Df_Supplier_CustomNumber1]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [Df_Supplier_CustomNumber1]  DEFAULT (0) FOR [CustomNumber1]
GO
/****** Object:  Default [Df_Supplier_CustomNumber2]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [Df_Supplier_CustomNumber2]  DEFAULT (0) FOR [CustomNumber2]
GO
/****** Object:  Default [Df_Supplier_CustomNumber3]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [Df_Supplier_CustomNumber3]  DEFAULT (0) FOR [CustomNumber3]
GO
/****** Object:  Default [Df_Supplier_CustomNumber4]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [Df_Supplier_CustomNumber4]  DEFAULT (0) FOR [CustomNumber4]
GO
/****** Object:  Default [Df_Supplier_CustomNumber5]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [Df_Supplier_CustomNumber5]  DEFAULT (0) FOR [CustomNumber5]
GO
/****** Object:  Default [Df_Supplier_Notes]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [Df_Supplier_Notes]  DEFAULT ('') FOR [Notes]
GO
/****** Object:  Default [DF_Supplier_Terms]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_Supplier_Terms]  DEFAULT ('') FOR [Terms]
GO
/****** Object:  Default [DF_supplier_NUSSkipUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_supplier_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
/****** Object:  Default [DF_Supplier_NUSSkipPOUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_Supplier_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
/****** Object:  Default [DF_Subsitute_ItemID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Substitute] ADD  CONSTRAINT [DF_Subsitute_ItemID]  DEFAULT (0) FOR [ItemID]
GO
/****** Object:  Default [DF_Subsitute_SubsituteItemID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Substitute] ADD  CONSTRAINT [DF_Subsitute_SubsituteItemID]  DEFAULT (0) FOR [SubstituteItemID]
GO
/****** Object:  Default [DF_Substitute_NUSSkipPOUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Substitute] ADD  CONSTRAINT [DF_Substitute_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
/****** Object:  Default [DF_Store_ID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_ID]  DEFAULT (0) FOR [ID]
GO
/****** Object:  Default [DF_Store_Name]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_Name]  DEFAULT ('') FOR [Name]
GO
/****** Object:  Default [DF_Store_StoreCode]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_StoreCode]  DEFAULT ('') FOR [StoreCode]
GO
/****** Object:  Default [DF_Store_Region]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_Region]  DEFAULT ('') FOR [Region]
GO
/****** Object:  Default [DF_Store_Address1]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_Address1]  DEFAULT ('') FOR [Address1]
GO
/****** Object:  Default [DF_Store_Address2]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_Address2]  DEFAULT ('') FOR [Address2]
GO
/****** Object:  Default [DF_Store_City]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_City]  DEFAULT ('') FOR [City]
GO
/****** Object:  Default [DF_Store_Country]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_Country]  DEFAULT ('') FOR [Country]
GO
/****** Object:  Default [DF_Store_FaxNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_FaxNumber]  DEFAULT ('') FOR [FaxNumber]
GO
/****** Object:  Default [DF_Store_PhoneNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_PhoneNumber]  DEFAULT ('') FOR [PhoneNumber]
GO
/****** Object:  Default [DF_Store_State]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_State]  DEFAULT ('') FOR [State]
GO
/****** Object:  Default [DF_Store_Zip]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_Zip]  DEFAULT ('') FOR [Zip]
GO
/****** Object:  Default [DF_Store_ParentStoreID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_ParentStoreID]  DEFAULT (0) FOR [ParentStoreID]
GO
/****** Object:  Default [DF_Store_ScheduleHourMask1]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_ScheduleHourMask1]  DEFAULT (0) FOR [ScheduleHourMask1]
GO
/****** Object:  Default [DF_Store_ScheduleHourMask2]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_ScheduleHourMask2]  DEFAULT (0) FOR [ScheduleHourMask2]
GO
/****** Object:  Default [DF_Store_ScheduleHourMask3]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_ScheduleHourMask3]  DEFAULT (0) FOR [ScheduleHourMask3]
GO
/****** Object:  Default [DF_Store_ScheduleHourMask4]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_ScheduleHourMask4]  DEFAULT (0) FOR [ScheduleHourMask4]
GO
/****** Object:  Default [DF_Store_ScheduleHourMask5]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_ScheduleHourMask5]  DEFAULT (0) FOR [ScheduleHourMask5]
GO
/****** Object:  Default [DF_Store_ScheduleHourMask6]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_ScheduleHourMask6]  DEFAULT (0) FOR [ScheduleHourMask6]
GO
/****** Object:  Default [DF_Store_ScheduleHourMask7]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_ScheduleHourMask7]  DEFAULT (0) FOR [ScheduleHourMask7]
GO
/****** Object:  Default [DF_Store_ScheduleMinute]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_ScheduleMinute]  DEFAULT (0) FOR [ScheduleMinute]
GO
/****** Object:  Default [DF_Store_RetryCount]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_RetryCount]  DEFAULT (0) FOR [RetryCount]
GO
/****** Object:  Default [DF_Store_RetryDelay]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_RetryDelay]  DEFAULT (0) FOR [RetryDelay]
GO
/****** Object:  Default [DF_Store_AccountName]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_AccountName]  DEFAULT ('') FOR [AccountName]
GO
/****** Object:  Default [DF_Store_Password]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_Password]  DEFAULT ('') FOR [Password]
GO
/****** Object:  Default [DF_ScheduleSegment_HQID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ScheduleSegment] ADD  CONSTRAINT [DF_ScheduleSegment_HQID]  DEFAULT (0) FOR [HQID]
GO
/****** Object:  Default [DF_ScheduleSegment_ScheduleID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ScheduleSegment] ADD  CONSTRAINT [DF_ScheduleSegment_ScheduleID]  DEFAULT (0) FOR [ScheduleID]
GO
/****** Object:  Default [DF_ScheduleSegment_StartDay]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ScheduleSegment] ADD  CONSTRAINT [DF_ScheduleSegment_StartDay]  DEFAULT (0) FOR [StartDay]
GO
/****** Object:  Default [DF_ScheduleSegment_EndDay]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ScheduleSegment] ADD  CONSTRAINT [DF_ScheduleSegment_EndDay]  DEFAULT (0) FOR [EndDay]
GO
/****** Object:  Default [DF_ScheduleSegment_StartTime]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ScheduleSegment] ADD  CONSTRAINT [DF_ScheduleSegment_StartTime]  DEFAULT (getdate()) FOR [StartTime]
GO
/****** Object:  Default [DF_ScheduleSegment_EndTime]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ScheduleSegment] ADD  CONSTRAINT [DF_ScheduleSegment_EndTime]  DEFAULT (getdate()) FOR [EndTime]
GO
/****** Object:  Default [DF_Schedule_HQID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Schedule] ADD  CONSTRAINT [DF_Schedule_HQID]  DEFAULT (0) FOR [HQID]
GO
/****** Object:  Default [DF_Schedule_Description]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Schedule] ADD  CONSTRAINT [DF_Schedule_Description]  DEFAULT ('') FOR [Description]
GO
/****** Object:  Default [DF_Schedule_Increment]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Schedule] ADD  CONSTRAINT [DF_Schedule_Increment]  DEFAULT (0) FOR [Increment]
GO
/****** Object:  Default [DF_SalesRep_HQID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[SalesRep] ADD  CONSTRAINT [DF_SalesRep_HQID]  DEFAULT (0) FOR [HQID]
GO
/****** Object:  Default [DF_SalesRep_LastUpdated]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[SalesRep] ADD  CONSTRAINT [DF_SalesRep_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
/****** Object:  Default [DF_SalesRep_Number]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[SalesRep] ADD  CONSTRAINT [DF_SalesRep_Number]  DEFAULT ('') FOR [Number]
GO
/****** Object:  Default [DF_SalesRep_StoreID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[SalesRep] ADD  CONSTRAINT [DF_SalesRep_StoreID]  DEFAULT (0) FOR [StoreID]
GO
/****** Object:  Default [DF_SalesRep_Name]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[SalesRep] ADD  CONSTRAINT [DF_SalesRep_Name]  DEFAULT ('') FOR [Name]
GO
/****** Object:  Default [DF_SalesRep_PercentOfSale]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[SalesRep] ADD  CONSTRAINT [DF_SalesRep_PercentOfSale]  DEFAULT (0) FOR [PercentOfSale]
GO
/****** Object:  Default [DF_SalesRep_PercentOfProfit]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[SalesRep] ADD  CONSTRAINT [DF_SalesRep_PercentOfProfit]  DEFAULT (0) FOR [PercentOfProfit]
GO
/****** Object:  Default [DF_SalesRep_FixedRate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[SalesRep] ADD  CONSTRAINT [DF_SalesRep_FixedRate]  DEFAULT (0) FOR [FixedRate]
GO
/****** Object:  Default [DF_SalesRep_EmailAddress]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[SalesRep] ADD  CONSTRAINT [DF_SalesRep_EmailAddress]  DEFAULT ('') FOR [EmailAddress]
GO
/****** Object:  Default [Df_SalesRep_Telephone]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[SalesRep] ADD  CONSTRAINT [Df_SalesRep_Telephone]  DEFAULT ('') FOR [Telephone]
GO
/****** Object:  Default [DF_Register_Description]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF_Register_Description]  DEFAULT ('') FOR [Description]
GO
/****** Object:  Default [DF_Register_PoleDisplayEnabled]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF_Register_PoleDisplayEnabled]  DEFAULT (0) FOR [PoleDisplayEnabled]
GO
/****** Object:  Default [DF_Register_ReceiptID2]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF_Register_ReceiptID2]  DEFAULT (0) FOR [Receipt2ID]
GO
/****** Object:  Default [DF_Register_ScaleEnabled]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF_Register_ScaleEnabled]  DEFAULT (0) FOR [ScaleEnabled]
GO
/****** Object:  Default [DF_Register_ScaleTimeout]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF_Register_ScaleTimeout]  DEFAULT ('') FOR [ScaleTimeout]
GO
/****** Object:  Default [DF_Register_ScannerEnabled]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF_Register_ScannerEnabled]  DEFAULT (0) FOR [ScannerEnabled]
GO
/****** Object:  Default [DF_Register_ZZBatchNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF_Register_ZZBatchNumber]  DEFAULT (0) FOR [ZZBatchNumber]
GO
/****** Object:  Default [DF_Register_Number]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF_Register_Number]  DEFAULT (0) FOR [Number]
GO
/****** Object:  Default [DF_Register_CurrentBatchNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF_Register_CurrentBatchNumber]  DEFAULT (0) FOR [CurrentBatchNumber]
GO
/****** Object:  Default [DF_Register_ReceiptID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF_Register_ReceiptID]  DEFAULT (0) FOR [Receipt1ID]
GO
/****** Object:  Default [DF_Register_PoleDisplayMessageID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF_Register_PoleDisplayMessageID]  DEFAULT (0) FOR [PoleDisplayMessageID]
GO
/****** Object:  Default [DF_Register_Printer1Name]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF_Register_Printer1Name]  DEFAULT ('') FOR [Printer1Name]
GO
/****** Object:  Default [DF_Register_Printer1Options]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF_Register_Printer1Options]  DEFAULT (0) FOR [Printer1Options]
GO
/****** Object:  Default [DF_Register_Printer2Name]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF_Register_Printer2Name]  DEFAULT ('') FOR [Printer2Name]
GO
/****** Object:  Default [DF_Register_Printer2Options]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF_Register_Printer2Options]  DEFAULT (0) FOR [Printer2Options]
GO
/****** Object:  Default [DF_Register_ChannelID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF_Register_ChannelID]  DEFAULT (0) FOR [ChannelID]
GO
/****** Object:  Default [DF_Register_NetDisplayEnabled]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF_Register_NetDisplayEnabled]  DEFAULT (0) FOR [NetDisplayEnabled]
GO
/****** Object:  Default [DF_Register_DefaultPriceLevel]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF_Register_DefaultPriceLevel]  DEFAULT (0) FOR [DefaultPriceLevel]
GO
/****** Object:  Default [DF_Register_PoleDisplayName]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF_Register_PoleDisplayName]  DEFAULT ('') FOR [PoleDisplayName]
GO
/****** Object:  Default [Df_Register_ScaleName]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [Df_Register_ScaleName]  DEFAULT ('') FOR [ScaleName]
GO
/****** Object:  Default [Df_Register_ScannerName]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [Df_Register_ScannerName]  DEFAULT ('') FOR [ScannerName]
GO
/****** Object:  Default [Df_Register_Printer1Type]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [Df_Register_Printer1Type]  DEFAULT (0) FOR [Printer1Type]
GO
/****** Object:  Default [Df_Register_Printer2Type]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [Df_Register_Printer2Type]  DEFAULT (0) FOR [Printer2Type]
GO
/****** Object:  Default [Df_Register_CasherDrawer1Name]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [Df_Register_CasherDrawer1Name]  DEFAULT ('') FOR [CashDrawer1Name]
GO
/****** Object:  Default [Df_Register_CasherDrawer1Enabled]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [Df_Register_CasherDrawer1Enabled]  DEFAULT (0) FOR [CashDrawer1Enabled]
GO
/****** Object:  Default [Df_Register_CasherDrawer1WaitForClose]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [Df_Register_CasherDrawer1WaitForClose]  DEFAULT (0) FOR [CashDrawer1WaitForClose]
GO
/****** Object:  Default [Df_Register_CasherDrawer1OpenTimeout]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [Df_Register_CasherDrawer1OpenTimeout]  DEFAULT (0) FOR [CashDrawer1OpenTimeout]
GO
/****** Object:  Default [Df_Register_CasherDrawer2Name]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [Df_Register_CasherDrawer2Name]  DEFAULT ('') FOR [CashDrawer2Name]
GO
/****** Object:  Default [Df_Register_CasherDrawer2Enabled]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [Df_Register_CasherDrawer2Enabled]  DEFAULT (0) FOR [CashDrawer2Enabled]
GO
/****** Object:  Default [Df_Register_CasherDrawer2WaitForClose]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [Df_Register_CasherDrawer2WaitForClose]  DEFAULT (0) FOR [CashDrawer2WaitForClose]
GO
/****** Object:  Default [Df_Register_CasherDrawer2OpenTimeout]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [Df_Register_CasherDrawer2OpenTimeout]  DEFAULT (0) FOR [CashDrawer2OpenTimeout]
GO
/****** Object:  Default [DF__Register__StoreI__7B9B496D]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Register] ADD  DEFAULT (0) FOR [StoreID]
GO
/****** Object:  Default [Df_Register_MICRName]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [Df_Register_MICRName]  DEFAULT ('') FOR [MICRName]
GO
/****** Object:  Default [Df_Register_MICREnabled]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [Df_Register_MICREnabled]  DEFAULT (0) FOR [MICREnabled]
GO
/****** Object:  Default [Df_Register_MICRTimeout]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [Df_Register_MICRTimeout]  DEFAULT (0) FOR [MICRTimeout]
GO
/****** Object:  Default [Df_Register_MSRName]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [Df_Register_MSRName]  DEFAULT ('') FOR [MSRName]
GO
/****** Object:  Default [Df_Register_MSREnabled]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [Df_Register_MSREnabled]  DEFAULT (0) FOR [MSREnabled]
GO
/****** Object:  Default [Df_Register_SignatureCaptureName]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [Df_Register_SignatureCaptureName]  DEFAULT ('') FOR [SignatureCaptureName]
GO
/****** Object:  Default [Df_Register_SignatureCaptureEnabled]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [Df_Register_SignatureCaptureEnabled]  DEFAULT (0) FOR [SignatureCaptureEnabled]
GO
/****** Object:  Default [Df_Register_SignatureCaptureFormName]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [Df_Register_SignatureCaptureFormName]  DEFAULT ('') FOR [SignatureCaptureFormName]
GO
/****** Object:  Default [Df_Register_TouchScreenEnabled]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [Df_Register_TouchScreenEnabled]  DEFAULT (0) FOR [TouchScreenEnabled]
GO
/****** Object:  Default [Df_Register_KeyboardID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [Df_Register_KeyboardID]  DEFAULT (0) FOR [KeyboardID]
GO
/****** Object:  Default [DF_Register_DefaultServiceID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF_Register_DefaultServiceID]  DEFAULT (0) FOR [DefaultServiceID]
GO
/****** Object:  Default [DF_Register_PINPadEnabled]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF_Register_PINPadEnabled]  DEFAULT (0) FOR [PINPadEnabled]
GO
/****** Object:  Default [DF_Register_PINPadName]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF_Register_PINPadName]  DEFAULT ('') FOR [PINPadName]
GO
/****** Object:  Default [DF_Register_PINPadSystem]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF_Register_PINPadSystem]  DEFAULT ('DUKPT') FOR [PINPadSystem]
GO
/****** Object:  Default [DF_TransactionHostID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF_TransactionHostID]  DEFAULT (1) FOR [TransactionHost]
GO
/****** Object:  Default [DF_RealTimeSigCap]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF_RealTimeSigCap]  DEFAULT (1) FOR [RealTimeSigCap]
GO
/****** Object:  Default [DF_register_NUSSkipUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF_register_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
/****** Object:  Default [DF_Register_NUSSkipPOUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Register] ADD  CONSTRAINT [DF_Register_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
/****** Object:  Default [DF_NetDisplayURL_ChannelID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NetDisplayURL] ADD  CONSTRAINT [DF_NetDisplayURL_ChannelID]  DEFAULT (0) FOR [ChannelID]
GO
/****** Object:  Default [DF_NetDisplayURL_URL]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NetDisplayURL] ADD  CONSTRAINT [DF_NetDisplayURL_URL]  DEFAULT ('') FOR [URL]
GO
/****** Object:  Default [DF_NetDisplayURL_Seconds]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NetDisplayURL] ADD  CONSTRAINT [DF_NetDisplayURL_Seconds]  DEFAULT (0) FOR [Seconds]
GO
/****** Object:  Default [DF_NetDisplayURL_LastUpdated]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NetDisplayURL] ADD  CONSTRAINT [DF_NetDisplayURL_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
/****** Object:  Default [DF_NetDisplayURL_OrderPosition]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NetDisplayURL] ADD  CONSTRAINT [DF_NetDisplayURL_OrderPosition]  DEFAULT (0) FOR [OrderPosition]
GO
/****** Object:  Default [DF_NetDisplayChannel_Name]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NetDisplayChannel] ADD  CONSTRAINT [DF_NetDisplayChannel_Name]  DEFAULT ('') FOR [Name]
GO
/****** Object:  Default [DF_NetDisplayChannel_ShowCurrentItem]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NetDisplayChannel] ADD  CONSTRAINT [DF_NetDisplayChannel_ShowCurrentItem]  DEFAULT (0) FOR [ShowCurrentItem]
GO
/****** Object:  Default [DF_NetDisplayChannel_LastUpdated]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NetDisplayChannel] ADD  CONSTRAINT [DF_NetDisplayChannel_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
/****** Object:  Default [DF_Kit_KitItemID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Kit] ADD  CONSTRAINT [DF_Kit_KitItemID]  DEFAULT (0) FOR [KitItemID]
GO
/****** Object:  Default [DF_Kit_ComponentItemID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Kit] ADD  CONSTRAINT [DF_Kit_ComponentItemID]  DEFAULT (0) FOR [ComponentItemID]
GO
/****** Object:  Default [DF_Kit_Quantity]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Kit] ADD  CONSTRAINT [DF_Kit_Quantity]  DEFAULT (0) FOR [Quantity]
GO
/****** Object:  Default [DF_kit_NUSSkipUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Kit] ADD  CONSTRAINT [DF_kit_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
/****** Object:  Default [DF_Kit_NUSSkipPOUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Kit] ADD  CONSTRAINT [DF_Kit_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
/****** Object:  Default [DF_Journal_StoreID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Journal] ADD  CONSTRAINT [DF_Journal_StoreID]  DEFAULT (0) FOR [StoreID]
GO
/****** Object:  Default [DF_Journal_Time]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Journal] ADD  CONSTRAINT [DF_Journal_Time]  DEFAULT (getdate()) FOR [Time]
GO
/****** Object:  Default [DF_Journal_TransactionType]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Journal] ADD  CONSTRAINT [DF_Journal_TransactionType]  DEFAULT (0) FOR [TransactionType]
GO
/****** Object:  Default [DF_Journal_ReferenceID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Journal] ADD  CONSTRAINT [DF_Journal_ReferenceID]  DEFAULT (0) FOR [ReferenceID]
GO
/****** Object:  Default [DF_Journal_CashierID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Journal] ADD  CONSTRAINT [DF_Journal_CashierID]  DEFAULT (0) FOR [CashierID]
GO
/****** Object:  Default [DF_Journal_CustomerID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Journal] ADD  CONSTRAINT [DF_Journal_CustomerID]  DEFAULT (0) FOR [CustomerID]
GO
/****** Object:  Default [DF_Journal_OrderHistoryID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Journal] ADD  CONSTRAINT [DF_Journal_OrderHistoryID]  DEFAULT (0) FOR [OrderHistoryID]
GO
/****** Object:  Default [DF_Journal_BatchNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Journal] ADD  CONSTRAINT [DF_Journal_BatchNumber]  DEFAULT (0) FOR [BatchNumber]
GO
/****** Object:  Default [DF_Journal_ReceiptText]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Journal] ADD  CONSTRAINT [DF_Journal_ReceiptText]  DEFAULT ('') FOR [ReceiptText]
GO
/****** Object:  Default [DF_Journal_Compressed]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Journal] ADD  CONSTRAINT [DF_Journal_Compressed]  DEFAULT (0) FOR [Compressed]
GO
/****** Object:  Default [DF_journal_NUSSkipUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Journal] ADD  CONSTRAINT [DF_journal_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
/****** Object:  Default [DF_ItemTax_HQID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemTax] ADD  CONSTRAINT [DF_ItemTax_HQID]  DEFAULT (0) FOR [HQID]
GO
/****** Object:  Default [DF_ItemTax_Description]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemTax] ADD  CONSTRAINT [DF_ItemTax_Description]  DEFAULT ('') FOR [Description]
GO
/****** Object:  Default [DF_ItemTax_ApplyOnProfit]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemTax] ADD  CONSTRAINT [DF_ItemTax_ApplyOnProfit]  DEFAULT (0) FOR [Options]
GO
/****** Object:  Default [DF_ItemTax_TaxID01]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemTax] ADD  CONSTRAINT [DF_ItemTax_TaxID01]  DEFAULT (0) FOR [TaxID01]
GO
/****** Object:  Default [DF_ItemTax_ShowOnReceipt01]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemTax] ADD  CONSTRAINT [DF_ItemTax_ShowOnReceipt01]  DEFAULT (0) FOR [ShowOnReceipt01]
GO
/****** Object:  Default [DF_ItemTax_TaxID02]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemTax] ADD  CONSTRAINT [DF_ItemTax_TaxID02]  DEFAULT (0) FOR [TaxID02]
GO
/****** Object:  Default [DF_ItemTax_ShowOnReceipt02]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemTax] ADD  CONSTRAINT [DF_ItemTax_ShowOnReceipt02]  DEFAULT (0) FOR [ShowOnReceipt02]
GO
/****** Object:  Default [DF_ItemTax_TaxID03]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemTax] ADD  CONSTRAINT [DF_ItemTax_TaxID03]  DEFAULT (0) FOR [TaxID03]
GO
/****** Object:  Default [DF_ItemTax_ShowOnReceipt03]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemTax] ADD  CONSTRAINT [DF_ItemTax_ShowOnReceipt03]  DEFAULT (0) FOR [ShowOnReceipt03]
GO
/****** Object:  Default [DF_ItemTax_TaxID04]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemTax] ADD  CONSTRAINT [DF_ItemTax_TaxID04]  DEFAULT (0) FOR [TaxID04]
GO
/****** Object:  Default [DF_ItemTax_ShowOnReceipt04]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemTax] ADD  CONSTRAINT [DF_ItemTax_ShowOnReceipt04]  DEFAULT (0) FOR [ShowOnReceipt04]
GO
/****** Object:  Default [DF_ItemTax_TaxID05]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemTax] ADD  CONSTRAINT [DF_ItemTax_TaxID05]  DEFAULT (0) FOR [TaxID05]
GO
/****** Object:  Default [DF_ItemTax_ShowOnReceipt05]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemTax] ADD  CONSTRAINT [DF_ItemTax_ShowOnReceipt05]  DEFAULT (0) FOR [ShowOnReceipt05]
GO
/****** Object:  Default [DF_ItemTax_TaxID06]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemTax] ADD  CONSTRAINT [DF_ItemTax_TaxID06]  DEFAULT (0) FOR [TaxID06]
GO
/****** Object:  Default [DF_ItemTax_ShowOnReceipt06]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemTax] ADD  CONSTRAINT [DF_ItemTax_ShowOnReceipt06]  DEFAULT (0) FOR [ShowOnReceipt06]
GO
/****** Object:  Default [DF_ItemTax_TaxID07]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemTax] ADD  CONSTRAINT [DF_ItemTax_TaxID07]  DEFAULT (0) FOR [TaxID07]
GO
/****** Object:  Default [DF_ItemTax_ShowOnReceipt07]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemTax] ADD  CONSTRAINT [DF_ItemTax_ShowOnReceipt07]  DEFAULT (0) FOR [ShowOnReceipt07]
GO
/****** Object:  Default [DF_ItemTax_TaxID08]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemTax] ADD  CONSTRAINT [DF_ItemTax_TaxID08]  DEFAULT (0) FOR [TaxID08]
GO
/****** Object:  Default [DF_ItemTax_ShowOnReceipt08]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemTax] ADD  CONSTRAINT [DF_ItemTax_ShowOnReceipt08]  DEFAULT (0) FOR [ShowOnReceipt08]
GO
/****** Object:  Default [DF_ItemTax_TaxID09]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemTax] ADD  CONSTRAINT [DF_ItemTax_TaxID09]  DEFAULT (0) FOR [TaxID09]
GO
/****** Object:  Default [DF_ItemTax_ShowOnReceipt09]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemTax] ADD  CONSTRAINT [DF_ItemTax_ShowOnReceipt09]  DEFAULT (0) FOR [ShowOnReceipt09]
GO
/****** Object:  Default [DF_ItemTax_TaxID10]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemTax] ADD  CONSTRAINT [DF_ItemTax_TaxID10]  DEFAULT (0) FOR [TaxID10]
GO
/****** Object:  Default [DF_ItemTax_ShowOnReceipt10]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemTax] ADD  CONSTRAINT [DF_ItemTax_ShowOnReceipt10]  DEFAULT (0) FOR [ShowOnReceipt10]
GO
/****** Object:  Default [DF_ItemTax_Code]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemTax] ADD  CONSTRAINT [DF_ItemTax_Code]  DEFAULT ('') FOR [Code]
GO
/****** Object:  Default [DF_itemtax_NUSSkipUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemTax] ADD  CONSTRAINT [DF_itemtax_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
/****** Object:  Default [DF_ItemTax_NUSSkipPOUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemTax] ADD  CONSTRAINT [DF_ItemTax_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
/****** Object:  Default [DF_ItemMessage_HQID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemMessage] ADD  CONSTRAINT [DF_ItemMessage_HQID]  DEFAULT (0) FOR [HQID]
GO
/****** Object:  Default [DF_ItemMessage_Title]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemMessage] ADD  CONSTRAINT [DF_ItemMessage_Title]  DEFAULT ('') FOR [Title]
GO
/****** Object:  Default [DF_ItemMessage_AgeLimit]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemMessage] ADD  CONSTRAINT [DF_ItemMessage_AgeLimit]  DEFAULT (0) FOR [AgeLimit]
GO
/****** Object:  Default [DF_ItemMessage_Message]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemMessage] ADD  CONSTRAINT [DF_ItemMessage_Message]  DEFAULT ('') FOR [Message]
GO
/****** Object:  Default [DF_itemmessage_NUSSkipUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemMessage] ADD  CONSTRAINT [DF_itemmessage_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
/****** Object:  Default [DF_ItemMessage_NUSSkipPOUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemMessage] ADD  CONSTRAINT [DF_ItemMessage_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
/****** Object:  Default [DF_ItemClassComponent_ItemClassID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemClassComponent] ADD  CONSTRAINT [DF_ItemClassComponent_ItemClassID]  DEFAULT (0) FOR [ItemClassID]
GO
/****** Object:  Default [DF_ItemClassComponent_ItemID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemClassComponent] ADD  CONSTRAINT [DF_ItemClassComponent_ItemID]  DEFAULT (0) FOR [ItemID]
GO
/****** Object:  Default [DF_ItemClassComponent_Quantity]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemClassComponent] ADD  CONSTRAINT [DF_ItemClassComponent_Quantity]  DEFAULT (0) FOR [Quantity]
GO
/****** Object:  Default [DF_ItemClassComponent_Detail1]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemClassComponent] ADD  CONSTRAINT [DF_ItemClassComponent_Detail1]  DEFAULT ('') FOR [Detail1]
GO
/****** Object:  Default [DF_ItemClassComponent_Detail2]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemClassComponent] ADD  CONSTRAINT [DF_ItemClassComponent_Detail2]  DEFAULT ('') FOR [Detail2]
GO
/****** Object:  Default [DF_ItemClassComponent_Detail3]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemClassComponent] ADD  CONSTRAINT [DF_ItemClassComponent_Detail3]  DEFAULT ('') FOR [Detail3]
GO
/****** Object:  Default [DF_ItemClassComponent_LastUpdated]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemClassComponent] ADD  CONSTRAINT [DF_ItemClassComponent_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
/****** Object:  Default [Df_ItemClassComponent_Price]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemClassComponent] ADD  CONSTRAINT [Df_ItemClassComponent_Price]  DEFAULT (0) FOR [Price]
GO
/****** Object:  Default [DF_itemclasscomponent_NUSSkipUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemClassComponent] ADD  CONSTRAINT [DF_itemclasscomponent_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
/****** Object:  Default [DF_ItemClassComponent_NUSSkipPOUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemClassComponent] ADD  CONSTRAINT [DF_ItemClassComponent_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
/****** Object:  Default [DF_ItemClass_Description]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemClass] ADD  CONSTRAINT [DF_ItemClass_Description]  DEFAULT ('') FOR [Description]
GO
/****** Object:  Default [DF_ItemClass_Dimensions]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemClass] ADD  CONSTRAINT [DF_ItemClass_Dimensions]  DEFAULT (0) FOR [Dimensions]
GO
/****** Object:  Default [DF_ItemClass_Title1]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemClass] ADD  CONSTRAINT [DF_ItemClass_Title1]  DEFAULT ('') FOR [Title1]
GO
/****** Object:  Default [DF_ItemClass_Title2]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemClass] ADD  CONSTRAINT [DF_ItemClass_Title2]  DEFAULT ('') FOR [Title2]
GO
/****** Object:  Default [DF_ItemClass_Title3]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemClass] ADD  CONSTRAINT [DF_ItemClass_Title3]  DEFAULT ('') FOR [Title3]
GO
/****** Object:  Default [DF_ItemClass_ClassType]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemClass] ADD  CONSTRAINT [DF_ItemClass_ClassType]  DEFAULT (0) FOR [ClassType]
GO
/****** Object:  Default [Df_ItemClass_UseComponentPrice]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemClass] ADD  CONSTRAINT [Df_ItemClass_UseComponentPrice]  DEFAULT (0) FOR [UseComponentPrice]
GO
/****** Object:  Default [DF__ItemClass__HQID__77CAB889]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemClass] ADD  DEFAULT (0) FOR [HQID]
GO
/****** Object:  Default [Df_ItemClass_ItemLookupCode]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemClass] ADD  CONSTRAINT [Df_ItemClass_ItemLookupCode]  DEFAULT ('') FOR [ItemLookupCode]
GO
/****** Object:  Default [DF_ItemClass_DepartmentID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemClass] ADD  CONSTRAINT [DF_ItemClass_DepartmentID]  DEFAULT (0) FOR [DepartmentID]
GO
/****** Object:  Default [DF_ItemClass_CategoryID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemClass] ADD  CONSTRAINT [DF_ItemClass_CategoryID]  DEFAULT (0) FOR [CategoryID]
GO
/****** Object:  Default [DF_ItemClass_Price]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemClass] ADD  CONSTRAINT [DF_ItemClass_Price]  DEFAULT (0) FOR [Price]
GO
/****** Object:  Default [DF_ItemClass_Cost]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemClass] ADD  CONSTRAINT [DF_ItemClass_Cost]  DEFAULT (0) FOR [Cost]
GO
/****** Object:  Default [DF_ItemClass_SupplierID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemClass] ADD  CONSTRAINT [DF_ItemClass_SupplierID]  DEFAULT (0) FOR [SupplierID]
GO
/****** Object:  Default [DF_ItemClass_BarcodeFormat]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemClass] ADD  CONSTRAINT [DF_ItemClass_BarcodeFormat]  DEFAULT (0) FOR [BarcodeFormat]
GO
/****** Object:  Default [DF_ItemClass_SubDescription1]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemClass] ADD  CONSTRAINT [DF_ItemClass_SubDescription1]  DEFAULT ('') FOR [SubDescription1]
GO
/****** Object:  Default [DF_ItemClass_SubDescription2]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemClass] ADD  CONSTRAINT [DF_ItemClass_SubDescription2]  DEFAULT ('') FOR [SubDescription2]
GO
/****** Object:  Default [DF_ItemClass_SubDescription3]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemClass] ADD  CONSTRAINT [DF_ItemClass_SubDescription3]  DEFAULT ('') FOR [SubDescription3]
GO
/****** Object:  Default [DF_ItemClass_TaxID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemClass] ADD  CONSTRAINT [DF_ItemClass_TaxID]  DEFAULT (0) FOR [TaxID]
GO
/****** Object:  Default [DF_itemclass_NUSSkipUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemClass] ADD  CONSTRAINT [DF_itemclass_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
/****** Object:  Default [DF_ItemClass_NUSSkipPOUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ItemClass] ADD  CONSTRAINT [DF_ItemClass_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
/****** Object:  Default [DF_Item_BinLocation]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_BinLocation]  DEFAULT ('') FOR [BinLocation]
GO
/****** Object:  Default [DF_Item_BuydownPrice]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_BuydownPrice]  DEFAULT (0) FOR [BuydownPrice]
GO
/****** Object:  Default [DF_Item_BuydownQuantity]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_BuydownQuantity]  DEFAULT (0) FOR [BuydownQuantity]
GO
/****** Object:  Default [DF_Item_CommissionAmount]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_CommissionAmount]  DEFAULT (0) FOR [CommissionAmount]
GO
/****** Object:  Default [DF_Item_CommissionMaximum]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_CommissionMaximum]  DEFAULT (0) FOR [CommissionMaximum]
GO
/****** Object:  Default [DF_Item_CommissionMode]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_CommissionMode]  DEFAULT (0) FOR [CommissionMode]
GO
/****** Object:  Default [DF_Item_CommissionPercentProfit]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_CommissionPercentProfit]  DEFAULT (0) FOR [CommissionPercentProfit]
GO
/****** Object:  Default [DF_Item_CommissionPercentSale]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_CommissionPercentSale]  DEFAULT (0) FOR [CommissionPercentSale]
GO
/****** Object:  Default [DF_Item_Description]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_Description]  DEFAULT ('') FOR [Description]
GO
/****** Object:  Default [DF_Item_FoodStampable]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_FoodStampable]  DEFAULT (0) FOR [FoodStampable]
GO
/****** Object:  Default [DF_Item_HQID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_HQID]  DEFAULT (0) FOR [HQID]
GO
/****** Object:  Default [DF_Item_ItemNotDiscountable]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_ItemNotDiscountable]  DEFAULT (0) FOR [ItemNotDiscountable]
GO
/****** Object:  Default [DF_Item_LastUpdated]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
/****** Object:  Default [DF_Item_QuantityCommitted]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_QuantityCommitted]  DEFAULT (0) FOR [QuantityCommitted]
GO
/****** Object:  Default [DF_Item_SerialNumberCount]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_SerialNumberCount]  DEFAULT (0) FOR [SerialNumberCount]
GO
/****** Object:  Default [DF_Item_TareWeightPercent]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_TareWeightPercent]  DEFAULT (0) FOR [TareWeightPercent]
GO
/****** Object:  Default [DF_Item_ItemLookupCode]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_ItemLookupCode]  DEFAULT ('') FOR [ItemLookupCode]
GO
/****** Object:  Default [DF_Item_DepartmentID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_DepartmentID]  DEFAULT (0) FOR [DepartmentID]
GO
/****** Object:  Default [DF_Item_CategoryID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_CategoryID]  DEFAULT (0) FOR [CategoryID]
GO
/****** Object:  Default [DF_Item_MessageID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_MessageID]  DEFAULT (0) FOR [MessageID]
GO
/****** Object:  Default [DF_Item_Price]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_Price]  DEFAULT (0) FOR [Price]
GO
/****** Object:  Default [DF_Item_PriceA]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_PriceA]  DEFAULT (0) FOR [PriceA]
GO
/****** Object:  Default [DF_Item_PriceB]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_PriceB]  DEFAULT (0) FOR [PriceB]
GO
/****** Object:  Default [DF_Item_PriceC]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_PriceC]  DEFAULT (0) FOR [PriceC]
GO
/****** Object:  Default [DF_Item_SalePrice]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_SalePrice]  DEFAULT (0) FOR [SalePrice]
GO
/****** Object:  Default [DF_Item_QuantityDiscountID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_QuantityDiscountID]  DEFAULT (0) FOR [QuantityDiscountID]
GO
/****** Object:  Default [DF_Item_TaxID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_TaxID]  DEFAULT (0) FOR [TaxID]
GO
/****** Object:  Default [DF_Item_ItemType]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_ItemType]  DEFAULT (0) FOR [ItemType]
GO
/****** Object:  Default [DF_Item_Cost]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_Cost]  DEFAULT (0) FOR [Cost]
GO
/****** Object:  Default [DF_Item_Quantity]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_Quantity]  DEFAULT (0) FOR [Quantity]
GO
/****** Object:  Default [DF_Item_ReorderPoint]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_ReorderPoint]  DEFAULT (0) FOR [ReorderPoint]
GO
/****** Object:  Default [DF_Item_RestockLevel]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_RestockLevel]  DEFAULT (0) FOR [RestockLevel]
GO
/****** Object:  Default [DF_Item_TareWeight]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_TareWeight]  DEFAULT (0) FOR [TareWeight]
GO
/****** Object:  Default [DF_Item_SupplierID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_SupplierID]  DEFAULT (0) FOR [SupplierID]
GO
/****** Object:  Default [DF_Item_TagAlongItem]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_TagAlongItem]  DEFAULT (0) FOR [TagAlongItem]
GO
/****** Object:  Default [DF_Item_TagAlongQuantity]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_TagAlongQuantity]  DEFAULT (0) FOR [TagAlongQuantity]
GO
/****** Object:  Default [DF_Item_ParentItem]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_ParentItem]  DEFAULT (0) FOR [ParentItem]
GO
/****** Object:  Default [DF_Item_ParentQuantity]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_ParentQuantity]  DEFAULT (0) FOR [ParentQuantity]
GO
/****** Object:  Default [DF_Item_BarcodeFormat]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_BarcodeFormat]  DEFAULT (0) FOR [BarcodeFormat]
GO
/****** Object:  Default [DF_Item_PriceLowerBound]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_PriceLowerBound]  DEFAULT (0) FOR [PriceLowerBound]
GO
/****** Object:  Default [DF_Item_PriceUpperBound]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_PriceUpperBound]  DEFAULT (0) FOR [PriceUpperBound]
GO
/****** Object:  Default [DF_Item_PictureName]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_PictureName]  DEFAULT ('') FOR [PictureName]
GO
/****** Object:  Default [DF_Item_ExtendedDescription]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_ExtendedDescription]  DEFAULT ('') FOR [ExtendedDescription]
GO
/****** Object:  Default [DF_Item_SubDescription1]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_SubDescription1]  DEFAULT ('') FOR [SubDescription1]
GO
/****** Object:  Default [DF_Item_SubDescription2]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_SubDescription2]  DEFAULT ('') FOR [SubDescription2]
GO
/****** Object:  Default [DF_Item_SubDescription3]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_SubDescription3]  DEFAULT ('') FOR [SubDescription3]
GO
/****** Object:  Default [DF_Item_UnitOfMeasure]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_UnitOfMeasure]  DEFAULT ('') FOR [UnitOfMeasure]
GO
/****** Object:  Default [DF_Item_SubCategoryID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_SubCategoryID]  DEFAULT (0) FOR [SubCategoryID]
GO
/****** Object:  Default [DF_Item_QuantityEntryNotAllowed]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_QuantityEntryNotAllowed]  DEFAULT (0) FOR [QuantityEntryNotAllowed]
GO
/****** Object:  Default [DF_Item_PriceMustBeEntered]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_PriceMustBeEntered]  DEFAULT (0) FOR [PriceMustBeEntered]
GO
/****** Object:  Default [DF_Item_BlockSalesReason]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_BlockSalesReason]  DEFAULT ('') FOR [BlockSalesReason]
GO
/****** Object:  Default [DF_Item_Weight]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_Weight]  DEFAULT (0) FOR [Weight]
GO
/****** Object:  Default [DF_Item_Taxable]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_Taxable]  DEFAULT (1) FOR [Taxable]
GO
/****** Object:  Default [DF_Item_LastCost]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_LastCost]  DEFAULT (0) FOR [LastCost]
GO
/****** Object:  Default [DF_Item_ReplacementCost]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_ReplacementCost]  DEFAULT (0) FOR [ReplacementCost]
GO
/****** Object:  Default [DF__Item__WebItem__702996C1]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  DEFAULT (0) FOR [WebItem]
GO
/****** Object:  Default [DF_Item_BlockSalesType]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_BlockSalesType]  DEFAULT (0) FOR [BlockSalesType]
GO
/****** Object:  Default [DF_Item_BlockSalesScheduleID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_BlockSalesScheduleID]  DEFAULT (0) FOR [BlockSalesScheduleID]
GO
/****** Object:  Default [DF_Item_SaleType]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_SaleType]  DEFAULT (0) FOR [SaleType]
GO
/****** Object:  Default [DF_Item_SaleScheduleID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_SaleScheduleID]  DEFAULT (0) FOR [SaleScheduleID]
GO
/****** Object:  Default [DF_Item_Consignment]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_Consignment]  DEFAULT (0) FOR [Consignment]
GO
/****** Object:  Default [Df_Item_Inactive]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [Df_Item_Inactive]  DEFAULT (0) FOR [Inactive]
GO
/****** Object:  Default [Df_Item_DoNotOrder]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [Df_Item_DoNotOrder]  DEFAULT (0) FOR [DoNotOrder]
GO
/****** Object:  Default [Df_Item_MSRP]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [Df_Item_MSRP]  DEFAULT (0) FOR [MSRP]
GO
/****** Object:  Default [Df_Item_DateCreated]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [Df_Item_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [Df_Item_Content]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [Df_Item_Content]  DEFAULT ('') FOR [Content]
GO
/****** Object:  Default [Df_Item_UsuallyShip]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [Df_Item_UsuallyShip]  DEFAULT ('') FOR [UsuallyShip]
GO
/****** Object:  Default [DF_item_NUSSkipUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_item_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
/****** Object:  Default [DF_Item_NUSSkipPOUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
/****** Object:  Default [DF_Item_NUS_ExcludedFromLoyalty]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_NUS_ExcludedFromLoyalty]  DEFAULT ((0)) FOR [NUS_ExcludedFromLoyalty]
GO
/****** Object:  Default [DF_InventoryTransferLog_ItemID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[InventoryTransferLog] ADD  CONSTRAINT [DF_InventoryTransferLog_ItemID]  DEFAULT (0) FOR [ItemID]
GO
/****** Object:  Default [DF_InventoryTransferLog_DetailID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[InventoryTransferLog] ADD  CONSTRAINT [DF_InventoryTransferLog_DetailID]  DEFAULT (0) FOR [DetailID]
GO
/****** Object:  Default [DF_InventoryTransferLog_Quantity]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[InventoryTransferLog] ADD  CONSTRAINT [DF_InventoryTransferLog_Quantity]  DEFAULT (0) FOR [Quantity]
GO
/****** Object:  Default [DF_InventoryTransferLog_DateTransferred]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[InventoryTransferLog] ADD  CONSTRAINT [DF_InventoryTransferLog_DateTransferred]  DEFAULT (getdate()) FOR [DateTransferred]
GO
/****** Object:  Default [DF_InventoryTransferLog_StoreID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[InventoryTransferLog] ADD  CONSTRAINT [DF_InventoryTransferLog_StoreID]  DEFAULT (0) FOR [StoreID]
GO
/****** Object:  Default [DF_InventoryTransferLog_ReferenceID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[InventoryTransferLog] ADD  CONSTRAINT [DF_InventoryTransferLog_ReferenceID]  DEFAULT (0) FOR [ReferenceID]
GO
/****** Object:  Default [DF_InventoryTransferLog_ReasonCodeID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[InventoryTransferLog] ADD  CONSTRAINT [DF_InventoryTransferLog_ReasonCodeID]  DEFAULT (0) FOR [ReasonCodeID]
GO
/****** Object:  Default [DF_InventoryTransferLog_CashierID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[InventoryTransferLog] ADD  CONSTRAINT [DF_InventoryTransferLog_CashierID]  DEFAULT (0) FOR [CashierID]
GO
/****** Object:  Default [DF_InventoryTransferLog_Type]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[InventoryTransferLog] ADD  CONSTRAINT [DF_InventoryTransferLog_Type]  DEFAULT (0) FOR [Type]
GO
/****** Object:  Default [DF_InventoryTransferLog_ReferenceEntryID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[InventoryTransferLog] ADD  CONSTRAINT [DF_InventoryTransferLog_ReferenceEntryID]  DEFAULT (0) FOR [ReferenceEntryID]
GO
/****** Object:  Default [DF_InventoryTransferLog_Cost]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[InventoryTransferLog] ADD  CONSTRAINT [DF_InventoryTransferLog_Cost]  DEFAULT (0) FOR [Cost]
GO
/****** Object:  Default [DF_InventoryTransferLog_BatchNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[InventoryTransferLog] ADD  CONSTRAINT [DF_InventoryTransferLog_BatchNumber]  DEFAULT (0) FOR [BatchNumber]
GO
/****** Object:  Default [DF_inventorytransferlog_NUSSkipUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[InventoryTransferLog] ADD  CONSTRAINT [DF_inventorytransferlog_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
/****** Object:  Default [DF_InventoryTransferLog_NUSSkipPOUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[InventoryTransferLog] ADD  CONSTRAINT [DF_InventoryTransferLog_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
/****** Object:  Default [DF_InventoryOffline_StoreID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[InventoryOffline] ADD  CONSTRAINT [DF_InventoryOffline_StoreID]  DEFAULT (0) FOR [StoreID]
GO
/****** Object:  Default [DF_InventoryOffline_ItemID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[InventoryOffline] ADD  CONSTRAINT [DF_InventoryOffline_ItemID]  DEFAULT (0) FOR [ItemID]
GO
/****** Object:  Default [DF_InventoryOffline_DetailID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[InventoryOffline] ADD  CONSTRAINT [DF_InventoryOffline_DetailID]  DEFAULT (0) FOR [DetailID]
GO
/****** Object:  Default [DF_InventoryOffline_ReasonCodeID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[InventoryOffline] ADD  CONSTRAINT [DF_InventoryOffline_ReasonCodeID]  DEFAULT (0) FOR [ReasonCodeID]
GO
/****** Object:  Default [DF_InventoryOffline_Quantity]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[InventoryOffline] ADD  CONSTRAINT [DF_InventoryOffline_Quantity]  DEFAULT (0) FOR [Quantity]
GO
/****** Object:  Default [DF_InventoryOffline_Comment]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[InventoryOffline] ADD  CONSTRAINT [DF_InventoryOffline_Comment]  DEFAULT ('') FOR [Comment]
GO
/****** Object:  Default [DF_InventoryOffline_PurchaseOrderID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[InventoryOffline] ADD  CONSTRAINT [DF_InventoryOffline_PurchaseOrderID]  DEFAULT (0) FOR [PurchaseOrderID]
GO
/****** Object:  Default [Df_InventoryOffline_Date]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[InventoryOffline] ADD  CONSTRAINT [Df_InventoryOffline_Date]  DEFAULT (getdate()) FOR [Date]
GO
/****** Object:  Default [DF_DropPayout_StoreID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[DropPayout] ADD  CONSTRAINT [DF_DropPayout_StoreID]  DEFAULT (0) FOR [StoreID]
GO
/****** Object:  Default [DF_DropPayout_BatchNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[DropPayout] ADD  CONSTRAINT [DF_DropPayout_BatchNumber]  DEFAULT (0) FOR [BatchNumber]
GO
/****** Object:  Default [DF_DropPayout_Time]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[DropPayout] ADD  CONSTRAINT [DF_DropPayout_Time]  DEFAULT (getdate()) FOR [Time]
GO
/****** Object:  Default [DF_DropPayout_CashierID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[DropPayout] ADD  CONSTRAINT [DF_DropPayout_CashierID]  DEFAULT (0) FOR [CashierID]
GO
/****** Object:  Default [DF_DropPayout_Amount]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[DropPayout] ADD  CONSTRAINT [DF_DropPayout_Amount]  DEFAULT (0) FOR [Amount]
GO
/****** Object:  Default [DF_DropPayout_Comment]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[DropPayout] ADD  CONSTRAINT [DF_DropPayout_Comment]  DEFAULT ('') FOR [Comment]
GO
/****** Object:  Default [DF_DropPayout_Recipient]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[DropPayout] ADD  CONSTRAINT [DF_DropPayout_Recipient]  DEFAULT ('') FOR [Recipient]
GO
/****** Object:  Default [DF_DropPayout_ReasonCodeID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[DropPayout] ADD  CONSTRAINT [DF_DropPayout_ReasonCodeID]  DEFAULT (0) FOR [ReasonCodeID]
GO
/****** Object:  Default [DF_droppayout_NUSSkipUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[DropPayout] ADD  CONSTRAINT [DF_droppayout_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
/****** Object:  Default [DF_DropPayout_NUSSkipPOUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[DropPayout] ADD  CONSTRAINT [DF_DropPayout_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
/****** Object:  Default [DF_DimensionAttribute_NUSSkipPOUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[DimensionAttribute] ADD  CONSTRAINT [DF_DimensionAttribute_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
/****** Object:  Default [DF_Dimension_NUSSkipPOUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Dimension] ADD  CONSTRAINT [DF_Dimension_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
/****** Object:  Default [DF_Department_HQID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Department] ADD  CONSTRAINT [DF_Department_HQID]  DEFAULT (0) FOR [HQID]
GO
/****** Object:  Default [DF_Department_Name]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Department] ADD  CONSTRAINT [DF_Department_Name]  DEFAULT ('') FOR [Name]
GO
/****** Object:  Default [DF_Department_Number]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Department] ADD  CONSTRAINT [DF_Department_Number]  DEFAULT ('') FOR [code]
GO
/****** Object:  Default [DF_department_NUSSkipUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Department] ADD  CONSTRAINT [DF_department_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
/****** Object:  Default [DF_Department_NUSSkipPOUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Department] ADD  CONSTRAINT [DF_Department_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
/****** Object:  Default [DF_Customer_AccountNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_AccountNumber]  DEFAULT ('') FOR [AccountNumber]
GO
/****** Object:  Default [DF_Customer_AccountTypeID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_AccountTypeID]  DEFAULT (1) FOR [AccountTypeID]
GO
/****** Object:  Default [DF_Customer_Address2]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_Address2]  DEFAULT ('') FOR [Address2]
GO
/****** Object:  Default [DF_Customer_AssessFinanceCharges]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_AssessFinanceCharges]  DEFAULT (0) FOR [AssessFinanceCharges]
GO
/****** Object:  Default [DF_Customer_Company]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_Company]  DEFAULT ('') FOR [Company]
GO
/****** Object:  Default [DF_Customer_Country]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_Country]  DEFAULT ('') FOR [Country]
GO
/****** Object:  Default [DF_Customer_CustomNumber1]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_CustomNumber1]  DEFAULT (0) FOR [CustomNumber1]
GO
/****** Object:  Default [DF_Customer_CustomNumber2]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_CustomNumber2]  DEFAULT (0) FOR [CustomNumber2]
GO
/****** Object:  Default [DF_Customer_CustomNumber3]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_CustomNumber3]  DEFAULT (0) FOR [CustomNumber3]
GO
/****** Object:  Default [DF_Customer_CustomNumber4]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_CustomNumber4]  DEFAULT (0) FOR [CustomNumber4]
GO
/****** Object:  Default [DF_Customer_CustomNumber5]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_CustomNumber5]  DEFAULT (0) FOR [CustomNumber5]
GO
/****** Object:  Default [DF_Customer_CustomText1]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_CustomText1]  DEFAULT ('') FOR [CustomText1]
GO
/****** Object:  Default [DF_Customer_CustomText2]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_CustomText2]  DEFAULT ('') FOR [CustomText2]
GO
/****** Object:  Default [DF_Customer_CustomText3]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_CustomText3]  DEFAULT ('') FOR [CustomText3]
GO
/****** Object:  Default [DF_Customer_CustomText4]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_CustomText4]  DEFAULT ('') FOR [CustomText4]
GO
/****** Object:  Default [DF_Customer_CustomText5]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_CustomText5]  DEFAULT ('') FOR [CustomText5]
GO
/****** Object:  Default [DF_Customer_GlobalCustomer]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_GlobalCustomer]  DEFAULT (0) FOR [GlobalCustomer]
GO
/****** Object:  Default [DF_Customer_HQID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_HQID]  DEFAULT (0) FOR [HQID]
GO
/****** Object:  Default [DF_Customer_LastUpdated]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
/****** Object:  Default [DF_Customer_LimitPurchase]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_LimitPurchase]  DEFAULT (0) FOR [LimitPurchase]
GO
/****** Object:  Default [DF_Customer_PreviousBalance]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_PreviousBalance]  DEFAULT (0) FOR [LastClosingBalance]
GO
/****** Object:  Default [DF_Customer_PrimaryShipToID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_PrimaryShipToID]  DEFAULT (0) FOR [PrimaryShipToID]
GO
/****** Object:  Default [DF_Customer_State]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_State]  DEFAULT ('') FOR [State]
GO
/****** Object:  Default [DF_Customer_StoreID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_StoreID]  DEFAULT (0) FOR [StoreID]
GO
/****** Object:  Default [DF_Customer_LayawayCustomer]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_LayawayCustomer]  DEFAULT (0) FOR [LayawayCustomer]
GO
/****** Object:  Default [DF_Customer_Employee]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_Employee]  DEFAULT (0) FOR [Employee]
GO
/****** Object:  Default [DF_Customer_FirstName]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_FirstName]  DEFAULT ('') FOR [FirstName]
GO
/****** Object:  Default [DF_Customer_LastName]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_LastName]  DEFAULT ('') FOR [LastName]
GO
/****** Object:  Default [DF_Customer_Address]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_Address]  DEFAULT ('') FOR [Address]
GO
/****** Object:  Default [DF_Customer_City]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_City]  DEFAULT ('') FOR [City]
GO
/****** Object:  Default [DF_Customer_Zip]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_Zip]  DEFAULT ('') FOR [Zip]
GO
/****** Object:  Default [DF_Customer_Balance]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_Balance]  DEFAULT (0) FOR [AccountBalance]
GO
/****** Object:  Default [DF_Customer_CreditLimit]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_CreditLimit]  DEFAULT (0) FOR [CreditLimit]
GO
/****** Object:  Default [DF_Customer_TotalSales]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_TotalSales]  DEFAULT (0) FOR [TotalSales]
GO
/****** Object:  Default [DF_Customer_AccountOpened]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_AccountOpened]  DEFAULT (getdate()) FOR [AccountOpened]
GO
/****** Object:  Default [DF_Customer_LastVisit]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_LastVisit]  DEFAULT (getdate()) FOR [LastVisit]
GO
/****** Object:  Default [DF_Customer_TotalVisits]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_TotalVisits]  DEFAULT (0) FOR [TotalVisits]
GO
/****** Object:  Default [DF_Customer_TotalSavings]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_TotalSavings]  DEFAULT (0) FOR [TotalSavings]
GO
/****** Object:  Default [DF_Customer_CurrentDiscount]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_CurrentDiscount]  DEFAULT (0) FOR [CurrentDiscount]
GO
/****** Object:  Default [DF_Customer_PriceLevel]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_PriceLevel]  DEFAULT (0) FOR [PriceLevel]
GO
/****** Object:  Default [DF_Customer_TaxExempt]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_TaxExempt]  DEFAULT (0) FOR [TaxExempt]
GO
/****** Object:  Default [DF_Customer_Notes]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_Notes]  DEFAULT ('') FOR [Notes]
GO
/****** Object:  Default [Df_Customer_Title]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [Df_Customer_Title]  DEFAULT ('') FOR [Title]
GO
/****** Object:  Default [DF_Customer_EmailAddress]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_EmailAddress]  DEFAULT ('') FOR [EmailAddress]
GO
/****** Object:  Default [DF_Customer_TaxNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_TaxNumber]  DEFAULT ('') FOR [TaxNumber]
GO
/****** Object:  Default [DF_Customer_PictureName]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_PictureName]  DEFAULT ('') FOR [PictureName]
GO
/****** Object:  Default [DF_Customer_DefaultShippingServiceID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_DefaultShippingServiceID]  DEFAULT (0) FOR [DefaultShippingServiceID]
GO
/****** Object:  Default [Df_Customer_PhoneNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [Df_Customer_PhoneNumber]  DEFAULT ('') FOR [PhoneNumber]
GO
/****** Object:  Default [Df_Customer_FaxNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [Df_Customer_FaxNumber]  DEFAULT ('') FOR [FaxNumber]
GO
/****** Object:  Default [Df_Customer_CashierID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [Df_Customer_CashierID]  DEFAULT (0) FOR [CashierID]
GO
/****** Object:  Default [Df_Customer_SalesRepID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [Df_Customer_SalesRepID]  DEFAULT (0) FOR [SalesRepID]
GO
/****** Object:  Default [DF_customer_NUSSkipUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_customer_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
/****** Object:  Default [DF_Customer_NUSSkipPOUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
/****** Object:  Default [DF_Customer_NUS_AccountTypeName]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_NUS_AccountTypeName]  DEFAULT ('Personal') FOR [NUS_AccountTypeName]
GO
/****** Object:  Default [DF__CustomBut__Style__12CA5E36]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[CustomButtons] ADD  CONSTRAINT [DF__CustomBut__Style__12CA5E36]  DEFAULT (0) FOR [Style]
GO
/****** Object:  Default [DF__CustomButt__HQID__75E27017]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[CustomButtons] ADD  DEFAULT (0) FOR [HQID]
GO
/****** Object:  Default [Df_CustomPosButtons_MaskColor]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[CustomButtons] ADD  CONSTRAINT [Df_CustomPosButtons_MaskColor]  DEFAULT (0) FOR [MaskColor]
GO
/****** Object:  Default [DF_CustomButtons_UseMask]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[CustomButtons] ADD  CONSTRAINT [DF_CustomButtons_UseMask]  DEFAULT (0) FOR [UseMask]
GO
/****** Object:  Default [DF_Currency_HQID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Currency] ADD  CONSTRAINT [DF_Currency_HQID]  DEFAULT (0) FOR [HQID]
GO
/****** Object:  Default [Df_Currency_ExchangeRate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Currency] ADD  CONSTRAINT [Df_Currency_ExchangeRate]  DEFAULT (1) FOR [ExchangeRate]
GO
/****** Object:  Default [DF_Currency_Description]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Currency] ADD  CONSTRAINT [DF_Currency_Description]  DEFAULT ('') FOR [Description]
GO
/****** Object:  Default [DF_Currency_Code]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Currency] ADD  CONSTRAINT [DF_Currency_Code]  DEFAULT ('') FOR [Code]
GO
/****** Object:  Default [DF_Currency_LocaleID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Currency] ADD  CONSTRAINT [DF_Currency_LocaleID]  DEFAULT (0) FOR [LocaleID]
GO
/****** Object:  Default [DF_Currency_NUSSkipPOUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Currency] ADD  CONSTRAINT [DF_Currency_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
/****** Object:  Default [DF_Configuration_AccountDefaultID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [DF_Configuration_AccountDefaultID]  DEFAULT (0) FOR [AccountDefaultID]
GO
/****** Object:  Default [DF_Configuration_AccountMonthlyClosingDay]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [DF_Configuration_AccountMonthlyClosingDay]  DEFAULT (15) FOR [AccountMonthlyClosingDay]
GO
/****** Object:  Default [DF_Configuration_CostUpdateMethod]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [DF_Configuration_CostUpdateMethod]  DEFAULT (0) FOR [CostUpdateMethod]
GO
/****** Object:  Default [DF_Configuration_LastUpdated]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [DF_Configuration_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
/****** Object:  Default [DF_Configuration_LayawayDeposit]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [DF_Configuration_LayawayDeposit]  DEFAULT (0) FOR [LayawayDeposit]
GO
/****** Object:  Default [DF_Configuration_LimitItem]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [DF_Configuration_LimitItem]  DEFAULT (0) FOR [LimitItem]
GO
/****** Object:  Default [DF_Configuration_LimitPurchase]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [DF_Configuration_LimitPurchase]  DEFAULT (0) FOR [LimitPurchase]
GO
/****** Object:  Default [DF_Configuration_LimitTimeFrame]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [DF_Configuration_LimitTimeFrame]  DEFAULT (0) FOR [LimitTimeFrame]
GO
/****** Object:  Default [DF_Configuration_LimitType]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [DF_Configuration_LimitType]  DEFAULT (0) FOR [LimitType]
GO
/****** Object:  Default [DF_Configuration_StoreCountry]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [DF_Configuration_StoreCountry]  DEFAULT ('') FOR [StoreCountry]
GO
/****** Object:  Default [DF_Configuration_StoreID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [DF_Configuration_StoreID]  DEFAULT (0) FOR [StoreID]
GO
/****** Object:  Default [DF_Configuration_StoreState]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [DF_Configuration_StoreState]  DEFAULT ('') FOR [StoreState]
GO
/****** Object:  Default [DF_Configuration_SyncID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [DF_Configuration_SyncID]  DEFAULT (0) FOR [SyncID]
GO
/****** Object:  Default [DF_Configuration_TaxSystem]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [DF_Configuration_TaxSystem]  DEFAULT (1) FOR [TaxSystem]
GO
/****** Object:  Default [DF_Configuration_VATRegistrationNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [DF_Configuration_VATRegistrationNumber]  DEFAULT ('') FOR [VATRegistrationNumber]
GO
/****** Object:  Default [DF_Configuration_StoreName]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [DF_Configuration_StoreName]  DEFAULT ('') FOR [StoreName]
GO
/****** Object:  Default [DF_Configuration_StoreAddress1]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [DF_Configuration_StoreAddress1]  DEFAULT ('') FOR [StoreAddress1]
GO
/****** Object:  Default [DF_Configuration_StoreAddress2]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [DF_Configuration_StoreAddress2]  DEFAULT ('') FOR [StoreAddress2]
GO
/****** Object:  Default [DF_Configuration_StoreCity]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [DF_Configuration_StoreCity]  DEFAULT ('') FOR [StoreCity]
GO
/****** Object:  Default [DF_Configuration_StoreZip]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [DF_Configuration_StoreZip]  DEFAULT ('') FOR [StoreZip]
GO
/****** Object:  Default [DF_Configuration_StorePhone]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [DF_Configuration_StorePhone]  DEFAULT ('') FOR [StorePhone]
GO
/****** Object:  Default [DF_Configuration_StoreFax]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [DF_Configuration_StoreFax]  DEFAULT ('') FOR [StoreFax]
GO
/****** Object:  Default [DF_Configuration_QuoteExpirationDays]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [DF_Configuration_QuoteExpirationDays]  DEFAULT (0) FOR [QuoteExpirationDays]
GO
/****** Object:  Default [DF_Configuration_BackOrderExpirationDays]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [DF_Configuration_BackOrderExpirationDays]  DEFAULT (0) FOR [BackOrderExpirationDays]
GO
/****** Object:  Default [DF_Configuration_LayawayExpirationDays]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [DF_Configuration_LayawayExpirationDays]  DEFAULT (0) FOR [LayawayExpirationDays]
GO
/****** Object:  Default [DF_Configuration_WorkOrderDueDays]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [DF_Configuration_WorkOrderDueDays]  DEFAULT (0) FOR [WorkOrderDueDays]
GO
/****** Object:  Default [DF_Configuration_LayawayFee]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [DF_Configuration_LayawayFee]  DEFAULT (0) FOR [LayawayFee]
GO
/****** Object:  Default [DF_Configuration_ReceiptCount]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [DF_Configuration_ReceiptCount]  DEFAULT (1) FOR [ReceiptCount]
GO
/****** Object:  Default [DF_Configuration_ReceiptCount2]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [DF_Configuration_ReceiptCount2]  DEFAULT (0) FOR [ReceiptCount2]
GO
/****** Object:  Default [DF_Configuration_EDCTimeout]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [DF_Configuration_EDCTimeout]  DEFAULT (120) FOR [EDCTimeout]
GO
/****** Object:  Default [DF_Configuration_WorkOrderDeposit]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [DF_Configuration_WorkOrderDeposit]  DEFAULT (0.1) FOR [WorkOrderDeposit]
GO
/****** Object:  Default [DF_Configuration_PriceCalculationRule]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [DF_Configuration_PriceCalculationRule]  DEFAULT (0) FOR [PriceCalculationRule]
GO
/****** Object:  Default [DF_Configuration_Options]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [DF_Configuration_Options]  DEFAULT (0) FOR [Options]
GO
/****** Object:  Default [DF_Configuration_StoreEmail]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [DF_Configuration_StoreEmail]  DEFAULT ('') FOR [StoreEmail]
GO
/****** Object:  Default [DF_Configuration_TaxBasis]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [DF_Configuration_TaxBasis]  DEFAULT (0) FOR [TaxBasis]
GO
/****** Object:  Default [DF_Configuration_TaxField]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [DF_Configuration_TaxField]  DEFAULT (0) FOR [TaxField]
GO
/****** Object:  Default [DF_Configuration_ItemTaxID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [DF_Configuration_ItemTaxID]  DEFAULT (0) FOR [ItemTaxID]
GO
/****** Object:  Default [DF_Configuration_DefaultTenderID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [DF_Configuration_DefaultTenderID]  DEFAULT (0) FOR [DefaultTenderID]
GO
/****** Object:  Default [DF_Configuration_Options2]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [DF_Configuration_Options2]  DEFAULT (0) FOR [Options2]
GO
/****** Object:  Default [DF_Configuration_VoucherExpirationDays]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [DF_Configuration_VoucherExpirationDays]  DEFAULT (0) FOR [VoucherExpirationDays]
GO
/****** Object:  Default [DF__Configura__Enabl__033C6B35]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Configuration] ADD  DEFAULT (0) FOR [EnableGlobalCustomers]
GO
/****** Object:  Default [DF__Configura__Defau__04308F6E]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Configuration] ADD  DEFAULT (0) FOR [DefaultGlobalCustomer]
GO
/****** Object:  Default [DF_Configuration_VATDetailID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [DF_Configuration_VATDetailID]  DEFAULT ('') FOR [VATDetailID]
GO
/****** Object:  Default [Df_Configuration_Options3]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [Df_Configuration_Options3]  DEFAULT (0) FOR [Options3]
GO
/****** Object:  Default [Df_Configuration_Options4]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [Df_Configuration_Options4]  DEFAULT (0) FOR [Options4]
GO
/****** Object:  Default [DF_Configuration_NextAutoAccountNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [DF_Configuration_NextAutoAccountNumber]  DEFAULT (0) FOR [NextAutoAccountNumber]
GO
/****** Object:  Default [DF_Configuration_AccountingInterface]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [DF_Configuration_AccountingInterface]  DEFAULT (0) FOR [AccountingInterface]
GO
/****** Object:  Default [DF_Configuration_BillPostingAccount]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [DF_Configuration_BillPostingAccount]  DEFAULT ('') FOR [BillPostingAccount]
GO
/****** Object:  Default [DF_Configuration_AccountingFilename]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [DF_Configuration_AccountingFilename]  DEFAULT ('') FOR [AccountingFilename]
GO
/****** Object:  Default [DF_Configuration_AccountingCompany]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [DF_Configuration_AccountingCompany]  DEFAULT ('') FOR [AccountingCompany]
GO
/****** Object:  Default [DF_Configuration_NUSSkipPOUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [DF_Configuration_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
/****** Object:  Default [DF_Check_LookupCode]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Check] ADD  CONSTRAINT [DF_Check_LookupCode]  DEFAULT ('') FOR [LookupCode]
GO
/****** Object:  Default [DF_Check_AccountName]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Check] ADD  CONSTRAINT [DF_Check_AccountName]  DEFAULT ('') FOR [AccountName]
GO
/****** Object:  Default [DF_Check_StatusCode]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Check] ADD  CONSTRAINT [DF_Check_StatusCode]  DEFAULT (0) FOR [StatusCode]
GO
/****** Object:  Default [DF__Check__StoreID__74EE4BDE]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Check] ADD  DEFAULT (0) FOR [StoreID]
GO
/****** Object:  Default [DF_Category_HQID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_HQID]  DEFAULT (0) FOR [HQID]
GO
/****** Object:  Default [DF_Category_DepartmentID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_DepartmentID]  DEFAULT (0) FOR [DepartmentID]
GO
/****** Object:  Default [DF_Category_Name]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_Name]  DEFAULT ('') FOR [Name]
GO
/****** Object:  Default [DF_Category_Code]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_Code]  DEFAULT ('') FOR [Code]
GO
/****** Object:  Default [DF_category_NUSSkipUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_category_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
/****** Object:  Default [DF_Category_NUSSkipPOUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
/****** Object:  Default [DF_Cashier_HQID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Cashier] ADD  CONSTRAINT [DF_Cashier_HQID]  DEFAULT (0) FOR [HQID]
GO
/****** Object:  Default [DF_Cashier_LastUpdated]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Cashier] ADD  CONSTRAINT [DF_Cashier_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
/****** Object:  Default [DF_Cashier_Number]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Cashier] ADD  CONSTRAINT [DF_Cashier_Number]  DEFAULT ('') FOR [Number]
GO
/****** Object:  Default [DF_Cashier_StoreID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Cashier] ADD  CONSTRAINT [DF_Cashier_StoreID]  DEFAULT (0) FOR [StoreID]
GO
/****** Object:  Default [DF_Cashier_Name]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Cashier] ADD  CONSTRAINT [DF_Cashier_Name]  DEFAULT ('') FOR [Name]
GO
/****** Object:  Default [DF_Cashier_Password]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Cashier] ADD  CONSTRAINT [DF_Cashier_Password]  DEFAULT ('') FOR [Password]
GO
/****** Object:  Default [DF_Cashier_FloorLimit]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Cashier] ADD  CONSTRAINT [DF_Cashier_FloorLimit]  DEFAULT (0) FOR [FloorLimit]
GO
/****** Object:  Default [DF_Cashier_ReturnLimit]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Cashier] ADD  CONSTRAINT [DF_Cashier_ReturnLimit]  DEFAULT (0) FOR [ReturnLimit]
GO
/****** Object:  Default [DF_Cashier_CashDrawerNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Cashier] ADD  CONSTRAINT [DF_Cashier_CashDrawerNumber]  DEFAULT (0) FOR [CashDrawerNumber]
GO
/****** Object:  Default [DF_Cashier_SecurityLevel]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Cashier] ADD  CONSTRAINT [DF_Cashier_SecurityLevel]  DEFAULT (0) FOR [SecurityLevel]
GO
/****** Object:  Default [DF_Cashier_Privileges]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Cashier] ADD  CONSTRAINT [DF_Cashier_Privileges]  DEFAULT (0) FOR [Privileges]
GO
/****** Object:  Default [DF_Cashier_EmailAddress]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Cashier] ADD  CONSTRAINT [DF_Cashier_EmailAddress]  DEFAULT ('') FOR [EmailAddress]
GO
/****** Object:  Default [DF_Cashier_FailedLogonAttempts]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Cashier] ADD  CONSTRAINT [DF_Cashier_FailedLogonAttempts]  DEFAULT (0) FOR [FailedLogonAttempts]
GO
/****** Object:  Default [DF_Cashier_MaxOverShortAmount]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Cashier] ADD  CONSTRAINT [DF_Cashier_MaxOverShortAmount]  DEFAULT (0) FOR [MaxOverShortAmount]
GO
/****** Object:  Default [DF_Cashier_MaxOverShortPercent]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Cashier] ADD  CONSTRAINT [DF_Cashier_MaxOverShortPercent]  DEFAULT (0) FOR [MaxOverShortPercent]
GO
/****** Object:  Default [DF_Cashier_OverShortLimitType]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Cashier] ADD  CONSTRAINT [DF_Cashier_OverShortLimitType]  DEFAULT (0) FOR [OverShortLimitType]
GO
/****** Object:  Default [Df_Cashier_Telephone]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Cashier] ADD  CONSTRAINT [Df_Cashier_Telephone]  DEFAULT ('') FOR [Telephone]
GO
/****** Object:  Default [DF_cashier_NUSSkipUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Cashier] ADD  CONSTRAINT [DF_cashier_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
/****** Object:  Default [DF_Cashier_NUSSkipPOUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Cashier] ADD  CONSTRAINT [DF_Cashier_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
/****** Object:  Default [DF_Batch_CustomerDepositMade]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_CustomerDepositMade]  DEFAULT (0) FOR [CustomerDepositMade]
GO
/****** Object:  Default [DF_Batch_CustomerDepositRedeemed]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_CustomerDepositRedeemed]  DEFAULT (0) FOR [CustomerDepositRedeemed]
GO
/****** Object:  Default [DF_Batch_LastUpdated]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
/****** Object:  Default [DF_Batch_StoreID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_StoreID]  DEFAULT (0) FOR [StoreID]
GO
/****** Object:  Default [DF_Batch_Status]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_Status]  DEFAULT (0) FOR [Status]
GO
/****** Object:  Default [DF_Batch_RegisterID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_RegisterID]  DEFAULT (0) FOR [RegisterID]
GO
/****** Object:  Default [DF_Batch_OpeningTime]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_OpeningTime]  DEFAULT (getdate()) FOR [OpeningTime]
GO
/****** Object:  Default [DF_Batch_ClosingTime]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_ClosingTime]  DEFAULT (null) FOR [ClosingTime]
GO
/****** Object:  Default [DF_Batch_OpeningTotal]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_OpeningTotal]  DEFAULT (0) FOR [OpeningTotal]
GO
/****** Object:  Default [DF_Batch_ClosingTotal]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_ClosingTotal]  DEFAULT (0) FOR [ClosingTotal]
GO
/****** Object:  Default [DF_Batch_Sales]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_Sales]  DEFAULT (0) FOR [Sales]
GO
/****** Object:  Default [DF_Batch_Returns]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_Returns]  DEFAULT (0) FOR [Returns]
GO
/****** Object:  Default [DF_Batch_Tax]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_Tax]  DEFAULT (0) FOR [Tax]
GO
/****** Object:  Default [DF_Batch_SalesPlusTax]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_SalesPlusTax]  DEFAULT (0) FOR [SalesPlusTax]
GO
/****** Object:  Default [DF_Batch_Commission]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_Commission]  DEFAULT (0) FOR [Commission]
GO
/****** Object:  Default [DF_Batch_PaidOut]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_PaidOut]  DEFAULT (0) FOR [PaidOut]
GO
/****** Object:  Default [DF_Batch_Dropped]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_Dropped]  DEFAULT (0) FOR [Dropped]
GO
/****** Object:  Default [DF_Batch_PaidOnAccount]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_PaidOnAccount]  DEFAULT (0) FOR [PaidOnAccount]
GO
/****** Object:  Default [DF_Batch_PaidToAccount]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_PaidToAccount]  DEFAULT (0) FOR [PaidToAccount]
GO
/****** Object:  Default [DF_Batch_CustomerCount]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_CustomerCount]  DEFAULT (0) FOR [CustomerCount]
GO
/****** Object:  Default [DF_Batch_NoSalesCount]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_NoSalesCount]  DEFAULT (0) FOR [NoSalesCount]
GO
/****** Object:  Default [DF_Batch_AbortedTransCount]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_AbortedTransCount]  DEFAULT (0) FOR [AbortedTransCount]
GO
/****** Object:  Default [DF_Batch_TotalTendered]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_TotalTendered]  DEFAULT (0) FOR [TotalTendered]
GO
/****** Object:  Default [DF_Batch_TotalChange]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_TotalChange]  DEFAULT (0) FOR [TotalChange]
GO
/****** Object:  Default [DF_Batch_Discounts]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_Discounts]  DEFAULT (0) FOR [Discounts]
GO
/****** Object:  Default [DF_Batch_CostOfGoods]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_CostOfGoods]  DEFAULT (0) FOR [CostOfGoods]
GO
/****** Object:  Default [DF_Batch_LayawayPaid]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_LayawayPaid]  DEFAULT (0) FOR [LayawayPaid]
GO
/****** Object:  Default [DF_Batch_LayawayClosed]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_LayawayClosed]  DEFAULT (0) FOR [LayawayClosed]
GO
/****** Object:  Default [DF_Batch_Shipping]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_Shipping]  DEFAULT (0) FOR [Shipping]
GO
/****** Object:  Default [DF_Batch_TenderRoundingError]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_TenderRoundingError]  DEFAULT (0) FOR [TenderRoundingError]
GO
/****** Object:  Default [DF_Batch_DebitSurcharge]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_DebitSurcharge]  DEFAULT (0) FOR [DebitSurcharge]
GO
/****** Object:  Default [DF_Batch_CashBackSurcharge]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_CashBackSurcharge]  DEFAULT (0) FOR [CashBackSurcharge]
GO
/****** Object:  Default [DF_batch_NUSSkipUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_batch_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
/****** Object:  Default [DF_Batch_NUSSkipPOUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
/****** Object:  Default [DF_Accounting_TableName]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Accounting] ADD  CONSTRAINT [DF_Accounting_TableName]  DEFAULT ('') FOR [TableName]
GO
/****** Object:  Default [DF_Accounting_FieldName]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Accounting] ADD  CONSTRAINT [DF_Accounting_FieldName]  DEFAULT ('') FOR [FieldName]
GO
/****** Object:  Default [DF_Accounting_DetailID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Accounting] ADD  CONSTRAINT [DF_Accounting_DetailID]  DEFAULT (0) FOR [DetailID]
GO
/****** Object:  Default [DF_Accounting_Description]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Accounting] ADD  CONSTRAINT [DF_Accounting_Description]  DEFAULT ('') FOR [Description]
GO
/****** Object:  Default [DF_Accounting_DebitAccount]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Accounting] ADD  CONSTRAINT [DF_Accounting_DebitAccount]  DEFAULT ('') FOR [DebitAccount]
GO
/****** Object:  Default [DF_Accounting_CreditAccount]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Accounting] ADD  CONSTRAINT [DF_Accounting_CreditAccount]  DEFAULT ('') FOR [CreditAccount]
GO
/****** Object:  Default [DF__Accountin__Store__73FA27A5]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Accounting] ADD  DEFAULT (0) FOR [StoreID]
GO
/****** Object:  Default [DF_Accounting_DisplayPosition]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Accounting] ADD  CONSTRAINT [DF_Accounting_DisplayPosition]  DEFAULT (0) FOR [DisplayPosition]
GO
/****** Object:  Default [DF_Alias_ItemID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Alias] ADD  CONSTRAINT [DF_Alias_ItemID]  DEFAULT (0) FOR [ItemID]
GO
/****** Object:  Default [DF_Alias_Alias]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Alias] ADD  CONSTRAINT [DF_Alias_Alias]  DEFAULT ('') FOR [Alias]
GO
/****** Object:  Default [DF_alias_NUSSkipUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Alias] ADD  CONSTRAINT [DF_alias_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
/****** Object:  Default [DF_Alias_NUSSkipPOUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Alias] ADD  CONSTRAINT [DF_Alias_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
/****** Object:  Default [DF_CustomerAccountType_Description]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[AccountType] ADD  CONSTRAINT [DF_CustomerAccountType_Description]  DEFAULT ('') FOR [Description]
GO
/****** Object:  Default [DF_CustomerAccount_DateDueType]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[AccountType] ADD  CONSTRAINT [DF_CustomerAccount_DateDueType]  DEFAULT (1) FOR [DateDueType]
GO
/****** Object:  Default [DF_CustomerAccount_GracePeriod]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[AccountType] ADD  CONSTRAINT [DF_CustomerAccount_GracePeriod]  DEFAULT (0) FOR [GracePeriod]
GO
/****** Object:  Default [DF_CustomerAccount_MinimumFinanceCharge]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[AccountType] ADD  CONSTRAINT [DF_CustomerAccount_MinimumFinanceCharge]  DEFAULT (0) FOR [MinimumFinanceCharge]
GO
/****** Object:  Default [DF_CustomerAccountType_AnnualInterestRate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[AccountType] ADD  CONSTRAINT [DF_CustomerAccountType_AnnualInterestRate]  DEFAULT (0) FOR [AnnualInterestRate]
GO
/****** Object:  Default [DF_CustomerAccountType_ApplyFinanceChargesOnFinanceCharges]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[AccountType] ADD  CONSTRAINT [DF_CustomerAccountType_ApplyFinanceChargesOnFinanceCharges]  DEFAULT (1) FOR [ApplyFinanceChargesOnFinanceCharges]
GO
/****** Object:  Default [DF_CustomerAccountType_MinimumPayment]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[AccountType] ADD  CONSTRAINT [DF_CustomerAccountType_MinimumPayment]  DEFAULT (0) FOR [MinimumPayment]
GO
/****** Object:  Default [DF__AccountTyp__Code__7211DF33]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[AccountType] ADD  DEFAULT ('') FOR [Code]
GO
/****** Object:  Default [DF__AccountTyp__HQID__7306036C]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[AccountType] ADD  DEFAULT (0) FOR [HQID]
GO
/****** Object:  Default [DF_accounttype_NUSSkipUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[AccountType] ADD  CONSTRAINT [DF_accounttype_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
/****** Object:  Default [DF_InvoiceHistory_StoreID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[AccountReceivableHistory] ADD  CONSTRAINT [DF_InvoiceHistory_StoreID]  DEFAULT (0) FOR [StoreID]
GO
/****** Object:  Default [DF_InvoiceHistory_InvoiceID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[AccountReceivableHistory] ADD  CONSTRAINT [DF_InvoiceHistory_InvoiceID]  DEFAULT (0) FOR [AccountReceivableID]
GO
/****** Object:  Default [DF_InvoiceHistory_BatchNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[AccountReceivableHistory] ADD  CONSTRAINT [DF_InvoiceHistory_BatchNumber]  DEFAULT (0) FOR [BatchNumber]
GO
/****** Object:  Default [DF_InvoiceHistory_Amount]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[AccountReceivableHistory] ADD  CONSTRAINT [DF_InvoiceHistory_Amount]  DEFAULT (0) FOR [Amount]
GO
/****** Object:  Default [DF_InvoiceHistory_PaymentID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[AccountReceivableHistory] ADD  CONSTRAINT [DF_InvoiceHistory_PaymentID]  DEFAULT (0) FOR [PaymentID]
GO
/****** Object:  Default [DF_InvoiceHistory_Comment]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[AccountReceivableHistory] ADD  CONSTRAINT [DF_InvoiceHistory_Comment]  DEFAULT ('') FOR [Comment]
GO
/****** Object:  Default [DF_InvoiceHistory_CashierID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[AccountReceivableHistory] ADD  CONSTRAINT [DF_InvoiceHistory_CashierID]  DEFAULT (0) FOR [CashierID]
GO
/****** Object:  Default [DF_InvoiceHistory_Date]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[AccountReceivableHistory] ADD  CONSTRAINT [DF_InvoiceHistory_Date]  DEFAULT (getdate()) FOR [Date]
GO
/****** Object:  Default [Df_AccountReceivableHistory_HistoryType]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[AccountReceivableHistory] ADD  CONSTRAINT [Df_AccountReceivableHistory_HistoryType]  DEFAULT (0) FOR [HistoryType]
GO
/****** Object:  Default [Df_AccountReceivableHistory_TransferArID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[AccountReceivableHistory] ADD  CONSTRAINT [Df_AccountReceivableHistory_TransferArID]  DEFAULT (0) FOR [TransferArID]
GO
/****** Object:  Default [DF_AccountReceivableHistory_ReasonCodeID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[AccountReceivableHistory] ADD  CONSTRAINT [DF_AccountReceivableHistory_ReasonCodeID]  DEFAULT (0) FOR [ReasonCodeID]
GO
/****** Object:  Default [DF__AccountRe__Remot__06A2E7C5]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[AccountReceivableHistory] ADD  DEFAULT (0) FOR [RemoteStoreID]
GO
/****** Object:  Default [DF__AccountRe__Remot__07970BFE]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[AccountReceivableHistory] ADD  DEFAULT (0) FOR [RemotePaymentID]
GO
/****** Object:  Default [DF_accountreceivablehistory_NUSSkipUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[AccountReceivableHistory] ADD  CONSTRAINT [DF_accountreceivablehistory_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
/****** Object:  Default [DF_AccountReceivableHistory_NUSSkipPOUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[AccountReceivableHistory] ADD  CONSTRAINT [DF_AccountReceivableHistory_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
/****** Object:  Default [DF_Invoice_StoreID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[AccountReceivable] ADD  CONSTRAINT [DF_Invoice_StoreID]  DEFAULT (0) FOR [StoreID]
GO
/****** Object:  Default [DF_Invoice_CustomerID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[AccountReceivable] ADD  CONSTRAINT [DF_Invoice_CustomerID]  DEFAULT (0) FOR [CustomerID]
GO
/****** Object:  Default [DF_Invoice_Date]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[AccountReceivable] ADD  CONSTRAINT [DF_Invoice_Date]  DEFAULT (getdate()) FOR [Date]
GO
/****** Object:  Default [DF_Invoice_DueDate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[AccountReceivable] ADD  CONSTRAINT [DF_Invoice_DueDate]  DEFAULT (getdate()) FOR [DueDate]
GO
/****** Object:  Default [DF_Invoice_Balance]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[AccountReceivable] ADD  CONSTRAINT [DF_Invoice_Balance]  DEFAULT (0) FOR [OriginalAmount]
GO
/****** Object:  Default [DF_Invoice_TransactionNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[AccountReceivable] ADD  CONSTRAINT [DF_Invoice_TransactionNumber]  DEFAULT (0) FOR [TransactionNumber]
GO
/****** Object:  Default [DF_Invoice_IsFinanceCharge]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[AccountReceivable] ADD  CONSTRAINT [DF_Invoice_IsFinanceCharge]  DEFAULT (0) FOR [Type]
GO
/****** Object:  Default [DF_Invoice_Balance_1]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[AccountReceivable] ADD  CONSTRAINT [DF_Invoice_Balance_1]  DEFAULT (0) FOR [Balance]
GO
/****** Object:  Default [DF_accountreceivable_NUSSkipUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[AccountReceivable] ADD  CONSTRAINT [DF_accountreceivable_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
/****** Object:  Default [DF_AccountReceivable_NUSSkipPOUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[AccountReceivable] ADD  CONSTRAINT [DF_AccountReceivable_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
/****** Object:  Default [DF_Receipt_Description]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Receipt] ADD  CONSTRAINT [DF_Receipt_Description]  DEFAULT ('') FOR [Description]
GO
/****** Object:  Default [DF_Receipt_Title]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Receipt] ADD  CONSTRAINT [DF_Receipt_Title]  DEFAULT ('') FOR [Title]
GO
/****** Object:  Default [DF_Receipt_Template]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Receipt] ADD  CONSTRAINT [DF_Receipt_Template]  DEFAULT ('') FOR [TemplateCancel]
GO
/****** Object:  Default [DF_Receipt_TemplateDrop]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Receipt] ADD  CONSTRAINT [DF_Receipt_TemplateDrop]  DEFAULT ('') FOR [TemplateDrop]
GO
/****** Object:  Default [DF_Receipt_TemplateLayaway]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Receipt] ADD  CONSTRAINT [DF_Receipt_TemplateLayaway]  DEFAULT ('') FOR [TemplateLayaway]
GO
/****** Object:  Default [DF_Receipt_TemplatePayment]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Receipt] ADD  CONSTRAINT [DF_Receipt_TemplatePayment]  DEFAULT ('') FOR [TemplatePayment]
GO
/****** Object:  Default [DF_Receipt_TemplatePayout]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Receipt] ADD  CONSTRAINT [DF_Receipt_TemplatePayout]  DEFAULT ('') FOR [TemplatePayout]
GO
/****** Object:  Default [DF_Receipt_TemplateQuote]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Receipt] ADD  CONSTRAINT [DF_Receipt_TemplateQuote]  DEFAULT ('') FOR [TemplateQuote]
GO
/****** Object:  Default [DF_Receipt_TemplateSale]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Receipt] ADD  CONSTRAINT [DF_Receipt_TemplateSale]  DEFAULT ('') FOR [TemplateSale]
GO
/****** Object:  Default [DF_Receipt_TemplateWorkOrder]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Receipt] ADD  CONSTRAINT [DF_Receipt_TemplateWorkOrder]  DEFAULT ('') FOR [TemplateWorkOrder]
GO
/****** Object:  Default [DF_Receipt_TemplateReport]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Receipt] ADD  CONSTRAINT [DF_Receipt_TemplateReport]  DEFAULT ('') FOR [TemplateReport]
GO
/****** Object:  Default [DF__Receipt__StoreID__7AA72534]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Receipt] ADD  DEFAULT (0) FOR [StoreID]
GO
/****** Object:  Default [DF_ReasonCode_HQID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ReasonCode] ADD  CONSTRAINT [DF_ReasonCode_HQID]  DEFAULT (0) FOR [HQID]
GO
/****** Object:  Default [DF_ReasonCode_Code]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ReasonCode] ADD  CONSTRAINT [DF_ReasonCode_Code]  DEFAULT ('') FOR [Code]
GO
/****** Object:  Default [DF_ReasonCode_Description]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ReasonCode] ADD  CONSTRAINT [DF_ReasonCode_Description]  DEFAULT ('') FOR [Description]
GO
/****** Object:  Default [DF_ReasonCode_Type]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ReasonCode] ADD  CONSTRAINT [DF_ReasonCode_Type]  DEFAULT (0) FOR [Type]
GO
/****** Object:  Default [DF_reasoncode_NUSSkipUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ReasonCode] ADD  CONSTRAINT [DF_reasoncode_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
/****** Object:  Default [DF_ReasonCode_NUSSkipPOUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[ReasonCode] ADD  CONSTRAINT [DF_ReasonCode_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
/****** Object:  Default [DF_NUS_PO_Script_ScriptNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Script] ADD  CONSTRAINT [DF_NUS_PO_Script_ScriptNumber]  DEFAULT ((0)) FOR [ScriptNumber]
GO
/****** Object:  Default [DF_NUS_PO_Script_DispenseNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Script] ADD  CONSTRAINT [DF_NUS_PO_Script_DispenseNumber]  DEFAULT ((0)) FOR [DispenseNumber]
GO
/****** Object:  Default [DF_NUS_PO_Script_PatientPrice]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Script] ADD  CONSTRAINT [DF_NUS_PO_Script_PatientPrice]  DEFAULT ((0)) FOR [PatientPrice]
GO
/****** Object:  Default [DF_NUS_PO_Script_GstIncluded]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Script] ADD  CONSTRAINT [DF_NUS_PO_Script_GstIncluded]  DEFAULT ((0)) FOR [GstIncluded]
GO
/****** Object:  Default [DF_NUS_PO_Script_DispenseDate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Script] ADD  CONSTRAINT [DF_NUS_PO_Script_DispenseDate]  DEFAULT (getdate()) FOR [DispenseDate]
GO
/****** Object:  Default [DF_NUS_PO_Script_Patient]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Script] ADD  CONSTRAINT [DF_NUS_PO_Script_Patient]  DEFAULT ((0)) FOR [Patient]
GO
/****** Object:  Default [DF_NUS_PO_Script_DrugItem]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Script] ADD  CONSTRAINT [DF_NUS_PO_Script_DrugItem]  DEFAULT ((0)) FOR [DrugItem]
GO
/****** Object:  Default [DF_NUS_PO_Script_Quantity]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Script] ADD  CONSTRAINT [DF_NUS_PO_Script_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
/****** Object:  Default [DF_NUS_PO_Script_Packs]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Script] ADD  CONSTRAINT [DF_NUS_PO_Script_Packs]  DEFAULT ((0)) FOR [Packs]
GO
/****** Object:  Default [DF_NUS_PO_Script_NationalHealthSchemeCode]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Script] ADD  CONSTRAINT [DF_NUS_PO_Script_NationalHealthSchemeCode]  DEFAULT ('') FOR [NationalHealthSchemeCode]
GO
/****** Object:  Default [DF_NUS_PO_Script_ScriptType]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Script] ADD  CONSTRAINT [DF_NUS_PO_Script_ScriptType]  DEFAULT ('') FOR [ScriptType]
GO
/****** Object:  Default [DF_NUS_PO_Script_DrugDescription]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Script] ADD  CONSTRAINT [DF_NUS_PO_Script_DrugDescription]  DEFAULT ('') FOR [DrugDescription]
GO
/****** Object:  Default [DF_NUS_PO_Script_GovernmentRecoveryAmount]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Script] ADD  CONSTRAINT [DF_NUS_PO_Script_GovernmentRecoveryAmount]  DEFAULT ((0)) FOR [GovernmentRecoveryAmount]
GO
/****** Object:  Default [DF_NUS_PO_Script_RegisterId]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Script] ADD  CONSTRAINT [DF_NUS_PO_Script_RegisterId]  DEFAULT ((0)) FOR [RegisterId]
GO
/****** Object:  Default [DF_NUS_PO_Script_SaleActivityEntry]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Script] ADD  CONSTRAINT [DF_NUS_PO_Script_SaleActivityEntry]  DEFAULT ((0)) FOR [SaleActivityEntry]
GO
/****** Object:  Default [DF_NUS_PO_Script_ReturnActivityEntry]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Script] ADD  CONSTRAINT [DF_NUS_PO_Script_ReturnActivityEntry]  DEFAULT ((0)) FOR [ReturnActivityEntry]
GO
/****** Object:  Default [DF_NUS_PO_Script_WorkOrderId]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Script] ADD  CONSTRAINT [DF_NUS_PO_Script_WorkOrderId]  DEFAULT ((0)) FOR [WorkOrderId]
GO
/****** Object:  Default [DF_NUS_PO_Script_ChargeAccount]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Script] ADD  CONSTRAINT [DF_NUS_PO_Script_ChargeAccount]  DEFAULT ((0)) FOR [ChargeAccount]
GO
/****** Object:  Default [DF_NUS_PO_Script_ChargeAmount]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Script] ADD  CONSTRAINT [DF_NUS_PO_Script_ChargeAmount]  DEFAULT ((0)) FOR [ChargeAmount]
GO
/****** Object:  Default [DF_NUS_PO_Script_InstanceCount]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Script] ADD  CONSTRAINT [DF_NUS_PO_Script_InstanceCount]  DEFAULT ((0)) FOR [InstanceCount]
GO
/****** Object:  Default [DF_NUS_PO_Script_Deleted]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Script] ADD  CONSTRAINT [DF_NUS_PO_Script_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
/****** Object:  Default [DF_NUS_PO_Script_Processed]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Script] ADD  CONSTRAINT [DF_NUS_PO_Script_Processed]  DEFAULT ((0)) FOR [Processed]
GO
/****** Object:  Default [DF_NUS_PO_Script_Available]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Script] ADD  CONSTRAINT [DF_NUS_PO_Script_Available]  DEFAULT ((0)) FOR [Available]
GO
/****** Object:  Default [DF_NUS_PO_Script_ActivityAction]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Script] ADD  CONSTRAINT [DF_NUS_PO_Script_ActivityAction]  DEFAULT ((0)) FOR [ActivityAction]
GO
/****** Object:  Default [DF_NUS_PO_Script_PerformStockMovement]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Script] ADD  CONSTRAINT [DF_NUS_PO_Script_PerformStockMovement]  DEFAULT ((0)) FOR [PerformStockMovement]
GO
/****** Object:  Default [DF_NUS_PO_Script_NUSSkipPOUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Script] ADD  CONSTRAINT [DF_NUS_PO_Script_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
/****** Object:  Default [DF__NUS_PO_Sc__Creat__52D92AFC]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Script] ADD  DEFAULT (getdate()) FOR [Created]
GO
/****** Object:  Default [DF_NUS_PO_Patient_PatientNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Patient] ADD  CONSTRAINT [DF_NUS_PO_Patient_PatientNumber]  DEFAULT ('') FOR [PatientNumber]
GO
/****** Object:  Default [DF_NUS_PO_Patient_LastName]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Patient] ADD  CONSTRAINT [DF_NUS_PO_Patient_LastName]  DEFAULT ('') FOR [LastName]
GO
/****** Object:  Default [DF_NUS_PO_Patient_FirstName]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Patient] ADD  CONSTRAINT [DF_NUS_PO_Patient_FirstName]  DEFAULT ('') FOR [FirstName]
GO
/****** Object:  Default [DF_NUS_PO_Patient_Title]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Patient] ADD  CONSTRAINT [DF_NUS_PO_Patient_Title]  DEFAULT ('') FOR [Title]
GO
/****** Object:  Default [DF_NUS_PO_Patient_Address]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Patient] ADD  CONSTRAINT [DF_NUS_PO_Patient_Address]  DEFAULT ('') FOR [Address]
GO
/****** Object:  Default [DF_NUS_PO_Patient_Suburb]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Patient] ADD  CONSTRAINT [DF_NUS_PO_Patient_Suburb]  DEFAULT ('') FOR [Suburb]
GO
/****** Object:  Default [DF_NUS_PO_Patient_PostCode]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Patient] ADD  CONSTRAINT [DF_NUS_PO_Patient_PostCode]  DEFAULT ((0)) FOR [PostCode]
GO
/****** Object:  Default [DF_NUS_PO_Patient_NUSSkipPOUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Patient] ADD  CONSTRAINT [DF_NUS_PO_Patient_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
/****** Object:  Default [NUS_PO_OfferEntry_Offer]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_OfferEntry] ADD  CONSTRAINT [NUS_PO_OfferEntry_Offer]  DEFAULT ((0)) FOR [Offer]
GO
/****** Object:  Default [NUS_PO_OfferEntry_OfferItem]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_OfferEntry] ADD  CONSTRAINT [NUS_PO_OfferEntry_OfferItem]  DEFAULT ((0)) FOR [OfferItem]
GO
/****** Object:  Default [NUS_PO_OfferEntry_BuyDownQuantity]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_OfferEntry] ADD  CONSTRAINT [NUS_PO_OfferEntry_BuyDownQuantity]  DEFAULT ((0)) FOR [BuyDownQuantity]
GO
/****** Object:  Default [NUS_PO_OfferEntry_Cost]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_OfferEntry] ADD  CONSTRAINT [NUS_PO_OfferEntry_Cost]  DEFAULT ((0.0)) FOR [Cost]
GO
/****** Object:  Default [NUS_PO_OfferEntry_IsDiscountItem]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_OfferEntry] ADD  CONSTRAINT [NUS_PO_OfferEntry_IsDiscountItem]  DEFAULT ((0)) FOR [IsDiscountItem]
GO
/****** Object:  Default [NUS_PO_OfferEntry_Price]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_OfferEntry] ADD  CONSTRAINT [NUS_PO_OfferEntry_Price]  DEFAULT ((0.0)) FOR [Price]
GO
/****** Object:  Default [NUS_PO_OfferEntry_IsQualifyingItem]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_OfferEntry] ADD  CONSTRAINT [NUS_PO_OfferEntry_IsQualifyingItem]  DEFAULT ((0)) FOR [IsQualifyingItem]
GO
/****** Object:  Default [DF_NUS_PO_OfferEntry_NUSSkipPOUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_OfferEntry] ADD  CONSTRAINT [DF_NUS_PO_OfferEntry_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
/****** Object:  Default [NUS_PO_Offer_Code]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Offer] ADD  CONSTRAINT [NUS_PO_Offer_Code]  DEFAULT ('') FOR [Code]
GO
/****** Object:  Default [NUS_PO_Offer_Name]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Offer] ADD  CONSTRAINT [NUS_PO_Offer_Name]  DEFAULT ('') FOR [Name]
GO
/****** Object:  Default [NUS_PO_Offer_Description]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Offer] ADD  CONSTRAINT [NUS_PO_Offer_Description]  DEFAULT ('') FOR [Description]
GO
/****** Object:  Default [NUS_PO_Offer_StartDate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Offer] ADD  CONSTRAINT [NUS_PO_Offer_StartDate]  DEFAULT ('1800-01-01 00:00:00') FOR [StartDate]
GO
/****** Object:  Default [NUS_PO_Offer_EndDate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Offer] ADD  CONSTRAINT [NUS_PO_Offer_EndDate]  DEFAULT ('1800-01-01 00:00:00') FOR [EndDate]
GO
/****** Object:  Default [NUS_PO_Offer_Priority]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Offer] ADD  CONSTRAINT [NUS_PO_Offer_Priority]  DEFAULT ((0)) FOR [Priority]
GO
/****** Object:  Default [NUS_PO_Offer_DivideDiscount]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Offer] ADD  CONSTRAINT [NUS_PO_Offer_DivideDiscount]  DEFAULT ((0)) FOR [DivideDiscount]
GO
/****** Object:  Default [NUS_PO_Offer_DollarOffDiscount]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Offer] ADD  CONSTRAINT [NUS_PO_Offer_DollarOffDiscount]  DEFAULT ((0.0)) FOR [DollarOffDiscount]
GO
/****** Object:  Default [NUS_PO_Offer_DollarThreshold]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Offer] ADD  CONSTRAINT [NUS_PO_Offer_DollarThreshold]  DEFAULT ((0.0)) FOR [DollarThreshold]
GO
/****** Object:  Default [NUS_PO_Offer_IsDiscountable]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Offer] ADD  CONSTRAINT [NUS_PO_Offer_IsDiscountable]  DEFAULT ((0)) FOR [IsDiscountable]
GO
/****** Object:  Default [NUS_PO_Offer_IsLoyalty]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Offer] ADD  CONSTRAINT [NUS_PO_Offer_IsLoyalty]  DEFAULT ((0)) FOR [IsLoyalty]
GO
/****** Object:  Default [NUS_PO_Offer_MultiBuyXQuantity]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Offer] ADD  CONSTRAINT [NUS_PO_Offer_MultiBuyXQuantity]  DEFAULT ((0)) FOR [MultiBuyXQuantity]
GO
/****** Object:  Default [NUS_PO_Offer_MultiBuyYDollarAmount]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Offer] ADD  CONSTRAINT [NUS_PO_Offer_MultiBuyYDollarAmount]  DEFAULT ((0.0)) FOR [MultiBuyYDollarAmount]
GO
/****** Object:  Default [NUS_PO_Offer_MultiBuyYQuantity]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Offer] ADD  CONSTRAINT [NUS_PO_Offer_MultiBuyYQuantity]  DEFAULT ((0)) FOR [MultiBuyYQuantity]
GO
/****** Object:  Default [NUS_PO_Offer_MultipleRedemptions]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Offer] ADD  CONSTRAINT [NUS_PO_Offer_MultipleRedemptions]  DEFAULT ((0)) FOR [MultipleRedemptions]
GO
/****** Object:  Default [NUS_PO_Offer_OfferCategory]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Offer] ADD  CONSTRAINT [NUS_PO_Offer_OfferCategory]  DEFAULT ((1)) FOR [OfferCategory]
GO
/****** Object:  Default [NUS_PO_Offer_OfferType]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Offer] ADD  CONSTRAINT [NUS_PO_Offer_OfferType]  DEFAULT ((0)) FOR [OfferType]
GO
/****** Object:  Default [NUS_PO_Offer_PercentOffDiscount]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Offer] ADD  CONSTRAINT [NUS_PO_Offer_PercentOffDiscount]  DEFAULT ((0.0)) FOR [PercentOffDiscount]
GO
/****** Object:  Default [NUS_PO_Offer_QuantityThreshold]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Offer] ADD  CONSTRAINT [NUS_PO_Offer_QuantityThreshold]  DEFAULT ((0)) FOR [QuantityThreshold]
GO
/****** Object:  Default [DF_NUS_PO_Offer_NUSSkipPOUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[NUS_PO_Offer] ADD  CONSTRAINT [DF_NUS_PO_Offer_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
/****** Object:  Default [DF_PhysicalInventory_StoreID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[PhysicalInventory] ADD  CONSTRAINT [DF_PhysicalInventory_StoreID]  DEFAULT (0) FOR [StoreID]
GO
/****** Object:  Default [DF_PhysicalInventory_Status]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[PhysicalInventory] ADD  CONSTRAINT [DF_PhysicalInventory_Status]  DEFAULT (0) FOR [Status]
GO
/****** Object:  Default [DF_PhysicalInventory_Description]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[PhysicalInventory] ADD  CONSTRAINT [DF_PhysicalInventory_Description]  DEFAULT ('') FOR [Description]
GO
/****** Object:  Default [DF_PhysicalInventory_Code]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[PhysicalInventory] ADD  CONSTRAINT [DF_PhysicalInventory_Code]  DEFAULT ('') FOR [Code]
GO
/****** Object:  Default [DF_physicalinventory_NUSSkipUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[PhysicalInventory] ADD  CONSTRAINT [DF_physicalinventory_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
/****** Object:  Default [DF_Exchange_BatchNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Payment] ADD  CONSTRAINT [DF_Exchange_BatchNumber]  DEFAULT (0) FOR [BatchNumber]
GO
/****** Object:  Default [DF_Exchange_CashierID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Payment] ADD  CONSTRAINT [DF_Exchange_CashierID]  DEFAULT (0) FOR [CashierID]
GO
/****** Object:  Default [DF_Exchange_StoreID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Payment] ADD  CONSTRAINT [DF_Exchange_StoreID]  DEFAULT (0) FOR [StoreID]
GO
/****** Object:  Default [DF_Exchange_CustomerID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Payment] ADD  CONSTRAINT [DF_Exchange_CustomerID]  DEFAULT (0) FOR [CustomerID]
GO
/****** Object:  Default [DF_Exchange_Time]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Payment] ADD  CONSTRAINT [DF_Exchange_Time]  DEFAULT (getdate()) FOR [Time]
GO
/****** Object:  Default [DF_Exchange_Amount]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Payment] ADD  CONSTRAINT [DF_Exchange_Amount]  DEFAULT (0) FOR [Amount]
GO
/****** Object:  Default [DF_Exchange_Comment]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Payment] ADD  CONSTRAINT [DF_Exchange_Comment]  DEFAULT ('') FOR [Comment]
GO
/****** Object:  Default [DF_payment_NUSSkipUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Payment] ADD  CONSTRAINT [DF_payment_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
/****** Object:  Default [DF_Payment_NUSSkipPOUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Payment] ADD  CONSTRAINT [DF_Payment_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
/****** Object:  Default [DF_OrderHistory_StoreID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[OrderHistory] ADD  CONSTRAINT [DF_OrderHistory_StoreID]  DEFAULT (0) FOR [StoreID]
GO
/****** Object:  Default [DF_OrderHistory_BatchNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[OrderHistory] ADD  CONSTRAINT [DF_OrderHistory_BatchNumber]  DEFAULT (0) FOR [BatchNumber]
GO
/****** Object:  Default [DF_OrderHistory_Date]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[OrderHistory] ADD  CONSTRAINT [DF_OrderHistory_Date]  DEFAULT (getdate()) FOR [Date]
GO
/****** Object:  Default [DF_OrderHistory_OrderID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[OrderHistory] ADD  CONSTRAINT [DF_OrderHistory_OrderID]  DEFAULT (0) FOR [OrderID]
GO
/****** Object:  Default [DF_OrderHistory_CashierID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[OrderHistory] ADD  CONSTRAINT [DF_OrderHistory_CashierID]  DEFAULT (0) FOR [CashierID]
GO
/****** Object:  Default [DF_OrderHistory_Amount]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[OrderHistory] ADD  CONSTRAINT [DF_OrderHistory_Amount]  DEFAULT (0) FOR [DeltaDeposit]
GO
/****** Object:  Default [DF_OrderHistory_TransactionNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[OrderHistory] ADD  CONSTRAINT [DF_OrderHistory_TransactionNumber]  DEFAULT (0) FOR [TransactionNumber]
GO
/****** Object:  Default [DF_OrderHistory_Comment]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[OrderHistory] ADD  CONSTRAINT [DF_OrderHistory_Comment]  DEFAULT ('') FOR [Comment]
GO
/****** Object:  Default [DF_OrderHistory_NUSSkipPOUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[OrderHistory] ADD  CONSTRAINT [DF_OrderHistory_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
/****** Object:  Default [DF_OrderEntry_Cost]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[OrderEntry] ADD  CONSTRAINT [DF_OrderEntry_Cost]  DEFAULT (0) FOR [Cost]
GO
/****** Object:  Default [DF_OrderEntry_StoreID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[OrderEntry] ADD  CONSTRAINT [DF_OrderEntry_StoreID]  DEFAULT (0) FOR [StoreID]
GO
/****** Object:  Default [DF_OrderEntry_OrderID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[OrderEntry] ADD  CONSTRAINT [DF_OrderEntry_OrderID]  DEFAULT (0) FOR [OrderID]
GO
/****** Object:  Default [DF_OrderEntry_ItemID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[OrderEntry] ADD  CONSTRAINT [DF_OrderEntry_ItemID]  DEFAULT (0) FOR [ItemID]
GO
/****** Object:  Default [DF_OrderEntry_FullPrice]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[OrderEntry] ADD  CONSTRAINT [DF_OrderEntry_FullPrice]  DEFAULT (0) FOR [FullPrice]
GO
/****** Object:  Default [DF_OrderEntry_PriceSource]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[OrderEntry] ADD  CONSTRAINT [DF_OrderEntry_PriceSource]  DEFAULT (1) FOR [PriceSource]
GO
/****** Object:  Default [DF_OrderEntry_Price]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[OrderEntry] ADD  CONSTRAINT [DF_OrderEntry_Price]  DEFAULT (0) FOR [Price]
GO
/****** Object:  Default [DF_OrderEntry_QuantityBackorder]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[OrderEntry] ADD  CONSTRAINT [DF_OrderEntry_QuantityBackorder]  DEFAULT (0) FOR [QuantityOnOrder]
GO
/****** Object:  Default [DF_OrderEntry_SalesRepID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[OrderEntry] ADD  CONSTRAINT [DF_OrderEntry_SalesRepID]  DEFAULT (0) FOR [SalesRepID]
GO
/****** Object:  Default [DF_OrderEntry_Taxable]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[OrderEntry] ADD  CONSTRAINT [DF_OrderEntry_Taxable]  DEFAULT (0) FOR [Taxable]
GO
/****** Object:  Default [DF_OrderEntry_DetailID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[OrderEntry] ADD  CONSTRAINT [DF_OrderEntry_DetailID]  DEFAULT (0) FOR [DetailID]
GO
/****** Object:  Default [DF_OrderEntry_Description]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[OrderEntry] ADD  CONSTRAINT [DF_OrderEntry_Description]  DEFAULT ('') FOR [Description]
GO
/****** Object:  Default [DF_OrderEntry_QuantityRTD]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[OrderEntry] ADD  CONSTRAINT [DF_OrderEntry_QuantityRTD]  DEFAULT (0) FOR [QuantityRTD]
GO
/****** Object:  Default [DF_OrderEntry_LastUpdated]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[OrderEntry] ADD  CONSTRAINT [DF_OrderEntry_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
/****** Object:  Default [DF_OrderEntry_Comment]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[OrderEntry] ADD  CONSTRAINT [DF_OrderEntry_Comment]  DEFAULT ('') FOR [Comment]
GO
/****** Object:  Default [DF_OrderEntry_DiscountReasonCodeID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[OrderEntry] ADD  CONSTRAINT [DF_OrderEntry_DiscountReasonCodeID]  DEFAULT (0) FOR [DiscountReasonCodeID]
GO
/****** Object:  Default [DF_OrderEntry_ReturnReasonCodeID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[OrderEntry] ADD  CONSTRAINT [DF_OrderEntry_ReturnReasonCodeID]  DEFAULT (0) FOR [ReturnReasonCodeID]
GO
/****** Object:  Default [DF_OrderEntry_TaxChangeReasonCodeID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[OrderEntry] ADD  CONSTRAINT [DF_OrderEntry_TaxChangeReasonCodeID]  DEFAULT (0) FOR [TaxChangeReasonCodeID]
GO
/****** Object:  Default [DF_OrderEntry_NUSSkipPOUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[OrderEntry] ADD  CONSTRAINT [DF_OrderEntry_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
/****** Object:  Default [DF_Order_StoreID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_StoreID]  DEFAULT (0) FOR [StoreID]
GO
/****** Object:  Default [DF_Order_Open]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Open]  DEFAULT (1) FOR [Closed]
GO
/****** Object:  Default [DF_Order_Time]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Time]  DEFAULT (getdate()) FOR [Time]
GO
/****** Object:  Default [DF_Order_Type]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Type]  DEFAULT (0) FOR [Type]
GO
/****** Object:  Default [DF_Order_Comment]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Comment]  DEFAULT ('') FOR [Comment]
GO
/****** Object:  Default [DF_Order_CustomerID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_CustomerID]  DEFAULT (0) FOR [CustomerID]
GO
/****** Object:  Default [DF_Order_ShipToID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_ShipToID]  DEFAULT (0) FOR [ShipToID]
GO
/****** Object:  Default [DF_Order_DepositOverride]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_DepositOverride]  DEFAULT (0) FOR [DepositOverride]
GO
/****** Object:  Default [DF_Order_Deposit]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Deposit]  DEFAULT (0) FOR [Deposit]
GO
/****** Object:  Default [DF_Order_Tax]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Tax]  DEFAULT (0) FOR [Tax]
GO
/****** Object:  Default [DF_Order_Total]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Total]  DEFAULT (0) FOR [Total]
GO
/****** Object:  Default [DF_Order_LastUpdated]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
/****** Object:  Default [DF_Order_DueDate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_DueDate]  DEFAULT (getdate()) FOR [ExpirationOrDueDate]
GO
/****** Object:  Default [DF_Order_Taxable]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Taxable]  DEFAULT (1) FOR [Taxable]
GO
/****** Object:  Default [DF_Order_SalesRepID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_SalesRepID]  DEFAULT (0) FOR [SalesRepID]
GO
/****** Object:  Default [DF_Order_PONumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_PONumber]  DEFAULT ('') FOR [ReferenceNumber]
GO
/****** Object:  Default [DF_Order_ShippingCharge]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_ShippingCharge]  DEFAULT (0) FOR [ShippingChargeOnOrder]
GO
/****** Object:  Default [DF_Order_ShippingChargeOverride]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_ShippingChargeOverride]  DEFAULT (0) FOR [ShippingChargeOverride]
GO
/****** Object:  Default [DF_Order_ShippingServiceID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_ShippingServiceID]  DEFAULT (0) FOR [ShippingServiceID]
GO
/****** Object:  Default [DF_Order_ShippingTrackingNumber]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_ShippingTrackingNumber]  DEFAULT ('') FOR [ShippingTrackingNumber]
GO
/****** Object:  Default [DF_Order_ShippingNotes]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_ShippingNotes]  DEFAULT ('') FOR [ShippingNotes]
GO
/****** Object:  Default [DF_Order_ReasonCodeID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_ReasonCodeID]  DEFAULT (0) FOR [ReasonCodeID]
GO
/****** Object:  Default [Df_Order_ExchangeID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [Df_Order_ExchangeID]  DEFAULT (0) FOR [ExchangeID]
GO
/****** Object:  Default [Df_Order_ChannelType]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [Df_Order_ChannelType]  DEFAULT (0) FOR [ChannelType]
GO
/****** Object:  Default [DF_Order_DefaultDiscountReasonCodeID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_DefaultDiscountReasonCodeID]  DEFAULT (0) FOR [DefaultDiscountReasonCodeID]
GO
/****** Object:  Default [DF_Order_DefaultReturnReasonCodeID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_DefaultReturnReasonCodeID]  DEFAULT (0) FOR [DefaultReturnReasonCodeID]
GO
/****** Object:  Default [DF_Order_DefaultTaxChangeReasonCodeID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_DefaultTaxChangeReasonCodeID]  DEFAULT (0) FOR [DefaultTaxChangeReasonCodeID]
GO
/****** Object:  Default [DF_Order_NUSSkipPOUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
/****** Object:  Default [DF_HQMessage_Status]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[HQMessage] ADD  CONSTRAINT [DF_HQMessage_Status]  DEFAULT (0) FOR [Status]
GO
/****** Object:  Default [DF_HQMessage_Title]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[HQMessage] ADD  CONSTRAINT [DF_HQMessage_Title]  DEFAULT ('') FOR [Title]
GO
/****** Object:  Default [DF_HQMessage_Message]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[HQMessage] ADD  CONSTRAINT [DF_HQMessage_Message]  DEFAULT ('') FOR [Message]
GO
/****** Object:  Default [DF_HQMessage_Style]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[HQMessage] ADD  CONSTRAINT [DF_HQMessage_Style]  DEFAULT (0) FOR [Style]
GO
/****** Object:  Default [DF_HQMessage_FromStoreID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[HQMessage] ADD  CONSTRAINT [DF_HQMessage_FromStoreID]  DEFAULT (0) FOR [FromStoreID]
GO
/****** Object:  Default [DF_HQMessage_ToStoreID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[HQMessage] ADD  CONSTRAINT [DF_HQMessage_ToStoreID]  DEFAULT (0) FOR [ToStoreID]
GO
/****** Object:  Default [DF_HQMessage_AttachmentID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[HQMessage] ADD  CONSTRAINT [DF_HQMessage_AttachmentID]  DEFAULT (0) FOR [AttachmentID]
GO
/****** Object:  Default [DF_MatrixAttributeDisplayOrder_ItemClassID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[MatrixAttributeDisplayOrder] ADD  CONSTRAINT [DF_MatrixAttributeDisplayOrder_ItemClassID]  DEFAULT (0) FOR [ItemClassID]
GO
/****** Object:  Default [DF_MatrixAttributeDisplayOrder_Attribute]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[MatrixAttributeDisplayOrder] ADD  CONSTRAINT [DF_MatrixAttributeDisplayOrder_Attribute]  DEFAULT ('') FOR [Attribute]
GO
/****** Object:  Default [DF_MatrixAttributeDisplayOrder_Code]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[MatrixAttributeDisplayOrder] ADD  CONSTRAINT [DF_MatrixAttributeDisplayOrder_Code]  DEFAULT ('') FOR [Code]
GO
/****** Object:  Default [DF_MatrixAttributeDisplayOrder_HQID]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[MatrixAttributeDisplayOrder] ADD  CONSTRAINT [DF_MatrixAttributeDisplayOrder_HQID]  DEFAULT (0) FOR [HQID]
GO
/****** Object:  Default [DF_MatrixAttributeDisplayOrder_NUSSkipPOUpdate]    Script Date: 11/09/2017 15:37:49 ******/
ALTER TABLE [dbo].[MatrixAttributeDisplayOrder] ADD  CONSTRAINT [DF_MatrixAttributeDisplayOrder_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
/****** Object:  Default [DF_QuantityDiscount_Description]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_Description]  DEFAULT ('') FOR [Description]
GO
/****** Object:  Default [DF_QuantityDiscount_HQID]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_HQID]  DEFAULT (0) FOR [HQID]
GO
/****** Object:  Default [DF_QuantityDiscount_DiscountOddItems]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_DiscountOddItems]  DEFAULT (0) FOR [DiscountOddItems]
GO
/****** Object:  Default [DF_QuantityDiscount_Quantity1]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_Quantity1]  DEFAULT (0) FOR [Quantity1]
GO
/****** Object:  Default [DF_QuantityDiscount_Price1]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_Price1]  DEFAULT (0) FOR [Price1]
GO
/****** Object:  Default [DF_QuantityDiscount_Price1A]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_Price1A]  DEFAULT (0) FOR [Price1A]
GO
/****** Object:  Default [DF_QuantityDiscount_Price1B]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_Price1B]  DEFAULT (0) FOR [Price1B]
GO
/****** Object:  Default [DF_QuantityDiscount_Price1C]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_Price1C]  DEFAULT (0) FOR [Price1C]
GO
/****** Object:  Default [DF_QuantityDiscount_Quantity2]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_Quantity2]  DEFAULT (0) FOR [Quantity2]
GO
/****** Object:  Default [DF_QuantityDiscount_Price2]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_Price2]  DEFAULT (0) FOR [Price2]
GO
/****** Object:  Default [DF_QuantityDiscount_Price2A]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_Price2A]  DEFAULT (0) FOR [Price2A]
GO
/****** Object:  Default [DF_QuantityDiscount_Price2B]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_Price2B]  DEFAULT (0) FOR [Price2B]
GO
/****** Object:  Default [DF_QuantityDiscount_Price2C]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_Price2C]  DEFAULT (0) FOR [Price2C]
GO
/****** Object:  Default [DF_QuantityDiscount_Quantity3]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_Quantity3]  DEFAULT (0) FOR [Quantity3]
GO
/****** Object:  Default [DF_QuantityDiscount_Price3]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_Price3]  DEFAULT (0) FOR [Price3]
GO
/****** Object:  Default [DF_QuantityDiscount_Price3A]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_Price3A]  DEFAULT (0) FOR [Price3A]
GO
/****** Object:  Default [DF_QuantityDiscount_Price3B]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_Price3B]  DEFAULT (0) FOR [Price3B]
GO
/****** Object:  Default [DF_QuantityDiscount_Price3C]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_Price3C]  DEFAULT (0) FOR [Price3C]
GO
/****** Object:  Default [DF_QuantityDiscount_Quantity4]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_Quantity4]  DEFAULT (0) FOR [Quantity4]
GO
/****** Object:  Default [DF_QuantityDiscount_Price4]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_Price4]  DEFAULT (0) FOR [Price4]
GO
/****** Object:  Default [DF_QuantityDiscount_Price4A]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_Price4A]  DEFAULT (0) FOR [Price4A]
GO
/****** Object:  Default [DF_QuantityDiscount_Price4B]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_Price4B]  DEFAULT (0) FOR [Price4B]
GO
/****** Object:  Default [DF_QuantityDiscount_Price4C]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_Price4C]  DEFAULT (0) FOR [Price4C]
GO
/****** Object:  Default [DF_QuantityDiscount_Type]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_Type]  DEFAULT (0) FOR [Type]
GO
/****** Object:  Default [DF_QuantityDiscount_PercentOffPrice1]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_PercentOffPrice1]  DEFAULT (0) FOR [PercentOffPrice1]
GO
/****** Object:  Default [DF_QuantityDiscount_PercentOffPrice1A]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_PercentOffPrice1A]  DEFAULT (0) FOR [PercentOffPrice1A]
GO
/****** Object:  Default [DF_QuantityDiscount_PercentOffPrice1B]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_PercentOffPrice1B]  DEFAULT (0) FOR [PercentOffPrice1B]
GO
/****** Object:  Default [DF_QuantityDiscount_PercentOffPrice1C]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_PercentOffPrice1C]  DEFAULT (0) FOR [PercentOffPrice1C]
GO
/****** Object:  Default [DF_QuantityDiscount_PercentOffPrice2]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_PercentOffPrice2]  DEFAULT (0) FOR [PercentOffPrice2]
GO
/****** Object:  Default [DF_QuantityDiscount_PercentOffPrice2A]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_PercentOffPrice2A]  DEFAULT (0) FOR [PercentOffPrice2A]
GO
/****** Object:  Default [DF_QuantityDiscount_PercentOffPrice2B]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_PercentOffPrice2B]  DEFAULT (0) FOR [PercentOffPrice2B]
GO
/****** Object:  Default [DF_QuantityDiscount_PercentOffPrice2C]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_PercentOffPrice2C]  DEFAULT (0) FOR [PercentOffPrice2C]
GO
/****** Object:  Default [DF_QuantityDiscount_PercentOffPrice3]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_PercentOffPrice3]  DEFAULT (0) FOR [PercentOffPrice3]
GO
/****** Object:  Default [DF_QuantityDiscount_PercentOffPrice3A]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_PercentOffPrice3A]  DEFAULT (0) FOR [PercentOffPrice3A]
GO
/****** Object:  Default [DF_QuantityDiscount_PercentOffPrice3B]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_PercentOffPrice3B]  DEFAULT (0) FOR [PercentOffPrice3B]
GO
/****** Object:  Default [DF_QuantityDiscount_PercentOffPrice3C]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_PercentOffPrice3C]  DEFAULT (0) FOR [PercentOffPrice3C]
GO
/****** Object:  Default [DF_QuantityDiscount_PercentOffPrice4]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_PercentOffPrice4]  DEFAULT (0) FOR [PercentOffPrice4]
GO
/****** Object:  Default [DF_QuantityDiscount_PercentOffPricer4A]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_PercentOffPricer4A]  DEFAULT (0) FOR [PercentOffPrice4A]
GO
/****** Object:  Default [DF_QuantityDiscount_PercentOffPrice4B]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_PercentOffPrice4B]  DEFAULT (0) FOR [PercentOffPrice4B]
GO
/****** Object:  Default [DF_QuantityDiscount_PercentOffPrice4C]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_PercentOffPrice4C]  DEFAULT (0) FOR [PercentOffPrice4C]
GO
/****** Object:  Default [DF_quantitydiscount_NUSSkipUpdate]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_quantitydiscount_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
/****** Object:  Default [DF_QuantityDiscount_NUSSkipPOUpdate]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[QuantityDiscount] ADD  CONSTRAINT [DF_QuantityDiscount_NUSSkipPOUpdate]  DEFAULT ((0)) FOR [NUSSkipPOUpdate]
GO
/****** Object:  Default [DF_ItemDetailHistory_StoreID]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[PurchaseOrderEntryDetail] ADD  CONSTRAINT [DF_ItemDetailHistory_StoreID]  DEFAULT (0) FOR [StoreID]
GO
/****** Object:  Default [DF_ItemDetailHistory_PurchaseOrderEntryID]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[PurchaseOrderEntryDetail] ADD  CONSTRAINT [DF_ItemDetailHistory_PurchaseOrderEntryID]  DEFAULT (0) FOR [PurchaseOrderEntryID]
GO
/****** Object:  Default [DF_ItemDetailHistory_Date]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[PurchaseOrderEntryDetail] ADD  CONSTRAINT [DF_ItemDetailHistory_Date]  DEFAULT (getdate()) FOR [Date]
GO
/****** Object:  Default [DF_ItemDetailHistory_HistoryType]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[PurchaseOrderEntryDetail] ADD  CONSTRAINT [DF_ItemDetailHistory_HistoryType]  DEFAULT (0) FOR [Status]
GO
/****** Object:  Default [DF_PurchaseOrderEntryDetail_SerialID]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[PurchaseOrderEntryDetail] ADD  CONSTRAINT [DF_PurchaseOrderEntryDetail_SerialID]  DEFAULT (0) FOR [SerialID]
GO
/****** Object:  Default [DF_PurchaseOrderEntryDetail_SerialNumber1]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[PurchaseOrderEntryDetail] ADD  CONSTRAINT [DF_PurchaseOrderEntryDetail_SerialNumber1]  DEFAULT ('') FOR [SerialNumber1]
GO
/****** Object:  Default [DF_PurchaseOrderEntryDetail_SerialNumber2]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[PurchaseOrderEntryDetail] ADD  CONSTRAINT [DF_PurchaseOrderEntryDetail_SerialNumber2]  DEFAULT ('') FOR [SerialNumber2]
GO
/****** Object:  Default [DF_PurchaseOrderEntryDetail_SerialNumber3]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[PurchaseOrderEntryDetail] ADD  CONSTRAINT [DF_PurchaseOrderEntryDetail_SerialNumber3]  DEFAULT ('') FOR [SerialNumber3]
GO
/****** Object:  Default [DF_PurchaseOrderEntryDetail_InventoryOfflineID]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[PurchaseOrderEntryDetail] ADD  CONSTRAINT [DF_PurchaseOrderEntryDetail_InventoryOfflineID]  DEFAULT (0) FOR [InventoryOfflineID]
GO
/****** Object:  Default [DF_PurchaseOrderEntry_ItemDescription]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[PurchaseOrderEntry] ADD  CONSTRAINT [DF_PurchaseOrderEntry_ItemDescription]  DEFAULT ('') FOR [ItemDescription]
GO
/****** Object:  Default [DF_PurchaseOrderEntry_LastUpdated]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[PurchaseOrderEntry] ADD  CONSTRAINT [DF_PurchaseOrderEntry_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
/****** Object:  Default [DF_PurchaseOrderEntry_QuantityReceivedToDate]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[PurchaseOrderEntry] ADD  CONSTRAINT [DF_PurchaseOrderEntry_QuantityReceivedToDate]  DEFAULT (0) FOR [QuantityReceivedToDate]
GO
/****** Object:  Default [DF_PurchaseOrderEntry_StoreID]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[PurchaseOrderEntry] ADD  CONSTRAINT [DF_PurchaseOrderEntry_StoreID]  DEFAULT (0) FOR [StoreID]
GO
/****** Object:  Default [DF_PurchaseOrderEntry_PurchaseOrderID]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[PurchaseOrderEntry] ADD  CONSTRAINT [DF_PurchaseOrderEntry_PurchaseOrderID]  DEFAULT (0) FOR [PurchaseOrderID]
GO
/****** Object:  Default [DF_PurchaseOrderEntry_QuantityOrdered]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[PurchaseOrderEntry] ADD  CONSTRAINT [DF_PurchaseOrderEntry_QuantityOrdered]  DEFAULT (0) FOR [QuantityOrdered]
GO
/****** Object:  Default [DF_PurchaseOrderEntry_QuantityReceived]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[PurchaseOrderEntry] ADD  CONSTRAINT [DF_PurchaseOrderEntry_QuantityReceived]  DEFAULT (0) FOR [QuantityReceived]
GO
/****** Object:  Default [DF_PurchaseOrderEntry_ItemID]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[PurchaseOrderEntry] ADD  CONSTRAINT [DF_PurchaseOrderEntry_ItemID]  DEFAULT (0) FOR [ItemID]
GO
/****** Object:  Default [Df_PurchaseOrderEntry_OrderNumber]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[PurchaseOrderEntry] ADD  CONSTRAINT [Df_PurchaseOrderEntry_OrderNumber]  DEFAULT ('') FOR [OrderNumber]
GO
/****** Object:  Default [DF_PurchaseOrderEntry_Price]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[PurchaseOrderEntry] ADD  CONSTRAINT [DF_PurchaseOrderEntry_Price]  DEFAULT (0) FOR [Price]
GO
/****** Object:  Default [DF_PurchaseOrderEntry_Tax]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[PurchaseOrderEntry] ADD  CONSTRAINT [DF_PurchaseOrderEntry_Tax]  DEFAULT (0) FOR [TaxRate]
GO
/****** Object:  Default [DF_PurchaseOrderEntry_InventoryOfflineID]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[PurchaseOrderEntry] ADD  CONSTRAINT [DF_PurchaseOrderEntry_InventoryOfflineID]  DEFAULT (0) FOR [InventoryOfflineID]
GO
/****** Object:  Default [DF_purchaseorderentry_NUSSkipUpdate]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[PurchaseOrderEntry] ADD  CONSTRAINT [DF_purchaseorderentry_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
/****** Object:  Default [DF_PurchaseOrder_LastUpdated]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
/****** Object:  Default [DF_PurchaseOrder_POTitle]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_POTitle]  DEFAULT ('') FOR [POTitle]
GO
/****** Object:  Default [DF_PurchaseOrder_POType]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_POType]  DEFAULT (0) FOR [POType]
GO
/****** Object:  Default [DF_PurchaseOrder_StoreID]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_StoreID]  DEFAULT (0) FOR [StoreID]
GO
/****** Object:  Default [DF_PurchaseOrder_WorksheetID]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_WorksheetID]  DEFAULT (0) FOR [WorksheetID]
GO
/****** Object:  Default [DF_PurchaseOrder_PONumber]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_PONumber]  DEFAULT ('') FOR [PONumber]
GO
/****** Object:  Default [DF_PurchaseOrder_Status]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_Status]  DEFAULT (0) FOR [Status]
GO
/****** Object:  Default [DF_PurchaseOrder_DateCreated]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_PurchaseOrder_To]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_To]  DEFAULT ('') FOR [To]
GO
/****** Object:  Default [DF_PurchaseOrder_ShipTo]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_ShipTo]  DEFAULT ('') FOR [ShipTo]
GO
/****** Object:  Default [DF_PurchaseOrder_Requisitioner]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_Requisitioner]  DEFAULT ('') FOR [Requisitioner]
GO
/****** Object:  Default [DF_PurchaseOrder_ShipVia]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_ShipVia]  DEFAULT ('') FOR [ShipVia]
GO
/****** Object:  Default [DF_PurchaseOrder_FOBPoint]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_FOBPoint]  DEFAULT ('') FOR [FOBPoint]
GO
/****** Object:  Default [DF_PurchaseOrder_Terms]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_Terms]  DEFAULT ('') FOR [Terms]
GO
/****** Object:  Default [DF_PurchaseOrder_TaxRate]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_TaxRate]  DEFAULT (0) FOR [TaxRate]
GO
/****** Object:  Default [DF_PurchaseOrder_Shipping]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_Shipping]  DEFAULT (0) FOR [Shipping]
GO
/****** Object:  Default [DF_PurchaseOrder_Freight]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_Freight]  DEFAULT ('') FOR [Freight]
GO
/****** Object:  Default [DF_PurchaseOrder_ConfirmingTo]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_ConfirmingTo]  DEFAULT ('') FOR [ConfirmingTo]
GO
/****** Object:  Default [DF_PurchaseOrder_Remarks]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_Remarks]  DEFAULT ('') FOR [Remarks]
GO
/****** Object:  Default [DF_PurchaseOrder_SupplierID]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_SupplierID]  DEFAULT (0) FOR [SupplierID]
GO
/****** Object:  Default [DF__PurchaseO__Other__7DC51FAF]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF__PurchaseO__Other__7DC51FAF]  DEFAULT (0) FOR [OtherStoreID]
GO
/****** Object:  Default [DF_PurchaseOrder_CurrencyID]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_CurrencyID]  DEFAULT (0) FOR [CurrencyID]
GO
/****** Object:  Default [DF_PurchaseOrder_ExchangeRate]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_ExchangeRate]  DEFAULT (1.0) FOR [ExchangeRate]
GO
/****** Object:  Default [DF__PurchaseO__Other__79B300FB]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[PurchaseOrder] ADD  DEFAULT (0) FOR [OtherPOID]
GO
/****** Object:  Default [DF_PurchaseOrder_InventoryLocation]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_InventoryLocation]  DEFAULT (0) FOR [InventoryLocation]
GO
/****** Object:  Default [Df_PurchaseOrder_IsPlaced]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [Df_PurchaseOrder_IsPlaced]  DEFAULT (0) FOR [IsPlaced]
GO
/****** Object:  Default [DF_PurchaseOrder_BatchNumber]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_BatchNumber]  DEFAULT (0) FOR [BatchNumber]
GO
/****** Object:  Default [DF_purchaseorder_NUSSkipUpdate]    Script Date: 11/09/2017 15:37:51 ******/
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_purchaseorder_NUSSkipUpdate]  DEFAULT ((0)) FOR [NUSSkipUpdate]
GO
