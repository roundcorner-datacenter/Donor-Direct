-- Drop staging tables
drop table [Migration_METRO].dbo.[Account_stage_metro]

--Replicate Data

--USe [Migration_target_QA]
--exec SF_Replicate 'TSAC_MIGR', 'USER'
--exec SF_Replicate 'TSAC_MIGR', 'RecordType'



--create Staging Table

SELECT

CAST('' as nchar(18))                                                  	As ID
,CAST('' as nvarchar(255))                                            	 As Error



,CASE 
WHEN p.[type]!='IN' THEN rtrim(ltrim(a.lname))	
WHEN p.[type]='IN'	and a.Title!='' THEN rtrim(ltrim(a.title))+' '+rtrim(ltrim(a.fname))+' '+
rtrim(ltrim(a.lname))+' '+rtrim(ltrim(a.suff))	
WHEN p.[type]='IN'	and a.Title='' THEN rtrim(ltrim(a.fname))+' '+
rtrim(ltrim(a.lname))+' '+rtrim(ltrim(a.suff))	
END																						As Name
,'0053D000000IrLF'                                                      As [OwnerID]
,CASE p.[TYPE]
WHEN 'IN' THEN (Select ID from Migration_target_QA.dbo.[RECORDTYPE] 
where NAME='Household' and [SobjectType]='Account' )
ELSE (Select ID from Migration_target_QA.dbo.[RECORDTYPE] 
where NAME='Organization' and [SobjectType]='Account')
END                                                                     			As RecordTypeId
 
,CAST(rtrim(ltrim(a.st))as nvarchar(max))                                           As billingState
,CAST(rtrim(ltrim(a.zip)) as nvarchar(max))                                         As BillingPostalCode
,CAST(rtrim(ltrim(a.city)) as nvarchar(max))                                        As BillingCity

----,CAST(rtrim(ltrim(p.narr)) as nvarchar(max))                                        As Description

----,'0053D000000IrLF'                                                      			As [LastModifiedById]


,CAST(rtrim(ltrim(a.[ADD])) as nvarchar(max)) 								     	as ShippingStreet
,CAST(rtrim(ltrim(a.City)) as nvarchar(max))                                        As ShippingCity
,CAST(rtrim(ltrim(a.Zip)) as nvarchar(max))                                         As ShippingPostalCode
,CAST(rtrim(ltrim(a.st)) as nvarchar(max)) 											as ShippingState

,CAST(rtrim(ltrim(p.ENT_DT)) as datetime2)                                               As  rC_Bios__Acquired_Date__c

,CASE  rtrim(ltrim(p.[type]))  
	WHEN 'IN' THEN 'Individual'
	Else 'Organization'
	END 																			As rC_Bios__Category__c
,CAST('SEQ'+rtrim(ltrim(p.seq))+'-METRO-DONOR'+rtrim(ltrim(p.donor2)) 				As nvarchar(max))        As External_ID__c	
,CAST('' as char(18)) 																As rC_Bios__Preferred_Contact__c 

,CASE 
when p.DECDNR='1' AND p.Dec2='0' THEN 'TRUE'
    When p.DECDNR='1' AND p.Dec2='1'   THEN 'FALSE'
	WHEN p.Dec2 ='' and p.DECDNR='1' THEN 'FALSE'
	WHEN p.DECDNR='0' THEN 'TRUE' 
	END                                                                		 		As rC_Bios__Active__c
,'TRUE'                                                                 			As rC_Giving__Track_Hard_Credits__c
,'TRUE'                                                                 			As rC_Giving__Track_Soft_Credits__c
,'FALSE'                                                                			As rC_Giving__Track_Summaries__c
--,'FALSE'                                                               			As rC_Giving__Update_Gift_Membership_Summaries__c
--,'FALSE' 																			As rC_Giving__Update_Lifetime_Summaries__c
--,'FALSE' 																			as rC_Giving__Update_Summaries__c

