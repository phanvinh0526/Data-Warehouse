USE [master]
GO
/****** Object:  Database [STAGING_LOTS]    Script Date: 9/14/2017 3:27:06 AM ******/
CREATE DATABASE [STAGING_LOTS]
GO
ALTER DATABASE [STAGING_LOTS] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [STAGING_LOTS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [STAGING_LOTS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [STAGING_LOTS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [STAGING_LOTS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [STAGING_LOTS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [STAGING_LOTS] SET ARITHABORT OFF 
GO
ALTER DATABASE [STAGING_LOTS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [STAGING_LOTS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [STAGING_LOTS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [STAGING_LOTS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [STAGING_LOTS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [STAGING_LOTS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [STAGING_LOTS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [STAGING_LOTS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [STAGING_LOTS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [STAGING_LOTS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [STAGING_LOTS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [STAGING_LOTS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [STAGING_LOTS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [STAGING_LOTS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [STAGING_LOTS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [STAGING_LOTS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [STAGING_LOTS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [STAGING_LOTS] SET RECOVERY FULL 
GO
ALTER DATABASE [STAGING_LOTS] SET  MULTI_USER 
GO
ALTER DATABASE [STAGING_LOTS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [STAGING_LOTS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [STAGING_LOTS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [STAGING_LOTS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [STAGING_LOTS] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'STAGING_LOTS', N'ON'
GO
USE [STAGING_LOTS]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 9/14/2017 3:27:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentID] [int] NOT NULL,
	[DeptName] [nvarchar](50) NULL,
	[DeptNumber] [int] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Location] [int] NOT NULL,
	[UploadDate] [datetime] NOT NULL,
 CONSTRAINT [Department$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[External_Department]    Script Date: 9/14/2017 3:27:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[External_Department](
	[USI] [int] NOT NULL,
	[DeptID] [nvarchar](4) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UploadDate] [datetime] NOT NULL,
	[Location] [int] NOT NULL,
 CONSTRAINT [External_Department$Index_E7CE83A9_18A9_46E7] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[External_SubDepartment]    Script Date: 9/14/2017 3:27:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[External_SubDepartment](
	[Ext_SubDeptID] [int] NOT NULL,
	[USI] [int] NULL,
	[SubDeptID] [nvarchar](4) NOT NULL,
	[DeptID] [nvarchar](4) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[LotsProductGroupRef] [int] NULL,
	[CheckoutSubDeptRef] [int] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UploadDate] [datetime] NOT NULL,
	[Location] [int] NOT NULL,
 CONSTRAINT [External_SubDepartment$pk_External_SubDepartment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[History]    Script Date: 9/14/2017 3:27:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History](
	[StockID] [int] NOT NULL,
	[Month] [datetime2](0) NOT NULL,
	[QtySold] [real] NULL,
	[ValueSold] [int] NULL,
	[TotalTax] [int] NULL,
	[TotalCost] [int] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UploadDate] [datetime] NOT NULL,
	[Location] [int] NOT NULL,
 CONSTRAINT [History$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IncomingStock]    Script Date: 9/14/2017 3:27:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IncomingStock](
	[IncomingStockID] [int] IDENTITY(1,1) NOT NULL,
	[StockID] [int] NULL,
	[OrderID] [int] NULL,
	[Description] [nvarchar](50) NULL,
	[TotalCost] [int] NULL,
	[TotalGSTPaid] [int] NULL,
	[TransactionDate] [datetime2](0) NULL,
	[SupplierID] [int] NULL,
	[SupplierName] [nvarchar](50) NULL,
	[RefNumber] [nvarchar](20) NULL,
 CONSTRAINT [IncomingStock$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[IncomingStockID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderInvoice]    Script Date: 9/14/2017 3:27:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderInvoice](
	[InvoiceID] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceNumber] [nvarchar](30) NULL,
	[SupplierID] [int] NULL,
	[CreateDate] [datetime2](0) NULL,
	[StaffID] [int] NULL,
	[Complete] [smallint] NULL,
	[EndofDayID] [int] NULL,
 CONSTRAINT [OrderInvoice$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderInvoiceItems]    Script Date: 9/14/2017 3:27:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderInvoiceItems](
	[InvoiceItemID] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceID] [int] NULL,
	[OrderID] [int] NULL,
	[StockID] [int] NULL,
	[PartcodeId] [int] NULL,
	[QtyInv] [int] NULL,
	[ListCost] [int] NULL,
	[RealCost] [int] NULL,
	[Retail] [int] NULL,
	[Delivered] [smallint] NULL,
	[Tote] [nvarchar](20) NULL,
	[Description] [nvarchar](50) NULL,
	[PDE] [nvarchar](20) NULL,
	[Transferred] [smallint] NULL,
	[PackSize] [int] NOT NULL,
	[OuterSize] [int] NOT NULL,
	[GSTPaid] [int] NULL,
	[SubTotal] [int] NULL,
 CONSTRAINT [OrderInvoiceItems$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[InvoiceItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 9/14/2017 3:27:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[OrderItemId] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[StockID] [int] NULL,
	[PartcodeId] [int] NULL,
	[Quantity] [int] NULL,
	[PackSize] [int] NOT NULL,
	[OuterSize] [int] NOT NULL,
	[Comment] [nvarchar](50) NULL,
	[PDE] [nvarchar](20) NULL,
	[InvoiceItemID] [int] NULL,
 CONSTRAINT [OrderItems$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[OrderItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 9/14/2017 3:27:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderTime] [datetime2](0) NULL,
	[StaffName] [nvarchar](50) NULL,
	[Direct] [smallint] NULL,
	[SupplierID] [int] NULL,
	[OrderPeriod] [int] NULL,
	[Ordered] [smallint] NULL,
	[Delivered] [smallint] NULL,
	[OrderValue] [int] NULL,
	[Acknowledged] [smallint] NULL,
	[LinkedOrder] [smallint] NULL,
	[SupplierDetails] [int] NULL,
	[TotalGSTPaid] [int] NULL,
	[Replacement] [smallint] NULL,
 CONSTRAINT [Orders$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Partcode]    Script Date: 9/14/2017 3:27:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partcode](
	[PartCodeID] [int] NOT NULL,
	[StockID] [int] NOT NULL,
	[SupplierID] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[PartCode] [nvarchar](20) NULL,
	[Manufacturer] [smallint] NULL,
	[Preferred] [smallint] NULL,
	[OuterSize] [int] NOT NULL,
	[PackSize] [int] NOT NULL,
	[MinOrderQty] [int] NOT NULL,
	[OrderMultiple] [int] NOT NULL,
	[UpdatedDate] [datetime2](0) NOT NULL,
	[CreatedDate] [datetime2](0) NOT NULL,
	[Discontinued] [smallint] NULL,
	[SupplierMinOrder] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UploadDate] [datetime] NOT NULL,
	[Location] [int] NOT NULL,
 CONSTRAINT [Partcode$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Person]    Script Date: 9/14/2017 3:27:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Person](
	[PersonID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](35) NULL,
	[TitleID] [int] NULL,
	[Address] [nvarchar](200) NULL,
	[Suburb] [nvarchar](200) NULL,
	[City] [nvarchar](200) NULL,
	[PostCode] [nvarchar](15) NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[BirthDate] [datetime2](0) NULL,
	[Comment] [nvarchar](50) NULL,
	[PatientCommentID] [int] NULL,
	[FamilyID] [int] NULL,
	[CategoryID] [int] NULL,
	[EntitlementC] [nvarchar](20) NULL,
	[EntitlementR] [nvarchar](20) NULL,
	[EntitlementSEV] [nvarchar](20) NULL,
	[CardExpiryDate] [datetime2](0) NULL,
	[ExternalExemptDate] [datetime2](0) NULL,
	[ExternalSNet] [int] NULL,
	[ExtSNetDate] [datetime2](0) NULL,
	[ExternalSNetValue] [int] NULL,
	[ExtSNetValueDate] [datetime2](0) NULL,
	[MedicareNo] [nvarchar](20) NULL,
	[HFMembership] [nvarchar](40) NULL,
	[AccountID] [int] NULL,
	[CreditLimit] [int] NULL,
	[PrescriptionsOnAC] [smallint] NULL,
	[ShopItemsOnAC] [smallint] NULL,
	[StopCredit] [smallint] NULL,
	[MessagePOS] [nvarchar](255) NULL,
	[PrescriptionDiscount] [real] NULL,
	[ShopItemsDiscount] [real] NULL,
	[AccountClassID] [int] NULL,
	[AutoChargeScripts] [smallint] NULL,
	[HospitalCategory] [nvarchar](1) NULL,
	[PrescriptionDiscountPrivate] [real] NULL,
	[Gender] [nvarchar](1) NULL,
	[Height] [smallint] NULL,
	[Weight] [smallint] NULL,
	[RoomNumber] [nvarchar](20) NULL,
	[HealthInfoID] [int] NULL,
	[DefaultDoctor] [int] NULL,
	[Image] [varbinary](max) NULL,
	[ABNNumber] [nvarchar](50) NULL,
	[EndConsumer] [smallint] NULL,
	[MedicareExpiryDate] [nvarchar](10) NULL,
	[DiscountLevelID] [int] NULL,
	[MailingID] [int] NULL,
	[MemberCode] [nvarchar](20) NULL,
	[MessageText] [nvarchar](100) NULL,
	[MedicareName] [nvarchar](50) NULL,
	[MedicareSurname] [nvarchar](50) NULL,
	[InvMedicare] [smallint] NULL,
	[VACardID] [float] NULL,
	[MainFamilyID] [int] NULL,
	[MedicareConsent] [smallint] NULL,
	[DVAConsent] [smallint] NULL,
	[SFPatientID] [nvarchar](20) NULL,
	[CompensationNo] [nvarchar](50) NULL,
	[PrintCompensationNo] [smallint] NULL,
	[RelationshipCode] [nvarchar](2) NULL,
	[ExcludePromoMail] [smallint] NULL,
	[Email] [nvarchar](50) NULL,
	[PromptCharge] [smallint] NULL,
	[HeadOfficeID] [int] NULL,
	[MemberStatus] [nvarchar](50) NULL,
	[InstitutionID] [int] NULL,
	[IsControlAccount] [smallint] NULL,
	[IsSubAccount] [smallint] NULL,
	[WebstercareLabel] [smallint] NULL,
	[DontSendEScript] [smallint] NULL,
	[CTG] [smallint] NULL,
	[EmailStatements] [smallint] NULL,
	[CopayDiscRuleID] [int] NULL,
	[IsBrandSubNotPermitted] [smallint] NULL,
	[DateAdded] [datetime] NULL,
 CONSTRAINT [Person$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PostCodes]    Script Date: 9/14/2017 3:27:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostCodes](
	[PostCodeID] [int] IDENTITY(1,1) NOT NULL,
	[PostCode] [nvarchar](15) NULL,
	[Suburb/State] [nvarchar](40) NULL,
 CONSTRAINT [PostCodes$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[PostCodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PriceParsed]    Script Date: 9/14/2017 3:27:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PriceParsed](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](1) NULL,
	[StockID] [int] NULL,
	[PLU] [nvarchar](20) NULL,
	[Description] [nvarchar](50) NULL,
	[OldList] [int] NULL,
	[NewList] [int] NULL,
	[MarkUp] [int] NULL,
	[OldRetail] [int] NULL,
	[NewRetail] [int] NULL,
	[RecRetail] [int] NULL,
	[GST] [nvarchar](30) NULL,
	[outersize] [int] NULL,
	[ordersize] [int] NULL,
	[RealCost] [int] NULL,
	[Processed] [smallint] NULL,
	[barcode] [nvarchar](20) NULL,
	[Agency] [nvarchar](20) NULL,
	[ProdGrpID] [int] NULL,
	[WSaleID] [int] NULL,
	[Selected] [smallint] NULL,
	[UPI] [int] NULL,
	[OldGP] [int] NULL,
	[NewGP] [int] NULL,
 CONSTRAINT [PriceParsed$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductGroup]    Script Date: 9/14/2017 3:27:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductGroup](
	[ProductGroupID] [int] NOT NULL,
	[ProductGroupName] [nvarchar](60) NULL,
	[GST] [money] NULL,
	[RegularDiscount] [money] NULL,
	[ExtraDiscount] [money] NULL,
	[Intensive] [smallint] NULL,
	[DepartmentID] [int] NULL,
	[SubDeptNumber] [int] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UploadDate] [datetime] NOT NULL,
	[Location] [int] NOT NULL,
 CONSTRAINT [ProductGroup$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SaleItem]    Script Date: 9/14/2017 3:27:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaleItem](
	[SaleItemID] [int] NOT NULL,
	[SaleID] [int] NULL,
	[StockID] [int] NULL,
	[ScriptID] [int] NULL,
	[Description] [nvarchar](50) NULL,
	[Cost] [int] NULL,
	[Retail] [int] NULL,
	[Quantity] [real] NULL,
	[Tax] [real] NULL,
	[Discount] [real] NULL,
	[PersonID] [int] NULL,
	[SpecialItemType] [int] NULL,
	[AgencyID] [int] NULL,
	[QtyOrdered] [real] NULL,
	[ScriptLinkID] [int] NULL,
	[GSTPaid] [int] NULL,
	[MemberSale] [smallint] NULL,
	[DollarDiscount] [int] NULL,
	[AutoSpecialID] [int] NULL,
	[OriginalRetail] [int] NULL,
	[DateAdded] [datetime2](0) NULL,
	[RemovedFromLayby] [smallint] NULL,
	[DeliveryNoteID] [int] NULL,
	[GSTPayable] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UploadDate] [datetime] NOT NULL,
	[Location] [int] NOT NULL,
 CONSTRAINT [SaleItem$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalePayment]    Script Date: 9/14/2017 3:27:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalePayment](
	[SalePaymentID] [int] NOT NULL,
	[SaleID] [int] NULL,
	[Type] [int] NULL,
	[Value] [int] NULL,
	[StatementID] [int] NULL,
	[AccountID] [int] NULL,
	[InvoiceID] [int] NULL,
	[CardTypeID] [int] NULL,
	[FrozenBalance] [int] NULL,
	[AgencyPay] [smallint] NULL,
	[LaybyPayment] [smallint] NULL,
	[Comment] [nvarchar](255) NULL,
	[LaybyPaymentDate] [datetime2](0) NULL,
	[LaybyEndDayID] [int] NULL,
	[LaybyStaffID] [int] NULL,
	[LaybyUnitID] [int] NULL,
	[HOAccountID] [int] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UploadDate] [datetime] NOT NULL,
	[Location] [int] NOT NULL,
 CONSTRAINT [SalePayment$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sales]    Script Date: 9/14/2017 3:27:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales](
	[SaleID] [int] NOT NULL,
	[StaffID] [int] NULL,
	[TimeDate] [datetime2](0) NULL,
	[UnitID] [int] NULL,
	[Finished] [smallint] NULL,
	[Abandoned] [smallint] NULL,
	[EndDayID] [int] NULL,
	[SaleType] [smallint] NULL,
	[LaybyStatus] [int] NULL,
	[LaybyFinishDate] [datetime2](0) NULL,
	[LaybyPersonID] [int] NULL,
	[LoyaltyCard] [nvarchar](20) NULL,
	[LaybyID] [int] NULL,
	[HOTranID] [int] NULL,
	[OriginalInvoiceDate] [datetime2](0) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UploadDate] [datetime] NOT NULL,
	[Location] [int] NOT NULL,
 CONSTRAINT [Sales$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ScriptLink]    Script Date: 9/14/2017 3:27:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScriptLink](
	[ScriptLinkID] [int] NOT NULL,
	[ScriptNumber] [nvarchar](10) NULL,
	[ScriptType] [nvarchar](1) NULL,
	[SaleID] [int] NULL,
	[PDE] [nvarchar](15) NULL,
	[Description] [nvarchar](50) NULL,
	[Quantity] [real] NULL,
	[PatientPrice] [int] NULL,
	[NHSPrice] [int] NULL,
	[FirstName] [nvarchar](30) NULL,
	[LastName] [nvarchar](30) NULL,
	[PatientAddress] [nvarchar](60) NULL,
	[AccountNo] [int] NULL,
	[PatientNumber] [int] NULL,
	[DirectDebit] [smallint] NULL,
	[PersonID] [int] NULL,
	[StockID] [int] NULL,
	[DateTimeTransferred] [datetime2](0) NULL,
	[GSTAmount] [int] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UploadDate] [datetime] NOT NULL,
	[Location] [int] NOT NULL,
 CONSTRAINT [ScriptLink$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Staff]    Script Date: 9/14/2017 3:27:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[StaffID] [int] NOT NULL,
	[StaffInitial] [nvarchar](30) NULL,
	[StaffName] [nvarchar](20) NULL,
	[StaffNum] [nvarchar](50) NULL,
	[PassWord] [nvarchar](20) NULL,
	[WagesID] [real] NULL,
	[AllowPOS] [smallint] NULL,
	[AllowDisp] [smallint] NULL,
	[AllowOrders] [smallint] NULL,
	[AllowReports] [smallint] NULL,
	[AllowTools] [smallint] NULL,
	[AllowOptions] [smallint] NULL,
	[AllowSalesAbandon] [smallint] NULL,
	[AllowSalesOpenDrawer] [smallint] NULL,
	[AllowSalesPayOuts] [smallint] NULL,
	[AllowTempPriceFix] [smallint] NULL,
	[AllowPermPriceFix] [smallint] NULL,
	[AllowSalesReturns] [smallint] NULL,
	[AllowStockCards] [smallint] NULL,
	[AllowSalesDiscount] [smallint] NULL,
	[StaffManager] [smallint] NULL,
	[SecurityLevelID] [int] NULL,
	[InactiveStaff] [smallint] NULL,
	[AHPRA] [nvarchar](15) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UploadDate] [datetime] NOT NULL,
	[Location] [int] NOT NULL,
 CONSTRAINT [Staff$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[State]    Script Date: 9/14/2017 3:27:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[StateNumber] [smallint] NOT NULL,
	[StateName] [nvarchar](5) NOT NULL,
 CONSTRAINT [State$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[StateNumber] ASC,
	[StateName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Statement]    Script Date: 9/14/2017 3:27:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statement](
	[StatementID] [int] NOT NULL,
	[ClosingDate] [datetime2](0) NULL,
	[ClosingBalance] [int] NULL,
	[AccountID] [int] NULL,
	[TotalSales] [int] NULL,
	[Class] [int] NULL,
	[InstitutionID] [int] NULL,
	[RoomNumber] [nvarchar](10) NULL,
 CONSTRAINT [Statement$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[StatementID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stock]    Script Date: 9/14/2017 3:27:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[StockID] [int] NOT NULL,
	[TradeName] [nvarchar](40) NOT NULL,
	[ProductGroupID] [int] NULL,
	[ProductClassID] [int] NULL,
	[ClubID] [int] NULL,
	[PackSize] [real] NULL,
	[OuterSize] [real] NULL,
	[OrderSize] [smallint] NULL,
	[ExtraInfo] [nvarchar](25) NULL,
	[Expected] [real] NULL,
	[SOH] [real] NULL,
	[MinimumSOH] [int] NULL,
	[MTD] [real] NULL,
	[SOO] [real] NULL,
	[ValueMTD] [int] NULL,
	[Retail] [int] NULL,
	[AverageRetail] [int] NULL,
	[Cost] [int] NULL,
	[RealCost] [int] NULL,
	[AverageCost] [int] NULL,
	[Fillup] [smallint] NULL,
	[OrderVariance] [smallint] NULL,
	[MonthsAccurate] [smallint] NULL,
	[Date] [datetime2](0) NULL,
	[DateCreated] [datetime2](0) NULL,
	[POSLookup] [smallint] NULL,
	[Beep] [smallint] NULL,
	[Reorder] [smallint] NULL,
	[ReorderAfterDate] [datetime2](0) NULL,
	[Labels] [smallint] NULL,
	[Priced] [smallint] NULL,
	[AskPrice] [smallint] NULL,
	[Label] [nvarchar](40) NULL,
	[Message] [nvarchar](255) NULL,
	[ListCost] [int] NULL,
	[Markup] [int] NULL,
	[PLU] [nvarchar](10) NULL,
	[HotKey] [smallint] NULL,
	[NoDiscount] [smallint] NULL,
	[stockUpdateid] [int] NULL,
	[PreferredSupplierId] [int] NULL,
	[Brand] [nvarchar](2) NULL,
	[Manufacturer] [int] NULL,
	[Seasonal] [smallint] NULL,
	[Shelflabel] [smallint] NULL,
	[StockDescription] [nvarchar](80) NULL,
	[RecommendedRetail] [int] NULL,
	[GSTGroupID] [int] NULL,
	[GSTTypeID] [int] NULL,
	[SalesTax] [real] NULL,
	[RetailAfterGST] [int] NULL,
	[Update] [smallint] NULL,
	[StockDiscount] [nvarchar](20) NULL,
	[NoFurtherDiscount] [smallint] NULL,
	[OnlyOrdNegSOH] [smallint] NULL,
	[LastOrderDate] [datetime2](0) NULL,
	[comments] [nvarchar](255) NULL,
	[Discontinued] [smallint] NULL,
	[HeadOfficeID] [int] NULL,
	[UPI] [int] NULL,
	[MinOrdQty] [int] NULL,
	[SmallLabelOption] [smallint] NULL,
	[ImageName] [nvarchar](50) NULL,
	[Robot] [smallint] NULL,
	[ExcludeCustomerDisplay] [smallint] NULL,
	[NettIntoStore] [int] NULL,
	[NegotiatedCost] [int] NULL,
	[MaximumSOH] [int] NULL,
	[OrderCategory] [smallint] NULL,
	[LastCountDate] [datetime2](0) NULL,
	[RobotStoreInFridge] [smallint] NULL,
	[NoShelfLabels] [int] NULL,
	[SOLayby] [real] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UploadDate] [datetime] NOT NULL,
	[Location] [int] NOT NULL,
 CONSTRAINT [Stock$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StockAdjustment]    Script Date: 9/14/2017 3:27:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockAdjustment](
	[StockAdjID] [int] IDENTITY(1,1) NOT NULL,
	[StaffID] [int] NULL,
	[ReasonID] [int] NULL,
	[ReasonText] [nvarchar](50) NULL,
	[SOHBeforeAdj] [real] NULL,
	[SOHAfterAdj] [real] NULL,
	[StockID] [int] NULL,
	[RealCost] [int] NULL,
	[DateCreated] [datetime2](0) NULL,
 CONSTRAINT [StockAdjustment$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[StockAdjID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 9/14/2017 3:27:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[SupplierID] [int] NOT NULL,
	[SupplierName] [nvarchar](25) NULL,
	[Address] [nvarchar](25) NULL,
	[City] [nvarchar](25) NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[FaxNumber] [nvarchar](20) NULL,
	[LastOrder] [datetime2](0) NULL,
	[PurchaseValue] [int] NULL,
	[Brand] [nvarchar](2) NULL,
	[DirectOnly] [smallint] NULL,
	[HeaderCode] [nvarchar](50) NULL,
	[ModemPhoneNumber] [nvarchar](50) NULL,
	[ModemOrderFile] [nvarchar](50) NULL,
	[AccountNumber] [nvarchar](50) NULL,
	[OrderType] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[SessionCode] [nvarchar](50) NULL,
	[Header] [nvarchar](50) NULL,
	[Trailer] [nvarchar](50) NULL,
	[ComPort] [nvarchar](5) NULL,
	[InitString] [nvarchar](50) NULL,
	[Parity] [nvarchar](1) NULL,
	[DataBits] [int] NULL,
	[StopBits] [int] NULL,
	[BaudRate] [int] NULL,
	[HangupString] [nvarchar](50) NULL,
	[Message] [nvarchar](50) NULL,
	[DialingPrefix] [nvarchar](50) NULL,
	[ModemReplyFile] [nvarchar](50) NULL,
	[ModemReplyWait] [int] NULL,
	[CostIncludeGST] [smallint] NULL,
	[IgnoreOuters] [smallint] NULL,
	[ExcludeRealUpdate] [smallint] NULL,
	[ListUpdateOption] [int] NULL,
	[UseBarcodes] [smallint] NULL,
	[UniqueSupID] [int] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UploadDate] [datetime] NOT NULL,
	[Location] [int] NOT NULL,
 CONSTRAINT [Supplier$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SupplierDetails]    Script Date: 9/14/2017 3:27:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplierDetails](
	[SupplierDetailsID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierID] [int] NULL,
	[SupplierDetailName] [nvarchar](50) NULL,
	[HeaderCode] [nvarchar](50) NULL,
	[ModemPhoneNumber] [nvarchar](50) NULL,
	[ModemOrderFile] [nvarchar](50) NULL,
	[AccountNumber] [nvarchar](50) NULL,
	[OrderType] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[SessionCode] [nvarchar](50) NULL,
	[Header] [nvarchar](50) NULL,
	[Trailer] [nvarchar](50) NULL,
	[ComPort] [nvarchar](5) NULL,
	[InitString] [nvarchar](50) NULL,
	[Parity] [nvarchar](1) NULL,
	[DataBits] [int] NULL,
	[StopBits] [int] NULL,
	[BaudRate] [int] NULL,
	[HangupString] [nvarchar](50) NULL,
	[Message] [nvarchar](50) NULL,
	[DialingPrefix] [nvarchar](50) NULL,
	[ModemReplyFile] [nvarchar](50) NULL,
	[ModemReplyWait] [int] NULL,
 CONSTRAINT [SupplierDetails$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[SupplierDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[History] ADD  CONSTRAINT [DF__History__StockID__164452B1]  DEFAULT ((0)) FOR [StockID]
GO
ALTER TABLE [dbo].[History] ADD  CONSTRAINT [DF__History__QtySold__173876EA]  DEFAULT ((0)) FOR [QtySold]
GO
ALTER TABLE [dbo].[History] ADD  CONSTRAINT [DF__History__ValueSo__182C9B23]  DEFAULT ((0)) FOR [ValueSold]
GO
ALTER TABLE [dbo].[History] ADD  CONSTRAINT [DF__History__TotalTa__1920BF5C]  DEFAULT ((0)) FOR [TotalTax]
GO
ALTER TABLE [dbo].[History] ADD  CONSTRAINT [DF__History__TotalCo__1A14E395]  DEFAULT ((0)) FOR [TotalCost]
GO
ALTER TABLE [dbo].[IncomingStock] ADD  DEFAULT ((0)) FOR [StockID]
GO
ALTER TABLE [dbo].[IncomingStock] ADD  DEFAULT ((0)) FOR [OrderID]
GO
ALTER TABLE [dbo].[IncomingStock] ADD  DEFAULT ((0)) FOR [TotalCost]
GO
ALTER TABLE [dbo].[IncomingStock] ADD  DEFAULT ((0)) FOR [TotalGSTPaid]
GO
ALTER TABLE [dbo].[IncomingStock] ADD  DEFAULT ((0)) FOR [SupplierID]
GO
ALTER TABLE [dbo].[OrderInvoice] ADD  DEFAULT ((0)) FOR [Complete]
GO
ALTER TABLE [dbo].[OrderInvoice] ADD  DEFAULT ((0)) FOR [EndofDayID]
GO
ALTER TABLE [dbo].[OrderInvoiceItems] ADD  DEFAULT ((0)) FOR [PartcodeId]
GO
ALTER TABLE [dbo].[OrderInvoiceItems] ADD  DEFAULT ((0)) FOR [Delivered]
GO
ALTER TABLE [dbo].[OrderInvoiceItems] ADD  DEFAULT ((0)) FOR [Transferred]
GO
ALTER TABLE [dbo].[OrderInvoiceItems] ADD  DEFAULT ((1)) FOR [PackSize]
GO
ALTER TABLE [dbo].[OrderInvoiceItems] ADD  DEFAULT ((1)) FOR [OuterSize]
GO
ALTER TABLE [dbo].[OrderInvoiceItems] ADD  DEFAULT ((0)) FOR [GSTPaid]
GO
ALTER TABLE [dbo].[OrderInvoiceItems] ADD  DEFAULT ((0)) FOR [SubTotal]
GO
ALTER TABLE [dbo].[OrderItems] ADD  DEFAULT ((0)) FOR [OrderID]
GO
ALTER TABLE [dbo].[OrderItems] ADD  DEFAULT ((0)) FOR [StockID]
GO
ALTER TABLE [dbo].[OrderItems] ADD  DEFAULT ((0)) FOR [PartcodeId]
GO
ALTER TABLE [dbo].[OrderItems] ADD  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[OrderItems] ADD  DEFAULT ((1)) FOR [PackSize]
GO
ALTER TABLE [dbo].[OrderItems] ADD  DEFAULT ((1)) FOR [OuterSize]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0)) FOR [Direct]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0)) FOR [SupplierID]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0)) FOR [OrderPeriod]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0)) FOR [Ordered]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0)) FOR [Delivered]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0)) FOR [OrderValue]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0)) FOR [Acknowledged]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0)) FOR [LinkedOrder]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0)) FOR [SupplierDetails]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0)) FOR [TotalGSTPaid]
GO
ALTER TABLE [dbo].[Partcode] ADD  CONSTRAINT [DF__Partcode__StockI__4316F928]  DEFAULT ((0)) FOR [StockID]
GO
ALTER TABLE [dbo].[Partcode] ADD  CONSTRAINT [DF__Partcode__Suppli__440B1D61]  DEFAULT ((0)) FOR [SupplierID]
GO
ALTER TABLE [dbo].[Partcode] ADD  CONSTRAINT [DF__Partcode__Name__44FF419A]  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[Partcode] ADD  CONSTRAINT [DF__Partcode__Manufa__45F365D3]  DEFAULT ((0)) FOR [Manufacturer]
GO
ALTER TABLE [dbo].[Partcode] ADD  CONSTRAINT [DF__Partcode__Prefer__46E78A0C]  DEFAULT ((0)) FOR [Preferred]
GO
ALTER TABLE [dbo].[Partcode] ADD  CONSTRAINT [DF__Partcode__OuterS__47DBAE45]  DEFAULT ((1)) FOR [OuterSize]
GO
ALTER TABLE [dbo].[Partcode] ADD  CONSTRAINT [DF__Partcode__PackSi__48CFD27E]  DEFAULT ((1)) FOR [PackSize]
GO
ALTER TABLE [dbo].[Partcode] ADD  CONSTRAINT [DF__Partcode__MinOrd__49C3F6B7]  DEFAULT ((1)) FOR [MinOrderQty]
GO
ALTER TABLE [dbo].[Partcode] ADD  CONSTRAINT [DF__Partcode__OrderM__4AB81AF0]  DEFAULT ((1)) FOR [OrderMultiple]
GO
ALTER TABLE [dbo].[Partcode] ADD  CONSTRAINT [DF__Partcode__Update__4BAC3F29]  DEFAULT (getdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[Partcode] ADD  CONSTRAINT [DF__Partcode__Create__4CA06362]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Partcode] ADD  CONSTRAINT [DF__Partcode__Discon__4D94879B]  DEFAULT ((0)) FOR [Discontinued]
GO
ALTER TABLE [dbo].[Partcode] ADD  CONSTRAINT [DF__Partcode__Suppli__4E88ABD4]  DEFAULT ((1)) FOR [SupplierMinOrder]
GO
ALTER TABLE [dbo].[Person] ADD  DEFAULT ((0)) FOR [TitleID]
GO
ALTER TABLE [dbo].[Person] ADD  DEFAULT ((0)) FOR [PatientCommentID]
GO
ALTER TABLE [dbo].[Person] ADD  DEFAULT ((0)) FOR [FamilyID]
GO
ALTER TABLE [dbo].[Person] ADD  DEFAULT ((0)) FOR [CategoryID]
GO
ALTER TABLE [dbo].[Person] ADD  DEFAULT ((0)) FOR [ExternalSNet]
GO
ALTER TABLE [dbo].[Person] ADD  DEFAULT ((0)) FOR [ExternalSNetValue]
GO
ALTER TABLE [dbo].[Person] ADD  DEFAULT ((0)) FOR [AccountID]
GO
ALTER TABLE [dbo].[Person] ADD  DEFAULT ((0)) FOR [CreditLimit]
GO
ALTER TABLE [dbo].[Person] ADD  DEFAULT ((-1)) FOR [PrescriptionsOnAC]
GO
ALTER TABLE [dbo].[Person] ADD  DEFAULT ((0)) FOR [ShopItemsOnAC]
GO
ALTER TABLE [dbo].[Person] ADD  DEFAULT ((0)) FOR [StopCredit]
GO
ALTER TABLE [dbo].[Person] ADD  DEFAULT ((0)) FOR [PrescriptionDiscount]
GO
ALTER TABLE [dbo].[Person] ADD  DEFAULT ((0)) FOR [ShopItemsDiscount]
GO
ALTER TABLE [dbo].[Person] ADD  DEFAULT ((0)) FOR [AccountClassID]
GO
ALTER TABLE [dbo].[Person] ADD  DEFAULT ((0)) FOR [AutoChargeScripts]
GO
ALTER TABLE [dbo].[Person] ADD  DEFAULT ((0)) FOR [PrescriptionDiscountPrivate]
GO
ALTER TABLE [dbo].[Person] ADD  DEFAULT ((0)) FOR [Height]
GO
ALTER TABLE [dbo].[Person] ADD  DEFAULT ((0)) FOR [Weight]
GO
ALTER TABLE [dbo].[Person] ADD  DEFAULT ((0)) FOR [HealthInfoID]
GO
ALTER TABLE [dbo].[Person] ADD  DEFAULT ((0)) FOR [DefaultDoctor]
GO
ALTER TABLE [dbo].[Person] ADD  DEFAULT ((0)) FOR [EndConsumer]
GO
ALTER TABLE [dbo].[Person] ADD  DEFAULT ((0)) FOR [DiscountLevelID]
GO
ALTER TABLE [dbo].[Person] ADD  DEFAULT ((0)) FOR [MailingID]
GO
ALTER TABLE [dbo].[Person] ADD  DEFAULT ((0)) FOR [InvMedicare]
GO
ALTER TABLE [dbo].[Person] ADD  DEFAULT ((0)) FOR [MainFamilyID]
GO
ALTER TABLE [dbo].[Person] ADD  DEFAULT ((0)) FOR [MedicareConsent]
GO
ALTER TABLE [dbo].[Person] ADD  DEFAULT ((0)) FOR [DVAConsent]
GO
ALTER TABLE [dbo].[Person] ADD  DEFAULT ((0)) FOR [PrintCompensationNo]
GO
ALTER TABLE [dbo].[Person] ADD  DEFAULT ((0)) FOR [ExcludePromoMail]
GO
ALTER TABLE [dbo].[Person] ADD  DEFAULT ((0)) FOR [PromptCharge]
GO
ALTER TABLE [dbo].[Person] ADD  DEFAULT ((0)) FOR [HeadOfficeID]
GO
ALTER TABLE [dbo].[Person] ADD  DEFAULT ('') FOR [MemberStatus]
GO
ALTER TABLE [dbo].[Person] ADD  DEFAULT ((0)) FOR [InstitutionID]
GO
ALTER TABLE [dbo].[Person] ADD  DEFAULT ((0)) FOR [IsControlAccount]
GO
ALTER TABLE [dbo].[Person] ADD  DEFAULT ((0)) FOR [IsSubAccount]
GO
ALTER TABLE [dbo].[Person] ADD  DEFAULT ((0)) FOR [WebstercareLabel]
GO
ALTER TABLE [dbo].[Person] ADD  DEFAULT ((0)) FOR [DontSendEScript]
GO
ALTER TABLE [dbo].[Person] ADD  DEFAULT ((0)) FOR [CTG]
GO
ALTER TABLE [dbo].[Person] ADD  DEFAULT ((0)) FOR [EmailStatements]
GO
ALTER TABLE [dbo].[Person] ADD  DEFAULT ((0)) FOR [IsBrandSubNotPermitted]
GO
ALTER TABLE [dbo].[Person] ADD  CONSTRAINT [DF_Person_DateAdded]  DEFAULT (getdate()) FOR [DateAdded]
GO
ALTER TABLE [dbo].[PriceParsed] ADD  DEFAULT ((0)) FOR [StockID]
GO
ALTER TABLE [dbo].[PriceParsed] ADD  DEFAULT ((0)) FOR [OldList]
GO
ALTER TABLE [dbo].[PriceParsed] ADD  DEFAULT ((0)) FOR [NewList]
GO
ALTER TABLE [dbo].[PriceParsed] ADD  DEFAULT ((0)) FOR [MarkUp]
GO
ALTER TABLE [dbo].[PriceParsed] ADD  DEFAULT ((0)) FOR [OldRetail]
GO
ALTER TABLE [dbo].[PriceParsed] ADD  DEFAULT ((0)) FOR [NewRetail]
GO
ALTER TABLE [dbo].[PriceParsed] ADD  DEFAULT ((0)) FOR [RecRetail]
GO
ALTER TABLE [dbo].[PriceParsed] ADD  DEFAULT ((0)) FOR [outersize]
GO
ALTER TABLE [dbo].[PriceParsed] ADD  DEFAULT ((0)) FOR [ordersize]
GO
ALTER TABLE [dbo].[PriceParsed] ADD  DEFAULT ((0)) FOR [RealCost]
GO
ALTER TABLE [dbo].[PriceParsed] ADD  DEFAULT ((0)) FOR [Processed]
GO
ALTER TABLE [dbo].[PriceParsed] ADD  DEFAULT ((0)) FOR [ProdGrpID]
GO
ALTER TABLE [dbo].[PriceParsed] ADD  DEFAULT ((0)) FOR [WSaleID]
GO
ALTER TABLE [dbo].[PriceParsed] ADD  DEFAULT ((0)) FOR [Selected]
GO
ALTER TABLE [dbo].[PriceParsed] ADD  DEFAULT ((0)) FOR [UPI]
GO
ALTER TABLE [dbo].[PriceParsed] ADD  DEFAULT ((0)) FOR [OldGP]
GO
ALTER TABLE [dbo].[PriceParsed] ADD  DEFAULT ((0)) FOR [NewGP]
GO
ALTER TABLE [dbo].[ProductGroup] ADD  CONSTRAINT [DF__ProductGr__Regul__0E6E26BF]  DEFAULT ((0)) FOR [RegularDiscount]
GO
ALTER TABLE [dbo].[ProductGroup] ADD  CONSTRAINT [DF__ProductGr__Extra__0F624AF8]  DEFAULT ((0)) FOR [ExtraDiscount]
GO
ALTER TABLE [dbo].[ProductGroup] ADD  CONSTRAINT [DF__ProductGr__Inten__10566F31]  DEFAULT ((0)) FOR [Intensive]
GO
ALTER TABLE [dbo].[SaleItem] ADD  CONSTRAINT [DF__SaleItem__SaleID__1332DBDC]  DEFAULT ((0)) FOR [SaleID]
GO
ALTER TABLE [dbo].[SaleItem] ADD  CONSTRAINT [DF__SaleItem__StockI__14270015]  DEFAULT ((0)) FOR [StockID]
GO
ALTER TABLE [dbo].[SaleItem] ADD  CONSTRAINT [DF__SaleItem__Script__151B244E]  DEFAULT ((0)) FOR [ScriptID]
GO
ALTER TABLE [dbo].[SaleItem] ADD  CONSTRAINT [DF__SaleItem__Cost__160F4887]  DEFAULT ((0)) FOR [Cost]
GO
ALTER TABLE [dbo].[SaleItem] ADD  CONSTRAINT [DF__SaleItem__Retail__17036CC0]  DEFAULT ((0)) FOR [Retail]
GO
ALTER TABLE [dbo].[SaleItem] ADD  CONSTRAINT [DF__SaleItem__Quanti__17F790F9]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[SaleItem] ADD  CONSTRAINT [DF__SaleItem__Tax__18EBB532]  DEFAULT ((0)) FOR [Tax]
GO
ALTER TABLE [dbo].[SaleItem] ADD  CONSTRAINT [DF__SaleItem__Discou__19DFD96B]  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[SaleItem] ADD  CONSTRAINT [DF__SaleItem__Person__1AD3FDA4]  DEFAULT ((0)) FOR [PersonID]
GO
ALTER TABLE [dbo].[SaleItem] ADD  CONSTRAINT [DF__SaleItem__Specia__1BC821DD]  DEFAULT ((0)) FOR [SpecialItemType]
GO
ALTER TABLE [dbo].[SaleItem] ADD  CONSTRAINT [DF__SaleItem__Agency__1CBC4616]  DEFAULT ((0)) FOR [AgencyID]
GO
ALTER TABLE [dbo].[SaleItem] ADD  CONSTRAINT [DF__SaleItem__QtyOrd__1DB06A4F]  DEFAULT ((0)) FOR [QtyOrdered]
GO
ALTER TABLE [dbo].[SaleItem] ADD  CONSTRAINT [DF__SaleItem__Script__1EA48E88]  DEFAULT ((0)) FOR [ScriptLinkID]
GO
ALTER TABLE [dbo].[SaleItem] ADD  CONSTRAINT [DF__SaleItem__GSTPai__1F98B2C1]  DEFAULT ((0)) FOR [GSTPaid]
GO
ALTER TABLE [dbo].[SaleItem] ADD  CONSTRAINT [DF__SaleItem__Member__208CD6FA]  DEFAULT ((0)) FOR [MemberSale]
GO
ALTER TABLE [dbo].[SaleItem] ADD  CONSTRAINT [DF__SaleItem__Dollar__2180FB33]  DEFAULT ((0)) FOR [DollarDiscount]
GO
ALTER TABLE [dbo].[SaleItem] ADD  CONSTRAINT [DF__SaleItem__AutoSp__22751F6C]  DEFAULT ((0)) FOR [AutoSpecialID]
GO
ALTER TABLE [dbo].[SaleItem] ADD  CONSTRAINT [DF__SaleItem__Remove__236943A5]  DEFAULT ((0)) FOR [RemovedFromLayby]
GO
ALTER TABLE [dbo].[SaleItem] ADD  CONSTRAINT [DF__SaleItem__GSTPay__245D67DE]  DEFAULT ((0)) FOR [GSTPayable]
GO
ALTER TABLE [dbo].[SalePayment] ADD  CONSTRAINT [DF__SalePayme__SaleI__2739D489]  DEFAULT ((0)) FOR [SaleID]
GO
ALTER TABLE [dbo].[SalePayment] ADD  CONSTRAINT [DF__SalePaymen__Type__282DF8C2]  DEFAULT ((0)) FOR [Type]
GO
ALTER TABLE [dbo].[SalePayment] ADD  CONSTRAINT [DF__SalePayme__Value__29221CFB]  DEFAULT ((0)) FOR [Value]
GO
ALTER TABLE [dbo].[SalePayment] ADD  CONSTRAINT [DF__SalePayme__State__2A164134]  DEFAULT ((0)) FOR [StatementID]
GO
ALTER TABLE [dbo].[SalePayment] ADD  CONSTRAINT [DF__SalePayme__Accou__2B0A656D]  DEFAULT ((0)) FOR [AccountID]
GO
ALTER TABLE [dbo].[SalePayment] ADD  CONSTRAINT [DF__SalePayme__Invoi__2BFE89A6]  DEFAULT ((0)) FOR [InvoiceID]
GO
ALTER TABLE [dbo].[SalePayment] ADD  CONSTRAINT [DF__SalePayme__CardT__2CF2ADDF]  DEFAULT ((0)) FOR [CardTypeID]
GO
ALTER TABLE [dbo].[SalePayment] ADD  CONSTRAINT [DF__SalePayme__Froze__2DE6D218]  DEFAULT ((0)) FOR [FrozenBalance]
GO
ALTER TABLE [dbo].[SalePayment] ADD  CONSTRAINT [DF__SalePayme__Agenc__2EDAF651]  DEFAULT ((0)) FOR [AgencyPay]
GO
ALTER TABLE [dbo].[SalePayment] ADD  CONSTRAINT [DF__SalePayme__Layby__2FCF1A8A]  DEFAULT ((0)) FOR [LaybyPayment]
GO
ALTER TABLE [dbo].[SalePayment] ADD  CONSTRAINT [DF__SalePayme__Layby__30C33EC3]  DEFAULT ((0)) FOR [LaybyEndDayID]
GO
ALTER TABLE [dbo].[SalePayment] ADD  CONSTRAINT [DF__SalePayme__Layby__31B762FC]  DEFAULT ((0)) FOR [LaybyStaffID]
GO
ALTER TABLE [dbo].[SalePayment] ADD  CONSTRAINT [DF__SalePayme__Layby__32AB8735]  DEFAULT ((0)) FOR [LaybyUnitID]
GO
ALTER TABLE [dbo].[SalePayment] ADD  CONSTRAINT [DF__SalePayme__HOAcc__339FAB6E]  DEFAULT ((0)) FOR [HOAccountID]
GO
ALTER TABLE [dbo].[Sales] ADD  CONSTRAINT [DF__Sales__StaffID__367C1819]  DEFAULT ((0)) FOR [StaffID]
GO
ALTER TABLE [dbo].[Sales] ADD  CONSTRAINT [DF_Sales_TimeDate]  DEFAULT (getdate()) FOR [TimeDate]
GO
ALTER TABLE [dbo].[Sales] ADD  CONSTRAINT [DF__Sales__UnitID__3864608B]  DEFAULT ((0)) FOR [UnitID]
GO
ALTER TABLE [dbo].[Sales] ADD  CONSTRAINT [DF__Sales__Finished__395884C4]  DEFAULT ((0)) FOR [Finished]
GO
ALTER TABLE [dbo].[Sales] ADD  CONSTRAINT [DF__Sales__Abandoned__3A4CA8FD]  DEFAULT ((0)) FOR [Abandoned]
GO
ALTER TABLE [dbo].[Sales] ADD  CONSTRAINT [DF__Sales__EndDayID__3B40CD36]  DEFAULT ((0)) FOR [EndDayID]
GO
ALTER TABLE [dbo].[Sales] ADD  CONSTRAINT [DF__Sales__SaleType__3C34F16F]  DEFAULT ((0)) FOR [SaleType]
GO
ALTER TABLE [dbo].[Sales] ADD  CONSTRAINT [DF__Sales__LaybyStat__3D2915A8]  DEFAULT ((0)) FOR [LaybyStatus]
GO
ALTER TABLE [dbo].[Sales] ADD  CONSTRAINT [DF__Sales__LaybyPers__3E1D39E1]  DEFAULT ((0)) FOR [LaybyPersonID]
GO
ALTER TABLE [dbo].[Sales] ADD  CONSTRAINT [DF__Sales__HOTranID__3F115E1A]  DEFAULT ((0)) FOR [HOTranID]
GO
ALTER TABLE [dbo].[ScriptLink] ADD  CONSTRAINT [DF__ScriptLin__SaleI__41EDCAC5]  DEFAULT ((0)) FOR [SaleID]
GO
ALTER TABLE [dbo].[ScriptLink] ADD  CONSTRAINT [DF__ScriptLin__Quant__42E1EEFE]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[ScriptLink] ADD  CONSTRAINT [DF__ScriptLin__Patie__43D61337]  DEFAULT ((0)) FOR [PatientPrice]
GO
ALTER TABLE [dbo].[ScriptLink] ADD  CONSTRAINT [DF__ScriptLin__NHSPr__44CA3770]  DEFAULT ((0)) FOR [NHSPrice]
GO
ALTER TABLE [dbo].[ScriptLink] ADD  CONSTRAINT [DF__ScriptLin__Accou__45BE5BA9]  DEFAULT ((0)) FOR [AccountNo]
GO
ALTER TABLE [dbo].[ScriptLink] ADD  CONSTRAINT [DF__ScriptLin__Patie__46B27FE2]  DEFAULT ((0)) FOR [PatientNumber]
GO
ALTER TABLE [dbo].[ScriptLink] ADD  CONSTRAINT [DF__ScriptLin__Direc__47A6A41B]  DEFAULT ((0)) FOR [DirectDebit]
GO
ALTER TABLE [dbo].[ScriptLink] ADD  CONSTRAINT [DF__ScriptLin__Perso__489AC854]  DEFAULT ((0)) FOR [PersonID]
GO
ALTER TABLE [dbo].[ScriptLink] ADD  CONSTRAINT [DF__ScriptLin__Stock__498EEC8D]  DEFAULT ((0)) FOR [StockID]
GO
ALTER TABLE [dbo].[ScriptLink] ADD  CONSTRAINT [DF__ScriptLin__GSTAm__4A8310C6]  DEFAULT ((0)) FOR [GSTAmount]
GO
ALTER TABLE [dbo].[Staff] ADD  CONSTRAINT [DF__Staff__WagesID__4D5F7D71]  DEFAULT ((0)) FOR [WagesID]
GO
ALTER TABLE [dbo].[Staff] ADD  CONSTRAINT [DF__Staff__AllowPOS__4E53A1AA]  DEFAULT ((-1)) FOR [AllowPOS]
GO
ALTER TABLE [dbo].[Staff] ADD  CONSTRAINT [DF__Staff__AllowDisp__4F47C5E3]  DEFAULT ((-1)) FOR [AllowDisp]
GO
ALTER TABLE [dbo].[Staff] ADD  CONSTRAINT [DF__Staff__AllowOrde__503BEA1C]  DEFAULT ((-1)) FOR [AllowOrders]
GO
ALTER TABLE [dbo].[Staff] ADD  CONSTRAINT [DF__Staff__AllowRepo__51300E55]  DEFAULT ((-1)) FOR [AllowReports]
GO
ALTER TABLE [dbo].[Staff] ADD  CONSTRAINT [DF__Staff__AllowTool__5224328E]  DEFAULT ((-1)) FOR [AllowTools]
GO
ALTER TABLE [dbo].[Staff] ADD  CONSTRAINT [DF__Staff__AllowOpti__531856C7]  DEFAULT ((-1)) FOR [AllowOptions]
GO
ALTER TABLE [dbo].[Staff] ADD  CONSTRAINT [DF__Staff__AllowSale__540C7B00]  DEFAULT ((-1)) FOR [AllowSalesAbandon]
GO
ALTER TABLE [dbo].[Staff] ADD  CONSTRAINT [DF__Staff__AllowSale__55009F39]  DEFAULT ((-1)) FOR [AllowSalesOpenDrawer]
GO
ALTER TABLE [dbo].[Staff] ADD  CONSTRAINT [DF__Staff__AllowSale__55F4C372]  DEFAULT ((-1)) FOR [AllowSalesPayOuts]
GO
ALTER TABLE [dbo].[Staff] ADD  CONSTRAINT [DF__Staff__AllowTemp__56E8E7AB]  DEFAULT ((-1)) FOR [AllowTempPriceFix]
GO
ALTER TABLE [dbo].[Staff] ADD  CONSTRAINT [DF__Staff__AllowPerm__57DD0BE4]  DEFAULT ((-1)) FOR [AllowPermPriceFix]
GO
ALTER TABLE [dbo].[Staff] ADD  CONSTRAINT [DF__Staff__AllowSale__58D1301D]  DEFAULT ((-1)) FOR [AllowSalesReturns]
GO
ALTER TABLE [dbo].[Staff] ADD  CONSTRAINT [DF__Staff__AllowStoc__59C55456]  DEFAULT ((-1)) FOR [AllowStockCards]
GO
ALTER TABLE [dbo].[Staff] ADD  CONSTRAINT [DF__Staff__AllowSale__5AB9788F]  DEFAULT ((-1)) FOR [AllowSalesDiscount]
GO
ALTER TABLE [dbo].[Staff] ADD  CONSTRAINT [DF__Staff__StaffMana__5BAD9CC8]  DEFAULT ((0)) FOR [StaffManager]
GO
ALTER TABLE [dbo].[Staff] ADD  CONSTRAINT [DF__Staff__SecurityL__5CA1C101]  DEFAULT ((0)) FOR [SecurityLevelID]
GO
ALTER TABLE [dbo].[Staff] ADD  CONSTRAINT [DF__Staff__InactiveS__5D95E53A]  DEFAULT ((0)) FOR [InactiveStaff]
GO
ALTER TABLE [dbo].[State] ADD  DEFAULT ((0)) FOR [StateNumber]
GO
ALTER TABLE [dbo].[Statement] ADD  DEFAULT ((0)) FOR [StatementID]
GO
ALTER TABLE [dbo].[Statement] ADD  DEFAULT ((0)) FOR [ClosingBalance]
GO
ALTER TABLE [dbo].[Statement] ADD  DEFAULT ((0)) FOR [AccountID]
GO
ALTER TABLE [dbo].[Statement] ADD  DEFAULT ((0)) FOR [TotalSales]
GO
ALTER TABLE [dbo].[Statement] ADD  DEFAULT ((0)) FOR [Class]
GO
ALTER TABLE [dbo].[Statement] ADD  DEFAULT ((0)) FOR [InstitutionID]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__TradeName__6AEFE058]  DEFAULT ('New Card') FOR [TradeName]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__ProductGr__6BE40491]  DEFAULT ((0)) FOR [ProductGroupID]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__ProductCl__6CD828CA]  DEFAULT ((0)) FOR [ProductClassID]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__ClubID__6DCC4D03]  DEFAULT ((0)) FOR [ClubID]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__PackSize__6EC0713C]  DEFAULT ((1)) FOR [PackSize]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__OuterSize__6FB49575]  DEFAULT ((0)) FOR [OuterSize]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__OrderSize__70A8B9AE]  DEFAULT ((0)) FOR [OrderSize]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__Expected__719CDDE7]  DEFAULT ((0)) FOR [Expected]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__SOH__72910220]  DEFAULT ((0)) FOR [SOH]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__MinimumSO__73852659]  DEFAULT ((0)) FOR [MinimumSOH]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__MTD__74794A92]  DEFAULT ((0)) FOR [MTD]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__SOO__756D6ECB]  DEFAULT ((0)) FOR [SOO]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__ValueMTD__76619304]  DEFAULT ((0)) FOR [ValueMTD]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__Retail__7755B73D]  DEFAULT ((0)) FOR [Retail]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__AverageRe__7849DB76]  DEFAULT ((0)) FOR [AverageRetail]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__Cost__793DFFAF]  DEFAULT ((0)) FOR [Cost]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__RealCost__7A3223E8]  DEFAULT ((0)) FOR [RealCost]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__AverageCo__7B264821]  DEFAULT ((0)) FOR [AverageCost]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__Fillup__7C1A6C5A]  DEFAULT ((0)) FOR [Fillup]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__OrderVari__7D0E9093]  DEFAULT ((0)) FOR [OrderVariance]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__MonthsAcc__7E02B4CC]  DEFAULT ((0)) FOR [MonthsAccurate]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__POSLookup__7EF6D905]  DEFAULT ((0)) FOR [POSLookup]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__Beep__7FEAFD3E]  DEFAULT ((0)) FOR [Beep]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__Reorder__00DF2177]  DEFAULT ((-1)) FOR [Reorder]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__Labels__01D345B0]  DEFAULT ((-1)) FOR [Labels]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__Priced__02C769E9]  DEFAULT ((-1)) FOR [Priced]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__AskPrice__03BB8E22]  DEFAULT ((0)) FOR [AskPrice]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__Markup__04AFB25B]  DEFAULT ((0)) FOR [Markup]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__HotKey__05A3D694]  DEFAULT ((0)) FOR [HotKey]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__NoDiscoun__0697FACD]  DEFAULT ((0)) FOR [NoDiscount]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__stockUpda__078C1F06]  DEFAULT ((0)) FOR [stockUpdateid]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__Preferred__0880433F]  DEFAULT ((0)) FOR [PreferredSupplierId]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__Manufactu__09746778]  DEFAULT ((0)) FOR [Manufacturer]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__Seasonal__0A688BB1]  DEFAULT ((0)) FOR [Seasonal]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__Shelflabe__0B5CAFEA]  DEFAULT ((0)) FOR [Shelflabel]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__Recommend__0C50D423]  DEFAULT ((0)) FOR [RecommendedRetail]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__GSTGroupI__0D44F85C]  DEFAULT ((0)) FOR [GSTGroupID]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__GSTTypeID__0E391C95]  DEFAULT ((0)) FOR [GSTTypeID]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__SalesTax__0F2D40CE]  DEFAULT ((0)) FOR [SalesTax]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__RetailAft__10216507]  DEFAULT ((0)) FOR [RetailAfterGST]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__Update__11158940]  DEFAULT ((-1)) FOR [Update]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__NoFurther__1209AD79]  DEFAULT ((0)) FOR [NoFurtherDiscount]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__OnlyOrdNe__12FDD1B2]  DEFAULT ((0)) FOR [OnlyOrdNegSOH]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__Discontin__13F1F5EB]  DEFAULT ((0)) FOR [Discontinued]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__HeadOffic__14E61A24]  DEFAULT (NULL) FOR [HeadOfficeID]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__UPI__15DA3E5D]  DEFAULT (NULL) FOR [UPI]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__MinOrdQty__16CE6296]  DEFAULT ((0)) FOR [MinOrdQty]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__SmallLabe__17C286CF]  DEFAULT ((0)) FOR [SmallLabelOption]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__Robot__18B6AB08]  DEFAULT ((0)) FOR [Robot]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__ExcludeCu__19AACF41]  DEFAULT ((0)) FOR [ExcludeCustomerDisplay]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__MaximumSO__1A9EF37A]  DEFAULT ((0)) FOR [MaximumSOH]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__OrderCate__1B9317B3]  DEFAULT ((0)) FOR [OrderCategory]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__RobotStor__1C873BEC]  DEFAULT ((0)) FOR [RobotStoreInFridge]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__NoShelfLa__1D7B6025]  DEFAULT ((1)) FOR [NoShelfLabels]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__SOLayby__1E6F845E]  DEFAULT ((0)) FOR [SOLayby]
GO
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF__Supplier__Purcha__2334397B]  DEFAULT ((0)) FOR [PurchaseValue]
GO
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF__Supplier__Direct__24285DB4]  DEFAULT ((0)) FOR [DirectOnly]
GO
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF__Supplier__DataBi__251C81ED]  DEFAULT ((0)) FOR [DataBits]
GO
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF__Supplier__StopBi__2610A626]  DEFAULT ((0)) FOR [StopBits]
GO
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF__Supplier__BaudRa__2704CA5F]  DEFAULT ((0)) FOR [BaudRate]
GO
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF__Supplier__ModemR__27F8EE98]  DEFAULT ((0)) FOR [ModemReplyWait]
GO
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF__Supplier__CostIn__28ED12D1]  DEFAULT ((0)) FOR [CostIncludeGST]
GO
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF__Supplier__Ignore__29E1370A]  DEFAULT ((0)) FOR [IgnoreOuters]
GO
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF__Supplier__Exclud__2AD55B43]  DEFAULT ((0)) FOR [ExcludeRealUpdate]
GO
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF__Supplier__ListUp__2BC97F7C]  DEFAULT ((0)) FOR [ListUpdateOption]
GO
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF__Supplier__UseBar__2CBDA3B5]  DEFAULT ((0)) FOR [UseBarcodes]
GO
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF__Supplier__Unique__2DB1C7EE]  DEFAULT ((0)) FOR [UniqueSupID]
GO
ALTER TABLE [dbo].[SupplierDetails] ADD  DEFAULT ((0)) FOR [SupplierID]
GO
ALTER TABLE [dbo].[SupplierDetails] ADD  DEFAULT ((0)) FOR [DataBits]
GO
ALTER TABLE [dbo].[SupplierDetails] ADD  DEFAULT ((0)) FOR [StopBits]
GO
ALTER TABLE [dbo].[SupplierDetails] ADD  DEFAULT ((0)) FOR [BaudRate]
GO
ALTER TABLE [dbo].[SupplierDetails] ADD  DEFAULT ((0)) FOR [ModemReplyWait]
GO
ALTER TABLE [dbo].[External_Department]  WITH CHECK ADD  CONSTRAINT [SSMA_CC$External_Department$DeptID$disallow_zero_length] CHECK  ((len([DeptID])>(0)))
GO
ALTER TABLE [dbo].[External_Department] CHECK CONSTRAINT [SSMA_CC$External_Department$DeptID$disallow_zero_length]
GO
ALTER TABLE [dbo].[External_Department]  WITH CHECK ADD  CONSTRAINT [SSMA_CC$External_Department$Name$disallow_zero_length] CHECK  ((len([Name])>(0)))
GO
ALTER TABLE [dbo].[External_Department] CHECK CONSTRAINT [SSMA_CC$External_Department$Name$disallow_zero_length]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Department].[DepartmentID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Department', @level2type=N'COLUMN',@level2name=N'DepartmentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Department].[DeptName]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Department', @level2type=N'COLUMN',@level2name=N'DeptName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Department].[DeptNumber]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Department', @level2type=N'COLUMN',@level2name=N'DeptNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Department]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Department'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Department].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Department', @level2type=N'CONSTRAINT',@level2name=N'Department$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[External_Department].[USI]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'External_Department', @level2type=N'COLUMN',@level2name=N'USI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[External_Department].[DeptID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'External_Department', @level2type=N'COLUMN',@level2name=N'DeptID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[External_Department].[Name]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'External_Department', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[External_Department]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'External_Department'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[External_Department].[Index_E7CE83A9_18A9_46E7]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'External_Department', @level2type=N'CONSTRAINT',@level2name=N'External_Department$Index_E7CE83A9_18A9_46E7'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[External_SubDepartment].[Ext_SubDeptID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'External_SubDepartment', @level2type=N'COLUMN',@level2name=N'Ext_SubDeptID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[External_SubDepartment].[USI]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'External_SubDepartment', @level2type=N'COLUMN',@level2name=N'USI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[External_SubDepartment].[SubDeptID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'External_SubDepartment', @level2type=N'COLUMN',@level2name=N'SubDeptID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[External_SubDepartment].[DeptID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'External_SubDepartment', @level2type=N'COLUMN',@level2name=N'DeptID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[External_SubDepartment].[Name]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'External_SubDepartment', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[External_SubDepartment].[LotsProductGroupRef]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'External_SubDepartment', @level2type=N'COLUMN',@level2name=N'LotsProductGroupRef'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[External_SubDepartment].[CheckoutSubDeptRef]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'External_SubDepartment', @level2type=N'COLUMN',@level2name=N'CheckoutSubDeptRef'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[External_SubDepartment]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'External_SubDepartment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[External_SubDepartment].[pk_External_SubDepartment]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'External_SubDepartment', @level2type=N'CONSTRAINT',@level2name=N'External_SubDepartment$pk_External_SubDepartment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[History].[StockID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'History', @level2type=N'COLUMN',@level2name=N'StockID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[History].[Month]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'History', @level2type=N'COLUMN',@level2name=N'Month'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[History].[QtySold]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'History', @level2type=N'COLUMN',@level2name=N'QtySold'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[History].[ValueSold]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'History', @level2type=N'COLUMN',@level2name=N'ValueSold'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[History].[TotalTax]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'History', @level2type=N'COLUMN',@level2name=N'TotalTax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[History].[TotalCost]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'History', @level2type=N'COLUMN',@level2name=N'TotalCost'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[History]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'History'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[History].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'History', @level2type=N'CONSTRAINT',@level2name=N'History$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[IncomingStock].[IncomingStockID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncomingStock', @level2type=N'COLUMN',@level2name=N'IncomingStockID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[IncomingStock].[StockID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncomingStock', @level2type=N'COLUMN',@level2name=N'StockID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[IncomingStock].[OrderID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncomingStock', @level2type=N'COLUMN',@level2name=N'OrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[IncomingStock].[Description]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncomingStock', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[IncomingStock].[TotalCost]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncomingStock', @level2type=N'COLUMN',@level2name=N'TotalCost'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[IncomingStock].[TotalGSTPaid]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncomingStock', @level2type=N'COLUMN',@level2name=N'TotalGSTPaid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[IncomingStock].[TransactionDate]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncomingStock', @level2type=N'COLUMN',@level2name=N'TransactionDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[IncomingStock].[SupplierID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncomingStock', @level2type=N'COLUMN',@level2name=N'SupplierID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[IncomingStock].[SupplierName]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncomingStock', @level2type=N'COLUMN',@level2name=N'SupplierName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[IncomingStock].[RefNumber]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncomingStock', @level2type=N'COLUMN',@level2name=N'RefNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[IncomingStock]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncomingStock'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[IncomingStock].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncomingStock', @level2type=N'CONSTRAINT',@level2name=N'IncomingStock$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[OrderInvoice].[InvoiceID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderInvoice', @level2type=N'COLUMN',@level2name=N'InvoiceID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[OrderInvoice].[InvoiceNumber]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderInvoice', @level2type=N'COLUMN',@level2name=N'InvoiceNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[OrderInvoice].[SupplierID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderInvoice', @level2type=N'COLUMN',@level2name=N'SupplierID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[OrderInvoice].[CreateDate]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderInvoice', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[OrderInvoice].[StaffID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderInvoice', @level2type=N'COLUMN',@level2name=N'StaffID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[OrderInvoice].[Complete]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderInvoice', @level2type=N'COLUMN',@level2name=N'Complete'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[OrderInvoice].[EndofDayID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderInvoice', @level2type=N'COLUMN',@level2name=N'EndofDayID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[OrderInvoice]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderInvoice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[OrderInvoice].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderInvoice', @level2type=N'CONSTRAINT',@level2name=N'OrderInvoice$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[OrderInvoiceItems].[InvoiceItemID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderInvoiceItems', @level2type=N'COLUMN',@level2name=N'InvoiceItemID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[OrderInvoiceItems].[InvoiceID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderInvoiceItems', @level2type=N'COLUMN',@level2name=N'InvoiceID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[OrderInvoiceItems].[OrderID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderInvoiceItems', @level2type=N'COLUMN',@level2name=N'OrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[OrderInvoiceItems].[StockID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderInvoiceItems', @level2type=N'COLUMN',@level2name=N'StockID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[OrderInvoiceItems].[PartcodeId]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderInvoiceItems', @level2type=N'COLUMN',@level2name=N'PartcodeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[OrderInvoiceItems].[QtyInv]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderInvoiceItems', @level2type=N'COLUMN',@level2name=N'QtyInv'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[OrderInvoiceItems].[ListCost]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderInvoiceItems', @level2type=N'COLUMN',@level2name=N'ListCost'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[OrderInvoiceItems].[RealCost]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderInvoiceItems', @level2type=N'COLUMN',@level2name=N'RealCost'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[OrderInvoiceItems].[Retail]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderInvoiceItems', @level2type=N'COLUMN',@level2name=N'Retail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[OrderInvoiceItems].[Delivered]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderInvoiceItems', @level2type=N'COLUMN',@level2name=N'Delivered'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[OrderInvoiceItems].[Tote]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderInvoiceItems', @level2type=N'COLUMN',@level2name=N'Tote'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[OrderInvoiceItems].[Description]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderInvoiceItems', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[OrderInvoiceItems].[PDE]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderInvoiceItems', @level2type=N'COLUMN',@level2name=N'PDE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[OrderInvoiceItems].[Transferred]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderInvoiceItems', @level2type=N'COLUMN',@level2name=N'Transferred'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[OrderInvoiceItems].[PackSize]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderInvoiceItems', @level2type=N'COLUMN',@level2name=N'PackSize'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[OrderInvoiceItems].[OuterSize]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderInvoiceItems', @level2type=N'COLUMN',@level2name=N'OuterSize'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[OrderInvoiceItems].[GSTPaid]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderInvoiceItems', @level2type=N'COLUMN',@level2name=N'GSTPaid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[OrderInvoiceItems].[SubTotal]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderInvoiceItems', @level2type=N'COLUMN',@level2name=N'SubTotal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[OrderInvoiceItems]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderInvoiceItems'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[OrderInvoiceItems].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderInvoiceItems', @level2type=N'CONSTRAINT',@level2name=N'OrderInvoiceItems$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[OrderItems].[OrderItemId]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderItems', @level2type=N'COLUMN',@level2name=N'OrderItemId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[OrderItems].[OrderID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderItems', @level2type=N'COLUMN',@level2name=N'OrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[OrderItems].[StockID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderItems', @level2type=N'COLUMN',@level2name=N'StockID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[OrderItems].[PartcodeId]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderItems', @level2type=N'COLUMN',@level2name=N'PartcodeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[OrderItems].[Quantity]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderItems', @level2type=N'COLUMN',@level2name=N'Quantity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[OrderItems].[PackSize]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderItems', @level2type=N'COLUMN',@level2name=N'PackSize'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[OrderItems].[OuterSize]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderItems', @level2type=N'COLUMN',@level2name=N'OuterSize'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[OrderItems].[Comment]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderItems', @level2type=N'COLUMN',@level2name=N'Comment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[OrderItems].[PDE]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderItems', @level2type=N'COLUMN',@level2name=N'PDE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[OrderItems].[InvoiceItemID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderItems', @level2type=N'COLUMN',@level2name=N'InvoiceItemID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[OrderItems]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderItems'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[OrderItems].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderItems', @level2type=N'CONSTRAINT',@level2name=N'OrderItems$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Orders].[OrderID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'OrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Orders].[OrderTime]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'OrderTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Orders].[StaffName]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'StaffName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Orders].[Direct]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Direct'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Orders].[SupplierID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'SupplierID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Orders].[OrderPeriod]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'OrderPeriod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Orders].[Ordered]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Ordered'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Orders].[Delivered]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Delivered'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Orders].[OrderValue]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'OrderValue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Orders].[Acknowledged]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Acknowledged'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Orders].[LinkedOrder]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'LinkedOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Orders].[SupplierDetails]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'SupplierDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Orders].[TotalGSTPaid]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'TotalGSTPaid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Orders].[Replacement]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Replacement'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Orders]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Orders].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'CONSTRAINT',@level2name=N'Orders$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Partcode].[PartCodeID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Partcode', @level2type=N'COLUMN',@level2name=N'PartCodeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Partcode].[StockID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Partcode', @level2type=N'COLUMN',@level2name=N'StockID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Partcode].[SupplierID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Partcode', @level2type=N'COLUMN',@level2name=N'SupplierID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Partcode].[Name]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Partcode', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Partcode].[PartCode]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Partcode', @level2type=N'COLUMN',@level2name=N'PartCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Partcode].[Manufacturer]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Partcode', @level2type=N'COLUMN',@level2name=N'Manufacturer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Partcode].[Preferred]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Partcode', @level2type=N'COLUMN',@level2name=N'Preferred'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Partcode].[OuterSize]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Partcode', @level2type=N'COLUMN',@level2name=N'OuterSize'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Partcode].[PackSize]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Partcode', @level2type=N'COLUMN',@level2name=N'PackSize'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Partcode].[MinOrderQty]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Partcode', @level2type=N'COLUMN',@level2name=N'MinOrderQty'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Partcode].[OrderMultiple]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Partcode', @level2type=N'COLUMN',@level2name=N'OrderMultiple'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Partcode].[UpdatedDate]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Partcode', @level2type=N'COLUMN',@level2name=N'UpdatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Partcode].[CreatedDate]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Partcode', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Partcode].[Discontinued]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Partcode', @level2type=N'COLUMN',@level2name=N'Discontinued'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Partcode].[SupplierMinOrder]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Partcode', @level2type=N'COLUMN',@level2name=N'SupplierMinOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Partcode]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Partcode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Partcode].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Partcode', @level2type=N'CONSTRAINT',@level2name=N'Partcode$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[PersonID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'PersonID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[FirstName]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'FirstName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[LastName]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'LastName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[TitleID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'TitleID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[Address]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[Suburb]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'Suburb'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[City]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'City'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[PostCode]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'PostCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[PhoneNumber]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'PhoneNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[BirthDate]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'BirthDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[Comment]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'Comment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[PatientCommentID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'PatientCommentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[FamilyID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'FamilyID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[CategoryID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'CategoryID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[EntitlementC]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'EntitlementC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[EntitlementR]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'EntitlementR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[EntitlementSEV]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'EntitlementSEV'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[CardExpiryDate]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'CardExpiryDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[ExternalExemptDate]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'ExternalExemptDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[ExternalSNet]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'ExternalSNet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[ExtSNetDate]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'ExtSNetDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[ExternalSNetValue]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'ExternalSNetValue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[ExtSNetValueDate]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'ExtSNetValueDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[MedicareNo]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'MedicareNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[HFMembership]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'HFMembership'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[AccountID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'AccountID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[CreditLimit]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'CreditLimit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[PrescriptionsOnAC]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'PrescriptionsOnAC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[ShopItemsOnAC]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'ShopItemsOnAC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[StopCredit]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'StopCredit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[MessagePOS]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'MessagePOS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[PrescriptionDiscount]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'PrescriptionDiscount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[ShopItemsDiscount]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'ShopItemsDiscount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[AccountClassID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'AccountClassID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[AutoChargeScripts]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'AutoChargeScripts'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[HospitalCategory]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'HospitalCategory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[PrescriptionDiscountPrivate]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'PrescriptionDiscountPrivate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[Gender]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'Gender'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[Height]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'Height'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[Weight]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'Weight'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[RoomNumber]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'RoomNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[HealthInfoID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'HealthInfoID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[DefaultDoctor]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'DefaultDoctor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[Image]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'Image'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[ABNNumber]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'ABNNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[EndConsumer]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'EndConsumer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[MedicareExpiryDate]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'MedicareExpiryDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[DiscountLevelID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'DiscountLevelID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[MailingID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'MailingID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[MemberCode]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'MemberCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[MessageText]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'MessageText'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[MedicareName]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'MedicareName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[MedicareSurname]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'MedicareSurname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[InvMedicare]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'InvMedicare'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[VACardID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'VACardID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[MainFamilyID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'MainFamilyID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[MedicareConsent]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'MedicareConsent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[DVAConsent]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'DVAConsent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[SFPatientID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'SFPatientID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[CompensationNo]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'CompensationNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[PrintCompensationNo]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'PrintCompensationNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[RelationshipCode]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'RelationshipCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[ExcludePromoMail]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'ExcludePromoMail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[Email]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[PromptCharge]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'PromptCharge'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[HeadOfficeID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'HeadOfficeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[MemberStatus]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'MemberStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[InstitutionID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'InstitutionID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[IsControlAccount]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'IsControlAccount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[IsSubAccount]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'IsSubAccount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[WebstercareLabel]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'WebstercareLabel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[DontSendEScript]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'DontSendEScript'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[CTG]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'CTG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[EmailStatements]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'EmailStatements'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Person].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'CONSTRAINT',@level2name=N'Person$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[PostCodes].[PostCodeID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PostCodes', @level2type=N'COLUMN',@level2name=N'PostCodeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[PostCodes].[PostCode]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PostCodes', @level2type=N'COLUMN',@level2name=N'PostCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[PostCodes].[Suburb/State]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PostCodes', @level2type=N'COLUMN',@level2name=N'Suburb/State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[PostCodes]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PostCodes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[PostCodes].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PostCodes', @level2type=N'CONSTRAINT',@level2name=N'PostCodes$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[PriceParsed].[ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PriceParsed', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[PriceParsed].[Status]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PriceParsed', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[PriceParsed].[StockID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PriceParsed', @level2type=N'COLUMN',@level2name=N'StockID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[PriceParsed].[PLU]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PriceParsed', @level2type=N'COLUMN',@level2name=N'PLU'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[PriceParsed].[Description]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PriceParsed', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[PriceParsed].[OldList]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PriceParsed', @level2type=N'COLUMN',@level2name=N'OldList'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[PriceParsed].[NewList]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PriceParsed', @level2type=N'COLUMN',@level2name=N'NewList'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[PriceParsed].[MarkUp]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PriceParsed', @level2type=N'COLUMN',@level2name=N'MarkUp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[PriceParsed].[OldRetail]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PriceParsed', @level2type=N'COLUMN',@level2name=N'OldRetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[PriceParsed].[NewRetail]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PriceParsed', @level2type=N'COLUMN',@level2name=N'NewRetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[PriceParsed].[RecRetail]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PriceParsed', @level2type=N'COLUMN',@level2name=N'RecRetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[PriceParsed].[GST]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PriceParsed', @level2type=N'COLUMN',@level2name=N'GST'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[PriceParsed].[outersize]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PriceParsed', @level2type=N'COLUMN',@level2name=N'outersize'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[PriceParsed].[ordersize]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PriceParsed', @level2type=N'COLUMN',@level2name=N'ordersize'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[PriceParsed].[RealCost]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PriceParsed', @level2type=N'COLUMN',@level2name=N'RealCost'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[PriceParsed].[Processed]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PriceParsed', @level2type=N'COLUMN',@level2name=N'Processed'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[PriceParsed].[barcode]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PriceParsed', @level2type=N'COLUMN',@level2name=N'barcode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[PriceParsed].[Agency]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PriceParsed', @level2type=N'COLUMN',@level2name=N'Agency'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[PriceParsed].[ProdGrpID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PriceParsed', @level2type=N'COLUMN',@level2name=N'ProdGrpID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[PriceParsed].[WSaleID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PriceParsed', @level2type=N'COLUMN',@level2name=N'WSaleID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[PriceParsed].[Selected]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PriceParsed', @level2type=N'COLUMN',@level2name=N'Selected'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[PriceParsed].[UPI]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PriceParsed', @level2type=N'COLUMN',@level2name=N'UPI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[PriceParsed].[OldGP]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PriceParsed', @level2type=N'COLUMN',@level2name=N'OldGP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[PriceParsed].[NewGP]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PriceParsed', @level2type=N'COLUMN',@level2name=N'NewGP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[PriceParsed]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PriceParsed'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[PriceParsed].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PriceParsed', @level2type=N'CONSTRAINT',@level2name=N'PriceParsed$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[ProductGroup].[ProductGroupID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductGroup', @level2type=N'COLUMN',@level2name=N'ProductGroupID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[ProductGroup].[ProductGroupName]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductGroup', @level2type=N'COLUMN',@level2name=N'ProductGroupName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[ProductGroup].[GST]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductGroup', @level2type=N'COLUMN',@level2name=N'GST'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[ProductGroup].[RegularDiscount]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductGroup', @level2type=N'COLUMN',@level2name=N'RegularDiscount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[ProductGroup].[ExtraDiscount]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductGroup', @level2type=N'COLUMN',@level2name=N'ExtraDiscount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[ProductGroup].[Intensive]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductGroup', @level2type=N'COLUMN',@level2name=N'Intensive'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[ProductGroup].[DepartmentID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductGroup', @level2type=N'COLUMN',@level2name=N'DepartmentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[ProductGroup].[SubDeptNumber]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductGroup', @level2type=N'COLUMN',@level2name=N'SubDeptNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[ProductGroup]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductGroup'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[ProductGroup].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductGroup', @level2type=N'CONSTRAINT',@level2name=N'ProductGroup$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SaleItem].[SaleItemID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleItem', @level2type=N'COLUMN',@level2name=N'SaleItemID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SaleItem].[SaleID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleItem', @level2type=N'COLUMN',@level2name=N'SaleID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SaleItem].[StockID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleItem', @level2type=N'COLUMN',@level2name=N'StockID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SaleItem].[ScriptID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleItem', @level2type=N'COLUMN',@level2name=N'ScriptID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SaleItem].[Description]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleItem', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SaleItem].[Cost]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleItem', @level2type=N'COLUMN',@level2name=N'Cost'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SaleItem].[Retail]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleItem', @level2type=N'COLUMN',@level2name=N'Retail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SaleItem].[Quantity]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleItem', @level2type=N'COLUMN',@level2name=N'Quantity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SaleItem].[Tax]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleItem', @level2type=N'COLUMN',@level2name=N'Tax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SaleItem].[Discount]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleItem', @level2type=N'COLUMN',@level2name=N'Discount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SaleItem].[PersonID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleItem', @level2type=N'COLUMN',@level2name=N'PersonID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SaleItem].[SpecialItemType]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleItem', @level2type=N'COLUMN',@level2name=N'SpecialItemType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SaleItem].[AgencyID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleItem', @level2type=N'COLUMN',@level2name=N'AgencyID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SaleItem].[QtyOrdered]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleItem', @level2type=N'COLUMN',@level2name=N'QtyOrdered'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SaleItem].[ScriptLinkID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleItem', @level2type=N'COLUMN',@level2name=N'ScriptLinkID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SaleItem].[GSTPaid]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleItem', @level2type=N'COLUMN',@level2name=N'GSTPaid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SaleItem].[MemberSale]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleItem', @level2type=N'COLUMN',@level2name=N'MemberSale'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SaleItem].[DollarDiscount]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleItem', @level2type=N'COLUMN',@level2name=N'DollarDiscount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SaleItem].[AutoSpecialID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleItem', @level2type=N'COLUMN',@level2name=N'AutoSpecialID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SaleItem].[OriginalRetail]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleItem', @level2type=N'COLUMN',@level2name=N'OriginalRetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SaleItem].[DateAdded]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleItem', @level2type=N'COLUMN',@level2name=N'DateAdded'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SaleItem].[RemovedFromLayby]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleItem', @level2type=N'COLUMN',@level2name=N'RemovedFromLayby'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SaleItem].[DeliveryNoteID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleItem', @level2type=N'COLUMN',@level2name=N'DeliveryNoteID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SaleItem]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleItem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SaleItem].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleItem', @level2type=N'CONSTRAINT',@level2name=N'SaleItem$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SalePayment].[SalePaymentID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalePayment', @level2type=N'COLUMN',@level2name=N'SalePaymentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SalePayment].[SaleID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalePayment', @level2type=N'COLUMN',@level2name=N'SaleID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SalePayment].[Type]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalePayment', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SalePayment].[Value]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalePayment', @level2type=N'COLUMN',@level2name=N'Value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SalePayment].[StatementID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalePayment', @level2type=N'COLUMN',@level2name=N'StatementID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SalePayment].[AccountID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalePayment', @level2type=N'COLUMN',@level2name=N'AccountID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SalePayment].[InvoiceID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalePayment', @level2type=N'COLUMN',@level2name=N'InvoiceID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SalePayment].[CardTypeID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalePayment', @level2type=N'COLUMN',@level2name=N'CardTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SalePayment].[FrozenBalance]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalePayment', @level2type=N'COLUMN',@level2name=N'FrozenBalance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SalePayment].[AgencyPay]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalePayment', @level2type=N'COLUMN',@level2name=N'AgencyPay'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SalePayment].[LaybyPayment]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalePayment', @level2type=N'COLUMN',@level2name=N'LaybyPayment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SalePayment].[Comment]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalePayment', @level2type=N'COLUMN',@level2name=N'Comment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SalePayment].[LaybyPaymentDate]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalePayment', @level2type=N'COLUMN',@level2name=N'LaybyPaymentDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SalePayment].[LaybyEndDayID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalePayment', @level2type=N'COLUMN',@level2name=N'LaybyEndDayID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SalePayment].[LaybyStaffID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalePayment', @level2type=N'COLUMN',@level2name=N'LaybyStaffID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SalePayment].[LaybyUnitID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalePayment', @level2type=N'COLUMN',@level2name=N'LaybyUnitID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SalePayment].[HOAccountID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalePayment', @level2type=N'COLUMN',@level2name=N'HOAccountID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SalePayment]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalePayment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SalePayment].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalePayment', @level2type=N'CONSTRAINT',@level2name=N'SalePayment$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Sales].[SaleID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'SaleID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Sales].[StaffID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'StaffID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Sales].[TimeDate]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'TimeDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Sales].[UnitID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'UnitID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Sales].[Finished]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'Finished'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Sales].[Abandoned]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'Abandoned'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Sales].[EndDayID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'EndDayID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Sales].[SaleType]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'SaleType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Sales].[LaybyStatus]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'LaybyStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Sales].[LaybyFinishDate]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'LaybyFinishDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Sales].[LaybyPersonID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'LaybyPersonID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Sales].[LoyaltyCard]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'LoyaltyCard'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Sales].[LaybyID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'LaybyID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Sales].[HOTranID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'HOTranID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Sales].[OriginalInvoiceDate]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'OriginalInvoiceDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Sales]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Sales].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'CONSTRAINT',@level2name=N'Sales$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[ScriptLink].[ScriptLinkID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ScriptLink', @level2type=N'COLUMN',@level2name=N'ScriptLinkID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[ScriptLink].[ScriptNumber]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ScriptLink', @level2type=N'COLUMN',@level2name=N'ScriptNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[ScriptLink].[ScriptType]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ScriptLink', @level2type=N'COLUMN',@level2name=N'ScriptType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[ScriptLink].[SaleID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ScriptLink', @level2type=N'COLUMN',@level2name=N'SaleID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[ScriptLink].[PDE]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ScriptLink', @level2type=N'COLUMN',@level2name=N'PDE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[ScriptLink].[Description]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ScriptLink', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[ScriptLink].[Quantity]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ScriptLink', @level2type=N'COLUMN',@level2name=N'Quantity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[ScriptLink].[PatientPrice]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ScriptLink', @level2type=N'COLUMN',@level2name=N'PatientPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[ScriptLink].[NHSPrice]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ScriptLink', @level2type=N'COLUMN',@level2name=N'NHSPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[ScriptLink].[FirstName]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ScriptLink', @level2type=N'COLUMN',@level2name=N'FirstName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[ScriptLink].[LastName]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ScriptLink', @level2type=N'COLUMN',@level2name=N'LastName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[ScriptLink].[PatientAddress]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ScriptLink', @level2type=N'COLUMN',@level2name=N'PatientAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[ScriptLink].[AccountNo]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ScriptLink', @level2type=N'COLUMN',@level2name=N'AccountNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[ScriptLink].[PatientNumber]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ScriptLink', @level2type=N'COLUMN',@level2name=N'PatientNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[ScriptLink].[DirectDebit]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ScriptLink', @level2type=N'COLUMN',@level2name=N'DirectDebit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[ScriptLink].[PersonID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ScriptLink', @level2type=N'COLUMN',@level2name=N'PersonID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[ScriptLink].[StockID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ScriptLink', @level2type=N'COLUMN',@level2name=N'StockID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[ScriptLink].[DateTimeTransferred]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ScriptLink', @level2type=N'COLUMN',@level2name=N'DateTimeTransferred'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[ScriptLink].[GSTAmount]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ScriptLink', @level2type=N'COLUMN',@level2name=N'GSTAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[ScriptLink]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ScriptLink'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[ScriptLink].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ScriptLink', @level2type=N'CONSTRAINT',@level2name=N'ScriptLink$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Staff].[StaffID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'StaffID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Staff].[StaffInitial]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'StaffInitial'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Staff].[StaffName]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'StaffName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Staff].[StaffNum]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'StaffNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Staff].[PassWord]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'PassWord'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Staff].[WagesID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'WagesID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Staff].[AllowPOS]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'AllowPOS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Staff].[AllowDisp]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'AllowDisp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Staff].[AllowOrders]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'AllowOrders'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Staff].[AllowReports]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'AllowReports'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Staff].[AllowTools]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'AllowTools'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Staff].[AllowOptions]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'AllowOptions'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Staff].[AllowSalesAbandon]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'AllowSalesAbandon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Staff].[AllowSalesOpenDrawer]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'AllowSalesOpenDrawer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Staff].[AllowSalesPayOuts]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'AllowSalesPayOuts'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Staff].[AllowTempPriceFix]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'AllowTempPriceFix'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Staff].[AllowPermPriceFix]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'AllowPermPriceFix'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Staff].[AllowSalesReturns]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'AllowSalesReturns'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Staff].[AllowStockCards]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'AllowStockCards'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Staff].[AllowSalesDiscount]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'AllowSalesDiscount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Staff].[StaffManager]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'StaffManager'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Staff].[SecurityLevelID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'SecurityLevelID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Staff].[InactiveStaff]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'InactiveStaff'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Staff].[AHPRA]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'AHPRA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Staff]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Staff'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Staff].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'CONSTRAINT',@level2name=N'Staff$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[State].[StateNumber]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'State', @level2type=N'COLUMN',@level2name=N'StateNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[State].[StateName]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'State', @level2type=N'COLUMN',@level2name=N'StateName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[State]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[State].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'State', @level2type=N'CONSTRAINT',@level2name=N'State$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Statement].[StatementID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Statement', @level2type=N'COLUMN',@level2name=N'StatementID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Statement].[ClosingDate]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Statement', @level2type=N'COLUMN',@level2name=N'ClosingDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Statement].[ClosingBalance]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Statement', @level2type=N'COLUMN',@level2name=N'ClosingBalance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Statement].[AccountID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Statement', @level2type=N'COLUMN',@level2name=N'AccountID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Statement].[TotalSales]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Statement', @level2type=N'COLUMN',@level2name=N'TotalSales'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Statement].[Class]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Statement', @level2type=N'COLUMN',@level2name=N'Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Statement].[InstitutionID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Statement', @level2type=N'COLUMN',@level2name=N'InstitutionID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Statement].[RoomNumber]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Statement', @level2type=N'COLUMN',@level2name=N'RoomNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Statement]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Statement'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Statement].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Statement', @level2type=N'CONSTRAINT',@level2name=N'Statement$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[StockID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'StockID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[TradeName]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'TradeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[ProductGroupID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'ProductGroupID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[ProductClassID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'ProductClassID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[ClubID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'ClubID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[PackSize]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'PackSize'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[OuterSize]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'OuterSize'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[OrderSize]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'OrderSize'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[ExtraInfo]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'ExtraInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[Expected]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'Expected'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[SOH]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'SOH'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[MinimumSOH]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'MinimumSOH'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[MTD]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'MTD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[SOO]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'SOO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[ValueMTD]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'ValueMTD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[Retail]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'Retail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[AverageRetail]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'AverageRetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[Cost]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'Cost'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[RealCost]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'RealCost'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[AverageCost]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'AverageCost'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[Fillup]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'Fillup'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[OrderVariance]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'OrderVariance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[MonthsAccurate]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'MonthsAccurate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[Date]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'Date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[DateCreated]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'DateCreated'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[POSLookup]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'POSLookup'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[Beep]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'Beep'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[Reorder]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'Reorder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[ReorderAfterDate]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'ReorderAfterDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[Labels]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'Labels'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[Priced]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'Priced'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[AskPrice]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'AskPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[Label]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'Label'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[Message]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'Message'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[ListCost]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'ListCost'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[Markup]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'Markup'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[PLU]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'PLU'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[HotKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'HotKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[NoDiscount]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'NoDiscount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[stockUpdateid]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'stockUpdateid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[PreferredSupplierId]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'PreferredSupplierId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[Brand]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'Brand'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[Manufacturer]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'Manufacturer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[Seasonal]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'Seasonal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[Shelflabel]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'Shelflabel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[StockDescription]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'StockDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[RecommendedRetail]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'RecommendedRetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[GSTGroupID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'GSTGroupID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[GSTTypeID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'GSTTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[SalesTax]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'SalesTax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[RetailAfterGST]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'RetailAfterGST'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[Update]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'Update'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[StockDiscount]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'StockDiscount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[NoFurtherDiscount]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'NoFurtherDiscount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[OnlyOrdNegSOH]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'OnlyOrdNegSOH'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[LastOrderDate]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'LastOrderDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[comments]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[Discontinued]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'Discontinued'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[HeadOfficeID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'HeadOfficeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[UPI]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'UPI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[MinOrdQty]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'MinOrdQty'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[SmallLabelOption]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'SmallLabelOption'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[ImageName]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'ImageName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[Robot]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'Robot'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[ExcludeCustomerDisplay]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'ExcludeCustomerDisplay'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[NettIntoStore]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'NettIntoStore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[NegotiatedCost]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'NegotiatedCost'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[MaximumSOH]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'MaximumSOH'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[OrderCategory]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'OrderCategory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[LastCountDate]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'LastCountDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[RobotStoreInFridge]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'RobotStoreInFridge'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Stock].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'CONSTRAINT',@level2name=N'Stock$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[StockAdjustment].[StockAdjID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockAdjustment', @level2type=N'COLUMN',@level2name=N'StockAdjID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[StockAdjustment].[StaffID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockAdjustment', @level2type=N'COLUMN',@level2name=N'StaffID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[StockAdjustment].[ReasonID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockAdjustment', @level2type=N'COLUMN',@level2name=N'ReasonID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[StockAdjustment].[ReasonText]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockAdjustment', @level2type=N'COLUMN',@level2name=N'ReasonText'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[StockAdjustment].[SOHBeforeAdj]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockAdjustment', @level2type=N'COLUMN',@level2name=N'SOHBeforeAdj'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[StockAdjustment].[SOHAfterAdj]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockAdjustment', @level2type=N'COLUMN',@level2name=N'SOHAfterAdj'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[StockAdjustment].[StockID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockAdjustment', @level2type=N'COLUMN',@level2name=N'StockID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[StockAdjustment].[RealCost]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockAdjustment', @level2type=N'COLUMN',@level2name=N'RealCost'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[StockAdjustment].[DateCreated]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockAdjustment', @level2type=N'COLUMN',@level2name=N'DateCreated'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[StockAdjustment]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockAdjustment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Supplier].[SupplierID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier', @level2type=N'COLUMN',@level2name=N'SupplierID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Supplier].[SupplierName]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier', @level2type=N'COLUMN',@level2name=N'SupplierName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Supplier].[Address]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Supplier].[City]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier', @level2type=N'COLUMN',@level2name=N'City'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Supplier].[PhoneNumber]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier', @level2type=N'COLUMN',@level2name=N'PhoneNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Supplier].[FaxNumber]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier', @level2type=N'COLUMN',@level2name=N'FaxNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Supplier].[LastOrder]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier', @level2type=N'COLUMN',@level2name=N'LastOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Supplier].[PurchaseValue]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier', @level2type=N'COLUMN',@level2name=N'PurchaseValue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Supplier].[Brand]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier', @level2type=N'COLUMN',@level2name=N'Brand'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Supplier].[DirectOnly]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier', @level2type=N'COLUMN',@level2name=N'DirectOnly'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Supplier].[HeaderCode]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier', @level2type=N'COLUMN',@level2name=N'HeaderCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Supplier].[ModemPhoneNumber]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier', @level2type=N'COLUMN',@level2name=N'ModemPhoneNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Supplier].[ModemOrderFile]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier', @level2type=N'COLUMN',@level2name=N'ModemOrderFile'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Supplier].[AccountNumber]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier', @level2type=N'COLUMN',@level2name=N'AccountNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Supplier].[OrderType]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier', @level2type=N'COLUMN',@level2name=N'OrderType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Supplier].[Password]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Supplier].[SessionCode]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier', @level2type=N'COLUMN',@level2name=N'SessionCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Supplier].[Header]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier', @level2type=N'COLUMN',@level2name=N'Header'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Supplier].[Trailer]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier', @level2type=N'COLUMN',@level2name=N'Trailer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Supplier].[ComPort]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier', @level2type=N'COLUMN',@level2name=N'ComPort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Supplier].[InitString]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier', @level2type=N'COLUMN',@level2name=N'InitString'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Supplier].[Parity]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier', @level2type=N'COLUMN',@level2name=N'Parity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Supplier].[DataBits]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier', @level2type=N'COLUMN',@level2name=N'DataBits'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Supplier].[StopBits]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier', @level2type=N'COLUMN',@level2name=N'StopBits'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Supplier].[BaudRate]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier', @level2type=N'COLUMN',@level2name=N'BaudRate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Supplier].[HangupString]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier', @level2type=N'COLUMN',@level2name=N'HangupString'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Supplier].[Message]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier', @level2type=N'COLUMN',@level2name=N'Message'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Supplier].[DialingPrefix]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier', @level2type=N'COLUMN',@level2name=N'DialingPrefix'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Supplier].[ModemReplyFile]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier', @level2type=N'COLUMN',@level2name=N'ModemReplyFile'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Supplier].[ModemReplyWait]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier', @level2type=N'COLUMN',@level2name=N'ModemReplyWait'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Supplier].[CostIncludeGST]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier', @level2type=N'COLUMN',@level2name=N'CostIncludeGST'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Supplier].[IgnoreOuters]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier', @level2type=N'COLUMN',@level2name=N'IgnoreOuters'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Supplier].[ExcludeRealUpdate]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier', @level2type=N'COLUMN',@level2name=N'ExcludeRealUpdate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Supplier].[ListUpdateOption]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier', @level2type=N'COLUMN',@level2name=N'ListUpdateOption'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Supplier].[UseBarcodes]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier', @level2type=N'COLUMN',@level2name=N'UseBarcodes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Supplier].[UniqueSupID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier', @level2type=N'COLUMN',@level2name=N'UniqueSupID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Supplier]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[Supplier].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier', @level2type=N'CONSTRAINT',@level2name=N'Supplier$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SupplierDetails].[SupplierDetailsID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SupplierDetails', @level2type=N'COLUMN',@level2name=N'SupplierDetailsID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SupplierDetails].[SupplierID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SupplierDetails', @level2type=N'COLUMN',@level2name=N'SupplierID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SupplierDetails].[SupplierDetailName]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SupplierDetails', @level2type=N'COLUMN',@level2name=N'SupplierDetailName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SupplierDetails].[HeaderCode]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SupplierDetails', @level2type=N'COLUMN',@level2name=N'HeaderCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SupplierDetails].[ModemPhoneNumber]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SupplierDetails', @level2type=N'COLUMN',@level2name=N'ModemPhoneNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SupplierDetails].[ModemOrderFile]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SupplierDetails', @level2type=N'COLUMN',@level2name=N'ModemOrderFile'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SupplierDetails].[AccountNumber]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SupplierDetails', @level2type=N'COLUMN',@level2name=N'AccountNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SupplierDetails].[OrderType]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SupplierDetails', @level2type=N'COLUMN',@level2name=N'OrderType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SupplierDetails].[Password]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SupplierDetails', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SupplierDetails].[SessionCode]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SupplierDetails', @level2type=N'COLUMN',@level2name=N'SessionCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SupplierDetails].[Header]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SupplierDetails', @level2type=N'COLUMN',@level2name=N'Header'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SupplierDetails].[Trailer]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SupplierDetails', @level2type=N'COLUMN',@level2name=N'Trailer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SupplierDetails].[ComPort]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SupplierDetails', @level2type=N'COLUMN',@level2name=N'ComPort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SupplierDetails].[InitString]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SupplierDetails', @level2type=N'COLUMN',@level2name=N'InitString'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SupplierDetails].[Parity]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SupplierDetails', @level2type=N'COLUMN',@level2name=N'Parity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SupplierDetails].[DataBits]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SupplierDetails', @level2type=N'COLUMN',@level2name=N'DataBits'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SupplierDetails].[StopBits]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SupplierDetails', @level2type=N'COLUMN',@level2name=N'StopBits'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SupplierDetails].[BaudRate]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SupplierDetails', @level2type=N'COLUMN',@level2name=N'BaudRate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SupplierDetails].[HangupString]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SupplierDetails', @level2type=N'COLUMN',@level2name=N'HangupString'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SupplierDetails].[Message]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SupplierDetails', @level2type=N'COLUMN',@level2name=N'Message'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SupplierDetails].[DialingPrefix]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SupplierDetails', @level2type=N'COLUMN',@level2name=N'DialingPrefix'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SupplierDetails].[ModemReplyFile]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SupplierDetails', @level2type=N'COLUMN',@level2name=N'ModemReplyFile'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SupplierDetails].[ModemReplyWait]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SupplierDetails', @level2type=N'COLUMN',@level2name=N'ModemReplyWait'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SupplierDetails]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SupplierDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'lots.[SupplierDetails].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SupplierDetails', @level2type=N'CONSTRAINT',@level2name=N'SupplierDetails$PrimaryKey'
GO
USE [master]
GO
ALTER DATABASE [STAGING_LOTS] SET  READ_WRITE 
GO
