-- Drop staging tables
drop table [Migration_Metro].dbo.TASK_LOAD

--Replicate Data

--USe [Migration_Target_QA]
--exec SF_Replicate ' TSAC_MIGR', 'USER'
--exec SF_Replicate ' TSAC_MIGR', 'RecordType'




--create Staging Table


SELECT 
CAST(' ' as nchar(18))                                                  As ID
,CAST(' ' as nvarchar(255))                                             As Error,
'0053D000000INtD'														As ownerID
,CAST(rtrim(ltrim(x.bywhom)) + char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(x.Purpose))
 + char(13) + rtrim(ltrim(x.Fol_detail))+ char(13) + rtrim(ltrim(y.Descr)) as nvarchar(MAX)) as Description
---,'0053D000000INtD' 														As CreatedById
,CASE CAST(rtrim(ltrim(x.Comp_Dt))	as datetime2)	
WHEN '1899-12-30 00:00:00.0000000' THEN ''
Else 	CAST(rtrim(ltrim(x.Comp_Dt))	as datetime2)									
END																		As ActivityDate
,con.ID																	as WhoId
,a.id																	As WhatId
,'Completed'															As Status
,CASE 
WHEN rtrim(ltrim(x.activity)) IN('1CAL') THEN 'Phone Call'  
WHEN rtrim(ltrim(x.activity))='1VOI' THEN 'Voice Mail'
WHEN rtrim(ltrim(x.activity))='2INT' THEN 'Introduction Letter'
WHEN rtrim(ltrim(x.activity)) IN('2LET','LETT') THEN 'Sent Letter'
WHEN rtrim(ltrim(x.activity)) ='2SNL' THEN 'Sent Newsletter'
WHEN rtrim(ltrim(x.activity)) ='2TYS' THEN 'Sent Thank You'
WHEN rtrim(ltrim(x.activity)) in('3CRD')THEN 'Sent Holiday Card'
WHEN rtrim(ltrim(x.activity)) ='3INV' THEN 'Sent Invitation'
WHEN rtrim(ltrim(x.activity)) in('4EML')then 'Internet / Email'
WHEN rtrim(ltrim(x.activity)) in('5VST')then 'Visit'
WHEN rtrim(ltrim(x.activity)) ='7REC'then 'Recruitment'
WHEN rtrim(ltrim(x.activity)) in('6MSC')then 'General Comment'
WHEN rtrim(ltrim(x.activity)) ='ATND' then 'Attendee'
WHEN rtrim(ltrim(x.activity)) ='COMP'then 'Donor Complained'
WHEN rtrim(ltrim(x.activity)) ='DVST'then 'Donor Visit'
WHEN rtrim(ltrim(x.activity)) ='FAXX' then 'Fax'
WHEN rtrim(ltrim(x.activity)) ='GPRP'then 'Sent Grant Proposal'
WHEN rtrim(ltrim(x.activity)) ='GRPT'then 'Submitted Grant'
WHEN rtrim(ltrim(x.activity)) ='INHM'then 'In-House Mailing'
WHEN rtrim(ltrim(x.activity)) ='MLAE'then 'Annual Report (Email)'
WHEN rtrim(ltrim(x.activity)) ='MLAM'then 'Annual Report (Mail)'
WHEN rtrim(ltrim(x.activity)) ='MLCT'then 'Other Vendor Mailing'
WHEN rtrim(ltrim(x.activity)) ='MLED'then 'You Made a Difference (Email)'
WHEN rtrim(ltrim(x.activity)) ='MLEF'then 'Follow Up (Email)'
WHEN rtrim(ltrim(x.activity)) ='MLEG'then 'Gap Communication (Email)'
WHEN rtrim(ltrim(x.activity)) ='MLEI'then 'Intro (Email)'
WHEN rtrim(ltrim(x.activity)) ='MLES'then 'Impact Story (Email)'
WHEN rtrim(ltrim(x.activity)) ='MLET'then 'Thank You (Email)'
WHEN rtrim(ltrim(x.activity)) ='MLEU'then 'Unscheduled (Email)'
WHEN rtrim(ltrim(x.activity)) ='MLEV'then 'Thank You Video (Email)'
WHEN rtrim(ltrim(x.activity)) ='MLEX'then 'Survey (Email)'
WHEN rtrim(ltrim(x.activity)) ='MLFE'then 'Fundraising (Email)'
WHEN rtrim(ltrim(x.activity)) ='MLFM'then 'Fundraising (Mail)'
WHEN rtrim(ltrim(x.activity)) ='MLFP'then 'Fundraising (Phone)'
WHEN rtrim(ltrim(x.activity)) ='MLMD'then 'You Made a Difference (Mail)'
WHEN rtrim(ltrim(x.activity)) ='MLMF'then 'Follow Up (Mail)'
WHEN rtrim(ltrim(x.activity)) ='MLMG'then 'Gap Communication (Mail)'
WHEN rtrim(ltrim(x.activity)) ='MLMI'then 'Intro Letter (Mail)'
WHEN rtrim(ltrim(x.activity)) ='MLMN'then 'Newsletter (Mail)'
WHEN rtrim(ltrim(x.activity)) ='MLMS'then 'Impact Story (Mail)'
WHEN rtrim(ltrim(x.activity)) ='MLMT'then 'Thank You (Mail)'
WHEN rtrim(ltrim(x.activity)) ='MLMU'then 'Unscheduled (Mail)'
WHEN rtrim(ltrim(x.activity)) ='MLMX'then 'Survey (Mail)'
WHEN rtrim(ltrim(x.activity)) ='MLMY'then 'Year to Date Impact Statement (Mail)'
WHEN rtrim(ltrim(x.activity)) ='MLPD'then 'You Made a Difference (Phone)'
WHEN rtrim(ltrim(x.activity)) ='MLPF'then 'Follow Up (Phone)'
WHEN rtrim(ltrim(x.activity)) ='MLPG'then 'Gap Communication (Phone)'
WHEN rtrim(ltrim(x.activity)) ='MLPI'then 'Intro (Phone)'
WHEN rtrim(ltrim(x.activity)) ='MLPT'then 'Thank You (Phone)'
WHEN rtrim(ltrim(x.activity)) ='MLPU'then 'Unscheduled (Phone)'
WHEN rtrim(ltrim(x.activity)) ='MLPX'then 'Survey (Phone)'