,CAST('' as nvarchar(18))   										    			as rC_Bios__Preferred_Shipping_Address__c 
,CAST(rtrim(ltrim(a.SAL)) as nvarchar(max))                             			As rC_Bios__Salutation__c

,CAST(rtrim(ltrim(p.CYTD)) as nvarchar(max))                            			As rC_Giving__Current_Calendar_Year_Hard_Credit_Amount__c
,CAST(rtrim(ltrim(p.GIFTS_c1)) as nvarchar(max))                        			As rC_Giving__Current_Calendar_Year_Hard_Credit_Count__c
,CAST(rtrim(ltrim(p.YTD)) as nvarchar(max))                                        	As rC_Giving__Current_Year_Hard_Credit_Amount__c
,CAST(rtrim(ltrim(p.GIFTS_f1)) as nvarchar(max))                                    As rC_Giving__Current_Year_Hard_Credit_Count__c

,CAST(rtrim(ltrim(p.IN_AMT ))as nvarchar(max))                                      As rC_Giving__First_Hard_Credit_Amount__c
,CAST(rtrim(ltrim(p.IN_DT)) as datetime2)                                           As rC_Giving__First_Hard_Credit_Date__c

,CAST(rtrim(ltrim(p.MAX_AMT)) as nvarchar(max))                                     As rC_Giving__Largest_Hard_Credit_Amount__c
,CAST(rtrim(ltrim(p.max_dt)) as datetime2)                                          As rC_Giving__Largest_Hard_Credit_Date__c

,CAST(rtrim(ltrim(p.ls_amt)) as nvarchar(max))                                      As rC_Giving__Last_Hard_Credit_Amount__c
,CAST(rtrim(ltrim(p.ls_dt ))as datetime2)                                     		As rC_Giving__Last_Hard_Credit_Date__c
,CAST(rtrim(ltrim(p.gtot)) as nvarchar(max))                                        As rC_Giving__Lifetime_Hard_Credit_Amount__c
,CAST(rtrim(ltrim(p.gifts)) as nvarchar(max))                                       As rC_Giving__Lifetime_Hard_Credit_Count__c

,CAST(rtrim(ltrim(p.LY_CYTD ))as nvarchar(max))                                     As rC_Giving__Prior_Calendar_Year_Hard_Credit_Amount__c
,CAST(rtrim(ltrim(p.GIFTS_C2)) as nvarchar(max))                                    As rC_Giving__Prior_Calendar_Year_Hard_Credit_Count__c
,CAST('' as nvarchar(18))   								            			As FAX
,CAST('' as nvarchar(100))   														As Phone

