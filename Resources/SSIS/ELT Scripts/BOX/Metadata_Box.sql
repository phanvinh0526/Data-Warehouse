USE [master]
GO
/****** Object:  Database [Metadata_Box]    Script Date: 29/08/2017 3:55:54 PM ******/
CREATE DATABASE [Metadata_Box]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MetadataBox', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\MetadataBox.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MetadataBox_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\MetadataBox_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Metadata_Box] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Metadata_Box].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Metadata_Box] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Metadata_Box] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Metadata_Box] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Metadata_Box] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Metadata_Box] SET ARITHABORT OFF 
GO
ALTER DATABASE [Metadata_Box] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Metadata_Box] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Metadata_Box] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Metadata_Box] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Metadata_Box] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Metadata_Box] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Metadata_Box] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Metadata_Box] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Metadata_Box] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Metadata_Box] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Metadata_Box] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Metadata_Box] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Metadata_Box] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Metadata_Box] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Metadata_Box] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Metadata_Box] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Metadata_Box] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Metadata_Box] SET RECOVERY FULL 
GO
ALTER DATABASE [Metadata_Box] SET  MULTI_USER 
GO
ALTER DATABASE [Metadata_Box] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Metadata_Box] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Metadata_Box] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Metadata_Box] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Metadata_Box] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Metadata_Box', N'ON'
GO
USE [Metadata_Box]
GO
/****** Object:  User [vinhphan]    Script Date: 29/08/2017 3:55:55 PM ******/
CREATE USER [vinhphan] FOR LOGIN [vinhphan] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [dw_user]    Script Date: 29/08/2017 3:55:55 PM ******/
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
/****** Object:  Table [dbo].[CDC]    Script Date: 29/08/2017 3:55:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CDC](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TableId] [int] NULL,
	[FirstTimeETL] [char](1) NULL,
	[LastUpdatedVersionId] [int] NULL,
	[LastUpdatedDate] [datetime] NULL,
	[LastUpdatedId] [int] NULL,
	[LSET] [datetime] NULL,
	[LastTimeStamp] [timestamp] NULL,
 CONSTRAINT [PK_CDC] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Database]    Script Date: 29/08/2017 3:55:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Database](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [int] NULL,
	[StoreName] [varchar](128) NULL,
	[DatabaseName] [varchar](128) NULL,
	[Status] [varchar](128) NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_Store] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Table]    Script Date: 29/08/2017 3:55:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Table](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TableName] [varchar](128) NULL,
	[DatabaseId] [int] NULL,
	[BeforeUpdatedRows] [int] NULL,
	[UpdatedRows] [int] NULL,
	[LastUpdated] [datetime] NULL,
	[Status] [varchar](128) NULL,
	[ErrorDate] [datetime] NULL,
	[DB_UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_Table] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TablesDescription]    Script Date: 29/08/2017 3:55:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TablesDescription](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DatabaseId] [int] NULL,
	[TableId] [int] NULL,
	[Field] [varchar](128) NULL,
	[Description] [varchar](1000) NULL,
	[UpdatedDate] [datetime] NULL CONSTRAINT [DF_TablesDescription_UpdatedDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_TablesDescription] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Database] ON 

INSERT [dbo].[Database] ([ID], [StoreID], [StoreName], [DatabaseName], [Status], [UpdatedDate]) VALUES (1, 1, N'Autumn Place Pharmacy', N'Price Line POS', NULL, NULL)
INSERT [dbo].[Database] ([ID], [StoreID], [StoreName], [DatabaseName], [Status], [UpdatedDate]) VALUES (2, 1, N'Autumn Place Pharmacy', N'Fred Dispense', NULL, NULL)
INSERT [dbo].[Database] ([ID], [StoreID], [StoreName], [DatabaseName], [Status], [UpdatedDate]) VALUES (3, 1, N'Autumn Place Pharmacy', N'Fred Office', NULL, NULL)
INSERT [dbo].[Database] ([ID], [StoreID], [StoreName], [DatabaseName], [Status], [UpdatedDate]) VALUES (4, 2, N'Linden Pharmacy', N'Lots POS', NULL, NULL)
INSERT [dbo].[Database] ([ID], [StoreID], [StoreName], [DatabaseName], [Status], [UpdatedDate]) VALUES (5, 2, N'Linden Pharmacy', N'Fred Dispense', NULL, NULL)
INSERT [dbo].[Database] ([ID], [StoreID], [StoreName], [DatabaseName], [Status], [UpdatedDate]) VALUES (6, 2, N'Linden Pharmacy', N'Fred Office', NULL, NULL)
INSERT [dbo].[Database] ([ID], [StoreID], [StoreName], [DatabaseName], [Status], [UpdatedDate]) VALUES (7, 3, N'Raymond Pharmacy', N'Lots POS', NULL, NULL)
INSERT [dbo].[Database] ([ID], [StoreID], [StoreName], [DatabaseName], [Status], [UpdatedDate]) VALUES (8, 3, N'Raymond Pharmacy', N'Fred Dispense', NULL, NULL)
INSERT [dbo].[Database] ([ID], [StoreID], [StoreName], [DatabaseName], [Status], [UpdatedDate]) VALUES (9, 4, N'Risdon Vale Pharmacy', N'Fred POS', NULL, NULL)
INSERT [dbo].[Database] ([ID], [StoreID], [StoreName], [DatabaseName], [Status], [UpdatedDate]) VALUES (10, 4, N'Risdon Vale Pharmacy', N'Fred Dispense', NULL, NULL)
INSERT [dbo].[Database] ([ID], [StoreID], [StoreName], [DatabaseName], [Status], [UpdatedDate]) VALUES (11, 4, N'Risdon Vale Pharmacy', N'Fred Office', NULL, NULL)
INSERT [dbo].[Database] ([ID], [StoreID], [StoreName], [DatabaseName], [Status], [UpdatedDate]) VALUES (12, 5, N'St George Pharmacy', NULL, NULL, NULL)
INSERT [dbo].[Database] ([ID], [StoreID], [StoreName], [DatabaseName], [Status], [UpdatedDate]) VALUES (13, 5, N'St George Pharmacy', NULL, NULL, NULL)
INSERT [dbo].[Database] ([ID], [StoreID], [StoreName], [DatabaseName], [Status], [UpdatedDate]) VALUES (14, 5, N'St George Pharmacy', NULL, NULL, NULL)
INSERT [dbo].[Database] ([ID], [StoreID], [StoreName], [DatabaseName], [Status], [UpdatedDate]) VALUES (15, 6, N'Pharmacy@Knox', N'Lots POS', NULL, NULL)
INSERT [dbo].[Database] ([ID], [StoreID], [StoreName], [DatabaseName], [Status], [UpdatedDate]) VALUES (16, 6, N'Pharmacy@Knox', N'Fred Dispense', NULL, NULL)
INSERT [dbo].[Database] ([ID], [StoreID], [StoreName], [DatabaseName], [Status], [UpdatedDate]) VALUES (17, 7, N'TerryWhite Knox Pharmacy', N'Fred Dispense', NULL, NULL)
INSERT [dbo].[Database] ([ID], [StoreID], [StoreName], [DatabaseName], [Status], [UpdatedDate]) VALUES (18, 7, N'TerryWhite Knox Pharmacy', N'Fred Office', NULL, NULL)
INSERT [dbo].[Database] ([ID], [StoreID], [StoreName], [DatabaseName], [Status], [UpdatedDate]) VALUES (19, 7, N'TerryWhite Knox Pharmacy', N'Fred POS', NULL, NULL)
INSERT [dbo].[Database] ([ID], [StoreID], [StoreName], [DatabaseName], [Status], [UpdatedDate]) VALUES (20, 8, N'Langton Pharmacy', NULL, NULL, NULL)
INSERT [dbo].[Database] ([ID], [StoreID], [StoreName], [DatabaseName], [Status], [UpdatedDate]) VALUES (21, 8, N'Langton Pharmacy', NULL, NULL, NULL)
INSERT [dbo].[Database] ([ID], [StoreID], [StoreName], [DatabaseName], [Status], [UpdatedDate]) VALUES (22, 8, N'Langton Pharmacy', NULL, NULL, NULL)
INSERT [dbo].[Database] ([ID], [StoreID], [StoreName], [DatabaseName], [Status], [UpdatedDate]) VALUES (23, 9, N'TerryWhite Brimbank Pharmacy', N'Fred Dispense', NULL, NULL)
INSERT [dbo].[Database] ([ID], [StoreID], [StoreName], [DatabaseName], [Status], [UpdatedDate]) VALUES (24, 9, N'TerryWhite Brimbank Pharmacy', N'Fred Office', NULL, NULL)
INSERT [dbo].[Database] ([ID], [StoreID], [StoreName], [DatabaseName], [Status], [UpdatedDate]) VALUES (25, 9, N'TerryWhite Brimbank Pharmacy', N'Fred POS', NULL, NULL)
INSERT [dbo].[Database] ([ID], [StoreID], [StoreName], [DatabaseName], [Status], [UpdatedDate]) VALUES (26, 10, N'Doctor@Knox Clinic', N'Best Practice', NULL, NULL)
INSERT [dbo].[Database] ([ID], [StoreID], [StoreName], [DatabaseName], [Status], [UpdatedDate]) VALUES (27, 11, N'Medcentral Knox Clinic', N'Best Practice', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Database] OFF
SET IDENTITY_INSERT [dbo].[TablesDescription] ON 

INSERT [dbo].[TablesDescription] ([ID], [DatabaseId], [TableId], [Field], [Description], [UpdatedDate]) VALUES (1, NULL, NULL, N'Status', N'"enable" or "disable", so we can detect which table is activated', CAST(N'2017-08-29 15:49:30.963' AS DateTime))
INSERT [dbo].[TablesDescription] ([ID], [DatabaseId], [TableId], [Field], [Description], [UpdatedDate]) VALUES (2, NULL, NULL, N'UpdatedRows', N'the number if rows which has been transferred to Box in the last ETL', CAST(N'2017-08-29 15:50:45.710' AS DateTime))
INSERT [dbo].[TablesDescription] ([ID], [DatabaseId], [TableId], [Field], [Description], [UpdatedDate]) VALUES (3, NULL, NULL, N'LastUpdated', N'the last ETL in datetime', CAST(N'2017-08-29 15:51:09.177' AS DateTime))
INSERT [dbo].[TablesDescription] ([ID], [DatabaseId], [TableId], [Field], [Description], [UpdatedDate]) VALUES (4, NULL, NULL, N'ErrorDate', N'if the ETL has eerors, please update this column, so that we can trace back in log files', CAST(N'2017-08-29 15:53:22.990' AS DateTime))
INSERT [dbo].[TablesDescription] ([ID], [DatabaseId], [TableId], [Field], [Description], [UpdatedDate]) VALUES (5, NULL, NULL, N'FirstTimeETL', N'is "T" or "F", True is the first time, the ETL will transfer all data from Source to Destination, otherwise it just transfers the changed data', CAST(N'2017-08-29 15:54:05.830' AS DateTime))
INSERT [dbo].[TablesDescription] ([ID], [DatabaseId], [TableId], [Field], [Description], [UpdatedDate]) VALUES (6, NULL, NULL, N'LastUpdatedVersionId', N'for CDC Tracking approach', CAST(N'2017-08-29 15:54:27.757' AS DateTime))
INSERT [dbo].[TablesDescription] ([ID], [DatabaseId], [TableId], [Field], [Description], [UpdatedDate]) VALUES (7, NULL, NULL, N'LastUpdatedId', N'for CDC Increment approach', CAST(N'2017-08-29 15:54:47.540' AS DateTime))
INSERT [dbo].[TablesDescription] ([ID], [DatabaseId], [TableId], [Field], [Description], [UpdatedDate]) VALUES (8, NULL, NULL, N'LSET', N'for CDC traditional approach', CAST(N'2017-08-29 15:54:59.070' AS DateTime))
INSERT [dbo].[TablesDescription] ([ID], [DatabaseId], [TableId], [Field], [Description], [UpdatedDate]) VALUES (9, NULL, NULL, N'LastTimeStamp', N'for CDC Timstamp approach', CAST(N'2017-08-29 15:55:14.710' AS DateTime))
SET IDENTITY_INSERT [dbo].[TablesDescription] OFF
ALTER TABLE [dbo].[CDC] ADD  CONSTRAINT [DF_CDC_FirstTimeETL]  DEFAULT ('T') FOR [FirstTimeETL]
GO
ALTER TABLE [dbo].[Table] ADD  CONSTRAINT [DF_Table_DB_UpdatedDate]  DEFAULT (getdate()) FOR [DB_UpdatedDate]
GO
ALTER TABLE [dbo].[CDC]  WITH CHECK ADD  CONSTRAINT [FK_CDC_Table] FOREIGN KEY([TableId])
REFERENCES [dbo].[Table] ([ID])
GO
ALTER TABLE [dbo].[CDC] CHECK CONSTRAINT [FK_CDC_Table]
GO
ALTER TABLE [dbo].[Table]  WITH CHECK ADD  CONSTRAINT [FK_Table_Database] FOREIGN KEY([DatabaseId])
REFERENCES [dbo].[Database] ([ID])
GO
ALTER TABLE [dbo].[Table] CHECK CONSTRAINT [FK_Table_Database]
GO
ALTER TABLE [dbo].[TablesDescription]  WITH CHECK ADD  CONSTRAINT [FK_TablesDescription_Database] FOREIGN KEY([DatabaseId])
REFERENCES [dbo].[Database] ([ID])
GO
ALTER TABLE [dbo].[TablesDescription] CHECK CONSTRAINT [FK_TablesDescription_Database]
GO
ALTER TABLE [dbo].[TablesDescription]  WITH CHECK ADD  CONSTRAINT [FK_TablesDescription_Table] FOREIGN KEY([TableId])
REFERENCES [dbo].[Table] ([ID])
GO
ALTER TABLE [dbo].[TablesDescription] CHECK CONSTRAINT [FK_TablesDescription_Table]
GO
USE [master]
GO
ALTER DATABASE [Metadata_Box] SET  READ_WRITE 
GO
