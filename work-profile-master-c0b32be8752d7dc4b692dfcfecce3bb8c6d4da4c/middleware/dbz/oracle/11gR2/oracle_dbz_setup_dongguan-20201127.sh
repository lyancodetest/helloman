#!/bin/sh

#注意步骤中描述的用户名、密码、端口、数据库实例名
#创建闪回区路径（可以指定自定义的路径，做好替换即可）
mkdir -p /opt/oracle/oradata/recovery_area

# 设置归档模式并开启goldengate复制
sqlplus /nolog <<- EOF
	CONNECT sys/top_secret AS SYSDBA
	alter system set db_recovery_file_dest_size = 20G;
	alter system set db_recovery_file_dest = '/opt/oracle/oradata/recovery_area' scope=spfile;
	alter system set enable_goldengate_replication=true;
	shutdown immediate
	startup mount
	alter database archivelog;
	alter database flashback on;
	alter database open;
        -- Should show "Database log mode: Archive Mode"
	archive log list
	exit;
EOF

sqlplus sys/top_secret@//localhost:1522/EDW as sysdba <<- EOF
	CREATE TABLESPACE xstream_adm_tbs DATAFILE '/opt/oracle/oradata/ORCL/xstream_adm_tbs.dbf'
	  SIZE 25M REUSE AUTOEXTEND ON MAXSIZE UNLIMITED;

	CREATE USER xstrmadmin IDENTIFIED BY xsa
	  DEFAULT TABLESPACE xstream_adm_tbs
	  QUOTA UNLIMITED ON xstream_adm_tbs;

	GRANT CREATE SESSION TO xstrmadmin ;
	GRANT dba TO xstrmadmin;
	GRANT SELECT ON V_\$DATABASE to xstrmadmin ;
  GRANT FLASHBACK ANY TABLE TO xstrmadmin ;
  GRANT select_catalog_role to xstrmadmin;

	BEGIN
	   DBMS_XSTREAM_AUTH.GRANT_ADMIN_PRIVILEGE(
	      grantee                 => 'xstrmadmin',
	      privilege_type          => 'CAPTURE',
	      grant_select_privileges => TRUE
	   );
	END;
	/

	exit;
EOF