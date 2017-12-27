 -- Drop staging tables
drop table [Migration_WUM].dbo.Opportunity_INKIND
--Replicate Data

--USe [Migration_Target_QA]
--exec SF_Replicate 'TSAC_MIGR', 'Account'
--exec SF_Replicate 'TSAC_MIGR', 'USER'
--exec SF_Replicate 'TSAC_MIGR', 'Contact'


--create Staging Table

---INKIND


SELECT

CAST('' as nchar(18))                                                  As ID
,CAST('' as nvarchar(255))                                             As Error
,'Migration'															As Acknowledgement_Path__c
,GETDATE()																as Acknowledgement_Path_Date__c
,'C'+ xx.CHAPTERGFT															As Revenue_Location_Code__c
,a.ID																	As AccountId
,rtrim(ltrim(xx.fmv))												    As Amount
,cast(rtrim(ltrim(xx.[DATE]))as datetime2)								As CloseDate
 																	

,Concat(a.Name,' ','IN KIND',' ', LEFT(CONVERT(VARCHAR, rtrim(ltrim(xx.[DATE])), 120),4)) As Name
																	
,'0053D000000INtD'														As OwnerID
,(SELECT Id FROM [Migration_Target_QA].dbo.RecordType WHERE SobjectType = 'Opportunity' AND Name = 'Inkind') As RecordTypeId
,CAST('' as nvarchar(255))												As CampaignId
,'FALSE'																as IsPrivate
,'COMPLETED'																As StageName
,CASE rtrim(ltrim(xx.tyletter))
WHEN '00' THEN 'FALSE'
WHEN  '81' THEN 'FLASE'
Else 'TRUE'
END																		As rC_Giving__Acknowledged__c 
		
,rtrim(ltrim(xx.TY_DT))																As rC_Giving__Acknowledged_Date__c
,'IN KIND'																As rC_Giving__Activity_Type__c
,CAST('' as nvarchar(25))												As rC_Giving__Anniversary_Date__c
,CAST('' as nvarchar(25))												As rC_Giving__Anniversary_Renewal_Date__c
,CAST('' as nvarchar(25))												AS rC_Giving__Annual_Giving_Amount__c
												
															
,'FALSE'																As rC_Giving__Archive_Flag__c
,'NEW'																	As rC_Giving__Calculated_Giving_Type__c
,'Calendar Year'														As rC_Giving__Giving_Type_Engine__c
,rtrim(ltrim(xx.checknbr))												As rC_Giving__Check_Number__c
,rtrim(ltrim(xx.fmv))													As rC_Giving__Closed_Amount__c

,CAST(rtrim(ltrim(xx.GNARR)) As nvarchar(max))												As rC_Giving__Comments__c
,rtrim(ltrim(xx.fmv))												As rC_Giving__Current_Giving_Amount__c
,CAST('' as nvarchar(255))												As rC_Giving__Expected_Giving_Amount__c
,'WUM-INKIND-'+rtrim(ltrim(xx.GIDNUMB))										As External_id__c
,'FALSE'																	as rC_Giving__Is_Canceled__c
,'FALSE'															As rC_Giving__Is_Completed__c
,'False'															as rC_Giving__Is_Suspended__c
,'FALSE'														as rC_Giving__Is_Uncollectible__c
--Fill Rate
,'False'																As rC_Giving__Is_Giving__c

														
,CAST('' as nvarchar(255))												As rC_Giving__Giving_Amount__c
,'False'																As rC_Giving__Is_Giving_Donation__c
,rtrim(ltrim(xx.freq))											  		  As rC_Giving__Giving_Frequency__c
,'TRUE'															        As rC_Giving__Is_Giving_Inkind__c
,'FALSE'																As rC_Giving__Is_Giving_Membership__c
,'False'																AS rC_Giving__Is_Giving_Purchase__c
,'False'																as rC_Giving__Is_Giving_Transaction__c
,'NEW'																	as rC_Giving__Giving_Type__c

,CAST('' as nvarchar(50))												As rC_Giving__Giving_Years__c
,'0'																	As rC_Giving__Last_Giving_Amount_Adjustment__c
,CASE 
WHEN substring(rtrim(ltrim(xx.sol)),3,2)='MG' THEN 'True'
Else 'False'
END																		As rC_Giving__Is_Matching__c
,cast('' as nvarchar(25))												as rC_Giving__Matching_Account__c
,cast('' as nvarchar(25))												as rC_Giving__Matching_Amount__c

