-- Drop staging tables
drop table [Migration_Metro].dbo.opportunity_DONATION


select
*
INTO [Migration_Metro].dbo.[opportunity_DONATION]
from

(SELECT
CAST ('' as nchar(18))                                                  As ID,
CAST ('' as nvarchar(255))                                              As Error
,'Migration'															As Acknowledgement_Path__c
,GETDATE()																as Acknowledgement_Path_Date__c,
'C' + xx.CHAPTERGFT													    As Revenue_Location_Code__c,
a.ID																	As AccountId,
'0'												                        As Amount,---For DONATION Need to send 0
CAST(rtrim(ltrim(xx.DATE)) as datetime2)							    As CloseDate,---For DONATION Need To send Date
a.Name +'DONATION '+ LEFT(CONVERT(VARCHAR , rtrim(ltrim(xx.DATE)), 120),4)  As [Name],																
'0053D000000INtD'														As OwnerId,
(SELECT Id FROM [Migration_target_QA].dbo.RecordType WHERE 
SobjectType = 'Opportunity' AND Name = 'DONATION')                   As RecordTypeId,
c.ID																	As CampaignId,
'FALSE'																as IsPrivate,
'COMPLETED'																As StageName,
CASE rtrim(ltrim(xx.ACK_FLAG))	
WHEN '' THEN 'FALSE'
ELSE 'TRUE'
END										                                As rC_Giving__Acknowledged__c,
CASE CAST(rtrim(ltrim(xx.TY_DT)) AS Datetime2)	
WHEN '1899-12-30 00:00:00.0000000' THEN NULL	
ELSE CAST(rtrim(ltrim(xx.TY_DT)) AS Datetime2)	
END																		As rC_Giving__Acknowledged_Date__c,
'DONATION'																As rC_Giving__Activity_Type__c,
CAST('' as nvarchar(255) )											    As rC_Giving__Anniversary_Date__c,
CAST('' as nvarchar(255))												As rC_Giving__Anniversary_Renewal_Date__c,

'FALSE'																As rC_Giving__Archive_Flag__c,
'NEW'																	As rC_Giving__Calculated_Giving_Type__c,
--rC_Giving__Campaign_Source_Code__c (Formula Field)
rtrim(ltrim(xx.checknbr))												As rC_Giving__Check_Number__c,
rtrim(ltrim(xx.AMT))												   As rC_Giving__Closed_Amount__c,----Need to populate AMT for Donation

CAST(rtrim(ltrim(xx.GNARR)) As nvarchar(max))							As rC_Giving__Comments__c,
rtrim(ltrim(xx.AMT))												As rC_Giving__Current_Giving_Amount__c,----Need to populate AMT for Donation
CAST(rtrim(ltrim(xx.[DATE])) AS datetime2)	                             As rC_Giving__Close_Date_Time__c,
rtrim(ltrim(xx.AMT))													As rC_Giving__Expected_Giving_Amount__c,----Need to populate AMT for Donation
'METRO-DONATION-'+CAST(rtrim(ltrim(xx.GIDNUMB))	as nvarchar(100))						As External_id__c,
--'FALSE'																as rC_Giving__Is_Canceled__c,
--'FALSE'																As rC_Giving__Is_Completed__c,
--'FALSE'																As rC_Giving__Is_Suspended__c,
--'FALSE'																As rC_Giving__Is_Uncollectible__c,
'TRUE'															    As rC_Giving__Is_Giving__c,
rtrim(ltrim(xx.AMT))											    As rC_Giving__Giving_Amount__c,----Need to populate AMT for Donation
'TRUE'																As rC_Giving__Is_Giving_Donation__c,----TRUE For DONATION
'One Payment'													    As rC_Giving__Giving_Frequency__c,
														
'False'															    As rC_Giving__Is_Giving_Inkind__c,
'FALSE'																As rC_Giving__Is_Giving_Membership__c,
'False'																AS rC_Giving__Is_Giving_Purchase__c,
'False'																as rC_Giving__Is_Giving_Transaction__c,
'NEW'																	as rC_Giving__Giving_Type__c,
'Fiscal Year'															As rC_Giving__Giving_Type_Engine__c,
'1'																	As rC_Giving__Giving_Years__c,
'0'																	As rC_Giving__Last_Giving_Amount_Adjustment__c,
CAST('' as nvarchar(100) )																		As rC_Giving__Is_Matching__c,
CAST('' as nvarchar(100) )																As rC_Giving__Matching_Status__c,
CAST('' as nvarchar(max)) 														As rC_Giving__Payer_Name__c,
'1'																	As rC_Giving__Payment_Count__c,
CAST('' as nvarchar(255) )															As rC_Giving__Payment_Frequency__c,
Case 
When rtrim(ltrim(xx.Gifttype)) in ('CA','CK','  ') THEN 'Cash/Check'
When rtrim(ltrim(xx.Gifttype)) ='BC' THEN 'EFT'
When rtrim(ltrim(xx.Gifttype)) in ('MO', 'AD', 'PH') THEN 'Other'
When rtrim(ltrim(xx.Gifttype))='PP' THEN 'Paypal'
When rtrim(ltrim(xx.Gifttype))in('AE','CB','CC','DI', 'MC','VI') THEN 'Third Party Charge'
When rtrim(ltrim(xx.Gifttype))='ST' then 'Securities'
END 																As rC_Giving__Payment_Method__c

,Case rtrim(ltrim(xx.Gifttype))
WHEN 'ST' THEN rtrim(ltrim(xx.Amt))
Else ''
End 																As rC_Giving__Realized_Amount__c,
CAST(rtrim(ltrim(xx.[DATE])) as datetime2)							As rC_Giving__Realized_Date__c,
p.ID																As rC_Giving__Payment_Method_Selected__c,
CAST('' as nvarchar(255)  )                                         As rC_Giving__Is_Sustainer__c,
'PAYMENT'															as rC_Giving__Transaction_Type__c,
CASE rtrim(ltrim(xx.NAMETYPE))
WHEN 'H' THEN 'True'
WHEN 'M' THEN 'TRUE'
Else 'FALSE'
END 																As rC_Giving__Is_Tribute__c,
CONCAT(rtrim(ltrim(xx.GFNAME)),' ',rtrim(ltrim(xx.GLNAME))) 		As rC_Giving__Tribute_Comments__c,
CASE rtrim(ltrim(xx.NAMETYPE))
WHEN 'H' THEN 'In Honor'
WHEN 'M' THEN 'In Memory'
WHEN 'N' THEN 'NONE'
WHEN 'G' THEN 'GUEST'
WHEN 'O' THEN 'On Behalf Of'
WHEN 'T' then 'Generosity Of'
WHEn 'S' THEN 'In Support Of'
WHEN 'Z' THEN 'Matching Gift'
END 															   As rC_Giving__Tribute_Type__c,
rtrim(ltrim(xx.donor))												as donor,
CAST('' as nvarchar(255))                                         As rC_Giving__Matching_Account__c,
CAST('' as nvarchar(255))                                         As rC_Giving__Matching_Amount__c ,
CAST('' as nvarchar(255))                                         As rC_Giving__Matching_Opportunity__c
,CAST('' as nvarchar(100))   as rc_giving__Matching_Notice__c
,ltrim(rtrim(xx.sol))                                              As SOL
,rtrim(ltrim(xx.SOL))												as Legacy_Source_Code__c
,ltrim(rtrim(xx.gidnumb)) as gidnumb
from
[METRO_UAT1].dbo.dpgift  xx
left join
[Migration_Metro].dbo.[Account_stage_Metro] a
ON a.donor=rtrim(ltrim(xx.donor))
 Left join
 [Migration_Metro].[dbo].[rC_Giving__Payment_Method__c_Load] p
 ON p.donor=rtrim(ltrim(xx.donor))
 and p.gifttype=xx.gifttype
Left join
[Migration_Metro].[dbo].[Campaign_Load] c
On substring(c.Legacy_source_code__c,7,10)=rtrim(ltrim(xx.sol))

where xx.RECTYPE in ('G') and xx.GIFTTYPE != 'IK' and xx.SOL not in ('17PL99901',
'17PL99902',
'17PL99903',
'17PL99904',
'17PL99905',
'17PL99906',
'17PL99907',
'17PL99908',
'17PL99909',
'17PL99910',
'17PL99911',
'17PL99912',
'17PL9EFT0',
'17PL9EFT0',
'17PL9EFT0',
'17PL9EFT0',
'17PL9EFT0',
'17PL9EFT0',
'17PL9EFT0',
'17PL9EFT0',
'17PL9EFT0',
'17PL9EFT1',
'17PL9EFT1',
'17PL9EFT1') 
UNION
SELECT
CAST ('' as nchar(18))                                                  As ID,
CAST ('' as nvarchar(255))                                              As Error
,'Migration'															As Acknowledgement_Path__c
,GETDATE()																as Acknowledgement_Path_Date__c,
'C' + xx.CHAPTERGFT													    As Revenue_Location_Code__c,
a.ID																	As AccountId,
'0'												                        As Amount,---For DONATION Need to send 0
CAST(rtrim(ltrim(xx.DATE)) as datetime2)							    As CloseDate,---For DONATION Need To send Date
a.Name +'DONATION '+ LEFT(CONVERT(VARCHAR , rtrim(ltrim(xx.DATE)), 120),4)  As [Name],																
'0053D000000INtD'														As OwnerId,
(SELECT Id FROM [Migration_target_QA].dbo.RecordType WHERE 
SobjectType = 'Opportunity' AND Name = 'DONATION')                   As RecordTypeId,
c.ID																	As CampaignId,
'FALSE'																as IsPrivate,
'COMPLETED'																As StageName,
CASE rtrim(ltrim(xx.ACK_FLAG))	
WHEN '' THEN 'FALSE'
ELSE 'TRUE'
END										                                As rC_Giving__Acknowledged__c,
CASE CAST(rtrim(ltrim(xx.TY_DT)) AS Datetime2)	
WHEN '1899-12-30 00:00:00.0000000' THEN NULL	
ELSE CAST(rtrim(ltrim(xx.TY_DT)) AS Datetime2)	
END																		As rC_Giving__Acknowledged_Date__c,
'DONATION'																As rC_Giving__Activity_Type__c,
CAST('' as nvarchar(255) )											    As rC_Giving__Anniversary_Date__c,
CAST('' as nvarchar(255))												As rC_Giving__Anniversary_Renewal_Date__c,

'FALSE'																	As rC_Giving__Archive_Flag__c,
'NEW'																	As rC_Giving__Calculated_Giving_Type__c,
--rC_Giving__Campaign_Source_Code__c (Formula Field)
rtrim(ltrim(xx.checknbr))												As rC_Giving__Check_Number__c,
rtrim(ltrim(xx.AMT))												   As rC_Giving__Closed_Amount__c,----Need to populate AMT for Donation

CAST(rtrim(ltrim(xx.GNARR)) As nvarchar(max))							As rC_Giving__Comments__c,
rtrim(ltrim(xx.AMT))												As rC_Giving__Current_Giving_Amount__c,----Need to populate AMT for Donation
CAST(rtrim(ltrim(xx.[DATE])) AS datetime2)	                             As rC_Giving__Close_Date_Time__c,
rtrim(ltrim(xx.AMT))													As rC_Giving__Expected_Giving_Amount__c,----Need to populate AMT for Donation
'METRO-DONATION-'+rtrim(ltrim(xx.GIDNUMB1))							As External_id__c,
-- 'FALSE'																as rC_Giving__Is_Canceled__c,
-- 'FALSE'																As rC_Giving__Is_Completed__c,
-- 'FALSE'																As rC_Giving__Is_Suspended__c,
-- 'FALSE'																As rC_Giving__Is_Uncollectible__c,
'TRUE'															    As rC_Giving__Is_Giving__c,
rtrim(ltrim(xx.AMT))											    As rC_Giving__Giving_Amount__c,----Need to populate AMT for Donation
'TRUE'																As rC_Giving__Is_Giving_Donation__c,----TRUE For DONATION
'One Payment'													    As rC_Giving__Giving_Frequency__c,
														
'False'															    As rC_Giving__Is_Giving_Inkind__c,
'FALSE'																As rC_Giving__Is_Giving_Membership__c,
'False'																AS rC_Giving__Is_Giving_Purchase__c,
'False'																as rC_Giving__Is_Giving_Transaction__c,
'NEW'																	as rC_Giving__Giving_Type__c,
'Fiscal Year'															As rC_Giving__Giving_Type_Engine__c,
'1'																	As rC_Giving__Giving_Years__c,
'0'																	As rC_Giving__Last_Giving_Amount_Adjustment__c,
CAST('' as nvarchar(100) )																		As rC_Giving__Is_Matching__c,
CAST('' as nvarchar(100) )																As rC_Giving__Matching_Status__c,
CAST('' as nvarchar(max)) 														As rC_Giving__Payer_Name__c,
'1'																	As rC_Giving__Payment_Count__c,
CAST('' as nvarchar(255) )															As rC_Giving__Payment_Frequency__c,
Case 
When rtrim(ltrim(xx.Gifttype)) in ('CA','CK','  ') THEN 'Cash/Check'
When rtrim(ltrim(xx.Gifttype)) ='BC' THEN 'EFT'
When rtrim(ltrim(xx.Gifttype)) in ('MO', 'AD', 'PH') THEN 'Other'
When rtrim(ltrim(xx.Gifttype))='PP' THEN 'Paypal'
When rtrim(ltrim(xx.Gifttype))in('AE','CB','CC','DI', 'MC','VI') THEN 'Third Party Charge'
When rtrim(ltrim(xx.Gifttype))='ST' then 'Securities'
END 																As rC_Giving__Payment_Method__c

,Case rtrim(ltrim(xx.Gifttype))
WHEN 'ST' THEN rtrim(ltrim(xx.Amt))
Else ''
End 																As rC_Giving__Realized_Amount__c,
CAST(rtrim(ltrim(xx.[DATE])) as datetime2)											As rC_Giving__Realized_Date__c,
p.ID																As rC_Giving__Payment_Method_Selected__c,
CAST('' as nvarchar(255)  )                                         As rC_Giving__Is_Sustainer__c,
'PAYMENT'															as rC_Giving__Transaction_Type__c,
CASE rtrim(ltrim(xx.NAMETYPE))
WHEN 'H' THEN 'True'
WHEN 'M' THEN 'TRUE'
Else 'FALSE'
END 																As rC_Giving__Is_Tribute__c,
CONCAT(rtrim(ltrim(xx.GFNAME)),' ',rtrim(ltrim(xx.GLNAME))) 		As rC_Giving__Tribute_Comments__c
,CASE rtrim(ltrim(xx.NAMETYPE))
WHEN 'H' THEN 'In Honor'
WHEN 'M' THEN 'In Memory'
WHEN 'N' THEN 'NONE'
WHEN 'G' THEN 'GUEST'
WHEN 'O' THEN 'On Behalf Of'
WHEN 'T' then 'Generosity Of'
WHEn 'S' THEN 'In Support Of'
WHEN 'Z' THEN 'Matching Gift'
END 															   As rC_Giving__Tribute_Type__c,
rtrim(ltrim(xx.donor))												as donor,
CAST('' as nvarchar(255))                                         As rC_Giving__Matching_Account__c,
CAST('' as nvarchar(255))                                         As rC_Giving__Matching_Amount__c ,
CAST('' as nvarchar(255))                                         As rC_Giving__Matching_Opportunity__c
,CAST('' as nvarchar(100))   as rc_giving__Matching_Notice__c
,ltrim(rtrim(xx.sol))                                              As SOL
,rtrim(ltrim(xx.SOL))												as Legacy_Source_Code__c
,ltrim(rtrim(xx.gidnumb1)) as gidnumb
from
[METRO_UAT1].dbo.dpother  xx
left join
[Migration_Metro].dbo.[Account_stage_Metro] a
ON a.donor=rtrim(ltrim(xx.donor))
 Left join
 [Migration_Metro].[dbo].[rC_Giving__Payment_Method__c_Load] p
 ON p.donor=rtrim(ltrim(xx.donor))
 and p.gifttype=xx.gifttype
Left join
[Migration_Metro].[dbo].[Campaign_Load] c
On substring(c.Legacy_source_code__c,7,10)=rtrim(ltrim(xx.sol))
where xx.RECTYPE in ('G') and xx.GIFTTYPE != 'IK' and xx.SOL not in ('17PL99901',
'17PL99902',
'17PL99903',
'17PL99904',
'17PL99905',
'17PL99906',
'17PL99907',
'17PL99908',
'17PL99909',
'17PL99910',
'17PL99911',
'17PL99912',
'17PL9EFT0',
'17PL9EFT0',
'17PL9EFT0',
'17PL9EFT0',
'17PL9EFT0',
'17PL9EFT0',
'17PL9EFT0',
'17PL9EFT0',
'17PL9EFT0',
'17PL9EFT1',
'17PL9EFT1',
'17PL9EFT1') 

)yy

