-- Drop staging tables
drop table [Migration_METRO].dbo.[rC_Bios__Salutation__c_LOAD]

--Replicate Data

--USe [Migration_Target_QA]
--exec SF_Replicate 'TSAC_MIGR', 'Account'
--exec SF_Replicate 'TSAC_MIGR', 'Contact'


-----create staging table

SELECT
CAST('' as nchar(18))                                                      				As ID
,CAST('' as nvarchar(255))                                                 				As Error
,CASE rtrim(ltrim(s.SAl))
	WHEN '' THEN CONCAT(rtrim(ltrim(s.Title)),' ',rtrim(ltrim(s.Fname)),' ',rtrim(ltrim(s.Lname)),' ',rtrim(ltrim(s.suff)))	
	Else rtrim(ltrim(s.SAL))
	END 																					AS name
,a.ID 																                        As rC_Bios__Account__c
,'FALSE'																					As rC_Bios__Archive_Flag__c
,c.ID 																                        As rC_Bios__Contact__c
,rtrim(ltrim(s.sal))																		As rC_Bios__Inside_Salutation__c
,'True'																						As rC_Bios__Preferred_Salutation__c
,CASE rtrim(ltrim(s.SAl))
	WHEN '' THEN CONCAT(rtrim(ltrim(s.Title)),' ',rtrim(ltrim(s.Fname)),' ',rtrim(ltrim(s.Lname)),' ',rtrim(ltrim(s.suff)))	
	Else rtrim(ltrim(s.SAL))
	END 																					As rc_Bios__Salutation_Line_1__c
,rtrim(ltrim(s.SECLN))																		As rC_Bios__Salutation_Line_2__c
,'HISTORICAL'																				As rC_Bios__Salutation_Type__c
,rtrim(ltrim(s.TITLE))																		As rC_Bios__Prefix__c
,rtrim(ltrim(s.FNAME))																		As rC_Bios__First_Name__c
,rtrim(ltrim(s.MNAME))																		As rC_Bios__Middle_Name__c
,rtrim(ltrim(s.LNAME))																		As rC_Bios__Last_Name__c
,rtrim(ltrim(s.SUFF))																		As rC_Bios__Suffix__c
,'TRUE'																						As rC_Bios__Is_Active__c
,rtrim(ltrim(s.donor))																		As donor
INTO [Migration_METRO].dbo.[rC_Bios__Salutation__c_LOAD]
from 
[METRO_UAT1].dbo.[DPADD] s
Left Join
[Migration_METRO].dbo.[Account_stage_Metro] a
On rtrim(ltrim(s.donor)) = a.Donor
Left Join
[Migration_METRO].dbo.[Contact_stage_Metro] c
On rtrim(ltrim(s.donor)) = c.Donor
where rtrim(ltrim(s.Donor))!='' AND rtrim(ltrim(s.lname))!='' and right(c.External_Id__C,2)!='-2' and priority=1

order by rC_Bios__Account__c,rC_Bios__Contact__c
----------------------------------------------------------------------------------------

-- Insert/Update records
--use [Migration_METRO]
--Exec SF_BulkOps 'Insert:bulkapi,parallel,Batchsize(10000)', 'TSAC_MIGR', 'rC_Bios__Salutation__c_LOAD'


-----check errors

----select count(*) from [Migration_METRO].dbo.[rC_Bios__Salutation__c_LOAD] where error not like'%Op%'



---- Replicate Data
--use [Migration_Target_QA]
--exec SF_Refresh 'TSAC_MIGR', 'rC_Bios__Salutation__c','Yes'