,'APPROVED'																As rC_Giving__Matching_Status__c
,cast('' as nvarchar(25))												As rC_Giving__Parent__c
,cast('' as nvarchar(25)) 													as rC_Giving__Parent_Name__c
,cast('' as nvarchar(25))												as rC_Giving__Matching_Opportunity__c
,cast('' as nvarchar(255))												As rC_Giving__Payer_Name__c
,cast('' as nvarchar(25))														As rC_Giving__Payment_Count__c
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
,Case 
When rtrim(ltrim(xx.Gifttype))IN('CA','CK','MO','BC',' ') THEN 'Cash/Check'
When rtrim(ltrim(xx.Gifttype)) in('AX-ET',
'DI-ET',
'MC-ET',
'VS-ET',
'BD-ET') THEN 'EFT'

When rtrim(ltrim(xx.Gifttype)) in ('IK',
'PA',
'UW',
'SZ',
'MG',
'AN',
'BQ',
'OG',
'PI',
'TR',
'UN'
) THEN 'Other'

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

END 																As rC_Giving__Payment_Method__c

,Case rtrim(ltrim(xx.Gifttype))
WHEN 'ST' THEN rtrim(ltrim(xx.Amt))
Else ''
End 																As rC_Giving__Realized_Amount__c
,rtrim(ltrim(xx.[DATE]))											As rC_Giving__Realized_Date__c
,p.ID																As rC_Giving__Payment_Method_Selected__c
,rtrim(ltrim(xx.SOL)) 												as rC_Giving__Source_Code__c
,'FALSE'															As rC_Giving__Is_Sustainer__c
,rtrim(ltrim(xx.fmv)) 											as rC_Giving__Tax_Deductible_Amount__c	
,'PAYMENT'																as rC_Giving__Transaction_Type__c
,CASE
WHEN rtrim(ltrim(xx.NAMETYPE))IN('H','M','S','O','T') THEN 'TRUE'
Else 'FALSE'
END 																As rC_Giving__Is_Tribute__c
,CONCAT(rtrim(ltrim(xx.GFNAME)),' ' ,rtrim(ltrim(xx.GLNAME))) 		As rC_Giving__Tribute_Comments__c
,CASE rtrim(ltrim(xx.NAMETYPE))
WHEN 'H' THEN 'In Honor'
WHEN 'M' THEN 'In Memory'
WHEN 'G' THEN 'Guest'
WHEN 'N' THEN 'None'
WHEN 'O' THEN 'On Behalf Of'
WHEN 'T' then 'Generosity Of'
WHEn 'S' THEN 'In Support Of'
WHEN 'Z' THEN 'Matching Gift'
END 																As rC_Giving__Tribute_Type__c
,rtrim(ltrim(xx.donor))												as donor
,cast('' as nvarchar(100))											as rc_giving__Matching_Notice__c 
,rtrim(ltrim(xx.SOL))												as Legacy_Source_Code__c
,rtrim(ltrim(xx.sol)) as sol
INTO [Migration_WUM].dbo.[opportunity_INKIND]
from
[WUM_UAT1].dbo.dpgift
xx
Left join
[Migration_DataUpdate].dbo.Account_Load a
ON a.donor=rtrim(ltrim(xx.donor))

Left join
[Migration_DataUpdate].[dbo].[rC_Giving__Payment_Method__c_Load]p
ON p.donor=rtrim(ltrim(xx.donor))
and p.gifttype=xx.gifttype

WHERE xx.gifttype = 'IK'


----



--UPDATEING rC_Giving__Matching_Account__c
---------------------------------------------------------------------------------------------------------------------------------
-- update  [Migration_WUM].dbo.[opportunity_INKIND] 
-- set rC_Giving__Matching_Account__c= a.ID from 
-- (Select gidnumb, glink,donor from [WUM_UAT1].dbo.dpgift 
-- where glink != gidnumb and glink != '0' )xx
-- left join
-- Migration_WUM.dbo.Account_Load_WUM a
-- on a.Donor=rtrim(ltrim(xx.donor))


---------------------------------------------------------------------------------------------------------------------------------

--UPDATEING rC_Giving__Payer_Name__c

update [Migration_WUM].dbo.[opportunity_INKIND] 
set rC_Giving__Payer_Name__c=
Concat(rtrim(ltrim(FNAME)),' ',rtrim(ltrim(LNAME)))
from
[WUM_UAT1].dbo.[DPADD] c
left join
[Migration_WUM].dbo.[opportunity_INKIND] oi
on oi.donor=rtrim(ltrim(c.Donor))


----Updating rC_Giving__Matching_Opportunity__c