order by AccountId,CampaignId,rC_Giving__Payment_Method_Selected__c

---------------------------------------------------------------------------------------------------------------------------------
--UPDATEING rC_Giving__Payer_Name__c
---------------------------------------------------------------------------------------------------------------------------------
update [Migration_Metro].dbo.[opportunity_DONATION] 
set rC_Giving__Payer_Name__c=
Concat(rtrim(ltrim(FIRSTNAME)),' ',rtrim(ltrim(LASTNAME)))
from
[Migration_Metro].dbo.Contact_stage_Metro c
join
[Migration_Metro].dbo.[opportunity_DONATION] od
on od.donor=c.Donor
where right(c.External_Id__C,2)!='-2'
---------------------------------------------------------------------------------------------------------------------------------
--UPDATEING rC_Giving__Matching_Account__c
---------------------------------------------------------------------------------------------------------------------------------
update d
set d.rC_Giving__Matching_Account__c= a.ID 
from
[Migration_Metro].dbo.[opportunity_DONATION]d 
join
[Migration_Metro].dbo.[Account_stage_Metro] a
ON d.donor=a.donor
Join
(select gidnumb, SOL, amt, donor, glink from 
[METRO_UAT1].dbo.dpgift where glink!=gidnumb and glink!='0'
)xx
on d.Donor=rtrim(ltrim(xx.donor))
-------------------------------------------------------------------------------------------------------------------------------
--UPDATEING rC_Giving__Matching_Amount__c
-------------------------------------------------------------------------------------------------------------------------------
update  p
set p.rC_Giving__Matching_Amount__c =xx.amt
from 
(Select cast(gidnumb as nvarchar(100))gidnumb, glink,sol,donor,amt from [METRO_UAT1].dbo.dpgift 
where glink != gidnumb and glink != '0' 
union
Select cast(gidnumb1 as nvarchar(100))gidnumb, glink,sol,donor,amt from [METRO_UAT1].dbo.DPOTHER 
where glink != gidnumb1 and glink != '0' 
)xx
inner JOIN
[Migration_METRO].dbo.[opportunity_DONATION] p
on rtrim(ltrim(xx.gidnumb)) =substring(p.[External_id__c],16,Len(p.[External_id__c])) 
inner join
(select [External_id__c] ,id FROM [Migration_METRO].dbo.[opportunity_INKIND]
union
-- select [External_id__c] ,id FROM [Migration_METRO].dbo.[opportunity_Donation]
-- union
select [External_id__c] ,id FROM [Migration_METRO].dbo.[opportunity_TRANSACTION_Final]
union
select [External_id__c] ,id FROM [Migration_METRO].dbo.[opportunity_GRANT]
union
select [External_id__c] ,id  FROM [Migration_METRO].dbo.[opportunity_Pledge]) a
on rtrim(ltrim(xx.glink)) =reverse(SUBSTRING(reverse(a.External_id__c),1,charindex('-',reverse(a.External_id__c))-1))

