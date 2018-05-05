

/*
	Create View Itemies_Transaction_Detail
	Notes:
		+	Price: ExtendedPrice | The cost customers have to cover = Retail - Discount
		
*/
use DDS_Stock_Valuation_History
GO
IF EXISTS(SELECT 1 FROM SYS.views WHERE name = 'View_Item_Pricing_Detail')
	DROP VIEW [View_Item_Pricing_Detail]
GO
CREATE VIEW View_Item_Pricing_Detail AS
SELECT 
	DimProduct.ProductCode,
	DimProduct.ProductName,
	DimProduct.DateCreated,
	ISNULL(ProductDepartmentName, 'No Department') AS Department,
	ISNULL(ProductGroupName, 'No Category') AS Category,
	DimProductReference.Detail1 AS Brand,
	DimProduct.StoreKey,
	DimStore.StoreName
FROM 
	DimProduct with (nolock)
	INNER JOIN DimProductReference with (nolock)
		ON DimProduct.ProductID = DimProductReference.ProductReferenceID and DimProduct.StoreKey = DimProductReference.StoreKey
	INNER JOIN DimProductDepartment 
		ON DimProductDepartment.ProductDepartmentKey=DimProduct.ProductDepartmentKey
	INNER JOIN DimProductGroup 
		ON DimProductGroup.ProductGroupKey=DimProduct.ProductGroupKey
	INNER JOIN DimStore
		ON DimProduct.StoreKey = DimStore.StoreKey
WHERE 
	DimProduct.ItemType not in (20,21,22)