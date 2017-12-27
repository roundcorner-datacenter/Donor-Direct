-- Drop staging tables
drop table [Migration_WUM].dbo.[rC_Bios__Account_Address__c_Load]

--Replicate Data

--USe [Migration_Target_QA]
--exec SF_Replicate 'TSAC_MIGR', 'USER'
--exec SF_Replicate 'TSAC_MIGR', 'RecordType'
--exec SF_Replicate 'TSAC_MIGR', 'ACCOUNT'


--create Staging Table

SELECT

CAST('' as nchar(18))                                                  		As ID
,CAST('' as nvarchar(255))                                             		As Error
,max(b.Id)																	As rC_Bios__Account__c

,CASE 
when CAST(rtrim(ltrim(dp.NoMail_exp)) as DATE)< GETDATE() THEN 'TRUE'	
ELSE 'FALSE'			
END																			 AS rC_Bios__Active__c
,'FALSE'																	 As rC_Bios__Archive_Flag__c
,max(rtrim(ltrim(dp.nomail )))                                             	 As rC_Bios__Do_Not_Mail__c
,'WUM-'+max(rtrim(ltrim(dpadd.aidnumb )))                                    As rC_Bios__External_ID__c 
,max(rtrim(ltrim(dpadd.city)))                                               As rC_Bios__Original_City__c
,max(rtrim(ltrim(dpadd.ADDLADD)) )                                           As rC_Bios__Original_Extension__c
,max(rtrim(ltrim(dpadd.ZIP)))                                                As rC_Bios__Original_Postal_Code__c
,max(rtrim(ltrim(dpadd.ST)) )                                                As rC_Bios__Original_State__c
,max(rtrim(ltrim(dpadd.[ADD])))                                              As rC_Bios__Original_Street_Line_1__c
,CASE max(rtrim(ltrim(dpadd.PRIORITY)))	
	WHEN '1' THEN 'TRUE'
	WHEN '2' THEN 'FALSE'
	
	END 																		As rC_Bios__Preferred_Billing__c
,CASE max(rtrim(ltrim(dpadd.PRIORITY)))	
	WHEN '1' THEN 'TRUE'
	WHEN '2' THEN 'FALSE'

	END 																		As rC_Bios__Preferred_Shipping__c
,max(substring(rtrim(ltrim(dpadd.add_dt2)),1,2)	)								As rC_Bios__Seasonal_End_Day__c
,max(substring(rtrim(ltrim(dpadd.add_dt2)),4,2))								As rC_Bios__Seasonal_End_Month__c
,max(substring(rtrim(ltrim(dpadd.add_dt1)),1,2))								As rC_Bios__Seasonal_Start_Day__c
,max(substring(rtrim(ltrim(dpadd.add_dt1)),4,2)) 							    As rC_Bios__Seasonal_Start_Month__c
,max(dpadd.cr_dt )                                                              As rC_Bios__Start_Date__c
,CASE
WHEN max(rtrim(ltrim(addtype))) in ('MISC','MMRG','NCOA','OLDA','SATE','SPSE','TSMM','AKAN','MAIL','WNTR') THEN 'Other'
WHEN max(rtrim(ltrim(addtype))) in ('HOME','MAIN') THEN 'HOME'
WHEN max(rtrim(ltrim(addtype)))='WORK' then 'Work'
WHEN max(rtrim(ltrim(addtype)))='VACA' THEN 'Vacation'
END                                                                          	As rC_Bios__Type__c
,'FALSE'                                                                     	As rC_Bios__Apply_To_All_Contacts__c
,max(ltrim(rtrim(dpadd.donor)))													As Donor
INTO [Migration_WUM].dbo.[rC_Bios__Account_Address__c_Load]
from[WUM_UAT1].dbo.dpadd
left join
[WUM_UAT1].dbo.dp
on ltrim(rtrim(dpadd.donor))=ltrim(rtrim(dp.donor2))
LEft join
[Migration_WUM].dbo.Account_Load_WUM b
on b.donor=ltrim(rtrim(dpadd.donor))
where dpadd.donor!='' and dpadd.lname!=''
group by [add],dp.NoMail_exp

order by [rC_Bios__Account__c],rC_Bios__Original_Postal_Code__c






---Insert/Update records
--use [Migration_WUM]
--Exec SF_BulkOps 'Insert:bulkapi,parallel,Batchsize(10000)', 'TSAC_MIGR', 'rC_Bios__Account_Address__c_Load'


--check errors
--select error from rC_Bios__Account_Address__c_Load where error not like '%Operation%'

-- Replicate Data
--use [Migration_target_QA]
--exec SF_Refresh 'TSAC_MIGR', 'rC_Bios__Account_Address__c','YES'



