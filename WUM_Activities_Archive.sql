USE [Migration_WUM_PROD]
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
	[Status] [varchar](8) NOT NULL,
	[Subject] [varchar](28) NULL,
	[TYPE] [varchar](22) NULL,
	[IsVisibleInSelfService] [varchar](5) NOT NULL,
	[rC_Bios__Archive_Flag__c] [varchar](5) NOT NULL,
	[donor] [varchar](7) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO



alter table [WUM_PROD].dbo.dpother2 add activity_trim varchar(4);
update [WUM_PROD].dbo.dpother2 set activity_trim = rtrim(ltrim(activity));
create index  dpother2_donorid_idx on [WUM_PROD].dbo.dpother2(donor_trim);
create index  dpother2_activityid_idx on [WUM_PROD].dbo.dpother2(activity_trim);

alter table [WUM_PROD].dbo.dpcodes add code_trim varchar(22);
update [WUM_PROD].dbo.dpcodes set code_trim = rtrim(ltrim(code));
create index  dpcodes_code_idx on [WUM_PROD].dbo.dpcodes(code_trim);

DROP  SEQUENCE [dbo].[seq_task_load_archive] ;

CREATE SEQUENCE [dbo].[seq_task_load_archive] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
GO

INSERT INTO [dbo].[TASK_LOAD_ARCHIVE]
SELECT
		NEXT VALUE FOR seq_task_load_archive AS ETL_ID
