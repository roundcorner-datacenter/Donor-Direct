-- Drop staging tables
drop table [Migration_METRO].dbo.[Contact_stage_Metro]

--Replicate Data

--USe [Migration_Target_QA]
--exec SF_Replicate 'TSAC_MIGR', 'USER'
--exec SF_Replicate 'TSAC_MIGR', 'RecordType'




---------------------------------------------------------------------------------------------
--Insert into Contact TSAC_MIGR Object.
---------------------------------------------------------------------------------------------
select * 
INTO [Migration_METRO].dbo.[Contact_stage_Metro]
from(
SELECT
CAST('' as nchar(18))                                                          As ID,
CAST('' as nvarchar(255))                                                     As Error,
CASE
WHEN LEFT(CONVERT(VARCHAR, dp.DOB, 120),4) < 1900 THEN ''
Else  dp.DOB                                                                      
End																			 As Birthdate,
CASE dp.TYPE
WHEN 'IN' THEN (Select ID from [Migration_Target_QA].dbo.[RECORDTYPE] 
where NAME='Household' and [SobjectType]='Contact' )
ELSE (Select ID from [Migration_Target_QA].dbo.[RECORDTYPE] 
where NAME='Organizational' and [SobjectType]='Contact')
END                                                                           As RecordTypeId,
---'0053B000001AuXp'                                                              As [createdBy],
CASE dp.TYPE
WHEN 'IN' THEN 'INDIVIDUAL'
ELSE 'Organization'
END                                                                           As Description,
CAST('' AS nvarchar(max))                                                    As Email,
DP.NOEMAIL                                                                    As HasOptedOutOfEmail,
CAST('' AS nvarchar(max))                                                                As Fax,
CAST('' AS nvarchar(max))                                                           As HomePhone,
CASE dp.NOEMAIL
	When '1' then 'TRUE'
	Else 'FALSE'
	End                                                                         As rC_Bios__Home_Email_Opt_Out__c,
	dpadd.[ADD]                                                                  As MailingStreet,
dpadd.ST                                                                        As MailingState,
dpadd.ZIP                                                                       As MailingPostalCode,
dpadd.CITY                                                                      As MailingCity,
CAST('' AS nvarchar(max))                                                       As MobilePhone,
rtrim(ltrim(dpadd.sal))                                                         As 	rC_Bios__Salutation__c,-- Commented

dpadd.fname                                                                             As FIRSTNAME,
dpadd.lname                                                                            As LASTNAME,
CAST('' AS nvarchar(max))                                            As OtherPhone,
CAST('' AS nvarchar(max))                                                                 As Phone,
rtrim(ltrim(dpadd.PTITLE))                                                     As Title,

CASE 
WHEN dp.DECDNR='1' THEN 'FALSE'

ELSE 'true'
END                                                                            As rC_Bios__Active__c,
CASE
WHEN LEFT(CONVERT(VARCHAR, dp.DOB, 120),4) < 1900 THEN ''
ELSE   LEFT(CONVERT(VARCHAR, dp.DOB, 120),4)
END                                                                           As rC_Bios__Birth_Year__c,

 CASE
 WHEN LEFT(CONVERT(VARCHAR, dp.DOB, 120),4) < 1900 THEN ''
ELSE   RIGHT(LEFT(CONVERT(VARCHAR, dp.DOB, 120),10),2)
END                                                                           As rC_Bios__Birth_Day__c,

 CASE
 WHEN LEFT(CONVERT(VARCHAR, dp.DOB, 120),4) < 1900 THEN ''
ELSE   SUBSTRING(LEFT(CONVERT(VARCHAR, dp.DOB, 120),10),6,2)
END                                                                           As rC_Bios__Birth_Month__c,
CASE 
WHEN dp.DECDNR='1' THEN 'TRUE'
ELSE 'False'
END                                                                            As rC_Bios__Deceased__c,
CASE
WHEN dp.DECEASED ='1899-12-30 00:00:00.0000000'  THEN NULL
Else dp.DECEASED 
END																					As rC_Bios__Deceased_Date__c,
                                                                             
CASE 
WHEN dp.DECEASED ='1899-12-30 00:00:00.0000000'  THEN ''
ELSE LEFT(CONVERT(VARCHAR, dp.DECEASED, 120),4) 
END                                     										As rC_Bios__Deceased_Year__c,
CASE
WHEN dp.DECEASED ='1899-12-30 00:00:00.0000000'  THEN ''
ELSE RIGHT(LEFT(CONVERT(VARCHAR, dp.DECEASED, 120),10),2)  
END														                          As rC_Bios__Deceased_Day__c,
CASE
WHEN dp.DECEASED ='1899-12-30 00:00:00.0000000'  THEN ''
ELSE SUBSTRING(LEFT(CONVERT(VARCHAR, dp.DECEASED, 120),10),6,2)
END														                      As rC_Bios__Deceased_Month__c,
CASE 
WHEN DP.gender in('M','m')  then 'Male'
WHEN DP.gender in ('F','f')  then 'Female'
WHEN DP.gender='U' then 'Unknown'
WHEN DP.gender in ('o','O') then 'other'
Else DP.gender
END                                                                             As rC_Bios__Gender__c,
CAST('' AS nvarchar(max))                                             AS rC_Bios__Home_Email__c,

CASE CAST(dp.MARRIED As varchar)
WHEN 'T' THEN 'Married'
WHEN 'F' THEN 'Single'
END                                                                             As rC_Bios__Marital_Status__c,
DPADD.MNAME                                                                     As rC_Bios__Middle_Name__c,
CAST('' AS nvarchar(max))                                                      As rC_Bios__Other_Email__c,

'TRUE'                                                                      AS rC_Bios__Preferred_Contact__c,
CAST('' AS nvarchar(max))                                                                      As rC_Bios__Preferred_Email__c,
CAST('' AS nvarchar(max))                                                     As rC_Bios__Preferred_Phone__c,
'FALSE'                                                                          As rC_Bios__Secondary_Contact__c,
rtrim(ltrim(SUFF))                                                           AS rC_Bios__Suffix__c,
CAST('' AS nvarchar(max))                                                   As rC_Bios__Website_Url__c,
CAST('' AS nvarchar(max))                                             As rC_Bios__Work_Email__c,
CAST('' AS nvarchar(max))                                                 As rC_Bios__Work_Phone__c,
'TRUE'                                                                   As rC_Giving__Track_Soft_Credits__c,
rtrim(ltrim(dpadd.donor))                                                     As Donor,
CAST('SEQ'+rtrim(ltrim(dp.seq))+'-METRO-DONOR'+rtrim(ltrim(dp.donor2)) 				As nvarchar(max))   As External_ID__c,
a.ID                                                                            As AccountID,
DPADD.title                                                                       As Salutation
--INTO [Migration_METRO].dbo.[Contact_stage_Metro]
FROM 
[METRO_UAT1].dbo.[DPADD] dpadd
left join
[METRO_UAT1].dbo.[DP] dp
on 
rtrim(ltrim(dpadd.donor)) = rtrim(ltrim(dp.Donor2))
LEFT JOIN
[Migration_METRO].dbo.Account_stage_metro a
on rtrim(ltrim(a.donor))=rtrim(ltrim(dpadd.donor))

where
dpadd.priority='1' and dpadd.Donor!='' AND dpadd.lname!='' and dpadd.secln=''
UNION ALL
SELECT

CAST('' as nchar(18))                                                          As ID,
CAST('' as nvarchar(255))                                                     As Error,
CASE
WHEN LEFT(CONVERT(VARCHAR, dp.DOB, 120),4) < 1900 THEN ''
Else  dp.DOB
END                                                                            As Birthdate,
CASE dp.TYPE
WHEN 'IN' THEN (Select ID from [Migration_Target_QA].dbo.[RECORDTYPE] 
where NAME='Household' and [SobjectType]='Contact' )
ELSE (Select ID from [Migration_Target_QA].dbo.[RECORDTYPE] 
where NAME='Organizational' and [SobjectType]='Contact')
END                                                                           As RecordTypeId,
-----'0053B000001AuXp'                                                              As [createdBy],-- HardCoded because not all Users got Migrated,
CASE dp.TYPE
WHEN 'IN' THEN 'INDIVIDUAL'
ELSE 'Organization'
END                                                                           As Description,
CAST('' AS nvarchar(max))                                                                          As Email,
DP.NOEMAIL                                                                    As HasOptedOutOfEmail,
CAST('' AS nvarchar(max))                                                                As Fax,
CAST('' AS nvarchar(max))                                                           As HomePhone,
CASE dp.NOEMAIL
	When '1' then 'TRUE'
	Else 'FALSE'
	End                                                                         As rC_Bios__Home_Email_Opt_Out__c,
	dpadd.[ADD]                                                                  As MailingStreet,
dpadd.ST                                                                        As MailingState,
dpadd.ZIP                                                                       As MailingPostalCode,
dpadd.CITY                                                                      As MailingCity,
CAST('' AS nvarchar(max))                                                       As MobilePhone,
rtrim(ltrim(dpadd.sal))                                                         As 	rC_Bios__Salutation__c,-- Commented

dpadd.fname                                                                             As FIRSTNAME,
dpadd.lname                                                                            As LASTNAME,
CAST('' AS nvarchar(max))                                            As OtherPhone,
CAST('' AS nvarchar(max))                                                                 As Phone,
rtrim(ltrim(dpadd.PTITLE))                                                     As Title,

CASE 
WHEN dp.DECDNR='1' THEN 'FALSE'
--WHEN dp.DEC2='1' THEN 'FALSE'

ELSE 'TRUE'
END                                                                            As rC_Bios__Active__c,
CASE
WHEN LEFT(CONVERT(VARCHAR, dp.DOB, 120),4) < 1900 THEN ''
ELSE   LEFT(CONVERT(VARCHAR, dp.DOB, 120),4)
END                                                                       As rC_Bios__Birth_Year__c,

 CASE
 WHEN LEFT(CONVERT(VARCHAR, dp.DOB, 120),4) < 1900 THEN ''
ELSE   RIGHT(LEFT(CONVERT(VARCHAR, dp.DOB, 120),10),2)
END                                                                           As rC_Bios__Birth_Day__c,

 CASE
 WHEN LEFT(CONVERT(VARCHAR, dp.DOB, 120),4) < 1900 THEN ''
ELSE   SUBSTRING(LEFT(CONVERT(VARCHAR, dp.DOB, 120),10),6,2)
END                                                                           As rC_Bios__Birth_Month__c,
CASE 
WHEN dp.DECDNR='1' THEN 'TRUE'
--WHEN dp.DEC2='1' THEN 'TRUE'
ELSE 'False'
END                                                                            As rC_Bios__Deceased__c,
CASE
WHEN dp.DECEASED ='1899-12-30 00:00:00.0000000'  THEN NULL
Else dp.DECEASED 
END                                                                              As rC_Bios__Deceased_Date__c,
CASE
WHEN dp.DECEASED ='1899-12-30 00:00:00.0000000'  THEN ''
ELSE LEFT(CONVERT(VARCHAR, dp.DECEASED, 120),4)
END 										                                      As rC_Bios__Deceased_Year__c,
CASE
WHEN dp.DECEASED ='1899-12-30 00:00:00.0000000'  THEN ''
ELSE RIGHT(LEFT(CONVERT(VARCHAR, dp.DECEASED, 120),10),2)   
END														                         As rC_Bios__Deceased_Day__c,
case
WHEN dp.DECEASED ='1899-12-30 00:00:00.0000000'  THEN ''
else SUBSTRING(LEFT(CONVERT(VARCHAR, dp.DECEASED, 120),10),6,2)     
END																                 As rC_Bios__Deceased_Month__c,
CASE 
WHEN DP.gender in('M','m')  then 'Male'
WHEN DP.gender in ('F','f')  then 'Female'
WHEN DP.gender='U' then 'Unknow'
WHEN DP.gender in ('o','O') then 'other'
Else DP.gender
END                                                                             As rC_Bios__Gender__c,
CAST('' AS nvarchar(max))                                             AS rC_Bios__Home_Email__c,

CASE CAST(dp.MARRIED As varchar)
WHEN 'T' THEN 'Married'
WHEN 'F' THEN 'Single'
END                                                                             As rC_Bios__Marital_Status__c,
DPADD.MNAME                                                                     As rC_Bios__Middle_Name__c,
CAST('' AS nvarchar(max))                                                      As rC_Bios__Other_Email__c,

'TRUE'                                                                      AS rC_Bios__Preferred_Contact__c,
CAST('' AS nvarchar(max))                                                                       As rC_Bios__Preferred_Email__c,
CAST('' AS nvarchar(max))                                                     As rC_Bios__Preferred_Phone__c,
'FALSE'                                                                          As rC_Bios__Secondary_Contact__c,
rtrim(ltrim(SUFF))                                                           AS rC_Bios__Suffix__c,
CAST('' AS nvarchar(max))                                                   As rC_Bios__Website_Url__c,
CAST('' AS nvarchar(max))                                             As rC_Bios__Work_Email__c,
CAST('' AS nvarchar(max))                                                 As rC_Bios__Work_Phone__c,
'TRUE'                                                                   As rC_Giving__Track_Soft_Credits__c,
rtrim(ltrim(dpadd.donor))                                                     As Donor,
CAST('SEQ'+rtrim(ltrim(dp.seq))+'-METRO-DONOR'+rtrim(ltrim(dp.donor2)) 				As nvarchar(max))   As External_ID__c,

a.ID                                                                            As AccountID,
DPADD.title                                                                       As Salutation

FROM 
[METRO_UAT1].dbo.[DPADD] dpadd
left join
[METRO_UAT1].dbo.[DP] dp
on 
rtrim(ltrim(dpadd.donor)) = rtrim(ltrim(dp.Donor2))
LEFT JOIN
[Migration_METRO].dbo.Account_stage_metro a
on rtrim(ltrim(a.donor))=rtrim(ltrim(dpadd.donor))
where
dpadd.priority='1' and dpadd.Donor!='' AND dpadd.lname!='' and dpadd.secln!=''
UNION ALL
SELECT

CAST('' as nchar(18))                                                          As ID,
CAST('' as nvarchar(255))                                                     As Error,
CASE
WHEN LEFT(CONVERT(VARCHAR, dp.DOB2, 120),4) < 1900 THEN ''
Else  dp.DOB2
END                                                                      As Birthdate,
CASE dp.TYPE
WHEN 'IN' THEN (Select ID from [Migration_Target_QA].dbo.[RECORDTYPE] 
where NAME='Household' and [SobjectType]='Contact' )
ELSE (Select ID from [Migration_Target_QA].dbo.[RECORDTYPE] 
where NAME='Organizational' and [SobjectType]='Contact')
END                                                                           As RecordTypeId,
-----'0053B000001AuXp'                                                              As [createdBy],-- HardCoded because not all Users got Migrated,
CASE dp.TYPE
WHEN 'IN' THEN 'INDIVIDUAL'
ELSE 'Organization'
END                                                                           As Description,
CAST('' AS nvarchar(max))                                                                          As Email,
DP.NOEMAIL                                                                    As HasOptedOutOfEmail,
CAST('' AS nvarchar(max))                                                                As Fax,
CAST('' AS nvarchar(max))                                                           As HomePhone,
CASE dp.NOEMAIL
	When '1' then 'TRUE'
	Else 'FALSE'
	End                                                                         As rC_Bios__Home_Email_Opt_Out__c,
	dpadd.[ADD]                                                                  As MailingStreet,
dpadd.ST                                                                        As MailingState,
dpadd.ZIP                                                                       As MailingPostalCode,
dpadd.CITY                                                                      As MailingCity,
CAST('' AS nvarchar(max))                                                       As MobilePhone,
CAST('' AS nvarchar(max))                                                         As rC_Bios__Salutation__c,-- Commented

''                                                                             As FIRSTNAME,
dpadd.secln                                                                            As LASTNAME,
CAST('' AS nvarchar(max))                                            As OtherPhone,
CAST('' AS nvarchar(max))                                                                 As Phone,
rtrim(ltrim(dpadd.PTITLE))                                                     As Title,

CASE 
--WHEN dp.DECDNR='1' THEN 'FALSE'
WHEN dp.DEC2='1' THEN 'FALSE'
ELSE 'True'
END                                                                            As rC_Bios__Active__c,
CASE
WHEN LEFT(CONVERT(VARCHAR, dp.DOB2, 120),4) < 1900 THEN ''
ELSE   LEFT(CONVERT(VARCHAR, dp.DOB2, 120),4)
END                                                                             As rC_Bios__Birth_Year__c,

 CASE
 WHEN LEFT(CONVERT(VARCHAR, dp.DOB2, 120),4) < 1900 THEN ''
ELSE   RIGHT(LEFT(CONVERT(VARCHAR, dp.DOB2, 120),10),2)
END                                                                     As rC_Bios__Birth_Day__c,

 CASE
 WHEN LEFT(CONVERT(VARCHAR, dp.DOB2, 120),4) < 1900 THEN ''
ELSE   SUBSTRING(LEFT(CONVERT(VARCHAR, dp.DOB2, 120),10),6,2)
END                                                              As rC_Bios__Birth_Month__c,
CASE 
WHEN dp.DEC2='1' THEN 'TRUE'
ELSE 'False'
END                                                                            As rC_Bios__Deceased__c,
CASE
WHEN dp.DECEASED2 ='1899-12-30 00:00:00.0000000'  THEN NULL
Else dp.DECEASED2
END                                                                            As rC_Bios__Deceased_Date__c,
case
WHEN dp.DECEASED2 ='1899-12-30 00:00:00.0000000'  THEN ''
ELSE LEFT(CONVERT(VARCHAR, dp.DECEASED2, 120),4)
END											                                     As rC_Bios__Deceased_Year__c,
CASE 
WHEN dp.DECEASED2='1899-12-30 00:00:00.0000000'  THEN ''
else RIGHT(LEFT(CONVERT(VARCHAR, dp.DECEASED2, 120),10),2) 
END 												                           As rC_Bios__Deceased_Day__c,
case
WHEN dp.DECEASED2='1899-12-30 00:00:00.0000000'  THEN ''
ELSE SUBSTRING(LEFT(CONVERT(VARCHAR, dp.DECEASED2, 120),10),6,2)  
END														                    As rC_Bios__Deceased_Month__c,
CASE 
WHEN DP.gender in('M','m')  then 'Male'
WHEN DP.gender in ('F','f')  then 'Female'
WHEN DP.gender='U' then 'Unknow'
WHEN DP.gender in ('o','O') then 'other'
Else DP.gender
END                                                                             As rC_Bios__Gender__c,
CAST('' AS nvarchar(max))                                             AS rC_Bios__Home_Email__c,

CASE CAST(dp.MARRIED As varchar)
WHEN 'T' THEN 'Married'
WHEN 'F' THEN 'Single'
END                                                                             As rC_Bios__Marital_Status__c,
DPADD.MNAME                                                                     As rC_Bios__Middle_Name__c,
CAST('' AS nvarchar(max))                                                      As rC_Bios__Other_Email__c,

'FALSE'                                                                      AS rC_Bios__Preferred_Contact__c,
CAST('' AS nvarchar(max))                                                                      As rC_Bios__Preferred_Email__c,
CAST('' AS nvarchar(max))                                                     As rC_Bios__Preferred_Phone__c,
'TRUE'                                                                          As rC_Bios__Secondary_Contact__c,
CAST('' AS nvarchar(max))                                                           AS rC_Bios__Suffix__c,
CAST('' AS nvarchar(max))                                                   As rC_Bios__Website_Url__c,
CAST('' AS nvarchar(max))                                             As rC_Bios__Work_Email__c,
CAST('' AS nvarchar(max))                                                 As rC_Bios__Work_Phone__c,
'TRUE'                                                                   As rC_Giving__Track_Soft_Credits__c,
rtrim(ltrim(dpadd.donor))                                                     As Donor,
CAST('SEQ'+rtrim(ltrim(dp.seq))+'-METRO-DONOR'+rtrim(ltrim(dp.donor2)) +'-2' 				As nvarchar(max))   As External_ID__c,
a.ID                                                                            As AccountID,
DPADD.title                                                                       As Salutation

FROM 
[METRO_UAT1].dbo.[DPADD] dpadd
left join
[METRO_UAT1].dbo.[DP] dp
on 
rtrim(ltrim(dpadd.donor)) = rtrim(ltrim(dp.Donor2))
LEFT JOIN
[Migration_METRO].dbo.Account_stage_metro a
on rtrim(ltrim(a.donor))=rtrim(ltrim(dpadd.donor))

where
dpadd.priority='1' and dpadd.Donor!='' AND dpadd.lname!='' and dpadd.secln!=''

) xx

