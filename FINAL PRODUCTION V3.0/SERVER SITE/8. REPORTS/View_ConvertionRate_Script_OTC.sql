/*
	Create View_ConvertionRate_Script_OTC
	Notes:
		+	Price: ExtendedPrice | The cost customers have to cover = Retail - Discount
		
*/
use Sale_DDS_DW
GO
IF EXISTS(SELECT 1 FROM SYS.views WHERE name = 'View_In_House_Doctors_Itemies')
	DROP VIEW [View_In_House_Doctors_Itemies]
GO
CREATE VIEW View_In_House_Doctors_Itemies 
AS
WITH DistTransClinicDocs(Transactionkey_OurDocs) AS(
	SELECT DISTINCT TransactionKey FROM FactTransactionEntry fe
		LEFT OUTER JOIN DimDoctor d WITH (nolock)
			ON d.DoctorKey = fe.DoctorKey
		INNER JOIN AG_Doctors as AGDoctors WITH (nolock) -- Just include all Sales administrated by our doctors
			ON AGDoctors.PrescriberNumber = d.PrescriberNumber
)
SELECT 
	FactTransactionEntry.TransactionEntryKey AS TransactionEntryKey,
	FactTransaction.TransactionKey AS TransactionKey,
	FactTransaction.TransactionNumber AS TransactionNumber, -- what difference TransactionID, what about LOTS
	DimTime.Date AS TransactionDate,
	DimTime.Hour AS TransactionHour,
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
	CASE WHEN DimDoctor.FirstName like 'Unknown' THEN '' ELSE (DimDoctor.FirstName+' '+DimDoctor.LastName) END as DoctorFullName,
	DimDoctor.PrescriberNumber as PrescriberNumber,
	CASE WHEN FactTransactionEntry.ScriptKey = 0 THEN 'OTC' ELSE 'Script' END AS IsScript,
	CASE WHEN DimPatient.FirstName like 'Unknown' THEN '' ELSE (DimPatient.FirstName+' '+DimPatient.LastName) END as PatientFullName,
	CASE WHEN DimPatient.PostCode = 0 THEN '' ELSE DimPatient.PostCode END as PatientPostCode,
	-------------------------------------------------------
	FactTransactionEntry.Description as ItemDescription,
	DimProductDepartment.ProductDepartmentName AS Department,
	ISNULL(DimProductGroup.ProductGroupName, 'No Category') AS Category,
	DimStore.StoreName AS StoreName,
	DimStore.StoreKey as StoreKey
FROM FactTransactionEntry WITH (nolock)
	LEFT OUTER JOIN FactTransaction WITH (nolock)
		ON FactTransaction.TransactionKey = FactTransactionEntry.TransactionKey
	INNER JOIN DistTransClinicDocs WITH (nolock) -- Just include all Sales administrated by our doctors
		ON DistTransClinicDocs.Transactionkey_OurDocs = FactTransaction.TransactionKey
	LEFT OUTER JOIN DimDoctor WITH (nolock)
		ON DimDoctor.DoctorKey = FactTransactionEntry.DoctorKey
	LEFT OUTER JOIN DimTime WITH (nolock)
		ON FactTransaction.TimeKey = DimTime.TimeKey
	LEFT OUTER JOIN DimScript WITH (nolock)
		ON DimScript.ScriptKey = FactTransactionEntry.ScriptKey
	LEFT OUTER JOIN DimScriptLink WITH (nolock)
		ON DimScriptLink.ScriptLinkKey = FactTransactionEntry.ScriptLinkKey
	LEFT OUTER JOIN DimStore WITH (nolock)
		ON DimStore.StoreKey = FactTransactionEntry.StoreKey
	
	LEFT OUTER JOIN NDS_DW.dbo.AG_Doctors as AGDoctors WITH (nolock)
		ON AGDoctors.PrescriberNumber = DimDoctor.PrescriberNumber
	LEFT OUTER JOIN DimProduct WITH (nolock)
		ON DimProduct.ProductKey = FactTransactionEntry.ProductKey
	LEFT OUTER JOIN DimProductDepartment WITH (nolock)
		ON DimProductDepartment.ProductDepartmentKey = FactTransactionEntry.ProductDepartmentKey
	LEFT OUTER JOIN DimProductGroup WITH (nolock)
		ON DimProductGroup.ProductGroupKey = DimProduct.ProductGroupKey
	LEFT OUTER JOIN DimPatient WITH (nolock)
		ON DimPatient.PatientKey = FactTransactionEntry.PatientKey
WHERE [FactTransaction].Type = 0

