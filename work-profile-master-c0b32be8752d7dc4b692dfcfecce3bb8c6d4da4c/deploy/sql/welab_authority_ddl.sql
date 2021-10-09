DROP DATABASE IF EXISTS `welab_authority`;
CREATE DATABASE `welab_authority` CHARACTER SET utf8 COLLATE utf8_bin;
USE `welab_authority`;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `domain` INT(11) NOT NULL DEFAULT 1 COMMENT '账户体系: 1平台用户  2数据代理用户',
  `uid` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '关联账号唯一标识',
  `user_id` BIGINT(20) NULL DEFAULT NULL COMMENT '用户id',
  `name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '名称',
  `description` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '描述',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_domian_uid`(`domain`, `uid`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '基础账号表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for account_roles
-- ----------------------------
DROP TABLE IF EXISTS `account_roles`;
CREATE TABLE `account_roles`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `account_id` BIGINT(20) NOT NULL COMMENT '数据库账号id',
  `role_id` BIGINT(20) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_account_role`(`account_id`, `role_id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '账号角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for datasource_account
-- ----------------------------
DROP TABLE IF EXISTS `datasource_account`;
CREATE TABLE `datasource_account`  (
  `id` BIGINT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `ds_id` BIGINT(10) UNSIGNED NOT NULL COMMENT '数据源id',
  `account_type` TINYINT(2) UNSIGNED NOT NULL COMMENT '账户类型（0 只读，1 读写 ，2 同步）',
  `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `is_valid` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否有效（1 表示是，0 表示否）默认1',
  `remark` VARCHAR(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` BIGINT(20) UNSIGNED NOT NULL COMMENT '创建人',
  `gmt_create` DATETIME(0) NOT NULL COMMENT '创建时间',
  `modifier` BIGINT(20) UNSIGNED NULL DEFAULT NULL COMMENT '更新人',
  `gmt_modified` DATETIME(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_ds_id_account_type_name`(`ds_id`, `account_type`, `name`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据源账户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for datasource_additional_info
-- ----------------------------
DROP TABLE IF EXISTS `datasource_additional_info`;
CREATE TABLE `datasource_additional_info`  (
  `id` BIGINT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ds_id` BIGINT(10) UNSIGNED NOT NULL COMMENT '数据源id',
  `security_level` INT(1) NOT NULL DEFAULT 1 COMMENT '1一般，2非常',
  `owner_name` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '数据源拥有者姓名',
  `owner_phone` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '数据源拥有者手机号',
  `owner_email` VARCHAR(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '数据源拥有者邮箱',
  `approver_name` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '数据源审批者姓名',
  `approver_phone` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '数据源审批者手机号',
  `approver_email` VARCHAR(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '数据源审批者邮箱',
  `modifier` BIGINT(20) NULL DEFAULT NULL COMMENT '更新人',
  `update_at` DATETIME(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ds_id`(`ds_id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for datasource_authorization
-- ----------------------------
DROP TABLE IF EXISTS `datasource_authorization`;
CREATE TABLE `datasource_authorization`  (
  `id` BIGINT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `project_name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '项目名称',
  `authorization_code` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '授权码',
  `is_auth_all_ds` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否授权全部库（1 表示是，0 表示否）默认0',
  `auth_all_ds_account_type` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '当授权所有库时的账户类型（0 只读，1 读写 ，2 同步）可多选',
  `is_valid` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否有效（1 表示是，0 表示否）默认1',
  `remark` VARCHAR(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` BIGINT(20) UNSIGNED NOT NULL COMMENT '创建人',
  `gmt_create` DATETIME(0) NOT NULL COMMENT '创建时间',
  `modifier` BIGINT(20) UNSIGNED NULL DEFAULT NULL COMMENT '更新人',
  `gmt_modified` DATETIME(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_authorization_code`(`authorization_code`) USING BTREE,
  UNIQUE INDEX `uk_project_name`(`project_name`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据源认证表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for datasource_authorized_ds_detail
-- ----------------------------
DROP TABLE IF EXISTS `datasource_authorized_ds_detail`;
CREATE TABLE `datasource_authorized_ds_detail`  (
  `id` BIGINT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id ',
  `auth_id` BIGINT(10) UNSIGNED NOT NULL COMMENT '授权id',
  `ds_id` BIGINT(10) UNSIGNED NOT NULL COMMENT '数据源id',
  `account_type` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账户类型（0 只读，1 读写 ，2 同步）,可多选',
  `is_auth_all_nonexclusive_node` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '授权所有非排他节点（1 表示是，0 表示否）默认1，如果0,则需要查询明细表',
  `is_valid` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否有效（1 表示是，0 表示否）默认1',
  `creator` BIGINT(20) UNSIGNED NOT NULL COMMENT '创建人',
  `gmt_create` DATETIME(0) NOT NULL COMMENT '创建时间',
  `modifier` BIGINT(20) UNSIGNED NULL DEFAULT NULL COMMENT '更新人',
  `gmt_modified` DATETIME(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_ds_id`(`ds_id`) USING BTREE,
  INDEX `idx_auth_id_ds_id_account_type`(`auth_id`, `ds_id`, `account_type`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据源授权明细表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for datasource_authorized_node_detail
-- ----------------------------
DROP TABLE IF EXISTS `datasource_authorized_node_detail`;
CREATE TABLE `datasource_authorized_node_detail`  (
  `id` BIGINT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `authorized_ds_detail_id` BIGINT(10) UNSIGNED NOT NULL COMMENT '授权明细id',
  `node_id` BIGINT(10) UNSIGNED NOT NULL COMMENT '节点id',
  `is_exclusive_node` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否排他（提示管理员不分配该节点）（1 表示是，0 表示否）默认0',
  `remark` VARCHAR(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_valid` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否有效（1 表示是，0 表示否）默认1',
  `creator` BIGINT(20) UNSIGNED NOT NULL COMMENT '创建人',
  `gmt_create` DATETIME(0) NOT NULL COMMENT '创建时间',
  `modifier` BIGINT(20) UNSIGNED NULL DEFAULT NULL COMMENT '更新人',
  `gmt_modified` DATETIME(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_node_id`(`node_id`, `is_exclusive_node`) USING BTREE,
  INDEX `uk_authorized_detail_id_node_id`(`authorized_ds_detail_id`, `node_id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据源授权具体节点明细表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for datasource_base
-- ----------------------------
DROP TABLE IF EXISTS `datasource_base`;
CREATE TABLE `datasource_base`  (
  `id` BIGINT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `schema_name` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '真实的数据源schema名称',
  `out_display` VARCHAR(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用于外部展示的名称',
  `global_uniq_str` VARCHAR(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '基于schema名称自动生成的全局唯一字符串',
  `db_type` TINYINT(2) UNSIGNED NOT NULL COMMENT '数据源类型数据源类型MySQL(0),PostgreSQL(1),Impala(2),Oracle(3),SQLServer(4),H2(5),Kafka(6),Kudu(7),Hbase(8),Atlas(9),Greenplum(10),MongoDB(11)',
  `ds_instance_id` BIGINT(10) UNSIGNED NOT NULL COMMENT '实例id',
  `tag_owner_group` BIGINT(20) UNSIGNED NULL DEFAULT NULL COMMENT '所属业务分组(前端页面维护不允许为空)',
  `tag_owner_group_name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务分组名称（冗余）',
  `default_extend_jdbc_url` VARCHAR(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '默认的jdbcUrl扩展信息（如：serverTimezone=GMT%2B8&zeroDateTimeBehavior=convertToNull）',
  `is_offline` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '数据源是否下线（1 表示是，0 表示否）默认0',
  `remark` VARCHAR(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` BIGINT(20) UNSIGNED NOT NULL COMMENT '创建人',
  `gmt_create` DATETIME(0) NOT NULL COMMENT '创建时间',
  `modifier` BIGINT(20) UNSIGNED NULL DEFAULT NULL COMMENT '更新人',
  `gmt_modified` DATETIME(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_schema_name_ds_instance_id`(`schema_name`, `ds_instance_id`) USING BTREE,
  UNIQUE INDEX `uk_global_uniq_str`(`global_uniq_str`) USING BTREE,
  INDEX `idx_tag_owner_group`(`tag_owner_group`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据源基础信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for datasource_info
-- ----------------------------
DROP TABLE IF EXISTS `datasource_info`;
CREATE TABLE `datasource_info`  (
  `id` BIGINT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '数据源的业务级别名称',
  `description` VARCHAR(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '数据源描述',
  `db_type` INT(11) NOT NULL COMMENT '数据源类型MySQL(0),PostgreSQL(1),Impala(2),Oracle(3),SQLServer(4),H2(5),Kafka(6),Kudu(7),Hbase(8),Atlas(9)',
  `driver_name` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '驱动名称',
  `address` VARCHAR(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '数据源地址',
  `username` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户名',
  `psw` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '密码',
  `status` INT(2) NOT NULL DEFAULT 0 COMMENT '状态，0：生效，10连接不通，99强制失效',
  `ext_attr` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '扩展属性',
  `creator` BIGINT(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_at` DATETIME(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` BIGINT(20) NULL DEFAULT NULL COMMENT '更新人',
  `update_at` DATETIME(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` VARCHAR(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '系统备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_datasource_info`(`name`, `username`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for datasource_instance
-- ----------------------------
DROP TABLE IF EXISTS `datasource_instance`;
CREATE TABLE `datasource_instance`  (
  `id` BIGINT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` VARCHAR(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '实例名称（概括下面所有的库）',
  `db_type` TINYINT(2) UNSIGNED NOT NULL COMMENT '数据库类型',
  `is_offline` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否下线（1 表示是，0 表示否）默认0',
  `remark` VARCHAR(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` BIGINT(20) UNSIGNED NOT NULL COMMENT '创建人',
  `gmt_create` DATETIME(0) NOT NULL COMMENT '创建时间',
  `modifier` BIGINT(20) UNSIGNED NULL DEFAULT NULL COMMENT '更新人',
  `gmt_modified` DATETIME(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`name`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据库实例信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for datasource_instance_node
-- ----------------------------
DROP TABLE IF EXISTS `datasource_instance_node`;
CREATE TABLE `datasource_instance_node`  (
  `id` BIGINT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `ds_instance_id` BIGINT(10) UNSIGNED NOT NULL COMMENT '数据源id',
  `ip_or_domain` VARCHAR(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ip地址或者域名',
  `port` SMALLINT(5) UNSIGNED NOT NULL COMMENT '端口',
  `is_master_node` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否主节点类型（1 表示是，0 表示否）默认0',
  `is_exclusive_node` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否存在排他的授权（1 表示是，0 表示否）默认0，分配具体权限时反向更新',
  `node_status` TINYINT(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '节点状态：0：生效，10连接不通，99强制失效 ',
  `is_offline` TINYINT(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否下线（1 表示是，0 表示否）默认0',
  `remark` VARCHAR(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_ds_instance_id`(`ds_instance_id`) USING BTREE,
  INDEX `idx_ip_or_domain_port`(`ip_or_domain`, `port`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据源节点表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for event_log
-- ----------------------------
DROP TABLE IF EXISTS `event_log`;
CREATE TABLE `event_log`  (
  `id` BIGINT(20) NOT NULL COMMENT '事件id',
  `user_id` BIGINT(20) NULL DEFAULT NULL COMMENT '用户id',
  `user_name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '用户名',
  `app_id` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '应用id',
  `user_agent` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'User-Agent',
  `event_name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '事件名称',
  `event_notes` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '事件note',
  `point_signature` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '接口名称',
  `request_ip` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '请求ip地址',
  `request_param` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '请求参数',
  `request_source` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '事件来源',
  `request_area` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '事件地域',
  `request_url` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '请求地址',
  `request_method` VARCHAR(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '请求method',
  `event_type` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'read=读操作  save=写操作',
  `event_time` DATETIME(0) NOT NULL COMMENT '事件开始时间',
  `end_time` DATETIME(0) NULL DEFAULT NULL COMMENT '事件结束时间',
  `result_code` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '结果返回码',
  `request_result` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '返回参数',
  `error_msg` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '错误信息',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id_key`(`user_id`) USING BTREE,
  INDEX `idx_app_id`(`app_id`) USING BTREE,
  INDEX `idx_user_name`(`user_name`) USING BTREE
) ENGINE = INNODB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '事件日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for event_log_history
-- ----------------------------
DROP TABLE IF EXISTS `event_log_history`;
CREATE TABLE `event_log_history`  (
  `id` BIGINT(20) NOT NULL COMMENT '事件id',
  `user_id` BIGINT(20) NULL DEFAULT NULL COMMENT '用户id',
  `user_name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '用户名',
  `app_id` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '应用id',
  `user_agent` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'User-Agent',
  `event_name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '事件名称',
  `event_notes` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '事件note',
  `point_signature` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '接口名称',
  `request_ip` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '请求ip地址',
  `request_param` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '请求参数',
  `request_source` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '事件来源',
  `request_area` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '事件地域',
  `request_url` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '请求地址',
  `request_method` VARCHAR(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '请求method',
  `event_type` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'read=读操作 save=写操作',
  `event_time` DATETIME(0) NOT NULL COMMENT '事件开始时间',
  `end_time` DATETIME(0) NULL DEFAULT NULL COMMENT '事件结束时间',
  `result_code` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '结果返回码',
  `request_result` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '返回参数',
  `error_msg` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '错误信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '事件日志历史数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for groups
-- ----------------------------
DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `system_id` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '系统id',
  `name` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '名称',
  `description` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '描述',
  `type` TINYINT(2) NULL DEFAULT 1 COMMENT '类型 1系统  2数据库',
  `state` TINYINT(1) NOT NULL DEFAULT 1 COMMENT '状态 1启用 0失效',
  `gmt_create` DATETIME(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_system_name`(`system_id`, `name`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '资源组类（系统资源和数据库资源）' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for org
-- ----------------------------
DROP TABLE IF EXISTS `org`;
CREATE TABLE `org`  (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '租户id',
  `code` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '租户code',
  `name` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '租户名称',
  `description` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '租户描述',
  `parent_id` BIGINT(20) NOT NULL DEFAULT -1 COMMENT '父机构id',
  `seq_num` INT(11) NOT NULL DEFAULT 0 COMMENT '展示排序',
  `is_status` TINYINT(1) NOT NULL COMMENT '是否有效 0无效；1有效',
  `gmt_modified` DATETIME(0) NULL DEFAULT NULL COMMENT '修改记录时间',
  `gmt_create` DATETIME(0) NULL DEFAULT NULL COMMENT '创建记录时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '租户机构表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for org_config
-- ----------------------------
DROP TABLE IF EXISTS `org_config`;
CREATE TABLE `org_config`  (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `app_id` VARCHAR(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '应用id',
  `app_secret` VARCHAR(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '应用私钥 用于登陆请求接口',
  `org_id` BIGINT(20) NOT NULL COMMENT '机构号',
  `token_expire_time` INT(11) NOT NULL COMMENT 'token过期时间 单位秒',
  `digest` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '摘要key 生成摘要时，防篡改',
  `ssh_key` VARCHAR(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户端https公钥 用于http双端认证，如github SSH key',
  `request_ips` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求方ip string[].join格式，用于检查接入方ip',
  `auth_redirect_url` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '授权回调域名 用于auth2.0跳转验权跳转',
  `callback_url` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接口回调地址 用于异步返回第三方数据，如支付回调',
  `state` TINYINT(1) NOT NULL COMMENT '记录状态 0-无效 1-有效',
  `create_time` DATETIME(0) NOT NULL COMMENT '创建时间',
  `update_time` DATETIME(0) NOT NULL COMMENT '修改时间',
  `lock_version` INT(11) NOT NULL COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk1_org_config`(`app_id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '资源id。为避免生成对象时与Spring的Resource冲突，所以表加了s以区分',
  `system_id` BIGINT(20) NOT NULL COMMENT '子系统id',
  `group_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '组id',
  `type` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '资源类型。menu菜单；view视图 ；api接口',
  `method` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接口请求方式',
  `name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '资源名称',
  `url_key` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '标识key',
  `url` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '资源地址',
  `icon` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图标',
  `parent_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '父资源id。没有父资源id的填0',
  `level` INT(11) NOT NULL COMMENT '资源排序级别。起始为1，从小到大排序',
  `is_leaf` TINYINT(1) NOT NULL COMMENT '是否是叶子节点，即没有子节点的节点',
  `message` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '描述',
  `seq_num` INT(11) NOT NULL DEFAULT 0 COMMENT '展示排序',
  `gmt_create` DATETIME(0) NOT NULL COMMENT '记录创建时间',
  `gmt_modified` DATETIME(0) NOT NULL COMMENT '记录更新时间',
  `is_status` TINYINT(1) NOT NULL COMMENT '记录是否有效。0无效；1有效',
  `sys_resource_id` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '对应系统的资源id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_system_group_type_method_url`(`system_id`, `group_id`, `type`, `method`, `url`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '链接资源记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for resource_locale
-- ----------------------------
DROP TABLE IF EXISTS `resource_locale`;
CREATE TABLE `resource_locale`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `resource_id` BIGINT(20) NOT NULL COMMENT '资源id',
  `locale` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '语言代码',
  `value` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '对应语言的值',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_resource_locale`(`resource_id`, `locale`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '资源国际化表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `org_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '租户id，后台管理员或系统内用户默认存0',
  `system_id` BIGINT(20) NOT NULL COMMENT '子系统id',
  `group_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '组id',
  `code` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '角色编码',
  `name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '角色名称',
  `role_type` TINYINT(2) NOT NULL DEFAULT 3 COMMENT '角色类型，1超级管理员，2应用管理员，3普通角色',
  `gmt_create` DATETIME(0) NOT NULL COMMENT '记录创建时间',
  `gmt_modified` DATETIME(0) NOT NULL COMMENT '记录更新时间',
  `message` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '角色描述',
  `is_status` TINYINT(1) NOT NULL DEFAULT 1 COMMENT '状态，1有效，0无效',
  `sys_role_id` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '对应系统的角色id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_system_group_code_name`(`system_id`, `group_id`, `code`, `name`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '角色记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for role_data_auths
-- ----------------------------
DROP TABLE IF EXISTS `role_data_auths`;
CREATE TABLE `role_data_auths`  (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_id` BIGINT(20) NOT NULL COMMENT '角色id',
  `database_type` CHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'mysql' COMMENT '数据库类型',
  `auth_type` CHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'all' COMMENT '权限分类：select update insert delete all',
  `database_name` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '*' COMMENT '数据库标识(*代表全部)',
  `table_name` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '*' COMMENT '表标识(*代表全部)',
  `column_name` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '*' COMMENT '字段标识(*代表全部)',
  `state` TINYINT(1) NOT NULL DEFAULT 1 COMMENT '状态 0=失效 1=有效',
  `gmt_create` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '记录创建时间',
  `gmt_modified` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '记录修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '角色数据权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for role_resources
-- ----------------------------
DROP TABLE IF EXISTS `role_resources`;
CREATE TABLE `role_resources`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '角色资源对照表id',
  `role_id` BIGINT(20) NOT NULL COMMENT '角色id',
  `resource_id` BIGINT(20) NOT NULL COMMENT '资源id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_role_id_resources_id`(`role_id`, `resource_id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '角色资源对照表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for role_systems
-- ----------------------------
DROP TABLE IF EXISTS `role_systems`;
CREATE TABLE `role_systems`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_id` BIGINT(20) UNSIGNED NOT NULL COMMENT '角色id',
  `system_id` BIGINT(20) UNSIGNED NOT NULL COMMENT '系统id',
  `group_ids` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '资源组类id集合',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_role_id_system_id`(`role_id`, `system_id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '角色系统授权表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for security_account
-- ----------------------------
DROP TABLE IF EXISTS `security_account`;
CREATE TABLE `security_account`  (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `account` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '访问账号',
  `password` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '访问密码',
  `server_ip` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '数据库IP',
  `server_port` INT(11) NULL DEFAULT 0 COMMENT '数据库port',
  `status` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '状态',
  `expire_at` DATETIME(0) NULL DEFAULT NULL COMMENT '过期时间',
  `job_num` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '工单号',
  `user_name` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '申请人用户名',
  `client_ip` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '客户端IP',
  `client_project` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '客户端所属项目',
  `operate` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'read' COMMENT '操作权限',
  `data_decryption` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否解密',
  `database_type` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'mysql' COMMENT '数据库类型',
  `database_name` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '数据库名',
  `show_schema` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '展示库名',
  `overtime` INT(11) NOT NULL DEFAULT 300 COMMENT '默认超时时间(秒)',
  `create_at` DATETIME(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_at` DATETIME(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `account`(`account`) USING BTREE,
  UNIQUE INDEX `job_num`(`job_num`) USING BTREE,
  INDEX `idx_user_name`(`user_name`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for security_account_column
-- ----------------------------
DROP TABLE IF EXISTS `security_account_column`;
CREATE TABLE `security_account_column`  (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `config_id` BIGINT(20) NOT NULL COMMENT '配置ID',
  `status` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '状态',
  `column_type` TINYINT(2) NOT NULL DEFAULT 1 COMMENT '类型 1:account 2:role',
  `data_decryption` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'yes' COMMENT '是否解密',
  `column_name` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字段名',
  `encrypt_mode` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '加密解密方式',
  `create_at` DATETIME(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_at` DATETIME(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_config_id`(`config_id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for security_account_config
-- ----------------------------
DROP TABLE IF EXISTS `security_account_config`;
CREATE TABLE `security_account_config`  (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `account_id` BIGINT(20) NOT NULL COMMENT '账号ID',
  `account` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '访问账号',
  `status` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '状态',
  `config_type` TINYINT(2) NOT NULL DEFAULT 1 COMMENT '类型 1:account 2:role',
  `operate` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'read' COMMENT '操作权限',
  `database_type` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'mysql' COMMENT '数据库类型',
  `database_name` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '数据库名',
  `table_name` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名',
  `create_at` DATETIME(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_at` DATETIME(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_account_id`(`account_id`) USING BTREE,
  INDEX `idx_account`(`account`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for security_audit_record
-- ----------------------------
DROP TABLE IF EXISTS `security_audit_record`;
CREATE TABLE `security_audit_record`  (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `account` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录账户',
  `database_type` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'mysql' COMMENT '数据库类型',
  `database_name` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '数据库名',
  `visit_num` INT(11) NULL DEFAULT 0 COMMENT '访问次数',
  `sql_error_num` INT(11) NULL DEFAULT 0 COMMENT 'SQL报错次数',
  `sensitivity_num` INT(11) NULL DEFAULT 0 COMMENT '访问敏感字段次数',
  `status` VARCHAR(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '状态',
  `create_at` DATETIME(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_at` DATETIME(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for security_database_config
-- ----------------------------
DROP TABLE IF EXISTS `security_database_config`;
CREATE TABLE `security_database_config`  (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_name` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '审核人用户名',
  `database_name` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '数据库名',
  `create_at` DATETIME(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_at` DATETIME(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_name`(`user_name`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for security_decrypt_record
-- ----------------------------
DROP TABLE IF EXISTS `security_decrypt_record`;
CREATE TABLE `security_decrypt_record`  (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `account` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '访问账号',
  `database_type` VARCHAR(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'mysql' COMMENT '数据库类型',
  `database_name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '数据库名',
  `table_name` VARCHAR(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表名',
  `first_select_at` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '首次查询时间',
  `client_ip` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '客户端IP',
  `decrypt_type` TINYINT(2) NULL DEFAULT 1 COMMENT '类型: 1、临时表解密',
  `create_at` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_at` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_account`(`account`) USING BTREE,
  INDEX `idx_table_name`(`table_name`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '临时表解密记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for security_ip_whitelist
-- ----------------------------
DROP TABLE IF EXISTS `security_ip_whitelist`;
CREATE TABLE `security_ip_whitelist`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `match_type` TINYINT(4) UNSIGNED NOT NULL COMMENT '匹配类型(0：用户id,1：角色id)',
  `user_type_id` BIGINT(20) UNSIGNED NOT NULL COMMENT '用户id或者角色id',
  `ip_pattern` VARCHAR(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'ip匹配模式（如：192.168.*.*）',
  `status` TINYINT(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否有效（0：有效，1：无效）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_userTypeId_match_type`(`user_type_id`, `match_type`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '金乌账号白名单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for security_login_record
-- ----------------------------
DROP TABLE IF EXISTS `security_login_record`;
CREATE TABLE `security_login_record`  (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `account` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录账户',
  `server_ip` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '服务IP',
  `server_port` INT(11) NULL DEFAULT 0 COMMENT '服务port',
  `client_ip` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '客户端IP',
  `login_at` DATETIME(0) NULL DEFAULT NULL COMMENT '登录时间',
  `create_at` DATETIME(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for security_operate_record
-- ----------------------------
DROP TABLE IF EXISTS `security_operate_record`;
CREATE TABLE `security_operate_record`  (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `account` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录账户',
  `status` VARCHAR(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '状态',
  `client_ip` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '客户端IP',
  `operate` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'read' COMMENT '操作权限',
  `database_type` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'mysql' COMMENT '数据库类型',
  `database_name` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '数据库名',
  `sql_type` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'select' COMMENT 'SQL类型',
  `sql_content` LONGTEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '执行SQL',
  `result_num` INT(11) NULL DEFAULT 0 COMMENT '结果行数',
  `execute_time` BIGINT(20) NULL DEFAULT NULL COMMENT '执行时间ms',
  `sql_state` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sql状态',
  `error_code` INT(11) NULL DEFAULT NULL COMMENT '错误code',
  `create_at` DATETIME(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for security_report
-- ----------------------------
DROP TABLE IF EXISTS `security_report`;
CREATE TABLE `security_report`  (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `job_num` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '工单号',
  `table_name` VARCHAR(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '表名',
  `oss_url` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'oss路径',
  `apply_name` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '申请人',
  `exec_name` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '处理人',
  `data_decryption` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'no' COMMENT '是否解密',
  `zip_pwd` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '压缩密码',
  `execute_time` BIGINT(20) NULL DEFAULT NULL COMMENT '报表花费时间',
  `status` TINYINT(2) NULL DEFAULT 0 COMMENT '0:申请中，1:已发送bi,  2:已发送到业务员',
  `create_at` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_at` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '工单报表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for security_role_ext
-- ----------------------------
DROP TABLE IF EXISTS `security_role_ext`;
CREATE TABLE `security_role_ext`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `role_id` BIGINT(20) NOT NULL COMMENT '角色id',
  `db_type` INT(11) NOT NULL COMMENT '数据源类型MySQL(0),PostgreSQL(1),Impala(2),Oracle(3),SQLServer(4),H2(5),Kafka(6),Kudu(7),Hbase(8)',
  `db_name` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '数据源别称',
  `overtime` INT(11) NOT NULL DEFAULT 300 COMMENT '默认超时时间(秒)',
  `remark` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '备注',
  `status` TINYINT(2) NOT NULL DEFAULT 1 COMMENT '状态，1有效，0无效',
  `create_at` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_at` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_id`(`role_id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '角色扩展表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for security_user
-- ----------------------------
DROP TABLE IF EXISTS `security_user`;
CREATE TABLE `security_user`  (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_name` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `password_type` TINYINT(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '密码类型：0、mysql类型 1、postgresql类型 2、impala类型 3、oracle 4、sqlserver 5、h2',
  `status` TINYINT(2) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态 1：有效，0无效',
  `create_at` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_at` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_name`(`user_name`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代理主账号' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for system
-- ----------------------------
DROP TABLE IF EXISTS `system`;
CREATE TABLE `system`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '系统id',
  `name` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '系统名称',
  `code` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '系统code',
  `system_type` TINYINT(2) NOT NULL DEFAULT 1 COMMENT '系统类型 1新权限系统 2使用iam系统 3独立系统',
  `gmt_create` DATETIME(0) NULL DEFAULT NULL COMMENT '记录创建时间',
  `gmt_modified` DATETIME(0) NULL DEFAULT NULL COMMENT '记录更新时间',
  `is_status` TINYINT(1) NOT NULL DEFAULT 1 COMMENT '是否有效 0无效；1有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '系统表，用来存储各子系统信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for system_detail
-- ----------------------------
DROP TABLE IF EXISTS `system_detail`;
CREATE TABLE `system_detail`  (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `system_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '系统id',
  `identity_type` TINYINT(2) NOT NULL DEFAULT 1 COMMENT '登录类型  1 用户名密码 2 邮箱 3 手机号 4 其他',
  `login_url` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '登录地址',
  `entry_url` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '入口地址',
  `gmt_create` DATETIME(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modify` DATETIME(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `pk_system_id`(`system_id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '系统扩展表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
	`id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户id',
	`org_id` BIGINT(20) NOT NULL DEFAULT '0' COMMENT '租户id，内部用户默认为0',
	`login_name` CHAR(255) NOT NULL COMMENT '登录名',
	`employee_no` VARCHAR(100) NULL DEFAULT NULL COMMENT '员工号',
	`user_code` VARCHAR(200) NULL COMMENT '用户编码(唯一标识)',
	`password` CHAR(40) NOT NULL COMMENT '密码',
	`name` CHAR(30) NOT NULL COMMENT '姓名',
	`phone` CHAR(50) NULL DEFAULT NULL COMMENT '电话',
	`email` CHAR(200) NULL DEFAULT NULL COMMENT '邮件',
	`user_avatar` VARCHAR(255) NULL DEFAULT NULL COMMENT '用户头像',
	`message` VARCHAR(255) NULL DEFAULT NULL COMMENT '备注',
	`login_fail_num` INT(1) NOT NULL DEFAULT '0' COMMENT '登录失败次数',
	`locked_time` DATETIME NULL DEFAULT NULL COMMENT '登录5次被锁定时间',
	`login_num` INT(11) NOT NULL DEFAULT '0' COMMENT '登录总次数',
	`last_login_time` DATETIME NULL DEFAULT NULL COMMENT '最后登录时间',
	`password_expire_time` DATETIME NULL DEFAULT NULL COMMENT '密码过期时间',
	`expire_time` DATETIME NULL DEFAULT NULL COMMENT '账号过期时间',
	`gmt_create` DATETIME NOT NULL COMMENT '记录创建时间',
	`gmt_modified` DATETIME NOT NULL COMMENT '记录更新时间',
	`is_status` TINYINT(1) NOT NULL COMMENT '账号是否启用，默认为1启用',
	`login_name_encrypt` VARCHAR(255) NULL DEFAULT NULL COMMENT '登录名加密',
	`phone_encrypt` VARCHAR(255) NULL DEFAULT NULL COMMENT '手机加密',
	`email_encrypt` VARCHAR(255) NULL DEFAULT NULL COMMENT '邮箱加密',
	PRIMARY KEY (`id`),
	UNIQUE INDEX `idx_login_name` (`login_name`) USING BTREE,
	UNIQUE INDEX `uniq_user_code` (`user_code`)
)
COMMENT='用户记录表'
ENGINE=InnoDB
;

-- ----------------------------
-- Table structure for user_auths
-- ----------------------------
DROP TABLE IF EXISTS `user_auths`;
CREATE TABLE `user_auths`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT(20) NOT NULL COMMENT '用户id',
  `identity_type` TINYINT(2) NOT NULL DEFAULT 1 COMMENT '登录类型  1 用户名 2 邮箱 3 手机号 4 其他',
  `identifier` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '登录标识',
  `credential` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '密码凭证',
  `gmt_create` DATETIME(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NULL DEFAULT NULL COMMENT '修改时间',
  `identifier_encrypt` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '登录标识加密',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `pk_user_id_identity_type`(`user_id`, `identity_type`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '平台登录验证表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for user_roles
-- ----------------------------
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT(20) NOT NULL COMMENT '用户id',
  `role_id` BIGINT(20) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_user_id_role_id`(`user_id`, `role_id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户角色对照表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for user_systems
-- ----------------------------
DROP TABLE IF EXISTS `user_systems`;
CREATE TABLE `user_systems`  (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` BIGINT(20) NOT NULL COMMENT '用户id',
  `system_id` BIGINT(20) NOT NULL COMMENT '系统id',
  `sys_user_id` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '对应的系统用户id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_user_id_role_id`(`user_id`, `system_id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户系统关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for user_token
-- ----------------------------
DROP TABLE IF EXISTS `user_token`;
CREATE TABLE `user_token`  (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_code` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'token内容 每一次重新登录需要新增该值',
  `user_id` BIGINT(20) NOT NULL COMMENT '用户ID 该登录方式所属用户',
  `org_id` BIGINT(20) NOT NULL COMMENT '机构id',
  `mobile` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `app_id` VARCHAR(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应用id',
  `user_type` TINYINT(4) NOT NULL COMMENT '用户类型 0：游客用户 1：普通用户',
  `device_code` VARCHAR(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '设备号，唯一标识该设备。',
  `origin` VARCHAR(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道来源',
  `expire_time` DATETIME(0) NOT NULL COMMENT '过期时间',
  `state` TINYINT(1) NOT NULL COMMENT '记录状态 默认1有效，0无效',
  `gmt_create` DATETIME(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` DATETIME(0) NOT NULL COMMENT '更新时间',
  `lock_version` INT(11) NOT NULL COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk1_user_token`(`token_code`) USING BTREE,
  INDEX `i_user_token_1`(`user_id`, `org_id`) USING BTREE,
  INDEX `i_user_token_2`(`org_id`, `token_code`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for user_var
-- ----------------------------
DROP TABLE IF EXISTS `user_var`;
CREATE TABLE `user_var` (
	`id` BIGINT (20) NOT NULL AUTO_INCREMENT COMMENT 'id',
	`user_code` VARCHAR (80) NOT NULL COMMENT '外部机构标识,例如工号',
	`var_name` VARCHAR (80) NOT NULL COMMENT '变量名称',
	`raw_val` VARCHAR (150) DEFAULT NULL COMMENT '原始值',
	`var_val` VARCHAR (150) DEFAULT NULL COMMENT '加工后的值',
	`description` VARCHAR (200) DEFAULT NULL COMMENT '描述',
	`gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`gmt_modify` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
	PRIMARY KEY (`id`),
	KEY `idx_user_code` (`user_code`),
	KEY `idx_var_name` (`var_name`)
) ENGINE = INNODB  DEFAULT CHARSET = utf8mb4 COMMENT = '用户信息表';

-- ----------------------------
-- 角色行过滤条件表
-- ----------------------------
DROP TABLE IF EXISTS `filter_condition`;
CREATE TABLE `filter_condition` (
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
	`role_id` BIGINT(20) NOT NULL COMMENT '角色id',
	`ds_id` BIGINT(20) NOT NULL COMMENT '数据源id',
	`database_name` VARCHAR(100) NOT NULL COMMENT '数据库名称',
	`table_name` VARCHAR(100) NOT NULL COMMENT '表名',
	`column_name` VARCHAR(100) NOT NULL COMMENT '列名',
	`data_type` VARCHAR(50) NULL DEFAULT NULL COMMENT '列数据类型',
	`filter_type` TINYINT(2) NOT NULL COMMENT '过滤类型：1固定型 2动态型',
	`operator` VARCHAR(20) NULL DEFAULT NULL COMMENT '关系运算符',
	`filter_value` VARCHAR(200) NULL DEFAULT NULL COMMENT '过滤值',
	`gmt_create` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	PRIMARY KEY (`id`),
	INDEX `idx_role_id` (`role_id`)
)
COMMENT='列过滤条件权限'
ENGINE=InnoDB
;


DROP TABLE IF EXISTS `proxy_account`;
CREATE TABLE `proxy_account` (
`id`  bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id' ,
`account`  varchar(100) NOT NULL COMMENT '访问账号' ,
`password`  varchar(100) NULL DEFAULT '' COMMENT '密码' ,
`password_type`  tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '密码类型：0、mysql类型 1、postgresql类型 2、impala类型 3、oracle 4、sqlserver 5、h2' ,
`status`  tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '状态 1：有效，0无效' ,
`expire_time`  datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间' ,
`job_num`  varchar(50) NOT NULL COMMENT '工单号' ,
`user_code`  varchar(200) NOT NULL DEFAULT '' COMMENT '用户编号' ,
`client_project`  varchar(100) NULL DEFAULT '' COMMENT '客户端所属项目' ,
`overtime`  int(11) UNSIGNED NOT NULL DEFAULT 300 COMMENT '默认超时时间(秒)' ,
`decrypt_flag`  tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '解密标识：0不解密，1解密' ,
`account_type`  tinyint(2) UNSIGNED NULL DEFAULT 0 COMMENT '账户类型   0：个人   1：应用' ,
`create_time`  datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `idx_account` (`account`) USING BTREE ,
UNIQUE INDEX `idx_job_num` (`job_num`) USING BTREE ,
INDEX `idx_user_code` (`user_code`) USING BTREE
)
ENGINE=InnoDB
COMMENT='金乌代理账号表'

;

DROP TABLE IF EXISTS `proxy_audit_record`;
CREATE TABLE `proxy_audit_record` (
`id`  bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id' ,
`account`  varchar(100) NULL DEFAULT NULL COMMENT '访问账号' ,
`db_name`  varchar(50) NULL DEFAULT NULL COMMENT '数据库名' ,
`db_type`  tinyint(2) UNSIGNED NULL DEFAULT NULL COMMENT '数据库类型：0、mysql类型 1、postgresql类型 2、impala类型 3、oracle 4、sqlserver 5、h2' ,
`visit_num`  int(11) UNSIGNED NULL DEFAULT 0 COMMENT '访问次数' ,
`sql_error_num`  int(11) UNSIGNED NULL DEFAULT 0 COMMENT 'SQL报错次数' ,
`sensitivity_num`  int(11) UNSIGNED NULL DEFAULT 0 COMMENT '访问敏感字段次数' ,
`status`  tinyint(2) UNSIGNED NULL DEFAULT NULL COMMENT '状态 0：init 1：everyday 2：visit 3：sqlError 4：sensitivity' ,
`create_time`  datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间' ,
PRIMARY KEY (`id`),
INDEX `idx_account` (`account`) USING BTREE
)
ENGINE=InnoDB
COMMENT='金乌代理审计'

;

DROP TABLE IF EXISTS `proxy_decrypt_record`;
CREATE TABLE `proxy_decrypt_record` (
`id`  bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id' ,
`account`  varchar(100) NOT NULL COMMENT '访问账号' ,
`db_type`  tinyint(2) UNSIGNED NULL DEFAULT 0 COMMENT '数据库类型：0、mysql类型 1、postgresql类型 2、impala类型 3、oracle 4、sqlserver 5、h2' ,
`db_name`  varchar(50) NULL DEFAULT '' COMMENT '数据库名' ,
`table_name`  varchar(64) NULL DEFAULT '' COMMENT '表名' ,
`first_time`  datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '首次查询时间' ,
`client_ip`  varchar(20) NULL DEFAULT '' COMMENT '客户端IP' ,
`decrypt_type`  tinyint(2) UNSIGNED NULL DEFAULT 1 COMMENT '类型: 1、临时表解密' ,
`create_time`  datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间' ,
PRIMARY KEY (`id`),
INDEX `idx_account` (`account`) USING BTREE ,
INDEX `idx_table_name` (`table_name`) USING BTREE
)
ENGINE=InnoDB
COMMENT='临时表解密记录'

;

DROP TABLE IF EXISTS `proxy_ip_whitelist`;
CREATE TABLE `proxy_ip_whitelist` (
`id`  bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id' ,
`match_type`  tinyint(4) UNSIGNED NOT NULL COMMENT '匹配类型(0：用户id,1：角色id)' ,
`user_type_id`  bigint(20) UNSIGNED NOT NULL COMMENT '用户id或者角色id' ,
`ip_pattern`  varchar(15) NOT NULL COMMENT 'ip匹配模式（如：192.168.*.*）' ,
`status`  tinyint(2) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否有效（0：无效，1：有效）' ,
`create_time`  datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`update_time`  datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间' ,
PRIMARY KEY (`id`),
INDEX `idx_userTypeId_match_type` (`user_type_id`, `match_type`) USING BTREE
)
ENGINE=InnoDB
COMMENT='金乌账号白名单表'

;

DROP TABLE IF EXISTS `proxy_login_record`;
CREATE TABLE `proxy_login_record` (
`id`  bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id' ,
`account`  varchar(100) NOT NULL COMMENT '登录账户' ,
`server_ip`  varchar(20) NULL DEFAULT '' COMMENT '服务IP' ,
`server_port`  int(11) UNSIGNED NULL DEFAULT 0 COMMENT '服务port' ,
`client_ip`  varchar(20) NULL DEFAULT '' COMMENT '客户端IP' ,
`login_time`  datetime NULL DEFAULT NULL COMMENT '登录时间' ,
`create_time`  datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
PRIMARY KEY (`id`),
INDEX `idx_account` (`account`) USING BTREE
)
ENGINE=InnoDB
COMMENT='金乌代理登陆记录表'

;

DROP TABLE IF EXISTS `proxy_operate_record`;
CREATE TABLE `proxy_operate_record` (
`id`  bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id' ,
`account`  varchar(100) NOT NULL COMMENT '登录账户' ,
`status`  tinyint(2) UNSIGNED NULL DEFAULT 0 COMMENT '状态  0:init  1:callBack   2:error   3:audited' ,
`client_ip`  varchar(20) NULL DEFAULT '' COMMENT '客户端IP' ,
`db_type`  tinyint(2) UNSIGNED NULL DEFAULT 0 COMMENT '数据库类型：0、mysql类型 1、postgresql类型 2、impala类型 3、oracle 4、sqlserver 5、h2' ,
`db_name`  varchar(50) NULL DEFAULT '' COMMENT '数据库名' ,
`sql_type`  varchar(20) NULL DEFAULT 'select' COMMENT 'SQL类型' ,
`sql_content`  longtext NULL COMMENT '执行SQL' ,
`result_num`  int(11) UNSIGNED NULL DEFAULT 0 COMMENT '结果行数' ,
`execute_time`  bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '执行时间ms' ,
`sql_state`  varchar(50) NULL DEFAULT NULL COMMENT 'sql状态' ,
`error_code`  int(11) UNSIGNED NULL DEFAULT NULL COMMENT '错误code' ,
`create_time`  datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
PRIMARY KEY (`id`),
INDEX `idx_account` (`account`) USING BTREE
)
ENGINE=InnoDB
COMMENT='金乌代理操作记录表'

;


