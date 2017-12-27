-- Drop staging tables

drop table [Migration_WUM].dbo.[rC_Bios__Salutation__c_LOAD_wum]

--Replicate Data

--USe [Migration_Target_QA]
--exec SF_Replicate 'TSAC_MIGR', 'Account'
--exec SF_Replicate 'TSAC_MIGR', 'Contact'


-------create staging table

SELECT
CAST('' as nchar(18))                                                      					As ID
,CAST('' as nvarchar(255))                                                 					As Error
,rtrim(ltrim(SAL))																		    AS name      
,a.id 																						As rC_Bios__Account__c
,'FALSE'																					As rC_Bios__Archive_Flag__c
,rtrim(ltrim(c.id ))																		As rC_Bios__Contact__c
,rtrim(ltrim(s.sal))																		As rC_Bios__Inside_Salutation__c
,'True'																						As rC_Bios__Preferred_Salutation__c
,CASE rtrim(ltrim(p.Switch))
	WHEN '1' THEN rtrim(ltrim(s.secln))
	WHEN '0' THEN CONCAT(rtrim(ltrim(s.Title)),' ',rtrim(ltrim(s.Fname)),' ',rtrim(ltrim(s.Lname)),' ',rtrim(ltrim(s.suff)))	
	END 																					As rc_Bios__Salutation_Line_1__c
,CASE rtrim(ltrim(p.SWITCH))											
WHEN '1' THEN CONCAT(rtrim(ltrim(s.Title)),' ',rtrim(ltrim(s.Fname)),' ',rtrim(ltrim(s.Lname)),' ',rtrim(ltrim(s.suff)))
WHEN '0' THEN rtrim(ltrim(s.secln))

END                                                                                      	As rC_Bios__Salutation_Line_2__c
,'HISTORICAL'																				As rC_Bios__Salutation_Type__c
,rtrim(ltrim(s.TITLE))																		As rC_Bios__Prefix__c
,rtrim(ltrim(s.FNAME))																		As rC_Bios__First_Name__c
,rtrim(ltrim(s.LNAME))																		As rC_Bios__Last_Name__c
,rtrim(ltrim(s.SUFF))																		As rC_Bios__Suffix__c
,'TRUE'																						As rC_Bios__Is_Active__c
,rtrim(ltrim(s.donor))																		As donor
INTO [Migration_WUM].dbo.[rC_Bios__Salutation__c_LOAD_wum]
from 
[WUM_UAT1].dbo.[DPADD] s
Left Join
[Migration_WUM].dbo.[Account_Load_WUM] a
On rtrim(ltrim(s.donor)) = rtrim(ltrim(a.Donor))
LEFT JOIN
[WUM_UAT1].dbo.[DP]p
ON  rtrim(ltrim(p.donor2))=rtrim(ltrim(s.donor))
 LEFT JOin 
 [Migration_WUM].dbo.[Contact_Load] c 
 on rtrim(ltrim(s.donor)) = rtrim(ltrim(c.Donor))
where rtrim(ltrim(s.Donor))!='' AND rtrim(ltrim(s.lname))!='' and priority=1 and (right(c.External_Id__C,2)!='-2'and right(c.External_Id__C,2)!='-3')

order by rC_Bios__Account__c,rC_Bios__Contact__c

---------------------------------------------------------------------------------------------


-- Insert/Update records
-- use [Migration_WUM]
-- Exec SF_BulkOps 'Insert:bulkapi,parallel,Batchsize(5000)', 'TSAC_MIGR', 'rC_Bios__Salutation__c_LOAD_wum'


---check errors

--select count(*) from [Migration_DataUpdate].dbo.[rC_Bios__Salutation__c_LOAD] where error not like'%Op%'



-- Replicate Data
--use [Migration_Target_QA]
--exec SF_Refresh 'TSAC_MIGR', 'rC_Bios__Salutation__c','Yes'

