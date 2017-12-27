 -- Drop staging tables
drop table [Migration_Metro].dbo.[rC_Bios__Preference_Code__c_load]

select
CAST('' as nchar(18))                                                  	As ID,
CAST('' as nvarchar(255))                                             	As Error,
Category                                                                As rC_Bios__Category__c,
[Sub-Category]                                                         	As rC_Bios__Subcategory__c,
[Type]                                                                  As rC_Bios__Type__c,
[Sub-Type]                                                       		As rC_Bios__Subtype__c,
[Non-Location Specific Code] As rC_Bios__Code_Value__c
INTO [Migration_Metro].dbo.[rC_Bios__Preference_Code__c_load]
from
[METRO_UAT1].dbo.[Preference_code]

--- Insert/Update records
use [Migration_Metro]
Exec SF_BulkOps 'Insert:bulkapi,parallel,Batchsize(5000)', 'TSAC_MIGR', 'rC_Bios__Preference_Code__c_load'

 ----Replicate Data
--use [Migration_Target_QA]
--exec SF_Refresh 'TSAC_MIGR', 'rC_Bios__Preference_Code__c','Yes'