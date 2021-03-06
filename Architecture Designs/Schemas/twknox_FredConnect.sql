USE [master]
GO
/****** Object:  Database [FOC]    Script Date: 11/11/2017 5:43:12 AM ******/
CREATE DATABASE [FOC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FredOfficeConnectors', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.AUTUMNGROUP\MSSQL\DATA\\FOC.mdf' , SIZE = 358144KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FredOfficeConnectors_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.AUTUMNGROUP\MSSQL\DATA\\FOC_0.LDF' , SIZE = 3456KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FOC] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FOC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FOC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FOC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FOC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FOC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FOC] SET ARITHABORT OFF 
GO
ALTER DATABASE [FOC] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FOC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FOC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FOC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FOC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FOC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FOC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FOC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FOC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FOC] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FOC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FOC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FOC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FOC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FOC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FOC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FOC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FOC] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FOC] SET  MULTI_USER 
GO
ALTER DATABASE [FOC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FOC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FOC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FOC] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [FOC] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'FOC', N'ON'
GO
USE [FOC]
GO
/****** Object:  Table [dbo].[AppCat_Alias]    Script Date: 11/11/2017 5:43:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppCat_Alias](
	[ID] [int] NOT NULL,
	[ItemHQID] [int] NOT NULL,
	[Alias] [nvarchar](20) NOT NULL,
	[LastApplied] [datetime] NULL,
	[LastUpdated] [datetime] NOT NULL,
	[LastRemoved] [datetime] NULL,
	[IsFREDDrugCode] [bit] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Index [IDX_ALIAS_ID]    Script Date: 11/11/2017 5:43:12 AM ******/
