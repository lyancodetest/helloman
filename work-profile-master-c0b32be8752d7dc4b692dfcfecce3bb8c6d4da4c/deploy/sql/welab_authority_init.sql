USE `welab_authority`;
-- 系统初始化
INSERT INTO `system` (`name`, `code`, `system_type`, `gmt_create`, `gmt_modified`, `is_status`) VALUES ('金乌安全平台', 'poseidon', 1, NOW(), NOW(), 1);
INSERT INTO `system` (`name`, `code`, `system_type`, `gmt_create`, `gmt_modified`, `is_status`) VALUES ('青鸾大数据平台', 'qingluan', 1, NOW(), NOW(), 1);
INSERT INTO `system_detail` (`system_id`, `identity_type`, `login_url`, `entry_url`, `gmt_create`, `gmt_modify`) VALUES (1, 1, NULL, 'http://101.254.185.134:80/dataface/poseidon/', NOW(), NOW());
INSERT INTO `system_detail` (`system_id`, `identity_type`, `login_url`, `entry_url`, `gmt_create`, `gmt_modify`) VALUES (2, 1, NULL, 'http://101.254.185.134:80/dataface/qingluan/', NOW(), NOW());

-- 机构表初始化
INSERT INTO `org` (`code`, `name`, `description`, `is_status`, `gmt_modified`, `gmt_create`) VALUES ('welab', '我来贷', '我来贷', 1, NOW(), NOW());
UPDATE org SET id=0 WHERE CODE='welab';

-- 用户表初始化
INSERT INTO `user` (`org_id`, `login_name`, `password`, `name`, `phone`, `email`, `message`, `login_fail_num`, `locked_time`, `login_num`, `last_login_time`, `expire_time`, `gmt_create`, `gmt_modified`, `is_status`)
VALUES (0, '18800000000', 'e10adc3949ba59abbe56e057f20f883e', 'admin', '18800000000', 'admin@wolaidai.com', '超级管理员用户', 0, NULL, 1, NULL, NULL, NOW(), NOW(), 1);

-- 角色表初始化
INSERT INTO `role` (`org_id`, `system_id`, `code`, `name`, `role_type`, `gmt_create`, `gmt_modified`, `message`, `is_status`, `sys_role_id`) VALUES (0, 1, 'super_admin', '超级管理员', 1, NOW(), NOW(), '超级管理员', 1, NULL);
INSERT INTO `role` (`org_id`, `system_id`, `code`, `name`, `role_type`, `gmt_create`, `gmt_modified`, `message`, `is_status`, `sys_role_id`) VALUES (0, 1, 'poseidon_admin', '金乌安全管理员', 2, NOW(), NOW(), '金乌管理员', 1, NULL);
INSERT INTO `role` (`org_id`, `system_id`, `code`, `name`, `role_type`, `gmt_create`, `gmt_modified`, `message`, `is_status`, `sys_role_id`) VALUES (0, 2, 'qingluan_admin', '青鸾管理员', 2, NOW(), NOW(), '青鸾管理员', 1, NULL);


