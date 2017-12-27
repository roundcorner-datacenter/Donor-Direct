 -- Drop staging tables
drop table [Migration_WUM].dbo.Opportunity_DONATION
--Replicate Data

--USe [Migration_Target_QA_QA]
--exec SF_Replicate 'TSAC_MIGR', 'Account'
--exec SF_Replicate 'TSAC_MIGR', 'USER'
--exec SF_Replicate 'TSAC_MIGR', 'Contact'


--create Staging Table
--DONATIONS

SELECT

CAST('' as nchar(18))                                                  As ID
,CAST('' as nvarchar(255))                                             As Error
,'Migration'															As Acknowledgement_Path__c
,GETDATE()																as Acknowledgement_Path_Date__c
,'C' + xx.CHAPTERGFT													As Revenue_Location_Code__c
,a.ID																	As AccountId
,'0'																	As Amount
,rtrim(ltrim(xx.[DATE]))												As CloseDate
,Concat(a.Name,' ','DONATION',' ',LEFT(CONVERT(VARCHAR, rtrim(ltrim(xx.[DATE])), 120),4)) As Name
																	
,'0053D000000IrLq'														As OwnerId
,(SELECT Id FROM [Migration_Target_QA].dbo.RecordType WHERE SobjectType = 'Opportunity' AND Name = 'Donation') As RecordTypeId
,c.ID																	As CampaignId
,'FALSE'																as IsPrivate
,'COMPLETED'																As StageName
,CASE rtrim(ltrim(xx.tyletter))
WHEN '00' THEN 'FALSE'
WHEN  '81' THEN 'FLASE'
Else 'TRUE'
END																		As rC_Giving__Acknowledged__c 
																	
,rtrim(ltrim(xx.TY_DT))													As rC_Giving__Acknowledged_Date__c
,'DONATION'																As rC_Giving__Activity_Type__c
,CAST('' as nvarchar(25))											    As rC_Giving__Anniversary_Date__c
,CAST('' as nvarchar(25))												As rC_Giving__Anniversary_Renewal_Date__c
,CAST('' as nvarchar(25))												AS rC_Giving__Annual_Giving_Amount__c
,'FALSE'																As rC_Giving__Archive_Flag__c

,'NEW'																	As rC_Giving__Calculated_Giving_Type__c
,'Calendar Year'														As rC_Giving__Giving_Type_Engine__c
,rtrim(ltrim(xx.checknbr))												As rC_Giving__Check_Number__c
,rtrim(ltrim(xx.amt))													As rC_Giving__Closed_Amount__c

,CAST(rtrim(ltrim(xx.GNARR))as nvarchar(MAX))							As rC_Giving__Comments__c
,rtrim(ltrim(xx.amt))													As rC_Giving__Current_Giving_Amount__c
,rtrim(ltrim(xx.amt))													As rC_Giving__Expected_Giving_Amount__c
,'WUM-DONATION-'+rtrim(ltrim(xx.GIDNUMB))										As External_id__c
,'FALSE'																As rC_Giving__Is_Canceled__c
,'FALSE'																As rC_Giving__Is_Completed__c
,'FALSE'																As rC_Giving__Is_Suspended__c
,'FALSE'																As rC_Giving__Is_Uncollectible__c

,'True'																	As rC_Giving__Is_Giving__c
,rtrim(ltrim(xx.amt))													As rC_Giving__Giving_Amount__c
,'TRUE'																	As rC_Giving__Is_Giving_Donation__c
,rtrim(ltrim(xx.freq))													As rC_Giving__Giving_Frequency__c
																	   
,'False'															    As rC_Giving__Is_Giving_Inkind__c
,'FALSE'																As rC_Giving__Is_Giving_Membership__c
,'False'																AS rC_Giving__Is_Giving_Purchase__c
,'False'																as rC_Giving__Is_Giving_Transaction__c
,'NEW'																	as rC_Giving__Giving_Type__c

,'1'																	As rC_Giving__Giving_Years__c
,'0'																	As rC_Giving__Last_Giving_Amount_Adjustment__c
,CAST('' as nvarchar(255))												As rC_Giving__Is_Matching__c
,CAST('' as nvarchar(255))                                         		As rC_Giving__Matching_Account__c
,CAST('' as nvarchar(255))                                         		As rC_Giving__Matching_Amount__c
,CAST('' as nvarchar(255))												as rC_Giving__Matching_Opportunity__c
,CAST('' as nvarchar(255))												As rC_Giving__Matching_Status__c
,CAST('' as nvarchar(255))												As rC_Giving__Parent__c
,CAST('' as nvarchar(255))							    				As rC_Giving__Payer_Name__c
,'1'																	As rC_Giving__Payment_Count__c
,CASE rtrim(ltrim(xx.freq))
WHEN '?' THEN 'Irregular'
WHEN '2' THEN 'Bi-monthly'
WHEN 'A' THEN 'Annually'
WHEN 'M' THEN 'Monthly'	
WHEN 'Q' THEN 'Quarterly'
WHEN 'S' THEN 'Semi-Annually'	
WHEN 'U' THEN 'Irregular'
WHEN 'Z' THEN 'Irregular'
WHEN 'D' THEN 'Semi-Monthly'	
WHEN 'W' THEN 'Weekly'
WHEN 'E' THEN 'Bi-Weekly'	
WHEN 'P' THEN 'Irregular'

