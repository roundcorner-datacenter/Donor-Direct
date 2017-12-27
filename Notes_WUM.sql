--Drop TABLE

DROP table [Migration_WUM].dbo.[Note_Load]


Select * INTO [Migration_WUM].dbo.[Note_Load]
FROM(

select 
CAST('' as nchar(18))                                                      		As ID,
CAST('' as nvarchar(255))                                                 		As Error
,a.id																			as PARENTID
,'Historical Notes'																As TITLE
,'FALSE'																		AS ISPRIVATE
,cast(rtrim(ltrim(p.NARR))	as nvarchar(MAX))														As [BODY]
,'0053D000000INtD'                                                      		As [OwnerID]

FROM  [WUM_UAT1].dbo.[dp]p
Left join
[Migration_WUM].dbo.[Account_Load_WUM]a
on rtrim(ltrim(p.donor2))=a.donor
where rtrim(ltrim(p.NARR))!=''

UNION

select 
CAST('' as nchar(18))                                                      		As ID,
CAST('' as nvarchar(255))                                                 		As Error
,a.id																			as PARENTID
,'Historical MEMO Notes'														As TITLE
,'FALSE'																		AS ISPRIVATE
,cast(rtrim(ltrim(p.PERSMEMO))	as nvarchar(MAX))													As [BODY]
,'0053D000000INtD'                                                      		As [OwnerID]

FROM  [WUM_UAT1].dbo.[dp]p
Left join
[Migration_WUM].dbo.[Account_Load_WUM]a
on rtrim(ltrim(p.donor2))=a.donor
where p.PERSMEMO!=''

union

select
CAST('' as nchar(18))                                                      		As ID,
CAST('' as nvarchar(255))                                                 		As Error
,a.id																			as PARENTID
,'Historical Data Changes'														As TITLE
,'FALSE'																		AS ISPRIVATE
,CASE rtrim(ltrim(g.Activity))


WHEN 'MSPC'	THEN CAST(Concat('TSM Changed Data' ,' ',CAST(g.[date] as DATE) ,' ',rtrim(ltrim(g.acomm))) as nvarchar(MAX))
WHEN 'ADDR'	then CAST(CONCAT('Address Change',' ',CAST(g.[date] as DATE) ,' ',rtrim(ltrim(g.acomm))) as nvarchar(MAX))		

END																				As [BODY]
,'0053D000000INtD'                                                      		As [OwnerID]

FROM [WUM_UAT1].dbo.[dp]p
Left join
[Migration_WUM].dbo.[Account_Load_WUM]a
on rtrim(ltrim(p.donor2))=a.donor
Left join
[WUM_UAT1].dbo.DPOTHER2 g
on rtrim(ltrim(p.donor2))=rtrim(ltrim(g.donor))
where rtrim(ltrim(g.Activity)) in('ADDR','MSPC')
)xx




--use [Migration_WUM]
--Exec SF_BulkOps 'Insert:bulkapi,parallel,Batchsize(10000)', 'TSAC_MIGR', 'NOTE_LOAD'

-----check errors

select * FROM [Migration_WUM].dbo.Note_Load where id=''

--use[Migration_Target_QA]

--Exec SF_refresh 'TSAC_MIGR', 'NOTE','YES'