Order by AccountId


---------------------------------------------------------------------------------------------
--Updating Email Column.
---------------------------------------------------------------------------------------------
update [Migration_METRO].dbo.[Contact_stage_Metro]
SET Email=aa.PHONE FROM (SELECT rtrim(ltrim(donor)) as donor,a.phone, PHTYPE, PHorder from 
[METRO_UAT1].dbo.dpphone a WHERE PHTYPE = 'EMAI' 
 and a.phorder = (SELECT MIN (b.phorder) from [METRO_UAT1].dbo.dpphone b WHERE b.PHTYPE = 'EMAI' and b.donor = a.donor)
 and rtrim(ltrim(donor)) not in ('466167','137664',' 298411','395862','494298','557131','632314')) aa
LEFT join
 [Migration_METRO].dbo.[Contact_stage_Metro] cl
 on
 aa.donor=cl.donor
 ---------------------------------------------------------------------------------------------
--Updating Email Column.--if PHTYPE = FAX, then "PHONE"
----------------------------------------------------------------------------------------------
update [Migration_METRO].dbo.Contact_stage_Metro
set FAX= aa.PHONE from 
(SELECT rtrim(ltrim(a.phone)) PHONE,rtrim(ltrim(a.donor)) donor from [METRO_UAT1].dbo.dpphone a WHERE PHTYPE='fax' and a.Pidnumb = 
(select max(b.pidnumb) from [METRO_UAT1].dbo.dpphone b where b.PHTYPE = 'fax' and b.DONOR = a.donor )) aa

