-- Drop staging tables
drop table [Migration_WUM].dbo.CampaignMember_Load

--Replicate Data

--USe [Migration_Target]
--exec SF_Replicate 'SALESFORCE', 'Contact'
--exec SF_Replicate 'SALESFORCE', 'Campaign'


--create Staging Table



SELECT

CAST(' ' as nchar(18))                                                  			As ID
,CAST(' ' as nvarchar(255))                                            				As Error
,'RESPONDED'																		As [Status]
,'False'																			As rC_Giving__Archive_Flag__c
,ltrim(rtrim(con.donor))                                                            As Donor
,con.Id                                                                             As ContactId
,c.ID                                                                               As CampaignId 
INTO [Migration_WUM].dbo.CampaignMember_Load
from

(SELECT distinct sol, donor from [WUMSampleSet-5/15].dbo.DPGIFT) xx
left join
[Migration_WUM].dbo.[Contact_Load] con
On rtrim(ltrim(con.donor))=rtrim(ltrim(xx.donor))
left join
[Migration_WUM].[dbo].[Campaign_Load] c
on rtrim(ltrim(SOL))=substring(Legacy_source_code__c,5,10)
where
right(con.External_Id__C,2)!='-2' and right(con.External_Id__C,2)!='-3'

----------------------------------------------------------------------------------------------------------


--- Insert/Update records
use [Migration_WUM]
Exec SF_BulkOps 'Insert:bulkapi', 'SALESFORCE', 'CampaignMember_Load'


---check errors

--select count(*) from [Migration_WUM].dbo.[CampaignMember_Load] where error not like'%Op%'



-- Replicate Data
--use [Migration_Target]
--exec SF_Refresh 'SALESFORCE', 'CampaignMember','Yes'



-- Insert/Update records
--use [Migration_WUM]
--exec SF_BulkOps 'Update', 'SALESFORCE', 'CampaignMember_Load'