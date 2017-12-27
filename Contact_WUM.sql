-- Drop staging tables
drop table [Migration_WUM].dbo.[Contact_Load]

--Replicate Data

--USe [Migration_Target_QA]
--exec SF_Replicate 'TSAC_MIGR', 'USER'
--exec SF_Replicate 'TSAC_MIGR', 'RecordType'



select  * 
INTO [Migration_WUM].dbo.[Contact_Load]
from 
 
(select
CAST('' as nchar(18))                                                          As ID,
CAST('' as nvarchar(255))                                                     As Error,

a.ID                                                                            As [AccountID],
dpadd.DOB                                                                         As Birthdate,
---'0053B000001AuXp'                                                              As [createdBy],-- HardCoded because not all Users got Migrated,
CASE dp.TYPE
WHEN 'IN' THEN (Select ID from [Migration_Target_QA].dbo.[RECORDTYPE] 
where NAME='Household' and [SobjectType]='Contact' )
ELSE (Select ID from [Migration_Target_QA].dbo.[RECORDTYPE] 
where NAME='Organizational' and [SobjectType]='Contact')
END                                                                           As RecordTypeId,
CAST('' AS nvarchar(max))                                                    As Description,
CASE dp.TELEMARK
WHEN '1' THEN 'FALSE'
ELSE 'TRUE'
END                                                                           As DoNotCall,
CAST('' AS nvarchar(max))                                                     As Email,
CASE dp.NOEMAIL
When '1' then 'TRUE'
Else 'FALSE'
End                                                                         As HasOptedOutOfEmail,
CAST('' AS nvarchar(max))                                                   As Fax,
CASE dp.telemark            
 When '1' then 'TRUE'
Else 'FALSE'
End                                                                         As HasOptedOutOfFax,
CAST('SEQ'+rtrim(ltrim(dp.seq))+'-WUM-DONOR'+rtrim(ltrim(dp.donor2)) 
As nvarchar(max))                                                              As External_ID__c,
CAST('' AS nvarchar(max))                                                      As HomePhone,
dpadd.[ADD]                                                                    As MailingStreet,
dpadd.ST                                                                        As MailingState,
dpadd.ZIP                                                                       As MailingPostalCode,
dpadd.CITY                                                                      As MailingCity,
CAST('' AS nvarchar(max))                                                        As Mobile,

rtrim(ltrim(DPADD.title))                                                                     As Salutation,
rtrim(ltrim(dpadd.fname))                                                                           As FIRSTNAME,
rtrim(ltrim(dpadd.lname))                                                                            As LASTNAME,
CAST('' AS nvarchar(max))                                                      As OtherPhone,
CAST('' AS nvarchar(max))                                                 As Phone,
CASE 
WHEN dp.DECDNR='1' THEN 'TRUE'

ELSE 'False'
END                                                                            As rC_Bios__Active__c,
Dp.ov_birth                                                               As Birthday_Overlay__c,
CASE
WHEN LEFT(CONVERT(VARCHAR, dpadd.DOB, 120),4) < 1900 THEN ''
ELSE   LEFT(CONVERT(VARCHAR, dpadd.DOB, 120),4)
END                                                                             As rC_Bios__Birth_Year__c,

 CASE
 WHEN LEFT(CONVERT(VARCHAR, dpadd.DOB, 120),4) < 1900 THEN ''
ELSE   RIGHT(LEFT(CONVERT(VARCHAR, dpadd.DOB, 120),10),2)
END                                                                     As rC_Bios__Birth_Day__c,

 CASE
 WHEN LEFT(CONVERT(VARCHAR, dpadd.DOB, 120),4) < 1900 THEN ''
ELSE   SUBSTRING(LEFT(CONVERT(VARCHAR, dpadd.DOB, 120),10),6,2)
END                                                              As rC_Bios__Birth_Month__c,
CAST('' AS nvarchar(max))                                         As rC_Bios__Deceased__c,
CASE 
WHEN ltrim(rtrim(dp.DECEASED)) !='/  /' THEN RIGHT(CONVERT(VARCHAR, dp.DECEASED, 120),4)
END                                                                             As rC_Bios__Deceased_Year__c,
CASE 
WHEN ltrim(rtrim(dp.DECEASED)) !='/  /' THEN substring(ltrim(rtrim(dp.DECEASED)),4,2)
END                                                                             As rC_Bios__Deceased_Day__c,
CASE 
WHEN ltrim(rtrim(dp.DECEASED)) !='/  /' THEN LEFT(CONVERT(VARCHAR, dp.DECEASED, 120),2)
END                                                                             As rC_Bios__Deceased_Month__c,
dp.TELEMARK
                                                                        As rC_Bios__Home_Do_Not_Call__c,
CAST('' AS nvarchar(max))                                                       As rC_Bios__Home_Email__c,
CASE dp.TELEMARK
WHEN '0' THEN 'False'
ELSE 'True'
END                                                                             As rC_Bios__Home_Email_Opt_Out__c,
CASE dp.TELEMARK
WHEN '0' THEN 'False'
ELSE 'True'
END                                                                             As rC_Bios__Mobile_Do_Not_Call__c,
CASE dp.TELEMARK
WHEN '0' THEN 'False'
ELSE 'True'
END                                                                             As rC_Bios__Other_Do_Not_Call__c,
CAST('' AS nvarchar(max))                                                       As rC_Bios__Other_Email__c,

'TRUE'                                                                      AS rC_Bios__Preferred_Contact__c,
'HOME'                                                                        As rC_Bios__Preferred_Email__c,
CAST('' AS nvarchar(max))                                                     As rC_Bios__Preferred_Phone__c,
'FALSE'                                                                          As rC_Bios__Secondary_Contact__c,
rtrim(ltrim(SUFF))                                                           AS rC_Bios__Suffix__c,
CAST('' AS nvarchar(max))                                                   As rC_Bios__Website_Url__c,
CASE dp.TELEMARK
WHEN '1' THEN 'True'
ELSE 'False'
END                                                                             As rC_Bios__Work_Do_Not_Call__c,
CASE dp.noemail
WHEN '0' THEN 'False'
ELSE 'True'
END                                                                             As rC_Bios__Work_Email_Opt_Out__c,
rtrim(ltrim(dpadd.donor))                                                       As donor,
CAST('' AS nvarchar(max))                                                       AS Also_Known_as__c,
CAST('' AS nvarchar(max))                                                       As Also_Known_As2__c,
CAST('' AS nvarchar(max))                                                       As MobilePhone,
CAST('' AS nvarchar(max))                                                       As rC_Bios__Work_Email__c
FROM 
[WUM_10K(QA)].dbo.[DPADD] dpadd
left join
[WUM_10K(QA)].dbo.[DP] dp
on 
rtrim(ltrim(dpadd.donor)) = rtrim(ltrim(dp.Donor2))
LEFT JOIN
[Migration_WUM].dbo.Account_Load_WUM a
on rtrim(ltrim(a.donor))=rtrim(ltrim(dpadd.donor))
where
dpadd.priority='1' and dpadd.Donor!='' AND dpadd.lname!='' and dpadd.secln=''
UNION ALL
select
CAST('' as nchar(18))                                                          As ID,
CAST('' as nvarchar(255))                                                     As Error,

a.ID                                                                            As [AccountID],
dpadd.DOB                                                                         As Birthdate,
----'0053B000001AuXp'                                                              As [createdBy],-- HardCoded because not all Users got Migrated,
CASE dp.TYPE
WHEN 'IN' THEN (Select ID from [Migration_Target_QA].dbo.[RECORDTYPE] 
where NAME='Household' and [SobjectType]='Contact' )
ELSE (Select ID from [Migration_Target_QA].dbo.[RECORDTYPE] 
where NAME='Organizational' and [SobjectType]='Contact')
END                                                                           As RecordTypeId,
CAST('' AS nvarchar(max))                                                    As Description,
CASE dp.TELEMARK
WHEN '1' THEN 'FALSE'
ELSE 'TRUE'
END                                                                           As DoNotCall,
CAST('' AS nvarchar(max))                                                     As Email,
CASE dp.NOEMAIL
When '1' then 'TRUE'
Else 'FALSE'
End                                                                         As HasOptedOutOfEmail,
CAST('' AS nvarchar(max))                                                   As Fax,
CASE dp.telemark            
 When '1' then 'TRUE'
Else 'FALSE'
End                                                                         As HasOptedOutOfFax,
CAST('SEQ'+rtrim(ltrim(dp.seq))+'-WUM-DONOR'+rtrim(ltrim(dp.donor2)) 
As nvarchar(max))                                                              As External_ID__c,
CAST('' AS nvarchar(max))                                                      As HomePhone,
dpadd.[ADD]                                                                    As MailingStreet,
dpadd.ST                                                                        As MailingState,
dpadd.ZIP                                                                       As MailingPostalCode,
dpadd.CITY                                                                      As MailingCity,
CAST('' AS nvarchar(max))                                                        As Mobile,

rtrim(ltrim(DPADD.title))                                                                     As Salutation,
rtrim(ltrim(dpadd.fname))                                                                           As FIRSTNAME,
rtrim(ltrim(dpadd.lname))                                                                            As LASTNAME,
CAST('' AS nvarchar(max))                                                      As OtherPhone,
CAST('' AS nvarchar(max))                                                 As Phone,
CASE 
WHEN dp.DECDNR='1' THEN 'TRUE'

ELSE 'False'
END                                                                            As rC_Bios__Active__c,
Dp.ov_birth                                                               As Birthday_Overlay__c,
CASE
WHEN LEFT(CONVERT(VARCHAR, dpadd.DOB, 120),4) < 1900 THEN ''
ELSE   LEFT(CONVERT(VARCHAR, dpadd.DOB, 120),4)
END                                                                             As rC_Bios__Birth_Year__c,

 CASE
 WHEN LEFT(CONVERT(VARCHAR, dpadd.DOB, 120),4) < 1900 THEN ''
ELSE   RIGHT(LEFT(CONVERT(VARCHAR, dpadd.DOB, 120),10),2)
END                                                                     As rC_Bios__Birth_Day__c,

 CASE
 WHEN LEFT(CONVERT(VARCHAR, dpadd.DOB, 120),4) < 1900 THEN ''
ELSE   SUBSTRING(LEFT(CONVERT(VARCHAR, dpadd.DOB, 120),10),6,2)
END                                                              As rC_Bios__Birth_Month__c,
CAST('' AS nvarchar(max))                                         As rC_Bios__Deceased__c,
CASE 
WHEN ltrim(rtrim(dp.DECEASED)) !='/  /' THEN RIGHT(CONVERT(VARCHAR, dp.DECEASED, 120),4)
END                                                                             As rC_Bios__Deceased_Year__c,
CASE 
WHEN ltrim(rtrim(dp.DECEASED)) !='/  /' THEN substring(ltrim(rtrim(dp.DECEASED)),4,2)
END                                                                             As rC_Bios__Deceased_Day__c,
CASE 
WHEN ltrim(rtrim(dp.DECEASED)) !='/  /' THEN LEFT(CONVERT(VARCHAR, dp.DECEASED, 120),2)
END                                                                             As rC_Bios__Deceased_Month__c,
dp.telemark
                                                                            As rC_Bios__Home_Do_Not_Call__c,
CAST('' AS nvarchar(max))                                                       As rC_Bios__Home_Email__c,
CASE dp.TELEMARK
WHEN '0' THEN 'False'
ELSE 'True'
END                                                                             As rC_Bios__Home_Email_Opt_Out__c,
CASE dp.TELEMARK
WHEN '0' THEN 'False'
ELSE 'True'
END                                                                             As rC_Bios__Mobile_Do_Not_Call__c,
CASE dp.TELEMARK
WHEN '0' THEN 'False'
ELSE 'True'
END                                                                             As rC_Bios__Other_Do_Not_Call__c,
CAST('' AS nvarchar(max))                                                       As rC_Bios__Other_Email__c,

'TRUE'                                                                      AS rC_Bios__Preferred_Contact__c,
'HOME'                                                                        As rC_Bios__Preferred_Email__c,
CAST('' AS nvarchar(max))                                                     As rC_Bios__Preferred_Phone__c,
'FALSE'                                                                          As rC_Bios__Secondary_Contact__c,
rtrim(ltrim(SUFF))                                                           AS rC_Bios__Suffix__c,
CAST('' AS nvarchar(max))                                                   As rC_Bios__Website_Url__c,
CASE dp.TELEMARK
WHEN '1' THEN 'True'
ELSE 'False'
END                                                                             As rC_Bios__Work_Do_Not_Call__c,
CASE dp.noemail
WHEN '0' THEN 'False'
ELSE 'True'
END                                                                             As rC_Bios__Work_Email_Opt_Out__c,
rtrim(ltrim(dpadd.donor))                                                       As donor,
CAST('' AS nvarchar(max))                                                       AS Also_Known_as__c,
CAST('' AS nvarchar(max))                                                       As Also_Known_As2__c,
CAST('' AS nvarchar(max))                                                       As MobilePhone,
CAST('' AS nvarchar(max))                                                       As rC_Bios__Work_Email__c
FROM 
[WUM_10K(QA)].dbo.[DPADD] dpadd
left join
[WUM_10K(QA)].dbo.[DP] dp
on 
rtrim(ltrim(dpadd.donor)) = rtrim(ltrim(dp.Donor2))
LEFT JOIN
[Migration_WUM].dbo.Account_Load_WUM a
on rtrim(ltrim(a.donor))=rtrim(ltrim(dpadd.donor))
where
dpadd.priority='1' and dpadd.Donor!='' AND dpadd.lname!='' and dpadd.secln!=''
UNION ALL
select
CAST('' as nchar(18))                                                          As ID,
CAST('' as nvarchar(255))                                                     As Error,

a.ID                                                                            As [AccountID],
dpadd.DOB                                                                         As Birthdate,
----'0053B000001AuXp'                                                              As [createdBy],-- HardCoded because not all Users got Migrated,
CASE dp.TYPE
WHEN 'IN' THEN (Select ID from [Migration_Target_QA].dbo.[RECORDTYPE] 
where NAME='Household' and [SobjectType]='Contact' )
ELSE (Select ID from [Migration_Target_QA].dbo.[RECORDTYPE] 
where NAME='Organizational' and [SobjectType]='Contact')
END                                                                           As RecordTypeId,
CAST('' AS nvarchar(max))                                                    As Description,
CASE dp.TELEMARK
WHEN '1' THEN 'FALSE'
ELSE 'TRUE'
END                                                                           As DoNotCall,
CAST('' AS nvarchar(max))                                                     As Email,
CASE dp.NOEMAIL
When '1' then 'TRUE'
Else 'FALSE'
End                                                                         As HasOptedOutOfEmail,
CAST('' AS nvarchar(max))                                                   As Fax,
CASE dp.telemark            
 When '1' then 'TRUE'
Else 'FALSE'
End                                                                         As HasOptedOutOfFax,
CAST('SEQ'+rtrim(ltrim(dp.seq))+'-WUM-DONOR'+rtrim(ltrim(dp.donor2)) +'-3'
As nvarchar(max))                                                              As External_ID__c,
CAST('' AS nvarchar(max))                                                      As HomePhone,
dpadd.[ADD]                                                                    As MailingStreet,
dpadd.ST                                                                        As MailingState,
dpadd.ZIP                                                                       As MailingPostalCode,
dpadd.CITY                                                                      As MailingCity,
CAST('' AS nvarchar(max))                                                        As Mobile,

rtrim(ltrim(DPADD.title))                                                                     As Salutation,
''                                                                           As FIRSTNAME,
rtrim(ltrim(dpadd.secln))                                                                            As LASTNAME,
CAST('' AS nvarchar(max))                                                      As OtherPhone,
CAST('' AS nvarchar(max))                                                 As Phone,
CASE 
WHEN dp.DECDNR='1' THEN 'TRUE'

ELSE 'False'
END                                                                            As rC_Bios__Active__c,
Dp.ov_birth                                                               As Birthday_Overlay__c,
CASE
WHEN LEFT(CONVERT(VARCHAR, dpadd.DOB, 120),4) < 1900 THEN ''
ELSE   LEFT(CONVERT(VARCHAR, dpadd.DOB, 120),4)
END                                                                             As rC_Bios__Birth_Year__c,

 CASE
 WHEN LEFT(CONVERT(VARCHAR, dpadd.DOB, 120),4) < 1900 THEN ''
ELSE   RIGHT(LEFT(CONVERT(VARCHAR, dpadd.DOB, 120),10),2)
END                                                                     As rC_Bios__Birth_Day__c,

 CASE
 WHEN LEFT(CONVERT(VARCHAR, dpadd.DOB, 120),4) < 1900 THEN ''
ELSE   SUBSTRING(LEFT(CONVERT(VARCHAR, dpadd.DOB, 120),10),6,2)
END                                                              As rC_Bios__Birth_Month__c,
CAST('' AS nvarchar(max))                                         As rC_Bios__Deceased__c,
CASE 
WHEN ltrim(rtrim(dp.DECEASED)) !='/  /' THEN RIGHT(CONVERT(VARCHAR, dp.DECEASED, 120),4)
END                                                                             As rC_Bios__Deceased_Year__c,
CASE 
WHEN ltrim(rtrim(dp.DECEASED)) !='/  /' THEN substring(ltrim(rtrim(dp.DECEASED)),4,2)
END                                                                             As rC_Bios__Deceased_Day__c,
CASE 
WHEN ltrim(rtrim(dp.DECEASED)) !='/  /' THEN LEFT(CONVERT(VARCHAR, dp.DECEASED, 120),2)
END                                                                             As rC_Bios__Deceased_Month__c,
dp.TELEMARK
                                                                          As rC_Bios__Home_Do_Not_Call__c,
CAST('' AS nvarchar(max))                                                       As rC_Bios__Home_Email__c,
CASE dp.TELEMARK
WHEN '0' THEN 'False'
ELSE 'True'
END                                                                             As rC_Bios__Home_Email_Opt_Out__c,
CASE dp.TELEMARK
WHEN '0' THEN 'False'
ELSE 'True'
END                                                                             As rC_Bios__Mobile_Do_Not_Call__c,
CASE dp.TELEMARK
WHEN '0' THEN 'False'
ELSE 'True'
END                                                                             As rC_Bios__Other_Do_Not_Call__c,
CAST('' AS nvarchar(max))                                                       As rC_Bios__Other_Email__c,

'FALSE'                                                                      AS rC_Bios__Preferred_Contact__c,
'HOME'                                                                        As rC_Bios__Preferred_Email__c,
CAST('' AS nvarchar(max))                                                     As rC_Bios__Preferred_Phone__c,
'TRUE'                                                                          As rC_Bios__Secondary_Contact__c,
rtrim(ltrim(SUFF))                                                           AS rC_Bios__Suffix__c,
CAST('' AS nvarchar(max))                                                   As rC_Bios__Website_Url__c,
CASE dp.TELEMARK
WHEN '1' THEN 'True'
ELSE 'False'
END                                                                             As rC_Bios__Work_Do_Not_Call__c,
CASE dp.noemail
WHEN '0' THEN 'False'
ELSE 'True'
END                                                                             As rC_Bios__Work_Email_Opt_Out__c,
rtrim(ltrim(dpadd.donor))                                                       As donor,
CAST('' AS nvarchar(max))                                                       AS Also_Known_as__c,
CAST('' AS nvarchar(max))                                                       As Also_Known_As2__c,
CAST('' AS nvarchar(max))                                                       As MobilePhone,
CAST('' AS nvarchar(max))                                                       As rC_Bios__Work_Email__c
FROM 
[WUM_10K(QA)].dbo.[DPADD] dpadd
left join
[WUM_10K(QA)].dbo.[DP] dp
on 
rtrim(ltrim(dpadd.donor)) = rtrim(ltrim(dp.Donor2))
LEFT JOIN
[Migration_WUM].dbo.Account_Load_WUM a
on rtrim(ltrim(a.donor))=rtrim(ltrim(dpadd.donor))
where
dpadd.priority='1' and dpadd.Donor!='' AND dpadd.lname!='' and dpadd.secln!=''
UNION ALL
select
CAST('' as nchar(18))                                                          As ID,
CAST('' as nvarchar(255))                                                     As Error,

a.ID                                                                            As [AccountID],
dpadd.DOB                                                                         As Birthdate,
-----'0053B000001AuXp'                                                              As [createdBy],-- HardCoded because not all Users got Migrated,
CASE dp.TYPE
WHEN 'IN' THEN (Select ID from [Migration_Target_QA].dbo.[RECORDTYPE] 
where NAME='Household' and [SobjectType]='Contact' )
ELSE (Select ID from [Migration_Target_QA].dbo.[RECORDTYPE] 
where NAME='Organizational' and [SobjectType]='Contact')
END                                                                           As RecordTypeId,
CAST('' AS nvarchar(max))                                                    As Description,
CASE dp.TELEMARK
WHEN '1' THEN 'FALSE'
ELSE 'TRUE'
END                                                                           As DoNotCall,
CAST('' AS nvarchar(max))                                                     As Email,
CASE dp.NOEMAIL
When '1' then 'TRUE'
Else 'FALSE'
End                                                                         As HasOptedOutOfEmail,
CAST('' AS nvarchar(max))                                                   As Fax,
CASE dp.telemark            
 When '1' then 'TRUE'
Else 'FALSE'
End                                                                         As HasOptedOutOfFax,
CAST('SEQ'+rtrim(ltrim(dp.seq))+'-WUM-DONOR'+rtrim(ltrim(dp.donor2)) +'-2'
As nvarchar(max))                                                              As External_ID__c,
CAST('' AS nvarchar(max))                                                      As HomePhone,
dpadd.[ADD]                                                                    As MailingStreet,
dpadd.ST                                                                        As MailingState,
dpadd.ZIP                                                                       As MailingPostalCode,
dpadd.CITY                                                                      As MailingCity,
CAST('' AS nvarchar(max))                                                        As Mobile,

rtrim(ltrim(DPADD.title))                                                             As Salutation,
rtrim(ltrim(dpadd.fname))                                                                         As FIRSTNAME,
rtrim(ltrim(dpadd.lname))                                                                            As LASTNAME,
CAST('' AS nvarchar(max))                                                      As OtherPhone,
CAST('' AS nvarchar(max))                                                 As Phone,
CASE 
WHEN dp.DECDNR='1' THEN 'TRUE'

ELSE 'False'
END                                                                            As rC_Bios__Active__c,
Dp.ov_birth                                                               As Birthday_Overlay__c,
CASE
WHEN LEFT(CONVERT(VARCHAR, dpadd.DOB, 120),4) < 1900 THEN ''
ELSE   LEFT(CONVERT(VARCHAR, dpadd.DOB, 120),4)
END                                                                             As rC_Bios__Birth_Year__c,

 CASE
 WHEN LEFT(CONVERT(VARCHAR, dpadd.DOB, 120),4) < 1900 THEN ''
ELSE   RIGHT(LEFT(CONVERT(VARCHAR, dpadd.DOB, 120),10),2)
END                                                                     As rC_Bios__Birth_Day__c,

 CASE
 WHEN LEFT(CONVERT(VARCHAR, dpadd.DOB, 120),4) < 1900 THEN ''
ELSE   SUBSTRING(LEFT(CONVERT(VARCHAR, dpadd.DOB, 120),10),6,2)
END                                                              As rC_Bios__Birth_Month__c,
CAST('' AS nvarchar(max))                                         As rC_Bios__Deceased__c,
CASE 
WHEN ltrim(rtrim(dp.DECEASED)) !='/  /' THEN RIGHT(CONVERT(VARCHAR, dp.DECEASED, 120),4)
END                                                                             As rC_Bios__Deceased_Year__c,
CASE 
WHEN ltrim(rtrim(dp.DECEASED)) !='/  /' THEN substring(ltrim(rtrim(dp.DECEASED)),4,2)
END                                                                             As rC_Bios__Deceased_Day__c,
CASE 
WHEN ltrim(rtrim(dp.DECEASED)) !='/  /' THEN LEFT(CONVERT(VARCHAR, dp.DECEASED, 120),2)
END                                                                             As rC_Bios__Deceased_Month__c,
dp.TELEMARK
                                                                            As rC_Bios__Home_Do_Not_Call__c,
CAST('' AS nvarchar(max))                                                       As rC_Bios__Home_Email__c,
CASE dp.TELEMARK
WHEN '0' THEN 'False'
ELSE 'True'
END                                                                             As rC_Bios__Home_Email_Opt_Out__c,
CASE dp.TELEMARK
WHEN '0' THEN 'False'
ELSE 'True'
END                                                                             As rC_Bios__Mobile_Do_Not_Call__c,
CASE dp.TELEMARK
WHEN '0' THEN 'False'
ELSE 'True'
END                                                                             As rC_Bios__Other_Do_Not_Call__c,
CAST('' AS nvarchar(max))                                                       As rC_Bios__Other_Email__c,

'FALSE'                                                                      AS rC_Bios__Preferred_Contact__c,
'HOME'                                                                        As rC_Bios__Preferred_Email__c,
CAST('' AS nvarchar(max))                                                     As rC_Bios__Preferred_Phone__c,
'FALSE'                                                                          As rC_Bios__Secondary_Contact__c,
rtrim(ltrim(SUFF))                                                           AS rC_Bios__Suffix__c,
CAST('' AS nvarchar(max))                                                   As rC_Bios__Website_Url__c,
CASE dp.TELEMARK
WHEN '1' THEN 'True'
ELSE 'False'
END                                                                             As rC_Bios__Work_Do_Not_Call__c,
CASE dp.noemail
WHEN '0' THEN 'False'
ELSE 'True'
END                                                                             As rC_Bios__Work_Email_Opt_Out__c,
rtrim(ltrim(dpadd.donor))                                                       As donor,
CAST('' AS nvarchar(max))                                                       AS Also_Known_as__c,
CAST('' AS nvarchar(max))                                                       As Also_Known_As2__c,
CAST('' AS nvarchar(max))                                                       As MobilePhone,
CAST('' AS nvarchar(max))                                                       As rC_Bios__Work_Email__c
FROM 
[WUM_UAT1].dbo.[DPADD] dpadd
left join
[WUM_UAT1].dbo.[DP] dp
on 
rtrim(ltrim(dpadd.donor)) = rtrim(ltrim(dp.Donor2))
LEFT JOIN
[Migration_WUM].dbo.Account_Load_WUM a
on rtrim(ltrim(a.donor))=rtrim(ltrim(dpadd.donor))
where priority=2 and addtype='spse' ) xx
order By accountId