inner join
[Migration_METRO].[dbo].[Contact_stage_Metro] b
on aa.donor=rtrim(ltrim(b.donor))
 ---------------------------------------------------------------------------------------------
--Updating HomePhone Column.
----------------------------------------------------------------------------------------------
 update [Migration_METRO].dbo.[Contact_stage_Metro]
 set HomePhone= aa.phone
 from
 (SELECT rtrim(ltrim(donor)) As Donor,phone, PHTYPE, PHorder 
from [METRO_UAT1].dbo.dpphone a WHERE PHTYPE not in ('EMAI','site','fax','unkn', 'work') AND
 a.pidnumb = (select max(b.pidnumb) from [METRO_UAT1].dbo.dpphone b where b.PHTYPE = 'HOME' and b.DONOR = a.donor) 
 and rtrim(ltrim(donor)) !='233267') aa
inner join
[Migration_METRO].[dbo].[Contact_stage_Metro] cl
on aa.donor=rtrim(ltrim(cl.donor))
 ---------------------------------------------------------------------------------------------
--Updating MobilePhone Column.
----------------------------------------------------------------------------------------------
 update [Migration_METRO].dbo.[Contact_stage_Metro]
 set MobilePhone= aa.phone
 from
(SELECT rtrim(ltrim(DONOR)) donor,a.phone, PHTYPE, PHorder from [METRO_UAT1].dbo.dpphone a WHERE PHTYPE = 'cell' 
and a.phorder = (SELECT MIN (b.phorder) from [METRO_UAT1].dbo.dpphone b WHERE b.PHTYPE = 'cell' and b.donor = a.donor)) aa

