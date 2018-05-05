USE DDS_Stock_Valuation_History
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[p_Stock_Valuation_History_New]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[p_Stock_Valuation_History_New] AS'
END
GO
ALTER PROCEDURE [dbo].[p_Stock_Valuation_History_New]
	@StoreKey int = 1, -- "store id number" | default number 9 is Brimbank pharmacy
	@DataSource nvarchar(100) = 'fred', -- "lots" or "fred"
	@StockValueAt datetime = '2017-11-01' -- CAUTION: "yyyy-mm-dd"
AS
BEGIN
-- Global variables
	--DECLARE @sqlStatement nvarchar(4000)
	 SET NOCOUNT ON; -- VERY IMPORTANT to solve Tableau Error (No Result Sets)

-- Validation
	IF(@DataSource != 'lots' and @DataSource != 'fred')
	BEGIN
		-- Input error
		RETURN 'Error input: DataSource is not correct (lots, fred)';
	END
	IF(ISDATE(@StockValueAt) != 1)
	BEGIN
		-- Input error
		RETURN 'Error input: StockValueAt, not Datetime type';
	END
	IF NOT EXISTS(SELECT 1 FROM DimStore WHERE StoreKey = @StoreKey)
	BEGIN
		-- Input error
		RETURN 'Error input: StoreKey is not available, check DimStore';
	END

-- Drop Temporary Tables

-- Create all temporary tables
	/*
	BEGIN TRY
		CREATE TABLE #Temp_Cost_Before(
			AuditID bigint)
		DROP TABLE #Temp_Cost_Before
	END TRY  
	BEGIN CATCH  
		-- Execute error retrieval routine.  
		PRINT 'Not Available: #Temp_Cost_Before BEGIN'
	END CATCH;
	*/
	IF EXISTS(SELECT TOP(1) 1 FROM tempdb.sys.tables 
		WHERE object_id = OBJECT_ID(N'tempdb..#Temp_Cost_Before'))
	BEGIN
		DROP TABLE #Temp_Cost_Before
	END

	CREATE TABLE #Temp_Cost_Before(
	[AuditID] [bigint] NOT NULL,
	[ProductKey] [bigint] NOT NULL,
	[StoreKey] [int] NOT NULL)

	ALTER TABLE #Temp_Cost_Before
	ADD PRIMARY KEY CLUSTERED([AuditID] ASC, [StoreKey])

	IF OBJECT_ID('#Temp_Cost_After') IS NOT NULL 
		DROP TABLE #Temp_Cost_After  
    CREATE TABLE #Temp_Cost_After(
    [AuditID] [bigint] NOT NULL,
	[ProductKey] [bigint] NOT NULL,        
	[StoreKey] [int] NOT NULL,
    CONSTRAINT [PK_Temp_Cost_After] PRIMARY KEY CLUSTERED([AuditID] ASC, [StoreKey])) 
    
	IF OBJECT_ID('#TempCost') IS NOT NULL 
		DROP TABLE #TempCost
    CREATE TABLE #TempCost(
    [ItemUsed] [bigint] NOT NULL,
    [Cost] decimal(9, 2) NOT NULL,
    [DummyDate] [datetime] NOT NULL,
    CONSTRAINT [PK_TempCost] PRIMARY KEY CLUSTERED([ItemUsed] ASC))               
      
    IF OBJECT_ID('#Temp_Qty_Before') IS NOT NULL 
		DROP TABLE #Temp_Qty_Before
    CREATE TABLE #Temp_Qty_Before(
	[MovementKey] [bigint] NOT NULL,
    [ItemUsed] [bigint] NOT NULL,
    CONSTRAINT [PK_Temp_Qty_Before] PRIMARY KEY CLUSTERED([MovementKey] ASC)) 
     
	IF OBJECT_ID('#Temp_Qty_After') IS NOT NULL 
		DROP TABLE #Temp_Qty_After
    CREATE TABLE #Temp_Qty_After(
	[MovementKey] [bigint] NOT NULL,
    [ItemUsed] [bigint] NOT NULL,
    CONSTRAINT [PK_Temp_Qty_After] PRIMARY KEY CLUSTERED([MovementKey] ASC)) 
      
    IF OBJECT_ID('#TempQuantity') IS NOT NULL 
		DROP TABLE #TempQuantity
    CREATE TABLE #TempQuantity(
    [ItemUsed] [bigint] NOT NULL,
    [Quantity] [float] NOT NULL,
    CONSTRAINT [PK_TempQuantity] PRIMARY KEY CLUSTERED([ItemUsed] ASC))     
      
    IF OBJECT_ID('#TempSummary') IS NOT NULL 
		DROP TABLE #TempSummary
    CREATE TABLE #TempSummary(
    [ProductKey] [bigint] NOT NULL,
    [ProductCode] [nvarchar](50) NOT NULL,
    [ProductName] [nvarchar](50) NOT NULL,
    [Department] [nvarchar](50) NOT NULL,
    [Category] [nvarchar](50) NOT NULL,       
    --[PrimarySupplier] [nvarchar](50),
    --[ReorderNumber] [nvarchar](4000),
    --[ItemClass] [nvarchar](50),
    [Cost] decimal(9, 2) NOT NULL,
    [QuantityOnHand] [float] NOT NULL,
    [TotalCost] decimal(9, 2) NOT NULL,
    CONSTRAINT [PK_TempID] PRIMARY KEY CLUSTERED([ProductKey] ASC)) 