-- 资源权限表初始化
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (1, 'view', 'get', '超级管理员权限', '', 'root', '', 0, 1, 1, '', 0, '2019-03-11 22:52:58', '2019-04-09 02:59:23', 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (1, 'menu', 'get', '数据权限管理', '', '/admin', 'fund', 0, 1, 0, NULL, 1, '2019-03-18 00:48:51', '2020-02-18 09:35:49', 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (1, 'menu', 'get', '数据源账号', '', '/admin/accounts', '', 2, 2, 1, NULL, 4, '2019-03-18 00:48:51', '2020-02-26 10:30:20', 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (1, 'menu', 'get', '安全审计管理', '', '/auditing', 'file-done', 0, 1, 0, NULL, 2, '2019-03-18 00:48:51', '2020-02-18 09:35:49', 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (1, 'menu', 'get', '数据操作日志', '', '/auditing/data-event-logs', '', 4, 2, 1, NULL, 0, '2019-03-18 00:48:51', '2019-11-27 09:39:40', 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (1, 'menu', 'get', '审计统计', '', '/auditing/statistics', '', 4, 2, 1, NULL, 2, '2019-03-18 00:48:51', '2019-11-27 09:42:16', 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (1, 'menu', 'get', '应用权限管理', '', '/authority', 'check-circle', 0, 1, 0, NULL, 0, '2019-03-18 00:48:51', '2020-02-18 09:35:49', 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (1, 'menu', 'get', '应用访问日志', '', '/auditing/app-event-logs', '', 4, 2, 1, NULL, 1, '2019-03-18 00:48:51', '2019-11-14 15:16:11', 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (1, 'menu', 'get', '权限管理', '', '/authority/resources', '', 7, 2, 1, NULL, 3, '2019-03-18 00:48:51', '2020-02-27 17:39:05', 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (1, 'menu', 'get', '角色管理', '', '/authority/roles', '', 7, 2, 1, NULL, 2, '2019-03-18 00:48:51', '2019-11-13 16:20:32', 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (1, 'menu', 'get', '应用管理', '', '/authority/systems', '', 7, 2, 1, NULL, 0, '2019-03-18 00:48:51', '2019-11-13 16:20:32', 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (1, 'menu', 'get', '用户管理', '', '/authority/users', '', 7, 2, 1, NULL, 1, '2019-03-18 00:48:51', '2019-11-13 16:20:32', 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (1, 'view', 'get', '系统管理员权限', '', 'system-admin', '', 0, 1, 1, '', 1, '2019-04-03 21:51:31', '2019-04-09 02:59:23', 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (1, 'view', 'get', '机构管理权限', '', 'org', '', 0, 1, 1, '', 2, '2019-04-09 02:53:32', '2019-04-09 02:59:23', 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (1, 'menu', 'get', '数据源授权', '', '/admin/account-auth', '', 2, 2, 1, '', 3, '2019-06-18 13:33:57', '2020-02-26 10:30:20', 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (1, 'menu', 'get', '数据源认证', '', '/admin/microservices', '', 2, 2, 1, '', 2, '2019-10-23 16:18:06', '2020-02-26 10:30:20', 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (1, 'menu', 'get', '数据源管理', '', '/admin/datasources', '', 2, 2, 1, '', 1, '2019-10-23 16:18:06', '2020-02-26 10:30:20', 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (1, 'menu', 'get', '数据源实例', '', '/admin/datasource-instances', '', 2, 2, 1, '', 0, '2019-10-30 09:39:22', '2020-02-26 10:30:20', 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (1, 'menu', 'get', '数据订阅', '', '/subscribe', 'eye', 0, 1, 0, '', 3, '2020-02-18 09:35:26', '2020-02-18 09:36:35', 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (1, 'menu', 'get', '账户管理', '', '/subscribe/token', '', 19, 2, 1, '', 0, '2020-02-18 09:36:35', '2020-02-18 09:36:35', 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (1, 'menu', 'get', '订阅管理', '', '/subscribe/address', '', 19, 2, 1, '', 0, '2020-02-18 09:37:17', '2020-02-18 09:37:17', 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (1, 'route', 'get', '账户详情', '', '/subscribe/token/:id', '', 19, 2, 1, '', 0, '2020-02-18 09:38:14', '2020-02-18 09:38:14', 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (1, 'route', 'get', '订阅详情', '', '/subscribe/address/:id', '', 19, 2, 1, '', 0, '2020-02-18 09:39:02', '2020-02-18 09:39:02', 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (1, 'menu', 'get', '数据源角色', '', '/admin/roles', '', 2, 2, 1, '', 5, '2020-02-26 10:29:32', '2020-02-26 10:30:20', 1, NULL);



-- 青鸾资源权限表初始化
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'menu', 'get', '自助分析', '', 'analysis', 'pie-chart', 0, 1, 0, '', 0, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'menu', 'get', '数据总线', '', 'databus', 'fork', 0, 1, 0, '', 3, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'menu', 'get', '元数据管理', '', 'metadata', 'database', 0, 1, 0, '', 5, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'menu', 'get', '工具', '', 'tool', 'tool', 0, 1, 1, '', 7, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'menu', 'get', '数据监控', '', 'alarm', 'alert', 0, 1, 0, '', 2, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'menu', 'get', '资产管理', '', 'assets', 'file-protect', 0, 1, 0, '', 6, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'menu', 'get', '用户分群', '', 'cohorts', 'usergroup-add', 0, 1, 0, '', 1, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'menu', 'get', '数据工坊', '', 'datawork', 'form', 0, 1, 0, '', 4, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'route', 'get', '数据看板', '', 'board', '', 0, 1, 1, '', 11, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'route', 'get', '我的概览', '', 'overview', '', 0, 1, 1, '', 9, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'route', 'get', '概览分享', '', 'share', '', 0, 1, 1, '', 10, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'menu', 'get', '数据源管理', '', 'datawork/source_databases', '', 32, 2, 1, '', 0, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'menu', 'get', '数据表管理', '', 'datawork/source_tables', '', 32, 2, 0, '', 1, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'menu', 'get', '流任务管理', '', 'datawork/flows', '', 32, 2, 1, '', 2, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'view', 'get', 'admin可见', 'admin可见', 'admin', '', 0, 1, 1, NULL, 0, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'view', 'get', '新增看板可见', '', 'board.add', '', 0, 1, 1, NULL, 0, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'view', 'get', '数据面板页面添加组件按钮可见', '', 'board.add_widget_button', '', 0, 1, 1, NULL, 0, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'view', 'get', '数据看板页面删除可见', '', 'board.delet', '', 0, 1, 1, NULL, 0, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'view', 'get', '数据看板页面的title可修改', '', 'board.name', '', 0, 1, 1, NULL, 0, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'view', 'get', '数据看板页面的拖拽', '', 'board.panel.drag', '', 0, 1, 1, NULL, 0, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'view', 'get', '数据看板页面的panel的工具', '', 'board.panel.tool', '', 0, 1, 1, NULL, 0, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'view', 'get', '数据看板页面title跳转', '', 'board.title_click', '', 0, 1, 1, NULL, 0, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'view', 'get', '可保存和修改的menu', '', 'modal.menu', '', 0, 1, 1, NULL, 0, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'view', 'get', '新增概览可见', '', 'overview.add', '', 0, 1, 1, NULL, 0, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'view', 'get', '虚拟事件disabled', 'virtual.readonly', 'virtual.readonly', '', 0, 1, 1, NULL, 0, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'menu', 'get', '事件分析', '事件分析', 'analysis/event', '', 25, 2, 1, '', 0, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'menu', 'get', '维度分析', '', 'analysis/dimension', '', 25, 2, 1, '', 1, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'menu', 'get', '明细分析', '明细分析', 'analysis/detail', '', 25, 2, 1, '', 2, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'menu', 'get', '漏斗分析', '漏斗分析', 'analysis/funnel', '', 25, 2, 1, '', 3, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'menu', 'get', 'SQL分析', 'SQL分析', 'analysis/sql', '', 25, 2, 1, '', 4, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'menu', 'get', '表管理', '', 'databus/schema', '', 26, 2, 1, '', 0, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'menu', 'get', '拓扑管理', '', 'databus/topology', '', 26, 2, 1, '', 1, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'menu', 'get', '数据统计', '', 'databus/statistics', '', 26, 2, 1, '', 2, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'menu', 'get', '数据库同步', '', 'databus/connect', '', 26, 2, 1, '', 4, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'menu', 'get', '数据映射', '', 'databus/maps', '', 26, 2, 1, '', 3, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'route', 'get', '拓扑配置', '', 'databus/topologyconfig/:id', '', 26, 2, 1, '', 6, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'route', 'get', '表结构管理', '', 'databus/schemaconfig/:id', '', 26, 2, 1, '', 5, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'menu', 'get', '事件管理', '', 'metadata/event', '', 27, 2, 1, '', 2, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'menu', 'get', '表管理', '', 'metadata/table', '', 27, 2, 1, '', 0, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'menu', 'get', '表关系管理', '', 'metadata/tablerelation', '', 27, 2, 1, '', 3, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'menu', 'get', '血缘分析', '', 'metadata/schema', '', 27, 2, 1, '', 4, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'route', 'get', '表属性管理', '', 'metadata/table/:ownerId', '', 27, 2, 1, '', 1, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'menu', 'get', '策略管理', '', 'alarm/strategies', '', 29, 2, 1, '', 0, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'menu', 'get', '告警消息', '', 'alarm/hits', '', 29, 2, 1, '', 1, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'route', 'get', '策略配置', '', 'alarm/strategy/config/:id', '', 29, 2, 1, '', 2, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'menu', 'get', '数据资产', '', 'assets/list', '', 30, 2, 1, '', 0, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'route', 'get', '资产详情', '', 'assets/detail/:id', '', 30, 2, 1, '', 0, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'route', 'get', '资产资源', '', 'assets/source/:id', '', 30, 2, 1, '', 0, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'route', 'get', '分群分析', '', 'cohorts/:id', '', 31, 2, 1, '', 0, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'view', 'get', '分群列表', '', 'cohorts/:id/list', '', 31, 2, 1, '', 0, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'route', 'get', '分群列表', '', 'cohorts/list/:listid', '', 31, 2, 1, '', 0, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'route', 'get', '用户分析', '', 'cohorts/user/:info', '', 31, 2, 1, '', 0, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'route', 'get', '用户详情', '', 'cohorts/user/:listid/:info', '', 31, 2, 1, '', 0, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'route', 'get', '数据看板子页面', '', 'board/:viewId', '', 33, 2, 1, '', 0, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'route', 'get', '我的概览子页面', '', 'overview/:viewId', '', 34, 2, 1, '', 0, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'route', 'get', '概览分享子页面', '', 'share/:viewId', '', 35, 2, 1, '', 1, NOW(), NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'route', 'get', '数据表配置', '', 'datawork/source_table/:id/config', '', 36, 3, 1, '', 0, NOW(), NOW(), 1, NULL);

INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) VALUES (2, 'menu', 'get', '用户行为', '', 'behavior', 'line-chart', 0, 1, 0, '', 0, NOW(),  NOW(), 1, NULL);
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) SELECT 2, 'menu', 'get', '活跃用户', '', 'behavior/summary', '', id, 2, 0, '', 0,  NOW(),  NOW(), 1, NULL FROM resource WHERE url='behavior';
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) SELECT 2, 'route', 'get', '用户列表', '', 'behavior/summary/userlist/:userlistid', '', id, 3, 1, '', 0,  NOW(),  NOW(), 1, NULL FROM resource WHERE url='behavior/summary';
INSERT INTO `resource` (`system_id`, `type`, `method`, `name`, `url_key`, `url`, `icon`, `parent_id`, `level`, `is_leaf`, `message`, `seq_num`, `gmt_create`, `gmt_modified`, `is_status`, `sys_resource_id`) SELECT 2, 'route', 'get', '用户', '', 'behavior/summary/user/:userid', '',  id , 3, 1, '', 0,  NOW(),  NOW(), 1, NULL FROM resource WHERE url='behavior/summary';



-- 用户应用初始化
INSERT INTO `user_systems` (`user_id`, `system_id`) SELECT 1,id FROM `system`;

-- 用户角色初始化
INSERT INTO `user_roles` (`user_id`, `role_id`) SELECT 1,id FROM `role`;

-- 角色资源初始化
INSERT INTO `role_resources` (`role_id`,  `resource_id`) SELECT 1,id FROM `resource` WHERE system_id=1;
INSERT INTO `role_resources` (`role_id`,  `resource_id`) SELECT 2,id FROM `resource` WHERE system_id=1;
INSERT INTO `role_resources` (`role_id`,  `resource_id`) SELECT 3,id FROM `resource` WHERE system_id=2;

-- 角色可操作系統初始化
INSERT INTO `role_systems` (`role_id`,  `system_id`) SELECT 1,id FROM `system`;
INSERT INTO `role_systems` (`role_id`,  `system_id`) SELECT 2,id FROM `system`;
INSERT INTO `role_systems` (`role_id`,  `system_id`) SELECT 3,id FROM `system` WHERE id=2;


INSERT INTO `groups` (`system_id`, `name`, `description`)
SELECT id, '功能权限资源', 'default'
FROM system;

UPDATE role,groups SET role.group_id = groups.id
WHERE role.system_id=groups.system_id AND groups.type=1;

UPDATE resource,groups SET resource.group_id = groups.id
WHERE resource.system_id=groups.system_id AND groups.type=1;

INSERT INTO `groups` (`system_id`, `name`, `description`, `type`, `state`)
SELECT 1,datasource_info.name, datasource_info.description, 2,1
FROM datasource_info
WHERE datasource_info.db_type IN (0,1,2);

INSERT INTO `account` (`domain`,`uid`,`name`,`description`) 
(SELECT 2,t.id,t.account,CONCAT('apply_name:',t.user_name,',','db_name:',t.database_name) FROM security_account t
WHERE t.id NOT IN (SELECT a.uid FROM account a WHERE a.domain=2));


-- 数据源管理相关
-- kafka
-- 1.实例信息
INSERT INTO datasource_instance (id,name,db_type,is_offline,remark,creator,gmt_create,modifier,gmt_modified) VALUES
(7,'kafka实例',6,0,'',1211,now(),1211,now())
;
-- 2.实例节点
INSERT INTO datasource_instance_node (id,ds_instance_id,ip_or_domain,port,is_master_node,is_exclusive_node,node_status,is_offline,remark) VALUES
(9,7,'hadoop3',9092,0,0,0,0,'')
,(10,7,'hadoop4',9092,0,0,0,0,'')
,(11,7,'hadoop2',9092,0,0,0,0,'')
;
-- 3.数据源基本信息
INSERT INTO datasource_base (id,schema_name,out_display,global_uniq_str,db_type,ds_instance_id,tag_owner_group,tag_owner_group_name,default_extend_jdbc_url,is_offline,remark,creator,gmt_create,modifier,gmt_modified) VALUES
(175,'kafka','kafka数据源连接','kafka',6,7,NULL,NULL,'',0,'kafka数据源连接',1211,now(),1211,now())
;
-- 4.数据源的账户信息
INSERT INTO datasource_account (id,ds_id,account_type,name,password,is_valid,remark,creator,gmt_create,modifier,gmt_modified) VALUES
(7,175,0,'123456','+Jy78CECSza8QNG98DaC8g==',1,'',1211,now(),1211,now())
;

-- kudu
-- 1.实例信息
INSERT INTO datasource_instance (id,name,db_type,is_offline,remark,creator,gmt_create,modifier,gmt_modified) VALUES
(6,'kudu实例',7,0,'',1211,now(),1211,now())
;
-- 2.实例节点
INSERT INTO datasource_instance_node (id,ds_instance_id,ip_or_domain,port,is_master_node,is_exclusive_node,node_status,is_offline,remark) VALUES
(8,6,'hadoop1',0,0,0,0,0,'')
;
-- 3.数据源基本信息
INSERT INTO datasource_base (id,schema_name,out_display,global_uniq_str,db_type,ds_instance_id,tag_owner_group,tag_owner_group_name,default_extend_jdbc_url,is_offline,remark,creator,gmt_create,modifier,gmt_modified) VALUES
(176,'kudu_analysis','kudu数据源','kudu_analysis',7,6,NULL,NULL,'',0,'kudu数据源',1211,now(),1211,now())
-- 4.数据源的账户信息
INSERT INTO datasource_account (id,ds_id,account_type,name,password,is_valid,remark,creator,gmt_create,modifier,gmt_modified) VALUES
(6,176,0,'123456','+Jy78CECSza8QNG98DaC8g==',1,'',1211,now(),1211,now())
;

-- impala
-- 1.实例信息
INSERT INTO datasource_instance (id,name,db_type,is_offline,remark,creator,gmt_create,modifier,gmt_modified) VALUES
(5,'impala实例',2,0,'',1211,now(),1211,now())
;
-- 2.实例节点
INSERT INTO datasource_instance_node (id,ds_instance_id,ip_or_domain,port,is_master_node,is_exclusive_node,node_status,is_offline,remark) VALUES
(5,5,'hadoop2',21050,0,0,0,0,'')
,(6,5,'hadoop3',21050,0,0,0,0,'')
,(7,5,'hadoop4',21050,0,0,0,0,'')
;
-- 3.数据源基本信息
INSERT INTO datasource_base (id,schema_name,out_display,global_uniq_str,db_type,ds_instance_id,tag_owner_group,tag_owner_group_name,default_extend_jdbc_url,is_offline,remark,creator,gmt_create,modifier,gmt_modified) VALUES
(180,'kudu_analysis','青鸾impala数据源','kudu_analysis_impala',2,5,NULL,NULL,'AuthMech=0;PreparedMetaLimitZero=0;',0,'青鸾impala数据源',1211,now(),1211,now())
;
-- 4.数据源的账户信息
INSERT INTO datasource_account (id,ds_id,account_type,name,password,is_valid,remark,creator,gmt_create,modifier,gmt_modified) VALUES
(17,180,0,'123456','+Jy78CECSza8QNG98DaC8g==',1,'',1211,now(),1211,now())
,(5,180,1,'123456','+Jy78CECSza8QNG98DaC8g==',1,'',1211,now(),1211,now())
;

-- atlas
-- 1.实例信息 ，跟kafka一样
-- 2.实例节点 ，跟kafka一样
-- 3.数据源基本信息
INSERT INTO datasource_base (id,schema_name,out_display,global_uniq_str,db_type,ds_instance_id,tag_owner_group,tag_owner_group_name,default_extend_jdbc_url,is_offline,remark,creator,gmt_create,modifier,gmt_modified) VALUES
(177,'atlas','atlas','atlas',9,7,NULL,NULL,'',0,'atlas',1211,now(),1211,now())
;
-- 4.数据源的账户信息
INSERT INTO datasource_account (id,ds_id,account_type,name,password,is_valid,remark,creator,gmt_create,modifier,gmt_modified) VALUES
(8,177,0,'123456','+Jy78CECSza8QNG98DaC8g==',1,'',1211,now(),1211,now())
;

-- 认证相关
-- 1.权限认证
INSERT INTO welab_authority.datasource_authorization (id,project_name,authorization_code,is_auth_all_ds,auth_all_ds_account_type,is_valid,remark,creator,gmt_create,modifier,gmt_modified) VALUES
(1,'welab-authority','0a10f933e67377234e500647b7680199',1,'0',1,'权限系统',1211,now(),1211,now())
,(2,'welab-skyscanner-poseidon','7108badd6b755f9825380b3898a663da',1,'0',1,'金乌代理',1211,now(),1211,now())
,(3,'welab-skyscanner-datawork','f26f190a62b51a91b83dcbaf02e6c197',1,'0,1',1,'datawork',1211,now(),1211,now())
,(4,'welab-skyscanner-databus','6e52a61a6684e0e09ae7841dea4b49d7',1,'0,2',1,'dbus',1211,now(),1211,now())
,(5,'welab-skyscanner-meteor','453488b69012dcdcd585de1b052a262f',1,'0,1',1,'meteor',1211,now(),1211,now())
,(6,'welab-skyscanner-tenma','fc89fd50249a05cc6c3914933b3818ae',1,'0,1',1,'tenma',1211,now(),1211,now())
,(7,'welab-skyscanner-dataops','250a1691509dc0160a38a2a5b86b4148',1,'0',1,'dataops',1211,now(),1211,now())
,(8,'welab-skyscanner-matsu','da68e5f017f82d28edd6a2ffc0cf6ada',1,'0',1,'matsu-数据质检',1211,now(),1211,now())
;