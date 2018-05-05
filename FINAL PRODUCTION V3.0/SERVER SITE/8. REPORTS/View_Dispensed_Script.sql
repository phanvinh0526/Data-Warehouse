/*
	Generate View_Dispensed_Script

*/
use Sale_DDS_DW
go
IF EXISTS(SELECT 1 FROM sys.views WHERE name = 'View_Dispensed_Script')
	DROP VIEW [View_Dispensed_Script]
GO
CREATE VIEW View_Dispensed_Script AS
SELECT
	DimStore.StoreName AS StoreName,
	DimStore.StoreKey AS StoreKey,
	DimDataSource.DataSourceName AS Data_Source,
	DimDrug.Description as DrugDescription,
	DimScript.ScriptNumber,
	DimScript.DispenseDate AS DateDispensed,
	rtrim(ltrim(isnull(DimDoctor.FirstName,'') + ' ' + isnull(DimDoctor.LastName,''))) as DoctorName,
	DimDoctor.PrescriberNumber as DoctorPrescriberNumber,
	DimDrug.Form as DrugForm,
	DimDrug.Strength as DrugStrength,
	DimDrug.PackSize as DrugPackSize,
	rtrim(ltrim(isnull(DimPatient.FirstName,'') + ' ' + isnull(DimPatient.LastName,''))) as PatientFullName,
	--DimScript.ScriptType,
	DimScript.PatientPrice as PatientContribution,
	DimScript.GovernmentRecoveryAmount as GovRecov,
	DimScript.ScriptClassification as ScriptClass_Original,
	CASE UPPER(RTRIM(DimScript.ScriptClassification))
		WHEN '<' THEN 'Safety Net'
		WHEN 'N' THEN 'General'        
		WHEN 'C' THEN 'Concession'        
		WHEN 'S' THEN 'Concession'        
		WHEN 'B' THEN 'Doctors Bag'        
		WHEN 'E' THEN 'Entitlement'        
		WHEN 'R' THEN 'Repatriation'        
		WHEN 'P' THEN 'Private'        
		WHEN 'T' THEN 'S3 Recordable'        
	END AS ScriptClass,
	DimScript.PatientPrice + DimScript.GovernmentRecoveryAmount as TotalValue,
	case when DimScript.Cost =0 then DimScript.WhosesaleCost else DimScript.Cost end AS Cost,
	case when DimScript.ScriptStatus = 'O' then 'Y' else 'N' end AS Owing,

	(case when DimScript.GstIncluded =1 then (DimScript.PatientPrice + DimScript.GovernmentRecoveryAmount)*10/11 
	else DimScript.PatientPrice + DimScript.GovernmentRecoveryAmount end) - (case when DimScript.Cost=0 
	then DimScript.WhosesaleCost else DimScript.Cost end) AS GrossProfit

FROM DimScript WITH (nolock)
	LEFT OUTER JOIN DimDrug WITH (nolock)
		ON DimScript.DrugKey = DimDrug.DrugKey
	LEFT OUTER JOIN DimProduct WITH (nolock)
		ON DimScript.DrugItemKey = DimProduct.ProductKey -- not DrugKey -> DrugItemKey
	LEFT OUTER JOIN DimDoctor WITH (nolock)
		ON DimDoctor.DoctorKey = DimScript.DoctorKey
	LEFT OUTER JOIN DimPatient WITH (nolock)
		ON DimPatient.PatientKey = DimScript.PatientKey
	LEFT OUTER JOIN DimStore WITH (nolock)
		ON DimStore.StoreKey = DimScript.StoreKey
	LEFT OUTER JOIN DimDataSource WITH (nolock)
		ON DimDataSource.DataSourceKey = DimScript.DataSourceKey
WHERE DimScript.Deleted=0