---------------------------------------------------------------------------------------------
--Updating Email Column.
---------------------------------------------------------------------------------------------
update [Migration_WUM].dbo.[Contact_Load]
SET Email=aa.PHONE FROM (SELECT rtrim(ltrim(donor)) as donor,a.phone, PHTYPE, PHorder from 
[WUM_UAT1].dbo.dpphone a WHERE PHTYPE = 'EMAI' 
 and a.phorder = (SELECT MIN (b.phorder) from [WUM_UAT1].dbo.dpphone b WHERE b.PHTYPE = 'EMAI' and b.donor = a.donor)
 and rtrim(ltrim(donor)) not in ('466167','137664',' 298411','395862','494298','557131','632314')) aa
LEFT join
 [Migration_WUM].dbo.[Contact_Load] cl
 on
 aa.donor=cl.donor
 ---------------------------------------------------------------------------------------------
--Updating Email Column.--if PHTYPE = FAX, then "PHONE"
----------------------------------------------------------------------------------------------
update [Migration_WUM].dbo.Contact_Load
set FAX= aa.PHONE from 
(SELECT rtrim(ltrim(a.phone)) PHONE,rtrim(ltrim(a.donor)) donor from [WUM_UAT1].dbo.dpphone a WHERE PHTYPE='fax' and a.phorder = 
(SELECT MIN (b.phorder) from [WUM_UAT1].dbo.dpphone b WHERE b.PHTYPE ='fax' and b.donor = a.donor )) aa

