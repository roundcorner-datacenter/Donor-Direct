drop table [Migration_WUM].dbo.[Campaign_Load]


select * 
INTO [Migration_WUM].dbo.[Campaign_Load]
from (select
CAST('' as nchar(18))                                                      				As ID,
CAST('' as nvarchar(255))                                                 				As Error,
c2.ID                                                                     As ParentID,

'TRUE'																	 As IsActive,
                                                                    
CAST(dc.printing As float)+Cast (dc.other As float)                       As ActualCost,

(Select ID from [Migration_Target_QA].dbo.[RECORDTYPE]

where NAME='Standard' and [SobjectType]='campaign')                      As RecordTypeId,
substring(ltrim(rtrim(dc.descr)),1,60)+' '+'FY'+c2.Year_Code                         
+' '+'WUM'+' '+ltrim(rtrim(dc.Code))  							As Name
,ltrim(rtrim(dc.Code))                                       	As Legacy_source_code__c
,rtrim(ltrim(dc.MAILED))												As NumberSent
,ltrim(rtrim(dc.descr))                                                   As Description
,'In Progress'                                                                    As Status,
CASE 
WHEN SUBSTRING(LEFT(CONVERT(VARCHAR, rtrim(ltrim(dc.CODEDATE)), 120),10),6,2)>='10' THEN DATEADD(year,1,dc.CODEDATE)
WHEN CAST(rtrim(ltrim(dc.codedate)) as nvarchar(100))!='1899-12-30 00:00:00.0000000' THEN  dc.codedate
else
(select case c2.Year_Code 
WHEN '60' THEN CAST('12/30/1960' as DATETIME)
WHEN '61' THEN CAST('12/30/1961' as DATETIME)
WHEN '62' THEN CAST('12/30/1962' as DATETIME)
WHEN '63' THEN CAST('12/30/1963' as DATETIME)
WHEN '64' THEN CAST('12/30/1964' as DATETIME)
WHEN '65' THEN CAST('12/30/1965' as DATETIME)
WHEN '66' THEN CAST('12/30/1966' as DATETIME)
WHEN '67' THEN CAST('12/30/1967' as DATETIME)
WHEN '68' THEN CAST('12/30/1968' as DATETIME)
WHEN '69' THEN CAST('12/30/1969' as DATETIME)
WHEN '70' THEN CAST('12/30/1970' as DATETIME)
WHEN '71' THEN CAST('12/30/1971' as DATETIME)
WHEN '72' THEN CAST('12/30/1972' as DATETIME)
WHEN '73' THEN CAST('12/30/1973' as DATETIME)
WHEN '74' THEN CAST('12/30/1974' as DATETIME)
WHEN '75' THEN CAST('12/30/1975' as DATETIME)
WHEN '76' THEN CAST('12/30/1976' as DATETIME)
WHEN '77' THEN CAST('12/30/1977' as DATETIME)
WHEN '78' THEN CAST('12/30/1978' as DATETIME)
WHEN '79' THEN CAST('12/30/1979' as DATETIME)
WHEN '80' THEN CAST('12/30/1980' as DATETIME)
WHEN '81' THEN CAST('12/30/1981' as DATETIME)
WHEN '82' THEN CAST('12/30/1982' as DATETIME)
WHEN '83' THEN CAST('12/30/1983' as DATETIME)
WHEN '84' THEN CAST('12/30/1984' as DATETIME)
WHEN '85' THEN CAST('12/30/1985' as DATETIME)
WHEN '86' THEN CAST('12/30/1986' as DATETIME)
WHEN '87' THEN CAST('12/30/1987' as DATETIME)
WHEN '88' THEN CAST('12/30/1988' as DATETIME)
WHEN '89' THEN CAST('12/30/1989' as DATETIME)
WHEN '90' THEN CAST('12/30/1990' as DATETIME)
WHEN '91' THEN CAST('12/30/1991' as DATETIME)
WHEN '92' THEN CAST('12/30/1992' as DATETIME)
WHEN '93' THEN CAST('12/30/1993' as DATETIME)
WHEN '94' THEN CAST('12/30/1994' as DATETIME)
WHEN '95' THEN CAST('12/30/1995' as DATETIME)
WHEN '96' THEN CAST('12/30/1996' as DATETIME)
WHEN '97' THEN CAST('12/30/1997' as DATETIME)
WHEN '98' THEN CAST('12/30/1998' as DATETIME)
WHEN '99' THEN CAST('12/30/1999' as DATETIME)
WHEN '00' THEN CAST('12/30/2000' as DATETIME)
WHEN '01' THEN CAST('12/30/2001' as DATETIME)
WHEN '02' THEN CAST('12/30/2002' as DATETIME)
WHEN '03' THEN CAST('12/30/2003' as DATETIME)
WHEN '04' THEN CAST('12/30/2004' as DATETIME)
WHEN '05' THEN CAST('12/30/2005' as DATETIME)
WHEN '06' THEN CAST('12/30/2006' as DATETIME)
WHEN '07' THEN CAST('12/30/2007' as DATETIME)
WHEN '08' THEN CAST('12/30/2008' as DATETIME)
WHEN '09' THEN CAST('12/30/2009' as DATETIME)
WHEN '10' THEN CAST('12/30/2010' as DATETIME)
WHEN '11' THEN CAST('12/30/2011' as DATETIME)
WHEN '12' THEN CAST('12/30/2012' as DATETIME)
WHEN '13' THEN CAST('12/30/2013' as DATETIME)
WHEN '14' THEN CAST('12/30/2014' as DATETIME)
WHEN '15' THEN CAST('12/30/2015' as DATETIME)
WHEN '16' THEN CAST('12/30/2016' as DATETIME)
WHEN '17' THEN CAST('12/30/2017' as DATETIME)
WHEN '18' THEN CAST('12/30/2018' as DATETIME)
end )
END 																				as StartDate

,CASE
WHEN ICATEGORY in ('CC','IH','DM','KT','LD','RD','FN','UW','WM','PR','CO') Then 'Standard'
WHEN ICATEGORY in ('DS','PM') Then 'Advertisement'
WHEN ICATEGORY='IK' THEN 'Public Relations'
WHEN ICATEGORY='PH' THEN 'Telemarketing'
END                                                                        As Type,
'Standard'                                                                 As rC_Giving__Giving_Type_Engine__c,
GETDATE()                                                                  As rC_Giving__Rollup_Giving__c,


 'WUM'																						as rC_Giving__Sub_Affiliation__c
,'USC'																						AS rC_Giving__Affiliation__c
,cast('' as nvarchar(255)) 																	as rC_Giving__Campaign_Type__c
,rtrim(ltrim(dc.descr))																		as Legacy_Description__C
,CASE 

WHEN Year_Code='60' then'1960'
WHEN Year_Code='61' then'1961'
WHEN Year_Code='62' then'1962'
WHEN Year_Code='63' then'1963'
WHEN Year_Code='64' then'1964'
WHEN Year_Code='65' then'1965'
WHEN Year_Code='66' then'1966'
WHEN Year_Code='67' then'1967'
WHEN Year_Code='68' then'1968'
WHEN Year_Code='69' then'1969'
WHEN Year_Code='70' then'1970'
WHEN Year_Code='71' then'1971'
WHEN Year_Code='72' then'1972'
WHEN Year_Code='73' then'1973'
WHEN Year_Code='74' then'1974'
WHEN Year_Code='75' then'1975'
WHEN Year_Code='76' then'1976'
WHEN Year_Code='77' then'1977'
WHEN Year_Code='78' then'1978'
WHEN Year_Code='79' then'1979'
WHEN Year_Code='80' then'1980'
WHEN Year_Code='81' then'1981'
WHEN Year_Code='82' then'1982'
WHEN Year_Code='83' then'1983'
WHEN Year_Code='84' then'1984'
WHEN Year_Code='85' then'1985'
WHEN Year_Code='86' then'1986'
WHEN Year_Code='87' then'1987'
WHEN Year_Code='88' then'1988'
WHEN Year_Code='89' then'1989'
WHEN Year_Code='90' then'1990'
WHEN Year_Code='91' then'1991'
WHEN Year_Code='92' then'1992'
WHEN Year_Code='93' then'1993'
WHEN Year_Code='94' then'1994'
WHEN Year_Code='95' then'1995'
WHEN Year_Code='96' then'1996'
WHEN Year_Code='97' then'1997'
WHEN Year_Code='98' then'1998'
WHEN Year_Code='99' then'1999'
WHEN Year_Code='00' then'2000'

WHEN Year_Code='01' then'2001'
WHEN Year_Code='02' then'2002'
WHEN Year_Code='03' then'2003'
WHEN Year_Code='04' then'2004'
WHEN Year_Code='05' then'2005'
WHEN Year_Code='06' then'2006'
WHEN Year_Code='07' then'2007'
WHEN Year_Code='08' then'2008'
WHEN Year_Code='09' then'2009'
WHEN Year_Code='10' then'2010'
WHEN Year_Code='11' then'2011'
WHEN Year_Code='12' then'2012'
WHEN Year_Code='13' then'2013'
WHEN Year_Code='14' then'2014'
WHEN Year_Code='15' then'2015'
WHEN Year_Code='16' then'2016'
WHEN Year_Code='17' then'2017'
WHEN Year_Code='18' then'2018'
END 																						As Fiscal_year__C
,CAST('' as nvarchar(100))																	as rC_Giving__Appeal_Segment__c
,CAST('' as nvarchar(100))																	as rC_Giving__Channel__c
CAST('' as nvarchar(100)) 																	as rC_Giving__Effort__c
CAST('' as nvarchar(100)) 																	as rC_Giving__Sub_Channel__c
from
[WUM_10K(QA)].DBO.DPCODES dc
join
[Migration_WUM].dbo.[Campaign_Load_Hiearchy2] c2
on substring(rtrim(ltrim(dc.code)),1,2)=c2.Year_Code
and rtrim(ltrim(c2.campaign))=substring(rtrim(ltrim(dc.code)),3,2) 
where dc.fieldnam='SOL' and SUBSTRING(dc.CODE,1,2) LIKE '%[^a-zA-Z]%'
UNION ALL
select
CAST(' ' as nchar(18))                                                      				As ID,
CAST(' ' as nvarchar(255))                                                 				As Error,
c2.ID                                                                     As ParentID,
CASE 
WHEN substring(dc.code,3,2) in ('16','17') THEN 'TRUE'
ELSE 'FALSE'
END                                                                       As IsActive,
CAST(dc.printing As float)+Cast (dc.other As float)                       As ActualCost,

(Select ID from [Migration_Target_QA].dbo.[RECORDTYPE]

where NAME='Standard' and [SobjectType]='campaign')                      As RecordTypeId,
substring(ltrim(rtrim(dc.descr)),1,60)+' '+'FY'+c2.Year_Code                        
+' '+'WUM'+' '+ltrim(rtrim(dc.Code))  							As Name
,ltrim(rtrim(dc.Code))                                                   As Legacy_source_code__c,
rtrim(ltrim(dc.MAILED))												As NumberSent
,ltrim(rtrim(dc.descr))                                                   As Description,
'In Progress'                                                                      As Status,
CASE 
WHEN SUBSTRING(LEFT(CONVERT(VARCHAR, rtrim(ltrim(dc.CODEDATE)), 120),10),6,2)>='10' THEN DATEADD(year,1,dc.CODEDATE)
WHEN CAST(rtrim(ltrim(dc.codedate)) as nvarchar(100))! ='1899-12-30 00:00:00.0000000'  THEN dc.codedate
ELSE
(select case c2.Year_Code 
WHEN '60' THEN CAST('12/30/1960' as DATETIME)
WHEN '61' THEN CAST('12/30/1961' as DATETIME)
WHEN '62' THEN CAST('12/30/1962' as DATETIME)
WHEN '63' THEN CAST('12/30/1963' as DATETIME)
WHEN '64' THEN CAST('12/30/1964' as DATETIME)
WHEN '65' THEN CAST('12/30/1965' as DATETIME)
WHEN '66' THEN CAST('12/30/1966' as DATETIME)
WHEN '67' THEN CAST('12/30/1967' as DATETIME)
WHEN '68' THEN CAST('12/30/1968' as DATETIME)
WHEN '69' THEN CAST('12/30/1969' as DATETIME)
WHEN '70' THEN CAST('12/30/1970' as DATETIME)
WHEN '71' THEN CAST('12/30/1971' as DATETIME)
WHEN '72' THEN CAST('12/30/1972' as DATETIME)
WHEN '73' THEN CAST('12/30/1973' as DATETIME)
WHEN '74' THEN CAST('12/30/1974' as DATETIME)
WHEN '75' THEN CAST('12/30/1975' as DATETIME)
WHEN '76' THEN CAST('12/30/1976' as DATETIME)
WHEN '77' THEN CAST('12/30/1977' as DATETIME)
WHEN '78' THEN CAST('12/30/1978' as DATETIME)
WHEN '79' THEN CAST('12/30/1979' as DATETIME)
WHEN '80' THEN CAST('12/30/1980' as DATETIME)
WHEN '81' THEN CAST('12/30/1981' as DATETIME)
WHEN '82' THEN CAST('12/30/1982' as DATETIME)
WHEN '83' THEN CAST('12/30/1983' as DATETIME)
WHEN '84' THEN CAST('12/30/1984' as DATETIME)
WHEN '85' THEN CAST('12/30/1985' as DATETIME)
WHEN '86' THEN CAST('12/30/1986' as DATETIME)
WHEN '87' THEN CAST('12/30/1987' as DATETIME)
WHEN '88' THEN CAST('12/30/1988' as DATETIME)
WHEN '89' THEN CAST('12/30/1989' as DATETIME)
WHEN '90' THEN CAST('12/30/1990' as DATETIME)
WHEN '91' THEN CAST('12/30/1991' as DATETIME)
WHEN '92' THEN CAST('12/30/1992' as DATETIME)
WHEN '93' THEN CAST('12/30/1993' as DATETIME)
WHEN '94' THEN CAST('12/30/1994' as DATETIME)
WHEN '95' THEN CAST('12/30/1995' as DATETIME)
WHEN '96' THEN CAST('12/30/1996' as DATETIME)
WHEN '97' THEN CAST('12/30/1997' as DATETIME)
WHEN '98' THEN CAST('12/30/1998' as DATETIME)
WHEN '99' THEN CAST('12/30/1999' as DATETIME)
WHEN '00' THEN CAST('12/30/2000' as DATETIME)
WHEN '01' THEN CAST('12/30/2001' as DATETIME)
WHEN '02' THEN CAST('12/30/2002' as DATETIME)
WHEN '03' THEN CAST('12/30/2003' as DATETIME)
WHEN '04' THEN CAST('12/30/2004' as DATETIME)
WHEN '05' THEN CAST('12/30/2005' as DATETIME)
WHEN '06' THEN CAST('12/30/2006' as DATETIME)
WHEN '07' THEN CAST('12/30/2007' as DATETIME)
WHEN '08' THEN CAST('12/30/2008' as DATETIME)
WHEN '09' THEN CAST('12/30/2009' as DATETIME)
WHEN '10' THEN CAST('12/30/2010' as DATETIME)
WHEN '11' THEN CAST('12/30/2011' as DATETIME)
WHEN '12' THEN CAST('12/30/2012' as DATETIME)
WHEN '13' THEN CAST('12/30/2013' as DATETIME)
WHEN '14' THEN CAST('12/30/2014' as DATETIME)
WHEN '15' THEN CAST('12/30/2015' as DATETIME)
WHEN '16' THEN CAST('12/30/2016' as DATETIME)
WHEN '17' THEN CAST('12/30/2017' as DATETIME)
WHEN '18' THEN CAST('12/30/2018' as DATETIME)
end )
END 																				as StartDate
,CASE
WHEN ICATEGORY in ('CC','IH','DM','KT','LD','RD','FN','UW','WM','PR','CO') Then 'Standard'
WHEN ICATEGORY in ('DS','PM') Then 'Advertisement'
WHEN ICATEGORY='IK' THEN 'Public Relations'
WHEN ICATEGORY='PH' THEN 'Telemarketing'
END                                                                        As Type,
'Standard'                                                                 As rC_Giving__Giving_Type_Engine__c,
GETDATE()                                                                  As rC_Giving__Rollup_Giving__c,
 


'WUM'																						as rC_Giving__Sub_Affiliation__c
,'USC'																						AS rC_Giving__Affiliation__c
,cast('' as nvarchar(255)) 																	as rC_Giving__Campaign_Type__c
,rtrim(ltrim(dc.descr))																	as Legacy_Description__C
,CASE 

WHEN Year_Code='60' then'1960'
WHEN Year_Code='61' then'1961'
WHEN Year_Code='62' then'1962'
WHEN Year_Code='63' then'1963'
WHEN Year_Code='64' then'1964'
WHEN Year_Code='65' then'1965'
WHEN Year_Code='66' then'1966'
WHEN Year_Code='67' then'1967'
WHEN Year_Code='68' then'1968'
WHEN Year_Code='69' then'1969'
WHEN Year_Code='70' then'1970'
WHEN Year_Code='71' then'1971'
WHEN Year_Code='72' then'1972'
WHEN Year_Code='73' then'1973'
WHEN Year_Code='74' then'1974'
WHEN Year_Code='75' then'1975'
WHEN Year_Code='76' then'1976'
WHEN Year_Code='77' then'1977'
WHEN Year_Code='78' then'1978'
WHEN Year_Code='79' then'1979'
WHEN Year_Code='80' then'1980'
WHEN Year_Code='81' then'1981'
WHEN Year_Code='82' then'1982'
WHEN Year_Code='83' then'1983'
WHEN Year_Code='84' then'1984'
WHEN Year_Code='85' then'1985'
WHEN Year_Code='86' then'1986'
WHEN Year_Code='87' then'1987'
WHEN Year_Code='88' then'1988'
WHEN Year_Code='89' then'1989'
WHEN Year_Code='90' then'1990'
WHEN Year_Code='91' then'1991'
WHEN Year_Code='92' then'1992'
WHEN Year_Code='93' then'1993'
WHEN Year_Code='94' then'1994'
WHEN Year_Code='95' then'1995'
WHEN Year_Code='96' then'1996'
WHEN Year_Code='97' then'1997'
WHEN Year_Code='98' then'1998'
WHEN Year_Code='99' then'1999'
WHEN Year_Code='00' then'2000'

WHEN Year_Code='01' then'2001'
WHEN Year_Code='02' then'2002'
WHEN Year_Code='03' then'2003'
WHEN Year_Code='04' then'2004'
WHEN Year_Code='05' then'2005'
WHEN Year_Code='06' then'2006'
WHEN Year_Code='07' then'2007'
WHEN Year_Code='08' then'2008'
WHEN Year_Code='09' then'2009'
WHEN Year_Code='10' then'2010'
WHEN Year_Code='11' then'2011'
WHEN Year_Code='12' then'2012'
WHEN Year_Code='13' then'2013'
WHEN Year_Code='14' then'2014'
WHEN Year_Code='15' then'2015'
WHEN Year_Code='16' then'2016'
WHEN Year_Code='17' then'2017'
WHEN Year_Code='18' then'2018'
END 																						As Fiscal_year__C
,CAST('' as nvarchar(100))																	as rC_Giving__Appeal_Segment__c
,CAST('' as nvarchar(100))																	as rC_Giving__Channel__c
CAST('' as nvarchar(100)) 																	as rC_Giving__Effort__c
CAST('' as nvarchar(100)) 																	as rC_Giving__Sub_Channel__c
from
[WUM_10K(QA)].dbo.DPCODES dc
join
[Migration_WUM].dbo.[Campaign_Load_Hiearchy2] c2
on substring(rtrim(ltrim(dc.code)),3,2)=c2.Year_Code
and rtrim(ltrim(c2.campaign))=substring(rtrim(ltrim(dc.code)),1,2) 
where dc.fieldnam='SOL' and SUBSTRING(dc.CODE,3,2) NOT LIKE '%[^0-9]%')xx
order By ParentID