,ltrim(rtrim(a.donor))																As Donor
,CAST('' as nvarchar(18))                                                           As rC_Bios__Secondary_Contact__c
,CAST('' as nvarchar(100))                                                           As service_location_code__c
,'C'+rtrim(ltrim(p.chapter))                                                            As Preferred_service_location_code__c
,CASE
rtrim(ltrim(p.staff ))
WHEN 'MSP' THEN 'By TSM'
WHEN 'TSM' THEN 'by TSM'
WHEN 'CDG' THEN 'Carissa DiGiovanni'
WHEN 'SWM' THEN 'Sandra Williams'
WHEN 'AKB' THEN 'Akilah Bryant'
WHEN 'NAC' THEN 'Nancy Canales'
WHEN 'LFO' THEN 'Linnea Forney'
WHEN 'LYB' THEN 'Lynn Beard'
WHEN 'CLE' THEN 'Carol Lewis'
WHEN 'MIJ' THEN 'Michelle Juszczyk'
WHEN 'HRE' THEN 'Hannah Reynolds'
WHEN 'KNO' THEN 'Kevin Nolen'
WHEN 'DAF' THEN 'Dan Faundez'
WHEN 'PFG' THEN 'Pat Ferguson'
WHEN 'DPR' THEN 'Dan Paredes'
WHEN 'MCG' THEN 'Michelle Graham'
WHEN 'STP' THEN 'Shannon Patterson'
WHEN 'DCW' THEN 'Deanna Wieden'
WHEN 'CTA' THEN 'Chris Anderson'
WHEN 'AGV' THEN 'Angela Vaughn'
WHEN 'CAJ' THEN 'Carl Johann'
WHEN 'DND' THEN 'Dane Duval'
WHEN 'FRM' THEN 'Frank Massolini'
WHEN 'JQR' THEN 'Jacqueline Rachev'
WHEN 'JOL' THEN 'John Larsen'
WHEN 'KMD' THEN 'Kim Dunster'
WHEN 'LTL' THEN 'LaTonya Lyons'
WHEN 'LNJ' THEN 'Leonard Johnson'
WHEN 'MLS' THEN 'Melanie Scofield'
WHEN 'PHC' THEN 'Philip Curtis'
WHEN 'SYD' THEN 'Sylvia Duncan'
WHEN 'TWB' THEN 'Twyla Brookins'
WHEN 'TYM' THEN 'Tyree Maynard'
WHEN 'ZFD' THEN 'Zofia Dripps'
WHEN 'KNJ' THEN 'Kenneth Johnson'
WHEN 'MRS' THEN 'Mark Sulkin'
WHEN 'SCJ' THEN 'Scott Justvig'
WHEN 'GR1' THEN 'Gift Advisor - Rockford Corps'
WHEN 'CYT' THEN 'Cynthia Taylor'
WHEN 'DBT' THEN 'Deborah Terrell'
WHEN 'OTV' THEN 'Other Vendor (not TSM)'
WHEN '100' THEN 'Andrea Wynne'
WHEN '101' THEN 'Angela Georgallis'
WHEN '102' THEN 'Robert Bonesteel'
WHEN '103' THEN 'Christina Lanzona'
WHEN '104' THEN 'Corporate'
WHEN '105' THEN 'David Magnuson'
WHEN '106' THEN 'Danielle Hilgers'
WHEN '107' THEN 'Darnell Burton'
WHEN '108' THEN 'Dolores Larson'
WHEN '109' THEN 'Donna Limper'
WHEN '110' THEN 'Doug Anderson'
WHEN '137' THEN 'Doug H'
WHEN '138' THEN 'James Horn'
WHEN '111' THEN 'Jamie Simkins'
WHEN '112' THEN 'Jennifer Lyter'
WHEN '113' THEN 'Jil Ittersagen'
WHEN '114' THEN 'Joi-Anissa Russell'
WHEN '115' THEN 'Karl Strand'
WHEN '116' THEN 'Kashanti Amadi'
WHEN '117' THEN 'Louise Kolar'
WHEN '118' THEN 'Lee Grossnickle'
WHEN '119' THEN 'Leslie Scott'
WHEN '120' THEN 'Linda Tucker'
WHEN '121' THEN 'Merkle'
WHEN '122' THEN 'Mick Manne'
WHEN '123' THEN 'Monika Pandya'
WHEN '124' THEN 'Norma Baker'
WHEN '125' THEN 'Paul Ross'
WHEN 'MOB' THEN 'Monika Burchfield'
WHEN 'JRU' THEN 'Jeanette Ruby'
WHEN 'GAG' THEN 'Gabriel Group'
WHEN 'BRH' THEN 'Bryant Hood'
WHEN 'F1P' THEN 'Fern Petrillo (mid-level)'
WHEN 'J1G' THEN 'Jennifer Gomez (mid-level)'
WHEN 'K1C' THEN 'Karen Clark (mid-level)'
WHEN 'THS' THEN 'Thomas Simandl'
WHEN 'T2S' THEN 'Thomas Simandl (Pool)'
WHEN 'DMC' THEN 'Danny Collins (Mid-Level)'
WHEN '126' THEN 'Randy Hellstrom'
WHEN '127' THEN 'Ray Kovach'
WHEN '128' THEN 'Ron Song'
WHEN '129' THEN 'Sylvia Duncan'
WHEN '130' THEN 'Sheila Nelson'
WHEN '131' THEN 'Sherice Muhammad'
WHEN '132' THEN 'Steve Waiksnoris'
WHEN '133' THEN 'Suzanne Ploger'
WHEN '134' THEN 'Tonia Collins'
WHEN '135' THEN 'Tannis Williamson'
WHEN '136' THEN 'Tim Hammerly'
WHEN '139' THEN 'Tonia Wheeler'
WHEN '140' THEN 'William Van Wyngaarden'
WHEN 'B6P' THEN 'Beverly Peterson'
WHEN 'A1P' THEN 'Ashley Pope (mid-level) 1'
WHEN 'MLC' THEN 'Mid-Level CONTROL'
WHEN 'A2P' THEN 'Ashley Pope (mid-level) 2'
WHEN 'DDH' THEN 'Dondra Harper'
WHEN 'B2P' THEN 'Beverly Peterson (Pool)'
WHEN 'C2J' THEN 'Carl Johann (Pool)'
WHEN 'K2J' THEN 'Kenneth Johnson (Pool)'
WHEN 'L2J' THEN 'Leonard Johnson (Pool)'
WHEN 'M2S' THEN 'Mark Sulkin (Pool)'
WHEN 'S2D' THEN 'Sylvia Duncan (Pool)'
WHEN 'PBG' THEN 'Patricia Garvey'
WHEN 'P2G' THEN 'Patricia Garvey (Pool)'
WHEN 'SJA' THEN 'Shanell Allen'
WHEN 'S2A' THEN 'Shanell Allen (Pool)'
WHEN 'K1P' THEN 'Kelly Plutko (mid-level) 1'
WHEN 'K2P' THEN 'Kelly Plutko (mid-level) 2'
WHEN 'EUM' THEN 'Eulynda Mitchell (TSM)'
WHEN 'AZI' THEN 'Andy Ziegler (TSM)'
WHEN 'THB' THEN 'Thomas Babbitt'
WHEN 'J2R' THEN 'Jeanette Ruby (Pool)'
WHEN 'TSP' THEN 'Thomas Spears'
WHEN 'DRB' THEN 'Debbie Roberts'