inner join
[Migration_WUM].[dbo].[Contact_Load] b
on aa.donor=rtrim(ltrim(b.donor))
 ---------------------------------------------------------------------------------------------
--Updating HomePhone Column.
----------------------------------------------------------------------------------------------
 update [Migration_WUM].dbo.[Contact_Load]
 set HomePhone= aa.phone
 from
 (SELECT rtrim(ltrim(donor)) As Donor,phone, PHTYPE, PHorder 
from [WUM_UAT1].dbo.dpphone a WHERE PHTYPE not in ('EMAI','site','fax','unkn', 'work') and
 a.phorder = (SELECT MIN (b.phorder) from [WUM_UAT1].dbo.dpphone b WHERE b.PHTYPE not in ('EMAI','site','fax','unkn', 'WORK') 
 and b.donor = a.donor and rtrim(ltrim(donor)) !='233267')) aa
inner join
[Migration_WUM].[dbo].[Contact_Load] cl
on aa.donor=rtrim(ltrim(cl.donor))
 ---------------------------------------------------------------------------------------------
--Updating MobilePhone Column.
----------------------------------------------------------------------------------------------
 update [Migration_WUM].dbo.[Contact_Load]
 set MobilePhone= aa.phone
 from
(SELECT rtrim(ltrim(DONOR)) donor,a.phone, PHTYPE, PHorder from [WUM_UAT1].dbo.dpphone a WHERE PHTYPE = 'cell' 
and a.phorder = (SELECT MIN (b.phorder) from [WUM_UAT1].dbo.dpphone b WHERE b.PHTYPE = 'cell' and b.donor = a.donor)) aa

