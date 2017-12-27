-- Drop staging tables
drop table [Migration_METRO].dbo.rC_Giving__Payment_Method__c_Load

--Replicate Data

--USe [Migration_Target_QA]

--exec SF_Replicate 'TSAC_MIGR', 'Account'
--exec SF_Replicate 'TSAC_MIGR', 'USER'



--create Staging Table


select
CAST('' as nchar(18))                                                  			As ID
,CAST('' as nvarchar(255))                                            			As Error
,'0053D000000INtD'																As OwnerId
,CASE 
WHEN rtrim(ltrim(g.gifttype)) in ('AC',	'AM','AX-IC','AX-WL','IA','AE','BD-IC',	'BD-WL','CC','DI','DI-IC','DI-WL','ID','IC','IM','IN','IV','MC','MC-IC','MC-WL','VC','VI','VS-IC','VS-WL','CB') THEN 'Third Party Charge'
WHEN rtrim(ltrim(g.gifttype)) ='AD' THEN 'Other'
WHEN rtrim(ltrim(g.gifttype)) IN('CA','CK','BC','MO','OG') THEN 'Cash/Check'
WHEN rtrim(ltrim(g.gifttype))='PP' THEN 'PayPal'
WHEN rtrim(ltrim(g.gifttype))='ST' THEN 'Securities'
WHEN rtrim(ltrim(g.gifttype))IN('AX-ET','BD-ET','DI-ET','VS-ET','MC-ET','WI') THEN 'EFT'
END 																				As Name
,CASE 
WHEN rtrim(ltrim(g.gifttype)) in ('AC','AM','AX-IC','AX-WL','IA','AE','BD-IC','BD-WL','CC','DI','DI-IC','DI-WL','ID','IC','IM','IN','IV','MC','MC-IC','MC-WL','VC','VI','VS-IC','VS-WL','CB') then(SELECT Id 
FROM [Migration_Target_QA].dbo.RecordType WHERE SobjectType = 'rC_Giving__Payment_Method__c'and Name='Third Party Charge' )

WHEN rtrim(ltrim(g.gifttype)) ='AD' THEN (SELECT Id 
FROM [Migration_Target_QA].dbo.RecordType WHERE SobjectType = 'rC_Giving__Payment_Method__c'and Name='Other')
WHEN rtrim(ltrim(g.gifttype)) IN('CA','CK','BC','MO','OG') THEN (SELECT Id 
FROM [Migration_Target_QA].dbo.RecordType WHERE SobjectType = 'rC_Giving__Payment_Method__c'and Name='Cash/Check')
WHEN rtrim(ltrim(g.gifttype))='PP' THEN (SELECT Id 
FROM [Migration_Target_QA].dbo.RecordType WHERE SobjectType = 'rC_Giving__Payment_Method__c'and Name='PayPal')
WHEN rtrim(ltrim(g.gifttype))='ST' THEN (SELECT ID
FROM [Migration_Target_QA].dbo.RecordType WHERE SobjectType = 'rC_Giving__Payment_Method__c'and Name='Securities')
WHEN rtrim(ltrim(g.gifttype)) in ('AX-ET','BD-ET','DI-ET','MC-ET','VS-ET','WI') THEN (SELECT ID
FROM [Migration_Target_QA].dbo.RecordType WHERE SobjectType = 'rC_Giving__Payment_Method__c'and Name='EFT')
END																						AS RecordTypeID
,a.id																				As rC_Giving__Account__c
,'TRUE'																				As rC_Giving__Is_Active__c
,'FALSE'																			as rC_Giving__archive_flag__c
,CASE 
WHEN rtrim(ltrim(g.gifttype)) in ('AC',	'AM','AX-IC','AX-WL','IA','AE') THEN 'American Express'
WHEN rtrim(ltrim(g.gifttype)) in('DI','DI-IC','DI-WL','ID')             THEN 'Discover'
WHEN rtrim(ltrim(g.gifttype)) in('IM','MC','MC-IC','MC-WL')             THEN 'MasterCard'
WHEN rtrim(ltrim(g.gifttype)) in('IV','VC','VI','VS-IC','VS-WL')        THEN 'Visa'
WHEN rtrim(ltrim(g.gifttype)) ='CB'                                     THEN 'Credit Card'
END																					As rC_Giving__Card_Issuer__c