END 																as Primary_Solicitor__c
,CASE
rtrim(ltrim(p.staff2))
WHEN 'MSP' THEN 'staff2-By TSM'
WHEN 'TSM' THEN 'staff2-by TSM'
WHEN 'CDG' THEN 'staff2-Carissa DiGiovanni'
WHEN 'SWM' THEN 'staff2-Sandra Williams'
WHEN 'AKB' THEN 'staff2-Akilah Bryant'
WHEN 'NAC' THEN 'staff2-Nancy Canales'
WHEN 'LFO' THEN 'staff2-Linnea Forney'
WHEN 'LYB' THEN 'staff2-Lynn Beard'
WHEN 'CLE' THEN 'staff2-Carol Lewis'
WHEN 'MIJ' THEN 'staff2-Michelle Juszczyk'
WHEN 'HRE' THEN 'staff2-Hannah Reynolds'
WHEN 'KNO' THEN 'staff2-Kevin Nolen'
WHEN 'DAF' THEN 'staff2-Dan Faundez'
WHEN 'PFG' THEN 'staff2-Pat Ferguson'
WHEN 'DPR' THEN 'staff2-Dan Paredes'
WHEN 'MCG' THEN 'staff2-Michelle Graham'
WHEN 'STP' THEN 'staff2-Shannon Patterson'
WHEN 'DCW' THEN 'staff2-Deanna Wieden'
WHEN 'CTA' THEN 'staff2-Chris Anderson'
WHEN 'AGV' THEN 'staff2-Angela Vaughn'
WHEN 'CAJ' THEN 'staff2-Carl Johann'
WHEN 'DND' THEN 'staff2-Dane Duval'
WHEN 'FRM' THEN 'staff2-Frank Massolini'
WHEN 'JQR' THEN 'staff2-Jacqueline Rachev'
WHEN 'JOL' THEN 'staff2-John Larsen'
WHEN 'KMD' THEN 'staff2-Kim Dunster'
WHEN 'LTL' THEN 'staff2-LaTonya Lyons'
WHEN 'LNJ' THEN 'staff2-Leonard Johnson'
WHEN 'MLS' THEN 'staff2-Melanie Scofield'
WHEN 'PHC' THEN 'staff2-Philip Curtis'
WHEN 'SYD' THEN 'staff2-Sylvia Duncan'
WHEN 'TWB' THEN 'staff2-Twyla Brookins'
WHEN 'TYM' THEN 'staff2-Tyree Maynard'
WHEN 'ZFD' THEN 'staff2-Zofia Dripps'
WHEN 'KNJ' THEN 'staff2-Kenneth Johnson'
WHEN 'MRS' THEN 'staff2-Mark Sulkin'
WHEN 'SCJ' THEN 'staff2-Scott Justvig'
WHEN 'GR1' THEN 'staff2-Gift Advisor - Rockford Corps'
WHEN 'CYT' THEN 'staff2-Cynthia Taylor'
WHEN 'DBT' THEN 'staff2-Deborah Terrell'
WHEN 'OTV' THEN 'staff2-Other Vendor (not TSM)'
WHEN '100' THEN 'staff2-Andrea Wynne'
WHEN '101' THEN 'staff2-Angela Georgallis'
WHEN '102' THEN 'staff2-Robert Bonesteel'
WHEN '103' THEN 'staff2-Christina Lanzona'
WHEN '104' THEN 'staff2-Corporate'
WHEN '105' THEN 'staff2-David Magnuson'
WHEN '106' THEN 'staff2-Danielle Hilgers'
WHEN '107' THEN 'staff2-Darnell Burton'
WHEN '108' THEN 'staff2-Dolores Larson'
WHEN '109' THEN 'staff2-Donna Limper'
WHEN '110' THEN 'staff2-Doug Anderson'
WHEN '137' THEN 'staff2-Doug H'
WHEN '138' THEN 'staff2-James Horn'
WHEN '111' THEN 'staff2-Jamie Simkins'
WHEN '112' THEN 'staff2-Jennifer Lyter'
WHEN '113' THEN 'staff2-Jil Ittersagen'
WHEN '114' THEN 'staff2-Joi-Anissa Russell'
WHEN '115' THEN 'staff2-Karl Strand'
WHEN '116' THEN 'staff2-Kashanti Amadi'
WHEN '117' THEN 'staff2-Louise Kolar'
WHEN '118' THEN 'staff2-Lee Grossnickle'
WHEN '119' THEN 'staff2-Leslie Scott'
WHEN '120' THEN 'staff2-Linda Tucker'
WHEN '121' THEN 'staff2-Merkle'
WHEN '122' THEN 'staff2-Mick Manne'
WHEN '123' THEN 'staff2-Monika Pandya'
WHEN '124' THEN 'staff2-Norma Baker'
WHEN '125' THEN 'staff2-Paul Ross'
WHEN 'MOB' THEN 'staff2-Monika Burchfield'
WHEN 'JRU' THEN 'staff2-Jeanette Ruby'
WHEN 'GAG' THEN 'staff2-Gabriel Group'
WHEN 'BRH' THEN 'staff2-Bryant Hood'
WHEN 'F1P' THEN 'staff2-Fern Petrillo (mid-level)'
WHEN 'J1G' THEN 'staff2-Jennifer Gomez (mid-level)'
WHEN 'K1C' THEN 'staff2-Karen Clark (mid-level)'
WHEN 'THS' THEN 'staff2-Thomas Simandl'
WHEN 'T2S' THEN 'staff2-Thomas Simandl (Pool)'
WHEN 'DMC' THEN 'staff2-Danny Collins (Mid-Level)'
WHEN '126' THEN 'staff2-Randy Hellstrom'
WHEN '127' THEN 'staff2-Ray Kovach'
WHEN '128' THEN 'staff2-Ron Song'
WHEN '129' THEN 'staff2-Sylvia Duncan'
WHEN '130' THEN 'staff2-Sheila Nelson'
WHEN '131' THEN 'staff2-Sherice Muhammad'
WHEN '132' THEN 'staff2-Steve Waiksnoris'
WHEN '133' THEN 'staff2-Suzanne Ploger'
WHEN '134' THEN 'staff2-Tonia Collins'
WHEN '135' THEN 'staff2-Tannis Williamson'
WHEN '136' THEN 'staff2-Tim Hammerly'
WHEN '139' THEN 'staff2-Tonia Wheeler'
WHEN '140' THEN 'staff2-William Van Wyngaarden'
WHEN 'B6P' THEN 'staff2-Beverly Peterson'
WHEN 'A1P' THEN 'staff2-Ashley Pope (mid-level) 1'
WHEN 'MLC' THEN 'staff2-Mid-Level CONTROL'
WHEN 'A2P' THEN 'staff2-Ashley Pope (mid-level) 2'
WHEN 'DDH' THEN 'staff2-Dondra Harper'
WHEN 'B2P' THEN 'staff2-Beverly Peterson (Pool)'
WHEN 'C2J' THEN 'staff2-Carl Johann (Pool)'
WHEN 'K2J' THEN 'staff2-Kenneth Johnson (Pool)'
WHEN 'L2J' THEN 'staff2-Leonard Johnson (Pool)'
WHEN 'M2S' THEN 'staff2-Mark Sulkin (Pool)'
WHEN 'S2D' THEN 'staff2-Sylvia Duncan (Pool)'
WHEN 'PBG' THEN 'staff2-Patricia Garvey'
WHEN 'P2G' THEN 'staff2-Patricia Garvey (Pool)'
WHEN 'SJA' THEN 'staff2-Shanell Allen'
WHEN 'S2A' THEN 'staff2-Shanell Allen (Pool)'
WHEN 'K1P' THEN 'staff2-Kelly Plutko (mid-level) 1'
WHEN 'K2P' THEN 'staff2-Kelly Plutko (mid-level) 2'
WHEN 'EUM' THEN 'staff2-Eulynda Mitchell (TSM)'
WHEN 'AZI' THEN 'staff2-Andy Ziegler (TSM)'
WHEN 'THB' THEN 'staff2-Thomas Babbitt'
WHEN 'J2R' THEN 'staff2-Jeanette Ruby (Pool)'
WHEN 'TSP' THEN 'staff2-Thomas Spears'
WHEN 'DRB' THEN 'staff2-Debbie Roberts'



