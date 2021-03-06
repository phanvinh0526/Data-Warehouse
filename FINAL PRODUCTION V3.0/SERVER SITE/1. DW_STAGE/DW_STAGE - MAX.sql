USE [master]
GO

IF EXISTS(SELECT 1 FROM [sys].[databases] WHERE name ='DW_STAGE')
	DROP DATABASE [DW_STAGE]
GO

CREATE DATABASE [DW_STAGE]
GO

USE [DW_STAGE]
GO
/****** Object:  Table [dbo].[CONNECT_AppCat_Alias]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONNECT_AppCat_Alias](
	[ID] [int] NULL,
	[ItemHQID] [int] NULL,
	[Alias] [nvarchar](MAX) NULL,
	[LastApplied] [datetime] NULL,
	[LastUpdated] [datetime] NULL,
	[LastRemoved] [datetime] NULL,
	[IsFREDDrugCode] [bit] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CONNECT_AppCat_Category]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONNECT_AppCat_Category](
	[HQID] [int] NULL,
	[DepartmentHQID] [int] NULL,
	[Name] [nvarchar](MAX) NULL,
	[LastApplied] [datetime] NULL,
	[LastUpdated] [datetime] NULL,
	[LastRemoved] [datetime] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CONNECT_AppCat_Department]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONNECT_AppCat_Department](
	[HQID] [int] NULL,
	[Name] [nvarchar](MAX) NULL,
	[LastApplied] [datetime] NULL,
	[LastUpdated] [datetime] NULL,
	[LastRemoved] [datetime] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CONNECT_AppCat_Ignore]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CONNECT_AppCat_Ignore](
	[HQID1] [int] NULL,
	[HQID2] [int] NULL,
	[ObjectType] [varchar](50) NULL,
	[Field] [varchar](50) NULL,
	[Ignore] [bit] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CONNECT_AppCat_Item]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CONNECT_AppCat_Item](
	[HQID] [int] NULL,
	[Description] [nvarchar](MAX) NULL,
	[LastApplied] [datetime] NULL,
	[LastUpdated] [datetime] NULL,
	[LastRemoved] [datetime] NULL,
	[DepartmentHQID] [int] NULL,
	[CategoryHQID] [int] NULL,
	[ItemnotDiscountable] [bit] NULL,
	[Schedule] [nvarchar](MAX) NULL,
	[Sales_TAX] [float] NULL,
	[GST_TAX] [char](1) NULL,
	[ManufacturerHQID] [int] NULL,
	[imagedata] [image] NULL,
	[consumerdescription] [nvarchar](MAX) NULL,
	[imagetype] [nvarchar](MAX) NULL,
	[imagesize] [int] NULL,
	[imagename] [nvarchar](MAX) NULL,
	[ausregnumber] [nvarchar](MAX) NULL,
	[freddrugcode] [nvarchar](MAX) NULL,
	[StoreID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CONNECT_AppCat_Supplier]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CONNECT_AppCat_Supplier](
	[HQID] [int] NULL,
	[Name] [nvarchar](MAX) NULL,
	[State] [nvarchar](MAX) NULL,
	[LastApplied] [datetime] NULL,
	[LastUpdated] [datetime] NULL,
	[LastRemoved] [datetime] NULL,
	[ContactName] [nvarchar](MAX) NULL,
	[Address1] [nvarchar](MAX) NULL,
	[Address2] [nvarchar](MAX) NULL,
	[Suburb] [nvarchar](MAX) NULL,
	[Postcode] [nvarchar](MAX) NULL,
	[PhoneNumber] [nvarchar](MAX) NULL,
	[FaxNumber] [nvarchar](MAX) NULL,
	[EmailAddress] [nvarchar](MAX) NULL,
	[WebAddress] [nvarchar](MAX) NULL,
	[Type] [char](1) NULL,
	[ProxySupplierHQID] [int] NULL,
	[PriceDescription1] [nvarchar](MAX) NULL,
	[PriceDescription2] [nvarchar](MAX) NULL,
	[PriceDescription3] [nvarchar](MAX) NULL,
	[PriceDescription4] [nvarchar](MAX) NULL,
	[PriceDescription5] [nvarchar](MAX) NULL,
	[PriceDescription6] [nvarchar](MAX) NULL,
	[PriceDescription7] [nvarchar](MAX) NULL,
	[PriceDescription8] [nvarchar](MAX) NULL,
	[PriceDescription9] [nvarchar](MAX) NULL,
	[PriceDescription10] [nvarchar](MAX) NULL,
	[PriceIncGST1] [bit] NULL,
	[PriceIncGST2] [bit] NULL,
	[PriceIncGST3] [bit] NULL,
	[PriceIncGST4] [bit] NULL,
	[PriceIncGST5] [bit] NULL,
	[PriceIncGST6] [bit] NULL,
	[PriceIncGST7] [bit] NULL,
	[PriceIncGST8] [bit] NULL,
	[PriceIncGST9] [bit] NULL,
	[PriceIncGST10] [bit] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CONNECT_AppCat_SupplierList]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CONNECT_AppCat_SupplierList](
	[ID] [int] NULL,
	[ItemHQID] [int] NULL,
	[SupplierHQID] [int] NULL,
	[LastApplied] [datetime] NULL,
	[LastUpdated] [datetime] NULL,
	[LastRemoved] [datetime] NULL,
	[ReorderNumber] [nvarchar](MAX) NULL,
	[Replacement_ItemHQID] [int] NULL,
	[Description] [nvarchar](MAX) NULL,
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
	[AlternativeDescription] [nvarchar](MAX) NULL,
	[ManufacturerHQID] [int] NULL,
	[MSP] [float] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CONNECT_WiniFredChanges]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONNECT_WiniFredChanges](
	[id] [bigint] NULL,
	[xmldata] [text] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LOTS_Department]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOTS_Department](
	[DepartmentID] [int] NULL,
	[DeptName] [nvarchar](MAX) NULL,
	[DeptNumber] [int] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LOTS_Doctor]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOTS_Doctor](
	[DoctorID] [int] NULL,
	[FirstName] [nvarchar](MAX) NULL,
	[LastName] [nvarchar](MAX) NULL,
	[Address] [nvarchar](MAX) NULL,
	[Suburb] [nvarchar](MAX) NULL,
	[City] [nvarchar](MAX) NULL,
	[PostCode] [nvarchar](MAX) NULL,
	[PhoneNumber] [nvarchar](MAX) NULL,
	[PrescriberID] [nvarchar](MAX) NULL,
	[DoctorCode] [nvarchar](MAX) NULL,
	[PracticeID] [nvarchar](MAX) NULL,
	[GroupID] [nvarchar](MAX) NULL,
	[Specialist] [smallint] NULL,
	[FaxNumber] [nvarchar](MAX) NULL,
	[PrescriberType] [smallint] NULL,
	[EMail] [nvarchar](MAX) NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LOTS_Drug]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOTS_Drug](
	[DrugID] [int] NULL,
	[GenericName] [nvarchar](MAX) NULL,
	[SpecRegID] [int] NULL,
	[Schedule] [nvarchar](MAX) NULL,
	[Premium] [real] NULL,
	[GenericCost] [int] NULL,
	[MUOveride] [smallint] NULL,
	[QtyLimit] [smallint] NULL,
	[MPSOLimit] [smallint] NULL,
	[ExtempContainer] [float] NULL,
	[UnitType] [nvarchar](MAX) NULL,
	[CostBrandRequired] [smallint] NULL,
	[AdverseDrugReport] [smallint] NULL,
	[WholePacksOnly] [smallint] NULL,
	[NarcoticB] [smallint] NULL,
	[ActualCost] [int] NULL,
	[Type] [nvarchar](MAX) NULL,
	[ClearDays] [real] NULL,
	[SpecialProfFee] [smallint] NULL,
	[DispPack] [real] NULL,
	[TherapGroupID] [int] NULL,
	[DoseFormID] [int] NULL,
	[ListCost] [int] NULL,
	[GenericCode] [int] NULL,
	[SafetyCapRequired] [smallint] NULL,
	[InteractionCatID] [int] NULL,
	[DispQuantity] [real] NULL,
	[ClaimQuantity] [real] NULL,
	[MixtureCard] [smallint] NULL,
	[Brand] [nvarchar](MAX) NULL,
	[MasterDrugID] [int] NULL,
	[DescColour] [int] NULL,
	[DescShape] [int] NULL,
	[DescMarking] [int] NULL,
	[Preferred] [smallint] NULL,
	[MinAge] [smallint] NULL,
	[MaxAge] [smallint] NULL,
	[DepartmentOfHealthReport] [smallint] NULL,
	[OptometristPrescribing] [smallint] NULL,
	[NursePrescribing] [smallint] NULL,
	[IncludeInAmcalTrans] [smallint] NULL,
	[ActualCostNonCTG] [int] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LOTS_External_Department]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOTS_External_Department](
	[USI] [int] NULL,
	[DeptID] [nvarchar](MAX) NULL,
	[Name] [nvarchar](MAX) NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LOTS_External_SubDepartment]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOTS_External_SubDepartment](
	[Ext_SubDeptID] [int] NULL,
	[USI] [int] NULL,
	[SubDeptID] [nvarchar](MAX) NULL,
	[DeptID] [nvarchar](MAX) NULL,
	[Name] [nvarchar](MAX) NULL,
	[LotsProductGroupRef] [int] NULL,
	[CheckoutSubDeptRef] [int] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LOTS_History]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOTS_History](
	[StockID] [int] NULL,
	[Month] [datetime2](0) NULL,
	[QtySold] [real] NULL,
	[ValueSold] [int] NULL,
	[TotalTax] [int] NULL,
	[TotalCost] [int] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LOTS_IncomingStock]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOTS_IncomingStock](
	[IncomingStockID] [int] NULL,
	[StockID] [int] NULL,
	[OrderID] [int] NULL,
	[Description] [nvarchar](MAX) NULL,
	[TotalCost] [int] NULL,
	[TotalGSTPaid] [int] NULL,
	[TransactionDate] [datetime2](0) NULL,
	[SupplierID] [int] NULL,
	[SupplierName] [nvarchar](MAX) NULL,
	[RefNumber] [nvarchar](MAX) NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LOTS_OrderInvoice]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOTS_OrderInvoice](
	[InvoiceID] [int] NULL,
	[InvoiceNumber] [nvarchar](MAX) NULL,
	[SupplierID] [int] NULL,
	[CreateDate] [datetime2](0) NULL,
	[StaffID] [int] NULL,
	[Complete] [smallint] NULL,
	[EndofDayID] [int] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LOTS_OrderInvoiceItems]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOTS_OrderInvoiceItems](
	[InvoiceItemID] [int] NULL,
	[InvoiceID] [int] NULL,
	[OrderID] [int] NULL,
	[StockID] [int] NULL,
	[PartcodeId] [int] NULL,
	[QtyInv] [int] NULL,
	[ListCost] [int] NULL,
	[RealCost] [int] NULL,
	[Retail] [int] NULL,
	[Delivered] [smallint] NULL,
	[Tote] [nvarchar](MAX) NULL,
	[Description] [nvarchar](MAX) NULL,
	[PDE] [nvarchar](MAX) NULL,
	[Transferred] [smallint] NULL,
	[PackSize] [int] NULL,
	[OuterSize] [int] NULL,
	[GSTPaid] [int] NULL,
	[SubTotal] [int] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LOTS_OrderItems]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOTS_OrderItems](
	[OrderItemId] [int] NULL,
	[OrderID] [int] NULL,
	[StockID] [int] NULL,
	[PartcodeId] [int] NULL,
	[Quantity] [int] NULL,
	[PackSize] [int] NULL,
	[OuterSize] [int] NULL,
	[Comment] [nvarchar](MAX) NULL,
	[PDE] [nvarchar](MAX) NULL,
	[InvoiceItemID] [int] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LOTS_Orders]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOTS_Orders](
	[OrderID] [int] NULL,
	[OrderTime] [datetime2](0) NULL,
	[StaffName] [nvarchar](MAX) NULL,
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
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LOTS_Partcode]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOTS_Partcode](
	[PartCodeID] [int] NULL,
	[StockID] [int] NULL,
	[SupplierID] [int] NULL,
	[Name] [nvarchar](MAX) NULL,
	[PartCode] [nvarchar](MAX) NULL,
	[Manufacturer] [smallint] NULL,
	[Preferred] [smallint] NULL,
	[OuterSize] [int] NULL,
	[PackSize] [int] NULL,
	[MinOrderQty] [int] NULL,
	[OrderMultiple] [int] NULL,
	[UpdatedDate] [datetime2](0) NULL,
	[CreatedDate] [datetime2](0) NULL,
	[Discontinued] [smallint] NULL,
	[SupplierMinOrder] [int] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LOTS_Person]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LOTS_Person](
	[PersonID] [int] NULL,
	[FirstName] [nvarchar](MAX) NULL,
	[LastName] [nvarchar](MAX) NULL,
	[TitleID] [int] NULL,
	[Address] [nvarchar](MAX) NULL,
	[Suburb] [nvarchar](MAX) NULL,
	[City] [nvarchar](MAX) NULL,
	[PostCode] [nvarchar](MAX) NULL,
	[PhoneNumber] [nvarchar](MAX) NULL,
	[BirthDate] [datetime2](0) NULL,
	[Comment] [nvarchar](MAX) NULL,
	[PatientCommentID] [int] NULL,
	[FamilyID] [int] NULL,
	[CategoryID] [int] NULL,
	[EntitlementC] [nvarchar](MAX) NULL,
	[EntitlementR] [nvarchar](MAX) NULL,
	[EntitlementSEV] [nvarchar](MAX) NULL,
	[CardExpiryDate] [datetime2](0) NULL,
	[ExternalExemptDate] [datetime2](0) NULL,
	[ExternalSNet] [int] NULL,
	[ExtSNetDate] [datetime2](0) NULL,
	[ExternalSNetValue] [int] NULL,
	[ExtSNetValueDate] [datetime2](0) NULL,
	[MedicareNo] [nvarchar](MAX) NULL,
	[HFMembership] [nvarchar](MAX) NULL,
	[AccountID] [int] NULL,
	[CreditLimit] [int] NULL,
	[PrescriptionsOnAC] [smallint] NULL,
	[ShopItemsOnAC] [smallint] NULL,
	[StopCredit] [smallint] NULL,
	[MessagePOS] [nvarchar](MAX) NULL,
	[PrescriptionDiscount] [real] NULL,
	[ShopItemsDiscount] [real] NULL,
	[AccountClassID] [int] NULL,
	[AutoChargeScripts] [smallint] NULL,
	[HospitalCategory] [nvarchar](MAX) NULL,
	[PrescriptionDiscountPrivate] [real] NULL,
	[Gender] [nvarchar](MAX) NULL,
	[Height] [smallint] NULL,
	[Weight] [smallint] NULL,
	[RoomNumber] [nvarchar](MAX) NULL,
	[HealthInfoID] [int] NULL,
	[DefaultDoctor] [int] NULL,
	[Image] [varbinary](max) NULL,
	[ABNNumber] [nvarchar](MAX) NULL,
	[EndConsumer] [smallint] NULL,
	[MedicareExpiryDate] [nvarchar](MAX) NULL,
	[DiscountLevelID] [int] NULL,
	[MailingID] [int] NULL,
	[MemberCode] [nvarchar](MAX) NULL,
	[MessageText] [nvarchar](MAX) NULL,
	[MedicareName] [nvarchar](MAX) NULL,
	[MedicareSurname] [nvarchar](MAX) NULL,
	[InvMedicare] [smallint] NULL,
	[VACardID] [float] NULL,
	[MainFamilyID] [int] NULL,
	[MedicareConsent] [smallint] NULL,
	[DVAConsent] [smallint] NULL,
	[SFPatientID] [nvarchar](MAX) NULL,
	[CompensationNo] [nvarchar](MAX) NULL,
	[PrintCompensationNo] [smallint] NULL,
	[RelationshipCode] [nvarchar](MAX) NULL,
	[ExcludePromoMail] [smallint] NULL,
	[Email] [nvarchar](MAX) NULL,
	[PromptCharge] [smallint] NULL,
	[HeadOfficeID] [int] NULL,
	[MemberStatus] [nvarchar](MAX) NULL,
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
	[StoreID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LOTS_PriceParsed]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOTS_PriceParsed](
	[ID] [int] NULL,
	[Status] [nvarchar](MAX) NULL,
	[StockID] [int] NULL,
	[PLU] [nvarchar](MAX) NULL,
	[Description] [nvarchar](MAX) NULL,
	[OldList] [int] NULL,
	[NewList] [int] NULL,
	[MarkUp] [int] NULL,
	[OldRetail] [int] NULL,
	[NewRetail] [int] NULL,
	[RecRetail] [int] NULL,
	[GST] [nvarchar](MAX) NULL,
	[outersize] [int] NULL,
	[ordersize] [int] NULL,
	[RealCost] [int] NULL,
	[Processed] [smallint] NULL,
	[barcode] [nvarchar](MAX) NULL,
	[Agency] [nvarchar](MAX) NULL,
	[ProdGrpID] [int] NULL,
	[WSaleID] [int] NULL,
	[Selected] [smallint] NULL,
	[UPI] [int] NULL,
	[OldGP] [int] NULL,
	[NewGP] [int] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LOTS_ProductGroup]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOTS_ProductGroup](
	[ProductGroupID] [int] NULL,
	[ProductGroupName] [nvarchar](MAX) NULL,
	[GST] [money] NULL,
	[RegularDiscount] [money] NULL,
	[ExtraDiscount] [money] NULL,
	[Intensive] [smallint] NULL,
	[DepartmentID] [int] NULL,
	[SubDeptNumber] [int] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LOTS_SaleItem]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOTS_SaleItem](
	[SaleItemID] [int] NULL,
	[SaleID] [int] NULL,
	[StockID] [int] NULL,
	[ScriptID] [int] NULL,
	[Description] [nvarchar](MAX) NULL,
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
	[GSTPayable] [int] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LOTS_SalePayment]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOTS_SalePayment](
	[SalePaymentID] [int] NULL,
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
	[Comment] [nvarchar](MAX) NULL,
	[LaybyPaymentDate] [datetime2](0) NULL,
	[LaybyEndDayID] [int] NULL,
	[LaybyStaffID] [int] NULL,
	[LaybyUnitID] [int] NULL,
	[HOAccountID] [int] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LOTS_Sales]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOTS_Sales](
	[SaleID] [int] NULL,
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
	[LoyaltyCard] [nvarchar](MAX) NULL,
	[LaybyID] [int] NULL,
	[HOTranID] [int] NULL,
	[OriginalInvoiceDate] [datetime2](0) NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LOTS_Script]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOTS_Script](
	[ScriptID] [int] NULL,
	[ScriptNumber] [int] NULL,
	[SaleID] [int] NULL,
	[ReceiptID] [int] NULL,
	[EntitlementNo] [nvarchar](MAX) NULL,
	[SerialNumber] [nvarchar](MAX) NULL,
	[OriginalPhcyNHS] [int] NULL,
	[OrigPharmacyNHS] [nvarchar](MAX) NULL,
	[FormCat] [smallint] NULL,
	[DoctorID] [int] NULL,
	[PersonID] [int] NULL,
	[StaffID] [int] NULL,
	[PatientCategoryID] [int] NULL,
	[Comment] [nvarchar](MAX) NULL,
	[DrugID] [int] NULL,
	[MultiDrugID] [int] NULL,
	[CnANote] [nvarchar](MAX) NULL,
	[ScriptCommentID] [int] NULL,
	[OriginalDrugName] [nvarchar](MAX) NULL,
	[Quantity] [real] NULL,
	[UnitDescriptor] [nvarchar](MAX) NULL,
	[Instructions] [nvarchar](MAX) NULL,
	[DateDispensed] [datetime2](0) NULL,
	[DatePrescribed] [datetime2](0) NULL,
	[ExpiryDate] [datetime2](0) NULL,
	[PatientPrice] [int] NULL,
	[SNCO] [int] NULL,
	[NHSPrice] [int] NULL,
	[AdditionalFees] [int] NULL,
	[CostPrice] [int] NULL,
	[SSRetail] [int] NULL,
	[MixtureCode] [nvarchar](MAX) NULL,
	[MixtureName] [nvarchar](MAX) NULL,
	[RepeatsTotal] [nvarchar](MAX) NULL,
	[RepeatsLeft] [smallint] NULL,
	[ExtRepeatsLeft] [smallint] NULL,
	[OrigNoOfRepeats] [smallint] NULL,
	[RepeatDispensed] [smallint] NULL,
	[VariableRepeat] [smallint] NULL,
	[VariableQuantity] [nvarchar](MAX) NULL,
	[VariableInstruction] [nvarchar](MAX) NULL,
	[ExternalRepeat] [smallint] NULL,
	[Specialist] [smallint] NULL,
	[NSS] [smallint] NULL,
	[NHS] [smallint] NULL,
	[CountToNet] [smallint] NULL,
	[SafetyNet] [int] NULL,
	[SpecialistID] [int] NULL,
	[DateofEndorsement] [datetime2](0) NULL,
	[DrugsOwing] [int] NULL,
	[GenericNameUsed] [smallint] NULL,
	[SpecialRegsApply] [smallint] NULL,
	[Phoned] [smallint] NULL,
	[FoilPack] [smallint] NULL,
	[FoilFrequency] [nvarchar](MAX) NULL,
	[FoilAsReq] [smallint] NULL,
	[Dental] [smallint] NULL,
	[Deferred] [smallint] NULL,
	[PreviouslyDeferred] [smallint] NULL,
	[S3Recordable] [smallint] NULL,
	[Authority] [int] NULL,
	[Reg24] [smallint] NULL,
	[Reg24Authority] [smallint] NULL,
	[EmergencySupply] [smallint] NULL,
	[HBFBenefit] [smallint] NULL,
	[DateClaimed] [nvarchar](MAX) NULL,
	[NoClaim] [smallint] NULL,
	[PersonIDCheck] [int] NULL,
	[TimeDispensed] [datetime2](0) NULL,
	[FailedClaim] [smallint] NULL,
	[GroupCode] [nvarchar](MAX) NULL,
	[ClaimID] [int] NULL,
	[ExceptionalPrice] [smallint] NULL,
	[ClaimRegardless] [smallint] NULL,
	[NHSCodeDispensed] [nvarchar](MAX) NULL,
	[ChildResistantClosure] [smallint] NULL,
	[Stat] [smallint] NULL,
	[CreditClaim] [smallint] NULL,
	[Wastage] [smallint] NULL,
	[Reclaim] [smallint] NULL,
	[ChemNumID] [int] NULL,
	[OriginalClaimID] [int] NULL,
	[MarkupCategory] [nvarchar](MAX) NULL,
	[CTSDaysTreatment] [smallint] NULL,
	[CTSChargeType] [nvarchar](MAX) NULL,
	[CTSSpecifiedPurpose] [nvarchar](MAX) NULL,
	[CTSPatientCategory] [nvarchar](MAX) NULL,
	[SafetyNetConcession] [int] NULL,
	[GSTPaid] [int] NULL,
	[OriginalScriptNo] [nvarchar](MAX) NULL,
	[MedicareNo] [nvarchar](MAX) NULL,
	[MedicareExpiryDate] [nvarchar](MAX) NULL,
	[ProviderID] [int] NULL,
	[StoreRealCost] [int] NULL,
	[AutoCharge] [tinyint] NULL,
	[CnaOnLabel] [smallint] NULL,
	[SNQApplied] [smallint] NULL,
	[HospitalClass] [nvarchar](MAX) NULL,
	[RepeatInterval] [int] NULL,
	[AuthorisationMethod] [int] NULL,
	[GlassBottle] [smallint] NULL,
	[CMINumber] [int] NULL,
	[Optometrist] [smallint] NULL,
	[RobotResponse] [nvarchar](MAX) NULL,
	[RobotQtyDelivered] [smallint] NULL,
	[WebstercareLabel] [smallint] NULL,
	[CTGAnnotation] [nvarchar](MAX) NULL,
	[CTGEstimatedAmount] [int] NULL,
	[UnderCoPayment] [smallint] NULL,
	[StreamlinedNumber] [smallint] NULL,
	[PreviousNonPBS] [smallint] NULL,
	[PrivateBasePrice] [smallint] NULL,
	[MultiDrugIDOriginal] [int] NULL,
	[IgnoreMinPrice] [smallint] NULL,
	[MedicationChart] [smallint] NULL,
	[ContinuedDispensing] [smallint] NULL,
	[IgnoreSpecialPrice] [smallint] NULL,
	[EmergencyProvision] [smallint] NULL,
	[ScriptCompoundID] [int] NULL,
	[CoPaymentDiscount] [int] NULL,
	[MedChartID] [int] NULL,
	[RTACID] [nvarchar](MAX) NULL,
	[TranslatedInstructions] [nvarchar](MAX) NULL,
	[CopayDiscRuleID] [int] NULL,
	[SystemDiscRuleApplied] [smallint] NULL,
	[CopayDiscRuleDescription] [nvarchar](MAX) NULL,
	[ScriptFinishOptionID] [smallint] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LOTS_ScriptLink]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOTS_ScriptLink](
	[ScriptLinkID] [int] NULL,
	[ScriptNumber] [nvarchar](MAX) NULL,
	[ScriptType] [nvarchar](MAX) NULL,
	[SaleID] [int] NULL,
	[PDE] [nvarchar](MAX) NULL,
	[Description] [nvarchar](MAX) NULL,
	[Quantity] [real] NULL,
	[PatientPrice] [int] NULL,
	[NHSPrice] [int] NULL,
	[FirstName] [nvarchar](MAX) NULL,
	[LastName] [nvarchar](MAX) NULL,
	[PatientAddress] [nvarchar](MAX) NULL,
	[AccountNo] [int] NULL,
	[PatientNumber] [int] NULL,
	[DirectDebit] [smallint] NULL,
	[PersonID] [int] NULL,
	[StockID] [int] NULL,
	[DateTimeTransferred] [datetime2](0) NULL,
	[GSTAmount] [int] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LOTS_Staff]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOTS_Staff](
	[StaffID] [int] NULL,
	[StaffInitial] [nvarchar](MAX) NULL,
	[StaffName] [nvarchar](MAX) NULL,
	[StaffNum] [nvarchar](MAX) NULL,
	[PassWord] [nvarchar](MAX) NULL,
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
	[AHPRA] [nvarchar](MAX) NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LOTS_Statement]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOTS_Statement](
	[StatementID] [int] NULL,
	[ClosingDate] [datetime2](0) NULL,
	[ClosingBalance] [int] NULL,
	[AccountID] [int] NULL,
	[TotalSales] [int] NULL,
	[Class] [int] NULL,
	[InstitutionID] [int] NULL,
	[RoomNumber] [nvarchar](MAX) NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LOTS_Stock]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOTS_Stock](
	[StockID] [int] NULL,
	[TradeName] [nvarchar](MAX) NULL,
	[ProductGroupID] [int] NULL,
	[ProductClassID] [int] NULL,
	[ClubID] [int] NULL,
	[PackSize] [real] NULL,
	[OuterSize] [real] NULL,
	[OrderSize] [smallint] NULL,
	[ExtraInfo] [nvarchar](MAX) NULL,
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
	[Label] [nvarchar](MAX) NULL,
	[Message] [nvarchar](MAX) NULL,
	[ListCost] [int] NULL,
	[Markup] [int] NULL,
	[PLU] [nvarchar](MAX) NULL,
	[HotKey] [smallint] NULL,
	[NoDiscount] [smallint] NULL,
	[stockUpdateid] [int] NULL,
	[PreferredSupplierId] [int] NULL,
	[Brand] [nvarchar](MAX) NULL,
	[Manufacturer] [int] NULL,
	[Seasonal] [smallint] NULL,
	[Shelflabel] [smallint] NULL,
	[StockDescription] [nvarchar](MAX) NULL,
	[RecommendedRetail] [int] NULL,
	[GSTGroupID] [int] NULL,
	[GSTTypeID] [int] NULL,
	[SalesTax] [real] NULL,
	[RetailAfterGST] [int] NULL,
	[Update] [smallint] NULL,
	[StockDiscount] [nvarchar](MAX) NULL,
	[NoFurtherDiscount] [smallint] NULL,
	[OnlyOrdNegSOH] [smallint] NULL,
	[LastOrderDate] [datetime2](0) NULL,
	[comments] [nvarchar](MAX) NULL,
	[Discontinued] [smallint] NULL,
	[HeadOfficeID] [int] NULL,
	[UPI] [int] NULL,
	[MinOrdQty] [int] NULL,
	[SmallLabelOption] [smallint] NULL,
	[ImageName] [nvarchar](MAX) NULL,
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
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LOTS_StockAdjustment]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOTS_StockAdjustment](
	[StockAdjID] [int] NULL,
	[StaffID] [int] NULL,
	[ReasonID] [int] NULL,
	[ReasonText] [nvarchar](MAX) NULL,
	[SOHBeforeAdj] [real] NULL,
	[SOHAfterAdj] [real] NULL,
	[StockID] [int] NULL,
	[RealCost] [int] NULL,
	[DateCreated] [datetime2](0) NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LOTS_StockTake]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOTS_StockTake](
	[StockTakeID] [int] NULL,
	[DateCreated] [datetime2](0) NULL,
	[Type] [nvarchar](MAX) NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LOTS_StockTakeItems]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOTS_StockTakeItems](
	[StockTakeItemID] [int] NULL,
	[StockTakeID] [int] NULL,
	[StockID] [int] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LOTS_Supplier]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOTS_Supplier](
	[SupplierID] [int] NULL,
	[SupplierName] [nvarchar](MAX) NULL,
	[Address] [nvarchar](MAX) NULL,
	[City] [nvarchar](MAX) NULL,
	[PhoneNumber] [nvarchar](MAX) NULL,
	[FaxNumber] [nvarchar](MAX) NULL,
	[LastOrder] [datetime2](0) NULL,
	[PurchaseValue] [int] NULL,
	[Brand] [nvarchar](MAX) NULL,
	[DirectOnly] [smallint] NULL,
	[HeaderCode] [nvarchar](MAX) NULL,
	[ModemPhoneNumber] [nvarchar](MAX) NULL,
	[ModemOrderFile] [nvarchar](MAX) NULL,
	[AccountNumber] [nvarchar](MAX) NULL,
	[OrderType] [nvarchar](MAX) NULL,
	[Password] [nvarchar](MAX) NULL,
	[SessionCode] [nvarchar](MAX) NULL,
	[Header] [nvarchar](MAX) NULL,
	[Trailer] [nvarchar](MAX) NULL,
	[ComPort] [nvarchar](MAX) NULL,
	[InitString] [nvarchar](MAX) NULL,
	[Parity] [nvarchar](MAX) NULL,
	[DataBits] [int] NULL,
	[StopBits] [int] NULL,
	[BaudRate] [int] NULL,
	[HangupString] [nvarchar](MAX) NULL,
	[Message] [nvarchar](MAX) NULL,
	[DialingPrefix] [nvarchar](MAX) NULL,
	[ModemReplyFile] [nvarchar](MAX) NULL,
	[ModemReplyWait] [int] NULL,
	[CostIncludeGST] [smallint] NULL,
	[IgnoreOuters] [smallint] NULL,
	[ExcludeRealUpdate] [smallint] NULL,
	[ListUpdateOption] [int] NULL,
	[UseBarcodes] [smallint] NULL,
	[UniqueSupID] [int] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LOTS_SupplierDetails]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOTS_SupplierDetails](
	[SupplierDetailsID] [int] NULL,
	[SupplierID] [int] NULL,
	[SupplierDetailName] [nvarchar](MAX) NULL,
	[HeaderCode] [nvarchar](MAX) NULL,
	[ModemPhoneNumber] [nvarchar](MAX) NULL,
	[ModemOrderFile] [nvarchar](MAX) NULL,
	[AccountNumber] [nvarchar](MAX) NULL,
	[OrderType] [nvarchar](MAX) NULL,
	[Password] [nvarchar](MAX) NULL,
	[SessionCode] [nvarchar](MAX) NULL,
	[Header] [nvarchar](MAX) NULL,
	[Trailer] [nvarchar](MAX) NULL,
	[ComPort] [nvarchar](MAX) NULL,
	[InitString] [nvarchar](MAX) NULL,
	[Parity] [nvarchar](MAX) NULL,
	[DataBits] [int] NULL,
	[StopBits] [int] NULL,
	[BaudRate] [int] NULL,
	[HangupString] [nvarchar](MAX) NULL,
	[Message] [nvarchar](MAX) NULL,
	[DialingPrefix] [nvarchar](MAX) NULL,
	[ModemReplyFile] [nvarchar](MAX) NULL,
	[ModemReplyWait] [int] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OFFICE_doAccount]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OFFICE_doAccount](
	[ID] [bigint] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[AggregateSource] [int] NULL,
	[Guid] [uniqueidentifier] NULL,
	[IsDefault] [int] NULL,
	[AccountFormat] [int] NULL,
	[AccountNumber] [int] NULL,
	[AccountOwner] [bigint] NULL,
	[AccountType] [bigint] NULL,
	[AddressLine1] [nvarchar](MAX) NULL,
	[AddressLine2] [nvarchar](MAX) NULL,
	[AddressSource] [int] NULL,
	[AddressState] [nvarchar](MAX) NULL,
	[Balance] [numeric](28, 10) NULL,
	[City] [nvarchar](MAX) NULL,
	[ClosedDate] [datetime] NULL,
	[Company] [nvarchar](MAX) NULL,
	[CreditLimit] [numeric](28, 10) NULL,
	[Customer] [bigint] NULL,
	[CustomerAddressLine1] [nvarchar](MAX) NULL,
	[CustomerAddressLine2] [nvarchar](MAX) NULL,
	[CustomerAddressState] [nvarchar](MAX) NULL,
	[CustomerCity] [nvarchar](MAX) NULL,
	[CustomerCompany] [nvarchar](MAX) NULL,
	[CustomerEmailAddress] [nvarchar](MAX) NULL,
	[CustomerFaxNumber] [nvarchar](MAX) NULL,
	[CustomerFirstName] [nvarchar](MAX) NULL,
	[CustomerLastName] [nvarchar](MAX) NULL,
	[CustomerMobileNumber] [nvarchar](MAX) NULL,
	[CustomerPhoneNumber] [nvarchar](MAX) NULL,
	[CustomerPostCode] [nvarchar](MAX) NULL,
	[CustomerTitle] [nvarchar](MAX) NULL,
	[CustomerWeb] [nvarchar](MAX) NULL,
	[Discount] [numeric](28, 10) NULL,
	[EmailAddress] [nvarchar](MAX) NULL,
	[FaxNumber] [nvarchar](MAX) NULL,
	[FirstName] [nvarchar](MAX) NULL,
	[GroupedDescription] [nvarchar](MAX) NULL,
	[ImportDescription] [nvarchar](MAX) NULL,
	[ImportedBalance] [numeric](28, 10) NULL,
	[LastName] [nvarchar](MAX) NULL,
	[MobileNumber] [nvarchar](MAX) NULL,
	[OpenedDate] [datetime] NULL,
	[PhoneNumber] [nvarchar](MAX) NULL,
	[PostCode] [nvarchar](MAX) NULL,
	[PriceLevel] [int] NULL,
	[PrintByPatient] [bit] NULL,
	[ProviderNumber] [nvarchar](MAX) NULL,
	[Reference] [nvarchar](MAX) NULL,
	[Remarks] [nvarchar](MAX) NULL,
	[SendStatementsByEmail] [bit] NULL,
	[StatementEmail] [nvarchar](MAX) NULL,
	[TAC] [nvarchar](MAX) NULL,
	[Title] [nvarchar](MAX) NULL,
	[Web] [nvarchar](MAX) NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OFFICE_doActivity]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OFFICE_doActivity](
	[ID] [bigint] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[AggregateSource] [int] NULL,
	[Guid] [uniqueidentifier] NULL,
	[IsDefault] [int] NULL,
	[IBHeaderGuid] [uniqueidentifier] NULL,
	[RapidObjectGuid] [uniqueidentifier] NULL,
	[RapidSyncRequired] [bit] NULL,
	[RecordStatus] [bigint] NULL,
	[AcceptedBy] [nvarchar](MAX) NULL,
	[ActivityType] [int] NULL,
	[Batch] [bigint] NULL,
	[Cashier] [bigint] NULL,
	[ChargeAccount] [bigint] NULL,
	[Customer] [bigint] NULL,
	[HiddenReverseActivity] [bigint] NULL,
	[LaybyAccount] [bigint] NULL,
	[LoyaltyAccount] [bigint] NULL,
	[PostCode] [nvarchar](MAX) NULL,
	[Reference] [nvarchar](MAX) NULL,
	[Register] [bigint] NULL,
	[Remarks] [nvarchar](MAX) NULL,
	[Statement] [bigint] NULL,
	[TimeOccured] [datetime] NULL,
	[TotalCharged] [numeric](28, 10) NULL,
	[TotalCost] [numeric](28, 10) NULL,
	[TotalDiscount] [numeric](28, 10) NULL,
	[TotalExtendedPrice] [numeric](28, 10) NULL,
	[TotalGovRecov] [numeric](28, 10) NULL,
	[TotalLayby] [numeric](28, 10) NULL,
	[TotalLines] [int] NULL,
	[TotalPoints] [numeric](28, 10) NULL,
	[TotalProfit] [numeric](28, 10) NULL,
	[TotalQuantity] [float] NULL,
	[TotalRetailPrice] [numeric](28, 10) NULL,
	[TotalScripts] [int] NULL,
	[TotalTax] [numeric](28, 10) NULL,
	[TransactionNumber] [nvarchar](MAX) NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OFFICE_doActivityEntry]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OFFICE_doActivityEntry](
	[ID] [bigint] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[AggregateSource] [int] NULL,
	[Guid] [uniqueidentifier] NULL,
	[IsDefault] [int] NULL,
	[Activity] [bigint] NULL,
	[Cost] [numeric](28, 10) NULL,
	[Discount] [numeric](28, 10) NULL,
	[ExtendedPrice] [numeric](28, 10) NULL,
	[GovRecov] [numeric](28, 10) NULL,
	[ItemTransacted] [bigint] NULL,
	[Points] [numeric](28, 10) NULL,
	[Quantity] [float] NULL,
	[QuantityDiscountScheme] [bigint] NULL,
	[Remarks] [nvarchar](MAX) NULL,
	[RetailPrice] [numeric](28, 10) NULL,
	[SaleDescription] [nvarchar](MAX) NULL,
	[Script] [bigint] NULL,
	[Tax] [numeric](28, 10) NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OFFICE_doBatch]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OFFICE_doBatch](
	[ID] [bigint] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[AggregateSource] [int] NULL,
	[Guid] [uniqueidentifier] NULL,
	[IsDefault] [int] NULL,
	[IBHeaderGuid] [uniqueidentifier] NULL,
	[RapidObjectGuid] [uniqueidentifier] NULL,
	[RapidSyncRequired] [bit] NULL,
	[RecordStatus] [bigint] NULL,
	[AbortedTransactionCount] [int] NULL,
	[BatchNumber] [int] NULL,
	[BatchStatus] [int] NULL,
	[CashBackSurcharge] [numeric](28, 10) NULL,
	[ClosingTime] [datetime] NULL,
	[ClosingTotal] [numeric](28, 10) NULL,
	[Comments] [nvarchar](MAX) NULL,
	[CostOfGoods] [numeric](28, 10) NULL,
	[CustomerCount] [int] NULL,
	[CustomerDepositMade] [numeric](28, 10) NULL,
	[CustomerDepositRedeemed] [numeric](28, 10) NULL,
	[DebitSurcharge] [numeric](28, 10) NULL,
	[Discounts] [numeric](28, 10) NULL,
	[Dropped] [numeric](28, 10) NULL,
	[GovernmentRecovery] [numeric](28, 10) NULL,
	[LayawayClosed] [numeric](28, 10) NULL,
	[LayawayPaid] [numeric](28, 10) NULL,
	[Locked] [datetime] NULL,
	[NoSalesCount] [int] NULL,
	[OpeningTime] [datetime] NULL,
	[OpeningTotal] [numeric](28, 10) NULL,
	[OverUnder] [numeric](28, 10) NULL,
	[PaidOnAccount] [numeric](28, 10) NULL,
	[PaidOut] [numeric](28, 10) NULL,
	[PaidToAccount] [numeric](28, 10) NULL,
	[Register] [bigint] NULL,
	[Returns] [numeric](28, 10) NULL,
	[Sales] [numeric](28, 10) NULL,
	[SalesPlusTax] [numeric](28, 10) NULL,
	[Tax] [numeric](28, 10) NULL,
	[TenderRoundingError] [numeric](28, 10) NULL,
	[TotalChange] [numeric](28, 10) NULL,
	[TotalTendered] [numeric](28, 10) NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OFFICE_doBusinessUnit-AuditHistory]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OFFICE_doBusinessUnit-AuditHistory](
	[ID] [bigint] NULL,
	[Owner] [bigint] NULL,
	[AuditActionType] [int] NULL,
	[AuditDate] [datetime] NULL,
	[AuditType] [int] NULL,
	[AuditedObject] [bigint] NULL,
	[Field] [nvarchar](MAX) NULL,
	[FriendlyName] [nvarchar](MAX) NULL,
	[FromValue] [nvarchar](MAX) NULL,
	[Message] [nvarchar](MAX) NULL,
	[ObjectType] [nvarchar](MAX) NULL,
	[SourceName] [nvarchar](MAX) NULL,
	[ToValue] [nvarchar](MAX) NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OFFICE_doCashier]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OFFICE_doCashier](
	[ID] [bigint] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[AggregateSource] [int] NULL,
	[Guid] [uniqueidentifier] NULL,
	[IsDefault] [int] NULL,
	[CashDrawerNumber] [int] NULL,
	[EmailAddress] [nvarchar](MAX) NULL,
	[FirstName] [nvarchar](MAX) NULL,
	[FloorLimit] [float] NULL,
	[GroupedDescription] [nvarchar](MAX) NULL,
	[LastName] [nvarchar](MAX) NULL,
	[MaxOverShortAmount] [float] NULL,
	[MaxOverShortPercent] [float] NULL,
	[OverShortLimitType] [int] NULL,
	[Password] [nvarchar](MAX) NULL,
	[PhoneNumber] [nvarchar](MAX) NULL,
	[Privileges] [int] NULL,
	[ReturnLimit] [float] NULL,
	[SecurityLevel] [int] NULL,
	[UserName] [nvarchar](MAX) NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OFFICE_doCategory]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OFFICE_doCategory](
	[ID] [bigint] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[AggregateSource] [int] NULL,
	[Guid] [uniqueidentifier] NULL,
	[IsDefault] [int] NULL,
	[IBHeaderGuid] [uniqueidentifier] NULL,
	[RapidObjectGuid] [uniqueidentifier] NULL,
	[RapidSyncRequired] [bit] NULL,
	[RecordStatus] [bigint] NULL,
	[Active] [bit] NULL,
	[AppCatHQID] [bigint] NULL,
	[AppCatHQLastMatched] [datetime] NULL,
	[Code] [nvarchar](MAX) NULL,
	[Department] [bigint] NULL,
	[Markup] [numeric](28, 10) NULL,
	[Name] [nvarchar](MAX) NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OFFICE_doClaim]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OFFICE_doClaim](
	[ID] [bigint] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[AggregateSource] [int] NULL,
	[Guid] [uniqueidentifier] NULL,
	[IsDefault] [int] NULL,
	[Amount] [numeric](28, 10) NULL,
	[Category] [nchar](1) NULL,
	[ClaimDate] [datetime] NULL,
	[ClaimKey] [bigint] NULL,
	[ClaimNumber] [numeric](28, 10) NULL,
	[ClaimPart] [numeric](28, 10) NULL,
	[FormCategory] [numeric](28, 10) NULL,
	[IsPaid] [bit] NULL,
	[MedicareFirstName] [nvarchar](MAX) NULL,
	[MedicareLastName] [nvarchar](MAX) NULL,
	[MedicareNumber] [bigint] NULL,
	[PBSAcceptCode] [nchar](1) NULL,
	[PBSAcknowledge] [nchar](1) NULL,
	[PBSPayDate] [datetime] NULL,
	[PBSPaymentAdjustment] [numeric](28, 10) NULL,
	[PBSPaymentAmount] [numeric](28, 10) NULL,
	[PBSPaymentID] [nvarchar](MAX) NULL,
	[PBSProcessingCode] [nvarchar](MAX) NULL,
	[PBSProcessingCodeHistory] [nvarchar](MAX) NULL,
	[PBSReferenceNumber] [nvarchar](MAX) NULL,
	[PBSResubmit] [nchar](1) NULL,
	[PayCategory] [numeric](28, 10) NULL,
	[ProblemReturnCode] [nvarchar](MAX) NULL,
	[Reference] [numeric](28, 10) NULL,
	[ReferencePeriod] [numeric](28, 10) NULL,
	[ScriptNumber] [numeric](28, 10) NULL,
	[SerialNumber] [nvarchar](MAX) NULL,
	[Status] [nchar](1) NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OFFICE_doCustomer]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OFFICE_doCustomer](
	[ID] [bigint] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[AggregateSource] [int] NULL,
	[Guid] [uniqueidentifier] NULL,
	[IsDefault] [int] NULL,
	[AddressLine1] [nvarchar](MAX) NULL,
	[AddressLine2] [nvarchar](MAX) NULL,
	[AddressState] [nvarchar](MAX) NULL,
	[City] [nvarchar](MAX) NULL,
	[Company] [nvarchar](MAX) NULL,
	[CustomDate1] [datetime] NULL,
	[CustomDate2] [datetime] NULL,
	[CustomDate3] [datetime] NULL,
	[CustomDate4] [datetime] NULL,
	[CustomDate5] [datetime] NULL,
	[CustomNumber1] [numeric](28, 10) NULL,
	[CustomNumber2] [numeric](28, 10) NULL,
	[CustomNumber3] [numeric](28, 10) NULL,
	[CustomNumber4] [numeric](28, 10) NULL,
	[CustomNumber5] [numeric](28, 10) NULL,
	[CustomText1] [nvarchar](MAX) NULL,
	[CustomText2] [nvarchar](MAX) NULL,
	[CustomText3] [nvarchar](MAX) NULL,
	[CustomText4] [nvarchar](MAX) NULL,
	[CustomText5] [nvarchar](MAX) NULL,
	[DateOfBirth] [datetime] NULL,
	[EmailAddress] [nvarchar](MAX) NULL,
	[FaxNumber] [nvarchar](MAX) NULL,
	[FirstName] [nvarchar](MAX) NULL,
	[GroupedDescription] [nvarchar](MAX) NULL,
	[LastName] [nvarchar](MAX) NULL,
	[MobileNumber] [nvarchar](MAX) NULL,
	[PhoneNumber] [nvarchar](MAX) NULL,
	[PostCode] [nvarchar](MAX) NULL,
	[Remarks] [nvarchar](MAX) NULL,
	[Title] [nvarchar](MAX) NULL,
	[Web] [nvarchar](MAX) NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OFFICE_doDepartment]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OFFICE_doDepartment](
	[ID] [bigint] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[AggregateSource] [int] NULL,
	[Guid] [uniqueidentifier] NULL,
	[IsDefault] [int] NULL,
	[IBHeaderGuid] [uniqueidentifier] NULL,
	[RapidObjectGuid] [uniqueidentifier] NULL,
	[RapidSyncRequired] [bit] NULL,
	[RecordStatus] [bigint] NULL,
	[Active] [bit] NULL,
	[AppCatHQID] [bigint] NULL,
	[AppCatHQLastMatched] [datetime] NULL,
	[Code] [nvarchar](MAX) NULL,
	[IsOtherCostDepartment] [bit] NULL,
	[Markup] [numeric](28, 10) NULL,
	[Name] [nvarchar](MAX) NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OFFICE_doDoctor]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OFFICE_doDoctor](
	[ID] [bigint] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[AggregateSource] [int] NULL,
	[Guid] [uniqueidentifier] NULL,
	[IsDefault] [int] NULL,
	[Address] [nvarchar](MAX) NULL,
	[DoctorCode] [nvarchar](MAX) NULL,
	[DoctorOnLabel] [bit] NULL,
	[Email] [nvarchar](MAX) NULL,
	[FaxNumber] [nvarchar](MAX) NULL,
	[FirstName] [nvarchar](MAX) NULL,
	[GroupedDescription] [nvarchar](MAX) NULL,
	[LastName] [nvarchar](MAX) NULL,
	[MobileNumber] [nvarchar](MAX) NULL,
	[PhoneNumber] [nvarchar](MAX) NULL,
	[PostCode] [bigint] NULL,
	[PrescriberNumber] [bigint] NULL,
	[StolenScriptPads] [bit] NULL,
	[Suburb] [nvarchar](MAX) NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OFFICE_doDrug]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OFFICE_doDrug](
	[ID] [bigint] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[AggregateSource] [int] NULL,
	[Guid] [uniqueidentifier] NULL,
	[IsDefault] [int] NULL,
	[APNCode] [nvarchar](MAX) NULL,
	[AustralianRegistrationNumber] [nvarchar](MAX) NULL,
	[Code] [nvarchar](MAX) NULL,
	[ContractSupplier] [nvarchar](MAX) NULL,
	[ContractWholesalePrice] [numeric](28, 10) NULL,
	[DeletedDate] [nvarchar](MAX) NULL,
	[DifferentNHSCodes] [nchar](1) NULL,
	[DiscountRate] [numeric](28, 10) NULL,
	[DrugItem] [bigint] NULL,
	[ExtempIndicator] [nchar](1) NULL,
	[Form] [nvarchar](MAX) NULL,
	[GSTIncluded] [bit] NULL,
	[GenericCode] [nvarchar](MAX) NULL,
	[GenericName] [nvarchar](MAX) NULL,
	[GenericSubstitutionIndicator] [nchar](1) NULL,
	[GroupedDescription] [nvarchar](MAX) NULL,
	[HBFCode] [nvarchar](MAX) NULL,
	[InteractionGroup] [numeric](28, 10) NULL,
	[InteractionGroup2] [numeric](28, 10) NULL,
	[IsUserDrug] [bit] NULL,
	[LabelSize] [nchar](1) NULL,
	[ManufacturerCode] [nvarchar](MAX) NULL,
	[Name] [nvarchar](MAX) NULL,
	[Notes] [nvarchar](MAX) NULL,
	[OTCPrice] [numeric](28, 10) NULL,
	[OurWholesale] [bit] NULL,
	[OwnWarnings] [nvarchar](MAX) NULL,
	[PDENumber] [nvarchar](MAX) NULL,
	[PDENumber2] [nvarchar](MAX) NULL,
	[PackSize] [numeric](28, 10) NULL,
	[PrivateDispensingFeeCategory] [numeric](28, 10) NULL,
	[PrivateMarkupCategory] [numeric](28, 10) NULL,
	[PrivatePrice] [numeric](28, 10) NULL,
	[Ranking] [numeric](28, 10) NULL,
	[RecommendedWarningLabels] [nvarchar](MAX) NULL,
	[Schedule] [nvarchar](MAX) NULL,
	[Schedule3RPrice] [numeric](28, 10) NULL,
	[SearchStrength] [nvarchar](7) NULL,
	[Status] [nchar](1) NULL,
	[StockGroup] [numeric](28, 10) NULL,
	[Strength] [nvarchar](MAX) NULL,
	[SupplierCode] [nvarchar](MAX) NULL,
	[SupplierCode2] [nvarchar](MAX) NULL,
	[UseNHSGeneric] [bit] NULL,
	[UserDrugCode] [nvarchar](MAX) NULL,
	[WholesalePrice] [numeric](28, 10) NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OFFICE_doGroup-GroupEntries]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OFFICE_doGroup-GroupEntries](
	[ID-1] [bigint] NULL,
	[ID-2] [bigint] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OFFICE_doInvoice]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OFFICE_doInvoice](
	[ID] [bigint] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[AggregateSource] [int] NULL,
	[Guid] [uniqueidentifier] NULL,
	[IsDefault] [int] NULL,
	[IBHeaderGuid] [uniqueidentifier] NULL,
	[RapidObjectGuid] [uniqueidentifier] NULL,
	[RapidSyncRequired] [bit] NULL,
	[RecordStatus] [bigint] NULL,
	[ActualInvoiceValue] [numeric](28, 10) NULL,
	[Currency] [bigint] NULL,
	[DeliverAfter] [datetime] NULL,
	[DeliverBefore] [datetime] NULL,
	[DriverName] [nvarchar](MAX) NULL,
	[ExchangeRate] [float] NULL,
	[ExpectedDate] [datetime] NULL,
	[ExpectedInvoiceValue] [numeric](28, 10) NULL,
	[ForceExpectedInvoiceValueUpdate] [bit] NULL,
	[HasOrder] [bit] NULL,
	[InvoiceDate] [datetime] NULL,
	[InvoiceEntryLastModified] [bigint] NULL,
	[InvoiceGatewayID] [bigint] NULL,
	[InvoiceNumber] [nvarchar](MAX) NULL,
	[InvoiceType] [int] NULL,
	[IsAboveVariationLimit] [bit] NULL,
	[IsApproved] [bit] NULL,
	[IsClosed] [bit] NULL,
	[PurchaseOrderGatewayID] [bigint] NULL,
	[ReceivedBy] [nvarchar](MAX) NULL,
	[Supplier] [bigint] NULL,
	[TransferActivity] [bigint] NULL,
	[TransferReference] [nvarchar](MAX) NULL,
	[Variation] [numeric](28, 10) NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OFFICE_doInvoiceEntry]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OFFICE_doInvoiceEntry](
	[ID] [bigint] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[AggregateSource] [int] NULL,
	[Guid] [uniqueidentifier] NULL,
	[IsDefault] [int] NULL,
	[IBHeaderGuid] [uniqueidentifier] NULL,
	[RapidObjectGuid] [uniqueidentifier] NULL,
	[RapidSyncRequired] [bit] NULL,
	[RecordStatus] [bigint] NULL,
	[Class] [nvarchar](MAX) NULL,
	[DiscountIncGst] [numeric](28, 10) NULL,
	[Ean] [nvarchar](MAX) NULL,
	[ExtSupplierCostTax] [numeric](28, 10) NULL,
	[ExtendedForeignCost] [numeric](28, 10) NULL,
	[ForeignCost] [numeric](28, 10) NULL,
	[GatewayResponse] [nvarchar](MAX) NULL,
	[Invoice] [bigint] NULL,
	[InvoicedItem] [bigint] NULL,
	[ItemDescription] [nvarchar](MAX) NULL,
	[ItemTax] [bigint] NULL,
	[Manufacturer] [nvarchar](MAX) NULL,
	[NetInStoreCost] [numeric](28, 10) NULL,
	[NormalCostExGst] [numeric](28, 10) NULL,
	[NormalCostGst] [numeric](28, 10) NULL,
	[NormalCostIncGst] [numeric](28, 10) NULL,
	[OrderedQuantity] [float] NULL,
	[OriginalQuantityOrdered] [float] NULL,
	[PacksBackordered] [int] NULL,
	[PacksOrdered] [int] NULL,
	[PacksOutOfStock] [int] NULL,
	[PacksSupplied] [int] NULL,
	[QuantityInvoiced] [float] NULL,
	[QuantityOutOfStock] [float] NULL,
	[QuantityReceived] [float] NULL,
	[QuantityReturnForCredit] [float] NULL,
	[QuantityScanned] [float] NULL,
	[Reference] [nvarchar](MAX) NULL,
	[ReorderNumber] [nvarchar](MAX) NULL,
	[RetailPrice] [numeric](28, 10) NULL,
	[SupplierCost] [numeric](28, 10) NULL,
	[SupplierCostTax] [numeric](28, 10) NULL,
	[SurchargeIncGst] [numeric](28, 10) NULL,
	[Tote] [nvarchar](MAX) NULL,
	[Tun] [nvarchar](MAX) NULL,
	[Warehouse] [nvarchar](MAX) NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OFFICE_doItem]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OFFICE_doItem](
	[ID] [bigint] NULL,
	[ActivePromotionEntry] [bigint] NULL,
	[AppCatHQID] [bigint] NULL,
	[AppCatHQLastMatched] [datetime] NULL,
	[AutoCalcPriceLevel] [bit] NULL,
	[BarcodeFormat] [int] NULL,
	[BlockSalesAfterDate] [datetime] NULL,
	[BlockSalesBeforeDate] [datetime] NULL,
	[BlockSalesReason] [nvarchar](MAX) NULL,
	[BlockSalesType] [int] NULL,
	[BuydownPrice] [numeric](28, 10) NULL,
	[BuydownQuantity] [float] NULL,
	[CatalogueReferenceID] [nvarchar](MAX) NULL,
	[CommissionAmount] [numeric](28, 10) NULL,
	[CommissionMaximum] [numeric](28, 10) NULL,
	[CommissionMode] [int] NULL,
	[CommissionPercentProfit] [float] NULL,
	[CommissionPercentSale] [float] NULL,
	[Consignment] [bit] NULL,
	[Content] [ntext] NULL,
	[Detail1] [nvarchar](MAX) NULL,
	[Detail2] [nvarchar](MAX) NULL,
	[Detail3] [nvarchar](MAX) NULL,
	[Dimension1] [bigint] NULL,
	[Dimension2] [bigint] NULL,
	[Dimension3] [bigint] NULL,
	[Dimensions] [int] NULL,
	[DontCalculateROUValue] [bit] NULL,
	[ExcludedFromLoyalty] [bit] NULL,
	[ExtendedDescription] [ntext] NULL,
	[FixedPrice] [bit] NULL,
	[FoodStampable] [bit] NULL,
	[ForeignCost] [numeric](28, 10) NULL,
	[GroupedDescription] [nvarchar](MAX) NULL,
	[HideOnNetDisplay] [bit] NULL,
	[ImportDescription] [nvarchar](MAX) NULL,
	[ItemAddedDate] [datetime] NULL,
	[ItemNotDiscountable] [bit] NULL,
	[LabelTemplate] [bigint] NULL,
	[LastCost] [numeric](28, 10) NULL,
	[LastCounted] [datetime] NULL,
	[LastStockCount] [float] NULL,
	[MSRP] [numeric](28, 10) NULL,
	[ParentItem] [bigint] NULL,
	[ParentQuantity] [float] NULL,
	[PictureName] [nvarchar](MAX) NULL,
	[PriceLevelA] [numeric](28, 10) NULL,
	[PriceLevelB] [numeric](28, 10) NULL,
	[PriceLevelC] [numeric](28, 10) NULL,
	[PriceMustBeEntered] [bit] NULL,
	[PriceType] [int] NULL,
	[PricingPolicy] [nvarchar](MAX) NULL,
	[QuantityDiscountScheme] [bigint] NULL,
	[QuantityEntryNotAllowed] [bit] NULL,
	[ROULastUpdated] [datetime] NULL,
	[ROUScheme] [bigint] NULL,
	[ROUValue] [numeric](28, 10) NULL,
	[ReCalcROPRestockLvlFromROU] [bit] NULL,
	[RebateAmount] [numeric](28, 10) NULL,
	[Remarks] [ntext] NULL,
	[ReplacementCost] [numeric](28, 10) NULL,
	[SaleEndDate] [datetime] NULL,
	[SalePrice] [numeric](28, 10) NULL,
	[SaleStartDate] [datetime] NULL,
	[SaleType] [int] NULL,
	[SerialNumberCount] [int] NULL,
	[TWManaged] [bit] NULL,
	[TagAlongItem] [bigint] NULL,
	[TagAlongQuantity] [float] NULL,
	[TareWeight] [float] NULL,
	[TareWeightPercent] [float] NULL,
	[Taxable] [bit] NULL,
	[Title1] [nvarchar](MAX) NULL,
	[Title2] [nvarchar](MAX) NULL,
	[Title3] [nvarchar](MAX) NULL,
	[TransferAvailable] [bit] NULL,
	[TransferOutMinOrder] [int] NULL,
	[TransferOutPackQuantity] [int] NULL,
	[UnitOfMeasure] [nvarchar](MAX) NULL,
	[UseComponentCost] [bit] NULL,
	[UseComponentPrice] [bit] NULL,
	[UsuallyShip] [nvarchar](MAX) NULL,
	[WebItem] [bit] NULL,
	[Weighed] [bit] NULL,
	[Weight] [float] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OFFICE_doItemBase]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OFFICE_doItemBase](
	[ID] [bigint] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[AggregateSource] [int] NULL,
	[Guid] [uniqueidentifier] NULL,
	[IsDefault] [int] NULL,
	[IBHeaderGuid] [uniqueidentifier] NULL,
	[RapidObjectGuid] [uniqueidentifier] NULL,
	[RapidSyncRequired] [bit] NULL,
	[RecordStatus] [bigint] NULL,
	[AutoOrder] [bit] NULL,
	[AutoOrderEndDate] [datetime] NULL,
	[AutoOrderStartDate] [datetime] NULL,
	[Category] [bigint] NULL,
	[Code] [nvarchar](MAX) NULL,
	[Cost] [numeric](28, 10) NULL,
	[DefaultSupplier] [bigint] NULL,
	[Department] [bigint] NULL,
	[Description] [nvarchar](MAX) NULL,
	[DoNotOrder] [bit] NULL,
	[InActive] [bit] NULL,
	[IsTester] [bit] NULL,
	[ItemClassification] [bigint] NULL,
	[ItemLocation] [nvarchar](MAX) NULL,
	[ItemMessage] [bigint] NULL,
	[ItemTax] [bigint] NULL,
	[ItemType] [int] NULL,
	[LastOrdered] [datetime] NULL,
	[LastReceived] [datetime] NULL,
	[LastSoldDate] [datetime] NULL,
	[LowerBound] [numeric](28, 10) NULL,
	[Manufacturer] [bigint] NULL,
	[Merged] [bigint] NULL,
	[Moved] [bigint] NULL,
	[OutOfStock] [bigint] NULL,
	[PreferredSupplier] [bigint] NULL,
	[Price] [numeric](28, 10) NULL,
	[PricingPlan] [bigint] NULL,
	[ProductStatus] [int] NULL,
	[PurchaseTax] [bigint] NULL,
	[QuantityCommitted] [float] NULL,
	[QuantityOnDraft] [float] NULL,
	[QuantityOnHand] [float] NULL,
	[QuantityOnOrder] [float] NULL,
	[QuantityOnReturnForCredit] [float] NULL,
	[QuantityOnTransferIn] [float] NULL,
	[QuantityOnTransferOut] [float] NULL,
	[ReorderPoint] [float] NULL,
	[RestockLevel] [float] NULL,
	[SubCategory] [bigint] NULL,
	[Tax] [numeric](28, 10) NULL,
	[UpperBound] [numeric](28, 10) NULL,
	[StoreID] [int] NULL,
	[ProductGlobalHQID] [bigint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OFFICE_doItemClassification]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OFFICE_doItemClassification](
	[ID] [bigint] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[AggregateSource] [int] NULL,
	[Guid] [uniqueidentifier] NULL,
	[IsDefault] [int] NULL,
	[IBHeaderGuid] [uniqueidentifier] NULL,
	[RapidObjectGuid] [uniqueidentifier] NULL,
	[RapidSyncRequired] [bit] NULL,
	[RecordStatus] [bigint] NULL,
	[Code] [nvarchar](MAX) NULL,
	[DefaultClassification] [bit] NULL,
	[Name] [nvarchar](MAX) NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OFFICE_doItem-ItemUsage]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OFFICE_doItem-ItemUsage](
	[ID] [bigint] NULL,
	[ActivityCount] [bigint] NULL,
	[GovernmentRecovery] [numeric](28, 10) NULL,
	[ItemUsed] [bigint] NULL,
	[MaxPrice] [numeric](28, 10) NULL,
	[MinPrice] [numeric](28, 10) NULL,
	[Month] [int] NULL,
	[TotalCost] [numeric](28, 10) NULL,
	[TotalDiscounts] [numeric](28, 10) NULL,
	[TotalPrice] [numeric](28, 10) NULL,
	[TotalProfit] [numeric](28, 10) NULL,
	[TotalQuantity] [float] NULL,
	[TotalSalesTax] [numeric](28, 10) NULL,
	[Year] [int] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OFFICE_doItemMessage]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OFFICE_doItemMessage](
	[ID] [bigint] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[AggregateSource] [int] NULL,
	[Guid] [uniqueidentifier] NULL,
	[IsDefault] [int] NULL,
	[IBHeaderGuid] [uniqueidentifier] NULL,
	[RapidObjectGuid] [uniqueidentifier] NULL,
	[RapidSyncRequired] [bit] NULL,
	[RecordStatus] [bigint] NULL,
	[AgeLimit] [int] NULL,
	[Code] [nvarchar](MAX) NULL,
	[Message] [nvarchar](MAX) NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OFFICE_doItemMovementHistory]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OFFICE_doItemMovementHistory](
	[ID] [bigint] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[AggregateSource] [int] NULL,
	[Guid] [uniqueidentifier] NULL,
	[IsDefault] [int] NULL,
	[IBHeaderGuid] [uniqueidentifier] NULL,
	[RapidObjectGuid] [uniqueidentifier] NULL,
	[RapidSyncRequired] [bit] NULL,
	[RecordStatus] [bigint] NULL,
	[AdjustmentQuantity] [float] NULL,
	[AfterQuantity] [float] NULL,
	[Cost] [numeric](28, 10) NULL,
	[Date] [datetime] NULL,
	[Historical] [bit] NULL,
	[ItemUsed] [bigint] NULL,
	[MovementSource] [bigint] NULL,
	[MovementType] [int] NULL,
	[Reason] [bigint] NULL,
	[Remarks] [nvarchar](MAX) NULL,
	[Retail] [numeric](28, 10) NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OFFICE_doItemPricingHistory]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OFFICE_doItemPricingHistory](
	[ID] [bigint] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[AggregateSource] [int] NULL,
	[Guid] [uniqueidentifier] NULL,
	[IsDefault] [int] NULL,
	[AfterCost] [numeric](28, 10) NULL,
	[AfterPrice] [numeric](28, 10) NULL,
	[BeforeCost] [numeric](28, 10) NULL,
	[BeforePrice] [numeric](28, 10) NULL,
	[Date] [datetime] NULL,
	[ItemUsed] [bigint] NULL,
	[Message] [nvarchar](MAX) NULL,
	[SourceName] [nvarchar](MAX) NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OFFICE_doItemTax]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OFFICE_doItemTax](
	[ID] [bigint] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[AggregateSource] [int] NULL,
	[Guid] [uniqueidentifier] NULL,
	[IsDefault] [int] NULL,
	[IBHeaderGuid] [uniqueidentifier] NULL,
	[RapidObjectGuid] [uniqueidentifier] NULL,
	[RapidSyncRequired] [bit] NULL,
	[RecordStatus] [bigint] NULL,
	[Active] [bit] NULL,
	[Code] [nvarchar](MAX) NULL,
	[Description] [nvarchar](MAX) NULL,
	[Options] [int] NULL,
	[ShowOnReceipt01] [bit] NULL,
	[ShowOnReceipt02] [bit] NULL,
	[ShowOnReceipt03] [bit] NULL,
	[ShowOnReceipt04] [bit] NULL,
	[ShowOnReceipt05] [bit] NULL,
	[ShowOnReceipt06] [bit] NULL,
	[ShowOnReceipt07] [bit] NULL,
	[ShowOnReceipt08] [bit] NULL,
	[ShowOnReceipt09] [bit] NULL,
	[ShowOnReceipt10] [bit] NULL,
	[Tax01] [bigint] NULL,
	[Tax02] [bigint] NULL,
	[Tax03] [bigint] NULL,
	[Tax04] [bigint] NULL,
	[Tax05] [bigint] NULL,
	[Tax06] [bigint] NULL,
	[Tax07] [bigint] NULL,
	[Tax08] [bigint] NULL,
	[Tax09] [bigint] NULL,
	[Tax10] [bigint] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OFFICE_doNursingHome]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OFFICE_doNursingHome](
	[ID] [bigint] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[AggregateSource] [int] NULL,
	[Guid] [uniqueidentifier] NULL,
	[IsDefault] [int] NULL,
	[AccountCategory] [nvarchar](MAX) NULL,
	[AddressLine1] [nvarchar](MAX) NULL,
	[AddressLine2] [nvarchar](MAX) NULL,
	[AddressState] [nvarchar](MAX) NULL,
	[AlternateAddress] [nvarchar](MAX) NULL,
	[AlternateSuburb] [nvarchar](MAX) NULL,
	[AutoCreateAccount] [bit] NULL,
	[AutoCreateNursingHomeAccount] [bit] NULL,
	[AutoCreatePatientAccount] [bit] NULL,
	[AutomaticallyPrintInvoice] [bit] NULL,
	[City] [nvarchar](MAX) NULL,
	[Code] [nvarchar](MAX) NULL,
	[Company] [nvarchar](MAX) NULL,
	[DefaultPrivateFee] [numeric](28, 10) NULL,
	[DefaultPrivateMarkup] [numeric](28, 10) NULL,
	[DefaultScriptType] [nvarchar](MAX) NULL,
	[EmailAddress] [nvarchar](MAX) NULL,
	[EndServicingDate] [datetime] NULL,
	[ExcludeRequired] [nchar](1) NULL,
	[FaxNumber] [nvarchar](MAX) NULL,
	[FirstName] [nvarchar](MAX) NULL,
	[GSTIncluded] [bit] NULL,
	[GroupedDescription] [nvarchar](MAX) NULL,
	[IsANursingHome] [bit] NULL,
	[LastName] [nvarchar](MAX) NULL,
	[MobileNumber] [nvarchar](MAX) NULL,
	[PackOldFormat] [nchar](1) NULL,
	[PackRequiresPrn] [bit] NULL,
	[PackSigningRequired] [bit] NULL,
	[PackSlot] [numeric](28, 10) NULL,
	[PackTimeSlot1] [nvarchar](MAX) NULL,
	[PackTimeSlot2] [nvarchar](MAX) NULL,
	[PackTimeSlot3] [nvarchar](MAX) NULL,
	[PackTimeSlot4] [nvarchar](MAX) NULL,
	[PackTimeSlot5] [nvarchar](MAX) NULL,
	[PackTimeSlot6] [nvarchar](MAX) NULL,
	[PackTimeSlot7] [nvarchar](MAX) NULL,
	[PackTimeSlot8] [nvarchar](MAX) NULL,
	[PackToDate] [datetime] NULL,
	[PackUnitDose] [bit] NULL,
	[PackWebsterSystem] [bit] NULL,
	[PackingStartOfWeek] [numeric](28, 10) NULL,
	[PackingType] [nchar](1) NULL,
	[PhoneNumber] [nvarchar](MAX) NULL,
	[PostCode] [nvarchar](MAX) NULL,
	[ReminderNotice] [bit] NULL,
	[RepatToSafetyNet] [bit] NULL,
	[StartServicingDate] [datetime] NULL,
	[Title] [nvarchar](MAX) NULL,
	[UseNursingHomeAddress] [bit] NULL,
	[Web] [nvarchar](MAX) NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OFFICE_doPatient]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OFFICE_doPatient](
	[ID] [bigint] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[AggregateSource] [int] NULL,
	[Guid] [uniqueidentifier] NULL,
	[IsDefault] [int] NULL,
	[AccountNumber] [bigint] NULL,
	[AccountType] [nvarchar](MAX) NULL,
	[Address] [nvarchar](MAX) NULL,
	[AdmissionNumber] [bigint] NULL,
	[Allergies] [nvarchar](MAX) NULL,
	[ApplyGST] [bit] NULL,
	[AutoChargeAccount] [bit] NULL,
	[AutomaticReceiptPrinting] [bit] NULL,
	[BirthDate] [datetime] NULL,
	[ConcessionExpiryDate] [datetime] NULL,
	[ConcessionNumber] [nvarchar](MAX) NULL,
	[ConcessionType] [nchar](1) NULL,
	[Customer] [bigint] NULL,
	[Email] [nvarchar](MAX) NULL,
	[FamilyCode] [bigint] NULL,
	[FamilyIndicator] [nchar](1) NULL,
	[FirstName] [nvarchar](MAX) NULL,
	[Gender] [int] NULL,
	[GenericOnly] [bit] NULL,
	[GroupedDescription] [nvarchar](MAX) NULL,
	[HealthFundIdentifaction] [nvarchar](MAX) NULL,
	[HealthFundLevelOfCover] [nvarchar](MAX) NULL,
	[HealthFundMemberNumber] [nvarchar](MAX) NULL,
	[InsuranceValidToDate] [datetime] NULL,
	[IsDiscount] [bit] NULL,
	[IsDoctor] [bit] NULL,
	[LastName] [nvarchar](MAX) NULL,
	[MailCategory] [nvarchar](MAX) NULL,
	[MedicareConsent] [nchar](1) NULL,
	[MedicareExpiryDate] [datetime] NULL,
	[MedicareNumber] [bigint] NULL,
	[Notes] [nvarchar](MAX) NULL,
	[NursingHome] [bigint] NULL,
	[NursingHomeBedNumber] [nvarchar](MAX) NULL,
	[NursingHomeCode] [nvarchar](MAX) NULL,
	[NursingHomeRoomNumber] [nvarchar](MAX) NULL,
	[NursingHomeURNumber] [nvarchar](MAX) NULL,
	[NursingHomeWardNumber] [nvarchar](MAX) NULL,
	[OutSideScriptAmount] [numeric](28, 10) NULL,
	[OutSideScriptCount] [bigint] NULL,
	[OwesScript] [bit] NULL,
	[PatientNumber] [bigint] NULL,
	[PatientStatus] [nchar](1) NULL,
	[PatientType] [nchar](1) NULL,
	[PhoneNumber] [nvarchar](MAX) NULL,
	[PostCode] [bigint] NULL,
	[PrivateFeeMarkUp] [nvarchar](MAX) NULL,
	[RepatCardColour] [nchar](1) NULL,
	[RepatNumber] [nvarchar](MAX) NULL,
	[RepeatsOnFile] [bit] NULL,
	[SafetyNetScriptAmount] [numeric](28, 10) NULL,
	[SafetyNetScriptCount] [bigint] NULL,
	[SafteyNetEntitlementNumber] [nvarchar](MAX) NULL,
	[Suburb] [nvarchar](MAX) NULL,
	[Title] [nvarchar](MAX) NULL,
	[Ward] [bigint] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OFFICE_doPharmacist]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OFFICE_doPharmacist](
	[ID] [bigint] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[AggregateSource] [int] NULL,
	[Guid] [uniqueidentifier] NULL,
	[IsDefault] [int] NULL,
	[FirstName] [nvarchar](MAX) NULL,
	[GroupedDescription] [nvarchar](MAX) NULL,
	[LastName] [nvarchar](MAX) NULL,
	[PharmacistsInitials] [nvarchar](MAX) NULL,
	[RegistrationNumber] [nvarchar](MAX) NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OFFICE_doPricingPlan]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OFFICE_doPricingPlan](
	[ID] [bigint] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[AggregateSource] [int] NULL,
	[Guid] [uniqueidentifier] NULL,
	[IsDefault] [int] NULL,
	[Description] [nvarchar](MAX) NULL,
	[FixedRetail] [numeric](28, 10) NULL,
	[MarginMarkup] [int] NULL,
	[MarginMarkupValue] [numeric](28, 10) NULL,
	[Name] [nvarchar](MAX) NULL,
	[PlanType] [int] NULL,
	[PricingLevel] [int] NULL,
	[RoundingDenomination] [numeric](28, 10) NULL,
	[RoundingLowerBound] [numeric](28, 10) NULL,
	[RoundingOption] [int] NULL,
	[RoundingUpperBound] [numeric](28, 10) NULL,
	[Supplier] [bigint] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OFFICE_doPricingReview]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OFFICE_doPricingReview](
	[ID] [bigint] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[AggregateSource] [int] NULL,
	[Guid] [uniqueidentifier] NULL,
	[IsDefault] [int] NULL,
	[IBHeaderGuid] [uniqueidentifier] NULL,
	[RapidObjectGuid] [uniqueidentifier] NULL,
	[RapidSyncRequired] [bit] NULL,
	[RecordStatus] [bigint] NULL,
	[Code] [nvarchar](MAX) NULL,
	[CommittedBy] [nvarchar](MAX) NULL,
	[CommittedDate] [datetime] NULL,
	[Description] [nvarchar](MAX) NULL,
	[EffectiveDate] [datetime] NULL,
	[InActive] [bit] NULL,
	[IsApplied] [bit] NULL,
	[PricingReviewSourceType] [int] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OFFICE_doPricingReviewEntry]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OFFICE_doPricingReviewEntry](
	[ID] [bigint] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[AggregateSource] [int] NULL,
	[Guid] [uniqueidentifier] NULL,
	[IsDefault] [int] NULL,
	[IBHeaderGuid] [uniqueidentifier] NULL,
	[RapidObjectGuid] [uniqueidentifier] NULL,
	[RapidSyncRequired] [bit] NULL,
	[RecordStatus] [bigint] NULL,
	[AcceptStatus] [int] NULL,
	[AutoCalcPriceLevel] [bit] NULL,
	[InActive] [bit] NULL,
	[Item] [bigint] NULL,
	[NewCost] [numeric](28, 10) NULL,
	[NewMSRP] [numeric](28, 10) NULL,
	[NewPriceA] [numeric](28, 10) NULL,
	[NewPriceB] [numeric](28, 10) NULL,
	[NewPriceC] [numeric](28, 10) NULL,
	[NewRetail] [numeric](28, 10) NULL,
	[NewSupplierCost] [numeric](28, 10) NULL,
	[OldCost] [numeric](28, 10) NULL,
	[OldMSRP] [numeric](28, 10) NULL,
	[OldPriceA] [numeric](28, 10) NULL,
	[OldPriceB] [numeric](28, 10) NULL,
	[OldPriceC] [numeric](28, 10) NULL,
	[OldRetail] [numeric](28, 10) NULL,
	[OldSupplierCost] [numeric](28, 10) NULL,
	[PricingReview] [bigint] NULL,
	[Source] [nvarchar](MAX) NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OFFICE_doPurchaseOrder]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OFFICE_doPurchaseOrder](
	[ID] [bigint] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[AggregateSource] [int] NULL,
	[Guid] [uniqueidentifier] NULL,
	[IsDefault] [int] NULL,
	[IBHeaderGuid] [uniqueidentifier] NULL,
	[RapidObjectGuid] [uniqueidentifier] NULL,
	[RapidSyncRequired] [bit] NULL,
	[RecordStatus] [bigint] NULL,
	[ApprovedBy] [nvarchar](MAX) NULL,
	[ApprovedDate] [datetime] NULL,
	[CancelledDate] [datetime] NULL,
	[CompletedDate] [datetime] NULL,
	[CompletedValue] [numeric](28, 10) NULL,
	[CreatedBy] [nvarchar](MAX) NULL,
	[Currency] [bigint] NULL,
	[DeliverAfter] [datetime] NULL,
	[DeliverBefore] [datetime] NULL,
	[ExchangeRate] [float] NULL,
	[GatewayId] [bigint] NULL,
	[HasInvoice] [bit] NULL,
	[HasOOSInvoice] [bit] NULL,
	[IsAutoGenerated] [bit] NULL,
	[IsBootstrapped] [bit] NULL,
	[IsCancelled] [bit] NULL,
	[IsPlaced] [bit] NULL,
	[PharmXStatus] [int] NULL,
	[PurchaseOrderEntryLastModified] [bigint] NULL,
	[PurchaseOrderNumber] [nvarchar](MAX) NULL,
	[PurchaseOrderSource] [int] NULL,
	[PurchaseOrderStatus] [int] NULL,
	[PurchaseOrderType] [int] NULL,
	[PurchaseOrderUpdateLevel] [int] NULL,
	[Remarks] [nvarchar](MAX) NULL,
	[RequiredDate] [datetime] NULL,
	[ReturnApprovalNumber] [nvarchar](MAX) NULL,
	[SentDate] [datetime] NULL,
	[ShipFrom] [nvarchar](MAX) NULL,
	[ShipTo] [nvarchar](MAX) NULL,
	[ShipVia] [nvarchar](MAX) NULL,
	[Supplier] [bigint] NULL,
	[SupplierResponse] [nvarchar](MAX) NULL,
	[Terms] [nvarchar](MAX) NULL,
	[Title] [nvarchar](MAX) NULL,
	[TransferReason] [bigint] NULL,
	[WorksheetID] [bigint] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OFFICE_doPurchaseOrderEntry]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OFFICE_doPurchaseOrderEntry](
	[ID] [bigint] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[AggregateSource] [int] NULL,
	[Guid] [uniqueidentifier] NULL,
	[IsDefault] [int] NULL,
	[IBHeaderGuid] [uniqueidentifier] NULL,
	[RapidObjectGuid] [uniqueidentifier] NULL,
	[RapidSyncRequired] [bit] NULL,
	[RecordStatus] [bigint] NULL,
	[Comment] [nvarchar](MAX) NULL,
	[CurrentCost] [numeric](28, 10) NULL,
	[DealCatalogueName] [nvarchar](MAX) NULL,
	[DealMinDOQ] [float] NULL,
	[ExtOrderCostTax] [numeric](28, 10) NULL,
	[GatewayResponse] [nvarchar](MAX) NULL,
	[ItemDescription] [nvarchar](MAX) NULL,
	[ItemTax] [bigint] NULL,
	[OrderCost] [numeric](28, 10) NULL,
	[OrderCostTax] [numeric](28, 10) NULL,
	[OrderedItem] [bigint] NULL,
	[OriginalQuantityOrdered] [float] NULL,
	[PackQuantity] [int] NULL,
	[PurchaseOrder] [bigint] NULL,
	[QuantityOrdered] [float] NULL,
	[QuantityReceivedToDate] [float] NULL,
	[QuantityReturnForCreditToDate] [float] NULL,
	[ReasonCode] [bigint] NULL,
	[ReorderNumber] [nvarchar](MAX) NULL,
	[SentForPricing] [int] NULL,
	[ShowOnOrder] [bit] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OFFICE_doQuantityDiscountScheme]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OFFICE_doQuantityDiscountScheme](
	[ID] [bigint] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[AggregateSource] [int] NULL,
	[Guid] [uniqueidentifier] NULL,
	[IsDefault] [int] NULL,
	[IBHeaderGuid] [uniqueidentifier] NULL,
	[RapidObjectGuid] [uniqueidentifier] NULL,
	[RapidSyncRequired] [bit] NULL,
	[RecordStatus] [bigint] NULL,
	[Active] [bit] NULL,
	[Code] [nvarchar](MAX) NULL,
	[Description] [nvarchar](MAX) NULL,
	[DiscountOddItems] [bit] NULL,
	[DiscountSchemeType] [int] NULL,
	[ExtendedPriceDiscount] [bit] NULL,
	[PercentOffPrice1] [float] NULL,
	[PercentOffPrice1A] [float] NULL,
	[PercentOffPrice1B] [float] NULL,
	[PercentOffPrice1C] [float] NULL,
	[PercentOffPrice2] [float] NULL,
	[PercentOffPrice2A] [float] NULL,
	[PercentOffPrice2B] [float] NULL,
	[PercentOffPrice2C] [float] NULL,
	[PercentOffPrice3] [float] NULL,
	[PercentOffPrice3A] [float] NULL,
	[PercentOffPrice3B] [float] NULL,
	[PercentOffPrice3C] [float] NULL,
	[PercentOffPrice4] [float] NULL,
	[PercentOffPrice4A] [float] NULL,
	[PercentOffPrice4B] [float] NULL,
	[PercentOffPrice4C] [float] NULL,
	[Price1] [numeric](28, 10) NULL,
	[Price1A] [numeric](28, 10) NULL,
	[Price1B] [numeric](28, 10) NULL,
	[Price1C] [numeric](28, 10) NULL,
	[Price2] [numeric](28, 10) NULL,
	[Price2A] [numeric](28, 10) NULL,
	[Price2B] [numeric](28, 10) NULL,
	[Price2C] [numeric](28, 10) NULL,
	[Price3] [numeric](28, 10) NULL,
	[Price3A] [numeric](28, 10) NULL,
	[Price3B] [numeric](28, 10) NULL,
	[Price3C] [numeric](28, 10) NULL,
	[Price4] [numeric](28, 10) NULL,
	[Price4A] [numeric](28, 10) NULL,
	[Price4B] [numeric](28, 10) NULL,
	[Price4C] [numeric](28, 10) NULL,
	[Quantity1] [float] NULL,
	[Quantity2] [float] NULL,
	[Quantity3] [float] NULL,
	[Quantity4] [float] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OFFICE_doRegister]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OFFICE_doRegister](
	[ID] [bigint] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[AggregateSource] [int] NULL,
	[Guid] [uniqueidentifier] NULL,
	[IsDefault] [int] NULL,
	[IBHeaderGuid] [uniqueidentifier] NULL,
	[RapidObjectGuid] [uniqueidentifier] NULL,
	[RapidSyncRequired] [bit] NULL,
	[RecordStatus] [bigint] NULL,
	[Description] [nvarchar](MAX) NULL,
	[RegisterNumber] [int] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OFFICE_doScript]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OFFICE_doScript](
	[ID] [bigint] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[AggregateSource] [int] NULL,
	[Guid] [uniqueidentifier] NULL,
	[IsDefault] [int] NULL,
	[ActivityAction] [int] NULL,
	[AuthorityNumber] [bigint] NULL,
	[ChargeAccount] [bigint] NULL,
	[ChargeAmount] [numeric](28, 10) NULL,
	[ChargeType] [nvarchar](MAX) NULL,
	[DDRepeatInterval] [bigint] NULL,
	[Deferred] [bit] NULL,
	[Deleted] [bit] NULL,
	[DispenseDate] [datetime] NULL,
	[DispenseNumber] [bigint] NULL,
	[Doctor] [bigint] NULL,
	[DoctorCode] [nvarchar](MAX) NULL,
	[DoctorName] [nvarchar](MAX) NULL,
	[DoctorPrescriberNumber] [bigint] NULL,
	[Drug] [bigint] NULL,
	[DrugAlternateDescription] [nvarchar](MAX) NULL,
	[DrugCode] [nvarchar](MAX) NULL,
	[DrugDescription] [nvarchar](MAX) NULL,
	[DrugDispenseType] [nchar](1) NULL,
	[DrugInteractionGroup] [bigint] NULL,
	[DrugItem] [bigint] NULL,
	[FreeIndex1] [nvarchar](MAX) NULL,
	[FreeIndex2] [nvarchar](MAX) NULL,
	[FreeIndex3] [nvarchar](MAX) NULL,
	[FreeIndex4] [nvarchar](MAX) NULL,
	[GenericCode] [nvarchar](MAX) NULL,
	[GlassBottle] [bit] NULL,
	[GovernmentRecoveryAmount] [numeric](28, 10) NULL,
	[GstIncluded] [bit] NULL,
	[HBFRecoveryAmount] [numeric](28, 10) NULL,
	[HospitalProviderNumber] [nvarchar](MAX) NULL,
	[Ignore] [bit] NULL,
	[ImmediateSupply] [bit] NULL,
	[IsAuthority] [bit] NULL,
	[IsNarcotic] [bit] NULL,
	[IsOutsideRepeat] [bit] NULL,
	[LargeLabelSigs] [nvarchar](MAX) NULL,
	[LargeLabelType] [nvarchar](MAX) NULL,
	[ManufacturerCode] [nvarchar](MAX) NULL,
	[MaximumDispensings] [bigint] NULL,
	[NationalHealthSchemeCode] [nvarchar](MAX) NULL,
	[NursingHome] [bigint] NULL,
	[NursingHomeCode] [nvarchar](MAX) NULL,
	[OriginalScriptNumber] [nvarchar](MAX) NULL,
	[OriginalSupplyingPharmacy] [nvarchar](MAX) NULL,
	[POSTransferQuantity] [bigint] NULL,
	[Packs] [float] NULL,
	[Patient] [bigint] NULL,
	[PatientInstructions] [nvarchar](MAX) NULL,
	[PatientNumber] [nvarchar](MAX) NULL,
	[PatientPrice] [numeric](28, 10) NULL,
	[PerformStockMovement] [bit] NULL,
	[Pharmacist] [bigint] NULL,
	[PharmacistsInitials] [nvarchar](MAX) NULL,
	[PrescriptionDate] [datetime] NULL,
	[Quantity] [bigint] NULL,
	[RepeatFastCode] [nvarchar](MAX) NULL,
	[RepeatScriptNumber] [bigint] NULL,
	[SafetyNetAmount] [numeric](28, 10) NULL,
	[SaleCost] [numeric](28, 10) NULL,
	[ScriptClassification] [nchar](1) NULL,
	[ScriptNumber] [bigint] NULL,
	[ScriptProcessLogic] [ntext] NULL,
	[ScriptStatus] [nchar](1) NULL,
	[ScriptType] [nvarchar](MAX) NULL,
	[WADDVerified] [nvarchar](MAX) NULL,
	[Ward] [bigint] NULL,
	[WardNumber] [nvarchar](MAX) NULL,
	[WholesaleCost] [numeric](28, 10) NULL,
	[StoreID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OFFICE_doStatement]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OFFICE_doStatement](
	[ID] [bigint] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[Account] [bigint] NULL,
	[Adjustments] [numeric](28, 10) NULL,
	[Charges] [numeric](28, 10) NULL,
	[Closed] [bit] NULL,
	[ClosingBalance] [numeric](28, 10) NULL,
	[Days30] [numeric](28, 10) NULL,
	[Days60] [numeric](28, 10) NULL,
	[Days90] [numeric](28, 10) NULL,
	[EndDate] [datetime] NULL,
	[GeneratedDate] [datetime] NULL,
	[OpeningBalance] [numeric](28, 10) NULL,
	[Payments] [numeric](28, 10) NULL,
	[Sales] [numeric](28, 10) NULL,
	[StartDate] [datetime] NULL,
	[StatementBatch] [bigint] NULL,
	[StatementNumber] [bigint] NULL,
	[StatementXml] [varbinary](max) NULL,
	[Tax] [numeric](28, 10) NULL,
	[Transfers] [numeric](28, 10) NULL,
	[StoreID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OFFICE_doStocktake]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OFFICE_doStocktake](
	[ID] [bigint] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[CommittedDate] [datetime] NULL,
	[Description] [nvarchar](MAX) NULL,
	[ImportedDataTable] [image] NULL,
	[Name] [nvarchar](MAX) NULL,
	[ProtectedDate] [datetime] NULL,
	[SatScanCode] [int] NULL,
	[StocktakeType] [int] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OFFICE_doStocktakeEntry]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OFFICE_doStocktakeEntry](
	[ID] [bigint] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[ChangeCount] [int] NULL,
	[Code] [nvarchar](MAX) NULL,
	[Cost] [decimal](28, 10) NULL,
	[Description] [nvarchar](MAX) NULL,
	[LastCounted] [datetime] NULL,
	[QuantityCounted] [float] NULL,
	[QuantityOnHand] [float] NULL,
	[Stocktake] [bigint] NULL,
	[StocktakedItem] [bigint] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OFFICE_doSupplier]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OFFICE_doSupplier](
	[ID] [bigint] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[AggregateSource] [int] NULL,
	[Guid] [uniqueidentifier] NULL,
	[IsDefault] [int] NULL,
	[IBHeaderGuid] [uniqueidentifier] NULL,
	[RapidObjectGuid] [uniqueidentifier] NULL,
	[RapidSyncRequired] [bit] NULL,
	[RecordStatus] [bigint] NULL,
	[ABN] [nvarchar](MAX) NULL,
	[AccountNumber] [nvarchar](MAX) NULL,
	[AddressLine1] [nvarchar](MAX) NULL,
	[AddressLine2] [nvarchar](MAX) NULL,
	[AddressState] [nvarchar](MAX) NULL,
	[AppCatHQID] [bigint] NULL,
	[AppCatHQLastMatched] [datetime] NULL,
	[ApplyTax] [bit] NULL,
	[City] [nvarchar](MAX) NULL,
	[Code] [nvarchar](MAX) NULL,
	[Company] [nvarchar](MAX) NULL,
	[ContactName] [nvarchar](MAX) NULL,
	[Country] [nvarchar](MAX) NULL,
	[Currency] [bigint] NULL,
	[CustomDate1] [datetime] NULL,
	[CustomDate2] [datetime] NULL,
	[CustomDate3] [datetime] NULL,
	[CustomDate4] [datetime] NULL,
	[CustomDate5] [datetime] NULL,
	[CustomNumber1] [float] NULL,
	[CustomNumber2] [float] NULL,
	[CustomNumber3] [float] NULL,
	[CustomNumber4] [float] NULL,
	[CustomNumber5] [float] NULL,
	[CustomText1] [nvarchar](MAX) NULL,
	[CustomText2] [nvarchar](MAX) NULL,
	[CustomText3] [nvarchar](MAX) NULL,
	[CustomText4] [nvarchar](MAX) NULL,
	[CustomText5] [nvarchar](MAX) NULL,
	[DeliveringSupplier] [bigint] NULL,
	[EmailAddress] [nvarchar](MAX) NULL,
	[FaxNumber] [nvarchar](MAX) NULL,
	[FirstName] [nvarchar](MAX) NULL,
	[GroupedDescription] [nvarchar](MAX) NULL,
	[InActive] [bit] NULL,
	[IsBanner] [bit] NULL,
	[IsBuyingGroup] [bit] NULL,
	[IsDirectSupplier] [bit] NULL,
	[IsManufacturer] [bit] NULL,
	[IsWholesaler] [bit] NULL,
	[LastName] [nvarchar](MAX) NULL,
	[LocalKey] [nvarchar](MAX) NULL,
	[MinimumOrderAmount] [numeric](28, 10) NULL,
	[MobileNumber] [nvarchar](MAX) NULL,
	[NoGateway] [bit] NULL,
	[ObeyAccountCreditLimit] [bit] NULL,
	[OrderingCode] [nvarchar](MAX) NULL,
	[PhoneNumber] [nvarchar](MAX) NULL,
	[PostCode] [nvarchar](MAX) NULL,
	[PricelineSupplierType] [int] NULL,
	[Remarks] [nvarchar](MAX) NULL,
	[RemoteHost] [nvarchar](MAX) NULL,
	[RemoteKey] [nvarchar](MAX) NULL,
	[RemotePort] [nvarchar](MAX) NULL,
	[SendOrdersViaProxySupplier] [bit] NULL,
	[ShowCostPrice] [bit] NULL,
	[Terms] [nvarchar](MAX) NULL,
	[Title] [nvarchar](MAX) NULL,
	[TransferOutChargeAccount] [bigint] NULL,
	[TransferType] [int] NULL,
	[UpdateCost] [bit] NULL,
	[Web] [nvarchar](MAX) NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OFFICE_doSupplierItem]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OFFICE_doSupplierItem](
	[ID] [bigint] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[AggregateSource] [int] NULL,
	[Guid] [uniqueidentifier] NULL,
	[IsDefault] [int] NULL,
	[IBHeaderGuid] [uniqueidentifier] NULL,
	[RapidObjectGuid] [uniqueidentifier] NULL,
	[RapidSyncRequired] [bit] NULL,
	[RecordStatus] [bigint] NULL,
	[Cost] [numeric](28, 10) NULL,
	[CostPrice1] [numeric](28, 10) NULL,
	[CostPrice2] [numeric](28, 10) NULL,
	[CostPrice3] [numeric](28, 10) NULL,
	[CostPrice4] [numeric](28, 10) NULL,
	[CostPrice5] [numeric](28, 10) NULL,
	[CostPriceQuantity1] [float] NULL,
	[CostPriceQuantity2] [float] NULL,
	[CostPriceQuantity3] [float] NULL,
	[CostPriceQuantity4] [float] NULL,
	[CostPriceQuantity5] [float] NULL,
	[DealCatalogueName] [nvarchar](MAX) NULL,
	[DealCost] [numeric](28, 10) NULL,
	[DealEndDate] [datetime] NULL,
	[DealMinDOQ] [float] NULL,
	[DealStartDate] [datetime] NULL,
	[ItemSupplied] [bigint] NULL,
	[ItemTax] [bigint] NULL,
	[LastCost] [numeric](28, 10) NULL,
	[LastExchangeRate] [numeric](28, 10) NULL,
	[LastForeignCost] [numeric](28, 10) NULL,
	[LastReceivedDate] [datetime] NULL,
	[MinimumOrder] [int] NULL,
	[NeverAutoMatch] [bit] NULL,
	[PackQuantity] [int] NULL,
	[PurchaseTax] [bigint] NULL,
	[Quantity] [float] NULL,
	[RRP] [numeric](28, 10) NULL,
	[ReceiveItemQuantity] [float] NULL,
	[ReorderNumber] [nvarchar](MAX) NULL,
	[Supplier] [bigint] NULL,
	[SupplierDescription] [nvarchar](MAX) NULL,
	[TaxInc] [bit] NULL,
	[TaxRate] [float] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OFFICE_doTender]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OFFICE_doTender](
	[ID] [bigint] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[AggregateSource] [int] NULL,
	[Guid] [uniqueidentifier] NULL,
	[IsDefault] [int] NULL,
	[Activity] [bigint] NULL,
	[Amount] [numeric](28, 10) NULL,
	[DropPayout] [bigint] NULL,
	[TenderAction] [int] NULL,
	[TenderType] [bigint] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OFFICE_doUserAccount]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OFFICE_doUserAccount](
	[ID] [bigint] NULL,
	[AddressLine1] [nvarchar](MAX) NULL,
	[AddressLine2] [nvarchar](MAX) NULL,
	[AddressState] [nvarchar](MAX) NULL,
	[AllowTaskAllocation] [bit] NULL,
	[Cashier] [bigint] NULL,
	[City] [nvarchar](MAX) NULL,
	[Company] [nvarchar](MAX) NULL,
	[EmailAddress] [nvarchar](MAX) NULL,
	[FaxNumber] [nvarchar](MAX) NULL,
	[FirstName] [nvarchar](MAX) NULL,
	[LastName] [nvarchar](MAX) NULL,
	[MobileNumber] [nvarchar](MAX) NULL,
	[PhoneNumber] [nvarchar](MAX) NULL,
	[PinCode] [nvarchar](MAX) NULL,
	[PostCode] [nvarchar](MAX) NULL,
	[ResourceColour] [nvarchar](MAX) NULL,
	[Title] [nvarchar](MAX) NULL,
	[UserName] [nvarchar](MAX) NULL,
	[Web] [nvarchar](MAX) NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[POS_Batch]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_Batch](
	[CustomerDepositMade] [money] NULL,
	[CustomerDepositRedeemed] [money] NULL,
	[LastUpdated] [datetime] NULL,
	[BatchNumber] [int] NULL,
	[Status] [smallint] NULL,
	[RegisterID] [int] NULL,
	[OpeningTime] [datetime] NULL,
	[ClosingTime] [datetime] NULL,
	[OpeningTotal] [money] NULL,
	[ClosingTotal] [money] NULL,
	[Sales] [money] NULL,
	[Returns] [money] NULL,
	[Tax] [money] NULL,
	[SalesPlusTax] [money] NULL,
	[Commission] [money] NULL,
	[PaidOut] [money] NULL,
	[Dropped] [money] NULL,
	[PaidOnAccount] [money] NULL,
	[PaidToAccount] [money] NULL,
	[CustomerCount] [int] NULL,
	[NoSalesCount] [int] NULL,
	[AbortedTransCount] [int] NULL,
	[TotalTendered] [money] NULL,
	[TotalChange] [money] NULL,
	[Discounts] [money] NULL,
	[CostOfGoods] [money] NULL,
	[LayawayPaid] [money] NULL,
	[LayawayClosed] [money] NULL,
	[Shipping] [money] NULL,
	[TenderRoundingError] [money] NULL,
	[DebitSurcharge] [money] NULL,
	[CashBackSurcharge] [money] NULL,
	[NUSSkipUpdate] [bit] NULL,
	[NUSSkipPOUpdate] [bit] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[POS_Cashier]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_Cashier](
	[HQID] [int] NULL,
	[LastUpdated] [datetime] NULL,
	[Number] [nvarchar](MAX) NULL,
	[ID] [int] NULL,
	[Name] [nvarchar](MAX) NULL,
	[Password] [nvarchar](MAX) NULL,
	[FloorLimit] [money] NULL,
	[ReturnLimit] [money] NULL,
	[CashDrawerNumber] [smallint] NULL,
	[SecurityLevel] [smallint] NULL,
	[Privileges] [int] NULL,
	[EmailAddress] [nvarchar](MAX) NULL,
	[FailedLogonAttempts] [int] NULL,
	[MaxOverShortAmount] [money] NULL,
	[MaxOverShortPercent] [float] NULL,
	[OverShortLimitType] [int] NULL,
	[Telephone] [nvarchar](MAX) NULL,
	[NUSSkipUpdate] [bit] NULL,
	[NUSSkipPOUpdate] [bit] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[POS_Category]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_Category](
	[HQID] [int] NULL,
	[ID] [int] NULL,
	[DepartmentID] [int] NULL,
	[Name] [nvarchar](MAX) NULL,
	[Code] [nvarchar](MAX) NULL,
	[NUSSkipUpdate] [bit] NULL,
	[NUSSkipPOUpdate] [bit] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[POS_Customer]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_Customer](
	[AccountNumber] [nvarchar](MAX) NULL,
	[AccountTypeID] [int] NULL,
	[Address2] [nvarchar](MAX) NULL,
	[AssessFinanceCharges] [bit] NULL,
	[Company] [nvarchar](MAX) NULL,
	[Country] [nvarchar](MAX) NULL,
	[CustomDate1] [datetime] NULL,
	[CustomDate2] [datetime] NULL,
	[CustomDate3] [datetime] NULL,
	[CustomDate4] [datetime] NULL,
	[CustomDate5] [datetime] NULL,
	[CustomNumber1] [float] NULL,
	[CustomNumber2] [float] NULL,
	[CustomNumber3] [float] NULL,
	[CustomNumber4] [float] NULL,
	[CustomNumber5] [float] NULL,
	[CustomText1] [nvarchar](MAX) NULL,
	[CustomText2] [nvarchar](MAX) NULL,
	[CustomText3] [nvarchar](MAX) NULL,
	[CustomText4] [nvarchar](MAX) NULL,
	[CustomText5] [nvarchar](MAX) NULL,
	[GlobalCustomer] [bit] NULL,
	[HQID] [int] NULL,
	[LastStartingDate] [datetime] NULL,
	[LastClosingDate] [datetime] NULL,
	[LastUpdated] [datetime] NULL,
	[LimitPurchase] [bit] NULL,
	[LastClosingBalance] [money] NULL,
	[PrimaryShipToID] [int] NULL,
	[State] [nvarchar](MAX) NULL,
	[ID] [int] NULL,
	[LayawayCustomer] [bit] NULL,
	[Employee] [bit] NULL,
	[FirstName] [nvarchar](MAX) NULL,
	[LastName] [nvarchar](MAX) NULL,
	[Address] [nvarchar](MAX) NULL,
	[City] [nvarchar](MAX) NULL,
	[Zip] [nvarchar](MAX) NULL,
	[AccountBalance] [money] NULL,
	[CreditLimit] [money] NULL,
	[TotalSales] [money] NULL,
	[AccountOpened] [datetime] NULL,
	[LastVisit] [datetime] NULL,
	[TotalVisits] [int] NULL,
	[TotalSavings] [money] NULL,
	[CurrentDiscount] [real] NULL,
	[PriceLevel] [smallint] NULL,
	[TaxExempt] [bit] NULL,
	[Notes] [ntext] NULL,
	[Title] [nvarchar](MAX) NULL,
	[EmailAddress] [nvarchar](MAX) NULL,
	[TaxNumber] [nvarchar](MAX) NULL,
	[PictureName] [nvarchar](MAX) NULL,
	[DefaultShippingServiceID] [int] NULL,
	[PhoneNumber] [nvarchar](MAX) NULL,
	[FaxNumber] [nvarchar](MAX) NULL,
	[CashierID] [int] NULL,
	[SalesRepID] [int] NULL,
	[NUSSkipUpdate] [bit] NULL,
	[NUSSkipPOUpdate] [bit] NULL,
	[NUS_AccountTypeName] [nvarchar](MAX) NULL,
	[StoreID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[POS_Department]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_Department](
	[HQID] [int] NULL,
	[ID] [int] NULL,
	[Name] [nvarchar](MAX) NULL,
	[code] [nvarchar](MAX) NULL,
	[NUSSkipUpdate] [bit] NULL,
	[NUSSkipPOUpdate] [bit] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[POS_Item]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_Item](
	[BinLocation] [nvarchar](MAX) NULL,
	[BuydownPrice] [money] NULL,
	[BuydownQuantity] [float] NULL,
	[CommissionAmount] [money] NULL,
	[CommissionMaximum] [money] NULL,
	[CommissionMode] [int] NULL,
	[CommissionPercentProfit] [real] NULL,
	[CommissionPercentSale] [real] NULL,
	[Description] [nvarchar](MAX) NULL,
	[FoodStampable] [bit] NULL,
	[HQID] [int] NULL,
	[ItemNotDiscountable] [bit] NULL,
	[LastReceived] [datetime] NULL,
	[LastUpdated] [datetime] NULL,
	[Notes] [ntext] NULL,
	[QuantityCommitted] [float] NULL,
	[SerialNumberCount] [int] NULL,
	[TareWeightPercent] [float] NULL,
	[ID] [int] NULL,
	[ItemLookupCode] [nvarchar](MAX) NULL,
	[DepartmentID] [int] NULL,
	[CategoryID] [int] NULL,
	[MessageID] [int] NULL,
	[Price] [money] NULL,
	[PriceA] [money] NULL,
	[PriceB] [money] NULL,
	[PriceC] [money] NULL,
	[SalePrice] [money] NULL,
	[SaleStartDate] [datetime] NULL,
	[SaleEndDate] [datetime] NULL,
	[QuantityDiscountID] [int] NULL,
	[TaxID] [int] NULL,
	[ItemType] [smallint] NULL,
	[Cost] [money] NULL,
	[Quantity] [float] NULL,
	[ReorderPoint] [float] NULL,
	[RestockLevel] [float] NULL,
	[TareWeight] [float] NULL,
	[SupplierID] [int] NULL,
	[TagAlongItem] [int] NULL,
	[TagAlongQuantity] [float] NULL,
	[ParentItem] [int] NULL,
	[ParentQuantity] [float] NULL,
	[BarcodeFormat] [smallint] NULL,
	[PriceLowerBound] [money] NULL,
	[PriceUpperBound] [money] NULL,
	[PictureName] [nvarchar](MAX) NULL,
	[LastSold] [datetime] NULL,
	[ExtendedDescription] [ntext] NULL,
	[SubDescription1] [nvarchar](MAX) NULL,
	[SubDescription2] [nvarchar](MAX) NULL,
	[SubDescription3] [nvarchar](MAX) NULL,
	[UnitOfMeasure] [nvarchar](MAX) NULL,
	[SubCategoryID] [int] NULL,
	[QuantityEntryNotAllowed] [bit] NULL,
	[PriceMustBeEntered] [bit] NULL,
	[BlockSalesReason] [nvarchar](MAX) NULL,
	[BlockSalesAfterDate] [datetime] NULL,
	[Weight] [float] NULL,
	[Taxable] [bit] NULL,
	[BlockSalesBeforeDate] [datetime] NULL,
	[LastCost] [money] NULL,
	[ReplacementCost] [money] NULL,
	[WebItem] [bit] NULL,
	[BlockSalesType] [int] NULL,
	[BlockSalesScheduleID] [int] NULL,
	[SaleType] [int] NULL,
	[SaleScheduleID] [int] NULL,
	[Consignment] [bit] NULL,
	[Inactive] [bit] NULL,
	[LastCounted] [datetime] NULL,
	[DoNotOrder] [bit] NULL,
	[MSRP] [money] NULL,
	[DateCreated] [datetime] NULL,
	[Content] [ntext] NULL,
	[UsuallyShip] [nvarchar](MAX) NULL,
	[NUSSkipUpdate] [bit] NULL,
	[NUSSkipPOUpdate] [bit] NULL,
	[NUS_ExcludedFromLoyalty] [bit] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[POS_NUS_PO_Patient]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[POS_NUS_PO_Patient](
	[Id] [bigint] NULL,
	[PatientNumber] [bigint] NULL,
	[LastName] [varchar](50) NULL,
	[FirstName] [varchar](50) NULL,
	[Title] [varchar](6) NULL,
	[Address] [varchar](40) NULL,
	[Suburb] [varchar](50) NULL,
	[PostCode] [int] NULL,
	[NUSSkipPOUpdate] [bit] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[POS_NUS_PO_Script]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[POS_NUS_PO_Script](
	[Id] [bigint] NULL,
	[ScriptNumber] [bigint] NULL,
	[DispenseNumber] [int] NULL,
	[PatientPrice] [money] NULL,
	[GstIncluded] [bit] NULL,
	[SaleCost] [money] NULL,
	[DispenseDate] [datetime] NULL,
	[Patient] [bigint] NULL,
	[DrugItem] [bigint] NULL,
	[Quantity] [int] NULL,
	[Packs] [float] NULL,
	[NationalHealthSchemeCode] [varchar](6) NULL,
	[ScriptType] [varchar](4) NULL,
	[DrugDescription] [varchar](42) NULL,
	[GovernmentRecoveryAmount] [money] NULL,
	[RegisterId] [bigint] NULL,
	[SaleActivityEntry] [bigint] NULL,
	[ReturnActivityEntry] [bigint] NULL,
	[WorkOrderId] [bigint] NULL,
	[ChargeAccount] [bigint] NULL,
	[ChargeAmount] [money] NULL,
	[InstanceCount] [int] NULL,
	[Deleted] [bit] NULL,
	[Processed] [bit] NULL,
	[Available] [bit] NULL,
	[ActivityAction] [int] NULL,
	[PerformStockMovement] [bit] NULL,
	[VisibleSale] [int] NULL,
	[VisibleReturn] [int] NULL,
	[NUSSkipPOUpdate] [bit] NULL,
	[Created] [datetime] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[POS_NUS_PostCodeTransaction]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[POS_NUS_PostCodeTransaction](
	[id] [int] NULL,
	[LastUpdated] [datetime] NULL,
	[PostCode] [varchar](100) NULL,
	[RegisterID] [int] NULL,
	[CashierID] [int] NULL,
	[CustomerID] [int] NULL,
	[TransactionNumber] [int] NULL,
	[NUSSkipUpdate] [bit] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[POS_NUS_TransactionStats]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_NUS_TransactionStats](
	[id] [int] NULL,
	[LastUpdated] [datetime] NULL,
	[DateTransactionStart] [datetime] NULL,
	[RegisterID] [int] NULL,
	[CashierID] [int] NULL,
	[TransactionNumber] [int] NULL,
	[ChangeCount] [int] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[POS_Register]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[POS_Register](
	[Description] [nvarchar](MAX) NULL,
	[PoleDisplayEnabled] [bit] NULL,
	[Receipt2ID] [int] NULL,
	[ScaleEnabled] [bit] NULL,
	[ScaleTimeout] [float] NULL,
	[ScannerEnabled] [bit] NULL,
	[ZZBatchNumber] [int] NULL,
	[ID] [int] NULL,
	[Number] [smallint] NULL,
	[CurrentBatchNumber] [int] NULL,
	[Receipt1ID] [int] NULL,
	[PoleDisplayMessageID] [int] NULL,
	[Printer1Name] [nvarchar](MAX) NULL,
	[Printer1Options] [int] NULL,
	[Printer2Name] [nvarchar](MAX) NULL,
	[Printer2Options] [int] NULL,
	[ChannelID] [int] NULL,
	[NetDisplayEnabled] [bit] NULL,
	[DefaultPriceLevel] [int] NULL,
	[PoleDisplayName] [nvarchar](MAX) NULL,
	[ScaleName] [nvarchar](MAX) NULL,
	[ScannerName] [nvarchar](MAX) NULL,
	[Printer1Type] [int] NULL,
	[Printer2Type] [int] NULL,
	[CashDrawer1Name] [nvarchar](MAX) NULL,
	[CashDrawer1Enabled] [bit] NULL,
	[CashDrawer1WaitForClose] [bit] NULL,
	[CashDrawer1OpenTimeout] [int] NULL,
	[CashDrawer2Name] [nvarchar](MAX) NULL,
	[CashDrawer2Enabled] [bit] NULL,
	[CashDrawer2WaitForClose] [bit] NULL,
	[CashDrawer2OpenTimeout] [int] NULL,
	[MICRName] [nvarchar](MAX) NULL,
	[MICREnabled] [bit] NULL,
	[MICRTimeout] [float] NULL,
	[MSRName] [nvarchar](MAX) NULL,
	[MSREnabled] [bit] NULL,
	[SignatureCaptureName] [nvarchar](MAX) NULL,
	[SignatureCaptureEnabled] [bit] NULL,
	[SignatureCaptureFormName] [nvarchar](MAX) NULL,
	[TouchScreenEnabled] [bit] NULL,
	[KeyboardID] [int] NULL,
	[DefaultServiceID] [int] NULL,
	[PINPadEnabled] [bit] NULL,
	[PINPadName] [nvarchar](MAX) NULL,
	[PINPadSystem] [varchar](25) NULL,
	[TransactionHost] [int] NULL,
	[RealTimeSigCap] [bit] NULL,
	[NUSSkipUpdate] [bit] NULL,
	[NUSSkipPOUpdate] [bit] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[POS_SalesRep]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_SalesRep](
	[HQID] [int] NULL,
	[LastUpdated] [datetime] NULL,
	[Number] [nvarchar](MAX) NULL,
	[ID] [int] NULL,
	[Name] [nvarchar](MAX) NULL,
	[PercentOfSale] [real] NULL,
	[PercentOfProfit] [real] NULL,
	[FixedRate] [money] NULL,
	[EmailAddress] [nvarchar](MAX) NULL,
	[Telephone] [nvarchar](MAX) NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[POS_Store]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[POS_Store](
	[ID] [int] NULL,
	[Name] [varchar](50) NULL,
	[StoreCode] [varchar](30) NULL,
	[Region] [varchar](50) NULL,
	[Address1] [varchar](50) NULL,
	[Address2] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[Country] [varchar](20) NULL,
	[FaxNumber] [varchar](30) NULL,
	[PhoneNumber] [varchar](30) NULL,
	[State] [varchar](20) NULL,
	[Zip] [varchar](15) NULL,
	[ParentStoreID] [int] NULL,
	[ScheduleHourMask1] [int] NULL,
	[ScheduleHourMask2] [int] NULL,
	[ScheduleHourMask3] [int] NULL,
	[ScheduleHourMask4] [int] NULL,
	[ScheduleHourMask5] [int] NULL,
	[ScheduleHourMask6] [int] NULL,
	[ScheduleHourMask7] [int] NULL,
	[ScheduleMinute] [int] NULL,
	[RetryCount] [int] NULL,
	[RetryDelay] [int] NULL,
	[LastUpdated] [datetime] NULL,
	[AccountName] [nvarchar](MAX) NULL,
	[Password] [nvarchar](MAX) NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[POS_Supplier]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_Supplier](
	[Country] [nvarchar](MAX) NULL,
	[HQID] [int] NULL,
	[LastUpdated] [datetime] NULL,
	[State] [nvarchar](MAX) NULL,
	[ID] [int] NULL,
	[SupplierName] [nvarchar](MAX) NULL,
	[ContactName] [nvarchar](MAX) NULL,
	[Address1] [nvarchar](MAX) NULL,
	[Address2] [nvarchar](MAX) NULL,
	[City] [nvarchar](MAX) NULL,
	[Zip] [nvarchar](MAX) NULL,
	[EmailAddress] [nvarchar](MAX) NULL,
	[WebPageAddress] [nvarchar](MAX) NULL,
	[Code] [nvarchar](MAX) NULL,
	[AccountNumber] [nvarchar](MAX) NULL,
	[TaxNumber] [nvarchar](MAX) NULL,
	[CurrencyID] [int] NULL,
	[PhoneNumber] [nvarchar](MAX) NULL,
	[FaxNumber] [nvarchar](MAX) NULL,
	[CustomText1] [nvarchar](MAX) NULL,
	[CustomText2] [nvarchar](MAX) NULL,
	[CustomText3] [nvarchar](MAX) NULL,
	[CustomText4] [nvarchar](MAX) NULL,
	[CustomText5] [nvarchar](MAX) NULL,
	[CustomNumber1] [float] NULL,
	[CustomNumber2] [float] NULL,
	[CustomNumber3] [float] NULL,
	[CustomNumber4] [float] NULL,
	[CustomNumber5] [float] NULL,
	[CustomDate1] [datetime] NULL,
	[CustomDate2] [datetime] NULL,
	[CustomDate3] [datetime] NULL,
	[CustomDate4] [datetime] NULL,
	[CustomDate5] [datetime] NULL,
	[Notes] [ntext] NULL,
	[Terms] [nvarchar](MAX) NULL,
	[NUSSkipUpdate] [bit] NULL,
	[NUSSkipPOUpdate] [bit] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[POS_Tax]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_Tax](
	[FixedAmount] [money] NULL,
	[HQID] [int] NULL,
	[ID] [int] NULL,
	[Description] [nvarchar](MAX) NULL,
	[Percentage] [real] NULL,
	[UsePartialDollar] [bit] NULL,
	[ItemMaximum] [money] NULL,
	[IncludePreviousTax] [bit] NULL,
	[Bracket00] [money] NULL,
	[Bracket01] [money] NULL,
	[Bracket02] [money] NULL,
	[Bracket03] [money] NULL,
	[Bracket04] [money] NULL,
	[Bracket05] [money] NULL,
	[Bracket06] [money] NULL,
	[Bracket07] [money] NULL,
	[Bracket08] [money] NULL,
	[Bracket09] [money] NULL,
	[Bracket10] [money] NULL,
	[Code] [nvarchar](MAX) NULL,
	[ItemMinimum] [money] NULL,
	[ApplyOverMinimum] [bit] NULL,
	[Bracket11] [money] NULL,
	[Bracket12] [money] NULL,
	[Bracket13] [money] NULL,
	[Bracket14] [money] NULL,
	[Bracket15] [money] NULL,
	[Bracket16] [money] NULL,
	[Bracket17] [money] NULL,
	[Bracket18] [money] NULL,
	[Bracket19] [money] NULL,
	[Bracket20] [money] NULL,
	[Bracket21] [money] NULL,
	[Bracket22] [money] NULL,
	[Bracket23] [money] NULL,
	[Bracket24] [money] NULL,
	[Bracket25] [money] NULL,
	[Bracket26] [money] NULL,
	[Bracket27] [money] NULL,
	[Bracket28] [money] NULL,
	[Bracket29] [money] NULL,
	[Bracket30] [money] NULL,
	[BracketValue01] [money] NULL,
	[BracketValue02] [money] NULL,
	[BracketValue03] [money] NULL,
	[BracketValue04] [money] NULL,
	[BracketValue05] [money] NULL,
	[BracketValue06] [money] NULL,
	[BracketValue07] [money] NULL,
	[BracketValue08] [money] NULL,
	[BracketValue09] [money] NULL,
	[BracketValue10] [money] NULL,
	[BracketValue11] [money] NULL,
	[BracketValue12] [money] NULL,
	[BracketValue13] [money] NULL,
	[BracketValue14] [money] NULL,
	[BracketValue15] [money] NULL,
	[BracketValue16] [money] NULL,
	[BracketValue17] [money] NULL,
	[BracketValue18] [money] NULL,
	[BracketValue19] [money] NULL,
	[BracketValue20] [money] NULL,
	[BracketValue21] [money] NULL,
	[BracketValue22] [money] NULL,
	[BracketValue23] [money] NULL,
	[BracketValue24] [money] NULL,
	[BracketValue25] [money] NULL,
	[BracketValue26] [money] NULL,
	[BracketValue27] [money] NULL,
	[BracketValue28] [money] NULL,
	[BracketValue29] [money] NULL,
	[BracketValue30] [money] NULL,
	[NUSSkipUpdate] [bit] NULL,
	[NUSSkipPOUpdate] [bit] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[POS_TaxEntry]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_TaxEntry](
	[ID] [int] NULL,
	[TaxID] [int] NULL,
	[TransactionNumber] [int] NULL,
	[Tax] [money] NULL,
	[TaxableAmount] [money] NULL,
	[TransactionEntryID] [int] NULL,
	[NUSSkipUpdate] [bit] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[POS_Tender]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_Tender](
	[HQID] [int] NULL,
	[PreventOverTendering] [bit] NULL,
	[VerificationType] [int] NULL,
	[VerifyViaEDC] [bit] NULL,
	[ID] [int] NULL,
	[Description] [nvarchar](MAX) NULL,
	[AdditionalDetailType] [smallint] NULL,
	[PrinterValidation] [bit] NULL,
	[ValidationLine1] [nvarchar](MAX) NULL,
	[ValidationLine2] [nvarchar](MAX) NULL,
	[ValidationLine3] [nvarchar](MAX) NULL,
	[GLAccount] [nvarchar](MAX) NULL,
	[ScanCode] [smallint] NULL,
	[RoundToValue] [money] NULL,
	[Code] [nvarchar](MAX) NULL,
	[MaximumAmount] [money] NULL,
	[DoNotPopCashDrawer] [bit] NULL,
	[CurrencyID] [int] NULL,
	[DisplayOrder] [int] NULL,
	[ValidationMask] [nvarchar](MAX) NULL,
	[SignatureRequired] [bit] NULL,
	[AllowMultipleEntries] [bit] NULL,
	[DebitSurcharge] [money] NULL,
	[SupportCashBack] [bit] NULL,
	[CashBackLimit] [money] NULL,
	[CashBackFee] [money] NULL,
	[NUSSkipUpdate] [bit] NULL,
	[NUSSkipPOUpdate] [bit] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[POS_TenderEntry]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_TenderEntry](
	[BatchNumber] [int] NULL,
	[CreditCardExpiration] [nvarchar](MAX) NULL,
	[OrderHistoryID] [int] NULL,
	[DropPayoutID] [int] NULL,
	[ID] [int] NULL,
	[TransactionNumber] [int] NULL,
	[TenderID] [int] NULL,
	[PaymentID] [int] NULL,
	[Description] [nvarchar](MAX) NULL,
	[CreditCardNumber] [nvarchar](MAX) NULL,
	[CreditCardApprovalCode] [nvarchar](MAX) NULL,
	[Amount] [money] NULL,
	[AccountHolder] [nvarchar](MAX) NULL,
	[RoundingError] [money] NULL,
	[AmountForeign] [money] NULL,
	[BankNumber] [nvarchar](MAX) NULL,
	[SerialNumber] [nvarchar](MAX) NULL,
	[State] [nvarchar](MAX) NULL,
	[License] [nvarchar](MAX) NULL,
	[BirthDate] [datetime] NULL,
	[TransitNumber] [nvarchar](MAX) NULL,
	[VisaNetAuthorizationID] [int] NULL,
	[DebitSurcharge] [money] NULL,
	[CashBackSurcharge] [money] NULL,
	[NUSSkipUpdate] [bit] NULL,
	[NUSSkipPOUpdate] [bit] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[POS_Transaction]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_Transaction](
	[ShipToID] [int] NULL,
	[TransactionNumber] [int] NULL,
	[BatchNumber] [int] NULL,
	[Time] [datetime] NULL,
	[CustomerID] [int] NULL,
	[CashierID] [int] NULL,
	[Total] [money] NULL,
	[SalesTax] [money] NULL,
	[Comment] [nvarchar](MAX) NULL,
	[ReferenceNumber] [nvarchar](MAX) NULL,
	[Status] [int] NULL,
	[ExchangeID] [int] NULL,
	[ChannelType] [int] NULL,
	[RecallID] [int] NULL,
	[RecallType] [int] NULL,
	[NUSSkipUpdate] [bit] NULL,
	[NUSSkipPOUpdate] [bit] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[POS_TransactionEntry]    Script Date: 11/11/2017 7:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_TransactionEntry](
	[Commission] [money] NULL,
	[Cost] [money] NULL,
	[FullPrice] [money] NULL,
	[ID] [int] NULL,
	[TransactionNumber] [int] NULL,
	[ItemID] [int] NULL,
	[Price] [money] NULL,
	[PriceSource] [smallint] NULL,
	[Quantity] [float] NULL,
	[SalesRepID] [int] NULL,
	[Taxable] [bit] NULL,
	[DetailID] [int] NULL,
	[Comment] [nvarchar](MAX) NULL,
	[DiscountReasonCodeID] [int] NULL,
	[ReturnReasonCodeID] [int] NULL,
	[TaxChangeReasonCodeID] [int] NULL,
	[SalesTax] [money] NULL,
	[QuantityDiscountID] [int] NULL,
	[NUSSkipUpdate] [bit] NULL,
	[NUSSkipPOUpdate] [bit] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[OFFICE_doGroup](
	[ID] [bigint]  NULL,
	[Created] [datetime]  NULL,
	[Modified] [datetime]  NULL,
	[AggregateSource] [int]  NULL,
	[Guid] [uniqueidentifier]  NULL,
	[IsDefault] [int]  NULL,
	[Description] [nvarchar](MAX)  NULL,
	[GroupType] [nvarchar](MAX)  NULL,
	[Name] [nvarchar](MAX)  NULL,
	[StoreID] [int] NULL
)

GO
CREATE TABLE [dbo].[LOTS_Barcode]
(
	[BarcodeID] [int]  NULL,
	[StockID] [int]  NULL,
	[Barcode] [nvarchar](1000) NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]
