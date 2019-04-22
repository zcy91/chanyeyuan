/*
Navicat MySQL Data Transfer

Source Server         : 192.168.0.135
Source Server Version : 50617
Source Host           : 192.168.0.135:3306
Source Database       : industrialpark

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2019-04-22 16:56:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for business_service_category
-- ----------------------------
DROP TABLE IF EXISTS `business_service_category`;
CREATE TABLE `business_service_category` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort` int(3) DEFAULT '0',
  `creatTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `nowTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `uid` int(10) DEFAULT NULL,
  `seller_id` int(10) DEFAULT NULL,
  `parent_id` int(3) DEFAULT NULL,
  `parent_id_path` varchar(125) DEFAULT NULL,
  `is_show` int(1) DEFAULT '0',
  `level` int(2) DEFAULT NULL,
  `des` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_service_category
-- ----------------------------
INSERT INTO `business_service_category` VALUES ('1', 'wx0', 'http55', '10', '2019-04-22 15:01:55', '2019-04-22 15:42:31', '102', '3', '0', null, '0', '1', null);
INSERT INTO `business_service_category` VALUES ('2', 'wx', 'http55', '1', '2019-04-22 15:02:24', '2019-04-22 15:41:33', '102', '3', '1', null, '0', '2', null);
INSERT INTO `business_service_category` VALUES ('3', 'wx00', 'http55', '0', '2019-04-22 15:45:03', '2019-04-22 15:45:03', '101', '2', '1', null, '0', '2', null);
INSERT INTO `business_service_category` VALUES ('4', 'wx00', 'http55', '0', '2019-04-22 16:14:22', '2019-04-22 16:14:22', '101', '2', '2', null, '0', '2', null);
INSERT INTO `business_service_category` VALUES ('5', 'wx00', 'http55', '0', '2019-04-22 16:17:44', '2019-04-22 16:17:44', '101', '2', '0', null, '0', '1', null);
INSERT INTO `business_service_category` VALUES ('6', 'zcy', 'http55', '0', '2019-04-22 16:18:38', '2019-04-22 16:18:38', '101', '2', '0', null, '0', '1', null);
INSERT INTO `business_service_category` VALUES ('7', 'zcy', 'http55', '0', '2019-04-22 16:19:02', '2019-04-22 16:19:02', '101', '2', '4', null, '0', '2', null);

-- ----------------------------
-- Table structure for right_base
-- ----------------------------
DROP TABLE IF EXISTS `right_base`;
CREATE TABLE `right_base` (
  `id` int(11) NOT NULL,
  `dnames` varchar(200) NOT NULL,
  `router` varchar(100) DEFAULT NULL COMMENT '路由',
  `action` varchar(100) DEFAULT NULL,
  `display` tinyint(4) NOT NULL,
  `moduleId` int(11) unsigned NOT NULL,
  `sort` int(10) unsigned DEFAULT '9999999',
  `attribute` varchar(50) DEFAULT NULL COMMENT '属性归属',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of right_base
-- ----------------------------
INSERT INTO `right_base` VALUES ('1', '贷款商品列表', 'product', 'lists', '1', '1', '1', 'goods');
INSERT INTO `right_base` VALUES ('2', '新增贷款商品', 'product_add_or_edit', 'add', '1', '1', '2', 'goods');
INSERT INTO `right_base` VALUES ('3', '贷款类别管理', 'products_categories', 'lists', '1', '1', '3', 'cate');
INSERT INTO `right_base` VALUES ('4', '贷款资料管理', 'products_materials', 'lists', '1', '1', '4', 'attr');
INSERT INTO `right_base` VALUES ('5', '删除商品', 'delete', 'delete', '0', '1', '100', 'goods');
INSERT INTO `right_base` VALUES ('6', '编辑商品', 'product_add_or_edit', 'edit', '0', '1', '100', 'goods');
INSERT INTO `right_base` VALUES ('7', '所有订单管理', 'orders_all', 'fetchs', '1', '2', '1', 'loanOrder');
INSERT INTO `right_base` VALUES ('8', '岗位管理', 'authority_position', 'lists', '1', '3', '1', 'position');
INSERT INTO `right_base` VALUES ('9', '添加岗位', 'authority_position_add_or_edit', 'add', '0', '3', '100', 'position');
INSERT INTO `right_base` VALUES ('10', '修改岗位', 'authority_position_add_or_edit', 'edit', '0', '3', '100', 'position');
INSERT INTO `right_base` VALUES ('11', '删除岗位', 'delete', 'delete', '0', '3', '100', 'position');
INSERT INTO `right_base` VALUES ('12', '部门管理', 'authority_department', 'lists', '1', '3', '5', 'deparment');
INSERT INTO `right_base` VALUES ('13', '添加部门', 'add', 'add', '0', '3', '100', 'deparment');
INSERT INTO `right_base` VALUES ('14', '修改部门', 'edit', 'edit', '0', '3', '100', 'deparment');
INSERT INTO `right_base` VALUES ('15', '删除部门', 'delete', 'delete', '0', '3', '100', 'deparment');
INSERT INTO `right_base` VALUES ('16', '员工管理', 'authority_employees', 'lists', '1', '3', '9', 'staff');
INSERT INTO `right_base` VALUES ('17', '添加员工', 'authority_employee_add_or_edit', 'add', '0', '3', '100', 'staff');
INSERT INTO `right_base` VALUES ('18', '修改员工', 'authority_employee_add_or_edit', 'edit', '0', '3', '100', 'staff');
INSERT INTO `right_base` VALUES ('19', '停用员工', 'delete', 'delete', '0', '3', '100', 'staff');
INSERT INTO `right_base` VALUES ('20', '设置员工岗位', 'positionSet', 'positionSet', '0', '3', '100', 'staff');
INSERT INTO `right_base` VALUES ('21', '添加贷款类别', 'add', 'add', '0', '1', '100', 'cate');
INSERT INTO `right_base` VALUES ('22', '修改贷款类别', 'edit', 'edit', '0', '1', '100', 'cate');
INSERT INTO `right_base` VALUES ('23', '删除贷款类别', 'delete', 'delete', '0', '1', '100', 'cate');
INSERT INTO `right_base` VALUES ('24', '添加贷款资料', 'products_materials_add_or_edit', 'add', '0', '1', '100', 'attr');
INSERT INTO `right_base` VALUES ('25', '修改贷款资料', 'products_materials_add_or_edit', 'edit', '0', '1', '100', 'attr');
INSERT INTO `right_base` VALUES ('26', '删除贷款资料', 'delete', 'delete', '0', '1', '100', 'attr');
INSERT INTO `right_base` VALUES ('27', '上下架商品', 'setvisible', 'setvisible', '0', '1', '100', 'goods');
INSERT INTO `right_base` VALUES ('28', '审核通过', 'check', 'check', '0', '2', '100', 'checkOrder');
INSERT INTO `right_base` VALUES ('29', '审核拒绝', 'uncheck', 'uncheck', '0', '2', '100', 'checkOrder');
INSERT INTO `right_base` VALUES ('31', '风控订单管理', 'orders_verify', null, '1', '2', '3', 'checkOrder');
INSERT INTO `right_base` VALUES ('32', '签约订单管理', 'orders_assignment', null, '1', '2', '4', 'signOrder');
INSERT INTO `right_base` VALUES ('33', '回款订单管理', 'orders_refund', null, '1', '2', '5', 'paybackOrder');
INSERT INTO `right_base` VALUES ('34', '贷款商品佣金设置管理', 'brokerage', null, '1', '4', '1', 'brokerage');
INSERT INTO `right_base` VALUES ('35', '设置佣金', null, 'edit', '0', '4', '100', 'brokerage');
INSERT INTO `right_base` VALUES ('36', '贷款业绩统计管理', 'statistical_loan', null, '1', '5', '1', 'report');
INSERT INTO `right_base` VALUES ('37', '贷款商品列表', 'product', 'lists', '1', '1', '1', 'goods');
INSERT INTO `right_base` VALUES ('38', '贷款类别管理', 'products_categories', 'lists', '1', '1', '3', 'cate');
INSERT INTO `right_base` VALUES ('39', '贷款资料管理', 'products_materials', 'lists', '1', '1', '4', 'attr');
INSERT INTO `right_base` VALUES ('40', '申请贷款订单管理', 'orders_all', 'fetchs', '1', '2', '1', 'loanOrder');
INSERT INTO `right_base` VALUES ('41', '风控订单列表', 'orders_verify', '', '1', '2', '3', 'checkOrder');
INSERT INTO `right_base` VALUES ('42', '签约订单列表', 'orders_assignment', '', '1', '2', '4', 'signOrder');
INSERT INTO `right_base` VALUES ('43', '回款订单列表', 'orders_refund', '', '1', '2', '5', 'paybackOrder');
INSERT INTO `right_base` VALUES ('45', '岗位列表', 'authority_position', 'lists', '1', '3', '1', 'position');
INSERT INTO `right_base` VALUES ('46', '部门列表', 'authority_department', 'lists', '1', '3', '5', 'deparment');
INSERT INTO `right_base` VALUES ('47', '员工列表', 'authority_employees', 'lists', '1', '3', '9', 'staff');
INSERT INTO `right_base` VALUES ('48', '贷款商品佣金设置', 'brokerage', '', '1', '4', '1', 'brokerage');
INSERT INTO `right_base` VALUES ('49', '贷款业绩统计', 'statistical_loan', '', '1', '5', '1', 'report');
INSERT INTO `right_base` VALUES ('50', '确定签约', 'sign_check', 'sign_check', '0', '2', '5', 'signOrder');
INSERT INTO `right_base` VALUES ('51', '签约驳回', 'sign_uncheck', 'sign_uncheck', '0', '2', '6', 'signOrder');
INSERT INTO `right_base` VALUES ('52', '确认回款', 'payback_check', 'payback_check', '0', '2', '7', 'paybackOrder');
INSERT INTO `right_base` VALUES ('53', '延期申请', 'payback_uncheck', 'payback_uncheck', '0', '2', '8', 'paybackOrder');

-- ----------------------------
-- Table structure for right_module
-- ----------------------------
DROP TABLE IF EXISTS `right_module`;
CREATE TABLE `right_module` (
  `id` int(11) NOT NULL,
  `dnames` varchar(200) NOT NULL,
  `display` tinyint(4) NOT NULL,
  `icon` varchar(50) DEFAULT NULL COMMENT '模块图标',
  `router` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of right_module
-- ----------------------------
INSERT INTO `right_module` VALUES ('1', '贷款产品管理', '1', 'shop', 'product');
INSERT INTO `right_module` VALUES ('2', '贷款订单管理', '1', 'subscriptions', 'order');
INSERT INTO `right_module` VALUES ('3', '权限管理', '1', 'vpn_key', 'power');
INSERT INTO `right_module` VALUES ('4', '佣金管理', '1', 'monetization_on', 'commission');
INSERT INTO `right_module` VALUES ('5', '报表统计', '1', 'insert_chart', 'report');

-- ----------------------------
-- Table structure for right_post
-- ----------------------------
DROP TABLE IF EXISTS `right_post`;
CREATE TABLE `right_post` (
  `id` int(11) unsigned NOT NULL,
  `dnames` varchar(200) NOT NULL,
  `display` tinyint(4) NOT NULL,
  `deleted` tinyint(4) NOT NULL,
  `seller_id` int(11) unsigned NOT NULL COMMENT '客户序号',
  `sectionName` varchar(500) NOT NULL DEFAULT '' COMMENT '部门名称：多部门用，分开',
  `nowTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_seller` (`seller_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of right_post
-- ----------------------------
INSERT INTO `right_post` VALUES ('1', '业务员', '1', '0', '2', '业务部，', '2019-04-12 12:47:15');
INSERT INTO `right_post` VALUES ('2', '财务', '0', '0', '2', '财务部，风控部，', '2019-04-15 16:03:23');
INSERT INTO `right_post` VALUES ('3', '风控', '1', '0', '2', '业务部，业务部22，', '2019-04-13 09:25:36');
INSERT INTO `right_post` VALUES ('4', '操作员', '1', '0', '2', '技术部，', '2019-04-12 12:50:31');

-- ----------------------------
-- Table structure for right_post_base
-- ----------------------------
DROP TABLE IF EXISTS `right_post_base`;
CREATE TABLE `right_post_base` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) unsigned NOT NULL,
  `postId` int(11) unsigned NOT NULL,
  `moduleId` int(11) unsigned NOT NULL,
  `baseId` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_post` (`seller_id`,`postId`) USING BTREE,
  KEY `index_module` (`seller_id`,`moduleId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of right_post_base
-- ----------------------------
INSERT INTO `right_post_base` VALUES ('00000000116', '2', '1', '2', '40');
INSERT INTO `right_post_base` VALUES ('00000000149', '2', '4', '1', '37');
INSERT INTO `right_post_base` VALUES ('00000000150', '2', '4', '1', '2');
INSERT INTO `right_post_base` VALUES ('00000000151', '2', '4', '1', '5');
INSERT INTO `right_post_base` VALUES ('00000000152', '2', '4', '1', '6');
INSERT INTO `right_post_base` VALUES ('00000000153', '2', '4', '1', '27');
INSERT INTO `right_post_base` VALUES ('00000000154', '2', '4', '1', '38');
INSERT INTO `right_post_base` VALUES ('00000000155', '2', '4', '1', '21');
INSERT INTO `right_post_base` VALUES ('00000000156', '2', '4', '1', '22');
INSERT INTO `right_post_base` VALUES ('00000000157', '2', '4', '1', '23');
INSERT INTO `right_post_base` VALUES ('00000000158', '2', '4', '1', '39');
INSERT INTO `right_post_base` VALUES ('00000000159', '2', '4', '1', '24');
INSERT INTO `right_post_base` VALUES ('00000000160', '2', '4', '1', '25');
INSERT INTO `right_post_base` VALUES ('00000000161', '2', '4', '1', '26');
INSERT INTO `right_post_base` VALUES ('00000000162', '2', '4', '1', '1');
INSERT INTO `right_post_base` VALUES ('00000000163', '2', '4', '4', '48');
INSERT INTO `right_post_base` VALUES ('00000000164', '2', '4', '4', '35');
INSERT INTO `right_post_base` VALUES ('00000000165', '2', '4', '4', '4');
INSERT INTO `right_post_base` VALUES ('00000000166', '2', '4', '3', '47');
INSERT INTO `right_post_base` VALUES ('00000000167', '2', '4', '3', '17');
INSERT INTO `right_post_base` VALUES ('00000000168', '2', '4', '3', '18');
INSERT INTO `right_post_base` VALUES ('00000000169', '2', '4', '3', '19');
INSERT INTO `right_post_base` VALUES ('00000000170', '2', '4', '3', '46');
INSERT INTO `right_post_base` VALUES ('00000000171', '2', '4', '3', '13');
INSERT INTO `right_post_base` VALUES ('00000000172', '2', '4', '3', '14');
INSERT INTO `right_post_base` VALUES ('00000000173', '2', '4', '3', '15');
INSERT INTO `right_post_base` VALUES ('00000000177', '2', '3', '2', '41');
INSERT INTO `right_post_base` VALUES ('00000000178', '2', '3', '2', '28');
INSERT INTO `right_post_base` VALUES ('00000000179', '2', '3', '2', '29');
INSERT INTO `right_post_base` VALUES ('00000000180', '2', '2', '2', '42');
INSERT INTO `right_post_base` VALUES ('00000000181', '2', '2', '2', '50');
INSERT INTO `right_post_base` VALUES ('00000000182', '2', '2', '2', '51');
INSERT INTO `right_post_base` VALUES ('00000000183', '2', '2', '2', '43');
INSERT INTO `right_post_base` VALUES ('00000000184', '2', '2', '2', '52');
INSERT INTO `right_post_base` VALUES ('00000000185', '2', '2', '2', '53');

-- ----------------------------
-- Table structure for right_post_module
-- ----------------------------
DROP TABLE IF EXISTS `right_post_module`;
CREATE TABLE `right_post_module` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) unsigned NOT NULL,
  `postId` int(11) unsigned NOT NULL,
  `moduleId` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_seller` (`seller_id`,`postId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of right_post_module
-- ----------------------------
INSERT INTO `right_post_module` VALUES ('00000000021', '2', '1', '2');
INSERT INTO `right_post_module` VALUES ('00000000028', '2', '4', '1');
INSERT INTO `right_post_module` VALUES ('00000000029', '2', '4', '4');
INSERT INTO `right_post_module` VALUES ('00000000030', '2', '4', '3');
INSERT INTO `right_post_module` VALUES ('00000000032', '2', '3', '2');
INSERT INTO `right_post_module` VALUES ('00000000033', '2', '2', '2');

-- ----------------------------
-- Table structure for right_post_operate
-- ----------------------------
DROP TABLE IF EXISTS `right_post_operate`;
CREATE TABLE `right_post_operate` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) unsigned NOT NULL,
  `postId` int(11) unsigned NOT NULL,
  `operate` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1:新建，2:修改 3：删除',
  `sectionId` int(11) unsigned NOT NULL,
  `operateUid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `operateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of right_post_operate
-- ----------------------------
INSERT INTO `right_post_operate` VALUES ('00000000025', '2', '1', '1', '0', '100', '2019-04-12 12:46:59');
INSERT INTO `right_post_operate` VALUES ('00000000026', '2', '1', '2', '0', '100', '2019-04-12 12:47:15');
INSERT INTO `right_post_operate` VALUES ('00000000027', '2', '2', '1', '0', '100', '2019-04-12 12:47:40');
INSERT INTO `right_post_operate` VALUES ('00000000028', '2', '3', '1', '0', '100', '2019-04-12 12:48:18');
INSERT INTO `right_post_operate` VALUES ('00000000029', '2', '2', '2', '0', '100', '2019-04-12 12:48:27');
INSERT INTO `right_post_operate` VALUES ('00000000030', '2', '2', '2', '0', '100', '2019-04-12 12:48:36');
INSERT INTO `right_post_operate` VALUES ('00000000031', '2', '4', '1', '0', '100', '2019-04-12 12:49:50');
INSERT INTO `right_post_operate` VALUES ('00000000032', '2', '4', '2', '0', '100', '2019-04-12 12:50:31');
INSERT INTO `right_post_operate` VALUES ('00000000033', '2', '3', '2', '0', '100', '2019-04-12 13:04:58');
INSERT INTO `right_post_operate` VALUES ('00000000034', '2', '3', '2', '0', '100', '2019-04-13 09:25:36');
INSERT INTO `right_post_operate` VALUES ('00000000035', '2', '2', '2', '0', '100', '2019-04-15 16:03:23');

-- ----------------------------
-- Table structure for right_post_section
-- ----------------------------
DROP TABLE IF EXISTS `right_post_section`;
CREATE TABLE `right_post_section` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) unsigned NOT NULL,
  `postId` int(11) unsigned NOT NULL,
  `sectionId` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_seller` (`seller_id`,`postId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of right_post_section
-- ----------------------------
INSERT INTO `right_post_section` VALUES ('00000000031', '2', '1', '3');
INSERT INTO `right_post_section` VALUES ('00000000038', '2', '4', '1');
INSERT INTO `right_post_section` VALUES ('00000000040', '2', '3', '3');
INSERT INTO `right_post_section` VALUES ('00000000041', '2', '3', '7');
INSERT INTO `right_post_section` VALUES ('00000000042', '2', '2', '2');
INSERT INTO `right_post_section` VALUES ('00000000043', '2', '2', '5');

-- ----------------------------
-- Table structure for right_post_user
-- ----------------------------
DROP TABLE IF EXISTS `right_post_user`;
CREATE TABLE `right_post_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) unsigned NOT NULL,
  `postId` int(11) unsigned NOT NULL,
  `userId` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of right_post_user
-- ----------------------------
INSERT INTO `right_post_user` VALUES ('22', '2', '1', '7');
INSERT INTO `right_post_user` VALUES ('23', '2', '3', '9');
INSERT INTO `right_post_user` VALUES ('24', '2', '2', '10');
INSERT INTO `right_post_user` VALUES ('26', '2', '3', '13');

-- ----------------------------
-- Table structure for right_section
-- ----------------------------
DROP TABLE IF EXISTS `right_section`;
CREATE TABLE `right_section` (
  `id` int(11) NOT NULL,
  `dnames` varchar(200) NOT NULL,
  `parentsPath` varchar(400) NOT NULL,
  `dLevel` tinyint(11) NOT NULL,
  `sort` tinyint(4) NOT NULL,
  `creatTime` datetime DEFAULT NULL,
  `nowTime` datetime DEFAULT NULL,
  `seller_id` int(11) unsigned NOT NULL,
  `parentId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_dleve` (`seller_id`,`dLevel`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of right_section
-- ----------------------------
INSERT INTO `right_section` VALUES ('1', '技术部', '0|1|', '1', '1', '2019-04-12 10:42:43', '2019-04-12 10:42:43', '2', '0');
INSERT INTO `right_section` VALUES ('2', '财务部', '0|2|', '1', '2', '2019-04-12 10:42:52', '2019-04-12 10:42:52', '2', '0');
INSERT INTO `right_section` VALUES ('3', '业务部', '0|3|', '1', '3', '2019-04-12 10:43:00', '2019-04-12 10:43:00', '2', '0');
INSERT INTO `right_section` VALUES ('4', '跟单部', '0|4|', '1', '5', '2019-04-12 10:43:11', '2019-04-12 10:43:11', '2', '0');
INSERT INTO `right_section` VALUES ('5', '风控部', '0|5|', '1', '6', '2019-04-12 10:43:19', '2019-04-12 10:43:19', '2', '0');
INSERT INTO `right_section` VALUES ('7', '业务部22', '0|7|', '1', '99', '2019-04-13 09:25:22', '2019-04-13 09:25:22', '2', '0');
INSERT INTO `right_section` VALUES ('8', '前端技术', '0|1|8|', '2', '99', '2019-04-15 11:12:37', '2019-04-15 11:12:37', '2', '1');

-- ----------------------------
-- Table structure for right_section_operate
-- ----------------------------
DROP TABLE IF EXISTS `right_section_operate`;
CREATE TABLE `right_section_operate` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) unsigned NOT NULL,
  `section` int(11) unsigned NOT NULL COMMENT '1:新建，2:修改，3:删除',
  `operate` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1:新建，2:修改',
  `sectionId` int(11) unsigned NOT NULL,
  `operateUid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `operateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of right_section_operate
-- ----------------------------
INSERT INTO `right_section_operate` VALUES ('00000000174', '2', '1', '1', '0', '100', '2019-04-12 10:42:43');
INSERT INTO `right_section_operate` VALUES ('00000000175', '2', '2', '1', '0', '100', '2019-04-12 10:42:52');
INSERT INTO `right_section_operate` VALUES ('00000000176', '2', '3', '1', '0', '100', '2019-04-12 10:43:00');
INSERT INTO `right_section_operate` VALUES ('00000000177', '2', '4', '1', '0', '100', '2019-04-12 10:43:11');
INSERT INTO `right_section_operate` VALUES ('00000000178', '2', '5', '1', '0', '100', '2019-04-12 10:43:19');
INSERT INTO `right_section_operate` VALUES ('00000000179', '2', '6', '1', '0', '100', '2019-04-12 12:45:57');
INSERT INTO `right_section_operate` VALUES ('00000000180', '2', '6', '3', '0', '100', '2019-04-12 12:46:27');
INSERT INTO `right_section_operate` VALUES ('00000000181', '2', '7', '1', '0', '100', '2019-04-13 09:25:22');
INSERT INTO `right_section_operate` VALUES ('00000000182', '2', '8', '1', '0', '100', '2019-04-15 11:12:37');

-- ----------------------------
-- Table structure for right_section_user
-- ----------------------------
DROP TABLE IF EXISTS `right_section_user`;
CREATE TABLE `right_section_user` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `default` tinyint(4) NOT NULL DEFAULT '0',
  `seller_id` int(11) unsigned NOT NULL,
  `sectionId` int(11) unsigned NOT NULL,
  `userId` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_section` (`seller_id`,`sectionId`) USING BTREE,
  KEY `index_user` (`seller_id`,`userId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of right_section_user
-- ----------------------------
INSERT INTO `right_section_user` VALUES ('00000000012', '0', '2', '3', '7');
INSERT INTO `right_section_user` VALUES ('00000000013', '0', '2', '4', '8');
INSERT INTO `right_section_user` VALUES ('00000000014', '0', '2', '5', '9');
INSERT INTO `right_section_user` VALUES ('00000000015', '0', '2', '2', '10');
INSERT INTO `right_section_user` VALUES ('00000000016', '0', '2', '1', '11');
INSERT INTO `right_section_user` VALUES ('00000000017', '0', '2', '2', '12');
INSERT INTO `right_section_user` VALUES ('00000000018', '0', '2', '3', '13');

-- ----------------------------
-- Table structure for right_staff_role
-- ----------------------------
DROP TABLE IF EXISTS `right_staff_role`;
CREATE TABLE `right_staff_role` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `default` tinyint(4) NOT NULL DEFAULT '0',
  `seller_id` int(11) unsigned NOT NULL COMMENT '客户序号',
  `userId` bigint(11) unsigned NOT NULL,
  `roleId` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user` (`seller_id`,`userId`) USING BTREE,
  KEY `index_role` (`userId`,`roleId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of right_staff_role
-- ----------------------------
INSERT INTO `right_staff_role` VALUES ('19', '0', '2', '7', '4');
INSERT INTO `right_staff_role` VALUES ('20', '0', '2', '8', '5');
INSERT INTO `right_staff_role` VALUES ('21', '0', '2', '9', '6');
INSERT INTO `right_staff_role` VALUES ('22', '0', '2', '10', '6');
INSERT INTO `right_staff_role` VALUES ('23', '0', '2', '11', '6');
INSERT INTO `right_staff_role` VALUES ('24', '0', '2', '12', '6');
INSERT INTO `right_staff_role` VALUES ('25', '0', '2', '13', '4');

-- ----------------------------
-- Table structure for service
-- ----------------------------
DROP TABLE IF EXISTS `service`;
CREATE TABLE `service` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `des` varchar(255) DEFAULT NULL COMMENT '描述',
  `information` text COMMENT '描述信息',
  `is_show` tinyint(1) DEFAULT '0' COMMENT '1:展示',
  `sort` int(3) DEFAULT '0' COMMENT '排序：越大越靠前',
  `mid` int(10) DEFAULT '0' COMMENT '项目ID',
  `icon` varchar(255) NOT NULL COMMENT '图标',
  `creatTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `seller_id` int(10) DEFAULT NULL COMMENT '添加人',
  `nowTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `uid` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of service
-- ----------------------------
INSERT INTO `service` VALUES ('1', 'text', null, null, '0', null, null, '1111', null, '2', '2019-04-20 08:52:16', '0');
INSERT INTO `service` VALUES ('3', 'zcy11', '', null, '0', '0', '0', 'sdfd', '2019-04-19 17:01:57', '1', '2019-04-20 08:52:16', '0');
INSERT INTO `service` VALUES ('5', 'z7112', '111222', null, '1', '0', '0', 'sdfd2', '2019-04-20 12:46:17', '2', '2019-04-22 09:33:44', '0');
INSERT INTO `service` VALUES ('6', 'zcy114', '111222', null, '1', '0', '0', 'sdfd2', '2019-04-20 12:57:30', '2', '2019-04-20 12:57:30', '0');
INSERT INTO `service` VALUES ('7', 'zcy1140', '111222', null, '1', '0', '0', 'sdfd2', '2019-04-20 15:13:46', '2', '2019-04-20 15:13:46', '0');
INSERT INTO `service` VALUES ('8', 'zcy11400', '111222', null, '1', '0', '0', 'sdfd2', '2019-04-20 15:15:19', '2', '2019-04-20 15:15:19', '0');
INSERT INTO `service` VALUES ('9', 'zcy114000', '111222', null, '1', '0', '0', 'sdfd2', '2019-04-20 15:29:01', '2', '2019-04-20 15:29:01', '0');
INSERT INTO `service` VALUES ('10', 'zcy2', '111222', null, '1', '0', '0', 'sdfd2', '2019-04-20 15:34:20', '2', '2019-04-20 15:34:20', '0');
INSERT INTO `service` VALUES ('11', 'zcy21', '111222', null, '1', '0', '0', 'sdfd2', '2019-04-20 15:39:36', '1', '2019-04-20 15:39:36', '0');
INSERT INTO `service` VALUES ('12', 'zcy212', '111222', null, '1', '0', '0', 'sdfd2', '2019-04-20 15:40:03', '2', '2019-04-20 15:40:03', '0');
INSERT INTO `service` VALUES ('13', 'zcy2125', '111222', null, '1', '0', '0', 'sdfd2', '2019-04-20 15:40:29', '1', '2019-04-20 15:40:29', '0');
INSERT INTO `service` VALUES ('14', 'zcy212577', '111222', null, '1', '0', '0', 'sdfd2', '2019-04-20 15:51:29', '1', '2019-04-20 15:51:29', '0');
INSERT INTO `service` VALUES ('15', 'y', '111222', null, '1', '0', '0', 'sdfd2', '2019-04-20 15:53:13', '2', '2019-04-20 15:53:13', '0');
INSERT INTO `service` VALUES ('16', 'y1', '111222', null, '1', '0', '0', 'sdfd2', '2019-04-20 16:06:34', '2', '2019-04-20 16:06:34', '0');
INSERT INTO `service` VALUES ('17', 'y12', '111222', null, '1', '0', '0', 'sdfd2', '2019-04-20 16:07:14', '2', '2019-04-20 16:07:14', '0');
INSERT INTO `service` VALUES ('18', 'y125', '111222', null, '1', '0', '0', 'sdfd2', '2019-04-20 16:14:33', '2', '2019-04-20 16:14:33', '0');
INSERT INTO `service` VALUES ('19', 'z', '111222', null, '1', '0', '0', 'sdfd2', '2019-04-20 16:23:18', '1', '2019-04-20 16:23:18', '0');
INSERT INTO `service` VALUES ('20', 'z1', '111222', null, '1', '0', '0', 'sdfd2', '2019-04-20 16:43:56', '1', '2019-04-20 16:43:56', '0');
INSERT INTO `service` VALUES ('21', 'z12', '111222', null, '1', '0', '0', 'sdfd2', '2019-04-20 16:44:59', '1', '2019-04-20 16:44:59', '0');
INSERT INTO `service` VALUES ('22', 'z120', '111222', null, '1', '0', '0', 'sdfd2', '2019-04-22 08:44:29', '2', '2019-04-22 08:44:29', '0');
INSERT INTO `service` VALUES ('23', 'z8', '111222', null, '1', '0', '0', 'sdfd2', '2019-04-22 09:01:35', '2', '2019-04-22 09:01:35', '0');
INSERT INTO `service` VALUES ('24', 'z7', '111222', null, '1', '0', '0', 'sdfd2', '2019-04-22 09:06:28', '2', '2019-04-22 09:06:28', '0');
INSERT INTO `service` VALUES ('25', 'z71', '111222', null, '1', '0', '0', 'sdfd2', '2019-04-22 09:07:40', '2', '2019-04-22 09:07:40', '0');
INSERT INTO `service` VALUES ('26', 'z71120', '111222', null, '1', '0', '0', 'sdfd2', '2019-04-22 10:19:33', '2', '2019-04-22 10:19:33', '0');
INSERT INTO `service` VALUES ('27', 'z711200', '111222', null, '1', '0', '0', 'sdfd2', '2019-04-22 10:20:35', '2', '2019-04-22 10:20:35', '0');
INSERT INTO `service` VALUES ('28', 'z7112000', '111222', null, '1', '0', '0', 'sdfd2', '2019-04-22 10:21:44', '2', '2019-04-22 10:21:44', '0');
INSERT INTO `service` VALUES ('29', 'z717', '111222', null, '1', '0', '0', 'sdfd2', '2019-04-22 10:22:13', '2', '2019-04-22 10:22:13', '0');
INSERT INTO `service` VALUES ('30', 'z7178', '111222', null, '1', '0', '0', 'sdfd2', '2019-04-22 10:24:58', '2', '2019-04-22 10:24:58', '101');
INSERT INTO `service` VALUES ('31', 'z71785', '111222', null, '1', '0', '0', 'sdfd2', '2019-04-22 10:38:11', '2', '2019-04-22 10:38:11', '101');
INSERT INTO `service` VALUES ('32', 'z717858', '111222', null, '1', '0', '0', 'sdfd2', '2019-04-22 11:17:37', '2', '2019-04-22 11:17:37', '102');
INSERT INTO `service` VALUES ('33', 'a', '111222', null, '1', '0', '0', 'sdfd2', '2019-04-22 12:05:41', '2', '2019-04-22 12:05:41', '101');
INSERT INTO `service` VALUES ('34', 'a1', '111222', null, '1', '0', '0', 'sdfd2', '2019-04-22 12:20:33', '2', '2019-04-22 12:20:33', '101');
INSERT INTO `service` VALUES ('35', 'a2', '111222', null, '1', '0', '0', 'sdfd2', '2019-04-22 12:21:21', '3', '2019-04-22 12:21:21', '102');
INSERT INTO `service` VALUES ('36', 'a23', '111222', null, '1', '0', '0', 'sdfd2', '2019-04-22 12:24:15', '3', '2019-04-22 12:24:15', '102');
INSERT INTO `service` VALUES ('37', 'a238', '111222', null, '1', '0', '0', 'sdfd2', '2019-04-22 12:26:18', '3', '2019-04-22 12:26:18', '102');
INSERT INTO `service` VALUES ('38', 'a7', '111222', null, '1', '0', '0', 'sdfd2', '2019-04-22 12:30:07', '3', '2019-04-22 12:30:07', '102');
INSERT INTO `service` VALUES ('39', 'a77', '111222', null, '1', '0', '0', 'sdfd2', '2019-04-22 12:43:11', '3', '2019-04-22 12:43:11', '102');

-- ----------------------------
-- Table structure for system_index
-- ----------------------------
DROP TABLE IF EXISTS `system_index`;
CREATE TABLE `system_index` (
  `businessId` int(11) NOT NULL,
  `names` varchar(200) NOT NULL,
  `indexid` bigint(20) unsigned NOT NULL COMMENT '客户序号',
  PRIMARY KEY (`businessId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_index
-- ----------------------------
INSERT INTO `system_index` VALUES ('101', '岗位资料', '2');
INSERT INTO `system_index` VALUES ('102', '部门资料', '12');
INSERT INTO `system_index` VALUES ('201', '账号资料', '4');
INSERT INTO `system_index` VALUES ('301', '销售订单', '1');
INSERT INTO `system_index` VALUES ('501', '商品分类', '13');
INSERT INTO `system_index` VALUES ('502', '商品属性', '2');
INSERT INTO `system_index` VALUES ('503', '商品资料', '45');

-- ----------------------------
-- Table structure for system_role
-- ----------------------------
DROP TABLE IF EXISTS `system_role`;
CREATE TABLE `system_role` (
  `id` int(11) NOT NULL,
  `dnames` varchar(200) NOT NULL,
  `used` tinyint(20) unsigned NOT NULL COMMENT '客户序号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_role
-- ----------------------------
INSERT INTO `system_role` VALUES ('1', '后台', '0');
INSERT INTO `system_role` VALUES ('2', '中介', '0');
INSERT INTO `system_role` VALUES ('3', '用户', '0');
INSERT INTO `system_role` VALUES ('4', '业务员', '1');
INSERT INTO `system_role` VALUES ('5', '跟单员', '1');
INSERT INTO `system_role` VALUES ('6', '普通员工', '1');

-- ----------------------------
-- Table structure for system_set
-- ----------------------------
DROP TABLE IF EXISTS `system_set`;
CREATE TABLE `system_set` (
  `setKey` varchar(30) NOT NULL,
  `setVaule` varchar(400) NOT NULL,
  PRIMARY KEY (`setKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_set
-- ----------------------------
INSERT INTO `system_set` VALUES ('', '');

-- ----------------------------
-- Table structure for user_login
-- ----------------------------
DROP TABLE IF EXISTS `user_login`;
CREATE TABLE `user_login` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `dnames` varchar(64) NOT NULL COMMENT '用户昵称',
  `mobile` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL COMMENT '邮箱地址',
  `password` varchar(250) NOT NULL COMMENT '密码：MD5加密 ',
  `salt` char(8) NOT NULL COMMENT '随机数',
  `loginTime` datetime DEFAULT NULL,
  `loginIp` varchar(24) NOT NULL DEFAULT '',
  `loginTimes` int(6) NOT NULL DEFAULT '0',
  `locked` tinyint(6) NOT NULL DEFAULT '0',
  `lockedTime` datetime DEFAULT NULL,
  `openId` varchar(36) NOT NULL,
  `deleted` tinyint(6) NOT NULL DEFAULT '0',
  `createtime` datetime DEFAULT NULL,
  `seller_id` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `openId` (`openId`) USING BTREE,
  KEY `mobile` (`mobile`) USING BTREE,
  KEY `dnames` (`dnames`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8 COMMENT='系统用户表';

-- ----------------------------
-- Records of user_login
-- ----------------------------
INSERT INTO `user_login` VALUES ('2', '18257990958', '18257990958', '', '', '', null, '', '0', '0', null, '', '0', '2019-04-17 15:43:40', '0');
INSERT INTO `user_login` VALUES ('3', '18357991416', '18357991416', '', '', '', null, '', '0', '0', null, '', '0', '2019-04-17 15:46:33', '0');
INSERT INTO `user_login` VALUES ('6', '15258965121', '15258965121', '', '', '', '2019-04-13 14:41:18', '127.0.0.1', '7', '0', null, 'ozCQF5unEnM8EztLsG8YZ2NFu4NgS', '0', '2019-04-12 09:42:37', '0');
INSERT INTO `user_login` VALUES ('7', 'yewuyuan1', '13000000001', '', 'bf268ebed41eb358e814789e212d33fc55efea83', 'u65vy5wd', '2019-04-13 08:59:46', '192.168.0.175', '5', '0', null, 'ozCQF5naWyHXUiQ1gmm00LkiOxrg', '0', '2019-04-12 10:45:19', '0');
INSERT INTO `user_login` VALUES ('8', 'gengdanyuan1', '13000000002', '', 'c1bea1a442f2016ae4075d7b226c9a0cbd0ba773', 'fhh7qsgu', null, '', '0', '0', null, '', '0', '2019-04-12 10:46:15', '0');
INSERT INTO `user_login` VALUES ('9', 'fengkong1', '13000000003', '', 'ec97a5e22caefb1c77d08eecbe689f4b43b53471', 'zbycobiv', '2019-04-15 13:45:35', '127.0.0.1', '4', '0', null, '', '0', '2019-04-12 10:50:22', '0');
INSERT INTO `user_login` VALUES ('10', 'caiwu1', '13000000005', '', '7f02883734b0b75b3d83edfcd6d012a24660c272', 'ugz64ujg', '2019-04-12 13:28:26', '192.168.0.175', '1', '0', null, '', '0', '2019-04-12 10:52:02', '0');
INSERT INTO `user_login` VALUES ('11', 'jishuyuan1', '13000000006', '', '48f6d1816c265f31656aaff25614942ffb929d85', 'tm64v53f', null, '', '0', '0', null, '', '0', '2019-04-12 10:56:01', '0');
INSERT INTO `user_login` VALUES ('12', 'caiwu2', '13000000007', '', '9117e6ea58a82794ad8cc0239aae56ec1eaf55d8', '9v3mupit', null, '', '0', '0', null, '', '0', '2019-04-12 12:44:13', '0');
INSERT INTO `user_login` VALUES ('13', 'fk001', '15212351235', '', '7d24a329320ecb0f1ea1985f7b8c82a2ec22d6eb', 'nydalpk2', '2019-04-13 10:34:51', '192.168.0.137', '3', '0', '2019-04-13 10:48:20', '', '0', '2019-04-13 09:22:04', '0');
INSERT INTO `user_login` VALUES ('14', '15258965126', '15258965126', '', '', '', null, '', '0', '0', null, '', '0', '2019-04-13 09:49:41', '0');
INSERT INTO `user_login` VALUES ('15', '13967406338', '13967406338', '', '', '', '2019-04-15 12:47:57', '192.168.0.150', '2', '0', null, 'ozCQF5pZAg3kLM4A-LoS-VOdnw5c', '0', '2019-04-15 10:31:28', '0');
INSERT INTO `user_login` VALUES ('16', '15258965122', '15258965122', '', '', '', '2019-04-15 15:38:59', '127.0.0.1', '1', '0', null, 'ozCQF5unEnM8EztLsG8YZ2NFu4Ng', '0', '2019-04-15 10:36:12', '0');
INSERT INTO `user_login` VALUES ('100', 'admin', '15258965120', '1793182685@qq.com', '4189c0867f4e3630b68846e97917be11183a705c', 'salt', '2019-04-22 10:37:02', '192.168.0.199', '267', '0', null, '', '0', null, '1');
INSERT INTO `user_login` VALUES ('101', 'zcy', '18257990958', '18257990958@139.com', '4189c0867f4e3630b68846e97917be11183a705c', 'salt', '2019-04-22 16:14:05', '192.168.0.199', '31', '0', '0000-00-00 00:00:00', '', '0', '0000-00-00 00:00:00', '2');
INSERT INTO `user_login` VALUES ('102', 'wx', '18357991416', '18357991416@139.com', '4189c0867f4e3630b68846e97917be11183a705c', 'salt', '2019-04-22 13:50:03', '192.168.0.199', '8', '0', null, '', '0', null, '3');

-- ----------------------------
-- Table structure for user_medium
-- ----------------------------
DROP TABLE IF EXISTS `user_medium`;
CREATE TABLE `user_medium` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) unsigned NOT NULL,
  `mediumId` bigint(20) DEFAULT NULL,
  `createUserId` bigint(20) NOT NULL DEFAULT '0',
  `deleted` tinyint(6) NOT NULL DEFAULT '0',
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_medium
-- ----------------------------
INSERT INTO `user_medium` VALUES ('1', '2', '1', '107', '0', '2019-04-16 16:42:49');
INSERT INTO `user_medium` VALUES ('6', '2', '2', '100', '0', '2019-04-17 15:43:40');
INSERT INTO `user_medium` VALUES ('8', '2', '3', '100', '0', '2019-04-17 15:46:33');

-- ----------------------------
-- Table structure for user_operate
-- ----------------------------
DROP TABLE IF EXISTS `user_operate`;
CREATE TABLE `user_operate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) unsigned NOT NULL,
  `userId` int(11) unsigned NOT NULL,
  `operate` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1:新建，2:修改，3:启用，4:停用, 5:设置部门, 6:设置岗位',
  `sectionId` int(11) unsigned NOT NULL,
  `operateUid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `operateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_operate
-- ----------------------------
INSERT INTO `user_operate` VALUES ('1', '0', '1', '1', '0', '107', '2019-04-16 16:42:49');
INSERT INTO `user_operate` VALUES ('2', '0', '3', '1', '0', '100', '2019-04-17 15:46:33');

-- ----------------------------
-- Table structure for user_profile
-- ----------------------------
DROP TABLE IF EXISTS `user_profile`;
CREATE TABLE `user_profile` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '员工编号，通过会员序号表获取',
  `pic` varchar(255) NOT NULL DEFAULT '' COMMENT '员工的照片',
  `dnames` varchar(64) NOT NULL DEFAULT '' COMMENT '员工姓名',
  `mobile` varchar(50) NOT NULL DEFAULT '',
  `entryTime` datetime DEFAULT NULL,
  `salary` int(10) NOT NULL DEFAULT '0' COMMENT '月薪',
  `sex` tinyint(1) NOT NULL DEFAULT '1' COMMENT '性别(1:男 0：女)',
  `officePhone` varchar(32) NOT NULL DEFAULT '' COMMENT '办公电话',
  `idCard` varchar(30) NOT NULL DEFAULT '',
  `bank` varchar(80) NOT NULL DEFAULT '',
  `bankNo` varchar(30) NOT NULL DEFAULT '',
  `wxNo` varchar(30) NOT NULL DEFAULT '',
  `zfbNo` varchar(30) NOT NULL DEFAULT '',
  `qq` varchar(15) NOT NULL DEFAULT '' COMMENT 'qq',
  `qqPasswd` varchar(50) NOT NULL DEFAULT '',
  `birthDay` date DEFAULT NULL COMMENT '出生日期',
  `ethnic` varchar(100) NOT NULL DEFAULT '',
  `homeAddress` varchar(255) NOT NULL DEFAULT '' COMMENT '家庭住址',
  `nowAddress` varchar(255) NOT NULL DEFAULT '' COMMENT '现住地址',
  `educational` varchar(50) NOT NULL DEFAULT '',
  `graduateSchool` varchar(200) NOT NULL DEFAULT '',
  `graduateTime` date DEFAULT NULL COMMENT '入职时间',
  `profession` varchar(80) NOT NULL DEFAULT '',
  `speciality` varchar(255) NOT NULL DEFAULT '' COMMENT '特长',
  `dstatus` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0:离职 1：在职',
  `userId` bigint(20) NOT NULL DEFAULT '0' COMMENT '登陆用户编号（0表示没有登陆账号）',
  `nativePlace` varchar(255) NOT NULL DEFAULT '',
  `major` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user_id` (`userId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_profile
-- ----------------------------
INSERT INTO `user_profile` VALUES ('100', '', 'admin', '', null, '0', '1', '', '', '', '', '', '', '', '', null, '', '', '', '', '', null, '', '', '1', '100', '', '');
INSERT INTO `user_profile` VALUES ('101', '', '张晨跃', '18357991416', '0000-00-00 00:00:00', '0', '0', '', '362565985525412589', '中国银行', '251236212523651', '', '', '0', '', '0000-00-00', '', '', '', '', '', '0000-00-00', '', '', '1', '101', '', '');
INSERT INTO `user_profile` VALUES ('132', '', '张三', '15258965121', null, '0', '0', '', '56236598745125635X', '', '', '', '', '0', '', null, '', '', '', '', '', null, '', '', '1', '6', '', '');
INSERT INTO `user_profile` VALUES ('133', 'http://211.155.230.114:4869/f5dd139dd7e3037eb37bf3657f591d92', '业务员1', '13000000001', null, '0', '0', '', '', '', '', '', '', '0', '', null, '', '', '', '', '', null, '', '', '1', '7', '', '');
INSERT INTO `user_profile` VALUES ('134', 'http://211.155.230.114:4869/044099f3821d29014dfa1f1d4adb0c23', '跟单员1', '13000000002', null, '0', '0', '', '', '', '', '', '', '0', '', null, '', '', '', '', '', null, '', '', '1', '8', '', '');
INSERT INTO `user_profile` VALUES ('135', 'http://211.155.230.114:4869/5d307da54e63aabd9138bf4771b18a2a', '风控1', '13000000003', null, '0', '0', '', '', '', '', '', '', '0', '', null, '', '', '', '', '', null, '', '', '1', '9', '', '');
INSERT INTO `user_profile` VALUES ('136', 'http://211.155.230.114:4869/043992a53ba16c37abaff210071797a8', '财务1', '13000000005', null, '0', '0', '', '', '', '', '', '', '0', '', null, '', '', '', '', '', null, '', '', '1', '10', '', '');
INSERT INTO `user_profile` VALUES ('137', '', '技术员1', '13000000006', null, '0', '0', '', '', '', '', '', '', '0', '', null, '', '', '', '', '', null, '', '', '1', '11', '', '');
INSERT INTO `user_profile` VALUES ('138', 'http://211.155.230.114:4869/2fc76194da8c238c78f54b502758c042', '财务2', '13000000007', null, '0', '0', '', '', '', '', '', '', '0', '', null, '', '', '', '', '', null, '', '', '1', '12', '', '');
INSERT INTO `user_profile` VALUES ('139', 'http://211.155.230.114:4869/019acfe7bd0f44cc6652c2c2d8dcc830', '风控1部业务员', '15212351235', null, '0', '0', '', '420115198512531256', '', '', '', '', '0', '', null, '', '', '', '', '', null, '', '', '1', '13', '', '');
INSERT INTO `user_profile` VALUES ('140', '', '李四', '15258965126', null, '0', '0', '', '362565985525412589', '中国银行', '251236212523651', '', '', '0', '', null, '', '', '', '', '', null, '', '', '1', '14', '', '');
INSERT INTO `user_profile` VALUES ('141', '', '李振宇', '13967406338', null, '0', '0', '', '33078819657463', '', '', '', '', '0', '', null, '', '', '', '', '', null, '', '', '1', '15', '', '');
INSERT INTO `user_profile` VALUES ('142', '', '李四', '15258965122', null, '0', '0', '', '', '', '', '', '', '0', '', null, '', '', '', '', '', null, '', '', '1', '16', '', '');
INSERT INTO `user_profile` VALUES ('148', '', '李四', '18257990958', null, '0', '0', '', '362565985525412589', '中国银行', '251236212523651', '', '', '0', '', null, '', '', '', '', '', null, '', '', '1', '2', '', '');
INSERT INTO `user_profile` VALUES ('150', '', '李四', '18357991416', null, '0', '0', '', '362565985525412589', '中国银行', '251236212523651', '', '', '0', '', null, '', '', '', '', '', null, '', '', '1', '3', '', '');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `defaulte` tinyint(4) NOT NULL DEFAULT '0',
  `useId` bigint(20) NOT NULL COMMENT '用户编号',
  `roleId` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_user` (`useId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('100', '1', '100', '1');
INSERT INTO `user_role` VALUES ('101', '0', '1', '2');
INSERT INTO `user_role` VALUES ('105', '0', '2', '2');
INSERT INTO `user_role` VALUES ('107', '0', '3', '2');
INSERT INTO `user_role` VALUES ('108', '1', '101', '3');
INSERT INTO `user_role` VALUES ('109', '1', '102', '3');

-- ----------------------------
-- Table structure for user_seller
-- ----------------------------
DROP TABLE IF EXISTS `user_seller`;
CREATE TABLE `user_seller` (
  `seller_id` int(11) unsigned NOT NULL COMMENT '客户序号',
  `seller_name` varchar(50) NOT NULL COMMENT '客户名称',
  `legal_person` varchar(50) DEFAULT NULL COMMENT '公司法人',
  `team_type_id` smallint(6) DEFAULT '1' COMMENT '团队规模编号',
  `team_member_count` int(11) DEFAULT '0' COMMENT '团队规模具体人数',
  `zip_code` varchar(50) DEFAULT NULL COMMENT '邮政编码',
  `country_id` int(11) NOT NULL DEFAULT '0' COMMENT '国家编号',
  `address_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '地区编号',
  `address_part1` varchar(100) NOT NULL DEFAULT '' COMMENT '客户地址1',
  `address_part2` varchar(100) NOT NULL DEFAULT '' COMMENT '客户地址2',
  `homepage_url` varchar(250) DEFAULT NULL COMMENT '客户网址',
  `platform_domain` varchar(100) DEFAULT NULL COMMENT '商城域名',
  `sub_domain_url` varchar(100) DEFAULT '' COMMENT '如果是代理商且需要分配二级域名时，指定基础域名，不含www',
  `logo_url` varchar(250) DEFAULT NULL COMMENT '头像图片名称',
  `tel` varchar(50) DEFAULT NULL COMMENT '公司电话',
  `email` varchar(100) NOT NULL COMMENT '电子邮件',
  `contacts` varchar(50) NOT NULL COMMENT '联系人',
  `contacts_position` varchar(255) DEFAULT NULL,
  `contacts_birthday` date DEFAULT NULL COMMENT '联系人生日',
  `mobile_no` varchar(30) NOT NULL COMMENT '手机号码',
  `qq_no` varchar(20) NOT NULL DEFAULT '' COMMENT 'QQ',
  `msn_no` varchar(50) NOT NULL DEFAULT '' COMMENT 'MSN',
  `skype_no` varchar(20) NOT NULL DEFAULT '' COMMENT 'SKYPE',
  `description` varchar(250) DEFAULT '' COMMENT '备注',
  `start_date` date DEFAULT NULL COMMENT '计算开始时间',
  `end_date` date DEFAULT NULL COMMENT '计算结束时间',
  `is_auth` smallint(6) NOT NULL DEFAULT '0' COMMENT '认证状态',
  `is_personal` smallint(6) DEFAULT '0' COMMENT '是否是个人注册',
  `level` smallint(6) NOT NULL DEFAULT '0' COMMENT '几级代理，或者客户',
  `is_deleted` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `reason_desc` varchar(250) NOT NULL DEFAULT '' COMMENT '删除的原因',
  `create_time` datetime DEFAULT NULL,
  `create_user_id` bigint(20) DEFAULT '0',
  `update_time` datetime DEFAULT NULL,
  `update_user_id` bigint(20) DEFAULT '0',
  `is_init` tinyint(1) unsigned DEFAULT '0' COMMENT '0:未初始化，1:已初始化',
  PRIMARY KEY (`seller_id`),
  KEY `platform_domain` (`platform_domain`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_seller
-- ----------------------------
INSERT INTO `user_seller` VALUES ('1', '义乌市九域网络科技有限公司', '喻军荣', '3', '0', '322000', '0', '0', '浙江省 金华市 义乌市', '国际商贸城五区五楼网商服务区71001,71003,70989,70991(109号大门上)', 'www.shoperp.cn', 'manager.shoperp.cn', '', 'http://www.shoperp.cn/images/', '0579-85871717', 'hahavipfish@hotmail.com', '喻军荣', '', '0000-00-00', '18006517333', '1648255065 ', '', '', '浙江九域网络技术有限公司成立于2007年，注册基本资金1000万，公司专注于电子商务平台的研发及相关解决方案与服务的提供，以先进的商业理念，优秀的软件产品和专业的配套服务，引领电子商务行业技术的发展方向，推动电商模式的创新和发展。', '2015-03-01', '2020-02-29', '1', '0', '0', '0', '', '2015-03-01 21:12:42', '1', '2015-03-01 21:14:30', '1', '0');
INSERT INTO `user_seller` VALUES ('2', '盈云科技有限公司', '许总', '3', '0', '', '1', '15860', '中国 浙江省 金华市 义乌市', '北苑街道秋实路106号7楼', '', 'manager.yingyun.com', 'yingyun.com', 'http://119.37.197.41:4869/761b9d36cfd0b776211507b055f59d5c', '0579-89972306', 'hahavipfish@hotmail.com', '盈云科技', '', '0000-00-00', '13957928871', '1664823253', '', '', '', '2015-07-06', '2016-07-05', '1', '0', '1', '0', '', '2015-07-06 17:05:38', '1', '2016-04-02 10:57:29', '1', '0');
INSERT INTO `user_seller` VALUES ('3', '', '王欣', '3', '0', '322100', '0', '0', '', '', null, null, '', null, null, '', '', null, null, '', '', '', '', '', null, null, '1', '0', '0', '0', '', null, '1', null, '0', '0');

-- ----------------------------
-- Table structure for user_seller_relation
-- ----------------------------
DROP TABLE IF EXISTS `user_seller_relation`;
CREATE TABLE `user_seller_relation` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `sections` varchar(400) NOT NULL DEFAULT '',
  `postId` varchar(100) DEFAULT NULL,
  `posts` varchar(400) NOT NULL DEFAULT '',
  `roles` varchar(400) NOT NULL DEFAULT '',
  `superd` tinyint(4) NOT NULL DEFAULT '0',
  `defaulte` tinyint(4) NOT NULL DEFAULT '0',
  `deleted` tinyint(6) NOT NULL DEFAULT '0',
  `seller_id` int(11) unsigned NOT NULL COMMENT '客户序号',
  `userId` bigint(11) unsigned NOT NULL,
  `nowTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_seller_relation
-- ----------------------------
INSERT INTO `user_seller_relation` VALUES ('100', '', null, '', '', '1', '1', '0', '2', '100', '2019-02-25 09:42:53');
INSERT INTO `user_seller_relation` VALUES ('101', '', '1', '1', '1', '0', '1', '0', '2', '101', '2019-02-25 09:42:53');

-- ----------------------------
-- Table structure for user_shop
-- ----------------------------
DROP TABLE IF EXISTS `user_shop`;
CREATE TABLE `user_shop` (
  `seller_id` bigint(20) unsigned NOT NULL COMMENT '客户编号',
  `shop_id` smallint(6) NOT NULL COMMENT '店铺编号',
  `shop_name` varchar(50) NOT NULL COMMENT '店铺简介',
  `shop_description` varchar(250) NOT NULL COMMENT '店铺名称',
  `page_title` varchar(250) DEFAULT NULL COMMENT '店铺名称',
  `page_keywords` varchar(250) DEFAULT NULL COMMENT '分类的关键词',
  `page_description` varchar(250) DEFAULT NULL COMMENT '分类描述信息',
  `master_qq` varchar(125) DEFAULT '' COMMENT '站长QQ',
  `qq_info` varchar(255) DEFAULT NULL,
  `master` varchar(125) DEFAULT '' COMMENT '站长名字（联系人）',
  `shop_url` varchar(100) NOT NULL COMMENT '店铺域名',
  `shop_url_self` varchar(100) DEFAULT NULL COMMENT '自有域名',
  `shop_tag` varchar(20) NOT NULL DEFAULT '' COMMENT '店铺标记',
  `lang_name_view` smallint(6) NOT NULL DEFAULT '1' COMMENT '表现语言(1:中文 2:英文)',
  `lang_name_sys` smallint(6) NOT NULL DEFAULT '1' COMMENT '后台语言(1:中文 2:英文)',
  `currency_name_view` smallint(6) NOT NULL DEFAULT '1' COMMENT '表现币种(1:人民币 2:美元)',
  `currency_name_sys` smallint(6) NOT NULL DEFAULT '1' COMMENT '结算币种(1:人民币 2:美元)',
  `image_url` varchar(100) DEFAULT NULL COMMENT '店铺Logo图片',
  `image_base_name` varchar(50) DEFAULT NULL COMMENT '店铺Logo名称',
  `image_tips` varchar(250) DEFAULT NULL COMMENT '图片说明',
  `country_id` int(11) NOT NULL DEFAULT '0' COMMENT '国家编号',
  `address_id` int(11) NOT NULL DEFAULT '0' COMMENT '地区编号',
  `shop_address1` varchar(250) NOT NULL DEFAULT '' COMMENT '店铺地址1',
  `shop_address2` varchar(250) NOT NULL DEFAULT '' COMMENT '店铺地址2',
  `services_tel` varchar(30) NOT NULL DEFAULT '' COMMENT '客服电话',
  `copyright` varchar(250) NOT NULL DEFAULT '' COMMENT '版权信息',
  `is_card` smallint(6) DEFAULT '0' COMMENT '0:不需要提供绑定会员卡功能 1：提供',
  `erweima` varchar(255) DEFAULT '' COMMENT '在商城首页显示二维码的图片路径',
  `is_closed` smallint(6) DEFAULT '0' COMMENT '0:不关闭 1:关闭',
  `reason_desc` varchar(250) NOT NULL DEFAULT '' COMMENT '关闭店铺的原因',
  `closed_time` datetime DEFAULT NULL COMMENT '关闭店铺时间',
  `domain_record` varchar(30) DEFAULT NULL COMMENT '域名备案号',
  `token` varchar(160) NOT NULL COMMENT '序列号',
  `update_user_id` bigint(20) unsigned DEFAULT '0' COMMENT '关闭店铺的用户编号',
  PRIMARY KEY (`seller_id`,`shop_id`),
  UNIQUE KEY `shop_url` (`shop_url`) USING BTREE,
  KEY `currency_name_view` (`currency_name_view`) USING BTREE,
  KEY `lang_name_view` (`lang_name_view`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_shop
-- ----------------------------
INSERT INTO `user_shop` VALUES ('1', '1', '默认店铺', '', '测试店铺1', '电子商务平台', '浙江九域网络技术有限公司成立于2007年，注册基本资金1000万，公司专注于电子商务平台的研发及相关解决方案与服务的提供，以先进的商业理念，优秀的软件产品和专业的配套服务，引领电子商务行业技术的发展方向，推动电商模式的创新和发展。', '1648255065', '', '喻军荣', 'manager.shoperp.cn', 'admin.cyy.com', 'shoperp', '1', '1', '1', '1', 'http://www.shoperp.cn/images/', 'logo.png', '电子商务平台演示店铺', '0', '0', '浙江省 金华市 义乌市', '国际商贸城五区五楼网商服务区71001,71003,70989,70991(109号大门上)-china', '0579-85871717', 'Copyright ©2015-2020 www.wanghuo.hk, All Rights Reserved', '0', '', '0', '', '0000-00-00 00:00:00', '', '12655', '0');
INSERT INTO `user_shop` VALUES ('2', '1', '御华金融', '客户的总店，在有分店的情况下，可以管理所有分店商品和订单', '御华金融-标题', '御华金融-关键字', '御华金融-描述', '33637025@qq.com', '', '御华金融', 'smallprogram.yhjr.com', 'zcy.cyy.com', '', '1', '1', '1', '1', 'http://47.96.95.57:4869/6edd87c228b63312d797b09a1eba866e', '', '', '1', '15860', '浙江省 金华市 义乌市', '北苑街道秋实路106号7楼', '0579-89972306', 'Copyright ©2018 盈云科技YingYun-link.com 版权所有', '0', '', '0', '', null, '浙ICP备09021316号-1', '123456', '173');
INSERT INTO `user_shop` VALUES ('3', '1', '王欣', '', null, null, null, '', null, '', '', 'wx.cyy.com', '', '1', '1', '1', '1', null, null, null, '0', '0', '', '', '', '', '0', '', '0', '', null, null, '123456', '0');

-- ----------------------------
-- Function structure for getKeyValue
-- ----------------------------
DROP FUNCTION IF EXISTS `getKeyValue`;
DELIMITER ;;
CREATE DEFINER=`newUser`@`%` FUNCTION `getKeyValue`(`pBusinessId` int,`pStep` smallint) RETURNS int(20)
BEGIN
declare sIndexid bigint;
  select indexid INTO sIndexid from system_index where businessId = pBusinessId;
  update system_index set indexid = indexid + pStep where businessId = pBusinessId;
  RETURN sIndexid;
END
;;
DELIMITER ;