END                                     As Major_Giving_Contact__c,

CAST('' as nchar(18))                  As Secondary_Contact__c
,rtrim(ltrim(p.seq))     				as legacy_donor_id__c


INTO [Migration_METRO].dbo.[Account_stage_metro]
from 
[METRO_UAT1].dbo.[DPADD] a
 LEFT JOin 
[METRO_UAT1].dbo.[DP] p 
on rtrim(ltrim(a.donor)) = rtrim(ltrim(p.Donor2))

where a.priority='1' and a.Donor!='' AND a.lname!=''
------------------------------------------------------------------------------------------------------------------------
--Updating PHONE Coloumn 
-------------------------------------------------------------------------------------------------------------------------
update [Migration_METRO].dbo.Account_stage_metro 
set Phone= a.phone
from (SELECT ltrim(rtrim(DONOR)) as DONOR,a.phone, PHTYPE, PHorder from [METRO_UAT1].dbo.dpphone a WHERE PHTYPE not in ('EMAI','site','fax','unkn') 
and a.phorder = (SELECT MIN (b.phorder) from [METRO_UAT1].dbo.dpphone b WHERE b.PHTYPE not in ('EMAI','site','fax','unkn') 
and b.donor = a.donor and ltrim(rtrim(donor)) NOT in ('268165','379648','466167'))) a
left join
[Migration_METRO].dbo.Account_stage_metro b
on rtrim(ltrim(a.donor))=rtrim(ltrim(b.donor))