inner join
[Migration_WUM].[dbo].[Contact_Load] cl
on aa.donor=rtrim(ltrim(cl.donor))


 ---------------------------------------------------------------------------------------------
--Updating OtherPhone Column.
----------------------------------------------------------------------------------------------
update [Migration_WUM].dbo.[Contact_Load]
 set OtherPhone=  aa.phone
 from
(SELECT rtrim(ltrim(DONOR)) donor,a.phone, PHTYPE, PHorder from [WUM_UAT1].dbo.dpphone a WHERE PHTYPE = 'UNKN' and a.phorder = 
(SELECT MIN (b.phorder) from [WUM_UAT1].dbo.dpphone b WHERE b.PHTYPE = 'UNKN' and b.donor = a.donor)) aa

inner join
[Migration_WUM].[dbo].[Contact_Load] cl
on aa.donor=rtrim(ltrim(cl.donor))


 ---------------------------------------------------------------------------------------------
--Updating Phone Column.
----------------------------------------------------------------------------------------------


 update [Migration_WUM].dbo.[Contact_Load]
 set Phone=  aa.phone
 from (SELECT rtrim(ltrim(DONOR)) donor,a.phone, PHTYPE, PHorder from [WUM_UAT1].dbo.dpphone a WHERE PHTYPE Not In ('UNKN', 'site', 'emai', 'fax') and a.phorder = (SELECT MIN (b.phorder) from [WUM_UAT1].dbo.dpphone b 
WHERE b.PHTYPE Not In ('UNKN', 'site', 'emai', 'fax') and 
b.donor = a.donor and rtrim(ltrim(DONOR)) not in ('268165','379648','466167'))) aa