inner join
[Migration_METRO].[dbo].[Contact_stage_Metro] cl
on aa.donor=rtrim(ltrim(cl.donor))


 ---------------------------------------------------------------------------------------------
--Updating OtherPhone Column.
----------------------------------------------------------------------------------------------
update [Migration_METRO].dbo.[Contact_stage_Metro]
 set OtherPhone=  aa.phone
 from
(SELECT rtrim(ltrim(DONOR)) donor,a.phone, PHTYPE, PHorder from [METRO_UAT1].dbo.dpphone a WHERE PHTYPE = 'UNKN' and a.phorder = 
(SELECT MIN (b.phorder) from [METRO_UAT1].dbo.dpphone b WHERE b.PHTYPE = 'UNKN' and b.donor = a.donor)) aa

inner join
[Migration_METRO].[dbo].[Contact_stage_Metro] cl
on aa.donor=rtrim(ltrim(cl.donor))


 ---------------------------------------------------------------------------------------------
--Updating Phone Column.
----------------------------------------------------------------------------------------------


 update [Migration_METRO].dbo.[Contact_stage_Metro]
 set Phone=  aa.phone
 from (SELECT rtrim(ltrim(DONOR)) donor,a.phone, PHTYPE, PHorder from [METRO_UAT1].dbo.dpphone a WHERE PHTYPE Not In ('UNKN', 'site', 'emai', 'fax') and a.phorder = (SELECT MIN (b.phorder) from [METRO_UAT1].dbo.dpphone b 
WHERE b.PHTYPE Not In ('UNKN', 'site', 'emai', 'fax') and 
b.donor = a.donor and rtrim(ltrim(DONOR)) not in ('268165','379648','466167'))) aa