,(SELECT Id FROM [Migration_Target].[dbo].[USER] Where [Name]='Lauren Zarder')	As OwnerId
,case  
WHEN rtrim(ltrim(x.mailing))=''
THEN
(CASE rtrim(ltrim(x.bywhom)) 
WHEN 'MSP' THEN 
cast('TrueSense Marketing' + char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr)) as nvarchar(MAX))
WHEN 'BPR' THEN CAST('Barbara Richter'+ char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr)) 
as nvarchar(MAX))
WHEN 'CZR' THEN CAST('Cindy Rivera'+ char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr)) 
as nvarchar(MAX))
WHEN 'DZC' THEN CAST('Diane Cleveland'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))
as nvarchar(MAX))
WHEN 'GZM' THEN CAST('George Marasco'+ char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))
as nvarchar(MAX))
WHEN 'JZJ'THEN CAST('Jackie Jensen-Utz'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))
as nvarchar(MAX))
WHEN 'KZG' THEN CAST('Karen Gehrke'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))
as nvarchar(MAX))
WHEN 'LCZ' THEN CAST('Lauren Zarder'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))
as nvarchar(MAX))
WHEN 'LZP'THEN CAST('Lynn Pappas'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))
as nvarchar(MAX))
WHEN 'NZP' THEN CAST('Nancy Pleasants'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))
as nvarchar(MAX))
WHEN 'RCW' THEN CAST('Ruth Wagner'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))
as nvarchar(MAX))
WHEN 'SZK' THEN CAST('Stan Kelley'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))
as nvarchar(MAX))
WHEN 'SZW' THEN CAST('Steve Watson'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))
as  nvarchar(MAX))
WHEN 'CRP' THEN CAST('Corps Officer'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))
as nvarchar(MAX))
WHEN 'RZW' THEN CAST('Robb Waugus'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))
as nvarchar(MAX))
WHEN 'LZK' THEN CAST('Lindee Kimball'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))
as nvarchar(MAX))
WHEN 'RAS'THEN 
CAST('Ruth Ann Schoer'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))
as nvarchar(MAX))
WHEN 'SZS' THEN CAST('Sandy Steffes'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))
as nvarchar(MAX))
WHEN 'TMG' THEN CAST('Tom McGehee'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))
as nvarchar(MAX))
WHEN 'WUM' THEN CAST('WUM In House'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))
as nvarchar(MAX))
WHEN 'PSC' THEN CAST('Pat Crowell'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))
as nvarchar(MAX))
WHEN 'DZS' THEN CAST('Denise Shaffer'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))
as nvarchar(MAX))
WHEN 'KZS' THEN CAST('Karl Strand'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))
as nvarchar(MAX))
WHEN 'SRN' THEN CAST('Sheila Nelson'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))
as nvarchar(MAX))
WHEN 'TZM' THEN CAST('Tom Mulinix'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))
as nvarchar(MAX))
WHEN 'J4P' THEN CAST('Jim Peterson'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))
as nvarchar(MAX))
WHEN 'TSM' THEN CAST('TrueSense Marketing'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))
as nvarchar(MAX))
WHEN 'H9C' THEN CAST('Heidi Cain'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))
as nvarchar(MAX))
WHEN 'G3H' THEN CAST('Gail Hierl'+ char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))
as nvarchar(MAX))
WHEN 'TZL' THEN CAST('Tim Litherland'+ char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))
as nvarchar(MAX))
WHEN 'EZB' THEN CAST('Elaine Baldwin'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))
as nvarchar(MAX))
WHEN 'B4P' THEN CAST('Beverly Peterson'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))
as nvarchar(MAX))
WHEN 'JKB' THEN CAST('Jodie Brotherton'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))
as nvarchar(MAX))
WHEN 'A8M' THEN CAST('Amberlea Moody'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))
as nvarchar(MAX))
WHEN 'R3L' THEN CAST('Rebecca Lesperance'+ char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))
as nvarchar(MAX))
WHEN 'J2K' THEN CAST('Jeanne Kliejunas'+ char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))
as nvarchar(MAX))
WHEN 'GJS' THEN CAST('Gregory Schmidt'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))
as nvarchar(MAX))
WHEN 'J1N' THEN CAST('Julie Nelson'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))
as nvarchar(MAX))
WHEN 'CZZ' THEN CAST('Chris Ziemba (Madison)'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))
as nvarchar(MAX))
WHEN 'G9V' THEN CAST('Gail Valenti'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))
as nvarchar(MAX))
WHEN 'C7B' THEN CAST('Carol Bulgrin'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))
as nvarchar(MAX))
WHEN 'S8H' THEN CAST('Steve Heck (Madison)'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))
as nvarchar(MAX))
WHEN 'JLE' THEN CAST('Jon Evans'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))
as nvarchar(MAX))
WHEN 'J2J' THEN CAST('Jeanne Jentsch'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'JMR' THEN CAST('Jami Ross'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))
as nvarchar(MAX))
WHEN 'C8B' THEN CAST('Carol Bulgrin (Prospect)'+ char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'A8B' THEN CAST('Abby Block'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))
as nvarchar(MAX))
WHEN 'C0M' THEN CAST('Connie Millard'+ char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))
as nvarchar(MAX))
WHEN 'M9M' THEN CAST('Macey Markowitz'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'K4B' THEN CAST('Kyle Bryntesen'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'D7H' THEN CAST('Don Hazaert'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))
as nvarchar(MAX))
WHEN 'P7J' THEN CAST('Paige Jorgensen'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))
as nvarchar(MAX))
WHEN 'M7V' THEN CAST('Marlene Vadjunec (Madison)'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'P7Z' THEN CAST('Peter Zehren'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
WHEN 'M8V' THEN CAST('Marlene Vadjunec (Prospect)'+ char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))
as nvarchar(MAX))
WHEN 'P8J' THEN CAST('Paige Jorgensen (Prospect)'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))
as nvarchar(MAX))
WHEN 'P8Z' THEN CAST('Peter Zehren (Prospect)'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))
as nvarchar(MAX))
WHEN 'GBG' THEN CAST('Gabriel Group'+ char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))as nvarchar(MAX))
END)
ELSE