inner join
[Migration_WUM].[dbo].[Contact_Load] cl
on aa.donor=rtrim(ltrim(cl.donor))


 ---------------------------------------------------------------------------------------------
--Updating rC_Bios__Home_Email__c Column.
----------------------------------------------------------------------------------------------
update [Migration_WUM].dbo.[Contact_Load]
 set rC_Bios__Home_Email__c=    aa.phone
 from (SELECT rtrim(ltrim(DONOR)) donor,a.phone, PHTYPE, PHorder
from[WUM_UAT1].dbo.dpphone a 
WHERE PHTYPE = 'EMAI' and a.phorder = (SELECT MIN (b.phorder) from [WUM_UAT1].dbo.dpphone b 
WHERE b.PHTYPE = 'EMAI' and b.donor = a.donor)) aa
inner join
[Migration_WUM].[dbo].[Contact_Load] cl
on aa.donor=rtrim(ltrim(cl.donor))
 ---------------------------------------------------------------------------------------------
--Updating rC_Bios__Other_Email__c Column.
----------------------------------------------------------------------------------------------
update [Migration_WUM].dbo.[Contact_Load]
 set rC_Bios__Other_Email__c=   aa.phone
 from (select  rtrim(ltrim(g.donor)) donor,g.phone,g.phorder,g.phtype
from (
SELECT DONOR,count(distinct PHorder) cnt_order from [WUM_UAT1].dbo.dpphone a 
WHERE PHTYPE = 'EMAI' 
group by Donor
having count(distinct Phorder) = 3) aa
join [WUM_UAT1].dbo.dpphone g
on g.donor = aa.donor
where g.PHTYPE = 'EMAI'
and  g.phorder = (select max(c.phorder) from [WUM_UAT1].dbo.dpphone c 
where c.donor = g.donor
and c.PHTYPE = 'EMAI')) aa
inner join
[Migration_WUM].[dbo].[Contact_Load] cl
on aa.donor=rtrim(ltrim(cl.donor))


 ---------------------------------------------------------------------------------------------