------------------------------------------------------------------------------------------------------------------------
--Updating FAX Coloumn 
-------------------------------------------------------------------------------------------------------------------------

update [Migration_METRO].dbo.Account_stage_metro
set FAX= aa.PHONE from 
(SELECT rtrim(ltrim(a.phone)) PHONE,rtrim(ltrim(a.donor)) donor from [METRO_UAT1].dbo.dpphone a WHERE PHTYPE='fax' and a.phorder = 
(SELECT MIN (b.phorder) from [METRO_UAT1].dbo.dpphone b WHERE b.PHTYPE ='fax' and b.donor = a.donor )) aa

inner join
[Migration_METRO].[dbo].[Account_stage_metro] b
on rtrim(ltrim(aa.donor))=rtrim(ltrim(b.donor))





------------------------------------------------------------------------------------------------------------------------


---update service_location_code__c

update a
SET a.service_location_code__c='C'+rtrim(ltrim(x.SLC_CODE__C))
FROM  [Migration_METRO].dbo.[Account_stage_metro] a
left join
[METRO_UAT1].dbo.DPADD dpadd
on a.donor=rtrim(ltrim(dpadd.donor))

left join
[DerivedData].[dbo].[SLCtoZIP] x
on substring(dpadd.zip,1,5)=x.ZIP_CODE__C
LEFT join
[METRO_UAT1].dbo.Dp dp on dp.donor2=dpadd.donor
where x.SLC_CODE__C!=dp.CHAPTER



