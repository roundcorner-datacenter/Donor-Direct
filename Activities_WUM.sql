-- Drop staging tables
drop table [Migration_WUM].dbo.TASK_LOAD

--Replicate Data

--USe [Migration_Target_QA]
--exec SF_Replicate 'TSAC_MIGR', 'USER'
--exec SF_Replicate 'TSAC_MIGR', 'RecordType'




--create Staging Table


SELECT

CAST('' as nchar(18))                                                  As ID
,CAST('' as nvarchar(255))                                             As Error
,'0053D000000IrLq'														As ownerID
,CASE rtrim(ltrim(x.bywhom)) 
WHEN 'MSP' THEN 
'TrueSense Marketing' + char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))
WHEN 'BPR' THEN CAST('Barbara Richter'+ char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr)) as nvarchar(MAX))
WHEN 'CZR' THEN CAST('Cindy Rivera'+ char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr)) as nvarchar(MAX))
WHEN 'DZC' THEN CAST('Diane Cleveland'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'GZM' THEN CAST('George Marasco'+ char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'JZJ'THEN CAST('Jackie Jensen-Utz'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'KZG' THEN CAST('Karen Gehrke'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'LCZ' THEN CAST('Lauren Zarder'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'LZP'THEN CAST('Lynn Pappas'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'NZP' THEN CAST('Nancy Pleasants'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'RCW' THEN CAST('Ruth Wagner'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'SZK' THEN CAST('Stan Kelley'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'SZW' THEN CAST('Steve Watson'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'CRP' THEN CAST('Corps Officer'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'RZW' THEN CAST('Robb Waugus'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'LZK' THEN CAST('Lindee Kimball'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'RAS'THEN 
CAST('Ruth Ann Schoer'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'SZS' THEN CAST('Sandy Steffes'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'TMG' THEN CAST('Tom McGehee'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'WUM' THEN CAST('WUM In House'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'PSC' THEN CAST('Pat Crowell'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'DZS' THEN CAST('Denise Shaffer'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'KZS' THEN CAST('Karl Strand'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'SRN' THEN CAST('Sheila Nelson'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'TZM' THEN CAST('Tom Mulinix'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'J4P' THEN CAST('Jim Peterson'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'TSM' THEN CAST('TrueSense Marketing'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'H9C' THEN CAST('Heidi Cain'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'G3H' THEN CAST('Gail Hierl'+ char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'TZL' THEN CAST('Tim Litherland'+ char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'EZB' THEN CAST('Elaine Baldwin'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'B4P' THEN CAST('Beverly Peterson'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'JKB' THEN CAST('Jodie Brotherton'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'A8M' THEN CAST('Amberlea Moody'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'R3L' THEN CAST('Rebecca Lesperance'+ char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'J2K' THEN CAST('Jeanne Kliejunas'+ char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'GJS' THEN CAST('Gregory Schmidt'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'J1N' THEN CAST('Julie Nelson'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'CZZ' THEN CAST('Chris Ziemba (Madison)'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'G9V' THEN CAST('Gail Valenti'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'C7B' THEN CAST('Carol Bulgrin'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'S8H' THEN CAST('Steve Heck (Madison)'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'JLE' THEN CAST('Jon Evans'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'J2J' THEN CAST('Jeanne Jentsch'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'JMR' THEN CAST('Jami Ross'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'C8B' THEN CAST('Carol Bulgrin (Prospect)'+ char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'A8B' THEN CAST('Abby Block'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'C0M' THEN CAST('Connie Millard'+ char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'M9M' THEN CAST('Macey Markowitz'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'K4B' THEN CAST('Kyle Bryntesen'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'D7H' THEN CAST('Don Hazaert'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'P7J' THEN CAST('Paige Jorgensen'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'M7V' THEN CAST('Marlene Vadjunec (Madison)'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'P7Z' THEN CAST('Peter Zehren'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'M8V' THEN CAST('Marlene Vadjunec (Prospect)'+ char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'P8J' THEN CAST('Paige Jorgensen (Prospect)'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'P8Z' THEN CAST('Peter Zehren (Prospect)'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'GBG' THEN CAST('Gabriel Group'+ char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
END																		as Description

,rtrim(ltrim(x.Comp_Dt))												As ActivityDate
,con.ID																	as WhoId
,a.id																	As WhatId
,'Complete'																As Status
,CASE 
WHEN rtrim(ltrim(x.activity)) ='CALL' THEN 'Phone Call'  
WHEN rtrim(ltrim(x.activity))='CARD' THEN 'Sent Holiday Card'
WHEN rtrim(ltrim(x.activity))='COMP' THEN 'Donor Complained'
WHEN rtrim(ltrim(x.activity)) ='DVST' THEN 'Donor Visit'
WHEN rtrim(ltrim(x.activity)) ='GENR' THEN 'General Comment'
WHEN rtrim(ltrim(x.activity)) ='GRPT' THEN 'Submitted Grant'
WHEN rtrim(ltrim(x.activity)) ='LETT'THEN 'Sent Letter'
WHEN rtrim(ltrim(x.activity)) ='MSPC' THEN 'TSM Changed Data'
WHEN rtrim(ltrim(x.activity)) ='PGIV'then 'Sent P. Giving Packet'
WHEN rtrim(ltrim(x.activity)) ='PROP'then 'Sent Proposal'
WHEN rtrim(ltrim(x.activity)) ='SPSA'then 'Sent PSA'
WHEN rtrim(ltrim(x.activity))='SVOL'then 'Sent Volunteer Info'
WHEN rtrim(ltrim(x.activity)) ='TOUR' then 'Donor Toured Facilities'
WHEN rtrim(ltrim(x.activity)) ='VIST'then 'Personal Visit'
WHEN rtrim(ltrim(x.activity)) ='MSPM'then 'Sent TSM Mailing'
WHEN rtrim(ltrim(x.activity)) ='ADDR' then 'Address Change'
WHEN rtrim(ltrim(x.activity)) ='WIHM'then 'Sent In-House Mailing'
WHEN rtrim(ltrim(x.activity)) ='TTEL'then 'TT:New ELITED Donor'
WHEN rtrim(ltrim(x.activity)) ='TTUP'then 'TT:New UPPMID Donor'
WHEN rtrim(ltrim(x.activity)) ='TTLO'then 'TT:New LOWMID Donor'
WHEN rtrim(ltrim(x.activity)) ='TTLE'then 'TT:Upgrade LOWMID to ELITED'
WHEN rtrim(ltrim(x.activity)) ='TTUE'then 'TT:Upgrade UPPMID to ELITED'
WHEN rtrim(ltrim(x.activity)) ='TTLU'then 'TT:Upgrade LOWMID to UPPMID'
WHEN rtrim(ltrim(x.activity)) ='TTCA'then 'TT:Phone call made'
WHEN rtrim(ltrim(x.activity)) ='TTNO'then 'TT:Note sent'
WHEN rtrim(ltrim(x.activity)) ='TTCN'then 'TT:Call & Note'
WHEN rtrim(ltrim(x.activity)) ='TTRM'then 'TT:Removed from program'
WHEN rtrim(ltrim(x.activity)) ='TTDE'then 'TT:New DE Program Donor'
WHEN rtrim(ltrim(x.activity)) ='TTUG'then 'TT:Upgrade DE Program Tier'
WHEN rtrim(ltrim(x.activity)) ='TTDG'then 'TT:Downgrade DE Program Tier'
WHEN rtrim(ltrim(x.activity)) ='MMRG'then 'Manual Merge'
WHEN rtrim(ltrim(x.activity)) ='BDCD'then 'Sent Birthday Card'
WHEN rtrim(ltrim(x.activity)) ='TYCD'then 'Sent Thank You Card'
WHEN rtrim(ltrim(x.activity)) ='TTNC'then 'TT:No contact made'
WHEN rtrim(ltrim(x.activity)) ='MLCT'then 'Other Vendor Mailing'
WHEN rtrim(ltrim(x.activity)) ='EVNT'then 'Special Event'



END 																		As Subject
,CASE 
WHEN rtrim(ltrim(x.activity)) ='CALL' THEN 'Phone Call'
WHEN rtrim(ltrim(x.activity)) in('CARD','LETT','SVOL','MSPM','WIHM') then 'Sent Letter/Mailing'
WHEN rtrim(ltrim(x.activity)) ='COMP'THEN 'Donor Complaint'
WHEN rtrim(ltrim(x.activity)) in('DVST','TOUR','VIST')THEN 'In-Person'
WHEN rtrim(ltrim(x.activity)) in('GENR','EVNT')THEN 'General Comment'
WHEN rtrim(ltrim(x.activity)) ='GRPT'THEN 'Grants'
WHEN rtrim(ltrim(x.activity)) in('MSPC','ADDR','MMRG') THEN 'Data Change'
WHEN rtrim(ltrim(x.activity)) in('PGIV','PROP','SPSA') THEN 'Planned Giving Mailing'
WHEN rtrim(ltrim(x.activity)) in('TTUP','TTEL','TTLO','TTLE','TTUE','TTLU','TTCA','TTNO','TTCN','TTRM','TTDE','TTUG','TTDG','TTNC') THEN 'Donor Elite'
END 																		As [TYPE]
,'FALSE'																	as IsVisibleInSelfService
,'FALSE'																	as rC_Bios__Archive_Flag__c

,rtrim(ltrim(x.donor)) as donor

INTO [Migration_WUM].dbo.Task_LOAD

FROM  [WUM_UAT1].dbo.dpother2 x
inner join [WUM_UAT1].dbo.dpcodes y 
ON rtrim(ltrim(y.code))=rtrim(ltrim(x.activity ))
Left join 
[Migration_WUM].dbo.Contact_Load con
On con.donor=rtrim(ltrim(x.donor))
Left Join
[Migration_WUM].dbo.Account_Load_WUM a
ON a.donor=rtrim(ltrim(x.donor))

WHERE x.activity IN  ('CALL','CARD','COMP',	'DVST',	'GENR',	'GRPT', 'LETT',	'MSPC',	'PGIV',	'PROP',	'SPSA',	'SVOL',	'TOUR',	'VIST',	'MSPM',	'ADDR',	'WIHM',	
'TTEL',	'TTUP',	'TTLO',	'TTLE',	'TTUE',	'TTLU',	'TTCA',	'TTNO',	'TTCN',	'TTRM',	'TTDE',	'TTUG',	'TTDG',	'MMRG',	'BDCD',	'TYCD',	'TTNC',	'MLCT',	'EVNT')
and x.cr_dt> DATEADD(yyyy,-1,CAST(GETDATE() AS DATE))AND
right(con.External_Id__C,2)!='-2' and right(con.External_Id__C,2)!='-3'
order by WhoID
------------------------------------------------------------------

--- Insert/Update records
use [Migration_WUM]
Exec SF_BulkOps 'Insert:bulkapi,Parallel,batchsize(10000)', 'TSAC_MIGR', 'TASK_Load'


---check errors

select count(*) from [Migration_WUM].dbo.[TASK_LOAD] where id=''





-- Replicate Data
use [Migration_Target_QA]
exec SF_Refresh 'TSAC_MIGR', 'TASK','yes'