----update rC_Giving__Campaign_Type__c
update  [Migration_WUM].dbo.[Campaign_Load]
SET rC_Giving__Campaign_Type__c=
case substring(rtrim(ltrim(v.sol)),3,2)
WHEN	'BB'	THEN	'Bed & Bread'
WHEN	'BS'	THEN	'Back To School'
WHEN	'CC'	THEN	'Capital Campaign'
WHEN	'CF'	THEN	'Christmas II'
WHEN	'CH'	THEN	'Christmas'
WHEN	'CR'	THEN	'Christmas Prospect'
WHEN	'DS'	THEN	'Disaster'
WHEN	'EA'	THEN	'Easter'
WHEN	'FS'	THEN	'Family Services'
WHEN	'MI'	THEN	'Miscellaneous'
WHEN	'MW'	THEN	'Mid-Winter'
WHEN	'NL'	THEN	'Newsletter'
WHEN	'PL'	THEN	'Pledge'
WHEN	'PT'	THEN	'Partnership'
WHEN	'PV'	THEN	'Previous Vendor'
WHEN	'RS'	THEN	'Red Shield'
WHEN	'SC'	THEN	'Camp'
WHEN	'SF'	THEN	'Summer Camp Followup'
WHEN	'SS'	THEN	'Summer Slump'
WHEN	'TH'	THEN	'Thanksgiving'
WHEN	'WM'	THEN	'White Mail'
WHEN	'WS'	THEN	'World Services'
WHEN	'YS'	THEN	'Youth Services'
WHEN	'YE'	THEN	'Year-End'
WHEN	'HZ'	THEN	'Unknown Summit Campaign'
WHEN	'IH'	THEN	'In House'
WHEN	'PG'	THEN	'Planned Giving'
WHEN	'SP'	THEN	'Spring'
WHEN	'RB'	THEN	'Unknown Summit Campaign'
WHEN	'C1'	THEN	'Christmas Lapsed'
WHEN	'C2'	THEN	'Christmas Followup Lapsed'
WHEN	'CM'	THEN	'Christmas 2 Prospect'
WHEN	'EV'	THEN	'Special Event'
WHEN	'FN'	THEN	'Fall Newsletter'
WHEN	'KF'	THEN	'Keeping Families Afloat'
WHEN	'KR'	THEN	'Kroc'
WHEN	'MG'	THEN	'Matching Grant'
WHEN	'NF'	THEN	'Returned Check'
WHEN	'NP'	THEN	'Newspaper Insert'
WHEN	'RA'	THEN	'Renewal'
WHEN	'TI'	THEN	'Timely Message'
WHEN	'TL'	THEN	'Thanksgiving Lapsed'
WHEN	'TM'	THEN	'Thanksgiving Prospect'
WHEN	'TX'	THEN	'Early Thanksgiving'
WHEN	'TY'	THEN	'Thank You'
WHEN	'AG'	THEN	'August'
WHEN	'AP'	THEN	'April'
WHEN	'EL'	THEN	'Donor Elite'
WHEN	'GT'	THEN	'Grant'
WHEN	'JL'	THEN	'July'
WHEN	'JN'	THEN	'June'
WHEN	'MY'	THEN	'May'
WHEN	'PI'	THEN	'Pledge Invitation'
WHEN	'RE'	THEN	'React'
WHEN	'SZ'	THEN	'Soft Credit'
WHEN	'WN'	THEN	'Winter Newsletter'
WHEN	'DE'	THEN	'Donor Exception'
WHEN	'IW'	THEN	'Internet Donations'
WHEN	'KT'	THEN	'Kettles'
WHEN	'PH'	THEN	'Telemarketing'
WHEN	'PX'	THEN	'Pledge Statement'
WHEN	'SN'	THEN	'Spring Newsletter'
WHEN	'IK'	THEN	'In-Kind Gifts'
WHEN	'LD'	THEN	'Lapsed Donor Renewal'
WHEN	'YU'	THEN	'Year End Urgent'
WHEN	'HN'	THEN	'Holiday Newsletter'
WHEN	'IN'	THEN	'Internet'
WHEN	'ND'	THEN	'New Donors'
WHEN	'TG'	THEN	'Thanksgiving Newsletter'
WHEN	'CS'	THEN	'Community Service'
WHEN	'MM'	THEN	'Multi-Media'

