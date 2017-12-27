 
 -- Drop staging tables
drop table [Migration_WUM].dbo.rC_Giving__Opportunity_Credit__c_Load

--Replicate Data

--USe [Migration_Target_QA]

--exec SF_Replicate 'TSAC_MIGR', 'USER'
---exec SF_Replicate 'TSAC_MIGR', 'ACCOUNT'
--exec SF_Replicate 'TSAC_MIGR', 'Opportunity'



--create Staging Table

--CREDITS

SELECT

CAST('' as nchar(18))                                                  As ID
,CAST('' as nvarchar(255))                                             As Error
,a.id																	As rC_Giving__Account__c
,rtrim(ltrim(g.amt))													As rC_Giving__Amount__c
,'FALSE'																As rC_Giving__archive_flag__c
,'100'																	As rC_Giving__Distribution__c
,'FALSE'																As rC_Giving__Is_Fixed__c
,CAST('' as nvarchar(255))												As rC_Giving__Opportunity__c
,CAST('' as nvarchar(255))												as rC_Giving__Opportunity_Close_Date__c
,CAST('' as nvarchar(255))												As rC_Giving__Opportunity_Current_Giving_Amount__c
,CAST('' as nvarchar(255))												as rC_Giving__Opportunity_Stage__c
,'Account Only'															As rC_Giving__Type__c
,'0053D000000IrLq'														as rC_Giving__User__c
,'WUM-'+rtrim(ltrim(g.gidnumb))											as External_ID__c
,rtrim(ltrim(g.donor)) 													AS donor
,rtrim(ltrim(g.slink))                                                  As Slink
,rtrim(ltrim(g.gidnumb))												AS Gidnumb
INTO [Migration_WUM].dbo.rC_Giving__Opportunity_Credit__c_Load

FROM
[WUM_10K(QA)].dbo.dpgift g
LEFT JOIN
[Migration_WUM].dbo.Account_Load_WUM a
ON rtrim(ltrim(g.donor))=a.donor

WHERE g.rectype = 's' 
order by rC_Giving__Account__c
----------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------
----updating rC_Giving__Opportunity__c


update o
SEt o.rC_Giving__Opportunity__c=y.ID
from [WUM_UAT1].dbo.dpgift xx
LEFT JOIN
[Migration_WUM].dbo.rC_Giving__Opportunity_Credit__c_Load o
on rtrim(ltrim(xx.gidnumb))=substring(o.External_ID__c,5,Len(o.External_ID__c))
LEFT join
(select ID,External_id__c from [Migration_WUM].dbo.[opportunity_INKIND]
UNION 
select ID,External_id__c from [Migration_WUM].dbo.[opportunity_DONATION]
UNION
select ID,External_id__c from [Migration_WUM].dbo.[opportunity_Pledge]
UNION
select ID,External_id__c from [Migration_WUM].dbo.[opportunity_Pledge_Payment]) y
on rtrim(ltrim(xx.slink))=
reverse(SUBSTRING(reverse(y.External_id__c),1,charindex('-',reverse(y.External_id__c))-1))





--------------------------------------------------------------


--updating rC_Giving__Opportunity_Close_Date__c
update o
SEt o.rC_Giving__Opportunity_Close_Date__c=y.CloseDate
from [WUM_UAT1].dbo.dpgift xx
LEFT JOIN
[Migration_WUM].dbo.rC_Giving__Opportunity_Credit__c_Load o
on rtrim(ltrim(xx.gidnumb))=substring(o.External_ID__c,5,Len(o.External_ID__c))
LEFT join
(select ID,External_id__c,CloseDate from [Migration_WUM].dbo.[opportunity_INKIND]
UNION 
select ID,External_id__c,CloseDate from [Migration_WUM].dbo.[opportunity_DONATION]
UNION
select ID,External_id__c,CloseDate from [Migration_WUM].dbo.[opportunity_Pledge]
UNION
select ID,External_id__c,CloseDate from [Migration_WUM].dbo.[opportunity_Pledge_Payment]) y
on rtrim(ltrim(xx.slink))=
reverse(SUBSTRING(reverse(y.External_id__c),1,charindex('-',reverse(y.External_id__c))-1))



-----------------------------------------------------
--updating rC_Giving__Current_Giving_Amount__c
update o
SEt o.rC_Giving__Opportunity_Current_Giving_Amount__c=y.rC_Giving__Opportunity_Current_Giving_Amount__c
from [WUM_UAT1].dbo.dpgift xx
LEFT JOIN
[Migration_WUM].dbo.rC_Giving__Opportunity_Credit__c_Load o
on rtrim(ltrim(xx.gidnumb))=substring(o.External_ID__c,5,Len(o.External_ID__c))
LEFT join
(select ID,External_id__c,rC_Giving__Opportunity_Current_Giving_Amount__c from [Migration_WUM].dbo.[opportunity_INKIND]
UNION 
select ID,External_id__c,rC_Giving__Opportunity_Current_Giving_Amount__c from [Migration_WUM].dbo.[opportunity_DONATION]
UNION
select ID,External_id__c,rC_Giving__Opportunity_Current_Giving_Amount__c from [Migration_WUM].dbo.[opportunity_Pledge]
UNION
select ID,External_id__c,rC_Giving__Opportunity_Current_Giving_Amount__c from [Migration_WUM].dbo.[opportunity_Pledge_Payment]) y
on rtrim(ltrim(xx.slink))=
reverse(SUBSTRING(reverse(y.External_id__c),1,charindex('-',reverse(y.External_id__c))-1))


-------------------------------------------------------------------------------------
--updating rC_Giving__Opportunity_Stage__c
update o
SEt o.rC_Giving__Opportunity_Stage__c=y.rC_Giving__Opportunity_Stage__c
from [WUM_UAT1].dbo.dpgift xx
LEFT JOIN
[Migration_WUM].dbo.rC_Giving__Opportunity_Credit__c_Load o
on rtrim(ltrim(xx.gidnumb))=substring(o.External_ID__c,5,Len(o.External_ID__c))
LEFT join
(select ID,External_id__c,rC_Giving__Opportunity_Stage__c from [Migration_WUM].dbo.[opportunity_INKIND]
UNION 
select ID,External_id__c,rC_Giving__Opportunity_Stage__c from [Migration_WUM].dbo.[opportunity_DONATION]
UNION
select ID,External_id__c,rC_Giving__Opportunity_Stage__c from [Migration_WUM].dbo.[opportunity_Pledge]
UNION
select ID,External_id__c,rC_Giving__Opportunity_Stage__c from [Migration_WUM].dbo.[opportunity_Pledge_Payment]) y
on rtrim(ltrim(xx.slink))=
reverse(SUBSTRING(reverse(y.External_id__c),1,charindex('-',reverse(y.External_id__c))-1))







--- Insert/Update records
--use [Migration_WUM]
--Exec SF_BulkOps 'Insert:bulkapi,Parallel,batchsize(5000)', 'TSAC_MIGR', 'rC_Giving__Opportunity_Credit__c_Load'


-----check errors

--select count(*) from [Migration_WUM].dbo.[rC_Giving__Opportunity_Credit__c_Load] where id=''





---- Replicate Data
--use [Migration_Target_QA]
--exec SF_Refresh 'TSAC_MIGR', 'rC_Giving__Opportunity_Credit__c','yes'
