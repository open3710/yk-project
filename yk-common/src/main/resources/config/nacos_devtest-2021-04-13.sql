/*
 Navicat Premium Data Transfer

 Source Server         : 阿里云mysql
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : 115.29.205.214:3306
 Source Schema         : nacos_devtest

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 13/04/2021 17:27:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `c_use` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `effect` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `c_schema` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfo_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info
-- ----------------------------
INSERT INTO `config_info` VALUES (3, 'yk-blog-dev.yaml', 'DEFAULT_GROUP', 'spring:\n  datasource:\n    url: jdbc:mysql://115.29.205.214:3306/blog?useUnicode=true&characterEncoding=utf-8&useSSL=true&serverTimezone=UTC\n    username: root\n    password: root\n    # spring security 配置默认用户和密码\n    type: com.alibaba.druid.pool.DruidDataSource\n  redis:\n        host: 115.29.205.214\n        port: 6379\n        password: root\n\n# Mybatis Plus\nmybatis-plus:\n  global-config:\n    db-config:\n      logic-delete-field: flag  # 全局逻辑删除的实体字段名(since 3.3.0,配置后可以忽略不配置步骤2)\n      logic-delete-value: 1 # 逻辑已删除值(默认为 1)\n      logic-not-delete-value: 0 # 逻辑未删除值(默认为 0)\n  mapper-locations: classpath:mapper/*.xml # xml所在路径\n  type-aliases-package: com.yk.blog.entity # 实体路径\n\n# Spring Boot 监控\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'', 'bbba26e3d29121ef5087059f29f192d4', '2021-02-08 09:15:46', '2021-04-09 08:47:46', NULL, '210.22.163.214', '', '', '', '', '', 'yaml', '');
INSERT INTO `config_info` VALUES (7, 'yk-blog-test.yaml', 'DEFAULT_GROUP', 'spring:\n  datasource:\n    url: jdbc:mysql://115.29.205.214:3306/blog?useUnicode=true&characterEncoding=utf-8&useSSL=true&serverTimezone=UTC\n    username: root\n    password: root\n    # spring security 配置默认用户和密码\n    type: com.alibaba.druid.pool.DruidDataSource\n\n# Mybatis Plus\nmybatis-plus:\n  global-config:\n    db-config:\n      logic-delete-field: flag  # 全局逻辑删除的实体字段名(since 3.3.0,配置后可以忽略不配置步骤2)\n      logic-delete-value: 1 # 逻辑已删除值(默认为 1)\n      logic-not-delete-value: 0 # 逻辑未删除值(默认为 0)\n  mapper-locations: classpath:mapper/*.xml # xml所在路径\n  type-aliases-package: com.yk.blog.entity # 实体路径\n\n# Spring Boot 监控\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'', '3b2ea34882288bdd98ecac56ba6ebaa5', '2021-02-09 01:43:40', '2021-02-21 06:09:04', NULL, '211.161.243.159', '', '', '', '', '', 'yaml', '');
INSERT INTO `config_info` VALUES (8, 'yk-authentication-dev.yaml', 'DEFAULT_GROUP', 'spring:\n  datasource:\n    url: jdbc:mysql://115.29.205.214:3306/blog?useUnicode=true&characterEncoding=utf-8&useSSL=true&serverTimezone=UTC\n    username: root\n    password: root\n    # spring security 配置默认用户和密码\n    type: com.alibaba.druid.pool.DruidDataSource\n  redis:\n        host: 115.29.205.214\n        port: 6379\n        password: root\n\n# Mybatis Plus\nmybatis-plus:\n  global-config:\n    db-config:\n      logic-delete-field: flag  # 全局逻辑删除的实体字段名(since 3.3.0,配置后可以忽略不配置步骤2)\n      logic-delete-value: 1 # 逻辑已删除值(默认为 1)\n      logic-not-delete-value: 0 # 逻辑未删除值(默认为 0)\n  mapper-locations: classpath:mapper/*/*.xml # xml所在路径\n  type-aliases-package: com.yk.blog.entity # 实体路径\n  configuration:\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\n\n# Spring Boot 监控\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n#对Feign的支持\nfeign:\n  sentinel:\n    enabled: true\n  httpclient:\n    enabled: true\n\n# 调用微服务地址\nservice-url:\n  nacos-user-service: http://yk-blog\n  ', '8be145493b59692193d80d91ce158569', '2021-02-09 02:28:13', '2021-04-09 08:48:04', NULL, '210.22.163.214', '', '', '', '', '', 'yaml', '');
INSERT INTO `config_info` VALUES (13, 'yk-gateway-dev.yaml', 'DEFAULT_GROUP', 'spring:\n  cloud:\n    gateway:\n      routes:\n      - id: test_1\n        uri: http://news.baidu.com\n        predicates:\n        - Path=/guonei\n      - id: test_2\n        uri: http://news.baidu.com\n        predicates:\n        - Path=/guoji\n      - id: aouth\n        uri: http://localhost:3711/\n        predicates:\n        - Path=/uaa/**\n      - id: blog\n        uri: http://localhost:3710/\n        predicates:\n        - Path=/blog/**\n      - id: system\n        uri: http://localhost:3713/\n        predicates:\n        - Path=/system/**\n        ', '3a8cd8cbe1dcf49dac9226cc3ca5df59', '2021-02-27 06:33:15', '2021-04-09 06:39:46', NULL, '210.22.163.214', '', '', '', '', '', 'yaml', '');
INSERT INTO `config_info` VALUES (41, 'yk-system-dev.yaml', 'DEFAULT_GROUP', 'spring:\n  datasource:\n    url: jdbc:mysql://115.29.205.214:3306/blog?useUnicode=true&characterEncoding=utf-8&useSSL=true&serverTimezone=UTC\n    username: root\n    password: root\n    # spring security 配置默认用户和密码\n    type: com.alibaba.druid.pool.DruidDataSource\n  redis:\n    host: 115.29.205.214\n    port: 6379\n    password: root\n\n# Mybatis Plus\nmybatis-plus:\n  global-config:\n    db-config:\n      logic-delete-field: flag  # 全局逻辑删除的实体字段名(since 3.3.0,配置后可以忽略不配置步骤2)\n      logic-delete-value: 1 # 逻辑已删除值(默认为 1)\n      logic-not-delete-value: 0 # 逻辑未删除值(默认为 0)\n  mapper-locations: classpath:mapper/*/*.xml # xml所在路径\n  type-aliases-package: com.yk.blog.entity # 实体路径\n  configuration:\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\n\n# Spring Boot 监控\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n#对Feign的支持\nfeign:\n  httpclient:\n    enabled: true\n\n# 调用微服务地址\nservice-url:\n  nacos-user-service: http://yk-blog\n  ', '151aa0d96c29f33d60d1c6d4ddf6fe28', '2021-04-09 06:18:48', '2021-04-12 12:08:35', NULL, '116.227.72.96', '', '', '', '', '', 'yaml', '');

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime(0) NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfoaggr_datagrouptenantdatum`(`data_id`, `group_id`, `tenant_id`, `datum_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '增加租户字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfobeta_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info_beta' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfotag_datagrouptenanttag`(`data_id`, `group_id`, `tenant_id`, `tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info_tag' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation`  (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tag_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`) USING BTREE,
  UNIQUE INDEX `uk_configtagrelation_configidtag`(`id`, `tag_name`, `tag_type`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_tag_relation' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '集群、各Group容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info`  (
  `id` bigint(64) UNSIGNED NOT NULL,
  `nid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `op_type` char(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`nid`) USING BTREE,
  INDEX `idx_gmt_create`(`gmt_create`) USING BTREE,
  INDEX `idx_gmt_modified`(`gmt_modified`) USING BTREE,
  INDEX `idx_did`(`data_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '多租户改造' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
INSERT INTO `his_config_info` VALUES (13, 21, 'yk-gateway-dev.yaml', 'DEFAULT_GROUP', '', 'spring:\n  cloud:\n    gateway:\n      routes:\n      - id: test_1\n        uri: http://news.baidu.com\n        predicates:\n        - Path=/guonei\n      - id: test_2\n        uri: http://news.baidu.com\n        predicates:\n        - Path=/guoji', '20914d3e06db5ba81ed4e53b93558f37', '2021-03-24 11:43:16', '2021-03-24 11:43:16', NULL, '218.82.194.63', 'U', '');
INSERT INTO `his_config_info` VALUES (13, 22, 'yk-gateway-dev.yaml', 'DEFAULT_GROUP', '', 'spring:\n  cloud:\n    gateway:\n      routes:\n      - id: test_1\n        uri: http://news.baidu.com\n        predicates:\n        - Path=/guonei\n      - id: test_2\n        uri: http://news.baidu.com\n        predicates:\n        - Path=/guoji\n      - id: aouth\n        uri: http://localhost:3711/uaa\n        predicates:\n        - Path=/**', 'f3ea36bc2757ea249921a5158a45a1eb', '2021-03-24 11:44:00', '2021-03-24 11:44:00', NULL, '218.82.194.63', 'U', '');
INSERT INTO `his_config_info` VALUES (13, 23, 'yk-gateway-dev.yaml', 'DEFAULT_GROUP', '', 'spring:\n  cloud:\n    gateway:\n      routes:\n      - id: test_1\n        uri: http://news.baidu.com\n        predicates:\n        - Path=/guonei\n      - id: test_2\n        uri: http://news.baidu.com\n        predicates:\n        - Path=/guoji\n      - id: aouth\n        uri: http://localhost:3711/uaa\n        predicates:\n        - Path=/oauth/token', '818c93fc8a96b507d3ba427bbbbc90d3', '2021-03-24 11:45:04', '2021-03-24 11:45:05', NULL, '218.82.194.63', 'U', '');
INSERT INTO `his_config_info` VALUES (13, 24, 'yk-gateway-dev.yaml', 'DEFAULT_GROUP', '', 'spring:\n  cloud:\n    gateway:\n      routes:\n      - id: test_1\n        uri: http://news.baidu.com\n        predicates:\n        - Path=/guonei\n      - id: test_2\n        uri: http://news.baidu.com\n        predicates:\n        - Path=/guoji\n      - id: aouth\n        uri: http://localhost:3711/uaa/oauth\n        predicates:\n        - Path=/token', '80d36b959618ea3a63cce4f6d48ab9a3', '2021-03-24 11:50:28', '2021-03-24 11:50:29', NULL, '218.82.194.63', 'U', '');
INSERT INTO `his_config_info` VALUES (13, 25, 'yk-gateway-dev.yaml', 'DEFAULT_GROUP', '', 'spring:\n  cloud:\n    gateway:\n      routes:\n      - id: test_1\n        uri: http://news.baidu.com\n        predicates:\n        - Path=/guonei\n      - id: test_2\n        uri: http://news.baidu.com\n        predicates:\n        - Path=/guoji\n      - id: aouth\n        uri: http://localhost:3711/\n        predicates:\n        - Path=/uaa/**', 'de4c344e868e7b1359889242a1246f2d', '2021-03-24 11:53:44', '2021-03-24 11:53:44', NULL, '218.82.194.63', 'U', '');
INSERT INTO `his_config_info` VALUES (13, 26, 'yk-gateway-dev.yaml', 'DEFAULT_GROUP', '', 'spring:\n  cloud:\n    gateway:\n      routes:\n      - id: test_1\n        uri: http://news.baidu.com\n        predicates:\n        - Path=/guonei\n      - id: test_2\n        uri: http://news.baidu.com\n        predicates:\n        - Path=/guoji\n      - id: aouth\n        uri: http://localhost:3711/\n        predicates:\n        - Path=/uaa/**\n      - id: blog\n        uri: http://localhost:3710/\n        predicates:\n        - Path=/blog/**', 'de578b1e196d29f0faa1800f3660c35a', '2021-04-04 10:23:55', '2021-04-04 10:23:55', NULL, '218.82.194.63', 'U', '');
INSERT INTO `his_config_info` VALUES (13, 27, 'yk-gateway-dev.yaml', 'DEFAULT_GROUP', '', 'spring:\n  cloud:\n    gateway:\n      routes:\n      - id: test_1\n        uri: http://news.baidu.com\n        predicates:\n        - Path=/guonei\n      - id: test_2\n        uri: http://news.baidu.com\n        predicates:\n        - Path=/guoji\n      - id: aouth\n        uri: http://localhost:3711/\n        predicates:\n        - Path=/uaa/**\n      - id: blog\n        uri: http://localhost:3710/\n        predicates:\n        - Path=/blog/**\n        \nzuul:\n  retryable: true\n  ignored-services: *\n  add-host-header: true\n  sensitive-headers: *\n  routes:\n    yk-authentication :\n      stripPrefix : false\n    uaa-service:\n      path : /uaa/**\n\n    yk-blog:\n      stripPrefix: false\n      uaa-service:\n        path: /uaa/**\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: refresh,health,info,env', 'a518250e0fc3e7076ac5ad6b96d49c8e', '2021-04-04 10:26:37', '2021-04-04 10:26:38', NULL, '218.82.194.63', 'U', '');
INSERT INTO `his_config_info` VALUES (13, 28, 'yk-gateway-dev.yaml', 'DEFAULT_GROUP', '', 'spring:\n  cloud:\n    gateway:\n      routes:\n      - id: test_1\n        uri: http://news.baidu.com\n        predicates:\n        - Path=/guonei\n      - id: test_2\n        uri: http://news.baidu.com\n        predicates:\n        - Path=/guoji\n      - id: aouth\n        uri: http://localhost:3711/\n        predicates:\n        - Path=/uaa/**\n      - id: blog\n        uri: http://localhost:3710/\n        predicates:\n        - Path=/blog/**\n        \nzuul:\n  retryable: true\n  ignored-services: /*\n  add-host-header: true\n  sensitive-headers: /*\n  routes:\n    yk-authentication :\n      stripPrefix : false\n    uaa-service:\n      path : /uaa/**\n\n    yk-blog:\n      stripPrefix: false\n      uaa-service:\n        path: /uaa/**\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: refresh,health,info,env', '149191c86b145a35b42fdd30e7fb3e58', '2021-04-04 10:41:16', '2021-04-04 10:41:17', NULL, '218.82.194.63', 'U', '');
INSERT INTO `his_config_info` VALUES (8, 29, 'yk-authentication-dev.yaml', 'DEFAULT_GROUP', '', 'spring:\n  datasource:\n    url: jdbc:mysql://115.29.205.214:3306/blog?useUnicode=true&characterEncoding=utf-8&useSSL=true&serverTimezone=UTC\n    username: root\n    password: root\n    # spring security 配置默认用户和密码\n    type: com.alibaba.druid.pool.DruidDataSource\n  main:\n    allow-bean-definition-overriding: true\n# Mybatis Plus\nmybatis-plus:\n  global-config:\n    db-config:\n      logic-delete-field: flag  # 全局逻辑删除的实体字段名(since 3.3.0,配置后可以忽略不配置步骤2)\n      logic-delete-value: 1 # 逻辑已删除值(默认为 1)\n      logic-not-delete-value: 0 # 逻辑未删除值(默认为 0)\n  mapper-locations: classpath:mapper/*.xml # xml所在路径\n  type-aliases-package: com.yk.blog.entity # 实体路径\n\n# Spring Boot 监控\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'', 'fec54b64f559c0bdea21336e74d401b3', '2021-04-05 02:58:16', '2021-04-05 02:58:16', NULL, '218.82.194.63', 'U', '');
INSERT INTO `his_config_info` VALUES (8, 30, 'yk-authentication-dev.yaml', 'DEFAULT_GROUP', '', 'spring:\n  datasource:\n    url: jdbc:mysql://115.29.205.214:3306/blog?useUnicode=true&characterEncoding=utf-8&useSSL=true&serverTimezone=UTC\n    username: root\n    password: root\n    # spring security 配置默认用户和密码\n    type: com.alibaba.druid.pool.DruidDataSource\n  main:\n    allow-bean-definition-overriding: true\n# Mybatis Plus\nmybatis-plus:\n  global-config:\n    db-config:\n      logic-delete-field: flag  # 全局逻辑删除的实体字段名(since 3.3.0,配置后可以忽略不配置步骤2)\n      logic-delete-value: 1 # 逻辑已删除值(默认为 1)\n      logic-not-delete-value: 0 # 逻辑未删除值(默认为 0)\n  mapper-locations: classpath:mapper/*.xml # xml所在路径\n  type-aliases-package: com.yk.blog.entity # 实体路径\n\n# Spring Boot 监控\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n#对Feign的支持\nfeign:\n  sentinel:\n    enabled: true', '6ca77f552865d8380e93324678ef9d7c', '2021-04-05 03:07:04', '2021-04-05 03:07:05', NULL, '218.82.194.63', 'U', '');
INSERT INTO `his_config_info` VALUES (8, 31, 'yk-authentication-dev.yaml', 'DEFAULT_GROUP', '', '\n# Spring Boot 监控\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n#对Feign的支持\nfeign:\n  sentinel:\n    enabled: true', 'bedd2a93d7cf2623503fe900d2067d4e', '2021-04-05 03:08:07', '2021-04-05 03:08:08', NULL, '218.82.194.63', 'U', '');
INSERT INTO `his_config_info` VALUES (8, 32, 'yk-authentication-dev.yaml', 'DEFAULT_GROUP', '', '\n# Spring Boot 监控\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n#对Feign的支持\nfeign:\n  sentinel:\n    enabled: true', 'bedd2a93d7cf2623503fe900d2067d4e', '2021-04-05 03:14:34', '2021-04-05 03:14:35', NULL, '218.82.194.63', 'U', '');
INSERT INTO `his_config_info` VALUES (8, 33, 'yk-authentication-dev.yaml', 'DEFAULT_GROUP', '', 'spring:\n  datasource:\n    url: jdbc:mysql://115.29.205.214:3306/blog?useUnicode=true&characterEncoding=utf-8&useSSL=true&serverTimezone=UTC\n    username: root\n    password: root\n    # spring security 配置默认用户和密码\n    type: com.alibaba.druid.pool.DruidDataSource\n# Spring Boot 监控\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n#对Feign的支持\nfeign:\n  sentinel:\n    enabled: true', '5a9a446700dc9a39154bcd4666c9c529', '2021-04-05 08:01:52', '2021-04-05 08:01:53', NULL, '218.82.194.63', 'U', '');
INSERT INTO `his_config_info` VALUES (8, 34, 'yk-authentication-dev.yaml', 'DEFAULT_GROUP', '', 'spring:\n  datasource:\n    url: jdbc:mysql://115.29.205.214:3306/blog?useUnicode=true&characterEncoding=utf-8&useSSL=true&serverTimezone=UTC\n    username: root\n    password: root\n    # spring security 配置默认用户和密码\n    type: com.alibaba.druid.pool.DruidDataSource\n# Spring Boot 监控\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n#对Feign的支持\nfeign:\n  sentinel:\n    enabled: true\n\n# 调用微服务地址\nservice-url:\n  nacos-user-service: http://yk-blog', '408b105efc4c6fca0aa4ab340e43b3c6', '2021-04-05 08:08:08', '2021-04-05 08:08:08', NULL, '218.82.194.63', 'U', '');
INSERT INTO `his_config_info` VALUES (8, 35, 'yk-authentication-dev.yaml', 'DEFAULT_GROUP', '', 'spring:\n  datasource:\n    url: jdbc:mysql://115.29.205.214:3306/blog?useUnicode=true&characterEncoding=utf-8&useSSL=true&serverTimezone=UTC\n    username: root\n    password: root\n    # spring security 配置默认用户和密码\n    type: com.alibaba.druid.pool.DruidDataSource\n# Spring Boot 监控\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n#对Feign的支持\nfeign:\n  sentinel:\n    enabled: true\n\n# 调用微服务地址\nservice-url:\n  nacos-user-service: http://yk-blog\n# okhttp\nfeign:\n  okhttp:\n    enabled: true', 'e91b4535b98676dfb0ea3c0ab39e17e1', '2021-04-05 08:10:14', '2021-04-05 08:10:14', NULL, '218.82.194.63', 'U', '');
INSERT INTO `his_config_info` VALUES (8, 36, 'yk-authentication-dev.yaml', 'DEFAULT_GROUP', '', 'spring:\n  datasource:\n    url: jdbc:mysql://115.29.205.214:3306/blog?useUnicode=true&characterEncoding=utf-8&useSSL=true&serverTimezone=UTC\n    username: root\n    password: root\n    # spring security 配置默认用户和密码\n    type: com.alibaba.druid.pool.DruidDataSource\n# Spring Boot 监控\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n#对Feign的支持\nfeign:\n  sentinel:\n    enabled: true\n  okhttp:\n    enabled: true\n\n# 调用微服务地址\nservice-url:\n  nacos-user-service: http://yk-blog\n  ', 'ede0d9ff83777eff735982c0ee299f90', '2021-04-05 08:18:20', '2021-04-05 08:18:21', NULL, '218.82.194.63', 'U', '');
INSERT INTO `his_config_info` VALUES (8, 37, 'yk-authentication-dev.yaml', 'DEFAULT_GROUP', '', 'spring:\n  datasource:\n    url: jdbc:mysql://115.29.205.214:3306/blog?useUnicode=true&characterEncoding=utf-8&useSSL=true&serverTimezone=UTC\n    username: root\n    password: root\n    # spring security 配置默认用户和密码\n    type: com.alibaba.druid.pool.DruidDataSource\n# Spring Boot 监控\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n#对Feign的支持\nfeign:\n  sentinel:\n    enabled: true\n  httpclient:\n    enabled: true\n\n# 调用微服务地址\nservice-url:\n  nacos-user-service: http://yk-blog\n  ', '416dba9e7b98541066efcb76371cb563', '2021-04-05 10:14:36', '2021-04-05 10:14:37', NULL, '218.82.194.63', 'U', '');
INSERT INTO `his_config_info` VALUES (8, 38, 'yk-authentication-dev.yaml', 'DEFAULT_GROUP', '', 'spring:\n  datasource:\n    url: jdbc:mysql://115.29.205.214:3306/blog?useUnicode=true&characterEncoding=utf-8&useSSL=true&serverTimezone=UTC\n    username: root\n    password: root\n    # spring security 配置默认用户和密码\n    type: com.alibaba.druid.pool.DruidDataSource\n\n# Mybatis Plus\nmybatis-plus:\n  global-config:\n    db-config:\n      logic-delete-field: flag  # 全局逻辑删除的实体字段名(since 3.3.0,配置后可以忽略不配置步骤2)\n      logic-delete-value: 1 # 逻辑已删除值(默认为 1)\n      logic-not-delete-value: 0 # 逻辑未删除值(默认为 0)\n  mapper-locations: classpath:mapper/*.xml # xml所在路径\n  type-aliases-package: com.yk.blog.entity # 实体路径\n\n# Spring Boot 监控\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n#对Feign的支持\nfeign:\n  sentinel:\n    enabled: true\n  httpclient:\n    enabled: true\n\n# 调用微服务地址\nservice-url:\n  nacos-user-service: http://yk-blog\n  ', '170792fe10ecb06d3f80c8171eec96e5', '2021-04-08 12:14:55', '2021-04-08 12:14:56', NULL, '210.22.163.214', 'U', '');
INSERT INTO `his_config_info` VALUES (8, 39, 'yk-authentication-dev.yaml', 'DEFAULT_GROUP', '', 'spring:\n  datasource:\n    url: jdbc:mysql://115.29.205.214:3306/blog?useUnicode=true&characterEncoding=utf-8&useSSL=true&serverTimezone=UTC\n    username: root\n    password: root\n    # spring security 配置默认用户和密码\n    type: com.alibaba.druid.pool.DruidDataSource\n\n# Mybatis Plus\nmybatis-plus:\n  global-config:\n    db-config:\n      logic-delete-field: flag  # 全局逻辑删除的实体字段名(since 3.3.0,配置后可以忽略不配置步骤2)\n      logic-delete-value: 1 # 逻辑已删除值(默认为 1)\n      logic-not-delete-value: 0 # 逻辑未删除值(默认为 0)\n  mapper-locations: classpath:mapper/*.xml # xml所在路径\n  type-aliases-package: com.yk.blog.entity # 实体路径\n  configuration:\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\n\n# Spring Boot 监控\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n#对Feign的支持\nfeign:\n  sentinel:\n    enabled: true\n  httpclient:\n    enabled: true\n\n# 调用微服务地址\nservice-url:\n  nacos-user-service: http://yk-blog\n  ', '3ca14e9ffd16895e46c6e4fe761bfd63', '2021-04-08 12:42:15', '2021-04-08 12:42:16', NULL, '210.22.163.214', 'U', '');
INSERT INTO `his_config_info` VALUES (8, 40, 'yk-authentication-dev.yaml', 'DEFAULT_GROUP', '', 'spring:\n  datasource:\n    url: jdbc:mysql://115.29.205.214:3306/blog?useUnicode=true&characterEncoding=utf-8&useSSL=true&serverTimezone=UTC\n    username: root\n    password: root\n    # spring security 配置默认用户和密码\n    type: com.alibaba.druid.pool.DruidDataSource\n\n# Mybatis Plus\nmybatis-plus:\n  global-config:\n    db-config:\n      logic-delete-field: flag  # 全局逻辑删除的实体字段名(since 3.3.0,配置后可以忽略不配置步骤2)\n      logic-delete-value: 1 # 逻辑已删除值(默认为 1)\n      logic-not-delete-value: 0 # 逻辑未删除值(默认为 0)\n  mapper-locations: com/yk/authentication/mapper/*.xml # xml所在路径\n  type-aliases-package: com.yk.blog.entity # 实体路径\n  configuration:\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\n\n# Spring Boot 监控\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n#对Feign的支持\nfeign:\n  sentinel:\n    enabled: true\n  httpclient:\n    enabled: true\n\n# 调用微服务地址\nservice-url:\n  nacos-user-service: http://yk-blog\n  ', '03eaf9a3093c67fb26ba25d8c9768094', '2021-04-08 12:45:08', '2021-04-08 12:45:08', NULL, '210.22.163.214', 'U', '');
INSERT INTO `his_config_info` VALUES (8, 41, 'yk-authentication-dev.yaml', 'DEFAULT_GROUP', '', 'spring:\n  datasource:\n    url: jdbc:mysql://115.29.205.214:3306/blog?useUnicode=true&characterEncoding=utf-8&useSSL=true&serverTimezone=UTC\n    username: root\n    password: root\n    # spring security 配置默认用户和密码\n    type: com.alibaba.druid.pool.DruidDataSource\n\n# Mybatis Plus\nmybatis-plus:\n  global-config:\n    db-config:\n      logic-delete-field: flag  # 全局逻辑删除的实体字段名(since 3.3.0,配置后可以忽略不配置步骤2)\n      logic-delete-value: 1 # 逻辑已删除值(默认为 1)\n      logic-not-delete-value: 0 # 逻辑未删除值(默认为 0)\n  mapper-locations: classpath:com/yk/authentication/mapper/*.xml # xml所在路径\n  type-aliases-package: com.yk.blog.entity # 实体路径\n  configuration:\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\n\n# Spring Boot 监控\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n#对Feign的支持\nfeign:\n  sentinel:\n    enabled: true\n  httpclient:\n    enabled: true\n\n# 调用微服务地址\nservice-url:\n  nacos-user-service: http://yk-blog\n  ', '556ebb765feb78cc71d791f112dac6e5', '2021-04-08 12:51:58', '2021-04-08 12:51:58', NULL, '210.22.163.214', 'U', '');
INSERT INTO `his_config_info` VALUES (8, 42, 'yk-authentication-dev.yaml', 'DEFAULT_GROUP', '', 'spring:\n  datasource:\n    url: jdbc:mysql://115.29.205.214:3306/blog?useUnicode=true&characterEncoding=utf-8&useSSL=true&serverTimezone=UTC\n    username: root\n    password: root\n    # spring security 配置默认用户和密码\n    type: com.alibaba.druid.pool.DruidDataSource\n\n# Mybatis Plus\nmybatis-plus:\n  global-config:\n    db-config:\n      logic-delete-field: flag  # 全局逻辑删除的实体字段名(since 3.3.0,配置后可以忽略不配置步骤2)\n      logic-delete-value: 1 # 逻辑已删除值(默认为 1)\n      logic-not-delete-value: 0 # 逻辑未删除值(默认为 0)\n  mapper-locations: classpath:mapper/*.xml # xml所在路径\n  type-aliases-package: com.yk.blog.entity # 实体路径\n  configuration:\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\n\n# Spring Boot 监控\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n#对Feign的支持\nfeign:\n  sentinel:\n    enabled: true\n  httpclient:\n    enabled: true\n\n# 调用微服务地址\nservice-url:\n  nacos-user-service: http://yk-blog\n  ', '3ca14e9ffd16895e46c6e4fe761bfd63', '2021-04-08 13:29:14', '2021-04-08 13:29:15', NULL, '210.22.163.214', 'U', '');
INSERT INTO `his_config_info` VALUES (0, 43, 'yk-system-dev.yaml', 'DEFAULT_GROUP', '', 'spring:\n  datasource:\n    url: jdbc:mysql://115.29.205.214:3306/blog?useUnicode=true&characterEncoding=utf-8&useSSL=true&serverTimezone=UTC\n    username: root\n    password: root\n    # spring security 配置默认用户和密码\n    type: com.alibaba.druid.pool.DruidDataSource\n\n# Mybatis Plus\nmybatis-plus:\n  global-config:\n    db-config:\n      logic-delete-field: flag  # 全局逻辑删除的实体字段名(since 3.3.0,配置后可以忽略不配置步骤2)\n      logic-delete-value: 1 # 逻辑已删除值(默认为 1)\n      logic-not-delete-value: 0 # 逻辑未删除值(默认为 0)\n  mapper-locations: classpath:mapper/*/*.xml # xml所在路径\n  type-aliases-package: com.yk.blog.entity # 实体路径\n  configuration:\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\n\n# Spring Boot 监控\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n#对Feign的支持\nfeign:\n  sentinel:\n    enabled: true\n  httpclient:\n    enabled: true\n\n# 调用微服务地址\nservice-url:\n  nacos-user-service: http://yk-blog\n  ', 'e2c42a082fcc0f6d6625a4a394d14806', '2021-04-09 06:18:48', '2021-04-09 06:18:48', NULL, '210.22.163.214', 'I', '');
INSERT INTO `his_config_info` VALUES (13, 44, 'yk-gateway-dev.yaml', 'DEFAULT_GROUP', '', 'spring:\n  cloud:\n    gateway:\n      routes:\n      - id: test_1\n        uri: http://news.baidu.com\n        predicates:\n        - Path=/guonei\n      - id: test_2\n        uri: http://news.baidu.com\n        predicates:\n        - Path=/guoji\n      - id: aouth\n        uri: http://localhost:3711/\n        predicates:\n        - Path=/uaa/**\n      - id: blog\n        uri: http://localhost:3710/\n        predicates:\n        - Path=/blog/**\n        ', '5f74642d5c34d8b48be18f0d3babeb2b', '2021-04-09 06:39:46', '2021-04-09 06:39:46', NULL, '210.22.163.214', 'U', '');
INSERT INTO `his_config_info` VALUES (41, 45, 'yk-system-dev.yaml', 'DEFAULT_GROUP', '', 'spring:\n  datasource:\n    url: jdbc:mysql://115.29.205.214:3306/blog?useUnicode=true&characterEncoding=utf-8&useSSL=true&serverTimezone=UTC\n    username: root\n    password: root\n    # spring security 配置默认用户和密码\n    type: com.alibaba.druid.pool.DruidDataSource\n\n# Mybatis Plus\nmybatis-plus:\n  global-config:\n    db-config:\n      logic-delete-field: flag  # 全局逻辑删除的实体字段名(since 3.3.0,配置后可以忽略不配置步骤2)\n      logic-delete-value: 1 # 逻辑已删除值(默认为 1)\n      logic-not-delete-value: 0 # 逻辑未删除值(默认为 0)\n  mapper-locations: classpath:mapper/*/*.xml # xml所在路径\n  type-aliases-package: com.yk.blog.entity # 实体路径\n  configuration:\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\n\n# Spring Boot 监控\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n#对Feign的支持\nfeign:\n  sentinel:\n    enabled: true\n  httpclient:\n    enabled: true\n\n# 调用微服务地址\nservice-url:\n  nacos-user-service: http://yk-blog\n  ', 'e2c42a082fcc0f6d6625a4a394d14806', '2021-04-09 08:34:56', '2021-04-09 08:34:56', NULL, '210.22.163.214', 'U', '');
INSERT INTO `his_config_info` VALUES (41, 46, 'yk-system-dev.yaml', 'DEFAULT_GROUP', '', 'spring:\n  datasource:\n    url: jdbc:mysql://115.29.205.214:3306/blog?useUnicode=true&characterEncoding=utf-8&useSSL=true&serverTimezone=UTC\n    username: root\n    password: root\n    # spring security 配置默认用户和密码\n    type: com.alibaba.druid.pool.DruidDataSource\n  redis:\n        host: 115.29.205.214\n        port: 6379\n        password: root\n        pool:\n          max-active: 100\n          max-idle: 10\n          max-wait: 100000\n        timeout: 0\n\n# Mybatis Plus\nmybatis-plus:\n  global-config:\n    db-config:\n      logic-delete-field: flag  # 全局逻辑删除的实体字段名(since 3.3.0,配置后可以忽略不配置步骤2)\n      logic-delete-value: 1 # 逻辑已删除值(默认为 1)\n      logic-not-delete-value: 0 # 逻辑未删除值(默认为 0)\n  mapper-locations: classpath:mapper/*/*.xml # xml所在路径\n  type-aliases-package: com.yk.blog.entity # 实体路径\n  configuration:\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\n\n# Spring Boot 监控\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n#对Feign的支持\nfeign:\n  sentinel:\n    enabled: true\n  httpclient:\n    enabled: true\n\n# 调用微服务地址\nservice-url:\n  nacos-user-service: http://yk-blog\n  ', 'd372fea060ff7e506d111c61b7427289', '2021-04-09 08:36:53', '2021-04-09 08:36:54', NULL, '210.22.163.214', 'U', '');
INSERT INTO `his_config_info` VALUES (3, 47, 'yk-blog-dev.yaml', 'DEFAULT_GROUP', '', 'spring:\n  datasource:\n    url: jdbc:mysql://115.29.205.214:3306/blog?useUnicode=true&characterEncoding=utf-8&useSSL=true&serverTimezone=UTC\n    username: root\n    password: root\n    # spring security 配置默认用户和密码\n    type: com.alibaba.druid.pool.DruidDataSource\n\n# Mybatis Plus\nmybatis-plus:\n  global-config:\n    db-config:\n      logic-delete-field: flag  # 全局逻辑删除的实体字段名(since 3.3.0,配置后可以忽略不配置步骤2)\n      logic-delete-value: 1 # 逻辑已删除值(默认为 1)\n      logic-not-delete-value: 0 # 逻辑未删除值(默认为 0)\n  mapper-locations: classpath:mapper/*.xml # xml所在路径\n  type-aliases-package: com.yk.blog.entity # 实体路径\n\n# Spring Boot 监控\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'', '3b2ea34882288bdd98ecac56ba6ebaa5', '2021-04-09 08:47:46', '2021-04-09 08:47:46', NULL, '210.22.163.214', 'U', '');
INSERT INTO `his_config_info` VALUES (8, 48, 'yk-authentication-dev.yaml', 'DEFAULT_GROUP', '', 'spring:\n  datasource:\n    url: jdbc:mysql://115.29.205.214:3306/blog?useUnicode=true&characterEncoding=utf-8&useSSL=true&serverTimezone=UTC\n    username: root\n    password: root\n    # spring security 配置默认用户和密码\n    type: com.alibaba.druid.pool.DruidDataSource\n\n# Mybatis Plus\nmybatis-plus:\n  global-config:\n    db-config:\n      logic-delete-field: flag  # 全局逻辑删除的实体字段名(since 3.3.0,配置后可以忽略不配置步骤2)\n      logic-delete-value: 1 # 逻辑已删除值(默认为 1)\n      logic-not-delete-value: 0 # 逻辑未删除值(默认为 0)\n  mapper-locations: classpath:mapper/*/*.xml # xml所在路径\n  type-aliases-package: com.yk.blog.entity # 实体路径\n  configuration:\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\n\n# Spring Boot 监控\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n#对Feign的支持\nfeign:\n  sentinel:\n    enabled: true\n  httpclient:\n    enabled: true\n\n# 调用微服务地址\nservice-url:\n  nacos-user-service: http://yk-blog\n  ', 'e2c42a082fcc0f6d6625a4a394d14806', '2021-04-09 08:48:03', '2021-04-09 08:48:04', NULL, '210.22.163.214', 'U', '');
INSERT INTO `his_config_info` VALUES (41, 49, 'yk-system-dev.yaml', 'DEFAULT_GROUP', '', 'spring:\n  datasource:\n    url: jdbc:mysql://115.29.205.214:3306/blog?useUnicode=true&characterEncoding=utf-8&useSSL=true&serverTimezone=UTC\n    username: root\n    password: root\n    # spring security 配置默认用户和密码\n    type: com.alibaba.druid.pool.DruidDataSource\n  redis:\n        host: 115.29.205.214\n        port: 6379\n        password: root\n\n# Mybatis Plus\nmybatis-plus:\n  global-config:\n    db-config:\n      logic-delete-field: flag  # 全局逻辑删除的实体字段名(since 3.3.0,配置后可以忽略不配置步骤2)\n      logic-delete-value: 1 # 逻辑已删除值(默认为 1)\n      logic-not-delete-value: 0 # 逻辑未删除值(默认为 0)\n  mapper-locations: classpath:mapper/*/*.xml # xml所在路径\n  type-aliases-package: com.yk.blog.entity # 实体路径\n  configuration:\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\n\n# Spring Boot 监控\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n#对Feign的支持\nfeign:\n  sentinel:\n    enabled: true\n  httpclient:\n    enabled: true\n\n# 调用微服务地址\nservice-url:\n  nacos-user-service: http://yk-blog\n  ', '8be145493b59692193d80d91ce158569', '2021-04-12 06:55:50', '2021-04-12 06:55:50', NULL, '210.22.163.214', 'U', '');
INSERT INTO `his_config_info` VALUES (41, 50, 'yk-system-dev.yaml', 'DEFAULT_GROUP', '', 'spring:\n  datasource:\n    url: jdbc:mysql://115.29.205.214:3306/blog?useUnicode=true&characterEncoding=utf-8&useSSL=true&serverTimezone=UTC\n    username: root\n    password: root\n    # spring security 配置默认用户和密码\n    type: com.alibaba.druid.pool.DruidDataSource\n  redis:\n    host: 115.29.205.214\n    port: 6379\n    password: root\n\n# Mybatis Plus\nmybatis-plus:\n  global-config:\n    db-config:\n      logic-delete-field: flag  # 全局逻辑删除的实体字段名(since 3.3.0,配置后可以忽略不配置步骤2)\n      logic-delete-value: 1 # 逻辑已删除值(默认为 1)\n      logic-not-delete-value: 0 # 逻辑未删除值(默认为 0)\n  mapper-locations: classpath:mapper/*/*.xml # xml所在路径\n  type-aliases-package: com.yk.blog.entity # 实体路径\n  configuration:\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\n\n# Spring Boot 监控\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n#对Feign的支持\nfeign:\n  sentinel:\n    enabled: true\n  httpclient:\n    enabled: true\n\n# 调用微服务地址\nservice-url:\n  nacos-user-service: http://yk-blog\n  ', '9a65184b2b752333d09bc3cda0356547', '2021-04-12 12:00:37', '2021-04-12 12:00:37', NULL, '116.227.72.96', 'U', '');
INSERT INTO `his_config_info` VALUES (41, 51, 'yk-system-dev.yaml', 'DEFAULT_GROUP', '', 'spring:\n  datasource:\n    url: jdbc:mysql://115.29.205.214:3306/blog?useUnicode=true&characterEncoding=utf-8&useSSL=true&serverTimezone=UTC\n    username: root\n    password: root\n    # spring security 配置默认用户和密码\n    type: com.alibaba.druid.pool.DruidDataSource\n  redis:\n    host: 115.29.205.214\n    port: 6379\n    password: root\n\n# Mybatis Plus\nmybatis-plus:\n  global-config:\n    db-config:\n      logic-delete-field: flag  # 全局逻辑删除的实体字段名(since 3.3.0,配置后可以忽略不配置步骤2)\n      logic-delete-value: 1 # 逻辑已删除值(默认为 1)\n      logic-not-delete-value: 0 # 逻辑未删除值(默认为 0)\n  mapper-locations: classpath:mapper/*/*.xml # xml所在路径\n  type-aliases-package: com.yk.blog.entity # 实体路径\n  configuration:\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\n\n# Spring Boot 监控\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n#对Feign的支持\nfeign:\n  sentinel:\n    enabled: true\n  httpclient:\n    enabled: true\n\n# 调用微服务地址\nservice-url:\n  nacos-user-service: http://yk-blog\n  ', '9a65184b2b752333d09bc3cda0356547', '2021-04-12 12:08:35', '2021-04-12 12:08:35', NULL, '116.227.72.96', 'U', '');

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `role` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `resource` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  UNIQUE INDEX `uk_role_permission`(`role`, `resource`, `action`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  UNIQUE INDEX `idx_user_role`(`username`, `role`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('nacos', 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数',
  `max_aggr_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '租户容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint(20) NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint(20) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_info_kptenantid`(`kp`, `tenant_id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'tenant_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('nacos', '$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu', 1);
INSERT INTO `users` VALUES ('yangkk', '$2a$10$VgikRF9JY45TrTmHGsNvMuLk61QUuxMOdmBAIPFggVMphDniRnfNi', 1);

SET FOREIGN_KEY_CHECKS = 1;
