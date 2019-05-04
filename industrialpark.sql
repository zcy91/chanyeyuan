/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.0.135
 Source Server Type    : MySQL
 Source Server Version : 50617
 Source Host           : 192.168.0.135:3306
 Source Schema         : industrialpark

 Target Server Type    : MySQL
 Target Server Version : 50617
 File Encoding         : 65001

 Date: 04/05/2019 12:45:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for building
-- ----------------------------
DROP TABLE IF EXISTS `building`;
CREATE TABLE `building`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `use` int(2) NULL DEFAULT 1 COMMENT '用途',
  `floors` int(3) NULL DEFAULT 1 COMMENT '总层数',
  `starting_floor` int(3) NULL DEFAULT 1 COMMENT '起始层数',
  `end_floor` int(3) NULL DEFAULT 1 COMMENT '结束层数',
  `floor_area` float(10, 2) NULL DEFAULT 0.00 COMMENT '建筑面积',
  `management_area` float(10, 2) NULL DEFAULT 0.00 COMMENT '管理面积',
  `builtTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建成时间',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `seller_id` int(10) NULL DEFAULT NULL,
  `uid` int(10) NULL DEFAULT NULL,
  `creatTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `nowTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `num` int(10) NULL DEFAULT NULL COMMENT '序号',
  `is_delete` tinyint(1) NULL DEFAULT 0,
  `contract_num` int(10) NULL DEFAULT 0 COMMENT '在租合同数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of building
-- ----------------------------
INSERT INTO `building` VALUES (1, 'wx大厦3', '东阳', 1, 18, 1, 1, 1000.00, 800.00, '2018-04-24 10:10:10', 'image', 2, 101, '2019-04-24 15:09:33', '2019-04-24 15:43:43', 1, 1, 0);
INSERT INTO `building` VALUES (2, 'wx大厦', '东阳', 1, 18, 1, 1, 1000.00, 800.00, '2019-04-24 15:25:51', 'image', 2, 101, '2019-04-24 15:25:51', '2019-04-24 15:25:51', 2, 0, 0);
INSERT INTO `building` VALUES (3, 'wx大厦3', '东阳', 1, 18, 3, 10, 1000.00, 800.00, '2019-04-24 15:27:05', 'image', 2, 101, '2019-04-24 15:27:05', '2019-04-24 15:27:05', 3, 0, 4);

-- ----------------------------
-- Table structure for building_use
-- ----------------------------
DROP TABLE IF EXISTS `building_use`;
CREATE TABLE `building_use`  (
  `use_id` int(2) NOT NULL AUTO_INCREMENT,
  `use_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`use_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of building_use
-- ----------------------------
INSERT INTO `building_use` VALUES (1, '办公楼');
INSERT INTO `building_use` VALUES (2, '综合楼');
INSERT INTO `building_use` VALUES (3, '住宿');
INSERT INTO `building_use` VALUES (4, '商铺');

-- ----------------------------
-- Table structure for business_service
-- ----------------------------
DROP TABLE IF EXISTS `business_service`;
CREATE TABLE `business_service`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cat_id` int(3) NULL DEFAULT NULL COMMENT '分类id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contacts` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_show` tinyint(1) NULL DEFAULT 1,
  `sort` int(2) NULL DEFAULT NULL,
  `remarks` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `seller_id` int(10) NULL DEFAULT NULL,
  `uid` int(10) NULL DEFAULT NULL,
  `creatTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `nowTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fcat_id` int(3) NULL DEFAULT NULL COMMENT '一级分类',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of business_service
-- ----------------------------
INSERT INTO `business_service` VALUES (2, 7, '2', 'image2', '张陈奕', '地址2', 1, 0, 'remarks2', 2, 101, '2019-04-23 11:10:33', '2019-04-23 11:10:33', '18257990958', 4);
INSERT INTO `business_service` VALUES (3, 7, '3', 'image3', '张晨跃', '地址3', 1, 0, 'remarks3', 2, 101, '2019-04-23 11:14:33', '2019-04-23 11:14:33', '18257990958', 4);
INSERT INTO `business_service` VALUES (4, 7, '4', 'image4', '张晨跃', '地址4', 1, 0, 'remarks4', 2, 101, '2019-04-23 11:15:15', '2019-04-23 11:15:15', '18257990958', 4);
INSERT INTO `business_service` VALUES (5, 3, '5', 'image5', '张晨跃', '地址5', 1, 0, 'remarks5', 2, 101, '2019-04-23 12:38:59', '2019-04-23 12:38:59', '18257990958', 5);
INSERT INTO `business_service` VALUES (6, 3, '6', 'image6', '张晨跃', '地址5', 1, 0, 'remarks5', 2, 101, '2019-04-23 12:40:14', '2019-04-23 12:40:14', '18257990958', 5);
INSERT INTO `business_service` VALUES (8, 3, '8', 'image7', '张晨跃', '地址5', 1, 0, 'remarks5', 2, 101, '2019-04-23 12:44:20', '2019-04-23 12:44:20', '18257990958', 5);
INSERT INTO `business_service` VALUES (9, 3, '9', 'image7', '张晨跃', '地址5', 1, 0, 'remarks5', 2, 101, '2019-04-23 12:49:49', '2019-04-23 12:49:49', '18257990958', 5);
INSERT INTO `business_service` VALUES (10, 3, '10', 'image7', '张晨跃', '地址5', 1, 0, 'remarks5', 2, 101, '2019-04-23 12:50:39', '2019-04-23 12:50:39', '18257990958', 5);
INSERT INTO `business_service` VALUES (11, 3, '11', 'image7', '张晨跃', '地址5', 1, 0, 'remarks5', 2, 101, '2019-04-23 12:54:08', '2019-04-23 12:54:08', '18257990958', 5);
INSERT INTO `business_service` VALUES (12, 3, '12', 'image7', '张晨跃', '地址5', 1, 0, 'remarks5', 2, 101, '2019-04-23 12:55:10', '2019-04-23 12:55:10', '18257990958', 5);
INSERT INTO `business_service` VALUES (13, 3, '13', 'image7', '张晨跃', '地址5', 1, 0, 'remarks5', 2, 101, '2019-04-23 12:56:17', '2019-04-23 12:56:17', '18257990958', 5);
INSERT INTO `business_service` VALUES (14, 3, '14', 'image7', '张晨跃', '地址5', 1, 0, 'remarks5', 2, 101, '2019-04-23 12:57:05', '2019-04-23 12:57:05', '18257990958', 5);
INSERT INTO `business_service` VALUES (15, 3, '15', 'image15', '王欣', '地址5', 1, 0, 'remarks5', 2, 101, '2019-04-23 13:01:17', '2019-04-23 13:05:10', '18257990958', 5);
INSERT INTO `business_service` VALUES (16, 3, '16', 'image20', '王欣', '地址5', 1, 0, 'remarks5', 2, 100, '2019-04-24 08:56:27', '2019-04-24 08:56:27', '18357991416', NULL);

-- ----------------------------
-- Table structure for business_service_banner
-- ----------------------------
DROP TABLE IF EXISTS `business_service_banner`;
CREATE TABLE `business_service_banner`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `banner` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `seller_id` int(11) NULL DEFAULT NULL,
  `uid` int(11) NULL DEFAULT NULL,
  `creatTime` datetime(0) NULL DEFAULT NULL,
  `nowTime` datetime(0) NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` int(3) NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `seller_id`(`seller_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of business_service_banner
-- ----------------------------
INSERT INTO `business_service_banner` VALUES (3, 'http://211.155.230.114:4869/a169dc452ebc40b3af7dfe2082877654', 2, 101, '2019-04-29 13:45:09', NULL, 'baidu.com', NULL, NULL);
INSERT INTO `business_service_banner` VALUES (4, 'http://211.155.230.114:4869/30b2c8cbd734f5fa46d2b652f5b99714', 2, 101, '2019-04-29 13:45:09', NULL, 'qq.com', NULL, NULL);

-- ----------------------------
-- Table structure for business_service_category
-- ----------------------------
DROP TABLE IF EXISTS `business_service_category`;
CREATE TABLE `business_service_category`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` int(3) NULL DEFAULT 0,
  `creatTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `nowTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `uid` int(10) NULL DEFAULT NULL,
  `seller_id` int(10) NULL DEFAULT NULL,
  `parent_id` int(3) NULL DEFAULT NULL,
  `parent_id_path` varchar(125) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_show` int(1) NOT NULL DEFAULT 1,
  `level` int(2) NULL DEFAULT NULL,
  `des` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `banner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_hot` tinyint(1) NULL DEFAULT 2,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of business_service_category
-- ----------------------------
INSERT INTO `business_service_category` VALUES (1, 'wx1', 'http55', 10, '2019-04-22 15:01:55', '2019-04-22 15:42:31', 102, 3, 0, NULL, 1, 1, NULL, NULL, 2);
INSERT INTO `business_service_category` VALUES (2, 'wx2', 'http55', 1, '2019-04-22 15:02:24', '2019-04-22 15:41:33', 102, 3, 1, NULL, 1, 2, NULL, NULL, 2);
INSERT INTO `business_service_category` VALUES (3, 'wx3', 'http55', 0, '2019-04-22 15:45:03', '2019-04-22 15:45:03', 101, 2, 5, NULL, 1, 2, NULL, NULL, 2);
INSERT INTO `business_service_category` VALUES (4, 'wx4', 'http55', 0, '2019-04-22 16:14:22', '2019-04-22 16:14:22', 101, 2, 6, NULL, 1, 2, NULL, NULL, 2);
INSERT INTO `business_service_category` VALUES (5, 'wx5', 'http55', 0, '2019-04-22 16:17:44', '2019-04-22 16:17:44', 101, 2, 0, NULL, 1, 1, NULL, NULL, 2);
INSERT INTO `business_service_category` VALUES (6, 'zcy6', 'http55', 0, '2019-04-22 16:18:38', '2019-04-22 16:18:38', 101, 2, 0, NULL, 1, 1, NULL, NULL, 2);
INSERT INTO `business_service_category` VALUES (7, 'zcy7', 'http55', 0, '2019-04-22 16:19:02', '2019-04-22 16:19:02', 101, 2, 4, NULL, 1, 2, NULL, NULL, 2);
INSERT INTO `business_service_category` VALUES (8, 'zcy8', 'h', 0, '2019-04-23 15:06:40', '2019-04-23 15:06:40', 101, 2, 6, NULL, 1, 2, NULL, NULL, 2);
INSERT INTO `business_service_category` VALUES (9, '9', NULL, 0, '2019-04-23 15:06:56', '2019-04-23 15:06:56', 101, 2, 6, NULL, 1, 2, NULL, NULL, 2);

-- ----------------------------
-- Table structure for business_service_category_banner
-- ----------------------------
DROP TABLE IF EXISTS `business_service_category_banner`;
CREATE TABLE `business_service_category_banner`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `banner` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `seller_id` int(11) NULL DEFAULT NULL,
  `uid` int(11) NULL DEFAULT NULL,
  `creatTime` datetime(0) NULL DEFAULT NULL,
  `nowTime` datetime(0) NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` int(3) NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cid` int(11) NULL DEFAULT NULL COMMENT '对应category的ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `seller_id`(`seller_id`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for contract
-- ----------------------------
DROP TABLE IF EXISTS `contract`;
CREATE TABLE `contract`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contract_sn` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合同编号',
  `follow_man` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '跟进人',
  `tenant` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '租客',
  `industry` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '行业',
  `legal_person` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '法人',
  `id_number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证',
  `tenant_contact` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '租客联系人',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remarks` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `housing_id` int(10) NULL DEFAULT NULL,
  `uid` int(10) NULL DEFAULT NULL,
  `seller_id` int(10) NULL DEFAULT NULL,
  `creatTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `nowTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `startTime` datetime(0) NULL DEFAULT NULL,
  `endTime` datetime(0) NULL DEFAULT NULL,
  `building_id` int(10) NULL DEFAULT NULL,
  `is_delete` tinyint(1) NULL DEFAULT 0,
  `warningDay` int(3) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of contract
-- ----------------------------
INSERT INTO `contract` VALUES (1, '11455sdf', '张陈奕', '科技有限公司', '科技', '法人', '330724199103240012', '张陈奕', '18257990958', NULL, 1, 101, 2, '2019-04-25 14:39:21', '2019-04-25 14:39:21', NULL, NULL, 3, 0, 0);
INSERT INTO `contract` VALUES (2, '11455sdf', '张陈奕', '科技有限公司', '科技', '法人', '330724199103240012', '张陈奕', '18257990958', NULL, 2, 101, 2, '2019-04-25 14:44:06', '2019-04-26 11:08:24', '2019-04-26 09:00:00', '2020-04-27 09:00:00', 3, 0, 0);
INSERT INTO `contract` VALUES (3, '11455sdf', '张陈奕', '科技有限公司', '科技', '法人', '330724199103240012', '张陈奕', '18257990958', NULL, 1, 101, 2, '2019-04-25 14:49:17', '2019-04-25 14:49:17', NULL, NULL, 3, 0, 0);
INSERT INTO `contract` VALUES (4, '11455sdf', '张陈奕', '科技有限公司', '科技', '法人', '330724199103240012', '张陈奕', '18257990958', NULL, 1, 101, 2, '2019-04-25 14:49:43', '2019-04-25 14:49:43', NULL, NULL, 3, 0, 0);
INSERT INTO `contract` VALUES (5, '11455sdf', '张陈奕', '科技有限公司', '科技', '法人', '330724199103240012', '张陈奕', '18257990958', NULL, 1, 101, 2, '2019-04-25 14:50:25', '2019-04-25 14:50:25', NULL, NULL, 3, 0, 0);
INSERT INTO `contract` VALUES (6, '11455sdf', '张陈奕', '科技有限公司', '科技', '法人', '330724199103240012', '张陈奕', '18257990958', NULL, 1, 101, 2, '2019-04-25 14:52:03', '2019-04-25 14:52:03', NULL, NULL, 3, 0, 0);
INSERT INTO `contract` VALUES (7, '11455sdf', '张陈奕', '科技有限公司', '科技', '法人', '330724199103240012', '张陈奕', '18257990958', NULL, 1, 101, 2, '2019-04-25 14:52:54', '2019-04-25 14:52:54', NULL, NULL, 3, 0, 0);
INSERT INTO `contract` VALUES (8, '11455sdf', '张陈奕', '科技有限公司', '科技', '法人', '330724199103240012', '张陈奕', '18257990958', NULL, 1, 101, 2, '2019-04-25 15:06:15', '2019-04-25 15:06:15', NULL, NULL, 3, 0, 0);
INSERT INTO `contract` VALUES (9, '11455sdf', '张陈奕', '科技有限公司', '科技', '法人', '330724199103240012', '张陈奕', '18257990958', NULL, 1, 101, 2, '2019-04-25 15:06:32', '2019-04-25 15:06:32', NULL, NULL, 3, 0, 0);
INSERT INTO `contract` VALUES (10, '11455sdf', '张陈奕', '科技有限公司', '科技', '法人', '330724199103240012', '张陈奕', '18257990958', NULL, 1, 101, 2, '2019-04-25 15:08:35', '2019-04-25 15:08:35', NULL, NULL, 3, 0, 0);
INSERT INTO `contract` VALUES (11, '11455sdf', '张陈奕', '科技有限公司', '科技', '法人', '330724199103240012', '张陈奕', '18257990958', NULL, 1, 101, 2, '2019-04-25 15:08:38', '2019-04-25 15:08:38', NULL, NULL, 3, 0, 0);
INSERT INTO `contract` VALUES (12, '11455sdf', '张陈奕', '科技有限公司', '科技', '法人', '330724199103240012', '张陈奕', '18257990958', NULL, NULL, 101, 2, '2019-04-26 09:29:59', '2019-04-26 09:29:59', NULL, NULL, NULL, 0, 0);
INSERT INTO `contract` VALUES (13, '11455sdf', '张陈奕', '科技有限公司', '科技', '法人', '330724199103240012', '张陈奕', '18257990958', NULL, 2, 101, 2, '2019-04-26 09:42:56', '2019-04-26 09:42:56', NULL, NULL, NULL, 0, 0);
INSERT INTO `contract` VALUES (14, '11455sdf', '张陈奕', '科技有限公司', '科技', '法人', '330724199103240012', '张陈奕', '18257990958', NULL, 2, 101, 2, '2019-04-26 09:44:50', '2019-04-26 09:44:50', NULL, NULL, NULL, 0, 0);
INSERT INTO `contract` VALUES (15, '11455sdf', '张陈奕', '科技有限公司', '科技', '法人', '330724199103240012', '张陈奕', '18257990958', NULL, 2, 101, 2, '2019-04-26 09:45:20', '2019-04-26 09:45:20', NULL, NULL, NULL, 0, 0);
INSERT INTO `contract` VALUES (16, '11455sdf', '张陈奕', '科技有限公司', '科技', '法人', '330724199103240012', '张陈奕', '18257990958', NULL, 2, 101, 2, '2019-04-26 09:47:19', '2019-04-26 09:47:19', NULL, NULL, NULL, 0, 0);
INSERT INTO `contract` VALUES (17, '11455sdf', '张陈奕', '科技有限公司', '科技', '法人', '330724199103240012', '张陈奕', '18257990958', NULL, 2, 101, 2, '2019-04-26 09:47:43', '2019-04-26 09:47:43', NULL, NULL, NULL, 0, 0);
INSERT INTO `contract` VALUES (18, '11455sdf', '张陈奕', '科技有限公司', '科技', '法人', '330724199103240012', '张陈奕', '18257990958', NULL, 2, 101, 2, '2019-04-26 09:48:12', '2019-04-26 09:48:12', NULL, NULL, 3, 0, 0);
INSERT INTO `contract` VALUES (19, '11455sdf', '张陈奕', '科技有限公司', '科技', '法人', '330724199103240012', '张陈奕', '18257990958', NULL, 2, 101, 2, '2019-04-26 09:59:04', '2019-04-26 09:59:04', NULL, NULL, 3, 0, 0);
INSERT INTO `contract` VALUES (20, '11455sdf', '张陈奕', '科技有限公司', '科技', '法人', '330724199103240012', '张陈奕', '18257990958', NULL, 2, 101, 2, '2019-04-26 10:00:01', '2019-04-26 10:00:01', NULL, NULL, 3, 0, 0);
INSERT INTO `contract` VALUES (21, '11455sdf', '张陈奕', '科技有限公司', '科技', '法人', '330724199103240012', '张陈奕', '18257990958', NULL, 2, 101, 2, '2019-04-26 10:01:07', '2019-04-26 16:36:19', '2019-04-26 09:00:00', '2021-04-27 09:00:00', 3, 0, 0);
INSERT INTO `contract` VALUES (22, '11455sdf', '张陈奕', '科技有限公司', '科技', '法人', '330724199103240012', '张陈奕', '18257990958', NULL, 2, 101, 2, '2019-04-26 10:02:00', '2019-04-26 10:02:00', '2019-04-26 09:00:00', '2020-04-27 09:00:00', 3, 0, 0);
INSERT INTO `contract` VALUES (23, '11455sdf', '张陈奕', '科技有限公司', '科技', '法人', '330724199103240012', '张陈奕', '18257990958', NULL, 2, 101, 2, '2019-04-26 10:19:37', '2019-04-26 10:19:38', '2019-04-26 09:00:00', '2020-04-27 09:00:00', 3, 0, 0);
INSERT INTO `contract` VALUES (24, '11455sdf', '张陈奕', '科技有限公司', '科技', '法人', '330724199103240012', '张陈奕', '18257990958', NULL, 2, 101, 2, '2019-04-26 10:39:35', '2019-04-26 10:39:35', '2019-04-26 09:00:00', '2020-04-27 09:00:00', 3, 0, 1);
INSERT INTO `contract` VALUES (25, '11455sdf', '张陈奕', '科技有限公司', '科技', '法人', '330724199103240012', '张陈奕', '18257990958', NULL, 1, 101, 2, '2019-04-26 10:53:46', '2019-04-26 10:53:46', '2019-04-26 09:00:00', '2020-04-27 09:00:00', 3, 0, 1);
INSERT INTO `contract` VALUES (26, '11455sdf', '张陈奕', '科技有限公司', '科技', '法人', '330724199103240012', '张陈奕', '18257990958', NULL, 1, 101, 2, '2019-04-26 10:54:20', '2019-04-26 10:54:20', '2019-04-26 09:00:00', '2020-04-27 09:00:00', 3, 0, 1);
INSERT INTO `contract` VALUES (27, '11455sdf', '张陈奕', '科技有限公司', '科技', '法人', '330724199103240012', '张陈奕', '18257990958', NULL, 1, 101, 2, '2019-04-26 10:54:27', '2019-04-26 10:54:27', '2019-04-26 09:00:00', '2020-04-27 09:00:00', 3, 0, 1);
INSERT INTO `contract` VALUES (28, '11455sdf', '张陈奕', '科技有限公司', '科技', '法人', '330724199103240012', '张陈奕', '18257990958', NULL, 1, 101, 2, '2019-04-26 10:54:32', '2019-04-26 10:54:32', '2019-04-26 09:00:00', '2020-04-27 09:00:00', 3, 0, 1);
INSERT INTO `contract` VALUES (29, '11455sdf', '张陈奕', '科技有限公司', '科技', '法人', '330724199103240012', '张陈奕', '18257990958', NULL, 1, 101, 2, '2019-04-26 10:59:35', '2019-04-26 10:59:35', '2019-04-26 09:00:00', '2020-04-27 09:00:00', 3, 0, 1);
INSERT INTO `contract` VALUES (30, '11455sdf', '张陈奕', '科技有限公司', '科技', '法人', '330724199103240012', '张陈奕', '18257990958', NULL, 3, 101, 2, '2019-04-26 11:10:18', '2019-04-26 11:10:40', '2019-04-26 09:00:00', '2020-04-27 09:00:00', 3, 0, 1);
INSERT INTO `contract` VALUES (31, '11455sdf', '张陈奕', '科技有限公司', '科技', '法人', '330724199103240012', '张陈奕', '18257990958', NULL, 3, 101, 2, '2019-04-26 11:13:15', '2019-04-26 14:45:24', '2019-04-26 09:00:00', '2021-04-27 09:00:00', 3, 0, 1);
INSERT INTO `contract` VALUES (32, '11455sdf', '张陈奕', '科技有限公司', '科技', '法人', '330724199103240012', '张陈奕', '18257990958', NULL, 2, 101, 2, '2019-04-26 11:16:47', '2019-04-26 14:27:08', '2019-04-26 09:00:00', '2021-04-27 09:00:00', 3, 0, 1);
INSERT INTO `contract` VALUES (34, '11455sdf', '张陈奕', '科技有限公司', '科技', '法人', '330724199103240012', '张陈奕', '18257990958', NULL, 3, 101, 2, '2019-04-26 13:35:41', '2019-04-26 13:35:41', '2019-04-26 09:00:00', '2021-04-27 09:00:00', 3, 0, 1);
INSERT INTO `contract` VALUES (35, '11455sdf', '张陈奕', '科技有限公司', '科技', '法人', '330724199103240012', '张陈奕', '18257990958', NULL, 3, 101, 2, '2019-04-26 13:36:20', '2019-04-26 13:36:20', '2019-04-26 09:00:00', '2021-04-27 09:00:00', 3, 0, 1);
INSERT INTO `contract` VALUES (36, '11455sdf', '张陈奕', '科技有限公司', '科技', '法人', '330724199103240012', '张陈奕', '18257990958', NULL, 3, 101, 2, '2019-04-27 09:01:53', '2019-04-27 09:01:53', '2019-04-26 09:00:00', '2021-04-27 09:00:00', 3, 0, 1);
INSERT INTO `contract` VALUES (38, '11455sdf', '张陈奕', '科技有限公司', '科技', '法人', '330724199103240012', '张陈奕', '18257990958', NULL, 3, 101, 2, '2019-04-27 09:19:04', '2019-04-27 09:19:04', '2019-04-26 09:00:00', '2021-04-27 09:00:00', 3, 0, 1);
INSERT INTO `contract` VALUES (39, '11455sdf', '张陈奕', '科技有限公司', '科技', '法人', '330724199103240012', '张陈奕', '18257990958', NULL, 3, 101, 2, '2019-04-27 09:23:03', '2019-04-27 09:23:03', '2019-04-26 09:00:00', '2021-04-27 09:00:00', 3, 0, 1);
INSERT INTO `contract` VALUES (40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-27 13:32:53', '2019-04-27 13:32:53', NULL, NULL, NULL, 0, 1);

-- ----------------------------
-- Table structure for cost
-- ----------------------------
DROP TABLE IF EXISTS `cost`;
CREATE TABLE `cost`  (
  `cost_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remarks` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `payTime` datetime(0) NULL DEFAULT NULL,
  `uid` int(10) NULL DEFAULT NULL,
  `seller_id` int(10) NULL DEFAULT NULL,
  `creatTime` datetime(0) NULL DEFAULT NULL,
  `nowTime` datetime(0) NULL DEFAULT NULL,
  `contract_id` int(10) NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT 0.00,
  `is_delete` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`cost_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cost
-- ----------------------------
INSERT INTO `cost` VALUES (1, '定金1', '11', 'image', '2019-07-20 00:00:00', 101, 2, '2019-04-27 09:19:04', NULL, 38, 1000.00, 0);
INSERT INTO `cost` VALUES (2, '定金1', '11', 'image', '2019-07-20 00:00:00', 101, 2, '2019-04-27 09:23:03', NULL, 39, 500.00, 1);
INSERT INTO `cost` VALUES (3, '尾款', '11', 'image', '2019-07-20 00:00:00', 101, 2, '2019-04-27 09:19:04', '0000-00-00 00:00:00', 38, 50000.00, 0);
INSERT INTO `cost` VALUES (4, '尾款', '', '', '2019-04-27 00:00:00', NULL, NULL, NULL, NULL, 38, 1000.00, 0);
INSERT INTO `cost` VALUES (5, '尾款', '', '', '2019-04-27 00:00:00', 101, 2, '2019-04-27 00:00:00', NULL, 38, 1000.00, 0);
INSERT INTO `cost` VALUES (6, '尾款', '', '', '2019-04-27 00:00:00', 101, 2, '2019-04-27 00:00:00', NULL, 38, 1000.00, 0);

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `industry` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '行业',
  `type` int(1) NULL DEFAULT 1 COMMENT '客户状态',
  `channels` int(1) NULL DEFAULT NULL COMMENT '来访渠道',
  `area` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '需求面积',
  `visitingTime` datetime(0) NULL DEFAULT NULL COMMENT '来访时间',
  `contact` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remarks` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '社会信用代码',
  `taxpayer_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '纳税人识别码',
  `registration_num` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册号',
  `organizational_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织机构代码',
  `legal_person` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '法人',
  `registered_capital` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册资本',
  `company_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `personnel_scale` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '人员规模',
  `operating_period` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经营期限',
  `approval_date` datetime(0) NULL DEFAULT NULL COMMENT '核准日期',
  `business_industry` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属行业',
  `registered_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册地址',
  `business_scope` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '经营范围',
  `other` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '其他信息',
  `uid` int(10) NULL DEFAULT NULL,
  `seller_id` int(10) NULL DEFAULT NULL,
  `creatTime` datetime(0) NULL DEFAULT NULL,
  `nowTime` datetime(0) NULL DEFAULT NULL,
  `is_delete` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (1, '张陈奕1', '科技', 1, 2, '500', '2019-04-27 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', 101, 2, '2019-04-27 16:21:40', '2019-04-28 11:10:14', 0);
INSERT INTO `customer` VALUES (2, '张陈奕', '科技', 1, 2, '500', '2019-04-27 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', 101, 2, '2019-04-28 10:31:34', NULL, 0);
INSERT INTO `customer` VALUES (10, '张陈奕', '科技', 1, 2, '500', '2019-04-27 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', 101, 2, '2019-04-28 10:36:51', NULL, 0);
INSERT INTO `customer` VALUES (20, '张陈奕', '科技', 1, 2, '500', '2019-04-27 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', 101, 2, '2019-04-28 10:40:09', NULL, 0);
INSERT INTO `customer` VALUES (21, '张陈奕', '科技', 1, 2, '500', '2019-04-27 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', 101, 2, '2019-04-28 10:44:39', NULL, 0);
INSERT INTO `customer` VALUES (22, '张陈奕', '科技', 1, 2, '500', '2019-04-27 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', 101, 2, '2019-04-28 10:55:52', NULL, 0);
INSERT INTO `customer` VALUES (23, '张陈奕', '科技', 1, 2, '500', '2019-04-27 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', 101, 2, '2019-04-28 10:56:10', NULL, 0);
INSERT INTO `customer` VALUES (24, '张陈奕55', '科技', 1, 2, '500', '2019-04-27 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', 101, 2, '2019-04-28 10:57:56', '2019-04-28 11:10:53', 1);

-- ----------------------------
-- Table structure for customer_channel
-- ----------------------------
DROP TABLE IF EXISTS `customer_channel`;
CREATE TABLE `customer_channel`  (
  `channel_id` int(1) NOT NULL,
  `channel_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`channel_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of customer_channel
-- ----------------------------
INSERT INTO `customer_channel` VALUES (1, '上门');
INSERT INTO `customer_channel` VALUES (2, '电话');
INSERT INTO `customer_channel` VALUES (3, '网络');
INSERT INTO `customer_channel` VALUES (4, '业务员拓展');
INSERT INTO `customer_channel` VALUES (5, '老客户介绍');
INSERT INTO `customer_channel` VALUES (6, '政府关系');
INSERT INTO `customer_channel` VALUES (7, '股东关系');
INSERT INTO `customer_channel` VALUES (8, '同行介绍');

-- ----------------------------
-- Table structure for customer_type
-- ----------------------------
DROP TABLE IF EXISTS `customer_type`;
CREATE TABLE `customer_type`  (
  `type_id` int(1) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of customer_type
-- ----------------------------
INSERT INTO `customer_type` VALUES (1, '初次接触');
INSERT INTO `customer_type` VALUES (2, '潜在客户');
INSERT INTO `customer_type` VALUES (3, '意向客户');
INSERT INTO `customer_type` VALUES (4, '成交客户');
INSERT INTO `customer_type` VALUES (5, '流失客户');

-- ----------------------------
-- Table structure for decoration_status
-- ----------------------------
DROP TABLE IF EXISTS `decoration_status`;
CREATE TABLE `decoration_status`  (
  `decoration_id` int(2) NOT NULL AUTO_INCREMENT,
  `decoration_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`decoration_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of decoration_status
-- ----------------------------
INSERT INTO `decoration_status` VALUES (1, '毛坯');
INSERT INTO `decoration_status` VALUES (2, '简装');
INSERT INTO `decoration_status` VALUES (3, '精装');

-- ----------------------------
-- Table structure for handle
-- ----------------------------
DROP TABLE IF EXISTS `handle`;
CREATE TABLE `handle`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `rid` int(10) NULL DEFAULT NULL COMMENT '对应repair的id',
  `status` int(2) NULL DEFAULT 1 COMMENT '处理状态',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理人',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remarks` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `creatTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `nowTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `uid` int(10) NULL DEFAULT NULL,
  `seller_id` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for handle_status
-- ----------------------------
DROP TABLE IF EXISTS `handle_status`;
CREATE TABLE `handle_status`  (
  `handle_id` int(10) NOT NULL AUTO_INCREMENT,
  `handle_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`handle_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of handle_status
-- ----------------------------
INSERT INTO `handle_status` VALUES (1, '未处理');
INSERT INTO `handle_status` VALUES (2, '处理中');
INSERT INTO `handle_status` VALUES (3, '已处理');

-- ----------------------------
-- Table structure for housing
-- ----------------------------
DROP TABLE IF EXISTS `housing`;
CREATE TABLE `housing`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `building_id` int(10) NOT NULL,
  `floor` int(3) NULL DEFAULT 1 COMMENT '所在楼层',
  `unit_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单元号',
  `room_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房号',
  `area` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `decoration_status` int(2) NULL DEFAULT 1 COMMENT '装修状态',
  `investment_status` int(2) NULL DEFAULT 1 COMMENT '招商状态',
  `unit_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '预租单价',
  `unit_unit` int(2) NULL DEFAULT 1 COMMENT '预租价格单位:元/m2.月，元/m2.天，元/月，元/天',
  `remarks` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `uid` int(10) NULL DEFAULT NULL,
  `seller_id` int(10) NULL DEFAULT NULL,
  `creatTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `nowTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `is_delete` tinyint(1) NULL DEFAULT 0,
  `is_use` int(1) NULL DEFAULT 0 COMMENT '是否出租',
  `endTime` datetime(0) NULL DEFAULT NULL,
  `warningDay` int(3) NULL DEFAULT 1 COMMENT '预警天数',
  `contract_id` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `building_id`(`building_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of housing
-- ----------------------------
INSERT INTO `housing` VALUES (1, 3, 2, '201', '201-111', '500', 1, 1, 100.00, 1, '', 101, 2, '2019-04-25 10:49:05', '2019-04-25 11:27:08', 0, 1, '2020-04-27 09:00:00', 1, 29);
INSERT INTO `housing` VALUES (2, 3, 2, '201', '201-111', '500', 1, 1, 100.00, 1, '', 101, 2, '2019-04-25 12:26:36', '2019-04-25 12:26:36', 0, 1, '2021-04-27 09:00:00', 1, 21);
INSERT INTO `housing` VALUES (3, 3, 2, '201', '201-111', '500', 1, 1, 100.00, 1, '', 101, 2, '2019-04-25 12:26:36', '2019-04-25 12:26:36', 0, 1, '2021-04-27 09:00:00', 1, 39);

-- ----------------------------
-- Table structure for housing_unit
-- ----------------------------
DROP TABLE IF EXISTS `housing_unit`;
CREATE TABLE `housing_unit`  (
  `unit_id` int(3) NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`unit_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of housing_unit
-- ----------------------------
INSERT INTO `housing_unit` VALUES (1, '元/m2.月');
INSERT INTO `housing_unit` VALUES (2, '元/m2.天');
INSERT INTO `housing_unit` VALUES (3, '元/月');
INSERT INTO `housing_unit` VALUES (4, '元/天');

-- ----------------------------
-- Table structure for investment_status
-- ----------------------------
DROP TABLE IF EXISTS `investment_status`;
CREATE TABLE `investment_status`  (
  `investment_id` int(2) NOT NULL AUTO_INCREMENT,
  `investment_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`investment_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of investment_status
-- ----------------------------
INSERT INTO `investment_status` VALUES (1, '不可招商');
INSERT INTO `investment_status` VALUES (2, '可招商');

-- ----------------------------
-- Table structure for repair
-- ----------------------------
DROP TABLE IF EXISTS `repair`;
CREATE TABLE `repair`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` int(2) NOT NULL DEFAULT 1 COMMENT '保修类型',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `source` int(2) NOT NULL DEFAULT 1 COMMENT '来源',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contacts` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `urgency` int(2) NULL DEFAULT 1 COMMENT '紧急程度',
  `detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '详细描述',
  `job_sn` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工单号',
  `status` int(2) NULL DEFAULT 1 COMMENT '处理状态',
  `handler` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理人',
  `seller_id` int(10) NULL DEFAULT NULL,
  `uid` int(10) NULL DEFAULT NULL,
  `creatTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `nowTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `handleTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `handle_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remarks` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '处理备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of repair
-- ----------------------------
INSERT INTO `repair` VALUES (2, 1, '义乌', 1, '18257990958', '联系人', 1, '详情', '', 1, '王欣', 2, 101, '2019-04-24 10:02:46', '2019-04-24 10:50:57', '2019-04-24 10:50:10', '18357991416', '');

-- ----------------------------
-- Table structure for repair_source
-- ----------------------------
DROP TABLE IF EXISTS `repair_source`;
CREATE TABLE `repair_source`  (
  `source_id` int(2) NOT NULL AUTO_INCREMENT,
  `source_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`source_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of repair_source
-- ----------------------------
INSERT INTO `repair_source` VALUES (1, '电话');
INSERT INTO `repair_source` VALUES (2, '网上');
INSERT INTO `repair_source` VALUES (3, '来访');
INSERT INTO `repair_source` VALUES (4, '其他');

-- ----------------------------
-- Table structure for repair_type
-- ----------------------------
DROP TABLE IF EXISTS `repair_type`;
CREATE TABLE `repair_type`  (
  `type_id` int(2) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of repair_type
-- ----------------------------
INSERT INTO `repair_type` VALUES (1, '报修');
INSERT INTO `repair_type` VALUES (2, '报事');

-- ----------------------------
-- Table structure for repair_urgency
-- ----------------------------
DROP TABLE IF EXISTS `repair_urgency`;
CREATE TABLE `repair_urgency`  (
  `urgency_id` int(2) NOT NULL AUTO_INCREMENT,
  `urgency_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`urgency_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of repair_urgency
-- ----------------------------
INSERT INTO `repair_urgency` VALUES (1, '一般');
INSERT INTO `repair_urgency` VALUES (2, '紧急');

-- ----------------------------
-- Table structure for right_base
-- ----------------------------
DROP TABLE IF EXISTS `right_base`;
CREATE TABLE `right_base`  (
  `id` int(11) NOT NULL,
  `dnames` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `router` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由',
  `action` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `display` tinyint(4) NOT NULL,
  `moduleId` int(11) UNSIGNED NOT NULL,
  `sort` int(10) UNSIGNED NULL DEFAULT 9999999,
  `attribute` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '属性归属',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of right_base
-- ----------------------------
INSERT INTO `right_base` VALUES (1, '贷款商品列表', 'product', 'lists', 1, 1, 1, 'goods');
INSERT INTO `right_base` VALUES (2, '新增贷款商品', 'product_add_or_edit', 'add', 1, 1, 2, 'goods');
INSERT INTO `right_base` VALUES (3, '贷款类别管理', 'products_categories', 'lists', 1, 1, 3, 'cate');
INSERT INTO `right_base` VALUES (4, '贷款资料管理', 'products_materials', 'lists', 1, 1, 4, 'attr');
INSERT INTO `right_base` VALUES (5, '删除商品', 'delete', 'delete', 0, 1, 100, 'goods');
INSERT INTO `right_base` VALUES (6, '编辑商品', 'product_add_or_edit', 'edit', 0, 1, 100, 'goods');
INSERT INTO `right_base` VALUES (7, '所有订单管理', 'orders_all', 'fetchs', 1, 2, 1, 'loanOrder');
INSERT INTO `right_base` VALUES (8, '岗位管理', 'authority_position', 'lists', 1, 3, 1, 'position');
INSERT INTO `right_base` VALUES (9, '添加岗位', 'authority_position_add_or_edit', 'add', 0, 3, 100, 'position');
INSERT INTO `right_base` VALUES (10, '修改岗位', 'authority_position_add_or_edit', 'edit', 0, 3, 100, 'position');
INSERT INTO `right_base` VALUES (11, '删除岗位', 'delete', 'delete', 0, 3, 100, 'position');
INSERT INTO `right_base` VALUES (12, '部门管理', 'authority_department', 'lists', 1, 3, 5, 'deparment');
INSERT INTO `right_base` VALUES (13, '添加部门', 'add', 'add', 0, 3, 100, 'deparment');
INSERT INTO `right_base` VALUES (14, '修改部门', 'edit', 'edit', 0, 3, 100, 'deparment');
INSERT INTO `right_base` VALUES (15, '删除部门', 'delete', 'delete', 0, 3, 100, 'deparment');
INSERT INTO `right_base` VALUES (16, '员工管理', 'authority_employees', 'lists', 1, 3, 9, 'staff');
INSERT INTO `right_base` VALUES (17, '添加员工', 'authority_employee_add_or_edit', 'add', 0, 3, 100, 'staff');
INSERT INTO `right_base` VALUES (18, '修改员工', 'authority_employee_add_or_edit', 'edit', 0, 3, 100, 'staff');
INSERT INTO `right_base` VALUES (19, '停用员工', 'delete', 'delete', 0, 3, 100, 'staff');
INSERT INTO `right_base` VALUES (20, '设置员工岗位', 'positionSet', 'positionSet', 0, 3, 100, 'staff');
INSERT INTO `right_base` VALUES (21, '添加贷款类别', 'add', 'add', 0, 1, 100, 'cate');
INSERT INTO `right_base` VALUES (22, '修改贷款类别', 'edit', 'edit', 0, 1, 100, 'cate');
INSERT INTO `right_base` VALUES (23, '删除贷款类别', 'delete', 'delete', 0, 1, 100, 'cate');
INSERT INTO `right_base` VALUES (24, '添加贷款资料', 'products_materials_add_or_edit', 'add', 0, 1, 100, 'attr');
INSERT INTO `right_base` VALUES (25, '修改贷款资料', 'products_materials_add_or_edit', 'edit', 0, 1, 100, 'attr');
INSERT INTO `right_base` VALUES (26, '删除贷款资料', 'delete', 'delete', 0, 1, 100, 'attr');
INSERT INTO `right_base` VALUES (27, '上下架商品', 'setvisible', 'setvisible', 0, 1, 100, 'goods');
INSERT INTO `right_base` VALUES (28, '审核通过', 'check', 'check', 0, 2, 100, 'checkOrder');
INSERT INTO `right_base` VALUES (29, '审核拒绝', 'uncheck', 'uncheck', 0, 2, 100, 'checkOrder');
INSERT INTO `right_base` VALUES (31, '风控订单管理', 'orders_verify', NULL, 1, 2, 3, 'checkOrder');
INSERT INTO `right_base` VALUES (32, '签约订单管理', 'orders_assignment', NULL, 1, 2, 4, 'signOrder');
INSERT INTO `right_base` VALUES (33, '回款订单管理', 'orders_refund', NULL, 1, 2, 5, 'paybackOrder');
INSERT INTO `right_base` VALUES (34, '贷款商品佣金设置管理', 'brokerage', NULL, 1, 4, 1, 'brokerage');
INSERT INTO `right_base` VALUES (35, '设置佣金', NULL, 'edit', 0, 4, 100, 'brokerage');
INSERT INTO `right_base` VALUES (36, '贷款业绩统计管理', 'statistical_loan', NULL, 1, 5, 1, 'report');
INSERT INTO `right_base` VALUES (37, '贷款商品列表', 'product', 'lists', 1, 1, 1, 'goods');
INSERT INTO `right_base` VALUES (38, '贷款类别管理', 'products_categories', 'lists', 1, 1, 3, 'cate');
INSERT INTO `right_base` VALUES (39, '贷款资料管理', 'products_materials', 'lists', 1, 1, 4, 'attr');
INSERT INTO `right_base` VALUES (40, '申请贷款订单管理', 'orders_all', 'fetchs', 1, 2, 1, 'loanOrder');
INSERT INTO `right_base` VALUES (41, '风控订单列表', 'orders_verify', '', 1, 2, 3, 'checkOrder');
INSERT INTO `right_base` VALUES (42, '签约订单列表', 'orders_assignment', '', 1, 2, 4, 'signOrder');
INSERT INTO `right_base` VALUES (43, '回款订单列表', 'orders_refund', '', 1, 2, 5, 'paybackOrder');
INSERT INTO `right_base` VALUES (45, '岗位列表', 'authority_position', 'lists', 1, 3, 1, 'position');
INSERT INTO `right_base` VALUES (46, '部门列表', 'authority_department', 'lists', 1, 3, 5, 'deparment');
INSERT INTO `right_base` VALUES (47, '员工列表', 'authority_employees', 'lists', 1, 3, 9, 'staff');
INSERT INTO `right_base` VALUES (48, '贷款商品佣金设置', 'brokerage', '', 1, 4, 1, 'brokerage');
INSERT INTO `right_base` VALUES (49, '贷款业绩统计', 'statistical_loan', '', 1, 5, 1, 'report');
INSERT INTO `right_base` VALUES (50, '确定签约', 'sign_check', 'sign_check', 0, 2, 5, 'signOrder');
INSERT INTO `right_base` VALUES (51, '签约驳回', 'sign_uncheck', 'sign_uncheck', 0, 2, 6, 'signOrder');
INSERT INTO `right_base` VALUES (52, '确认回款', 'payback_check', 'payback_check', 0, 2, 7, 'paybackOrder');
INSERT INTO `right_base` VALUES (53, '延期申请', 'payback_uncheck', 'payback_uncheck', 0, 2, 8, 'paybackOrder');

-- ----------------------------
-- Table structure for right_module
-- ----------------------------
DROP TABLE IF EXISTS `right_module`;
CREATE TABLE `right_module`  (
  `id` int(11) NOT NULL,
  `dnames` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `display` tinyint(4) NOT NULL,
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模块图标',
  `router` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of right_module
-- ----------------------------
INSERT INTO `right_module` VALUES (1, '贷款产品管理', 1, 'shop', 'product');
INSERT INTO `right_module` VALUES (2, '贷款订单管理', 1, 'subscriptions', 'order');
INSERT INTO `right_module` VALUES (3, '权限管理', 1, 'vpn_key', 'power');
INSERT INTO `right_module` VALUES (4, '佣金管理', 1, 'monetization_on', 'commission');
INSERT INTO `right_module` VALUES (5, '报表统计', 1, 'insert_chart', 'report');

-- ----------------------------
-- Table structure for right_post
-- ----------------------------
DROP TABLE IF EXISTS `right_post`;
CREATE TABLE `right_post`  (
  `id` int(11) UNSIGNED NOT NULL,
  `dnames` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `display` tinyint(4) NOT NULL,
  `deleted` tinyint(4) NOT NULL,
  `seller_id` int(11) UNSIGNED NOT NULL COMMENT '客户序号',
  `sectionName` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '部门名称：多部门用，分开',
  `nowTime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_seller`(`seller_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of right_post
-- ----------------------------
INSERT INTO `right_post` VALUES (1, '业务员', 1, 0, 2, '业务部，', '2019-04-12 12:47:15');
INSERT INTO `right_post` VALUES (2, '财务', 0, 0, 2, '财务部，风控部，', '2019-04-15 16:03:23');
INSERT INTO `right_post` VALUES (3, '风控', 1, 0, 2, '业务部，业务部22，', '2019-04-13 09:25:36');
INSERT INTO `right_post` VALUES (4, '操作员', 1, 0, 2, '技术部，', '2019-04-12 12:50:31');

-- ----------------------------
-- Table structure for right_post_base
-- ----------------------------
DROP TABLE IF EXISTS `right_post_base`;
CREATE TABLE `right_post_base`  (
  `id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) UNSIGNED NOT NULL,
  `postId` int(11) UNSIGNED NOT NULL,
  `moduleId` int(11) UNSIGNED NOT NULL,
  `baseId` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_post`(`seller_id`, `postId`) USING BTREE,
  INDEX `index_module`(`seller_id`, `moduleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 186 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of right_post_base
-- ----------------------------
INSERT INTO `right_post_base` VALUES (00000000116, 2, 1, 2, 40);
INSERT INTO `right_post_base` VALUES (00000000149, 2, 4, 1, 37);
INSERT INTO `right_post_base` VALUES (00000000150, 2, 4, 1, 2);
INSERT INTO `right_post_base` VALUES (00000000151, 2, 4, 1, 5);
INSERT INTO `right_post_base` VALUES (00000000152, 2, 4, 1, 6);
INSERT INTO `right_post_base` VALUES (00000000153, 2, 4, 1, 27);
INSERT INTO `right_post_base` VALUES (00000000154, 2, 4, 1, 38);
INSERT INTO `right_post_base` VALUES (00000000155, 2, 4, 1, 21);
INSERT INTO `right_post_base` VALUES (00000000156, 2, 4, 1, 22);
INSERT INTO `right_post_base` VALUES (00000000157, 2, 4, 1, 23);
INSERT INTO `right_post_base` VALUES (00000000158, 2, 4, 1, 39);
INSERT INTO `right_post_base` VALUES (00000000159, 2, 4, 1, 24);
INSERT INTO `right_post_base` VALUES (00000000160, 2, 4, 1, 25);
INSERT INTO `right_post_base` VALUES (00000000161, 2, 4, 1, 26);
INSERT INTO `right_post_base` VALUES (00000000162, 2, 4, 1, 1);
INSERT INTO `right_post_base` VALUES (00000000163, 2, 4, 4, 48);
INSERT INTO `right_post_base` VALUES (00000000164, 2, 4, 4, 35);
INSERT INTO `right_post_base` VALUES (00000000165, 2, 4, 4, 4);
INSERT INTO `right_post_base` VALUES (00000000166, 2, 4, 3, 47);
INSERT INTO `right_post_base` VALUES (00000000167, 2, 4, 3, 17);
INSERT INTO `right_post_base` VALUES (00000000168, 2, 4, 3, 18);
INSERT INTO `right_post_base` VALUES (00000000169, 2, 4, 3, 19);
INSERT INTO `right_post_base` VALUES (00000000170, 2, 4, 3, 46);
INSERT INTO `right_post_base` VALUES (00000000171, 2, 4, 3, 13);
INSERT INTO `right_post_base` VALUES (00000000172, 2, 4, 3, 14);
INSERT INTO `right_post_base` VALUES (00000000173, 2, 4, 3, 15);
INSERT INTO `right_post_base` VALUES (00000000177, 2, 3, 2, 41);
INSERT INTO `right_post_base` VALUES (00000000178, 2, 3, 2, 28);
INSERT INTO `right_post_base` VALUES (00000000179, 2, 3, 2, 29);
INSERT INTO `right_post_base` VALUES (00000000180, 2, 2, 2, 42);
INSERT INTO `right_post_base` VALUES (00000000181, 2, 2, 2, 50);
INSERT INTO `right_post_base` VALUES (00000000182, 2, 2, 2, 51);
INSERT INTO `right_post_base` VALUES (00000000183, 2, 2, 2, 43);
INSERT INTO `right_post_base` VALUES (00000000184, 2, 2, 2, 52);
INSERT INTO `right_post_base` VALUES (00000000185, 2, 2, 2, 53);

-- ----------------------------
-- Table structure for right_post_module
-- ----------------------------
DROP TABLE IF EXISTS `right_post_module`;
CREATE TABLE `right_post_module`  (
  `id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) UNSIGNED NOT NULL,
  `postId` int(11) UNSIGNED NOT NULL,
  `moduleId` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_seller`(`seller_id`, `postId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of right_post_module
-- ----------------------------
INSERT INTO `right_post_module` VALUES (00000000021, 2, 1, 2);
INSERT INTO `right_post_module` VALUES (00000000028, 2, 4, 1);
INSERT INTO `right_post_module` VALUES (00000000029, 2, 4, 4);
INSERT INTO `right_post_module` VALUES (00000000030, 2, 4, 3);
INSERT INTO `right_post_module` VALUES (00000000032, 2, 3, 2);
INSERT INTO `right_post_module` VALUES (00000000033, 2, 2, 2);

-- ----------------------------
-- Table structure for right_post_operate
-- ----------------------------
DROP TABLE IF EXISTS `right_post_operate`;
CREATE TABLE `right_post_operate`  (
  `id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) UNSIGNED NOT NULL,
  `postId` int(11) UNSIGNED NOT NULL,
  `operate` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1:新建，2:修改 3：删除',
  `sectionId` int(11) UNSIGNED NOT NULL,
  `operateUid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `operateTime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of right_post_operate
-- ----------------------------
INSERT INTO `right_post_operate` VALUES (00000000025, 2, 1, 1, 0, 100, '2019-04-12 12:46:59');
INSERT INTO `right_post_operate` VALUES (00000000026, 2, 1, 2, 0, 100, '2019-04-12 12:47:15');
INSERT INTO `right_post_operate` VALUES (00000000027, 2, 2, 1, 0, 100, '2019-04-12 12:47:40');
INSERT INTO `right_post_operate` VALUES (00000000028, 2, 3, 1, 0, 100, '2019-04-12 12:48:18');
INSERT INTO `right_post_operate` VALUES (00000000029, 2, 2, 2, 0, 100, '2019-04-12 12:48:27');
INSERT INTO `right_post_operate` VALUES (00000000030, 2, 2, 2, 0, 100, '2019-04-12 12:48:36');
INSERT INTO `right_post_operate` VALUES (00000000031, 2, 4, 1, 0, 100, '2019-04-12 12:49:50');
INSERT INTO `right_post_operate` VALUES (00000000032, 2, 4, 2, 0, 100, '2019-04-12 12:50:31');
INSERT INTO `right_post_operate` VALUES (00000000033, 2, 3, 2, 0, 100, '2019-04-12 13:04:58');
INSERT INTO `right_post_operate` VALUES (00000000034, 2, 3, 2, 0, 100, '2019-04-13 09:25:36');
INSERT INTO `right_post_operate` VALUES (00000000035, 2, 2, 2, 0, 100, '2019-04-15 16:03:23');

-- ----------------------------
-- Table structure for right_post_section
-- ----------------------------
DROP TABLE IF EXISTS `right_post_section`;
CREATE TABLE `right_post_section`  (
  `id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) UNSIGNED NOT NULL,
  `postId` int(11) UNSIGNED NOT NULL,
  `sectionId` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_seller`(`seller_id`, `postId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of right_post_section
-- ----------------------------
INSERT INTO `right_post_section` VALUES (00000000031, 2, 1, 3);
INSERT INTO `right_post_section` VALUES (00000000038, 2, 4, 1);
INSERT INTO `right_post_section` VALUES (00000000040, 2, 3, 3);
INSERT INTO `right_post_section` VALUES (00000000041, 2, 3, 7);
INSERT INTO `right_post_section` VALUES (00000000042, 2, 2, 2);
INSERT INTO `right_post_section` VALUES (00000000043, 2, 2, 5);

-- ----------------------------
-- Table structure for right_post_user
-- ----------------------------
DROP TABLE IF EXISTS `right_post_user`;
CREATE TABLE `right_post_user`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) UNSIGNED NOT NULL,
  `postId` int(11) UNSIGNED NOT NULL,
  `userId` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of right_post_user
-- ----------------------------
INSERT INTO `right_post_user` VALUES (22, 2, 1, 7);
INSERT INTO `right_post_user` VALUES (23, 2, 3, 9);
INSERT INTO `right_post_user` VALUES (24, 2, 2, 10);
INSERT INTO `right_post_user` VALUES (26, 2, 3, 13);

-- ----------------------------
-- Table structure for right_section
-- ----------------------------
DROP TABLE IF EXISTS `right_section`;
CREATE TABLE `right_section`  (
  `id` int(11) NOT NULL,
  `dnames` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parentsPath` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dLevel` tinyint(11) NOT NULL,
  `sort` tinyint(4) NOT NULL,
  `creatTime` datetime(0) NULL DEFAULT NULL,
  `nowTime` datetime(0) NULL DEFAULT NULL,
  `seller_id` int(11) UNSIGNED NOT NULL,
  `parentId` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_dleve`(`seller_id`, `dLevel`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of right_section
-- ----------------------------
INSERT INTO `right_section` VALUES (1, '技术部', '0|1|', 1, 1, '2019-04-12 10:42:43', '2019-04-12 10:42:43', 2, 0);
INSERT INTO `right_section` VALUES (2, '财务部', '0|2|', 1, 2, '2019-04-12 10:42:52', '2019-04-12 10:42:52', 2, 0);
INSERT INTO `right_section` VALUES (3, '业务部', '0|3|', 1, 3, '2019-04-12 10:43:00', '2019-04-12 10:43:00', 2, 0);
INSERT INTO `right_section` VALUES (4, '跟单部', '0|4|', 1, 5, '2019-04-12 10:43:11', '2019-04-12 10:43:11', 2, 0);
INSERT INTO `right_section` VALUES (5, '风控部', '0|5|', 1, 6, '2019-04-12 10:43:19', '2019-04-12 10:43:19', 2, 0);
INSERT INTO `right_section` VALUES (7, '业务部22', '0|7|', 1, 99, '2019-04-13 09:25:22', '2019-04-13 09:25:22', 2, 0);
INSERT INTO `right_section` VALUES (8, '前端技术', '0|1|8|', 2, 99, '2019-04-15 11:12:37', '2019-04-15 11:12:37', 2, 1);

-- ----------------------------
-- Table structure for right_section_operate
-- ----------------------------
DROP TABLE IF EXISTS `right_section_operate`;
CREATE TABLE `right_section_operate`  (
  `id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) UNSIGNED NOT NULL,
  `section` int(11) UNSIGNED NOT NULL COMMENT '1:新建，2:修改，3:删除',
  `operate` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1:新建，2:修改',
  `sectionId` int(11) UNSIGNED NOT NULL,
  `operateUid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `operateTime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 183 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of right_section_operate
-- ----------------------------
INSERT INTO `right_section_operate` VALUES (00000000174, 2, 1, 1, 0, 100, '2019-04-12 10:42:43');
INSERT INTO `right_section_operate` VALUES (00000000175, 2, 2, 1, 0, 100, '2019-04-12 10:42:52');
INSERT INTO `right_section_operate` VALUES (00000000176, 2, 3, 1, 0, 100, '2019-04-12 10:43:00');
INSERT INTO `right_section_operate` VALUES (00000000177, 2, 4, 1, 0, 100, '2019-04-12 10:43:11');
INSERT INTO `right_section_operate` VALUES (00000000178, 2, 5, 1, 0, 100, '2019-04-12 10:43:19');
INSERT INTO `right_section_operate` VALUES (00000000179, 2, 6, 1, 0, 100, '2019-04-12 12:45:57');
INSERT INTO `right_section_operate` VALUES (00000000180, 2, 6, 3, 0, 100, '2019-04-12 12:46:27');
INSERT INTO `right_section_operate` VALUES (00000000181, 2, 7, 1, 0, 100, '2019-04-13 09:25:22');
INSERT INTO `right_section_operate` VALUES (00000000182, 2, 8, 1, 0, 100, '2019-04-15 11:12:37');

-- ----------------------------
-- Table structure for right_section_user
-- ----------------------------
DROP TABLE IF EXISTS `right_section_user`;
CREATE TABLE `right_section_user`  (
  `id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `default` tinyint(4) NOT NULL DEFAULT 0,
  `seller_id` int(11) UNSIGNED NOT NULL,
  `sectionId` int(11) UNSIGNED NOT NULL,
  `userId` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_section`(`seller_id`, `sectionId`) USING BTREE,
  INDEX `index_user`(`seller_id`, `userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of right_section_user
-- ----------------------------
INSERT INTO `right_section_user` VALUES (00000000012, 0, 2, 3, 7);
INSERT INTO `right_section_user` VALUES (00000000013, 0, 2, 4, 8);
INSERT INTO `right_section_user` VALUES (00000000014, 0, 2, 5, 9);
INSERT INTO `right_section_user` VALUES (00000000015, 0, 2, 2, 10);
INSERT INTO `right_section_user` VALUES (00000000016, 0, 2, 1, 11);
INSERT INTO `right_section_user` VALUES (00000000017, 0, 2, 2, 12);
INSERT INTO `right_section_user` VALUES (00000000018, 0, 2, 3, 13);

-- ----------------------------
-- Table structure for right_staff_role
-- ----------------------------
DROP TABLE IF EXISTS `right_staff_role`;
CREATE TABLE `right_staff_role`  (
  `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `default` tinyint(4) NOT NULL DEFAULT 0,
  `seller_id` int(11) UNSIGNED NOT NULL COMMENT '客户序号',
  `userId` bigint(11) UNSIGNED NOT NULL,
  `roleId` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_user`(`seller_id`, `userId`) USING BTREE,
  INDEX `index_role`(`userId`, `roleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of right_staff_role
-- ----------------------------
INSERT INTO `right_staff_role` VALUES (19, 0, 2, 7, 4);
INSERT INTO `right_staff_role` VALUES (20, 0, 2, 8, 5);
INSERT INTO `right_staff_role` VALUES (21, 0, 2, 9, 6);
INSERT INTO `right_staff_role` VALUES (22, 0, 2, 10, 6);
INSERT INTO `right_staff_role` VALUES (23, 0, 2, 11, 6);
INSERT INTO `right_staff_role` VALUES (24, 0, 2, 12, 6);
INSERT INTO `right_staff_role` VALUES (25, 0, 2, 13, 4);

-- ----------------------------
-- Table structure for service
-- ----------------------------
DROP TABLE IF EXISTS `service`;
CREATE TABLE `service`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `des` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `information` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述信息',
  `is_show` tinyint(1) NULL DEFAULT 1 COMMENT '1:展示 2隐藏',
  `sort` int(3) NULL DEFAULT 0 COMMENT '排序：越大越靠前',
  `mid` int(10) NULL DEFAULT 0 COMMENT '项目ID',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图标',
  `creatTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `seller_id` int(10) NULL DEFAULT NULL COMMENT '添加人',
  `nowTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `uid` int(10) NOT NULL DEFAULT 0,
  `is_hot` tinyint(1) NULL DEFAULT 2 COMMENT '1热门',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  INDEX `seller_id`(`seller_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of service
-- ----------------------------
INSERT INTO `service` VALUES (33, 'a', '111222', NULL, 1, 0, 0, 'http://211.155.230.114:4869/0d443d84197eaf9ecd54766d00ed323c', '2019-04-22 12:05:41', 2, '2019-04-28 13:43:14', 101, 2);
INSERT INTO `service` VALUES (35, 'a2', '111222', NULL, 1, 0, 0, 'sdfd2', '2019-04-22 12:21:21', 3, '2019-04-22 12:21:21', 102, 2);
INSERT INTO `service` VALUES (36, 'a23', '111222', NULL, 1, 0, 0, 'sdfd2', '2019-04-22 12:24:15', 3, '2019-04-22 12:24:15', 102, 2);
INSERT INTO `service` VALUES (37, 'a238', '111222', NULL, 1, 0, 0, 'sdfd2', '2019-04-22 12:26:18', 3, '2019-04-22 12:26:18', 102, 2);
INSERT INTO `service` VALUES (38, 'a7', '111222', NULL, 1, 0, 0, 'sdfd2', '2019-04-22 12:30:07', 3, '2019-04-22 12:30:07', 102, 2);
INSERT INTO `service` VALUES (39, 'a77', '111222', NULL, 1, 0, 0, 'sdfd2', '2019-04-22 12:43:11', 3, '2019-04-22 12:43:11', 102, 2);
INSERT INTO `service` VALUES (41, '1', '3', NULL, 1, 0, 0, 'http://211.155.230.114:4869/a169dc452ebc40b3af7dfe2082877654', '2019-04-28 12:48:45', 2, '2019-04-28 12:48:45', 101, 2);
INSERT INTO `service` VALUES (42, '2', '1221', NULL, 1, 0, 0, 'http://211.155.230.114:4869/00dd473d0a00fe9d4f5a1c37c29c35cc', '2019-04-28 12:49:08', 2, '2019-04-28 12:49:08', 101, 2);
INSERT INTO `service` VALUES (43, '园区黄页', '找对园区工作人员帮您解决问题\r\n              ', NULL, 1, 1, 0, 'http://211.155.230.114:4869/6b2d9da18f4b165a741fa8fb882017d2', '2019-04-28 12:49:15', 2, '2019-04-28 15:55:51', 101, 2);
INSERT INTO `service` VALUES (44, '物业服务', '在线物业报修', NULL, 1, 2, 0, 'http://211.155.230.114:4869/3527e184457a78ab377ba8c7160f5281', '2019-04-28 12:53:47', 2, '2019-04-28 15:55:57', 101, 2);
INSERT INTO `service` VALUES (45, '会议室', '选择合适的会议室开会讨论', NULL, 1, 3, 0, 'http://211.155.230.114:4869/64c19c12733eb845af5d580f6aeb4809', '2019-04-28 12:55:31', 2, '2019-04-28 15:56:06', 101, 2);
INSERT INTO `service` VALUES (46, '广告位', '预约使用广告位', NULL, 1, 4, 0, 'http://211.155.230.114:4869/558885a3d51849443d5382a44765d0d6', '2019-04-28 12:56:03', 2, '2019-04-28 15:56:13', 101, 2);
INSERT INTO `service` VALUES (47, '环评服务', '环境质量改善和污染治理服务', 'null', 2, 5, 0, 'http://211.155.230.114:4869/830647f8766287da72e25110074777b2', '2019-04-28 13:04:01', 2, '2019-04-30 13:36:22', 101, 2);
INSERT INTO `service` VALUES (48, '停车服务', '查看停车位', NULL, 1, 6, 0, 'http://211.155.230.114:4869/be9fda59f9c3538a73266bf31c38d23b', '2019-04-28 13:04:30', 2, '2019-04-28 15:56:25', 101, 2);
INSERT INTO `service` VALUES (49, '快递服务', '找快递运送您的包裹', NULL, 1, 7, 0, 'http://211.155.230.114:4869/0b9360f33b59ffd2956fe24793c18dfc', '2019-04-28 13:05:08', 2, '2019-04-28 15:56:31', 101, 2);
INSERT INTO `service` VALUES (50, '超市', '园区超市', NULL, 1, 8, 0, 'http://211.155.230.114:4869/9c24406aeb863bd7d17d48988becaa94', '2019-04-28 13:05:42', 2, '2019-04-28 15:56:38', 101, 2);
INSERT INTO `service` VALUES (51, '文印', '园区文印服务', 'null', 2, 9, 0, 'http://211.155.230.114:4869/5339112c915187999090513a57299a3d', '2019-04-28 13:06:04', 2, '2019-04-30 13:37:22', 101, 2);
INSERT INTO `service` VALUES (52, '访客登记', '登记访客信息', NULL, 1, 10, 0, 'http://211.155.230.114:4869/3134e98491395d849695d067a9a2502d', '2019-04-28 15:57:18', 2, '2019-04-28 15:57:38', 101, 2);
INSERT INTO `service` VALUES (53, '咖啡厅', '园区咖啡厅', NULL, 1, 11, 0, 'http://211.155.230.114:4869/00e41bb14fefbf3dd2a70db35c0b7dc3', '2019-04-28 15:58:03', 2, '2019-04-28 15:58:09', 101, 2);
INSERT INTO `service` VALUES (57, '固废服务', '无害化、减量化、资源化', '<p>无害化、减量化、资源化</p>', 1, 12, 0, 'http://211.155.230.114:4869/78594c501ac1b1e5b7bd7417ef9316a8', '2019-04-30 13:30:14', 2, '2019-04-30 13:32:36', 101, 2);
INSERT INTO `service` VALUES (58, '基层联络', '做员工群众的“疏导员”', '<p><span style=\"color: rgb(34, 34, 34);\">做员工群众的“疏导员”</span></p>', 1, 13, 0, 'http://211.155.230.114:4869/9a6b0d7ad1c04e381dc06cf785912629', '2019-04-30 13:34:19', 2, '2019-04-30 13:34:19', 101, 2);
INSERT INTO `service` VALUES (59, '红色云端', '让党建成为互联网企业发展的助推器', '<p><span style=\"color: rgb(34, 34, 34);\">让党建成为互联网企业发展的助推器</span></p>', 1, 14, 0, 'http://211.155.230.114:4869/9d4d044448e072b3b89c20a38c2ebc1f', '2019-04-30 13:34:54', 2, '2019-04-30 13:49:10', 101, 1);
INSERT INTO `service` VALUES (60, '设备维修', '专业的维修团队,先进的检测设备', '<p><span style=\"color: rgb(34, 34, 34);\">专业的维修团队,先进的检测设备</span></p>', 1, 15, 0, 'http://211.155.230.114:4869/a2b8dab294e4cdf6fdb501086c5d2310', '2019-04-30 13:36:09', 2, '2019-04-30 13:49:08', 101, 2);

-- ----------------------------
-- Table structure for service_banner
-- ----------------------------
DROP TABLE IF EXISTS `service_banner`;
CREATE TABLE `service_banner`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `banner` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `seller_id` int(11) NULL DEFAULT NULL,
  `uid` int(11) NULL DEFAULT NULL,
  `creatTime` datetime(0) NULL DEFAULT NULL,
  `nowTime` datetime(0) NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` int(3) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `seller_Id`(`seller_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 97 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of service_banner
-- ----------------------------
INSERT INTO `service_banner` VALUES (95, 'http://211.155.230.114:4869/f31e72c48431c4b00c0ed40767d35cd2', 2, 101, '2019-04-30 15:12:27', NULL, '5', '54', 5);
INSERT INTO `service_banner` VALUES (96, 'http://211.155.230.114:4869/57fab57cfe0a403502b023e8aa569fcc', 2, 101, '2019-04-30 15:12:28', NULL, '', '', NULL);

-- ----------------------------
-- Table structure for system_banner
-- ----------------------------
DROP TABLE IF EXISTS `system_banner`;
CREATE TABLE `system_banner`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `banner` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `seller_id` int(11) NULL DEFAULT NULL,
  `uid` int(11) NULL DEFAULT NULL,
  `creatTime` datetime(0) NULL DEFAULT NULL,
  `nowTime` datetime(0) NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of system_banner
-- ----------------------------
INSERT INTO `system_banner` VALUES (2, 'http://211.155.230.114:4869/30b2c8cbd734f5fa46d2b652f5b99714', 2, 101, '2019-04-29 10:23:51', '2019-04-29 14:52:51', 'qq.com11');
INSERT INTO `system_banner` VALUES (5, 'http://211.155.230.114:4869/5c0a53ac290c166a514c72e5dc182db3', 2, 101, '2019-04-29 15:41:41', NULL, '');
INSERT INTO `system_banner` VALUES (6, 'http://211.155.230.114:4869/a169dc452ebc40b3af7dfe2082877654', 2, 101, '2019-04-29 15:41:41', NULL, '');
INSERT INTO `system_banner` VALUES (7, 'http://211.155.230.114:4869/5c0a53ac290c166a514c72e5dc182db3', 2, 101, '2019-04-29 15:42:02', NULL, '');
INSERT INTO `system_banner` VALUES (8, 'http://211.155.230.114:4869/a169dc452ebc40b3af7dfe2082877654', 2, 101, '2019-04-29 15:42:02', NULL, '');
INSERT INTO `system_banner` VALUES (9, 'http://211.155.230.114:4869/5c0a53ac290c166a514c72e5dc182db3', 2, 101, '2019-04-29 15:42:17', NULL, '');
INSERT INTO `system_banner` VALUES (10, 'http://211.155.230.114:4869/a169dc452ebc40b3af7dfe2082877654', 2, 101, '2019-04-29 15:42:17', NULL, '');
INSERT INTO `system_banner` VALUES (11, 'http://211.155.230.114:4869/d376da7c5b5287a08954a1f6db77d5ed', 2, 101, '2019-04-29 15:48:48', NULL, '');
INSERT INTO `system_banner` VALUES (12, 'http://211.155.230.114:4869/da391c667e9f0515b4d458d0cecc6b9c', 2, 101, '2019-04-29 15:48:48', NULL, '');
INSERT INTO `system_banner` VALUES (16, 'http://211.155.230.114:4869/744a90494b7cb53251dffc33f3e9a360', 2, 101, '2019-04-30 09:18:16', NULL, 'qq.com11');
INSERT INTO `system_banner` VALUES (17, 'http://211.155.230.114:4869/30b2c8cbd734f5fa46d2b652f5b99714', 2, 101, '2019-04-30 09:18:16', NULL, NULL);

-- ----------------------------
-- Table structure for system_index
-- ----------------------------
DROP TABLE IF EXISTS `system_index`;
CREATE TABLE `system_index`  (
  `businessId` int(11) NOT NULL,
  `names` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `indexid` bigint(20) UNSIGNED NOT NULL COMMENT '客户序号',
  PRIMARY KEY (`businessId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of system_index
-- ----------------------------
INSERT INTO `system_index` VALUES (101, '岗位资料', 2);
INSERT INTO `system_index` VALUES (102, '部门资料', 12);
INSERT INTO `system_index` VALUES (201, '账号资料', 4);
INSERT INTO `system_index` VALUES (301, '销售订单', 1);
INSERT INTO `system_index` VALUES (501, '商品分类', 13);
INSERT INTO `system_index` VALUES (502, '商品属性', 2);
INSERT INTO `system_index` VALUES (503, '商品资料', 237);
INSERT INTO `system_index` VALUES (600, '客户管理', 25);

-- ----------------------------
-- Table structure for system_role
-- ----------------------------
DROP TABLE IF EXISTS `system_role`;
CREATE TABLE `system_role`  (
  `id` int(11) NOT NULL,
  `dnames` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `used` tinyint(20) UNSIGNED NOT NULL COMMENT '客户序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of system_role
-- ----------------------------
INSERT INTO `system_role` VALUES (1, '后台', 0);
INSERT INTO `system_role` VALUES (2, '中介', 0);
INSERT INTO `system_role` VALUES (3, '用户', 0);
INSERT INTO `system_role` VALUES (4, '业务员', 1);
INSERT INTO `system_role` VALUES (5, '跟单员', 1);
INSERT INTO `system_role` VALUES (6, '普通员工', 1);

-- ----------------------------
-- Table structure for system_set
-- ----------------------------
DROP TABLE IF EXISTS `system_set`;
CREATE TABLE `system_set`  (
  `setKey` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `setVaule` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`setKey`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of system_set
-- ----------------------------
INSERT INTO `system_set` VALUES ('', '');

-- ----------------------------
-- Table structure for user_login
-- ----------------------------
DROP TABLE IF EXISTS `user_login`;
CREATE TABLE `user_login`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `dnames` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `mobile` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱地址',
  `password` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码：MD5加密 ',
  `salt` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '随机数',
  `loginTime` datetime(0) NULL DEFAULT NULL,
  `loginIp` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `loginTimes` int(6) NOT NULL DEFAULT 0,
  `locked` tinyint(6) NOT NULL DEFAULT 0,
  `lockedTime` datetime(0) NULL DEFAULT NULL,
  `openId` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `deleted` tinyint(6) NOT NULL DEFAULT 0,
  `createtime` datetime(0) NULL DEFAULT NULL,
  `seller_id` int(10) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `openId`(`openId`) USING BTREE,
  INDEX `mobile`(`mobile`) USING BTREE,
  INDEX `dnames`(`dnames`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_login
-- ----------------------------
INSERT INTO `user_login` VALUES (2, '18257990958', '18257990958', '', '', '', NULL, '', 0, 0, NULL, '', 0, '2019-04-17 15:43:40', 0);
INSERT INTO `user_login` VALUES (3, '18357991416', '18357991416', '', '', '', NULL, '', 0, 0, NULL, '', 0, '2019-04-17 15:46:33', 0);
INSERT INTO `user_login` VALUES (6, '15258965121', '15258965121', '', '', '', '2019-04-13 14:41:18', '127.0.0.1', 7, 0, NULL, 'ozCQF5unEnM8EztLsG8YZ2NFu4NgS', 0, '2019-04-12 09:42:37', 0);
INSERT INTO `user_login` VALUES (7, 'yewuyuan1', '13000000001', '', 'bf268ebed41eb358e814789e212d33fc55efea83', 'u65vy5wd', '2019-04-13 08:59:46', '192.168.0.175', 5, 0, NULL, 'ozCQF5naWyHXUiQ1gmm00LkiOxrg', 0, '2019-04-12 10:45:19', 0);
INSERT INTO `user_login` VALUES (8, 'gengdanyuan1', '13000000002', '', 'c1bea1a442f2016ae4075d7b226c9a0cbd0ba773', 'fhh7qsgu', NULL, '', 0, 0, NULL, '', 0, '2019-04-12 10:46:15', 0);
INSERT INTO `user_login` VALUES (9, 'fengkong1', '13000000003', '', 'ec97a5e22caefb1c77d08eecbe689f4b43b53471', 'zbycobiv', '2019-04-15 13:45:35', '127.0.0.1', 4, 0, NULL, '', 0, '2019-04-12 10:50:22', 0);
INSERT INTO `user_login` VALUES (10, 'caiwu1', '13000000005', '', '7f02883734b0b75b3d83edfcd6d012a24660c272', 'ugz64ujg', '2019-04-12 13:28:26', '192.168.0.175', 1, 0, NULL, '', 0, '2019-04-12 10:52:02', 0);
INSERT INTO `user_login` VALUES (11, 'jishuyuan1', '13000000006', '', '48f6d1816c265f31656aaff25614942ffb929d85', 'tm64v53f', NULL, '', 0, 0, NULL, '', 0, '2019-04-12 10:56:01', 0);
INSERT INTO `user_login` VALUES (12, 'caiwu2', '13000000007', '', '9117e6ea58a82794ad8cc0239aae56ec1eaf55d8', '9v3mupit', NULL, '', 0, 0, NULL, '', 0, '2019-04-12 12:44:13', 0);
INSERT INTO `user_login` VALUES (13, 'fk001', '15212351235', '', '7d24a329320ecb0f1ea1985f7b8c82a2ec22d6eb', 'nydalpk2', '2019-04-13 10:34:51', '192.168.0.137', 3, 0, '2019-04-13 10:48:20', '', 0, '2019-04-13 09:22:04', 0);
INSERT INTO `user_login` VALUES (14, '15258965126', '15258965126', '', '', '', NULL, '', 0, 0, NULL, '', 0, '2019-04-13 09:49:41', 0);
INSERT INTO `user_login` VALUES (15, '13967406338', '13967406338', '', '', '', '2019-04-15 12:47:57', '192.168.0.150', 2, 0, NULL, 'ozCQF5pZAg3kLM4A-LoS-VOdnw5c', 0, '2019-04-15 10:31:28', 0);
INSERT INTO `user_login` VALUES (16, '15258965122', '15258965122', '', '', '', '2019-04-15 15:38:59', '127.0.0.1', 1, 0, NULL, 'ozCQF5unEnM8EztLsG8YZ2NFu4Ng', 0, '2019-04-15 10:36:12', 0);
INSERT INTO `user_login` VALUES (100, 'admin', '15258965120', '1793182685@qq.com', '4189c0867f4e3630b68846e97917be11183a705c', 'salt', '2019-04-24 08:47:23', '192.168.0.199', 268, 0, NULL, '', 0, NULL, 1);
INSERT INTO `user_login` VALUES (101, 'zcy', '18257990958', '18257990958@139.com', '4189c0867f4e3630b68846e97917be11183a705c', 'salt', '2019-05-04 10:31:27', '192.168.0.190', 73, 0, '0000-00-00 00:00:00', '', 0, '0000-00-00 00:00:00', 2);
INSERT INTO `user_login` VALUES (102, 'wx', '18357991416', '18357991416@139.com', '4189c0867f4e3630b68846e97917be11183a705c', 'salt', '2019-04-22 13:50:03', '192.168.0.199', 8, 0, NULL, '', 0, NULL, 3);

-- ----------------------------
-- Table structure for user_medium
-- ----------------------------
DROP TABLE IF EXISTS `user_medium`;
CREATE TABLE `user_medium`  (
  `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) UNSIGNED NOT NULL,
  `mediumId` bigint(20) NULL DEFAULT NULL,
  `createUserId` bigint(20) NOT NULL DEFAULT 0,
  `deleted` tinyint(6) NOT NULL DEFAULT 0,
  `createtime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_medium
-- ----------------------------
INSERT INTO `user_medium` VALUES (1, 2, 1, 107, 0, '2019-04-16 16:42:49');
INSERT INTO `user_medium` VALUES (6, 2, 2, 100, 0, '2019-04-17 15:43:40');
INSERT INTO `user_medium` VALUES (8, 2, 3, 100, 0, '2019-04-17 15:46:33');

-- ----------------------------
-- Table structure for user_operate
-- ----------------------------
DROP TABLE IF EXISTS `user_operate`;
CREATE TABLE `user_operate`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) UNSIGNED NOT NULL,
  `userId` int(11) UNSIGNED NOT NULL,
  `operate` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1:新建，2:修改，3:启用，4:停用, 5:设置部门, 6:设置岗位',
  `sectionId` int(11) UNSIGNED NOT NULL,
  `operateUid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `operateTime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_operate
-- ----------------------------
INSERT INTO `user_operate` VALUES (1, 0, 1, 1, 0, 107, '2019-04-16 16:42:49');
INSERT INTO `user_operate` VALUES (2, 0, 3, 1, 0, 100, '2019-04-17 15:46:33');

-- ----------------------------
-- Table structure for user_profile
-- ----------------------------
DROP TABLE IF EXISTS `user_profile`;
CREATE TABLE `user_profile`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '员工编号，通过会员序号表获取',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '员工的照片',
  `dnames` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '员工姓名',
  `mobile` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `entryTime` datetime(0) NULL DEFAULT NULL,
  `salary` int(10) NOT NULL DEFAULT 0 COMMENT '月薪',
  `sex` tinyint(1) NOT NULL DEFAULT 1 COMMENT '性别(1:男 0：女)',
  `officePhone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '办公电话',
  `idCard` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `bank` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `bankNo` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `wxNo` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `zfbNo` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `qq` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'qq',
  `qqPasswd` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `birthDay` date NULL DEFAULT NULL COMMENT '出生日期',
  `ethnic` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `homeAddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '家庭住址',
  `nowAddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '现住地址',
  `educational` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `graduateSchool` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `graduateTime` date NULL DEFAULT NULL COMMENT '入职时间',
  `profession` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `speciality` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '特长',
  `dstatus` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0:离职 1：在职',
  `userId` bigint(20) NOT NULL DEFAULT 0 COMMENT '登陆用户编号（0表示没有登陆账号）',
  `nativePlace` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `major` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 151 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_profile
-- ----------------------------
INSERT INTO `user_profile` VALUES (100, '', 'admin', '', NULL, 0, 1, '', '', '', '', '', '', '', '', NULL, '', '', '', '', '', NULL, '', '', 1, 100, '', '');
INSERT INTO `user_profile` VALUES (101, '', '张晨跃', '18357991416', '0000-00-00 00:00:00', 0, 0, '', '362565985525412589', '中国银行', '251236212523651', '', '', '0', '', '0000-00-00', '', '', '', '', '', '0000-00-00', '', '', 1, 101, '', '');
INSERT INTO `user_profile` VALUES (132, '', '张三', '15258965121', NULL, 0, 0, '', '56236598745125635X', '', '', '', '', '0', '', NULL, '', '', '', '', '', NULL, '', '', 1, 6, '', '');
INSERT INTO `user_profile` VALUES (133, 'http://211.155.230.114:4869/f5dd139dd7e3037eb37bf3657f591d92', '业务员1', '13000000001', NULL, 0, 0, '', '', '', '', '', '', '0', '', NULL, '', '', '', '', '', NULL, '', '', 1, 7, '', '');
INSERT INTO `user_profile` VALUES (134, 'http://211.155.230.114:4869/044099f3821d29014dfa1f1d4adb0c23', '跟单员1', '13000000002', NULL, 0, 0, '', '', '', '', '', '', '0', '', NULL, '', '', '', '', '', NULL, '', '', 1, 8, '', '');
INSERT INTO `user_profile` VALUES (135, 'http://211.155.230.114:4869/5d307da54e63aabd9138bf4771b18a2a', '风控1', '13000000003', NULL, 0, 0, '', '', '', '', '', '', '0', '', NULL, '', '', '', '', '', NULL, '', '', 1, 9, '', '');
INSERT INTO `user_profile` VALUES (136, 'http://211.155.230.114:4869/043992a53ba16c37abaff210071797a8', '财务1', '13000000005', NULL, 0, 0, '', '', '', '', '', '', '0', '', NULL, '', '', '', '', '', NULL, '', '', 1, 10, '', '');
INSERT INTO `user_profile` VALUES (137, '', '技术员1', '13000000006', NULL, 0, 0, '', '', '', '', '', '', '0', '', NULL, '', '', '', '', '', NULL, '', '', 1, 11, '', '');
INSERT INTO `user_profile` VALUES (138, 'http://211.155.230.114:4869/2fc76194da8c238c78f54b502758c042', '财务2', '13000000007', NULL, 0, 0, '', '', '', '', '', '', '0', '', NULL, '', '', '', '', '', NULL, '', '', 1, 12, '', '');
INSERT INTO `user_profile` VALUES (139, 'http://211.155.230.114:4869/019acfe7bd0f44cc6652c2c2d8dcc830', '风控1部业务员', '15212351235', NULL, 0, 0, '', '420115198512531256', '', '', '', '', '0', '', NULL, '', '', '', '', '', NULL, '', '', 1, 13, '', '');
INSERT INTO `user_profile` VALUES (140, '', '李四', '15258965126', NULL, 0, 0, '', '362565985525412589', '中国银行', '251236212523651', '', '', '0', '', NULL, '', '', '', '', '', NULL, '', '', 1, 14, '', '');
INSERT INTO `user_profile` VALUES (141, '', '李振宇', '13967406338', NULL, 0, 0, '', '33078819657463', '', '', '', '', '0', '', NULL, '', '', '', '', '', NULL, '', '', 1, 15, '', '');
INSERT INTO `user_profile` VALUES (142, '', '李四', '15258965122', NULL, 0, 0, '', '', '', '', '', '', '0', '', NULL, '', '', '', '', '', NULL, '', '', 1, 16, '', '');
INSERT INTO `user_profile` VALUES (148, '', '李四', '18257990958', NULL, 0, 0, '', '362565985525412589', '中国银行', '251236212523651', '', '', '0', '', NULL, '', '', '', '', '', NULL, '', '', 1, 2, '', '');
INSERT INTO `user_profile` VALUES (150, '', '李四', '18357991416', NULL, 0, 0, '', '362565985525412589', '中国银行', '251236212523651', '', '', '0', '', NULL, '', '', '', '', '', NULL, '', '', 1, 3, '', '');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `defaulte` tinyint(4) NOT NULL DEFAULT 0,
  `useId` bigint(20) NOT NULL COMMENT '用户编号',
  `roleId` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_user`(`useId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (100, 1, 100, 1);
INSERT INTO `user_role` VALUES (101, 0, 1, 2);
INSERT INTO `user_role` VALUES (105, 0, 2, 2);
INSERT INTO `user_role` VALUES (107, 0, 3, 2);
INSERT INTO `user_role` VALUES (108, 1, 101, 3);
INSERT INTO `user_role` VALUES (109, 1, 102, 3);

-- ----------------------------
-- Table structure for user_seller
-- ----------------------------
DROP TABLE IF EXISTS `user_seller`;
CREATE TABLE `user_seller`  (
  `seller_id` int(11) UNSIGNED NOT NULL COMMENT '客户序号',
  `seller_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客户名称',
  `legal_person` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司法人',
  `team_type_id` smallint(6) NULL DEFAULT 1 COMMENT '团队规模编号',
  `team_member_count` int(11) NULL DEFAULT 0 COMMENT '团队规模具体人数',
  `zip_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮政编码',
  `country_id` int(11) NOT NULL DEFAULT 0 COMMENT '国家编号',
  `address_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '地区编号',
  `address_part1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '客户地址1',
  `address_part2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '客户地址2',
  `homepage_url` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户网址',
  `platform_domain` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商城域名',
  `sub_domain_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '如果是代理商且需要分配二级域名时，指定基础域名，不含www',
  `logo_url` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像图片名称',
  `tel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司电话',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电子邮件',
  `contacts` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系人',
  `contacts_position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contacts_birthday` date NULL DEFAULT NULL COMMENT '联系人生日',
  `mobile_no` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号码',
  `qq_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'QQ',
  `msn_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'MSN',
  `skype_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'SKYPE',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `start_date` date NULL DEFAULT NULL COMMENT '计算开始时间',
  `end_date` date NULL DEFAULT NULL COMMENT '计算结束时间',
  `is_auth` smallint(6) NOT NULL DEFAULT 0 COMMENT '认证状态',
  `is_personal` smallint(6) NULL DEFAULT 0 COMMENT '是否是个人注册',
  `level` smallint(6) NOT NULL DEFAULT 0 COMMENT '几级代理，或者客户',
  `is_deleted` smallint(6) NOT NULL DEFAULT 0 COMMENT '是否删除',
  `reason_desc` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '删除的原因',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `create_user_id` bigint(20) NULL DEFAULT 0,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `update_user_id` bigint(20) NULL DEFAULT 0,
  `is_init` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '0:未初始化，1:已初始化',
  PRIMARY KEY (`seller_id`) USING BTREE,
  INDEX `platform_domain`(`platform_domain`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_seller
-- ----------------------------
INSERT INTO `user_seller` VALUES (1, '义乌市九域网络科技有限公司', '喻军荣', 3, 0, '322000', 0, 0, '浙江省 金华市 义乌市', '国际商贸城五区五楼网商服务区71001,71003,70989,70991(109号大门上)', 'www.shoperp.cn', 'manager.shoperp.cn', '', 'http://www.shoperp.cn/images/', '0579-85871717', 'hahavipfish@hotmail.com', '喻军荣', '', '0000-00-00', '18006517333', '1648255065 ', '', '', '浙江九域网络技术有限公司成立于2007年，注册基本资金1000万，公司专注于电子商务平台的研发及相关解决方案与服务的提供，以先进的商业理念，优秀的软件产品和专业的配套服务，引领电子商务行业技术的发展方向，推动电商模式的创新和发展。', '2015-03-01', '2020-02-29', 1, 0, 0, 0, '', '2015-03-01 21:12:42', 1, '2015-03-01 21:14:30', 1, 0);
INSERT INTO `user_seller` VALUES (2, '盈云科技有限公司', '许总', 3, 0, '', 1, 15860, '中国 浙江省 金华市 义乌市', '北苑街道秋实路106号7楼', '', 'manager.yingyun.com', 'yingyun.com', 'http://119.37.197.41:4869/761b9d36cfd0b776211507b055f59d5c', '0579-89972306', 'hahavipfish@hotmail.com', '盈云科技', '', '0000-00-00', '13957928871', '1664823253', '', '', '', '2015-07-06', '2016-07-05', 1, 0, 1, 0, '', '2015-07-06 17:05:38', 1, '2016-04-02 10:57:29', 1, 0);
INSERT INTO `user_seller` VALUES (3, '', '王欣', 3, 0, '322100', 0, 0, '', '', NULL, NULL, '', NULL, NULL, '', '', NULL, NULL, '', '', '', '', '', NULL, NULL, 1, 0, 0, 0, '', NULL, 1, NULL, 0, 0);

-- ----------------------------
-- Table structure for user_seller_relation
-- ----------------------------
DROP TABLE IF EXISTS `user_seller_relation`;
CREATE TABLE `user_seller_relation`  (
  `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sections` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `postId` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `posts` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `roles` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `superd` tinyint(4) NOT NULL DEFAULT 0,
  `defaulte` tinyint(4) NOT NULL DEFAULT 0,
  `deleted` tinyint(6) NOT NULL DEFAULT 0,
  `seller_id` int(11) UNSIGNED NOT NULL COMMENT '客户序号',
  `userId` bigint(11) UNSIGNED NOT NULL,
  `nowTime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_seller_relation
-- ----------------------------
INSERT INTO `user_seller_relation` VALUES (100, '', NULL, '', '', 1, 1, 0, 2, 100, '2019-02-25 09:42:53');
INSERT INTO `user_seller_relation` VALUES (101, '', '1', '1', '1', 0, 1, 0, 2, 101, '2019-02-25 09:42:53');

-- ----------------------------
-- Table structure for user_shop
-- ----------------------------
DROP TABLE IF EXISTS `user_shop`;
CREATE TABLE `user_shop`  (
  `seller_id` bigint(20) UNSIGNED NOT NULL COMMENT '客户编号',
  `shop_id` smallint(6) NOT NULL COMMENT '店铺编号',
  `shop_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店铺简介',
  `shop_description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店铺名称',
  `page_title` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺名称',
  `page_keywords` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类的关键词',
  `page_description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类描述信息',
  `master_qq` varchar(125) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '站长QQ',
  `qq_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `master` varchar(125) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '站长名字（联系人）',
  `shop_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店铺域名',
  `shop_url_self` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自有域名',
  `shop_tag` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '店铺标记',
  `lang_name_view` smallint(6) NOT NULL DEFAULT 1 COMMENT '表现语言(1:中文 2:英文)',
  `lang_name_sys` smallint(6) NOT NULL DEFAULT 1 COMMENT '后台语言(1:中文 2:英文)',
  `currency_name_view` smallint(6) NOT NULL DEFAULT 1 COMMENT '表现币种(1:人民币 2:美元)',
  `currency_name_sys` smallint(6) NOT NULL DEFAULT 1 COMMENT '结算币种(1:人民币 2:美元)',
  `image_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺Logo图片',
  `image_base_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺Logo名称',
  `image_tips` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片说明',
  `country_id` int(11) NOT NULL DEFAULT 0 COMMENT '国家编号',
  `address_id` int(11) NOT NULL DEFAULT 0 COMMENT '地区编号',
  `shop_address1` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '店铺地址1',
  `shop_address2` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '店铺地址2',
  `services_tel` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '客服电话',
  `copyright` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '版权信息',
  `is_card` smallint(6) NULL DEFAULT 0 COMMENT '0:不需要提供绑定会员卡功能 1：提供',
  `erweima` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '在商城首页显示二维码的图片路径',
  `is_closed` smallint(6) NULL DEFAULT 0 COMMENT '0:不关闭 1:关闭',
  `reason_desc` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '关闭店铺的原因',
  `closed_time` datetime(0) NULL DEFAULT NULL COMMENT '关闭店铺时间',
  `domain_record` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '域名备案号',
  `token` varchar(160) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '序列号',
  `update_user_id` bigint(20) UNSIGNED NULL DEFAULT 0 COMMENT '关闭店铺的用户编号',
  PRIMARY KEY (`seller_id`, `shop_id`) USING BTREE,
  UNIQUE INDEX `shop_url`(`shop_url`) USING BTREE,
  INDEX `currency_name_view`(`currency_name_view`) USING BTREE,
  INDEX `lang_name_view`(`lang_name_view`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_shop
-- ----------------------------
INSERT INTO `user_shop` VALUES (1, 1, '默认店铺', '', '测试店铺1', '电子商务平台', '浙江九域网络技术有限公司成立于2007年，注册基本资金1000万，公司专注于电子商务平台的研发及相关解决方案与服务的提供，以先进的商业理念，优秀的软件产品和专业的配套服务，引领电子商务行业技术的发展方向，推动电商模式的创新和发展。', '1648255065', '', '喻军荣', 'manager.shoperp.cn', 'admin.cyy.com', 'shoperp', 1, 1, 1, 1, 'http://www.shoperp.cn/images/', 'logo.png', '电子商务平台演示店铺', 0, 0, '浙江省 金华市 义乌市', '国际商贸城五区五楼网商服务区71001,71003,70989,70991(109号大门上)-china', '0579-85871717', 'Copyright ©2015-2020 www.wanghuo.hk, All Rights Reserved', 0, '', 0, '', '0000-00-00 00:00:00', '', '12655', 0);
INSERT INTO `user_shop` VALUES (2, 1, '御华金融', '客户的总店，在有分店的情况下，可以管理所有分店商品和订单', '御华金融-标题', '御华金融-关键字', '御华金融-描述', '33637025@qq.com', '', '御华金融', 'smallprogram.yhjr.com', 'zcy.cyy.com', '', 1, 1, 1, 1, 'http://47.96.95.57:4869/6edd87c228b63312d797b09a1eba866e', '', '', 1, 15860, '浙江省 金华市 义乌市', '北苑街道秋实路106号7楼', '0579-89972306', 'Copyright ©2018 盈云科技YingYun-link.com 版权所有', 0, '', 0, '', NULL, '浙ICP备09021316号-1', '123456', 173);
INSERT INTO `user_shop` VALUES (3, 1, '王欣', '', NULL, NULL, NULL, '', NULL, '', '', 'wx.cyy.com', '', 1, 1, 1, 1, NULL, NULL, NULL, 0, 0, '', '', '', '', 0, '', 0, '', NULL, NULL, '123456', 0);

-- ----------------------------
-- Function structure for getKeyValue
-- ----------------------------
DROP FUNCTION IF EXISTS `getKeyValue`;
delimiter ;;
CREATE DEFINER=`newUser`@`%` FUNCTION `getKeyValue`(`pBusinessId` int,`pStep` smallint) RETURNS int(20)
BEGIN
declare sIndexid bigint;
  select indexid INTO sIndexid from system_index where businessId = pBusinessId;
  update system_index set indexid = indexid + pStep where businessId = pBusinessId;
  RETURN sIndexid;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
