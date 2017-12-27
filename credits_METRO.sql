 -- Drop staging tables
drop table [Migration_Metro].dbo.rC_Giving__Opportunity_Credit__c_Load

--Replicate Data

--USe [Migration_Target_QA]

--exec SF_Replicate 'TSAC_MIGR', 'USER'
---exec SF_Replicate 'TSAC_MIGR', 'ACCOUNT'
--exec SF_Replicate 'TSAC_MIGR', 'Opportunity'



--create Staging Table

--CREDITS

select * 
INTO [Migration_Metro].dbo.rC_Giving__Opportunity_Credit__c_Load
from (SELECT

CAST('' as nchar(18))                                                  	As ID
,CAST('' as nvarchar(255))                                             	As Error
,a.id																	As rC_Giving__Account__c
,rtrim(ltrim(g.amt))													As rC_Giving__Amount__c
,'100'																	As rC_Giving__Distribution__c
,'FALSE'																As rC_Giving__Is_Fixed__c
,xx.ID 																	As rC_Giving__Opportunity__c
,rtrim(ltrim(g.[DATE]))													as rC_Giving__Opportunity_Close_Date__c
,rtrim(ltrim(g.amt))													As rC_Giving__Opportunity_Current_Giving_Amount__c
,'Closed'																as rC_Giving__Opportunity_Stage__c
,'0053D000000IrLF'														as rC_Giving__User__c
,CAST('METRO-'+rtrim(ltrim(gidnumb)) as nvarchar(100)) 					as External_ID__c
,rtrim(ltrim(g.donor))													AS donor
,'Account Only'                                                         As rC_Giving__Type__c
FROM
[METRO_UAT1].dbo.dpgift g 
LEFT JOIN
[Migration_Metro].dbo.Account_stage_Metro a
ON rtrim(ltrim(g.donor))=a.donor
Left join
(select ID,External_id__c from [Migration_Metro].dbo.[opportunity_INKIND] 
UNION 
select ID,External_id__c from [Migration_Metro].dbo.[opportunity_DONATION] 
UNION
select ID,External_id__c from [Migration_Metro].dbo.[opportunity_GRANT]
UNION
select ID,External_id__c from [Migration_Metro].dbo.[opportunity_TRANSACTION_final]
union
select ID,External_id__c from [Migration_Metro].dbo.[opportunity_pledge])xx
on CAST(rtrim(ltrim(g.SLINK))as nvarchar(100))=reverse(SUBSTRING(reverse(xx.External_id__c),1,charindex('-',reverse(xx.External_id__c))-1))

WHERE g.rectype = 's'




)yy

order by yy.rC_Giving__Account__c



----------------------------------------------------------------------------------------------------------------------




--- Insert/Update records
use [Migration_Metro]
Exec SF_BulkOps 'Insert:bulkapi,Parallel,batchsize(5000)', 'TSAC_MIGR', 'rC_Giving__Opportunity_Credit__c_Load'


---check errors

--select count(*) from [Migration_Metro].dbo.[rC_Giving__Opportunity_Credit__c_Load] where id=''





-- Replicate Data
--use [Migration_Target_QA]
--exec SF_Refresh 'TSAC_MIGR', 'rC_Giving__Opportunity_Credit__c','yes'