inner join
[Migration_METRO].[dbo].[Contact_stage_Metro] cl
on aa.donor=rtrim(ltrim(cl.donor))


 ---------------------------------------------------------------------------------------------
--Updating rC_Bios__Home_Email__c Column.
----------------------------------------------------------------------------------------------
update [Migration_METRO].dbo.[Contact_stage_Metro]
 set rC_Bios__Home_Email__c=   aa.phone
 from (SELECT rtrim(ltrim(DONOR)) donor,a.phone, PHTYPE, PHorder
from [METRO_UAT1].dbo.dpphone a 
WHERE PHTYPE = 'EMAI' and a.phorder = (SELECT MIN (b.phorder) from [METRO_UAT1].dbo.dpphone b 
WHERE b.PHTYPE = 'EMAI' and b.donor = a.donor  and rtrim(ltrim(DONOR)) not in
('137664','298411','395862','466167','494298','557131','632314'))) aa
inner join
[Migration_METRO].[dbo].[Contact_stage_Metro] cl
on aa.donor=rtrim(ltrim(cl.donor))


---updating rC_Bios__Preferred_Email__c

update  [Migration_METRO].dbo.[Contact_stage_Metro]
SET rC_Bios__Preferred_Email__c=(CASE
WHEN rC_Bios__Home_Email__c ='' then CAST('' as nvarchar(255))
Else 'HOME' 
END)
 ---------------------------------------------------------------------------------------------