--Updating rC_Bios__Website_Url__c Column.
----------------------------------------------------------------------------------------------
 update [Migration_WUM].dbo.[Contact_Load]
 set rC_Bios__Website_Url__c=    aa.phone
 from (SELECT rtrim(ltrim(donor)) donor, PHONE, PHTYPE from[WUM_UAT1].dbo.DPPHONE where PHTYPE = 'site') aa
inner join
[Migration_WUM].[dbo].[Contact_Load] cl
on aa.donor=rtrim(ltrim(cl.donor))

 ---------------------------------------------------------------------------------------------
--Updating rC_Bios__Work_Email__c Column.
----------------------------------------------------------------------------------------------


 update [Migration_WUM].dbo.[Contact_Load]
 set rC_Bios__Work_Email__c=  bb.phone
 from (select aa.phone,donor from (select  rtrim(ltrim(g.donor)) donor,g.phone,g.phorder,g.phtype
from (
SELECT DONOR,count(distinct PHorder) cnt_order from [WUM_UAT1].dbo.dpphone a 
WHERE PHTYPE = 'EMAI' 
group by Donor
having count(distinct Phorder) = 3) aa
join [WUM_UAT1].dbo.dpphone g
on g.donor = aa.donor
where  g.PHTYPE = 'EMAI'
and g.phorder != (select min(c.phorder) from [WUM_UAT1].dbo.dpphone c 
where c.donor = g.donor
and c.PHTYPE = 'EMAI' )
and g.phorder != (select max(c.phorder) from [WUM_UAT1].dbo.dpphone c 
where c.donor = g.donor
and c.PHTYPE = 'EMAI')
union
select  g.donor,g.phone,g.phorder,g.phtype
from (
SELECT DONOR,count(distinct PHorder) cnt_order from [WUM_UAT1].dbo.dpphone a 
WHERE PHTYPE = 'EMAI' 
group by Donor
having count(distinct Phorder) = 2) aa
join [WUM_UAT1].dbo.dpphone g
on g.donor = aa.donor
where  g.PHTYPE = 'EMAI'
and g.phorder = (select max(c.phorder) from [WUM_UAT1].dbo.dpphone c 
where c.donor = g.donor
and c.PHTYPE = 'EMAI' )) aa) bb
inner join
[Migration_WUM].[dbo].[Contact_Load] cl
on bb.donor=rtrim(ltrim(cl.donor))



 ---------------------------------------------------------------------------------------------
