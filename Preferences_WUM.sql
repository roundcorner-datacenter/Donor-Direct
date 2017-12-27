--Drop table

DROP table [Migration_WUM].dbo.rC_Bios__Preference__c

Select * Into [Migration_WUM].dbo.rC_Bios__Preference__c
FROM(
SELECT 
CAST('' as nchar(18))                                                  	As ID
,CAST('' as nvarchar(255))                                             	As Error
,'0053D000000IrLq'														As Ownerid
,CASE

WHEN	rtrim(ltrim(xx.Flags)) ='AG'	THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'AG'
WHEN	rtrim(ltrim(xx.Flags)) ='AP'	THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'AP'
WHEN	rtrim(ltrim(xx.Flags)) ='CF'	THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'CF'
WHEN	rtrim(ltrim(xx.Flags)) ='CH'	THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'CH'
WHEN	rtrim(ltrim(xx.Flags)) ='EA'	THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'EA'
WHEN	rtrim(ltrim(xx.Flags)) ='FN'	THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'FN'
WHEN	rtrim(ltrim(xx.Flags)) ='HN'	THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'HN'
WHEN	rtrim(ltrim(xx.Flags)) ='JL'	THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'JL'
WHEN	rtrim(ltrim(xx.Flags)) ='JN'	THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'JN'
WHEN	rtrim(ltrim(xx.Flags)) ='MW'	THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'MW'
WHEN	rtrim(ltrim(xx.Flags)) ='MY'	THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'MW'
WHEN	rtrim(ltrim(xx.Flags)) ='NL'	THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'NL'
WHEN	rtrim(ltrim(xx.Flags)) ='SB'	THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'SB'
WHEN	rtrim(ltrim(xx.Flags)) ='SN'	THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'SN'
WHEN	rtrim(ltrim(xx.Flags)) ='SS'	THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'SS'
WHEN	rtrim(ltrim(xx.Flags)) ='TG'	THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'TG'
WHEN	rtrim(ltrim(xx.Flags)) ='TH'	THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'TH'
WHEN	rtrim(ltrim(xx.Flags)) ='YE'	THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'YE'



END											    																	as rC_Bios__External_ID__c
,(SELECT Id FROM [Migration_Target_QA].dbo.RecordType WHERE SobjectType = 'rC_Bios__Preference__c' AND Name = 'Standard') as RecordTypeId
,CASE 


WHEN	rtrim(ltrim(xx.Flags)) ='AG'	    THEN	c.Id
WHEN	rtrim(ltrim(xx.Flags)) ='AP'	    THEN	c.Id
WHEN	rtrim(ltrim(xx.Flags)) ='CF'	    THEN	c.Id
WHEN	rtrim(ltrim(xx.Flags)) ='CH'	    THEN	c.Id
WHEN	rtrim(ltrim(xx.Flags)) ='EA'	    THEN	c.Id
WHEN	rtrim(ltrim(xx.Flags)) ='FN'	    THEN	c.Id
WHEN	rtrim(ltrim(xx.Flags)) ='HN'	    THEN	c.Id
WHEN	rtrim(ltrim(xx.Flags)) ='JL'	    THEN	c.Id
WHEN	rtrim(ltrim(xx.Flags)) ='JN'	    THEN	c.Id
WHEN	rtrim(ltrim(xx.Flags)) ='MW'	    THEN	c.Id
WHEN	rtrim(ltrim(xx.Flags)) ='MY'	    THEN	c.Id
WHEN	rtrim(ltrim(xx.Flags)) ='NL'	    THEN	c.Id
WHEN	rtrim(ltrim(xx.Flags)) ='SB'	    THEN	c.Id
WHEN	rtrim(ltrim(xx.Flags)) ='SN'	    THEN	c.Id
WHEN	rtrim(ltrim(xx.Flags)) ='SS'	    THEN	c.Id
WHEN	rtrim(ltrim(xx.Flags)) ='TG'	    THEN	c.Id
WHEN	rtrim(ltrim(xx.Flags)) ='TH'	    THEN	c.Id
WHEN	rtrim(ltrim(xx.Flags)) ='YE'	    THEN	c.Id
---WHEN	rtrim(ltrim(xx.Flags)) ='YU'	    THEN	c.Id



END																		AS ContactID



,'FALSE'												 	as rC_Bios__Active__c
,'FALSE'																As rC_Bios__Archive_Flag__c


,'CONFIRMED'															 as rC_Bios__Status__c



,NULL																	as rC_Bios__End_Date__c
,CAST(GETDATE()	as datetime2)															As rC_Bios__Start_Date__c



,CASE 

WHEN	rtrim(ltrim(FLAGS))='AG'	then	'Communication Frequency'
WHEN	rtrim(ltrim(FLAGS))='AP'	then	'Communication Frequency'
WHEN	rtrim(ltrim(FLAGS))='CF'	then	'Communication Frequency'
WHEN	rtrim(ltrim(FLAGS))='CH'	then	'Communication Frequency'
WHEN	rtrim(ltrim(FLAGS))='EA'	then	'Communication Frequency'
WHEN	rtrim(ltrim(FLAGS))='FN'	then	'Communication Frequency'
WHEN	rtrim(ltrim(FLAGS))='HN'	then	'Communication Frequency'
WHEN	rtrim(ltrim(FLAGS))='JL'	then	'Communication Frequency'
WHEN	rtrim(ltrim(FLAGS))='JN'	then	'Communication Frequency'
WHEN	rtrim(ltrim(FLAGS))='MW'	then	'Communication Frequency'
WHEN	rtrim(ltrim(FLAGS))='MY'	then	'Communication Frequency'
WHEN	rtrim(ltrim(FLAGS))='NL'	then	'Communication Frequency'
WHEN	rtrim(ltrim(FLAGS))='SB'	then	'Communication Frequency'
WHEN	rtrim(ltrim(FLAGS))='SN'	then	'Communication Frequency'
WHEN	rtrim(ltrim(FLAGS))='SS'	then	'Communication Frequency'
WHEN	rtrim(ltrim(FLAGS))='TG'	then	'Communication Frequency'
WHEN	rtrim(ltrim(FLAGS))='TH'	then	'Communication Frequency'
WHEN	rtrim(ltrim(FLAGS))='YE'	then	'Communication Frequency'
----WHEN	rtrim(ltrim(FLAGS))='YU'	then	'Communication Frequency'


END    																	as rC_Bios__category__c

,CASE 


WHEN	rtrim(ltrim(FLAGS))='AG'	    then	'August'
WHEN	rtrim(ltrim(FLAGS))='AP'	    then	'April'
WHEN	rtrim(ltrim(FLAGS))='CF'	    then	'Christmas II'
WHEN	rtrim(ltrim(FLAGS))='CH'	    then	'Christmas'
WHEN	rtrim(ltrim(FLAGS))='EA'	    then	'Easter'
WHEN	rtrim(ltrim(FLAGS))='FN'	    then	'Fall Newsletter'
WHEN	rtrim(ltrim(FLAGS))='HN'	    then	'Holiday Newsletter'
WHEN	rtrim(ltrim(FLAGS))='JL'	    then	'July'
WHEN	rtrim(ltrim(FLAGS))='JN'	    then	'June'
WHEN	rtrim(ltrim(FLAGS))='MW'	    then	'Mid-Winter'
WHEN	rtrim(ltrim(FLAGS))='MY'	    then	'May'
WHEN	rtrim(ltrim(FLAGS))='NL'	    then	'Newsletter'
WHEN	rtrim(ltrim(FLAGS))='SB'	    then	'September'
WHEN	rtrim(ltrim(FLAGS))='SN'	    then	'Spring Newsletter'
WHEN	rtrim(ltrim(FLAGS))='SS'	    then	'Summer Slump'
WHEN	rtrim(ltrim(FLAGS))='TG'	    then	'Thanksgiving Newsletter'
WHEN	rtrim(ltrim(FLAGS))='TH'	    then	'Thanksgiving'
WHEN	rtrim(ltrim(FLAGS))='YE'	    then	'Year-End'
---WHEN	rtrim(ltrim(FLAGS))='YU'	    then	'Year End Urgent'





END  																						 as rC_Bios__Subcategory__c

,case 



WHEN	rtrim(ltrim(FLAGS))='AG'	then	'AG'
WHEN	rtrim(ltrim(FLAGS))='AP'	then	'AP'
WHEN	rtrim(ltrim(FLAGS))='CF'	then	'CF'
WHEN	rtrim(ltrim(FLAGS))='CH'	then	'CH'
WHEN	rtrim(ltrim(FLAGS))='EA'	then	'EA'
WHEN	rtrim(ltrim(FLAGS))='FN'	then	'FN'
WHEN	rtrim(ltrim(FLAGS))='HN'	then	'HN'
WHEN	rtrim(ltrim(FLAGS))='JL'	then	'JL'
WHEN	rtrim(ltrim(FLAGS))='JN'	then	'JN'
WHEN	rtrim(ltrim(FLAGS))='MW'	then	'MW'
WHEN	rtrim(ltrim(FLAGS))='MY'	then	'MY'
WHEN	rtrim(ltrim(FLAGS))='NL'	then	'NL'
WHEN	rtrim(ltrim(FLAGS))='SB'	then	'SB'
WHEN	rtrim(ltrim(FLAGS))='SN'	then	'SN'
WHEN	rtrim(ltrim(FLAGS))='SS'	then	'SS'
WHEN	rtrim(ltrim(FLAGS))='TG'	then	'TG'
WHEN	rtrim(ltrim(FLAGS))='TH'	then	'TH'
WHEN	rtrim(ltrim(FLAGS))='YE'	then	'YE'
---WHEN	rtrim(ltrim(FLAGS))='YU'	then	'YU'



end 																				as rC_Bios__Code_Value__c


,CAST('' as nvarchar(255))

 																			as Type

,CAST('' as nvarchar(255))													as service_location_code__c
,CAST('' as nvarchar(18))														as accountId



,rtrim(ltrim(xx.donor2))														 as donor
,CAST('' as nvarchar(255))																			as rC_Bios__Subtype__c
,CAST('' as Float)																	as Amount__c

FROM 

(SELECT donor2,seq,CAST(nomail_exp as nvarchar(255)) as nomail_exp,Split.a.value('.', 'VARCHAR(max)') AS flags
FROM (SELECT donor2, campaign,nomail_exp,seq,CAST ('<M>' + REPLACE(campaign, ','
, '</M><M>') + '</M>' AS XML) AS 
String FROM [WUM_UAT1].dbo.DP) AS A CROSS APPLY String.nodes ('/M') AS Split(a)
where charindex(',',campaign)>0 and charindex('.',campaign)=0 

)XX
left join
[Migration_WUM].dbo.Contact_Load c
on ltrim(rtrim(xx.donor2))=c.Donor

-- left join
-- [Migration_WUM].dbo.Account_Load_WUM a
-- on ltrim(rtrim(xx.donor2))=a.Donor

where right(c.External_Id__C,2)!='-2'
and xx.flags in('AG','AP','CF',	'CH','EA','FN',	'HN','JL','JN',	'MW','MY','NL','SB','SN','SS','TG','TH','YE')


UNION


SELECT 
CAST('' as nchar(18))                                                  	As ID
,CAST('' as nvarchar(255))                                             	As Error
,'0053D000000IrLq'														As Ownerid
,CASE
WHEN	rtrim(ltrim(xx.Flags)) ='ADBAPL' THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'ADBAPL'
WHEN	rtrim(ltrim(xx.Flags)) ='ADBDHQ'THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'ADBDHQ'
WHEN	rtrim(ltrim(xx.Flags)) ='ADBFDL'THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'ADBFDL'
WHEN	rtrim(ltrim(xx.Flags)) ='ADBGBY'THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'ADBGBY'
WHEN	rtrim(ltrim(xx.Flags)) ='ADBKEN'THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'ADBKEN'
WHEN	rtrim(ltrim(xx.Flags)) ='ADBLAC'THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'ADBLAC'
WHEN	rtrim(ltrim(xx.Flags)) ='ADBMAD'THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'ADBMAD'
WHEN	rtrim(ltrim(xx.Flags)) ='ADBSTP'THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'ADBSTP'
WHEN	rtrim(ltrim(xx.Flags)) ='ADBWAK'THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'ADBWAK'
WHEN	rtrim(ltrim(xx.Flags)) ='ADPAPL'THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'ADPAPL'
WHEN	rtrim(ltrim(xx.Flags)) ='ADPGBY'THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'ADPGBY'
WHEN	rtrim(ltrim(xx.Flags)) ='ADVBRD'THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'ADVBRD'
WHEN	rtrim(ltrim(xx.Flags)) ='CASELD'THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'CASELD'
WHEN	rtrim(ltrim(xx.Flags)) ='EFTDNR'THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'EFTDNR'
WHEN	rtrim(ltrim(xx.Flags)) ='KROC'	THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'KROC'
WHEN	rtrim(ltrim(xx.Flags)) ='UNITED'THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'UNITED'
WHEN	rtrim(ltrim(xx.Flags)) ='VOLGBY'THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'VOLGBY'
WHEN	rtrim(ltrim(xx.Flags)) ='WAUXGB'THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'WAUXGB'
WHEN	rtrim(ltrim(xx.Flags)) ='ANGEL'	THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'ANGEL'
WHEN	rtrim(ltrim(xx.Flags)) ='CIVICC'THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'CIVICC'

WHEN	rtrim(ltrim(xx.Flags)) ='KENCOC'THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'KENCOC'
WHEN	rtrim(ltrim(xx.Flags)) ='KENROT'THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'KENROT'

WHEN	rtrim(ltrim(xx.Flags)) ='APPRCH'THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'APPRCH'
WHEN	rtrim(ltrim(xx.Flags)) ='PGANTY'THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'PGANTY'
WHEN	rtrim(ltrim(xx.Flags)) ='PLANDN'THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'PLANDN'
WHEN	rtrim(ltrim(xx.Flags)) ='ZOZOZO'THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'ZOZOZO'
END											    																	as rC_Bios__External_ID__c
,(SELECT Id FROM [Migration_Target_QA].dbo.RecordType WHERE SobjectType = 'rC_Bios__Preference__c' AND Name = 'Standard') as RecordTypeId
,CASE 
WHEN	rtrim(ltrim(xx.Flags)) ='ADBAPL'	THEN	c.Id
WHEN	rtrim(ltrim(xx.Flags)) ='ADBDHQ'	THEN	c.Id
WHEN	rtrim(ltrim(xx.Flags)) ='ADBFDL'	THEN	c.Id
WHEN	rtrim(ltrim(xx.Flags)) ='ADBGBY'	THEN	c.Id
WHEN	rtrim(ltrim(xx.Flags)) ='ADBKEN'	THEN	c.Id
WHEN	rtrim(ltrim(xx.Flags)) ='ADBLAC'	THEN	c.Id
WHEN	rtrim(ltrim(xx.Flags)) ='ADBMAD'	THEN	c.Id
WHEN	rtrim(ltrim(xx.Flags)) ='ADBSTP'	THEN	c.Id
WHEN	rtrim(ltrim(xx.Flags)) ='ADBWAK'	THEN	c.Id
WHEN	rtrim(ltrim(xx.Flags)) ='ADPAPL'	THEN	c.Id
WHEN	rtrim(ltrim(xx.Flags)) ='ADPGBY'	THEN	c.Id
WHEN	rtrim(ltrim(xx.Flags)) ='ADVBRD'	THEN	c.Id
WHEN	rtrim(ltrim(xx.Flags)) ='CASELD'	THEN	c.Id
WHEN	rtrim(ltrim(xx.Flags)) ='EFTDNR'	THEN	c.Id
WHEN	rtrim(ltrim(xx.Flags)) ='KROC'	    THEN	c.Id
WHEN	rtrim(ltrim(xx.Flags)) ='UNITED'	THEN	c.Id
WHEN	rtrim(ltrim(xx.Flags)) ='VOLGBY'	THEN	c.Id
WHEN	rtrim(ltrim(xx.Flags)) ='WAUXGB'	THEN	c.Id
WHEN	rtrim(ltrim(xx.Flags)) ='ANGEL'	    THEN	c.Id
WHEN	rtrim(ltrim(xx.Flags)) ='CIVICC'	THEN	c.Id

WHEN	rtrim(ltrim(xx.Flags)) ='KENCOC'	THEN	c.Id
WHEN	rtrim(ltrim(xx.Flags)) ='KENROT'	THEN	c.Id

WHEN	rtrim(ltrim(xx.Flags)) ='APPRCH'	THEN	c.Id
WHEN	rtrim(ltrim(xx.Flags)) ='PGANTY'	THEN	c.Id
WHEN	rtrim(ltrim(xx.Flags)) ='PLANDN'	THEN	c.Id


END																		AS ContactID



,CASE rtrim(ltrim(Flags))
WHEN 'ADBFDL' THEN 'FALSE'
WHEN 'ADBKEN' THEN 'FALSE'
WHEN 'ADBLAC' THEN 'FALSE'
WHEN 'ADBMAD' THEN 'FALSE'
WHEN 'ADBSTP' THEN 'FALSE'
WHEN 'ADBWAK' THEN 'FALSE'
WHEN 'ADPAPL' THEN 'FALSE'
WHEN 'ADPGBY' THEN 'FALSE'
WHEN 'PLDROP'  THEN 'FALSE'
WHEN 'PLQUIT'  THEN 'FALSE'
ELSE 'TRUE'
END 																 	as rC_Bios__Active__c
,'FALSE'																As rC_Bios__Archive_Flag__c


,'CONFIRMED'															 as rC_Bios__Status__c



,NULL																	as rC_Bios__End_Date__c
,CAST(GETDATE()	as datetime2)															As rC_Bios__Start_Date__c



,CASE 
WHEN	rtrim(ltrim(FLAGS))='ADBAPL'	then	'Constituent Type'
WHEN	rtrim(ltrim(FLAGS))='ADBDHQ'	then	'Constituent Type'
WHEN	rtrim(ltrim(FLAGS))='ADBFDL'	then	'Constituent Type'
WHEN	rtrim(ltrim(FLAGS))='ADBGBY'	then	'Constituent Type'
WHEN	rtrim(ltrim(FLAGS))='ADBKEN'	then	'Constituent Type'
WHEN	rtrim(ltrim(FLAGS))='ADBLAC'	then	'Constituent Type'
WHEN	rtrim(ltrim(FLAGS))='ADBMAD'	then	'Constituent Type'
WHEN	rtrim(ltrim(FLAGS))='ADBSTP'	then	'Constituent Type'
WHEN	rtrim(ltrim(FLAGS))='ADBWAK'	then	'Constituent Type'
WHEN	rtrim(ltrim(FLAGS))='ADPAPL'	then	'Constituent Type'
WHEN	rtrim(ltrim(FLAGS))='ADPGBY'	then	'Constituent Type'
WHEN	rtrim(ltrim(FLAGS))='ADVBRD'	then	'Constituent Type'
WHEN	rtrim(ltrim(FLAGS))='CASELD'	then	'Constituent Type'
WHEN	rtrim(ltrim(FLAGS))='EFTDNR'	then	'Constituent Type'
WHEN	rtrim(ltrim(FLAGS))='KROC'	    then	'Constituent Type'
WHEN	rtrim(ltrim(FLAGS))='UNITED'	then	'Constituent Type'
WHEN	rtrim(ltrim(FLAGS))='VOLGBY'	then	'Constituent Type'
WHEN	rtrim(ltrim(FLAGS))='WAUXGB'	then	'Constituent Type'
WHEN	rtrim(ltrim(FLAGS))='ANGEL'		then	'Communication Type'
----WHEN	rtrim(ltrim(FLAGS))='SBOVM'	then	'Communication Type'
WHEN	rtrim(ltrim(FLAGS))='CIVICC'	then	'Interests'

WHEN	rtrim(ltrim(FLAGS))='KENCOC'	then	'Interests'
WHEN	rtrim(ltrim(FLAGS))='KENROT'	then	'Interests'
---WHEN	rtrim(ltrim(FLAGS))='KT'		then	'Interests'
WHEN	rtrim(ltrim(FLAGS))='APPRCH'	then	'Prospect'
WHEN	rtrim(ltrim(FLAGS))='PGANTY'	then	'Planned Giving'
WHEN	rtrim(ltrim(FLAGS))='PLANDN'	then	'Planned Giving'
WHEN	rtrim(ltrim(FLAGS))='ELITED'	then	'Vendor Program Flags'
WHEN	rtrim(ltrim(FLAGS))='LOWMID'	then	'Vendor Program Flags'
WHEN	rtrim(ltrim(FLAGS))='MSPSED'	then	'Vendor Program Flags'
WHEN	rtrim(ltrim(FLAGS))='PLACTV'	then	'Vendor Program Flags'
WHEN	rtrim(ltrim(FLAGS))='PLDROP'	then	'Vendor Program Flags'
WHEN	rtrim(ltrim(FLAGS))='PLQUIT'	then	'Vendor Program Flags'
WHEN	rtrim(ltrim(FLAGS))='SEEDNM'	then	'Vendor Program Flags'
WHEN	rtrim(ltrim(FLAGS))='TOPDNR'	then	'Vendor Program Flags'
WHEN	rtrim(ltrim(FLAGS))='UPPMID'	then	'Vendor Program Flags'
WHEN	rtrim(ltrim(FLAGS))='YEARST'	then	'Vendor Program Flags'
WHEN	rtrim(ltrim(FLAGS))='ZOZOZO'	then	'Location'
END    																	as rC_Bios__category__c

,CASE 
WHEN	rtrim(ltrim(FLAGS))='ADBAPL'	then	'Advisory Board'
WHEN	rtrim(ltrim(FLAGS))='ADBDHQ'	then	'Advisory Board'
WHEN	rtrim(ltrim(FLAGS))='ADBFDL'	then	'Advisory Board'
WHEN	rtrim(ltrim(FLAGS))='ADBGBY'	then	'Advisory Board'
WHEN	rtrim(ltrim(FLAGS))='ADBKEN'	then	'Advisory Board'
WHEN	rtrim(ltrim(FLAGS))='ADBLAC'	then	'Advisory Board'
WHEN	rtrim(ltrim(FLAGS))='ADBMAD'	then	'Advisory Board'
WHEN	rtrim(ltrim(FLAGS))='ADBSTP'	then	'Advisory Board'
WHEN	rtrim(ltrim(FLAGS))='ADBWAK'	then	'Advisory Board'
WHEN	rtrim(ltrim(FLAGS))='ADPAPL'	then	'Advisory Board'
WHEN	rtrim(ltrim(FLAGS))='ADPGBY'	then	'Advisory Board'
WHEN	rtrim(ltrim(FLAGS))='ADVBRD'	then	'Advisory Board'
WHEN	rtrim(ltrim(FLAGS))='CASELD'	then	'Donor'
WHEN	rtrim(ltrim(FLAGS))='EFTDNR'	then	'Donor'
WHEN	rtrim(ltrim(FLAGS))='KROC'	    then	'Kroc Center'
WHEN	rtrim(ltrim(FLAGS))='UNITED'	then	'United Way'
WHEN	rtrim(ltrim(FLAGS))='VOLGBY'	then	'Volunteer'
WHEN	rtrim(ltrim(FLAGS))='WAUXGB'	then	'Women''s Auxiliary' 

WHEN	rtrim(ltrim(FLAGS))='ANGEL'	    then	' Corps Angel Program'
----WHEN	rtrim(ltrim(FLAGS))='SBOVM'	    then	'Soundbite OVM'

WHEN	rtrim(ltrim(FLAGS))='CIVICC'	then	'Civic club'
WHEN	rtrim(ltrim(FLAGS))='HQ'	    then	'Disaster'
WHEN	rtrim(ltrim(FLAGS))='KENCOC'	then	'Chamber of Commerce'
WHEN	rtrim(ltrim(FLAGS))='KENROT'	then	'Rotary Member'
WHEN	rtrim(ltrim(FLAGS))='KT'	   then	'Disaster'

WHEN	rtrim(ltrim(FLAGS))='APPRCH'	then	'Approach'
WHEN	rtrim(ltrim(FLAGS))='PGANTY'	then	'Gift Annuity Donor'
WHEN	rtrim(ltrim(FLAGS))='PLANDN'	then	'Donor'
WHEN	rtrim(ltrim(FLAGS))='ELITED'	then	'Donor'
WHEN	rtrim(ltrim(FLAGS))='LOWMID'	then	'Donor Elite'
WHEN	rtrim(ltrim(FLAGS))='MSPSED'	then	'Seed Name'
WHEN	rtrim(ltrim(FLAGS))='PLACTV'	then	'Pledge'
WHEN	rtrim(ltrim(FLAGS))='PLDROP'	then	'Pledge'
WHEN	rtrim(ltrim(FLAGS))='PLQUIT'	then	'Pledge'
WHEN	rtrim(ltrim(FLAGS))='SEEDNM'	then	'Seed Name'
WHEN	rtrim(ltrim(FLAGS))='TOPDNR'	then	'Donor Elite'
WHEN	rtrim(ltrim(FLAGS))='UPPMID'	then	'Donor Elite'
WHEN	rtrim(ltrim(FLAGS))='YEARST'	then	'Year End Statement'
WHEN	rtrim(ltrim(FLAGS))='ZOZOZO'	then	'Override'



END  																						 as rC_Bios__Subcategory__c

,case 
WHEN	rtrim(ltrim(FLAGS))='ADBAPL'	then	'ADB, AVB'
WHEN	rtrim(ltrim(FLAGS))='ADBDHQ'	then	'ADBDHQ'
WHEN	rtrim(ltrim(FLAGS))='ADBFDL'	then	'ADB, AVB'
WHEN	rtrim(ltrim(FLAGS))='ADBGBY'	then	'ADB, AVB'
WHEN	rtrim(ltrim(FLAGS))='ADBKEN'	then	'ADB, AVB'
WHEN	rtrim(ltrim(FLAGS))='ADBLAC'	then	'ADB, AVB'
WHEN	rtrim(ltrim(FLAGS))='ADBMAD'	then	'ADB, AVB'
WHEN	rtrim(ltrim(FLAGS))='ADBSTP'	then	'ADB, AVB'
WHEN	rtrim(ltrim(FLAGS))='ADBWAK'	then	'ADB, AVB'
WHEN	rtrim(ltrim(FLAGS))='ADPAPL'	then	'ADB, AVB'
WHEN	rtrim(ltrim(FLAGS))='ADPGBY'	then	'ADB, AVB'
WHEN	rtrim(ltrim(FLAGS))='ADVBRD'	then	'ADB, AVB'
WHEN	rtrim(ltrim(FLAGS))='CASELD'	then	'CAS'
WHEN	rtrim(ltrim(FLAGS))='EFTDNR'	then	'EFTDNR'
WHEN	rtrim(ltrim(FLAGS))='KROC'		then	'KROC'
WHEN	rtrim(ltrim(FLAGS))='UNITED'	then	'UNITED'
WHEN	rtrim(ltrim(FLAGS))='VOLGBY'	then	'VOL'
WHEN	rtrim(ltrim(FLAGS))='WAUXGB'	then	'WAU, WAUX'
WHEN	rtrim(ltrim(FLAGS))='ANGEL'	then	'ANGEL'
---WHEN	rtrim(ltrim(FLAGS))='SBOVM'	then	'SBOVM'
WHEN	rtrim(ltrim(FLAGS))='CIVICC'then	'CIVIC'
WHEN	rtrim(ltrim(FLAGS))='KENCOC'then	'CHAM'
WHEN	rtrim(ltrim(FLAGS))='KENROT'then	'RTY'
WHEN	rtrim(ltrim(FLAGS))='KT'then	'DST'

WHEN	rtrim(ltrim(FLAGS))='APPRCH'	then	'APPRCH'
WHEN	rtrim(ltrim(FLAGS))='PGANTY'	then	'PGA'
WHEN	rtrim(ltrim(FLAGS))='PLANDN'	then	'PGD'
WHEN	rtrim(ltrim(FLAGS))='ELITED'	then	'ELITED'
WHEN	rtrim(ltrim(FLAGS))='LOWMID'	then	'LOWMID'
WHEN	rtrim(ltrim(FLAGS))='MSPSED'	then	'MSPSED'
WHEN	rtrim(ltrim(FLAGS))='PLACTV'	then	'PLACTV'
WHEN	rtrim(ltrim(FLAGS))='PLDROP'	then	'PLDROP'
WHEN	rtrim(ltrim(FLAGS))='PLQUIT'	then	'PLQUIT'
WHEN	rtrim(ltrim(FLAGS))='SEEDNM'	then	'SEEDNM'
WHEN	rtrim(ltrim(FLAGS))='TOPDNR'	then	'TOPDNR'
WHEN	rtrim(ltrim(FLAGS))='UPPMID'	then	'UPPMID'
WHEN	rtrim(ltrim(FLAGS))='YEARST'	then	'YEARST'
WHEN	rtrim(ltrim(FLAGS))='ZOZOZO'	then	'LOCPRM'
end 																				as rC_Bios__Code_Value__c


,CASE rtrim(ltrim(FLAGS))
WHEN	'ADBDHQ'	then	'DHQ'
WHEN	'CASELD'	then	'Case Load'
WHEN	'EFTDNR'	then	'EFT'
WHEN	'ANGEL'		then	'Green Bay'
WHEN	'ELITED'	then	'Elite'
WHEN	'LOWMID'	then	'Lower Middle'
WHEN	'MSPSED'	then	'TrueSense Marketing'
WHEN	'PLDROP'	then	'TrueSense - FOTA'
WHEN	'PLQUIT'	then	'TrueSense - FOTA'
WHEN	'TOPDNR'	then	'Top Donor'
WHEN	'UPPMID'	then	'Upper Middle'
WHEN 	 'PLACTV' THEN 'TrueSense - FOTA'
WHEN 	 'PLDROP' THEN 'TrueSense - FOTA'
WHEN 	 'PLQUIT' THEN 'TrueSense - FOTA'
WHEN 	 'ZOZOZO' THEN 'Permanent'

End 																			as Type

,CASE rtrim(ltrim(flags))
WHEN	'ADBAPL'	THEN	'C'+'N3APL'
WHEN	'ADBFDL'	THEN	'C'+'N3FDL'
WHEN	'ADBGBY'	THEN	'C'+'N3GBY'
WHEN	'ADBKEN'	THEN	'C'+'N3KEN'
WHEN	'ADBLAC'	THEN	'C'+'N3LAC'
WHEN	'ADBMAD'	THEN	'C'+'N3MAD'
WHEN	'ADBSTP'	THEN	'C'+'N2POR'
WHEN	'ADBWAK'	THEN	'C'+'N3WAK'
WHEN	'ADPAPL'	THEN	'C'+'N3APL'
WHEN	'ADPGBY'	THEN	'C'+'N3GBY'
WHEN	'KROC'	    THEN	'C'+'N3GBY'
WHEN	'VOLGBY'	THEN	'C'+'N3GBY'
WHEN	'WAUXGB'	THEN	'C'+'N3GBY'
Else cast('' as nvarchar(100))
END 																			as service_location_code__c
,case rtrim(ltrim(FLAGS))

WHEN	'ELITED'	then	'a.id'
WHEN	'LOWMID'	then	'a.id'
WHEN	'MSPSED'	then	'a.id'
WHEN	'PLACTV'	then	'a.id'
WHEN	'PLDROP'	then	'a.id'
WHEN	'PLQUIT'	then	'a.id'
WHEN	'SEEDNM'	then	'a.id'
WHEN	'TOPDNR'	then	'a.id'
WHEN	'UPPMID'	then	'a.id'
WHEN	'YEARST'	then	'a.id'
end																				as accountId



,rtrim(ltrim(xx.donor2))														 as donor
,CASE rtrim(ltrim(Flags))
WHen 'PLDROP' THEN 'Dropped'
WHEN 'PLQUIT' THEN 'Quit'
ELSE ''
END 																				as rC_Bios__Subtype__c
,CAST('' as Float)																	as Amount__c

FROM 

(
SELECT donor2,seq,CAST(nomail_exp as nvarchar(255)) as nomail_exp,Split.a.value('.', 'VARCHAR(max)') AS Flags 
FROM (SELECT donor2, campaign,nomail_exp,seq,CAST ('<M>' + REPLACE(flags, ','
, '</M><M>') + '</M>' AS XML) AS 
String FROM [WUM_UAT1].dbo.DP) AS A CROSS APPLY String.nodes ('/M') AS Split(a)
---where charindex(',',campaign) > 0

)XX
left join
[Migration_WUM].dbo.Contact_Load c
on ltrim(rtrim(xx.donor2))=c.Donor

left join
[Migration_WUM].dbo.Account_Load_WUM a
on ltrim(rtrim(xx.donor2))=a.Donor


where right(c.External_Id__C,2)!='-2' and rtrim(ltrim(flags)) IN('ADBAPL','ADBDHQ','ADBFDL','ADBGBY','ADBKEN','ADBLAC','ADBMAD','ADBSTP','ADBWAK',	'ADPAPL','ADPGBY','ADVBRD','CASELD','EFTDNR','KROC','UNITED','VOLGBY','WAUXGB','ANGEL','MAILPR','NOELIT','NOLBLS','NOMGIN','SBDNC','CIVICC','KENCOC','KENROT','APPRCH','PGANTY','PLANDN','ELITED','LOWMID','MSPSED','PLACTV','PLDROP','PLQUIT','SEEDNM','TOPDNR','UPPMID','YEARST','ZOZOZO')


UNION


SELECT 
CAST('' as nchar(18))                                                  	As ID
,CAST('' as nvarchar(255))                                             	As Error
,'0053D000000IrLq'														As Ownerid
,CASE
WHEN rtrim(ltrim(d.Activity)) ='TTRM'THEN 'SEQ-'+rtrim(ltrim(p.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(p.donor2))+'Activity-'+'TTRM'
END 																as rC_Bios__External_ID__c
,(SELECT Id FROM [Migration_Target_QA].dbo.RecordType WHERE SobjectType = 'rC_Bios__Preference__c' AND Name = 'Standard') as RecordTypeId
,CASE rtrim(ltrim(d.Activity))
WHEN 'TTRM'  THEN c.id
END																	As ContactID

,'FALSE'																 	as rC_Bios__Active__c
,'FALSE'																As rC_Bios__Archive_Flag__c


,'CONFIRMED'															 as rC_Bios__Status__c
,NULL																		as rC_Bios__End_Date__c
,CAST(GETDATE()	as datetime2)																As rC_Bios__Start_Date__c



,CASE
WHEN rtrim(ltrim(d.Activity)) ='TTRM' then 'Communication Preference'
END as rC_Bios__category__c
,CASE
WHEN rtrim(ltrim(d.Activity)) ='TTRM' then 'No Donor Elite'
END																	 as rC_Bios__Subcategory__c

,CASE
WHEN rtrim(ltrim(d.Activity)) ='TTRM' then 'NOELIT'	
END				as rC_Bios__Code_Value__c

,CAST('' as nvarchar(100))											as [Type]
,CAST('' as nvarchar(100))											as service_location_code__c	
,CAST('' as  nvarchar(18))												As AccountId
,rtrim(ltrim(p.donor2)) 											as donor
,CAST('' as nvarchar(100))											AS rC_Bios__Subtype__c
,CAST('' as Float)																	as Amount__c

FROM

[WUM_UAT1].dbo.DPother2 d
inner join
[WUM_UAT1].dbo.DP p
On rtrim(ltrim(p.donor2))=rtrim(ltrim(d.donor))

left join
[Migration_WUM].dbo.Contact_Load c
on ltrim(rtrim(d.donor))=c.Donor

left join
[Migration_WUM].dbo.Account_Load_WUM a
on ltrim(rtrim(d.donor))=a.Donor


where right(c.External_Id__C,2)!='-2' and rtrim(ltrim(d.Activity))='TTRM'

UNION

SELECT 
CAST('' as nchar(18))                                                  	As ID
,CAST('' as nvarchar(255))                                             	As Error
,'0053D000000IrLq'														As Ownerid
,CASE

WHEn	rtrim(ltrim(reason))='AN'	then	 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'reason-'+'AN'
WHEn	rtrim(ltrim(reason))='BA'	then	 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'reason-'+'BA'
WHEn	rtrim(ltrim(reason))='CP'	then	 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'reason-'+'CP'
WHEn	rtrim(ltrim(reason))='DE'	then	 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'reason-'+'DE'
WHEn	rtrim(ltrim(reason))='DR'	then	 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'reason-'+'DR'
WHEn	rtrim(ltrim(reason))='HQ'	then	 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'reason-'+'HQ'
WHEn	rtrim(ltrim(reason))='HT'	then	 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'reason-'+'HT'
WHEn	rtrim(ltrim(reason))='IH'	then	 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'reason-'+'IH'
WHEn	rtrim(ltrim(reason))='KT'	then	 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'reason-'+'KT'
WHEn	rtrim(ltrim(reason))='MV'	then	 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'reason-'+'MV'
WHEn	rtrim(ltrim(reason))='OB'	then	 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'reason-'+'OB'
WHEn	rtrim(ltrim(reason))='PL'	then	 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'reason-'+'PL'
WHEn	rtrim(ltrim(reason))='SU'	then	 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'reason-'+'SU'
WHEn	rtrim(ltrim(Thank))='0'		then	 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'Thank-'+'0'
WHEn	rtrim(ltrim(NOMAIL))='1'	then	 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'Nomail-'+'1'
WHEn	rtrim(ltrim(TELEMARK))='0'	then	 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'Telemark-'+'0'
WHEn	rtrim(ltrim(NOEMAIL))='1'	then	 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'NoEmail-'+'1'
WHEn	rtrim(ltrim(REASON))='TP'	then	 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'REASON-'+'TP'
WHEn	rtrim(ltrim(REASON))='VL'	then	 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'REASON-'+'VL'
WHEn	rtrim(ltrim(REASON))='XX'	then	 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'REASON-'+'XX'
WHEn	rtrim(ltrim(OV_IPA))='0'	then	 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'OV_IPA-'+'0'
WHEn	rtrim(ltrim(OV_IPA))='1'	then	 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'OV_IPA-'+'1'
WHEn	rtrim(ltrim(OV_IPA))='2'	then	 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'OV_IPA-'+'2'
WHEn	rtrim(ltrim(OV_IPA))='3'	then	 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'OV_IPA-'+'3'
WHEn	rtrim(ltrim(OV_IPA))='4'	then	 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'OV_IPA-'+'4'
WHEn	rtrim(ltrim(OV_IPA))='5'	then	 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'OV_IPA-'+'5'
WHEn	rtrim(ltrim(OV_IPA))='6'	then	 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'OV_IPA-'+'6'
WHEn	rtrim(ltrim(OV_IPA))='7'	then	 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'OV_IPA-'+'7'
WHEn	rtrim(ltrim(OV_IPA))='8'	then	 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'OV_IPA-'+'8'
WHEn	rtrim(ltrim(OV_IPA))='9'	then	 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'OV_IPA-'+'9'
WHEn	rtrim(ltrim(OV_IPA))='10'	then	 'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'OV_IPA-'+'10'


END																		rC_Bios__External_ID__c
,(SELECT Id FROM [Migration_Target_QA].dbo.RecordType WHERE SobjectType = 'rC_Bios__Preference__c' AND Name = 'Standard') as RecordTypeId
,CASE
WHEn	rtrim(ltrim(reason))='AN'	then	c.ID
WHEn	rtrim(ltrim(reason))='BA'	then	c.ID
WHEn	rtrim(ltrim(reason))='CP'	then	c.ID
WHEn	rtrim(ltrim(reason))='DE'	then	c.ID
WHEn	rtrim(ltrim(reason))='DR'	then	c.ID
WHEn	rtrim(ltrim(reason))='HQ'	then	c.ID
WHEn	rtrim(ltrim(reason))='HT'	then	c.ID
WHEn	rtrim(ltrim(reason))='IH'	then	c.ID
WHEn	rtrim(ltrim(reason))='MV'	then	c.ID
WHEn	rtrim(ltrim(reason))='OB'	then	c.ID
WHEn	rtrim(ltrim(reason))='PL'	then	c.ID
WHEn	rtrim(ltrim(reason))='SU'	then	c.ID
WHEn	rtrim(ltrim(Thank))='0'		then	c.ID
WHEn	rtrim(ltrim(NOMAIL))='1'	then	c.ID
WHEn	rtrim(ltrim(TELEMARK))='0'	then	c.ID
WHEn	rtrim(ltrim(NOEMAIL))='1'	then	c.ID
WHEn	rtrim(ltrim(REASON))='TP'	then	c.ID
WHEn	rtrim(ltrim(REASON))='VL'	then	c.ID
WHEn	rtrim(ltrim(REASON))='XX'	then	c.ID
WHEn	rtrim(ltrim(REASON))='KT'	then	c.ID

END																						as ContactID
,'FALSE'																 					as rC_Bios__Active__c
,'FALSE'																					As rC_Bios__Archive_Flag__c


,'CONFIRMED'																				 as rC_Bios__Status__c
,CASE  
WHEN    rtrim(ltrim(reason))='AN'   AND rtrim(ltrim(xx.nomail_exp))!='1899-12-30 00:00:00.0000000' THEN 	rtrim(ltrim(xx.nomail_exp))
WHEN 	rtrim(ltrim(reason))='BA'	AND rtrim(ltrim(xx.nomail_exp))!='1899-12-30 00:00:00.0000000' THEN 	rtrim(ltrim(xx.nomail_exp))
WHEN 	rtrim(ltrim(reason))='CP'	AND rtrim(ltrim(xx.nomail_exp))!='1899-12-30 00:00:00.0000000' THEN 	rtrim(ltrim(xx.nomail_exp))
WHEN 	rtrim(ltrim(reason))='DE'	AND rtrim(ltrim(xx.nomail_exp))!='1899-12-30 00:00:00.0000000' THEN 	rtrim(ltrim(xx.nomail_exp))
WHEN 	rtrim(ltrim(reason))='DR'	AND rtrim(ltrim(xx.nomail_exp))!='1899-12-30 00:00:00.0000000' THEN 	rtrim(ltrim(xx.nomail_exp))
WHEN 	rtrim(ltrim(reason))='HQ'	AND rtrim(ltrim(xx.nomail_exp))!='1899-12-30 00:00:00.0000000' THEN 	rtrim(ltrim(xx.nomail_exp))
WHEN 	rtrim(ltrim(reason))='HT'	AND rtrim(ltrim(xx.nomail_exp))!='1899-12-30 00:00:00.0000000' THEN 	rtrim(ltrim(xx.nomail_exp))
WHEN 	rtrim(ltrim(reason))='IH'	AND rtrim(ltrim(xx.nomail_exp))!='1899-12-30 00:00:00.0000000' THEN 	rtrim(ltrim(xx.nomail_exp))
WHEN 	rtrim(ltrim(reason))='KT'	AND rtrim(ltrim(xx.nomail_exp))!='1899-12-30 00:00:00.0000000' THEN 	rtrim(ltrim(xx.nomail_exp))
WHEN 	rtrim(ltrim(reason))='MV'	AND rtrim(ltrim(xx.nomail_exp))!='1899-12-30 00:00:00.0000000' THEN 	rtrim(ltrim(xx.nomail_exp))
WHEN 	rtrim(ltrim(reason))='OB'	AND rtrim(ltrim(xx.nomail_exp))!='1899-12-30 00:00:00.0000000' THEN 	rtrim(ltrim(xx.nomail_exp))
WHEN 	rtrim(ltrim(reason))='PL'	AND rtrim(ltrim(xx.nomail_exp))!='1899-12-30 00:00:00.0000000' THEN 	rtrim(ltrim(xx.nomail_exp))
WHEN 	rtrim(ltrim(reason))='SU'	AND rtrim(ltrim(xx.nomail_exp))!='1899-12-30 00:00:00.0000000' THEN 	rtrim(ltrim(xx.nomail_exp))
WHEN 	rtrim(ltrim(NOMAIL))='1'	AND rtrim(ltrim(xx.nomail_exp))!='1899-12-30 00:00:00.0000000' THEN 	rtrim(ltrim(xx.nomail_exp))
WHEN 	rtrim(ltrim(reason))='TP'	AND rtrim(ltrim(xx.nomail_exp))!='1899-12-30 00:00:00.0000000' THEN 	rtrim(ltrim(xx.nomail_exp))
WHEN 	rtrim(ltrim(reason))='VL'	AND rtrim(ltrim(xx.nomail_exp))!='1899-12-30 00:00:00.0000000' THEN 	rtrim(ltrim(xx.nomail_exp))
WHEN 	rtrim(ltrim(reason))='XX'	AND rtrim(ltrim(xx.nomail_exp))!='1899-12-30 00:00:00.0000000' THEN 	rtrim(ltrim(xx.nomail_exp))


END 																	as rC_Bios__End_Date__c
,CAST(GETDATE()	as datetime2)																as rC_Bios__start_Date__c



,CASE
WHEn	rtrim(ltrim(reason))='AN'	then	'Communication Preference'
WHEn	rtrim(ltrim(reason))='BA'	then	'Communication Preference'
WHEn	rtrim(ltrim(reason))='CP'	then	'Communication Preference'
WHEn	rtrim(ltrim(reason))='DE'	then	'Communication Preference'
WHEn	rtrim(ltrim(reason))='DR'	then	'Communication Preference'
WHEn	rtrim(ltrim(reason))='HQ'	then	'Communication Preference'
WHEn	rtrim(ltrim(reason))='HT'	then	'Communication Preference'
WHEn	rtrim(ltrim(reason))='IH'	then	'Communication Preference'
WHEn	rtrim(ltrim(reason))='KT'	then	'Communication Preference'
WHEn	rtrim(ltrim(reason))='MV'	then	'Communication Preference'
WHEn	rtrim(ltrim(reason))='OB'	then	'Communication Preference'
WHEn	rtrim(ltrim(reason))='PL'	then	'Communication Preference'
WHEn	rtrim(ltrim(reason))='SU'	then	'Communication Preference'
WHEn	rtrim(ltrim(THANK))='0'		then	'Communication Preference'
WHEn	rtrim(ltrim(NOMAIL))='1'	then	'Communication Preference'
WHEn	rtrim(ltrim(TELEMARK))='0'	then	'Communication Preference'
WHEn	rtrim(ltrim(NOEMAIL))='1'	then	'Communication Preference'
WHEn	rtrim(ltrim(reason))='TP'	then	'Communication Preference'
WHEn	rtrim(ltrim(reason))='VL'	then	'Communication Preference'
WHEn	rtrim(ltrim(reason))='XX'	then	'Communication Preference'
WHEn	rtrim(ltrim(OV_IPA))='0'	then	'Ratings'
WHEn	rtrim(ltrim(OV_IPA))='1'	then	'Ratings'
WHEn	rtrim(ltrim(OV_IPA))='2'	then	'Ratings'
WHEn	rtrim(ltrim(OV_IPA))='3'	then	'Ratings'
WHEn	rtrim(ltrim(OV_IPA))='4'	then	'Ratings'
WHEn	rtrim(ltrim(OV_IPA))='5'	then	'Ratings'
WHEn	rtrim(ltrim(OV_IPA))='6'	then	'Ratings'
WHEn	rtrim(ltrim(OV_IPA))='7'	then	'Ratings'
WHEn	rtrim(ltrim(OV_IPA))='8'	then	'Ratings'
WHEn	rtrim(ltrim(OV_IPA))='9'	then	'Ratings'
WHEn	rtrim(ltrim(OV_IPA))='10'	then	'Ratings'

END																										as rC_Bios__category__c

,CASE
WHEn	rtrim(ltrim(reason))='AN'	then	'No Mail'
WHEn	rtrim(ltrim(reason))='BA'	then	'No Mail'
WHEn	rtrim(ltrim(reason))='CP'	then	'No Mail'
WHEn	rtrim(ltrim(reason))='DE'	then	'No Mail'
WHEn	rtrim(ltrim(reason))='DR'	then	'No Mail'
WHEn	rtrim(ltrim(reason))='HQ'	then	'No Mail'
WHEn	rtrim(ltrim(reason))='HT'	then	'No Mail'
WHEn	rtrim(ltrim(reason))='IH'	then	'No Mail'
WHEn	rtrim(ltrim(reason))='KT'	then	'No Mail'
WHEn	rtrim(ltrim(reason))='MV'	then	'No Mail'
WHEn	rtrim(ltrim(reason))='OB'	then	'No Mail'
WHEn	rtrim(ltrim(reason))='PL'	then	'No Mail'
WHEn	rtrim(ltrim(reason))='SU'	then	'No Mail'
WHEn	rtrim(ltrim(THANK))='0'		then	'No Thank You'
WHEn	rtrim(ltrim(NOMAIL))='1'	then	'No Mail'
WHEn	rtrim(ltrim(TELEMARK))='0'	then	'No Telemarketing'
WHEn	rtrim(ltrim(NOEMAIL))='1'	then	'No Email'
WHEn	rtrim(ltrim(reason))='TP'	then	'No Mail'
WHEn	rtrim(ltrim(reason))='VL'	then	'No Mail'
WHEn	rtrim(ltrim(reason))='XX'	then	'No Mail'
WHEn	rtrim(ltrim(OV_IPA))='0'	then	'Income Range'
WHEn	rtrim(ltrim(OV_IPA))='1'	then	'Income Range'
WHEn	rtrim(ltrim(OV_IPA))='2'	then	'Income Range'
WHEn	rtrim(ltrim(OV_IPA))='3'	then	'Income Range'
WHEn	rtrim(ltrim(OV_IPA))='4'	then	'Income Range'
WHEn	rtrim(ltrim(OV_IPA))='5'	then	'Income Range'
WHEn	rtrim(ltrim(OV_IPA))='6'	then	'Income Range'
WHEn	rtrim(ltrim(OV_IPA))='7'	then	'Income Range'
WHEn	rtrim(ltrim(OV_IPA))='8'	then	'Income Range'
WHEn	rtrim(ltrim(OV_IPA))='9'	then	'Income Range'
WHEn	rtrim(ltrim(OV_IPA))='10'	then	'Income Range'

END 																						as rC_Bios__subcategory__c

,CASE
WHEn	rtrim(ltrim(reason))='AN'	then	'AN'
WHEn	rtrim(ltrim(reason))='BA'	then	'BA'
WHEn	rtrim(ltrim(reason))='CP'	then	'CP'
WHEn	rtrim(ltrim(reason))='DE'	then	'DE'
WHEn	rtrim(ltrim(reason))='DR'	then	'DR'
WHEn	rtrim(ltrim(reason))='HQ'	then	'DS'
WHEn	rtrim(ltrim(reason))='HT'	then	'HT'
WHEn	rtrim(ltrim(reason))='IH'	then	'IH'
WHEn	rtrim(ltrim(reason))='KT'	then	'DS'
WHEn	rtrim(ltrim(reason))='MV'	then	'MV'
WHEn	rtrim(ltrim(reason))='OB'	then	'OB'
WHEn	rtrim(ltrim(reason))='PL'	then	'FOTA'
WHEn	rtrim(ltrim(reason))='SU'	then	'SU'
WHEn	rtrim(ltrim(THANK))='0'		then	'NoThankyou'
WHEn	rtrim(ltrim(NOMAIL))='1'	then	'NOMAIL'
WHEn	rtrim(ltrim(TELEMARK))='0'	then	'NOTELEMARK'
WHEn	rtrim(ltrim(NOEMAIL))='1'	then	'NOEMAIL'
WHEn	rtrim(ltrim(reason))='TP'	then	'TP'
WHEn	rtrim(ltrim(reason))='VL'	then	'VL'
WHEn	rtrim(ltrim(reason))='XX'	then	'XX'
WHEn	rtrim(ltrim(OV_IPA))='0'	then	'0'
WHEn	rtrim(ltrim(OV_IPA))='1'	then	'1'
WHEn	rtrim(ltrim(OV_IPA))='2'	then	'2'
WHEn	rtrim(ltrim(OV_IPA))='3'	then	'3'
WHEn	rtrim(ltrim(OV_IPA))='4'	then	'4'
WHEn	rtrim(ltrim(OV_IPA))='5'	then	'5'
WHEn	rtrim(ltrim(OV_IPA))='6'	then	'6'
WHEn	rtrim(ltrim(OV_IPA))='7'	then	'7'
WHEn	rtrim(ltrim(OV_IPA))='8'	then	'8'
WHEn	rtrim(ltrim(OV_IPA))='9'	then	'9'
WHEn	rtrim(ltrim(OV_IPA))='10'	then	'10'
END																								rC_Bios__Code_Value__c


,CASE
WHEn	rtrim(ltrim(reason))='AN'	then	'Anonymous'
WHEn	rtrim(ltrim(reason))='BA'	then	'Bad Address'
WHEn	rtrim(ltrim(reason))='CP'	then	'Corporate Partner'
WHEn	rtrim(ltrim(reason))='DE'	then	'Deceased'
WHEn	rtrim(ltrim(reason))='DR'	then	'Donor Request'
WHEn	rtrim(ltrim(reason))='HQ'	then	'Disaster'
WHEn	rtrim(ltrim(reason))='HT'	then	'Hard Times'
WHEn	rtrim(ltrim(reason))='IH'	then	'In-House Decision'
WHEn	rtrim(ltrim(reason))='KT'	then	'Disaster'
WHEn	rtrim(ltrim(reason))='MV'	then	'Moved'
WHEn	rtrim(ltrim(reason))='OB'	then	'Out of business'
WHEn	rtrim(ltrim(reason))='PL'	then	'FOTA'
WHEn	rtrim(ltrim(reason))='SU'	then	'Sustainer'
WHEn	rtrim(ltrim(THANK))='0'		then	''
WHEn	rtrim(ltrim(Nomail))='1'	then	''
WHEn	rtrim(ltrim(TELEMARK))='0'	then	''
WHEn	rtrim(ltrim(Noemail))='1'	then	''
WHEn	rtrim(ltrim(reason))='TP'	then	'Temporary'
WHEn	rtrim(ltrim(reason))='VL'	then	'Volunteer'
WHEn	rtrim(ltrim(reason))='XX'	then	'No Contact'
WHEn	rtrim(ltrim(OV_IPA))='0'	then	'OV_IPA Unknown'
WHEn	rtrim(ltrim(OV_IPA))='1'	then	'OV_IPA Less Than $25,000'
WHEn	rtrim(ltrim(OV_IPA))='2'	then	'OV_IPA $25,000 to $49,999'
WHEn	rtrim(ltrim(OV_IPA))='3'	then	'OV_IPA $50,000 to $74,999'
WHEn	rtrim(ltrim(OV_IPA))='4'	then	'OV_IPA $75,000 to $99,999'
WHEn	rtrim(ltrim(OV_IPA))='5'	then	'OV_IPA $100,000 to $249,999'
WHEn	rtrim(ltrim(OV_IPA))='6'	then	'OV_IPA $250,000 to $499,999'
WHEn	rtrim(ltrim(OV_IPA))='7'	then	'OV_IPA $500,000 to $749,999'
WHEn	rtrim(ltrim(OV_IPA))='8'	then	'OV_IPA $750,000 to $999,999'
WHEn	rtrim(ltrim(OV_IPA))='9'	then	'OV_IPA $1,000,000 to $1,999,999'
WHEn	rtrim(ltrim(OV_IPA))='10'	then	'OV_IPA $2,000,000+'
END 																as [type]
,CAST('' as nvarchar(100))											as service_location_code__c	
,CASE rtrim(ltrim(OV_IPA))
WHEN '0' 	then a.ID
WHEN '1' 	then a.ID
WHEN '2'	then a.ID
WHEN '3'    then a.ID
WHEN '4'    then a.ID
WHEN '5'    then a.ID
WHEN '6'    then a.ID
WHEN '7'    then a.ID
WHEN '8'    then a.ID
WHEN '9'    then a.ID
WHEN '10'	then a.ID

END 																	as AccountId

,rtrim(ltrim(xx.Donor2)) 											as donor
,CAST('' as nvarchar(100))											AS rC_Bios__Subtype__c
,CAST('' as Float)																	as Amount__c
FROM
[WUM_UAT1].dbo.DP xx
left join
[Migration_WUM].dbo.Contact_Load c
on ltrim(rtrim(xx.donor2))=c.Donor

left join
[Migration_WUM].dbo.Account_Load_WUM a
on ltrim(rtrim(xx.donor2))=a.Donor


where right(c.External_Id__C,2)!='-2'
and (rtrim(ltrim(xx.reason))IN('AN','BA','CP','DE','DR','HT','IH','MV','OB','PL','SU','TP','VL','XX','HQ','KT') 
OR rtrim(ltrim(xx.Thank))='0' OR rtrim(ltrim(xx.Nomail))='1' OR 
rtrim(ltrim(xx.noemail))='1'  OR rtrim(ltrim(TELEMARK))='0'OR rtrim(ltrim(xx.OV_IPA))IN('0','1','2','3','4','5','6','7','8','9','10'))
And rtrim(ltrim(xx.reason))!=''And rtrim(ltrim(xx.OV_IPA))!=''

Union

SELECT 
CAST('' as nchar(18))                                                  	As ID
,CAST('' as nvarchar(255))                                             	As Error
,'0053D000000IrLq'														As Ownerid
,'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))    as rC_Bios__External_ID__c
,(SELECT Id FROM [Migration_Target_QA].dbo.RecordType WHERE SobjectType = 'rC_Bios__Preference__c' AND Name = 'Standard') as RecordTypeId
,CAST('' as nvarchar(18))												as ContactID
,'False'																as rC_Bios__Active__c
,'FALSE'																					As rC_Bios__Archive_Flag__c

,'CONFIRMED'																				 as rC_Bios__Status__c
,CASE
when rtrim(ltrim(xx.nomail_exp))!='1899-12-30 00:00:00.0000000' THEN 	rtrim(ltrim(xx.nomail_exp))
END 																			As rC_Bios__End_Date__c
,CASE rtrim(ltrim(g.start_Dt))
WHEN CAST('1899-12-30 00:00:00.0000000' as datetime2)  THEN NULL
ELSE rtrim(ltrim(g.start_Dt))
END																		as rC_Bios__start_Date__c
,'Vendor Program Flags'													AS rC_Bios__category__c
,'Pledge'																AS rC_Bios__subcategory__c	
,CAST('' as nvarchar(100))												as rC_Bios__Code_Value__c	
,'TrueSense - FOTA'														as [type]
,CAST('' as nvarchar(100))												as service_location_code__c
,a.id 																	as accountID
,rtrim(ltrim(xx.donor2))												as Donor
,CASE rtrim(ltrim(g.freq))
WHEN '2' THEN ''
WHEN '?' THEN  ''
WHEN 'A' THEN 'Annually'
WHEN 'M' THEN 'Monthly'
WHEN 'Q' THEN 'Quarterly'
WHEN 'S' THEN 'Semi-Annually'
WHEN 'Z' THEN ''
WHEN 'P' THEN '' 
WHEN 'U' THEN '' 

END																		as rC_Bios__Subtype__c
,rtrim(ltrim(g.Bill))													as Amount__c

FROM [WUM_UAT1].dbo.DPgift g
Left join
[WUM_UAT1].dbo.DP xx
on rtrim(ltrim(g.donor))=rtrim(ltrim(xx.donor2))
Left join
[Migration_WUM].dbo.Account_Load_WUM a
on ltrim(rtrim(g.donor))=a.Donor
where
rectype = 'P' and GIFTTYPE != 'IK' and writeoff = '1' AND substring(sol,3,6) in ('pl9999', 'pI9999')



Union

SELECT 
CAST('' as nchar(18))                                                  	As ID
,CAST('' as nvarchar(255))                                             	As Error
,'0053D000000IrLq'														As Ownerid
,'SEQ-'+rtrim(ltrim(xx.seq))+'WUM-'+'DONOR-'+rtrim(ltrim(xx.donor2))    as rC_Bios__External_ID__c
,(SELECT Id FROM [Migration_Target_QA].dbo.RecordType WHERE SobjectType = 'rC_Bios__Preference__c' AND Name = 'Standard') as RecordTypeId
,CAST('' as nvarchar(18))												as ContactID
,'TRUE'																	as rC_Bios__Active__c
,'FALSE'																As rC_Bios__Archive_Flag__c

,'CONFIRMED'															 as rC_Bios__Status__c
,CASE
when rtrim(ltrim(xx.nomail_exp))!='1899-12-30 00:00:00.0000000' THEN 	rtrim(ltrim(xx.nomail_exp))
END 																	As rC_Bios__End_Date__c
,CASE rtrim(ltrim(g.start_Dt))
WHEN CAST('1899-12-30 00:00:00.0000000' as datetime2) THEN NULL
ELSE rtrim(ltrim(g.start_Dt))
END																		as rC_Bios__start_Date__c
,'Vendor Program Flags'													AS rC_Bios__category__c
,'Pledge'																AS rC_Bios__subcategory__c	
,CAST('' as nvarchar(100))												as rC_Bios__Code_Value__c	
,'TrueSense - FOTA'														as [type]
,CAST('' as nvarchar(100))												as service_location_code__c
,a.id 																	as accountID
,rtrim(ltrim(xx.donor2))												as Donor
,CASE rtrim(ltrim(g.freq))
WHEN '2' THEN ''
WHEN '?' THEN  ''
WHEN 'A' THEN 'Annually'
WHEN 'M' THEN 'Monthly'
WHEN 'Q' THEN 'Quarterly'
WHEN 'S' THEN 'Semi-Annually'
WHEN 'Z' THEN ''
WHEN 'P' THEN '' 
WHEN 'U' THEN '' 

END																		as rC_Bios__Subtype__c,
rtrim(ltrim(g.Bill))													as Amount__c

FROM [WUM_UAT1].dbo.DPgift g
Left join
[WUM_UAT1].dbo.DP xx
on rtrim(ltrim(g.donor))=rtrim(ltrim(xx.donor2))
Left join
[Migration_WUM].dbo.Account_Load_WUM a
on ltrim(rtrim(g.donor))=a.Donor
where
rectype = 'P' and GIFTTYPE != 'IK' and writeoff = '0' AND substring(sol,3,6) in ('pl9999', 'pI9999')

)yy


---------------------------

--insert records

-- use [Migration_WUM]
-- Exec SF_BulkOps 'Insert:bulkapi,Parallel,Batchsize(10000)', 'TSAC_MIGR', 'rC_Bios__Preference__c'
 
----------------------------------------------------------------
---check errors

--select count(*) from [DEMO].dbo.[rC_Bios__Preference__c] where id=''





-- Replicate Data
--use [Migration_Target_QA]
--exec SF_Refresh 'TSAC_MIGR', 'rC_Bios__Preference__c','yes'