--Updating rC_Bios__Other_Email__c Column.
----------------------------------------------------------------------------------------------
update [Migration_METRO].dbo.[Contact_stage_Metro]
 set rC_Bios__Other_Email__c=   aa.phone
 from (select  rtrim(ltrim(g.donor)) donor,g.phone,g.phorder,g.phtype
from (
SELECT DONOR,count(distinct PHorder) cnt_order from [METRO_UAT1].dbo.dpphone a 
WHERE PHTYPE = 'EMAI' 
group by Donor
having count(distinct Phorder) = 3) aa
join [METRO_UAT1].dbo.dpphone g
on g.donor = aa.donor
where g.PHTYPE = 'EMAI'
and  g.phorder = (select max(c.phorder) from [METRO_UAT1].dbo.dpphone c 
where c.donor = g.donor
and c.PHTYPE = 'EMAI')) aa
inner join
[Migration_METRO].[dbo].[Contact_stage_Metro] cl
on aa.donor=rtrim(ltrim(cl.donor))


 ---------------------------------------------------------------------------------------------
--Updating rC_Bios__Website_Url__c Column.
----------------------------------------------------------------------------------------------
 update [Migration_METRO].dbo.[Contact_stage_Metro]
 set rC_Bios__Website_Url__c=    aa.phone
 from (SELECT rtrim(ltrim(donor)) donor, PHONE, PHTYPE from [METRO_UAT1].dbo.DPPHONE where PHTYPE = 'site') aa