,CASE
WHEN rtrim(ltrim(g.gifttype))='AX-ET'     								THEN 'American Express EFT'
WHEN rtrim(ltrim(g.gifttype))='AD'        								THEN 'Advisory'
WHEN rtrim(ltrim(g.gifttype))='CA'        								THEN 'Cash'
WHEN rtrim(ltrim(g.gifttype))='CK'        								THEN 'Check'
WHEN rtrim(ltrim(g.gifttype))='BC'        								THEN 'Bank Check'
WHEN rtrim(ltrim(g.gifttype))='BD-ET'     								THEN 'Bank Draft EFT'
WHEN rtrim(ltrim(g.gifttype))='DI-ET'     								THEN 'Discover EFT'
WHEN rtrim(ltrim(g.gifttype))='MC-ET'     								THEN 'MasterCard EFT'
WHEN rtrim(ltrim(g.gifttype))='MO'        								THEN 'Money Order'
WHEN rtrim(ltrim(g.gifttype))='OG'        								THEN 'Outright Gift'
WHEN rtrim(ltrim(g.gifttype))='PP'        								THEN 'Pay Pal'
WHEN rtrim(ltrim(g.gifttype))='ST'        								THEN 'Stock'
WHEN rtrim(ltrim(g.gifttype))='VS-ET'     								THEN 'Visa EFT'
WHEN rtrim(ltrim(g.gifttype))='WI'        								THEN 'Wire Transfer'

END 																				As rC_Giving__Comments__c



,CASE 
WHEN rtrim(ltrim(g.gifttype)) in ('AC',	'AM','AX-IC','AX-WL','IA','AE','BD-IC',	'BD-WL','CC','DI','DI-IC','DI-WL','ID','IC','IM','IN','IV','MC','MC-IC','MC-WL','VC','VI','VS-IC','VS-WL','CB') THEN 'Third Party Charge'
WHEN rtrim(ltrim(g.gifttype)) ='AD' THEN 'Other'
WHEN rtrim(ltrim(g.gifttype)) IN('CA','CK','BC','MO','OG') THEN 'Cash/Check'
WHEN rtrim(ltrim(g.gifttype))='PP' THEN 'PayPal'
WHEN rtrim(ltrim(g.gifttype))='ST' THEN 'Securities'
WHEN rtrim(ltrim(g.gifttype))IN('AX-ET','BD-ET','DI-ET','VS-ET','MC-ET','WI') THEN 'EFT'
END 																				As rC_Giving__Payment_Type__c

,rtrim(ltrim(g.donor))																As donor 
,rtrim(ltrim(g.gifttype))                                                           As gifttype
 
 
INTO [Migration_METRO].dbo.[rC_Giving__Payment_Method__c_Load]
 
 from (SELECT distinct DONOR, GIFTTYPE FROM [METRO_UAT1].dbo.DPGIFT WHERE GIFTTYPE IN ('AM',
'CA','CC','CK','DI','IN','PA','MO','UW','VI','DC','MC','IV','IM',
'IA','ID','SZ','ST','IC','AN','BQ','OG','PI','TR','PP','BC','AX-ET','AX-IC','DI-ET','DI-IC','MC-ET',
'MC-IC','VS-ET','VS-IC','BD-ET','BD-IC','AX-WL','DI-WL','MC-WL','VS-WL','BD-WL','UN')
																	
)g
left join
[Migration_METRO].dbo.[Account_stage_metro] a
on rtrim(ltrim(a.donor))=rtrim(ltrim(g.donor))
order by rC_Giving__Account__c

--- Insert/Update records
use [Migration_METRO]
Exec SF_BulkOps 'Insert:bulkapi,Parallel,Batchsize(10000)', 'TSAC_MIGR', 'rC_Giving__Payment_Method__c_Load'


---check errors

--select count(*) from [Migration_WUM].dbo.[rC_Giving__Payment_Method__c_Load] where error not like'%Op%'



 ----Replicate Data
--use [Migration_Target_QA]
--exec SF_Refresh 'TSAC_MIGR', 'rC_Giving__Payment_Method__c','Yes'