WHEN rtrim(ltrim(x.activity)) ='MSPM'then 'Sent TSM Mailing'

WHEN rtrim(ltrim(x.activity)) ='OVMC'then 'OVM Call'
WHEN rtrim(ltrim(x.activity)) ='PGIV'then 'Sent P. Giving Packet'
WHEN rtrim(ltrim(x.activity)) ='PGML'then 'Planned Giving Mailing'
WHEN rtrim(ltrim(x.activity)) ='PROP'then 'Proposal Sent'
WHEN rtrim(ltrim(x.activity)) ='PRYG'then 'Prayer - Gift Advisor'
WHEN rtrim(ltrim(x.activity)) ='PRYO'then 'Prayer - Other'
WHEN rtrim(ltrim(x.activity)) ='PRYP'then 'Prayer - Phone'
WHEN rtrim(ltrim(x.activity)) ='PRYR'then 'Prayer - Remit'
WHEN rtrim(ltrim(x.activity)) ='PRYT'then 'Prayer - TrueSense'
WHEN rtrim(ltrim(x.activity)) ='RSVN'then 'RSVP No'
WHEN rtrim(ltrim(x.activity)) ='RSVY'then 'RSVP Yes'
WHEN rtrim(ltrim(x.activity)) ='SVOL'then 'Sent Volunteer Info'
WHEN rtrim(ltrim(x.activity)) ='TOUR'then 'Donor Toured Facilities'
WHEN rtrim(ltrim(x.activity)) ='TTCA'then 'TT:Phone call made'
WHEN rtrim(ltrim(x.activity)) ='TTCN'then 'TT:Call & Note'
WHEN rtrim(ltrim(x.activity)) ='TTDE'then 'TT:New DE Program Donor'
WHEN rtrim(ltrim(x.activity)) ='TTDG'then 'TT:Downgrade DE Program Tier'
WHEN rtrim(ltrim(x.activity)) ='TTEL'then 'TT:New ELITED Donor'
WHEN rtrim(ltrim(x.activity)) ='TTLE'then 'TT:Upgrade LOWMID to ELITED'
WHEN rtrim(ltrim(x.activity)) ='TTLO'then 'TT:New LOWMID Donor'
WHEN rtrim(ltrim(x.activity)) ='TTLU'then 'TT:Upgrade LOWMID to UPPMID'
WHEN rtrim(ltrim(x.activity)) ='TTNC'then 'TT:No contact made'
WHEN rtrim(ltrim(x.activity)) ='TTNO'then 'TT:Note sent'
WHEN rtrim(ltrim(x.activity)) ='TTRM'then 'TT:Removed from program'
WHEN rtrim(ltrim(x.activity)) ='TTUE'then 'TT:Upgrade UPPMID to ELITED'
WHEN rtrim(ltrim(x.activity)) ='TTUG'then 'TT:Upgrade DE Program Tier'
WHEN rtrim(ltrim(x.activity)) ='TTUP'then 'TT:New UPPMID Donor'