END	
FROM 
(select sol from [WUM_UAT1].dbo.DPGIFT d
Left join
(
SELECT distinct ltrim(rtrim(a.campaign)) campaign, 
ltrim(rtrim(b.descr)) descr, 
substring(a.code, 1,2) As Year_Code
from [WUM_UAT1].dbo.[DPCODES] a
join[WUM_UAT1].dbo.[DPCODES] b on b.code = a.campaign
where a.FIELDNAM = 'sol' and b.FIELDNAM = 'campaign' and SUBSTRING(a.CODE,1,2) LIKE '%[^a-zA-Z]%'
union
SELECT distinct ltrim(rtrim(a.campaign)) campaign, ltrim(rtrim(b.descr)) descr, substring(a.code, 3,2) As 
Year_Code from [WUM_UAT1].dbo.[DPCODES] a
join [WUM_UAT1].dbo.[DPCODES] b on b.code = a.campaign
where a.FIELDNAM = 'sol' and b.FIELDNAM = 'campaign' and SUBSTRING(a.CODE,3,2) NOT LIKE '%[^0-9]%' )xx
on rtrim(ltrim(xx.campaign))=substring(rtrim(ltrim(d.sol)),3,2))v


--update rC_Giving__Appeal_Segment__c
update  [Migration_WUM].dbo.[Campaign_Load]
SET rC_Giving__Appeal_Segment__c='N/A'

--update rC_Giving__Channel__c
update  [Migration_WUM].dbo.[Campaign_Load]
SET rC_Giving__Channel__c='N/A'

--update rC_Giving__Effort__c
update  [Migration_WUM].dbo.[Campaign_Load]
SET rC_Giving__Effort__c='00'


--update rC_Giving__Sub_Channel__c

update  [Migration_WUM].dbo.[Campaign_Load]
SET rC_Giving__Sub_Channel__c='N/A'




-----Insert records

use [Migration_WUM]
Exec SF_BulkOps 'Insert:bulkapi,parallel,Batchsize(5000)', 'TSAC_MIGR', 'Campaign_Load'

-----Replicate

use[Migration_Target_QA]

Exec SF_refresh 'TSAC_MIGR', 'Campaign','YES'