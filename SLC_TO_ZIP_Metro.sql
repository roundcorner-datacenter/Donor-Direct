-- Drop staging tables
drop table [Migration_METRO].dbo.[SLC_to_ZIP__c_stage_metro]

------create staging table

SELECT 
CAST('' as nchar(18))                                                         	As ID,
CAST('' as nvarchar(255))                                                    	As Error
,s.NAME																			As NAME
,s.CLC_CODE__C																	as CLC_CODE__C
,s.CITY__C																		as CITY__C
,s.CORPS__C																		As CORPS__C
,s.DIVISION__C																	As DIVISION__C
,s.ORGANIZATION_DISPLAY_NAME__C													As ORGANIZATION_DISPLAY_NAME__C
,CASE rtrim(ltrim(Division__C))	
WHEN 'WUM' THEN '0053D000000IrLq'
WHEN 'MET' THEN '0053D000000IrLA'		
ELSE '0053D000000IrLp'
END																				As Record_Owner__c
,s.SITE_ID__C																	As SITE_ID__C
,s.STATE__C																		as STATE__C
,s.TERRITORY__C																	as TERRITORY__C
,s.SLC_CODE__C																	As SLC_CODE__C
,s.ZIP_CODE__C																	as ZIP_CODE__C
,s.SF_ORG__C																	as SF_ORG__C

INTO [Migration_METRO].dbo.[SLC_to_ZIP__c_stage_metro]
FROM [DerivedData].dbo.[SLCtoZIP] s
Where s.TERRITORY__C='USC'

---

----------Insert/update records

-- use [Migration_METRO]
-- Exec SF_BulkOps 'Insert:bulkapi,Parallel,Batchsize(5000)', 'TSAC_MIGR', 'SLC_to_ZIP__c_stage_metro'

-------Replicate data

--use [Migration_Target_QA]
-- exec SF_Refresh 'TSAC_MIGR', 'SLC_to_ZIP__c','yes'