END																		As rC_Giving__Payment_Frequency__c												
,CASE
When rtrim(ltrim(xx.Gifttype))='PP' THEN 'Paypal'
When rtrim(ltrim(xx.Gifttype))in(
'AM',
'CC',
'DI',
'IN',
'VI',
'DC',
'MC',
'IV',
'IM',
'IA',
'ID',
'IC',
'AX-IC',
'DI-IC',
'MC-IC',
'VS-IC','BD-IC','AX-WL','MC-WL','VS-WL','BD-WL') THEN 'Third Party Charge'
When rtrim(ltrim(xx.Gifttype))='ST' then 'Securities'
WHEN rtrim(ltrim(xx.Gifttype)) IN('') then 'Voucher'
When rtrim(ltrim(xx.Gifttype)) in('CA','CK','MO','KC','BC',' ')THEN 'Cash/Check'
When rtrim(ltrim(xx.Gifttype)) in('AX-ET',' DI-ET','MC-ET','VS-ET','BD-ET') THEN 'EFT'
WHEN rtrim(ltrim(xx.Gifttype)) =' ' THEN 'Charge Card'
WHEN rtrim(ltrim(xx.Gifttype))IN('IK',
'PA',
'UW',
'SZ',
'MG',
'AN',
'BQ',
'OG',
'PI',
'TR',
'UN')THEN 'Other'
END 																As rC_Giving__Payment_Method__c

,Case rtrim(ltrim(xx.Gifttype))
WHEN 'ST' THEN rtrim(ltrim(xx.Amt))
Else ''
End 																As rC_Giving__Realized_Amount__c
,rtrim(ltrim(xx.[DATE]))											As rC_Giving__Realized_Date__c
,p.ID																As rC_Giving__Payment_Method_Selected__c
,rtrim(ltrim(xx.SOL))												as rC_Giving__Source_Code__c
,'FALSE'															As rC_Giving__Is_Sustainer__c
,rtrim(ltrim(xx.FMV))												as rC_Giving__Tax_Deductible_Amount__c
,'PAYMENT'															as rC_Giving__Transaction_Type__c
,CASE 
WHEN rtrim(ltrim(xx.NAMETYPE))IN('H','M','S','O','T' )THEN 'True'

Else 'FALSE'
END 																As rC_Giving__Is_Tribute__c
,CONCAT(rtrim(ltrim(xx.GFNAME)),' ',rtrim(ltrim(xx.GLNAME))) 		As rC_Giving__Tribute_Comments__c
,CASE rtrim(ltrim(xx.NAMETYPE))
WHEN 'H' THEN 'In Honor'
WHEN 'M' THEN 'In Memory'
WHEN 'N' THEN 'None'
WHEN 'G' THEN 'Guest'
WHEN 'O' THEN 'On Behalf Of'
WHEN 'T' then 'Generosity Of'
WHEn 'S' THEN 'In Support Of'
WHEN 'Z' THEN 'Matching Gift'
END 																As rC_Giving__Tribute_Type__c
,rtrim(ltrim(xx.donor))												as donor
,cast('' as nvarchar(100))											as rc_giving__Matching_Notice__c 
,rtrim(ltrim(xx.SOL)) as Sol
,rtrim(ltrim(xx.SOL))												as Legacy_Source_Code__c	
INTO [Migration_WUM].dbo.[opportunity_donation] 
FROM
[WUM_UAT1].dbo.dpgift
xx
Left join
[Migration_WUM].dbo.Account_Load_WUM a
ON a.donor=rtrim(ltrim(xx.donor))

Left join
[Migration_WUM].[dbo].[rC_Giving__Payment_Method__c_Load_WUM]p
ON p.donor=rtrim(ltrim(xx.donor))and p.gifttype=xx.gifttype
Left join
[Migration_WUM].[dbo].[Campaign_Load] c
On substring(c.[Legacy_source_code__c],5,10)=rtrim(ltrim(xx.sol))
WHERE  xx.RECTYPE = 'G' and xx.PLGPMT = 0
order by AccountId,rC_Giving__Payment_Method_Selected__c
--------------------------------------


--UPDATEING rC_Giving__Matching_Account__c
---------------------------------------------------------------------------------------------------------------------------------
-- update  [Migration_WUM].dbo.[opportunity_donation] 
-- set rC_Giving__Matching_Account__c= a.ID from 
-- (Select gidnumb, glink,donor from [WUM_UAT1].dbo.dpgift 
-- where glink != gidnumb and glink != '0' )xx
-- left join
-- [Migration_WUM].dbo.Account_Load_WUM a
-- on a.Donor=rtrim(ltrim(xx.donor))

