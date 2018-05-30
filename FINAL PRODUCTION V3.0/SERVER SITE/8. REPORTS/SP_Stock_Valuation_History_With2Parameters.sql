USE DDS_Stock_Valuation_History
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[p_Stock_Valuation_History_With2Parameters]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[p_Stock_Valuation_History_With2Parameters] AS'
END
GO
ALTER PROCEDURE [dbo].[p_Stock_Valuation_History_With2Parameters]
	@StoreKey int = 1, -- "store id number" | default number 9 is Brimbank pharmacy
	@DataSource nvarchar(100) = 'fred', -- "lots" or "fred"
	@StockValueFrom datetime = '2017-10-01', -- CAUTION: "yyyy-mm-dd"
	@StockValueTo datetime = '2017-12-01' -- CAUTION: "yyyy-mm-dd"
AS
BEGIN
-- Global variables
	--DECLARE @sqlStatement nvarchar(4000)
	 SET NOCOUNT ON; -- VERY IMPORTANT to solve Tableau Error (No Result Sets)

-- Validation
	IF(@DataSource != 'lots' and @DataSource != 'fred')
	BEGIN
		-- Input error
		SELECT 'Error input: DataSource is not correct (lots, fred)' AS 'Notification'
		RETURN
	END
	IF(ISDATE(@StockValueFrom) != 1 and ISDATE(@StockValueTo) != 1)
	BEGIN
		-- Input error
		SELECT 'Error input: StockValue, not Datetime type' AS 'Notification'
		RETURN
	END
	IF NOT EXISTS(SELECT 1 FROM DimStore WHERE StoreKey = @StoreKey)
	BEGIN
		-- Input error
		SELECT 'Error input: StoreKey is not available, check DimStore' AS 'Notification'
		RETURN
	END

-- Create all temporary tables

	IF EXISTS(SELECT TOP(1) 1 FROM tempdb.sys.tables WHERE object_id = OBJECT_ID(N'tempdb..#Temp_Cost_Before'))
		DROP TABLE #Temp_Cost_Before
	CREATE TABLE #Temp_Cost_Before(
	[AuditID] [bigint] NOT NULL,
	[ProductKey] [bigint] NOT NULL,
	[StoreKey] [int] NOT NULL,
	CONSTRAINT [PK_Temp_Cost_Before] PRIMARY KEY CLUSTERED([AuditID] ASC, [StoreKey]))

	IF OBJECT_ID('tempdb..#Temp_Cost_After') IS NOT NULL 
		DROP TABLE #Temp_Cost_After  
    CREATE TABLE #Temp_Cost_After(
    [AuditID] [bigint] NOT NULL,
	[ProductKey] [bigint] NOT NULL,        
	[StoreKey] [int] NOT NULL,
    CONSTRAINT [PK_Temp_Cost_After] PRIMARY KEY CLUSTERED([AuditID] ASC, [StoreKey])) 
    
	IF OBJECT_ID('tempdb..#TempCost') IS NOT NULL 
		DROP TABLE #TempCost
    CREATE TABLE #TempCost(
    [ItemUsed] [bigint] NOT NULL,
    [Cost] decimal(9, 2) NOT NULL,
    [DummyDate] [datetime] NOT NULL,
    CONSTRAINT [PK_TempCost] PRIMARY KEY CLUSTERED([ItemUsed] ASC))               
      
    IF OBJECT_ID('tempdb..#Temp_Qty_Before') IS NOT NULL 
		DROP TABLE #Temp_Qty_Before
    CREATE TABLE #Temp_Qty_Before(
	[MovementID] [bigint] NOT NULL,
    [ItemUsed] [bigint] NOT NULL,
	[StoreKey] [int] NOT NULL,
    CONSTRAINT [PK_Temp_Qty_Before] PRIMARY KEY CLUSTERED([MovementID] ASC, [StoreKey])) 
     
	IF OBJECT_ID('tempdb..#Temp_Qty_After') IS NOT NULL 
		DROP TABLE #Temp_Qty_After
    CREATE TABLE #Temp_Qty_After(
	[MovementID] [bigint] NOT NULL,
    [ItemUsed] [bigint] NOT NULL,
	[StoreKey] [int] NOT NULL,
    CONSTRAINT [PK_Temp_Qty_After] PRIMARY KEY CLUSTERED([MovementID] ASC, [StoreKey])) 
      
    IF OBJECT_ID('tempdb..#TempQuantity') IS NOT NULL 
		DROP TABLE #TempQuantity
    CREATE TABLE #TempQuantity(
    [ItemUsed] [bigint] NOT NULL,
    [Quantity] [float] NOT NULL,
    CONSTRAINT [PK_TempQuantity] PRIMARY KEY CLUSTERED([ItemUsed] ASC))     
      
    IF OBJECT_ID('tempdb..#TempSummary') IS NOT NULL 
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

	

