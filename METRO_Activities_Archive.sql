USE [Migration_METRO_PROD]
GO

/****** Object:  Table [dbo].[TASK_LOAD_ARCHIVE]    Script Date: 8/22/2017 5:41:01 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
DROP TABLE [dbo].[TASK_LOAD_ARCHIVE];

CREATE TABLE [dbo].[TASK_LOAD_ARCHIVE](
	[ETL_ID] [Integer] NOT NULL,
	[ownerID] [varchar](18) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ActivityDate] [varchar](40) NULL,
	[WhoId] [nchar](18) NULL,
	[WhatId] [nchar](18) NULL,
	[Status] [varchar](9) NOT NULL,
	[Subject] [varchar](50) NULL,
	[TYPE] [varchar](22) NULL,
	[IsVisibleInSelfService] [varchar](5) NOT NULL,
	[rC_Bios__Archive_Flag__c] [varchar](5) NOT NULL,
	[donor] [varchar](7) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

alter table [METRO_PROD].dbo.dpother2 add activity_trim varchar(4);
update [METRO_PROD].dbo.dpother2 set activity_trim = rtrim(ltrim(activity));
create index  dpother2_donorid_idx on [METRO_PROD].dbo.dpother2(donor_trim);
create index  dpother2_activityid_idx on [METRO_PROD].dbo.dpother2(activity_trim);

alter table [METRO_PROD].dbo.dpcodes add code_trim varchar(22);
update [METRO_PROD].dbo.dpcodes set code_trim = rtrim(ltrim(code));
create index  dpcodes_code_idx on [METRO_PROD].dbo.dpcodes(code_trim);

DROP  SEQUENCE [dbo].[seq_task_load_archive] ;

CREATE SEQUENCE [dbo].[seq_task_load_archive] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
GO


--create Staging Table

INSERT INTO [dbo].[TASK_LOAD_ARCHIVE]
SELECT 
		NEXT VALUE FOR seq_task_load_archive AS ETL_ID,
(select ID FROM [Migration_Target].dbo.[USER] where name ='Thomas Babbitt')			 As ownerID
,CASE
WHEN  rtrim(ltrim(x.mailing)) !='' THEN
CAST(rtrim(ltrim(x.bywhom)) + char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(x.Purpose))
 + char(13) + rtrim(ltrim(x.Fol_detail))+ char(13) + rtrim(ltrim(y.Descr)) +char(13) + rtrim(ltrim(x.mailing)) as nvarchar(MAX))

ELSE 
CAST(rtrim(ltrim(x.bywhom)) + char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(x.Purpose))
 + char(13) + rtrim(ltrim(x.Fol_detail))+ char(13) + rtrim(ltrim(y.Descr))as nvarchar(MAX))
END																					as Description
--,(select ID FROM [Migration_Target].dbo.[USER] where name ='Migration User')		as CreatedByID

									
,CASE CAST(rtrim(ltrim(x.Comp_Dt))	as datetime2)	
WHEN '1899-12-30 00:00:00.0000000' THEN NULL
Else CAST(rtrim(ltrim(x.Comp_Dt))	as datetime2)									
END																		As ActivityDate
,CAST('' as nvarchar(18))												as WhoId
,a.id																	As WhatId
,'Completed'															As Status
,CASE 
WHEN x.activity_trim IN('1CAL') THEN 'Phone Call'  
WHEN x.activity_trim ='1VOI' THEN 'Voice Mail'
WHEN x.activity_trim ='2INT' THEN 'Introduction Letter'
WHEN x.activity_trim  IN('2LET','LETT') THEN 'Sent Letter'
WHEN x.activity_trim  ='2SNL' THEN 'Sent Newsletter'
WHEN x.activity_trim  ='2TYS' THEN 'Sent Thank You'
WHEN x.activity_trim  in('3CRD')THEN 'Sent Holiday Card'
WHEN x.activity_trim  ='3INV' THEN 'Sent Invitation'
WHEN x.activity_trim  in('4EML')then 'Internet / Email'
WHEN x.activity_trim  in('5VST')then 'Visit'
WHEN x.activity_trim  ='7REC'then 'Recruitment'
WHEN x.activity_trim  in('6MSC')then 'General Comment'
WHEN x.activity_trim  ='ATND' then 'Attendee'
WHEN x.activity_trim  ='COMP'then 'Donor Complained'
WHEN x.activity_trim  ='DVST'then 'Donor Visit'
WHEN x.activity_trim  ='FAXX' then 'Fax'
WHEN x.activity_trim  ='GPRP'then 'Sent Grant Proposal'
WHEN x.activity_trim  ='GRPT'then 'Submitted Grant'
WHEN x.activity_trim  ='INHM'then 'In-House Mailing'
WHEN x.activity_trim  ='MLAE'then 'Annual Report (Email)'
WHEN x.activity_trim  ='MLAM'then 'Annual Report (Mail)'
WHEN x.activity_trim  ='MLCT'then 'Other Vendor Mailing'
WHEN x.activity_trim  ='MLED'then 'You Made a Difference (Email)'
WHEN x.activity_trim  ='MLEF'then 'Follow Up (Email)'
WHEN x.activity_trim  ='MLEG'then 'Gap Communication (Email)'
WHEN x.activity_trim  ='MLEI'then 'Intro (Email)'
WHEN x.activity_trim  ='MLES'then 'Impact Story (Email)'
WHEN x.activity_trim  ='MLET'then 'Thank You (Email)'
WHEN x.activity_trim  ='MLEU'then 'Unscheduled (Email)'
WHEN x.activity_trim  ='MLEV'then 'Thank You Video (Email)'
WHEN x.activity_trim  ='MLEX'then 'Survey (Email)'
WHEN x.activity_trim  ='MLFE'then 'Fundraising (Email)'
WHEN x.activity_trim  ='MLFM'then 'Fundraising (Mail)'
WHEN x.activity_trim  ='MLFP'then 'Fundraising (Phone)'
WHEN x.activity_trim  ='MLMD'then 'You Made a Difference (Mail)'
WHEN x.activity_trim  ='MLMF'then 'Follow Up (Mail)'
WHEN x.activity_trim  ='MLMG'then 'Gap Communication (Mail)'
WHEN x.activity_trim  ='MLMI'then 'Intro Letter (Mail)'
WHEN x.activity_trim  ='MLMN'then 'Newsletter (Mail)'
WHEN x.activity_trim  ='MLMS'then 'Impact Story (Mail)'
WHEN x.activity_trim  ='MLMT'then 'Thank You (Mail)'
WHEN x.activity_trim  ='MLMU'then 'Unscheduled (Mail)'
WHEN x.activity_trim  ='MLMX'then 'Survey (Mail)'
WHEN x.activity_trim  ='MLMY'then 'Year to Date Impact Statement (Mail)'
WHEN x.activity_trim  ='MLPD'then 'You Made a Difference (Phone)'
WHEN x.activity_trim  ='MLPF'then 'Follow Up (Phone)'
WHEN x.activity_trim  ='MLPG'then 'Gap Communication (Phone)'
WHEN x.activity_trim  ='MLPI'then 'Intro (Phone)'
WHEN x.activity_trim  ='MLPT'then 'Thank You (Phone)'
WHEN x.activity_trim  ='MLPU'then 'Unscheduled (Phone)'
WHEN x.activity_trim  ='MLPX'then 'Survey (Phone)'
WHEN x.activity_trim  ='MSPM'then 'Sent TSM Mailing'
WHEN x.activity_trim  ='OVMC'then 'OVM Call'
WHEN x.activity_trim  ='PGIV'then 'Sent P. Giving Packet'
WHEN x.activity_trim  ='PGML'then 'Planned Giving Mailing'
WHEN x.activity_trim  ='PROP'then 'Proposal Sent'
WHEN x.activity_trim  ='PRYG'then 'Prayer - Gift Advisor'
WHEN x.activity_trim  ='PRYO'then 'Prayer - Other'
WHEN x.activity_trim  ='PRYP'then 'Prayer - Phone'
WHEN x.activity_trim  ='PRYR'then 'Prayer - Remit'
WHEN x.activity_trim  ='PRYT'then 'Prayer - TrueSense'
WHEN x.activity_trim  ='RSVN'then 'RSVP No'
WHEN x.activity_trim  ='RSVY'then 'RSVP Yes'
WHEN x.activity_trim  ='SVOL'then 'Sent Volunteer Info'
WHEN x.activity_trim  ='TOUR'then 'Donor Toured Facilities'
WHEN x.activity_trim  ='TTCA'then 'TT:Phone call made'
WHEN x.activity_trim  ='TTCN'then 'TT:Call & Note'
WHEN x.activity_trim  ='TTDE'then 'TT:New DE Program Donor'
WHEN x.activity_trim  ='TTDG'then 'TT:Downgrade DE Program Tier'
WHEN x.activity_trim  ='TTEL'then 'TT:New ELITED Donor'
WHEN x.activity_trim  ='TTLE'then 'TT:Upgrade LOWMID to ELITED'
WHEN x.activity_trim  ='TTLO'then 'TT:New LOWMID Donor'
WHEN x.activity_trim  ='TTLU'then 'TT:Upgrade LOWMID to UPPMID'
WHEN x.activity_trim  ='TTNC'then 'TT:No contact made'
WHEN x.activity_trim  ='TTNO'then 'TT:Note sent'
WHEN x.activity_trim  ='TTRM'then 'TT:Removed from program'
WHEN x.activity_trim  ='TTUE'then 'TT:Upgrade UPPMID to ELITED'
WHEN x.activity_trim  ='TTUG'then 'TT:Upgrade DE Program Tier'
WHEN x.activity_trim  ='TTUP'then 'TT:New UPPMID Donor'



END 																		As Subject
,CASE 
WHEN x.activity_trim in('1CAL','1VOI','MLFP','MLPD','MLPF','MLPG','MLPI','MLPT','MLPU','MLPX','OVMC','TTCA','TTCN')THEN 'Phone Contact'
WHEN x.activity_trim in('2INT','2SNL','3INV','TTNO') then 'Written Contact'
WHEN x.activity_trim in('5VST','DVST','TOUR')THEN 'In-Person Visit'
WHEN x.activity_trim in('INHM','MLMI','MLMT','MLMU','MLMY','PGML','PROP','SVOL')THEN 'Personalized Mailing'
WHEN x.activity_trim in('2LET','3CRD','MLAM','MLCT','MLFM','MLMD','MLMF','MLMG','MLMN','MLMS','MLMX','MSPM','PGIV')THEN 'Mass Mailing'
WHEN x.activity_trim in('4EML','FAXX','MLAE','MLED','MLEF','MLEG','MLEI','MLES','MLET','MLEU','MLEV','MLEX','MLFE')THEN 'ONLINE'
WHEN x.activity_trim in('2TYS','6MSC','7REC','ATND','COMP','GPRP','GRPT','PRYG','PRYO','PRYP','PRYR','PRYT','RSVN','RSVY','TTDE','TTDG','TTEL','TTLE','TTLO','TTLU','TTNC','TTRM','TTUE','TTUG','TTUP') THEN 'Other Contact'
END 																		As [TYPE]
,'FALSE'																	as IsVisibleInSelfService
,'FALSE'																	as rC_Bios__Archive_Flag__c
,x.donor_trim  				

FROM  [METRO_PROD].dbo.dpother2 x
left join [METRO_PROD].dbo.dpcodes y 
ON rtrim(ltrim(y.code))=x.activity_trim
Left Join
[Migration_METRO_PROD].dbo.Account_stage_Metro a
ON a.donor=x.donor_trim 

WHERE x.activity_trim IN ('MLCT',
'CARD',
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
'VIST',
'PRYO',
'PRYT',
'PRYG',
'1VOI',
'NOCO',
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
'7REC')and  x.cr_dt<='2016-10-05 00:00:00.0000000';

----------------------------------------------------------------------------------------------------

--updating WhoId

update x
SET x.WhoId=con.id
FROM 
[Migration_METRO_PROD].dbo.TASK_LOAD_ARCHIVE x
join
[Migration_METRO_PROD].dbo.Contact_stage_Metro con
on con.donor=x.donor
where right(con.External_Id__C,2)!='-2';

create index TASK_LOAD_ARCHIVE_IDX on TASK_LOAD_ARCHIVE(ETL_ID);

select * from TASK_LOAD_ARCHIVE WHERE WhoId = '' OR WhatId = '';