inner join
[Migration_METRO].[dbo].[Contact_stage_Metro] cl
on aa.donor=rtrim(ltrim(cl.donor))

 ---------------------------------------------------------------------------------------------
--Updating rC_Bios__Work_Email__c Column.
----------------------------------------------------------------------------------------------


 update [Migration_METRO].dbo.[Contact_stage_Metro]
 set rC_Bios__Work_Email__c=  bb.phone
 from (select aa.phone,donor from (select  rtrim(ltrim(g.donor)) donor,g.phone,g.phorder,g.phtype
from (
SELECT DONOR,count(distinct PHorder) cnt_order from [METRO_UAT1].dbo.dpphone a 
WHERE PHTYPE = 'EMAI' 
group by Donor
having count(distinct Phorder) = 3) aa
join [METRO_UAT1].dbo.dpphone g
on g.donor = aa.donor
where  g.PHTYPE = 'EMAI'
and g.phorder != (select min(c.phorder) from [METRO_UAT1].dbo.dpphone c 
where c.donor = g.donor
and c.PHTYPE = 'EMAI' )
and g.phorder != (select max(c.phorder) from [METRO_UAT1].dbo.dpphone c 
where c.donor = g.donor
and c.PHTYPE = 'EMAI')
union
select  g.donor,g.phone,g.phorder,g.phtype
from (
SELECT DONOR,count(distinct PHorder) cnt_order from [METRO_UAT1].dbo.dpphone a 
WHERE PHTYPE = 'EMAI' 
group by Donor
having count(distinct Phorder) = 2) aa
join [METRO_UAT1].dbo.dpphone g
on g.donor = aa.donor
where  g.PHTYPE = 'EMAI'
and g.phorder = (select max(c.phorder) from [METRO_UAT1].dbo.dpphone c 
where c.donor = g.donor
and c.PHTYPE = 'EMAI' )) aa) bb
inner join
[Migration_METRO].[dbo].[Contact_stage_Metro] cl
on bb.donor=rtrim(ltrim(cl.donor))

 ---------------------------------------------------------------------------------------------
