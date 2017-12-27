 -- Drop staging tables
drop table [Migration_WUM].dbo.Account_Load_WUM

--Replicate Data

--USe [Migration_Target_QA]
--exec SF_Replicate 'TSAC_MIGR', 'USER'
--exec SF_Replicate 'TSAC_MIGR', 'RecordType'


--create Staging Table

SELECT

CAST('' as nchar(18))                                                As ID,
CAST('' as nvarchar(255))                                            As Error,
CAST('' as nvarchar(255))										      AS service_location_code__c,
'C'+rtrim(ltrim(p.CHAPTER))											      As Preferred_service_location_code__c,
CASE rtrim(ltrim(p.staff ))
WHEN 'MSP' THEN 'TrueSense Marketing'
WHEN 'BPR' THEN 'Barbara Richter'
WHEN 'CZR' THEN 'Cindy Rivera'
WHEN 'DZC' THEN 'Diane Cleveland'
WHEN 'GZM' THEN 'George Marasco'
WHEN 'JZJ' THEN 'Jackie Jensen-Utz'
WHEN 'KZG' THEN 'Karen Gehrke'
WHEN 'LCZ' THEN 'Lauren Zarder'
WHEN 'LZP' THEN 'Lynn Pappas'
WHEN 'NZP' THEN 'Nancy Pleasants'
WHEN 'RCW' THEN 'Ruth Wagner'
WHEN 'SZK' THEN 'Stan Kelley'
WHEN 'SZW' THEN 'Steve Watson'
WHEN 'CRP' THEN 'Corps Officer'
WHEN 'RZW' THEN 'Robb Waugus'
WHEN 'LZK' THEN 'Lindee Kimball'
WHEN 'RAS' THEN 'Ruth Ann Schoer'
WHEN 'SZS' THEN 'Sandy Steffes'
WHEN 'TMG' THEN 'Tom McGehee'
WHEN 'WUM' THEN 'WUM In House'
WHEN 'PSC' THEN 'Pat Crowell'
WHEN 'DZS' THEN 'Denise Shaffer'
WHEN 'KZS' THEN 'Karl Strand'
WHEN 'SRN' THEN 'Sheila Nelson'
WHEN 'TZM' THEN 'Tom Mulinix'
WHEN 'J4P' THEN 'Jim Peterson'
WHEN 'TSM' THEN 'TrueSense Marketing'
WHEN 'H9C' THEN 'Heidi Cain'
WHEN 'G3H' THEN 'Gail Hierl'
WHEN 'TZL' THEN 'Tim Litherland'
WHEN 'EZB' THEN 'Elaine Baldwin'
WHEN 'B4P' THEN 'Beverly Peterson'
WHEN 'JKB' THEN 'Jodie Brotherton'
WHEN 'A8M' THEN 'Amberlea Moody'
WHEN 'J2K' THEN 'Jeanne Kliejunas'
WHEN 'GJS' THEN 'Gregory Schmidt'
WHEN 'J1N' THEN 'Julie Nelson'
WHEN 'CZZ' THEN 'Chris Ziemba (Madison)'
WHEN 'G9V' THEN 'Gail Valenti'
WHEN 'C7B' THEN 'Carol Bulgrin'
WHEN 'S8H' THEN 'Steve Heck (Madison)'
WHEN 'JLE' THEN 'Jon Evans'
WHEN 'J2J' THEN 'Jeanne Jentsch'
WHEN 'JMR' THEN 'Jami Ross'
WHEN 'C8B' THEN 'Carol Bulgrin (Prospect)'
WHEN 'A8B' THEN 'Abby Block'
WHEN 'C0M' THEN 'Connie Millard'
WHEN 'M9M' THEN 'Macey Markowitz'
WHEN 'K4B' THEN 'Kyle Bryntesen'
WHEN 'D7H' THEN 'Don Hazaert'
WHEN 'P7J' THEN 'Paige Jorgensen'
WHEN 'M7V' THEN 'Marlene Vadjunec (Madison)'
WHEN 'M8V' THEN 'Marlene Vadjunec (Prospect)'
WHEN 'P8J' THEN 'Paige Jorgensen (Prospect)'
WHEN 'P8Z' THEN 'Peter Zehren (Prospect)'
WHEN 'GBG' THEN 'Gabriel Group'
END 								As Primary_Solicitor__c,
CASE rtrim(ltrim(p.MGContact))
WHEN 'MSP' THEN 'TrueSense Marketing'
WHEN 'BPR' THEN 'Barbara Richter'
WHEN 'CZR' THEN 'Cindy Rivera'
WHEN 'DZC' THEN 'Diane Cleveland'
WHEN 'GZM' THEN 'George Marasco'
WHEN 'JZJ' THEN 'Jackie Jensen-Utz'
WHEN 'KZG' THEN 'Karen Gehrke'
WHEN 'LCZ' THEN 'Lauren Zarder'
WHEN 'LZP' THEN 'Lynn Pappas'
WHEN 'NZP' THEN 'Nancy Pleasants'
WHEN 'RCW' THEN 'Ruth Wagner'
WHEN 'SZK' THEN 'Stan Kelley'
WHEN 'SZW' THEN 'Steve Watson'
WHEN 'CRP' THEN 'Corps Officer'
WHEN 'RZW' THEN 'Robb Waugus'
WHEN 'LZK' THEN 'Lindee Kimball'
WHEN 'RAS' THEN 'Ruth Ann Schoer'
WHEN 'SZS' THEN 'Sandy Steffes'
WHEN 'TMG' THEN 'Tom McGehee'
WHEN 'WUM' THEN 'WUM In House'
WHEN 'PSC' THEN 'Pat Crowell'
WHEN 'DZS' THEN 'Denise Shaffer'
WHEN 'KZS' THEN 'Karl Strand'
WHEN 'SRN' THEN 'Sheila Nelson'
WHEN 'TZM' THEN 'Tom Mulinix'
WHEN 'J4P' THEN 'Jim Peterson'
WHEN 'TSM' THEN 'TrueSense Marketing'
WHEN 'H9C' THEN 'Heidi Cain'
WHEN 'G3H' THEN 'Gail Hierl'
WHEN 'TZL' THEN 'Tim Litherland'
WHEN 'EZB' THEN 'Elaine Baldwin'
WHEN 'B4P' THEN 'Beverly Peterson'
WHEN 'JKB' THEN 'Jodie Brotherton'
WHEN 'A8M' THEN 'Amberlea Moody'
WHEN 'J2K' THEN 'Jeanne Kliejunas'
WHEN 'GJS' THEN 'Gregory Schmidt'
WHEN 'J1N' THEN 'Julie Nelson'
WHEN 'CZZ' THEN 'Chris Ziemba (Madison)'
WHEN 'G9V' THEN 'Gail Valenti'
WHEN 'C7B' THEN 'Carol Bulgrin'
WHEN 'S8H' THEN 'Steve Heck (Madison)'
WHEN 'JLE' THEN 'Jon Evans'
WHEN 'J2J' THEN 'Jeanne Jentsch'
WHEN 'JMR' THEN 'Jami Ross'
WHEN 'C8B' THEN 'Carol Bulgrin (Prospect)'
WHEN 'A8B' THEN 'Abby Block'
WHEN 'C0M' THEN 'Connie Millard'
WHEN 'M9M' THEN 'Macey Markowitz'
WHEN 'K4B' THEN 'Kyle Bryntesen'
WHEN 'D7H' THEN 'Don Hazaert'
WHEN 'P7J' THEN 'Paige Jorgensen'
WHEN 'M7V' THEN 'Marlene Vadjunec (Madison)'
WHEN 'M8V' THEN 'Marlene Vadjunec (Prospect)'
WHEN 'P8J' THEN 'Paige Jorgensen (Prospect)'
WHEN 'P8Z' THEN 'Peter Zehren (Prospect)'
WHEN 'GBG' THEN 'Gabriel Group'
END 														as Major_Giving_Contact__c,
CASE rtrim(ltrim(p.PGContact ))
WHEN 'MSP' THEN 'TrueSense Marketing'
WHEN 'BPR' THEN 'Barbara Richter'
WHEN 'CZR' THEN 'Cindy Rivera'
WHEN 'DZC' THEN 'Diane Cleveland'
WHEN 'GZM' THEN 'George Marasco'
WHEN 'JZJ' THEN 'Jackie Jensen-Utz'
WHEN 'KZG' THEN 'Karen Gehrke'
WHEN 'LCZ' THEN 'Lauren Zarder'
WHEN 'LZP' THEN 'Lynn Pappas'
WHEN 'NZP' THEN 'Nancy Pleasants'
WHEN 'RCW' THEN 'Ruth Wagner'
WHEN 'SZK' THEN 'Stan Kelley'
WHEN 'SZW' THEN 'Steve Watson'
WHEN 'CRP' THEN 'Corps Officer'
WHEN 'RZW' THEN 'Robb Waugus'
WHEN 'LZK' THEN 'Lindee Kimball'
WHEN 'RAS' THEN 'Ruth Ann Schoer'
WHEN 'SZS' THEN 'Sandy Steffes'
WHEN 'TMG' THEN 'Tom McGehee'
WHEN 'WUM' THEN 'WUM In House'
WHEN 'PSC' THEN 'Pat Crowell'
WHEN 'DZS' THEN 'Denise Shaffer'
WHEN 'KZS' THEN 'Karl Strand'
WHEN 'SRN' THEN 'Sheila Nelson'
WHEN 'TZM' THEN 'Tom Mulinix'
WHEN 'J4P' THEN 'Jim Peterson'
WHEN 'TSM' THEN 'TrueSense Marketing'
WHEN 'H9C' THEN 'Heidi Cain'
WHEN 'G3H' THEN 'Gail Hierl'
WHEN 'TZL' THEN 'Tim Litherland'
WHEN 'EZB' THEN 'Elaine Baldwin'
WHEN 'B4P' THEN 'Beverly Peterson'
WHEN 'JKB' THEN 'Jodie Brotherton'
WHEN 'A8M' THEN 'Amberlea Moody'
WHEN 'J2K' THEN 'Jeanne Kliejunas'
WHEN 'GJS' THEN 'Gregory Schmidt'
WHEN 'J1N' THEN 'Julie Nelson'
WHEN 'CZZ' THEN 'Chris Ziemba (Madison)'
WHEN 'G9V' THEN 'Gail Valenti'
WHEN 'C7B' THEN 'Carol Bulgrin'
WHEN 'S8H' THEN 'Steve Heck (Madison)'
WHEN 'JLE' THEN 'Jon Evans'
WHEN 'J2J' THEN 'Jeanne Jentsch'
WHEN 'JMR' THEN 'Jami Ross'
WHEN 'C8B' THEN 'Carol Bulgrin (Prospect)'
WHEN 'A8B' THEN 'Abby Block'
WHEN 'C0M' THEN 'Connie Millard'
WHEN 'M9M' THEN 'Macey Markowitz'
WHEN 'K4B' THEN 'Kyle Bryntesen'
WHEN 'D7H' THEN 'Don Hazaert'
WHEN 'P7J' THEN 'Paige Jorgensen'
WHEN 'M7V' THEN 'Marlene Vadjunec (Madison)'
WHEN 'M8V' THEN 'Marlene Vadjunec (Prospect)'
WHEN 'P8J' THEN 'Paige Jorgensen (Prospect)'
WHEN 'P8Z' THEN 'Peter Zehren (Prospect)'
WHEN 'GBG' THEN 'Gabriel Group'
END 																				as Planned_Giving_Contact__c