-- Update a
-- SET a.rC_Giving__Matching_Opportunity__c=y.id 
 -- from 
 -- (Select gidnumb, glink,sol,donor,amt from [WUM_UAT1].dbo.dpgift 
-- where glink != gidnumb and glink != '0' and rectype != 'S')xx
-- Left join
-- [Migration_WUM].dbo.[opportunity_INKIND] a
-- on xx.gidnumb=substring(a.[External_id__c],12,Len(a.[External_id__c])) 
-- Left join
-- (select ID,External_id__c from [Migration_WUM].dbo.[opportunity_INKIND]
-- UNION 
-- select ID,External_id__c from [Migration_WUM].dbo.[opportunity_DONATION]
-- UNION
-- select ID,External_id__c from [Migration_WUM].dbo.[opportunity_Pledge]
-- UNION
-- select ID,External_id__c from [Migration_WUM].dbo.[opportunity_Pledge_Payment]) y
-- on substring(a.[External_id__c],12,Len(a.[External_id__c])) =
-- reverse(SUBSTRING(reverse(y.External_id__c),1,charindex('-',reverse(y.External_id__c))-1))
-- where xx.glink=reverse(SUBSTRING(reverse(y.External_id__c),1,charindex('-',reverse(y.External_id__c))-1))
--------------------------------------------------------------------------------------

---update rc_giving__Matching_Notice__c 
-- update [Migration_WUM].dbo.[opportunity_INKIND] 
-- SET rc_giving__Matching_Notice__c=' '
-- from 
-- (Select gidnumb, glink,sol,donor,amt from [WUM_UAT1].dbo.dpgift 
-- where glink != gidnumb and glink != '0'and rectype != 'S' )xx
-- Left join
 -- [Migration_WUM].dbo.[opportunity_INKIND] a
-- on xx.gidnumb=substring([External_id__c],12,Len([External_id__c]))


--------------
--updating rc_giving__is_Matching__C
-- update [Migration_WUM].dbo.[opportunity_INKIND] 
-- set rc_giving__is_Matching__C='TRUE'
-- from 
-- (Select gidnumb, glink,sol,donor,amt from [WUM_UAT1].dbo.dpgift 
-- where glink != gidnumb and glink != '0'and rectype != 'S' )xx
-- Left join
 -- [Migration_WUM].dbo.[opportunity_INKIND] a
-- on xx.gidnumb=substring([External_id__c],12,Len([External_id__c]))






-----update rc_giving__Matching_status__C 

-- update [Migration_WUM].dbo.[opportunity_INKIND] 
-- set rc_giving__Matching_status__C='Approved'
-- from 
-- (Select gidnumb, glink,sol,donor,amt from [WUM_UAT1].dbo.dpgift 
-- where glink != gidnumb and glink != '0'and rectype != 'S' )xx
-- Left join
 -- [Migration_WUM].dbo.[opportunity_INKIND] a
-- on xx.gidnumb=substring([External_id__c],12,Len([External_id__c]))

--------------------------
--UPDATEING rC_Giving__Matching_Amount__c
-------------------------------------------------------------------------------------------------------------------------------
-- update  [Migration_WUM].dbo.[opportunity_INKIND] 
-- set rC_Giving__Matching_Amount__c =y.Amt 
 -- from 
 -- (Select gidnumb, glink,sol,donor,amt from [WUM_UAT1].dbo.dpgift 
-- where glink != gidnumb and glink != '0' and rectype != 'S')xx
-- Left join
-- [Migration_WUM].dbo.[opportunity_INKIND] a


-- on xx.gidnumb=substring(a.[External_id__c],12,Len(a.[External_id__c])) 
-- Left join
-- (select ID,External_id__c from [Migration_WUM].dbo.[opportunity_INKIND]
-- UNION 
-- select ID,External_id__c from [Migration_WUM].dbo.[opportunity_DONATION]
-- UNION
-- select ID,External_id__c from [Migration_WUM].dbo.[opportunity_Pledge]
-- UNION
-- select ID,External_id__c from [Migration_WUM].dbo.[opportunity_Pledge_Payment]) y
-- on substring(a.[External_id__c],12,Len(a.[External_id__c])) =
-- reverse(SUBSTRING(reverse(y.External_id__c),1,charindex('-',reverse(y.External_id__c))-1))
-- where xx.glink=reverse(SUBSTRING(reverse(y.External_id__c),1,charindex('-',reverse(y.External_id__c))-1))




--- Insert/Update records
use [Migration_WUM]
exec SF_BulkOps 'Insert:bulkapi,Parallel,batchsize(10000)','TSAC_MIGR','opportunity_INKIND'


---check errors

---select count(*) from [Migration_WUM].dbo.[Opportunity_INKIND] where error not like'%Op%'





-- Replicate Data
--use [Migration_Target_QA]
--exec SF_Refresh 'TSAC_MIGR', 'Opportunity','YES'