/****************************
	Setup Initial Parameters
*****************************/
	IF OBJECT_ID('tempdb..#TempSVPeriod') IS NOT NULL
		DROP TABLE #TempSVPeriod
	CREATE TABLE #TempSVPeriod(
		[MonthNum] [datetime] NOT NULL
	)
	IF OBJECT_ID('tempdb..#TempSVMessage') IS NOT NULL
		DROP TABLE #TempSVMessage
	CREATE TABLE #TempSVMessage(
		[StockValueAt] [datetime] NOT NULL,
		[TotalRowNumber] [int] NOT NULL
	)

	TRUNCATE TABLE #TempSVPeriod

	INSERT INTO #TempSVPeriod
	SELECT DATEADD(MONTH, x.number, @StockValueFrom)
	FROM master.dbo.spt_values x
	WHERE x.type = 'P' and x.number <= DATEDIFF(MONTH,@StockValueFrom, @StockValueTo)


/*******************
	Start the Loop
********************/
	-- Local Variables
	DECLARE @TotalSales as Decimal(28,10);
	
	DECLARE @StockValueAt AS DATETIME;
	DECLARE @TotalRowCount AS INT = 0;
	
	-- Looping
	WHILE (SELECT COUNT(*) FROM #TempSVPeriod) != 0
	BEGIN

		SET @StockValueAt = (SELECT TOP 1 MonthNum FROM #TempSVPeriod)
		SELECT @TotalSales = ISNULL(SUM(TotalCost), 0) FROM [#TempSummary];

		/*******************************************************************
			Fred Office
		*******************************************************************/
		/*
		Business Flow:
			There are 3 case studies
			1.	The items in prior data, which means It exists in audit table before the StockValueDate
			2.	The items in new data only, which means the item is added after the StockValueDate
			3.	The items are never exist in Audit table (very new products)
		The procedure covers all 3 cases, so that It can guarantee all items listed out
		*/
		
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
				CONVERT(Decimal(9,2), [FactBusinessAuditHistory].ToValue) as Cost,
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
			INNER JOIN [#Temp_Cost_After] on [#Temp_Cost_After].AuditID = [BusinessAuditHistoryID] 
				and [#Temp_Cost_After].StoreKey = [FactBusinessAuditHistory].StoreKey

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
			PRINT 'here 5'
			INSERT INTO [#Temp_Qty_Before]
			SELECT MAX(FactStockMovement.StockMovementID) as MovementID, FactStockMovement.ProductKey as ItemUsed, @StoreKey
			FROM FactStockMovement with (nolock)
			WHERE FactStockMovement.DateAdded <= @StockValueAt AND FactStockMovement.StoreKey = @StoreKey
			GROUP BY ProductKey

			-- Get stock on hand from 'AfterQuantity' from above Movement Ids
			PRINT 'here 6'
			INSERT INTO [#TempQuantity]
			SELECT [#Temp_Qty_Before].ItemUsed, AfterQuantity as Quantity
			FROM FactStockMovement with (nolock)
			INNER JOIN [#Temp_Qty_Before] on [#Temp_Qty_Before].MovementID = FactStockMovement.StockMovementID AND FactStockMovement.StoreKey = @StoreKey

			-- For the items which are not found above get the First movement ID after the selecteddate for the rest of the items
			PRINT 'here 7'
			INSERT INTO [#Temp_Qty_After]
			SELECT MIN(FactStockMovement.StockMovementID) as MovementID, FactStockMovement.ProductKey as ItemUsed, @StoreKey
			FROM FactStockMovement with (nolock)
			WHERE FactStockMovement.DateAdded > @StockValueAt AND FactStockMovement.StoreKey = @StoreKey
				AND NOT EXISTS (SELECT * FROM [#Temp_Qty_Before] WHERE [#Temp_Qty_Before].ItemUsed = FactStockMovement.ProductKey)
			GROUP BY ProductKey

			-- Get stock on hand from 'AfterQuantity' - AdjustmentQuantity' which makes before Quantity for the Movement Ids found above
			PRINT 'here 8'
			INSERT INTO [#TempQuantity]
			SELECT [#Temp_Qty_After].ItemUsed, (AfterQuantity - AdjustmentQuantity) as Quantity
			FROM FactStockMovement with (nolock)
			INNER JOIN [#Temp_Qty_After] on [#Temp_Qty_After].MovementID = FactStockMovement.StockMovementID 
				and [#Temp_Qty_After].StoreKey = [FactStockMovement].StoreKey

			-- If the items are never recoreded in Item Movement History Table get the current Stock on Hand from ItemBase table
			PRINT 'here 9'
			INSERT INTO [#TempQuantity]
			SELECT DimProduct.ProductKey as ItemUsed, DimProduct.SOH as Quantity
			FROM DimProduct with (nolock)
			WHERE DimProduct.DateCreated <= @StockValueAt and StoreKey = @StoreKey
				AND DimProduct.ProductKey NOT IN (SELECT ItemUsed FROM [#Temp_Qty_Before] UNION SELECT ItemUsed FROM [#Temp_Qty_After])

			-- Need to insert into a temp table to calculate the TotalCost
			PRINT 'here 10'
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


			/**********************
				Make final Results
			**********************/
			PRINT 'here 11'
			IF EXISTS(select top 1 1 from [ADVANCED_ANALYSIS].[dbo].[SVH_ResultStockValuation_Ext])
			BEGIN	
				DELETE FROM [ADVANCED_ANALYSIS].[dbo].[SVH_ResultStockValuation_Ext]
				WHERE StoreKey = @StoreKey AND AuditYear = YEAR(@StockValueAt) AND AuditMonth = MONTH(@StockValueAt)
			END
			INSERT INTO [ADVANCED_ANALYSIS].[dbo].[SVH_ResultStockValuation_Ext]
				(StoreKey, AuditMonth, AuditYear, ProductKey, ProductCode, ProductName, 
				Department, Category, Cost, QuantityOnHand, TotalCost, TotalLastCostPCT)
			SELECT @StoreKey, MONTH(@StockValueAt) as AuditMonth, YEAR(@StockValueAt) as AuditYear, 
				Productkey, ProductCode, ProductName, 
				CASE WHEN Department like 'Unknown' THEN ('No Department') ELSE Department END, 
				CASE WHEN Category like 'Unknown' THEN ('No Category') ELSE Category END, 
				Cost, QuantityOnHand, TotalCost, 
				CASE WHEN @TotalSales = 0 THEN 0 ELSE [TotalCost]/@TotalSales END AS [TotalLastCostPCT]
			FROM [#TempSummary];
			
			SET @TotalRowCount = @TotalRowCount + (SELECT CAST(COUNT(*) as INT) FROM [#TempSummary])


			/************************
				Clean all temp data
			************************/
			PRINT 'here 12'
			TRUNCATE TABLE #Temp_Cost_Before
			TRUNCATE TABLE #Temp_Cost_After
			TRUNCATE TABLE #TempCost
			TRUNCATE TABLE #Temp_Qty_Before
			TRUNCATE TABLE #Temp_Qty_After
			TRUNCATE TABLE #TempQuantity
			TRUNCATE TABLE #TempSummary

		
		END
		
		

		/*******************************************************************************
			LOTS
		********************************************************************************/
		IF(@DataSource = 'lots')
		BEGIN
			RETURN 'Lots is not available'
		END

		-- Notification
		INSERT INTO  #TempSVMessage VALUES (@StockValueAt, @TotalRowCount)

		
		-------------- End of File----------------
		IF(@TotalRowCount) >= 1000000
			BREAK
		ELSE
			DELETE TOP (1) FROM #TempSVPeriod
			CONTINUE

	END
/*****************
	// End of Loop
*****************/
	
	SELECT TOP 100 * FROM #TempSVMessage

/***************
	Drop all the temp tables
***************/
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
	IF OBJECT_ID('tempdb..#TempSVMessage') IS NOT NULL 
	BEGIN
		DROP TABLE #TempSVMessage
	END
	
	-- Successful Messages
	--SELECT 'SP Processing Successfully, please query ResultStockValuation_Ext table for updated data' AS 'Notification'
	WAITFOR DELAY '00:00:5';
	RETURN;
END

/***************
	EXECUTION
***************/
-- exec p_Stock_Valuation_History_With2Parameters 7, 'fred', '2017-01-01', '2018-05-01'  --NOTES: 'yyyy-mm-dd'