,CASE 
WHEN p.[type]!='IN' THEN rtrim(ltrim(a.lname))	
WHEN p.[type]='IN'	and a.Title!='' THEN rtrim(ltrim(a.title))+' '+rtrim(ltrim(a.fname))+' '+
rtrim(ltrim(a.lname))+' '+rtrim(ltrim(a.suff))	
WHEN p.[type]='IN'	and a.Title='' THEN rtrim(ltrim(a.fname))+' '+
rtrim(ltrim(a.lname))+' '+rtrim(ltrim(a.suff))	
END																						As Name
,'0053D000000IrLq'                                                      			    As [OwnerID]-- HardCoded because not all Users got Migrated
,CASE [TYPE]
WHEN 'IN' THEN (Select ID from [Migration_Target_QA].dbo.[RECORDTYPE] 
where NAME='Household' and [SobjectType]='Account' )
ELSE (Select ID from [Migration_Target_QA].dbo.[RECORDTYPE] 
where NAME='Organization' and [SobjectType]='Account')
END                                                                     			As RecordTypeId
 
,CAST(rtrim(ltrim(a.[ADD])) As nvarchar(max))                                       As billingStreet
,CAST(rtrim(ltrim(a.st))as nvarchar(max))                                           As billingState
,CAST(rtrim(ltrim(a.zip)) as nvarchar(max))                                         As BillingPostalCode
,CAST(rtrim(ltrim(a.city)) as nvarchar(max))                                        As BillingCity
,CAST('' as nvarchar(100))   														As Phone
,CAST(rtrim(ltrim(a.[ADD])) as nvarchar(max)) 								     	as ShippingStreet
,CAST(rtrim(ltrim(a.City)) as nvarchar(max))                                        As ShippingCity
,CAST(rtrim(ltrim(a.Zip)) as nvarchar(max))                                         As ShippingPostalCode
,CAST(rtrim(ltrim(a.st)) as nvarchar(max)) 											as ShippingState
,CAST('' as nvarchar(255))															As Website