/*
	Business Flow:
		There are 3 case studies
		1.	The items in prior data, which means It exists in audit table before the StockValueDate
		2.	The items in new data only, which means the item is added after the StockValueDate
		3.	The items are never exist in Audit table (very new products)
	The procedure covers all 3 cases, so that It can guarantee all items listed out

*/

/***************
	Fred Office
***************/
	IF(@DataSource = 'fred')
	BEGIN
	-- Calculating Costs from Audit History and ItemBase tables
	-- Case study number 1
		-- Get lastest AUdit ID for all items before the selected date
		PRINT 'here 0';
		INSERT INTO [#Temp_Cost_Before]
		SELECT MAX([BusinessAuditHistoryID]) as AuditID, ProductKey, @StoreKey
		FROM [FactBusinessAuditHistory] with (nolock)
		WHERE ObjectType = 'Item' AND Field = 'Cost' AND AuditDate <= @StockValueAt AND StoreKey = @StoreKey
		GROUP BY ProductKey

		-- Get Cost from 'ToValue' from above Audit Ids
		PRINT 'here 1';
		INSERT INTO [#TempCost]
		SELECT [#Temp_Cost_Before].ProductKey as ItemUsed, 
			CONVERT(Decimal(9,2), ToValue) as Cost,
			@StockValueAt as DummyDate
		FROM [FactBusinessAuditHistory] with (nolock)
		INNER JOIN [#Temp_Cost_Before] ON [#Temp_Cost_Before].AuditID = [BusinessAuditHistoryID] and [#Temp_Cost_Before].StoreKey = [FactBusinessAuditHistory].StoreKey

	-- Case study number 2
		PRINT 'here 2';
		-- For the items which are not found above get the First Audit ID after selected date for the rest of the items
		INSERT INTO [#Temp_Cost_After]
		SELECT MIN([BusinessAuditHistoryID]) as AuditID, ProductKey, @StoreKey
		FROM [FactBusinessAuditHistory] with (nolock)
		WHERE ObjectType = 'Item' AND Field = 'Cost' AND AuditDate > @StockValueAt AND StoreKey = @StoreKey
			AND NOT EXISTS (SELECT * FROM [#Temp_Cost_Before] WHERE [FactBusinessAuditHistory].ProductKey = [#Temp_Cost_Before].ProductKey)
		GROUP BY ProductKey

		-- Get cost from 'FromValue' for the Audit Ids found above
		PRINT 'here 3';
		INSERT INTO [#TempCost]
		SELECT [#Temp_Cost_After].ProductKey as ItemUsed,
			CONVERT(Decimal(9,2), FromValue) as Cost, 
			@StockValueAt as DummyDate
		FROM [FactBusinessAuditHistory] with (nolock)
		INNER JOIN [#Temp_Cost_After] on [#Temp_Cost_After].AuditID = [BusinessAuditHistoryID] and [#Temp_Cost_After].StoreKey = [FactBusinessAuditHistory].StoreKey

		-- If the items are never audited in the Audit Table get the current Cost from IemBase Table
		PRINT 'here 4';
		INSERT INTO [#TempCost]
		SELECT DimProduct.ProductKey as ItemUsed, 
			DimProduct.Cost as Cost, 
			@StockValueAt as DummyDate
		FROM DimProduct with (nolock)
		WHERE DimProduct.DateCreated <= @StockValueAt
			AND DimProduct.ProductKey NOT IN (SELECT ProductKey FROM [#Temp_Cost_Before] UNION SELECT ProductKey FROM [#Temp_Cost_After])


	-- Calculate QuantityOnHand at the time from doItemMovementHistory (FactStockMovement) and doItemBase (DimProduct)
		-- Get latest Movement ID for all items before the selected date
		INSERT INTO [#Temp_Qty_Before]
		SELECT MAX(StockMovementKey) as MovementKey, FactStockMovement.ProductKey as ItemUsed
		FROM FactStockMovement with (nolock)
		WHERE FactStockMovement.DateAdded <= @StockValueAt AND StoreKey = @StoreKey
		GROUP BY ProductKey

		-- Get stock on hand from 'AfterQuantity' from above Movement Ids
		PRINT 'here 10'
		INSERT INTO [#TempQuantity]
		SELECT [#Temp_Qty_Before].ItemUsed, AfterQuantity as Quantity
		FROM FactStockMovement with (nolock)
		INNER JOIN [#Temp_Qty_Before] on [#Temp_Qty_Before].MovementKey = StockMovementKey

		-- For the items which are not found above get the First movement ID after the selecteddate for the rest of the items
		PRINT 'here 11'
		INSERT INTO [#Temp_Qty_After]
		SELECT MIN(StockMovementKey) as MovementKey, ProductKey
		FROM FactStockMovement with (nolock)
		WHERE FactStockMovement.DateAdded > @StockValueAt AND StoreKey = @StoreKey
			AND NOT EXISTS (SELECT * FROM [#Temp_Qty_Before] WHERE [#Temp_Qty_Before].ItemUsed = FactStockMovement.ProductKey)
		GROUP BY ProductKey

		-- Get stock on hand from 'AfterQuantity' - AdjustmentQuantity' which makes before Quantity for the Movement Ids found above
		PRINT 'here 12'
		INSERT INTO [#TempQuantity]
		SELECT [#Temp_Qty_After].ItemUsed, (AfterQuantity - AdjustmentQuantity) as Quantity
		FROM FactStockMovement with (nolock)
		INNER JOIN [#Temp_Qty_After] on [#Temp_Qty_After].MovementKey = StockMovementKey

		-- If the items are never recoreded in Item Movement History Table get the current Stock on Hand from ItemBase table
		PRINT 'here 13'
		INSERT INTO [#TempQuantity]
		SELECT DimProduct.ProductKey as ItemUsed, DimProduct.SOH as Quantity
		FROM DimProduct with (nolock)
		WHERE DimProduct.DateCreated <= @StockValueAt and StoreKey = @StoreKey
			AND DimProduct.ProductKey NOT IN (SELECT ItemUsed FROM [#Temp_Qty_Before] UNION SELECT ItemUsed FROM [#Temp_Qty_After])



		-- Need to insert into a temp table to calculate the TotalCost
		PRINT 'here 14'
		INSERT INTO [#TempSummary]
		SELECT DISTINCT DimProduct.ProductKey,
			DimProduct.ProductCode,
			DimProduct.ProductName,
			ISNULL(DimProductDepartment.ProductDepartmentName, 'No Department') as Department,
			ISNULL(DimProductGroup.ProductGroupName, 'No Category') as Category,
			[#TempCost].Cost as Cost,
			[#TempQuantity].Quantity as QuantityOnHand,
			ROUND([#TempCost].Cost * [#TempQuantity].Quantity, 2) as TotalCost
		FROM DimProduct with (nolock)
			INNER JOIN [#TempCost] with (nolock) ON DimProduct.ProductKey = [#TempCost].ItemUsed
			INNER JOIN [#TempQuantity] with (nolock) ON DimProduct.ProductKey = [#TempQuantity].ItemUsed
			LEFT OUTER JOIN DimProductDepartment with (nolock) ON DimProduct.ProductDepartmentKey = DimProductDepartment.ProductDepartmentKey
			LEFT OUTER JOIN DimProductGroup with (nolock) ON DimProduct.ProductGroupKey = DimProductGroup.ProductGroupKey
		WHERE DimProduct.DateCreated <= @StockValueAt AND DimProduct.StoreKey = @StoreKey
			AND DimProduct.ItemType not in (5,20,21,22)
			AND #TempQuantity.Quantity > 0 -- Default: we will remove all items which have SOH <= 0

		-- Queries
		DECLARE @TotalSales as Decimal(28,10);
		DECLARE @Count as INT;
		SELECT @TotalSales = ISNULL(SUM(TotalCost), 0) FROM [#TempSummary];
		SELECT @Count = count(*) from [#TempSummary];

		--Gets All required results.
		IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' and TABLE_NAME='ResultStockValuation')
		BEGIN	
			DELETE FROM ResultStockValuation
			WHERE StoreKey = @StoreKey AND AuditYear = YEAR(@StockValueAt) AND AuditMonth = MONTH(@StockValueAt)
		END 
		INSERT INTO ResultStockValuation(Productkey, ProductCode, Productname, Department, 
						Category, Cost, QuantityOnHand, TotalCost, TotalLastCostPCT, StoreKey, AuditYear, AuditMonth)
		SELECT Productkey, ProductCode, Productname, Department
			, Category, Cost, QuantityOnHand, TotalCost
			, CASE WHEN @TotalSales = 0 THEN 0 ELSE [TotalCost]/@TotalSales END AS [TotalLastCostPCT]
			, @StoreKey as StoreKey, YEAR(@StockValueAt), MONTH(@StockValueAt)
		FROM [#TempSummary] TS

	END

/***************
	LOTS
***************/
	IF(@DataSource = 'lots')
	BEGIN
		RETURN 'Lots is not available'
	END

	--Drop all the temp tables
	IF OBJECT_ID('tempdb..#Temp_Cost_Before') IS NOT NULL 
	BEGIN
		DROP TABLE #Temp_Cost_Before;
	END
	IF OBJECT_ID('tempdb..#Temp_Cost_After') IS NOT NULL 
	BEGIN
		DROP TABLE #Temp_Cost_After
	END
	IF OBJECT_ID('tempdb..#TempCost') IS NOT NULL 
	BEGIN
		DROP TABLE #TempCost
	END
	IF OBJECT_ID('tempdb..#Temp_Qty_Before') IS NOT NULL 
	BEGIN
		DROP TABLE #Temp_Qty_Before
	END
	IF OBJECT_ID('tempdb..#Temp_Qty_After') IS NOT NULL 
	BEGIN
		DROP TABLE #Temp_Qty_After
	END
	IF OBJECT_ID('tempdb..#TempQuantity') IS NOT NULL 
	BEGIN
		DROP TABLE #TempQuantity
	END
	IF OBJECT_ID('tempdb..#TempSummary') IS NOT NULL 
	BEGIN
		DROP TABLE #TempSummary
	END
	SELECT 'Count: '+CONVERT(varchar(10),@Count)+'; Successfully generatingResultStockValuation' AS 'Notification'
	RETURN;
END

/***************
	EXECUTION
***************/
-- exec p_Stock_Valuation_History_New 7, 'fred', '2018-04-01'  --NOTES: 'yyyy-mm-dd'
