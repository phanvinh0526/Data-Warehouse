USE [BOX_COM_1]
GO
ALTER DATABASE [BOX_COM_1] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BOX_COM_1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BOX_COM_1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BOX_COM_1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BOX_COM_1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BOX_COM_1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BOX_COM_1] SET ARITHABORT OFF 
GO
ALTER DATABASE [BOX_COM_1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BOX_COM_1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BOX_COM_1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BOX_COM_1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BOX_COM_1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BOX_COM_1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BOX_COM_1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BOX_COM_1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BOX_COM_1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BOX_COM_1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BOX_COM_1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BOX_COM_1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BOX_COM_1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BOX_COM_1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BOX_COM_1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BOX_COM_1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BOX_COM_1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BOX_COM_1] SET RECOVERY FULL 
GO
ALTER DATABASE [BOX_COM_1] SET  MULTI_USER 
GO
ALTER DATABASE [BOX_COM_1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BOX_COM_1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BOX_COM_1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BOX_COM_1] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BOX_COM_1] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BOX_COM_1', N'ON'
GO
USE [BOX_COM_1]
GO
/****** Object:  User [vinhphan]    Script Date: 19/08/2017 6:40:39 AM ******/
CREATE USER [vinhphan] FOR LOGIN [vinhphan] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [dw_user]    Script Date: 19/08/2017 6:40:39 AM ******/
CREATE USER [dw_user] FOR LOGIN [dw_user] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [dw_user]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [dw_user]
GO
ALTER ROLE [db_datareader] ADD MEMBER [dw_user]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [dw_user]
GO
/****** Object:  Table [dbo].[SaleItem]    Script Date: 19/08/2017 6:40:39 AM ******/
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
	[RemoveFromLayby] [smallint] NULL,
	[GSTPayable] [int] NULL,
 CONSTRAINT [PK_SaleItem] PRIMARY KEY CLUSTERED 
(
	[SaleItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalePayment]    Script Date: 19/08/2017 6:40:39 AM ******/
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
	[LaybyStaffID] [int] NULL,
 CONSTRAINT [PK_SalePayment] PRIMARY KEY CLUSTERED 
(
	[SalePaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sales]    Script Date: 19/08/2017 6:40:39 AM ******/
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
	[LoyaltyCard] [nvarchar](20) NULL,
	[LaybyPersonID] [int] NULL,
	[LaybyStatus] [int] NULL,
	[HOTranID] [int] NULL,
 CONSTRAINT [PK_Sales] PRIMARY KEY CLUSTERED 
(
	[SaleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ScriptLink]    Script Date: 19/08/2017 6:40:39 AM ******/
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
	[DateTimeTransferred] [datetime2](7) NULL,
	[GSTAmount] [int] NULL,
 CONSTRAINT [PK_ScriptLink] PRIMARY KEY CLUSTERED 
(
	[ScriptLinkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
USE [master]
GO
ALTER DATABASE [BOX_COM_1] SET  READ_WRITE 
GO
