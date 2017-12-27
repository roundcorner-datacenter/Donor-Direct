-- Drop staging tables
drop table [Migration_WUM].dbo.rC_Giving__Payment_Method__c_Load_WUM

--Replicate Data

--USe [Migration_target_QA]

--exec SF_Replicate 'TSAC_MIGR', 'Account'
--exec SF_Replicate 'TSAC_MIGR', 'USER'



--create Staging Table
SELECT

CAST('' as nchar(18))                                                  				As ID
,CAST('' as nvarchar(255))                                            				As Error
,'0053D000000INtD'																	As OwnerId
,CASE 
WHEN rtrim(ltrim(g.gifttype))in('AM','CC','DI','IN','VI','DC','MC','IV','IM','IA','ID','IC','AX-IC','DI-IC','MC-IC','VS-IC') THEN 'Third Party Charge'
WHEN rtrim(ltrim(g.gifttype))in('BC','BD-IC','CA','CK','MO') then 'Cash/Check'
WHEN rtrim(ltrim(g.gifttype)) IN('AX-ET','DI-ET','MC-ET','VS-ET','BD-ET') THEN 'EFT'
WHEN rtrim(ltrim(g.gifttype))='PP' then 'PayPal'
WHEN rtrim(ltrim(g.gifttype))='ST' then 'Securities'
WHEN rtrim(ltrim(g.gifttype))IN('IK','PA','WB','UW','SZ','MG','AN','BQ','OG','PI','TR','KC','AX-WL','DI-WL','MC-WL','VS-WL','BD-WL') then 'Other'

END 																				As Name
,CASE
WHEN rtrim(ltrim(g.gifttype))in('AM','CC','DI','IN','VI','DC','MC','IV','IM','IA','ID','IC','AX-IC','DI-IC','MC-IC','VS-IC')THEN(select id FROM [Migration_target_QA].dbo.RecordType  WHERE SobjectType = 'rC_Giving__Payment_Method__c' and Name ='Third Party Charge')
WHEN rtrim(ltrim(g.gifttype))in('BC','BD-IC','CA','CK','MO')THEN(select id FROM [Migration_target_QA].dbo.RecordType  WHERE SobjectType = 'rC_Giving__Payment_Method__c' and Name ='Cash/Check')
	
WHEN rtrim(ltrim(g.gifttype)) IN('AX-ET','DI-ET','MC-ET','VS-ET','BD-ET') THEN (select id FROM [Migration_target_QA].dbo.RecordType  WHERE SobjectType = 'rC_Giving__Payment_Method__c' and Name ='EFT')	
		
WHEN rtrim(ltrim(g.gifttype))='PP'	THEN (select id FROM [Migration_target_QA].dbo.RecordType  WHERE SobjectType = 'rC_Giving__Payment_Method__c' and Name ='PayPal')	
	