-------------------------------------------------------------------------------------------------------------------------------
--UPDATEING rC_Giving__Matching_Opportunity__c
-------------------------------------------------------------------------------------------------------------------------------
update  p
set p.rC_Giving__Matching_Opportunity__c =a.ID
from 
(Select cast(gidnumb as nvarchar(100))gidnumb, glink,sol,donor,amt from [METRO_UAT1].dbo.dpgift 
where glink != gidnumb and glink != '0' 
union
Select cast(gidnumb1 as nvarchar(100))gidnumb, glink,sol,donor,amt from [METRO_UAT1].dbo.DPOTHER 
where glink != gidnumb1 and glink != '0' 
)xx
inner JOIN
[Migration_METRO].dbo.[opportunity_DONATION] p
on rtrim(ltrim(xx.gidnumb)) =substring(p.[External_id__c],16,Len(p.[External_id__c])) 
inner join
(select [External_id__c] ,id FROM [Migration_METRO].dbo.[opportunity_INKIND]
union
-- select [External_id__c] ,id FROM [Migration_METRO].dbo.[opportunity_Donation]
-- union
select [External_id__c] ,id FROM [Migration_METRO].dbo.[opportunity_TRANSACTION_Final]
union
select [External_id__c] ,id FROM [Migration_METRO].dbo.[opportunity_GRANT]
union
select [External_id__c] ,id  FROM [Migration_METRO].dbo.[opportunity_Pledge]) a
on rtrim(ltrim(xx.glink)) =reverse(SUBSTRING(reverse(a.External_id__c),1,charindex('-',reverse(a.External_id__c))-1))