,CAST(rtrim(ltrim(p.ENT_DT)) as nvarchar(max))                                      As rC_Bios__Acquired_Date__c
,'TRUE'																				As rC_Bios__Active__c

,CASE
	WHEN rtrim(ltrim(p.[Type]))IN('FM','IN')THEN 'Household'  
	WHEN rtrim(ltrim(p.[Type]))IN('BS','CH','FN','OR','TR','TS','MN','SC','CF','IA')THEN 'Organization'
	END 																			As rC_Bios__Category__c
,CAST('SEQ'+rtrim(ltrim(p.seq))+'-WUM-DONOR'+rtrim(ltrim(p.donor2))As nvarchar(max))As External_ID__c
,CAST('' as nvarchar(18)) 															As rC_Bios__Preferred_Contact__c	 
  
--,CAST('' as nvarchar(100))   														As rC_Bios__Preferred_Contact_Email__c    
--,CAST('' as nvarchar(100))   										    			As rC_Bios__Preferred_Contact_Phone__c                                              		 		
,CAST(rtrim(ltrim(a.SAL)) as nvarchar(max))                             			As rC_Bios__Salutation__c
,CAST(rtrim(ltrim(p.CYTD)) as nvarchar(max))                            			As rC_Giving__Current_Calendar_Year_Hard_Credit_Amount__c
,CAST(rtrim(ltrim(p.GIFTS_c1)) as nvarchar(max))                        			As rC_Giving__Current_Calendar_Year_Hard_Credit_Count__c
,CAST(rtrim(ltrim(p.YTD)) as nvarchar(max))                                        	As rC_Giving__Current_Year_Hard_Credit_Amount__c
,CAST(rtrim(ltrim(p.GIFTS_f1)) as nvarchar(max))                                    As rC_Giving__Current_Year_Hard_Credit_Count__c
,CAST(rtrim(ltrim(p.IN_AMT ))as nvarchar(max))                                      As rC_Giving__First_Hard_Credit_Amount__c
,CAST(rtrim(ltrim(p.IN_DT)) as nvarchar(max))                                       As rC_Giving__First_Hard_Credit_Date__c
,CAST(rtrim(ltrim(p.MAX_AMT)) as nvarchar(max))                                     As rC_Giving__Largest_Hard_Credit_Amount__c
,CAST(rtrim(ltrim(p.MAX_DT)) as nvarchar(max))                                     	As rC_Giving__Largest_Hard_Credit_Date__c

