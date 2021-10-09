## 1. 生产问题修复

在微服务应用中接口幂等的设计是至关重要的，A同学在设计进件表时忘记将application_id字段加上唯一索引，且在应用层未做唯一性判断导致  
applications表存在多条application_id相同的记录，经与业务运营同学沟通后决定修复生产数据，仅保留进件单号最旧的一条数据。请编写线上修改SQL脚本。

```
-- 建表脚本
Create table If Not Exists `applications` (
  `id` int(11) NOT NULL DEFAULT '0' COMMENT '主键id',
  `application_id` varchar(100) NOT NULL COMMENT '进件单号',
   `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
Truncate table applications;

INSERT INTO `applications` (`id`, `application_id`, `created_at`, `updated_at`) VALUES ('18136519', '18050304582727763205325', '2020-07-31 16:35:03', '2020-07-31 16:35:03');
INSERT INTO `applications` (`id`, `application_id`, `created_at`, `updated_at`) VALUES ('18141648', '18050304582727763205325', '2020-07-31 16:35:03', '2020-07-31 16:35:03');
INSERT INTO `applications` (`id`, `application_id`, `created_at`, `updated_at`) VALUES ('18182329', '18050304582727763205325', '2020-07-31 16:35:04', '2020-07-31 16:35:04');
INSERT INTO `applications` (`id`, `application_id`, `created_at`, `updated_at`) VALUES ('18273501', '18050715125676479119292', '2020-07-31 16:35:54', '2020-07-31 16:35:54');
INSERT INTO `applications` (`id`, `application_id`, `created_at`, `updated_at`) VALUES ('18343280', '18050916403894820823783', '2020-07-31 16:35:07', '2020-07-31 16:35:07');
INSERT INTO `applications` (`id`, `application_id`, `created_at`, `updated_at`) VALUES ('18376619', '18050916403894820823783', '2020-07-31 16:35:07', '2020-07-31 16:35:07');
INSERT INTO `applications` (`id`, `application_id`, `created_at`, `updated_at`) VALUES ('18416016', '18051118103413436154736', '2020-07-31 16:35:57', '2020-07-31 16:35:57');
INSERT INTO `applications` (`id`, `application_id`, `created_at`, `updated_at`) VALUES ('18459907', '18051312555111726894072', '2020-07-31 16:35:57', '2020-07-31 16:35:57');
INSERT INTO `applications` (`id`, `application_id`, `created_at`, `updated_at`) VALUES ('18512889', '18051510452929120190985', '2020-07-31 16:35:58', '2020-07-31 16:35:58');
INSERT INTO `applications` (`id`, `application_id`, `created_at`, `updated_at`) VALUES ('18516085', '18051512181824571485896', '2020-07-31 16:35:58', '2020-07-31 16:35:58');
```


## 2. 代码review

```
package com.welab.demo;

import java.sql.*;

/**
 * @author allen.xie
 * @date 2020/7/30 17:25
 */
public class JdbcTest {

    public static void main(String[] args) throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/scaffold?serverTimezone=GMT%2B8",
            "root", "123456");
        PreparedStatement ps = conn.prepareStatement("select * from user limit 1");
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            // 业务处理，这里以打印为例
            System.out.println(rs.getInt("id") + "\t" + rs.getString("name"));
        }
    }
}
```
allen.xie同学写了段JDBC连接代码，请帮忙他review下并提出相应的意见。

1. Class.forName这行代码有什么用途
2. PreparedStatement的功能是干什么的
3. 上述代码有哪些可优化的空间