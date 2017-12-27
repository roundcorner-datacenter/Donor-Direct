-- Drop staging tables
drop table [Migration_METRO].dbo.[User_Metro_stage]

------create staging table

SELECT 
CAST('' as nchar(18))                                                         	As ID,
CAST('' as nvarchar(255))                                                    	As Error
,rtrim(ltrim(u.Username)) 														As Username
,rtrim(ltrim(u.LastName))														As LastName
,rtrim(ltrim(u.FirstName))														as FirstName
,CONCAT(rtrim(ltrim(u.FirstName)),' ',rtrim(ltrim(u.FirstName)))				As Name
,rtrim(ltrim(u.CompanyName))													As CompanyName
,rtrim(ltrim(u.Division))														As Division
,rtrim(ltrim(u.Department))														As Department
,rtrim(ltrim(u.Title))															As Title
,rtrim(ltrim(u.Street))															As Street
,rtrim(ltrim(u.City))															As City
,rtrim(ltrim(u.[State]))														As [State]
,u.PostalCode																	As PostalCode
,u.Country																		As Country
,u.Email																		As Email
,u.Phone																		As Phone
,u.Fax																			As Fax
,u.MobilePhone																	As MobilePhone
,u.Alias																		as Alias
,'TRUE'																			as ISACTIVE
,rtrim(ltrim(u.TimeZoneSidKey))													as TimeZoneSidKey
,'00E3D000000I0jMUAS'															As UserRoleId
,u.LocaleSidKey																	as LocaleSidKey
,u.EmailEncodingKey																as EmailEncodingKey
,p.id																			as ProfileId
,'STANDARD'																		As USERTYPE
,u.LanguageLocaleKey															as LanguageLocaleKey
,u.EmployeeNumber																As EmployeeNumber
,u.[Legacy_ID__c]																as [Legacy_ID__c]

INTO [Migration_METRO].dbo.[User_Metro_stage]

FROM [DerivedData].dbo.[USERS]u
-- Left join
-- [Migration_target_QA].dbo.USERROLE r
-- on rtrim(ltrim(u.UserRole))=r.Name
Left join
[Migration_target_QA].dbo.PROFILE p
On rtrim(ltrim(u.Profile))=p.Name

---------------------------------------------------------



----------Insert/update records

use [Migration_METRO]
Exec SF_BulkOps 'Insert:bulkapi,Parallel,Batchsize(5000)', 'TSAC_MIGR', 'User_Metro_stage'

---------Replicate data

--use [Migration_Target_QA]
exec SF_Refresh 'TSAC_MIGR', 'USER','yes'