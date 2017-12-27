DROP TABle [Migration_WUM].dbo.[Campaign_Load_Hiearchy2]

select 
CAST('' as nchar(18))                                                      				As ID,
CAST('' as nvarchar(255))                                                 				As Error,
CASE

WHEN Year_Code='60' then descr +'-'+'FY-1960'
WHEN Year_Code='61' then descr +'-'+'FY-1961'
WHEN Year_Code='62' then descr +'-'+'FY-1962'
WHEN Year_Code='63' then descr +'-'+'FY-1963'
WHEN Year_Code='64' then descr +'-'+'FY-1964'
WHEN Year_Code='65' then descr +'-'+'FY-1965'
WHEN Year_Code='66' then descr +'-'+'FY-1966'
WHEN Year_Code='67' then descr +'-'+'FY-1967'
WHEN Year_Code='68' then descr +'-'+'FY-1968'
WHEN Year_Code='69' then descr +'-'+'FY-1969'
WHEN Year_Code='70' then descr +'-'+'FY-1970'
WHEN Year_Code='71' then descr +'-'+'FY-1971'
WHEN Year_Code='72' then descr +'-'+'FY-1972'
WHEN Year_Code='73' then descr +'-'+'FY-1973'
WHEN Year_Code='74' then descr +'-'+'FY-1974'
WHEN Year_Code='75' then descr +'-'+'FY-1975'
WHEN Year_Code='76' then descr +'-'+'FY-1976'
WHEN Year_Code='77' then descr +'-'+'FY-1977'
WHEN Year_Code='78' then descr +'-'+'FY-1978'
WHEN Year_Code='79' then descr +'-'+'FY-1979'
WHEN Year_Code='80' then descr +'-'+'FY-1980'
WHEN Year_Code='81' then descr +'-'+'FY-1981'
WHEN Year_Code='82' then descr +'-'+'FY-1982'
WHEN Year_Code='83' then descr +'-'+'FY-1983'
WHEN Year_Code='84' then descr +'-'+'FY-1984'
WHEN Year_Code='85' then descr +'-'+'FY-1985'
WHEN Year_Code='86' then descr +'-'+'FY-1986'
WHEN Year_Code='87' then descr +'-'+'FY-1987'
WHEN Year_Code='88' then descr +'-'+'FY-1988'
WHEN Year_Code='89' then descr +'-'+'FY-1989'
WHEN Year_Code='90' then descr +'-'+'FY-1990'
WHEN Year_Code='91' then descr +'-'+'FY-1991'
WHEN Year_Code='92' then descr +'-'+'FY-1992'
WHEN Year_Code='93' then descr +'-'+'FY-1993'
WHEN Year_Code='94' then descr +'-'+'FY-1994'
WHEN Year_Code='95' then descr +'-'+'FY-1995'
WHEN Year_Code='96' then descr +'-'+'FY-1996'
WHEN Year_Code='97' then descr +'-'+'FY-1997'
WHEN Year_Code='98' then descr +'-'+'FY-1998'
WHEN Year_Code='99' then descr +'-'+'FY-1999'
WHEN Year_Code='00' then descr +'-'+'FY-2000'
WHEN Year_Code='01' then descr +'-'+'FY-2001'
WHEN Year_Code='02' then descr +'-'+'FY-2002'
WHEN Year_Code='03' then descr +'-'+'FY-2003'
WHEN Year_Code='04' then descr +'-'+'FY-2004'
WHEN Year_Code='05' then descr +'-'+'FY-2005'
WHEN Year_Code='06' then descr +'-'+'FY-2006'
WHEN Year_Code='07' then descr +'-'+'FY-2007'
WHEN Year_Code='08' then descr +'-'+'FY-2008'
WHEN Year_Code='09' then descr +'-'+'FY-2009'
WHEN Year_Code='10' then descr +'-'+'FY-2010'
WHEN Year_Code='11' then descr +'-'+'FY-2011'
WHEN Year_Code='12' then descr +'-'+'FY-2012'
WHEN Year_Code='13' then descr +'-'+'FY-2013'
WHEN Year_Code='14' then descr +'-'+'FY-2014'
WHEN Year_Code='15' then descr +'-'+'FY-2015'
WHEN Year_Code='16' then descr +'-'+'FY-2016'
WHEN Year_Code='17' then descr +'-'+'FY-2017'
WHEN Year_Code='18' then descr +'-'+'FY-2018'
END as NAME,
c1.ID as ParentID,
(Select ID from [Migration_Target_QA].dbo.[RECORDTYPE]

where NAME='Standard' and [SobjectType]='campaign') As RecordTypeId,
 xx.Year_Code,
 xx.campaign
 ,'WUM'																						as rC_Giving__Sub_Affiliation__c
,'USC'																						AS rC_Giving__Affiliation__c
,cast('' as nvarchar(255)) 																	as rC_Giving__Campaign_Type__c
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
INTO [Migration_WUM].dbo.[Campaign_Load_Hiearchy2]
 from
(SELECT distinct ltrim(rtrim(a.campaign)) campaign, 
ltrim(rtrim(b.descr)) descr, 
substring(a.code, 1,2) As Year_Code
from [WUM_UAT1].dbo.[DPCODES] a
join [WUM_UAT1].dbo.[DPCODES] b on b.code = a.campaign
where a.FIELDNAM = 'sol' and b.FIELDNAM = 'campaign' and SUBSTRING(a.CODE,1,2) LIKE '%[^a-zA-Z]%'
union
SELECT distinct ltrim(rtrim(a.campaign)) campaign, ltrim(rtrim(b.descr)) descr, substring(a.code, 3,2) As Year_Code from[WUM_UAT1].dbo.[DPCODES] a
join [WUM_UAT1].dbo.[DPCODES] b on b.code = a.campaign
where a.FIELDNAM = 'sol' and b.FIELDNAM = 'campaign' and SUBSTRING(a.CODE,3,2) NOT LIKE '%[^0-9]%'
)xx
left join
[Migration_WUM].dbo.[Campaign_Load_Hiearchy1] c1
on SUBSTRING(c1.[Name],6,2)=xx.Year_Code






-----update rC_Giving__Campaign_Type__c
update  [Migration_WUM].dbo.[Campaign_Load_Hiearchy2]
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





use [Migration_WUM]
Exec SF_BulkOps 'Insert:bulkapi,parallel,Batchsize(5000)', 'TSAC_MIGR', 'Campaign_Load_Hiearchy2'


--select * from  [Migration_WUM].dbo.[Campaign_Load_Hiearchy2]