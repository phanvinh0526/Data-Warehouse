/*	Checking items in FredOffice, FredConnect across Pharmcies (TWKnox, Brimbank, RisdonVale) 

	Results:
		AppCatHQID is unique across databases in 3 stores
		doItem.ID = doItemBase.ID (mapping 1-1)
*/

/* ------------------------------------------------------ */
/*
	When i check Ventolin, with ID=4236 and AppCatHQID=20862 for RV Pharmacy
	The doItem and doItemBase have the same ID which is the foreign key with relationship (1-1)

	In doItem, there is a AppCatHQID=20862 which is used to link between FredOffice & FredConnect as primary key for that product
*/
use [SOURCE_RV_FredOffice]
go
select * from doItem where  AppCatHQID=20862
go
select QuantityOnHand, Code, DefaultSupplier, Department, ItemClassification, [Description], * from dbo.doItemBase where ID=4236 and  [Description] like '%ventolin%'
go
use [SOURCE_RV_FredConnect]
go
select * from AppCat_Item where HQID=20862


/* ------------------------------------------------------ */
/*
	Now, i do another test for that product across the pharmacies
	In this hypothesis, i used RV database & TW database for demonstration

	Results:
		With AppCatHQID = 20862, in TW pharmacy i got "VENTOLIN CFC FR MET AERO 100MCG/D 200D" which is the same in RV ("VENTOLIN INH 200 CFC FREE") / different name, but same item

*/
use [SOURCE_TWK_FredOffice]
go
select * from doItem where  AppCatHQID=20862
go
select QuantityOnHand, Code, DefaultSupplier, Department, ItemClassification, [Description], * from dbo.doItemBase where ID=228129 and [Description] like '%ventolin%'
go
use [SOURCE_TW_FredConnect]
go
select * from AppCat_Item where HQID=20862

/* ------------------------------------------------------ */
/*
	Checking Brimbank database, with AppCatHQID=20862 which is Ventolin 200ml Spray
	It comes up "VENTOLIN CFC FR MET AERO 100MCG/D 200D", with doItemBase.ID = 33190
	
	It is matched with what we have in TW and RV
*/
use [FredOffice]
go
select * from doItem where  AppCatHQID=20862
go
select QuantityOnHand, Code, DefaultSupplier, Department, ItemClassification, [Description], * from dbo.doItemBase where ID=33190 and [Description] like '%ventolin%'
go
use [FredOfficeConnectors]
go
select * from AppCat_Item where HQID=20862






