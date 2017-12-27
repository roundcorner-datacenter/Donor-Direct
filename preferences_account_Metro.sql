-- Drop staging tables
drop table [Migration_METRO].dbo.[rC_Bios__Preference__c_ForAccount]

--Replicate Data

--USe [Migration_Target_QA]
--exec SF_Replicate 'TSAC_MIGR', 'USER'
--exec SF_Replicate 'TSAC_MIGR', 'RecordType'



--create Staging Table

SELECT

CAST('' as nchar(18))                                                  	As ID
,CAST('' as nvarchar(255))                                            	 As Error
,'0053D000000IrLF'														As Ownerid
,'LOCATION '															As rC_Bios__Category__c
,'OVERRIDE '															as rC_Bios__Subcategory__c
,'C'+rtrim(ltrim(Dp.Chapter)) 											As Service_Location_Code__c
,a.id																	AS accountID
INTO [Migration_METRO].dbo.[rC_Bios__Preference__c_ForAccount]
FROM 
[METRO_UAT1].dbo.DP
Inner join
[Migration_Target_QA].dbo.Account_Preference a
On a.donor=rtrim(ltrim(dp.donor2))

--insert records

-- use [Migration_METRO]
-- Exec SF_BulkOps 'Insert:bulkapi,Parallel,batchsize(10000)', 'TSAC_MIGR', 'rC_Bios__Preference__c_ForAccount'

-- Replicate Data
--use [Migration_Target_QA]
--exec SF_Refresh 'TSAC_MIGR', 'rC_Bios__Preference__c','yes'