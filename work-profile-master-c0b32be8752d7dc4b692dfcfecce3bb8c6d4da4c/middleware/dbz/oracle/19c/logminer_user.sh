#!/bin/sh

-- 主要目的:创建logMiner用户,用来解析redoLog
sqlplus /nolog  <<- EOF
    -- DCLHR : CDB名称，可以按需调整
 CONNECT sys/lhr@//localhost:1521/DCLHR AS SYSDBA
    -- 路径可以按需调整
  CREATE TABLESPACE logminer_tbs DATAFILE '/opt/oracle/oradata/DCLHR/logminer_tbs.dbf'
    SIZE 25M REUSE AUTOEXTEND ON MAXSIZE UNLIMITED;

    -- DCLHRXDB : PDB 名称
 CONNECT sys/lhr@//localhost:1521/DCLHRXDB AS SYSDBA
  CREATE TABLESPACE logminer_tbs DATAFILE '/opt/oracle/oradata/DCLHR/DCLHRXDB/logminer_tbs.dbf'
    SIZE 25M REUSE AUTOEXTEND ON MAXSIZE UNLIMITED;

  -- LHRPDB1 : 另外一个 PDB 名称
  CONNECT sys/lhr@//localhost:1521/LHRPDB1 AS SYSDBA
  CREATE TABLESPACE logminer_tbs DATAFILE '/opt/oracle/oradata/DCLHR/LHRPDB1/logminer_tbs.dbf'
    SIZE 25M REUSE AUTOEXTEND ON MAXSIZE UNLIMITED;

  -- 在CDB下创建logMiner用户 c##dbzuser ，CDB名称可以按需调整，sys/lhr  c##dbzuser/dbz 可以按需调整
 CONNECT sys/lhr@//localhost:1521/DCLHR AS SYSDBA
  CREATE USER c##dbzuser IDENTIFIED BY dbz
    DEFAULT TABLESPACE logminer_tbs
    QUOTA UNLIMITED ON logminer_tbs
    CONTAINER=ALL;

  -- 授权logMiner用户 c##dbzuser解析redoLog的权限

  -- 授权logMiner用户 可以连接所有容器、切换容器、查询所有表、开启闪回等权限
  GRANT CREATE SESSION TO c##dbzuser CONTAINER=ALL;
  GRANT SET CONTAINER TO c##dbzuser CONTAINER=ALL;
  GRANT SELECT ON V_$DATABASE to c##dbzuser CONTAINER=ALL;
  GRANT FLASHBACK ANY TABLE TO c##dbzuser CONTAINER=ALL;
  GRANT SELECT ANY TABLE TO c##dbzuser CONTAINER=ALL;
  GRANT SELECT_CATALOG_ROLE TO c##dbzuser CONTAINER=ALL;
  GRANT EXECUTE_CATALOG_ROLE TO c##dbzuser CONTAINER=ALL;
  GRANT SELECT ANY TRANSACTION TO c##dbzuser CONTAINER=ALL;
  GRANT LOGMINING TO c##dbzuser CONTAINER=ALL;

  -- 授权logMiner用户创建表、锁定表、修改表、创建squence权限
  GRANT CREATE TABLE TO c##dbzuser CONTAINER=ALL;
  GRANT LOCK ANY TABLE TO c##dbzuser CONTAINER=ALL;
  GRANT ALTER ANY TABLE TO c##dbzuser CONTAINER=ALL;
  GRANT CREATE SEQUENCE TO c##dbzuser CONTAINER=ALL;

  -- 分配logMiner用户必须的系统级函数/功能包的使用权限
  GRANT EXECUTE ON DBMS_LOGMNR TO c##dbzuser CONTAINER=ALL;
  GRANT EXECUTE ON DBMS_LOGMNR_D TO c##dbzuser CONTAINER=ALL;

  -- 分配logMiner用户使用一些视图查询权限
  GRANT SELECT ON V_$LOG TO c##dbzuser CONTAINER=ALL;
  GRANT SELECT ON V_$LOG_HISTORY TO c##dbzuser CONTAINER=ALL;
  GRANT SELECT ON V_$LOGMNR_LOGS TO c##dbzuser CONTAINER=ALL;
  GRANT SELECT ON V_$LOGMNR_CONTENTS TO c##dbzuser CONTAINER=ALL;
  GRANT SELECT ON V_$LOGMNR_PARAMETERS TO c##dbzuser CONTAINER=ALL;
  GRANT SELECT ON V_$LOGFILE TO c##dbzuser CONTAINER=ALL;
  GRANT SELECT ON V_$ARCHIVED_LOG TO c##dbzuser CONTAINER=ALL;
  GRANT SELECT ON V_$ARCHIVE_DEST_STATUS TO c##dbzuser CONTAINER=ALL;

  exit;
EOF