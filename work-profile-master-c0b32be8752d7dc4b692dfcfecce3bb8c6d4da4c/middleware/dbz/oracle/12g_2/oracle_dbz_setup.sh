#!/bin/sh

#让nv等客户端可以连
cat << EOF >> /opt/oracle/product/12.2.0.1/dbhome_1/network/admin/sqlnet.ora
SQLNET.ALLOWED_LOGON_VERSION_SERVER=8
SQLNET.ALLOWED_LOGON_VERSION_CLIENT=8
EOF
mkdir -p /opt/oracle/oradata/recovery_area

# 设置归档模式并开启goldengate复制
ORACLE_SID=ORCLCDB
export ORACLE_SID
sqlplus /nolog <<- EOF
	CONNECT sys/top_secret AS SYSDBA
	alter system set db_recovery_file_dest_size = 20G;
	alter system set db_recovery_file_dest = '/opt/oracle/oradata/recovery_area' scope=spfile;
	alter system set enable_goldengate_replication=true;
	shutdown immediate
	startup mount
	alter database archivelog;
	alter database open;
        -- Should show "Database log mode: Archive Mode"
	archive log list
	exit;
EOF

# 创建XStream管理用户
#1.创建表空间
sqlplus sys/top_secret@//localhost:1521/ORCLCDB as sysdba <<- EOF
	CREATE TABLESPACE xstream_adm_tbs DATAFILE '/opt/oracle/oradata/ORCLCDB/xstream_adm_tbs.dbf'
	  SIZE 25M REUSE AUTOEXTEND ON MAXSIZE UNLIMITED;
	exit;
EOF
sqlplus sys/top_secret@//localhost:1521/ORCLPDB1 as sysdba <<- EOF
	CREATE TABLESPACE xstream_adm_tbs DATAFILE '/opt/oracle/oradata/ORCLCDB/ORCLPDB1/xstream_adm_tbs.dbf'
	  SIZE 25M REUSE AUTOEXTEND ON MAXSIZE UNLIMITED;
	exit;
EOF
#2.创建用户并授权
sqlplus sys/top_secret@//localhost:1521/ORCLCDB as sysdba <<- EOF
	CREATE USER c##xstrmadmin IDENTIFIED BY xsa
	  DEFAULT TABLESPACE xstream_adm_tbs
	  QUOTA UNLIMITED ON xstream_adm_tbs
	  CONTAINER=ALL;

	GRANT CREATE SESSION, SET CONTAINER TO c##xstrmadmin CONTAINER=ALL;
	 GRANT dba TO c##xstrmadmin;

	BEGIN
	   DBMS_XSTREAM_AUTH.GRANT_ADMIN_PRIVILEGE(
	      grantee                 => 'c##xstrmadmin',
	      privilege_type          => 'CAPTURE',
	      grant_select_privileges => TRUE,
	      container               => 'ALL'
	   );
	END;
	/

	exit;
EOF

# 创建测试用户（如果有业务数据，可以不创建，用于添加或者更改数据查看任务效果）
sqlplus sys/top_secret@//localhost:1521/ORCLPDB1 as sysdba <<- EOF
	CREATE USER debezium IDENTIFIED BY dbz;
	GRANT CONNECT TO debezium;
	GRANT CREATE SESSION TO debezium;
	GRANT CREATE TABLE TO debezium;
	GRANT CREATE SEQUENCE TO debezium;
    GRANT dba TO debezium;
	ALTER USER debezium QUOTA 100G ON users;

	exit;
EOF

# 创建XStream用户（用于连接outbound）
# 在ORCLCDB中创建TABLESPACE
sqlplus sys/top_secret@//localhost:1521/ORCLCDB as sysdba <<- EOF
  CREATE TABLESPACE xstream_tbs DATAFILE '/opt/oracle/oradata/ORCLCDB/xstream_tbs.dbf'
	  SIZE 25M REUSE AUTOEXTEND ON MAXSIZE UNLIMITED;
  exit;
EOF
# 在ORCLPDB1中创建TABLESPACE
sqlplus sys/top_secret@//localhost:1521/ORCLPDB1 as sysdba <<- EOF
  CREATE TABLESPACE xstream_tbs DATAFILE '/opt/oracle/oradata/ORCLCDB/ORCLPDB1/xstream_tbs.dbf'
	  SIZE 25M REUSE AUTOEXTEND ON MAXSIZE UNLIMITED;
  exit;
EOF
sqlplus sys/top_secret@//localhost:1521/ORCLCDB as sysdba <<- EOF
  CREATE USER c##xstrm IDENTIFIED BY xs
	  DEFAULT TABLESPACE xstream_tbs
	  QUOTA UNLIMITED ON xstream_tbs
	  CONTAINER=ALL;

  GRANT CREATE SESSION TO c##xstrm CONTAINER=ALL;
  GRANT SET CONTAINER TO c##xstrm CONTAINER=ALL;
  GRANT SELECT ON V_$DATABASE to c##xstrm CONTAINER=ALL;
  GRANT FLASHBACK ANY TABLE TO c##xstrm CONTAINER=ALL;

  GRANT EXECUTE ON DBMS_STREAMS_MESSAGING TO c##xstrm;
  GRANT EXECUTE ON DBMS_AQ TO c##xstrm;
  exit;
EOF

# 创建XStream Outbound服务（用来提供连接）
# 这里debezium可以调整成自己的业务库
sqlplus c##xstrmadmin/xsa@//localhost:1521/ORCLCDB <<- EOF

	DECLARE
      tables  DBMS_UTILITY.UNCL_ARRAY;
      schemas DBMS_UTILITY.UNCL_ARRAY;
    BEGIN
        tables(1)  := NULL;
        schemas(1) := 'debezium';
        schemas(2) := 'NULL';
      DBMS_XSTREAM_ADM.CREATE_OUTBOUND(
        server_name     =>  'dbzxout',
        source_database =>  NULL,
        capture_user    =>  NULL,
        connect_user    =>  'c##xstrm',
        table_names     =>  tables,
        schema_names    =>  schemas,
        comment         =>  'dbzxout'
        );
    END;
    /

	exit;
EOF

# 业务表要授权给 c##xstrm
sqlplus sys/top_secret@//localhost:1521/ORCLPDB1 as sysdba <<- EOF
  Grant select any table to c##xstrm;
  Grant lock any table to c##xstrm;
  exit;
EOF