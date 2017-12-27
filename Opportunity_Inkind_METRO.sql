DROP table [Migration_Metro].dbo.[opportunity_INKIND]
---INKIND
select *
INTO [Migration_Metro].dbo.[opportunity_INKIND]
from (SELECT

CAST('' as nchar(18))                                                  As ID
,CAST('' as nvarchar(255))                                             As Error
,'Migration'															As Acknowledgement_Path__c
,GETDATE()																as Acknowledgement_Path_Date__c
,'C' + xx.CHAPTERGFT												    As Revenue_Location_Code__c
,a.ID																	As AccountId
,rtrim(ltrim(xx.fmv))												    As Amount
,CAST(rtrim(ltrim(xx.[DATE])) AS datetime2)	  										    As CloseDate											

,Concat(a.Name,' ','IN KIND',' ', LEFT(CONVERT(VARCHAR, rtrim(ltrim(xx.WO_DT)), 120),4)) As Name
																	
,'0053D000000INtD'														As OwnerId
,(SELECT Id FROM [Migration_target_QA].dbo.RecordType WHERE SobjectType = 'Opportunity' AND Name = 'Inkind') As RecordTypeId
,CAST('' as nvarchar(255))												As CampaignId ---Need to populate only for donation and Pledges
,'FALSE'																as IsPrivate
,'COMPLETED'																As StageName
,CASE rtrim(ltrim(xx.ACK_FLAG))	
WHEN '' THEN 'FALSE'
ELSE 'TRUE'
END										                                As rC_Giving__Acknowledged__c,
CASE CAST(rtrim(ltrim(xx.TY_DT)) AS Datetime2)	
WHEN '1899-12-30 00:00:00.0000000' THEN NULL	
ELSE CAST(rtrim(ltrim(xx.TY_DT)) AS Datetime2)	
END													    As rC_Giving__Acknowledged_Date__c
,'IN-KIND'																As rC_Giving__Activity_Type__c

,CAST('' as nvarchar(max))										        As rC_Giving__Anniversary_Date__c
,CAST('' as nvarchar(max))											    As rC_Giving__Anniversary_Renewal_Date__c
,'FALSE'																As rC_Giving__Archive_Flag__c
,'NEW'																	As rC_Giving__Calculated_Giving_Type__c
,rtrim(ltrim(xx.checknbr))												As rC_Giving__Check_Number__c
,CAST('' as nvarchar(255))												As rC_Giving__Closed_Amount__c
,CAST(rtrim(ltrim(xx.[DATE])) AS datetime2)								                As rC_Giving__Close_Date_Time__c
,CAST(rtrim(ltrim(xx.GNARR)) As nvarchar(max))												As rC_Giving__Comments__c
,CAST('' as nvarchar(255))												As rC_Giving__Current_Giving_Amount__c
,CAST('' as nvarchar(255))												As rC_Giving__Expected_Giving_Amount__c
,'METRO-INKIND-'+CAST(rtrim(ltrim(xx.GIDNUMB))	as nvarchar(100))									As External_id__c
                                                                      --As rC_Giving__Fill_Rate__c
,'False'																As rC_Giving__Is_Giving__c
,CAST('' as nvarchar(255))												As rC_Giving__Giving_Amount__c
,'False'																As rC_Giving__Is_Giving_Donation__c
,CAST('' as nvarchar(255))											    As rC_Giving__Giving_Frequency__c
,'TRUE'															        As rC_Giving__Is_Giving_Inkind__c
,'FALSE'																As rC_Giving__Is_Giving_Membership__c
,'False'																AS rC_Giving__Is_Giving_Purchase__c
,'False'																as rC_Giving__Is_Giving_Transaction__c
,'NEW'																	as rC_Giving__Giving_Type__c
,'Fiscal Year'															As rC_Giving__Giving_Type_Engine__c
,CAST('' as nvarchar(50))												As rC_Giving__Giving_Years__c
,'0'																	As rC_Giving__Last_Giving_Amount_Adjustment__c


,CAST('' as nvarchar(50))																As rC_Giving__Matching_Status__c
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
---,CAST(rtrim(ltrim(xx.GNARR)) As nvarchar(max))						As rC_Giving__Payment_Reference_Number__c
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
WHEN 'N' THEN 'NONE'
WHEN 'G' THEN 'GUEST'
WHEN 'O' THEN 'On Behalf Of'
WHEN 'T' then 'Generosity Of'
WHEn 'S' THEN 'In Support Of'
WHEN 'Z' THEN 'Matching Gift'
END 																As rC_Giving__Tribute_Type__c
,rtrim(ltrim(xx.donor))												As donor
,CAST('' as nvarchar(255))                                         As rC_Giving__Matching_Account__c
,CAST('' as nvarchar(255))                                         As rC_Giving__Matching_Amount__c 
,CAST('' as nvarchar(255))                                         As rC_Giving__Matching_Opportunity__c
,CAST('' as nvarchar(100))											as rc_giving__is_Matching__C
,CAST('' as nvarchar(100))											as rc_giving__Matching_Notice__c 
,ltrim(rtrim(xx.sol))                                              As SOL
,rtrim(ltrim(xx.SOL))												as Legacy_Source_Code__c
FROM  
[METRO_UAT1].dbo.dpgift xx
Left join
[Migration_Metro].dbo.Account_stage_Metro a
ON a.donor=rtrim(ltrim(xx.donor))
Left join
 [Migration_Metro].dbo.rC_Giving__Payment_Method__c_Load pay
 ON pay.donor=rtrim(ltrim(xx.donor))
and pay.gifttype=xx.gifttype
WHERE xx.gifttype = 'IK'
UNION
SELECT

CAST('' as nchar(18))                                                  As ID
,CAST('' as nvarchar(255))                                             As Error
,'Migration'															As Acknowledgement_Path__c
,GETDATE()																as Acknowledgement_Path_Date__c
,'C' + xx.CHAPTERGFT												    As Revenue_Location_Code__c
,a.ID																	As AccountId
,rtrim(ltrim(xx.fmv))												    As Amount
,CAST(rtrim(ltrim(xx.[DATE])) AS datetime2)	 										    As CloseDate											

,Concat(a.Name,' ','IN KIND',' ', LEFT(CONVERT(VARCHAR, rtrim(ltrim(xx.WO_DT)), 120),4)) As Name
																	
,'0053D000000INtD'														As OwnerId
,(SELECT Id FROM [Migration_target_QA].dbo.RecordType WHERE SobjectType = 'Opportunity' AND Name = 'Inkind') As RecordTypeId
,CAST('' as nvarchar(255))												As CampaignId ---Need to populate only for donation and Pledges
,'FALSE'																as IsPrivate
,'COMPLETED'																As StageName
,CASE rtrim(ltrim(xx.ACK_FLAG))	
WHEN '' THEN 'FALSE'
ELSE 'TRUE'
END										                                As rC_Giving__Acknowledged__c,
CASE CAST(rtrim(ltrim(xx.TY_DT)) AS Datetime2)	
WHEN '1899-12-30 00:00:00.0000000' THEN NULL	
ELSE CAST(rtrim(ltrim(xx.TY_DT)) AS Datetime2)	
END													    As rC_Giving__Acknowledged_Date__c
,'IN-KIND'																As rC_Giving__Activity_Type__c

,CAST('' as nvarchar(max))										        As rC_Giving__Anniversary_Date__c
,CAST('' as nvarchar(max))											    As rC_Giving__Anniversary_Renewal_Date__c
,'FALSE'																As rC_Giving__Archive_Flag__c
,'NEW'																	As rC_Giving__Calculated_Giving_Type__c
,rtrim(ltrim(xx.checknbr))												As rC_Giving__Check_Number__c
,CAST('' as nvarchar(255))												As rC_Giving__Closed_Amount__c
,CAST(rtrim(ltrim(xx.[DATE])) AS datetime2)								                As rC_Giving__Close_Date_Time__c
,CAST(rtrim(ltrim(xx.GNARR)) As nvarchar(max))												As rC_Giving__Comments__c
,CAST('' as nvarchar(255))												As rC_Giving__Current_Giving_Amount__c
,CAST('' as nvarchar(255))												As rC_Giving__Expected_Giving_Amount__c
,'METRO-INKIND-'+rtrim(ltrim(xx.GIDNUMB1))										As External_id__c
                                                                      --As rC_Giving__Fill_Rate__c
,'False'																As rC_Giving__Is_Giving__c
,CAST('' as nvarchar(255))												As rC_Giving__Giving_Amount__c
,'False'																As rC_Giving__Is_Giving_Donation__c
,CAST('' as nvarchar(255))											    As rC_Giving__Giving_Frequency__c
,'TRUE'															        As rC_Giving__Is_Giving_Inkind__c
,'FALSE'																As rC_Giving__Is_Giving_Membership__c
,'False'																AS rC_Giving__Is_Giving_Purchase__c
,'False'																as rC_Giving__Is_Giving_Transaction__c
,'NEW'																	as rC_Giving__Giving_Type__c
,'Fiscal Year'															As rC_Giving__Giving_Type_Engine__c
,CAST('' as nvarchar(50))												As rC_Giving__Giving_Years__c
,'0'																	As rC_Giving__Last_Giving_Amount_Adjustment__c


,CAST('' as nvarchar(50))																As rC_Giving__Matching_Status__c
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
----,CAST(rtrim(ltrim(xx.GNARR)) As nvarchar(max))					As rC_Giving__Payment_Reference_Number__c
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
WHEN 'N' THEN 'NONE'
WHEN 'G' THEN 'GUEST'
WHEN 'O' THEN 'On Behalf Of'
WHEN 'T' then 'Generosity Of'
WHEn 'S' THEN 'In Support Of'
WHEN 'Z' THEN 'Matching Gift'
END 																As rC_Giving__Tribute_Type__c
,rtrim(ltrim(xx.donor))												As donor
,CAST('' as nvarchar(255))                                         As rC_Giving__Matching_Account__c
,CAST('' as nvarchar(255))                                         As rC_Giving__Matching_Amount__c 
,CAST('' as nvarchar(255))                                         As rC_Giving__Matching_Opportunity__c
,CAST('' as nvarchar(100))											as rc_giving__is_Matching__C
,CAST('' as nvarchar(100))											as rc_giving__Matching_Notice__c
,ltrim(rtrim(xx.sol))                                              As SOL
,rtrim(ltrim(xx.SOL))												as Legacy_Source_Code__c
FROM  
[METRO_UAT1].dbo.DPother xx
Left join
[Migration_Metro].dbo.Account_stage_Metro a
ON a.donor=rtrim(ltrim(xx.donor))
Left join
 [Migration_Metro].dbo.rC_Giving__Payment_Method__c_Load pay
 ON pay.donor=rtrim(ltrim(xx.donor))
and pay.gifttype=xx.gifttype
WHERE xx.gifttype = 'IK'
) yy

