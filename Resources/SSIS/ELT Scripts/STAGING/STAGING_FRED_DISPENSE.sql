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
/****** Object:  Database [STAGING_FRED_DISPENSE]    Script Date: 14/09/2017 10:53:14 AM ******/
CREATE DATABASE [STAGING_FRED_DISPENSE]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'STAGING_FRED_DISPENSE', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.AUTUMNGROUP\MSSQL\DATA\STAGING_FRED_DISPENSE.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'STAGING_FRED_DISPENSE_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.AUTUMNGROUP\MSSQL\DATA\STAGING_FRED_DISPENSE_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [STAGING_FRED_DISPENSE] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [STAGING_FRED_DISPENSE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [STAGING_FRED_DISPENSE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [STAGING_FRED_DISPENSE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [STAGING_FRED_DISPENSE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [STAGING_FRED_DISPENSE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [STAGING_FRED_DISPENSE] SET ARITHABORT OFF 
GO
ALTER DATABASE [STAGING_FRED_DISPENSE] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [STAGING_FRED_DISPENSE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [STAGING_FRED_DISPENSE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [STAGING_FRED_DISPENSE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [STAGING_FRED_DISPENSE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [STAGING_FRED_DISPENSE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [STAGING_FRED_DISPENSE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [STAGING_FRED_DISPENSE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [STAGING_FRED_DISPENSE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [STAGING_FRED_DISPENSE] SET  DISABLE_BROKER 
GO
ALTER DATABASE [STAGING_FRED_DISPENSE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [STAGING_FRED_DISPENSE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [STAGING_FRED_DISPENSE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [STAGING_FRED_DISPENSE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [STAGING_FRED_DISPENSE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [STAGING_FRED_DISPENSE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [STAGING_FRED_DISPENSE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [STAGING_FRED_DISPENSE] SET RECOVERY FULL 
GO
ALTER DATABASE [STAGING_FRED_DISPENSE] SET  MULTI_USER 
GO
ALTER DATABASE [STAGING_FRED_DISPENSE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [STAGING_FRED_DISPENSE] SET DB_CHAINING OFF 
GO
ALTER DATABASE [STAGING_FRED_DISPENSE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [STAGING_FRED_DISPENSE] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [STAGING_FRED_DISPENSE] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'STAGING_FRED_DISPENSE', N'ON'
GO
USE [STAGING_FRED_DISPENSE]
GO
/****** Object:  User [dw_user]    Script Date: 14/09/2017 10:53:14 AM ******/
CREATE USER [dw_user] FOR LOGIN [dw_user] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [dw_user]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [dw_user]
GO
/****** Object:  Table [dbo].[claim]    Script Date: 14/09/2017 10:53:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[claim](
	[claimkey] [decimal](10, 0) NULL,
	[claimper] [decimal](4, 0) NULL,
	[claimpart] [decimal](2, 0) NULL,
	[claimdate] [datetime] NULL,
	[claimcat] [nvarchar](1) NULL,
	[claimno] [decimal](5, 0) NULL,
	[clformcat] [decimal](1, 0) NULL,
	[clpaycat] [decimal](1, 0) NULL,
	[claimentno] [nvarchar](11) NULL,
	[claimrxno] [decimal](8, 0) NULL,
	[claimamt] [decimal](7, 2) NULL,
	[clstatus] [nvarchar](1) NULL,
	[clmedicare] [nvarchar](11) NULL,
	[clmcfname] [nvarchar](12) NULL,
	[clmcsname] [nvarchar](24) NULL,
	[clpbsref] [nvarchar](12) NULL,
	[clpbsprob] [nvarchar](59) NULL,
	[clpbsaccep] [nvarchar](1) NULL,
	[clpbsack] [nvarchar](1) NULL,
	[clpbsresub] [nvarchar](1) NULL,
	[clpbspaydt] [datetime] NULL,
	[clpbsamt] [decimal](7, 2) NULL,
	[clpbsadj] [decimal](8, 2) NULL,
	[clpbsproc] [nvarchar](2) NULL,
	[clpbsproch] [nvarchar](2) NULL,
	[cclaimref] [decimal](4, 0) NULL,
	[pbspayment] [nvarchar](12) NULL,
	[clpbspaid] [bit] NOT NULL,
	[oincentamt] [decimal](7, 2) NULL,
	[dincentamt] [decimal](7, 2) NULL,
	[eincentamt] [decimal](7, 2) NULL,
	[pesid] [nvarchar](3) NULL,
	[IID] [bigint] IDENTITY(1,1) NOT NULL,
	[Location] [int] NOT NULL,
	[UploadDate] [datetime] NOT NULL,
 CONSTRAINT [PK_claim] PRIMARY KEY CLUSTERED 
(
	[IID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[family]    Script Date: 14/09/2017 10:53:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[family](
	[fcode] [decimal](4, 0) NULL,
	[frxcnt] [decimal](4, 0) NULL,
	[fsafeamt] [decimal](7, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[manufact]    Script Date: 14/09/2017 10:53:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[manufact](
	[mfcode] [nvarchar](2) NULL,
	[mfdesc] [nvarchar](25) NULL,
	[mfphone] [nvarchar](14) NULL,
	[mffax] [nvarchar](14) NULL,
	[IID] [bigint] IDENTITY(1,1) NOT NULL,
	[Location] [int] NOT NULL,
	[UploadDate] [datetime] NOT NULL,
 CONSTRAINT [PK_manufact] PRIMARY KEY CLUSTERED 
(
	[IID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[patient]    Script Date: 14/09/2017 10:53:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[patient](
	[pnumber] [decimal](6, 0) NULL,
	[psurname] [nvarchar](16) NULL,
	[pfirstname] [nvarchar](16) NULL,
	[ptitle] [nvarchar](6) NULL,
	[paddress] [nvarchar](22) NULL,
	[psuburb] [nvarchar](18) NULL,
	[ppostcode] [decimal](4, 0) NULL,
	[pfamcode] [decimal](4, 0) NULL,
	[psex] [nvarchar](1) NULL,
	[pphoneno] [nvarchar](12) NULL,
	[pemail] [nvarchar](44) NULL,
	[pstatus] [nvarchar](1) NULL,
	[ptype] [nvarchar](1) NULL,
	[pconctype] [nvarchar](1) NULL,
	[pconcno] [nvarchar](11) NULL,
	[pconcvdate] [datetime] NULL,
	[prepatno] [nvarchar](10) NULL,
	[prepatcol] [nvarchar](1) NULL,
	[psafentno] [nvarchar](11) NULL,
	[pbirthdate] [datetime] NULL,
	[pmedicare] [nvarchar](11) NULL,
	[pmedicdate] [datetime] NULL,
	[pallergy] [nvarchar](25) NULL,
	[pdebtor_p] [bit] NOT NULL,
	[pdebtcode] [decimal](6, 0) NULL,
	[pdiscount] [decimal](4, 1) NULL,
	[pdocbag] [bit] NOT NULL,
	[pnursecode] [nvarchar](4) NULL,
	[proomno] [nvarchar](4) NULL,
	[pbedno] [nvarchar](2) NULL,
	[purnumber] [decimal](8, 0) NULL,
	[pwardno] [nvarchar](4) NULL,
	[padmission] [decimal](8, 0) NULL,
	[paccttype] [nvarchar](1) NULL,
	[pmailcat] [nvarchar](4) NULL,
	[phfundid] [nvarchar](4) NULL,
	[phftable] [nvarchar](6) NULL,
	[phfundmno] [decimal](9, 0) NULL,
	[pinsvdate] [datetime] NULL,
	[powescript] [nvarchar](1) NULL,
	[prptonfile] [nvarchar](1) NULL,
	[pgenonly] [nvarchar](1) NULL,
	[pautorecpt] [nvarchar](1) NULL,
	[papplygst] [nvarchar](1) NULL,
	[pprvfeemup] [nvarchar](3) NULL,
	[pmcconsent] [nvarchar](1) NULL,
	[pfamilyind] [nvarchar](1) NULL,
	[prxcnt] [decimal](3, 0) NULL,
	[psafeamt] [decimal](7, 2) NULL,
	[poutrxcnt] [decimal](3, 0) NULL,
	[poutsnamt] [decimal](7, 2) NULL,
	[pnotes] [nvarchar](max) NULL,
	[pchartdt] [datetime] NULL,
	[pchartdur] [decimal](6, 2) NULL,
	[IID] [bigint] IDENTITY(1,1) NOT NULL,
	[Location] [int] NOT NULL,
	[UploadDate] [datetime] NOT NULL,
 CONSTRAINT [PK_patient] PRIMARY KEY CLUSTERED 
(
	[IID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[patnote]    Script Date: 14/09/2017 10:53:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[patnote](
	[pnpatno] [decimal](6, 0) NULL,
	[pndate] [datetime] NULL,
	[pnrxno] [decimal](8, 0) NULL,
	[pnnote] [nvarchar](max) NULL,
	[pntype] [nvarchar](1) NULL,
	[pnclass] [nvarchar](4) NULL,
	[pntime] [decimal](2, 0) NULL,
	[pncat] [decimal](1, 0) NULL,
	[pnhosp] [nvarchar](4) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pcategory]    Script Date: 14/09/2017 10:53:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pcategory](
	[catid] [nvarchar](3) NULL,
	[category] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pevent]    Script Date: 14/09/2017 10:53:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pevent](
	[eventid] [nvarchar](3) NULL,
	[evidentity] [nvarchar](2) NULL,
	[event] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pharmdet]    Script Date: 14/09/2017 10:53:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pharmdet](
	[pharminit] [nvarchar](2) NULL,
	[pharmfname] [nvarchar](15) NULL,
	[pharmsname] [nvarchar](20) NULL,
	[pharmpword] [nvarchar](254) NULL,
	[pharmregno] [nvarchar](10) NULL,
	[pharmdtime] [nvarchar](22) NULL,
	[pharmlevel] [decimal](2, 0) NULL,
	[pharmuname] [nvarchar](254) NULL,
	[pharmpassw] [nvarchar](254) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[precommend]    Script Date: 14/09/2017 10:53:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[precommend](
	[recid] [nvarchar](3) NULL,
	[ridentity] [nvarchar](2) NULL,
	[recommend] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[psubcategory]    Script Date: 14/09/2017 10:53:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[psubcategory](
	[scid] [nvarchar](3) NULL,
	[sccatid] [nvarchar](3) NULL,
	[scidentity] [nvarchar](3) NULL,
	[sccategory] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[script]    Script Date: 14/09/2017 10:53:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[script](
	[srxno] [decimal](8, 0) NULL,
	[srptno] [nvarchar](6) NULL,
	[srptrxno] [decimal](8, 0) NULL,
	[sdispdate] [datetime] NULL,
	[spatno] [decimal](6, 0) NULL,
	[srxdate] [datetime] NULL,
	[stype] [nvarchar](4) NULL,
	[sdoccode] [nvarchar](4) NULL,
	[sdocpresno] [decimal](7, 0) NULL,
	[sdocname] [nvarchar](20) NULL,
	[sdrugcode] [nvarchar](6) NULL,
	[sgencode] [nvarchar](6) NULL,
	[sldrugord] [nvarchar](1) NULL,
	[sdrugdesc] [nvarchar](42) NULL,
	[saltdesc] [nvarchar](30) NULL,
	[sdintgrp] [decimal](3, 0) NULL,
	[snhscode] [nvarchar](5) NULL,
	[smanufcode] [nvarchar](2) NULL,
	[sqty] [decimal](4, 0) NULL,
	[smaxdisp] [decimal](2, 0) NULL,
	[sdispno] [decimal](2, 0) NULL,
	[sauthno] [decimal](8, 0) NULL,
	[sauthority] [bit] NOT NULL,
	[ssigs] [nvarchar](max) NULL,
	[spharminit] [nvarchar](2) NULL,
	[sorigrxno] [nvarchar](10) NULL,
	[sorigpharm] [nvarchar](6) NULL,
	[sclass] [nvarchar](1) NULL,
	[sstatus] [nvarchar](1) NULL,
	[soutsidrpt] [nvarchar](1) NULL,
	[snarcotic] [bit] NOT NULL,
	[sdeferred] [bit] NOT NULL,
	[sgstinc] [nvarchar](1) NULL,
	[spostfrqty] [decimal](4, 0) NULL,
	[spatprice] [decimal](7, 2) NULL,
	[ssnamt] [decimal](5, 2) NULL,
	[swscost] [decimal](7, 2) NULL,
	[sgovrecamt] [decimal](7, 2) NULL,
	[swardno] [nvarchar](4) NULL,
	[shosporpat] [nvarchar](1) NULL,
	[sfreeind1] [nvarchar](1) NULL,
	[sfreeind2] [nvarchar](8) NULL,
	[sfreeind3] [nvarchar](2) NULL,
	[sfreeind4] [nvarchar](2) NULL,
	[IID] [bigint] IDENTITY(1,1) NOT NULL,
	[Location] [int] NOT NULL,
	[UploadDate] [datetime] NOT NULL,
 CONSTRAINT [PK_script] PRIMARY KEY CLUSTERED 
(
	[IID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[suburbs]    Script Date: 14/09/2017 10:53:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[suburbs](
	[postcode] [int] NULL,
	[suburb] [nvarchar](50) NULL,
	[state] [nvarchar](3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[warnings]    Script Date: 14/09/2017 10:53:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[warnings](
	[warncode] [nvarchar](4) NULL,
	[warntext] [nvarchar](40) NULL,
	[warnsig] [nvarchar](6) NULL,
	[warnclass] [nvarchar](1) NULL,
	[warntype] [nvarchar](1) NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [STAGING_FRED_DISPENSE] SET  READ_WRITE 
GO