CREATE CLUSTERED INDEX [IDX_ALIAS_ID] ON [dbo].[AppCat_Alias]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppCat_Category]    Script Date: 11/11/2017 5:43:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppCat_Category](
	[HQID] [int] NOT NULL,
	[DepartmentHQID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[LastApplied] [datetime] NULL,
	[LastUpdated] [datetime] NULL,
	[LastRemoved] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Index [IDX_CATEGORY_HQID]    Script Date: 11/11/2017 5:43:12 AM ******/
CREATE CLUSTERED INDEX [IDX_CATEGORY_HQID] ON [dbo].[AppCat_Category]
(
	[HQID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppCat_Department]    Script Date: 11/11/2017 5:43:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppCat_Department](
	[HQID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[LastApplied] [datetime] NULL,
	[LastUpdated] [datetime] NULL,
	[LastRemoved] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Index [IDX_DEPARTMENT_HQID]    Script Date: 11/11/2017 5:43:12 AM ******/
CREATE CLUSTERED INDEX [IDX_DEPARTMENT_HQID] ON [dbo].[AppCat_Department]
(
	[HQID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppCat_Ignore]    Script Date: 11/11/2017 5:43:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AppCat_Ignore](
	[HQID1] [int] NOT NULL,
	[HQID2] [int] NOT NULL,
	[ObjectType] [varchar](50) NOT NULL,
	[Field] [varchar](50) NOT NULL,
	[Ignore] [bit] NOT NULL CONSTRAINT [DF_AppCat_Supplier_Ignore]  DEFAULT ((1)),
 CONSTRAINT [PK_AppCat_Ignore] PRIMARY KEY CLUSTERED 
(
	[HQID1] ASC,
	[HQID2] ASC,
	[ObjectType] ASC,
	[Field] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AppCat_Item]    Script Date: 11/11/2017 5:43:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AppCat_Item](
	[HQID] [int] NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[LastApplied] [datetime] NULL,
	[LastUpdated] [datetime] NULL,
	[LastRemoved] [datetime] NULL,
	[DepartmentHQID] [int] NULL,
	[CategoryHQID] [int] NULL,
	[ItemnotDiscountable] [bit] NOT NULL,
	[Schedule] [nvarchar](3) NULL,
	[Sales_TAX] [float] NULL,
	[GST_TAX] [char](1) NULL,
	[ManufacturerHQID] [int] NULL,
	[imagedata] [image] NULL,
	[consumerdescription] [nvarchar](500) NULL,
	[imagetype] [nvarchar](100) NULL,
	[imagesize] [int] NULL,
	[imagename] [nvarchar](255) NULL,
	[ausregnumber] [nvarchar](50) NULL,
	[freddrugcode] [nvarchar](10) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [IDX_ITEM_HQID]    Script Date: 11/11/2017 5:43:12 AM ******/
CREATE CLUSTERED INDEX [IDX_ITEM_HQID] ON [dbo].[AppCat_Item]
(
	[HQID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppCat_Supplier]    Script Date: 11/11/2017 5:43:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AppCat_Supplier](
	[HQID] [int] NOT NULL,
	[Name] [nvarchar](100) NULL,
	[State] [nvarchar](20) NULL,
	[LastApplied] [datetime] NULL,
	[LastUpdated] [datetime] NULL,
	[LastRemoved] [datetime] NULL,
	[ContactName] [nvarchar](50) NULL,
	[Address1] [nvarchar](30) NULL,
	[Address2] [nvarchar](30) NULL,
	[Suburb] [nvarchar](50) NULL,
	[Postcode] [nvarchar](10) NULL,
	[PhoneNumber] [nvarchar](15) NULL,
	[FaxNumber] [nvarchar](15) NULL,
	[EmailAddress] [nvarchar](200) NULL,
	[WebAddress] [nvarchar](200) NULL,
	[Type] [char](1) NOT NULL,
	[ProxySupplierHQID] [int] NULL,
	[PriceDescription1] [nvarchar](50) NULL,
	[PriceDescription2] [nvarchar](50) NULL,
	[PriceDescription3] [nvarchar](50) NULL,
	[PriceDescription4] [nvarchar](50) NULL,
	[PriceDescription5] [nvarchar](50) NULL,
	[PriceDescription6] [nvarchar](50) NULL,
	[PriceDescription7] [nvarchar](50) NULL,
	[PriceDescription8] [nvarchar](50) NULL,
	[PriceDescription9] [nvarchar](50) NULL,
	[PriceDescription10] [nvarchar](50) NULL,
	[PriceIncGST1] [bit] NULL,
	[PriceIncGST2] [bit] NULL,
	[PriceIncGST3] [bit] NULL,
	[PriceIncGST4] [bit] NULL,
	[PriceIncGST5] [bit] NULL,
	[PriceIncGST6] [bit] NULL,
	[PriceIncGST7] [bit] NULL,
	[PriceIncGST8] [bit] NULL,
	[PriceIncGST9] [bit] NULL,
	[PriceIncGST10] [bit] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [IDX_SUPPLIER_HQID]    Script Date: 11/11/2017 5:43:12 AM ******/
CREATE CLUSTERED INDEX [IDX_SUPPLIER_HQID] ON [dbo].[AppCat_Supplier]
(
	[HQID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppCat_SupplierList]    Script Date: 11/11/2017 5:43:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AppCat_SupplierList](
	[ID] [int] NOT NULL,
	[ItemHQID] [int] NOT NULL,
	[SupplierHQID] [int] NOT NULL,
	[LastApplied] [datetime] NULL,
	[LastUpdated] [datetime] NULL,
	[LastRemoved] [datetime] NULL,
	[ReorderNumber] [nvarchar](20) NOT NULL,
	[Replacement_ItemHQID] [int] NULL,
	[Description] [nvarchar](100) NULL,
	[Price1] [money] NULL,
	[Price2] [money] NULL,
	[Price3] [money] NULL,
	[Price4] [money] NULL,
	[Price5] [money] NULL,
	[Price6] [money] NULL,
	[Price7] [money] NULL,
	[Price8] [money] NULL,
	[Price9] [money] NULL,
	[Price10] [money] NULL,
	[PriceQuantity1] [float] NULL,
	[PriceQuantity2] [float] NULL,
	[PriceQuantity3] [float] NULL,
	[PriceQuantity4] [float] NULL,
	[PriceQuantity5] [float] NULL,
	[PriceQuantity6] [float] NULL,
	[PriceQuantity7] [float] NULL,
	[PriceQuantity8] [float] NULL,
	[PriceQuantity9] [float] NULL,
	[PriceQuantity10] [float] NULL,
	[PackSize] [float] NULL,
	[Sales_TAX] [float] NULL,
	[GST_TAX] [char](1) NULL,
	[Indicative_RetailPrice] [money] NULL,
	[OutofStock] [char](2) NULL,
	[DepartmentHQID] [int] NULL,
	[CategoryHQID] [int] NULL,
	[AlternativeDescription] [nvarchar](100) NULL,
	[ManufacturerHQID] [int] NULL,
	[MSP] [float] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [IDX_SUPPLIERITEM_ID]    Script Date: 11/11/2017 5:43:12 AM ******/
CREATE CLUSTERED INDEX [IDX_SUPPLIERITEM_ID] ON [dbo].[AppCat_SupplierList]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WiniFredChanges]    Script Date: 11/11/2017 5:43:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WiniFredChanges](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[xmldata] [text] NOT NULL,
 CONSTRAINT [PK_WiniFredChanges] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IDX_ALIAS]    Script Date: 11/11/2017 5:43:12 AM ******/
CREATE NONCLUSTERED INDEX [IDX_ALIAS] ON [dbo].[AppCat_Alias]
(
	[Alias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_ALIAS_HQID]    Script Date: 11/11/2017 5:43:12 AM ******/
CREATE NONCLUSTERED INDEX [IDX_ALIAS_HQID] ON [dbo].[AppCat_Alias]
(
	[ItemHQID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_SUPPLIERITEM_ITEM]    Script Date: 11/11/2017 5:43:12 AM ******/
CREATE NONCLUSTERED INDEX [IDX_SUPPLIERITEM_ITEM] ON [dbo].[AppCat_SupplierList]
(
	[ItemHQID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_SUPPLIERITEM_ITEMSUPPLIER]    Script Date: 11/11/2017 5:43:12 AM ******/
CREATE NONCLUSTERED INDEX [IDX_SUPPLIERITEM_ITEMSUPPLIER] ON [dbo].[AppCat_SupplierList]
(
	[ItemHQID] ASC,
	[SupplierHQID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_SUPPLIERITEM_SUPPLIER]    Script Date: 11/11/2017 5:43:12 AM ******/
CREATE NONCLUSTERED INDEX [IDX_SUPPLIERITEM_SUPPLIER] ON [dbo].[AppCat_SupplierList]
(
	[SupplierHQID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[WiniFredChanges] ADD  CONSTRAINT [DF_WiniFredChanges_xmldata]  DEFAULT ('') FOR [xmldata]
GO
USE [master]
GO
ALTER DATABASE [FOC] SET  READ_WRITE 
GO