---------------------------------------------------------------------------------------------------------------------------------
--UPDATEING rC_Giving__Payer_Name__c
---------------------------------------------------------------------------------------------------------------------------------
update [Migration_Metro].dbo.[opportunity_INKIND] 
set rC_Giving__Payer_Name__c=
Concat(rtrim(ltrim(FIRSTNAME)),' ',rtrim(ltrim(LASTNAME))) 
from
Migration_Metro.dbo.Contact_stage_Metro c
left join
[Migration_Metro].dbo.[opportunity_INKIND] oi
on oi.donor=c.Donor
where right(c.External_Id__C,2)!='-2'

---------------------------------------------------------------------------------------------------------------------------------
--UPDATEING rC_Giving__Matching_Account__c
-------------------------------------------------------------------------------------------------------------------------------
update d
set d.rC_Giving__Matching_Account__c= a.ID 
from
[Migration_Metro].dbo.[opportunity_INKIND]d 
Left join
[Migration_Metro].dbo.[Account_stage_Metro] a
ON d.donor=a.donor
left Join
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
Left JOIN
[Migration_METRO].dbo.[opportunity_INKIND] p
on rtrim(ltrim(xx.gidnumb)) =substring(p.[External_id__c],14,Len(p.[External_id__c])) 
Left join
(select [External_id__c] ,id FROM [Migration_METRO].dbo.[opportunity_INKIND]
union
select [External_id__c] ,id FROM [Migration_METRO].dbo.[opportunity_Donation]
union
select [External_id__c] ,id FROM [Migration_METRO].dbo.[opportunity_TRANSACTION_Final]
union
select [External_id__c] ,id FROM [Migration_METRO].dbo.[opportunity_GRANT]
union
select [External_id__c] ,id  FROM [Migration_METRO].dbo.[opportunity_Pledge]) a
on rtrim(ltrim(xx.glink)) =reverse(SUBSTRING(reverse(a.External_id__c),1,charindex('-',reverse(a.External_id__c))-1))
where CAST(xx.glink as nvarchar(100))
=reverse(SUBSTRING(reverse(a.External_id__c),1,charindex('-',reverse(a.External_id__c))-1)) 



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
Left JOIN
[Migration_METRO].dbo.[opportunity_INKIND] p
on rtrim(ltrim(xx.gidnumb)) =substring(p.[External_id__c],14,Len(p.[External_id__c])) 
Left join
(select [External_id__c] ,id FROM [Migration_METRO].dbo.[opportunity_INKIND]
union
select [External_id__c] ,id FROM [Migration_METRO].dbo.[opportunity_Donation]
union
select [External_id__c] ,id FROM [Migration_METRO].dbo.[opportunity_TRANSACTION_Final]
union
select [External_id__c] ,id FROM [Migration_METRO].dbo.[opportunity_GRANT]
union
select [External_id__c] ,id  FROM [Migration_METRO].dbo.[opportunity_Pledge]) a
on rtrim(ltrim(xx.glink)) =reverse(SUBSTRING(reverse(a.External_id__c),1,charindex('-',reverse(a.External_id__c))-1))
where CAST(xx.glink as nvarchar(100))
=reverse(SUBSTRING(reverse(a.External_id__c),1,charindex('-',reverse(a.External_id__c))-1)) 

