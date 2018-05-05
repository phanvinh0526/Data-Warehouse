

/*
	Create View View_Modified_Itemies_Transaction_Detail
	Notes:
		+	Price: ExtendedPrice | The cost customers have to cover = Retail - Discount
		
*/
use Sale_DDS_DW
GO
IF EXISTS(SELECT 1 FROM SYS.views WHERE name = 'View_Modified_Itemies_Transaction_Detail')
	DROP VIEW [View_Modified_Itemies_Transaction_Detail]
GO
CREATE VIEW View_Modified_Itemies_Transaction_Detail 
AS
WITH DistTransactionNumber_Wechat(TransKey_Wechat, Flag) AS(
	-- New update 06.04.2018 for Wechat Transaction report --
	SELECT DISTINCT TransactionKey, 1  FROM FactTransactionEntry
		--LEFT OUTER JOIN FactTransaction WITH (nolock)
			--ON FactTransaction.TransactionKey = FactTransactionEntry.TransactionKey
	WHERE FactTransactionEntry.[Description] like '%WECHAT%'
)
SELECT 
	FactTransactionEntry.TransactionEntryKey AS TransactionEntryKey,
	FactTransaction.TransactionNumber AS TransactionNumber, -- what difference TransactionID, what about LOTS
	FactTransaction.TransactionID as TransactionID,
	DimTime.Date AS TransactionDate,
	MONTH(DimTime.Date) AS TransactionDate_Month,
	YEAR(DimTime.Date) AS TransactionDate_Year,
	DimTime.Hour AS TransactionHour,
	DimProduct.ProductName AS Item_Description,
	DimProductDepartment.ProductDepartmentName AS Department,
	isnull(DimProductGroup.ProductGroupName, 'No Category') AS Category,
	FactTransactionEntry.Quantity AS QtySold,
	FactTransactionEntry.GovRecovAmt AS Gov_Recov,
	FactTransactionEntry.Tax,
	FactTransactionEntry.Discount,
	FactTransactionEntry.Price - 
			(FactTransactionEntry.Cost * FactTransactionEntry.Quantity) - 
			FactTransactionEntry.Tax + FactTransactionEntry.GovRecovAmt 
			AS Profit,
	FactTransactionEntry.Price - FactTransactionEntry.Tax As Sales_Ex,
	DimScript.ScriptNumber AS ScriptNumber_Fred,
	DimScriptLink.ScriptNumber AS ScriptNumber_Lots,
	-- New update 06.04.2018 for ConservationRate report --
	(DimDoctor.FirstName+' '+DimDoctor.LastName) as DoctorFullName,
	DimDoctor.PrescriberNumber as PrescriberNumber,
	CASE WHEN FactTransactionEntry.ScriptKey = 0 THEN 'OTC' ELSE 'Script' END AS IsScript,
	CASE WHEN DistTransactionNumber_Wechat.Flag = 1 THEN 'WECHAT' ELSE 'ITEM' END AS IsWechat,
	FactTransactionEntry.Cost as ItemCost,
	-------------------------------------------------------
	DimDataSource.DataSourceName AS Data_Source,
	DimStore.StoreName AS StoreName,
	DimStore.StoreKey as StoreKey
FROM FactTransactionEntry WITH (nolock)
	LEFT OUTER JOIN FactTransaction WITH (nolock)
		ON FactTransaction.TransactionKey = FactTransactionEntry.TransactionKey
	LEFT OUTER JOIN DimTime WITH (nolock)
		ON FactTransaction.TimeKey = DimTime.TimeKey
	LEFT OUTER JOIN DimProduct WITH (nolock)
		ON DimProduct.ProductKey = FactTransactionEntry.ProductKey
		-- AND [doItemBase].ItemType not in (20,21,22)
	LEFT OUTER JOIN DimProductDepartment WITH (nolock)
		ON DimProductDepartment.ProductDepartmentKey = FactTransactionEntry.ProductDepartmentKey
	LEFT OUTER JOIN DimProductGroup WITH (nolock)
		ON DimProductGroup.ProductGroupKey = DimProduct.ProductGroupKey
	LEFT OUTER JOIN DimScript WITH (nolock)
		ON DimScript.ScriptKey = FactTransactionEntry.ScriptKey
	LEFT OUTER JOIN DimScriptLink WITH (nolock)
		ON DimScriptLink.ScriptLinkKey = FactTransactionEntry.ScriptLinkKey
	LEFT OUTER JOIN DimStore WITH (nolock)
		ON DimStore.StoreKey = FactTransactionEntry.StoreKey
	LEFT OUTER JOIN DimDataSource WITH (nolock)
		ON DimDataSource.DataSourceKey = FactTransactionEntry.DataSourceKey
	LEFT OUTER JOIN DimDoctor WITH (nolock)
		ON DimDoctor.DoctorKey = FactTransactionEntry.DoctorKey
	LEFT OUTER JOIN DistTransactionNumber_Wechat WITH(nolock)
		ON FactTransaction.TransactionKey = DistTransactionNumber_Wechat.TransKey_Wechat
WHERE [FactTransaction].Type = 0


