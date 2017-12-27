drop table [Migration_Metro].dbo.[Campaign_Load]


select * 
INTO [Migration_Metro].dbo.[Campaign_Load]
from (


select
CAST('' as nchar(18))                                                      				As ID,
CAST('' as nvarchar(255))                                                 				As Error,
c2.ID                                                                    				As ParentID
,dc.codedate 																as startDate
,CASE 
WHEN substring(dc.code,1,2) in ('16','17') THEN 'TRUE'
ELSE 'FALSE'
END                                                                      				 As IsActive,
CAST(dc.printing As float)+Cast (dc.other As float)                       				 As ActualCost,

(Select ID from [Migration_Target_QA].dbo.[RECORDTYPE]

where NAME='Standard' and [SobjectType]='campaign')                     					As RecordTypeId,

substring(ltrim(rtrim(dc.descr)),1,60)+' '+'FY'+c2.Year_Code                        
+' '+ 'MET'+' '+ltrim(rtrim(dc.Code))  							As Name
,ltrim(rtrim(dc.Code))                                       As Legacy_source_code__c,
ltrim(rtrim(dc.descr))                                                   As Description,
CASE 
WHEN substring(dc.code,1,2) in ('16','17') THEN 'In Progress'
ELSE 'Completed'
END                                                                       As Status,
CASE
WHEN ICATEGORY in ('CC','IH','DM','KT','LD','RD','FN','UW','WM','PR','CO') Then 'Standard'
WHEN ICATEGORY in ('DS','PM') Then 'Advertisement'
WHEN ICATEGORY='IK' THEN 'Public Relations'
WHEN ICATEGORY='PH' THEN 'Telemarketing'
END                                                                        As Type
,'USC'																	as rC_Giving__Affiliation__c
,'MET' 																	as rC_Giving__Sub_Affiliation__c
,CAST('' as nvarchar(100))																	as rC_Giving__Campaign_Type__c
,'Standard'                                                                 As rC_Giving__Giving_Type_Engine__c

,GETDATE()                                                                  As rC_Giving__Rollup_Giving__c,

CASE

WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='60' then CAST('09/30/1960' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='61' then CAST('09/30/1961' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='62' then CAST('09/30/1962' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='63' then CAST('09/30/1963' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='64' then CAST('09/30/1964' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='65' then CAST('09/30/1965' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='66' then CAST('09/30/1966' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='67' then CAST('09/30/1967' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='68' then CAST('09/30/1968' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='69' then CAST('09/30/1969' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='70' then CAST('09/30/1970' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='71' then CAST('09/30/1971' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='72' then CAST('09/30/1972' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='73' then CAST('09/30/1973' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='74' then CAST('09/30/1974' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='75' then CAST('09/30/1975' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='76' then CAST('09/30/1976' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='77' then CAST('09/30/1977' As dateTime)
                                                             
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='78' then CAST('09/30/1978' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='79' then CAST('09/30/1979' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='80' then CAST('09/30/1980' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='81' then CAST('09/30/1981' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='82' then CAST('09/30/1982' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='83' then CAST('09/30/1983' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='84' then CAST('09/30/1984' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='85' then CAST('09/30/1985' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='86' then CAST('09/30/1986' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='87' then CAST('09/30/1987' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='88' then CAST('09/30/1988' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='89' then CAST('09/30/1989' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='90' then CAST('09/30/1990' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='91' then CAST('09/30/1991' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='92' then CAST('09/30/1992' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='93' then CAST('09/30/1993' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='94' then CAST('09/30/1994' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='95' then CAST('09/30/1995' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='96' then CAST('09/30/1996' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='97' then CAST('09/30/1997' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='98' then CAST('09/30/1998' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='99' then CAST('09/30/1999' As dateTime)
                                                             
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='00' then CAST('09/30/2000' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='01' then CAST('09/30/2001' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='02' then CAST('09/30/2002' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='03' then CAST('09/30/2003' As dateTime)
                                                             
                                                             
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='04' then CAST('09/30/2004' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='05' then CAST('09/30/2005' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='06' then CAST('09/30/2006' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='07' then CAST('09/30/2007' As dateTime)
                                                             
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='08' then CAST('09/30/2008' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='09' then CAST('09/30/2009' As dateTime)



WHEN SUBSTRING(ltrim(rtrim(dc.code)),3,2)='10' then CAST('09/30/2010' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),3,2)='11' then CAST('09/30/2011' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),3,2)='12' then CAST('09/30/2012' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),3,2)='13' then CAST('09/30/2013' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),3,2)='14' then CAST('09/30/2014' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),3,2)='15' then CAST('09/30/2015' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),3,2)='16' then CAST('09/30/2016' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),3,2)='17' then CAST('09/30/2017' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),3,2)='18' then CAST('09/30/2018' As dateTime)

END                                                                                 As ENDDATE

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
[METRO_UAT1].[DBO].DPCODES dc
join
[Migration_Metro].dbo.[Campaign_Load_Hiearchy2] c2
on substring(rtrim(ltrim(dc.code)),1,2)=c2.Year_Code
and rtrim(ltrim(c2.campaign))=substring(rtrim(ltrim(dc.code)),3,2) 
where dc.fieldnam='SOL' and SUBSTRING(dc.CODE,1,2) LIKE '%[^a-zA-Z]%'
UNION ALL
select
CAST(' ' as nchar(18))                                                      				As ID,
CAST(' ' as nvarchar(255))                                                 				As Error,
c2.ID                                                                     As ParentID
,dc.codedate 																as startDate
,CASE 
WHEN substring(dc.code,3,2) in ('16','17') THEN 'TRUE'
ELSE 'FALSE'
END                                                                       As IsActive,
CAST(dc.printing As float)+Cast (dc.other As float)                       As ActualCost,

(Select ID from [Migration_Target_QA].dbo.[RECORDTYPE]

where NAME='Standard' and [SobjectType]='campaign')                      As RecordTypeId,
substring(ltrim(rtrim(dc.descr)),1,60)+' '+'FY'+c2.Year_Code                        
+' '+ 'MET'+' '+ltrim(rtrim(dc.Code))  							As Name
,rtrim(ltrim(dc.CODE))																	As Legacy_source_code__c,                                      
ltrim(rtrim(dc.descr))                                                   As Description,
CASE 
WHEN substring(dc.code,3,2) in ('16','17') THEN 'In Progress'
ELSE 'Completed'
END                                                                       As Status,
CASE
WHEN ICATEGORY in ('CC','IH','DM','KT','LD','RD','FN','UW','WM','PR','CO') Then 'Standard'
WHEN ICATEGORY in ('DS','PM') Then 'Advertisement'
WHEN ICATEGORY='IK' THEN 'Public Relations'
WHEN ICATEGORY='PH' THEN 'Telemarketing'
END                                                                        As Type
,'USC'																	as rC_Giving__Affiliation__c
,'MET' 																	as rC_Giving__Sub_Affiliation__c
,CAST('' as nvarchar(100))																	as rC_Giving__Campaign_Type__c
,'Standard'                                                                 As rC_Giving__Giving_Type_Engine__c,
GETDATE()                                                                  As rC_Giving__Rollup_Giving__c,
CASE

WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='60' then CAST('09/30/1960' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='61' then CAST('09/30/1961' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='62' then CAST('09/30/1962' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='63' then CAST('09/30/1963' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='64' then CAST('09/30/1964' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='65' then CAST('09/30/1965' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='66' then CAST('09/30/1966' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='67' then CAST('09/30/1967' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='68' then CAST('09/30/1968' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='69' then CAST('09/30/1969' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='70' then CAST('09/30/1970' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='71' then CAST('09/30/1971' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='72' then CAST('09/30/1972' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='73' then CAST('09/30/1973' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='74' then CAST('09/30/1974' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='75' then CAST('09/30/1975' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='76' then CAST('09/30/1976' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='77' then CAST('09/30/1977' As dateTime)
                                                             
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='78' then CAST('09/30/1978' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='79' then CAST('09/30/1979' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='80' then CAST('09/30/1980' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='81' then CAST('09/30/1981' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='82' then CAST('09/30/1982' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='83' then CAST('09/30/1983' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='84' then CAST('09/30/1984' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='85' then CAST('09/30/1985' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='86' then CAST('09/30/1986' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='87' then CAST('09/30/1987' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='88' then CAST('09/30/1988' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='89' then CAST('09/30/1989' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='90' then CAST('09/30/1990' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='91' then CAST('09/30/1991' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='92' then CAST('09/30/1992' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='93' then CAST('09/30/1993' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='94' then CAST('09/30/1994' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='95' then CAST('09/30/1995' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='96' then CAST('09/30/1996' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='97' then CAST('09/30/1997' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='98' then CAST('09/30/1998' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='99' then CAST('09/30/1999' As dateTime)
                                                             
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='00' then CAST('09/30/2000' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='01' then CAST('09/30/2001' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='02' then CAST('09/30/2002' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='03' then CAST('09/30/2003' As dateTime)
                                                             
                                                             
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='04' then CAST('09/30/2004' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='05' then CAST('09/30/2005' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='06' then CAST('09/30/2006' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='07' then CAST('09/30/2007' As dateTime)
                                                             
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='08' then CAST('09/30/2008' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),1,2)='09' then CAST('09/30/2009' As dateTime)



WHEN SUBSTRING(ltrim(rtrim(dc.code)),3,2)='10' then CAST('09/30/2010' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),3,2)='11' then CAST('09/30/2011' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),3,2)='12' then CAST('09/30/2012' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),3,2)='13' then CAST('09/30/2013' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),3,2)='14' then CAST('09/30/2014' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),3,2)='15' then CAST('09/30/2015' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),3,2)='16' then CAST('09/30/2016' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),3,2)='17' then CAST('09/30/2017' As dateTime)
WHEN SUBSTRING(ltrim(rtrim(dc.code)),3,2)='18' then CAST('09/30/2018' As dateTime)

END                                                                                 As ENDDATE
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
[METRO_UAT1].dbo.DPCODES dc
join
[Migration_Metro].dbo.[Campaign_Load_Hiearchy2] c2
on substring(rtrim(ltrim(dc.code)),3,2)=c2.Year_Code
and rtrim(ltrim(c2.campaign))=substring(rtrim(ltrim(dc.code)),1,2) 
where dc.fieldnam='SOL' and SUBSTRING(dc.CODE,3,2) NOT LIKE '%[^0-9]%'

)xx
order by ParentID

----update rC_Giving__Campaign_Type__c
update  [Migration_Metro].dbo.[Campaign_Load] 
SET rC_Giving__Campaign_Type__c=
case substring(rtrim(ltrim(v.Sol)),3,2)
WHEN	'AA'	then	'Annual Report'
WHEN	'AC'	then	'Affirmation Certificate'
WHEN	'AD'	then	'Advertising'
WHEN	'AF'	then	'Annual Fund'
WHEN	'AG'	then	'August'
WHEN	'AP'	then	'April'
WHEN	'AT'	then	'Angel Tree'
WHEN	'BB'	then	'Bed and Bread'
WHEN	'BE'	then	'Be A Shield'
WHEN	'BS'	then	'Back to School'
WHEN	'CA'	then	'Calendar'
WHEN	'CB'	then	'Certificate of Appreciation'
WHEN	'CC'	then	'Capital Campaign'
WHEN	'CD'	then	'Commander''s Report'
WHEN	'CE'	then	'Children''s Eyes'
WHEN	'CF'	then	'Christmas Followup'
WHEN	'CH'	then	'Christmas*'
WHEN	'CI'	then	'Children''s Silhouettes'
WHEN	'CL'	then	'Child Care'
WHEN	'CM'	then	'Christmas Acquisition #2'
WHEN	'CR'	then	'Christmas Acquisition'
WHEN	'CS'	then	'Community Services'
WHEN	'CX'	then	'Gift Catalog'
WHEN	'DB'	then	'Daily Bread'
WHEN	'DD'	then	'Donut Day'
WHEN	'DL'	then	'Donor Loyalty'
WHEN	'DP'	then	'Donor Plus'
WHEN	'DR'	then	'December'
WHEN	'DS'	then	'Disaster*'
WHEN	'EA'	then	'Easter*'
WHEN	'EH'	then	'Every Little Bit Helps'
WHEN	'EL'	then	'Donor Elite'
WHEN	'F4'	then	'Food Pantry Acquisition'
WHEN	'FA'	then	'Faith Stimulus'
WHEN	'FB'	then	'February'
WHEN	'FC'	then	'Fall Community Campaign'
WHEN	'FS'	then	'Family Services'
WHEN	'FV'	then	'Food Voucher'
WHEN	'FY'	then	'Fiscal Year End'
WHEN	'GC'	then	'Circle of Caring'
WHEN	'GK'	then	'Give a Kid a Chance'
WHEN	'H1'	then	'Hunger Acquistion'
WHEN	'HA'	then	'Hand Written Note'
WHEN	'HE'	then	'Heat and Eat'
WHEN	'HF'	then	'Help Feed A Hungry Child'
WHEN	'HH'	then	'Helping Hands'
WHEN	'HO'	then	'How Will I Eat Today'
WHEN	'HU'	then	'Hunger'
WHEN	'HW'	then	'Hand Written Note'
WHEN	'HY'	then	'Homeless Series'
WHEN	'IH'	then	'In House'
WHEN	'IR'	then	'IRA rollover'
WHEN	'JA'	then	'January'
WHEN	'JL'	then	'July'
WHEN	'JN'	then	'June'
WHEN	'LC'	then	'Lifechangers'
WHEN	'LD'	then	'Lapsed Donor'
WHEN	'LH'	then	'Local Hero'
WHEN	'MB'	then	'Membership MB'
WHEN	'ME'	then	'Membership ME'
WHEN	'MG'	then	'Matching Gifts'
WHEN	'MP'	then	'Major Prospect Track'
WHEN	'MR'	then	'March'
WHEN	'MW'	then	'Winter Relief'
WHEN	'MY'	then	'May'
WHEN	'NA'	then	'Nostalgia'
WHEN	'ND'	then	'New Donor'
WHEN	'NL'	then	'Newsletters*'
WHEN	'NM'	then	'New Mover'
WHEN	'NV'	then	'November'
WHEN	'OC'	then	'October'
WHEN	'PA'	then	'Patron'
WHEN	'PC'	then	'Circle of Caring Conversion'
WHEN	'PD'	then	'Soup & Shelter Conversion'
WHEN	'PF'	then	'Please Don''t Forget'
WHEN	'PG'	then	'Planned Giving'
WHEN	'PH'	then	'Telemarketing'
WHEN	'PL'	then	'Pledge*'
WHEN	'PN'	then	'Pantry*'
WHEN	'PR'	then	'Circle of Caring Reminders'
WHEN	'PS'	then	'Soup & Shelter Reminders'
WHEN	'PT'	then	'Patriotic'
WHEN	'PX'	then	'Tax Receipt'
WHEN	'PY'	then	'Prayer'
WHEN	'R1'	then	'Renewal 1'
WHEN	'R2'	then	'Renewal 2'
WHEN	'RA'	then	'Radiothon'
WHEN	'RE'	then	'Recognition'
WHEN	'RK'	then	'Red Kettle'
WHEN	'RS'	then	'Red Shield'
WHEN	'SB'	then	'September'
WHEN	'SC'	then	'Summer Camp/Youth*'
WHEN	'SF'	then	'SOS Food Pantry'
WHEN	'SG'	then	'Save a Generation'
WHEN	'SO'	then	'Soup & Shelter (non-pledge)'
WHEN	'SP'	then	'Spring'
WHEN	'SR'	then	'Spring Reactivation'
WHEN	'SS'	then	'Summer Crisis'
WHEN	'ST'	then	'Service to Children'
WHEN	'SY'	then	'Donor Survey'
WHEN	'TH'	then	'Thanksgiving*'
WHEN	'TM'	then	'Thanksgiving Acquisition'
WHEN	'TY'	then	'Acknowledgments'
WHEN	'UM'	then	'Urgent Memo'
WHEN	'UP'	then	'Certificate of Thanks'
WHEN	'WB'	then	'William Booth'
WHEN	'WD'	then	'World of Difference'
WHEN	'WE'	then	'Welcome Email'
WHEN	'WG'	then	'When I Grow Up'
WHEN	'WH'	then	'War on Hunger'
WHEN	'WM'	then	'White Mail'
WHEN	'WS'	then	'World Services Dateline'
WHEN	'YD'	then	'YES Fund'
WHEN	'YE'	then	'Year End*'
WHEN	'YF'	then	'Yes! Fund'
WHEN	'YK'	then	'Youth at Risk 1'
WHEN	'YR'	then	'Youth at Risk 2'
WHEN	'YS'	then	'Youth Services'
WHEN	'YZ'	then	'Credit Card / Internet'
WHEN	'ZR'	then	'Z3ROC Campaign'
WHEN	'DC'	then	'December Acquisition'
WHEN	'IN'	then	'Online/Internet'
WHEN	'VC'	then	'Veterans'
WHEN	'SZ'	then	'Soft Credit'
WHEN	'TG'	then	'Thanksgiving Newsletter'
WHEN	'NI'	then	'Newspaper Insert'
WHEN	'FN'	then	'Fall Newsletter*'
WHEN	'SN'	then	'Spring Newsletter*'
WHEN	'PO'	then	'Partnership Name Label'
WHEN	'HN'	then	'Holiday Newsletter*'
WHEN	'YU'	then	'Year End Update'
WHEN	'LM'	then	'Let the Music Begin: Summit'
WHEN	'DE'	then	'Non-Responder Mailing*'
WHEN	'TS'	then	'Tax Statement'
WHEN	'SL'	then	'Starlighter'
WHEN	'CV'	then	'Civic Luncheon'
WHEN	'PI'	then	'Pledge Invitation'
WHEN	'EV'	then	'Special Event'
WHEN	'SQ'	then	'Spring Acquisition'
WHEN	'PM'	then	'Personal Mail (Mid Level, etc)'
WHEN	'ML'	then	'Mid-Level'
WHEN	'CO'	then	'Corporate'
WHEN	'FO'	then	'Foundation'
WHEN	'LS'	then	'Leadership'
WHEN	'RG'	then	'Revenue Generator'
WHEN	'MM'	then	'Multi Media'
WHEN	'UW'	then	'United Way'
END	
FROM 
(select  sol from [METRO_UAT1].dbo.DPGIFT d
Left join
(
SELECT distinct ltrim(rtrim(a.campaign)) campaign, 
ltrim(rtrim(b.descr)) descr, 
substring(a.code, 1,2) As Year_Code
from [METRO_UAT1].dbo.[DPCODES] a
join [METRO_UAT1].dbo.[DPCODES] b on b.code = a.campaign
where a.FIELDNAM = 'sol' and b.FIELDNAM = 'campaign' and SUBSTRING(a.CODE,1,2) LIKE '%[^a-zA-Z]%'
union
SELECT distinct ltrim(rtrim(a.campaign)) campaign, ltrim(rtrim(b.descr)) descr, substring(a.code, 3,2) As 
Year_Code from [METRO_UAT1].dbo.[DPCODES] a
join [METRO_UAT1].dbo.[DPCODES] b on b.code = a.campaign
where a.FIELDNAM = 'sol' and b.FIELDNAM = 'campaign' and SUBSTRING(a.CODE,3,2) NOT LIKE '%[^0-9]%' )xx
on rtrim(ltrim(xx.campaign))=substring(rtrim(ltrim(d.sol)),3,2))v


--update rC_Giving__Appeal_Segment__c
update  [Migration_METRO].dbo.[Campaign_Load]
SET rC_Giving__Appeal_Segment__c='N/A'

--update rC_Giving__Channel__c
update  [Migration_METRO].dbo.[Campaign_Load]
SET rC_Giving__Channel__c='N/A'

--update rC_Giving__Effort__c
update  [Migration_METRO].dbo.[Campaign_Load]
SET rC_Giving__Effort__c='00'


--update rC_Giving__Sub_Channel__c

update  [Migration_METRO].dbo.[Campaign_Load]
SET rC_Giving__Sub_Channel__c='N/A'





--use [Migration_Metro]
--Exec SF_BulkOps 'Insert:bulkapi,parallel,Batchsize(5000)', 'TSAC_MIGR', 'Campaign_Load'

--use[Migration_Target_QA]

--Exec SF_refresh , 'TSAC_MIGR', 'Campaign','YES'