--Updating rC_Bios__Work_Phone__c Column.-- 441486,466167
----------------------------------------------------------------------------------------------
update [Migration_METRO].dbo.[Contact_stage_Metro]
 set rC_Bios__Work_Phone__c= bb.phone
 from (SELECT rtrim(ltrim(donor)) donor,a.phone, PHTYPE, PHorder 
from [METRO_UAT1].dbo.dpphone a 
WHERE PHTYPE = 'WORK' and a.phorder = (SELECT MIN (b.phorder) from 
[METRO_UAT1].dbo.dpphone b WHERE b.PHTYPE = 'WORK' and b.donor = a.donor) ) bb
inner join
[Migration_METRO].[dbo].[Contact_stage_Metro] cl
on bb.donor=rtrim(ltrim(cl.donor))

 ---------------------------------------------------------------------------------------------
--rC_Bios__Secondary_Contact__c
----------------------------------------------------------------------------------------------
update [Migration_METRO].dbo.Account_stage_metro
set rC_Bios__Secondary_Contact__c= c.ID
from
[Migration_METRO].dbo.Account_stage_metro a
inner join
[Migration_METRO].dbo.Contact_stage_Metro c
on a.donor=c.donor
where right(c.External_Id__C,2)='-2'


-------------------------------------------------------------
---Updating rC_Bios__Preferred_Phone__c
Update a
SET a.rC_Bios__Preferred_Phone__c=xx.phtype
FROM
(SELECT rtrim(ltrim(donor)) donor,a.phone, PHTYPE, PHorder 
from [METRO_UAT1].dbo.dpphone a 
WHERE  PHTYPE Not In ('UNKN', 'site', 'emai', 'fax')  and a.phorder = (SELECT MIN (b.phorder) from 
[METRO_UAT1].dbo.dpphone b WHERE  b.PHTYPE Not In ('UNKN', 'site', 'emai', 'fax')  and b.donor = a.donor) )xx
inner join [Migration_METRO].[dbo].[Contact_stage_Metro] a
on a.donor=rtrim(ltrim(xx.donor))

-------------------------------------------------------------------------------------
----Updating rC_Bios__Preferred_Contact__c in Account

Update a
SET a.rC_Bios__Preferred_Contact__c=b.ID
FROM [Migration_METRO].dbo.[Account_stage_metro] a
Inner join
[Migration_METRO].dbo.[Contact_stage_Metro] b
On rtrim(ltrim(a.donor))=rtrim(ltrim(b.donor))
where right(b.External_Id__C,2)!='-2'
-----------------------------------------------------------------------------------------------




--- Insert/Update records
-- use [Migration_METRO]
-- Exec SF_BulkOps 'Insert:bulkapi,parallel,Batchsize(10000)', 'TSAC_MIGR', 'Contact_stage_Metro'


----check for errors
--select error,donor from [Migration_METRO].[dbo].[Contact_stage_Metro] where error NOT like '%Operation%'


---- Replicate Data
--use [Migration_Target_QA]
--exec SF_Refresh 'TSAC_MIGR', 'Contact','yes'