,CAST(rtrim(ltrim(p.ls_amt)) as nvarchar(max))                                      As rC_Giving__Last_Hard_Credit_Amount__c
,CAST(rtrim(ltrim(p.ls_dt ))as nvarchar(max))                                      			As rC_Giving__Last_Hard_Credit_Date__c
,CAST(rtrim(ltrim(p.gtot)) as nvarchar(max))                                        As rC_Giving__Lifetime_Hard_Credit_Amount__c
,CAST(rtrim(ltrim(p.gifts)) as nvarchar(max))                                       As rC_Giving__Lifetime_Hard_Credit_Count__c

,CAST(rtrim(ltrim(p.LY_CYTD ))as nvarchar(max))                                     As rC_Giving__Prior_Calendar_Year_Hard_Credit_Amount__c
,CAST(rtrim(ltrim(p.GIFTS_C2)) as nvarchar(max))                                    As rC_Giving__Prior_Calendar_Year_Hard_Credit_Count__c
,CAST('' as nvarchar(max))																			As rC_Giving__Is_Sustaining_Giver__c
,'TRUE'                                                                 			As rC_Giving__Track_Hard_Credits__c
,'TRUE'                                                                 			As rC_Giving__Track_Soft_Credits__c
,'FALSE'                                                                			As rC_Giving__Track_Summaries__c
--,'FALSE'                                                               			As rC_Giving__Update_Gift_Membership_Summaries__c
-- ,'FALSE' 																		As rC_Giving__Update_Lifetime_Summaries__c
-- ,'FALSE' 																		as rC_Giving__Update_Summaries__c
,CAST('' as nvarchar(18))  															As rC_Bios__Secondary_Contact__c,
rtrim(ltrim(p.seq))     															as legacy_donor_id__c

