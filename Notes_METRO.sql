--Drop TABLE

DROP table [Migration_Metro].dbo.[Note_Load]


Select * INTO [Migration_Metro].dbo.[Note_Load]
FROM(

select 
CAST('' as nchar(18))                                                      		As ID,
CAST('' as nvarchar(255))                                                 		As Error
,a.id																			as PARENTID
,'Historical Notes'																As TITLE
,'FALSE'																		AS ISPRIVATE
,CAST(rtrim(ltrim(p.NARR))	as nvarchar(MAX))													As [BODY]
,'0053D000000INtD'                                                      		As [OwnerID]

FROM [METRO_UAT1].dbo.[dp]p
Left join
[Migration_Metro].dbo.[Account_Stage_Metro]a
on rtrim(ltrim(p.donor2))=a.donor
where rtrim(ltrim(p.NARR))!=''

UNION

select 
CAST('' as nchar(18))                                                      		As ID,
CAST('' as nvarchar(255))                                                 		As Error
,a.id																			as PARENTID
,'Historical MEMO Notes'														As TITLE
,'FALSE'																		AS ISPRIVATE
,casT(rtrim(ltrim(p.PERSMEMO))	as nvarchar(MAX))													As [BODY]
,'0053D000000INtD'                                                      		As [OwnerID]

FROM [METRO_UAT1].dbo.[dp]p
Left join
[Migration_Metro].dbo.[Account_Stage_Metro]a
on rtrim(ltrim(p.donor2))=a.donor
where p.PERSMEMO!=''

UNION

select 
CAST('' as nchar(18))                                                      		As ID,
CAST('' as nvarchar(255))                                                 		As Error
,a.id																			as PARENTID
,'Historical Data Changes'														As TITLE
,'FALSE'																		AS ISPRIVATE
,CASE rtrim(ltrim(g.Activity))


WHEN 'MMRG'	THEN CAST(Concat('Manual Merge' ,' ',CAST(g.[date] as DATE) ,' ',rtrim(ltrim(g.acomm))) as nvarchar(MAX))
WHEN 'MSPC'	then CAST(CONCAT('TSM Changed Data',' ',CAST(g.[date] as DATE) ,' ',rtrim(ltrim(g.acomm))) as nvarchar(MAX))		
WHEN 'NOCO' then CAST(concat('Tried to Reach, No Contact Made',' ', CAST(g.[date] as DATE) ,' ',rtrim(ltrim(g.acomm))) as nvarchar(MAX))
WHEN 'NSFC'	THEN CAST(concat('Gift Deleted (returned check)',' ',CAST(g.[date] as DATE) ,' ',rtrim(ltrim(g.acomm))) as nvarchar(MAX))
END																				As [BODY]
,'0053D000000INtD'                                                      		As [OwnerID]

FROM [METRO_UAT1].dbo.[dp]p
Left join
[Migration_Metro].dbo.[Account_Stage_Metro]a
on rtrim(ltrim(p.donor2))=a.donor
Left join
[METRO_UAT1].dbo.DPOTHER2 g
on rtrim(ltrim(p.donor2))=rtrim(ltrim(g.donor))
where rtrim(ltrim(g.Activity)) in('MMRG', 'MSPC', 'NOCO', 'NSFC')
)xx




--use [Migration_Metro]
--Exec SF_BulkOps 'Insert:bulkapi,parallel,Batchsize(10000)', 'TSAC_MIGR', 'NOTE_load'

-----check errors

--select * FROM [Migration_Metro].dbo.Note_Load where id=''

--use[Migration_target_QA]

--Exec SF_refresh 'TSAC_MIGR', 'NOTE','YES'