WHEN rtrim(ltrim(g.gifttype))='ST'THEN (select id FROM [Migration_target_QA].dbo.RecordType  WHERE SobjectType = 'rC_Giving__Payment_Method__c' and Name ='Securities')
WHEN rtrim(ltrim(g.gifttype))IN('IK','PA','WB','UW','SZ','MG','AN','BQ','OG','PI','TR','KC','AX-WL','DI-WL','MC-WL','VS-WL','BD-WL')	
THEN (select id FROM [Migration_target_QA].dbo.RecordType  WHERE SobjectType = 'rC_Giving__Payment_Method__c' and Name ='Other')					
END																					AS RecordTypeID
,a.id																				As rC_Giving__Account__c
,'TRUE'																				As rC_Giving__Is_Active__c
,'FALSE'																			as rC_Giving__archive_flag__c
,CASE
WHEN  rtrim(ltrim(g.gifttype)) in('AM','IA','AX-IC') THEN 'American Express'
WHEN rtrim(ltrim(g.gifttype))in('DI','DC','ID')THEN 'Discover'
WHEN rtrim(ltrim(g.gifttype)) in('IV','VI','VS-IC') THEN 'Visa'
WHEN rtrim(ltrim(g.gifttype)) IN('MC','IM','MC-IC') THEN 'Mastercard'
END																					As rC_Giving__Card_Issuer__c
,CASE 
WHEN rtrim(ltrim(g.gifttype))='AM'		 THEN 'American Express'
WHEN rtrim(ltrim(g.gifttype))='CC'  	 THEN 'Credit Card'
WHEN rtrim(ltrim(g.gifttype)) in('DC','DI')   THEN 'Discover'
WHEN rtrim(ltrim(g.gifttype))='IN'   	THEN 'Internet: Credit Card'
WHEN rtrim(ltrim(g.gifttype))='VI'   	THEN 'Visa'
WHEN rtrim(ltrim(g.gifttype))='MC'   	THEN 'Mastercard'
WHEN rtrim(ltrim(g.gifttype))='IV'   	THEN 'Internet: Visa'
WHEN rtrim(ltrim(g.gifttype))='IM'   	THEN 'Internet: Mastercard'
WHEN rtrim(ltrim(g.gifttype))='IA'   	THEN 'Internet: Amex'
WHEN rtrim(ltrim(g.gifttype))='ID'   	THEN 'Internet: Discover'
WHEN rtrim(ltrim(g.gifttype))='IC'   	THEN 'Credit Card - Insta-Charge'
WHEN rtrim(ltrim(g.gifttype))='AX-IC'   THEN 'American Express Insta-Charge'
WHEN rtrim(ltrim(g.gifttype))='DI-IC'   THEN 'Discover Insta-Charge'
WHEN rtrim(ltrim(g.gifttype))='MC-IC'   THEN 'MasterCard Insta-Charge'
WHEN rtrim(ltrim(g.gifttype))='VS-IC'   THEN 'Visa Insta-Charge'
END																					As rC_Giving__Comments__c
,CASE 
WHEN rtrim(ltrim(g.gifttype))in('AM','CC','DI','IN','VI','DC','MC','IV','IM','IA','ID','IC','AX-IC','DI-IC','MC-IC','VS-IC') THEN 'Third Party Charge'
WHEN rtrim(ltrim(g.gifttype))in('BC','BD-IC','CA','CK','MO') then 'Cash/Check'
WHEN rtrim(ltrim(g.gifttype)) IN('AX-ET','DI-ET','MC-ET','VS-ET','BD-ET') THEN 'EFT'
WHEN rtrim(ltrim(g.gifttype))='PP' then 'PayPal'
WHEN rtrim(ltrim(g.gifttype))='ST' then 'Securities'
WHEN rtrim(ltrim(g.gifttype))IN('IK','PA','WB','UW','SZ','MG','AN','BQ','OG','PI','TR','KC','AX-WL','DI-WL','MC-WL','VS-WL','BD-WL') then 'Other'
END									As rC_Giving__Payment_Type__c

,rtrim(ltrim(g.donor))																as donor
,rtrim(ltrim(g.gifttype))																as gifttype

into [Migration_WUM].dbo.[rC_Giving__Payment_Method__c_Load_WUM]

								
from (SELECT distinct DONOR, GIFTTYPE FROM [WUM_UAT1].dbo.dpgift WHERE GIFTTYPE IN ('AM',
'CA',
'CC',
'CK',
'DI',
'IN',
'PA',
'WB',
'MO',
'UW',
'ST',
'VI',
'DC',
'MC',
'IV',
'IM',
'IA',
'ID',
'SZ',
'ST',
'IC',
'AN',
'BQ',
'OG',
'PI',
'TR',
'KC',
'PP',
'BC',
'AX-ET',
'AX-IC',
'DI-ET',
'DI-IC',
'MC-ET',
'MC-IC',
'VS-ET',
'VS-IC',
'BD-ET',
'BD-IC',
'AX-WL',
'DI-WL',
'MC-WL',
'VS-WL',
'BD-WL'))
g
left join
[Migration_WUM].dbo.[Account_Load_wum] a
on rtrim(ltrim(a.donor))=rtrim(ltrim(g.donor))
where rtrim(ltrim(g.donor))!=''
order by rC_Giving__Account__c




--- Insert/Update records
use [Migration_WUM]
Exec SF_BulkOps 'Insert:bulkapi,parallel,Batchsize(10000)', 'TSAC_MIGR', 'rC_Giving__Payment_Method__c_Load_WUM'


---check errors

select * from [Migration_WUM].dbo.[rC_Giving__Payment_Method__c_Load_WUM] where error not like'%Op%'



 ----Replicate Data
use [Migration_target_QA]
exec SF_Refresh 'TSAC_MIGR', 'rC_Giving__Payment_Method__c','Yes'



