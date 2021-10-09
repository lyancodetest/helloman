#!/bin/sh

#注意步骤中描述的用户名（sys）、tnsnames、业务库名、数据库地址（localhost替换）

#设置gui客户端可以访问到oracle数据库，非必须
#cat << EOF >> /opt/oracle/product/11gR2/dbhome_1/network/admin/sqlnet.ora
#SQLNET.ALLOWED_LOGON_VERSION_SERVER=8
#SQLNET.ALLOWED_LOGON_VERSION_CLIENT=8
#EOF

#创建闪回区路径（可以指定自定义的路径，做好替换即可）
mkdir -p /opt/oracle/oradata/recovery_area

# 设置归档模式并开启goldengate复制
#ORACLE_SID=ORCLCDB
#export ORACLE_SID
sqlplus /nolog <<- EOF
	CONNECT sys/top_secret AS SYSDBA
	#修改闪回区大小
	alter system set db_recovery_file_dest_size = 20G;
	#设置闪回区路径
	alter system set db_recovery_file_dest = '/opt/oracle/oradata/recovery_area' scope=spfile;
	#启动goldengate复制（oracle 11.2.0.4 及之后的数据库才支持此参数）
	alter system set enable_goldengate_replication=true;
	#正常关闭实例
	shutdown immediate
	#启动实例并开启归档模式
	startup mount
	alter database archivelog;
	#打开数据库闪回功能
	alter database flashback on;
	alter database open;
        -- Should show "Database log mode: Archive Mode"
	archive log list
	exit;
EOF

# 创建XStream管理用户（Oracle的管理XStream的建议使用方式）
#1.创建表空间（ORCLCDB 调成 11g对应的tnsName.ora里面的别名 ;sys/top_secret替换成自己的dba用户;DATAFILE 位置可以调整成自己的位置）
sqlplus sys/top_secret@//localhost:1522/orcl as sysdba <<- EOF
	CREATE TABLESPACE xstream_adm_tbs DATAFILE '/opt/oracle/oradata/ORCL/xstream_adm_tbs.dbf'
	  SIZE 25M REUSE AUTOEXTEND ON MAXSIZE UNLIMITED;
	exit;
EOF
#2.创建用户并授权
sqlplus sys/top_secret@//localhost:1522/orcl as sysdba <<- EOF
	CREATE USER xstrmadmin IDENTIFIED BY xsa
	  DEFAULT TABLESPACE xstream_adm_tbs
	  QUOTA UNLIMITED ON xstream_adm_tbs;

    #授权
	GRANT CREATE SESSION TO xstrmadmin ;
	 GRANT dba TO xstrmadmin;

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

# 创建XStream用户（用于连接到XStream出站服务器）
#1.创建表空间（ORCLCDB 调成 11g对应的tnsnames.ora里面的别名 ;sys/top_secret替换成自己的dba用户;DATAFILE 位置可以调整成自己的位置;;localhost替换成自己的库ip地址）
sqlplus sys/top_secret@//localhost:1522/orcl as sysdba <<- EOF
  CREATE TABLESPACE xstream_tbs DATAFILE '/opt/oracle/oradata/ORCL/xstream_tbs.dbf'
	  SIZE 25M REUSE AUTOEXTEND ON MAXSIZE UNLIMITED;
  exit;
EOF

#2.创建用户并授权
sqlplus sys/top_secret@//localhost:1522/orcl as sysdba <<- EOF
  CREATE USER xstrm IDENTIFIED BY xs
	  DEFAULT TABLESPACE xstream_tbs
	  QUOTA UNLIMITED ON xstream_tbs ;

  GRANT CREATE SESSION TO xstrm ;
  GRANT SELECT ON V_\$DATABASE to xstrm ;
  GRANT FLASHBACK ANY TABLE TO xstrm ;
  grant select_catalog_role to xstrm;
  exit;
EOF



# 注意事项：2020-11-27
# * 前面开启闪回、归档等命令必须成功；
# * 如果提交任务的用户和创建outbound的用户是同一个的话，可以精简命令（合并），如  oracle_dbz_setup_dongguan-20201127.sh
# *





# 创建XStream Outbound服务（用来给connector程序提供连接获取数据）
# ORCLCDB 调整成11g对应的tnsnames.ora里面的别名;这里debezium可以调整成自己的业务库名称;localhost替换成自己的库ip地址


# 这个步骤可以等到后面在执行
#sqlplus xstrmadmin/xsa@//localhost:1522/orcl <<- EOF
#
#	DECLARE
#      tables  DBMS_UTILITY.UNCL_ARRAY;
#      schemas DBMS_UTILITY.UNCL_ARRAY;
#    BEGIN
#        tables(1)  := NULL;
#        schemas(1) := 'THOR_TEST';
#        schemas(2) := NULL;
#      DBMS_XSTREAM_ADM.CREATE_OUTBOUND(
#        server_name     =>  'dbzxout10',
#        source_database =>  NULL,
#        capture_user    =>  NULL,
#        connect_user    =>  'xstrm',
#        table_names     =>  tables,
#        schema_names    =>  schemas,
#        comment         =>  'dbzxout'
#        );
#    END;
#    /
#
#	exit;
#EOF


