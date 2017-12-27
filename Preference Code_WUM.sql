 -- Drop staging tables
drop table [Migration_WUM].dbo.[rC_Bios__Preference_Code__c_load]

select
CAST('' as nchar(18))                                 					As ID
,CAST('' as nvarchar(255))                             					As Error
,'0053D000000INtD'														As ownerID
,a.Category                                           					As rC_Bios__Category__c
,a.[Non-Location Specific Code]											As rC_Bios__Code_Value__c
,a.[Sub-Category]                                                       As rC_Bios__Subcategory__c
,a.[Type]                                                               As rC_Bios__Type__c
,a.[Sub-Type]                                                        	As rC_Bios__Subtype__c

INTO [Migration_WUM].dbo.[rC_Bios__Preference_Code__c_load]
from
[WUM_UAT1].dbo.[Preference_Code] a

--- Insert/Update records
use [Migration_WUM]
Exec SF_BulkOps 'Insert:bulkapi,parallel,Batchsize(5000)', 'TSAC_MIGR', 'rC_Bios__Preference_Code__c_load'


 ----Replicate Data
--use [Migration_Target_QA]
--exec SF_Refresh 'TSAC_MIGR', 'rC_Bios__Preference_Code__c','Yes'