--Updating Also_Known_As__c Column.
----------------------------------------------------------------------------------------------

update [Migration_WUM].dbo.[Contact_Load]
 set Also_Known_as__c=bb.Also_Known_as__c
 from ( Select  rtrim(ltrim(donor)) donor, (rtrim(ltrim(fname))+rtrim(ltrim(lname))) As Also_Known_as__c from [WUM_UAT1].dbo.dpadd where priority = 2 and addtype = 'AKAN' and donor 
in (select donor from [WUM_UAT1].dbo.dpadd where priority = 2 and addtype = 'AKAN' group by donor having count(*) = 1)) bb
inner join
[Migration_WUM].[dbo].[Contact_Load] cl
on bb.donor=rtrim(ltrim(cl.donor))
where (right(cl.external_ID__C,2)!='-2' and right(cl.external_ID__C,2)!='-3')

 ---------------------------------------------------------------------------------------------
--Updating Also_Known_As2__c Column.
----------------------------------------------------------------------------------------------
update [Migration_WUM].dbo.[Contact_Load]
 set Also_Known_As2__c=bb.Also_Known_As2__c
 from ( Select  rtrim(ltrim(donor)) donor, (rtrim(ltrim(fname))+rtrim(ltrim(lname))) As Also_Known_As2__c from [WUM_UAT1].dbo.dpadd where priority = 2 and addtype = 'AKAN' and donor 
in (select donor from [WUM_UAT1].dbo.dpadd where priority = 2 and addtype = 'AKAN' group by donor having count(*) = 2)) bb
inner join
[Migration_WUM].[dbo].[Contact_Load] cl
on bb.donor=rtrim(ltrim(cl.donor))
where (right(cl.external_ID__C,2)!='-2' and right(cl.external_ID__C,2)!='-3')



