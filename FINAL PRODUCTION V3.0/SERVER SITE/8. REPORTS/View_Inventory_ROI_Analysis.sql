/*
	
	Create View_Inventory_ROI_Analysis
	Notes:
		+	join tables : [NDS.DW].AG_Wages_Rent, ResultStockValuation_Ext, View_Itemies_Transaction_Detail
*/
use ADVANCED_ANALYSIS
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('p_Inventory_ROI_Analysis') AND type in (N'P', N'PC'))
BEGIN
	EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[p_Inventory_ROI_Analysis] AS'
END
GO
ALTER PROCEDURE [dbo].[p_Inventory_ROI_Analysis]
	/* Paramaters here */
AS
BEGIN
	SET NOCOUNT ON; -- VERY IMPORTANT to solve Tableau Error (No Result Sets)
	
	/*	create temporary tables */
	IF OBJECT_ID('#Tmp_SaleProfit_OTC_Monthly') IS NOT NULL 
		DROP TABLE #Tmp_SaleProfit_OTC_Monthly  
    CREATE TABLE #Tmp_SaleProfit_OTC_Monthly(
		StoreKey int NOT NULL,
		TransDate_Year int NOT NULL,        
		TransDate_Month int NOT NULL,
		OTCProfit decimal(28, 10),
		OTCSaleEx decimal(28, 10)
	)
	
	IF OBJECT_ID('#Tmp_SaleProfit_script_Monthly') IS NOT NULL 
		DROP TABLE #Tmp_SaleProfit_script_Monthly  
    CREATE TABLE #Tmp_SaleProfit_script_Monthly(
		StoreKey int NOT NULL,
		TransDate_Year int NOT NULL,        
		TransDate_Month int NOT NULL,
		ScriptProfit decimal(28, 10),
		ScriptSaleEx decimal(28, 10)
	)
		
	IF OBJECT_ID('#Tmp_TotalCost_Monthly') IS NOT NULL 
		DROP TABLE #Tmp_TotalCost_Monthly  
    CREATE TABLE #Tmp_TotalCost_Monthly(
		StoreKey int NOT NULL,
		AuditYear int NOT NULL,        
		AuditMonth int NOT NULL,
		TotalCost decimal(28, 10)
	)
	
	IF OBJECT_ID('#Tmp_Wages_Rent') IS NOT NULL 
		DROP TABLE #Tmp_Wages_Rent  
    CREATE TABLE #Tmp_Wages_Rent(
		StoreKey int NOT NULL,
		DateYear int NOT NULL,        
		DateMonth int NOT NULL,
		Wages decimal(28, 10),
		Rent decimal(28, 10)
	)

	IF OBJECT_ID('#Tmp_Summary') IS NOT NULL 
		DROP TABLE #Tmp_Summary  
    CREATE TABLE #Tmp_Summary(
		StoreKey int NOT NULL,
		DateYear int NOT NULL,        
		DateMonth int NOT NULL,
		FullDate date NOT NULL,
		MonthlyOTCProfit decimal(28, 10) NOT NULL,
		MonthlyOTCSaleEx decimal(28, 10) NOT NULL,
		MonthlyScriptProfit decimal(28, 10) NOT NULL,
		MonthlyScriptSaleEx decimal(28, 10) NOT NULL,
		MonthlyTotalCost decimal(28, 10) NOT NULL,
		MonthlyWages decimal(28, 10) NOT NULL,
		MonthlyRent decimal(28, 10) NOT NULL,
		StoreName varchar(50) NOT NULL
	)


	/*	execute queries to fill in data to tmp tables */
	
	-- New update 07.05.2018
	PRINT 'step 1'
	INSERT INTO [#Tmp_SaleProfit_OTC_Monthly]
	SELECT sv.StoreKey, sv.TransDate_Year, sv.TransDate_Month, SUM(sv.Profit), SUM(sv.Sales_Ex)
	FROM Sale_DDS_DW.dbo.View_Itemies_Transaction_Detail sv
	WHERE sv.IsScript like 'OTC' AND sv.StoreKey is not null AND sv.TransDate_Year is not null AND sv.TransDate_Month is not null
	GROUP BY sv.StoreKey, sv.TransDate_Year, sv.TransDate_Month

	-- New update 07.05.2018
	PRINT 'step 2'
	INSERT INTO [#Tmp_SaleProfit_script_Monthly]
	SELECT sv.StoreKey, sv.TransDate_Year, sv.TransDate_Month, SUM(sv.Profit), SUM(sv.Sales_Ex)
	FROM Sale_DDS_DW.dbo.View_Itemies_Transaction_Detail sv
	WHERE sv.IsScript like 'Script' AND sv.StoreKey is not null AND sv.TransDate_Year is not null AND sv.TransDate_Month is not null
	GROUP BY sv.StoreKey, sv.TransDate_Year, sv.TransDate_Month
	
	-- New update 07.05.2018
	PRINT 'step 3'
	INSERT INTO [#Tmp_TotalCost_Monthly]
	SELECT sv.StoreKey, sv.AuditYear, sv.AuditMonth, SUM(sv.TotalCost) as TotalCost
	FROM ADVANCED_ANALYSIS.dbo.SVH_ResultStockValuation_Ext sv
	GROUP BY sv.StoreKey, sv.AuditYear, sv.AuditMonth

	-- New update 07.05.2018
	PRINT 'step 4'
	INSERT INTO [#Tmp_Wages_Rent]
	SELECT wr.StoreKey, wr.DateYear, wr.DateMonth, SUM(wr.Wages) as Wages, SUM(wr.Rent) as Rent
	FROM NDS_DW.dbo.AG_Wages_Rent wr
	GROUP BY wr.StoreKey, wr.DateMonth, wr.DateYear

	-- join tables: summary table
	PRINT 'step 5'
	INSERT INTO #Tmp_Summary
	SELECT 
		sp.StoreKey as StoreKey,
		sp.TransDate_Year as DateYear,
		sp.TransDate_Month as DateMonth,
		cast((cast(sp.TransDate_Year as varchar(10)) +'/'+cast(sp.TransDate_Month as varchar(10))+'/'+cast(1 as varchar(10))) as date) as FullDate,
		CASE WHEN sp.ScriptProfit is null THEN 0 ELSE sp.ScriptProfit END as MonthlyScriptProfit,
		CASE WHEN sp.ScriptSaleEx is null THEN 0 ELSE sp.ScriptSaleEx END as MonthlyScriptSaleEx,
		CASE WHEN otc.OTCProfit is null THEN 0 ELSE otc.OTCProfit END as MonthlyOTCProfit,
		CASE WHEN otc.OTCSaleEx is null THEN 0 ELSE otc.OTCSaleEx END as MonthlyOTCSaleEx,
		CASE WHEN tc.TotalCost is null THEN 0 ELSE tc.TotalCost END as MonthlyTotalCost,
		CASE WHEN wr.Wages is null THEN 0 ELSE wr.Wages END as MonthlyWages,
		CASE WHEN wr.Rent is null THEN 0 ELSE wr.Rent END as MonthlyRent,
		s.StoreName as StoreName
	FROM [#Tmp_SaleProfit_script_Monthly] sp
		LEFT JOIN [#Tmp_SaleProfit_OTC_Monthly] otc ON (sp.StoreKey=otc.StoreKey and sp.TransDate_Year=otc.TransDate_Year and sp.TransDate_Month=otc.TransDate_Month)
		LEFT JOIN [#Tmp_TotalCost_Monthly] tc ON (sp.StoreKey=tc.StoreKey and sp.TransDate_Year=tc.AuditYear and sp.TransDate_Month=tc.AuditMonth)
		LEFT JOIN [#Tmp_Wages_Rent] wr ON (sp.StoreKey=wr.StoreKey and sp.TransDate_Year=wr.DateYear and sp.TransDate_Month=wr.DateMonth)
		LEFT JOIN [NDS_DW].dbo.Store s ON (s.StoreKey=sp.StoreKey)
	WHERE
		sp.StoreKey is not null AND sp.TransDate_Year is not null AND sp.TransDate_Month is not null

	/*	Return results */
	SELECT * FROM #Tmp_Summary

END;

-- EXEC p_Inventory_ROI_Analysis

/*
select top 1 * from NDS_DW.dbo.AG_Wages_Rent
go
select top 1 * from ADVANCED_ANALYSIS.dbo.SVH_ResultStockValuation_Ext
go
select top 1 * from Sale_DDS_DW.dbo.View_Itemies_Transaction_Detail

*/

