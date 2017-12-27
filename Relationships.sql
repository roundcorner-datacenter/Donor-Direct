-- Drop staging tables
drop table [Migration_WUM].dbo.rC_Bios__Relationship__c_Load_WUM

--Replicate Data

--USe [Migration_Target_QA]

--exec SF_Replicate 'TSAC_MIGR', 'Account'
--exec SF_Replicate 'TSAC_MIGR', 'Contact'



--create Staging Table
SELECT

CAST('' as nchar(18))                                                  				As ID
,CAST('' as nvarchar(255))                                            				As Error
,(Select Id from [Migration_Target_QA].dbo.[RecordType] where
 SobjectType='rC_Bios__Relationship__c' 
	And name='Contact - Contact')													As RecordTypeID
,'TRUE'																				As rC_Bios__Active__c
,'False'																			As rC_Bios__Archive_Flag__c
,'FAMILY'																			As rC_Bios__Category__c
,CAST('' as char(18))														        As rC_Bios__Contact_1__c
,CAST('' as char(18))														        As rC_Bios__Contact_2__c
,'SPOUSE'																			As rC_Bios__Role_1__c
,'SPOUSE'																			As rC_Bios__Role_2__c
,rtrim(ltrim(a.donor))		                                                        As Donor
INTO [Migration_WUM].dbo.[rC_Bios__Relationship__c_LOAD_WUM]
from
[WUM_UAT1].dbo.dpadd  a
where addtype='SPSE'

-----------------------------------------------------------------------------------------------------------------------------
--- Updating rC_Bios__Contact_1__c
-----------------------------------------------------------------------------------------------------------------------------
update [Migration_WUM].dbo.[rC_Bios__Relationship__c_LOAD_WUM]
set rC_Bios__Contact_1__c=c.ID
from 
[WUM_UAT1].dbo.[DPADD] a
left join
[Migration_WUM].dbo.Contact_Load c
on rtrim(ltrim(a.donor))=rtrim(ltrim(c.donor))
left join [Migration_WUM].dbo.[rC_Bios__Relationship__c_LOAD_WUM] r
on r.donor=c.donor
where addtype='SPSE' and (right(c.External_Id__c,2)!='-2' and right(c.External_Id__c,2)!='-3')
-----------------------------------------------------------------------------------------------------------------------------
--- Updating rC_Bios__Contact_2__c
-----------------------------------------------------------------------------------------------------------------------------
update [Migration_WUM].dbo.[rC_Bios__Relationship__c_LOAD_WUM]
set rC_Bios__Contact_2__c=c.ID
from 
[WUM_UAT1].dbo.[DPADD] a
left join
[Migration_WUM].dbo.Contact_Load c
on rtrim(ltrim(a.donor))=rtrim(ltrim(c.donor))
left join [Migration_WUM].dbo.[rC_Bios__Relationship__c_LOAD_WUM] r
on r.donor=c.donor

where addtype='SPSE' and right(c.External_Id__c,2)='-2' 



--- Insert/Update records
use [Migration_WUM]
Exec SF_BulkOps 'Insert:bulkapi,parallel,Batchsize(10000)', 'TSAC_MIGR', 'rC_Bios__Relationship__c_LOAD_WUM'


---check errors

--select count(*) from [Migration_WUM].dbo.[rC_Bios__Relationship__c_LOAD_WUM] where error not like'%Op%'



 ----Replicate Data
--use [Migration_Target_QA]
--exec SF_Refresh 'TSAC_MIGR', 'rC_Bios__Relationship__c','Yes'