------------------------
---Updating rC_Bios__Preferred_Phone__c
Update a
SET a.rC_Bios__Preferred_Phone__c=xx.phtype
FROM
(SELECT rtrim(ltrim(donor)) donor,a.phone, PHTYPE, PHorder 
from [WUM_UAT1].dbo.dpphone a 
WHERE  PHTYPE Not In ('UNKN', 'site', 'emai', 'fax')  and a.phorder = (SELECT MIN (b.phorder) from 
[WUM_UAT1].dbo.dpphone b WHERE  b.PHTYPE Not In ('UNKN', 'site', 'emai', 'fax')  and b.donor = a.donor) )xx
inner join [Migration_WUM].[dbo].[Contact_Load] a
on rtrim(ltrim(a.donor))=rtrim(ltrim(xx.donor))


-----------

----Updating rC_Bios__Preferred_Contact__c

Update a
SET a.rC_Bios__Preferred_Contact__c=b.ID
FROM [Migration_WUM].dbo.[Account_Load_WUM] a
Inner join
[Migration_WUM].dbo.[Contact_Load] b
On rtrim(ltrim(a.donor))=rtrim(ltrim(b.donor))
where right(b.External_Id__C,2)!='-2' and right(b.External_Id__C,2)!='-3'


-----------

----Updating rC_Bios__Secondary_Contact__c

Update a
SET a.rC_Bios__Secondary_Contact__c=b.ID
FROM [Migration_WUM].dbo.[Account_Load_WUM] a
Inner join
[Migration_WUM].dbo.[Contact_Load] b
On rtrim(ltrim(a.donor))=rtrim(ltrim(b.donor))
where right(b.External_Id__C,2)='-2' or right(b.External_Id__C,2)='-3'
-------------------------------


-----update rC_Bios__Deceased__c

Update x
SET x.rC_Bios__Deceased__c=CASE
WHEN  rtrim(ltrim(a.DECEASED))='1' THEN 'TRUE'
WHEN  rtrim(ltrim(a.DECEASED))='0' and rtrim(ltrim(p.Reason))='DE' THEN 'TRUE'
Else 'False'
END
FROM [Migration_WUM].dbo.[Contact_Load] x
Inner join
[WUM_UAT1].dbo.dp p
On rtrim(ltrim(p.donor2))=x.donor
inner join[WUM_UAT1].dbo.dpadd a
On rtrim(ltrim(p.donor2))=rtrim(ltrim(a.donor))





----update rC_Bios__Active__c

 Update x
SET x.rC_Bios__Active__c=CASE
WHEN  rtrim(ltrim(a.DECEASED))='1' THEN 'FALSE'
WHEN  rtrim(ltrim(a.DECEASED))='0' and rtrim(ltrim(p.Reason))='DE' THEN 'FALSE'
Else 'TRUE'
END
FROM [Migration_WUM].dbo.[Contact_Load] x
Inner join
[WUM_UAT1].dbo.dp p
On rtrim(ltrim(p.donor2))=x.donor
inner join[WUM_UAT1].dbo.dpadd a
On rtrim(ltrim(p.donor2))=rtrim(ltrim(a.donor))






--- Insert/Update records
-- use [Migration_WUM]
-- Exec SF_BulkOps 'Insert:bulkapi,parallel,Batchsize(10000)', 'TSAC_MIGR', 'Contact_Load'





---- Replicate Data
--use [Migration_Target_QA]
--exec SF_Refresh 'TSAC_MIGR', 'Contact','yes'