-----------------------------------------------------------------------------------------

---updating rc_giving__is_Matching__C
UPDATE [Migration_Metro].dbo.opportunity_DONATION
SET rc_giving__is_Matching__C='True'
from 
(Select CAST(gidnumb as nvarchar(255))gidnumb, glink,sol,donor,amt from [METRO_UAT1].dbo.dpgift 
where glink != gidnumb and glink != '0' 
UNION
Select CAST(gidnumb1 as nvarchar(255))gidnumb, glink,sol,donor,amt from [METRO_UAT1].dbo.DPOTHER 
where glink != gidnumb1 and glink != '0' 
)xx
inner JOIN
[Migration_METRO].dbo.[opportunity_Pledge] a
on rtrim(ltrim(xx.GIDNUMB))=substring(a.[External_id__c],16,Len(a.[External_id__c]))

---------
---updating rc_giving__Matching_Notice__c

update  [Migration_Metro].dbo.opportunity_DONATION
set rc_giving__Matching_Notice__c=cast(''as nvarchar(255))
from 
(Select CAST(gidnumb as nvarchar(255))gidnumb, glink,sol,donor,amt from [METRO_UAT1].dbo.dpgift 
where glink != gidnumb and glink != '0' 
UNION
Select CAST(gidnumb1 as nvarchar(255))gidnumb, glink,sol,donor,amt from [METRO_UAT1].dbo.DPOTHER 
where glink != gidnumb1 and glink != '0' 
)xx
Inner JOIN
[Migration_METRO].dbo.[opportunity_Pledge] a
on rtrim(ltrim(xx.GIDNUMB))=substring(a.[External_id__c],16,Len(a.[External_id__c]))


-------------------------------------
--------updating rc_giving__Matching_status__C


update  [Migration_Metro].dbo.opportunity_DONATION

set rc_giving__Matching_status__C='Approved'
from 
(Select CAST(gidnumb as nvarchar(255))gidnumb, glink,sol,donor,amt from [METRO_UAT1].dbo.dpgift 
where glink != gidnumb and glink != '0' 
UNION
Select CAST(gidnumb1 as nvarchar(255))gidnumb, glink,sol,donor,amt from [METRO_UAT1].dbo.DPOTHER 
where glink != gidnumb1 and glink != '0' 
)xx
Inner JOIN
[Migration_METRO].dbo.[opportunity_Pledge] a
on rtrim(ltrim(xx.GIDNUMB))=substring(a.[External_id__c],16,Len(a.[External_id__c]))



--- Insert/Update records
--use [Migration_Metro]
--Exec SF_BulkOps 'Insert:bulkapi,parallel,Batchsize(10000)', 'TSAC_MIGR', 'opportunity_DONATION'