----updating service_location_code__c (again)
update [Migration_METRO].dbo.[Account_stage_metro]
SET service_location_code__c=CAST('' as nvarchar(255))
Where service_location_code__c='C'




-------Update name

-- update x
-- SET x.name=
-- CASE 
-- WHEN p.[type]!='IN' THEN rtrim(ltrim(a.lname))	
-- WHEN p.[type]='IN'	and a.Title!='' THEN rtrim(ltrim(a.title))+' '+rtrim(ltrim(a.fname))+' '+
-- rtrim(ltrim(a.lname))+' '+rtrim(ltrim(a.suff))	
-- WHEN p.[type]='IN'	and a.Title='' THEN rtrim(ltrim(a.fname))+' '+
-- rtrim(ltrim(a.lname))+' '+rtrim(ltrim(a.suff))
-- END
-- FROM [METRO_UAT1].dbo.DPADD a
-- inner join
-- [METRO_UAT1].dbo.Dp p
-- on rtrim(ltrim(a.donor))=rtrim(ltrim(p.donor2))
-- inner join
-- [Migration_METRO].dbo.[Account_stage_metro] x
-- on x.donor=rtrim(ltrim(a.donor))

--------update Preferred_service_location_code__c
-- Update x
-- set x.Preferred_service_location_code__c='C'+rtrim(ltrim(p.chapter))  
-- FROM [Migration_METRO].dbo.[Account_stage_metro] x
-- inner join
-- [METRO_UAT1].dbo.dp p
-- on rtrim(ltrim(p.donor2))=x.donor
                                                         




--- Insert/Update records
-- use [Migration_METRO]
-- Exec SF_BulkOps 'Insert:bulkapi,parallel,Batchsize(5000)', 'TSAC_MIGR', 'Account_stage_metro'
 
----------------------------------------------------------------
---check errors

--select count(*) from [Migration_METRO].dbo.[Account_stage_metro] where error not like'%Op%'


--after contacts Load

--update
-- Select id,CAST('' as nvarchar(255)) as Error, rC_Bios__Secondary_Contact__c,rC_Bios__Preferred_Contact__c 
-- into Account_UPDATE FROM [Migration_METRO].dbo.[Account_stage_metro]

-- use [Migration_METRO]
-- Exec SF_BulkOps 'Update:bulkapi', 'TSAC_MIGR', 'Account_UPDATE'


-- Replicate Data
--use Migration_target_QA
--exec SF_Refresh 'TSAC_MIGR', 'Account','yes'


