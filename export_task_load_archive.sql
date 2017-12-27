
--------------------------------------------
-- Create a view of the data to spool
--------------------------------------------
   
sqlcmd -S 54.91.107.65 -U Migration.admin -PAppirio123 -d Migration_WUM_PROD -y0 -Q "set nocount on; SELECT CONCAT(CHAR(34),[etl_id],CHAR(34),CHAR(44),CHAR(34),[ownerID],CHAR(34),CHAR(44),CHAR(34),REPLACE(REPLACE(REPLACE([Description],CHAR(10),CHAR(124)),CHAR(34),CHAR(64)),CHAR(13),CHAR(124)),CHAR(34),CHAR(44),CHAR(34),[ActivityDate],CHAR(34),CHAR(44),CHAR(34),[WhoId],CHAR(34),CHAR(44),CHAR(34),[WhatId],CHAR(34),CHAR(44),CHAR(34),[Status],CHAR(34),CHAR(44),CHAR(34),[subject],CHAR(34),CHAR(44),CHAR(34),[TYPE],CHAR(34),CHAR(44),CHAR(34),[IsVisibleInSelfService],CHAR(34),CHAR(44),CHAR(34),[rC_Bios__Archive_Flag__c],CHAR(34),CHAR(44),CHAR(34),[donor],CHAR(34)) AS header FROM task_load_archive  ;" >Z:\TSAC\Tasks_Direct_Load\taskOutput_via_cmd_wum.csv

sqlcmd -S 54.91.107.65 -U Migration.admin -PAppirio123 -d Migration_METRO_PROD -y0 -Q "set nocount on; SELECT CONCAT(CHAR(34),[etl_id],CHAR(34),CHAR(44),CHAR(34),[ownerID],CHAR(34),CHAR(44),CHAR(34),REPLACE(REPLACE(REPLACE([Description],CHAR(10),CHAR(124)),CHAR(34),CHAR(64)),CHAR(13),CHAR(124)),CHAR(34),CHAR(44),CHAR(34),[ActivityDate],CHAR(34),CHAR(44),CHAR(34),[WhoId],CHAR(34),CHAR(44),CHAR(34),[WhatId],CHAR(34),CHAR(44),CHAR(34),[Status],CHAR(34),CHAR(44),CHAR(34),[subject],CHAR(34),CHAR(44),CHAR(34),[TYPE],CHAR(34),CHAR(44),CHAR(34),[IsVisibleInSelfService],CHAR(34),CHAR(44),CHAR(34),[rC_Bios__Archive_Flag__c],CHAR(34),CHAR(44),CHAR(34),[donor],CHAR(34)) AS header FROM task_load_archive  ;" >Z:\TSAC\Tasks_Direct_Load\taskOutput_via_cmd_metro.csv





--------------------------------------------
-- Create a view of the data to spool
--------------------------------------------
mysql -h tsac_admin.rounddata.org -D migration_wum -u rcadmin -p

DROP TABLE task_load_archive; 
CREATE TABLE task_load_archive (
  etl_id varchar(500) DEFAULT NULL,
  ownerID varchar(500) DEFAULT NULL,
  Description longtext,
  ActivityDate varchar(500) DEFAULT NULL,
  WhoId VARCHAR(500) DEFAULT NULL,
  WhatId VARCHAR(500) DEFAULT NULL,
  Status VARCHAR(500) DEFAULT NULL,
  Subject VARCHAR(500) DEFAULT NULL,
  TYPE VARCHAR(500) DEFAULT NULL,
  IsVisibleInSelfService VARCHAR(500) DEFAULT NULL,
  rC_Bios__Archive_Flag__c VARCHAR(500) DEFAULT NULL,
  donor VARCHAR(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOAD DATA LOCAL INFILE "Z:/TSAC/Tasks_Direct_Load/taskOutput_via_cmd_wum.csv"
INTO TABLE task_load_archive
COLUMNS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r'
IGNORE 1 LINES;


mysql -h tsac_admin.rounddata.org -D migration_metro -u rcadmin -p

DROP TABLE task_load_archive; 
CREATE TABLE task_load_archive (
  etl_id varchar(500) DEFAULT NULL,
  ownerID varchar(500) DEFAULT NULL,
  Description longtext,
  ActivityDate varchar(500) DEFAULT NULL,
  WhoId VARCHAR(500) DEFAULT NULL,
  WhatId VARCHAR(500) DEFAULT NULL,
  Status VARCHAR(500) DEFAULT NULL,
  Subject VARCHAR(500) DEFAULT NULL,
  TYPE VARCHAR(500) DEFAULT NULL,
  IsVisibleInSelfService VARCHAR(500) DEFAULT NULL,
  rC_Bios__Archive_Flag__c VARCHAR(500) DEFAULT NULL,
  donor VARCHAR(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOAD DATA LOCAL INFILE "Z:/TSAC/Tasks_Direct_Load/taskOutput_via_cmd_metro.csv"
INTO TABLE task_load_archive
COLUMNS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r'
IGNORE 1 LINES;























































































































































































