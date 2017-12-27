--Drop table

DROP table [Migration_Metro].dbo.rC_Bios__Preference__c

Select * Into [Migration_Metro].dbo.rC_Bios__Preference__c
FROM(
SELECT 
CAST('' as nchar(18))                                                  	As ID
,CAST('' as nvarchar(255))                                             	As Error
,'0053D000000IrLF'														As Ownerid
,(SELECT Id FROM [Migration_Target_QA].dbo.RecordType WHERE SobjectType = 'rC_Bios__Preference__c' AND Name = 'Standard') as RecordTypeId
,CASE rtrim(ltrim(xx.Flags)) 

WHEN	'AG'	Then	c.id
WHEN	'AP'	Then	c.id
WHEN	'CH'	Then	c.id
WHEN	'EA'	Then	c.id
WHEN	'FB'	Then	c.id
WHEN	'JA'	Then	c.id
WHEN	'JL'	Then	c.id
WHEN	'JN'	Then	c.id
WHEN	'MR'	Then	c.id
WHEN	'MY'	Then	c.id
WHEN	'NV'	Then	c.id
WHEN	'OC'	Then	c.id
WHEN	'SB'	Then	c.id
---WHEN	'SP'	Then	c.id
WHEN	'TH'	Then	c.id
WHEN	'YE'	Then	c.id
WHEN	'ADC'	Then	c.id
WHEN	'AFC'	Then	c.id
WHEN	'AGC'	Then	c.id
WHEN	'ANY'	Then	c.id
WHEN	'APC'	Then	c.id
WHEN	'AVB'	Then	c.id
WHEN	'AVS'	Then	c.id
WHEN	'BMC'	Then	c.id
WHEN	'CAB'	Then	c.id
WHEN	'CAC'	Then	c.id
WHEN	'CASELD'Then	c.id
WHEN	'COC'	Then	c.id
WHEN	'MDA'	Then	c.id
WHEN	'RLG'	Then	c.id
WHEN	'SEED'	Then	c.id
WHEN	'SSR'	Then	c.id
WHEN	'VDD'	Then	c.id
WHEN	'WAE'	Then	c.id
WHEN	'WAU'	Then	c.id
WHEN	'WBS'	Then	c.id
WHEN	'L16'	Then	c.id
WHEN	'NKN'	Then	c.id
WHEN	'WBA'	Then	c.id
WHEN	'WBC'	Then	c.id
WHEN	'WBD'	Then	c.id
WHEN	'WBO'	Then	c.id
WHEN	'LWC'	Then	c.id
WHEN	'DNG'	Then	c.id
WHEN	'DNI'	Then	c.id
WHEN	'DNN'	Then	c.id
WHEN	'DNO'	Then	c.id
WHEN	'DNP'	Then	c.id
WHEN	'DNT'	Then	c.id
WHEN	'NNS'	Then	c.id
WHEN	'NOMGIN'Then	c.id
WHEN	'SQA'	Then	c.id
WHEN	'DST'	Then	c.id
WHEN	'LNM'	Then	c.id
WHEN	'MEM'	Then	c.id
WHEN	'PRS'	Then	c.id
WHEN	'RTY'	Then	c.id
WHEN	'SLA'	Then	c.id
WHEN	'SOE'	Then	c.id
WHEN	'CPL'	Then	c.id
WHEN	'MPC'	Then	c.id
WHEN	'MPG'	Then	c.id
WHEN	'MPT'	Then	c.id
WHEN	'PGP'	Then	c.id
WHEN	'PGA'	Then	c.id
WHEN	'PGB'	Then	c.id
WHEN	'PGC'	Then	c.id
WHEN	'PGD'	Then	c.id
WHEN	'PGI'	Then	c.id
WHEN	'PGN'	Then	c.id
WHEN	'PGT'	Then	c.id
WHEN	'PGV'	Then	c.id
WHEN	'PGW'	Then	c.id


END																		AS ContactID

,case rtrim(ltrim(xx.flags))
WHEN	'ZOZ'		Then	a.id
WHEN	'ELITED'	Then	a.id
WHEN	'LOWMID'	Then	a.id
WHEN	'MLCTRA'	Then	a.id
WHEN	'MLCTRB'	Then	a.id
WHEN	'MLCTRC'	Then	a.id
WHEN	'MLCTRD'	Then	a.id
WHEN	'MLTS1A'	Then	a.id
WHEN	'MLTS1B'	Then	a.id
WHEN	'MLTS1C'	Then	a.id
WHEN	'MLTS1D'	Then	a.id
WHEN	'MLTS2A'	Then	a.id
WHEN	'MLTS2B'	Then	a.id
WHEN	'MLTS2C'	Then	a.id
WHEN	'MLTS2D'	Then	a.id
WHEN	'NOARRY'	Then	a.id
WHEN	'NOELIT'	Then	a.id
WHEN	'NOFOLL'	Then	a.id
WHEN	'NOLBLS'	Then	a.id
WHEN	'PLACTV'	Then	a.id
WHEN	'PLDROP'	Then	a.id
WHEN	'PLQUIT'	Then	a.id
WHEN	'UPPMID'	Then	a.id
WHEN	'YEARST'	Then	a.id
end																		As accountID

,CASE rtrim(ltrim(xx.Flags))
WHEN 'AVS' THEN 'FALSE'
WHEN 'PLDROP' THEN 'False'
WHEN 'PLQUIT'  THEN 'False'
ELSE 'TRUE'
END 																 	as rC_Bios__Active__c																
,'FALSE'																As rC_Bios__Archive_Flag__c

,CASE 

WHEN  rtrim(ltrim(FLAGS))='AG'  THEN'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'Campaign-'+'AG'
WHEN  rtrim(ltrim(FLAGS))='AP'  THEN'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'Campaign-'+'AP'
WHEN  rtrim(ltrim(FLAGS))='CH'  THEN'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'Campaign-'+'CH'
WHEN  rtrim(ltrim(FLAGS))='EA'  THEN'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'Campaign-'+'EA'
WHEN  rtrim(ltrim(FLAGS))='FB'  THEN'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'Campaign-'+'FB'
WHEN  rtrim(ltrim(FLAGS))='JA'  THEN'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'Campaign-'+'JA'
WHEN  rtrim(ltrim(FLAGS))='JL'  THEN'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'Campaign-'+'JL'
WHEN  rtrim(ltrim(FLAGS))='JN'  THEN'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'Campaign-'+'JN'
WHEN  rtrim(ltrim(FLAGS))='MR'  THEN'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'Campaign-'+'MR'
WHEN  rtrim(ltrim(FLAGS))='MY'  THEN'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'Campaign-'+'MY'
WHEN  rtrim(ltrim(FLAGS))='NV'  THEN'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'Campaign-'+'NV'
WHEN  rtrim(ltrim(FLAGS))='OC'  THEN'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'Campaign-'+'OC'
WHEN  rtrim(ltrim(FLAGS))='SB'  THEN'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'Campaign-'+'SB'
---WHEN  rtrim(ltrim(FLAGS))='SP'  THEN'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'Campaign-'+'SP'
WHEN  rtrim(ltrim(FLAGS))='TH'  THEN'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'Campaign-'+'TH'
WHEN  rtrim(ltrim(FLAGS))='YE'  THEN'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'Campaign-'+'YE'
WHEN  rtrim(ltrim(FLAGS))='ADC'  THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'ADC'
WHEN  rtrim(ltrim(FLAGS))='AFC'  THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'AFC'
WHEN  rtrim(ltrim(FLAGS))='AGC'  THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'AGC'
WHEN  rtrim(ltrim(FLAGS))='ANY'  THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'ANY'
WHEN  rtrim(ltrim(FLAGS))='APC'  THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'APC'
WHEN  rtrim(ltrim(FLAGS))='AVB'  THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'AVB'
WHEN  rtrim(ltrim(FLAGS))='AVS'  THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'AVS'
WHEN  rtrim(ltrim(FLAGS))='BMC'  THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'BMC'
WHEN  rtrim(ltrim(FLAGS))='CAB'  THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'CAB'
WHEN  rtrim(ltrim(FLAGS))='CAC'  THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'CAC'
WHEN  rtrim(ltrim(FLAGS))='CASELD' THEN'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'CASELD'
WHEN  rtrim(ltrim(FLAGS))='COC'  THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'COC' 
WHEN  rtrim(ltrim(FLAGS))='MDA'  THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'MDA' 
WHEN  rtrim(ltrim(FLAGS))='RLG'  THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'RLG' 
WHEN  rtrim(ltrim(FLAGS))='SEED' THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'SEED' 
WHEN  rtrim(ltrim(FLAGS))='SSR'  THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'SSR' 
WHEN  rtrim(ltrim(FLAGS))='VDD'  THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'LAG-'+'VDD' 
WHEN  rtrim(ltrim(FLAGS))='WAE'  THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'WAE' 
WHEN  rtrim(ltrim(FLAGS))='WAU'  THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'WAU' 
WHEN  rtrim(ltrim(FLAGS))='WBS'  THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'WBS' 
WHEN  rtrim(ltrim(FLAGS))='L16'  THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'L16' 
WHEN  rtrim(ltrim(FLAGS))='NKN'  THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'NKN' 
WHEN  rtrim(ltrim(FLAGS))='WBA'  THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'WBA' 
WHEN  rtrim(ltrim(FLAGS))='WBC'  THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'WBC' 
WHEN  rtrim(ltrim(FLAGS))='WBD'  THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'WBD' 
WHEN  rtrim(ltrim(FLAGS))='WBO'  THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'WBO' 
WHEN  rtrim(ltrim(FLAGS))='LWC'  THEN 'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'LWC' 
WHEN  rtrim(ltrim(FLAGS))='DST'  THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'DST'
WHEN  rtrim(ltrim(FLAGS))='LNM'  THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'LNM'
WHEN  rtrim(ltrim(FLAGS))='MEM'  THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'MEM'
WHEN  rtrim(ltrim(FLAGS))='PRS'  THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'PRS'
WHEN  rtrim(ltrim(FLAGS))='RTY'  THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'RTY'
WHEN  rtrim(ltrim(FLAGS))='SLA'  THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'SLA'
WHEN  rtrim(ltrim(FLAGS))='SOE'  THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'SOE'
WHEN  rtrim(ltrim(FLAGS))='CPL'  THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'CPL'
WHEN  rtrim(ltrim(FLAGS))='MPC'  THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'MPC'
WHEN  rtrim(ltrim(FLAGS))='MPG'  THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'MPG'
WHEN  rtrim(ltrim(FLAGS))='MPT'  THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'MPT'
WHEN  rtrim(ltrim(FLAGS))='PGP'  THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'PGP'
WHEN  rtrim(ltrim(FLAGS))='PD'   THEN   'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'PD'
WHEN  rtrim(ltrim(FLAGS))='PGA'  THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'PGA'
WHEN  rtrim(ltrim(FLAGS))='PGB'  THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'PGB'
WHEN  rtrim(ltrim(FLAGS))='PGC'  THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'PGC'
WHEN  rtrim(ltrim(FLAGS))='PGD'  THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'PGD'
WHEN  rtrim(ltrim(FLAGS))='PGI'  THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'PGI'
WHEN  rtrim(ltrim(FLAGS))='PGN'  THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'PGN'
WHEN  rtrim(ltrim(FLAGS))='PGT'  THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'PGT'
WHEN  rtrim(ltrim(FLAGS))='PGV'  THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'PGV'
WHEN  rtrim(ltrim(FLAGS))='PGW'  THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'PGW'
WHEN  rtrim(ltrim(FLAGS))='ELITED'  THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'ELITED'
WHEN  rtrim(ltrim(FLAGS))='FA'  	THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'FA'
WHEN  rtrim(ltrim(FLAGS))='LOWMID'  THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'LOWMID'
WHEN  rtrim(ltrim(FLAGS))='MLCTRA'  THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'MLCTRA'
WHEN  rtrim(ltrim(FLAGS))='MLCTRB'  THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'MLCTRB'
WHEN  rtrim(ltrim(FLAGS))='MLCTRC'  THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'MLCTRC'
WHEN  rtrim(ltrim(FLAGS))='MLCTRD'  THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'MLCTRD'
WHEN  rtrim(ltrim(FLAGS))='MLTS1A'  THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'MLTS1A'
WHEN  rtrim(ltrim(FLAGS))='MLTS1B'  THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'MLTS1B'
WHEN  rtrim(ltrim(FLAGS))='MLTS1C'  THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'MLTS1C'
WHEN  rtrim(ltrim(FLAGS))='MLTS1D'  THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'MLTS1D'
WHEN  rtrim(ltrim(FLAGS))='MLTS2A'  THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'MLTS2A'
WHEN  rtrim(ltrim(FLAGS))='MLTS2B'  THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'MLTS2B'
WHEN  rtrim(ltrim(FLAGS))='MLTS2C'  THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'MLTS2C'
WHEN  rtrim(ltrim(FLAGS))='MLTS2D'  THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'MLTS2D'
WHEN  rtrim(ltrim(FLAGS))='NOARRY'  THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'NOARRY'
WHEN  rtrim(ltrim(FLAGS))='NOELIT'  THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'NOELIT'
WHEN  rtrim(ltrim(FLAGS))='NOFOLL'  THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'NOFOLL'
WHEN  rtrim(ltrim(FLAGS))='NOLBLS'  THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'NOLBLS'
WHEN  rtrim(ltrim(FLAGS))='OV' 		THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'OV'
WHEN  rtrim(ltrim(FLAGS))='PLACTV'  THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'PLACTV'
WHEN  rtrim(ltrim(FLAGS))='PLDROP'  THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'PLDROP'
WHEN  rtrim(ltrim(FLAGS))='PLQUIT'  THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'PLQUIT'
WHEN  rtrim(ltrim(FLAGS))='SU'  	THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'SU'
WHEN  rtrim(ltrim(FLAGS))='UPPMID'  THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'UPPMID'
WHEN  rtrim(ltrim(FLAGS))='YEARST'  THEN  'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))+'FLAG-'+'YEARST'

END           								 												as rC_Bios__External_ID__c


,'CONFIRMED' 																	as rC_Bios__Status__c
,NULL 																		as rC_Bios__End_Date__c													
																	
,CAST(GETDATE()	as datetime2)															As rC_Bios__Start_Date__c



,CASE 

WHEN rtrim(ltrim(FLAGS))= 'AG'  THEN  'Communication Frequency'
WHEN rtrim(ltrim(FLAGS))= 'AP'  THEN  'Communication Frequency'
WHEN rtrim(ltrim(FLAGS))= 'CH'  THEN  'Communication Frequency'
WHEN rtrim(ltrim(FLAGS))= 'EA'  THEN  'Communication Frequency'
WHEN rtrim(ltrim(FLAGS))= 'FB'  THEN  'Communication Frequency'
WHEN rtrim(ltrim(FLAGS))= 'JA'  THEN  'Communication Frequency'
WHEN rtrim(ltrim(FLAGS))= 'JL'  THEN  'Communication Frequency'
WHEN rtrim(ltrim(FLAGS))= 'JN'  THEN  'Communication Frequency'
WHEN rtrim(ltrim(FLAGS))= 'MR'  THEN  'Communication Frequency'
WHEN rtrim(ltrim(FLAGS))= 'MY'  THEN  'Communication Frequency'
WHEN rtrim(ltrim(FLAGS))= 'NV'  THEN  'Communication Frequency'
WHEN rtrim(ltrim(FLAGS))= 'OC'  THEN  'Communication Frequency'
WHEN rtrim(ltrim(FLAGS))= 'SB'  THEN  'Communication Frequency'
---WHEN rtrim(ltrim(FLAGS))= 'SP'  THEN  'Communication Frequency'
WHEN rtrim(ltrim(FLAGS))= 'TH'  THEN  'Communication Frequency'
WHEN rtrim(ltrim(FLAGS))= 'YE'  THEN  'Communication Frequency'
WHEN  rtrim(ltrim(FLAGS))='ADC'  THEN  'Constituent Type'
WHEN  rtrim(ltrim(FLAGS))='AFC'  THEN  'Constituent Type'
WHEN  rtrim(ltrim(FLAGS))='AGC'  THEN  'Constituent Type'
WHEN  rtrim(ltrim(FLAGS))='ANY'  THEN  'Constituent Type'
WHEN  rtrim(ltrim(FLAGS))='APC'  THEN  'Constituent Type'
WHEN  rtrim(ltrim(FLAGS))='AVB'  THEN  'Constituent Type'
WHEN  rtrim(ltrim(FLAGS))='AVS'  THEN  'Constituent Type'
WHEN  rtrim(ltrim(FLAGS))='BMC'  THEN  'Constituent Type'
WHEN  rtrim(ltrim(FLAGS))='CAB'  THEN  'Constituent Type'
WHEN  rtrim(ltrim(FLAGS))='CAC'  THEN  'Constituent Type'
WHEN  rtrim(ltrim(FLAGS))='CASELD'  THEN  'Constituent Type'
WHEN  rtrim(ltrim(FLAGS))='COC'  THEN  'Constituent Type'
WHEN  rtrim(ltrim(FLAGS))='MDA'  THEN  'Constituent Type'
WHEN  rtrim(ltrim(FLAGS))='RLG'  THEN  'Constituent Type'
WHEN  rtrim(ltrim(FLAGS))='SEED'  THEN  'Constituent Type'
WHEN  rtrim(ltrim(FLAGS))='SSR'  THEN  'Constituent Type'
WHEN  rtrim(ltrim(FLAGS))='VDD'  THEN  'Constituent Type'
WHEN  rtrim(ltrim(FLAGS))='WAE'  THEN  'Constituent Type'
WHEN  rtrim(ltrim(FLAGS))='WAU'  THEN  'Constituent Type'
WHEN  rtrim(ltrim(FLAGS))='WBS'  THEN  'Constituent Type'
WHEN rtrim(ltrim(FLAGS))= 'L16'  THEN  'Communication Type'
WHEN rtrim(ltrim(FLAGS))= 'NKN'  THEN  'Communication Type'
WHEN rtrim(ltrim(FLAGS))= 'WBA'  THEN  'Communication Type'
WHEN rtrim(ltrim(FLAGS))= 'WBC'  THEN  'Communication Type'
WHEN rtrim(ltrim(FLAGS))= 'WBD'  THEN  'Communication Type'
WHEN rtrim(ltrim(FLAGS))= 'WBO'  THEN  'Communication Type'
WHEN rtrim(ltrim(FLAGS))= 'LWC'  THEN  'Communication Type'
WHEN rtrim(ltrim(FLAGS))= 'DST'  THEN  'Interests'
WHEN rtrim(ltrim(FLAGS))= 'LNM'  THEN  'Interests'
WHEN rtrim(ltrim(FLAGS))= 'MEM'  THEN  'Interests'
WHEN rtrim(ltrim(FLAGS))= 'PRS'  THEN  'Interests'
WHEN rtrim(ltrim(FLAGS))= 'RTY'  THEN  'Interests'
WHEN rtrim(ltrim(FLAGS))= 'SLA'  THEN  'Interests'
WHEN rtrim(ltrim(FLAGS))= 'SOE'  THEN  'Interests'
WHEN rtrim(ltrim(FLAGS))= 'UW'  THEN  'Interests'
WHEN  rtrim(ltrim(FLAGS))='CPL'  THEN  'Prospect'
WHEN  rtrim(ltrim(FLAGS))='MPC'  THEN  'Prospect'
WHEN  rtrim(ltrim(FLAGS))='MPG'  THEN  'Prospect'
WHEN  rtrim(ltrim(FLAGS))='MPT'  THEN  'Prospect'
WHEN  rtrim(ltrim(FLAGS))='PGP'  THEN  'Prospect'
WHEN  rtrim(ltrim(FLAGS))='PD'  THEN  'Major Gift '
WHEN rtrim(ltrim(FLAGS))= 'PGA'  THEN  'Planned Giving'
WHEN rtrim(ltrim(FLAGS))= 'PGB'  THEN  'Planned Giving'
WHEN rtrim(ltrim(FLAGS))= 'PGC'  THEN  'Planned Giving'
WHEN rtrim(ltrim(FLAGS))= 'PGD'  THEN  'Planned Giving'
WHEN rtrim(ltrim(FLAGS))= 'PGI'  THEN  'Planned Giving'
WHEN rtrim(ltrim(FLAGS))= 'PGN'  THEN  'Planned Giving'
WHEN rtrim(ltrim(FLAGS))= 'PGT'  THEN  'Planned Giving'
WHEN rtrim(ltrim(FLAGS))= 'PGV'  THEN  'Planned Giving'
WHEN rtrim(ltrim(FLAGS))= 'PGW'  THEN  'Planned Giving'
WHEN rtrim(ltrim(FLAGS))= 'ELITED'  THEN  'Vendor Program Flags'
WHEN rtrim(ltrim(FLAGS))= 'FA'  	THEN  'Vendor Program Flags'
WHEN rtrim(ltrim(FLAGS))= 'LOWMID'  THEN  'Vendor Program Flags'
WHEN rtrim(ltrim(FLAGS))= 'MLCTRA'  THEN  'Vendor Program Flags'
WHEN rtrim(ltrim(FLAGS))= 'MLCTRB'  THEN  'Vendor Program Flags'
WHEN rtrim(ltrim(FLAGS))= 'MLCTRC'  THEN  'Vendor Program Flags'
WHEN rtrim(ltrim(FLAGS))= 'MLCTRD'  THEN  'Vendor Program Flags'
WHEN rtrim(ltrim(FLAGS))= 'MLTS1A'  THEN  'Vendor Program Flags'
WHEN rtrim(ltrim(FLAGS))= 'MLTS1B'  THEN  'Vendor Program Flags'
WHEN rtrim(ltrim(FLAGS))= 'MLTS1C'  THEN  'Vendor Program Flags'
WHEN rtrim(ltrim(FLAGS))= 'MLTS1D'  THEN  'Vendor Program Flags'
WHEN rtrim(ltrim(FLAGS))= 'MLTS2A'  THEN  'Vendor Program Flags'
WHEN rtrim(ltrim(FLAGS))= 'MLTS2B'  THEN  'Vendor Program Flags'
WHEN rtrim(ltrim(FLAGS))= 'MLTS2C'  THEN  'Vendor Program Flags'
WHEN rtrim(ltrim(FLAGS))= 'MLTS2D'  THEN  'Vendor Program Flags'
WHEN rtrim(ltrim(FLAGS))= 'NOARRY'  THEN  'Vendor Program Flags'
WHEN rtrim(ltrim(FLAGS))= 'NOELIT'  THEN  'Vendor Program Flags'
WHEN rtrim(ltrim(FLAGS))= 'NOFOLL'  THEN  'Vendor Program Flags'
WHEN rtrim(ltrim(FLAGS))= 'NOLBLS'  THEN  'Vendor Program Flags'
WHEN rtrim(ltrim(FLAGS))= 'OV' 		THEN  'Vendor Program Flags'
WHEN rtrim(ltrim(FLAGS))= 'PLACTV'  THEN  'Vendor Program Flags'
WHEN rtrim(ltrim(FLAGS))= 'PLDROP'  THEN  'Vendor Program Flags'
WHEN rtrim(ltrim(FLAGS))= 'PLQUIT'  THEN  'Vendor Program Flags'
WHEN rtrim(ltrim(FLAGS))= 'SU'  	THEN  'Vendor Program Flags'
WHEN rtrim(ltrim(FLAGS))= 'UPPMID'  THEN  'Vendor Program Flags'
WHEN rtrim(ltrim(FLAGS))= 'YEARST'  THEN  'Vendor Program Flags'


END    																			as rC_Bios__category__c

,CASE 
WHEN  rtrim(ltrim(FLAGS))='AG'  THEN  'August'
WHEN  rtrim(ltrim(FLAGS))='AP'  THEN  'April'
WHEN  rtrim(ltrim(FLAGS))='CH'  THEN  'Christmas'
WHEN  rtrim(ltrim(FLAGS))='EA'  THEN  'Easter'
WHEN  rtrim(ltrim(FLAGS))='FB'  THEN  'February'
WHEN  rtrim(ltrim(FLAGS))='JA'  THEN  'January'
WHEN  rtrim(ltrim(FLAGS))='JL'  THEN  'July'
WHEN  rtrim(ltrim(FLAGS))='JN'  THEN  'June'
WHEN  rtrim(ltrim(FLAGS))='MR'  THEN  'March'
WHEN  rtrim(ltrim(FLAGS))='MY'  THEN  'May'
WHEN  rtrim(ltrim(FLAGS))='NV'  THEN  'November'
WHEN  rtrim(ltrim(FLAGS))='OC'  THEN  'October'
WHEN  rtrim(ltrim(FLAGS))='SB'  THEN  'September'
----WHEN  rtrim(ltrim(FLAGS))='SP'  THEN  'Spring'
WHEN  rtrim(ltrim(FLAGS))='TH'  THEN  'Thanksgiving'
WHEN  rtrim(ltrim(FLAGS))='YE'  THEN  'Year End'
WHEN  rtrim(ltrim(FLAGS))='ADC'  THEN  'Advisory Board'
WHEN  rtrim(ltrim(FLAGS))='AFC'  THEN  'Advisory Board'
WHEN  rtrim(ltrim(FLAGS))='AGC'  THEN  'Advisory Board'
WHEN  rtrim(ltrim(FLAGS))='ANY'  THEN  'Anonymous'
WHEN  rtrim(ltrim(FLAGS))='APC'  THEN  'Advisory Board'
WHEN  rtrim(ltrim(FLAGS))='AVB'  THEN  'Advisory Board'
WHEN  rtrim(ltrim(FLAGS))='AVS'  THEN  'Advisory Board'
WHEN  rtrim(ltrim(FLAGS))='BMC'  THEN  'Board Member'
WHEN  rtrim(ltrim(FLAGS))='CAB'  THEN  'Advisory Board'
WHEN  rtrim(ltrim(FLAGS))='CAC'  THEN  'CACE List'
WHEN  rtrim(ltrim(FLAGS))='CASELD'  THEN  'Donor'
WHEN  rtrim(ltrim(FLAGS))='COC'  THEN  'Circle of Caring'
WHEN  rtrim(ltrim(FLAGS))='MDA'  THEN  'Media Contact'
WHEN  rtrim(ltrim(FLAGS))='RLG'  THEN  'Religious Leader'
WHEN  rtrim(ltrim(FLAGS))='SEED'  THEN  'Seed Name'
WHEN  rtrim(ltrim(FLAGS))='SSR'  THEN  'Soldier'
WHEN  rtrim(ltrim(FLAGS))='VDD'  THEN  'Volunteer'
WHEN  rtrim(ltrim(FLAGS))='WAE'  THEN  'Advisory Board'
WHEN  rtrim(ltrim(FLAGS))='WAU'  THEN  'Advisory Board'
WHEN  rtrim(ltrim(FLAGS))='WBS'  THEN  'William Booth Society'
WHEN  rtrim(ltrim(FLAGS))='L16'  THEN  'Lifechangers'
WHEN  rtrim(ltrim(FLAGS))='NKN'  THEN  'Newsletter'
WHEN  rtrim(ltrim(FLAGS))='WBA'  THEN  'William Booth '
WHEN  rtrim(ltrim(FLAGS))='WBC'  THEN  'William Booth '
WHEN  rtrim(ltrim(FLAGS))='WBD'  THEN  'William Booth '
WHEN  rtrim(ltrim(FLAGS))='WBO'  THEN  'William Booth '
WHEN  rtrim(ltrim(FLAGS))='LWC'  THEN  'Lunch with Colonel'
WHEN rtrim(ltrim(FLAGS))= 'DST'  THEN  'Disaster'
WHEN rtrim(ltrim(FLAGS))= 'LNM'  THEN  'Lions Member'
WHEN rtrim(ltrim(FLAGS))= 'MEM'  THEN  'Memorials'
WHEN rtrim(ltrim(FLAGS))= 'PRS'  THEN  'Prayer Request'
WHEN rtrim(ltrim(FLAGS))= 'RTY'  THEN  'Rotary Member'
WHEN rtrim(ltrim(FLAGS))= 'SLA'  THEN  'Event'
WHEN rtrim(ltrim(FLAGS))= 'SOE'  THEN  'Event'
WHEN  rtrim(ltrim(FLAGS))='CPL'  THEN  'Corporate'
WHEN  rtrim(ltrim(FLAGS))='MPC'  THEN  'Major Donor'
WHEN  rtrim(ltrim(FLAGS))='MPG'  THEN  'Major Donor'
WHEN  rtrim(ltrim(FLAGS))='MPT'  THEN  'Major Donor '
WHEN  rtrim(ltrim(FLAGS))='PGP'  THEN  'Planned Giving '
WHEN  rtrim(ltrim(FLAGS))='PD'  THEN  'Donor'
WHEN  rtrim(ltrim(FLAGS))='PGA'  THEN  'Gift Annuity Donor'
WHEN  rtrim(ltrim(FLAGS))='PGB'  THEN  'Bequest Donor'
WHEN  rtrim(ltrim(FLAGS))='PGC'  THEN  'Counselor'
WHEN  rtrim(ltrim(FLAGS))='PGD'  THEN  'Donor'
WHEN  rtrim(ltrim(FLAGS))='PGI'  THEN  'Insurance Donor'
WHEN  rtrim(ltrim(FLAGS))='PGN'  THEN  'New'
WHEN  rtrim(ltrim(FLAGS))='PGT'  THEN  'Trust Donor'
WHEN  rtrim(ltrim(FLAGS))='PGV'  THEN  'Verbal Designation'
WHEN  rtrim(ltrim(FLAGS))='PGW'  THEN  'Wills Donor'
WHEN  rtrim(ltrim(FLAGS))='ELITED'  THEN  'Donor Elite'
WHEN  rtrim(ltrim(FLAGS))='FA'  THEN  'Sustainer'
WHEN  rtrim(ltrim(FLAGS))='LOWMID'  THEN  'Donor Elite'
WHEN  rtrim(ltrim(FLAGS))='MLCTRA'  THEN  'Mid Level Control Tier A'
WHEN  rtrim(ltrim(FLAGS))='MLCTRB'  THEN  'Mid Level Control Tier B'
WHEN  rtrim(ltrim(FLAGS))='MLCTRC'  THEN  'Mid Level Control Tier C'
WHEN  rtrim(ltrim(FLAGS))='MLCTRD'  THEN  'Mid Level Control Tier D'
WHEN  rtrim(ltrim(FLAGS))='MLTS1A'  THEN  'Mid Level Test 1 Tier A'
WHEN  rtrim(ltrim(FLAGS))='MLTS1B'  THEN  'Mid Level Test 1 Tier B'
WHEN  rtrim(ltrim(FLAGS))='MLTS1C'  THEN  'Mid Level Test 1 Tier C'
WHEN  rtrim(ltrim(FLAGS))='MLTS1D'  THEN  'Mid Level Test 1 Tier D'
WHEN  rtrim(ltrim(FLAGS))='MLTS2A'  THEN  'Mid Level Test 2 Tier A'
WHEN  rtrim(ltrim(FLAGS))='MLTS2B'  THEN  'Mid Level Test 2 Tier B'
WHEN  rtrim(ltrim(FLAGS))='MLTS2C'  THEN  'Mid Level Test 2 Tier C'
WHEN  rtrim(ltrim(FLAGS))='MLTS2D'  THEN  'Mid Level Test 2 Tier D'
WHEN  rtrim(ltrim(FLAGS))='NOARRY'  THEN  'No Gift Array'
WHEN  rtrim(ltrim(FLAGS))='NOELIT'  THEN  'No Donor Elite'
WHEN  rtrim(ltrim(FLAGS))='NOFOLL'  THEN  'No Follow Up Mailings'
WHEN  rtrim(ltrim(FLAGS))='NOLBLS'  THEN  'No Labels / Premiums'
WHEN  rtrim(ltrim(FLAGS))='OV'  THEN  'No Mail Vendor'
WHEN  rtrim(ltrim(FLAGS))='PLACTV'  THEN  'Pledge'
WHEN  rtrim(ltrim(FLAGS))='PLDROP'  THEN  'Pledge'
WHEN  rtrim(ltrim(FLAGS))='PLQUIT'  THEN  'Pledge'
WHEN  rtrim(ltrim(FLAGS))='SU'  THEN  'Sustainer'
WHEN  rtrim(ltrim(FLAGS))='UPPMID'  THEN  'Donor Elite'
WHEN  rtrim(ltrim(FLAGS))='YEARST'  THEN  'Year End Statement'

END  																				as rC_Bios__Subcategory__c



,CASE 

WHEN rtrim(ltrim(FLAGS))= 'AG'  THEN  ''
WHEN rtrim(ltrim(FLAGS))= 'AP'  THEN  ''
WHEN rtrim(ltrim(FLAGS))= 'CH'  THEN  ''
WHEN rtrim(ltrim(FLAGS))= 'EA'  THEN  ''
WHEN rtrim(ltrim(FLAGS))= 'FB'  THEN  ''
WHEN rtrim(ltrim(FLAGS))= 'JA'  THEN  ''
WHEN rtrim(ltrim(FLAGS))= 'JL'  THEN  ''
WHEN rtrim(ltrim(FLAGS))= 'JN'  THEN  ''
WHEN rtrim(ltrim(FLAGS))= 'MR'  THEN  ''
WHEN rtrim(ltrim(FLAGS))= 'MY'  THEN  ''
WHEN rtrim(ltrim(FLAGS))= 'NV'  THEN  ''
WHEN rtrim(ltrim(FLAGS))= 'OC'  THEN  ''
WHEN rtrim(ltrim(FLAGS))= 'SB'  THEN  ''
----WHEN rtrim(ltrim(FLAGS))= 'SP'  THEN  ''
WHEN rtrim(ltrim(FLAGS))= 'TH'  THEN  ''
WHEN rtrim(ltrim(FLAGS))= 'YE'  THEN  ''
WHEN rtrim(ltrim(FLAGS)) ='AGC'  THEN  'Program Committee'
WHEN rtrim(ltrim(FLAGS)) ='ANY'  THEN  ''
WHEN rtrim(ltrim(FLAGS)) ='APC'  THEN  'Property Committee'
WHEN rtrim(ltrim(FLAGS)) ='AVB'  THEN  ''
WHEN rtrim(ltrim(FLAGS)) ='AVS'  THEN  'Ex-Officio'
WHEN rtrim(ltrim(FLAGS)) ='BMC'  THEN  'Corps'
WHEN rtrim(ltrim(FLAGS)) ='CAB'  THEN  'Division'
WHEN rtrim(ltrim(FLAGS)) ='CAC'  THEN  ''
WHEN rtrim(ltrim(FLAGS)) ='CASELD'  THEN  'Case load'
WHEN rtrim(ltrim(FLAGS)) ='COC'  THEN  ''
WHEN rtrim(ltrim(FLAGS)) ='MDA'  THEN  ''
WHEN rtrim(ltrim(FLAGS)) ='RLG'  THEN  ''
WHEN rtrim(ltrim(FLAGS)) ='SEED'  THEN  ''
WHEN rtrim(ltrim(FLAGS)) ='SSR'  THEN  ''
WHEN rtrim(ltrim(FLAGS)) ='VDD'  THEN  ''
WHEN rtrim(ltrim(FLAGS)) ='WAE'  THEN  'Women''s Auxiliary'
WHEN rtrim(ltrim(FLAGS)) ='WAU'  THEN  'Women''s Auxiliary'
WHEN rtrim(ltrim(FLAGS)) ='WBS'  THEN  ''
WHEN  rtrim(ltrim(FLAGS))='L16'  THEN  'FY16'
WHEN  rtrim(ltrim(FLAGS))='NKN'  THEN  'Newkirk'
WHEN  rtrim(ltrim(FLAGS))='WBA'  THEN  'Acknowledgment'
WHEN  rtrim(ltrim(FLAGS))='WBC'  THEN  'Communication Plan'
WHEN  rtrim(ltrim(FLAGS))='WBD'  THEN  'Declined'
WHEN  rtrim(ltrim(FLAGS))='WBO'  THEN  'Other Mail'
WHEN  rtrim(ltrim(FLAGS))='LWC'  THEN  ''
WHEN rtrim(ltrim(FLAGS))= 'DST'  THEN  'Donor'
WHEN rtrim(ltrim(FLAGS))= 'LNM'  THEN  ''
WHEN rtrim(ltrim(FLAGS))= 'MEM'  THEN  ''
WHEN rtrim(ltrim(FLAGS))= 'PRS'  THEN  ''
WHEN rtrim(ltrim(FLAGS))= 'RTY'  THEN  ''
WHEN rtrim(ltrim(FLAGS))= 'SLA'  THEN  'Starlighter Attendee'
WHEN rtrim(ltrim(FLAGS))= 'SOE'  THEN  'Sponsorship'
WHEN rtrim(ltrim(FLAGS))= 'CPL'  THEN  ''
WHEN rtrim(ltrim(FLAGS))= 'MPC'  THEN  'Control'
WHEN rtrim(ltrim(FLAGS))= 'MPG'  THEN  ''
WHEN rtrim(ltrim(FLAGS))= 'MPT'  THEN  'Test'
WHEN rtrim(ltrim(FLAGS))= 'PGP'  THEN  ''
WHEN  rtrim(ltrim(FLAGS))='PD'  THEN  ' '
WHEN rtrim(ltrim(FLAGS))= 'PGA'  THEN  ''
WHEN rtrim(ltrim(FLAGS))= 'PGB'  THEN  ''
WHEN rtrim(ltrim(FLAGS))= 'PGC'  THEN  ''
WHEN rtrim(ltrim(FLAGS))= 'PGD'  THEN  ''
WHEN rtrim(ltrim(FLAGS))= 'PGI'  THEN  ''
WHEN rtrim(ltrim(FLAGS))= 'PGN'  THEN  ''
WHEN rtrim(ltrim(FLAGS))= 'PGT'  THEN  ''
WHEN rtrim(ltrim(FLAGS))= 'PGV'  THEN  ''
WHEN rtrim(ltrim(FLAGS))= 'PGW'  THEN  ''
WHEN rtrim(ltrim(FLAGS))= 'ELITED'  THEN  ''
WHEN rtrim(ltrim(FLAGS))= 'FA'  	THEN  'Friends of the Army'
WHEN rtrim(ltrim(FLAGS))= 'LOWMID'  THEN  'Lower Middle'
WHEN rtrim(ltrim(FLAGS))= 'MLCTRA'  THEN  ''
WHEN rtrim(ltrim(FLAGS))= 'MLCTRB'  THEN  ''
WHEN rtrim(ltrim(FLAGS))= 'MLCTRC'  THEN  ''
WHEN rtrim(ltrim(FLAGS))= 'MLCTRD'  THEN  ''
WHEN rtrim(ltrim(FLAGS))= 'MLTS1A'  THEN  ''
WHEN rtrim(ltrim(FLAGS))= 'MLTS1B'  THEN  ''
WHEN rtrim(ltrim(FLAGS))= 'MLTS1C'  THEN  ''
WHEN rtrim(ltrim(FLAGS))= 'MLTS1D'  THEN  ''
WHEN rtrim(ltrim(FLAGS))= 'MLTS2A'  THEN  ''
WHEN rtrim(ltrim(FLAGS))= 'MLTS2B'  THEN  ''
WHEN rtrim(ltrim(FLAGS))= 'MLTS2C'  THEN  ''
WHEN rtrim(ltrim(FLAGS))= 'MLTS2D'  THEN  ''
WHEN rtrim(ltrim(FLAGS))= 'NOARRY'  THEN  ''
WHEN rtrim(ltrim(FLAGS))= 'NOELIT'  THEN  ''
WHEN rtrim(ltrim(FLAGS))= 'NOFOLL'  THEN  ''
WHEN rtrim(ltrim(FLAGS))= 'NOLBLS'  THEN  ''
WHEN rtrim(ltrim(FLAGS))= 'OV'  	THEN  ''
WHEN rtrim(ltrim(FLAGS))= 'PLACTV'  THEN  'TrueSense - FOTA'
WHEN rtrim(ltrim(FLAGS))= 'PLDROP'  THEN  'TrueSense - FOTA'
WHEN rtrim(ltrim(FLAGS))= 'PLQUIT'  THEN  'TrueSense - FOTA'
WHEN rtrim(ltrim(FLAGS))= 'SU'  	THEN  'BBIS'
WHEN rtrim(ltrim(FLAGS))= 'UPPMID'  THEN  'Upper Middle Donor'
WHEN rtrim(ltrim(FLAGS))= 'YEARST'  THEN  ''



End 																			as Type
,CASE Rtrim(ltrim(FLAGS))
WHEN 'BMC' THEN 'C'+rtrim(ltrim(xx.Chapter))									
Else CAST('' as nvarchar(100))
END																				as service_location_code__c

,CASE

WHEN	rtrim(ltrim(FLAGS))='AG'	then	'AG'
WHEN	rtrim(ltrim(FLAGS))='AP'	then	'AP'
WHEN	rtrim(ltrim(FLAGS))='CH'	then	'CH'
WHEN	rtrim(ltrim(FLAGS))='EA'	then	'EA'
WHEN	rtrim(ltrim(FLAGS))='FB'	then	'FB'
WHEN	rtrim(ltrim(FLAGS))='JA'	then	'JA'
WHEN	rtrim(ltrim(FLAGS))='JL'	then	'JL'
WHEN	rtrim(ltrim(FLAGS))='JN'	then	'JN'
WHEN	rtrim(ltrim(FLAGS))='MR'	then	'MR'
WHEN	rtrim(ltrim(FLAGS))='MY'	then	'MY'
WHEN	rtrim(ltrim(FLAGS))='NV'	then	'NV'
WHEN	rtrim(ltrim(FLAGS))='OC'	then	'OC'
WHEN	rtrim(ltrim(FLAGS))='SB'	then	'SB'
----WHEN	rtrim(ltrim(FLAGS))='SP'	then	'SP'
WHEN	rtrim(ltrim(FLAGS))='TH'	then	'TH'
WHEN	rtrim(ltrim(FLAGS))='YE'	then	'YE'
WHEN	rtrim(ltrim(FLAGS))='ADC'	then	'ADC'
WHEN	rtrim(ltrim(FLAGS))='AFC'	then	'AFC'
WHEN	rtrim(ltrim(FLAGS))='AGC'	then	'AGC'
WHEN	rtrim(ltrim(FLAGS))='ANY'	then	'ANY'
WHEN	rtrim(ltrim(FLAGS))='APC'	then	'APC'
WHEN	rtrim(ltrim(FLAGS))='AVB'	then	'ADB, AVB'
WHEN	rtrim(ltrim(FLAGS))='AVS'	then	'AVS'
WHEN	rtrim(ltrim(FLAGS))='BMC'	then	'BMC'
WHEN	rtrim(ltrim(FLAGS))='CAB'	then	'AVB'
WHEN	rtrim(ltrim(FLAGS))='CAC'	then	'CAC'
WHEN	rtrim(ltrim(FLAGS))='CASELD'	then	'CAS'
WHEN	rtrim(ltrim(FLAGS))='COC'	then	'COC'
WHEN	rtrim(ltrim(FLAGS))='MDA'	then	'MDA'
WHEN	rtrim(ltrim(FLAGS))='RLG'	then	'RLG'
WHEN	rtrim(ltrim(FLAGS))='SEED'	then	'SEED'
WHEN	rtrim(ltrim(FLAGS))='SSR'	then	'SSR'
WHEN	rtrim(ltrim(FLAGS))='VDD'	then	'VOL'
WHEN	rtrim(ltrim(FLAGS))='WAE'	then	'WAE'
WHEN	rtrim(ltrim(FLAGS))='WAU'	then	'WAE'
WHEN	rtrim(ltrim(FLAGS))='WBS'	then	'WBS'
WHEN	rtrim(ltrim(FLAGS))='L16'	then	'LCH'
WHEN	rtrim(ltrim(FLAGS))='NKN'	then	'NKN'
WHEN	rtrim(ltrim(FLAGS))='WBA'	then	'WBA'
WHEN	rtrim(ltrim(FLAGS))='WBC'	then	'WBC'
WHEN	rtrim(ltrim(FLAGS))='WBD'	then	'WBD'
WHEN	rtrim(ltrim(FLAGS))='WBO'	then	'WBO'
WHEN	rtrim(ltrim(FLAGS))='LWC'	then	'LWC'
WHEN	rtrim(ltrim(FLAGS))='ZOZ'	then	'LOCPRM'
WHEN	rtrim(ltrim(FLAGS))='DST'	then	'DST'
WHEN	rtrim(ltrim(FLAGS))='LNM'	then	'LNM'
WHEN	rtrim(ltrim(FLAGS))='MEM'	then	'MEM'
WHEN	rtrim(ltrim(FLAGS))='PRS'	then	'PRS'
WHEN	rtrim(ltrim(FLAGS))='RTY'	then	'RTY'
WHEN	rtrim(ltrim(FLAGS))='SLA'	then	'SLA'
WHEN	rtrim(ltrim(FLAGS))='SOE'	then	'SOE'
WHEN	rtrim(ltrim(FLAGS))='UW'	then	'UW'
WHEN	rtrim(ltrim(FLAGS))='CPL'	then	'CPL'
WHEN	rtrim(ltrim(FLAGS))='MPC'	then	'MPC'
WHEN	rtrim(ltrim(FLAGS))='MPG'	then	'MPG'
WHEN	rtrim(ltrim(FLAGS))='MPT'	then	'MPT'
WHEN	rtrim(ltrim(FLAGS))='PGP'	then	'PGP'
WHEN 	rtrim(ltrim(FLAGS))='PD'	then	'PD'
WHEN	rtrim(ltrim(FLAGS))='PGA'	then	'PGA'
WHEN	rtrim(ltrim(FLAGS))='PGB'	then	'PGB'
WHEN	rtrim(ltrim(FLAGS))='PGC'	then	'PGC'
WHEN	rtrim(ltrim(FLAGS))='PGD'	then	'PGD'
WHEN	rtrim(ltrim(FLAGS))='PGI'	then	'PGI'
WHEN	rtrim(ltrim(FLAGS))='PGN'	then	'PGN'
WHEN	rtrim(ltrim(FLAGS))='PGT'	then	'PGT'
WHEN	rtrim(ltrim(FLAGS))='PGV'	then	'PGV'
WHEN	rtrim(ltrim(FLAGS))='PGW'	then	'PGW'
WHEN	rtrim(ltrim(FLAGS))='ZOZ'	then	'LOCPRM'
WHEN	rtrim(ltrim(FLAGS))='ELITED'	then	'ELITED'
WHEN	rtrim(ltrim(FLAGS))='FA'	then	'FA'
WHEN	rtrim(ltrim(FLAGS))='LOWMID'	then	'LOWMID'
WHEN	rtrim(ltrim(FLAGS))='MLCTRA'	then	'MLCTRA'
WHEN	rtrim(ltrim(FLAGS))='MLCTRB'	then	'MLCTRB'
WHEN	rtrim(ltrim(FLAGS))='MLCTRC'	then	'MLCTRC'
WHEN	rtrim(ltrim(FLAGS))='MLCTRD'	then	'MLCTRD'
WHEN	rtrim(ltrim(FLAGS))='MLTS1A'	then	'MLTS1A'
WHEN	rtrim(ltrim(FLAGS))='MLTS1B'	then	'MLTS1B'
WHEN	rtrim(ltrim(FLAGS))='MLTS1C'	then	'MLTS1C'
WHEN	rtrim(ltrim(FLAGS))='MLTS1D'	then	'MLTS1D'
WHEN	rtrim(ltrim(FLAGS))='MLTS2A'	then	'MLTS2A'
WHEN	rtrim(ltrim(FLAGS))='MLTS2B'	then	'MLTS2B'
WHEN	rtrim(ltrim(FLAGS))='MLTS2C'	then	'MLTS2C'
WHEN	rtrim(ltrim(FLAGS))='MLTS2D'	then	'MLTS2D'
WHEN	rtrim(ltrim(FLAGS))='NOARRY'	then	'NOARRY'
WHEN	rtrim(ltrim(FLAGS))='NOELIT'	then	'VENNOELIT'
WHEN	rtrim(ltrim(FLAGS))='NOFOLL'	then	'NOFOLL'
WHEN	rtrim(ltrim(FLAGS))='NOLBLS'	then	'NOLBLS'
WHEN	rtrim(ltrim(FLAGS))='OV'		then	'OV'
WHEN	rtrim(ltrim(FLAGS))='PLACTV'	then	'PLACTV'
WHEN	rtrim(ltrim(FLAGS))='PLDROP'	then	'PLDROP'
WHEN	rtrim(ltrim(FLAGS))='PLQUIT'	then	'PLQUIT'
WHEN	rtrim(ltrim(FLAGS))='SU'		then	'BBISSU'
WHEN	rtrim(ltrim(FLAGS))='UPPMID'	then	'UPPMID'
WHEN	rtrim(ltrim(FLAGS))='YEARST'	then	'YEARST'



end										as rC_Bios__Code_Value__c
,CASE rtrim(ltrim(xx.flags)) 																		
when 'PLDROP' THEN 'Dropped'
WHEN 'PLQUIT' THEN 'Quit'
ELSE CAST('' as nvarchar(100))
END 														as rC_Bios__Subtype__c
																	
,rtrim(ltrim(xx.donor2)) 													as donor
,CAST('' as Float)															As Amount__c

FROM 

(SELECT donor2,seq,CAST(nomail_exp as nvarchar(255)) as nomail_exp,chapter,Split.a.value('.', 'VARCHAR(max)') AS flags
FROM (SELECT donor2, campaign,nomail_exp,seq,chapter,CAST ('<M>' + REPLACE(campaign, ','
, '</M><M>') + '</M>' AS XML) AS 
String FROM [METRO_UAT1].dbo.DP where Campaign NOT like '%&%' and Campaign NOT like '%/%'  ) AS A CROSS APPLY String.nodes ('/M') AS Split(a)
where charindex(',',campaign) > 0  
union
SELECT donor2,seq,CAST(nomail_exp as nvarchar(255)) as nomail_exp,chapter,Split.a.value('.', 'VARCHAR(max)') AS Flags 
FROM (SELECT donor2, campaign,nomail_exp,seq,chapter,CAST ('<M>' + REPLACE(flags, ','
, '</M><M>') + '</M>' AS XML) AS 
String FROM [METRO_UAT1].dbo.DP

) AS A CROSS APPLY String.nodes ('/M') AS Split(a)
where charindex(',',campaign) = 0  

)XX
left join
[Migration_Metro].dbo.Contact_stage_Metro c
on ltrim(rtrim(xx.donor2))=c.Donor
left join
[Migration_Metro].dbo.Account_stage_Metro a
on ltrim(rtrim(xx.donor2))=a.Donor
where right(c.External_Id__C,2)!='-2' and rtrim(ltrim(xx.flags)) IN('ADC','AFC','AGC','ANY','APC','AVB','AVS','BMC','CAB','CAC','CASELD','COC','MDA','RLG','SEED','SSR','VDD','WAE','WAU','WBS','L16','NKN','WBA','WBC','WBD','WBO','LWC','DNG','DNI','DNN','DNO','DNP','DNT','NNS','NOMGIN','SQA','ZOZ','DST','LNM','MEM','PRS','RTY','SLA','SOE','CPL','MPC','MPG','MPT','PGP','PGA','PGB','PGC','PGD','PGI','PGT','PGW','ZOZ','ELITED','LOWMID','NOARRY','NOELIT','NOFOLL','NOLBLS','PLACTV','PLDROP','PLQUIT','UPPMID','YEARST','AG','AP','CH','EA','FB','JA','JL',	'JN','MR','MY','NV','OC','SB','TH','YE')





union

SELECT 
CAST('' as nchar(18))                                                  	As ID
,CAST('' as nvarchar(255))                                             	As Error
,'0053D000000IrLF'														As Ownerid
,(SELECT Id FROM [Migration_Target_QA].dbo.RecordType WHERE SobjectType = 'rC_Bios__Preference__c' AND Name = 'Standard') as RecordTypeId
,CAST('' as nvarchar(18))														As ContactID
,CAST('' as nvarchar(18))                                                  as AccountId,
'false'																	As rC_Bios__Active__c
,'FALSE'																as rC_Bios__Archive_Flag__c
,CASE rtrim(ltrim(d.Activity))
WHEN 'VOLO' then 'SEQ-'+rtrim(ltrim(p.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(p.donor2))+'Activity-'+'VOLO'
WHEN 'VOLP' then 'SEQ-'+rtrim(ltrim(p.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(p.donor2))+'Activity-'+'VOLP'

WHEN 'VOLR' then 'SEQ-'+rtrim(ltrim(p.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(p.donor2))+'Activity-'+'VOLR'
END																		As rC_Bios__External_ID__c,
'CONFIRMED' 															as rC_Bios__Status__c
,NULL																	As rC_Bios__End_Date__c
,CAST(Getdate()	as datetime2)															As rC_Bios__start_Date__c	
-- ,CAST('' as varchar(100)) 												as description
,case rtrim(ltrim(d.Activity))
WHEN 'VOLO' THEN 'Interests'
WHEN 'VOLP' then 'Interests'
WHEN 'VOLR' then 'Interests'
END 																	as rC_Bios__category__c,
case rtrim(ltrim(d.Activity))
WHEN 'VOLO' THEN 'Volunteer'
WHEN 'VOLP' then 'Volunteer'
WHEN 'VOLR' then 'Volunteer'
END 																	as rC_Bios__Subcategory__c
,case rtrim(ltrim(d.Activity))
WHEN 'VOLO' THEN 'Other'
WHEN 'VOLP' then 'Phone'
WHEN 'VOLR' then 'Remit'
END 																	As [type]
,cast('' as nvarchar(255)) 																			As service_location_code__c
,case rtrim(ltrim(d.Activity))
WHEN 'VOLO' THEN 'VOLO'
WHEN 'VOLP' then 'VOLP'
WHEN 'VOLR' then 'VOLR'
END 																	as rC_Bios__Code_Value__c,
CAST('' as nvarchar(100))												as rC_Bios__Subtype__c
																		
,rtrim(ltrim(p.donor2))													as donor
,CAST('' as Float)																 As Amount__c

FROM 


[METRO_UAT1].dbo.DPother2 d
LEft join
[METRO_UAT1].dbo.DP p
on rtrim(ltrim(d.donor))=ltrim(rtrim(p.donor2))
where rtrim(ltrim(d.Activity))IN('VOLO','VOLP','VOLR')



Union

SELECT 
CAST('' as nchar(18))                                                  	As ID
,CAST('' as nvarchar(255))                                             	As Error
,'0053D000000IrLF'														As Ownerid
,(SELECT Id FROM [Migration_Target_QA].dbo.RecordType WHERE SobjectType = 'rC_Bios__Preference__c' AND Name = 'Standard') as RecordTypeId
,CASE  
WHEN	rtrim(ltrim(Reason))='AN'	THEN	c.id
WHEN	rtrim(ltrim(Reason))='BA'	THEN	c.id
WHEN	rtrim(ltrim(Reason))='DE'	THEN	c.id
WHEN	rtrim(ltrim(Reason))='DF'	THEN	c.id
WHEN	rtrim(ltrim(Reason))='DH'	THEN	c.id
WHEN	rtrim(ltrim(Reason))='DNG'	THEN	c.id
WHEN	rtrim(ltrim(Reason))='DR'	THEN	c.id
WHEN	rtrim(ltrim(Reason))='DS'	THEN	c.id
WHEN	rtrim(ltrim(Reason))='FA'	THEN	c.id
WHEN	rtrim(ltrim(Reason))='HQ'	THEN	c.id
WHEN	rtrim(ltrim(Reason))='HT'	THEN	c.id
WHEN	rtrim(ltrim(Reason))='IA'	THEN	c.id
WHEN	rtrim(ltrim(Reason))='IH'	THEN	c.id
WHEN	rtrim(ltrim(Reason))='KT'	THEN	c.id
WHEN	rtrim(ltrim(Reason))='MV'	THEN	c.id
WHEN	rtrim(ltrim(Reason))='NC'	THEN	c.id
WHEN	rtrim(ltrim(Reason))='OB'	THEN	c.id
WHEN	rtrim(ltrim(Reason))='OO'	THEN	c.id
WHEN	rtrim(ltrim(Reason))='OV'	THEN	c.id
WHEN	rtrim(ltrim(Reason))='PL'	THEN	c.id
WHEN	rtrim(ltrim(Reason))='PM'	THEN	c.id
WHEN	rtrim(ltrim(Reason))='SU'	THEN	c.id
WHEN 	rtrim(ltrim(Thank))='0'		THEN    c.id
WHEN 	rtrim(ltrim(NoMail))='1'	THEN    c.id
WHEN 	rtrim(ltrim(Noemail))='1'	THEN    c.id
WHEN 	rtrim(ltrim(Telemark))='0'	THEN    c.id
WHEN	rtrim(ltrim(Reason))='TS'	THEN    c.id
WHEN	rtrim(ltrim(Reason))='UA'	THEN    c.id
WHEN	rtrim(ltrim(Reason))='ZZ'	THEN    c.id
WHEN	rtrim(ltrim(Reason))='UW'	THEN    c.id
WHEN	rtrim(ltrim(Reason))='PD'	THEN    c.id
WHEN	rtrim(ltrim(STEWARDCOD))='0I1'THEN    c.id
WHEN	rtrim(ltrim(STEWARDCOD))='0I2'THEN    c.id
WHEN	rtrim(ltrim(STEWARDCOD))='0I3'THEN    c.id
WHEN	rtrim(ltrim(STEWARDCOD))='0I4'THEN    c.id
WHEN	rtrim(ltrim(STEWARDCOD))='0I5'THEN    c.id
WHEN	rtrim(ltrim(STEWARDCOD))='0I6'THEN    c.id
WHEN	rtrim(ltrim(STEWARDCOD))='0IP'THEN    c.id

END																							as contactID
,case 																							
WHEN	rtrim(ltrim(REASON))='FA'THEN    a.id
WHEN	rtrim(ltrim(REASON))='OV'THEN    a.id
WHEN	rtrim(ltrim(REASON))='SU'THEN    a.id
END																								As AccountID
,'FALSE'																 	as rC_Bios__Active__c
,'FALSE'																As rC_Bios__Archive_Flag__c
,CAse
WHEN rtrim(ltrim(Reason))='AN'Then 'SEQ-'+rtrim(ltrim(seq))+'METRO-'+'DONOR-'+rtrim(ltrim(donor2))+'Reason-'+'AN'
WHEN rtrim(ltrim(Reason))='BA'Then 'SEQ-'+rtrim(ltrim(seq))+'METRO-'+'DONOR-'+rtrim(ltrim(donor2))+'Reason-'+'BA'
WHEN rtrim(ltrim(Reason))='DE'Then 'SEQ-'+rtrim(ltrim(seq))+'METRO-'+'DONOR-'+rtrim(ltrim(donor2))+'Reason-'+'DE'
WHEN rtrim(ltrim(Reason))='DF'Then 'SEQ-'+rtrim(ltrim(seq))+'METRO-'+'DONOR-'+rtrim(ltrim(donor2))+'Reason-'+'DF'
WHEN rtrim(ltrim(Reason))='DH'Then 'SEQ-'+rtrim(ltrim(seq))+'METRO-'+'DONOR-'+rtrim(ltrim(donor2))+'Reason-'+'DH'
WHEN rtrim(ltrim(Reason))='DR'Then 'SEQ-'+rtrim(ltrim(seq))+'METRO-'+'DONOR-'+rtrim(ltrim(donor2))+'Reason-'+'DR'
WHEN rtrim(ltrim(Reason))='DS'Then 'SEQ-'+rtrim(ltrim(seq))+'METRO-'+'DONOR-'+rtrim(ltrim(donor2))+'Reason-'+'DS'
WHEN rtrim(ltrim(Reason))='FA'Then 'SEQ-'+rtrim(ltrim(seq))+'METRO-'+'DONOR-'+rtrim(ltrim(donor2))+'Reason-'+'FA'
WHEN rtrim(ltrim(Reason))='HQ'Then 'SEQ-'+rtrim(ltrim(seq))+'METRO-'+'DONOR-'+rtrim(ltrim(donor2))+'Reason-'+'HQ'
WHEN rtrim(ltrim(Reason))='HT'Then 'SEQ-'+rtrim(ltrim(seq))+'METRO-'+'DONOR-'+rtrim(ltrim(donor2))+'Reason-'+'HT'
WHEN rtrim(ltrim(Reason))='DH'Then 'SEQ-'+rtrim(ltrim(seq))+'METRO-'+'DONOR-'+rtrim(ltrim(donor2))+'Reason-'+'DH'
WHEN rtrim(ltrim(Reason))='DR'Then 'SEQ-'+rtrim(ltrim(seq))+'METRO-'+'DONOR-'+rtrim(ltrim(donor2))+'Reason-'+'DR'
WHEN rtrim(ltrim(Reason))='DS'Then 'SEQ-'+rtrim(ltrim(seq))+'METRO-'+'DONOR-'+rtrim(ltrim(donor2))+'Reason-'+'DS'
WHEN rtrim(ltrim(Reason))='FA'Then 'SEQ-'+rtrim(ltrim(seq))+'METRO-'+'DONOR-'+rtrim(ltrim(donor2))+'Reason-'+'FA'
WHEN rtrim(ltrim(Reason))='HQ'Then 'SEQ-'+rtrim(ltrim(seq))+'METRO-'+'DONOR-'+rtrim(ltrim(donor2))+'Reason-'+'HQ'
WHEN rtrim(ltrim(Reason))='HT'Then 'SEQ-'+rtrim(ltrim(seq))+'METRO-'+'DONOR-'+rtrim(ltrim(donor2))+'Reason-'+'HT'
WHEN rtrim(ltrim(Reason))='IA'Then 'SEQ-'+rtrim(ltrim(seq))+'METRO-'+'DONOR-'+rtrim(ltrim(donor2))+'Reason-'+'IA'
WHEN rtrim(ltrim(Reason))='IH'Then 'SEQ-'+rtrim(ltrim(seq))+'METRO-'+'DONOR-'+rtrim(ltrim(donor2))+'Reason-'+'IH'
WHEN	rtrim(ltrim(Reason))='KT'	THEN	'SEQ-'+rtrim(ltrim(seq))+'METRO-'+'DONOR-'+rtrim(ltrim(donor2))+'Reason-'+'IH'
WHEN	rtrim(ltrim(Reason))='MV'	THEN	'SEQ-'+rtrim(ltrim(seq))+'METRO-'+'DONOR-'+rtrim(ltrim(donor2))+'Reason-'+'MV'
WHEN	rtrim(ltrim(Reason))='NC'	THEN	'SEQ-'+rtrim(ltrim(seq))+'METRO-'+'DONOR-'+rtrim(ltrim(donor2))+'Reason-'+'NC'
WHEN	rtrim(ltrim(Reason))='OB'	THEN	'SEQ-'+rtrim(ltrim(seq))+'METRO-'+'DONOR-'+rtrim(ltrim(donor2))+'Reason-'+'OB'
WHEN	rtrim(ltrim(Reason))='OO'	THEN	'SEQ-'+rtrim(ltrim(seq))+'METRO-'+'DONOR-'+rtrim(ltrim(donor2))+'Reason-'+'OO'
WHEN	rtrim(ltrim(Reason))='OV'	THEN	'SEQ-'+rtrim(ltrim(seq))+'METRO-'+'DONOR-'+rtrim(ltrim(donor2))+'Reason-'+'OV'
WHEN	rtrim(ltrim(Reason))='PL'	THEN	'SEQ-'+rtrim(ltrim(seq))+'METRO-'+'DONOR-'+rtrim(ltrim(donor2))+'Reason-'+'PL'
WHEN	rtrim(ltrim(Reason))='PM'	THEN	'SEQ-'+rtrim(ltrim(seq))+'METRO-'+'DONOR-'+rtrim(ltrim(donor2))+'Reason-'+'PM'
WHEN	rtrim(ltrim(Reason))='SU'	THEN	'SEQ-'+rtrim(ltrim(seq))+'METRO-'+'DONOR-'+rtrim(ltrim(donor2))+'Reason-'+'SU'
WHEN	rtrim(ltrim(THANK))='0'     THEN	'SEQ-'+rtrim(ltrim(seq))+'METRO-'+'DONOR-'+rtrim(ltrim(donor2))+'Thank-'+'0'
WHEN	rtrim(ltrim(Noemail))='0'   THEN	'SEQ-'+rtrim(ltrim(seq))+'METRO-'+'DONOR-'+rtrim(ltrim(donor2))+'NoEmail-'+'1'
WHEN	rtrim(ltrim(Nomail))='1'    THEN	'SEQ-'+rtrim(ltrim(seq))+'METRO-'+'DONOR-'+rtrim(ltrim(donor2))+'Nomail-'+'1'
WHEN	rtrim(ltrim(TELEMARK))='0'  THEN	'SEQ-'+rtrim(ltrim(seq))+'METRO-'+'DONOR-'+rtrim(ltrim(donor2))+'TELEMARK-'+'0'
WHEN	rtrim(ltrim(Reason))='TS'	THEN  	'SEQ-'+rtrim(ltrim(seq))+'METRO-'+'DONOR-'+rtrim(ltrim(donor2))+'Reason-'+'TS'
WHEN	rtrim(ltrim(Reason))='UA'	THEN  	'SEQ-'+rtrim(ltrim(seq))+'METRO-'+'DONOR-'+rtrim(ltrim(donor2))+'Reason-'+'UA'
WHEN	rtrim(ltrim(Reason))='ZZ'	THEN  	'SEQ-'+rtrim(ltrim(seq))+'METRO-'+'DONOR-'+rtrim(ltrim(donor2))+'Reason-'+'ZZ'
WHEN	rtrim(ltrim(Reason))='UW'	THEN  	'SEQ-'+rtrim(ltrim(seq))+'METRO-'+'DONOR-'+rtrim(ltrim(donor2))+'Reason-'+'UW'
WHEN	rtrim(ltrim(Reason))='PD'	THEN  	'SEQ-'+rtrim(ltrim(seq))+'METRO-'+'DONOR-'+rtrim(ltrim(donor2))+'Reason-'+'PD'
WHEN	rtrim(ltrim(STEWARDCOD))='0I1'THEN  	'SEQ-'+rtrim(ltrim(seq))+'METRO-'+'DONOR-'+rtrim(ltrim(donor2))+'STEWARDCOD-'+'0I1'
WHEN	rtrim(ltrim(STEWARDCOD))='0I2'THEN  	'SEQ-'+rtrim(ltrim(seq))+'METRO-'+'DONOR-'+rtrim(ltrim(donor2))+'STEWARDCOD-'+'0I2'
WHEN	rtrim(ltrim(STEWARDCOD))='0I3'THEN  	'SEQ-'+rtrim(ltrim(seq))+'METRO-'+'DONOR-'+rtrim(ltrim(donor2))+'STEWARDCOD-'+'0I3'
WHEN	rtrim(ltrim(STEWARDCOD))='0I4'THEN  	'SEQ-'+rtrim(ltrim(seq))+'METRO-'+'DONOR-'+rtrim(ltrim(donor2))+'STEWARDCOD-'+'0I4'
WHEN	rtrim(ltrim(STEWARDCOD))='0I5'THEN  	'SEQ-'+rtrim(ltrim(seq))+'METRO-'+'DONOR-'+rtrim(ltrim(donor2))+'STEWARDCOD-'+'0I5'
WHEN	rtrim(ltrim(STEWARDCOD))='0I6'THEN  	'SEQ-'+rtrim(ltrim(seq))+'METRO-'+'DONOR-'+rtrim(ltrim(donor2))+'STEWARDCOD-'+'0I6'
WHEN	rtrim(ltrim(STEWARDCOD))='0IP'THEN  	'SEQ-'+rtrim(ltrim(seq))+'METRO-'+'DONOR-'+rtrim(ltrim(donor2))+'STEWARDCOD-'+'0IP'
END																						as rC_Bios__External_ID__c
,'CONFIRMED' 																			as rC_Bios__Status__c
,CASE 
WHEN rtrim(ltrim(Reason))='AN'  AND rtrim(ltrim(nomail_exp))!='1899-12-30 00:00:00.0000000' THEN	 rtrim(ltrim(nomail_exp))
WHEN rtrim(ltrim(Reason))='BA' AND rtrim(ltrim(nomail_exp))!='1899-12-30 00:00:00.0000000'  THEN	 rtrim(ltrim(nomail_exp))
WHEN rtrim(ltrim(Reason))='DE' AND rtrim(ltrim(nomail_exp))!='1899-12-30 00:00:00.0000000'  THEN	rtrim(ltrim(nomail_exp))
WHEN rtrim(ltrim(Reason))='DF' AND rtrim(ltrim(nomail_exp))!='1899-12-30 00:00:00.0000000'  THEN	rtrim(ltrim(nomail_exp))
WHEN rtrim(ltrim(Reason))='DH' AND rtrim(ltrim(nomail_exp))!='1899-12-30 00:00:00.0000000'  THEN	rtrim(ltrim(nomail_exp))
WHEN rtrim(ltrim(Reason))='DNG' AND rtrim(ltrim(nomail_exp))!='1899-12-30 00:00:00.0000000' THEN	rtrim(ltrim(nomail_exp))
WHEN rtrim(ltrim(Reason))='DR' AND rtrim(ltrim(nomail_exp))!='1899-12-30 00:00:00.0000000'  THEN	rtrim(ltrim(nomail_exp))
WHEN rtrim(ltrim(Reason))='DS' AND rtrim(ltrim(nomail_exp))!='1899-12-30 00:00:00.0000000'  THEN	rtrim(ltrim(nomail_exp))
WHEN rtrim(ltrim(Reason))='FA' AND rtrim(ltrim(nomail_exp))!='1899-12-30 00:00:00.0000000'  THEN	rtrim(ltrim(nomail_exp))
WHEN rtrim(ltrim(Reason))='HQ' AND rtrim(ltrim(nomail_exp))!='1899-12-30 00:00:00.0000000'  THEN	rtrim(ltrim(nomail_exp))
WHEN rtrim(ltrim(Reason))='HT' AND rtrim(ltrim(nomail_exp))!='1899-12-30 00:00:00.0000000'  THEN	rtrim(ltrim(nomail_exp))
WHEN rtrim(ltrim(Reason))='IA' AND rtrim(ltrim(nomail_exp))!='1899-12-30 00:00:00.0000000'  THEN	rtrim(ltrim(nomail_exp))
WHEN rtrim(ltrim(Reason))='IH' AND rtrim(ltrim(nomail_exp))!='1899-12-30 00:00:00.0000000'  THEN	rtrim(ltrim(nomail_exp))
WHEN rtrim(ltrim(Reason))='KT' AND rtrim(ltrim(nomail_exp))!='1899-12-30 00:00:00.0000000'  THEN	rtrim(ltrim(nomail_exp))
WHEN rtrim(ltrim(Reason))='MV' AND rtrim(ltrim(nomail_exp))!='1899-12-30 00:00:00.0000000'  THEN	rtrim(ltrim(nomail_exp))
WHEN rtrim(ltrim(Reason))='NC' AND rtrim(ltrim(nomail_exp))!='1899-12-30 00:00:00.0000000'  THEN	rtrim(ltrim(nomail_exp))
WHEN rtrim(ltrim(Reason))='OB' AND rtrim(ltrim(nomail_exp))!='1899-12-30 00:00:00.0000000'  THEN	rtrim(ltrim(nomail_exp))
WHEN rtrim(ltrim(Reason))='OO' AND rtrim(ltrim(nomail_exp))!='1899-12-30 00:00:00.0000000'  THEN	rtrim(ltrim(nomail_exp))
WHEN rtrim(ltrim(Reason))='OV' AND rtrim(ltrim(nomail_exp))!='1899-12-30 00:00:00.0000000'  THEN	rtrim(ltrim(nomail_exp))
WHEN rtrim(ltrim(Reason))='PL' AND rtrim(ltrim(nomail_exp))!='1899-12-30 00:00:00.0000000'  THEN	rtrim(ltrim(nomail_exp))
WHEN rtrim(ltrim(Reason))='PM' AND rtrim(ltrim(nomail_exp))!='1899-12-30 00:00:00.0000000'  THEN	rtrim(ltrim(nomail_exp))
WHEN rtrim(ltrim(Reason))='SU' AND rtrim(ltrim(nomail_exp))!='1899-12-30 00:00:00.0000000'  THEN	rtrim(ltrim(nomail_exp))
WHEN rtrim(ltrim(Thank))='0'  AND rtrim(ltrim(nomail_exp))!='1899-12-30 00:00:00.0000000'  THEN	rtrim(ltrim(nomail_exp))
WHEN rtrim(ltrim(reason))='TS' AND rtrim(ltrim(nomail_exp))!='1899-12-30 00:00:00.0000000'  THEN	rtrim(ltrim(nomail_exp))
WHEN rtrim(ltrim(reason))='UA' AND rtrim(ltrim(nomail_exp))!='1899-12-30 00:00:00.0000000'  THEN	rtrim(ltrim(nomail_exp))
WHEN rtrim(ltrim(reason))='ZZ' AND rtrim(ltrim(nomail_exp))!='1899-12-30 00:00:00.0000000'  THEN	rtrim(ltrim(nomail_exp))
WHEN rtrim(ltrim(NOEMAIL))='1' AND rtrim(ltrim(nomail_exp))!='1899-12-30 00:00:00.0000000'  THEN	rtrim(ltrim(nomail_exp))
WHEN rtrim(ltrim(NOMAIL))='1' AND rtrim(ltrim(nomail_exp))!='1899-12-30 00:00:00.0000000'  THEN	rtrim(ltrim(nomail_exp))
WHEN rtrim(ltrim(Telemark))='0' AND rtrim(ltrim(nomail_exp))!='1899-12-30 00:00:00.0000000'  THEN	rtrim(ltrim(nomail_exp))

ENd																							 as rC_Bios__End_Date__c

,CAST(GETDATE()	as datetime2)																			As rC_Bios__start_Date__c

,CASE
WHEN	rtrim(ltrim(Reason))='AN'	Then	'Communication Preference'
WHEN	rtrim(ltrim(Reason))='BA'	Then	'Communication Preference'
WHEN	rtrim(ltrim(Reason))='DE'	Then	'Communication Preference'
WHEN	rtrim(ltrim(Reason))='DF'	Then	'Communication Preference'
WHEN	rtrim(ltrim(Reason))='DH'	Then	'Communication Preference'
WHEN	rtrim(ltrim(Reason))='DR'	Then	'Communication Preference'
WHEN	rtrim(ltrim(Reason))='DS'	Then	'Communication Preference'
WHEN	rtrim(ltrim(Reason))='FA'	Then	'Communication Preference'
WHEN	rtrim(ltrim(Reason))='HQ'	Then	'Communication Preference'
WHEN	rtrim(ltrim(Reason))='HT'	Then	'Communication Preference'
WHEN	rtrim(ltrim(Reason))='IA'	Then	'Communication Preference'
WHEN	rtrim(ltrim(Reason))='IH'	Then	'Communication Preference'
WHEN	rtrim(ltrim(Reason))='KT'	Then	'Communication Preference'
WHEN	rtrim(ltrim(Reason))='MV'	Then	'Communication Preference'
WHEN	rtrim(ltrim(Reason))='NC'	Then	'Communication Preference'
WHEN	rtrim(ltrim(Reason))='OB'	Then	'Communication Preference'
WHEN	rtrim(ltrim(Reason))='OO'	Then	'Communication Preference'
WHEN	rtrim(ltrim(Reason))='OV'	Then	'Communication Preference'
WHEN	rtrim(ltrim(Reason))='PL'	Then	'Communication Preference'
WHEN	rtrim(ltrim(Reason))='PM'	Then	'Communication Preference'
WHEN	rtrim(ltrim(Reason))='SU'	Then	'Communication Preference'
WHEN	rtrim(ltrim(THANK))='0'		Then		'Communication Preference'
WHEN	rtrim(ltrim(NOEMAIL))='1'	Then	'Communication Preference'
WHEN	rtrim(ltrim(NOMAIL))='1'	Then	'Communication Preference'
WHEN	rtrim(ltrim(TELEMARK))='0'	Then	'Communication Preference'
WHEN	rtrim(ltrim(Reason))='TS'	Then	'Communication Preference'
WHEN	rtrim(ltrim(Reason))='UA'	Then	'Communication Preference'
WHEN	rtrim(ltrim(Reason))='ZZ'	Then	'Communication Preference'
WHEN	rtrim(ltrim(Reason))='UW'	Then	'Interests'
WHEN	rtrim(ltrim(Reason))='PD'	Then	'Major Gift'
WHEN	rtrim(ltrim(STEWARDCOD))='0I1'	Then	'Planned Giving'
WHEN	rtrim(ltrim(STEWARDCOD))='0I2'	Then	'Planned Giving'
WHEN	rtrim(ltrim(STEWARDCOD))='0I3'	Then	'Planned Giving'
WHEN	rtrim(ltrim(STEWARDCOD))='0I4'	Then	'Planned Giving'
WHEN	rtrim(ltrim(STEWARDCOD))='0I5'	Then	'Planned Giving'
WHEN	rtrim(ltrim(STEWARDCOD))='0I6'	Then	'Planned Giving'
WHEN	rtrim(ltrim(STEWARDCOD))='0IP'	Then	'Planned Giving'
END 																as rC_Bios__category__c
,CASE

WHEN	rtrim(ltrim(Reason))='AN'	Then	'No Mail'
WHEN	rtrim(ltrim(Reason))='BA'	Then	'No Mail'
WHEN	rtrim(ltrim(Reason))='DE'	Then	'No Mail'
WHEN	rtrim(ltrim(Reason))='DF'	Then	'No Mail'
WHEN	rtrim(ltrim(Reason))='DH'	Then	'No Mail'
WHEN	rtrim(ltrim(Reason))='DR'	Then	'No Mail'
WHEN	rtrim(ltrim(Reason))='DS'	Then	'No Mail'
WHEN	rtrim(ltrim(Reason))='FA'	Then	'No Mail'
WHEN	rtrim(ltrim(Reason))='HQ'	Then	'No Mail'
WHEN	rtrim(ltrim(Reason))='HT'	Then	'No Mail'
WHEN	rtrim(ltrim(Reason))='IA'	Then	'No Mail'
WHEN	rtrim(ltrim(Reason))='IH'	Then	'No Mail'
WHEN	rtrim(ltrim(Reason))='KT'	Then	'No Mail'
WHEN	rtrim(ltrim(Reason))='MV'	Then	'No Mail'
WHEN	rtrim(ltrim(Reason))='NC'	Then	'No Mail'
WHEN	rtrim(ltrim(Reason))='OB'	Then	'No Mail'
WHEN	rtrim(ltrim(Reason))='OO'	Then	'No Mail'
WHEN	rtrim(ltrim(Reason))='OV'	Then	'No Mail'
WHEN	rtrim(ltrim(Reason))='PL'	Then	'No Mail'
WHEN	rtrim(ltrim(Reason))='PM'	Then	'No Mail'
WHEN	rtrim(ltrim(Reason))='SU'	Then	'No Mail'
WHEN	rtrim(ltrim(THANK))='0'		Then	'No Thank You'
WHEN	rtrim(ltrim(Noemail))='1'	Then	'No Email'
WHEN	rtrim(ltrim(Nomail))='1'	Then	'No Mail'
WHEN	rtrim(ltrim(telemark))='0'	Then	'No Telemarketing'
WHEN	rtrim(ltrim(Reason))='TS'	Then	'No Mail'
WHEN	rtrim(ltrim(Reason))='UA'	Then	'No Mail'
WHEN	rtrim(ltrim(Reason))='ZZ'	Then	'No Mail'
WHEN	rtrim(ltrim(Reason))='UW'	Then	'United Way'
WHEN	rtrim(ltrim(Reason))='PD'	Then	'Donor'
WHEN	rtrim(ltrim(STEWARDCOD))='0I1'	Then	'Identification'
WHEN	rtrim(ltrim(STEWARDCOD))='0I2'	Then	'Information'
WHEN	rtrim(ltrim(STEWARDCOD))='0I3'	Then	'Interest'
WHEN	rtrim(ltrim(STEWARDCOD))='0I4'	Then	'Involvement'
WHEN	rtrim(ltrim(STEWARDCOD))='0I5'	Then	'Investment'
WHEN	rtrim(ltrim(STEWARDCOD))='0I6'	Then	'Stewardship'
WHEN	rtrim(ltrim(STEWARDCOD))='0IP'	Then	'Planned Gift'
END																					as rC_Bios__Subcategory__c
,CASE

WHEN	rtrim(ltrim(Reason))='AN'	Then	'Remain Anonymous'
WHEN	rtrim(ltrim(Reason))='BA'	Then	'Bad Address'
WHEN	rtrim(ltrim(Reason))='DE'	Then	'Deceased'
WHEN	rtrim(ltrim(Reason))='DF'	Then	'From Conversion'
WHEN	rtrim(ltrim(Reason))='DH'	Then	'Deceased'
WHEN	rtrim(ltrim(Reason))='DR'	Then	'Donor Request'
WHEN	rtrim(ltrim(Reason))='DS'	Then	'Disaster'
WHEN	rtrim(ltrim(Reason))='FA'	Then	'Friends of the Army'
WHEN	rtrim(ltrim(Reason))='HQ'	Then	'Disaster'
WHEN	rtrim(ltrim(Reason))='HT'	Then	'Hard Times'
WHEN	rtrim(ltrim(Reason))='IA'	Then	' '
WHEN	rtrim(ltrim(Reason))='IH'	Then	'In-House Decision'
WHEN	rtrim(ltrim(Reason))='KT'	Then	'Disaster'
WHEN	rtrim(ltrim(Reason))='MV'	Then	'Moved'
WHEN	rtrim(ltrim(Reason))='NC'	Then	'NCOA Grading'
WHEN	rtrim(ltrim(Reason))='OB'	Then	'Out of business'
WHEN	rtrim(ltrim(Reason))='OO'	Then	'Out of Area'
WHEN	rtrim(ltrim(Reason))='OV'	Then	'Other Vendor or Fiscal Entity'
WHEN	rtrim(ltrim(Reason))='PL'	Then	'Pledge'
WHEN	rtrim(ltrim(Reason))='PM'	Then	'Donor Request'
WHEN	rtrim(ltrim(Reason))='SU'	Then	'Sustainer'
WHEN	rtrim(ltrim(THANK))='0'		Then	' '
WHEN	rtrim(ltrim(Noemail))='1'	Then	' '
WHEN	rtrim(ltrim(Nomail))='1'	Then	''
WHEN	rtrim(ltrim(telemark))='0'	Then	''
WHEN	rtrim(ltrim(Reason))='TS'	Then	'Less Mail Test'
WHEN	rtrim(ltrim(Reason))='UA'	Then	'Undeliverable as Addressed'
WHEN	rtrim(ltrim(Reason))='ZZ'	Then	'No Reason in COIN'
WHEN	rtrim(ltrim(Reason))='UW'	Then	'Donor'
WHEN	rtrim(ltrim(Reason))='PD'	Then	''
WHEN	rtrim(ltrim(STEWARDCOD))='0I1'	Then	''
WHEN	rtrim(ltrim(STEWARDCOD))='0I2'	Then	''
WHEN	rtrim(ltrim(STEWARDCOD))='0I3'	Then	''
WHEN	rtrim(ltrim(STEWARDCOD))='0I4'	Then 	''
WHEN	rtrim(ltrim(STEWARDCOD))='0I5'	Then	''
WHEN	rtrim(ltrim(STEWARDCOD))='0I6'	Then	''
WHEN	rtrim(ltrim(STEWARDCOD))='0IP'	Then	''
END																					as [TYPE]
,cast('' as nvarchar(255)) 															As service_location_code__c
,CASE 

WHEN	rtrim(ltrim(Reason))='AN'	Then	'AN'
WHEN	rtrim(ltrim(Reason))='BA'	Then	'BA'
WHEN	rtrim(ltrim(Reason))='DE'	Then	'DE'
WHEN	rtrim(ltrim(Reason))='DF'	Then	'DF'
WHEN	rtrim(ltrim(Reason))='DH'	Then	'DE'
WHEN	rtrim(ltrim(Reason))='DR'	Then	'DR'
WHEN	rtrim(ltrim(Reason))='DS'	Then	'DS'
WHEN	rtrim(ltrim(Reason))='FA'	Then	'FOTA'
WHEN	rtrim(ltrim(Reason))='HQ'	Then	'DS'
WHEN	rtrim(ltrim(Reason))='HT'	Then	'HT'
WHEN	rtrim(ltrim(Reason))='IA'	Then	'NOMAIL'
WHEN	rtrim(ltrim(Reason))='IH'	Then	'IH'
WHEN	rtrim(ltrim(Reason))='KT'	Then	'DS'
WHEN	rtrim(ltrim(Reason))='MV'	Then	'MV'
WHEN	rtrim(ltrim(Reason))='NC'	Then	'NC'
WHEN	rtrim(ltrim(Reason))='OB'	Then	'OB'
WHEN	rtrim(ltrim(Reason))='OO'	Then	'OO'
WHEN	rtrim(ltrim(Reason))='OV'	Then	'OTHVNDR'
WHEN	rtrim(ltrim(Reason))='PL'	Then	'PL'
WHEN	rtrim(ltrim(Reason))='PM'	Then	'DR'
WHEN	rtrim(ltrim(Reason))='SU'	Then	'SU'
WHEN	rtrim(ltrim(thank))='0'		Then	'NoThankyou'
WHEN	rtrim(ltrim(noemail))='1'		Then	'NOEMAIL'
WHEN	rtrim(ltrim(nomail))='1'		Then	'NOMAIL'
WHEN	rtrim(ltrim(telemark))='0'		Then	'NOTELEMARK'
WHEN	rtrim(ltrim(Reason))='TS'	Then	'TS'
WHEN	rtrim(ltrim(Reason))='UA'	Then	'UA'
WHEN	rtrim(ltrim(Reason))='ZZ'	Then	'ZZ'
WHEN	rtrim(ltrim(Reason))='UW'	Then	'UW'
WHEN	rtrim(ltrim(Reason))='PD'	Then	'PD'
WHEN	rtrim(ltrim(STEWARDCOD))='0I1'	Then	'0I1'
WHEN	rtrim(ltrim(STEWARDCOD))='0I2'	Then	'0I2'
WHEN	rtrim(ltrim(STEWARDCOD))='0I3'	Then	'0I3'
WHEN	rtrim(ltrim(STEWARDCOD))='0I4'	Then	'0I4'
WHEN	rtrim(ltrim(STEWARDCOD))='0I5'	Then	'0I5'
WHEN	rtrim(ltrim(STEWARDCOD))='0I6'	Then	'0I6'
WHEN	rtrim(ltrim(STEWARDCOD))='0IP'	Then	'0IP'

END																		as rC_Bios__Code_Value__c
,cast('' as nvarchar(100))												as rC_Bios__Subtype__c
,rtrim(ltrim(donor2))           										as Donor
,CAST('' as Float)														As Amount__c

FROM
[METRO_UAT1].dbo.DP

left join
[Migration_Metro].dbo.Contact_stage_Metro c
on ltrim(rtrim(donor2))=c.Donor

left join
[Migration_Metro].dbo.Account_stage_Metro a
on ltrim(rtrim(donor2))=a.Donor
Where (rtrim(ltrim(Reason)) in('AN','BA','DE','DF','DH','DR','DS','FA','HQ','HT','IA','IH','TS','UA','ZZ','UW','KT','MV','NC','OB','OO','OV','PL','PM','SU')
OR rtrim(ltrim(Thank))='0' OR rtrim(ltrim(Telemark))='0' OR rtrim(ltrim(Nomail))='1' OR rtrim(ltrim(noemail))='1' OR 
rtrim(ltrim(STEWARDCOD)) in('0I1','0I2','0I3','0I4','0I5','0I6','0IP'))
AND right(c.External_Id__C,2)!='-2' and rtrim(ltrim(reason))!=''and  rtrim(ltrim(STEWARDCOD))!=''

union

SELECT 
CAST('' as nchar(18))                                                  	As ID
,CAST('' as nvarchar(255))                                             	As Error
,'0053D000000IrLF'														As Ownerid
,(SELECT Id FROM [Migration_Target_QA].dbo.RecordType WHERE SobjectType = 'rC_Bios__Preference__c' AND Name = 'Standard') as RecordTypeId
,CAST('' as nvarchar(18))												As ContactID
,a.id																	as AccountId

,'FALSE'																as rC_Bios__Active__c
,'FALSE'																As rC_Bios__Archive_Flag__c
,'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))  As rC_Bios__External_ID__c
,'CONFIRMED' 																			as rC_Bios__Status__c
,CASE
WHEN rtrim(ltrim(nomail_exp))!='1899-12-30 00:00:00.0000000'  THEN	rtrim(ltrim(nomail_exp))
ENd																							 as rC_Bios__End_Date__c
,CAST(rtrim(ltrim(start_dt))as datetime2)																		as rC_Bios__start_Date__c
,'Vendor Program Flags'													As rC_Bios__category__c
,'Pledge'																As rC_Bios__subcategory__c
,'TrueSense - FOTA'														As [type]
,CAST('' as nvarchar(255))												as service_location_code__c
,CAST('' as nvarchar(255))												as rC_Bios__Code_Value__c
,CASE rtrim(ltrim(g.Freq))
WHEN '2' THEN ''
WHEN '?' THEN ''
WHEN 'A' THEN 'Annually'
WHEN 'M' THEN 'Monthly'
WHEN 'Q' THEN 'Quarterly'
WHEN 'S' THEN 'Semi-Annually'
WHEN 'Z' THEN ''
END 																	AS rC_Bios__Subtype__c
,rtrim(ltrim(donor2))           										as Donor
,rtrim(ltrim(g.Bill))													As Amount__c

FROM [METRO_UAT1].dbo.DPGIFT g
LEFT join
[METRO_UAT1].dbo.DP xx
on rtrim(ltrim(xx.donor2))=rtrim(ltrim(g.Donor))
LEFT join
[Migration_Metro].dbo.[Account_stage_Metro] a
on rtrim(ltrim(a.donor))=rtrim(ltrim(g.DONOR))
Where  rectype = 'P' and GIFTTYPE != 'IK' AND substring(sol,3,6) in ('pl9999', 'pI9999')and
writeoff ='1'

union

SELECT 
CAST('' as nchar(18))                                                  	As ID
,CAST('' as nvarchar(255))                                             	As Error
,'0053D000000IrLF'														As Ownerid
,(SELECT Id FROM [Migration_Target_QA].dbo.RecordType WHERE SobjectType = 'rC_Bios__Preference__c' AND Name = 'Standard') as RecordTypeId
,CAST('' as nvarchar(18))												As ContactID
,a.id																	as AccountId

,'TRUE'																as rC_Bios__Active__c
,'FALSE'																As rC_Bios__Archive_Flag__c
,'SEQ-'+rtrim(ltrim(xx.seq))+'METRO-'+'DONOR-'+rtrim(ltrim(xx.donor2))  As rC_Bios__External_ID__c
,'CONFIRMED' 																			as rC_Bios__Status__c
,CASE
WHEN rtrim(ltrim(nomail_exp))!='1899-12-30 00:00:00.0000000'  THEN	rtrim(ltrim(nomail_exp))

ENd																							 as rC_Bios__End_Date__c
,CAST(rtrim(ltrim(start_dt)) as datetime2)																		as rC_Bios__start_Date__c
,'Vendor Program Flags'													As rC_Bios__category__c
,'Pledge'																As rC_Bios__subcategory__c
,'TrueSense - FOTA'														As [type]
,CAST('' as nvarchar(255))												as service_location_code__c
,CAST('' as nvarchar(255))												as rC_Bios__Code_Value__c
,CASE rtrim(ltrim(g.Freq))
WHEN '2' THEN ''
WHEN '?' THEN ''
WHEN 'A' THEN 'Annually'
WHEN 'M' THEN 'Monthly'
WHEN 'Q' THEN 'Quarterly'
WHEN 'S' THEN 'Semi-Annually'
WHEN 'Z' THEN ''
END 																	AS rC_Bios__Subtype__c
,rtrim(ltrim(donor2))           										as Donor
,rtrim(ltrim(g.Bill))													As Amount__c

FROM [METRO_UAT1].dbo.DPGIFT g
LEFT join
[METRO_UAT1].dbo.DP xx
on rtrim(ltrim(xx.donor2))=rtrim(ltrim(g.Donor))
LEFT join
[Migration_Metro].dbo.[Account_stage_Metro] a
on rtrim(ltrim(a.donor))=rtrim(ltrim(g.DONOR))
Where  rectype = 'P' and GIFTTYPE != 'IK' AND substring(sol,3,6) in ('pl9999', 'pI9999')and
writeoff ='0')yy

 




--insert records

-- use [Migration_Metro]
-- Exec SF_BulkOps 'Insert:bulkapi,Parallel,Batchsize(10000)', 'TSAC_MIGR', 'rC_Bios__Preference__c'
 
----------------------------------------------------------------
---check errors

--select count(*) from [DEMO].dbo.[Account_Load_DEV_METRO] where id=''





-- Replicate Data
--use [Migration_Target_QA]
--exec SF_Refresh 'TSAC_MIGR', 'rC_Bios__Preference__c','yes'