-----updating rc_giving__is_Matching__C 

update a
set a.rc_giving__is_Matching__C='TRUE'
from 
(Select CAST(gidnumb as nvarchar(255))gidnumb, glink,sol,donor,amt from [METRO_UAT1].dbo.dpgift 
where glink != gidnumb and glink != '0' 
UNION
Select CAST(gidnumb1 as nvarchar(255))gidnumb, glink,sol,donor,amt from [METRO_UAT1].dbo.DPOTHER 
where glink != gidnumb1 and glink != '0' 
)xx
Left JOIN
[Migration_METRO].dbo.[opportunity_Pledge] a
on rtrim(ltrim(xx.GIDNUMB))=substring(a.[External_id__c],14,Len(a.[External_id__c]))

-----------------------------------------------
----updating rC_Giving__Matching_Status__c

Update [Migration_Metro].dbo.opportunity_INKIND
SET rC_Giving__Matching_Status__c='Approved'
from 
(Select CAST(gidnumb as nvarchar(255))gidnumb, glink,sol,donor,amt from [METRO_UAT1].dbo.dpgift 
where glink != gidnumb and glink != '0' 
UNION
Select CAST(gidnumb1 as nvarchar(255))gidnumb, glink,sol,donor,amt from [METRO_UAT1].dbo.DPOTHER 
where glink != gidnumb1 and glink != '0' 
)xx
Left JOIN
[Migration_METRO].dbo.[opportunity_Pledge] a
on rtrim(ltrim(xx.GIDNUMB))=substring(a.[External_id__c],14,Len(a.[External_id__c]))
------------------------------------

----updating rc_giving__Matching_Notice__c 
Update [Migration_Metro].dbo.opportunity_INKIND
SET rc_giving__Matching_Notice__c=' '
from 
(Select CAST(gidnumb as nvarchar(255))gidnumb, glink,sol,donor,amt from [METRO_UAT1].dbo.dpgift 
where glink != gidnumb and glink != '0' 
UNION
Select CAST(gidnumb1 as nvarchar(255))gidnumb, glink,sol,donor,amt from [METRO_UAT1].dbo.DPOTHER 
where glink != gidnumb1 and glink != '0' 
)xx
Left JOIN
[Migration_METRO].dbo.[opportunity_Pledge] a
on rtrim(ltrim(xx.GIDNUMB))=substring(a.[External_id__c],14,Len(a.[External_id__c]))







--- Insert/Update records
-- use [Migration_Metro]
-- Exec SF_BulkOps 'Insert:bulkapi,parallel,Batchsize(10000)', 'TSAC_MIGR', 'opportunity_INKIND'

