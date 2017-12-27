----------------------------------------------------------------------------------------
--Campaign Hiearchy1,After manually inserted 'METRO' and 'WUM' manually having recordtypeID of Standard.
--Use TSAC_MIGR Id of 'METRO' and 'WUM' in below script 
----------------------------------------------------------------------------------------
drop table [Migration_Metro].dbo.[Campaign_Load_Hiearchy1]

select 
CAST('' as nchar(18))                                                      					As ID,
CAST('' as nvarchar(255))                                                 				    As Error,
'7013D0000009Qy2'                                                                        As [ParentID],
[Name]                                                                                      As [Name],
(Select ID from [Migration_target_QA].dbo.[RECORDTYPE] 
where NAME='Standard' and [SobjectType]='campaign')                                         As RecordtypeID
,'USC'																						as rC_Giving__Affiliation__c
,'MET' 																						as rC_Giving__Sub_Affiliation__c
,cast('' as nvarchar(255))																	as rC_Giving__Campaign_Type__c
                        
INTO [Migration_Metro].dbo.[Campaign_Load_Hiearchy1]
 FROM(
 SELECT
CASE 

WHEN Year_Code='60' then'FY-1960'
WHEN Year_Code='61' then'FY-1961'
WHEN Year_Code='62' then'FY-1962'
WHEN Year_Code='63' then'FY-1963'
WHEN Year_Code='64' then'FY-1964'
WHEN Year_Code='65' then'FY-1965'
WHEN Year_Code='66' then'FY-1966'
WHEN Year_Code='67' then'FY-1967'
WHEN Year_Code='68' then'FY-1968'
WHEN Year_Code='69' then'FY-1969'
WHEN Year_Code='70' then'FY-1970'
WHEN Year_Code='71' then'FY-1971'
WHEN Year_Code='72' then'FY-1972'
WHEN Year_Code='73' then'FY-1973'
WHEN Year_Code='74' then'FY-1974'
WHEN Year_Code='75' then'FY-1975'
WHEN Year_Code='76' then'FY-1976'
WHEN Year_Code='77' then'FY-1977'
WHEN Year_Code='78' then'FY-1978'
WHEN Year_Code='79' then'FY-1979'
WHEN Year_Code='80' then'FY-1980'
WHEN Year_Code='81' then'FY-1981'
WHEN Year_Code='82' then'FY-1982'
WHEN Year_Code='83' then'FY-1983'
WHEN Year_Code='84' then'FY-1984'
WHEN Year_Code='85' then'FY-1985'
WHEN Year_Code='86' then'FY-1986'
WHEN Year_Code='87' then'FY-1987'
WHEN Year_Code='88' then'FY-1988'
WHEN Year_Code='89' then'FY-1989'
WHEN Year_Code='90' then'FY-1990'
WHEN Year_Code='91' then'FY-1991'
WHEN Year_Code='92' then'FY-1992'
WHEN Year_Code='93' then'FY-1993'
WHEN Year_Code='94' then'FY-1994'
WHEN Year_Code='95' then'FY-1995'
WHEN Year_Code='96' then'FY-1996'
WHEN Year_Code='97' then'FY-1997'
WHEN Year_Code='98' then'FY-1998'
WHEN Year_Code='99' then'FY-1999'
WHEN Year_Code='00' then'FY-2000'
WHEN Year_Code='01' then'FY-2001'
WHEN Year_Code='02' then'FY-2002'
WHEN Year_Code='03' then'FY-2003'
WHEN Year_Code='04' then'FY-2004'
WHEN Year_Code='05' then'FY-2005'
WHEN Year_Code='06' then'FY-2006'
WHEN Year_Code='07' then'FY-2007'
WHEN Year_Code='08' then'FY-2008'
WHEN Year_Code='09' then'FY-2009'
WHEN Year_Code='10' then'FY-2010'
WHEN Year_Code='11' then'FY-2011'
WHEN Year_Code='12' then'FY-2012'
WHEN Year_Code='13' then'FY-2013'
WHEN Year_Code='14' then'FY-2014'
WHEN Year_Code='15' then'FY-2015'
WHEN Year_Code='16' then'FY-2016'
WHEN Year_Code='17' then'FY-2017'
WHEN Year_Code='18' then'FY-2018'
END                                                             as[Name]
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

FROM 


(SELECT distinct ltrim(rtrim(a.campaign)) campaign, 
ltrim(rtrim(b.descr)) descr, 
substring(a.code, 1,2) As Year_Code
from [METRO_UAT1].dbo.[DPCODES] a
join [METRO_UAT1].dbo.[DPCODES] b on b.code = a.campaign
where a.FIELDNAM = 'sol' and b.FIELDNAM = 'campaign' and SUBSTRING(a.CODE,1,2) LIKE '%[^a-zA-Z]%'
union
SELECT distinct ltrim(rtrim(a.campaign)) campaign, ltrim(rtrim(b.descr)) descr, substring(a.code, 3,2) As 
Year_Code from [METRO_UAT1].dbo.[DPCODES] a
join [METRO_UAT1].dbo.[DPCODES] b on b.code = a.campaign
where a.FIELDNAM = 'sol' and b.FIELDNAM = 'campaign' and SUBSTRING(a.CODE,3,2) NOT LIKE '%[^0-9]%'
 
)xx

)yy

group by [Name]



----update rC_Giving__Campaign_Type__c
update  [Migration_Metro].dbo.[Campaign_Load_Hiearchy1] 
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
from
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





-- use [Migration_Metro]
-- Exec SF_BulkOps 'Insert:bulkapi,parallel,Batchsize(10000)', 'TSAC_MIGR', 'Campaign_Load_Hiearchy1'

--select * from [Migration_Metro].dbo.[Campaign_Load_Hiearchy1] where ID=''




