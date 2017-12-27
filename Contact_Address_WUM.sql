-- Drop staging tables
drop table [Migration_WUM].dbo.rC_Bios__Contact_Address__c_Load;

--Replicate Data

--USe [Migration_Target]
--exec SF_Replicate 'TSAC_MIGR', 'USER'
--exec SF_Replicate 'TSAC_MIGR', 'RecordType'
--exec SF_Replicate 'TSAC_MIGR', 'CONTACT'


--create Staging Table
WITH DUPS AS
(
SELECT 
CAST('' as nchar(18))                                                  As ID,
CAST('' as nvarchar(255))                                             As Error,
rtrim(ltrim(a.donor ))                                                    		As Donor,
(c.ID) 																	As rC_Bios__Contact__c,
CASE 
when CAST(rtrim(ltrim(dp.NoMail_exp)) as DATE)< GETDATE() THEN 'TRUE'	
ELSE 'FALSE'			
END																			 AS rC_Bios__Active__c
,'FALSE'																As rC_Bios__Archive_Flag__c,
(rtrim(ltrim(a.ADD3)))													As rC_Bios__Additional_Line_1__c,
'WUM-'+(rtrim(ltrim(a.aidnumb)))											As rC_Bios__External_ID__c,
(rtrim(ltrim(a.CITY)))													As rC_Bios__Original_City__c,
(rtrim(ltrim(a.ADDLADD)))											As rC_Bios__Original_Extension__c,
(rtrim(ltrim(a.ZIP)))												As rC_Bios__Original_Postal_Code__c,
(rtrim(ltrim(a.ST)))														As rC_Bios__Original_State__c,
(rtrim(ltrim(a.[ADD])))												As rC_Bios__Original_Street_Line_1__c,
CASE (rtrim(ltrim(a.PRIORITY)))
	WHEN '1' THEN 'TRUE'
	WHEN '2' THEN 'FALSE'
	
	END 																As rC_Bios__Preferred_Mailing__c,
CASE (rtrim(ltrim(a.PRIORITY)))
	WHEN '1' THEN 'TRUE'
	WHEN '2' THEN 'FALSE'
END                                                                   As rC_Bios__Preferred_Other__c,
(substring(rtrim(ltrim(a.add_dt2)),1,2)	)								As rC_Bios__Seasonal_End_Day__c
,(substring(rtrim(ltrim(a.add_dt2)),4,2))									As rC_Bios__Seasonal_End_Month__c
,(substring(rtrim(ltrim(a.add_dt1)),1,2))								As rC_Bios__Seasonal_Start_Day__c
,(substring(rtrim(ltrim(a.add_dt1)),4,2) )							    As rC_Bios__Seasonal_Start_Month__c
,(rtrim(ltrim(a.cr_dt))	)												As rC_Bios__Start_Date__c
,CASE 
	WHEN (rtrim(ltrim(a.ADDTYPE))) in ('AKAN','MAIL','MISC','MMRG','NCOA','OLDA','SATE','SPSE','WNTR','TSMM') THEN 'Other'
	WHEN (rtrim(ltrim(a.ADDTYPE))) in ('HOME','MAIN') THEN 'HOME'
	WHEN (rtrim(ltrim(a.ADDTYPE)))='VACA' THEN 'Vacation'
	WHEN (rtrim(ltrim(a.ADDTYPE)))='WORK' THEN 'WORK'
	END 																 As rC_Bios__Type__c
, ROW_NUMBER() OVER (PARTITION BY [add] 
ORDER BY [add]  asc) AS RowNum 
from 
[WUM_UAT1].dbo.[DPADD] a
 LEFT JOin 
[Migration_WUM].dbo.[Contact_Load] c
ON rtrim(ltrim(a.donor))=rtrim(ltrim(c.donor))
left join
[WUM_UAT1].dbo.dp
on ltrim(rtrim(a.donor))=ltrim(rtrim(dp.donor2))
Where  a.Donor!='' and a.lname!='' and right(c.External_Id__C,2)!='-2' and right(c.External_Id__C,2)!='-3'
UNION ALL
SELECT 
CAST('' as nchar(18))                                                  As ID,
CAST('' as nvarchar(255))                                             As Error,
rtrim(ltrim(a.donor ))                                                    As Donor,
(c.ID) 																	As rC_Bios__Contact__c,
CASE 
when CAST(rtrim(ltrim(dp.NoMail_exp)) as DATE)< GETDATE() THEN 'TRUE'	
ELSE 'FALSE'			
END																			 AS rC_Bios__Active__c,

'FALSE'																As rC_Bios__Archive_Flag__c,
(rtrim(ltrim(a.ADD3)))													As rC_Bios__Additional_Line_1__c,
'WUM-'+(rtrim(ltrim(a.aidnumb))) +'-2'							As rC_Bios__External_ID__c,
(rtrim(ltrim(a.CITY)))													As rC_Bios__Original_City__c,
(rtrim(ltrim(a.ADDLADD)))											As rC_Bios__Original_Extension__c,
(rtrim(ltrim(a.ZIP)))												As rC_Bios__Original_Postal_Code__c,
(rtrim(ltrim(a.ST)))														As rC_Bios__Original_State__c,
(rtrim(ltrim(a.[ADD])))												As rC_Bios__Original_Street_Line_1__c,
CASE (rtrim(ltrim(a.PRIORITY)))
	WHEN '1' THEN 'TRUE'
	WHEN '2' THEN 'FALSE'
	
	END 																As rC_Bios__Preferred_Mailing__c,
CASE (rtrim(ltrim(a.PRIORITY)))
	WHEN '1' THEN 'TRUE'
	WHEN '2' THEN 'FALSE'
END                                                                   As rC_Bios__Preferred_Other__c,
(substring(rtrim(ltrim(a.add_dt2)),1,2)	)								As rC_Bios__Seasonal_End_Day__c
,(substring(rtrim(ltrim(a.add_dt2)),4,2))									As rC_Bios__Seasonal_End_Month__c
,(substring(rtrim(ltrim(a.add_dt1)),1,2)	)								As rC_Bios__Seasonal_Start_Day__c
,(substring(rtrim(ltrim(a.add_dt1)),4,2) )							    As rC_Bios__Seasonal_Start_Month__c
,(rtrim(ltrim(a.cr_dt))	)												As rC_Bios__Start_Date__c
,CASE 
	WHEN (rtrim(ltrim(a.ADDTYPE))) in ('ALIS','ALTY','B','F','FMEM','MDNM','MISC','MMRG','NCOA','OADD','P','S','SPSE','TSMM') THEN 'Other'
	WHEN (rtrim(ltrim(a.ADDTYPE))) in ('HOME','MAIN') THEN 'HOME'
	WHEN (rtrim(ltrim(a.ADDTYPE)))='VACA' THEN 'Vacation'
	WHEN (rtrim(ltrim(a.ADDTYPE)))='WORK' THEN 'WORK'
	END 																 As rC_Bios__Type__c
, ROW_NUMBER() OVER (PARTITION BY [add] 
ORDER BY [add]  asc) AS RowNum 
from 
[WUM_UAT1].dbo.[DPADD] a
 LEFT JOin 
[Migration_WUM].dbo.[Contact_Load] c
ON rtrim(ltrim(a.donor))=rtrim(ltrim(c.donor))
left join
[WUM_UAT1].dbo.dp
on ltrim(rtrim(a.donor))=ltrim(rtrim(dp.donor2))
Where  a.Donor!='' and a.lname!='' and right(c.External_Id__C,2)='-2' and addtype='spse'
)

select * 
INTO [Migration_WUM].dbo.[rC_Bios__Contact_Address__c_Load]
FROM Dups WHERE rownum =1
order by rC_Bios__Contact__c




---Insert/Update records
use [Migration_WUM]
Exec SF_BulkOps 'Insert:bulkapi,parallel,Batchsize(10000)', 'TSAC_MIGR', 'rC_Bios__Contact_Address__c_Load'

---check errors
--select error from [Migration_WUM].dbo.rC_Bios__Contact_Address__c_Load  where error not like '%Op%'

-- Replicate Data
--use [Migration_Target_QA]
--exec SF_Refresh 'TSAC_MIGR', 'rC_Bios__Contact_Address__c','YES'