(CASE rtrim(ltrim(x.bywhom)) 
WHEN 'MSP' THEN 
cast('TrueSense Marketing' + char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'BPR' THEN CAST('Barbara Richter'+ char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr)) +char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'CZR' THEN CAST('Cindy Rivera'+ char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr)) +char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'DZC' THEN CAST('Diane Cleveland'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+
char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'GZM' THEN CAST('George Marasco'+ char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+
char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'JZJ'THEN CAST('Jackie Jensen-Utz'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'KZG' THEN CAST('Karen Gehrke'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'LCZ' THEN CAST('Lauren Zarder'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'LZP'THEN CAST('Lynn Pappas'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'NZP' THEN CAST('Nancy Pleasants'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'RCW' THEN CAST('Ruth Wagner'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'SZK' THEN CAST('Stan Kelley'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'SZW' THEN CAST('Steve Watson'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'CRP' THEN CAST('Corps Officer'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'RZW' THEN CAST('Robb Waugus'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'LZK' THEN CAST('Lindee Kimball'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'RAS'THEN 
CAST('Ruth Ann Schoer'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'SZS' THEN CAST('Sandy Steffes'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'TMG' THEN CAST('Tom McGehee'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'WUM' THEN CAST('WUM In House'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'PSC' THEN CAST('Pat Crowell'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'DZS' THEN CAST('Denise Shaffer'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'KZS' THEN CAST('Karl Strand'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'SRN' THEN CAST('Sheila Nelson'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'TZM' THEN CAST('Tom Mulinix'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'J4P' THEN CAST('Jim Peterson'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'TSM' THEN CAST('TrueSense Marketing'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'H9C' THEN CAST('Heidi Cain'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'G3H' THEN CAST('Gail Hierl'+ char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'TZL' THEN CAST('Tim Litherland'+ char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'EZB' THEN CAST('Elaine Baldwin'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'B4P' THEN CAST('Beverly Peterson'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'JKB' THEN CAST('Jodie Brotherton'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'A8M' THEN CAST('Amberlea Moody'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'R3L' THEN CAST('Rebecca Lesperance'+ char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'J2K' THEN CAST('Jeanne Kliejunas'+ char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'GJS' THEN CAST('Gregory Schmidt'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'J1N' THEN CAST('Julie Nelson'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'CZZ' THEN CAST('Chris Ziemba (Madison)'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'G9V' THEN CAST('Gail Valenti'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'C7B' THEN CAST('Carol Bulgrin'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'S8H' THEN CAST('Steve Heck (Madison)'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'JLE' THEN CAST('Jon Evans'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'J2J' THEN CAST('Jeanne Jentsch'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'JMR' THEN CAST('Jami Ross'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'C8B' THEN CAST('Carol Bulgrin (Prospect)'+ char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'A8B' THEN CAST('Abby Block'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'C0M' THEN CAST('Connie Millard'+ char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'M9M' THEN CAST('Macey Markowitz'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'K4B' THEN CAST('Kyle Bryntesen'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'D7H' THEN CAST('Don Hazaert'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'P7J' THEN CAST('Paige Jorgensen'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'M7V' THEN CAST('Marlene Vadjunec (Madison)'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'P7Z' THEN CAST('Peter Zehren'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'M8V' THEN CAST('Marlene Vadjunec (Prospect)'+ char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'P8J' THEN CAST('Paige Jorgensen (Prospect)'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'P8Z' THEN CAST('Peter Zehren (Prospect)'+char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
WHEN 'GBG' THEN CAST('Gabriel Group'+ char(13) + rtrim(ltrim(x.acomm)) + Char(13) +rtrim(ltrim(y.descr))+char(13)+
rtrim(ltrim(x.mailing))as nvarchar(MAX))
END	)
END																		as Description
--,(select ID FROM [Migration_Target].dbo.[USER] where name ='Migration User')	as CreatedByID

																	

,CASE rtrim(ltrim(x.Comp_Dt))	
WHEN  '1899-12-30 00:00:00.0000000' then NULL
ELSE rtrim(ltrim(x.Comp_Dt))	
END																		As ActivityDate
,CAST('' as nvarchar(18))												as WhoId
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
---WHEN rtrim(ltrim(x.activity)) ='MSPC' THEN 'TSM Changed Data'
WHEN rtrim(ltrim(x.activity)) ='PGIV'then 'Sent P. Giving Packet'
WHEN rtrim(ltrim(x.activity)) ='PROP'then 'Sent Proposal'
WHEN rtrim(ltrim(x.activity)) ='SPSA'then 'Sent PSA'
WHEN rtrim(ltrim(x.activity))='SVOL'then 'Sent Volunteer Info'
WHEN rtrim(ltrim(x.activity)) ='TOUR' then 'Donor Toured Facilities'
WHEN rtrim(ltrim(x.activity)) ='VIST'then 'Personal Visit'
WHEN rtrim(ltrim(x.activity)) ='MSPM'then 'Sent TSM Mailing'
---WHEN rtrim(ltrim(x.activity)) ='ADDR' then 'Address Change'
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
---WHEN rtrim(ltrim(x.activity)) ='MMRG'then 'Manual Merge'
WHEN rtrim(ltrim(x.activity)) ='BDCD'then 'Sent Birthday Card'
WHEN rtrim(ltrim(x.activity)) ='TYCD'then 'Sent Thank You Card'
WHEN rtrim(ltrim(x.activity)) ='TTNC'then 'TT:No contact made'
WHEN rtrim(ltrim(x.activity)) ='MLCT'then 'Other Vendor Mailing'
WHEN rtrim(ltrim(x.activity)) ='EVNT'then 'Special Event'



END 																		As Subject
,CASE 
WHEN rtrim(ltrim(x.activity)) ='CALL' THEN 'Phone Call'
WHEN rtrim(ltrim(x.activity)) in('CARD','LETT','SVOL','MSPM','WIHM','MLCT','BDCD') then 'Sent Letter/Mailing'
WHEN rtrim(ltrim(x.activity)) ='COMP'THEN 'Donor Complaint'
WHEN rtrim(ltrim(x.activity)) in('DVST','TOUR','VIST')THEN 'In-Person'
WHEN rtrim(ltrim(x.activity)) in('GENR','EVNT')THEN 'General Comment'
WHEN rtrim(ltrim(x.activity)) ='GRPT'THEN 'Grants'
WHEN rtrim(ltrim(x.activity)) in('PGIV','PROP','SPSA') THEN 'Planned Giving Mailing'
WHEN rtrim(ltrim(x.activity)) in('TTUP','TTEL','TTLO','TTLE','TTUE','TTLU','TTCA','TTNO','TTCN','TTRM','TTDE','TTUG','TTDG','TTNC') THEN 'Donor Elite'
END 																		As [TYPE]
,'FALSE'																	as IsVisibleInSelfService
,'FALSE'																	as rC_Bios__Archive_Flag__c

,x.donor_trim 																as donor

FROM  [WUM_PROD].dbo.dpother2 x
Left join [WUM_PROD].dbo.dpcodes y 
ON rtrim(ltrim(y.code))=rtrim(ltrim(x.activity))

Left Join
[Migration_WUM_PROD].dbo.Account_Load_WUM a
ON a.donor=x.donor_trim

WHERE x.activity IN  ('CALL',
'CARD',
'COMP',
'DVST',
'GENR',
'GRPT',        
'LETT',
'PGIV',
'PROP',
'SPSA',
'SVOL',
'TOUR',
'VIST',
'MSPM',
'WIHM',
'TTEL',
'TTUP',
'TTLO',
'TTLE',
'TTUE',
'TTLU',
'TTCA',
'TTNO',
'TTCN',
'TTRM',
'TTDE',
'TTUG',
'TTDG',
'BDCD',
'TYCD',
'TTNC',
'MLCT',
'EVNT')
and x.cr_dt <='2016-10-05 00:00:00.0000000' ;

------------------------------------------------------------------------------------------------------------------------------------------------------

--updating WhoId

update a
set a.WhoId=con.id
FROM 
[Migration_WUM_PROD].dbo.[TASK_LOAD_ARCHIVE] a
Join
[Migration_WUM_PROD].dbo.Contact_Load con
On con.donor=a.donor
where right(con.External_Id__C,2)!='-2' and right(con.External_Id__C,2)!='-3'
------------------------------------------------------------------
		
			
		

create index TASK_LOAD_ARCHIVE_IDX on TASK_LOAD_ARCHIVE(ETL_ID);


select * from TASK_LOAD_ARCHIVE WHERE whoid ='' and whatid =''