END 																		As Subject
,CASE 
WHEN rtrim(ltrim(x.activity)) in('1CAL','1VOI','MLFP','MLPD','MLPF','MLPF','MLPG','MLPI','MLPT','MLPU','MLPX','OVMC','TTCA','TTCN')THEN 'Phone Contact'
WHEN rtrim(ltrim(x.activity)) in('2INT','2SNL','3INV','TTNO') then 'Written Contact'
WHEN rtrim(ltrim(x.activity)) in('5VST','DVST','TOUR')THEN 'In-Person Visit'
WHEN rtrim(ltrim(x.activity)) in('INHM','MLMI','MLMT','MLMU','MLMY','PGML','PROP','SVOL')THEN 'Personalized Mailing'
WHEN rtrim(ltrim(x.activity)) in('2LET','3CRD','MLAM','MLCT','MLFM','MLMD','MLMF','MLMG','MLMN','MLMS','MLMX','MSPM','PGIV')THEN 'Mass Mailing'
WHEN rtrim(ltrim(x.activity)) in('4EML','FAXX','MLAE','MLED','MLEF','MLEG','MLEI','MLES','MLET','MLEU','MLEV','MLEX','MLFE')THEN 'ONLINE'
WHEN rtrim(ltrim(x.activity)) in('2TYS','6MSC','7REC','ATND','COMP','GPRP','GRPT','PRYG','PRYO','PRYP','PRYR','PRYT','RSVN','RSVY','TTDE','TTDG','TTEL','TTLE','TTLO','TTLU','TTNC','TTRM','TTUE','TTUG','TTUP') THEN 'Other Contact'
END 																		As [TYPE]
,'FALSE'																	as IsVisibleInSelfService
,'FALSE'																	as rC_Bios__Archive_Flag__c
,rtrim(ltrim(x.donor)) as donor

INTO [Migration_Metro].dbo.Task_LOAD

FROM  [METRO_UAT1].dbo.dpother2 x
inner join [METRO_UAT1].dbo.dpcodes y 
ON y.code=x.activity 
Left join 
[Migration_Metro].dbo.Contact_stage_Metro con
On con.donor=rtrim(ltrim(x.donor))
Left Join
[Migration_Metro].dbo.Account_stage_Metro a
ON a.donor=rtrim(ltrim(x.donor))

WHERE x.activity IN ('MLCT',
'COMP',
'DVST',
'GRPT',
'MSPM',
'OVMC',
'PGIV',
'SVOL',
'TOUR',
'TTCA',
'TTCN',
'TTDE',
'TTDG',
'TTEL',
'TTLE',
'TTLO',
'TTLU',
'TTNC',
'TTNO',
'TTRM',
'TTUE',
'TTUG',
'TTUP',
'PRYO',
'PRYT',
'PRYG',
'1VOI',
'PGML',
'INHM',
'2SNL',
'3INV',
'2INT',
'FAXX',
'RSVY',
'RSVN',
'ATND',
'GPRP',
'PRYP',
'PRYR',
'1CAL',
'3CRD',
'4EML',
'2LET',
'6MSC',
'5VST',
'PROP',
'MLMI',
'MLMS',
'MLES',
'MLMN',
'MLMY',
'MLEV',
'MLEG',
'MLMG',
'MLPG',
'MLET',
'MLMT',
'MLPT',
'MLEF',
'MLMF',
'MLPF',
'MLPI',
'MLEI',
'MLPD',
'MLED',
'MLMD',
'MLEU',
'MLMU',
'MLPU',
'MLEX',
'MLMX',
'MLPX',
'MLFP',
'MLFE',
'MLFM',
'MLAM',
'MLAE',
'2TYS',
'7REC')and x.cr_dt> DATEADD(yyyy,-1,CAST(GETDATE() AS DATE))AND
right(con.External_Id__C,2)!='-2' and right(con.External_Id__C,2)!='-3'
order by [WhoId]

------------------------------------------------------------------

--- Insert/Update records
use [Migration_Metro]
Exec SF_BulkOps 'Insert:bulkapi,Parallel,batchsize(10000)', 'TSAC_MIGR', 'TASK_Load'


---check errors

select count(*) from [Migration_Metro].dbo.[TASK_LOAD] where id=''





-- Replicate Data
use [Migration_Target_QA]
exec SF_Refresh 'TSAC_MIGR', 'TASK','yes'