,rtrim(ltrim(a.donor))															    AS donor,
CASE 
WHEN addtype !='SPSE' and priority=1 THEN CAST(rtrim(ltrim(p.narr)) as nvarchar(max))  
END                                                                                 AS [Description]


INTO [Migration_WUM].dbo.[Account_Load_WUM]
from 
[WUM_UAT1].dbo.[DPADD] a
 LEFT JOin 
[WUM_UAT1].dbo.[DP] p 
on rtrim(ltrim(a.donor)) = rtrim(ltrim(p.Donor2))

where a.priority='1' and a.Donor!='' and a.lname!=''
------------------------------------------------------------------------------------------------------------------------
--Updating PHONE Coloumn 
-------------------------------------------------------------------------------------------------------------------------
update [Migration_WUM].dbo.Account_Load_WUM 
set Phone= a.phone
from (SELECT ltrim(rtrim(DONOR)) as DONOR,a.phone, PHTYPE, PHorder from [WUM_UAT1].dbo.dpphone a WHERE PHTYPE not in ('EMAI','site','fax','unkn') 
and a.phorder = (SELECT MIN (b.phorder) from [WUM_UAT1].dbo.dpphone b WHERE b.PHTYPE not in ('EMAI','site','fax','unkn') 
and b.donor = a.donor and ltrim(rtrim(donor)) NOT in ('268165','379648','466167'))) a
left join
[Migration_WUM].dbo.Account_Load_WUM b
on rtrim(ltrim(a.donor))=rtrim(ltrim(b.donor))

------------------------------------------------------------------------------------------------------------------------
--Updating Website Column 
-------------------------------------------------------------------------------------------------------------------------

update [Migration_WUM].dbo.Account_Load_WUM
set Website= aa.PHONE from 
(select phtype,rtrim(ltrim(DONOR)) DONOR,DPPHONE.PHONE
from
[WUM_UAT1].dbo.DPPHONE
where 
DPPHONE.PHTYPE='SITE') aa

left join
[Migration_WUM].[dbo].[Account_Load_WUM] b
on aa.donor=rtrim(ltrim(b.donor))

--------------------------------------------------------------------------------------------------------------------------------
---update rC_Giving__Is_Sustaining_Giver__c
Update a
SET a.rC_Giving__Is_Sustaining_Giver__c=CASE 
	WHEN g.SOL in('PL9EFT','PI9EF','SUST99')
	AND writeoff='0'
	AND RECTYPE = 'P' THEN 'TRUE'
	ELSE 'FALSE'
	END 
FROM [Migration_WUM].dbo.[Account_Load_WUM]	a
Inner JOin
[WUM_UAT1].dbo.[DPGIFT]g
On rtrim(ltrim(g.donor))=rtrim(ltrim(a.donor))



---update service_location_code__c

update a
SET a.service_location_code__c='C'+rtrim(ltrim(p.chapter))  
FROM [Migration_WUM].dbo.[Account_Load_WUM] a
inner join
[WUM_UAT1].dbo.dp p
on rtrim(ltrim(p.donor2))=a.donor

--------update Preferred_service_location_code__c
Update x
set x.Preferred_service_location_code__c='C'+rtrim(ltrim(p.chapter))  
FROM [Migration_WUM].dbo.[Account_Load_WUM] x
inner join
[WUM_10K(QA)].dbo.dp p
on rtrim(ltrim(p.donor2))=x.donor


 



--- Insert/Update records
use [Migration_WUM]
Exec SF_BulkOps 'Insert:bulkapi,parallel,Batchsize(10000)', 'TSAC_MIGR', 'Account_Load_WUM'

----check for errors

--select * from [Migration_WUM].[dbo].[Account_Load_WUM] where id=''


-- Replicate Data
use [Migration_Target_QA]
exec SF_Refresh 'TSAC_MIGR', 'Account','YES'



