 -- Drop staging tables
drop table [Migration_Metro].dbo.opportunity_TRANSACTION

----TRANSACTION
select 
* 
INTO [Migration_Metro].dbo.opportunity_TRANSACTION
from
(SELECT

CAST('' as nchar(18))                                                  As ID
,CAST('' as nvarchar(255))                                             As Error
,'Migration'															As Acknowledgement_Path__c
,GETDATE()																as Acknowledgement_Path_Date__c
,'C' + xx.CHAPTERGFT												    As Revenue_Location_Code__c
,a.ID																	As AccountId
,rtrim(ltrim(xx.AMT))												    As Amount---NEED to populate AMT for TRANSACTION
,CAST(rtrim(ltrim(xx.[DATE])) AS datetime2)											As CloseDate
 																	

,(a.Name +'DONATION '+ LEFT(CONVERT(VARCHAR , rtrim(ltrim(xx.DATE)), 120),4)) +' Payment '+left(xx.Date,10) As Name
																	
,'0053D000000INtD'														As OwnerId
,(SELECT Id FROM [Migration_target_QA].dbo.RecordType WHERE SobjectType = 'Opportunity' AND Name = 'TRANSACTION') As RecordTypeId
,CAST(' ' as nvarchar(255))												As CampaignId ---Need to populate only for donation and Pledges
,'FALSE'																as IsPrivate
,'COMPLETED'																As StageName
,CASE rtrim(ltrim(xx.ACK_FLAG))	
WHEN '' THEN 'FALSE'
ELSE 'TRUE'
END										                                As rC_Giving__Acknowledged__c,
CASE CAST(rtrim(ltrim(xx.TY_DT)) AS Datetime2)	
WHEN '1899-12-30 00:00:00.0000000' THEN NULL	
ELSE CAST(rtrim(ltrim(xx.TY_DT)) AS Datetime2)	
END												    As rC_Giving__Acknowledged_Date__c
,'DONATION'																As rC_Giving__Activity_Type__c

,CAST('' as nvarchar(max))										        As rC_Giving__Anniversary_Date__c
,CAST('' as nvarchar(max))											    As rC_Giving__Anniversary_Renewal_Date__c
,'FALSE'																As rC_Giving__Archive_Flag__c
,'NEW'																	As rC_Giving__Calculated_Giving_Type__c
,rtrim(ltrim(xx.checknbr))												As rC_Giving__Check_Number__c
,CAST('' as nvarchar(255))												As rC_Giving__Closed_Amount__c
,CAST(rtrim(ltrim(xx.[DATE])) AS datetime2)								As rC_Giving__Close_Date_Time__c
,CAST(rtrim(ltrim(xx.GNARR)) As nvarchar(max))							As rC_Giving__Comments__c
,CAST('' as nvarchar(255))												As rC_Giving__Current_Giving_Amount__c
,CAST('' as nvarchar(255))												As rC_Giving__Expected_Giving_Amount__c
,'METRO-TRANSACTION-'+CAST(rtrim(ltrim(xx.GIDNUMB))	as nvarchar(100))									As External_id__c
                                                                      --As rC_Giving__Fill_Rate__c
,'False'																As rC_Giving__Is_Giving__c
,CAST('' as nvarchar(255))												As rC_Giving__Giving_Amount__c
,'False'																As rC_Giving__Is_Giving_Donation__c
,CAST('' as nvarchar(255))											    As rC_Giving__Giving_Frequency__c
,'False'															    As rC_Giving__Is_Giving_Inkind__c
,'FALSE'																As rC_Giving__Is_Giving_Membership__c
,'False'																AS rC_Giving__Is_Giving_Purchase__c
,'True'																	as rC_Giving__Is_Giving_Transaction__c
,'NEW'																	as rC_Giving__Giving_Type__c
,'Fiscal Year'															As rC_Giving__Giving_Type_Engine__c
,CAST('' as nvarchar(50))												As rC_Giving__Giving_Years__c
,'0'																	As rC_Giving__Last_Giving_Amount_Adjustment__c
,CAST('' as nvarchar(max))																		As rC_Giving__Is_Matching__c
,CAST('' as nvarchar(max))															As rC_Giving__Matching_Status__c
,CAST('' as nvarchar(max))												As rC_Giving__Payer_Name__c
,'1'																	As rC_Giving__Payment_Count__c
,CAST('' as nvarchar(50))												As rC_Giving__Payment_Frequency__c
,Case 
When rtrim(ltrim(xx.Gifttype)) in ('CA','CK','  ') THEN 'Cash/Check'
When rtrim(ltrim(xx.Gifttype)) ='BC' THEN 'EFT'
When rtrim(ltrim(xx.Gifttype)) in ('MO', 'AD', 'PH') THEN 'Other'
When rtrim(ltrim(xx.Gifttype))='PP' THEN 'Paypal'
When rtrim(ltrim(xx.Gifttype))in('AE','CB','CC','DI', 'MC','VI') THEN 'Third Party Charge'
When rtrim(ltrim(xx.Gifttype))='ST' then 'Securities'
END 																As rC_Giving__Payment_Method__c
---,CAST(rtrim(ltrim(xx.GNARR)) As nvarchar(max))					    As rC_Giving__Payment_Reference_Number__c
,Case rtrim(ltrim(xx.Gifttype))
WHEN 'ST' THEN rtrim(ltrim(xx.Amt))

End 																As rC_Giving__Realized_Amount__c
,rtrim(ltrim(xx.[DATE]))						                    As rC_Giving__Realized_Date__c
,pay.ID																As rC_Giving__Payment_Method_Selected__c
,'FALSE'														    As rC_Giving__Is_Sustainer__c
,'PAYMENT'															as rC_Giving__Transaction_Type__c
,CASE 
WHEN rtrim(ltrim(xx.NAMETYPE)) in ('H','M') then 'TRUE'
Else 'FALSE'
END 																As rC_Giving__Is_Tribute__c
,CONCAT(rtrim(ltrim(xx.GFNAME)),' ' ,rtrim(ltrim(xx.GLNAME))) 		As rC_Giving__Tribute_Comments__c
,CASE rtrim(ltrim(xx.NAMETYPE))
WHEN 'H' THEN 'In Honor'
WHEN 'M' THEN 'In Memory'
WHEN 'N' THEN ''
WHEN 'G' THEN 'GUEST'
WHEN 'O' THEN 'On Behalf Of'
WHEN 'T' then 'Generosity Of'
WHEn 'S' THEN 'In Support Of'
WHEN 'Z' THEN 'Matching Gift'
END 															   As rC_Giving__Tribute_Type__c
,rtrim(ltrim(xx.donor))											   As donor
,CAST('' as nvarchar(255))                                         As rC_Giving__Matching_Account__c
,CAST('' as nvarchar(255))                                         As rC_Giving__Matching_Amount__c 
,CAST('' as nvarchar(255))                                         As rC_Giving__Matching_Opportunity__c
,CAST('' as nvarchar(18))                                          AS rC_Giving__Parent__c
,CAST('' as nvarchar(255))                                         As rC_Giving__Parent_Name__c
,ltrim(rtrim(xx.sol))                                              As SOL
,rtrim(ltrim(xx.SOL))												as Legacy_Source_Code__c
,CAST('' as nvarchar(255)) as rc_giving__Matching_Notice__c
,ltrim(rtrim(xx.gidnumb))as gidnumb
from
[METRO_UAT1].dbo.dpgift xx
LEFT JOIN
[Migration_Metro].dbo.Account_stage_Metro a
ON a.donor=rtrim(ltrim(xx.donor))
Left join
[Migration_Metro].dbo.rC_Giving__Payment_Method__c_Load pay
ON pay.donor=rtrim(ltrim(xx.donor))
and pay.gifttype=xx.gifttype
where xx.RECTYPE = 'G' and xx.GIFTTYPE != 'IK' and xx.SOL not in ('17PL99901',
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

CAST('' as nchar(18))                                                  As ID
,CAST('' as nvarchar(255))                                             As Error
,'Migration'															As Acknowledgement_Path__c
,GETDATE()																as Acknowledgement_Path_Date__c
,'C' + xx.CHAPTERGFT												    As Revenue_Location_Code__c
,a.ID																	As AccountId
,rtrim(ltrim(xx.AMT))												    As Amount---NEED to populate AMT for TRANSACTION
,CAST(rtrim(ltrim(xx.[DATE])) AS datetime2)	 											As CloseDate
 																	

,(a.Name +'DONATION '+ LEFT(CONVERT(VARCHAR , rtrim(ltrim(xx.DATE)), 120),4)) +' Payment '+left(xx.Date,10) As Name
																	
,'0053D000000INtD'														As OwnerId
,(SELECT Id FROM [Migration_target_QA].dbo.RecordType WHERE SobjectType = 'Opportunity' AND Name = 'TRANSACTION') As RecordTypeId
,CAST(' ' as nvarchar(255))												As CampaignId ---Need to populate only for donation and Pledges
,'FALSE'																as IsPrivate
,'COMPLETED'																As StageName
,CASE rtrim(ltrim(xx.ACK_FLAG))	
WHEN '' THEN 'FALSE'
ELSE 'TRUE'
END										                                As rC_Giving__Acknowledged__c,
CASE CAST(rtrim(ltrim(xx.TY_DT)) AS Datetime2)	
WHEN '1899-12-30 00:00:00.0000000' THEN NULL	
ELSE CAST(rtrim(ltrim(xx.TY_DT)) AS Datetime2)	
END													    				As rC_Giving__Acknowledged_Date__c
,'DONATION'																As rC_Giving__Activity_Type__c

,CAST('' as nvarchar(max))										        As rC_Giving__Anniversary_Date__c
,CAST('' as nvarchar(max))											    As rC_Giving__Anniversary_Renewal_Date__c
,'FALSE'																As rC_Giving__Archive_Flag__c
,'NEW'																	As rC_Giving__Calculated_Giving_Type__c
,rtrim(ltrim(xx.checknbr))												As rC_Giving__Check_Number__c
,CAST('' as nvarchar(255))												As rC_Giving__Closed_Amount__c
,CAST(rtrim(ltrim(xx.[DATE])) AS datetime2)								As rC_Giving__Close_Date_Time__c
,CAST(rtrim(ltrim(xx.GNARR)) As nvarchar(max))							As rC_Giving__Comments__c
,CAST('' as nvarchar(255))												As rC_Giving__Current_Giving_Amount__c
,CAST('' as nvarchar(255))												As rC_Giving__Expected_Giving_Amount__c
,'METRO-TRANSACTION-'+rtrim(ltrim(xx.GIDNUMB1))										As External_id__c
                                                                      --As rC_Giving__Fill_Rate__c
,'False'																As rC_Giving__Is_Giving__c
,CAST('' as nvarchar(255))												As rC_Giving__Giving_Amount__c
,'False'																As rC_Giving__Is_Giving_Donation__c
,CAST('' as nvarchar(255))											    As rC_Giving__Giving_Frequency__c
,'False'															    As rC_Giving__Is_Giving_Inkind__c
,'FALSE'																As rC_Giving__Is_Giving_Membership__c
,'False'																AS rC_Giving__Is_Giving_Purchase__c
,'True'																	as rC_Giving__Is_Giving_Transaction__c
,'NEW'																	as rC_Giving__Giving_Type__c
,'Fiscal Year'															As rC_Giving__Giving_Type_Engine__c
,CAST('' as nvarchar(50))												As rC_Giving__Giving_Years__c
,'0'																	As rC_Giving__Last_Giving_Amount_Adjustment__c
,CAST('' as nvarchar(max))																		As rC_Giving__Is_Matching__c
,CAST('' as nvarchar(max))																As rC_Giving__Matching_Status__c
,CAST('' as nvarchar(max))												As rC_Giving__Payer_Name__c
,'1'																	As rC_Giving__Payment_Count__c
,CAST('' as nvarchar(50))												As rC_Giving__Payment_Frequency__c
,Case 
When rtrim(ltrim(xx.Gifttype)) in ('CA','CK','  ') THEN 'Cash/Check'
When rtrim(ltrim(xx.Gifttype)) ='BC' THEN 'EFT'
When rtrim(ltrim(xx.Gifttype)) in ('MO', 'AD', 'PH') THEN 'Other'
When rtrim(ltrim(xx.Gifttype))='PP' THEN 'Paypal'
When rtrim(ltrim(xx.Gifttype))in('AE','CB','CC','DI', 'MC','VI') THEN 'Third Party Charge'
When rtrim(ltrim(xx.Gifttype))='ST' then 'Securities'
END 																As rC_Giving__Payment_Method__c
----,CAST(rtrim(ltrim(xx.GNARR)) As nvarchar(max))					    As rC_Giving__Payment_Reference_Number__c
,Case rtrim(ltrim(xx.Gifttype))
WHEN 'ST' THEN rtrim(ltrim(xx.Amt))

End 																As rC_Giving__Realized_Amount__c
,rtrim(ltrim(xx.[DATE]))						                    As rC_Giving__Realized_Date__c
,pay.ID																As rC_Giving__Payment_Method_Selected__c
,'FALSE'														    As rC_Giving__Is_Sustainer__c
,'PAYMENT'															as rC_Giving__Transaction_Type__c
,CASE 
WHEN rtrim(ltrim(xx.NAMETYPE)) in ('H','M') then 'TRUE'
Else 'FALSE'
END 																As rC_Giving__Is_Tribute__c
,CONCAT(rtrim(ltrim(xx.GFNAME)),' ' ,rtrim(ltrim(xx.GLNAME))) 		As rC_Giving__Tribute_Comments__c
,CASE rtrim(ltrim(xx.NAMETYPE))
WHEN 'H' THEN 'In Honor'
WHEN 'M' THEN 'In Memory'
WHEN 'N' THEN ''
WHEN 'G' THEN 'GUEST'
WHEN 'O' THEN 'On Behalf Of'
WHEN 'T' then 'Generosity Of'
WHEn 'S' THEN 'In Support Of'
WHEN 'Z' THEN 'Matching Gift'
END 															   As rC_Giving__Tribute_Type__c
,rtrim(ltrim(xx.donor))											   As donor
,CAST('' as nvarchar(255))                                         As rC_Giving__Matching_Account__c
,CAST('' as nvarchar(255))                                         As rC_Giving__Matching_Amount__c 
,CAST('' as nvarchar(255))                                         As rC_Giving__Matching_Opportunity__c
,CAST('' as nvarchar(18))                                          AS rC_Giving__Parent__c
,CAST('' as nvarchar(255))                                         As rC_Giving__Parent_Name__c
,ltrim(rtrim(xx.sol))                                              As SOL
,rtrim(ltrim(xx.SOL))												as Legacy_Source_Code__c
,CAST('' as nvarchar(255)) as rc_giving__Matching_Notice__c
,ltrim(rtrim(xx.gidnumb1))as gidnumb
from
[METRO_UAT1].dbo.DPOTHER xx
LEFT JOIN
[Migration_Metro].dbo.Account_stage_Metro a
ON a.donor=rtrim(ltrim(xx.donor))
Left join
[Migration_Metro].dbo.rC_Giving__Payment_Method__c_Load pay
ON pay.donor=rtrim(ltrim(xx.donor))
and pay.gifttype=xx.gifttype
where xx.RECTYPE = 'G' and xx.GIFTTYPE != 'IK' and xx.SOL not in ('17PL99901',
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
Order by accountId,rC_Giving__Payment_Method_Selected__c


---------------------------------------------------------------------------------------------------------------------------------
--UPDATEING rC_Giving__Parent__c--METRO-TRANSACTION
-------------------------------------------------------------------------------------------------------------------------------
Update [Migration_Metro].dbo.[opportunity_TRANSACTION]
SET rC_Giving__Parent__c= od.ID from
[Migration_Metro].dbo.[opportunity_TRANSACTION] ot
join [Migration_Metro].dbo.[opportunity_Donation] od
on SUBSTRING(od.External_ID__c,16,len(od.External_ID__c)-15)
=SUBSTRING(ot.External_ID__c,19,len(ot.External_ID__c)-18)


---------------------------------------------------------------------------------------------------------------------------------
--UPDATEING rC_Giving__Payer_Name__c
---------------------------------------------------------------------------------------------------------------------------------
update [Migration_Metro].dbo.[opportunity_TRANSACTION] 
set rC_Giving__Payer_Name__c=
Concat(rtrim(ltrim(FIRSTNAME)),' ',rtrim(ltrim(LASTNAME)))
from
Migration_Metro.dbo.Contact_stage_Metro c
Inner join
[Migration_Metro].dbo.[opportunity_TRANSACTION] od
on od.donor=c.Donor
where right(c.External_Id__C,2)!='-2'
---------------------------------------------------------------------------------------------------------------------------------
--UPDATEING rC_Giving__Matching_Account__c
---------------------------------------------------------------------------------------------------------------------------------
update d
set d.rC_Giving__Matching_Account__c= a.ID 
from
[Migration_Metro].dbo.[opportunity_TRANSACTION]d 
Inner join
[Migration_Metro].dbo.[Account_stage_Metro] a
ON d.donor=a.donor
Inner Join
(select gidnumb, SOL, amt, donor, glink from 
[METRO_UAT1].dbo.dpgift where glink!=gidnumb and glink!='0'
)xx
on d.Donor=rtrim(ltrim(xx.donor))
---------------------------------------------------------------------------------------------------------------------------------
--UPDATEING rC_Giving__Matching_Amount__c
---------------------------------------------------------------------------------------------------------------------------------
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
[Migration_METRO].dbo.[opportunity_TRANSACTION] p
on rtrim(ltrim(xx.gidnumb)) =substring(p.[External_id__c],19,Len(p.[External_id__c])) 
inner join
(select [External_id__c] ,id FROM [Migration_METRO].dbo.[opportunity_INKIND]
union
select [External_id__c] ,id FROM [Migration_METRO].dbo.[opportunity_Donation]
union
--select [External_id__c] ,id FROM [Migration_METRO].dbo.[opportunity_TRANSACTION_Final]
--union
select [External_id__c] ,id FROM [Migration_METRO].dbo.[opportunity_GRANT]
union
select [External_id__c] ,id  FROM [Migration_METRO].dbo.[opportunity_Pledge]) a
on rtrim(ltrim(xx.glink)) =reverse(SUBSTRING(reverse(a.External_id__c),1,charindex('-',reverse(a.External_id__c))-1))





--UPDATEING rC_Giving__Matching_Opportunity__c
---------------------------------------------------------------------------------------------------------------------------------
update  p
set p.rC_Giving__Matching_Opportunity__c =a.id
from 
(Select cast(gidnumb as nvarchar(100))gidnumb, glink,sol,donor,amt from [METRO_UAT1].dbo.dpgift 
where glink != gidnumb and glink != '0' 
union
Select cast(gidnumb1 as nvarchar(100))gidnumb, glink,sol,donor,amt from [METRO_UAT1].dbo.DPOTHER 
where glink != gidnumb1 and glink != '0' 
)xx
Inner JOIN
[Migration_METRO].dbo.[opportunity_TRANSACTION] p
on rtrim(ltrim(xx.gidnumb)) =substring(p.[External_id__c],19,Len(p.[External_id__c])) 
Inner join
(select [External_id__c] ,id FROM [Migration_METRO].dbo.[opportunity_INKIND]
union
select [External_id__c] ,id FROM [Migration_METRO].dbo.[opportunity_Donation]
union
select [External_id__c] ,id FROM [Migration_METRO].dbo.[opportunity_GRANT]
union
select [External_id__c] ,id  FROM [Migration_METRO].dbo.[opportunity_Pledge]) a
on rtrim(ltrim(xx.glink)) =reverse(SUBSTRING(reverse(a.External_id__c),1,charindex('-',reverse(a.External_id__c))-1))



-------updating rc_giving__is_Matching__C
UPDATE [Migration_Metro].dbo.opportunity_TRANSACTION
SET rc_giving__is_Matching__C='True'
from 
(Select CAST(gidnumb as nvarchar(255))gidnumb, glink,sol,donor,amt from [METRO_UAT1].dbo.dpgift 
where glink != gidnumb and glink != '0' 
UNION
Select CAST(gidnumb1 as nvarchar(255))gidnumb, glink,sol,donor,amt from [METRO_UAT1].dbo.DPOTHER 
where glink != gidnumb1 and glink != '0' 
)xx
Inner JOIN
[Migration_METRO].dbo.[opportunity_Pledge] a
on rtrim(ltrim(xx.GIDNUMB))=substring(a.[External_id__c],19,Len(a.[External_id__c]))




---updating rc_giving__Matching_Notice__c

update  [Migration_Metro].dbo.opportunity_TRANSACTION
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
on rtrim(ltrim(xx.GIDNUMB))=substring(a.[External_id__c],19,Len(a.[External_id__c]))




---------------------------------------
--------updating rc_giving__Matching_status__C
update  [Migration_Metro].dbo.opportunity_TRANSACTION

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
on rtrim(ltrim(xx.GIDNUMB))=substring(a.[External_id__c],19,Len(a.[External_id__c]))





--- Insert/Update records
--use [Migration_Metro]
--Exec SF_BulkOps 'Insert:bulkapi,parallel,Batchsize(10000)', 'TSAC_MIGR', 'opportunity_TRANSACTION'


--check errors

--Select error from [Migration_Metro].dbo.[opportunity_TRANSACTION] where id=''

-- Replicate Data
--use [Migration_target_QA]
--exec SF_Refresh 'TSAC_MIGR', 'Opportunity','yes'