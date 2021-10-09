#!/bin/sh

-- 主要目的:开启数据库级别的日志,为logMiner解析redoLog做准备
sqlplus /nolog  <<- EOF
    -- 使用sysdba角色调整数据库的配置
    CONNECT sys/123456 AS SYSDBA
    -- 指定闪回恢复区大小、闪回恢复区位置
    alter system set db_recovery_file_dest_size = 10G;
    -- 如果指定的目录不存在，需要提前进行创建
    alter system set db_recovery_file_dest = '/opt/oracle/oradata/recovery_area' scope=spfile;
    shutdown immediate
    startup mount
    -- 开启归档
    alter database archivelog;
    alter database open;
    -- 查看当前归档模式，是归档还是非归档
    archive log list
    -- 开启数据库级别的日志数据
    ALTER DATABASE ADD SUPPLEMENTAL LOG DATA;
    exit;
EOF