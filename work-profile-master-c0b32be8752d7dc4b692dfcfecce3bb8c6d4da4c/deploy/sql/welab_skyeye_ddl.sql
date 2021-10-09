
DROP DATABASE IF EXISTS `welab_skyeye`;
CREATE DATABASE `welab_skyeye` CHARACTER SET utf8 COLLATE utf8_bin;
USE `welab_skyeye`;

-- ----------------------------
-- Table structure for alarm_detail
-- ----------------------------
DROP TABLE IF EXISTS `alarm_detail`;
CREATE TABLE `alarm_detail`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `msg_id` BIGINT(20) NOT NULL COMMENT '辅助字段：告警信息唯一ID',
  `name` VARCHAR(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '告警名',
  `content` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '告警数据',
  `level_type` INT(11) NOT NULL COMMENT '级别：1=CRITICAL 2=WARNING 3=NORMAL',
  `owners` VARCHAR(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '维护人、组',
  `sender` VARCHAR(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '告警发送方',
  `receivers` VARCHAR(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '告警接收方(姓名)',
  `action_types` VARCHAR(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '告警方式组：1=SMS 2=EMAIL 3=WXWORK',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_name`(`name`) USING BTREE COMMENT '告警名',
  INDEX `idx_owners`(`owners`) USING BTREE COMMENT '维护人、组',
  INDEX `idx_sender`(`sender`) USING BTREE COMMENT '告警发送方'
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '告警明细表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for app
-- ----------------------------
DROP TABLE IF EXISTS `app`;
CREATE TABLE `app`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `remark` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `gmt_create` DATETIME(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`name`) USING BTREE COMMENT 'app名唯一索引'
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'app表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for app_jar
-- ----------------------------
DROP TABLE IF EXISTS `app_jar`;
CREATE TABLE `app_jar`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'jar包名称',
  `app_name` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'app名称',
  `time` DATETIME(0) NOT NULL COMMENT '引用时间',
  `gmt_create` DATETIME(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_app_jar`(`app_name`, `name`) USING BTREE COMMENT '唯一标识索引',
  INDEX `idx_name`(`name`) USING BTREE COMMENT 'jar包名称索引',
  INDEX `idx_time`(`time`) USING BTREE COMMENT '时间索引'
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'app引用jar包表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for app_metric
-- ----------------------------
DROP TABLE IF EXISTS `app_metric`;
CREATE TABLE `app_metric`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `app_id` BIGINT(20) UNSIGNED NOT NULL COMMENT 'app_id',
  `metric_id` BIGINT(20) UNSIGNED NOT NULL COMMENT 'metric_id',
  `type` INT(11) NOT NULL COMMENT '类别：1=error 2=warn 3=info',
  `remark` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `gmt_create` DATETIME(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_app_metric`(`app_id`, `metric_id`, `type`) USING BTREE COMMENT '组合唯一索引',
  INDEX `idx_metric`(`metric_id`) USING BTREE COMMENT '指标索引'
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'app指标表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for app_metric_group
-- ----------------------------
DROP TABLE IF EXISTS `app_metric_group`;
CREATE TABLE `app_metric_group`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `app_metric_id` BIGINT(20) UNSIGNED NOT NULL COMMENT 'app_metric_id',
  `metric_group_id` BIGINT(20) UNSIGNED NOT NULL COMMENT 'metric_group_id',
  `gmt_create` DATETIME(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_app_metric_group`(`app_metric_id`, `metric_group_id`) USING BTREE COMMENT '组合唯一索引',
  INDEX `idx_metric_group`(`metric_group_id`) USING BTREE COMMENT '指标组索引'
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'app指标组表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for cdc_collect_attr
-- ----------------------------
DROP TABLE IF EXISTS `cdc_collect_attr`;
CREATE TABLE `cdc_collect_attr`  (
  `id` BIGINT(20) UNSIGNED NOT NULL COMMENT '主键',
  `monitor_id` BIGINT(20) UNSIGNED NOT NULL COMMENT 'cdc_monitor_cfg的主键',
  `collect_id` BIGINT(20) UNSIGNED NOT NULL COMMENT 'cdc_collect_cfg的主键',
  `attr_key` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '自定义Key',
  `attr_value` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '自定义Value',
  `state` TINYINT(1) UNSIGNED NOT NULL COMMENT '状态，0=删除，1=存在',
  `gmt_create` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_monitorId_collectId`(`monitor_id`, `collect_id`) USING BTREE
) ENGINE = INNODB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = ' 指标收集的自定义配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for cdc_collect_cfg
-- ----------------------------
DROP TABLE IF EXISTS `cdc_collect_cfg`;
CREATE TABLE `cdc_collect_cfg`  (
  `id` BIGINT(20) NOT NULL COMMENT '主键',
  `monitor_id` BIGINT(20) NOT NULL COMMENT '监控配置ID',
  `indicator_code` INT(11) NOT NULL COMMENT '收集的指标类型，1=慢SQL，2=分区，3=索引',
  `state` TINYINT(1) UNSIGNED ZEROFILL NOT NULL DEFAULT 1 COMMENT '0=删除，1=存在',
  `gmt_create` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据库采集扩展配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for cdc_impala_slow_sql_detail
-- ----------------------------
DROP TABLE IF EXISTS `cdc_impala_slow_sql_detail`;
CREATE TABLE `cdc_impala_slow_sql_detail`  (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `slow_sql_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '慢sql指纹id',
  `sql_statement` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '执行sql',
  `query_id` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Impala查询id',
  `query_type` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '查询类型。可能的值为：DML，DDL，QUERY和UNKNOWN',
  `query_state` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '查询状态。可能的值包括：CREATED, INITIALIZED, COMPILED, RUNNING, FINISHED, EXCEPTION, UNKNOWN',
  `start_time` DATETIME(0) NOT NULL COMMENT '查询开始的时间',
  `end_time` DATETIME(0) NULL DEFAULT NULL COMMENT '查询完成的时间',
  `rows_produced` BIGINT(64) NULL DEFAULT NULL COMMENT '查询产生的行数',
  `user_name` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '此查询的用户',
  `memory_accrual` BIGINT(64) NOT NULL DEFAULT 0 COMMENT '应计内存（以byte为单位）',
  `thread_cpu_time_percentage` INT(4) NOT NULL DEFAULT 0 COMMENT 'CPU时间百分比',
  `thread_cpu_time` BIGINT(64) NOT NULL DEFAULT 0 COMMENT 'CPU时间（以毫秒为单位）',
  `db_name` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '此查询的数据库',
  `duration_millis` BIGINT(64) NULL DEFAULT NULL COMMENT '查询的持续时间（以毫秒为单位）',
  `issue_level` INT(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '严重等级 1=一般 2=警告 3=严重',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_query_id`(`query_id`) USING BTREE,
  INDEX `idx_slow_sql_id`(`slow_sql_id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Impala慢sql详情表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for cdc_issue_summary
-- ----------------------------
DROP TABLE IF EXISTS `cdc_issue_summary`;
CREATE TABLE `cdc_issue_summary`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ds_id` BIGINT(20) UNSIGNED NOT NULL COMMENT '数据源ID',
  `db_type` INT(10) UNSIGNED NOT NULL COMMENT '数据库类型',
  `db_name` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据库名称',
  `sql_count` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '问题SQL统计数目',
  `sql_total` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'SQL总数',
  `slow_sql_ratio` DOUBLE UNSIGNED NOT NULL DEFAULT 0 COMMENT '慢SQL占比',
  `idx_count` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '问题索引统计数目',
  `idx_total` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '索引总数',
  `incorrect_idx_ratio` DOUBLE UNSIGNED NOT NULL DEFAULT 0 COMMENT '异常索引占比',
  `partition_count` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '问题分区统计数目',
  `partition_total` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '分区配置总数',
  `incorrect_partition_ratio` DOUBLE UNSIGNED NOT NULL DEFAULT 0 COMMENT '异常分区配置占比',
  `issue_score` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '问题评分',
  `issue_level` INT(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '问题等级（1=普通，2=警告，3=严重）',
  `gmt_create` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_dsId_dbName`(`ds_id`, `db_name`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '诊断问题汇总表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for cdc_monitor_cfg
-- ----------------------------
DROP TABLE IF EXISTS `cdc_monitor_cfg`;
CREATE TABLE `cdc_monitor_cfg`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cfg_name` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '监控配置名称',
  `ds_id` BIGINT(20) UNSIGNED NOT NULL COMMENT '数据源ID',
  `ds_alias` VARCHAR(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据源名',
  `db_type` INT(10) UNSIGNED NOT NULL COMMENT '数据库类型',
  `db_name` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据库名',
  `ds_authorization_code` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据源授权码',
  `exe_cron` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '定时执行的cron表达式',
  `cfg_desc` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述',
  `state` TINYINT(1) NOT NULL DEFAULT 1 COMMENT '0=删除， 1=存在',
  `open_state` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '开启状态，0=关闭，1=开启',
  `gmt_create` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_dsId`(`ds_id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '云数据中心，数据源监控配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for cdc_pg_index
-- ----------------------------
DROP TABLE IF EXISTS `cdc_pg_index`;
CREATE TABLE `cdc_pg_index`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ds_id` BIGINT(20) UNSIGNED NOT NULL COMMENT '数据源ID',
  `db_id` BIGINT(20) UNSIGNED NOT NULL COMMENT 'PG 数据库oid',
  `table_id` BIGINT(20) UNSIGNED NOT NULL COMMENT 'PG 表oid',
  `index_id` BIGINT(20) UNSIGNED NOT NULL COMMENT 'PG 索引oid',
  `db_name` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'PG 数据库名称',
  `schema_name` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'PG schema名称',
  `table_name` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '表名',
  `index_name` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '索引名',
  `table_space` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'PG 表空间名称',
  `index_def` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '索引定义语句',
  `seq_scan` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '顺序扫描次数',
  `seq_tup_read` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '顺序扫描返回的行数',
  `idx_scan` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '索引扫描次数',
  `idx_tup_read` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '索引扫描返回的行数',
  `idx_tup_fetch` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '索引扫描抓取的活表行数',
  `idx_blks_read` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '索引读取的磁盘块儿数',
  `idx_blks_hit` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '索引命中的缓存块儿数',
  `idx_scan_ratio` DOUBLE UNSIGNED NOT NULL DEFAULT 0 COMMENT '索引扫描占总扫描次数的百分比',
  `idx_tup_read_ratio` DOUBLE UNSIGNED NOT NULL DEFAULT 0 COMMENT '索引扫描返回的行数占总返回行数的百分比',
  `issue_level` INT(10) UNSIGNED NOT NULL COMMENT '严重等级',
  `gmt_create` TIMESTAMP(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_dsId_dbId_tableId_indexId`(`ds_id`, `db_id`, `table_id`, `index_id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'pg索引收集' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for cdc_pg_sql
-- ----------------------------
DROP TABLE IF EXISTS `cdc_pg_sql`;
CREATE TABLE `cdc_pg_sql`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ds_id` BIGINT(20) UNSIGNED NOT NULL COMMENT '金乌数据源ID',
  `user_id` BIGINT(20) UNSIGNED NOT NULL COMMENT '数据库登录账户oid',
  `db_id` BIGINT(20) UNSIGNED NOT NULL COMMENT '数据库oid',
  `query_id` BIGINT(20) UNSIGNED NOT NULL COMMENT 'pg queryid',
  `db_name` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据库库名',
  `account_name` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据库登录账户名',
  `sql_statement` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'SQL语句',
  `total_row` BIGINT(20) UNSIGNED NOT NULL COMMENT 'SQL语句影响行数',
  `calls` BIGINT(20) UNSIGNED NOT NULL COMMENT '调用次数',
  `total_time` BIGINT(20) UNSIGNED NOT NULL COMMENT '总花费时间，毫秒',
  `mean_time` BIGINT(20) UNSIGNED NOT NULL COMMENT '平均花费时间，毫秒',
  `mean_row` BIGINT(20) UNSIGNED NOT NULL COMMENT '平均影响行数',
  `issue_level` INT(10) UNSIGNED NOT NULL COMMENT '严重等级',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '记录创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_dsId_userId_dbId_queryId`(`ds_id`, `user_id`, `db_id`, `query_id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '云数据中心，收集PG的SQL执行信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for cdc_pg_sql_snapshot
-- ----------------------------
DROP TABLE IF EXISTS `cdc_pg_sql_snapshot`;
CREATE TABLE `cdc_pg_sql_snapshot`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '快照ID',
  `pg_sql_id` BIGINT(20) UNSIGNED NOT NULL COMMENT 'cdc_pg_sql表的主键',
  `total_row` BIGINT(20) UNSIGNED NOT NULL COMMENT 'SQL语句影响行数（快照）',
  `calls` BIGINT(20) UNSIGNED NOT NULL COMMENT '调用次数（快照）',
  `total_time` BIGINT(20) UNSIGNED NOT NULL COMMENT '总花费时间，毫秒（快照）',
  `mean_time` BIGINT(20) UNSIGNED NOT NULL COMMENT '平均花费时间，毫秒（快照）',
  `mean_row` BIGINT(20) UNSIGNED NOT NULL COMMENT '平均影响行数',
  `gmt_snapshot_minute` DATETIME(0) NOT NULL COMMENT '快照产生时间，精度 分钟',
  `gmt_snapshot_hour` DATETIME(0) NOT NULL COMMENT '快照产生时间，精度 小时',
  `gmt_snapshot_day` DATE NOT NULL COMMENT '快照产生时间，精度 天',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_meanTime_snapshotTime`(`mean_time`, `gmt_snapshot_minute`, `gmt_snapshot_hour`, `gmt_snapshot_day`) USING BTREE,
  INDEX `idx_meanTime`(`mean_time`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'pg慢sql快照信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for cdc_slow_sql
-- ----------------------------
DROP TABLE IF EXISTS `cdc_slow_sql`;
CREATE TABLE `cdc_slow_sql`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `ds_id` BIGINT(20) UNSIGNED NOT NULL COMMENT '数据源ID',
  `db_type` TINYINT(3) UNSIGNED NOT NULL COMMENT '数据库类型，0=mysql，1=pg，2=impala，3=oracle，4=sqlsever...',
  `db_name` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据库库名',
  `account_name` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据库账号名',
  `sql_finger` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'sql指纹',
  `hash_sign` BIGINT(20) NOT NULL COMMENT '(db_name + sql_finger) 的 hash 值',
  `mean_time` BIGINT(20) UNSIGNED NOT NULL COMMENT 'sql平均执行时间，单位：毫秒',
  `state` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态。 0=删除，1=存在',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_dbName_dsId`(`db_name`, `ds_id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '慢sql指纹表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for cdc_table_issue_summary
-- ----------------------------
DROP TABLE IF EXISTS `cdc_table_issue_summary`;
CREATE TABLE `cdc_table_issue_summary`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ds_id` BIGINT(20) UNSIGNED NOT NULL COMMENT '数据源ID',
  `db_type` INT(10) UNSIGNED NOT NULL COMMENT '数据库类型',
  `db_name` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据库名称',
  `table_name` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表名',
  `sql_count` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '问题SQL统计数目',
  `sql_total` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'SQL总数',
  `slow_sql_ratio` DOUBLE UNSIGNED NOT NULL DEFAULT 0 COMMENT '慢SQL占比',
  `idx_count` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '问题索引统计数目',
  `idx_total` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '索引总数',
  `incorrect_idx_ratio` DOUBLE UNSIGNED NOT NULL DEFAULT 0 COMMENT '异常索引占比',
  `is_bad_partition` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '分区是否有异常（0=正常，1=异常）',
  `issue_score` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '问题评分',
  `issue_level` INT(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '问题等级（1=普通，2=警告，3=严重）',
  `gmt_create` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '表问题汇总' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for cdc_table_partition
-- ----------------------------
DROP TABLE IF EXISTS `cdc_table_partition`;
CREATE TABLE `cdc_table_partition`  (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `dataasset_table_id` INT(8) NOT NULL DEFAULT 0 COMMENT '表id(数据资产的表id)',
  `table_type` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表类型：hive和kudu',
  `table_name` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表名',
  `partition_detail` VARCHAR(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分区语句详情',
  `partition_by` INT(4) NULL DEFAULT NULL COMMENT '分区类型: 1=HASH分区 2=RANGE分区 3=HASH and RANGE高级分区',
  `partition_range` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分区范围(针对于range分区)',
  `partition_num` INT(11) NULL DEFAULT NULL COMMENT '分区数(针对于hash分区)',
  `issue_level` INT(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '严重等级 1=一般 2=警告 3=严重',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_dataasset_table_id`(`dataasset_table_id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'impala分区表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for cdc_table_sql_map
-- ----------------------------
DROP TABLE IF EXISTS `cdc_table_sql_map`;
CREATE TABLE `cdc_table_sql_map`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `db_type` INT(10) UNSIGNED NOT NULL COMMENT '数据库类型',
  `ds_id` BIGINT(20) UNSIGNED NOT NULL COMMENT '数据源id',
  `sql_id` BIGINT(20) UNSIGNED NOT NULL COMMENT 'SQL语句id',
  `db_name` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '库名',
  `table_name` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表名',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_dsId_dbName_tableName`(`ds_id`, `db_name`, `table_name`) USING BTREE,
  INDEX `idx_sqlId`(`sql_id`) USING BTREE,
  INDEX `idx_tableName`(`table_name`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'sql与表的关联关系' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for check_table
-- ----------------------------
DROP TABLE IF EXISTS `check_table`;
CREATE TABLE `check_table`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '表ID',
  `task_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '比对任务ID',
  `task_nm` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '校验名称',
  `s_db_nm` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '源库数据源名称',
  `s_db_id` BIGINT(20) NULL DEFAULT NULL COMMENT '源库数据源ID',
  `s_tb_nm` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '源库数据表名称',
  `t_db_nm` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '目标库数据源名称',
  `t_db_id` BIGINT(20) NULL DEFAULT NULL COMMENT '目标库数据源ID',
  `t_tb_nm` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '目标库数据表名称',
  `t_pks_clm` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'id' COMMENT '目标表主键列(默认为:id)，用于目标库比对提取数据的条件列',
  `s_pks_clm` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'id' COMMENT '原表主键列(默认为:id),用于源库比对提取数据的条件列',
  `status` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '状态(默认为0:未激活,1:已激活)',
  `create_at` DATETIME(0) NOT NULL COMMENT '创建时间',
  `update_at` DATETIME(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_check_table_task_nm`(`task_nm`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '比对表信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for check_table_column
-- ----------------------------
DROP TABLE IF EXISTS `check_table_column`;
CREATE TABLE `check_table_column`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '表ID',
  `check_table_id` BIGINT(20) NOT NULL COMMENT '比对表ID',
  `s_tbl_clm_nm` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '比对源表列字段名称',
  `s_tbl_clm_type` INT(11) NULL DEFAULT NULL COMMENT '比对源表列字段类型',
  `t_tbl_clm_nm` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '比对目标表列字段名称',
  `t_tbl_clm_type` INT(11) NULL DEFAULT NULL COMMENT '比对目标表列字段类型',
  `t_is_primary_key` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否是目标表为主键',
  `time_difference` INT(11) NULL DEFAULT NULL COMMENT '时间类型,时间距北京时区的时差',
  `s_is_primary_key` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否是原表为主键',
  `is_create_time` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否是创建时间列(默认为0:否，1:是)',
  `check_flag` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '比对标识(默认为0:不比对,1:比对)',
  `create_at` DATETIME(0) NOT NULL COMMENT '创建时间',
  `update_at` DATETIME(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_check_table_column`(`check_table_id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '比对表字段列信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for check_table_column_config
-- ----------------------------
DROP TABLE IF EXISTS `check_table_column_config`;
CREATE TABLE `check_table_column_config`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '表ID',
  `check_table_config_id` BIGINT(20) NOT NULL COMMENT '比对表ID',
  `s_tbl_clm_nm` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '比对源表列字段名称',
  `s_tbl_clm_type` INT(11) NULL DEFAULT NULL COMMENT '比对源表列字段类型',
  `t_tbl_clm_nm` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '比对目标表列字段名称',
  `t_tbl_clm_type` INT(11) NULL DEFAULT NULL COMMENT '比对目标表列字段类型',
  `t_is_primary_key` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否是目标表为主键',
  `time_difference` INT(11) NULL DEFAULT NULL COMMENT '时间类型,时间距北京时区的时差',
  `s_is_primary_key` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否是原表为主键',
  `is_create_time` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否是创建时间列(默认为0:否，1:是)',
  `check_flag` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '比对标识(默认为0:不比对,1:比对)',
  `create_at` DATETIME(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_check_table_config_id`(`check_table_config_id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '比对表字段列配置信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for check_table_config
-- ----------------------------
DROP TABLE IF EXISTS `check_table_config`;
CREATE TABLE `check_table_config`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '表ID',
  `topology_id` BIGINT(20) NOT NULL COMMENT '关联的dbus拓扑任务ID',
  `task_nm` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '校验名称',
  `s_db_nm` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '源库数据源名称',
  `s_db_id` BIGINT(20) NULL DEFAULT NULL COMMENT '源库数据源ID',
  `s_tb_nm` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '源库数据表名称',
  `t_db_nm` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '目标库数据源名称',
  `t_db_id` BIGINT(20) NULL DEFAULT NULL COMMENT '目标库数据源ID',
  `t_tb_nm` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '目标库数据表名称',
  `s_pks_clm` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'id' COMMENT '原表主键列(默认为:id),用于比对提取数据的条件列',
  `t_pks_clm` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'id' COMMENT '目标表主键列(默认为:id),用于目标表比对提取数据的条件列',
  `status` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '状态(默认为0:未激活,1:已激活)',
  `create_at` DATETIME(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_check_table_config`(`s_db_id`, `s_tb_nm`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '比对表配置信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for check_table_detail
-- ----------------------------
DROP TABLE IF EXISTS `check_table_detail`;
CREATE TABLE `check_table_detail`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '表ID',
  `check_table_id` BIGINT(20) NOT NULL COMMENT 'check_table表ID',
  `check_total` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '比对总记录数',
  `diff_total` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '比对不同记录总数',
  `check_postion` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '比对位置',
  `check_status` TINYINT(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '比对状态(默认0:待比对,1:比对中,2:比对成功,3:比对失败,4:比对异常)',
  `check_detail` MEDIUMTEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '比对记录详情',
  `start_time` DATETIME(0) NOT NULL COMMENT '开始时间',
  `end_time` DATETIME(0) NULL DEFAULT NULL COMMENT '结束时间',
  `remark` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_check_table_id`(`check_table_id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '比对表详情信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for check_task
-- ----------------------------
DROP TABLE IF EXISTS `check_task`;
CREATE TABLE `check_task`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '表ID',
  `task_name` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `task_type` TINYINT(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '任务类型(默认0:单次执行,1:定时执行,2:轮询执行)',
  `task_cron` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务cron(任务类型为非0,有效)',
  `status` TINYINT(1) NULL DEFAULT 0 COMMENT '任务状态(默认0:未激活,1:已激活)',
  `task_status` TINYINT(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '执行状态(默认0:未开始,1:执行中,2:执行成功,3:执行失败)',
  `thread_num` TINYINT(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '并发线程数据(默认为:1)',
  `sys_task_id` BIGINT(20) NULL DEFAULT NULL COMMENT '第三方系统比对任务ID',
  `task_source_type` TINYINT(3) UNSIGNED NULL DEFAULT 0 COMMENT '任务创建来源类型（默认为0:自创建，1:dbus，2：dw)',
  `cost_time` INT(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '任务耗时',
  `remark` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_at` DATETIME(0) NOT NULL COMMENT '创建时间',
  `update_at` DATETIME(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_check_task_name`(`task_name`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '比对任务信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `app_id` BIGINT(20) UNSIGNED NOT NULL COMMENT 'app_id',
  `name` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称(全限定名)',
  `gmt_create` DATETIME(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`name`) USING BTREE COMMENT '类名唯一索引',
  INDEX `idx_app`(`app_id`) USING BTREE COMMENT 'app索引'
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'class表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for code_commit
-- ----------------------------
DROP TABLE IF EXISTS `code_commit`;
CREATE TABLE `code_commit`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code_repository_id` BIGINT(20) UNSIGNED NOT NULL COMMENT '代码仓库id',
  `developer_id` BIGINT(20) UNSIGNED NOT NULL COMMENT '开发人员id',
  `time` DATETIME(0) NOT NULL COMMENT '提交时间',
  `message` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '提交信息',
  `sign` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '提交唯一标识',
  `gmt_create` DATETIME(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_sign`(`sign`) USING BTREE COMMENT '唯一标识索引'
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码提交记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for code_repository
-- ----------------------------
DROP TABLE IF EXISTS `code_repository`;
CREATE TABLE `code_repository`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `app_name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'app名称',
  `branch` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '分支',
  `address` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '地址',
  `app_group` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'app组名',
  `gmt_create` DATETIME(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_app_name`(`app_name`) USING BTREE COMMENT 'app唯一索引'
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '代码仓库表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for config_role_share
-- ----------------------------
DROP TABLE IF EXISTS `config_role_share`;
CREATE TABLE `config_role_share`  (
  `id` BIGINT(20) UNSIGNED NOT NULL COMMENT '主键id',
  `config_type` INT(11) NOT NULL COMMENT '业务配置类型',
  `config_id` BIGINT(20) NOT NULL COMMENT '业务数据id',
  `role_id` BIGINT(20) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_config_type_role_id`(`config_id`, `config_type`, `role_id`) USING BTREE
) ENGINE = INNODB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '业务配置角色分享表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for config_user_share
-- ----------------------------
DROP TABLE IF EXISTS `config_user_share`;
CREATE TABLE `config_user_share`  (
  `id` BIGINT(20) UNSIGNED NOT NULL COMMENT '主键id',
  `config_type` INT(11) NOT NULL COMMENT '业务配置类型',
  `config_id` BIGINT(20) NOT NULL COMMENT '业务数据id',
  `user_id` BIGINT(20) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_config_type_user_id`(`config_id`, `config_type`, `user_id`) USING BTREE
) ENGINE = INNODB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '业务配置用户分享表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for cuber_build
-- ----------------------------
DROP TABLE IF EXISTS `cuber_build`;
CREATE TABLE `cuber_build`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cuber_request_id` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Cuber唯一标识',
  `cuber_unit_id` BIGINT(20) UNSIGNED NOT NULL COMMENT 'Cuber的Unit的ID',
  `cuber_unit` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Cuber的Unit',
  `cuber_start_point` DATETIME(0) NOT NULL COMMENT 'Cuber的滚动的实际起点,根据cuber_unit计算而来',
  `cuber_end_point` DATETIME(0) NOT NULL COMMENT 'Cuber的滚动的终点,根据cuber_unit计算而来',
  `data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT 'Build时构建的SQL,版本不变时记录的是版本值',
  `start_time` DATETIME(0) NULL DEFAULT NULL COMMENT 'Build正式构建开始时间',
  `end_time` DATETIME(0) NULL DEFAULT NULL COMMENT 'Build正式构建结束时间',
  `execute_state` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Build构建状态,RUN构建中,SUCCESS/FAIL构建完成',
  `execute_time` INT(11) NOT NULL DEFAULT 0 COMMENT 'Build构建耗时',
  `row_number` INT(11) NOT NULL DEFAULT 0 COMMENT 'Build构建影响行数',
  `is_state` TINYINT(1) NOT NULL DEFAULT 1 COMMENT '是否有效,1有效,0无效',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_request_id`(`cuber_request_id`, `is_state`, `execute_state`) USING BTREE COMMENT 'Cuber唯一标识索引'
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '数据Cuber构建' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for cuber_define
-- ----------------------------
DROP TABLE IF EXISTS `cuber_define`;
CREATE TABLE `cuber_define`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cuber_name` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Cuber名称',
  `cuber_request_id` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Cuber唯一标识',
  `cuber_uuid` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Cuber关联标识',
  `data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT 'JSON格式的查询参数数据,目的是用来组装SQL',
  `avg_time` INT(11) NOT NULL DEFAULT 1 COMMENT '近10次成功构建的平均耗时(构建失败的耗时不算)',
  `is_approx` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否近似,1是,0否',
  `is_state` TINYINT(1) NOT NULL DEFAULT 1 COMMENT '是否有效,1有效,0无效',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_cuber_define`(`cuber_uuid`, `is_state`) USING BTREE COMMENT 'Cuber唯一索引'
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Rolling Cuber定义' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for cuber_unit
-- ----------------------------
DROP TABLE IF EXISTS `cuber_unit`;
CREATE TABLE `cuber_unit`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cuber_request_id` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Cuber唯一标识',
  `cuber_unit` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Cuber的Unit',
  `cuber_start_point` DATETIME(0) NULL DEFAULT NULL COMMENT 'Cuber当前构建时间',
  `cuber_temporary_point` DATETIME(0) NULL DEFAULT NULL COMMENT 'Cuber临时构建时间',
  `cuber_default_point` DATETIME(0) NULL DEFAULT NULL COMMENT 'Cuber默认构建时间',
  `cuber_afresh` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否重新刷新Cuber,1需要,0不需要',
  `avg_time` INT(11) NOT NULL DEFAULT 0 COMMENT '近10次成功构建的平均耗时(构建失败的耗时不算)',
  `execute_success` INT(11) NOT NULL DEFAULT 0 COMMENT 'Build构建成功次数',
  `execute_fail` INT(11) NOT NULL DEFAULT 0 COMMENT 'Build构建失败次数',
  `query_number` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '查询次数',
  `last_query_time` DATETIME(0) NULL DEFAULT NULL COMMENT '最后查询时间',
  `is_state` TINYINT(1) NOT NULL DEFAULT 1 COMMENT '是否有效,1有效,0无效',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_cuber_unit`(`cuber_request_id`, `cuber_unit`, `is_state`) USING BTREE COMMENT 'Cuber的Unit唯一索引'
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Rolling Cuber Unit定义' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dashboard_overview
-- ----------------------------
DROP TABLE IF EXISTS `dashboard_overview`;
CREATE TABLE `dashboard_overview`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '名称',
  `is_built_in` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否内置：1=是 0=不是',
  `is_public` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否公开：1=是 0=不是',
  `config` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT 'json格式的配置数据',
  `is_shared` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否已分享 0=否 1=是',
  `is_datav` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否是图源总览 0=否 1=是',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '数据总览表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dashboard_overview_panel
-- ----------------------------
DROP TABLE IF EXISTS `dashboard_overview_panel`;
CREATE TABLE `dashboard_overview_panel`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `overview_id` BIGINT(20) UNSIGNED NOT NULL COMMENT 'overview_id',
  `panel_id` BIGINT(20) UNSIGNED NOT NULL COMMENT 'panel_id',
  `sort` BIGINT(20) NOT NULL COMMENT '总览内面板的排序',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_overview_panel`(`overview_id`, `panel_id`) USING BTREE COMMENT '组合唯一索引'
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '数据总览面板表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dashboard_overview_share
-- ----------------------------
DROP TABLE IF EXISTS `dashboard_overview_share`;
CREATE TABLE `dashboard_overview_share`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `overview_id` BIGINT(20) UNSIGNED NOT NULL COMMENT '数据总览id',
  `share_id` BIGINT(20) UNSIGNED NOT NULL COMMENT '分享者id(用户或者组)',
  `type` TINYINT(2) NOT NULL COMMENT '分享者类型 1用户 2角色(组)',
  `state` TINYINT(1) NOT NULL DEFAULT 1 COMMENT '状态 0失效 1有效',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建记录时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新记录时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '数据总览分享表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dashboard_panel
-- ----------------------------
DROP TABLE IF EXISTS `dashboard_panel`;
CREATE TABLE `dashboard_panel`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '名称',
  `type` INT(11) NOT NULL COMMENT '类型：1=事件分析 2=漏斗分析 3=留存分析 4=分布分析 5=属性分析 6=渠道对比',
  `data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT 'json格式的查询参数数据',
  `config` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT 'json格式的配置数据',
  `user_id` BIGINT(20) UNSIGNED NULL DEFAULT NULL COMMENT '数据面板所属人id',
  `is_shared` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否已分享 0=否 1=是',
  `is_msg` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否发送邮件 0=否 1=是',
  `msg_config` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '邮件发送配置信息',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '数据面板表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dashboard_panel_send
-- ----------------------------
DROP TABLE IF EXISTS `dashboard_panel_send`;
CREATE TABLE `dashboard_panel_send`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `panel_id` BIGINT(20) NOT NULL COMMENT '面板id',
  `receivers` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '收件人',
  `send_time` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '发送时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_panel_id`(`panel_id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '面板发送表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dashboard_panel_share
-- ----------------------------
DROP TABLE IF EXISTS `dashboard_panel_share`;
CREATE TABLE `dashboard_panel_share`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `panel_id` BIGINT(20) UNSIGNED NOT NULL COMMENT '面板id',
  `share_id` BIGINT(20) UNSIGNED NOT NULL COMMENT '分享者id(用户或者组)',
  `type` TINYINT(2) NOT NULL COMMENT '分享者类型 1用户 2角色(组)',
  `state` TINYINT(1) NOT NULL DEFAULT 1 COMMENT '状态 0失效 1有效',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建记录时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新记录时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '面板分享关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dashboard_ureport
-- ----------------------------
DROP TABLE IF EXISTS `dashboard_ureport`;
CREATE TABLE `dashboard_ureport`  (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `ureport_name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单名称',
  `ureport_xml` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '表单内容',
  `state` TINYINT(1) NULL DEFAULT NULL COMMENT '状态',
  `gmt_create` DATETIME(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NULL DEFAULT NULL COMMENT '修改时间',
  `overview_ids` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属面板的集合',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '设计表存储' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dashboard_user_overview
-- ----------------------------
DROP TABLE IF EXISTS `dashboard_user_overview`;
CREATE TABLE `dashboard_user_overview`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT(20) UNSIGNED NOT NULL COMMENT 'user_id',
  `overview_id` BIGINT(20) UNSIGNED NOT NULL COMMENT 'overview_id',
  `sort` BIGINT(20) NOT NULL COMMENT '用户总览的排序',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_overview`(`user_id`, `overview_id`) USING BTREE COMMENT '组合唯一索引'
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户数据总览表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dataasset_column_info
-- ----------------------------
DROP TABLE IF EXISTS `dataasset_column_info`;
CREATE TABLE `dataasset_column_info`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `column_name` VARCHAR(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '列名称',
  `column_type` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '列类型',
  `column_comment` VARCHAR(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列的原生注释',
  `column_alias` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列别名',
  `dataasset_table_id` INT(8) NOT NULL COMMENT '数据资产-表id',
  `has_processed_encrypted` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否做了加密处理（1 表示是，0 表示否）默认0',
  `status` TINYINT(2) NOT NULL DEFAULT 0 COMMENT '表状态（0，有效；1，已删除）',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tableId`(`dataasset_table_id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据资产-列信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dataasset_ds_info
-- ----------------------------
DROP TABLE IF EXISTS `dataasset_ds_info`;
CREATE TABLE `dataasset_ds_info`  (
  `id` INT(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `ds_id` BIGINT(10) NOT NULL COMMENT '数据源ID',
  `ds_name` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '冗余数据源名称',
  `ds_db_type` INT(11) NOT NULL COMMENT '冗余数据源类型',
  `ds_schema_name` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据源库名称',
  `ds_alias` VARCHAR(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据源库名称-别名',
  `group_id` BIGINT(20) NULL DEFAULT -1 COMMENT '冗余分组id(取的标签分组id)',
  `cur_storage_space` BIGINT(63) UNSIGNED NOT NULL DEFAULT 0 COMMENT '存储空间大小（单位：B）',
  `cur_rows_count` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '当前总记录数',
  `started` TINYINT(1) NOT NULL DEFAULT 1 COMMENT '是否启动统计资产任务（默认是）',
  `status` INT(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态，0：生效，10连接不通，99强制失效',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_ds_id`(`ds_id`) USING BTREE,
  INDEX `idx_groupId`(`group_id`) USING BTREE,
  INDEX `idx_dbType`(`ds_db_type`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据资产-数据源信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dataasset_overview_summary
-- ----------------------------
DROP TABLE IF EXISTS `dataasset_overview_summary`;
CREATE TABLE `dataasset_overview_summary`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ds_count` INT(11) NOT NULL DEFAULT 0 COMMENT '实例总数',
  `table_count` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '表总数',
  `rows_count` BIGINT(50) NOT NULL DEFAULT 0 COMMENT '记录总数',
  `storage_space` BIGINT(100) NOT NULL DEFAULT 0 COMMENT '总存储',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据总览汇总表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dataasset_table_info
-- ----------------------------
DROP TABLE IF EXISTS `dataasset_table_info`;
CREATE TABLE `dataasset_table_info`  (
  `id` INT(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `table_name` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表的名称',
  `table_comment` VARCHAR(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表的业务库原生注释',
  `table_alias` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表别名',
  `dataasset_ds_id` INT(11) NOT NULL COMMENT '数据资产-数据源id',
  `cur_storage_space` BIGINT(63) UNSIGNED NOT NULL DEFAULT 0 COMMENT '存储空间大小（单位：B）',
  `cur_rows_count` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '当前总记录数',
  `status` TINYINT(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '表状态（0，有效；1，已删除）',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_dataassetDsId`(`dataasset_ds_id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据资产-表信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dataasset_task_record
-- ----------------------------
DROP TABLE IF EXISTS `dataasset_task_record`;
CREATE TABLE `dataasset_task_record`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `task_type` TINYINT(2) NOT NULL COMMENT '任务类型（0，数据库任务；1，表任务）',
  `task_biz_id` INT(11) NOT NULL COMMENT '数据资产-数据源id/表id',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '任务执行时间',
  `before_storage_space` BIGINT(63) UNSIGNED NOT NULL COMMENT '执行前存储空间大小（单位：B）',
  `before_rows_count` BIGINT(20) NOT NULL COMMENT '执行前总记录数',
  `after_storage_space` BIGINT(63) UNSIGNED NOT NULL COMMENT '执行后存储空间大小（单位：B）',
  `after_rows_count` BIGINT(20) NOT NULL COMMENT '执行后总记录数',
  `remark` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_bizId_taskType`(`task_biz_id`, `task_type`) USING BTREE,
  INDEX `idx_create`(`gmt_create`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据资产-任务执行日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for datav_view
-- ----------------------------
DROP TABLE IF EXISTS `datav_view`;
CREATE TABLE `datav_view`  (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '大屏名称',
  `data` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '大屏内容',
  `config` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '大屏配置',
  `user_id` BIGINT(20) NOT NULL COMMENT '创建人',
  `state` TINYINT(1) NOT NULL DEFAULT 1 COMMENT '是否启用 1=启用 0=失效',
  `gmt_create` DATETIME(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据展示大屏' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for datav_view_publish
-- ----------------------------
DROP TABLE IF EXISTS `datav_view_publish`;
CREATE TABLE `datav_view_publish`  (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发布名称',
  `url_sign` VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布url的sign值',
  `period` INT(11) NOT NULL DEFAULT 1 COMMENT '大屏轮询切换时间（单位：秒）',
  `expiry` INT(11) NULL DEFAULT NULL COMMENT '有效期（单位：分钟）',
  `url_expired` DATETIME(0) NULL DEFAULT NULL COMMENT 'url过期时间',
  `is_publish` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否发布 1已发布 0未发布',
  `user_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '创建人',
  `gmt_create` DATETIME(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '大屏发布表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for datav_view_publish_map
-- ----------------------------
DROP TABLE IF EXISTS `datav_view_publish_map`;
CREATE TABLE `datav_view_publish_map`  (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `datav_id` BIGINT(20) NOT NULL COMMENT '大屏id',
  `publish_id` BIGINT(20) NOT NULL COMMENT '发布id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_datav_publish_id`(`datav_id`, `publish_id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据大屏和发布映射关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dataworks_topology
-- ----------------------------
DROP TABLE IF EXISTS `dataworks_topology`;
CREATE TABLE `dataworks_topology`  (
  `id` BIGINT(20) NOT NULL,
  `src_addr` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '来源地址',
  `src_topic` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '来源topic名称',
  `target_sink` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '目标表sink描述 比如kudu',
  `target_url` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '目标表的连接',
  `topo_name` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'topo的名字',
  `target_data_type` INT(2) NOT NULL COMMENT '数据源类型，1=kudu',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dbus_event_report_config
-- ----------------------------
DROP TABLE IF EXISTS `dbus_event_report_config`;
CREATE TABLE `dbus_event_report_config`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `client_type` INT(10) NOT NULL COMMENT '客户端类型：1=iOS 2=Android',
  `config` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '配置信息',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_client_type`(`client_type`) USING BTREE COMMENT '客户端类型唯一索引'
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '事件上报参数配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dbus_event_validate
-- ----------------------------
DROP TABLE IF EXISTS `dbus_event_validate`;
CREATE TABLE `dbus_event_validate`  (
  `id` BIGINT(20) UNSIGNED NOT NULL COMMENT '校验规则主键',
  `validate_table_id` BIGINT(20) UNSIGNED NOT NULL COMMENT '检验规则适用的表ID',
  `validate_db_name` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '检验规则适用的库名',
  `validate_table_name` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '检验规则适用的表名',
  `filter_field_id` BIGINT(20) UNSIGNED NOT NULL COMMENT '指定过滤数据所用的字段ID',
  `filter_field` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '指定过滤数据所用的字段名称',
  `filter_regex` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '指定的过滤字段对应的值满足的条件（正则匹配成功）',
  `validate_field_id` BIGINT(20) NOT NULL COMMENT '指定校验的字段ID',
  `validate_field` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '指定校验的字段名称',
  `validate_type` TINYINT(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '校验方法的类型，1=正则，2=身份证（java程序）',
  `validate_regex` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '校验规则正则表达式',
  `result_field_id` BIGINT(20) NOT NULL COMMENT '校验结果输出的字段ID',
  `result_field` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '校验结果输出的字段名称',
  `result_field_value_type` TINYINT(4) NOT NULL DEFAULT 1 COMMENT '校验结果值的类型。1=boolean 2=结果以数值0/1表示true/false',
  `enable_state` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '启用状态，0=不启用 1=启用',
  `state` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '逻辑删除标识，0=删除 1=存在',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_validate_item`(`validate_db_name`, `validate_table_name`, `filter_field`, `validate_field`, `result_field`) USING BTREE
) ENGINE = INNODB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据总线，事件数据按定义的规则校验，校验结果写入事件数据' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dbus_exception_task
-- ----------------------------
DROP TABLE IF EXISTS `dbus_exception_task`;
CREATE TABLE `dbus_exception_task`  (
  `id` BIGINT(20) UNSIGNED NOT NULL COMMENT '主键',
  `task_type` INT(10) UNSIGNED NOT NULL COMMENT '任务类型。枚举类型参考 TaskTypeEnum 类',
  `task_id` BIGINT(20) UNSIGNED NOT NULL COMMENT '任务主键',
  `task_name` VARCHAR(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `exception_msg` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '异常信息',
  `state` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '存在状态。0=删除，1=存在',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_type_state_time`(`task_type`, `state`, `gmt_create`) USING BTREE,
  INDEX `idx_state_time`(`state`, `gmt_create`) USING BTREE,
  INDEX `idx_task`(`task_type`, `task_id`, `state`) USING BTREE
) ENGINE = INNODB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '运行异常的任务' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dbus_filter
-- ----------------------------
DROP TABLE IF EXISTS `dbus_filter`;
CREATE TABLE `dbus_filter`  (
  `id` BIGINT(20) UNSIGNED NOT NULL COMMENT '主键',
  `topo_id` BIGINT(20) UNSIGNED NOT NULL COMMENT '隶属于拓扑结构的ID',
  `sub_id` BIGINT(20) UNSIGNED NULL DEFAULT NULL COMMENT '子过滤器ID，如果过滤规则是父子关系，运算时，每一族加小括号独立运算',
  `exe_period` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0=前置过滤器（数据结构化之前执行），1=后置过滤器（数据结构化之后执行）',
  `field` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '过滤器作用于的字段',
  `filter_type` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '过滤操作符，类型有lt,gt,eq,ne,le,ge,contain,notContain,startWith,endWith等',
  `filter_sym` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '过滤辅助字符串',
  `logic_calc` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑运算符，0=或 1=与',
  `seq_num` INT(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '执行顺序，由小到大',
  `state` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '逻辑删除标识，0=删除 1=存在',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_topoId_state`(`topo_id`, `state`) USING BTREE
) ENGINE = INNODB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '数据总线，数据过滤规则（符合规则的数据才会采集使用）' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dbus_map_config
-- ----------------------------
DROP TABLE IF EXISTS `dbus_map_config`;
CREATE TABLE `dbus_map_config`  (
  `id` BIGINT(20) UNSIGNED NOT NULL COMMENT '主键',
  `group_id` BIGINT(20) UNSIGNED NOT NULL COMMENT '所属分组ID',
  `src_table_id` BIGINT(20) UNSIGNED NOT NULL COMMENT '源表ID',
  `src_table` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '源表名',
  `src_field_id` BIGINT(20) UNSIGNED NOT NULL COMMENT '源字段ID',
  `src_field` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '源字段名',
  `target_table_id` BIGINT(20) UNSIGNED NULL DEFAULT NULL COMMENT '映射表ID',
  `target_table` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '映射表名',
  `target_field_id` BIGINT(20) UNSIGNED NULL DEFAULT NULL COMMENT '映射字段ID',
  `target_field` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '映射字段名',
  `operate_type` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '操作类型，0=put，缓存数据 1=get，从缓存获取数据追加到当前数据',
  `operate_order` INT(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '操作顺序，当operate_type为get时，根据order进行顺序地追加操作',
  `enable_state` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '启用状态，0=不启用 1=启用',
  `state` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '逻辑删除标识，0=删除 1=存在',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_state`(`enable_state`, `state`) USING BTREE
) ENGINE = INNODB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'dbus采集到的数据，通过关联映射，追加字段的配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dbus_map_config_detail
-- ----------------------------
DROP TABLE IF EXISTS `dbus_map_config_detail`;
CREATE TABLE `dbus_map_config_detail`  (
  `id` BIGINT(20) UNSIGNED NOT NULL COMMENT '主键',
  `config_id` BIGINT(20) UNSIGNED NOT NULL COMMENT '关联的dbus_map_config的ID',
  `src_id` BIGINT(20) UNSIGNED NULL DEFAULT NULL COMMENT '缓存字段的ID',
  `src_value` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '缓存字段的名称',
  `src_value_regex` VARCHAR(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '正则匹配后的值再缓存（可选）',
  `src_value_regex_group_index` INT(11) NULL DEFAULT NULL COMMENT '缓存数据所用到的正则表达式的groupIndex',
  `target_id` BIGINT(20) UNSIGNED NULL DEFAULT NULL COMMENT '追加字段的ID',
  `target_value` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '追加字段的名称',
  `target_value_regex` VARCHAR(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '正则匹配后的值再追加（可选）',
  `target_value_regex_group_index` INT(11) NULL DEFAULT NULL COMMENT '追加数据所用到的正则表达式的groupIndex',
  `state` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '逻辑删除标识，0=删除 1=存在',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_config_id`(`config_id`) USING BTREE
) ENGINE = INNODB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'dbus采集到的数据，通过关联映射，追加字段配置的字段详情。' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dbus_map_group
-- ----------------------------
DROP TABLE IF EXISTS `dbus_map_group`;
CREATE TABLE `dbus_map_group`  (
  `id` BIGINT(20) UNSIGNED NOT NULL COMMENT '主键',
  `group_name` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '映射分组名称',
  `group_desc` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '映射分组描述',
  `state` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '逻辑删除标识，0=删除 1=存在',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据总线，数据血缘关系映射分组' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dbus_operate_trace
-- ----------------------------
DROP TABLE IF EXISTS `dbus_operate_trace`;
CREATE TABLE `dbus_operate_trace`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '留痕ID',
  `task_type` INT(10) UNSIGNED NOT NULL COMMENT '任务类型。1=数据总线表配置 2=拓扑 3=数据同步配置 4=数据映射配置',
  `op_type` INT(10) UNSIGNED NOT NULL COMMENT '操作类型。1=增，2=改，3=删，4=导入，5=导出，6=发布，7=开关，8=开启，9=关闭，10=上线，11=下线，12=运行，13=重跑，14=恢复失败(start_failure_task_process，15=恢复失败(recover_suspended_process)，16=停止，17=暂停，18=设置，19=下载，20=查询',
  `item_id` BIGINT(20) UNSIGNED NOT NULL COMMENT '操作对象的主键',
  `operator_id` BIGINT(20) UNSIGNED NOT NULL COMMENT '操作者用户ID',
  `trace_data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '操作内容',
  `gmt_time` DATETIME(0) NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_task_item_time`(`task_type`, `item_id`, `gmt_time`) USING BTREE,
  INDEX `idx_task_op_operator`(`task_type`, `op_type`, `operator_id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '操作留痕' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dbus_processor
-- ----------------------------
DROP TABLE IF EXISTS `dbus_processor`;
CREATE TABLE `dbus_processor`  (
  `id` BIGINT(20) UNSIGNED NOT NULL COMMENT '主键',
  `topo_id` BIGINT(20) UNSIGNED NULL DEFAULT NULL COMMENT '隶属于拓扑结构的ID',
  `exe_period` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0=过滤前（预处理，结果用来过滤筛选），1=过滤后（正式处理，结果写入kafka）',
  `type` VARCHAR(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '算子类型，可选类型有：filter，split，concat，replace，substring，prefix，append，trim，select，saveas，regextract',
  `seq_num` INT(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '算子的执行顺序，由小到大',
  `state` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '逻辑删除标识，0=删除 1=存在',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `info_hash` VARCHAR(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '算子版本号和核心方法出入参数信息组成的hash值',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_topoId_exePeriod_state`(`topo_id`, `exe_period`, `state`) USING BTREE
) ENGINE = INNODB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'dataBus算子配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dbus_processor_assist
-- ----------------------------
DROP TABLE IF EXISTS `dbus_processor_assist`;
CREATE TABLE `dbus_processor_assist`  (
  `id` BIGINT(20) UNSIGNED NOT NULL COMMENT '主键',
  `processor_id` BIGINT(20) UNSIGNED NOT NULL COMMENT '隶属于算子的ID',
  `assist_type` TINYINT(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=原key，2=新key，3=辅助值',
  `value` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'field的名称 或 辅助字符串的详情',
  `state` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '逻辑删除标识，0=删除 1=存在',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_processorId_state`(`processor_id`, `state`) USING BTREE
) ENGINE = INNODB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '算子辅助属性' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dbus_processor_config
-- ----------------------------
DROP TABLE IF EXISTS `dbus_processor_config`;
CREATE TABLE `dbus_processor_config`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `type` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '算子类型',
  `p_name` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '算子中文名',
  `p_desc` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '算子说明',
  `input_flag` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否使用输入字段， 0=否 1=是',
  `output_flag` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否使用输出字段， 0=否 1=是',
  `assist_flag` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否使用辅助字符串， 0=否 1=是',
  `example` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '使用例子',
  `state` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '逻辑删除标识，0=删除 1=存在',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_name`(`type`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '算子详情，用法介绍' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dbus_resource
-- ----------------------------
DROP TABLE IF EXISTS `dbus_resource`;
CREATE TABLE `dbus_resource`  (
  `id` BIGINT(20) UNSIGNED NOT NULL COMMENT '主键',
  `src_name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '数据源名称',
  `src_desc` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '数据源描述',
  `src_type` INT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0=mysql, 1=pg',
  `src_url` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '数据源连接地址_主',
  `src_username` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '数据源登录用户名',
  `src_pwd` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '数据源登录密码',
  `table_scheme` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'scheme(db)名称',
  `collect_type` INT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '数据采集类型，0=增量 1=全量',
  `target_addr` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '数据写入kafka地址,多个以“|”分隔',
  `target_topic` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '数据写入kafka,topic名称',
  `boot_state` INT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '启动状态，0=初始化 1=启动 2=停止',
  `state` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '逻辑删除标识，0=删除 1=存在',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'dataBus的数据源管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dbus_statistic
-- ----------------------------
DROP TABLE IF EXISTS `dbus_statistic`;
CREATE TABLE `dbus_statistic`  (
  `id` BIGINT(20) UNSIGNED NOT NULL COMMENT '主键',
  `topo_id` BIGINT(20) UNSIGNED NOT NULL COMMENT '隶属于拓扑的ID',
  `total_count` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '从数据源读取到数据的总数',
  `successful_count` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '成功的数据统计',
  `failed_count` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '失败的数据统计',
  `state` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '逻辑删除标识，0=删除 1=存在',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '数据总线，处理的数据总数统计' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dbus_statistic_detail
-- ----------------------------
DROP TABLE IF EXISTS `dbus_statistic_detail`;
CREATE TABLE `dbus_statistic_detail`  (
  `id` BIGINT(20) UNSIGNED NOT NULL COMMENT '主键',
  `statistic_id` BIGINT(20) UNSIGNED NOT NULL COMMENT '隶属于的综合统计ID',
  `type` TINYINT(1) UNSIGNED NOT NULL COMMENT '详情统计的类型，0=过滤器 1=算子',
  `exe_type` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '过滤器或算子的执行类型，如：过滤器ne,eq,contain，算子spilt,trim等',
  `successful_count` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '成功的统计',
  `failed_count` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '失败的统计',
  `state` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '逻辑删除标识，0=删除 1=存在',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '数据总线，处理的数据详情统计' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dbus_sync_config
-- ----------------------------
DROP TABLE IF EXISTS `dbus_sync_config`;
CREATE TABLE `dbus_sync_config`  (
  `id` BIGINT(20) NOT NULL COMMENT 'id唯一主键',
  `connect_name` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '同步任务名',
  `data_source_id` BIGINT(20) NOT NULL COMMENT '金乌数据源ID',
  `data_source_name` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '金乌数据源名称',
  `db_type` INT(11) NULL DEFAULT NULL COMMENT '数据库类型：1.mysql，2.pg，4.mongdb',
  `server_id` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自定义服务器id',
  `ip` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据库地址',
  `port` INT(11) NULL DEFAULT NULL COMMENT '端口',
  `user_name` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据库用户名',
  `password` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据库用户密码',
  `monitor_db_name` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '监控的数据库名，多个以‘,’号分割',
  `monitor_table_name` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '监控的表名，多个以\\\',\\\'号分割',
  `topic_prefix` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '同步至kafka topic前缀名',
  `snapshot_mode` TINYINT(4) NOT NULL COMMENT '同步模式：0.增量，1.全量，2.仅快照模式',
  `enable_state` TINYINT(1) NOT NULL COMMENT '启用状态，0.未启用，1.启用',
  `state` TINYINT(1) NOT NULL COMMENT '记录状态，0.删除，1.正常',
  `gmt_create` DATETIME(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_connectName_state`(`connect_name`, `state`) USING BTREE
) ENGINE = INNODB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据库同步配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dbus_sync_extend
-- ----------------------------
DROP TABLE IF EXISTS `dbus_sync_extend`;
CREATE TABLE `dbus_sync_extend`  (
  `id` BIGINT(20) NOT NULL COMMENT '主键id',
  `sync_id` BIGINT(20) NOT NULL COMMENT '同步配置表id',
  `sync_key` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '同步扩展配置key',
  `sync_value` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '同步扩展配置内容',
  `state` TINYINT(1) NOT NULL COMMENT '记录状态',
  `gmt_create` DATETIME(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_syncId_key_state`(`sync_id`, `sync_key`, `state`) USING BTREE
) ENGINE = INNODB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '数据库同步扩展配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dbus_system_config
-- ----------------------------
DROP TABLE IF EXISTS `dbus_system_config`;
CREATE TABLE `dbus_system_config`  (
  `id` BIGINT(20) NOT NULL COMMENT '主键ID',
  `type_code` VARCHAR(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置类型编码',
  `property_code` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性编码',
  `content` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '值内容',
  `compare_type` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '比较类型',
  `description` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `state` TINYINT(1) NOT NULL DEFAULT 1 COMMENT '状态，0.删除，1启用',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_type_coe`(`type_code`) USING BTREE,
  INDEX `idx_type_property_code`(`type_code`, `property_code`) USING BTREE
) ENGINE = INNODB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统属性配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dbus_table_field
-- ----------------------------
DROP TABLE IF EXISTS `dbus_table_field`;
CREATE TABLE `dbus_table_field`  (
  `id` BIGINT(20) UNSIGNED NOT NULL COMMENT '主键',
  `related_id` BIGINT(20) UNSIGNED NOT NULL COMMENT '字段所属的对象ID。field_type为1，字段所属的对象为dbus_table_source；field_type为2，字段所属的对象为dbus_table_schema',
  `field_type` INT(11) NOT NULL DEFAULT 1 COMMENT '字段类型，1=来源表字段 2=扩展字段',
  `field_name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '字段名称',
  `field_alias` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '字段别名',
  `source_field` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '数据复制来源字段名称',
  `field_annotation` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '字段注释',
  `value_type` INT(10) UNSIGNED NOT NULL COMMENT '数据类型',
  `max_length` VARCHAR(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '字段字符长度',
  `default_value` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '字段的默认值',
  `nullable_flag` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否可为空，0=否 1=是',
  `map_flag` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否ID化（到下一级做映射处理），0=否 1=是',
  `pk_flag` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否主键，0=否 1=是',
  `viewable_flag` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否对前端可见，0=否 1=是',
  `related_flag` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否跟其他表关联，0=否 1=是',
  `pk_seq` INT(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '多个主键时，分区顺序',
  `create_flag` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否记录创建时间，0=否 1=是',
  `operator_type` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '运算类型',
  `aggregate_type` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '聚合类型',
  `state` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '逻辑删除标识，0=删除 1=存在',
  `operate_state` INT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '操作状态，0=初始化，1=增，2=删，3=改',
  `sync_state` INT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '发布状态，0=未发布 1=已发布',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `last_release_version` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '上一个发布版本的数据',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_fieldType_relatedId_state`(`field_type`, `related_id`, `state`, `sync_state`) USING BTREE,
  INDEX `idx_relatedId_state`(`related_id`, `state`) USING BTREE
) ENGINE = INNODB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '数据总线，维护的虚拟表结构' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dbus_table_record
-- ----------------------------
DROP TABLE IF EXISTS `dbus_table_record`;
CREATE TABLE `dbus_table_record`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pk_id` BIGINT(20) UNSIGNED NOT NULL COMMENT 'dbus_table_field的主键',
  `method_type` INT(1) UNSIGNED NOT NULL COMMENT '操作类型，1=增 2=删 3=改',
  `old_value` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '旧值',
  `new_value` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '新值',
  `gmt_time` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '变更时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_pkId`(`pk_id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'tableSchema变动日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dbus_table_schema
-- ----------------------------
DROP TABLE IF EXISTS `dbus_table_schema`;
CREATE TABLE `dbus_table_schema`  (
  `id` BIGINT(20) UNSIGNED NOT NULL COMMENT '主键',
  `target_db` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '目标表所属的数据库',
  `target_table` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '目标表的表名',
  `table_type` INT(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '目标表的类型，1=事实表 2=维度表 3=拉链表',
  `partition_rule` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '分区规则',
  `sort_by` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '排序规则',
  `parquet_partition` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT 'parquet分区规则',
  `state` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '逻辑删除标识，0=删除 1=存在',
  `description` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '表描述内容',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_db_table_state`(`target_db`, `target_table`, `state`) USING BTREE
) ENGINE = INNODB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '数据总线，转换后的数据形成的新表的配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dbus_table_source
-- ----------------------------
DROP TABLE IF EXISTS `dbus_table_source`;
CREATE TABLE `dbus_table_source`  (
  `id` BIGINT(20) UNSIGNED NOT NULL COMMENT '主键',
  `schema_id` BIGINT(20) UNSIGNED NOT NULL COMMENT '目标表的ID',
  `src_db` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '来源表所属的数据库',
  `src_table` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '来源表的表名',
  `data_source_id` BIGINT(20) NULL DEFAULT NULL COMMENT '数据源ID',
  `time_zone_num` INT(11) NULL DEFAULT NULL COMMENT '与东八区（中国北京）时间时区差值',
  `db_type` INT(11) NOT NULL DEFAULT 1 COMMENT '数据库类型：1.mysql，2.pg，4.mongdb，5.oracle，6.sqlserver',
  `schema_change_mark` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '源头数据的表结构是否发生变更。 0=未变更 1=变更',
  `state` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '逻辑删除标识，0=删除 1=存在',
  `operate_state` INT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '编辑时的操作状态，0=初始化，1=增，2=删，3=改',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_schemaId_state`(`schema_id`, `state`) USING BTREE
) ENGINE = INNODB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '构成目标表的来源表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dbus_task_guardian
-- ----------------------------
DROP TABLE IF EXISTS `dbus_task_guardian`;
CREATE TABLE `dbus_task_guardian`  (
  `id` BIGINT(20) UNSIGNED NOT NULL COMMENT '主键',
  `task_type` TINYINT(3) UNSIGNED NOT NULL COMMENT '1=dbus-表，2=dbus-表字段，3=dbus-拓扑任务，4=dbus-过滤器，5=dbus-算子，6=dbus-数据同步配置，7=dbus-数据映射配置，8=dw-流任务，9=dw-表配置，10=dbus-行为校验配置，11=matsu-策略组',
  `task_id` BIGINT(20) UNSIGNED NOT NULL COMMENT '任务id',
  `guardian_id` BIGINT(20) UNSIGNED NOT NULL COMMENT '负责人id',
  `state` TINYINT(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '逻辑删除标识，0=删除 1=存在',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_task_guardian_state`(`task_type`, `task_id`, `guardian_id`, `state`) USING BTREE,
  INDEX `idx_guardianId`(`guardian_id`) USING BTREE
) ENGINE = INNODB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务的负责人信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dbus_topology
-- ----------------------------
DROP TABLE IF EXISTS `dbus_topology`;
CREATE TABLE `dbus_topology`  (
  `id` BIGINT(20) UNSIGNED NOT NULL COMMENT '主键',
  `topo_name` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '拓扑名称',
  `src_addr` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'dbus数据源kafka的地址,多个地址以“|”分隔',
  `src_topic` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'dbus订阅kafka数据源topic',
  `target_topic` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'dbus项目数据清洗完后，写人的kafka topic',
  `target_addr` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'dbus项目数据清洗完后，写人的目标kafka的地址，多个地址以“|”分隔',
  `description` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '描述',
  `src_type` INT(1) UNSIGNED NOT NULL COMMENT '数据源类型，1=mysql 2=pg 3=log',
  `src_id` BIGINT(20) UNSIGNED NOT NULL COMMENT '关联已配置的数据源ID',
  `src_code` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '来源表业务code',
  `increase_mark` TINYINT(1) UNSIGNED NOT NULL COMMENT '订阅的数据源类型是全量还是增量。 0=全量 1=增量',
  `pre_filter_mark` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '前置过滤器匹配到的数据是否采纳。 0=丢弃 1=采纳',
  `post_filter_mark` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '后置过滤器匹配到的数据是否采纳。 0=丢弃 1=采纳',
  `schema_change_mark` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '源头数据的表结构是否发生变更。 0=未变更 1=变更',
  `kafka_group_version` INT(10) UNSIGNED NULL DEFAULT 0 COMMENT 'kafka消费者groupId版本号',
  `reread_date` DATETIME(0) NULL DEFAULT NULL COMMENT '指定kafka重新消费时间',
  `boot_state` INT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '启动状态，0=停止 1=运行',
  `health_state` INT(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '健康状态。0=初始化 1=健康 2=异常',
  `state` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '逻辑删除标识，0=删除 1=存在',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_state`(`state`, `boot_state`, `schema_change_mark`) USING BTREE,
  INDEX `idx_srcId_state`(`src_id`, `state`) USING BTREE,
  INDEX `idx_sort`(`state`, `boot_state`, `gmt_modified`) USING BTREE
) ENGINE = INNODB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'dataBus结构化处理的拓扑结构' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for detail
-- ----------------------------
DROP TABLE IF EXISTS `detail`;
CREATE TABLE `detail`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `detail` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '明细',
  `sign` BIGINT(20) NOT NULL COMMENT 'detail的hash值',
  `regex_id` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'regex_id',
  `original` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT 'detail原始数据',
  `remark` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_sign`(`sign`) USING BTREE COMMENT 'hash唯一索引'
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '明细表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for developer
-- ----------------------------
DROP TABLE IF EXISTS `developer`;
CREATE TABLE `developer`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `email` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
  `gmt_create` DATETIME(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_email`(`email`) USING BTREE COMMENT '邮箱唯一索引',
  INDEX `idx_username`(`username`) USING BTREE COMMENT '用户名索引'
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '开发人员表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dw_flow
-- ----------------------------
DROP TABLE IF EXISTS `dw_flow`;
CREATE TABLE `dw_flow`  (
  `id` BIGINT(20) UNSIGNED NOT NULL COMMENT '主建',
  `name` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'flow名称',
  `source_name` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'source命名',
  `sink_name` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sink命名',
  `source_id` BIGINT(20) NOT NULL COMMENT 'source关联datawork_namespace主键',
  `sink_id` BIGINT(20) NOT NULL COMMENT 'sink关联datawork_namespce主键',
  `status` INT(11) NOT NULL DEFAULT 1 COMMENT '状态：1=CLOSED 2=RUNNING 3=ERROR',
  `start_mode` TINYINT(1) NOT NULL DEFAULT 1 COMMENT '启动方式:1=自动 0=手动',
  `is_enabled` TINYINT(1) NOT NULL DEFAULT 1 COMMENT '是否启用:1=是 0=不是',
  `health_state` INT(10) NOT NULL DEFAULT 0 COMMENT '健康状态。0=初始化 1=健康 2=异常',
  `version` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1.0',
  `description` VARCHAR(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_source_id`(`source_id`) USING BTREE,
  INDEX `index_sink_id`(`sink_id`) USING BTREE
) ENGINE = INNODB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'datawork flow配置信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dw_namespace
-- ----------------------------
DROP TABLE IF EXISTS `dw_namespace`;
CREATE TABLE `dw_namespace`  (
  `id` BIGINT(20) UNSIGNED NOT NULL COMMENT '主键',
  `database_id` BIGINT(20) NOT NULL COMMENT '关联dw_database主键',
  `namespace_schema_id` BIGINT(20) NULL DEFAULT NULL COMMENT '关联dw_schema主键',
  `topology_id` BIGINT(20) NULL DEFAULT NULL COMMENT 'dbus的topology表主键',
  `ns_name` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表名/topic名称',
  `version` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1.0' COMMENT '版本',
  `table_type` INT(10) NOT NULL DEFAULT 1 COMMENT '目标表的类型，1=事实表 2=维度表',
  `topic_type` INT(10) NOT NULL DEFAULT 1 COMMENT '1=ALL ,2=INCREMENT',
  `number` INT(20) NULL DEFAULT 10000 COMMENT '拉取数',
  `partitions` INT(11) NULL DEFAULT NULL COMMENT 'kafka分区',
  `groups` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'kakfa分组',
  `description` VARCHAR(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `is_enabled` TINYINT(1) NOT NULL DEFAULT 1 COMMENT '是否启用：1=是 0=不是',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'datawork表配置信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dw_namespace_field
-- ----------------------------
DROP TABLE IF EXISTS `dw_namespace_field`;
CREATE TABLE `dw_namespace_field`  (
  `id` BIGINT(20) UNSIGNED NOT NULL COMMENT '主键',
  `namespace_id` BIGINT(20) NOT NULL COMMENT '关联datawork_table关联字段',
  `field_name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '字段名称',
  `org_field_name` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '原字段名称',
  `field_annotation` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '字段注释',
  `value_type` INT(10) UNSIGNED NOT NULL COMMENT '数据类型',
  `default_value` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '字段的默认值',
  `nullable_flag` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否可为空，0=否 1=是',
  `pk_flag` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否主键，0=否 1=是',
  `bit_flag` TINYINT(1) NULL DEFAULT 0 COMMENT '是否bitmap主键字段，0=否 1=是',
  `state` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '逻辑删除标识，0=删除 1=存在',
  `sync_state` INT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '发布状态，0=初始化 1=未发布 2=已发布',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_namespace_id`(`namespace_id`) USING BTREE
) ENGINE = INNODB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'datawork 表结构' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dw_namespace_schema
-- ----------------------------
DROP TABLE IF EXISTS `dw_namespace_schema`;
CREATE TABLE `dw_namespace_schema`  (
  `id` BIGINT(20) UNSIGNED NOT NULL COMMENT '主键',
  `partition_rule` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '分区规则',
  `sortBys` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT 'parquet排序表的规则',
  `parquet_partitions` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT 'parquet表的分区规则',
  `state` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '逻辑删除标识，0=删除 1=存在',
  `description` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '表描述内容',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'datawork创建表schema' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for event
-- ----------------------------
DROP TABLE IF EXISTS `event`;
CREATE TABLE `event`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '事件名',
  `cname` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '显示名',
  `description` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  `type` INT(11) NOT NULL DEFAULT 1 COMMENT '事件类型 1真实 2虚拟',
  `data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '虚拟事件组成',
  `is_built_in` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否预置：1=是 0=不是',
  `is_visible` TINYINT(1) NOT NULL DEFAULT 1 COMMENT '是否可见：1=可见 0=不可见',
  `state` TINYINT(1) NOT NULL DEFAULT 1 COMMENT '是否有效 1有效 0失效',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`name`) USING BTREE COMMENT '事件名唯一索引',
  UNIQUE INDEX `uniq_name`(`name`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '事件表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for event_group
-- ----------------------------
DROP TABLE IF EXISTS `event_group`;
CREATE TABLE `event_group`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '分组信息',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '事件分组表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for event_group_map
-- ----------------------------
DROP TABLE IF EXISTS `event_group_map`;
CREATE TABLE `event_group_map`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `event_id` BIGINT(20) NOT NULL COMMENT 'event_id',
  `group_id` BIGINT(20) NOT NULL COMMENT 'event_group_id',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_event_group`(`event_id`, `group_id`) USING BTREE COMMENT '事件分组唯一索引',
  UNIQUE INDEX `uniq_event_group`(`event_id`, `group_id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '事件分组映射表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for exception
-- ----------------------------
DROP TABLE IF EXISTS `exception`;
CREATE TABLE `exception`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `class_id` BIGINT(20) UNSIGNED NOT NULL COMMENT 'class_id',
  `detail` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '信息',
  `sign` BIGINT(20) NOT NULL COMMENT 'detail的hash值',
  `gmt_create` DATETIME(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sign`(`sign`) USING BTREE COMMENT 'hash索引'
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '异常表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for grouping_basic
-- ----------------------------
DROP TABLE IF EXISTS `grouping_basic`;
CREATE TABLE `grouping_basic`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '名称',
  `uuid` BIGINT(20) NOT NULL COMMENT '全局唯一标识',
  `owner` BIGINT(20) NOT NULL COMMENT '维护人id',
  `status` INT(11) NOT NULL COMMENT '状态：1=RUNNING 2=CLOSED',
  `count` INT(11) NOT NULL DEFAULT 0 COMMENT '人数',
  `detail_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '明细id',
  `group_id` BIGINT(20) NULL DEFAULT -1 COMMENT '分组id',
  `last_calculate_time` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '最后计算时间',
  `is_enabled` TINYINT(1) NOT NULL DEFAULT 1 COMMENT '是否启用：1=是 0=不是',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_uuid`(`uuid`) USING BTREE COMMENT '全局唯一标识索引',
  INDEX `idx_name`(`name`) USING BTREE COMMENT '名称索引',
  INDEX `idx_create_time`(`gmt_create`) USING BTREE COMMENT '时间索引',
  INDEX `idx_group_id`(`group_id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户分群基础信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for grouping_condition
-- ----------------------------
DROP TABLE IF EXISTS `grouping_condition`;
CREATE TABLE `grouping_condition`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `grouping_basic_id` BIGINT(20) NOT NULL COMMENT 'grouping_basic id',
  `data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '过滤条件',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_basic_id`(`grouping_basic_id`) USING BTREE COMMENT '基础信息表id唯一索引'
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户分群过滤条件表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for grouping_count
-- ----------------------------
DROP TABLE IF EXISTS `grouping_count`;
CREATE TABLE `grouping_count`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `grouping_basic_id` BIGINT(20) NOT NULL COMMENT 'grouping_basic id',
  `count` INT(11) NOT NULL COMMENT '人数',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_basic_id`(`grouping_basic_id`) USING BTREE COMMENT '基础信息表id索引',
  INDEX `idx_create_time`(`gmt_create`) USING BTREE COMMENT '时间索引'
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户分群结果表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for grouping_count_detail
-- ----------------------------
DROP TABLE IF EXISTS `grouping_count_detail`;
CREATE TABLE `grouping_count_detail`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `grouping_count_id` BIGINT(20) NOT NULL COMMENT 'grouping_count id',
  `detail` MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户bitmap',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_count_id`(`grouping_count_id`) USING BTREE COMMENT '用户分群结果表id唯一索引'
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户分群结果明细表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for issue
-- ----------------------------
DROP TABLE IF EXISTS `issue`;
CREATE TABLE `issue`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `app_name` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'app名称',
  `description` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述',
  `type` INT(11) NOT NULL COMMENT '类别：1=git_info_not_found_in_env 2=unofficial_email 3=db_connection_leak',
  `level` INT(11) NOT NULL COMMENT '级别：1=CRITICAL 2=MAJOR 3=MINOR 4=WARNING 5=INDETERMINATE 6=CLEARED',
  `time` DATETIME(0) NOT NULL COMMENT '发生时间',
  `gmt_create` DATETIME(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_app`(`app_name`, `time`) USING BTREE COMMENT 'app索引',
  INDEX `idx_time`(`time`) USING BTREE COMMENT '时间索引'
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '问题表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for issue_developer
-- ----------------------------
DROP TABLE IF EXISTS `issue_developer`;
CREATE TABLE `issue_developer`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `issue_id` BIGINT(20) UNSIGNED NOT NULL COMMENT 'issue_id',
  `developer_id` BIGINT(20) UNSIGNED NOT NULL COMMENT 'developer_id',
  `gmt_create` DATETIME(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_issue_developer`(`issue_id`, `developer_id`) USING BTREE COMMENT '组合索引',
  INDEX `idx_developer`(`developer_id`) USING BTREE COMMENT '开发者索引'
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '问题和开发者对应表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for message_detail
-- ----------------------------
DROP TABLE IF EXISTS `message_detail`;
CREATE TABLE `message_detail`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `msg_id` BIGINT(20) NOT NULL COMMENT '辅助字段：消息或告警信息唯一ID',
  `name` VARCHAR(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '消息或告警名',
  `content` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '消息或告警数据',
  `level_type` INT(11) NULL DEFAULT NULL COMMENT '级别：1=CRITICAL 2=WARNING 3=NORMAL，为空时表示普通消息',
  `owners` VARCHAR(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '维护人、组',
  `sender` VARCHAR(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '消息或告警发送方',
  `receivers` VARCHAR(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '消息或告警接收方(姓名)',
  `action_types` VARCHAR(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '消息或告警方式组：1=SMS 2=EMAIL 3=WXWORK',
  `message_type` INT(11) NULL DEFAULT NULL COMMENT '消息或告警类型：1=NORMAL 2=ALARM',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_name`(`name`) USING BTREE COMMENT '消息或告警名',
  INDEX `idx_owners`(`owners`) USING BTREE COMMENT '维护人、组',
  INDEX `idx_sender`(`sender`) USING BTREE COMMENT '消息或告警发送方'
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '消息或告警明细表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for metric
-- ----------------------------
DROP TABLE IF EXISTS `metric`;
CREATE TABLE `metric`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `remark` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `gmt_create` DATETIME(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`name`) USING BTREE COMMENT '指标名唯一索引'
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '指标表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for metric_group
-- ----------------------------
DROP TABLE IF EXISTS `metric_group`;
CREATE TABLE `metric_group`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `aggregate_type` INT(11) NOT NULL COMMENT '聚合类别：1=sum 2=count 3=mean',
  `remark` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `gmt_create` DATETIME(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`name`) USING BTREE COMMENT '指标组名唯一索引'
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '指标组表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for monitor_alarm
-- ----------------------------
DROP TABLE IF EXISTS `monitor_alarm`;
CREATE TABLE `monitor_alarm`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `monitor_alarm_group_id` BIGINT(20) NOT NULL COMMENT 'monitor_alarm_group id',
  `name` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '名称',
  `level` INT(11) NOT NULL COMMENT '级别：1=CRITICAL 2=WARNING 3=NORMAL',
  `rule` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '报警规则，json格式',
  `action` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '报警动作, json格式',
  `time_range` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '时间段，如1-5,09:00-18:00;6-7,10:00-16:00',
  `status` INT(11) NOT NULL DEFAULT 1 COMMENT '状态：1=INITIAL 2=RUNNING 3=CLOSED',
  `is_enabled` TINYINT(1) NOT NULL DEFAULT 1 COMMENT '是否启用：1=是 0=不是',
  `description` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '描述',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_alarm_group`(`monitor_alarm_group_id`) USING BTREE COMMENT '告警组索引'
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '监控报警单元表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for monitor_alarm_group
-- ----------------------------
DROP TABLE IF EXISTS `monitor_alarm_group`;
CREATE TABLE `monitor_alarm_group`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '名称',
  `status` INT(11) NOT NULL DEFAULT 1 COMMENT '状态：1=INITIAL 2=RUNNING 3=CLOSED',
  `topic_name` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'topic名',
  `is_builtin` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否系统级别：1=是 0=不是',
  `is_enabled` TINYINT(1) NOT NULL DEFAULT 1 COMMENT '是否启用：1=是 0=不是',
  `description` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '描述',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '监控报警单元组表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for monitor_indicator
-- ----------------------------
DROP TABLE IF EXISTS `monitor_indicator`;
CREATE TABLE `monitor_indicator`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `monitor_alarm_group_id` BIGINT(20) NOT NULL COMMENT 'monitor_alarm_group id',
  `name` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '名称',
  `table_name` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '表名',
  `data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '执行的sql数据，json格式',
  `sign` BIGINT(20) NOT NULL COMMENT 'table_name和data组合的哈希',
  `is_enabled` TINYINT(1) NOT NULL DEFAULT 1 COMMENT '是否启用：1=是 0=不是',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_alarm_group`(`monitor_alarm_group_id`) USING BTREE COMMENT '告警组索引',
  INDEX `idx_table_name`(`table_name`(191)) USING BTREE COMMENT '表名索引',
  INDEX `idx_sign`(`sign`) USING BTREE COMMENT '哈希索引'
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '监控指标表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for monitor_item
-- ----------------------------
DROP TABLE IF EXISTS `monitor_item`;
CREATE TABLE `monitor_item`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `monitor_indicator_id` BIGINT(20) NOT NULL COMMENT 'monitor_indicator id',
  `monitor_alarm_id` BIGINT(20) NOT NULL COMMENT 'monitor_alarm id',
  `time_range_type` INT(11) NOT NULL COMMENT '时间范围类型：1=近1小时 2=近1天',
  `operator` INT(11) NOT NULL COMMENT '操作类型：1=直接阈值比较 2=比昨日同比增长率 3=比昨日同比增长',
  `threshold_min` FLOAT NOT NULL COMMENT '阈值下限',
  `threshold_max` FLOAT NOT NULL COMMENT '阈值上限',
  `is_composite` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否复合指标：1=是 0=不是',
  `composite_detail` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '复合指标详细',
  `is_open` TINYINT(1) NOT NULL DEFAULT 1 COMMENT '是否开启：1=是 0=不是',
  `is_enabled` TINYINT(1) NOT NULL DEFAULT 1 COMMENT '是否启用：1=是 0=不是',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_alarm`(`monitor_alarm_id`) USING BTREE COMMENT '告警索引'
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '监控项表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for monitor_triggered_alarm
-- ----------------------------
DROP TABLE IF EXISTS `monitor_triggered_alarm`;
CREATE TABLE `monitor_triggered_alarm`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `monitor_alarm_id` BIGINT(20) NOT NULL COMMENT 'monitor_alarm id',
  `level` INT(11) NOT NULL COMMENT '级别：1=CRITICAL 2=WARNING 3=NORMAL',
  `data` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '告警数据',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_time`(`gmt_create`) USING BTREE COMMENT '时间索引'
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '触发的监控报警单元表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for monitor_triggered_item
-- ----------------------------
DROP TABLE IF EXISTS `monitor_triggered_item`;
CREATE TABLE `monitor_triggered_item`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `monitor_item_id` BIGINT(20) NOT NULL COMMENT 'monitor_item id',
  `start_time` DATETIME(0) NOT NULL COMMENT '监控时间段之起始时间',
  `end_time` DATETIME(0) NOT NULL COMMENT '监控时间段之结束时间',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_item`(`monitor_item_id`, `start_time`, `end_time`) USING BTREE COMMENT '组合唯一索引'
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '触发阈值的监控项表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for publish
-- ----------------------------
DROP TABLE IF EXISTS `publish`;
CREATE TABLE `publish`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code_repository_id` BIGINT(20) UNSIGNED NOT NULL COMMENT '代码仓库id',
  `time` DATETIME(0) NOT NULL COMMENT '发布时间',
  `sign` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '提交唯一标识',
  `gmt_create` DATETIME(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_code_repository`(`code_repository_id`) USING BTREE COMMENT '代码仓库索引'
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '应用发布表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `SCHED_NAME` VARCHAR(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '计划名称',
  `TRIGGER_NAME` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发名称',
  `TRIGGER_GROUP` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发组',
  `BLOB_DATA` BLOB NULL COMMENT 'blob数据',
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = INNODB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '计划任务分片触发表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `SCHED_NAME` VARCHAR(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '计划名称',
  `CALENDAR_NAME` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日程名称',
  `CALENDAR` BLOB NOT NULL COMMENT '主键',
  PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE
) ENGINE = INNODB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '计划任务日程表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `SCHED_NAME` VARCHAR(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '计划名称',
  `TRIGGER_NAME` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发名称',
  `TRIGGER_GROUP` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发组',
  `CRON_EXPRESSION` VARCHAR(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'cron表达式',
  `TIME_ZONE_ID` VARCHAR(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时区ID'
) ENGINE = INNODB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '计划任务CRON触发表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `SCHED_NAME` VARCHAR(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '计划名称',
  `ENTRY_ID` VARCHAR(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '参与ID',
  `TRIGGER_NAME` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发名称',
  `TRIGGER_GROUP` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发组',
  `INSTANCE_NAME` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '实例名称',
  `FIRED_TIME` BIGINT(13) NOT NULL COMMENT '执行时间',
  `SCHED_TIME` BIGINT(13) NOT NULL COMMENT '计划时间',
  `PRIORITY` INT(11) NOT NULL COMMENT '优先级',
  `STATE` VARCHAR(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态',
  `JOB_NAME` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `JOB_GROUP` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务组',
  `IS_NONCONCURRENT` VARCHAR(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否流通',
  `REQUESTS_RECOVERY` VARCHAR(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否需要发现',
  PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`) USING BTREE
) ENGINE = INNODB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '计划任务执行表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `SCHED_NAME` VARCHAR(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '计划名称',
  `JOB_NAME` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `JOB_GROUP` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组',
  `DESCRIPTION` VARCHAR(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `JOB_CLASS_NAME` VARCHAR(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务类名',
  `IS_DURABLE` VARCHAR(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否持久化',
  `IS_NONCONCURRENT` VARCHAR(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否流通',
  `IS_UPDATE_DATA` VARCHAR(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否更新数据',
  `REQUESTS_RECOVERY` VARCHAR(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否需要发现',
  `JOB_DATA` BLOB NULL COMMENT '任务数据',
  PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE
) ENGINE = INNODB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '计划任务详情表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `SCHED_NAME` VARCHAR(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '计划名称',
  `LOCK_NAME` VARCHAR(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '锁定名称',
  PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE = INNODB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '计划任务锁定' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `SCHED_NAME` VARCHAR(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '计划名称',
  `TRIGGER_GROUP` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发组',
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = INNODB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '计划任务暂停表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `SCHED_NAME` VARCHAR(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '计划名称',
  `INSTANCE_NAME` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '实例名称',
  `LAST_CHECKIN_TIME` BIGINT(13) NOT NULL COMMENT '最后检查时间',
  `CHECKIN_INTERVAL` BIGINT(13) NOT NULL COMMENT '检查时间间隔',
  PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE
) ENGINE = INNODB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '计划任务状态表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `SCHED_NAME` VARCHAR(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '计划名称',
  `TRIGGER_NAME` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发名称',
  `TRIGGER_GROUP` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发组',
  `REPEAT_COUNT` BIGINT(7) NOT NULL COMMENT '重复次数',
  `REPEAT_INTERVAL` BIGINT(12) NOT NULL COMMENT '重复时间间隔',
  `TIMES_TRIGGERED` BIGINT(10) NOT NULL COMMENT '触发次数',
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = INNODB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '计划任务样列表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `SCHED_NAME` VARCHAR(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '计划名称',
  `TRIGGER_NAME` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发名称',
  `TRIGGER_GROUP` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发组',
  `STR_PROP_1` VARCHAR(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字符参数1',
  `STR_PROP_2` VARCHAR(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字符参数2',
  `STR_PROP_3` VARCHAR(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字符参数3',
  `INT_PROP_1` INT(11) NULL DEFAULT NULL COMMENT '整形参数1',
  `INT_PROP_2` INT(11) NULL DEFAULT NULL COMMENT '整形参数2',
  `LONG_PROP_1` BIGINT(20) NULL DEFAULT NULL COMMENT '长整形参数1',
  `LONG_PROP_2` BIGINT(20) NULL DEFAULT NULL COMMENT '长整形参数2',
  `DEC_PROP_1` DECIMAL(13, 4) NULL DEFAULT NULL COMMENT 'DEC参数1',
  `DEC_PROP_2` DECIMAL(13, 4) NULL DEFAULT NULL COMMENT 'DEC参数2',
  `BOOL_PROP_1` VARCHAR(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '布尔参数1',
  `BOOL_PROP_2` VARCHAR(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '布尔参数2',
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = INNODB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '计划任务SIMPROP表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `SCHED_NAME` VARCHAR(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '计划名称',
  `TRIGGER_NAME` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发名称',
  `TRIGGER_GROUP` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发组',
  `JOB_NAME` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `JOB_GROUP` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组',
  `DESCRIPTION` VARCHAR(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `NEXT_FIRE_TIME` BIGINT(13) NULL DEFAULT NULL COMMENT '下次执行时间',
  `PREV_FIRE_TIME` BIGINT(13) NULL DEFAULT NULL COMMENT '前次执行时间',
  `PRIORITY` INT(11) NULL DEFAULT NULL COMMENT '优先级',
  `TRIGGER_STATE` VARCHAR(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发状态',
  `TRIGGER_TYPE` VARCHAR(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发类别',
  `START_TIME` BIGINT(13) NOT NULL COMMENT '开始时间',
  `END_TIME` BIGINT(13) NULL DEFAULT NULL COMMENT '结束时间',
  `CALENDAR_NAME` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日程名称',
  `MISFIRE_INSTR` SMALLINT(2) NULL DEFAULT NULL COMMENT '错失执行次数',
  `JOB_DATA` BLOB NULL COMMENT '任务数据',
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = INNODB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '计划任务触发表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for regex
-- ----------------------------
DROP TABLE IF EXISTS `regex`;
CREATE TABLE `regex`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `regex` VARCHAR(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '正则表达式',
  `remark` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  `is_enabled` TINYINT(1) NOT NULL DEFAULT 1 COMMENT '是否启用：1=是 0=不是',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_regex`(`regex`) USING BTREE COMMENT '表达式唯一索引'
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '正则表达式表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sdk_account
-- ----------------------------
DROP TABLE IF EXISTS `sdk_account`;
CREATE TABLE `sdk_account`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `sdk_token` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT 'sdk访问令牌',
  `user_name` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '用户名',
  `department` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '所属部门',
  `phone_num` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '电话',
  `email` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '电邮',
  `gmt_last_login` DATETIME(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `state` TINYINT(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态，0=删除 1=存在',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sdk_token`(`sdk_token`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '开发者平台账户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sdk_subscribe
-- ----------------------------
DROP TABLE IF EXISTS `sdk_subscribe`;
CREATE TABLE `sdk_subscribe`  (
  `id` BIGINT(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订阅关系主键',
  `account_id` BIGINT(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '订阅者ID',
  `topic_id` BIGINT(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '被订阅topicID',
  `gmt_subscribe` DATETIME(0) NULL DEFAULT NULL COMMENT '开始订阅时间',
  `gmt_stop` DATETIME(0) NULL DEFAULT NULL COMMENT '停止订阅时间',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `state` TINYINT(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态，0=删除  1=存在',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_acct_id`(`account_id`) USING BTREE,
  INDEX `idx_topic_id`(`topic_id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '账户和Topic订阅关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sdk_topic
-- ----------------------------
DROP TABLE IF EXISTS `sdk_topic`;
CREATE TABLE `sdk_topic`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `relation_type` INT(10) UNSIGNED NOT NULL COMMENT '关联任务的业务类型，1=数据总线  2=监控  3=分群  4=营销工作流  ',
  `relation_id` BIGINT(20) UNSIGNED NOT NULL COMMENT '关联任务的主键',
  `task_name` VARCHAR(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'topic所属的任务的名称，冗余字段，供模糊查询',
  `task_desc` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT 'topic所属的任务的描述，冗余字段，供模糊查询',
  `increase_mark` TINYINT(4) NOT NULL COMMENT '增量全量标识。0=全量 1=增量',
  `topic_type` INT(10) UNSIGNED NOT NULL COMMENT 'topic类型，1=服务订阅的源topic  2=服务加工后输出的topic',
  `topic_name` VARCHAR(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'topic名称',
  `topic_addr` VARCHAR(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'topic地址',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `state` TINYINT(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态，0=删除 1=存在',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_relation`(`relation_type`, `relation_id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'sdk消息订阅，拓扑topic的映射信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sql_stat
-- ----------------------------
DROP TABLE IF EXISTS `sql_stat`;
CREATE TABLE `sql_stat`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `app_name` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'app名称',
  `stat_sql` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'sql',
  `execute_count` INT(11) NOT NULL COMMENT '执行次数',
  `execute_millis_max` DOUBLE NOT NULL COMMENT '最大执行耗时(毫秒)',
  `execute_millis_total` DOUBLE NOT NULL COMMENT '总执行耗时(毫秒)',
  `execute_millis_avg` DOUBLE NOT NULL COMMENT '平均执行耗时(毫秒，execute_millis_total/execute_count)',
  `concurrent_max` INT(11) NOT NULL COMMENT '最大并发',
  `fetch_row_count` INT(11) NOT NULL COMMENT '读取行数',
  `time` DATETIME(0) NOT NULL COMMENT '统计时间',
  `gmt_create` DATETIME(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_app`(`app_name`, `time`, `execute_millis_max`, `execute_millis_avg`) USING BTREE COMMENT 'app索引',
  INDEX `idx_time`(`time`, `execute_millis_max`, `execute_millis_avg`) USING BTREE COMMENT '时间索引',
  INDEX `idx_max`(`execute_millis_max`) USING BTREE COMMENT '最大执行耗时索引',
  INDEX `idx_avg`(`execute_millis_avg`) USING BTREE COMMENT '平均执行耗时索引',
  INDEX `idx_count`(`execute_count`) USING BTREE COMMENT '执行次数索引',
  INDEX `idx_total`(`execute_millis_total`) USING BTREE COMMENT '总执行耗时索引'
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'sql统计表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sql_stat_developer
-- ----------------------------
DROP TABLE IF EXISTS `sql_stat_developer`;
CREATE TABLE `sql_stat_developer`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sql_stat_id` BIGINT(20) UNSIGNED NOT NULL COMMENT 'sql_stat_id',
  `developer_id` BIGINT(20) UNSIGNED NOT NULL COMMENT 'developer_id',
  `gmt_create` DATETIME(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sql_stat_developer`(`sql_stat_id`, `developer_id`) USING BTREE COMMENT '组合索引',
  INDEX `idx_developer`(`developer_id`) USING BTREE COMMENT '开发者索引'
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'sql统计和开发者对应表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_escheduler_access_token
-- ----------------------------
DROP TABLE IF EXISTS `t_escheduler_access_token`;
CREATE TABLE `t_escheduler_access_token`  (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` INT(11) NULL DEFAULT NULL COMMENT '用户id',
  `token` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'token令牌',
  `expire_time` DATETIME(0) NULL DEFAULT NULL COMMENT 'token有效结束时间',
  `create_time` DATETIME(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` DATETIME(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'escheduler登录令牌表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_escheduler_alert
-- ----------------------------
DROP TABLE IF EXISTS `t_escheduler_alert`;
CREATE TABLE `t_escheduler_alert`  (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息标题',
  `show_type` TINYINT(4) NULL DEFAULT NULL COMMENT '发送格式，0是TABLE,1是TEXT',
  `content` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '消息内容（可以是邮件，可以是短信。邮件是JSON Map存放，短信是字符串）',
  `alert_type` TINYINT(4) NULL DEFAULT NULL COMMENT '0是邮件，1是短信',
  `alert_status` TINYINT(4) NULL DEFAULT 0 COMMENT '0是待执行，1是执行成功，2执行失败',
  `log` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '执行日志',
  `alertgroup_id` INT(11) NULL DEFAULT NULL COMMENT '发送组',
  `receivers` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '收件人',
  `receivers_cc` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '抄送人',
  `create_time` DATETIME(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` DATETIME(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'escheduler告警表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_escheduler_alertgroup
-- ----------------------------
DROP TABLE IF EXISTS `t_escheduler_alertgroup`;
CREATE TABLE `t_escheduler_alertgroup`  (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `group_name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组名称',
  `group_type` TINYINT(4) NULL DEFAULT NULL COMMENT '组类型(邮件0，短信1...)',
  `desc` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` DATETIME(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` DATETIME(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'escheduler告警组表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_escheduler_command
-- ----------------------------
DROP TABLE IF EXISTS `t_escheduler_command`;
CREATE TABLE `t_escheduler_command`  (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `command_type` TINYINT(4) NULL DEFAULT NULL COMMENT '命令类型：0 启动工作流,1 从当前节点开始执行,2 恢复被容错的工作流,3 恢复暂停流程,4 从失败节点开始执行,5 补数,6 调度,7 重跑,8 暂停,9 停止,10 恢复等待线程',
  `process_definition_id` INT(11) NULL DEFAULT NULL COMMENT '流程定义id',
  `command_param` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '命令的参数（json格式）',
  `task_depend_type` TINYINT(4) NULL DEFAULT NULL COMMENT '节点依赖类型：0 当前节点,1 向前执行,2 向后执行',
  `failure_strategy` TINYINT(4) NULL DEFAULT 0 COMMENT '失败策略：0结束，1继续',
  `warning_type` TINYINT(4) NULL DEFAULT 0 COMMENT '告警类型：0 不发,1 流程成功发,2 流程失败发,3 成功失败都发',
  `warning_group_id` INT(11) NULL DEFAULT NULL COMMENT '告警组',
  `schedule_time` DATETIME(0) NULL DEFAULT NULL COMMENT '预期运行时间',
  `start_time` DATETIME(0) NULL DEFAULT NULL COMMENT '开始时间',
  `executor_id` INT(11) NULL DEFAULT NULL COMMENT '执行用户id',
  `dependence` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '依赖字段',
  `update_time` DATETIME(0) NULL DEFAULT NULL COMMENT '更新时间',
  `process_instance_priority` INT(11) NULL DEFAULT NULL COMMENT '流程实例优先级：0 Highest,1 High,2 Medium,3 Low,4 Lowest',
  `worker_group_id` INT(11) NULL DEFAULT -1 COMMENT '任务指定运行的worker分组',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'escheduler执行命令行表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_escheduler_datasource
-- ----------------------------
DROP TABLE IF EXISTS `t_escheduler_datasource`;
CREATE TABLE `t_escheduler_datasource`  (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据源名称',
  `note` VARCHAR(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `type` TINYINT(4) NOT NULL COMMENT '数据源类型：0 mysql,1 postgresql,2 hive,3 spark',
  `user_id` INT(11) NULL DEFAULT NULL COMMENT '创建用户id',
  `connection_params` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '连接参数(json格式)',
  `create_time` DATETIME(0) NOT NULL COMMENT '创建时间',
  `update_time` DATETIME(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'escheduler数据源表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_escheduler_error_command
-- ----------------------------
DROP TABLE IF EXISTS `t_escheduler_error_command`;
CREATE TABLE `t_escheduler_error_command`  (
  `id` INT(11) NOT NULL COMMENT '主键',
  `command_type` TINYINT(4) NULL DEFAULT NULL COMMENT '命令类型：0 启动工作流,1 从当前节点开始执行,2 恢复被容错的工作流,3 恢复暂停流程,4 从失败节点开始执行,5 补数,6 调度,7 重跑,8 暂停,9 停止,10 恢复等待线程',
  `executor_id` INT(11) NULL DEFAULT NULL COMMENT '命令执行者',
  `process_definition_id` INT(11) NULL DEFAULT NULL COMMENT '流程定义id',
  `command_param` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '命令的参数（json格式）',
  `task_depend_type` TINYINT(4) NULL DEFAULT NULL COMMENT '节点依赖类型',
  `failure_strategy` TINYINT(4) NULL DEFAULT 0 COMMENT '失败策略：0结束，1继续',
  `warning_type` TINYINT(4) NULL DEFAULT 0 COMMENT '告警类型',
  `warning_group_id` INT(11) NULL DEFAULT NULL COMMENT '告警组',
  `schedule_time` DATETIME(0) NULL DEFAULT NULL COMMENT '预期运行时间',
  `start_time` DATETIME(0) NULL DEFAULT NULL COMMENT '开始时间',
  `update_time` DATETIME(0) NULL DEFAULT NULL COMMENT '更新时间',
  `dependence` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '依赖字段',
  `process_instance_priority` INT(11) NULL DEFAULT NULL COMMENT '流程实例优先级：0 Highest,1 High,2 Medium,3 Low,4 Lowest',
  `worker_group_id` INT(11) NULL DEFAULT -1 COMMENT '任务指定运行的worker分组',
  `message` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '执行信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'escheduler错误命令表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_escheduler_master_server
-- ----------------------------
DROP TABLE IF EXISTS `t_escheduler_master_server`;
CREATE TABLE `t_escheduler_master_server`  (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `host` VARCHAR(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ip',
  `port` INT(11) NULL DEFAULT NULL COMMENT '进程号',
  `zk_directory` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'zk注册目录',
  `res_info` VARCHAR(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '集群资源信息：json格式{\"cpu\":xxx,\"memroy\":xxx}',
  `create_time` DATETIME(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_heartbeat_time` DATETIME(0) NULL DEFAULT NULL COMMENT '最后心跳时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'escheduler master服务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_escheduler_process_definition
-- ----------------------------
DROP TABLE IF EXISTS `t_escheduler_process_definition`;
CREATE TABLE `t_escheduler_process_definition`  (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程定义名称',
  `version` INT(11) NULL DEFAULT NULL COMMENT '流程定义版本',
  `release_state` TINYINT(4) NULL DEFAULT NULL COMMENT '流程定义的发布状态：0 未上线  1已上线',
  `project_id` INT(11) NULL DEFAULT NULL COMMENT '项目id',
  `user_id` INT(11) NULL DEFAULT NULL COMMENT '流程定义所属用户id',
  `process_definition_json` LONGTEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '流程定义json串',
  `desc` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '流程定义描述',
  `global_params` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '全局参数',
  `flag` TINYINT(4) NULL DEFAULT NULL COMMENT '流程是否可用\r\n：0 不可用\r\n，1 可用',
  `locations` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '节点坐标信息',
  `connects` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '节点连线信息',
  `receivers` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '收件人',
  `receivers_cc` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '抄送人',
  `create_time` DATETIME(0) NULL DEFAULT NULL COMMENT '创建时间',
  `timeout` INT(11) NULL DEFAULT 0 COMMENT '超时时间',
  `update_time` DATETIME(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `process_definition_index`(`project_id`, `id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'escheduler流程定义表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_escheduler_process_instance
-- ----------------------------
DROP TABLE IF EXISTS `t_escheduler_process_instance`;
CREATE TABLE `t_escheduler_process_instance`  (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程实例名称',
  `process_definition_id` INT(11) NULL DEFAULT NULL COMMENT '流程定义id',
  `state` TINYINT(4) NULL DEFAULT NULL COMMENT '流程实例状态：0 提交成功,1 正在运行,2 准备暂停,3 暂停,4 准备停止,5 停止,6 失败,7 成功,8 需要容错,9 kill,10 等待线程,11 等待依赖完成',
  `recovery` TINYINT(4) NULL DEFAULT NULL COMMENT '流程实例容错标识：0 正常,1 需要被容错重启',
  `start_time` DATETIME(0) NULL DEFAULT NULL COMMENT '流程实例开始时间',
  `end_time` DATETIME(0) NULL DEFAULT NULL COMMENT '流程实例结束时间',
  `run_times` INT(11) NULL DEFAULT NULL COMMENT '流程实例运行次数',
  `host` VARCHAR(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程实例所在的机器',
  `command_type` TINYINT(4) NULL DEFAULT NULL COMMENT '命令类型：0 启动工作流,1 从当前节点开始执行,2 恢复被容错的工作流,3 恢复暂停流程,4 从失败节点开始执行,5 补数,6 调度,7 重跑,8 暂停,9 停止,10 恢复等待线程',
  `command_param` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '命令的参数（json格式）',
  `task_depend_type` TINYINT(4) NULL DEFAULT NULL COMMENT '节点依赖类型：0 当前节点,1 向前执行,2 向后执行',
  `max_try_times` TINYINT(4) NULL DEFAULT 0 COMMENT '最大重试次数',
  `failure_strategy` TINYINT(4) NULL DEFAULT 0 COMMENT '失败策略 0 失败后结束，1 失败后继续',
  `warning_type` TINYINT(4) NULL DEFAULT 0 COMMENT '告警类型：0 不发,1 流程成功发,2 流程失败发,3 成功失败都发',
  `warning_group_id` INT(11) NULL DEFAULT NULL COMMENT '告警组id',
  `schedule_time` DATETIME(0) NULL DEFAULT NULL COMMENT '预期运行时间',
  `command_start_time` DATETIME(0) NULL DEFAULT NULL COMMENT '开始命令时间',
  `global_params` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '全局参数（固化流程定义的参数）',
  `process_instance_json` LONGTEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '流程实例json(copy的流程定义的json)',
  `flag` TINYINT(4) NULL DEFAULT 1 COMMENT '是否可用，1 可用，0不可用',
  `update_time` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `is_sub_process` INT(11) NULL DEFAULT 0 COMMENT '是否是子工作流 1 是，0 不是',
  `executor_id` INT(11) NOT NULL COMMENT '命令执行者',
  `locations` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '节点坐标信息',
  `connects` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '节点连线信息',
  `history_cmd` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '历史命令，记录所有对流程实例的操作',
  `dependence_schedule_times` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '依赖节点的预估时间',
  `process_instance_priority` INT(11) NULL DEFAULT NULL COMMENT '流程实例优先级：0 Highest,1 High,2 Medium,3 Low,4 Lowest',
  `worker_group_id` INT(11) NULL DEFAULT -1 COMMENT '任务指定运行的worker分组',
  `timeout` INT(11) NULL DEFAULT 0 COMMENT '超时时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `process_instance_index`(`process_definition_id`, `id`) USING BTREE,
  INDEX `start_time_index`(`start_time`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'escheduler流程实例表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_escheduler_project
-- ----------------------------
DROP TABLE IF EXISTS `t_escheduler_project`;
CREATE TABLE `t_escheduler_project`  (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目名称',
  `desc` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目描述',
  `user_id` INT(11) NULL DEFAULT NULL COMMENT '所属用户',
  `type` TINYINT(2) NOT NULL DEFAULT 0 COMMENT '0.离线项目，1实时项目',
  `flag` TINYINT(4) NULL DEFAULT 1 COMMENT '是否可用  1 可用,0 不可用',
  `create_time` DATETIME(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` DATETIME(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id_index`(`user_id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'escheduler项目表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_escheduler_queue
-- ----------------------------
DROP TABLE IF EXISTS `t_escheduler_queue`;
CREATE TABLE `t_escheduler_queue`  (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `queue_name` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '队列名称',
  `queue` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'yarn队列名称',
  `create_time` DATETIME(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` DATETIME(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'escheduler队列表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_escheduler_relation_datasource_user
-- ----------------------------
DROP TABLE IF EXISTS `t_escheduler_relation_datasource_user`;
CREATE TABLE `t_escheduler_relation_datasource_user`  (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` INT(11) NOT NULL COMMENT '用户id',
  `datasource_id` INT(11) NULL DEFAULT NULL COMMENT '数据源id',
  `perm` INT(11) NULL DEFAULT 1 COMMENT '权限',
  `create_time` DATETIME(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` DATETIME(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'escheduler数据源关联用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_escheduler_relation_process_instance
-- ----------------------------
DROP TABLE IF EXISTS `t_escheduler_relation_process_instance`;
CREATE TABLE `t_escheduler_relation_process_instance`  (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_process_instance_id` INT(11) NULL DEFAULT NULL COMMENT '父流程实例id',
  `parent_task_instance_id` INT(11) NULL DEFAULT NULL COMMENT '父任务实例id',
  `process_instance_id` INT(11) NULL DEFAULT NULL COMMENT '子流程实例id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'escheduler流程实例关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_escheduler_relation_project_user
-- ----------------------------
DROP TABLE IF EXISTS `t_escheduler_relation_project_user`;
CREATE TABLE `t_escheduler_relation_project_user`  (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` INT(11) NOT NULL COMMENT '用户id',
  `project_id` INT(11) NULL DEFAULT NULL COMMENT '项目id',
  `perm` INT(11) NULL DEFAULT 1 COMMENT '权限',
  `create_time` DATETIME(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` DATETIME(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id_index`(`user_id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'escheduler项目用户关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_escheduler_relation_resources_user
-- ----------------------------
DROP TABLE IF EXISTS `t_escheduler_relation_resources_user`;
CREATE TABLE `t_escheduler_relation_resources_user`  (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` INT(11) NOT NULL COMMENT '用户id',
  `resources_id` INT(11) NULL DEFAULT NULL COMMENT '资源id',
  `perm` INT(11) NULL DEFAULT 1 COMMENT '权限',
  `create_time` DATETIME(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` DATETIME(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'escheduler资源用户关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_escheduler_relation_udfs_user
-- ----------------------------
DROP TABLE IF EXISTS `t_escheduler_relation_udfs_user`;
CREATE TABLE `t_escheduler_relation_udfs_user`  (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` INT(11) NOT NULL COMMENT '用户id',
  `udf_id` INT(11) NULL DEFAULT NULL COMMENT 'udf id',
  `perm` INT(11) NULL DEFAULT 1 COMMENT '权限',
  `create_time` DATETIME(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` DATETIME(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'escheduler 用户UDFS关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_escheduler_relation_user_alertgroup
-- ----------------------------
DROP TABLE IF EXISTS `t_escheduler_relation_user_alertgroup`;
CREATE TABLE `t_escheduler_relation_user_alertgroup`  (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `alertgroup_id` INT(11) NULL DEFAULT NULL COMMENT '组消息id',
  `user_id` INT(11) NULL DEFAULT NULL COMMENT '用户id',
  `create_time` DATETIME(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` DATETIME(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'escheduler告警组关联用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_escheduler_resources
-- ----------------------------
DROP TABLE IF EXISTS `t_escheduler_resources`;
CREATE TABLE `t_escheduler_resources`  (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `alias` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '别名',
  `file_name` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名',
  `desc` VARCHAR(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `user_id` INT(11) NULL DEFAULT NULL COMMENT '用户id',
  `type` TINYINT(4) NULL DEFAULT NULL COMMENT '资源类型，0 FILE，1 UDF',
  `size` BIGINT(20) NULL DEFAULT NULL COMMENT '资源大小',
  `create_time` DATETIME(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` DATETIME(0) NULL DEFAULT NULL COMMENT '更新时间',
  `is_leaf` TINYINT(1) NULL DEFAULT 1 COMMENT '是否是叶子节点，即没有子节点的节点',
  `seq_num` INT(11) NULL DEFAULT 0 COMMENT '展示排序',
  `parent_id` INT(11) NULL DEFAULT 0 COMMENT '父资源id。没有父资源id的填0',
  `flag` TINYINT(1) NULL DEFAULT 1 COMMENT '记录是否有效。0无效；1有效',
  `ancestor_id` INT(11) NULL DEFAULT NULL COMMENT '祖先资源id',
  `path` VARCHAR(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件路径',
  `file_format` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件格式后缀',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'escheduler资源表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_escheduler_schedules
-- ----------------------------
DROP TABLE IF EXISTS `t_escheduler_schedules`;
CREATE TABLE `t_escheduler_schedules`  (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `process_definition_id` INT(11) NOT NULL COMMENT '流程定义id',
  `start_time` DATETIME(0) NOT NULL COMMENT '调度开始时间',
  `end_time` DATETIME(0) NOT NULL COMMENT '调度结束时间',
  `crontab` VARCHAR(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'crontab 表达式',
  `failure_strategy` TINYINT(4) NOT NULL COMMENT '失败策略： 0 结束，1 继续',
  `user_id` INT(11) NOT NULL COMMENT '用户id',
  `release_state` TINYINT(4) NOT NULL COMMENT '状态：0 未上线，1 上线',
  `warning_type` TINYINT(4) NOT NULL COMMENT '告警类型：0 不发,1 流程成功发,2 流程失败发,3 成功失败都发',
  `warning_group_id` INT(11) NULL DEFAULT NULL COMMENT '告警组id',
  `process_instance_priority` INT(11) NULL DEFAULT NULL COMMENT '流程实例优先级：0 Highest,1 High,2 Medium,3 Low,4 Lowest',
  `worker_group_id` INT(11) NULL DEFAULT -1 COMMENT '任务指定运行的worker分组',
  `create_time` DATETIME(0) NOT NULL COMMENT '创建时间',
  `update_time` DATETIME(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'escheduler任务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_escheduler_session
-- ----------------------------
DROP TABLE IF EXISTS `t_escheduler_session`;
CREATE TABLE `t_escheduler_session`  (
  `id` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `user_id` INT(11) NULL DEFAULT NULL COMMENT '用户id',
  `ip` VARCHAR(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录ip',
  `last_login_time` DATETIME(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'escheduler session表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_escheduler_task_instance
-- ----------------------------
DROP TABLE IF EXISTS `t_escheduler_task_instance`;
CREATE TABLE `t_escheduler_task_instance`  (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `task_type` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务类型',
  `process_definition_id` INT(11) NULL DEFAULT NULL COMMENT '流程定义id',
  `process_instance_id` INT(11) NULL DEFAULT NULL COMMENT '流程实例id',
  `task_json` LONGTEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '任务节点json',
  `state` TINYINT(4) NULL DEFAULT NULL COMMENT '任务实例状态：0 提交成功,1 正在运行,2 准备暂停,3 暂停,4 准备停止,5 停止,6 失败,7 成功,8 需要容错,9 kill,10 等待线程,11 等待依赖完成',
  `submit_time` DATETIME(0) NULL DEFAULT NULL COMMENT '任务提交时间',
  `start_time` DATETIME(0) NULL DEFAULT NULL COMMENT '任务开始时间',
  `end_time` DATETIME(0) NULL DEFAULT NULL COMMENT '任务结束时间',
  `host` VARCHAR(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执行任务的机器',
  `execute_path` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务执行路径',
  `log_path` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务日志路径',
  `alert_flag` TINYINT(4) NULL DEFAULT NULL COMMENT '是否告警',
  `retry_times` INT(4) NULL DEFAULT 0 COMMENT '重试次数',
  `pid` INT(4) NULL DEFAULT NULL COMMENT '进程pid',
  `app_link` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'yarn app id',
  `flag` TINYINT(4) NULL DEFAULT 1 COMMENT '是否可用：0 不可用，1 可用',
  `retry_interval` INT(4) NULL DEFAULT NULL COMMENT '重试间隔',
  `max_retry_times` INT(2) NULL DEFAULT NULL COMMENT '最大重试次数',
  `task_instance_priority` INT(11) NULL DEFAULT NULL COMMENT '任务实例优先级：0 Highest,1 High,2 Medium,3 Low,4 Lowest',
  `worker_group_id` INT(11) NULL DEFAULT -1 COMMENT '任务指定运行的worker分组',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `process_instance_id`(`process_instance_id`) USING BTREE,
  INDEX `task_instance_index`(`process_definition_id`, `process_instance_id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务实例表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_escheduler_tenant
-- ----------------------------
DROP TABLE IF EXISTS `t_escheduler_tenant`;
CREATE TABLE `t_escheduler_tenant`  (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_code` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '租户编码',
  `tenant_name` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '租户名称',
  `desc` VARCHAR(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `queue_id` INT(11) NULL DEFAULT NULL COMMENT '队列id',
  `create_time` DATETIME(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` DATETIME(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'escheduler用户权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_escheduler_udfs
-- ----------------------------
DROP TABLE IF EXISTS `t_escheduler_udfs`;
CREATE TABLE `t_escheduler_udfs`  (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` INT(11) NOT NULL COMMENT '用户id',
  `func_name` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'UDF函数名',
  `class_name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类名',
  `type` TINYINT(4) NOT NULL COMMENT 'Udf函数类型',
  `arg_types` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数',
  `database` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '库名',
  `desc` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `resource_id` INT(11) NOT NULL COMMENT '资源id',
  `resource_name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资源名称',
  `create_time` DATETIME(0) NOT NULL COMMENT '创建时间',
  `update_time` DATETIME(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'escheduler UDFS资源表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_escheduler_user
-- ----------------------------
DROP TABLE IF EXISTS `t_escheduler_user`;
CREATE TABLE `t_escheduler_user`  (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `user_password` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户密码',
  `user_type` TINYINT(4) NULL DEFAULT NULL COMMENT '用户类型：0 管理员，1 普通用户',
  `email` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` VARCHAR(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
  `tenant_id` INT(11) NULL DEFAULT NULL COMMENT '管理员0,普通用户所属租户id',
  `create_time` DATETIME(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` DATETIME(0) NULL DEFAULT NULL COMMENT '更新时间',
  `queue` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '队列',
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `phone`(`phone`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'escheduler用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_escheduler_version
-- ----------------------------
DROP TABLE IF EXISTS `t_escheduler_version`;
CREATE TABLE `t_escheduler_version`  (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `version` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '版本名称',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `version_UNIQUE`(`version`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '版本表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_escheduler_worker_group
-- ----------------------------
DROP TABLE IF EXISTS `t_escheduler_worker_group`;
CREATE TABLE `t_escheduler_worker_group`  (
  `id` BIGINT(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` VARCHAR(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组名称',
  `ip_list` VARCHAR(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'worker地址列表',
  `create_time` DATETIME(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` DATETIME(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'escheduler worker组表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_escheduler_worker_server
-- ----------------------------
DROP TABLE IF EXISTS `t_escheduler_worker_server`;
CREATE TABLE `t_escheduler_worker_server`  (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `host` VARCHAR(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ip',
  `port` INT(11) NULL DEFAULT NULL COMMENT '进程号',
  `zk_directory` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'zk注册目录',
  `res_info` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '集群资源信息：json格式{\"cpu\":xxx,\"memroy\":xxx}',
  `create_time` DATETIME(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_heartbeat_time` DATETIME(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'escheduler worker服务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `short_name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '标签名简称',
  `name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '标签名',
  `owner_id` BIGINT(20) NOT NULL COMMENT 'owner_id',
  `is_id_mapped` TINYINT(1) NOT NULL COMMENT '是否id化：1=是 0=否',
  `is_visible` TINYINT(1) NOT NULL COMMENT '是否可见：1=可见 0=不可见',
  `is_encrypted` TINYINT(1) NOT NULL COMMENT '是否加密：1=加密 0=不加密',
  `is_related` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否关联字段：1=是 0=否',
  `data_type` INT(11) NOT NULL COMMENT '数据类型: 1=int 2=float 3=string',
  `source_data_type` INT(11) NOT NULL COMMENT '源数据类型',
  `aggregator` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '支持的聚合类型',
  `operator` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '支持的运算类型',
  `description` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '描述',
  `seq_num` INT(11) NOT NULL DEFAULT 0 COMMENT '优先级排序',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_owner_name`(`owner_id`, `name`) USING BTREE COMMENT '标签名唯一索引',
  UNIQUE INDEX `uk_owner_short_name`(`owner_id`, `short_name`) USING BTREE COMMENT '标签名简称唯一索引',
  INDEX `idx_owner_id`(`owner_id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '标签表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tag_bitmap_config
-- ----------------------------
DROP TABLE IF EXISTS `tag_bitmap_config`;
CREATE TABLE `tag_bitmap_config`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tag_owner_id` BIGINT(20) UNSIGNED NOT NULL COMMENT '表id',
  `offset` BIGINT(20) NOT NULL COMMENT '偏移量',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `tag_owner_id`(`tag_owner_id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'bitmap配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tag_bitmap_config_detail
-- ----------------------------
DROP TABLE IF EXISTS `tag_bitmap_config_detail`;
CREATE TABLE `tag_bitmap_config_detail`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `tag_owner_id` BIGINT(20) UNSIGNED NOT NULL COMMENT '表id',
  `tag_id` BIGINT(20) UNSIGNED NOT NULL COMMENT '字段id',
  `is_related` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否关联字段 0=否 1=是',
  `sign` BIGINT(20) NULL DEFAULT NULL COMMENT '标签值的hash值',
  `state` INT(2) NOT NULL COMMENT '状态',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `tag_owner_id_tag_id_is_related_sign`(`tag_owner_id`, `tag_id`, `is_related`, `sign`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'bitmap配置详细字段表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tag_channel
-- ----------------------------
DROP TABLE IF EXISTS `tag_channel`;
CREATE TABLE `tag_channel`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `utm_campaign` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '广告系列名称',
  `utm_content` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '广告系列内容',
  `utm_term` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '广告系列字词',
  `utm_medium` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '广告系列媒介',
  `utm_source` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '广告系列来源',
  `url_host` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '网站地址',
  `state` TINYINT(1) NOT NULL DEFAULT 1 COMMENT '是否有效 1=是 0=否',
  `user_id` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '所属人id',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmd_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '渠道分析表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tag_classification
-- ----------------------------
DROP TABLE IF EXISTS `tag_classification`;
CREATE TABLE `tag_classification`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '名称',
  `type` INT(11) NOT NULL COMMENT '类型：1=事件 2=维度',
  `is_built_in` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否内置：1=是 0=否',
  `data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'json格式数据',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '事件/标签所属分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tag_detail
-- ----------------------------
DROP TABLE IF EXISTS `tag_detail`;
CREATE TABLE `tag_detail`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tag_id` BIGINT(20) UNSIGNED NOT NULL COMMENT 'tag_id',
  `detail_id` BIGINT(20) UNSIGNED NOT NULL COMMENT 'detail_id',
  `detail_alias` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'detail别名',
  `is_visible` TINYINT(1) NOT NULL DEFAULT 1 COMMENT '是否可见：1=可见 0=不可见',
  `is_regex` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否正则表达式：1=是 0=不是',
  `is_merging` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '如果是正则表达式，是否据此对后续数据进行归并：1=是 0=不是',
  `is_enabled` TINYINT(1) NOT NULL DEFAULT 1 COMMENT '是否启用：1=是 0=不是',
  `sign` BIGINT(20) NOT NULL DEFAULT 0 COMMENT 'tag_detail的hash值',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tag_detail`(`tag_id`, `detail_id`) USING BTREE COMMENT '组合唯一索引',
  INDEX `idx_sign`(`sign`) USING BTREE COMMENT 'hash索引'
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '标签明细表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tag_detail_relationship
-- ----------------------------
DROP TABLE IF EXISTS `tag_detail_relationship`;
CREATE TABLE `tag_detail_relationship`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tag_detail_id` BIGINT(20) UNSIGNED NOT NULL COMMENT 'tag_detail_id',
  `parent_tag_detail_id` BIGINT(20) UNSIGNED NOT NULL COMMENT '父tag_detail_id',
  `grandparent_tag_detail_id` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '祖父tag_detail_id',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tag`(`tag_detail_id`, `parent_tag_detail_id`, `grandparent_tag_detail_id`) USING BTREE COMMENT '组合唯一索引'
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '标签明细关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tag_event
-- ----------------------------
DROP TABLE IF EXISTS `tag_event`;
CREATE TABLE `tag_event`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tag_id` BIGINT(20) UNSIGNED NOT NULL COMMENT 'tag_id',
  `event_id` BIGINT(20) UNSIGNED NOT NULL COMMENT 'event_id',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tag_event`(`tag_id`, `event_id`) USING BTREE COMMENT '组合唯一索引',
  UNIQUE INDEX `uniq_tag_id_event_id`(`tag_id`, `event_id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '标签事件表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tag_funnel
-- ----------------------------
DROP TABLE IF EXISTS `tag_funnel`;
CREATE TABLE `tag_funnel`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '漏斗名称',
  `cname` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '漏斗显示名称',
  `description` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '漏斗描述',
  `max_convert_time` INT(11) NOT NULL COMMENT '漏斗窗口期',
  `steps` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '漏斗步骤',
  `is_relation` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否关联属性 1=是 0=否',
  `is_public` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否公共漏斗 1=是 0=否',
  `seq_num` INT(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `state` TINYINT(1) NOT NULL DEFAULT 1 COMMENT '是否有效 1=是 0=否',
  `user_id` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '所属人id',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmd_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '漏斗表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tag_metric
-- ----------------------------
DROP TABLE IF EXISTS `tag_metric`;
CREATE TABLE `tag_metric`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `code` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '指标代码',
  `service_type` TINYINT(4) NOT NULL COMMENT '服务类型: 1=databus 2=merger 3=dataworks',
  `metric_type` TINYINT(2) NOT NULL COMMENT '指标统计类型: 1=成功 2=失败 3=全部',
  `partition_num` INT(4) NOT NULL DEFAULT 0 COMMENT '分区号',
  `value` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '次数',
  `handle` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '处理数',
  `offset` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '偏移量',
  `description` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '描述',
  `metric_time` DATETIME(0) NOT NULL COMMENT '统计时间段',
  `is_state` TINYINT(1) NOT NULL DEFAULT 1 COMMENT '记录是否有效 1=有效 0=失效',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code_service_type_metric_type_partition_metric_time`(`code`, `service_type`, `metric_type`, `partition_num`, `metric_time`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '指标统计表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tag_owner
-- ----------------------------
DROP TABLE IF EXISTS `tag_owner`;
CREATE TABLE `tag_owner`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `database_name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '数据库名',
  `table_name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '表名',
  `topic` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'topic',
  `type` INT(11) NOT NULL COMMENT '类型：1=事实表 2=维度表 3=拉链表',
  `cname` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '显示名',
  `description` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '描述',
  `is_visible` TINYINT(1) NOT NULL DEFAULT 1 COMMENT '是否可见：1=可见 0=不可见',
  `is_real` TINYINT(1) NOT NULL DEFAULT 1 COMMENT '是否真实表：1=是 0=不是',
  `real_id` BIGINT(20) NULL DEFAULT NULL COMMENT '真实表id，针对虚拟表',
  `data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT 'json格式数据，针对虚拟表',
  `is_active` TINYINT(1) NULL DEFAULT 0 COMMENT '是否活跃：1=是 0=不是',
  `topic_type` INT(11) NOT NULL DEFAULT 2 COMMENT 'topic类型：1=全量 2=增量',
  `is_event` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否事件表：1=是 0=否',
  `is_enabled` TINYINT(1) NOT NULL DEFAULT 1 COMMENT '是否启用：1=是 0=不是',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_owner`(`database_name`, `table_name`) USING BTREE COMMENT '组合唯一索引'
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '标签所属表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tag_owner_group
-- ----------------------------
DROP TABLE IF EXISTS `tag_owner_group`;
CREATE TABLE `tag_owner_group`  (
  `id` BIGINT(20) UNSIGNED NOT NULL COMMENT '主键id',
  `name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '名称',
  `color` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '颜色',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `type` INT(4) NULL DEFAULT 2 COMMENT '分组类型: 1=事件分组 2=表分组 10=用户标签分组',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '表分组' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tag_owner_group_map
-- ----------------------------
DROP TABLE IF EXISTS `tag_owner_group_map`;
CREATE TABLE `tag_owner_group_map`  (
  `id` BIGINT(20) UNSIGNED NOT NULL COMMENT '主键id',
  `tag_owner_id` BIGINT(20) NOT NULL COMMENT '所属表id',
  `tag_owner_group_id` BIGINT(20) NOT NULL COMMENT '表分组id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_tag_owner_group`(`tag_owner_id`, `tag_owner_group_id`) USING BTREE
) ENGINE = INNODB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '表分组映射' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tag_owner_relationship
-- ----------------------------
DROP TABLE IF EXISTS `tag_owner_relationship`;
CREATE TABLE `tag_owner_relationship`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tag_owner_id1` BIGINT(20) NULL DEFAULT NULL COMMENT 'tag_owner_id1',
  `tag_id1` BIGINT(20) NOT NULL COMMENT 'tag_id1',
  `tag_id1_type` INT(4) NOT NULL DEFAULT 1 COMMENT 'tag_id1对应关系: 1(1:1) 2(1:n)',
  `tag_owner_id2` BIGINT(20) NULL DEFAULT NULL COMMENT 'tag_owner_id2',
  `tag_id2` BIGINT(20) NOT NULL COMMENT 'tag_id2',
  `tag_id2_type` INT(4) NOT NULL DEFAULT 1 COMMENT 'tag_id2对应关系: 1(1:1) 2(1:n)',
  `is_enabled` TINYINT(1) NOT NULL DEFAULT 1 COMMENT '是否启用：1=是 0=不是',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_relationship`(`tag_id1`, `tag_id2`) USING BTREE COMMENT '组合唯一索引',
  UNIQUE INDEX `uniq_tag_owner_tag_id`(`tag_owner_id1`, `tag_id1`, `tag_owner_id2`, `tag_id2`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '标签所属关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tag_relationship
-- ----------------------------
DROP TABLE IF EXISTS `tag_relationship`;
CREATE TABLE `tag_relationship`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tag_id` BIGINT(20) UNSIGNED NOT NULL COMMENT 'tag_id',
  `parent_tag_id` BIGINT(20) UNSIGNED NOT NULL COMMENT '父tag_id',
  `is_enabled` TINYINT(1) NOT NULL DEFAULT 1 COMMENT '是否启用：1=是 0=不是',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tag`(`tag_id`, `parent_tag_id`) USING BTREE COMMENT '组合唯一索引'
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '标签关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tag_statistic
-- ----------------------------
DROP TABLE IF EXISTS `tag_statistic`;
CREATE TABLE `tag_statistic`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `service_type` TINYINT(3) UNSIGNED NOT NULL COMMENT '服务类型，1=dbus，2=dw',
  `statistic_code` VARCHAR(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '统计指标的类目',
  `total_count` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '总数统计',
  `success_count` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '成功统计',
  `fail_count` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '失败统计',
  `description` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '描述',
  `state` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '逻辑删除标识，0=删除 1=存在',
  `gmt_statistic` DATETIME(0) NOT NULL COMMENT '统计时间段，每小时',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_each_hour_statistic`(`service_type`, `statistic_code`, `gmt_statistic`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '青鸾，数据处理统计总体情况' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tag_statistic_detail
-- ----------------------------
DROP TABLE IF EXISTS `tag_statistic_detail`;
CREATE TABLE `tag_statistic_detail`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `service_type` TINYINT(3) UNSIGNED NOT NULL COMMENT '服务类型，1=dbus，2=dw',
  `statistic_code` VARCHAR(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '统计指标的类目',
  `statistic_type` TINYINT(3) UNSIGNED NOT NULL COMMENT '统计指标的类型，1=总数，2=成功，3=失败',
  `topic_partition` INT(10) UNSIGNED NOT NULL COMMENT 'topic的分区',
  `topic_offset` BIGINT(20) UNSIGNED NOT NULL COMMENT 'topic当前offset',
  `first_failed_offset` BIGINT(20) UNSIGNED NULL DEFAULT NULL COMMENT '当前时段内，第一次发生失败时的offset',
  `statistic_count` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '当前分区内 处理总次数/成功/失败 计数',
  `state` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '逻辑删除标识，0=删除 1=存在',
  `gmt_statistic` DATETIME(0) NOT NULL COMMENT '统计的时间段，每小时',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_each_hour_statistic_detail`(`service_type`, `statistic_code`, `statistic_type`, `topic_partition`, `gmt_statistic`) USING BTREE,
  INDEX `idx_each_hour_statistic_detail`(`service_type`, `statistic_code`, `gmt_statistic`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '青鸾，数据处理统计的详情' ROW_FORMAT = DYNAMIC;

