 update migration_wum.task_load_archive
    set etl_id = replace(etl_id,'"','')

  update migration_wum.task_load_archive
    set Description = REPLACE(REPLACE(REPLACE(Description,'ZZZ',Char(13)), CHAR(64),CHAR(34)),CHAR(124),Char(13));
  
  alter table migration_wum.task_load_archive add column etl_id_int int;
  
  update migration_wum.task_load_archive set etl_id_int = CAST((REPLACE(etl_id,CHAR(10),'')) as UNSIGNED INTEGER);
  
--Create the Partitions on the existing table ------------------------
alter table migration_wum.task_load_archive
 PARTITION BY RANGE (ETL_ID_INT) (
    PARTITION p0 VALUES LESS THAN (100000),
    PARTITION p1 VALUES LESS THAN (200000),
    PARTITION p2 VALUES LESS THAN (300000),
    PARTITION p3 VALUES LESS THAN (400000),
    PARTITION p4 VALUES LESS THAN (500000),
    PARTITION p5 VALUES LESS THAN (600000),
    PARTITION p6 VALUES LESS THAN (700000),
    PARTITION p7 VALUES LESS THAN (800000),
    PARTITION p8 VALUES LESS THAN (900000),    
    PARTITION p9 VALUES LESS THAN (1000000),
    PARTITION p10 VALUES LESS THAN (1100000),
    PARTITION p11 VALUES LESS THAN (1200000),
    PARTITION p12 VALUES LESS THAN (1300000),
    PARTITION p13 VALUES LESS THAN (1400000), 
    PARTITION p14 VALUES LESS THAN (1500000),
    PARTITION p15 VALUES LESS THAN (1600000), 
    
    PARTITION p16 VALUES LESS THAN (1700000),
    PARTITION p17 VALUES LESS THAN (1800000),
    PARTITION p18 VALUES LESS THAN (1900000),
    PARTITION p19 VALUES LESS THAN (2000000),
    PARTITION p20 VALUES LESS THAN (2100000),
    PARTITION p21 VALUES LESS THAN (2200000),
    PARTITION p22 VALUES LESS THAN (2300000),
    PARTITION p23 VALUES LESS THAN (2400000),
    PARTITION p24 VALUES LESS THAN (2500000),    
    PARTITION p25 VALUES LESS THAN (2600000),
    PARTITION p26 VALUES LESS THAN (2700000),
    PARTITION p27 VALUES LESS THAN (2800000),
    PARTITION p28 VALUES LESS THAN (2900000),
    PARTITION p29 VALUES LESS THAN (3000000), 
    PARTITION p30 VALUES LESS THAN (3100000),
    PARTITION p31 VALUES LESS THAN (3200000),  
    PARTITION p32 VALUES LESS THAN (3300000),
    PARTITION p33 VALUES LESS THAN (3400000),  
    PARTITION p34 VALUES LESS THAN MAXVALUE);

----Insert into Task table by Partitions-----------------------
 INSERT INTO tsac_prod.task  (DELETE_FLAG,ownerID, Description, ActivityDate, WhoId, WhatId, Statusx, Subjectx, TYPEx,  rC_Bios__Archive_Flag) 
 select 'Y',ownerID, Description, ActivityDate, WhoId, WhatId, Status, Subject, TYPE,  'TRUE'
 from  migration_wum.task_load_archive partition (p1);
 
 
 
------METRO--------------------------
 update migration_metro.task_load_archive
    set etl_id = replace(etl_id,'"','')

  update migration_metro.task_load_archive
    set Description = REPLACE(REPLACE(REPLACE(Description,'ZZZ',Char(13)), CHAR(64),CHAR(34)),CHAR(124),Char(13));
  
  alter table migration_metro.task_load_archive add column etl_id_int int;
  
  update migration_metro.task_load_archive set etl_id_int = CAST((REPLACE(etl_id,CHAR(10),'')) as UNSIGNED INTEGER);
  
#Create the Partitions on the existing table ------------------------  #2mins
alter table migration_metro.task_load_archive
 PARTITION BY RANGE (ETL_ID_INT) (
    PARTITION p0 VALUES LESS THAN (200000),
    PARTITION p1 VALUES LESS THAN (400000),
    PARTITION p2 VALUES LESS THAN (600000),
    PARTITION p3 VALUES LESS THAN (800000),
    PARTITION p4 VALUES LESS THAN (1000000),
    PARTITION p5 VALUES LESS THAN (1200000),
    PARTITION p6 VALUES LESS THAN (1400000),
    PARTITION p7 VALUES LESS THAN (1600000),
    PARTITION p8 VALUES LESS THAN (1800000),    
    PARTITION p9 VALUES LESS THAN (2000000),
    PARTITION p10 VALUES LESS THAN MAXVALUE);

----Insert into Task table by Partitions-----------------------
select min(ACTIVITYDATE),max(ACTIVITYDATE) from tsac_uat.task;

 INSERT INTO tsac_prod.task  (DELETE_FLAG,ownerID, Description, ActivityDate, WhoId, WhatId, Statusx, Subjectx, TYPEX,  rC_Bios__Archive_Flag) 
 select 'Y',ownerID, Description, ActivityDate, WhoId, WhatId, Status, Subject, TYPE,  'TRUE'
 from  migration_metro.task_load_archive partition (p1);
 
 
 