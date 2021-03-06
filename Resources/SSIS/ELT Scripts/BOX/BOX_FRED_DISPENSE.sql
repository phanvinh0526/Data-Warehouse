USE [BOX_FRED_DISPENSE]
GO
/****** Object:  Table [dbo].[claim]    Script Date: 9/16/2017 7:01:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[claim](
	[claimkey] [decimal](10, 0) NULL,
	[claimper] [decimal](4, 0) NULL,
	[claimpart] [decimal](2, 0) NULL,
	[claimdate] [datetime] NULL,
	[claimcat] [varchar](1) NULL,
	[claimno] [decimal](5, 0) NULL,
	[clformcat] [decimal](1, 0) NULL,
	[clpaycat] [decimal](1, 0) NULL,
	[claimentno] [varchar](11) NULL,
	[claimrxno] [decimal](8, 0) NULL,
	[claimamt] [decimal](7, 2) NULL,
	[clstatus] [varchar](1) NULL,
	[clmedicare] [varchar](11) NULL,
	[clmcfname] [varchar](12) NULL,
	[clmcsname] [varchar](24) NULL,
	[clpbsref] [varchar](12) NULL,
	[clpbsprob] [varchar](59) NULL,
	[clpbsaccep] [varchar](1) NULL,
	[clpbsack] [varchar](1) NULL,
	[clpbsresub] [varchar](1) NULL,
	[clpbspaydt] [datetime] NULL,
	[clpbsamt] [decimal](7, 2) NULL,
	[clpbsadj] [decimal](8, 2) NULL,
	[clpbsproc] [varchar](2) NULL,
	[clpbsproch] [varchar](2) NULL,
	[cclaimref] [decimal](4, 0) NULL,
	[pbspayment] [varchar](12) NULL,
	[clpbspaid] [bit] NOT NULL,
	[oincentamt] [decimal](7, 2) NULL,
	[dincentamt] [decimal](7, 2) NULL,
	[eincentamt] [decimal](7, 2) NULL,
	[pesid] [varchar](3) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[claimstat]    Script Date: 9/16/2017 7:01:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[claimstat](
	[clsperiod] [decimal](4, 0) NULL,
	[clsstatus] [varchar](2) NULL,
	[clsstdate] [datetime] NULL,
	[clsendate] [datetime] NULL,
	[clsclosed] [datetime] NULL,
	[clstype] [varchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dprofile]    Script Date: 9/16/2017 7:01:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dprofile](
	[profcode] [decimal](4, 0) NULL,
	[profdesc] [varchar](30) NULL,
	[profdet] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[drug]    Script Date: 9/16/2017 7:01:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[drug](
	[dcode] [varchar](6) NULL,
	[dname] [varchar](30) NULL,
	[dformabb] [varchar](10) NULL,
	[dstrength] [varchar](20) NULL,
	[dglcode] [varchar](6) NULL,
	[dgenname] [varchar](30) NULL,
	[dusegennhs] [bit] NOT NULL,
	[dnhsdiff] [varchar](1) NULL,
	[dmonograph] [decimal](4, 0) NULL,
	[dprofileno] [decimal](4, 0) NULL,
	[dwarnlbls] [varchar](30) NULL,
	[dstatus] [varchar](1) NULL,
	[dextemp] [varchar](1) NULL,
	[dschedule] [varchar](2) NULL,
	[dintgroup] [decimal](4, 0) NULL,
	[dstkgroup] [decimal](3, 0) NULL,
	[dmanfcode] [varchar](2) NULL,
	[dapncode1] [varchar](13) NULL,
	[ddeldate] [varchar](4) NULL,
	[ddispfcat] [decimal](1, 0) NULL,
	[dmarkupcat] [decimal](1, 0) NULL,
	[dranking] [decimal](1, 0) NULL,
	[ddiscrate] [decimal](4, 2) NULL,
	[dpacksize] [decimal](5, 0) NULL,
	[dscode] [varchar](3) NULL,
	[dpdenumber] [varchar](6) NULL,
	[dwsprice] [decimal](9, 4) NULL,
	[dotcprice] [decimal](6, 2) NULL,
	[dprivprice] [decimal](6, 2) NULL,
	[ds3rprice] [decimal](6, 2) NULL,
	[dlblsize] [varchar](1) NULL,
	[dgensubst] [varchar](1) NULL,
	[dnotes] [varchar](max) NULL,
	[dusercode] [varchar](6) NULL,
	[dsrchstgth] [varchar](7) NULL,
	[dscode2] [varchar](3) NULL,
	[dpdeno2] [varchar](6) NULL,
	[dausregno] [varchar](5) NULL,
	[dppguideid] [varchar](10) NULL,
	[dhbfno] [varchar](5) NULL,
	[dintgroup2] [decimal](4, 0) NULL,
	[dourwsale] [bit] NOT NULL,
	[downwarns] [varchar](10) NULL,
	[dgstinc] [varchar](1) NULL,
	[dcontsupp] [varchar](3) NULL,
	[dcontprc] [decimal](7, 2) NULL,
	[dformulary] [varchar](3) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[drugu]    Script Date: 9/16/2017 7:01:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[drugu](
	[dcode] [varchar](6) NULL,
	[dname] [varchar](30) NULL,
	[dformabb] [varchar](10) NULL,
	[dstrength] [varchar](20) NULL,
	[dglcode] [varchar](6) NULL,
	[dgenname] [varchar](30) NULL,
	[dusegennhs] [bit] NOT NULL,
	[dnhsdiff] [varchar](1) NULL,
	[dmonograph] [decimal](4, 0) NULL,
	[dprofileno] [decimal](4, 0) NULL,
	[dwarnlbls] [varchar](30) NULL,
	[dstatus] [varchar](1) NULL,
	[dextemp] [varchar](1) NULL,
	[dschedule] [varchar](2) NULL,
	[dintgroup] [decimal](4, 0) NULL,
	[dstkgroup] [decimal](3, 0) NULL,
	[dmanfcode] [varchar](2) NULL,
	[dapncode1] [varchar](13) NULL,
	[ddeldate] [varchar](4) NULL,
	[ddispfcat] [decimal](1, 0) NULL,
	[dmarkupcat] [decimal](1, 0) NULL,
	[dranking] [decimal](1, 0) NULL,
	[ddiscrate] [decimal](4, 2) NULL,
	[dpacksize] [decimal](5, 0) NULL,
	[dscode] [varchar](3) NULL,
	[dpdenumber] [varchar](6) NULL,
	[dwsprice] [decimal](9, 4) NULL,
	[dotcprice] [decimal](6, 2) NULL,
	[dprivprice] [decimal](6, 2) NULL,
	[ds3rprice] [decimal](6, 2) NULL,
	[dlblsize] [varchar](1) NULL,
	[dgensubst] [varchar](1) NULL,
	[dnotes] [varchar](10) NULL,
	[dusercode] [varchar](6) NULL,
	[dsrchstgth] [varchar](7) NULL,
	[dscode2] [varchar](3) NULL,
	[dpdeno2] [varchar](6) NULL,
	[dausregno] [varchar](5) NULL,
	[dppguideid] [varchar](10) NULL,
	[dhbfno] [varchar](5) NULL,
	[dintgroup2] [decimal](4, 0) NULL,
	[dourwsale] [bit] NOT NULL,
	[downwarns] [varchar](10) NULL,
	[dgstinc] [varchar](1) NULL,
	[dcontsupp] [varchar](3) NULL,
	[dcontprc] [decimal](7, 2) NULL,
	[dformulary] [varchar](3) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[hbfdrugs]    Script Date: 9/16/2017 7:01:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hbfdrugs](
	[hbfcode] [varchar](5) NULL,
	[hdcode] [varchar](6) NULL,
	[hddesc] [varchar](42) NULL,
	[hwscost] [decimal](7, 2) NULL,
	[hmaxbftamt] [decimal](7, 2) NULL,
	[hreferhbf] [bit] NOT NULL,
	[hwlossprc] [bit] NOT NULL,
	[hwlossdrg] [bit] NOT NULL,
	[h50maxbnft] [bit] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[manufact]    Script Date: 9/16/2017 7:01:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[manufact](
	[mfcode] [varchar](2) NULL,
	[mfdesc] [varchar](25) NULL,
	[mfphone] [varchar](14) NULL,
	[mffax] [varchar](14) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[patient]    Script Date: 9/16/2017 7:01:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[patient](
	[pnumber] [decimal](6, 0) NULL,
	[psurname] [varchar](16) NULL,
	[pfirstname] [varchar](16) NULL,
	[ptitle] [varchar](6) NULL,
	[paddress] [varchar](22) NULL,
	[psuburb] [varchar](18) NULL,
	[ppostcode] [decimal](4, 0) NULL,
	[pfamcode] [decimal](4, 0) NULL,
	[psex] [varchar](1) NULL,
	[pphoneno] [varchar](12) NULL,
	[pemail] [varchar](44) NULL,
	[pstatus] [varchar](1) NULL,
	[ptype] [varchar](1) NULL,
	[pconctype] [varchar](1) NULL,
	[pconcno] [varchar](11) NULL,
	[pconcvdate] [datetime] NULL,
	[prepatno] [varchar](10) NULL,
	[prepatcol] [varchar](1) NULL,
	[psafentno] [varchar](11) NULL,
	[pbirthdate] [datetime] NULL,
	[pmedicare] [varchar](11) NULL,
	[pmedicdate] [datetime] NULL,
	[pallergy] [varchar](25) NULL,
	[pdebtor_p] [bit] NOT NULL,
	[pdebtcode] [decimal](6, 0) NULL,
	[pdiscount] [decimal](4, 1) NULL,
	[pdocbag] [bit] NOT NULL,
	[pnursecode] [varchar](4) NULL,
	[proomno] [varchar](4) NULL,
	[pbedno] [varchar](2) NULL,
	[purnumber] [decimal](8, 0) NULL,
	[pwardno] [varchar](4) NULL,
	[padmission] [decimal](8, 0) NULL,
	[paccttype] [varchar](1) NULL,
	[pmailcat] [varchar](4) NULL,
	[phfundid] [varchar](4) NULL,
	[phftable] [varchar](6) NULL,
	[phfundmno] [decimal](9, 0) NULL,
	[pinsvdate] [datetime] NULL,
	[powescript] [varchar](1) NULL,
	[prptonfile] [varchar](1) NULL,
	[pgenonly] [varchar](1) NULL,
	[pautorecpt] [varchar](1) NULL,
	[papplygst] [varchar](1) NULL,
	[pprvfeemup] [varchar](3) NULL,
	[pmcconsent] [varchar](1) NULL,
	[pfamilyind] [varchar](1) NULL,
	[prxcnt] [decimal](3, 0) NULL,
	[psafeamt] [decimal](7, 2) NULL,
	[poutrxcnt] [decimal](3, 0) NULL,
	[poutsnamt] [decimal](7, 2) NULL,
	[pnotes] [varchar](max) NULL,
	[pchartdt] [datetime] NULL,
	[pchartdur] [decimal](6, 2) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[script]    Script Date: 9/16/2017 7:01:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[script](
	[srxno] [decimal](8, 0) NULL,
	[srptno] [varchar](6) NULL,
	[srptrxno] [decimal](8, 0) NULL,
	[sdispdate] [datetime] NULL,
	[spatno] [decimal](6, 0) NULL,
	[srxdate] [datetime] NULL,
	[stype] [varchar](4) NULL,
	[sdoccode] [varchar](4) NULL,
	[sdocpresno] [decimal](7, 0) NULL,
	[sdocname] [varchar](20) NULL,
	[sdrugcode] [varchar](6) NULL,
	[sgencode] [varchar](6) NULL,
	[sldrugord] [varchar](1) NULL,
	[sdrugdesc] [varchar](42) NULL,
	[saltdesc] [varchar](30) NULL,
	[sdintgrp] [decimal](3, 0) NULL,
	[snhscode] [varchar](5) NULL,
	[smanufcode] [varchar](2) NULL,
	[sqty] [decimal](4, 0) NULL,
	[smaxdisp] [decimal](2, 0) NULL,
	[sdispno] [decimal](2, 0) NULL,
	[sauthno] [decimal](8, 0) NULL,
	[sauthority] [bit] NOT NULL,
	[ssigs] [varchar](max) NULL,
	[spharminit] [varchar](2) NULL,
	[sorigrxno] [varchar](10) NULL,
	[sorigpharm] [varchar](6) NULL,
	[sclass] [varchar](1) NULL,
	[sstatus] [varchar](1) NULL,
	[soutsidrpt] [varchar](1) NULL,
	[snarcotic] [bit] NOT NULL,
	[sdeferred] [bit] NOT NULL,
	[sgstinc] [varchar](1) NULL,
	[spostfrqty] [decimal](4, 0) NULL,
	[spatprice] [decimal](7, 2) NULL,
	[ssnamt] [decimal](5, 2) NULL,
	[swscost] [decimal](7, 2) NULL,
	[sgovrecamt] [decimal](7, 2) NULL,
	[swardno] [varchar](4) NULL,
	[shosporpat] [varchar](1) NULL,
	[sfreeind1] [varchar](1) NULL,
	[sfreeind2] [varchar](8) NULL,
	[sfreeind3] [varchar](2) NULL,
	[sfreeind4] [varchar](2) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