--UPDATEING rC_Giving__Payer_Name__c
---------------------------------------------------------------------------------------------------------------------------------
update [Migration_WUM].dbo.[opportunity_donation] 
set rC_Giving__Payer_Name__c=
Concat(rtrim(ltrim(FNAME)),' ',rtrim(ltrim(LNAME)))
from
[WUM_UAT1].dbo.[DPADD] c
left join
[Migration_WUM].dbo.[opportunity_donation] oi
on oi.donor=rtrim(ltrim(c.Donor))


----Updating rC_Giving__Matching_Opportunity__c

-- Update a
-- SET a.rC_Giving__Matching_Opportunity__c=y.id 
-- FROM 
  -- [Migration_WUM].dbo.[opportunity_donation] a
-- Left join
-- (Select gidnumb, glink,sol,donor,amt from [WUM_UAT1].dbo.dpgift 
-- where glink != gidnumb and glink != '0' )xx
-- on xx.gidnumb=substring(a.[External_id__c],14,Len(a.[External_id__c])) 
-- Left join
-- (select ID,External_id__c from [Migration_WUM].dbo.[opportunity_INKIND]
-- UNION 
-- select ID,External_id__c from [Migration_WUM].dbo.[opportunity_DONATION]
-- UNION
-- select ID,External_id__c from [Migration_WUM].dbo.[opportunity_Pledge]
-- UNION
-- select ID,External_id__c from [Migration_WUM].dbo.[opportunity_Pledge_Payment]) y
-- on substring(a.[External_id__c],14,Len(a.[External_id__c])) =
-- reverse(SUBSTRING(reverse(y.External_id__c),1,charindex('-',reverse(y.External_id__c))-1))
-- where xx.glink=reverse(SUBSTRING(reverse(y.External_id__c),1,charindex('-',reverse(y.External_id__c))-1))

----------------------------------------------------------------------------------------

--update rc_giving__Matching_Notice__c 
-- update [Migration_WUM].dbo.[opportunity_donation] 
-- SET rc_giving__Matching_Notice__c=' '
-- from 
-- (Select gidnumb, glink,sol,donor from [WUM_UAT1].dbo.dpgift 
-- where glink != gidnumb and glink != '0' )xx
-- Left join
 -- [Migration_WUM].dbo.[opportunity_donation] a
-- on xx.gidnumb=substring([External_id__c],14,Len([External_id__c]))


----------------
---updating rc_giving__is_Matching__C
-- update [Migration_WUM].dbo.[opportunity_donation] 
-- set rc_giving__is_Matching__C='TRUE'
-- from 
-- (Select gidnumb, glink,sol,donor from [WUM_UAT1].dbo.dpgift 
-- where glink != gidnumb and glink != '0' )xx
-- Left join
 -- [Migration_WUM].dbo.[opportunity_donation] a
-- on xx.gidnumb=substring([External_id__c],14,Len([External_id__c]))


-------update rc_giving__Matching_status__C 

-- update [Migration_WUM].dbo.[opportunity_donation] 
-- set rc_giving__Matching_status__C='Approved'
-- from 
-- (Select gidnumb, glink,sol,donor from [WUM_UAT1].dbo.dpgift 
-- where glink != gidnumb and glink != '0' )xx
-- Left join
 -- [Migration_WUM].dbo.[opportunity_donation] a
-- on xx.gidnumb=substring([External_id__c],14,Len([External_id__c]))

----------------------------
--UPDATEING rC_Giving__Matching_Amount__c
---------------------------------------------------------------------------------------------------------------------------------
-- update  [Migration_WUM].dbo.[opportunity_donation] 
-- set rC_Giving__Matching_Amount__c =y.amt 
-- FROM 
  -- [Migration_WUM].dbo.[opportunity_donation] a
-- Left join
-- (Select gidnumb, glink,sol,donor,amt from [WUM_UAT1].dbo.dpgift 
-- where glink != gidnumb and glink != '0' )xx
-- on xx.gidnumb=substring(a.[External_id__c],14,Len(a.[External_id__c])) 
-- Left join
-- (select ID,External_id__c from [Migration_WUM].dbo.[opportunity_INKIND]
-- UNION 
-- select ID,External_id__c from [Migration_WUM].dbo.[opportunity_DONATION]
-- UNION
-- select ID,External_id__c from [Migration_WUM].dbo.[opportunity_Pledge]
-- UNION
-- select ID,External_id__c from [Migration_WUM].dbo.[opportunity_Pledge_Payment]) y
-- on substring(a.[External_id__c],14,Len(a.[External_id__c])) =
-- reverse(SUBSTRING(reverse(y.External_id__c),1,charindex('-',reverse(y.External_id__c))-1))
-- where xx.glink=reverse(SUBSTRING(reverse(y.External_id__c),1,charindex('-',reverse(y.External_id__c))-1))





--- Insert/Update records
-- use [Migration_WUM]
---exec SF_BulkOps 'Insert:bulkapi,Parallel,batchsize(10000)','TSAC_MIGR','opportunity_donation'


----check errors

-- select count(*) from [Migration_WUM].dbo.[opportunity_Donation] where error not like'%Op%'





-- Replicate Data
-- use [Migration_Target_QA]
-- exec SF_Refresh 'TSAC_MIGR', 'Opportunity','yes'