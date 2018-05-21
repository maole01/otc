/*
Navicat MySQL Data Transfer

Source Server         : 192.168.153.133
Source Server Version : 50721
Source Host           : 192.168.153.133:3306
Source Database       : jypt

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-04-20 15:34:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cy_address
-- ----------------------------
DROP TABLE IF EXISTS `cy_address`;
CREATE TABLE `cy_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coin` varchar(20) NOT NULL COMMENT '币种',
  `address` varchar(50) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cy_address
-- ----------------------------
INSERT INTO `cy_address` VALUES ('1', '9dc', '0x0000000000000000000008', '16', '0');
INSERT INTO `cy_address` VALUES ('2', '9dc', '0x0000000000000000000001', '16', '0');
INSERT INTO `cy_address` VALUES ('3', '9dc', '0x0000000000000000000002', '16', '0');
INSERT INTO `cy_address` VALUES ('4', '9dc', '0xdfasdfsadf65sa1f3dsfsdfdf', '17', '0');
INSERT INTO `cy_address` VALUES ('5', '9dc', '0x0000000000000000000000005', '15', '0');
INSERT INTO `cy_address` VALUES ('6', '9dc', '0x50000000000000000000000006', '19', '0');
INSERT INTO `cy_address` VALUES ('7', '9dc', '0x56561516f1fffffffffffffffffffffa', null, '0');
INSERT INTO `cy_address` VALUES ('8', '9dc', '0x6516f5s1af65s1df6s5d1f6s5f1', null, '0');
INSERT INTO `cy_address` VALUES ('9', '9dc', '0x165s1df6s1fs65f16sf516df51s', null, '0');
INSERT INTO `cy_address` VALUES ('10', 'wkc', '0x51s6f51sdf651sd6f51s6fsdfsss', '16', '0');
INSERT INTO `cy_address` VALUES ('11', '9dc', '123', null, '0');
INSERT INTO `cy_address` VALUES ('12', '9dc', '1a', null, '0');
INSERT INTO `cy_address` VALUES ('13', '9dc', '1b', null, '0');
INSERT INTO `cy_address` VALUES ('14', '9dc', 'c', null, '0');

-- ----------------------------
-- Table structure for cy_admin
-- ----------------------------
DROP TABLE IF EXISTS `cy_admin`;
CREATE TABLE `cy_admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(200) NOT NULL,
  `username` char(16) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `moble` varchar(50) NOT NULL,
  `password` char(32) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `last_login_time` int(11) unsigned NOT NULL,
  `last_login_ip` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='管理员表';

-- ----------------------------
-- Records of cy_admin
-- ----------------------------
INSERT INTO `cy_admin` VALUES ('1', '', 'admin', '管理员', '', 'e10adc3949ba59abbe56e057f20f883e', '0', '0', '0', '0', '0', '1');
INSERT INTO `cy_admin` VALUES ('2', '', 'test01', 'test1', '', 'e10adc3949ba59abbe56e057f20f883e', '0', '0', '0', '0', '0', '1');
INSERT INTO `cy_admin` VALUES ('3', '', 'test02', '123', '', 'e10adc3949ba59abbe56e057f20f883e', '0', '0', '0', '0', '0', '1');

-- ----------------------------
-- Table structure for cy_adver
-- ----------------------------
DROP TABLE IF EXISTS `cy_adver`;
CREATE TABLE `cy_adver` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `url` varchar(255) NOT NULL,
  `img` varchar(250) NOT NULL,
  `type` varchar(50) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='广告图片表';

-- ----------------------------
-- Records of cy_adver
-- ----------------------------
INSERT INTO `cy_adver` VALUES ('1', '', '114.215.40.96', '593c8911d9701.jpeg', '', '1', '1497143113', '1497143114', '1');
INSERT INTO `cy_adver` VALUES ('2', '', '#', '593c89d689544.png', '', '2', '1497143293', '1497143295', '1');
INSERT INTO `cy_adver` VALUES ('3', '', '114.215.40.96', '583d4578e04cb.jpg', '', '0', '1480322388', '1480322390', '1');
INSERT INTO `cy_adver` VALUES ('4', '', '', '593c898b4c4b4.jpg', '', '0', '1497143216', '1497143218', '1');
INSERT INTO `cy_adver` VALUES ('5', '', '', '593c89a1d9701.jpg', '', '0', '1497143254', '1497143256', '1');

-- ----------------------------
-- Table structure for cy_article
-- ----------------------------
DROP TABLE IF EXISTS `cy_article`;
CREATE TABLE `cy_article` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `content` text CHARACTER SET utf8 NOT NULL,
  `adminid` int(10) unsigned NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 NOT NULL,
  `hits` int(11) unsigned NOT NULL,
  `footer` int(11) unsigned NOT NULL,
  `index` int(11) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `type` (`type`),
  KEY `adminid` (`adminid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of cy_article
-- ----------------------------

-- ----------------------------
-- Table structure for cy_auth_extend
-- ----------------------------
DROP TABLE IF EXISTS `cy_auth_extend`;
CREATE TABLE `cy_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  KEY `uid` (`group_id`),
  KEY `group_id` (`extend_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cy_auth_extend
-- ----------------------------
INSERT INTO `cy_auth_extend` VALUES ('1', '1', '1');
INSERT INTO `cy_auth_extend` VALUES ('1', '1', '2');
INSERT INTO `cy_auth_extend` VALUES ('1', '2', '1');
INSERT INTO `cy_auth_extend` VALUES ('1', '2', '2');
INSERT INTO `cy_auth_extend` VALUES ('1', '3', '1');
INSERT INTO `cy_auth_extend` VALUES ('1', '3', '2');
INSERT INTO `cy_auth_extend` VALUES ('1', '4', '1');
INSERT INTO `cy_auth_extend` VALUES ('1', '37', '1');

-- ----------------------------
-- Table structure for cy_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `cy_auth_group`;
CREATE TABLE `cy_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cy_auth_group
-- ----------------------------
INSERT INTO `cy_auth_group` VALUES ('2', 'admin', '1', '财务管理组', '拥有网站资金相关的权限', '0', '431');
INSERT INTO `cy_auth_group` VALUES ('3', 'admin', '1', '超级管理员', '超级管理员组,拥有系统所有权限', '1', '424,426,431,433,434,435,436,437,438,439,440,441,443,444,445,446,447,448,449,450,451,452,453,454,455,456,458,459,460,461,462,463,465,466,467,469,470,471,473,474,475,476,477,479,480,481,482,484,485,486,487,488,489,490,491,492,493,494,495,496,497,498,499,500,501,502,503,504,505,506,507,508,509,510,511,512,513,514,515,516,517,518,519,520,521,522,523,525,526,527,528,529,530,531,532,533,534,535,536,537,538,539,540,541,542,543,544,545,546,547,548,549');
INSERT INTO `cy_auth_group` VALUES ('4', 'admin', '1', '资讯管理员', '拥有网站文章资讯相关权限11', '-1', '');
INSERT INTO `cy_auth_group` VALUES ('5', 'admin', '1', '资讯管理员', '拥有网站文章资讯相关权限', '1', '');
INSERT INTO `cy_auth_group` VALUES ('6', 'admin', '1', '财务管理组', '拥有网站资金相关的权限333', '1', '1865,1866,1875,1876,1877,1878,1879,1880,1907,1908,1910,1922,1931,1934,1952,1955,1958,1974,2036,2039,2040,2041,2042');
INSERT INTO `cy_auth_group` VALUES ('10', 'admin', '1', '财务管理组', '拥有网站资金相关的权限333', '1', '1874,1996,2011,2013');
INSERT INTO `cy_auth_group` VALUES ('11', 'admin', '1', 'ceshi', '456782', '1', '1859,1860,1862,1863,1864,1866,1867,1868,1869,1876,1877,1878,1879,1880,1881,1882,1883,1884,1889,1890,1891,1892,1893,1894,1895,1896,1897,1898,1899,1900,1901,1902,1903,1904,1905,1906,1907,1908,1910,1911,1912,1913,1914,1915,1918,1919,1920,1921,1922,1931,1934,1935,1936,1937,1938,1939,1940,1943,1944,1958,1959,1960,1961,1962,1963,1974,1975,1976,1977,1994,1999,2000,2001,2002,2003,2021,2022,2023,2024,2025,2028,2029,2034,2035,2036,2037,2038,2039,2040,2041,2042,2043,2044,2045');

-- ----------------------------
-- Table structure for cy_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `cy_auth_group_access`;
CREATE TABLE `cy_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cy_auth_group_access
-- ----------------------------
INSERT INTO `cy_auth_group_access` VALUES ('3', '2');
INSERT INTO `cy_auth_group_access` VALUES ('2', '3');
INSERT INTO `cy_auth_group_access` VALUES ('1', '11');

-- ----------------------------
-- Table structure for cy_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `cy_auth_rule`;
CREATE TABLE `cy_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=2048 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cy_auth_rule
-- ----------------------------
INSERT INTO `cy_auth_rule` VALUES ('425', 'admin', '1', 'Admin/article/add', '新增', '-1', '');
INSERT INTO `cy_auth_rule` VALUES ('427', 'admin', '1', 'Admin/article/setStatus', '改变状态', '-1', '');
INSERT INTO `cy_auth_rule` VALUES ('428', 'admin', '1', 'Admin/article/update', '保存', '-1', '');
INSERT INTO `cy_auth_rule` VALUES ('429', 'admin', '1', 'Admin/article/autoSave', '保存草稿', '-1', '');
INSERT INTO `cy_auth_rule` VALUES ('430', 'admin', '1', 'Admin/article/move', '移动', '-1', '');
INSERT INTO `cy_auth_rule` VALUES ('432', 'admin', '2', 'Admin/Article/mydocument', '内容', '-1', '');
INSERT INTO `cy_auth_rule` VALUES ('437', 'admin', '1', 'Admin/Trade/config', '交易配置', '-1', '');
INSERT INTO `cy_auth_rule` VALUES ('449', 'admin', '1', 'Admin/Index/operate', '市场统计', '-1', '');
INSERT INTO `cy_auth_rule` VALUES ('455', 'admin', '1', 'Admin/Issue/config', '认购配置', '-1', '');
INSERT INTO `cy_auth_rule` VALUES ('457', 'admin', '1', 'Admin/Index/database/type/export', '数据备份', '-1', '');
INSERT INTO `cy_auth_rule` VALUES ('461', 'admin', '1', 'Admin/Article/chat', '聊天列表', '-1', '');
INSERT INTO `cy_auth_rule` VALUES ('464', 'admin', '1', 'Admin/Index/database/type/import', '数据还原', '-1', '');
INSERT INTO `cy_auth_rule` VALUES ('471', 'admin', '1', 'Admin/Mytx/config', '提现配置', '-1', '');
INSERT INTO `cy_auth_rule` VALUES ('472', 'admin', '2', 'Admin/Mytx/index', '提现', '-1', '');
INSERT INTO `cy_auth_rule` VALUES ('473', 'admin', '1', 'Admin/Config/market', '市场配置', '-1', '');
INSERT INTO `cy_auth_rule` VALUES ('477', 'admin', '1', 'Admin/User/myzr', '转入虚拟币', '-1', '');
INSERT INTO `cy_auth_rule` VALUES ('479', 'admin', '1', 'Admin/User/myzc', '转出虚拟币', '-1', '');
INSERT INTO `cy_auth_rule` VALUES ('482', 'admin', '2', 'Admin/ExtA/index', '扩展', '-1', '');
INSERT INTO `cy_auth_rule` VALUES ('488', 'admin', '1', 'Admin/Auth_manager/createGroup', '新增用户组', '-1', '');
INSERT INTO `cy_auth_rule` VALUES ('499', 'admin', '1', 'Admin/ExtA/index', '扩展管理', '-1', '');
INSERT INTO `cy_auth_rule` VALUES ('509', 'admin', '1', 'Admin/Article/adver_edit', '编辑', '-1', '');
INSERT INTO `cy_auth_rule` VALUES ('510', 'admin', '1', 'Admin/Article/adver_status', '修改', '-1', '');
INSERT INTO `cy_auth_rule` VALUES ('513', 'admin', '1', 'Admin/Issue/index_edit', '认购编辑', '-1', '');
INSERT INTO `cy_auth_rule` VALUES ('514', 'admin', '1', 'Admin/Issue/index_status', '认购修改', '-1', '');
INSERT INTO `cy_auth_rule` VALUES ('515', 'admin', '1', 'Admin/Article/chat_edit', '编辑', '-1', '');
INSERT INTO `cy_auth_rule` VALUES ('516', 'admin', '1', 'Admin/Article/chat_status', '修改', '-1', '');
INSERT INTO `cy_auth_rule` VALUES ('517', 'admin', '1', 'Admin/User/coin_edit', 'coin修改', '-1', '');
INSERT INTO `cy_auth_rule` VALUES ('519', 'admin', '1', 'Admin/Mycz/type_status', '状态修改', '-1', '');
INSERT INTO `cy_auth_rule` VALUES ('520', 'admin', '1', 'Admin/Issue/log_status', '认购状态', '-1', '');
INSERT INTO `cy_auth_rule` VALUES ('521', 'admin', '1', 'Admin/Issue/log_jiedong', '认购解冻', '-1', '');
INSERT INTO `cy_auth_rule` VALUES ('522', 'admin', '1', 'Admin/Tools/database/type/export', '数据备份', '-1', '');
INSERT INTO `cy_auth_rule` VALUES ('525', 'admin', '1', 'Admin/Config/coin_edit', '编辑', '-1', '');
INSERT INTO `cy_auth_rule` VALUES ('526', 'admin', '1', 'Admin/Config/coin_add', '编辑币种', '-1', '');
INSERT INTO `cy_auth_rule` VALUES ('527', 'admin', '1', 'Admin/Config/coin_status', '状态修改', '-1', '');
INSERT INTO `cy_auth_rule` VALUES ('528', 'admin', '1', 'Admin/Config/market_edit', '编辑', '-1', '');
INSERT INTO `cy_auth_rule` VALUES ('530', 'admin', '1', 'Admin/Tools/database/type/import', '数据还原', '-1', '');
INSERT INTO `cy_auth_rule` VALUES ('541', 'admin', '2', 'Admin/Trade/config', '交易', '-1', '');
INSERT INTO `cy_auth_rule` VALUES ('569', 'admin', '1', 'Admin/ADVERstatus', '修改', '-1', '');
INSERT INTO `cy_auth_rule` VALUES ('570', 'admin', '1', 'Admin/Tradelog/index', '交易记录', '-1', '');
INSERT INTO `cy_auth_rule` VALUES ('585', 'admin', '1', 'Admin/Config/mycz', '充值配置', '-1', '');
INSERT INTO `cy_auth_rule` VALUES ('590', 'admin', '1', 'Admin/Mycztype/index', '充值类型', '-1', '');
INSERT INTO `cy_auth_rule` VALUES ('600', 'admin', '1', 'Admin/Usergoods/index', '用户联系地址', '-1', '');
INSERT INTO `cy_auth_rule` VALUES ('1379', 'admin', '1', 'Admin/Bazaar/index', '集市管理', '-1', '');
INSERT INTO `cy_auth_rule` VALUES ('1405', 'admin', '1', 'Admin/Bazaar/config', '集市配置', '-1', '');
INSERT INTO `cy_auth_rule` VALUES ('1425', 'admin', '1', 'Admin/Bazaar/log', '集市记录', '-1', '');
INSERT INTO `cy_auth_rule` VALUES ('1451', 'admin', '1', 'Admin/Bazaar/invit', '集市推广', '-1', '');
INSERT INTO `cy_auth_rule` VALUES ('1846', 'admin', '1', 'Admin/AuthManager/createGroup', '新增用户组', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1847', 'admin', '1', 'Admin/AuthManager/editgroup', '编辑用户组', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1848', 'admin', '1', 'Admin/AuthManager/writeGroup', '更新用户组', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1849', 'admin', '1', 'Admin/AuthManager/changeStatus', '改变状态', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1850', 'admin', '1', 'Admin/AuthManager/access', '访问授权', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1851', 'admin', '1', 'Admin/AuthManager/category', '分类授权', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1852', 'admin', '1', 'Admin/AuthManager/user', '成员授权', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1853', 'admin', '1', 'Admin/AuthManager/tree', '成员列表授权', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1854', 'admin', '1', 'Admin/AuthManager/group', '用户组', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1855', 'admin', '1', 'Admin/AuthManager/addToGroup', '添加到用户组', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1856', 'admin', '1', 'Admin/AuthManager/removeFromGroup', '用户组移除', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1857', 'admin', '1', 'Admin/AuthManager/addToCategory', '分类添加到用户组', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1858', 'admin', '1', 'Admin/AuthManager/addToModel', '模型添加到用户组', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1859', 'admin', '1', 'Admin/Trade/status', '修改状态', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1860', 'admin', '1', 'Admin/Trade/chexiao', '撤销挂单', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1861', 'admin', '1', 'Admin/Shop/images', '图片', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1862', 'admin', '1', 'Admin/Login/index', '用户登录', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1863', 'admin', '1', 'Admin/Login/loginout', '用户退出', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1864', 'admin', '1', 'Admin/User/setpwd', '修改管理员密码', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1865', 'admin', '2', 'Admin/Index/index', '系统', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1866', 'admin', '2', 'Admin/Article/index', '内容', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1867', 'admin', '2', 'Admin/User/index', '用户', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1868', 'admin', '2', 'Admin/Finance/index', '财务', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1869', 'admin', '2', 'Admin/Trade/index', '交易', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1870', 'admin', '2', 'Admin/Game/index', '应用', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1871', 'admin', '2', 'Admin/Config/index', '设置', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1872', 'admin', '2', 'Admin/Operate/index', '运营', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1873', 'admin', '2', 'Admin/Tools/index', '工具', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1874', 'admin', '2', 'Admin/Cloud/index', '扩展', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1875', 'admin', '1', 'Admin/Index/index', '系统概览', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1876', 'admin', '1', 'Admin/Article/index', '文章管理', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1877', 'admin', '1', 'Admin/Article/edit', '编辑添加', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1878', 'admin', '1', 'Admin/Text/index', '提示文字', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1879', 'admin', '1', 'Admin/Text/edit', '编辑', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1880', 'admin', '1', 'Admin/Text/status', '修改', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1881', 'admin', '1', 'Admin/User/index', '用户管理', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1882', 'admin', '1', 'Admin/User/config', '用户配置', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1883', 'admin', '1', 'Admin/Finance/index', '财务明细', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1884', 'admin', '1', 'Admin/Finance/myczTypeEdit', '编辑添加', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1885', 'admin', '1', 'Admin/Finance/config', '配置', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1886', 'admin', '1', 'Admin/Tools/index', '清理缓存', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1887', 'admin', '1', 'Admin/Finance/type', '类型', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1888', 'admin', '1', 'Admin/Finance/type_status', '状态修改', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1889', 'admin', '1', 'Admin/User/edit', '编辑添加', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1890', 'admin', '1', 'Admin/User/status', '修改状态', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1891', 'admin', '1', 'Admin/User/adminEdit', '编辑添加', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1892', 'admin', '1', 'Admin/User/adminStatus', '修改状态', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1893', 'admin', '1', 'Admin/User/authEdit', '编辑添加', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1894', 'admin', '1', 'Admin/User/authStatus', '修改状态', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1895', 'admin', '1', 'Admin/User/authStart', '重新初始化权限', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1896', 'admin', '1', 'Admin/User/logEdit', '编辑添加', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1897', 'admin', '1', 'Admin/User/logStatus', '修改状态', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1898', 'admin', '1', 'Admin/User/qianbaoEdit', '编辑添加', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1899', 'admin', '1', 'Admin/Trade/index', '委托管理', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1900', 'admin', '1', 'Admin/User/qianbaoStatus', '修改状态', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1901', 'admin', '1', 'Admin/User/bankEdit', '编辑添加', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1902', 'admin', '1', 'Admin/User/bankStatus', '修改状态', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1903', 'admin', '1', 'Admin/User/coinEdit', '编辑添加', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1904', 'admin', '1', 'Admin/User/coinLog', '财产统计', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1905', 'admin', '1', 'Admin/User/goodsEdit', '编辑添加', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1906', 'admin', '1', 'Admin/User/goodsStatus', '修改状态', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1907', 'admin', '1', 'Admin/Article/typeEdit', '编辑添加', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1908', 'admin', '1', 'Admin/Article/linkEdit', '编辑添加', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1909', 'admin', '1', 'Admin/Config/index', '基本配置', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1910', 'admin', '1', 'Admin/Article/adverEdit', '编辑添加', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1911', 'admin', '1', 'Admin/User/authAccess', '访问授权', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1912', 'admin', '1', 'Admin/User/authAccessUp', '访问授权修改', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1913', 'admin', '1', 'Admin/User/authUser', '成员授权', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1914', 'admin', '1', 'Admin/User/authUserAdd', '成员授权增加', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1915', 'admin', '1', 'Admin/User/authUserRemove', '成员授权解除', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1916', 'admin', '1', 'Admin/Operate/index', '推广奖励', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1917', 'admin', '1', 'Admin/App/config', 'APP配置', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1918', 'admin', '1', 'AdminUser/detail', '后台用户详情', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1919', 'admin', '1', 'AdminUser/status', '后台用户状态', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1920', 'admin', '1', 'AdminUser/add', '后台用户新增', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1921', 'admin', '1', 'AdminUser/edit', '后台用户编辑', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1922', 'admin', '1', 'Admin/Articletype/edit', '编辑', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1923', 'admin', '1', 'Admin/Shop/index', '商品管理', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1924', 'admin', '1', 'Admin/Huafei/index', '充值记录', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1925', 'admin', '1', 'Admin/Huafei/config', '充值配置', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1926', 'admin', '1', 'Admin/Vote/index', '投票记录', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1927', 'admin', '1', 'Admin/Vote/type', '投票类型', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1928', 'admin', '1', 'Admin/Money/index', '理财管理', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1929', 'admin', '1', 'Admin/Issue/index', '认购管理', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1930', 'admin', '1', 'Admin/Issue/log', '认购记录', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1931', 'admin', '1', 'Admin/Article/images', '上传图片', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1932', 'admin', '1', 'Admin/Adver/edit', '编辑', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1933', 'admin', '1', 'Admin/Adver/status', '修改', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1934', 'admin', '1', 'Admin/Article/type', '文章类型', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1935', 'admin', '1', 'Admin/User/index_edit', '编辑', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1936', 'admin', '1', 'Admin/User/index_status', '修改', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1937', 'admin', '1', 'Admin/Finance/mycz', '人民币充值', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1938', 'admin', '1', 'Admin/Finance/myczTypeStatus', '状态修改', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1939', 'admin', '1', 'Admin/Finance/myczTypeImage', '上传图片', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1940', 'admin', '1', 'Admin/Finance/mytxStatus', '修改状态', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1941', 'admin', '1', 'Admin/Tools/dataExport', '备份数据库', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1942', 'admin', '1', 'Admin/Tools/dataImport', '还原数据库', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1943', 'admin', '1', 'Admin/User/admin', '管理员管理', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1944', 'admin', '1', 'Admin/Trade/log', '成交记录', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1945', 'admin', '1', 'Admin/Issue/edit', '认购编辑', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1946', 'admin', '1', 'Admin/Issue/status', '认购修改', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1947', 'admin', '1', 'Admin/Config/moble', '短信配置', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1948', 'admin', '1', 'Admin/Invit/config', '推广配置', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1949', 'admin', '1', 'Admin/App/vip_config_list', 'APP等级', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1950', 'admin', '1', 'Admin/Link/edit', '编辑', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1951', 'admin', '1', 'Admin/Link/status', '修改', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1952', 'admin', '1', 'Admin/Index/coin', '币种统计', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1953', 'admin', '1', 'Admin/Shop/config', '商城配置', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1954', 'admin', '1', 'Admin/Money/log', '理财日志', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1955', 'admin', '1', 'Admin/Index/market', '市场统计', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1956', 'admin', '1', 'Admin/Chat/edit', '编辑', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1957', 'admin', '1', 'Admin/Chat/status', '修改', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1958', 'admin', '1', 'Admin/Article/adver', '广告管理', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1959', 'admin', '1', 'Admin/Trade/chat', '交易聊天', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1960', 'admin', '1', 'Admin/Finance/myczType', '人民币充值方式', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1961', 'admin', '1', 'Admin/Usercoin/edit', '财产修改', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1962', 'admin', '1', 'Admin/Finance/mytxExcel', '导出选中', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1963', 'admin', '1', 'Admin/User/auth', '权限列表', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1964', 'admin', '1', 'Admin/Mycz/status', '修改', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1965', 'admin', '1', 'Admin/Mycztype/status', '状态修改', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1966', 'admin', '1', 'Admin/Config/contact', '客服配置', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1967', 'admin', '1', 'Admin/App/adsblock_list', 'APP广告板块', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1968', 'admin', '1', 'Admin/Tools/queue', '服务器队列', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1969', 'admin', '1', 'Admin/Tools/qianbao', '钱包检查', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1970', 'admin', '1', 'Admin/Shop/type', '商品类型', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1971', 'admin', '1', 'Admin/Fenhong/index', '分红管理', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1972', 'admin', '1', 'Admin/Huafei/type', '充值金额', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1973', 'admin', '1', 'Admin/Money/fee', '理财明细', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1974', 'admin', '1', 'Admin/Article/link', '友情链接', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1975', 'admin', '1', 'Admin/User/log', '登陆日志', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1976', 'admin', '1', 'Admin/Finance/mytx', '人民币提现', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1977', 'admin', '1', 'Admin/Finance/mytxChuli', '正在处理', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1978', 'admin', '1', 'Admin/Config/bank', '银行配置', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1979', 'admin', '1', 'Admin/Config/bank_edit', '编辑', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1980', 'admin', '1', 'Admin/Coin/edit', '编辑', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1981', 'admin', '1', 'Admin/Coin/status', '状态修改', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1982', 'admin', '1', 'Admin/Market/edit', '编辑市场', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1983', 'admin', '1', 'Admin/Config/market_add', '状态修改', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1984', 'admin', '1', 'Admin/Tools/invoke', '其他模块调用', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1985', 'admin', '1', 'Admin/Tools/optimize', '优化表', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1986', 'admin', '1', 'Admin/Tools/repair', '修复表', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1987', 'admin', '1', 'Admin/Tools/del', '删除备份文件', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1988', 'admin', '1', 'Admin/Tools/export', '备份数据库', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1989', 'admin', '1', 'Admin/Tools/import', '还原数据库', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1990', 'admin', '1', 'Admin/Tools/excel', '导出数据库', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1991', 'admin', '1', 'Admin/Tools/exportExcel', '导出Excel', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1992', 'admin', '1', 'Admin/Tools/importExecl', '导入Excel', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1993', 'admin', '1', 'Admin/Config/coin', '币种配置', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1994', 'admin', '1', 'Admin/User/detail', '用户详情', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1995', 'admin', '1', 'Admin/App/ads_user', 'APP广告用户', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1996', 'admin', '1', 'Admin/Cloud/theme', '主题模板', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1997', 'admin', '1', 'Admin/Shop/coin', '付款方式', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1998', 'admin', '1', 'Admin/Huafei/coin', '付款方式', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('1999', 'admin', '1', 'Admin/Trade/comment', '币种评论', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('2000', 'admin', '1', 'Admin/User/qianbao', '用户钱包', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('2001', 'admin', '1', 'Admin/Trade/market', '交易市场', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('2002', 'admin', '1', 'Admin/Finance/mytxConfig', '人民币提现配置', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('2003', 'admin', '1', 'Admin/Finance/mytxChexiao', '撤销提现', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('2004', 'admin', '1', 'Admin/Mytx/status', '状态修改', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('2005', 'admin', '1', 'Admin/Mytx/excel', '取消', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('2006', 'admin', '1', 'Admin/Mytx/exportExcel', '导入excel', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('2007', 'admin', '1', 'Admin/Menu/index', '菜单管理', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('2008', 'admin', '1', 'Admin/Menu/sort', '排序', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('2009', 'admin', '1', 'Admin/Menu/add', '添加', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('2010', 'admin', '1', 'Admin/Menu/edit', '编辑', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('2011', 'admin', '1', 'Admin/Cloud/kefu', '客服代码', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('2012', 'admin', '1', 'Admin/Menu/del', '删除', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('2013', 'admin', '1', 'Admin/Cloud/kefuUp', '使用', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('2014', 'admin', '1', 'Admin/Menu/toogleHide', '是否隐藏', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('2015', 'admin', '1', 'Admin/Menu/toogleDev', '是否开发', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('2016', 'admin', '1', 'Admin/Menu/importFile', '导入文件', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('2017', 'admin', '1', 'Admin/Menu/import', '导入', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('2018', 'admin', '1', 'Admin/Config/text', '提示文字', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('2019', 'admin', '1', 'Admin/Shop/log', '购物记录', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('2020', 'admin', '1', 'Admin/Fenhong/log', '分红记录', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('2021', 'admin', '1', 'Admin/User/bank', '提现地址', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('2022', 'admin', '1', 'Admin/Trade/invit', '交易推荐', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('2023', 'admin', '1', 'Admin/Finance/myzr', '虚拟币转入', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('2024', 'admin', '1', 'Admin/Finance/mytxQueren', '确认提现', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('2025', 'admin', '1', 'Admin/Finance/myzcQueren', '确认转出', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('2026', 'admin', '1', 'Admin/Config/qita', '其他配置', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('2027', 'admin', '1', 'Admin/Shop/goods', '收货地址', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('2028', 'admin', '1', 'Admin/User/coin', '用户财产', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('2029', 'admin', '1', 'Admin/Finance/myzc', '虚拟币转出', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('2030', 'admin', '1', 'Admin/Verify/code', '图形验证码', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('2031', 'admin', '1', 'Admin/Verify/mobile', '手机验证码', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('2032', 'admin', '1', 'Admin/Verify/email', '邮件验证码', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('2033', 'admin', '1', 'Admin/Config/daohang', '导航配置', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('2034', 'admin', '1', 'Admin/User/goods', '联系地址', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('2035', 'admin', '1', 'Admin/User/myzc_qr', '确认转出', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('2036', 'admin', '1', 'Admin/Article/status', '修改状态', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('2037', 'admin', '1', 'Admin/Finance/myczStatus', '修改状态', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('2038', 'admin', '1', 'Admin/Finance/myczQueren', '确认到账', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('2039', 'admin', '1', 'Admin/Article/typeStatus', '修改状态', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('2040', 'admin', '1', 'Admin/Article/linkStatus', '修改状态', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('2041', 'admin', '1', 'Admin/Article/adverStatus', '修改状态', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('2042', 'admin', '1', 'Admin/Article/adverImage', '上传图片', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('2043', 'admin', '1', 'Admin/Trade/sell', '在线出售广告管理', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('2044', 'admin', '1', 'Admin/Trade/buy', '在线购买广告管理', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('2045', 'admin', '1', 'Admin/Trade/order', '订单管理', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('2046', 'admin', '1', 'Admin/Config/address', '添加地址', '1', '');
INSERT INTO `cy_auth_rule` VALUES ('2047', 'admin', '1', 'Admin/Config/select', '查看地址', '1', '');

-- ----------------------------
-- Table structure for cy_bazaar
-- ----------------------------
DROP TABLE IF EXISTS `cy_bazaar`;
CREATE TABLE `cy_bazaar` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) unsigned NOT NULL,
  `coin` varchar(50) NOT NULL,
  `price` decimal(20,8) unsigned NOT NULL,
  `num` decimal(20,8) unsigned NOT NULL,
  `deal` decimal(20,8) unsigned NOT NULL,
  `mum` decimal(20,8) unsigned NOT NULL,
  `fee` varchar(50) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='集市交易表';

-- ----------------------------
-- Records of cy_bazaar
-- ----------------------------

-- ----------------------------
-- Table structure for cy_bazaar_config
-- ----------------------------
DROP TABLE IF EXISTS `cy_bazaar_config`;
CREATE TABLE `cy_bazaar_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `market` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '市场名称',
  `price_min` decimal(20,8) unsigned NOT NULL COMMENT '最小交易价格',
  `price_max` decimal(20,8) unsigned NOT NULL COMMENT '最大交易价格',
  `num_mix` decimal(20,8) unsigned NOT NULL COMMENT '最小交易数量',
  `num_max` decimal(20,8) unsigned NOT NULL COMMENT '最大交易数量',
  `invit_coin` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '上家赠送币种',
  `invit_1` decimal(20,8) unsigned NOT NULL COMMENT '一代赠送比例',
  `invit_2` decimal(20,8) unsigned NOT NULL COMMENT '二代赠送比例',
  `invit_3` decimal(20,8) unsigned NOT NULL COMMENT '三代赠送比例',
  `fee` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '手续费',
  `default` tinyint(2) unsigned NOT NULL COMMENT '默认',
  `sort` int(11) unsigned NOT NULL COMMENT '排序',
  `addtime` int(11) unsigned NOT NULL COMMENT '添加时间',
  `endtime` int(11) unsigned NOT NULL COMMENT '编辑时间',
  `status` tinyint(2) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `coinname` (`market`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of cy_bazaar_config
-- ----------------------------

-- ----------------------------
-- Table structure for cy_bazaar_invit
-- ----------------------------
DROP TABLE IF EXISTS `cy_bazaar_invit`;
CREATE TABLE `cy_bazaar_invit` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) unsigned NOT NULL,
  `invit` int(11) unsigned NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `type` varchar(50) CHARACTER SET utf8 NOT NULL,
  `num` decimal(20,8) unsigned NOT NULL,
  `mum` decimal(20,8) unsigned NOT NULL,
  `fee` decimal(20,8) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of cy_bazaar_invit
-- ----------------------------

-- ----------------------------
-- Table structure for cy_bazaar_log
-- ----------------------------
DROP TABLE IF EXISTS `cy_bazaar_log`;
CREATE TABLE `cy_bazaar_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) unsigned NOT NULL,
  `peerid` int(11) unsigned NOT NULL,
  `coin` varchar(50) NOT NULL,
  `price` decimal(20,8) unsigned NOT NULL,
  `num` decimal(20,8) unsigned NOT NULL,
  `mum` decimal(20,8) unsigned NOT NULL,
  `fee` varchar(50) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `status` (`status`),
  KEY `peerid` (`peerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='集市交易记录表';

-- ----------------------------
-- Records of cy_bazaar_log
-- ----------------------------

-- ----------------------------
-- Table structure for cy_category
-- ----------------------------
DROP TABLE IF EXISTS `cy_category`;
CREATE TABLE `cy_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `list_row` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '列表每页行数',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) NOT NULL COMMENT '频道页模板',
  `template_lists` varchar(100) NOT NULL COMMENT '列表页模板',
  `template_detail` varchar(100) NOT NULL COMMENT '详情页模板',
  `template_edit` varchar(100) NOT NULL COMMENT '编辑页模板',
  `model` varchar(100) NOT NULL DEFAULT '' COMMENT '关联模型',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '允许发布的内容类型',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `allow_publish` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `reply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许回复',
  `check` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) NOT NULL DEFAULT '',
  `extend` text NOT NULL COMMENT '扩展设置',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `icon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图标',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='分类表';

-- ----------------------------
-- Records of cy_category
-- ----------------------------
INSERT INTO `cy_category` VALUES ('1', 'blog', '博客', '0', '0', '10', '', '', '', '', '', '', '', '2', '2,1', '0', '0', '1', '0', '0', '1', '', '1379474947', '1382701539', '1', '0');
INSERT INTO `cy_category` VALUES ('2', 'default_blog', '默认分类', '1', '1', '10', '', '', '', '', '', '', '', '2', '2,1,3', '0', '1', '1', '0', '1', '1', '', '1379475028', '1386839751', '1', '31');

-- ----------------------------
-- Table structure for cy_chatlog
-- ----------------------------
DROP TABLE IF EXISTS `cy_chatlog`;
CREATE TABLE `cy_chatlog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `to` varchar(20) NOT NULL COMMENT '接收人',
  `from` varchar(20) NOT NULL COMMENT '发送人',
  `content` varchar(255) NOT NULL COMMENT '内容',
  `time` varchar(20) NOT NULL,
  `order_id` int(11) NOT NULL,
  `type` char(10) NOT NULL COMMENT '图片还是文字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cy_chatlog
-- ----------------------------
INSERT INTO `cy_chatlog` VALUES ('1', '15538703323', '13653912753', 'nihao', '1511916836', '39', 'text');
INSERT INTO `cy_chatlog` VALUES ('2', '13653912753', '15538703323', '打搅好', '1511916868', '39', 'text');
INSERT INTO `cy_chatlog` VALUES ('3', '15538703323', '13653912753', 'nihao1', '1511916942', '39', 'text');
INSERT INTO `cy_chatlog` VALUES ('4', '15538703323', '13653912753', 'nihao1', '1511916944', '39', 'text');
INSERT INTO `cy_chatlog` VALUES ('5', '15538703323', '13653912753', '1', '1511917259', '39', 'text');
INSERT INTO `cy_chatlog` VALUES ('6', '13653912753', '15538703323', '1', '1511917655', '39', 'text');
INSERT INTO `cy_chatlog` VALUES ('7', '13653912753', '15538703323', '2', '1511918051', '39', 'text');
INSERT INTO `cy_chatlog` VALUES ('8', '13653912753', '15538703323', '456', '1511919045', '39', 'text');
INSERT INTO `cy_chatlog` VALUES ('9', '13653912753', '15538703323', '1', '1511919060', '39', 'text');
INSERT INTO `cy_chatlog` VALUES ('10', '13653912753', '15538703323', 'https://a1.easemob.com/1174171124178996/changwai/chatfiles/04869270-d4a5-11e7-b779-378026ef37f9', '1511919081', '39', 'pic');
INSERT INTO `cy_chatlog` VALUES ('11', '15538703323', '13653912753', '1', '1511919343', '39', 'text');
INSERT INTO `cy_chatlog` VALUES ('12', '13653912753', '15538703323', '1', '1511922594', '39', 'text');
INSERT INTO `cy_chatlog` VALUES ('13', '13653912753', '15538703323', '1', '1511922604', '39', 'text');
INSERT INTO `cy_chatlog` VALUES ('14', '13653912753', '15538703323', '1', '1511923169', '39', 'text');
INSERT INTO `cy_chatlog` VALUES ('15', '13653912753', '15538703323', '1', '1511923326', '39', 'text');
INSERT INTO `cy_chatlog` VALUES ('16', '13653912753', '15538703323', '1', '1511923372', '39', 'text');
INSERT INTO `cy_chatlog` VALUES ('17', '13653912753', '15538703323', '1', '1511923411', '39', 'text');
INSERT INTO `cy_chatlog` VALUES ('18', '13653912753', '15538703323', '2', '1511923545', '39', 'text');
INSERT INTO `cy_chatlog` VALUES ('19', '13653912753', '15538703323', '4', '1511923636', '39', 'text');
INSERT INTO `cy_chatlog` VALUES ('20', '13653912753', '15538703323', '7', '1511924079', '39', 'text');
INSERT INTO `cy_chatlog` VALUES ('21', '13653912753', '15538703323', '你好', '1511924302', '39', 'text');
INSERT INTO `cy_chatlog` VALUES ('22', '13653912753', '15538703323', '我好', '1511924311', '39', 'text');
INSERT INTO `cy_chatlog` VALUES ('23', '13653912753', '15538703323', '大家好', '1511924327', '39', 'text');
INSERT INTO `cy_chatlog` VALUES ('24', '13653912753', '15538703323', '嗯？', '1511924348', '39', 'text');
INSERT INTO `cy_chatlog` VALUES ('25', '13653912753', '15538703323', '你说什么', '1511924358', '39', 'text');
INSERT INTO `cy_chatlog` VALUES ('26', '13653912753', '15538703323', 'https://a1.easemob.com/1174171124178996/changwai/chatfiles/5f47f260-d4b1-11e7-8612-fbc007e2efc2', '1511924388', '39', 'pic');
INSERT INTO `cy_chatlog` VALUES ('27', '15538703323', '13653912753', 'https://a1.easemob.com/1174171124178996/changwai/chatfiles/6ba9a7b0-d4b1-11e7-a49e-b3f0d987d47d', '1511924408', '39', 'pic');
INSERT INTO `cy_chatlog` VALUES ('28', '13653912753', '15538703323', '1', '1511927354', '39', 'text');
INSERT INTO `cy_chatlog` VALUES ('29', '13653912753', '15538703323', '你好', '1511927362', '39', 'text');
INSERT INTO `cy_chatlog` VALUES ('30', '15538703323', '13653912753', '大家好', '1511927366', '39', 'text');
INSERT INTO `cy_chatlog` VALUES ('31', '15538703324', '13653912753', '你好', '1512010004', '46', 'text');
INSERT INTO `cy_chatlog` VALUES ('32', '13653912753', '15538703324', '我富矿了', '1512010014', '46', 'text');
INSERT INTO `cy_chatlog` VALUES ('33', '15538703324', '13653912753', '我收到了', '1512010031', '46', 'text');
INSERT INTO `cy_chatlog` VALUES ('34', '13653912753', '15538703324', '你好', '1512011134', '47', 'text');
INSERT INTO `cy_chatlog` VALUES ('35', '13653912753', '15538703323', '1', '1512180915', '53', 'text');
INSERT INTO `cy_chatlog` VALUES ('36', '15978784954', '13653912753', '你好', '1512379072', '60', 'text');
INSERT INTO `cy_chatlog` VALUES ('37', '13653912753', '15978784954', '你好', '1512379078', '60', 'text');
INSERT INTO `cy_chatlog` VALUES ('38', '15978784954', '13653912753', '哈哈哈', '1512379084', '60', 'text');
INSERT INTO `cy_chatlog` VALUES ('39', '13653912753', '15978784954', '666', '1512379088', '60', 'text');
INSERT INTO `cy_chatlog` VALUES ('40', '15978784954', '13653912753', '1', '1512380124', '62', 'text');
INSERT INTO `cy_chatlog` VALUES ('41', '13653912753', '15978784954', '2', '1512380127', '62', 'text');
INSERT INTO `cy_chatlog` VALUES ('42', '15978784954', '13653912753', '11', '1512526821', '63', 'text');
INSERT INTO `cy_chatlog` VALUES ('43', '13653912753', '15978784954', '1', '1512526933', '63', 'text');
INSERT INTO `cy_chatlog` VALUES ('44', '13653912753', '15538703323', '1', '1513298971', '66', 'text');
INSERT INTO `cy_chatlog` VALUES ('45', '13653912753', '15538703323', '2', '1513298973', '66', 'text');
INSERT INTO `cy_chatlog` VALUES ('46', '13653912753', '15538703323', '你好啊', '1513299028', '66', 'text');
INSERT INTO `cy_chatlog` VALUES ('47', '13653912753', '15538703323', '大家好才是真的好', '1513299034', '66', 'text');
INSERT INTO `cy_chatlog` VALUES ('48', '15538703323', '13653912753', '1', '1513299347', '66', 'text');
INSERT INTO `cy_chatlog` VALUES ('49', '15538703323', '13653912753', '12', '1513299368', '66', 'text');
INSERT INTO `cy_chatlog` VALUES ('50', '13653912753', '15538703323', '1', '1513299757', '66', 'text');
INSERT INTO `cy_chatlog` VALUES ('51', '15538703323', '13653912753', '1', '1513299766', '66', 'text');
INSERT INTO `cy_chatlog` VALUES ('52', '13653912753', '15538703323', '1321', '1513299775', '66', 'text');
INSERT INTO `cy_chatlog` VALUES ('53', '15538703323', '13653912753', '1', '1513299816', '66', 'text');
INSERT INTO `cy_chatlog` VALUES ('54', '13653912753', '15538703323', '你好', '1513299837', '66', 'text');
INSERT INTO `cy_chatlog` VALUES ('55', '13653912753', '15538703323', '1', '1513299898', '66', 'text');
INSERT INTO `cy_chatlog` VALUES ('56', '13653912753', '15538703323', '你好', '1513299980', '66', 'text');
INSERT INTO `cy_chatlog` VALUES ('57', '15538703323', '13653912753', '1', '1513300048', '66', 'text');
INSERT INTO `cy_chatlog` VALUES ('58', '13653912753', '15538703323', '123', '1513300138', '66', 'text');
INSERT INTO `cy_chatlog` VALUES ('59', '13653912753', '15538703323', '测试', '1513300157', '66', 'text');
INSERT INTO `cy_chatlog` VALUES ('60', '13653912753', '15538703323', '1', '1513300214', '66', 'text');
INSERT INTO `cy_chatlog` VALUES ('61', '15538703323', '13653912753', '1', '1513300328', '66', 'text');
INSERT INTO `cy_chatlog` VALUES ('62', '13653912753', '15538703323', '1', '1513300346', '66', 'text');
INSERT INTO `cy_chatlog` VALUES ('63', '13653912753', '15538703323', '1', '1513300429', '66', 'text');
INSERT INTO `cy_chatlog` VALUES ('64', '15538703323', '13653912753', '1', '1513300452', '66', 'text');
INSERT INTO `cy_chatlog` VALUES ('65', '15538703323', '13653912753', '测试', '1513300471', '66', 'text');
INSERT INTO `cy_chatlog` VALUES ('66', '13653912753', '15538703323', '你好啊', '1513300483', '66', 'text');
INSERT INTO `cy_chatlog` VALUES ('67', '13653912753', '15538703323', '打搅好啊啊啊', '1513300501', '66', 'text');
INSERT INTO `cy_chatlog` VALUES ('68', '13653912753', '15538703323', '/Uploads/2017-12-15/1513305980.png', '1513305980', '66', 'pic');
INSERT INTO `cy_chatlog` VALUES ('69', '13653912753', '15538703323', '/Uploads/2017-12-15/1513306350.png', '1513306350', '66', 'pic');
INSERT INTO `cy_chatlog` VALUES ('70', '13653912753', '15538703323', '/Uploads/2017-12-15/1513306439.png', '1513306439', '66', 'pic');
INSERT INTO `cy_chatlog` VALUES ('71', '13653912753', '15538703323', '/Uploads/2017-12-15/1513306444.png', '1513306444', '66', 'pic');
INSERT INTO `cy_chatlog` VALUES ('72', '15538703323', '13653912753', '/Uploads/2017-12-15/1513306613.png', '1513306613', '66', 'pic');
INSERT INTO `cy_chatlog` VALUES ('73', '15538703323', '13653912753', '/Uploads/2017-12-15/1513306642.png', '1513306642', '66', 'pic');
INSERT INTO `cy_chatlog` VALUES ('74', '13653912753', '15538703323', '你好啊', '1513306648', '66', 'text');
INSERT INTO `cy_chatlog` VALUES ('75', '15538703323', '13653912753', 'hao1', '1513306652', '66', 'text');
INSERT INTO `cy_chatlog` VALUES ('76', '15538703323', '13653912753', '111', '1513307030', '67', 'text');
INSERT INTO `cy_chatlog` VALUES ('77', '13653912753', '15538703323', '你好', '1513307033', '67', 'text');
INSERT INTO `cy_chatlog` VALUES ('78', '13653912753', '15538703323', '你好啊', '1513307051', '67', 'text');
INSERT INTO `cy_chatlog` VALUES ('79', '15538703323', '13653912753', '1', '1513307068', '67', 'text');
INSERT INTO `cy_chatlog` VALUES ('80', '15538703323', '13653912753', '2', '1513307071', '67', 'text');
INSERT INTO `cy_chatlog` VALUES ('81', '15538703323', '13653912753', '123', '1513307083', '67', 'text');
INSERT INTO `cy_chatlog` VALUES ('82', '13653912753', '15538703323', '123', '1513307086', '67', 'text');
INSERT INTO `cy_chatlog` VALUES ('83', '13653912753', '15538703323', '1', '1513307111', '67', 'text');
INSERT INTO `cy_chatlog` VALUES ('84', '13653912753', '15538703323', '1', '1513307118', '67', 'text');
INSERT INTO `cy_chatlog` VALUES ('85', '13653912753', '15538703323', '1', '1513307119', '67', 'text');
INSERT INTO `cy_chatlog` VALUES ('86', '13653912753', '15538703323', '222', '1513307127', '67', 'text');
INSERT INTO `cy_chatlog` VALUES ('87', '15538703323', '13653912753', '1', '1513307175', '67', 'text');
INSERT INTO `cy_chatlog` VALUES ('88', '13653912753', '15538703323', '1', '1513307179', '67', 'text');
INSERT INTO `cy_chatlog` VALUES ('89', '13653912753', '15538703323', '/Uploads/2017-12-15/1513307198.png', '1513307198', '67', 'pic');
INSERT INTO `cy_chatlog` VALUES ('90', '15538703323', '13653912753', '/Uploads/2017-12-15/1513307217.jpg', '1513307218', '67', 'pic');
INSERT INTO `cy_chatlog` VALUES ('91', '15538703323', '13653912753', '??', '1513307290', '67', 'text');
INSERT INTO `cy_chatlog` VALUES ('92', '13653912753', '15538703323', '0.0', '1513307295', '67', 'text');
INSERT INTO `cy_chatlog` VALUES ('93', '15538703323', '13653912753', '1', '1513307367', '67', 'text');
INSERT INTO `cy_chatlog` VALUES ('94', '13653912753', '15538703323', '2', '1513307371', '67', 'text');
INSERT INTO `cy_chatlog` VALUES ('95', '13653912753', '15538703323', 'cedhi1', '1513307430', '67', 'text');
INSERT INTO `cy_chatlog` VALUES ('96', '15538703323', '13653912753', '1', '1513307463', '67', 'text');
INSERT INTO `cy_chatlog` VALUES ('97', '13653912753', '15538703323', '1', '1513307471', '67', 'text');
INSERT INTO `cy_chatlog` VALUES ('98', '15538703323', '13653912753', '1', '1513307571', '67', 'text');
INSERT INTO `cy_chatlog` VALUES ('99', '15538703323', '13653912753', '1', '1513307583', '67', 'text');
INSERT INTO `cy_chatlog` VALUES ('100', '15538703323', '13653912753', '12', '1513307585', '67', 'text');
INSERT INTO `cy_chatlog` VALUES ('101', '15538703323', '13653912753', '123', '1513307586', '67', 'text');
INSERT INTO `cy_chatlog` VALUES ('102', '15538703326', '15538703323', '1', '1514469591', '68', 'text');
INSERT INTO `cy_chatlog` VALUES ('103', '15538703323', '15538703326', '??', '1514469595', '68', 'text');
INSERT INTO `cy_chatlog` VALUES ('104', '15538703323', '15538703326', '555', '1514469721', '68', 'text');
INSERT INTO `cy_chatlog` VALUES ('105', '15538703323', '15538703326', '1', '1514469758', '68', 'text');
INSERT INTO `cy_chatlog` VALUES ('106', '15538703323', '15508025870', 'd ', '1516784270', '72', 'text');
INSERT INTO `cy_chatlog` VALUES ('107', '15538703323', '15508025870', 'ddd', '1516784333', '72', 'text');
INSERT INTO `cy_chatlog` VALUES ('108', '15538703323', '15508025870', '/Uploads/2018-01-24/1516784359.png', '1516784359', '72', 'pic');
INSERT INTO `cy_chatlog` VALUES ('109', '15538703323', '15508025870', 'd ', '1516784369', '72', 'text');
INSERT INTO `cy_chatlog` VALUES ('110', '13330888212', '15508025870', '我买了', '1516792929', '73', 'text');
INSERT INTO `cy_chatlog` VALUES ('111', '15508025870', '13330888212', 'aaa', '1516793232', '73', 'text');
INSERT INTO `cy_chatlog` VALUES ('112', '13330888212', '15538703323', 'd', '1516793491', '74', 'text');
INSERT INTO `cy_chatlog` VALUES ('113', '15538703323', '13330888212', 'ssssssssss', '1516793497', '74', 'text');
INSERT INTO `cy_chatlog` VALUES ('114', '15508025870', '13330888212', '62', '1516793537', '73', 'text');
INSERT INTO `cy_chatlog` VALUES ('115', '15538703323', '13330888212', 'ddddd', '1516793600', '74', 'text');
INSERT INTO `cy_chatlog` VALUES ('116', '15538703323', '13330888212', '/Uploads/2018-01-24/1516793615.png', '1516793615', '74', 'pic');
INSERT INTO `cy_chatlog` VALUES ('117', '13330888212', '15538703323', 'sss', '1516793632', '74', 'text');
INSERT INTO `cy_chatlog` VALUES ('118', '13330888212', '15538703323', 'ddd', '1516794129', '74', 'text');
INSERT INTO `cy_chatlog` VALUES ('119', '13330888212', '15538703323', 'aaaa', '1516796295', '75', 'text');
INSERT INTO `cy_chatlog` VALUES ('120', '15508025870', '13106618217', '1651651', '1516849969', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('121', '13106618217', '15508025870', '665165', '1516850012', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('122', '13106618217', '15508025870', '2+62+6', '1516850023', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('123', '13106618217', '15508025870', '5616541', '1516850031', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('124', '15508025870', '13106618217', '362151', '1516850042', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('125', '13106618217', '15508025870', 'dfsadfs', '1516850594', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('126', '13106618217', '15508025870', 'kalsdf s;ldfjs adf', '1516850597', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('127', '13106618217', '15508025870', 'kasdfklsajdf;jlsadf', '1516850599', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('128', '13106618217', '15508025870', 'kljasdf;lkjsfjs', '1516850601', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('129', '13106618217', '15508025870', 'sdf;jsdfk', '1516850602', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('130', '13106618217', '15508025870', '123', '1516850866', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('131', '15508025870', '13106618217', '1232', '1516850877', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('132', '15508025870', '13106618217', '12', '1516850903', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('133', '15508025870', '13106618217', '123', '1516850912', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('134', '15508025870', '13106618217', '124', '1516850940', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('135', '15508025870', '13106618217', '1241', '1516851279', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('136', '15508025870', '13106618217', '12', '1516851617', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('137', '15508025870', '13106618217', '12312', '1516851638', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('138', '15508025870', '13106618217', '124', '1516852215', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('139', '15508025870', '13106618217', 'qwsffw', '1516852223', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('140', '15508025870', '13106618217', '13234', '1516852285', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('141', '15508025870', '13106618217', '21342', '1516852358', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('142', '15508025870', '13106618217', '12', '1516860498', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('143', '15508025870', '13106618217', '124', '1516860504', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('144', '13106618217', '15508025870', '3242', '1516860531', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('145', '15508025870', '13106618217', '123', '1516860740', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('146', '15508025870', '13106618217', '123', '1516860750', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('147', '15508025870', '13106618217', '123', '1516860771', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('148', '15508025870', '13106618217', '123', '1516860784', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('149', '15508025870', '13106618217', '123', '1516860800', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('150', '15508025870', '13106618217', '123', '1516860917', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('151', '15508025870', '13106618217', '1244', '1516861173', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('152', '15508025870', '13106618217', '1321', '1516861712', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('153', '15508025870', '13106618217', '124', '1516862167', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('154', '15508025870', '13106618217', '123', '1516871196', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('155', '15508025870', '13106618217', '123', '1516871226', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('156', '15508025870', '13106618217', '1324', '1516871379', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('157', '15508025870', '13106618217', '123', '1516871441', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('158', '15508025870', '13106618217', '1232', '1516871466', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('159', '15508025870', '13106618217', '123', '1516871508', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('160', '15508025870', '13106618217', '123', '1516871572', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('161', '15508025870', '13106618217', '1232', '1516871588', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('162', '15508025870', '13106618217', '124', '1516871690', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('163', '15508025870', '13106618217', '124', '1516871761', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('164', '15508025870', '13106618217', '1232', '1516871915', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('165', '15508025870', '13106618217', '1213', '1516871942', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('166', '15508025870', '13106618217', '123', '1516871954', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('167', '15508025870', '13106618217', '1232', '1516871959', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('168', '15508025870', '13106618217', '1232', '1516871973', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('169', '15508025870', '13106618217', '1232', '1516871976', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('170', '15508025870', '13106618217', '12321', '1516878407', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('171', '15508025870', '13106618217', '1232', '1516878453', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('172', '15508025870', '13106618217', '12312', '1516878460', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('173', '15508025870', '13106618217', '1232', '1516878480', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('174', '15508025870', '13106618217', '12143', '1516878499', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('175', '15508025870', '13106618217', '12321', '1516878581', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('176', '13106618217', '15508025870', '12312', '1516878608', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('177', '13106618217', '15508025870', '1232', '1516878622', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('178', '13106618217', '15508025870', '1232', '1516878627', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('179', '13106618217', '15508025870', '12321', '1516878658', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('180', '13106618217', '15508025870', '123', '1516878678', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('181', '13106618217', '15508025870', '1232', '1516878737', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('182', '13106618217', '15508025870', '1232', '1516878807', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('183', '13106618217', '15508025870', '1232', '1516878853', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('184', '13106618217', '15508025870', '123', '1516879016', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('185', '13106618217', '15508025870', '12321', '1516879029', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('186', '13106618217', '15508025870', '1232', '1516879036', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('187', '13106618217', '15508025870', 'qwe', '1516879057', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('188', '13106618217', '15508025870', 'qweq', '1516879062', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('189', '15508025870', '13106618217', '123', '1516885847', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('190', '15508025870', '13106618217', '1232', '1516886329', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('191', '15508025870', '13106618217', '1231', '1516886464', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('192', '15508025870', '13106618217', '1232', '1516886791', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('193', '15508025870', '13106618217', '1213', '1516886976', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('194', '15508025870', '13106618217', '1234', '1516887758', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('195', '15508025870', '13106618217', '213', '1516887767', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('196', '15508025870', '13106618217', '12312', '1516887786', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('197', '15508025870', '13106618217', '11323', '1516887837', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('198', '15508025870', '13106618217', '12132', '1516887915', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('199', '15508025870', '13106618217', '1123', '1516887960', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('200', '15508025870', '13106618217', '1232', '1516887981', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('201', '15508025870', '13106618217', '123', '1516887990', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('202', '15508025870', '13106618217', '1232', '1516888010', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('203', '15508025870', '13106618217', '123', '1516888017', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('204', '15508025870', '13106618217', '12312', '1516888041', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('205', '15508025870', '13106618217', '12321', '1516888052', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('206', '15508025870', '13106618217', '1232', '1516890018', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('207', '15508025870', '13106618217', '123123', '1516890021', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('208', '15508025870', '13106618217', '12312', '1516890022', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('209', '15508025870', '13106618217', '1232', '1516890154', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('210', '15508025870', '13106618217', '1232', '1516890197', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('211', '15508025870', '13106618217', '12321', '1516890236', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('212', '15508025870', '13106618217', '12321', '1516890260', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('213', '15508025870', '13106618217', '1231', '1516890279', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('214', '15508025870', '13106618217', '1232', '1516890293', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('215', '15508025870', '13106618217', '1231', '1516890321', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('216', '15508025870', '13106618217', '1232', '1516890378', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('217', '15508025870', '13106618217', '12312', '1516890393', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('218', '15508025870', '13106618217', '12312', '1516890404', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('219', '13106618217', '15508025870', '12213', '1516934003', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('220', '15508025870', '13106618217', '1232', '1516934087', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('221', '15508025870', '13106618217', '12321', '1516934904', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('222', '15508025870', '13106618217', '12323', '1516935018', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('223', '15508025870', '13106618217', '12321', '1516935407', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('224', '15508025870', '13106618217', '1231', '1516936222', '76', 'text');
INSERT INTO `cy_chatlog` VALUES ('225', '15538703323', '15508025870', '65', '1516951367', '72', 'text');
INSERT INTO `cy_chatlog` VALUES ('226', '15508025870', '13330888212', '在吗，我下单买了，啥时发货', '1516965613', '77', 'text');
INSERT INTO `cy_chatlog` VALUES ('227', '13330888212', '15508025870', '随便你啦', '1516965634', '77', 'text');
INSERT INTO `cy_chatlog` VALUES ('228', '15508025870', '13330888212', '你真的好随便，不想发货了吗', '1516965643', '77', 'text');
INSERT INTO `cy_chatlog` VALUES ('229', '13330888212', '15508025870', '嗯，，我没收到钱啊', '1516965650', '77', 'text');
INSERT INTO `cy_chatlog` VALUES ('230', '13330888212', '15508025870', '/Uploads/2018-01-26/1516965658.jpg', '1516965658', '77', 'pic');
INSERT INTO `cy_chatlog` VALUES ('231', '13330888212', '13881195830', '支付宝', '1516969875', '78', 'text');
INSERT INTO `cy_chatlog` VALUES ('232', '15508025870', '13330888212', '11', '1520242934', '73', 'text');
INSERT INTO `cy_chatlog` VALUES ('233', '15508025870', '18627845673', '在吗？', '1522947261', '79', 'text');
INSERT INTO `cy_chatlog` VALUES ('234', '18627845673', '15508025870', '在的', '1522947624', '79', 'text');
INSERT INTO `cy_chatlog` VALUES ('235', '15508025870', '18627845673', '已付款了  释放链克吧', '1522947714', '79', 'text');
INSERT INTO `cy_chatlog` VALUES ('236', '18627845673', '15508025870', 'OK', '1522947718', '79', 'text');
INSERT INTO `cy_chatlog` VALUES ('237', '18627845673', '17666505673', '在吗？', '1523975985', '137', 'text');
INSERT INTO `cy_chatlog` VALUES ('238', '17666505673', '18627845673', '在的  我支付宝XXXX', '1523976001', '137', 'text');
INSERT INTO `cy_chatlog` VALUES ('239', '18627845673', '17666505673', '恩，马上转钱', '1523976012', '137', 'text');
INSERT INTO `cy_chatlog` VALUES ('240', '17666505673', '18627845673', 'OK', '1523976039', '137', 'text');

-- ----------------------------
-- Table structure for cy_coin
-- ----------------------------
DROP TABLE IF EXISTS `cy_coin`;
CREATE TABLE `cy_coin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL COMMENT '币种类型  qbb为钱包币  rgb为认购币',
  `title` varchar(50) NOT NULL,
  `img` varchar(50) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `fee_bili` varchar(50) NOT NULL COMMENT '挂单比例',
  `endtime` int(11) unsigned NOT NULL COMMENT '',
  `addtime` int(11) unsigned NOT NULL,
  `status` int(4) unsigned NOT NULL COMMENT '币种状态，1位可用，0为禁用',
  `fee_meitian` varchar(200) NOT NULL COMMENT '每天限制',
  `dj_zj` varchar(200) NOT NULL COMMENT '钱包服务器IP',
  `dj_dk` varchar(200) NOT NULL COMMENT '钱包服务器端口',
  `dj_yh` varchar(200) NOT NULL COMMENT '钱包服务器用户名',
  `dj_mm` varchar(200) NOT NULL COMMENT '钱包服务器密码',
  `zr_zs` varchar(50) NOT NULL COMMENT '转入赠送,默认只能是0.01--100之间',
  `zr_jz` varchar(50) NOT NULL COMMENT '转入状态， 1为正常转入  0为禁止转入',
  `zr_dz` varchar(50) NOT NULL COMMENT '转出确认次数',
  `zr_sm` varchar(50) NOT NULL,
  `zc_sm` varchar(50) NOT NULL,
  `zc_fee` varchar(50) NOT NULL COMMENT '转出手续费比例',
  `zc_user` varchar(50) NOT NULL COMMENT '官方手续费地址',
  `zc_min` varchar(50) NOT NULL COMMENT '转出最小限制，默认0.0001',
  `zc_max` varchar(50) NOT NULL COMMENT '转出最大限制，默认10000000',
  `zc_jz` varchar(50) NOT NULL COMMENT '转出状态， 1为正常转出  0为禁止转出',
  `zc_zd` varchar(50) NOT NULL COMMENT '转出自动,推荐:正数且大于10 (小于这个数自动转出,大于这个数后台审核 )为了安全不要设置太大',
  `js_yw` varchar(50) NOT NULL COMMENT '英文名称',
  `js_sm` text NOT NULL,
  `js_qb` varchar(50) NOT NULL,
  `js_ym` varchar(50) NOT NULL,
  `js_gw` varchar(50) NOT NULL,
  `js_lt` varchar(50) NOT NULL,
  `js_wk` varchar(50) NOT NULL,
  `cs_yf` varchar(50) NOT NULL,
  `cs_sf` varchar(50) NOT NULL,
  `cs_fb` varchar(50) NOT NULL,
  `cs_qk` varchar(50) NOT NULL,
  `cs_zl` varchar(50) NOT NULL,
  `cs_cl` varchar(50) NOT NULL,
  `cs_zm` varchar(50) NOT NULL,
  `cs_nd` varchar(50) NOT NULL,
  `cs_jl` varchar(50) NOT NULL,
  `cs_ts` varchar(50) NOT NULL,
  `cs_bz` varchar(50) NOT NULL,
  `tp_zs` varchar(50) NOT NULL,
  `tp_js` varchar(50) NOT NULL,
  `tp_yy` varchar(50) NOT NULL,
  `tp_qj` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='币种配置表';

-- ----------------------------
-- Records of cy_coin
-- ----------------------------
INSERT INTO `cy_coin` VALUES ('12', 'btc', 'qbb', '比特币', '', '0', '0', '0', '0', '0', '', '127.0.0.1', '29990', 'admin', '123456', '0', '1', '1', '', '', '0.01', '19thxBCjmXCMLEmiNnD8zSLCjWPDxeQWse', '0', '10000', '0', '10', 'bitcoin', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `cy_coin` VALUES ('13', 'ltc', 'qbb', '莱特币', '', '0', '0', '0', '0', '0', '', '127.0.0.1', '29990', 'root', 'root', '0', '1', '1', '', '', '0.01', '19thxBCjmXCMLEmiNnD8zSLCjWPDxeQWse', '0', '10000', '1', '10', 'litecoin', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `cy_coin` VALUES ('14', 'eth', 'qbb', '以太坊', '', '0', '0', '0', '0', '0', '', '127.0.0.1', '29990', 'root', 'root', '0', '1', '1', '', '', '0.01', '19thxBCjmXCMLEmiNnD8zSLCjWPDxeQWse', '0', '10000', '1', '10', 'ethereum', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `cy_coin` VALUES ('15', '9dc', 'qbb', '九鼎币', '', '0', '0', '0', '0', '0', '', '127.0.0.1', '8888', 'rrrrr', 'jiangjiang', '0', '1', '1', '', '', '0', 'xxx', '0', '10000', '1', '100', '9dcoin', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `cy_coin` VALUES ('16', 'wkc', 'qbb', '玩客币', '', '0', '0', '0', '0', '1', '', '127.0.0.1', '8888', 'admin', '123456', '0', '1', '1', '', '', '0', '0x', '10', '10000', '1', '10', 'wkc', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for cy_coin_json
-- ----------------------------
DROP TABLE IF EXISTS `cy_coin_json`;
CREATE TABLE `cy_coin_json` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `data` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=316 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of cy_coin_json
-- ----------------------------
INSERT INTO `cy_coin_json` VALUES ('4', 'zc', '[0,0,\"0.00000000\",null]', '', '0', '1475510399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('6', 'zc', '[0,0,null,null]', '', '0', '1475596799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('8', 'zc', '[0,0,null,null]', '', '0', '1475683199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('32', 'zyc', '[10000016077.659,0,\"0.00000000\",null]', '', '0', '1475510399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('33', 'dog', '[100000969.1,0,\"0.00000000\",null]', '', '0', '1475510399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('34', 'zyc', '[10000016077.659,0,null,null]', '', '0', '1475596799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('35', 'dog', '[100000969.1,0,null,null]', '', '0', '1475596799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('37', 'zh', '[1000000000999,0,\"0.00000000\",null]', '', '0', '1475510399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('38', 'dog', '[100000969.1,0,null,null]', '', '0', '1475683199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('39', 'zyc', '[10000016077.659,0,null,null]', '', '0', '1475683199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('40', 'zh', '[1000000000999,0,null,null]', '', '0', '1475596799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('41', 'dog', '[100000969.1,0,null,null]', '', '0', '1475769599', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('42', 'zyc', '[10000016077.659,0,null,null]', '', '0', '1475769599', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('43', 'zh', '[1000000000999,0,null,null]', '', '0', '1475683199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('44', 'dog', '[100000969.1,0,null,null]', '', '0', '1475855999', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('45', 'zyc', '[10000016077.659,0,null,null]', '', '0', '1475855999', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('46', 'zh', '[1000000000999,0,null,null]', '', '0', '1475769599', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('47', 'dog', '[100000969.1,0,null,null]', '', '0', '1475942399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('48', 'zyc', '[10000016077.659,0,null,null]', '', '0', '1475942399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('49', 'zh', '[1000000000999,0,null,null]', '', '0', '1475855999', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('50', 'dog', '[100000969.1,0,null,null]', '', '0', '1476028799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('51', 'zyc', '[10000016077.659,0,null,null]', '', '0', '1476028799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('52', 'zh', '[1000000000999,0,null,null]', '', '0', '1475942399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('53', 'dog', '[100000969.1,0,null,null]', '', '0', '1476115199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('54', 'zyc', '[10000016077.659,0,null,null]', '', '0', '1476115199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('55', 'zh', '[1000000000999,0,null,null]', '', '0', '1476028799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('56', 'zh', '[1000000000999,0,null,null]', '', '0', '1476115199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('57', 'dog', '[100000964.1,0,null,null]', '', '0', '1476201599', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('58', 'zyc', '[10000014657.518,0,null,null]', '', '0', '1476201599', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('59', 'zh', '[1000000000981.5,0,null,null]', '', '0', '1476201599', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('60', 'dog', '[100000964.1,0,null,null]', '', '0', '1476287999', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('61', 'zyc', '[10000014303.982,0,null,null]', '', '0', '1476287999', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('62', 'zh', '[1000000000981.5,0,null,null]', '', '0', '1476287999', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('63', 'dog', '[100000964.1,0,null,null]', '', '0', '1476374399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('64', 'zyc', '[10000014303.982,0,null,null]', '', '0', '1476374399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('65', 'zh', '[1000000010979.7,0,null,null]', '', '0', '1476374399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('66', 'dog', '[1559057.1,0,null,null]', '', '0', '1476460799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('67', 'zyc', '[16470.90909091,0,null,null]', '', '0', '1476460799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('68', 'zh', '[11090,0,null,null]', '', '0', '1476460799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('69', 'dog', '[1000001558046,0,null,null]', '', '0', '1476547199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('70', 'zyc', '[1000015781.0202,0,null,null]', '', '0', '1476547199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('71', 'zh', '[1000011089,0,null,null]', '', '0', '1476547199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('72', 'dog', '[1000001558046,0,null,null]', '', '0', '1476633599', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('73', 'zh', '[1000011089,0,null,null]', '', '0', '1476633599', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('74', 'zh', '[1000011089,0,null,null]', '', '0', '1476719999', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('75', 'bcg', '[10000000,0,\"0.00000000\",null]', '', '0', '1475510399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('76', 'bcg', '[10000000,0,null,null]', '', '0', '1475596799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('77', 'bcg', '[10000000,0,null,null]', '', '0', '1475683199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('78', 'btc', '[1111111,0,\"0.00000000\",null]', '', '0', '1475510399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('79', 'ltc', '[1111122,0,\"0.00000000\",null]', '', '0', '1475510399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('80', 'dgc', '[11212121,0,\"0.00000000\",null]', '', '0', '1475510399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('81', 'ybc', '[21212121,0,\"0.00000000\",null]', '', '0', '1475510399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('82', 'bcg', '[10000000,0,null,null]', '', '0', '1475769599', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('83', 'btc', '[1111111,0,null,null]', '', '0', '1475596799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('84', 'ltc', '[1111122,0,null,null]', '', '0', '1475596799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('85', 'dgc', '[11212121,0,null,null]', '', '0', '1475596799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('86', 'ybc', '[21212121,0,null,null]', '', '0', '1475596799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('87', 'btc', '[1111111,0,null,null]', '', '0', '1475683199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('88', 'ltc', '[1111122,0,null,null]', '', '0', '1475683199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('89', 'dgc', '[11212121,0,null,null]', '', '0', '1475683199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('90', 'ybc', '[21212121,0,null,null]', '', '0', '1475683199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('91', 'btc', '[1111111,0,null,null]', '', '0', '1475769599', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('92', 'ltc', '[1111122,0,null,null]', '', '0', '1475769599', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('93', 'dgc', '[11212121,0,null,null]', '', '0', '1475769599', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('94', 'ybc', '[21212121,0,null,null]', '', '0', '1475769599', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('95', 'bcg', '[10000000,0,null,null]', '', '0', '1475855999', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('96', 'btc', '[1111,0,null,null]', '', '0', '1475855999', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('97', 'btc', '[1111,0,null,null]', '', '0', '1475942399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('98', 'btc', '[10,0,\"0.00000000\",\"0.00000000\"]', '', '0', '1476028799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('99', 'btc', '[10,0,null,null]', '', '0', '1476115199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('100', 'btc', '[10,0,null,null]', '', '0', '1476201599', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('101', 'btc', '[10,0,null,null]', '', '0', '1476287999', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('102', 'btc', '[0,0,null,null]', '', '0', '1476374399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('103', 'btc', '[0,0,null,null]', '', '0', '1476460799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('104', 'btc', '[0,0,null,null]', '', '0', '1476547199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('105', 'btc', '[0,0,null,null]', '', '0', '1476633599', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('106', 'btc', '[0,0,null,null]', '', '0', '1476719999', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('107', 'btc', '[0,0,null,null]', '', '0', '1476806399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('108', 'btc', '[0,0,null,null]', '', '0', '1476892799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('109', 'btc', '[0,0,null,null]', '', '0', '1476979199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('110', 'btc', '[0,0,null,null]', '', '0', '1477065599', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('111', 'btc', '[0,0,null,null]', '', '0', '1477151999', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('112', 'btc', '[0,0,null,null]', '', '0', '1477238399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('113', 'btc', '[0,0,null,null]', '', '0', '1477324799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('114', 'btc', '[0,0,null,null]', '', '0', '1477411199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('115', 'btc', '[0,0,null,null]', '', '0', '1477497599', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('116', 'btc', '[0,0,null,null]', '', '0', '1477583999', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('117', 'btc', '[0,0,null,null]', '', '0', '1477670399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('118', 'btc', '[0,0,null,null]', '', '0', '1477756799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('119', 'btc', '[0,0,null,null]', '', '0', '1477843199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('120', 'btc', '[0,0,null,null]', '', '0', '1477929599', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('121', 'btc', '[0,0,null,null]', '', '0', '1478015999', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('122', 'btc', '[0,0,null,null]', '', '0', '1478102399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('123', 'btc', '[0,0,null,null]', '', '0', '1478188799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('124', 'btc', '[0,0,null,null]', '', '0', '1478275199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('125', 'btc', '[0,0,null,null]', '', '0', '1478361599', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('126', 'btc', '[0,0,null,null]', '', '0', '1478447999', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('127', 'btc', '[0,0,null,null]', '', '0', '1478534399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('128', 'btc', '[0,0,null,null]', '', '0', '1478620799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('129', 'btc', '[0,0,null,null]', '', '0', '1478707199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('130', 'btc', '[0,0,null,null]', '', '0', '1478793599', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('131', 'btc', '[0,0,null,null]', '', '0', '1478879999', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('132', 'btc', '[0,0,null,null]', '', '0', '1478966399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('133', 'btc', '[0,0,null,null]', '', '0', '1479052799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('134', 'btc', '[0,0,null,null]', '', '0', '1479139199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('135', 'btc', '[0,0,null,null]', '', '0', '1479225599', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('136', 'btc', '[0,0,null,null]', '', '0', '1479311999', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('137', 'btc', '[0,0,null,null]', '', '0', '1479398399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('138', 'btc', '[0,0,null,null]', '', '0', '1479484799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('139', 'btc', '[0,0,null,null]', '', '0', '1479571199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('140', 'btc', '[0,0,null,null]', '', '0', '1479657599', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('141', 'btc', '[0,0,null,null]', '', '0', '1479743999', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('142', 'btc', '[0,0,null,null]', '', '0', '1479830399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('143', 'btc', '[0,0,null,null]', '', '0', '1479916799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('144', 'btc', '[0,0,null,null]', '', '0', '1480003199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('145', 'btc', '[0,0,null,null]', '', '0', '1480089599', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('146', 'btc', '[0,0,null,null]', '', '0', '1480175999', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('147', 'btc', '[0,0,null,null]', '', '0', '1480262399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('148', 'btc', '[0,0,null,null]', '', '0', '1480348799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('149', 'btc', '[0,0,null,null]', '', '0', '1480435199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('150', 'btc', '[0,0,null,null]', '', '0', '1480521599', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('151', 'btc', '[0,0,null,null]', '', '0', '1480607999', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('152', 'btc', '[0,0,null,null]', '', '0', '1480694399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('153', 'btc', '[0,0,null,null]', '', '0', '1480780799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('154', 'btc', '[0,0,null,null]', '', '0', '1480867199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('155', 'btc', '[0,0,null,null]', '', '0', '1480953599', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('156', 'btc', '[0,0,null,null]', '', '0', '1481039999', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('157', 'btc', '[0,0,null,null]', '', '0', '1481126399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('158', 'btc', '[0,0,null,null]', '', '0', '1481212799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('159', 'btc', '[0,0,null,null]', '', '0', '1481299199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('160', 'btc', '[0,0,null,null]', '', '0', '1481385599', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('161', 'btc', '[0,0,null,null]', '', '0', '1481471999', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('162', 'btc', '[0,0,null,null]', '', '0', '1481558399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('163', 'btc', '[0,0,null,null]', '', '0', '1481644799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('164', 'btc', '[0,0,null,null]', '', '0', '1481731199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('165', 'btc', '[0,0,null,null]', '', '0', '1481817599', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('166', 'btc', '[0,0,null,null]', '', '0', '1481903999', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('167', 'btc', '[0,0,null,null]', '', '0', '1481990399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('168', 'btc', '[0,0,null,null]', '', '0', '1482076799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('169', 'btc', '[0,0,null,null]', '', '0', '1482163199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('170', 'btc', '[0,0,null,null]', '', '0', '1482249599', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('171', 'btc', '[0,0,null,null]', '', '0', '1482335999', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('172', 'btc', '[0,0,null,null]', '', '0', '1482422399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('173', 'btc', '[0,0,null,null]', '', '0', '1482508799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('174', 'btc', '[0,0,null,null]', '', '0', '1482595199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('175', 'btc', '[0,0,null,null]', '', '0', '1482681599', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('176', 'btc', '[0,0,null,null]', '', '0', '1482767999', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('177', 'btc', '[0,0,null,null]', '', '0', '1482854399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('178', 'btc', '[0,0,null,null]', '', '0', '1482940799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('179', 'btc', '[0,0,null,null]', '', '0', '1483027199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('180', 'btc', '[0,0,null,null]', '', '0', '1483113599', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('181', 'btc', '[0,0,null,null]', '', '0', '1483199999', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('182', 'btc', '[0,0,null,null]', '', '0', '1483286399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('183', 'btc', '[0,0,null,null]', '', '0', '1483372799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('184', 'btc', '[0,0,null,null]', '', '0', '1483459199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('185', 'btc', '[0,0,null,null]', '', '0', '1483545599', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('186', 'btc', '[0,0,null,null]', '', '0', '1483631999', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('187', 'btc', '[0,0,null,null]', '', '0', '1483718399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('188', 'btc', '[0,0,null,null]', '', '0', '1483804799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('189', 'btc', '[0,0,null,null]', '', '0', '1483891199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('190', 'btc', '[0,0,null,null]', '', '0', '1483977599', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('191', 'btc', '[0,0,null,null]', '', '0', '1484063999', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('192', 'btc', '[0,0,null,null]', '', '0', '1484150399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('193', 'btc', '[0,0,null,null]', '', '0', '1484236799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('194', 'btc', '[0,0,null,null]', '', '0', '1484323199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('195', 'btc', '[0,0,null,null]', '', '0', '1484409599', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('196', 'btc', '[0,0,null,null]', '', '0', '1484495999', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('197', 'btc', '[0,0,null,null]', '', '0', '1484582399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('198', 'btc', '[0,0,null,null]', '', '0', '1484668799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('199', 'btc', '[0,0,null,null]', '', '0', '1484755199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('200', 'btc', '[0,0,null,null]', '', '0', '1484841599', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('201', 'btc', '[0,0,null,null]', '', '0', '1484927999', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('202', 'btc', '[0,0,null,null]', '', '0', '1485014399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('203', 'btc', '[0,0,null,null]', '', '0', '1485100799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('204', 'btc', '[0,0,null,null]', '', '0', '1485187199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('205', 'btc', '[0,0,null,null]', '', '0', '1485273599', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('206', 'btc', '[0,0,null,null]', '', '0', '1485359999', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('207', 'btc', '[0,0,null,null]', '', '0', '1485446399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('208', 'btc', '[0,0,null,null]', '', '0', '1485532799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('209', 'btc', '[0,0,null,null]', '', '0', '1485619199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('210', 'btc', '[0,0,null,null]', '', '0', '1485705599', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('211', 'btc', '[0,0,null,null]', '', '0', '1485791999', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('212', 'btc', '[0,0,null,null]', '', '0', '1485878399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('213', 'btc', '[0,0,null,null]', '', '0', '1485964799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('214', 'btc', '[0,0,null,null]', '', '0', '1486051199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('215', 'btc', '[0,0,null,null]', '', '0', '1486137599', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('216', 'btc', '[0,0,null,null]', '', '0', '1486223999', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('217', 'btc', '[0,0,null,null]', '', '0', '1486310399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('218', 'btc', '[0,0,null,null]', '', '0', '1486396799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('219', 'btc', '[0,0,null,null]', '', '0', '1486483199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('220', 'fc', '[5480477.190476,0,\"100.00000000\",null]', '', '0', '1486655999', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('221', 'fc', '[5480477.190476,0,null,null]', '', '0', '1486742399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('222', 'fc', '[19673434.333333,0,null,null]', '', '0', '1486828799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('223', 'fc', '[528694943.07315,0,null,null]', '', '0', '1486915199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('224', 'fc', '[973066450.38026,0,null,null]', '', '0', '1487001599', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('225', 'fc', '[1023071450.3803,0,null,null]', '', '0', '1487087999', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('226', 'fc', '[980836855.24217,0,null,null]', '', '0', '1487174399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('227', 'fc', '[1029683819.4502,0,null,null]', '', '0', '1487260799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('228', 'fc', '[986826676.59302,0,null,null]', '', '0', '1487347199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('229', 'fc', '[976731438.49778,0,null,null]', '', '0', '1487433599', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('230', 'fc', '[976731438.49778,0,null,null]', '', '0', '1487519999', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('231', 'fc', '[978731638.49778,0,null,null]', '', '0', '1487606399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('232', 'fc', '[1524113371.2178,0,null,null]', '', '0', '1487692799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('233', 'fc', '[64409454.059072,0,null,null]', '', '0', '1487779199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('234', 'fc', '[64409454.059072,0,null,null]', '', '0', '1487865599', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('235', 'fc', '[68599930.249548,0,null,null]', '', '0', '1487951999', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('236', 'fc', '[68599930.249548,0,null,null]', '', '0', '1488038399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('237', 'fc', '[72790406.440024,0,null,null]', '', '0', '1488124799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('238', 'fc', '[72790406.440024,0,null,null]', '', '0', '1488211199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('239', 'fc', '[72790406.440024,0,null,null]', '', '0', '1488297599', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('240', 'fc', '[72790406.440024,0,null,null]', '', '0', '1488383999', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('241', 'fc', '[72790406.440024,0,null,null]', '', '0', '1488470399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('242', 'fc', '[72790406.440024,0,null,null]', '', '0', '1488556799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('243', 'fc', '[72790406.440024,0,null,null]', '', '0', '1488643199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('244', 'fc', '[72790406.440024,0,null,null]', '', '0', '1488729599', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('245', 'fc', '[73861835.011453,0,null,null]', '', '0', '1488815999', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('246', 'fc', '[73861835.011453,0,null,null]', '', '0', '1488902399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('247', 'fc', '[73861835.011453,0,null,null]', '', '0', '1488988799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('248', 'dkc', '[0,0,\"100.00000000\",null]', '', '0', '1486655999', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('249', 'dkc', '[0,0,\"58600.50748990\",null]', '', '0', '1486742399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('250', 'dkc', '[0,0,\"56320.53220130\",\"24660.00000000\"]', '', '0', '1486828799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('251', 'dkc', '[0,0,\"5000.00000000\",null]', '', '0', '1486915199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('252', 'dkc', '[0,0,\"2500.10000000\",null]', '', '0', '1487001599', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('253', 'dkc', '[0,0,\"4884.20800000\",null]', '', '0', '1487087999', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('254', 'dkc', '[0,0,null,null]', '', '0', '1487174399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('255', 'dkc', '[0,0,null,null]', '', '0', '1487260799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('256', 'dkc', '[0,0,null,null]', '', '0', '1487347199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('257', 'dkc', '[0,0,\"200.00000000\",null]', '', '0', '1487433599', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('258', 'dkc', '[0,0,\"54532.72000000\",null]', '', '0', '1487519999', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('259', 'dkc', '[0,0,null,null]', '', '0', '1487606399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('260', 'dkc', '[0,0,null,null]', '', '0', '1487692799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('261', 'dkc', '[0,0,null,null]', '', '0', '1487779199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('262', 'dkc', '[0,0,null,null]', '', '0', '1487865599', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('263', 'dkc', '[0,0,null,null]', '', '0', '1487951999', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('264', 'dkc', '[0,0,null,null]', '', '0', '1488038399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('265', 'dkc', '[0,0,null,null]', '', '0', '1488124799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('266', 'dkc', '[0,0,null,null]', '', '0', '1488211199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('267', 'dkc', '[0,0,null,null]', '', '0', '1488297599', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('268', 'dkc', '[0,0,null,null]', '', '0', '1488383999', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('269', 'dkc', '[0,0,null,null]', '', '0', '1488470399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('270', 'dkc', '[0,0,null,null]', '', '0', '1488556799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('271', 'dkc', '[0,0,null,null]', '', '0', '1488643199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('272', 'dkc', '[0,0,null,null]', '', '0', '1488729599', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('273', 'dkc', '[0,0,null,null]', '', '0', '1488815999', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('274', 'dkc', '[0,0,null,null]', '', '0', '1488902399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('275', 'dkc', '[0,0,null,null]', '', '0', '1488988799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('276', 'dkc', '[0,0,null,null]', '', '0', '1489075199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('277', 'dkc', '[0,0,null,null]', '', '0', '1489161599', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('278', 'dkc', '[0,0,null,null]', '', '0', '1489247999', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('279', 'dkc', '[0,0,null,null]', '', '0', '1489334399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('280', 'dkc', '[0,0,null,null]', '', '0', '1489420799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('281', 'dkc', '[0,0,null,null]', '', '0', '1489507199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('282', 'dkc', '[0,0,null,null]', '', '0', '1489593599', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('283', 'dkc', '[0,0,null,null]', '', '0', '1489679999', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('284', 'dkc', '[0,0,null,null]', '', '0', '1489766399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('285', 'dkc', '[0,0,null,null]', '', '0', '1489852799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('286', 'dkc', '[0,0,null,null]', '', '0', '1489939199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('287', 'dkc', '[0,0,null,null]', '', '0', '1490025599', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('288', 'dkc', '[0,0,null,null]', '', '0', '1490111999', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('289', 'dkc', '[0,0,null,null]', '', '0', '1490198399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('290', 'dkc', '[0,0,null,null]', '', '0', '1490284799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('291', 'dkc', '[0,0,null,null]', '', '0', '1490371199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('292', 'dkc', '[0,0,null,null]', '', '0', '1490457599', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('293', 'dkc', '[0,0,null,null]', '', '0', '1490543999', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('294', 'dkc', '[0,0,null,null]', '', '0', '1490630399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('295', 'dkc', '[0,0,null,null]', '', '0', '1490716799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('296', 'dkc', '[0,0,null,null]', '', '0', '1490803199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('297', 'dkc', '[0,0,null,null]', '', '0', '1490889599', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('298', 'dkc', '[0,0,null,null]', '', '0', '1490975999', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('299', 'dkc', '[0,0,null,null]', '', '0', '1491062399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('300', 'dkc', '[0,0,null,null]', '', '0', '1491148799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('301', 'dkc', '[0,0,null,null]', '', '0', '1491235199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('302', 'dkc', '[0,0,null,null]', '', '0', '1491321599', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('303', 'dkc', '[0,0,null,null]', '', '0', '1491407999', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('304', 'dkc', '[0,0,null,null]', '', '0', '1491494399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('305', 'dkc', '[0,0,null,null]', '', '0', '1491580799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('306', 'dkc', '[0,0,null,null]', '', '0', '1491667199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('307', 'dkc', '[0,0,null,null]', '', '0', '1491753599', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('308', 'dkc', '[0,0,null,null]', '', '0', '1491839999', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('309', 'dkc', '[0,0,null,null]', '', '0', '1491926399', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('310', 'dkc', '[0,0,null,null]', '', '0', '1492012799', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('311', 'dkc', '[0,0,null,null]', '', '0', '1492099199', '0', '0');
INSERT INTO `cy_coin_json` VALUES ('315', 'wkc', '[1686.47994623,0,\"0.00000000\",\"0.00000000\"]', '', '0', '1510847999', '0', '0');

-- ----------------------------
-- Table structure for cy_config
-- ----------------------------
DROP TABLE IF EXISTS `cy_config`;
CREATE TABLE `cy_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `footer_logo` varchar(200) NOT NULL COMMENT ' ',
  `huafei_zidong` varchar(200) NOT NULL COMMENT '名称',
  `kefu` varchar(200) NOT NULL,
  `huafei_openid` varchar(200) NOT NULL COMMENT '名称',
  `huafei_appkey` varchar(200) NOT NULL COMMENT '名称',
  `index_lejimum` varchar(200) NOT NULL COMMENT '设置',
  `login_verify` varchar(200) NOT NULL COMMENT '设置',
  `fee_meitian` varchar(200) NOT NULL COMMENT '设置',
  `top_name` varchar(200) NOT NULL COMMENT '设置',
  `web_name` varchar(200) NOT NULL,
  `web_title` varchar(200) NOT NULL,
  `web_logo` varchar(200) NOT NULL,
  `web_llogo_small` varchar(200) NOT NULL,
  `web_keywords` text NOT NULL,
  `web_description` text NOT NULL,
  `web_close` text NOT NULL,
  `web_close_cause` text NOT NULL,
  `web_icp` text NOT NULL,
  `web_cnzz` text NOT NULL,
  `web_ren` text NOT NULL,
  `web_reg` text NOT NULL,
  `market_mr` text NOT NULL,
  `xnb_mr` text NOT NULL,
  `rmb_mr` text NOT NULL,
  `web_waring` text NOT NULL,
  `moble_type` text NOT NULL,
  `moble_url` text NOT NULL,
  `moble_user` text NOT NULL,
  `moble_pwd` text NOT NULL,
  `contact_moble` text NOT NULL,
  `contact_weibo` text NOT NULL,
  `contact_tqq` text NOT NULL,
  `contact_qq` text NOT NULL,
  `contact_qqun` text NOT NULL,
  `contact_weixin` text NOT NULL,
  `contact_weixin_img` text NOT NULL,
  `contact_email` text NOT NULL,
  `contact_alipay` text NOT NULL,
  `contact_alipay_img` text NOT NULL,
  `contact_bank` text NOT NULL,
  `user_truename` text NOT NULL,
  `user_moble` text NOT NULL,
  `user_alipay` text NOT NULL,
  `user_bank` text NOT NULL,
  `user_text_truename` text NOT NULL,
  `user_text_moble` text NOT NULL,
  `user_text_alipay` text NOT NULL,
  `user_text_bank` text NOT NULL,
  `user_text_log` text NOT NULL,
  `user_text_password` text NOT NULL,
  `user_text_paypassword` text NOT NULL,
  `mytx_min` text NOT NULL,
  `mytx_max` text NOT NULL,
  `mytx_bei` text NOT NULL,
  `mytx_coin` text NOT NULL,
  `mytx_fee` text NOT NULL,
  `trade_min` text NOT NULL,
  `trade_max` text NOT NULL,
  `trade_limit` text NOT NULL,
  `trade_text_log` text NOT NULL,
  `issue_ci` text NOT NULL,
  `issue_jian` text NOT NULL,
  `issue_min` text NOT NULL,
  `issue_max` text NOT NULL,
  `money_min` text NOT NULL,
  `money_max` text NOT NULL,
  `money_bei` text NOT NULL,
  `money_text_index` text NOT NULL,
  `money_text_log` text NOT NULL,
  `money_text_type` text NOT NULL,
  `invit_type` text NOT NULL,
  `invit_fee1` text NOT NULL,
  `invit_fee2` text NOT NULL,
  `invit_fee3` text NOT NULL,
  `invit_text_txt` text NOT NULL,
  `invit_text_log` text NOT NULL,
  `index_notice_1` text NOT NULL,
  `index_notice_11` text NOT NULL,
  `index_notice_2` text NOT NULL,
  `index_notice_22` text NOT NULL,
  `index_notice_3` text NOT NULL,
  `index_notice_33` text NOT NULL,
  `index_notice_4` text NOT NULL,
  `index_notice_44` text NOT NULL,
  `text_footer` text NOT NULL,
  `shop_text_index` text NOT NULL,
  `shop_text_log` text NOT NULL,
  `shop_text_addr` text NOT NULL,
  `shop_text_view` text NOT NULL,
  `huafei_text_index` text NOT NULL,
  `huafei_text_log` text NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `status` int(4) NOT NULL,
  `shop_coin` varchar(200) NOT NULL COMMENT '计算方式',
  `shop_logo` varchar(200) NOT NULL COMMENT '商城LOGO',
  `shop_login` varchar(200) NOT NULL COMMENT '是否要登陆',
  `index_html` varchar(50) DEFAULT NULL,
  `trade_hangqing` varchar(50) DEFAULT NULL,
  `trade_moshi` varchar(50) DEFAULT NULL,
  `order_fee` varchar(10) DEFAULT NULL COMMENT '每笔交易的手续费',
  `yqr_fee` varchar(10) DEFAULT NULL COMMENT '邀请人得到的奖励',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统配置表';

-- ----------------------------
-- Records of cy_config
-- ----------------------------
INSERT INTO `cy_config` VALUES ('1', '593bea637de29.png', '1', 'c', '', '', '0', '1', '', ' ', '', '', '593be948ca2dd.png', '593bea1553ec6.png', '', '', '1', '升级中...', '粤ICP备16111021号-1', '', '100', '<div style=\"text-align:center;\">\r\n	<div style=\"text-align:left;\">\r\n		<span style=\"color:#337FE5;\">根椐人民银行等有关部委的相关规定，比特币等数字货币系特殊的虚拟商品，作为互联网上的商品买卖行为，普通民众在自担风险的前提下拥有参与的自由。数字货币行业目前存在很多不确定，不可控的风险因素（如预挖、暴涨暴跌、庄家操控、团队解散、技术缺陷等），导致交易具有极高的风险。滑稽之家仅为数字货币等虚拟商品的爱好者提供一个自由的网上交换平台，对在滑稽之家平台交换的数字货币等虚拟商品的来源、价值，网站运营方不承担任何审查、担保、赔偿的法律责任。<br />\r\n<br />\r\n<br />\r\n<br />\r\n请您务必注意以下几点：<br />\r\n<br />\r\n<br />\r\n<br />\r\n1.警惕虚假宣传，不要听信任何币值会永远上涨的宣传，数字货币作为一种虚拟商品，具有极高的风险，很可能出现价值归零的情况。<br />\r\n<br />\r\n2.对于推广和运营方的市场承诺，需要谨慎判别，目前并没有相关法律能保证其兑现承诺，投币网不会对任何数字货币进行背书和承诺。<br />\r\n<br />\r\n3.坚决拒绝多层次传销组织，在我国参与该类组织是违法行为，造成的一切后果自负，平台将配合相关执法部门的要求进行调查、取证。<br />\r\n<br />\r\n4.根据《中华人民共和国反洗钱法》等有关法律规定，严格禁止利用平台进行洗钱等违法犯罪活动，平台将配合相关执法部门的要求进行调查、取证。<br />\r\n<br />\r\n5.数字货币和数字积分等虚拟商品所对应的实物财产和持有者享有的权利存在因发行方等义务相关方破产，关闭或违法犯罪等其他经营风险导致无法兑现的风险。<br />\r\n<br />\r\n6.在滑稽之家注册参与交换的用户，应保证注册身份信息的真实、准确，保证拟交换的数字货币等虚拟商品的来源合法。因信息不真实造成的任何问题，平台概不负责。<br />\r\n<br />\r\n7.因国家法律，法规及政策性文件的制定和修改，导致数字货币等虚拟商品的交易被暂停或者禁止的，由此导致的全部损失由用户自行承担。<br />\r\n<br />\r\n8.请控制风险，不要投入超过您风险承受能力的资金，不要购买您所不了解的数字货币，数字积分等虚拟商品。<br />\r\n                                               2017-2-7</span> \r\n	</div>\r\n	<div style=\"text-align:left;\">\r\n		<span style=\"color:#337FE5;\"></span> \r\n	</div>\r\n</div>\r\n<p>\r\n	<span style=\"color:#E56600;font-size:10px;\"></span> \r\n</p>', 'fc_cny', 'fc', 'cny', '风险警告：根椐人民银行等有关部委的相关规定，比特币等数字货币系特殊的虚拟商品，作为互联网上的商品买卖行为，普通民众在自担风险的前提下拥有参与的自由。数字货币行业目前存在很多不确定，不可控的风险因素（如预挖、暴涨暴跌、庄家操控、团队解散、技术缺陷等），导致交易具有极高的风险。滑稽之家仅为数字货币等虚拟商品的爱好者提供一个自由的网上交换平台，对在滑稽之家平台交换的数字货币等虚拟商品的来源、价值，网站运营方不承担任何审查、担保、赔偿的法律责任，如果您不能接受，请不要进行交易！', '1', '', '', '', '15611811882', '', '', '1203987654| 413679447', '466562997', 'li83839140', '56f98e6d70135.jpg', '83839140@qq.com', '83839140@qq.com', '56f98e6d7245d.jpg', '中国银行|动说科技|0000 0000 0000 0000', '2', '2', '2', '2', '&lt;span&gt;&lt;span&gt;会员您好,务必正确填写好自己的真实姓名和真实身份证号码.&lt;/span&gt;&lt;/span&gt;', '&lt;span&gt;会员您好,务必用自己的手机号码进行手机认证,认证以后可以用来接收验证码.&lt;/span&gt;', '&lt;span&gt;会员您好,务必正确填写支付宝 &amp;nbsp;真实姓名（与实名认证姓名相同）和支付宝账号,后期提现唯一依据.&lt;/span&gt;', '&lt;span&gt;会员您好,&lt;/span&gt;&lt;span&gt;&lt;span&gt;务必正确填写银行卡信息 提现唯一依据.&lt;/span&gt;&lt;span&gt;&lt;/span&gt;&lt;/span&gt;', '&lt;span&gt;自己以往操作和登录及登录地点的相关记录.&lt;/span&gt;', '&lt;span&gt;会员您好,修改登录密码以后请不要忘记.若不记得旧登录密码,请点击--&lt;/span&gt;&lt;span style=&quot;color:#EE33EE;&quot;&gt;忘记密码&lt;/span&gt;', '&lt;span&gt;会员您好,修改交易密码以后请不要忘记.若不记得旧交易密码,请点击--&lt;/span&gt;&lt;span style=&quot;color:#EE33EE;&quot;&gt;忘记密码&lt;/span&gt;', '50', '50000', '100', 'cny', '1.233', '1', '10000000', '10', '&lt;span&gt;&lt;span&gt;你委托买入或者卖出成功交易后的记录.&lt;/span&gt;&lt;/span&gt;', '5', '24', '1', '100000', '100', '100000', '100', '理财首页', '理财记录', '理财类型', '1', '5', '3', '2', '一起来滑稽吧！', '&lt;span&gt;&lt;span&gt;查看自己推广的好友,请点击&lt;/span&gt;&lt;span style=&quot;color:#EE33EE;&quot;&gt;“+”&lt;/span&gt;&lt;span&gt;,同时正确引导好友实名认证以及买卖,赚取推广收益和交易手续费.&lt;/span&gt;&lt;/span&gt;', '系统可靠', '银行级用户数据加密、动态身份验证多级风险识别控制，保障交易安全', '系统可靠', '账户多层加密，分布式服务器离线存储，即时隔离备份数据，确保安全', '快捷方便', '充值即时、提现迅速，每秒万单的高性能交易引擎，保证一切快捷方便', '服务专业', '热忱的客服工作人员和24小时的技术团队随时为您的账户安全保驾护航', '&lt;p&gt;\r\n	&lt;a href=&quot;/Article/index/type/aboutus.html&quot; target=&quot;_blank&quot;&gt;/Article/index/type/aboutus.html&lt;/a&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&amp;lt;a href=&quot;&lt;a href=&quot;/Article/index/type/aboutus.html&quot; target=&quot;_blank&quot;&gt;/Article/index/type/aboutus.html&lt;/a&gt;&quot;&amp;gt;关于我们&amp;lt;/a&amp;gt;\r\n&lt;/p&gt;\r\n|&lt;br /&gt;\r\n&amp;lt;a href=&quot;/Article/index/type/aboutus.html&quot;&amp;gt;联系我们&amp;lt;/a&amp;gt;&lt;br /&gt;\r\n|&lt;br /&gt;\r\n&amp;lt;a href=&quot;/Article/index/type/aboutus.html&quot;&amp;gt;资质证明&amp;lt;/a&amp;gt;&lt;br /&gt;\r\n|&lt;br /&gt;\r\n&amp;lt;a href=&quot;/Article/index/type/aboutus.html&quot;&amp;gt;用户协议&amp;lt;/a&amp;gt;&lt;br /&gt;\r\n|&lt;br /&gt;\r\n&amp;lt;a href=&quot;/Article/index/type/aboutus.html&quot;&amp;gt;法律声明&amp;lt;/a&amp;gt;&lt;br /&gt;\r\n&amp;lt;p style=&quot;margin-top: 5px;text-align: center;&quot;&amp;gt;&lt;br /&gt;\r\nCopyright &amp;copy; 2016&lt;br /&gt;\r\n&amp;lt;a href=&quot;/&quot;&amp;gt;{$C[\'web_name\']}交易平台 &amp;lt;/a&amp;gt;&lt;br /&gt;\r\nAll Rights Reserved.&lt;br /&gt;\r\n&amp;lt;a href=&quot;http://www.miibeian.gov.cn/&quot;&amp;gt;{$C[\'web_icp\']}&amp;lt;/a&amp;gt;{$C[\'web_cnzz\']|htmlspecialchars_decode}&lt;br /&gt;\r\n&lt;br /&gt;\r\n&amp;lt;/p&amp;gt;&lt;br /&gt;\r\n&amp;lt;p class=&quot;clear1&quot; id=&quot;ut646&quot; style=&quot;margin-top: 10px;text-align: center;&quot;&amp;gt;&lt;br /&gt;\r\n&amp;lt;a href=&quot;http://webscan.360.cn/index/checkwebsite/url/www.zuocoin.com&quot; target=&quot;_blank&quot;&amp;gt;&amp;lt;img border=&quot;0&quot; width=&quot;83&quot; height=&quot;31&quot; src=&quot;http://img.webscan.360.cn/status/pai/hash/a272bae5f02b1df25be2c1d9d0b251f7&quot;/&amp;gt;&amp;lt;/a&amp;gt;&lt;br /&gt;\r\n&amp;lt;a href=&quot;http://www.szfw.org/&quot; target=&quot;_blank&quot; id=&quot;ut118&quot; class=&quot;margin10&quot;&amp;gt;&lt;br /&gt;\r\n&amp;lt;img src=&quot;__UPLOAD__/footer/footer_2.png&quot;&amp;gt;&lt;br /&gt;\r\n&amp;lt;/a&amp;gt;&lt;br /&gt;\r\n&amp;lt;a href=&quot;http://www.miibeian.gov.cn/&quot; target=&quot;_blank&quot; id=&quot;ut119&quot; class=&quot;margin10&quot;&amp;gt;&lt;br /&gt;\r\n&amp;lt;img src=&quot;__UPLOAD__/footer/footer_3.png&quot;&amp;gt;&lt;br /&gt;\r\n&amp;lt;/a&amp;gt;&lt;br /&gt;\r\n&amp;lt;a href=&quot;http://www.cyberpolice.cn/&quot; target=&quot;_blank&quot; id=&quot;ut120&quot; class=&quot;margin10&quot;&amp;gt;&lt;br /&gt;\r\n&amp;lt;img src=&quot;__UPLOAD__/footer/footer_4.png&quot;&amp;gt;&lt;br /&gt;\r\n&amp;lt;/a&amp;gt;&lt;br /&gt;\r\n&amp;lt;/p&amp;gt;&lt;br /&gt;', '', '', '', '', '', '', '1467383018', '0', '', '/Upload/shop/5897ee777f0a8.jpg', '0', 'a', '1', '0', '0.7', '0.1');

-- ----------------------------
-- Table structure for cy_country
-- ----------------------------
DROP TABLE IF EXISTS `cy_country`;
CREATE TABLE `cy_country` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `country_name` varchar(20) NOT NULL,
  `country_code` int(10) unsigned NOT NULL,
  `area` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cy_country
-- ----------------------------

-- ----------------------------
-- Table structure for cy_daohang
-- ----------------------------
DROP TABLE IF EXISTS `cy_daohang`;
CREATE TABLE `cy_daohang` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `title` varchar(255) NOT NULL COMMENT '名称',
  `url` varchar(255) NOT NULL COMMENT 'url',
  `sort` int(11) unsigned NOT NULL COMMENT '排序',
  `addtime` int(11) unsigned NOT NULL COMMENT '添加时间',
  `endtime` int(11) unsigned NOT NULL COMMENT '编辑时间',
  `status` tinyint(4) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=gbk ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cy_daohang
-- ----------------------------
INSERT INTO `cy_daohang` VALUES ('1', 'finance', '财务中心', 'Finance/index', '1', '0', '0', '1');
INSERT INTO `cy_daohang` VALUES ('2', 'user', '安全中心', 'User/index', '2', '0', '0', '1');
INSERT INTO `cy_daohang` VALUES ('3', 'Issue', '应用中心', 'Issue/index', '3', '0', '0', '0');
INSERT INTO `cy_daohang` VALUES ('4', 'article', '帮助中心', 'Article/index', '7', '0', '0', '1');
INSERT INTO `cy_daohang` VALUES ('6', 'shop', '云购商城', 'Shop/index', '5', '0', '0', '0');
INSERT INTO `cy_daohang` VALUES ('7', 'vote', '新币投票', 'Vote/index', '6', '0', '0', '0');
INSERT INTO `cy_daohang` VALUES ('8', ' Issue', '认购中心', 'Issue/index', '4', '1474183878', '0', '1');
INSERT INTO `cy_daohang` VALUES ('9', '推广返佣', '推广返佣', 'promote/index.html', '4', '1480423054', '0', '0');

-- ----------------------------
-- Table structure for cy_evaluation
-- ----------------------------
DROP TABLE IF EXISTS `cy_evaluation`;
CREATE TABLE `cy_evaluation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) unsigned NOT NULL,
  `orderid` int(11) unsigned NOT NULL,
  `evaluation` varchar(20) NOT NULL COMMENT '评价 ',
  `addtime` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cy_evaluation
-- ----------------------------
INSERT INTO `cy_evaluation` VALUES ('1', '2', '7', 'NEUTRAL', '1511359246');
INSERT INTO `cy_evaluation` VALUES ('2', '1', '7', 'NEUTRAL', '1511359264');
INSERT INTO `cy_evaluation` VALUES ('3', '2', '8', 'NEUTRAL', '1511359424');
INSERT INTO `cy_evaluation` VALUES ('4', '1', '8', 'NEUTRAL', '1511359881');
INSERT INTO `cy_evaluation` VALUES ('5', '1', '9', 'NEGATIVE', '1511360394');
INSERT INTO `cy_evaluation` VALUES ('6', '2', '9', 'NEGATIVE', '1511360404');
INSERT INTO `cy_evaluation` VALUES ('7', '1', '10', 'NEGATIVE', '1511360551');
INSERT INTO `cy_evaluation` VALUES ('8', '2', '10', 'NEUTRAL', '1511360559');
INSERT INTO `cy_evaluation` VALUES ('9', '2', '11', 'NEUTRAL', '1511360681');
INSERT INTO `cy_evaluation` VALUES ('10', '1', '11', 'POSITIVE', '1511360915');
INSERT INTO `cy_evaluation` VALUES ('11', '2', '12', 'NEUTRAL', '1511399602');
INSERT INTO `cy_evaluation` VALUES ('12', '1', '12', 'NEUTRAL', '1511399637');
INSERT INTO `cy_evaluation` VALUES ('13', '1', '13', 'NEUTRAL', '1511399865');
INSERT INTO `cy_evaluation` VALUES ('14', '2', '13', 'NEUTRAL', '1511399873');
INSERT INTO `cy_evaluation` VALUES ('15', '2', '14', 'NEUTRAL', '1511399936');
INSERT INTO `cy_evaluation` VALUES ('16', '1', '14', 'NEGATIVE', '1511399941');
INSERT INTO `cy_evaluation` VALUES ('17', '2', '15', 'NEUTRAL', '1511400188');
INSERT INTO `cy_evaluation` VALUES ('18', '1', '15', 'NEGATIVE', '1511400191');
INSERT INTO `cy_evaluation` VALUES ('19', '2', '16', 'POSITIVE', '1511400293');
INSERT INTO `cy_evaluation` VALUES ('20', '1', '16', 'NEUTRAL', '1511400300');
INSERT INTO `cy_evaluation` VALUES ('21', '1', '17', 'NEGATIVE', '1511400488');
INSERT INTO `cy_evaluation` VALUES ('22', '2', '17', 'NEUTRAL', '1511400500');
INSERT INTO `cy_evaluation` VALUES ('23', '1', '18', 'NEGATIVE', '1511400689');
INSERT INTO `cy_evaluation` VALUES ('24', '2', '18', 'NEUTRAL', '1511400695');
INSERT INTO `cy_evaluation` VALUES ('25', '4', '25', 'POSITIVE', '1511424183');
INSERT INTO `cy_evaluation` VALUES ('26', '4', '25', 'POSITIVE', '1511424188');
INSERT INTO `cy_evaluation` VALUES ('27', '1', '26', 'NEGATIVE', '1511424635');
INSERT INTO `cy_evaluation` VALUES ('28', '1', '26', 'NEGATIVE', '1511424642');
INSERT INTO `cy_evaluation` VALUES ('29', '4', '46', 'POSITIVE', '1512010049');
INSERT INTO `cy_evaluation` VALUES ('30', '4', '46', 'POSITIVE', '1512010058');
INSERT INTO `cy_evaluation` VALUES ('31', '4', '47', 'NEUTRAL', '1512011167');
INSERT INTO `cy_evaluation` VALUES ('32', '4', '47', 'POSITIVE', '1512011660');
INSERT INTO `cy_evaluation` VALUES ('33', '4', '49', 'POSITIVE', '1512011987');
INSERT INTO `cy_evaluation` VALUES ('34', '4', '49', 'NEGATIVE', '1512012000');
INSERT INTO `cy_evaluation` VALUES ('38', '4', '50', 'NEUTRAL', '1512019070');
INSERT INTO `cy_evaluation` VALUES ('39', '2', '50', 'NEUTRAL', '1512019077');
INSERT INTO `cy_evaluation` VALUES ('40', '4', '51', 'NEGATIVE', '1512019158');
INSERT INTO `cy_evaluation` VALUES ('41', '2', '51', 'NEGATIVE', '1512019162');
INSERT INTO `cy_evaluation` VALUES ('42', '4', '59', 'NEUTRAL', '1512378237');
INSERT INTO `cy_evaluation` VALUES ('43', '12', '59', 'NEUTRAL', '1512378246');
INSERT INTO `cy_evaluation` VALUES ('44', '12', '60', 'POSITIVE', '1512379097');
INSERT INTO `cy_evaluation` VALUES ('45', '4', '60', 'POSITIVE', '1512379100');
INSERT INTO `cy_evaluation` VALUES ('46', '12', '61', 'POSITIVE', '1512379458');
INSERT INTO `cy_evaluation` VALUES ('47', '4', '61', 'POSITIVE', '1512379462');
INSERT INTO `cy_evaluation` VALUES ('48', '12', '62', 'NEUTRAL', '1512380244');
INSERT INTO `cy_evaluation` VALUES ('49', '4', '62', 'NEUTRAL', '1512380253');
INSERT INTO `cy_evaluation` VALUES ('50', '12', '63', 'NEGATIVE', '1512526982');
INSERT INTO `cy_evaluation` VALUES ('51', '4', '63', 'NEGATIVE', '1512526987');
INSERT INTO `cy_evaluation` VALUES ('52', '1', '70', 'POSITIVE', '1514471948');
INSERT INTO `cy_evaluation` VALUES ('53', '13', '70', 'POSITIVE', '1514471954');
INSERT INTO `cy_evaluation` VALUES ('54', '16', '77', 'POSITIVE', '1516965761');
INSERT INTO `cy_evaluation` VALUES ('55', '17', '77', 'POSITIVE', '1516965768');
INSERT INTO `cy_evaluation` VALUES ('56', '20', '82', 'POSITIVE', '1522953344');
INSERT INTO `cy_evaluation` VALUES ('57', '16', '82', 'POSITIVE', '1522953445');
INSERT INTO `cy_evaluation` VALUES ('58', '27', '83', 'POSITIVE', '1522986776');
INSERT INTO `cy_evaluation` VALUES ('59', '16', '83', 'POSITIVE', '1522986812');
INSERT INTO `cy_evaluation` VALUES ('60', '27', '84', 'POSITIVE', '1522986917');
INSERT INTO `cy_evaluation` VALUES ('61', '16', '84', 'NEUTRAL', '1522986923');
INSERT INTO `cy_evaluation` VALUES ('62', '20', '85', 'POSITIVE', '1522987641');
INSERT INTO `cy_evaluation` VALUES ('63', '27', '85', 'POSITIVE', '1522987650');
INSERT INTO `cy_evaluation` VALUES ('64', '27', '87', 'POSITIVE', '1522988277');
INSERT INTO `cy_evaluation` VALUES ('65', '16', '87', 'POSITIVE', '1522988292');
INSERT INTO `cy_evaluation` VALUES ('66', '20', '121', 'NEGATIVE', '1523000385');
INSERT INTO `cy_evaluation` VALUES ('67', '27', '121', 'NEUTRAL', '1523000392');
INSERT INTO `cy_evaluation` VALUES ('68', '20', '120', 'POSITIVE', '1523000659');
INSERT INTO `cy_evaluation` VALUES ('69', '27', '120', 'POSITIVE', '1523000666');
INSERT INTO `cy_evaluation` VALUES ('70', '27', '122', 'POSITIVE', '1523001257');
INSERT INTO `cy_evaluation` VALUES ('71', '20', '122', 'POSITIVE', '1523001258');
INSERT INTO `cy_evaluation` VALUES ('72', '27', '124', 'POSITIVE', '1523005212');
INSERT INTO `cy_evaluation` VALUES ('73', '20', '124', 'POSITIVE', '1523005214');

-- ----------------------------
-- Table structure for cy_fenhong
-- ----------------------------
DROP TABLE IF EXISTS `cy_fenhong`;
CREATE TABLE `cy_fenhong` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `coinname` varchar(50) NOT NULL,
  `coinjian` varchar(50) NOT NULL,
  `num` decimal(20,8) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cy_fenhong
-- ----------------------------
INSERT INTO `cy_fenhong` VALUES ('1', '月分红', 'zyc', 'cny', '1000.00000000', '1', '1476115200', '1476115200', '0');
INSERT INTO `cy_fenhong` VALUES ('2', '股分红', 'thc', 'cny', '1.00000000', '1', '1478620800', '1478620800', '0');
INSERT INTO `cy_fenhong` VALUES ('3', '滑稽币众筹分红', 'fc', 'fc', '1000000.00000000', '2', '1486355493', '1486355493', '0');
INSERT INTO `cy_fenhong` VALUES ('4', '交易平台股份分红', 'cny', 'cny', '1.00000000', '1', '1486355449', '1486355449', '0');
INSERT INTO `cy_fenhong` VALUES ('5', '个', 'fc', 'cny', '10.00000000', '1', '1486358485', '1486358485', '0');

-- ----------------------------
-- Table structure for cy_fenhong_log
-- ----------------------------
DROP TABLE IF EXISTS `cy_fenhong_log`;
CREATE TABLE `cy_fenhong_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `coinname` varchar(50) NOT NULL,
  `coinjian` varchar(50) NOT NULL,
  `fenzong` varchar(50) NOT NULL,
  `fenchi` varchar(50) NOT NULL,
  `price` decimal(20,8) unsigned NOT NULL,
  `num` decimal(20,8) unsigned NOT NULL,
  `mum` decimal(20,8) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  `userid` int(11) unsigned NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cy_fenhong_log
-- ----------------------------
INSERT INTO `cy_fenhong_log` VALUES ('1', '交易平台股份分红', 'cny', 'fc', '1.00000000', '', '0.00009999', '10001.00000000', '0.99999999', '0', '1486355524', '0', '1', '1');
INSERT INTO `cy_fenhong_log` VALUES ('2', '滑稽币众筹分红', 'fc', 'fc', '1000000.00000000', '', '1000000.01000000', '0.99999999', '1000000.00000000', '0', '1486355589', '0', '1', '1');
INSERT INTO `cy_fenhong_log` VALUES ('3', '个', 'fc', 'cny', '10.00000000', '', '0.00001000', '1000001.00000000', '10.00001000', '0', '1486358502', '0', '1', '1');

-- ----------------------------
-- Table structure for cy_finance
-- ----------------------------
DROP TABLE IF EXISTS `cy_finance`;
CREATE TABLE `cy_finance` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL COMMENT '用户id',
  `coinname` varchar(50) NOT NULL COMMENT '币种',
  `num_a` decimal(20,8) unsigned NOT NULL COMMENT '之前正常',
  `num_b` decimal(20,8) unsigned NOT NULL COMMENT '之前冻结',
  `num` decimal(20,8) unsigned NOT NULL COMMENT '之前总计',
  `fee` decimal(20,8) unsigned NOT NULL COMMENT '操作数量',
  `type` varchar(50) NOT NULL COMMENT '操作类型',
  `name` varchar(50) NOT NULL COMMENT '操作名称',
  `nameid` int(11) NOT NULL COMMENT '操作详细',
  `remark` varchar(50) NOT NULL COMMENT '操作备注',
  `mum_a` decimal(20,8) unsigned NOT NULL COMMENT '剩余正常',
  `mum_b` decimal(20,8) unsigned NOT NULL COMMENT '剩余冻结',
  `mum` decimal(20,8) unsigned NOT NULL COMMENT '剩余总计',
  `move` varchar(50) NOT NULL COMMENT '附加',
  `addtime` int(11) unsigned NOT NULL COMMENT '添加时间',
  `status` tinyint(4) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `coinname` (`coinname`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8 COMMENT='财务记录表';

-- ----------------------------
-- Records of cy_finance
-- ----------------------------
INSERT INTO `cy_finance` VALUES ('1', '20', 'cny', '100.00000000', '0.00000000', '100.00000000', '10.00000000', '2', 'trade', '1', '交易中心-委托买入-市场thc_cny', '90.00000000', '10.00000000', '100.00000000', 'aec08b5a775b52e73429fff15e195928', '1480488331', '0');
INSERT INTO `cy_finance` VALUES ('2', '20', 'cny', '90.00000000', '10.00000000', '100.00000000', '3.00000000', '2', 'tradelog', '1', '交易中心-成功买入-市场thc_cny', '90.00000000', '7.00000000', '97.00000000', 'd4d0d2199d0222463fabdc193f9cade8', '1480488356', '1');
INSERT INTO `cy_finance` VALUES ('3', '20', 'cny', '90.00000000', '7.00000000', '97.00000000', '3.00000000', '1', 'tradelog', '1', '交易中心-成功卖出-市场thc_cny', '92.99400000', '7.00000000', '99.99400000', '88cba0e7cdfb665fcafacf0b6eb07144', '1480488356', '1');
INSERT INTO `cy_finance` VALUES ('4', '20', 'cny', '92.99400000', '7.00000000', '99.99400000', '7.00000000', '1', 'trade', '1', '交易中心-交易撤销thc_cny', '99.99400000', '0.00000000', '99.99400000', 'a5eb12b149bee38f440a829dbc98db87', '1480488386', '1');
INSERT INTO `cy_finance` VALUES ('5', '29', 'cny', '0.00000000', '0.00000000', '0.00000000', '100.00000000', '1', 'mycz', '1', '人民币充值-人工到账', '100.00000000', '0.00000000', '100.00000000', '7def0fc701de69bf9cd7e38f78630403', '1480488640', '1');
INSERT INTO `cy_finance` VALUES ('6', '20', 'cny', '0.00000000', '0.00000000', '0.00000000', '0.30000000', '1', 'mycz', '20', '人民币充值-一代充值奖励-充值ID29,订单QI986922,金额100元,奖励0.3元', '0.30000000', '0.00000000', '0.30000000', '3bc90026827bbdf0fb7a159442f528a0', '1480488640', '0');
INSERT INTO `cy_finance` VALUES ('7', '1', 'cny', '0.00000000', '0.00000000', '0.00000000', '1.00000000', '1', 'mycz', '21', '人民币充值-人工到账', '1.00000000', '0.00000000', '1.00000000', '7f372f3ac9402770fd46cd43bd545b56', '1486352889', '1');
INSERT INTO `cy_finance` VALUES ('8', '1', 'cny', '1.00000000', '0.00000000', '1.00000000', '1.00000000', '1', 'mycz', '22', '人民币充值-人工到账', '2.00000000', '0.00000000', '2.00000000', 'a8e81e493e31caca5cbaaf28a33405a7', '1486353716', '1');
INSERT INTO `cy_finance` VALUES ('9', '1', 'cny', '2.00000000', '0.00000000', '2.00000000', '9999.00000000', '1', 'mycz', '23', '人民币充值-人工到账', '10001.00000000', '0.00000000', '10001.00000000', '5f995e0e2c2fac4eb54d8710ee319f91', '1486354258', '1');
INSERT INTO `cy_finance` VALUES ('10', '2', 'cny', '0.00000000', '0.00000000', '0.00000000', '1000.00000000', '1', 'mycz', '24', '人民币充值-人工到账', '1000.00000000', '0.00000000', '1000.00000000', '4cb4d0e37b20128e1b169193fb193ddc', '1486357838', '1');
INSERT INTO `cy_finance` VALUES ('11', '1', 'cny', '10001.00000000', '0.00000000', '10001.00000000', '3.00000000', '1', 'mycz', '1', '人民币充值-一代充值奖励-充值ID2,订单HP149122,金额1000元,奖励3元', '10004.00000000', '0.00000000', '10004.00000000', 'ee98e10066ed2ead443cfc8c9f344a3a', '1486357838', '1');
INSERT INTO `cy_finance` VALUES ('12', '1', 'cny', '10004.00000000', '0.00000000', '10004.00000000', '100.00000000', '2', 'mytx', '1', '人民币提现-申请提现', '9904.00000000', '0.00000000', '9904.00000000', '17403aed56d3b1d67c6075d321be6445', '1486358183', '1');
INSERT INTO `cy_finance` VALUES ('13', '1', 'cny', '9914.00001000', '0.00000000', '9914.00001000', '0.10000000', '2', 'trade', '7', '交易中心-委托买入-市场fc_cny', '9913.90001000', '0.10000000', '9914.00001000', '66a6a2faddd4903aaa0442b2efabb7e3', '1486376993', '0');
INSERT INTO `cy_finance` VALUES ('14', '1', 'cny', '9913.90001000', '0.10000000', '9914.00001000', '0.10000000', '2', 'tradelog', '2', '交易中心-成功买入-市场fc_cny', '9913.90001000', '0.00000000', '9913.90001000', '1653e467798d1e601dd9aa5b76e6393a', '1486376993', '1');
INSERT INTO `cy_finance` VALUES ('15', '1', 'cny', '9913.90001000', '0.00000000', '9913.90001000', '0.10000000', '1', 'tradelog', '2', '交易中心-成功卖出-市场fc_cny', '9913.99901000', '0.00000000', '9913.99901000', '89ddbe0db83c3395eff56aa58324c07f', '1486376993', '1');
INSERT INTO `cy_finance` VALUES ('16', '1', 'cny', '9913.99901000', '0.00000000', '9913.99901000', '0.01000000', '2', 'trade', '8', '交易中心-委托买入-市场fc_cny', '9913.98901000', '0.01000000', '9913.99901000', '96ae0a0fb166e0bb4939657adac40a8d', '1486377127', '1');
INSERT INTO `cy_finance` VALUES ('17', '1', 'cny', '9913.98901000', '0.01000000', '9913.99901000', '0.01000000', '2', 'tradelog', '3', '交易中心-成功买入-市场fc_cny', '9913.98901000', '0.00000000', '9913.98901000', '0a971123477fe764d8397a9a7de95328', '1486377127', '1');
INSERT INTO `cy_finance` VALUES ('18', '1', 'cny', '9913.98901000', '0.00000000', '9913.98901000', '0.01000000', '1', 'tradelog', '3', '交易中心-成功卖出-市场fc_cny', '9913.99891000', '0.00000000', '9913.99891000', '8da412f0f2071d446a362b6dfdc75592', '1486377127', '1');
INSERT INTO `cy_finance` VALUES ('19', '1', 'cny', '9913.99891000', '0.00000000', '9913.99891000', '2974.19967300', '2', 'trade', '9', '交易中心-委托买入-市场fc_cny', '6939.79923700', '2974.19967300', '9913.99891000', 'e91b1c110b1e8c2894c58a2478858ad7', '1486377475', '1');
INSERT INTO `cy_finance` VALUES ('20', '1', 'cny', '6939.79923700', '2974.19967300', '9913.99891000', '0.69000000', '2', 'tradelog', '4', '交易中心-成功买入-市场fc_cny', '6939.79923700', '2973.50967300', '9913.30891000', '9a66796dc9bd5d4be73db2b567621698', '1486377476', '1');
INSERT INTO `cy_finance` VALUES ('21', '1', 'cny', '6939.79923700', '2973.50967300', '9913.30891000', '0.69000000', '1', 'tradelog', '4', '交易中心-成功卖出-市场fc_cny', '6940.48233700', '2973.50967300', '9913.99201000', 'c458f7a047c429c3ca23a579e857d132', '1486377476', '1');
INSERT INTO `cy_finance` VALUES ('22', '1', 'cny', '6940.48233700', '2973.50967300', '9913.99201000', '2973.50967300', '1', 'trade', '9', '交易中心-交易撤销fc_cny', '9913.99201000', '0.00000000', '9913.99201000', 'e2f4e49730476a53df27ce46ce439286', '1486377511', '1');
INSERT INTO `cy_finance` VALUES ('23', '1', 'cny', '9913.99201000', '0.00000000', '9913.99201000', '0.01000000', '2', 'trade', '10', '交易中心-委托买入-市场fc_cny', '9913.98201000', '0.01000000', '9913.99201000', '852ef96b911b0e3aa3551b9a254d604f', '1486382248', '1');
INSERT INTO `cy_finance` VALUES ('24', '4', 'cny', '0.00000000', '0.00000000', '0.00000000', '10.00000000', '1', 'mycz', '25', '人民币充值-人工到账', '10.00000000', '0.00000000', '10.00000000', '061ca0a94cfc131fb6335abf84fa64e4', '1486382685', '1');
INSERT INTO `cy_finance` VALUES ('25', '1', 'cny', '9913.98201000', '0.01000000', '9913.99201000', '0.03000000', '1', 'mycz', '1', '人民币充值-一代充值奖励-充值ID4,订单EM771575,金额10元,奖励0.03元', '9914.01201000', '0.01000000', '9914.02201000', '0e8fc204c128594a7513c5e9468200c4', '1486382685', '1');
INSERT INTO `cy_finance` VALUES ('26', '5', 'cny', '0.00000000', '0.00000000', '0.00000000', '10.00000000', '1', 'mycz', '26', '人民币充值-人工到账', '10.00000000', '0.00000000', '10.00000000', '37b3dd7b0b905f1d003916b4a0dc3397', '1486384410', '1');
INSERT INTO `cy_finance` VALUES ('27', '1', 'cny', '9914.01201000', '0.01000000', '9914.02201000', '0.03000000', '1', 'mycz', '1', '人民币充值-一代充值奖励-充值ID5,订单UX539438,金额10元,奖励0.03元', '9914.04201000', '0.01000000', '9914.05201000', '520aafa30547cd475aedcbbb8379f8e8', '1486384410', '1');
INSERT INTO `cy_finance` VALUES ('28', '1', 'cny', '9914.04201000', '0.01000000', '9914.05201000', '0.02000000', '2', 'trade', '12', '交易中心-委托买入-市场fc_cny', '9914.02201000', '0.03000000', '9914.05201000', 'f6467f663c4cb269e40d511f51e9bdf2', '1486451816', '1');
INSERT INTO `cy_finance` VALUES ('29', '1', 'cny', '9914.02201000', '0.03000000', '9914.05201000', '0.02000000', '2', 'tradelog', '5', '交易中心-成功买入-市场fc_cny', '9914.02201000', '0.01000000', '9914.03201000', 'cf89bbb6075cb1edc84060c79df5a733', '1486451816', '1');
INSERT INTO `cy_finance` VALUES ('30', '1', 'cny', '9914.02201000', '0.01000000', '9914.03201000', '0.02000000', '1', 'tradelog', '5', '交易中心-成功卖出-市场fc_cny', '9914.04181000', '0.01000000', '9914.05181000', '7aeff71bc6b859b7f74aca17ca28082e', '1486451816', '1');
INSERT INTO `cy_finance` VALUES ('31', '1', 'cny', '9914.04181000', '0.01000000', '9914.05181000', '1.00000000', '2', 'issue', '1', '认购中心-立即认购', '9914.04181000', '0.01000000', '9914.05181000', '39483b49331507ddaaddb0d40e839537', '1486477461', '1');
INSERT INTO `cy_finance` VALUES ('32', '1', 'cny', '9914.04181000', '0.01000000', '9914.05181000', '1000000.00000000', '2', 'issue', '2', '认购中心-立即认购', '9913.04181000', '0.01000000', '9913.05181000', 'c2d0fa93b25045315ff4e7fba123d098', '1486477794', '1');
INSERT INTO `cy_finance` VALUES ('33', '1', 'cny', '9913.04181000', '0.01000000', '9913.05181000', '0.01000000', '2', 'tradelog', '6', '交易中心-成功买入-市场fc_cny', '9913.04181000', '0.00000000', '9913.04181000', 'ad40159445501b34b7760168e74aebda', '1486484538', '1');
INSERT INTO `cy_finance` VALUES ('34', '1', 'cny', '9913.04181000', '0.00000000', '9913.04181000', '0.01000000', '1', 'tradelog', '6', '交易中心-成功卖出-市场fc_cny', '9913.05168670', '0.00000000', '9913.05168670', 'ae2c536db102db461d145739fa847632', '1486484538', '1');
INSERT INTO `cy_finance` VALUES ('35', '13', 'cny', '0.00000000', '0.00000000', '0.00000000', '10.00000000', '1', 'mycz', '28', '人民币充值-人工到账', '10.00000000', '0.00000000', '10.00000000', 'b83a60c843fd1745f3e9d13dafe4baf7', '1486538649', '1');
INSERT INTO `cy_finance` VALUES ('36', '1', 'cny', '9913.05168670', '0.00000000', '9913.05168670', '0.03000000', '1', 'mycz', '1', '人民币充值-一代充值奖励-充值ID13,订单HS653491,金额10元,奖励0.03元', '9913.08168670', '0.00000000', '9913.08168670', 'e813ab1b128a358d73120af700b63e50', '1486538649', '1');
INSERT INTO `cy_finance` VALUES ('37', '1', 'cny', '9913.08168670', '0.00000000', '9913.08168670', '15000000.00000000', '2', 'issue', '3', '认购中心-立即认购', '9814.08168670', '0.00000000', '9814.08168670', '3da2eefd214733de7e2eef1e0540300e', '1486538856', '1');
INSERT INTO `cy_finance` VALUES ('38', '13', 'cny', '10.00000000', '0.00000000', '10.00000000', '15000000.00000000', '2', 'issue', '4', '认购中心-立即认购', '0.10000000', '0.00000000', '0.10000000', '62e57b6b9a9f2e2db1370e2fe374b7e2', '1486538948', '1');
INSERT INTO `cy_finance` VALUES ('39', '1', 'cny', '9814.09653670', '0.00000000', '9814.09653670', '1.00000000', '1', 'mycz', '32', '人民币充值-人工到账', '9815.09653670', '0.00000000', '9815.09653670', '35b1310551cba6122852e0e490963595', '1486571438', '1');
INSERT INTO `cy_finance` VALUES ('40', '17', 'cny', '0.00000000', '0.00000000', '0.00000000', '10.00000000', '1', 'mycz', '31', '人民币充值-人工到账', '10.00000000', '0.00000000', '10.00000000', 'ccef19884e9006675fab98914f339af6', '1486571458', '1');
INSERT INTO `cy_finance` VALUES ('41', '1', 'cny', '9815.09653670', '0.00000000', '9815.09653670', '0.03000000', '1', 'mycz', '1', '人民币充值-一代充值奖励-充值ID17,订单TR173789,金额10元,奖励0.03元', '9815.12653670', '0.00000000', '9815.12653670', 'c1f3ec30f224243aecae85be5023001a', '1486571458', '1');
INSERT INTO `cy_finance` VALUES ('42', '17', 'cny', '10.00000000', '0.00000000', '10.00000000', '7500000.00000000', '2', 'issue', '5', '认购中心-立即认购', '5.05000000', '0.00000000', '5.05000000', '913539c0254a3a6077a31d091a2dcd27', '1486571731', '1');
INSERT INTO `cy_finance` VALUES ('43', '1', 'cny', '9815.13396170', '0.00000000', '9815.13396170', '0.07000000', '2', 'trade', '16', '交易中心-委托买入-市场fc_cny', '9815.06396170', '0.07000000', '9815.13396170', 'e21ebe273d1acdc722226992470f89b7', '1486643544', '1');
INSERT INTO `cy_finance` VALUES ('44', '1', 'cny', '9815.06396170', '0.07000000', '9815.13396170', '0.01466687', '2', 'tradelog', '7', '交易中心-成功买入-市场fc_cny', '9815.06396170', '0.05533313', '9815.11929483', 'b93ddeb32e9636934c654cd2344ad9bd', '1486643544', '1');
INSERT INTO `cy_finance` VALUES ('45', '1', 'cny', '9815.06396170', '0.05533313', '9815.11929483', '0.01466687', '1', 'tradelog', '7', '交易中心-成功卖出-市场fc_cny', '9815.07844773', '0.05533313', '9815.13378086', '4c7c24426850fa43fe888edf3ed0dac6', '1486643544', '1');
INSERT INTO `cy_finance` VALUES ('46', '1', 'cny', '9815.07844773', '0.05533313', '9815.13378086', '0.03260024', '2', 'tradelog', '8', '交易中心-成功买入-市场fc_cny', '9815.07844773', '0.02273289', '9815.10118062', '67383100ecf10b22ce8bb4bbe77a6866', '1486643544', '1');
INSERT INTO `cy_finance` VALUES ('47', '1', 'cny', '9815.07844773', '0.02273289', '9815.10118062', '0.03260024', '1', 'tradelog', '8', '交易中心-成功卖出-市场fc_cny', '9815.11064601', '0.02273289', '9815.13337890', '7f28f705d9775014d90a3ca027a22e99', '1486643544', '1');
INSERT INTO `cy_finance` VALUES ('48', '1', 'cny', '9815.11064601', '0.02273289', '9815.13337890', '0.02273289', '2', 'tradelog', '9', '交易中心-成功买入-市场fc_cny', '9815.11064601', '0.00000000', '9815.11064601', '9cc9a75ac1b06745811d950334e6972b', '1486643545', '1');
INSERT INTO `cy_finance` VALUES ('49', '1', 'cny', '9815.11064601', '0.00000000', '9815.11064601', '0.02273289', '1', 'tradelog', '9', '交易中心-成功卖出-市场fc_cny', '9815.13309860', '0.00000000', '9815.13309860', '1a4ca4947c79c5f845f80cc825ae2825', '1486643545', '1');
INSERT INTO `cy_finance` VALUES ('50', '1', 'cny', '9815.13309860', '0.00000000', '9815.13309860', '0.25000000', '2', 'trade', '18', '交易中心-委托买入-市场fc_cny', '9814.88309860', '0.25000000', '9815.13309860', '4704a4156172dd814520856973865f01', '1486643653', '1');
INSERT INTO `cy_finance` VALUES ('51', '1', 'cny', '9814.88309860', '0.25000000', '9815.13309860', '0.00008728', '2', 'tradelog', '10', '交易中心-成功买入-市场fc_cny', '9814.88309860', '0.24991272', '9815.13301132', '271b94d24623c3dafa28c5f037554eaf', '1486643653', '1');
INSERT INTO `cy_finance` VALUES ('52', '1', 'cny', '9814.88309860', '0.24991272', '9815.13301132', '0.00008728', '1', 'tradelog', '10', '交易中心-成功卖出-市场fc_cny', '9814.88318480', '0.24991272', '9815.13309752', '1d3edb6bd35567368259fb944bf5a4d8', '1486643653', '1');
INSERT INTO `cy_finance` VALUES ('53', '1', 'cny', '9814.88318480', '0.24991272', '9815.13309752', '0.24991272', '2', 'tradelog', '11', '交易中心-成功买入-市场fc_cny', '9814.88318480', '0.00000000', '9814.88318480', '42346dfe0615ff10ac3d0c11b205a75f', '1486643653', '1');
INSERT INTO `cy_finance` VALUES ('54', '1', 'cny', '9814.88318480', '0.00000000', '9814.88318480', '0.24991272', '1', 'tradelog', '11', '交易中心-成功卖出-市场fc_cny', '9815.13001610', '0.00000000', '9815.13001610', '11e7b3989f2f4eb1ab85f99cbeb72bad', '1486643653', '1');
INSERT INTO `cy_finance` VALUES ('55', '1', 'cny', '9815.13001610', '0.00000000', '9815.13001610', '0.13000000', '2', 'trade', '19', '交易中心-委托买入-市场fc_cny', '9815.00001610', '0.13000000', '9815.13001610', '7df5501d248ea4c08be8ef58a86db8de', '1486643779', '1');
INSERT INTO `cy_finance` VALUES ('56', '1', 'cny', '9815.00001610', '0.13000000', '9815.13001610', '0.13000000', '2', 'tradelog', '12', '交易中心-成功买入-市场fc_cny', '9815.00001610', '0.00000000', '9815.00001610', 'd5188e6ee72141cb4f4b7624a1f92ea4', '1486643779', '1');
INSERT INTO `cy_finance` VALUES ('57', '1', 'cny', '9815.00001610', '0.00000000', '9815.00001610', '0.13000000', '1', 'tradelog', '12', '交易中心-成功卖出-市场fc_cny', '9815.12841320', '0.00000000', '9815.12841320', '44bc97f3ddacc41989d80270769bfff8', '1486643779', '1');
INSERT INTO `cy_finance` VALUES ('58', '17', 'cny', '5.05000000', '0.00000000', '5.05000000', '0.75000000', '2', 'trade', '20', '交易中心-委托买入-市场fc_cny', '4.30000000', '0.75000000', '5.05000000', 'da2f77a863d3aaaa9be1d37ef0c8ae3d', '1486643817', '1');
INSERT INTO `cy_finance` VALUES ('59', '17', 'cny', '4.30000000', '0.75000000', '5.05000000', '0.62008728', '2', 'tradelog', '13', '交易中心-成功买入-市场fc_cny', '4.30000000', '0.12991272', '4.42991272', '584dd43d8fea8b14b11fd84935df9eb8', '1486643817', '1');
INSERT INTO `cy_finance` VALUES ('60', '1', 'cny', '9815.12841320', '0.00000000', '9815.12841320', '0.62008728', '1', 'tradelog', '13', '交易中心-成功卖出-市场fc_cny', '9815.74085480', '0.00000000', '9815.74085480', '8606113b23f376712011571a1e832cb2', '1486643817', '0');
INSERT INTO `cy_finance` VALUES ('61', '5', 'cny', '10.00000000', '0.00000000', '10.00000000', '2.00000000', '2', 'trade', '21', '交易中心-委托买入-市场fc_cny', '8.00000000', '2.00000000', '10.00000000', '0d8c5a7f88673e35417a142a40769bfd', '1486643964', '1');
INSERT INTO `cy_finance` VALUES ('62', '17', 'cny', '4.30000000', '0.12991272', '4.42991272', '0.12991272', '2', 'tradelog', '14', '交易中心-成功买入-市场fc_cny', '4.30000000', '0.00000000', '4.30000000', 'ca83ff07c643a81e7ee2632a1530071c', '1486644070', '1');
INSERT INTO `cy_finance` VALUES ('63', '1', 'cny', '9815.74085480', '0.00000000', '9815.74085480', '0.12991272', '1', 'tradelog', '14', '交易中心-成功卖出-市场fc_cny', '9815.86916570', '0.00000000', '9815.86916570', '38005949f852cfbfd7e504ed5d29517d', '1486644070', '0');
INSERT INTO `cy_finance` VALUES ('64', '5', 'cny', '8.00000000', '2.00000000', '10.00000000', '0.18008728', '2', 'tradelog', '15', '交易中心-成功买入-市场fc_cny', '8.00000000', '1.81991272', '9.81991272', '31b73f97d7addaf9d81f297d43e2033f', '1486644070', '1');
INSERT INTO `cy_finance` VALUES ('65', '1', 'cny', '9815.86916570', '0.00000000', '9815.86916570', '0.18008728', '1', 'tradelog', '15', '交易中心-成功卖出-市场fc_cny', '9816.04703250', '0.00000000', '9816.04703250', 'fed01f1184d2df2be22d7bb407fd12d5', '1486644070', '0');
INSERT INTO `cy_finance` VALUES ('66', '1', 'cny', '9816.04703250', '0.00000000', '9816.04703250', '100000000.00000000', '2', 'issue', '6', '认购中心-立即认购', '9748.04703250', '0.00000000', '9748.04703250', 'ad310350403367bf6542a339517e8aea', '1486645296', '1');
INSERT INTO `cy_finance` VALUES ('67', '5', 'cny', '8.00000000', '1.81991272', '9.81991272', '1.81000000', '2', 'tradelog', '16', '交易中心-成功买入-市场fc_cny', '8.00000000', '0.00991272', '8.00991272', '3794ef8360375931a70a0487f2a54c42', '1486645637', '1');
INSERT INTO `cy_finance` VALUES ('68', '1', 'cny', '9748.04703250', '0.00000000', '9748.04703250', '1.81000000', '1', 'tradelog', '16', '交易中心-成功卖出-市场fc_cny', '9749.83471520', '0.00000000', '9749.83471520', 'dd809f1cbdef81944025298c7921a406', '1486645637', '0');
INSERT INTO `cy_finance` VALUES ('69', '5', 'cny', '8.00000000', '0.00991272', '8.00991272', '5000000.00000000', '2', 'issue', '7', '认购中心-立即认购', '4.60000000', '0.00991272', '4.60991272', '722e0a07d6e3a033b05e76fa08dae90e', '1486646829', '1');
INSERT INTO `cy_finance` VALUES ('70', '5', 'cny', '4.60000000', '0.00991272', '4.60991272', '0.00991272', '2', 'tradelog', '17', '交易中心-成功买入-市场fc_cny', '4.60000000', '0.00000000', '4.60000000', '716740d35d271c4a4590e8d0d37a6d35', '1486652378', '1');
INSERT INTO `cy_finance` VALUES ('71', '1', 'cny', '9749.83981520', '0.00000000', '9749.83981520', '0.00991272', '1', 'tradelog', '17', '交易中心-成功卖出-市场fc_cny', '9749.84960570', '0.00000000', '9749.84960570', '37543e72a747cccd8f00397481641267', '1486652378', '0');
INSERT INTO `cy_finance` VALUES ('72', '1', 'cny', '9749.84960570', '0.00000000', '9749.84960570', '5000000.00000000', '2', 'issue', '8', '认购中心-立即认购', '9749.84960570', '0.00000000', '9749.84960570', '14c75f31364af0e71ea4d5b8e4f2dd16', '1486653860', '1');
INSERT INTO `cy_finance` VALUES ('73', '8', 'cny', '0.00000000', '0.00000000', '0.00000000', '10000000.00000000', '2', 'issue', '9', '认购中心-立即认购', '0.00000000', '0.00000000', '0.00000000', '368ee4b76c30d29f88d3e68a54f67479', '1486693715', '1');
INSERT INTO `cy_finance` VALUES ('74', '8', 'cny', '0.00000000', '0.00000000', '0.00000000', '40000000.00000000', '2', 'issue', '10', '认购中心-立即认购', '0.00000000', '0.00000000', '0.00000000', 'e93d4c2a431d61ca39db498238b4dc5f', '1486693777', '1');
INSERT INTO `cy_finance` VALUES ('75', '8', 'cny', '0.00000000', '0.00000000', '0.00000000', '50000000.00000000', '2', 'issue', '11', '认购中心-立即认购', '0.00000000', '0.00000000', '0.00000000', '8e609a70b9b3deefdf554f95490b4f07', '1486693833', '1');
INSERT INTO `cy_finance` VALUES ('76', '1', 'cny', '9749.84960570', '0.00000000', '9749.84960570', '0.01000000', '2', 'trade', '30', '交易中心-委托买入-市场fc_cny', '9749.83960570', '0.01000000', '9749.84960570', '6257e8533adbc2c8e5e799449a5c11a7', '1486697937', '1');
INSERT INTO `cy_finance` VALUES ('77', '1', 'cny', '9749.83960570', '0.01000000', '9749.84960570', '0.01000000', '2', 'tradelog', '18', '交易中心-成功买入-市场fc_cny', '9749.83960570', '0.00000000', '9749.83960570', '771137f010715e68ac40d866b3d6cd61', '1486697937', '1');
INSERT INTO `cy_finance` VALUES ('78', '1', 'cny', '9749.83960570', '0.00000000', '9749.83960570', '0.01000000', '1', 'tradelog', '18', '交易中心-成功卖出-市场fc_cny', '9749.84948240', '0.00000000', '9749.84948240', '4ede4b818146d28c23370e1b7f408fa1', '1486697937', '1');
INSERT INTO `cy_finance` VALUES ('79', '1', 'cny', '9749.84948240', '0.00000000', '9749.84948240', '1.50000000', '2', 'trade', '31', '交易中心-委托买入-市场fc_cny', '9748.34948240', '1.50000000', '9749.84948240', '9cae20b4b79605774a8f6e37fcf6eb59', '1486697978', '1');
INSERT INTO `cy_finance` VALUES ('80', '1', 'cny', '9748.34948240', '1.50000000', '9749.84948240', '1.50000000', '2', 'tradelog', '19', '交易中心-成功买入-市场fc_cny', '9748.34948240', '0.00000000', '9748.34948240', '0c07f55a6701d80a29d32c74336d1428', '1486697978', '1');
INSERT INTO `cy_finance` VALUES ('81', '1', 'cny', '9748.34948240', '0.00000000', '9748.34948240', '1.50000000', '1', 'tradelog', '19', '交易中心-成功卖出-市场fc_cny', '9749.83098740', '0.00000000', '9749.83098740', '2bd8ea54c1f971c5e1d0ee73d0e136b0', '1486697978', '1');
INSERT INTO `cy_finance` VALUES ('82', '1', 'cny', '9749.83098740', '0.00000000', '9749.83098740', '2.00000000', '2', 'trade', '32', '交易中心-委托买入-市场fc_cny', '9747.83098740', '2.00000000', '9749.83098740', '8c0a7f8d3e0f6f4a1746b0ace84cce5a', '1486698031', '1');
INSERT INTO `cy_finance` VALUES ('83', '1', 'cny', '9747.83098740', '2.00000000', '9749.83098740', '1.00000000', '2', 'tradelog', '20', '交易中心-成功买入-市场fc_cny', '9747.83098740', '1.00000000', '9748.83098740', 'fd2bab4d1e47f7cfccdcb61c021b7d5b', '1486698031', '1');
INSERT INTO `cy_finance` VALUES ('84', '8', 'cny', '0.00000000', '0.00000000', '0.00000000', '1.00000000', '1', 'tradelog', '20', '交易中心-成功卖出-市场fc_cny', '0.98767000', '0.00000000', '0.98767000', '3d70aeefecf0c8f21cccd4838cf4a6c3', '1486698031', '0');
INSERT INTO `cy_finance` VALUES ('85', '1', 'cny', '9747.83099140', '1.00000000', '9748.83099140', '1.00000000', '2', 'tradelog', '21', '交易中心-成功买入-市场fc_cny', '9747.83099140', '0.00000000', '9747.83099140', '56ca407d46b21b84400e309a1cd45281', '1486698031', '1');
INSERT INTO `cy_finance` VALUES ('86', '8', 'cny', '0.98767000', '0.00000000', '0.98767000', '1.00000000', '1', 'tradelog', '21', '交易中心-成功卖出-市场fc_cny', '1.97534000', '0.00000000', '1.97534000', 'a84ca26c1fdbdf69418d2036d802babc', '1486698031', '0');
INSERT INTO `cy_finance` VALUES ('87', '1', 'cny', '9747.83099540', '0.00000000', '9747.83099540', '3.00000000', '2', 'trade', '33', '交易中心-委托买入-市场fc_cny', '9744.83099540', '3.00000000', '9747.83099540', '840d29cfc4f451dd994c3a78969dc9f7', '1486698235', '1');
INSERT INTO `cy_finance` VALUES ('88', '1', 'cny', '9744.83099540', '3.00000000', '9747.83099540', '1.00000000', '2', 'tradelog', '22', '交易中心-成功买入-市场fc_cny', '9744.83099540', '2.00000000', '9746.83099540', 'd37c19d0e4991ceffe317592f36a58dc', '1486698235', '1');
INSERT INTO `cy_finance` VALUES ('89', '8', 'cny', '1.97534000', '0.00000000', '1.97534000', '1.00000000', '1', 'tradelog', '22', '交易中心-成功卖出-市场fc_cny', '2.96301000', '0.00000000', '2.96301000', '0461c60fe85bc25dddf3b992686ed686', '1486698235', '0');
INSERT INTO `cy_finance` VALUES ('90', '1', 'cny', '9744.83099940', '2.00000000', '9746.83099940', '1.00000000', '2', 'tradelog', '23', '交易中心-成功买入-市场fc_cny', '9744.83099940', '1.00000000', '9745.83099940', '48ed2dd4e7ae664e39a6a22358ad00b9', '1486698235', '1');
INSERT INTO `cy_finance` VALUES ('91', '8', 'cny', '2.96301000', '0.00000000', '2.96301000', '1.00000000', '1', 'tradelog', '23', '交易中心-成功卖出-市场fc_cny', '3.95068000', '0.00000000', '3.95068000', 'e533dfd239242b078a6f14751d2ee915', '1486698235', '0');
INSERT INTO `cy_finance` VALUES ('92', '1', 'cny', '9744.83100340', '1.00000000', '9745.83100340', '1.00000000', '2', 'tradelog', '24', '交易中心-成功买入-市场fc_cny', '9744.83100340', '0.00000000', '9744.83100340', '8a8baf54597a69ae8a673c8047baa12b', '1486698235', '1');
INSERT INTO `cy_finance` VALUES ('93', '8', 'cny', '3.95068000', '0.00000000', '3.95068000', '1.00000000', '1', 'tradelog', '24', '交易中心-成功卖出-市场fc_cny', '4.93835000', '0.00000000', '4.93835000', '282cb6af781895b0c0b50580e3bfe1c1', '1486698235', '0');
INSERT INTO `cy_finance` VALUES ('94', '1', 'cny', '9744.83100740', '0.00000000', '9744.83100740', '5.00000000', '2', 'trade', '36', '交易中心-委托买入-市场fc_cny', '9739.83100740', '5.00000000', '9744.83100740', 'b677ca0510a7b3dc68e98c8fb699b40c', '1486706161', '1');
INSERT INTO `cy_finance` VALUES ('95', '1', 'cny', '9739.83100740', '5.00000000', '9744.83100740', '5.00000000', '2', 'tradelog', '25', '交易中心-成功买入-市场fc_cny', '9739.83100740', '0.00000000', '9739.83100740', '4ca2a2c85a1c082eff7f5dac816ce839', '1486706161', '1');
INSERT INTO `cy_finance` VALUES ('96', '1', 'cny', '9739.83100740', '0.00000000', '9739.83100740', '5.00000000', '1', 'tradelog', '25', '交易中心-成功卖出-市场fc_cny', '9744.76935740', '0.00000000', '9744.76935740', '0f7081f9cbb218b546793460fb5858eb', '1486706161', '1');
INSERT INTO `cy_finance` VALUES ('97', '19', 'cny', '0.00000000', '0.00000000', '0.00000000', '5.00000000', '1', 'mycz', '41', '人民币充值-人工到账', '5.00000000', '0.00000000', '5.00000000', 'ce0f0e21d75f0681de49fa6e6c7d099b', '1486725411', '1');
INSERT INTO `cy_finance` VALUES ('98', '1', 'cny', '9744.76935740', '0.00000000', '9744.76935740', '0.01500000', '1', 'mycz', '1', '人民币充值-一代充值奖励-充值ID19,订单PD337983,金额5元,奖励0.015元', '9744.78435740', '0.00000000', '9744.78435740', '3a35d57ddb5489005d5b5e33685c58c8', '1486725411', '1');
INSERT INTO `cy_finance` VALUES ('99', '19', 'cny', '5.00000000', '0.00000000', '5.00000000', '1000000.00000000', '2', 'issue', '12', '认购中心-立即认购', '4.32000000', '0.00000000', '4.32000000', 'a77b19fd2665d928ae477158713761d3', '1486725729', '1');
INSERT INTO `cy_finance` VALUES ('100', '19', 'cny', '4.32000000', '0.00000000', '4.32000000', '1500000.00000000', '2', 'issue', '13', '认购中心-立即认购', '3.30000000', '0.00000000', '3.30000000', 'e7ec6c08e08974e21ec8d97a77f59a01', '1486725828', '1');
INSERT INTO `cy_finance` VALUES ('101', '19', 'cny', '3.30000000', '0.00000000', '3.30000000', '3000000.00000000', '2', 'issue', '14', '认购中心-立即认购', '1.26000000', '0.00000000', '1.26000000', '026e8c581571f2441355b7a823501506', '1486725861', '1');
INSERT INTO `cy_finance` VALUES ('102', '19', 'cny', '1.26000000', '0.00000000', '1.26000000', '1500000.00000000', '2', 'issue', '15', '认购中心-立即认购', '0.24000000', '0.00000000', '0.24000000', '3e801ca14c1ddffd7eea67438cb8ac43', '1486725913', '1');
INSERT INTO `cy_finance` VALUES ('103', '19', 'cny', '0.24000000', '0.00000000', '0.24000000', '2.00000000', '1', 'mycz', '43', '人民币充值-人工到账', '2.24000000', '0.00000000', '2.24000000', '5c7fcd0eeb503f74dce175795c8a879e', '1486728109', '1');
INSERT INTO `cy_finance` VALUES ('104', '1', 'cny', '9744.79149740', '0.00000000', '9744.79149740', '0.00600000', '1', 'mycz', '1', '人民币充值-一代充值奖励-充值ID19,订单EA354576,金额2元,奖励0.006元', '9744.79749740', '0.00000000', '9744.79749740', 'c3f6e2aa083c4df5a7ea92fa8eaf6a1f', '1486728109', '1');
INSERT INTO `cy_finance` VALUES ('105', '24', 'cny', '0.00000000', '0.00000000', '0.00000000', '1.00000000', '1', 'mycz', '42', '人民币充值-人工到账', '1.00000000', '0.00000000', '1.00000000', '6be1a02c99bce99d9dcb5abeefbeba2a', '1486728166', '1');
INSERT INTO `cy_finance` VALUES ('106', '1', 'cny', '9744.79749740', '0.00000000', '9744.79749740', '0.00300000', '1', 'mycz', '1', '人民币充值-一代充值奖励-充值ID24,订单SZ723931,金额1元,奖励0.003元', '9744.80049740', '0.00000000', '9744.80049740', '67e9b982897472479a6c7cb68d180596', '1486728166', '1');
INSERT INTO `cy_finance` VALUES ('107', '19', 'cny', '2.24000000', '0.00000000', '2.24000000', '3000000.00000000', '2', 'issue', '16', '认购中心-立即认购', '0.20000000', '0.00000000', '0.20000000', '67405d9c010f4d2a867dea22fe898928', '1486728243', '1');
INSERT INTO `cy_finance` VALUES ('108', '24', 'cny', '1.00000000', '0.00000000', '1.00000000', '1.00000000', '2', 'trade', '39', '交易中心-委托买入-市场fc_cny', '0.00000000', '1.00000000', '1.00000000', 'b5ee0c5f8a668db847db4259bc155938', '1486728252', '1');
INSERT INTO `cy_finance` VALUES ('109', '24', 'cny', '0.00000000', '1.00000000', '1.00000000', '1.00000000', '2', 'tradelog', '26', '交易中心-成功买入-市场fc_cny', '0.00000000', '0.00000000', '0.00000000', '194b9af0db7932e438ddfb579b779d5b', '1486728252', '1');
INSERT INTO `cy_finance` VALUES ('110', '21', 'cny', '0.00000000', '0.00000000', '0.00000000', '1.00000000', '1', 'tradelog', '26', '交易中心-成功卖出-市场fc_cny', '0.98767000', '0.00000000', '0.98767000', '4c456e65034a668755b33e16f3371166', '1486728252', '1');
INSERT INTO `cy_finance` VALUES ('111', '24', 'cny', '0.00000000', '0.00000000', '0.00000000', '1.00000000', '1', 'mycz', '44', '人民币充值-人工到账', '1.00000000', '0.00000000', '1.00000000', '6be1a02c99bce99d9dcb5abeefbeba2a', '1486744501', '1');
INSERT INTO `cy_finance` VALUES ('112', '1', 'cny', '9744.80356140', '0.00000000', '9744.80356140', '0.00300000', '1', 'mycz', '1', '人民币充值-一代充值奖励-充值ID24,订单FN487386,金额1元,奖励0.003元', '9744.80656140', '0.00000000', '9744.80656140', '0b70f313b14e78714c2072a0158e1427', '1486744501', '1');
INSERT INTO `cy_finance` VALUES ('113', '24', 'cny', '1.00000000', '0.00000000', '1.00000000', '0.50116500', '2', 'trade', '41', '交易中心-委托买入-市场fc_cny', '0.49883500', '0.50116500', '1.00000000', 'c5b7cf27e38157157b7fd40a4b77c96b', '1486777111', '1');
INSERT INTO `cy_finance` VALUES ('114', '24', 'cny', '0.49883500', '0.50116500', '1.00000000', '0.50116500', '2', 'tradelog', '27', '交易中心-成功买入-市场fc_cny', '0.49883500', '0.00000000', '0.49883500', '10c8a33c28b2eaa1a5077d883ee5c77c', '1486777111', '1');
INSERT INTO `cy_finance` VALUES ('115', '21', 'cny', '0.98767000', '0.00000000', '0.98767000', '0.50116500', '1', 'tradelog', '27', '交易中心-成功卖出-市场fc_cny', '1.48150500', '0.00000000', '1.48150500', '19875b559d5b803e14da86068ce94884', '1486777111', '1');
INSERT INTO `cy_finance` VALUES ('116', '24', 'cny', '0.49883500', '0.00000000', '0.49883500', '0.10023300', '2', 'trade', '42', '交易中心-委托买入-市场fc_cny', '0.39860200', '0.10023300', '0.49883500', '5ad575a4e8fde9494ee9c6083e554805', '1486791840', '1');
INSERT INTO `cy_finance` VALUES ('117', '24', 'cny', '0.39860200', '0.10023300', '0.49883500', '0.10023300', '2', 'tradelog', '28', '交易中心-成功买入-市场fc_cny', '0.39860200', '0.00000000', '0.39860200', 'fda19605179a016a61a1481397d37e6a', '1486791840', '1');
INSERT INTO `cy_finance` VALUES ('118', '21', 'cny', '1.48150500', '0.00000000', '1.48150500', '0.10023300', '1', 'tradelog', '28', '交易中心-成功卖出-市场fc_cny', '1.58027200', '0.00000000', '1.58027200', '6aa91c195dd3dc6fef970f0171adbd96', '1486791840', '0');
INSERT INTO `cy_finance` VALUES ('119', '24', 'cny', '0.39860200', '0.00000000', '0.39860200', '0.30069900', '2', 'trade', '43', '交易中心-委托买入-市场fc_cny', '0.09790300', '0.30069900', '0.39860200', 'a81f2706d932d4909f0a6c01aa91cc6a', '1486791892', '1');
INSERT INTO `cy_finance` VALUES ('120', '24', 'cny', '0.09790300', '0.30069900', '0.39860200', '0.30069900', '2', 'tradelog', '29', '交易中心-成功买入-市场fc_cny', '0.09790300', '0.00000000', '0.09790300', '177b2302c68fb446398fa47bbdd292d3', '1486791892', '1');
INSERT INTO `cy_finance` VALUES ('121', '21', 'cny', '1.58027200', '0.00000000', '1.58027200', '0.30069900', '1', 'tradelog', '29', '交易中心-成功卖出-市场fc_cny', '1.87657300', '0.00000000', '1.87657300', '42201d1541ee76f7827f9c20436a94c1', '1486791892', '0');
INSERT INTO `cy_finance` VALUES ('122', '24', 'cny', '0.09790300', '0.00000000', '0.09790300', '0.09020970', '2', 'trade', '44', '交易中心-委托买入-市场fc_cny', '0.00769330', '0.09020970', '0.09790300', 'cd7c6c75ce94e8837273ba035903367d', '1486792050', '1');
INSERT INTO `cy_finance` VALUES ('123', '24', 'cny', '0.00769330', '0.09020970', '0.09790300', '0.09020970', '2', 'tradelog', '30', '交易中心-成功买入-市场fc_cny', '0.00769330', '0.00000000', '0.00769330', '4c1a8d7c6a067a10978f2bf491b6706f', '1486792050', '1');
INSERT INTO `cy_finance` VALUES ('124', '21', 'cny', '1.87657300', '0.00000000', '1.87657300', '0.09020970', '1', 'tradelog', '30', '交易中心-成功卖出-市场fc_cny', '1.96546330', '0.00000000', '1.96546330', '8fb4180684d7a4b8770488f732ed42f5', '1486792050', '0');
INSERT INTO `cy_finance` VALUES ('125', '24', 'cny', '0.00769330', '0.00000000', '0.00769330', '0.00694009', '2', 'trade', '45', '交易中心-委托买入-市场fc_cny', '0.00075321', '0.00694009', '0.00769330', 'b7842b15dd794d57a103e66a84a2f135', '1486792077', '1');
INSERT INTO `cy_finance` VALUES ('126', '24', 'cny', '0.00075321', '0.00694009', '0.00769330', '0.00694009', '2', 'tradelog', '31', '交易中心-成功买入-市场fc_cny', '0.00075321', '0.00000000', '0.00075321', '0db558a4949eb280ef039c7a2315383a', '1486792077', '1');
INSERT INTO `cy_finance` VALUES ('127', '21', 'cny', '1.96546330', '0.00000000', '1.96546330', '0.00694009', '1', 'tradelog', '31', '交易中心-成功卖出-市场fc_cny', '1.97230189', '0.00000000', '1.97230189', '0367fdca6b4cf29d10061ca89fba85ba', '1486792077', '0');
INSERT INTO `cy_finance` VALUES ('128', '24', 'cny', '0.00075321', '0.00000000', '0.00075321', '0.00067946', '2', 'trade', '46', '交易中心-委托买入-市场fc_cny', '0.00007375', '0.00067946', '0.00075321', '5cbaaceb5cba7da65f88a4bcacd86d6d', '1486792110', '1');
INSERT INTO `cy_finance` VALUES ('129', '24', 'cny', '0.00007375', '0.00067946', '0.00075321', '0.00067946', '2', 'tradelog', '32', '交易中心-成功买入-市场fc_cny', '0.00007375', '0.00000000', '0.00007375', '182cc97b0d8af8fc7ebbd22f9ae7d2f1', '1486792110', '1');
INSERT INTO `cy_finance` VALUES ('130', '21', 'cny', '1.97230189', '0.00000000', '1.97230189', '0.00067946', '1', 'tradelog', '32', '交易中心-成功卖出-市场fc_cny', '1.97297141', '0.00000000', '1.97297141', 'dcbb44741d801b632557268154225224', '1486792110', '0');
INSERT INTO `cy_finance` VALUES ('131', '24', 'cny', '0.00007375', '0.00000000', '0.00007375', '0.00006652', '2', 'trade', '47', '交易中心-委托买入-市场fc_cny', '0.00000723', '0.00006652', '0.00007375', 'eeec0ac3ee8717c3f7b7267975d980bd', '1486792126', '1');
INSERT INTO `cy_finance` VALUES ('132', '24', 'cny', '0.00000723', '0.00006652', '0.00007375', '0.00006652', '2', 'tradelog', '33', '交易中心-成功买入-市场fc_cny', '0.00000723', '0.00000000', '0.00000723', 'ecf5de877bac60633e39e7cb42e77d19', '1486792126', '1');
INSERT INTO `cy_finance` VALUES ('133', '21', 'cny', '1.97297141', '0.00000000', '1.97297141', '0.00006652', '1', 'tradelog', '33', '交易中心-成功卖出-市场fc_cny', '1.97303696', '0.00000000', '1.97303696', '09da967f8deafffc73f4fe323ad6c296', '1486792126', '0');
INSERT INTO `cy_finance` VALUES ('134', '8', 'cny', '4.93835000', '0.00000000', '4.93835000', '5000000.00000000', '2', 'issue', '17', '认购中心-立即认购', '1.53835000', '0.00000000', '1.53835000', '82b978fa89ea4aeb46617d377f193d33', '1486804441', '1');
INSERT INTO `cy_finance` VALUES ('135', '8', 'cny', '1.53835000', '0.00000000', '1.53835000', '1000000.00000000', '2', 'issue', '18', '认购中心-立即认购', '0.85835000', '0.00000000', '0.85835000', 'c067c426e0db20791cc843a1f7536df6', '1486804494', '1');
INSERT INTO `cy_finance` VALUES ('136', '35', 'cny', '0.00000000', '0.00000000', '0.00000000', '12222.00000000', '1', 'mycz', '49', '人民币充值-人工到账', '12222.00000000', '0.00000000', '12222.00000000', '362789f2084d3bb9dc3d8c17c3ceca1b', '1492011483', '1');
INSERT INTO `cy_finance` VALUES ('137', '35', 'cny', '12222.00000000', '0.00000000', '12222.00000000', '12222.00000000', '1', 'mycz', '48', '人民币充值-人工到账', '24444.00000000', '0.00000000', '24444.00000000', 'eb572bcd9bf68f94ba026a23455e337d', '1492011485', '1');

-- ----------------------------
-- Table structure for cy_footer
-- ----------------------------
DROP TABLE IF EXISTS `cy_footer`;
CREATE TABLE `cy_footer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `title` varchar(200) NOT NULL,
  `url` varchar(200) NOT NULL,
  `img` varchar(200) NOT NULL,
  `type` varchar(200) NOT NULL,
  `remark` varchar(50) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cy_footer
-- ----------------------------
INSERT INTO `cy_footer` VALUES ('1', '1', '关于我们', '/Article/index/type/aboutus.html', '', '1', '', '1', '111', '0', '1');
INSERT INTO `cy_footer` VALUES ('2', '1', '联系我们', '/Article/index/type/aboutus.html', '', '1', '', '1', '111', '0', '1');
INSERT INTO `cy_footer` VALUES ('3', '1', '资质证明', '/Article/index/type/aboutus.html', '', '1', '', '1', '111', '0', '1');
INSERT INTO `cy_footer` VALUES ('4', '1', '用户协议', '/Article/index/type/aboutus.html', '', '1', '', '1', '111', '0', '1');
INSERT INTO `cy_footer` VALUES ('5', '1', '法律声明', '/Article/index/type/aboutus.html', '', '1', '', '1', '111', '0', '1');
INSERT INTO `cy_footer` VALUES ('6', '1', '1', '/', 'footer_1.png', '2', '', '1', '111', '0', '1');
INSERT INTO `cy_footer` VALUES ('7', '1', '1', 'http://www.szfw.org/', 'footer_2.png', '2', '', '1', '111', '0', '1');
INSERT INTO `cy_footer` VALUES ('8', '1', '1', 'http://www.miibeian.gov.cn/', 'footer_3.png', '2', '', '1', '111', '0', '1');
INSERT INTO `cy_footer` VALUES ('9', '1', '1', 'http://www.cyberpolice.cn/', 'footer_4.png', '2', '', '1', '111', '0', '1');

-- ----------------------------
-- Table structure for cy_huafei
-- ----------------------------
DROP TABLE IF EXISTS `cy_huafei`;
CREATE TABLE `cy_huafei` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `moble` varchar(255) NOT NULL,
  `num` int(11) unsigned NOT NULL,
  `type` varchar(50) NOT NULL,
  `mum` decimal(20,8) NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cy_huafei
-- ----------------------------
INSERT INTO `cy_huafei` VALUES ('1', '2', '13958844896', '50', 'dog', '5.00000000', '1476016339', '0', '0');
INSERT INTO `cy_huafei` VALUES ('2', '12', '15979197685', '30', 'fc', '42857142.85714300', '1486997620', '0', '0');
INSERT INTO `cy_huafei` VALUES ('3', '8', '18157316153', '20', 'fc', '28571428.57142900', '1486998754', '0', '0');
INSERT INTO `cy_huafei` VALUES ('4', '12', '15979197685', '30', 'fc', '42857142.85714300', '1487133105', '0', '0');
INSERT INTO `cy_huafei` VALUES ('5', '12', '15979197685', '10', 'fc', '14285714.28571400', '1487248208', '0', '0');

-- ----------------------------
-- Table structure for cy_huafei_coin
-- ----------------------------
DROP TABLE IF EXISTS `cy_huafei_coin`;
CREATE TABLE `cy_huafei_coin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `coinname` varchar(50) NOT NULL,
  `price` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gbk ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cy_huafei_coin
-- ----------------------------
INSERT INTO `cy_huafei_coin` VALUES ('1', 'fc', '0.0000007', '1');

-- ----------------------------
-- Table structure for cy_huafei_type
-- ----------------------------
DROP TABLE IF EXISTS `cy_huafei_type`;
CREATE TABLE `cy_huafei_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=gbk ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cy_huafei_type
-- ----------------------------
INSERT INTO `cy_huafei_type` VALUES ('1', '10', '10元话费充值', '1');
INSERT INTO `cy_huafei_type` VALUES ('2', '20', '20元话费充值', '1');
INSERT INTO `cy_huafei_type` VALUES ('3', '30', '30元话费充值', '1');
INSERT INTO `cy_huafei_type` VALUES ('4', '50', '50元话费充值', '1');
INSERT INTO `cy_huafei_type` VALUES ('5', '100', '100元话费充值', '1');
INSERT INTO `cy_huafei_type` VALUES ('6', '300', '300元话费充值', '1');

-- ----------------------------
-- Table structure for cy_intro
-- ----------------------------
DROP TABLE IF EXISTS `cy_intro`;
CREATE TABLE `cy_intro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `content` text,
  `time` int(11) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cy_intro
-- ----------------------------
INSERT INTO `cy_intro` VALUES ('2', '1', 'weqweqwq', '1510137714');
INSERT INTO `cy_intro` VALUES ('3', '4', '1', '1512090518');
INSERT INTO `cy_intro` VALUES ('4', '16', 'ss', '1520922898');
INSERT INTO `cy_intro` VALUES ('5', '20', '123', '1524036173');

-- ----------------------------
-- Table structure for cy_issue
-- ----------------------------
DROP TABLE IF EXISTS `cy_issue`;
CREATE TABLE `cy_issue` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `coinname` varchar(50) NOT NULL,
  `buycoin` varchar(50) NOT NULL,
  `num` bigint(20) unsigned NOT NULL,
  `deal` int(11) unsigned NOT NULL,
  `price` decimal(20,8) unsigned NOT NULL,
  `limit` int(11) unsigned NOT NULL,
  `time` varchar(255) NOT NULL,
  `tian` varchar(255) NOT NULL,
  `ci` varchar(255) NOT NULL,
  `jian` varchar(255) NOT NULL,
  `min` varchar(255) NOT NULL,
  `max` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `invit_coin` varchar(50) NOT NULL,
  `invit_1` varchar(50) NOT NULL,
  `invit_2` varchar(50) NOT NULL,
  `invit_3` varchar(50) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `name` (`name`),
  KEY `coinname` (`coinname`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='认购发行表';

-- ----------------------------
-- Records of cy_issue
-- ----------------------------
INSERT INTO `cy_issue` VALUES ('5', '滑稽币认购', 'fc', 'cny', '50000000000', '1158500000', '0.00000068', '2147483647', '2017-02-07 00:00:00', '7', '7', '24', '1000000', '100000000', '滑稽币众筹时间：<span>2</span>月14日<span>20:00</span>至2月28日<span>22:00</span>共14天<span></span> \r\n<p align=\"left\" class=\"MsoNormal\">\r\n	滑稽币众筹机制：核心理论上促进机会均等，扩展性强的二代加密货币平台<span></span> \r\n</p>\r\n<p align=\"left\" class=\"MsoNormal\">\r\n	最终解释权归滑稽之家官方所有。<span></span> \r\n</p>\r\n<p align=\"left\" class=\"MsoNormal\">\r\n	认购价格：<span>1</span>元/150w  在一周内发放至玩家账户\r\n</p>\r\n<p align=\"left\" class=\"MsoNormal\">\r\n	支付方式：支持人民币<span></span> \r\n</p>\r\n<p align=\"left\" class=\"MsoNormal\">\r\n	开盘时间：认筹结束后第二天开盘<span></span> \r\n</p>\r\n<p align=\"left\" class=\"MsoNormal\">\r\n	交易时间：<span>9</span>点<span>-22</span>点<span></span> \r\n</p>\r\n<p align=\"left\" class=\"MsoNormal\">\r\n	收益达到惊人的1.5倍!\r\n</p>\r\n<p align=\"left\" class=\"MsoNormal\">\r\n	当然，平台推出福利，也需要玩家付出推广的努力！即日起，您可以认购的滑稽币数量=您所有下级认购的滑稽币数量之和（人民币支付项）\r\n</p>\r\n<p align=\"left\" class=\"MsoNormal\">\r\n	欢迎认购！一起滑稽吧！\r\n</p>', 'cny', '0.15', '0.1', '0.05', '0', '1486571831', '0', '0');
INSERT INTO `cy_issue` VALUES ('6', '滑稽币平台返利', 'fc', 'fc', '100000000000', '110000000', '0.83000000', '2147483647', '2017-02-06 00:00:00', '30', '30', '24', '1000000', '100000000', '<p>\r\n	滑稽币平台返利震撼上市！\r\n</p>\r\n<p>\r\n	用500W滑稽币认购平台滑稽币，即可在一个月内得到每天20W滑稽币的返利奖励！！（当然，可以更多认购，上线一亿）\r\n</p>\r\n<p>\r\n	欢迎认购，一起滑稽吧！\r\n</p>', 'fc', '0.15', '0.1', '0.05', '0', '1487557972', '0', '0');
INSERT INTO `cy_issue` VALUES ('7', '滑稽币认购', 'fc', 'fc', '105000000000', '0', '0.83000000', '0', '2017-02-22 00:00:00', '30', '30', '24', '', '', '<p>\r\n	滑稽币认购震撼上市！\r\n</p>\r\n<p>\r\n	使用100万滑稽币购买认购，即可在一个月内每天得到4万滑稽币！\r\n</p>\r\n<p>\r\n	复利多多，欢迎认购！\r\n</p>', 'cny', '0.3', '0.2', '0.1', '0', '1487558592', '0', '0');

-- ----------------------------
-- Table structure for cy_issue_log
-- ----------------------------
DROP TABLE IF EXISTS `cy_issue_log`;
CREATE TABLE `cy_issue_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `coinname` varchar(50) NOT NULL,
  `buycoin` varchar(50) NOT NULL,
  `price` decimal(20,8) unsigned NOT NULL,
  `num` int(20) unsigned NOT NULL,
  `mum` decimal(20,8) unsigned NOT NULL,
  `ci` int(11) unsigned NOT NULL,
  `jian` varchar(255) NOT NULL,
  `unlock` int(11) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='认购记录表';

-- ----------------------------
-- Records of cy_issue_log
-- ----------------------------
INSERT INTO `cy_issue_log` VALUES ('1', '1', '滑稽币平台返利', 'fc', 'fc', '5000000.00000000', '1', '5000000.00000000', '0', '', '1', '0', '1486477461', '1486477461', '0');
INSERT INTO `cy_issue_log` VALUES ('2', '1', '滑稽币认购', 'fc', 'cny', '0.00000100', '1000000', '1.00000000', '30', '24', '2', '0', '1486477794', '1486644853', '0');
INSERT INTO `cy_issue_log` VALUES ('3', '1', '滑稽币认购', 'fc', 'cny', '0.00000660', '15000000', '99.00000000', '7', '24', '2', '0', '1486538856', '1486644850', '0');
INSERT INTO `cy_issue_log` VALUES ('4', '13', '滑稽币认购', 'fc', 'cny', '0.00000066', '15000000', '9.90000000', '7', '24', '1', '0', '1486538948', '1486538948', '0');
INSERT INTO `cy_issue_log` VALUES ('5', '17', '滑稽币认购', 'fc', 'cny', '0.00000066', '7500000', '4.95000000', '7', '24', '4', '0', '1486571731', '1488618425', '0');
INSERT INTO `cy_issue_log` VALUES ('6', '1', '滑稽币认购', 'fc', 'cny', '0.00000068', '100000000', '68.00000000', '7', '24', '1', '0', '1486645296', '1486645296', '0');
INSERT INTO `cy_issue_log` VALUES ('7', '5', '滑稽币认购', 'fc', 'cny', '0.00000068', '5000000', '3.40000000', '7', '24', '1', '0', '1486646829', '1486646829', '0');
INSERT INTO `cy_issue_log` VALUES ('8', '1', '滑稽币平台返利', 'fc', 'fc', '0.83000000', '5000000', '4150000.00000000', '30', '24', '1', '0', '1486653860', '1486653860', '0');
INSERT INTO `cy_issue_log` VALUES ('9', '8', '滑稽币平台返利', 'fc', 'fc', '0.83000000', '10000000', '8300000.00000000', '30', '24', '7', '0', '1486693715', '1487905707', '0');
INSERT INTO `cy_issue_log` VALUES ('10', '8', '滑稽币平台返利', 'fc', 'fc', '0.83000000', '40000000', '33200000.00000000', '30', '24', '7', '0', '1486693777', '1487905706', '0');
INSERT INTO `cy_issue_log` VALUES ('11', '8', '滑稽币平台返利', 'fc', 'fc', '0.83000000', '50000000', '41500000.00000000', '30', '24', '7', '0', '1486693833', '1487905704', '0');
INSERT INTO `cy_issue_log` VALUES ('12', '19', '滑稽币认购', 'fc', 'cny', '0.00000068', '1000000', '0.68000000', '7', '24', '1', '0', '1486725729', '1486725729', '0');
INSERT INTO `cy_issue_log` VALUES ('13', '19', '滑稽币认购', 'fc', 'cny', '0.00000068', '1500000', '1.02000000', '7', '24', '1', '0', '1486725828', '1486725828', '0');
INSERT INTO `cy_issue_log` VALUES ('14', '19', '滑稽币认购', 'fc', 'cny', '0.00000068', '3000000', '2.04000000', '7', '24', '1', '0', '1486725861', '1486725861', '0');
INSERT INTO `cy_issue_log` VALUES ('15', '19', '滑稽币认购', 'fc', 'cny', '0.00000068', '1500000', '1.02000000', '7', '24', '1', '0', '1486725913', '1486725913', '0');
INSERT INTO `cy_issue_log` VALUES ('16', '19', '滑稽币认购', 'fc', 'cny', '0.00000068', '3000000', '2.04000000', '7', '24', '1', '0', '1486728243', '1486728243', '0');
INSERT INTO `cy_issue_log` VALUES ('17', '8', '滑稽币认购', 'fc', 'cny', '0.00000068', '5000000', '3.40000000', '7', '24', '6', '0', '1486804441', '1487905704', '0');
INSERT INTO `cy_issue_log` VALUES ('18', '8', '滑稽币认购', 'fc', 'cny', '0.00000068', '1000000', '0.68000000', '7', '24', '6', '0', '1486804494', '1487905702', '0');

-- ----------------------------
-- Table structure for cy_link
-- ----------------------------
DROP TABLE IF EXISTS `cy_link`;
CREATE TABLE `cy_link` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `title` varchar(200) NOT NULL,
  `url` varchar(200) NOT NULL,
  `img` varchar(200) NOT NULL,
  `mytx` varchar(200) NOT NULL,
  `remark` varchar(50) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='常用银行地址';

-- ----------------------------
-- Records of cy_link
-- ----------------------------
INSERT INTO `cy_link` VALUES ('1', 'boc', '中国银行', 'http://www.boc.cn/', 'img_56937003683ce.jpg', '', '', '0', '1452503043', '0', '1');
INSERT INTO `cy_link` VALUES ('2', 'abc', '农业银行', 'http://www.abchina.com/cn/', 'img_569370458b18d.jpg', '', '', '0', '1452503109', '0', '1');
INSERT INTO `cy_link` VALUES ('3', 'bccb', '北京银行', 'http://www.bankofbeijing.com.cn/', 'img_569370588dcdc.jpg', '', '', '0', '1452503128', '0', '1');
INSERT INTO `cy_link` VALUES ('4', 'ccb', '建设银行', 'http://www.ccb.com/', 'img_5693709bbd20f.jpg', '', '', '0', '1452503195', '0', '1');
INSERT INTO `cy_link` VALUES ('5', 'ceb', '光大银行', 'http://www.bankofbeijing.com.cn/', 'img_569370b207cc8.jpg', '', '', '0', '1452503218', '0', '1');
INSERT INTO `cy_link` VALUES ('6', 'cib', '兴业银行', 'http://www.cib.com.cn/cn/index.html', 'img_569370d29bf59.jpg', '', '', '0', '1452503250', '0', '1');
INSERT INTO `cy_link` VALUES ('7', 'citic', '中信银行', 'http://www.ecitic.com/', 'img_569370fb7a1b3.jpg', '', '', '0', '1452503291', '0', '1');
INSERT INTO `cy_link` VALUES ('8', 'cmb', '招商银行', 'http://www.cmbchina.com/', 'img_5693710a9ac9c.jpg', '', '', '0', '1452503306', '0', '1');
INSERT INTO `cy_link` VALUES ('9', 'cmbc', '民生银行', 'http://www.cmbchina.com/', 'img_5693711f97a9d.jpg', '', '', '0', '1452503327', '0', '1');
INSERT INTO `cy_link` VALUES ('10', '虚拟币信息中文网', '虚拟币信息中文网', 'http://www.chinabtcltc.com/', 'img_5693713076351.jpg', '', '', '0', '1452503344', '1480225439', '1');
INSERT INTO `cy_link` VALUES ('11', '巴比特论坛', '巴比特论坛', 'http://www.8btc.com/', 'img_56937154bebc5.jpg', '', '', '0', '1452503380', '1480225390', '1');
INSERT INTO `cy_link` VALUES ('12', 'F2Pool 挖矿鱼池', 'F2Pool 挖矿鱼池', 'https://www.f2pool.com/', 'img_56937162db7f5.jpg', '', '', '0', '1480225304', '1480225306', '1');
INSERT INTO `cy_link` VALUES ('13', '币行', '币行', 'https://www.okcoin.cn', 'img_5693717eefaa3.jpg', '', '', '0', '1452503422', '1480225269', '1');
INSERT INTO `cy_link` VALUES ('14', '比特时代', '比特时代', 'http://www.btc38.com/', 'img_5693718f1d70e.jpg', '', '', '0', '1452503439', '1480225238', '1');
INSERT INTO `cy_link` VALUES ('15', 'BTC123', 'BTC123', 'https://www.btc123.com', '56c2e4c9aff85.jpg', '', '', '0', '1455613129', '1480225206', '1');

-- ----------------------------
-- Table structure for cy_log
-- ----------------------------
DROP TABLE IF EXISTS `cy_log`;
CREATE TABLE `cy_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) unsigned NOT NULL,
  `coinname` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(20,8) unsigned NOT NULL,
  `num` int(20) unsigned NOT NULL,
  `mum` decimal(20,8) unsigned NOT NULL,
  `unlock` int(11) unsigned NOT NULL,
  `ci` int(11) unsigned NOT NULL,
  `recycle` int(11) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `userid` (`userid`),
  KEY `coinname` (`coinname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cy_log
-- ----------------------------

-- ----------------------------
-- Table structure for cy_market
-- ----------------------------
DROP TABLE IF EXISTS `cy_market`;
CREATE TABLE `cy_market` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `round` varchar(255) NOT NULL,
  `fee_buy` varchar(255) NOT NULL,
  `fee_sell` varchar(255) NOT NULL,
  `buy_min` varchar(255) NOT NULL,
  `buy_max` varchar(255) NOT NULL,
  `sell_min` varchar(255) NOT NULL,
  `sell_max` varchar(255) NOT NULL,
  `trade_min` varchar(255) NOT NULL,
  `trade_max` varchar(255) NOT NULL,
  `invit_buy` varchar(50) NOT NULL,
  `invit_sell` varchar(50) NOT NULL,
  `invit_1` varchar(50) NOT NULL,
  `invit_2` varchar(50) NOT NULL,
  `invit_3` varchar(50) NOT NULL,
  `zhang` varchar(255) NOT NULL,
  `die` varchar(255) NOT NULL,
  `hou_price` varchar(255) NOT NULL,
  `tendency` varchar(1000) NOT NULL,
  `trade` int(11) unsigned NOT NULL,
  `new_price` decimal(20,8) unsigned NOT NULL,
  `buy_price` decimal(20,8) unsigned NOT NULL,
  `sell_price` decimal(20,8) unsigned NOT NULL,
  `min_price` decimal(20,8) unsigned NOT NULL,
  `max_price` decimal(20,8) unsigned NOT NULL,
  `volume` decimal(20,8) unsigned NOT NULL,
  `change` decimal(20,8) NOT NULL,
  `api_min` decimal(20,8) unsigned NOT NULL,
  `api_max` decimal(20,8) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='行情配置表';

-- ----------------------------
-- Records of cy_market
-- ----------------------------

-- ----------------------------
-- Table structure for cy_menu
-- ----------------------------
DROP TABLE IF EXISTS `cy_menu`;
CREATE TABLE `cy_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  `ico_name` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=455 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cy_menu
-- ----------------------------
INSERT INTO `cy_menu` VALUES ('1', '系统', '0', '1', 'Index/index', '0', '', '', '0', 'home');
INSERT INTO `cy_menu` VALUES ('2', '内容', '0', '1', 'Article/index', '1', '', '', '0', 'list-alt');
INSERT INTO `cy_menu` VALUES ('3', '用户', '0', '1', 'User/index', '0', '', '', '0', 'user');
INSERT INTO `cy_menu` VALUES ('4', '财务', '0', '1', 'Finance/myzr', '0', '', '', '0', 'th-list');
INSERT INTO `cy_menu` VALUES ('5', '交易', '0', '1', 'Trade/index', '0', '', '', '0', 'stats');
INSERT INTO `cy_menu` VALUES ('6', '应用', '0', '1', 'Game/index', '1', '', '', '0', 'globe');
INSERT INTO `cy_menu` VALUES ('7', '设置', '0', '1', 'Config/index', '0', '', '', '0', 'cog');
INSERT INTO `cy_menu` VALUES ('8', '运营', '0', '1', 'Operate/index', '1', '', '', '0', 'share');
INSERT INTO `cy_menu` VALUES ('9', '工具', '0', '1', 'Tools/index', '0', '', '', '0', 'wrench');
INSERT INTO `cy_menu` VALUES ('10', '扩展', '0', '1', 'Cloud/index', '1', '', '', '0', 'tasks');
INSERT INTO `cy_menu` VALUES ('11', '系统概览', '1', '1', 'Index/index', '0', '', '系统', '0', 'home');
INSERT INTO `cy_menu` VALUES ('12', '市场统计', '1', '3', 'Index/market', '1', '', '系统', '0', 'home');
INSERT INTO `cy_menu` VALUES ('13', '文章管理', '2', '1', 'Article/index', '0', '', '内容', '0', 'list-alt');
INSERT INTO `cy_menu` VALUES ('14', '编辑添加', '13', '1', 'Article/edit', '1', '', '内容', '0', 'home');
INSERT INTO `cy_menu` VALUES ('15', '修改状态', '13', '100', 'Article/status', '1', '', '内容', '0', 'home');
INSERT INTO `cy_menu` VALUES ('16', '上传图片', '13', '2', 'Article/images', '1', '', '内容管理', '0', '0');
INSERT INTO `cy_menu` VALUES ('18', '编辑', '17', '2', 'Adver/edit', '1', '', '内容管理', '0', '0');
INSERT INTO `cy_menu` VALUES ('19', '修改', '17', '2', 'Adver/status', '1', '', '内容管理', '0', '0');
INSERT INTO `cy_menu` VALUES ('21', '编辑', '20', '3', 'Chat/edit', '1', '', '聊天管理', '0', '0');
INSERT INTO `cy_menu` VALUES ('22', '修改', '20', '3', 'Chat/status', '1', '', '聊天管理', '0', '0');
INSERT INTO `cy_menu` VALUES ('23', '提示文字', '2', '1', 'Text/index', '1', '', '提示管理', '0', 'exclamation-sign');
INSERT INTO `cy_menu` VALUES ('24', '编辑', '23', '1', 'Text/edit', '1', '', '提示管理', '0', '0');
INSERT INTO `cy_menu` VALUES ('25', '修改', '23', '1', 'Text/status', '1', '', '提示管理', '0', '0');
INSERT INTO `cy_menu` VALUES ('26', '用户管理', '3', '1', 'User/index', '0', '', '用户', '0', 'user');
INSERT INTO `cy_menu` VALUES ('32', '确认转出', '26', '8', 'User/myzc_qr', '1', '', '用户管理', '0', '0');
INSERT INTO `cy_menu` VALUES ('33', '用户配置', '3', '1', 'User/config', '1', '', '前台用户管理', '0', 'cog');
INSERT INTO `cy_menu` VALUES ('34', '编辑', '33', '2', 'User/index_edit', '1', '', '用户管理', '0', '0');
INSERT INTO `cy_menu` VALUES ('35', '修改', '33', '2', 'User/index_status', '1', '', '用户管理', '0', '0');
INSERT INTO `cy_menu` VALUES ('37', '财产修改', '26', '3', 'Usercoin/edit', '1', '', '用户管理', '0', '0');
INSERT INTO `cy_menu` VALUES ('39', '新增用户组', '38', '0', 'AuthManager/createGroup', '1', '', '权限管理', '0', '0');
INSERT INTO `cy_menu` VALUES ('40', '编辑用户组', '38', '0', 'AuthManager/editgroup', '1', '', '权限管理', '0', '0');
INSERT INTO `cy_menu` VALUES ('41', '更新用户组', '38', '0', 'AuthManager/writeGroup', '1', '', '权限管理', '0', '0');
INSERT INTO `cy_menu` VALUES ('42', '改变状态', '38', '0', 'AuthManager/changeStatus', '1', '', '权限管理', '0', '0');
INSERT INTO `cy_menu` VALUES ('43', '访问授权', '38', '0', 'AuthManager/access', '1', '', '权限管理', '0', '0');
INSERT INTO `cy_menu` VALUES ('44', '分类授权', '38', '0', 'AuthManager/category', '1', '', '权限管理', '0', '0');
INSERT INTO `cy_menu` VALUES ('45', '成员授权', '38', '0', 'AuthManager/user', '1', '', '权限管理', '0', '0');
INSERT INTO `cy_menu` VALUES ('46', '成员列表授权', '38', '0', 'AuthManager/tree', '1', '', '权限管理', '0', '0');
INSERT INTO `cy_menu` VALUES ('47', '用户组', '38', '0', 'AuthManager/group', '1', '', '权限管理', '0', '0');
INSERT INTO `cy_menu` VALUES ('48', '添加到用户组', '38', '0', 'AuthManager/addToGroup', '1', '', '权限管理', '0', '0');
INSERT INTO `cy_menu` VALUES ('49', '用户组移除', '38', '0', 'AuthManager/removeFromGroup', '1', '', '权限管理', '0', '0');
INSERT INTO `cy_menu` VALUES ('50', '分类添加到用户组', '38', '0', 'AuthManager/addToCategory', '1', '', '权限管理', '0', '0');
INSERT INTO `cy_menu` VALUES ('51', '模型添加到用户组', '38', '0', 'AuthManager/addToModel', '1', '', '权限管理', '0', '0');
INSERT INTO `cy_menu` VALUES ('53', '配置', '52', '1', 'Finance/config', '1', '', '', '0', '0');
INSERT INTO `cy_menu` VALUES ('55', '类型', '52', '1', 'Finance/type', '1', '', '', '0', '0');
INSERT INTO `cy_menu` VALUES ('56', '状态修改', '52', '1', 'Finance/type_status', '1', '', '', '0', '0');
INSERT INTO `cy_menu` VALUES ('60', '修改', '57', '3', 'Mycz/status', '1', '', '充值管理', '0', '0');
INSERT INTO `cy_menu` VALUES ('61', '状态修改', '57', '3', 'Mycztype/status', '1', '', '充值管理', '0', '0');
INSERT INTO `cy_menu` VALUES ('64', '状态修改', '62', '5', 'Mytx/status', '1', '', '提现管理', '0', '0');
INSERT INTO `cy_menu` VALUES ('65', '取消', '62', '5', 'Mytx/excel', '1', '', '提现管理', '0', '0');
INSERT INTO `cy_menu` VALUES ('66', '导入excel', '9', '5', 'Mytx/exportExcel', '1', '', '提现管理', '0', '0');
INSERT INTO `cy_menu` VALUES ('68', '委托管理', '5', '1', 'Trade/index', '0', '', '交易', '0', 'stats');
INSERT INTO `cy_menu` VALUES ('69', '成交记录', '5', '2', 'Trade/log', '1', '', '交易', '0', 'stats');
INSERT INTO `cy_menu` VALUES ('70', '修改状态', '68', '0', 'Trade/status', '0', '', '交易管理', '0', '0');
INSERT INTO `cy_menu` VALUES ('71', '撤销挂单', '68', '0', 'Trade/chexiao', '0', '', '交易管理', '0', '0');
INSERT INTO `cy_menu` VALUES ('74', '认购编辑', '72', '2', 'Issue/edit', '1', '', '认购管理', '0', '0');
INSERT INTO `cy_menu` VALUES ('75', '认购修改', '72', '2', 'Issue/status', '1', '', '认购管理', '0', '0');
INSERT INTO `cy_menu` VALUES ('79', '基本配置', '7', '1', 'Config/index', '0', '', '设置', '0', 'cog');
INSERT INTO `cy_menu` VALUES ('80', '短信配置', '7', '2', 'Config/moble', '1', '', '设置', '0', 'cog');
INSERT INTO `cy_menu` VALUES ('81', '客服配置', '7', '3', 'Config/contact', '1', '', '设置', '0', 'cog');
INSERT INTO `cy_menu` VALUES ('82', '银行配置', '79', '4', 'Config/bank', '0', '', '网站配置', '0', 'credit-card');
INSERT INTO `cy_menu` VALUES ('83', '编辑', '82', '4', 'Config/bank_edit', '0', '', '网站配置', '0', '0');
INSERT INTO `cy_menu` VALUES ('85', '编辑', '84', '4', 'Coin/edit', '0', '', '网站配置', '0', '0');
INSERT INTO `cy_menu` VALUES ('87', '状态修改', '84', '4', 'Coin/status', '1', '', '网站配置', '0', '0');
INSERT INTO `cy_menu` VALUES ('89', '编辑市场', '88', '4', 'Market/edit', '0', '', '', '0', '0');
INSERT INTO `cy_menu` VALUES ('91', '状态修改', '88', '4', 'Config/market_add', '0', '', '', '0', '0');
INSERT INTO `cy_menu` VALUES ('92', '图形验证码', '95', '7', 'Verify/code', '1', '', '网站配置', '0', '0');
INSERT INTO `cy_menu` VALUES ('93', '手机验证码', '95', '7', 'Verify/mobile', '1', '', '网站配置', '0', '0');
INSERT INTO `cy_menu` VALUES ('94', '邮件验证码', '95', '7', 'Verify/email', '1', '', '网站配置', '0', '0');
INSERT INTO `cy_menu` VALUES ('95', '其他配置', '7', '6', 'Config/qita', '1', '', '设置', '0', 'cog');
INSERT INTO `cy_menu` VALUES ('97', '推广配置', '8', '2', 'Invit/config', '1', '', '推广管理', '0', 'cog');
INSERT INTO `cy_menu` VALUES ('101', '其他模块调用', '9', '4', 'Tools/invoke', '1', '', '其他', '0', '0');
INSERT INTO `cy_menu` VALUES ('102', '优化表', '9', '4', 'Tools/optimize', '1', '', '其他', '0', '0');
INSERT INTO `cy_menu` VALUES ('103', '修复表', '9', '4', 'Tools/repair', '1', '', '其他', '0', '0');
INSERT INTO `cy_menu` VALUES ('104', '删除备份文件', '9', '4', 'Tools/del', '1', '', '其他', '0', '0');
INSERT INTO `cy_menu` VALUES ('105', '备份数据库', '9', '4', 'Tools/export', '1', '', '其他', '0', '');
INSERT INTO `cy_menu` VALUES ('106', '还原数据库', '9', '4', 'Tools/import', '1', '', '其他', '0', '0');
INSERT INTO `cy_menu` VALUES ('107', '导出数据库', '9', '4', 'Tools/excel', '1', '', '其他', '0', '0');
INSERT INTO `cy_menu` VALUES ('108', '导出Excel', '9', '4', 'Tools/exportExcel', '1', '', '其他', '0', '0');
INSERT INTO `cy_menu` VALUES ('109', '导入Excel', '9', '4', 'Tools/importExecl', '1', '', '其他', '0', '0');
INSERT INTO `cy_menu` VALUES ('115', '图片', '111', '0', 'Shop/images', '0', '', '云购商城', '0', '0');
INSERT INTO `cy_menu` VALUES ('116', '菜单管理', '7', '5', 'Menu/index', '1', '', '开发组', '0', 'list');
INSERT INTO `cy_menu` VALUES ('117', '排序', '116', '5', 'Menu/sort', '0', '', '开发组', '0', '0');
INSERT INTO `cy_menu` VALUES ('118', '添加', '116', '5', 'Menu/add', '0', '', '开发组', '0', '0');
INSERT INTO `cy_menu` VALUES ('119', '编辑', '116', '5', 'Menu/edit', '0', '', '开发组', '0', '0');
INSERT INTO `cy_menu` VALUES ('120', '删除', '116', '5', 'Menu/del', '0', '', '开发组', '0', '0');
INSERT INTO `cy_menu` VALUES ('121', '是否隐藏', '116', '5', 'Menu/toogleHide', '0', '', '开发组', '0', '0');
INSERT INTO `cy_menu` VALUES ('122', '是否开发', '116', '5', 'Menu/toogleDev', '0', '', '开发组', '0', '0');
INSERT INTO `cy_menu` VALUES ('123', '导入文件', '7', '5', 'Menu/importFile', '1', '', '开发组', '0', 'log-in');
INSERT INTO `cy_menu` VALUES ('124', '导入', '7', '5', 'Menu/import', '1', '', '开发组', '0', 'log-in');
INSERT INTO `cy_menu` VALUES ('127', '用户登录', '3', '0', 'Login/index', '1', '', '用户配置', '0', '0');
INSERT INTO `cy_menu` VALUES ('128', '用户退出', '3', '0', 'Login/loginout', '1', '', '用户配置', '0', '0');
INSERT INTO `cy_menu` VALUES ('129', '修改管理员密码', '3', '0', 'User/setpwd', '1', '', '用户', '0', 'home');
INSERT INTO `cy_menu` VALUES ('131', '用户详情', '3', '4', 'User/detail', '1', '', '前台用户管理', '0', 'time');
INSERT INTO `cy_menu` VALUES ('132', '后台用户详情', '3', '1', 'AdminUser/detail', '1', '', '后台用户管理', '0', 'th-list');
INSERT INTO `cy_menu` VALUES ('133', '后台用户状态', '3', '1', 'AdminUser/status', '1', '', '后台用户管理', '0', 'th-list');
INSERT INTO `cy_menu` VALUES ('134', '后台用户新增', '3', '1', 'AdminUser/add', '1', '', '后台用户管理', '0', 'th-list');
INSERT INTO `cy_menu` VALUES ('135', '后台用户编辑', '3', '1', 'AdminUser/edit', '1', '', '后台用户管理', '0', 'th-list');
INSERT INTO `cy_menu` VALUES ('138', '编辑', '2', '1', 'Articletype/edit', '1', '', '内容管理', '0', 'list-alt');
INSERT INTO `cy_menu` VALUES ('140', '编辑', '139', '2', 'Link/edit', '1', '', '内容管理', '0', '0');
INSERT INTO `cy_menu` VALUES ('141', '修改', '139', '2', 'Link/status', '1', '', '内容管理', '0', '0');
INSERT INTO `cy_menu` VALUES ('155', '服务器队列', '9', '3', 'Tools/queue', '1', '', '工具', '0', 'wrench');
INSERT INTO `cy_menu` VALUES ('156', '钱包检查', '9', '3', 'Tools/qianbao', '1', '', '工具', '0', 'wrench');
INSERT INTO `cy_menu` VALUES ('157', '币种统计', '1', '2', 'Index/coin', '1', '', '系统', '0', 'home');
INSERT INTO `cy_menu` VALUES ('163', '提示文字', '7', '5', 'Config/text', '1', '', '设置', '0', 'cog');
INSERT INTO `cy_menu` VALUES ('220', '币种评论', '5', '4', 'Trade/comment', '1', '', '交易', '0', 'stats');
INSERT INTO `cy_menu` VALUES ('278', '文章类型', '2', '2', 'Article/type', '0', '', '内容', '0', 'list-alt');
INSERT INTO `cy_menu` VALUES ('279', '广告管理', '2', '3', 'Article/adver', '0', '', '内容', '0', 'list-alt');
INSERT INTO `cy_menu` VALUES ('280', '友情链接', '2', '4', 'Article/link', '0', '', '内容', '0', 'list-alt');
INSERT INTO `cy_menu` VALUES ('282', '登陆日志', '3', '4', 'User/log', '0', '', '用户', '0', 'user');
INSERT INTO `cy_menu` VALUES ('283', '用户钱包', '3', '5', 'User/qianbao', '1', '', '用户', '0', 'user');
INSERT INTO `cy_menu` VALUES ('284', '提现地址', '3', '6', 'User/bank', '1', '', '用户', '0', 'user');
INSERT INTO `cy_menu` VALUES ('285', '用户财产', '3', '7', 'User/coin', '0', '', '用户', '0', 'user');
INSERT INTO `cy_menu` VALUES ('286', '联系地址', '3', '8', 'User/goods', '1', '', '用户', '0', 'user');
INSERT INTO `cy_menu` VALUES ('287', '交易聊天', '5', '3', 'Trade/chat', '1', '', '交易', '0', 'stats');
INSERT INTO `cy_menu` VALUES ('288', '交易市场', '5', '5', 'Trade/market', '1', '', '交易', '0', 'stats');
INSERT INTO `cy_menu` VALUES ('289', '交易推荐', '5', '6', 'Trade/invit', '1', '', '交易', '0', 'stats');
INSERT INTO `cy_menu` VALUES ('290', '财务明细', '4', '1', 'Finance/index', '1', '', '财务', '0', 'th-list');
INSERT INTO `cy_menu` VALUES ('291', '人民币充值', '4', '2', 'Finance/mycz', '1', '', '财务', '0', 'th-list');
INSERT INTO `cy_menu` VALUES ('292', '人民币充值方式', '4', '3', 'Finance/myczType', '1', '', '财务', '0', 'th-list');
INSERT INTO `cy_menu` VALUES ('293', '人民币提现', '4', '4', 'Finance/mytx', '1', '', '财务', '0', 'th-list');
INSERT INTO `cy_menu` VALUES ('294', '人民币提现配置', '4', '5', 'Finance/mytxConfig', '1', '', '财务', '0', 'th-list');
INSERT INTO `cy_menu` VALUES ('295', '虚拟币转入', '4', '6', 'Finance/myzr', '0', '', '财务', '0', 'th-list');
INSERT INTO `cy_menu` VALUES ('296', '虚拟币转出', '4', '7', 'Finance/myzc', '0', '', '财务', '0', 'th-list');
INSERT INTO `cy_menu` VALUES ('297', '修改状态', '291', '100', 'Finance/myczStatus', '1', '', '财务', '0', 'home');
INSERT INTO `cy_menu` VALUES ('298', '确认到账', '291', '100', 'Finance/myczQueren', '1', '', '财务', '0', 'home');
INSERT INTO `cy_menu` VALUES ('299', '编辑添加', '292', '1', 'Finance/myczTypeEdit', '1', '', '财务', '0', 'home');
INSERT INTO `cy_menu` VALUES ('300', '状态修改', '292', '2', 'Finance/myczTypeStatus', '1', '', '财务', '0', 'home');
INSERT INTO `cy_menu` VALUES ('301', '上传图片', '292', '2', 'Finance/myczTypeImage', '1', '', '财务', '0', 'home');
INSERT INTO `cy_menu` VALUES ('302', '修改状态', '293', '2', 'Finance/mytxStatus', '1', '', '财务', '0', 'home');
INSERT INTO `cy_menu` VALUES ('303', '导出选中', '293', '3', 'Finance/mytxExcel', '1', '', '财务', '0', 'home');
INSERT INTO `cy_menu` VALUES ('304', '正在处理', '293', '4', 'Finance/mytxChuli', '1', '', '财务', '0', 'home');
INSERT INTO `cy_menu` VALUES ('305', '撤销提现', '293', '5', 'Finance/mytxChexiao', '1', '', '财务', '0', 'home');
INSERT INTO `cy_menu` VALUES ('306', '确认提现', '293', '6', 'Finance/mytxQueren', '1', '', '财务', '0', 'home');
INSERT INTO `cy_menu` VALUES ('307', '确认转出', '296', '6', 'Finance/myzcQueren', '1', '', '财务', '0', 'home');
INSERT INTO `cy_menu` VALUES ('309', '清理缓存', '9', '1', 'Tools/index', '0', '', '工具', '0', 'wrench');
INSERT INTO `cy_menu` VALUES ('310', '备份数据库', '9', '2', 'Tools/dataExport', '1', '', '工具', '0', 'wrench');
INSERT INTO `cy_menu` VALUES ('311', '还原数据库', '9', '2', 'Tools/dataImport', '1', '', '工具', '0', 'wrench');
INSERT INTO `cy_menu` VALUES ('312', '管理员管理', '3', '2', 'User/admin', '0', '', '用户', '0', 'user');
INSERT INTO `cy_menu` VALUES ('313', '权限列表', '3', '3', 'User/auth', '0', '', '用户', '0', 'user');
INSERT INTO `cy_menu` VALUES ('314', '编辑添加', '26', '1', 'User/edit', '1', '', '用户', '0', 'home');
INSERT INTO `cy_menu` VALUES ('315', '修改状态', '26', '1', 'User/status', '1', '', '用户', '0', 'home');
INSERT INTO `cy_menu` VALUES ('316', '编辑添加', '312', '1', 'User/adminEdit', '1', '', '用户', '0', 'home');
INSERT INTO `cy_menu` VALUES ('317', '修改状态', '312', '1', 'User/adminStatus', '1', '', '用户', '0', 'home');
INSERT INTO `cy_menu` VALUES ('318', '编辑添加', '313', '1', 'User/authEdit', '1', '', '用户', '0', 'home');
INSERT INTO `cy_menu` VALUES ('319', '修改状态', '313', '1', 'User/authStatus', '1', '', '用户', '0', 'home');
INSERT INTO `cy_menu` VALUES ('320', '重新初始化权限', '313', '1', 'User/authStart', '1', '', '用户', '0', 'home');
INSERT INTO `cy_menu` VALUES ('321', '编辑添加', '282', '1', 'User/logEdit', '1', '', '用户', '0', 'home');
INSERT INTO `cy_menu` VALUES ('322', '修改状态', '282', '1', 'User/logStatus', '1', '', '用户', '0', 'home');
INSERT INTO `cy_menu` VALUES ('323', '编辑添加', '283', '1', 'User/qianbaoEdit', '1', '', '用户', '0', 'home');
INSERT INTO `cy_menu` VALUES ('324', '修改状态', '283', '1', 'User/qianbaoStatus', '1', '', '用户', '0', 'home');
INSERT INTO `cy_menu` VALUES ('325', '编辑添加', '284', '1', 'User/bankEdit', '1', '', '用户', '0', 'home');
INSERT INTO `cy_menu` VALUES ('326', '修改状态', '284', '1', 'User/bankStatus', '1', '', '用户', '0', 'home');
INSERT INTO `cy_menu` VALUES ('327', '编辑添加', '285', '1', 'User/coinEdit', '1', '', '用户', '0', 'home');
INSERT INTO `cy_menu` VALUES ('328', '财产统计', '285', '1', 'User/coinLog', '1', '', '用户', '0', 'home');
INSERT INTO `cy_menu` VALUES ('329', '编辑添加', '286', '1', 'User/goodsEdit', '1', '', '用户', '0', 'home');
INSERT INTO `cy_menu` VALUES ('330', '修改状态', '286', '1', 'User/goodsStatus', '1', '', '用户', '0', 'home');
INSERT INTO `cy_menu` VALUES ('331', '编辑添加', '278', '1', 'Article/typeEdit', '1', '', '内容', '0', 'home');
INSERT INTO `cy_menu` VALUES ('332', '修改状态', '278', '100', 'Article/typeStatus', '1', '', '内容', '0', 'home');
INSERT INTO `cy_menu` VALUES ('333', '编辑添加', '280', '1', 'Article/linkEdit', '1', '', '内容', '0', 'home');
INSERT INTO `cy_menu` VALUES ('334', '修改状态', '280', '100', 'Article/linkStatus', '1', '', '内容', '0', 'home');
INSERT INTO `cy_menu` VALUES ('335', '编辑添加', '279', '1', 'Article/adverEdit', '1', '', '内容', '0', 'home');
INSERT INTO `cy_menu` VALUES ('336', '修改状态', '279', '100', 'Article/adverStatus', '1', '', '内容', '0', 'home');
INSERT INTO `cy_menu` VALUES ('337', '上传图片', '279', '100', 'Article/adverImage', '1', '', '内容', '0', 'home');
INSERT INTO `cy_menu` VALUES ('375', '客服代码', '10', '5', 'Cloud/kefu', '1', '', '扩展', '0', 'tasks');
INSERT INTO `cy_menu` VALUES ('376', '使用', '375', '5', 'Cloud/kefuUp', '0', '', '扩展', '0', 'tasks');
INSERT INTO `cy_menu` VALUES ('377', '访问授权', '313', '1', 'User/authAccess', '1', '', '用户', '0', 'home');
INSERT INTO `cy_menu` VALUES ('378', '访问授权修改', '313', '1', 'User/authAccessUp', '1', '', '用户', '0', 'home');
INSERT INTO `cy_menu` VALUES ('379', '成员授权', '313', '1', 'User/authUser', '1', '', '用户', '0', 'home');
INSERT INTO `cy_menu` VALUES ('380', '成员授权增加', '313', '1', 'User/authUserAdd', '1', '', '用户', '0', 'home');
INSERT INTO `cy_menu` VALUES ('381', '成员授权解除', '313', '1', 'User/authUserRemove', '1', '', '用户', '0', 'home');
INSERT INTO `cy_menu` VALUES ('382', '币种配置', '7', '4', 'Config/coin', '0', '', '设置', '0', 'cog');
INSERT INTO `cy_menu` VALUES ('383', '推广奖励', '8', '1', 'Operate/index', '0', '', '运营', '0', 'share');
INSERT INTO `cy_menu` VALUES ('384', 'APP配置', '8', '1', 'App/config', '0', '', 'APP管理', '0', 'time');
INSERT INTO `cy_menu` VALUES ('385', 'APP等级', '8', '2', 'App/vip_config_list', '0', '', 'APP管理', '0', 'time');
INSERT INTO `cy_menu` VALUES ('386', 'APP广告板块', '8', '3', 'App/adsblock_list', '0', '', 'APP管理', '0', 'time');
INSERT INTO `cy_menu` VALUES ('387', 'APP广告用户', '8', '4', 'App/ads_user', '0', '', 'APP管理', '0', 'time');
INSERT INTO `cy_menu` VALUES ('388', '导航配置', '7', '7', 'Config/daohang', '1', '', '设置', '0', 'cog');
INSERT INTO `cy_menu` VALUES ('418', '主题模板', '10', '4', 'Cloud/theme', '0', '', '扩展', '0', 'tasks');
INSERT INTO `cy_menu` VALUES ('425', '商品管理', '6', '1', 'Shop/index', '0', '', '商城管理', '0', 'globe');
INSERT INTO `cy_menu` VALUES ('426', '商城配置', '6', '2', 'Shop/config', '0', '', '商城管理', '0', 'globe');
INSERT INTO `cy_menu` VALUES ('427', '商品类型', '6', '3', 'Shop/type', '0', '', '商城管理', '0', 'globe');
INSERT INTO `cy_menu` VALUES ('428', '付款方式', '6', '4', 'Shop/coin', '0', '', '商城管理', '0', 'globe');
INSERT INTO `cy_menu` VALUES ('429', '购物记录', '6', '5', 'Shop/log', '0', '', '商城管理', '0', 'globe');
INSERT INTO `cy_menu` VALUES ('430', '收货地址', '6', '6', 'Shop/goods', '0', '', '商城管理', '0', 'globe');
INSERT INTO `cy_menu` VALUES ('433', '分红管理', '6', '3', 'Fenhong/index', '0', '', '分红管理', '0', 'globe');
INSERT INTO `cy_menu` VALUES ('434', '分红记录', '6', '5', 'Fenhong/log', '0', '', '分红管理', '0', 'globe');
INSERT INTO `cy_menu` VALUES ('435', '充值记录', '6', '1', 'Huafei/index', '0', '', '话费充值', '0', 'globe');
INSERT INTO `cy_menu` VALUES ('436', '充值配置', '6', '1', 'Huafei/config', '0', '', '话费充值', '0', 'globe');
INSERT INTO `cy_menu` VALUES ('437', '充值金额', '6', '3', 'Huafei/type', '0', '', '话费充值', '0', 'globe');
INSERT INTO `cy_menu` VALUES ('438', '付款方式', '6', '4', 'Huafei/coin', '0', '', '话费充值', '0', 'globe');
INSERT INTO `cy_menu` VALUES ('439', '投票记录', '6', '1', 'Vote/index', '0', '', '新币投票', '0', 'globe');
INSERT INTO `cy_menu` VALUES ('440', '投票类型', '6', '1', 'Vote/type', '0', '', '新币投票', '0', 'globe');
INSERT INTO `cy_menu` VALUES ('441', '理财管理', '6', '1', 'Money/index', '0', '', '理财管理', '0', 'globe');
INSERT INTO `cy_menu` VALUES ('442', '理财日志', '6', '2', 'Money/log', '0', '', '理财管理', '0', 'globe');
INSERT INTO `cy_menu` VALUES ('443', '理财明细', '6', '3', 'Money/fee', '0', '', '理财管理', '0', 'globe');
INSERT INTO `cy_menu` VALUES ('448', '认购管理', '6', '1', 'Issue/index', '0', '', '认购管理', '0', 'globe');
INSERT INTO `cy_menu` VALUES ('449', '认购记录', '6', '1', 'Issue/log', '0', '', '认购管理', '0', 'globe');
INSERT INTO `cy_menu` VALUES ('450', '在线出售广告管理', '5', '1', 'Trade/sell', '0', '', '交易', '0', 'stats');
INSERT INTO `cy_menu` VALUES ('451', '在线购买广告管理', '5', '2', 'Trade/buy', '0', '', '交易', '0', 'stats');
INSERT INTO `cy_menu` VALUES ('452', '订单管理', '5', '3', 'Trade/order', '0', '', '交易', '0', 'stats');
INSERT INTO `cy_menu` VALUES ('453', '添加地址', '7', '8', 'Config/address', '1', '', '设置', '0', 'cog');
INSERT INTO `cy_menu` VALUES ('454', '查看地址', '7', '9', 'Config/select', '1', '', '设置', '0', 'cog');

-- ----------------------------
-- Table structure for cy_message
-- ----------------------------
DROP TABLE IF EXISTS `cy_message`;
CREATE TABLE `cy_message` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL,
  `type` varchar(50) NOT NULL,
  `remark` varchar(50) NOT NULL,
  `addip` varchar(200) NOT NULL,
  `addr` varchar(50) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(10) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cy_message
-- ----------------------------

-- ----------------------------
-- Table structure for cy_message_log
-- ----------------------------
DROP TABLE IF EXISTS `cy_message_log`;
CREATE TABLE `cy_message_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL,
  `type` varchar(50) NOT NULL,
  `remark` varchar(50) NOT NULL,
  `addip` varchar(200) NOT NULL,
  `addr` varchar(50) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(10) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cy_message_log
-- ----------------------------

-- ----------------------------
-- Table structure for cy_money
-- ----------------------------
DROP TABLE IF EXISTS `cy_money`;
CREATE TABLE `cy_money` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `coinname` varchar(50) NOT NULL,
  `num` bigint(20) unsigned NOT NULL DEFAULT '0',
  `deal` int(11) unsigned NOT NULL DEFAULT '0',
  `tian` int(11) unsigned NOT NULL,
  `fee` int(11) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='投资理财表';

-- ----------------------------
-- Records of cy_money
-- ----------------------------

-- ----------------------------
-- Table structure for cy_money_fee
-- ----------------------------
DROP TABLE IF EXISTS `cy_money_fee`;
CREATE TABLE `cy_money_fee` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) unsigned NOT NULL,
  `money_id` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `num` int(6) NOT NULL,
  `content` varchar(255) NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cy_money_fee
-- ----------------------------

-- ----------------------------
-- Table structure for cy_money_log
-- ----------------------------
DROP TABLE IF EXISTS `cy_money_log`;
CREATE TABLE `cy_money_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `coinname` varchar(50) NOT NULL,
  `num` int(11) unsigned NOT NULL,
  `fee` decimal(20,8) unsigned NOT NULL,
  `feea` decimal(20,8) unsigned NOT NULL,
  `tian` int(11) unsigned NOT NULL,
  `tiana` int(11) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` int(4) NOT NULL,
  `money_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='理财记录表';

-- ----------------------------
-- Records of cy_money_log
-- ----------------------------

-- ----------------------------
-- Table structure for cy_mycz
-- ----------------------------
DROP TABLE IF EXISTS `cy_mycz`;
CREATE TABLE `cy_mycz` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) unsigned NOT NULL,
  `num` int(11) unsigned NOT NULL,
  `mum` int(11) unsigned NOT NULL,
  `type` varchar(50) NOT NULL,
  `tradeno` varchar(50) NOT NULL,
  `remark` varchar(250) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COMMENT='充值记录表';

-- ----------------------------
-- Records of cy_mycz
-- ----------------------------
INSERT INTO `cy_mycz` VALUES ('21', '1', '1', '1', 'weixin', 'HK152985', '', '0', '1486352856', '1486352889', '2');
INSERT INTO `cy_mycz` VALUES ('22', '1', '1', '1', 'alipay', 'JK617581', '', '0', '1486353431', '1486353716', '2');
INSERT INTO `cy_mycz` VALUES ('23', '1', '9999', '9999', 'weixin', 'CH437483', '', '0', '1486354243', '1486354258', '2');
INSERT INTO `cy_mycz` VALUES ('24', '2', '1000', '1000', 'alipay', 'HP149122', '', '0', '1486357829', '1486357838', '2');
INSERT INTO `cy_mycz` VALUES ('25', '4', '10', '10', 'alipay', 'EM771575', '', '0', '1486382653', '1486382685', '2');
INSERT INTO `cy_mycz` VALUES ('26', '5', '10', '10', 'weixin', 'UX539438', '', '0', '1486384242', '1486384410', '2');
INSERT INTO `cy_mycz` VALUES ('28', '13', '10', '10', 'alipay', 'HS653491', '', '0', '1486537998', '1486538649', '2');
INSERT INTO `cy_mycz` VALUES ('31', '17', '10', '10', 'weixin', 'TR173789', '', '0', '1486571137', '1486571458', '2');
INSERT INTO `cy_mycz` VALUES ('32', '1', '1', '1', 'weixin', 'VU341688', '', '0', '1486571255', '1486571438', '2');
INSERT INTO `cy_mycz` VALUES ('41', '19', '5', '5', 'weixin', 'PD337983', '', '0', '1486725182', '1486725411', '2');
INSERT INTO `cy_mycz` VALUES ('42', '24', '1', '1', 'weixin', 'SZ723931', '', '0', '1486727957', '1486728166', '2');
INSERT INTO `cy_mycz` VALUES ('43', '19', '2', '2', 'weixin', 'EA354576', '', '0', '1486728028', '1486728109', '2');
INSERT INTO `cy_mycz` VALUES ('44', '24', '1', '1', 'alipay', 'FN487386', '', '0', '1486735852', '1486744501', '2');
INSERT INTO `cy_mycz` VALUES ('45', '23', '1', '0', 'weixin', 'UY475673', '', '0', '1487925315', '0', '0');
INSERT INTO `cy_mycz` VALUES ('46', '23', '1', '0', 'alipay', 'NY621258', '', '0', '1487925492', '0', '0');
INSERT INTO `cy_mycz` VALUES ('47', '34', '100', '0', 'alipay', 'JC784321', '', '0', '1489824737', '0', '0');
INSERT INTO `cy_mycz` VALUES ('48', '35', '12222', '12222', 'alipay', 'GB262163', '', '0', '1492011443', '1492011485', '2');
INSERT INTO `cy_mycz` VALUES ('49', '35', '12222', '12222', 'alipay', 'HR877555', '', '0', '1492011464', '1492011483', '2');

-- ----------------------------
-- Table structure for cy_mycz_invit
-- ----------------------------
DROP TABLE IF EXISTS `cy_mycz_invit`;
CREATE TABLE `cy_mycz_invit` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL COMMENT '用户id',
  `invitid` int(11) unsigned NOT NULL COMMENT '推荐人id',
  `num` decimal(20,2) unsigned NOT NULL COMMENT '操作金额',
  `fee` decimal(20,8) unsigned NOT NULL COMMENT '赠送金额',
  `coinname` varchar(50) NOT NULL COMMENT '赠送币种',
  `mum` decimal(20,8) unsigned NOT NULL COMMENT '到账金额',
  `remark` varchar(250) NOT NULL COMMENT '备注',
  `sort` int(11) unsigned NOT NULL COMMENT '排序',
  `addtime` int(11) unsigned NOT NULL COMMENT '添加时间',
  `endtime` int(11) unsigned NOT NULL COMMENT '编辑时间',
  `status` tinyint(4) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='充值赠送';

-- ----------------------------
-- Records of cy_mycz_invit
-- ----------------------------

-- ----------------------------
-- Table structure for cy_mycz_type
-- ----------------------------
DROP TABLE IF EXISTS `cy_mycz_type`;
CREATE TABLE `cy_mycz_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `max` varchar(200) NOT NULL COMMENT '名称',
  `min` varchar(200) NOT NULL COMMENT '名称',
  `kaihu` varchar(200) NOT NULL COMMENT '名称',
  `truename` varchar(200) NOT NULL COMMENT '名称',
  `name` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `url` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `img` varchar(50) NOT NULL,
  `extra` varchar(50) NOT NULL,
  `remark` varchar(50) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='充值类型';

-- ----------------------------
-- Records of cy_mycz_type
-- ----------------------------
INSERT INTO `cy_mycz_type` VALUES ('1', '100000', '1', '', '', 'alipay', '支付宝转账支付', '', '', '', '5897f35795371.jpg', '', '需要在联系方式里面设置支付宝账号', '0', '0', '0', '1');
INSERT INTO `cy_mycz_type` VALUES ('2', '10000', '1', '', '', 'weixin', '微信转账支付', '', '', '', '5897f2d5b1fe0.jpg', '', '需要在联系方式里面设置微信账号', '0', '0', '0', '1');
INSERT INTO `cy_mycz_type` VALUES ('3', '10000', '100', '', '', 'bank', '网银转账支付', '', '', '', '57de3a186ea05.jpg', '', '需要在联系方式里面按照格式天数收款银行账号', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for cy_mytx
-- ----------------------------
DROP TABLE IF EXISTS `cy_mytx`;
CREATE TABLE `cy_mytx` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) unsigned NOT NULL,
  `num` int(11) unsigned NOT NULL,
  `fee` decimal(20,2) unsigned NOT NULL,
  `mum` decimal(20,2) unsigned NOT NULL,
  `truename` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  `bank` varchar(250) NOT NULL,
  `bankprov` varchar(50) NOT NULL,
  `bankcity` varchar(50) NOT NULL,
  `bankaddr` varchar(50) NOT NULL,
  `bankcard` varchar(200) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='提现记录表';

-- ----------------------------
-- Records of cy_mytx
-- ----------------------------
INSERT INTO `cy_mytx` VALUES ('1', '1', '100', '2.33', '97.67', '谷嘉伟', 'test', '农业银行', '测试', '测试', 'test', '13736491494', '0', '1486358183', '0', '1');

-- ----------------------------
-- Table structure for cy_myzc
-- ----------------------------
DROP TABLE IF EXISTS `cy_myzc`;
CREATE TABLE `cy_myzc` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) unsigned NOT NULL,
  `username` varchar(200) NOT NULL,
  `coinname` varchar(200) NOT NULL,
  `txid` varchar(200) NOT NULL,
  `num` decimal(20,8) unsigned NOT NULL,
  `fee` decimal(20,8) unsigned NOT NULL,
  `mum` decimal(20,8) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` int(4) NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `status` (`status`),
  KEY `coinname` (`coinname`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cy_myzc
-- ----------------------------
INSERT INTO `cy_myzc` VALUES ('3', '2', '188PNpy3AoHiomioVgX5Cbk6USYTUGNvY1', 'btc', '2a9e02ee345b92a938ea3dfadcb63389', '1.00000000', '0.00000000', '1.00000000', '0', '1510831892', '0', '1', null);
INSERT INTO `cy_myzc` VALUES ('4', '7', '19cZBV79dxZEfd6tiZso2RwxAZvR23YrLr', 'btc', '20069759b05736e882b22eede403e197', '0.50000000', '0.00000000', '0.50000000', '0', '1513164494', '0', '1', '');
INSERT INTO `cy_myzc` VALUES ('5', '1', '1252vYnkCo7LUVGYidYc66tB5THzgMSzRo', 'btc', 'f899a5221c263645666969cfddf38242', '0.50000000', '0.00000000', '0.50000000', '0', '1513164772', '0', '1', '');
INSERT INTO `cy_myzc` VALUES ('6', '1', '19cZBV79dxZEfd6tiZso2RwxAZvR23YrLr', 'btc', '3ccd0774d9e909fecb8477d640ae8482', '0.10000000', '0.00000000', '0.10000000', '0', '1513164908', '0', '1', '');
INSERT INTO `cy_myzc` VALUES ('12', '7', '16mtxQzSNM3qeViVeFsWcnbzCnQQ3YTCy6', 'btc', '', '0.10000000', '0.00000000', '0.10000000', '0', '1513166092', '0', '1', '');
INSERT INTO `cy_myzc` VALUES ('13', '7', '16mtxQzSNM3qeViVeFsWcnbzCnQQ3YTCy6', 'btc', '', '0.10000000', '0.00001000', '0.09999000', '0', '1513166217', '0', '1', '');
INSERT INTO `cy_myzc` VALUES ('14', '1', '16mtxQzSNM3qeViVeFsWcnbzCnQQ3YTCy6', 'btc', '', '0.10000000', '0.00001000', '0.09999000', '0', '1513167231', '0', '1', '');
INSERT INTO `cy_myzc` VALUES ('15', '1', '1252vYnkCo7LUVGYidYc66tB5THzgMSzRo', 'btc', 'dc69f4bb9923115851bfe863c6dd71f7', '0.20000000', '0.00000000', '0.20000000', '0', '1513167924', '0', '1', '');
INSERT INTO `cy_myzc` VALUES ('16', '7', '16mtxQzSNM3qeViVeFsWcnbzCnQQ3YTCy6', 'btc', '', '0.19033300', '0.00001903', '0.19031397', '0', '1513167959', '0', '1', '');
INSERT INTO `cy_myzc` VALUES ('17', '6', '114NtiSqubRJ68twYVpP3KhBJF2GFN5uty', 'btc', '', '1.00000000', '0.00010000', '0.99990000', '0', '1513230003', '0', '1', '');
INSERT INTO `cy_myzc` VALUES ('18', '1', 'LQL9pVH1LsMfKwt82Y2wGhNGkrjF8vwUst', 'btc', '', '1.00000000', '0.00000000', '1.00000000', '0', '1514527566', '0', '0', '');
INSERT INTO `cy_myzc` VALUES ('19', '1', 'LQL9pVH1LsMfKwt82Y2wGhNGkrjF8vwUst', 'ltc', '', '1.00000000', '0.00000000', '1.00000000', '0', '1514527905', '0', '0', '');
INSERT INTO `cy_myzc` VALUES ('20', '17', '19thxBCjmXCMLEmiNnD8zSLCjWPDxeQWse', 'btc', '3ea9e59a68c5210bdab5329dd1b4b15c', '1.00000000', '0.00000000', '1.00000000', '0', '1516868299', '0', '1', '');
INSERT INTO `cy_myzc` VALUES ('21', '16', '0x1111111111111', 'wkc', '', '10.00000000', '0.00000000', '10.00000000', '0', '1520241823', '0', '0', 'testest');
INSERT INTO `cy_myzc` VALUES ('44', '20', '0xcb03471edbfab17233f05095d36e24012f1ad98e', 'wkc', '8c1023eca13003fb0250ee83e89cd919', '10.00000000', '0.00000000', '10.00000000', '0', '1522964156', '0', '1', '测试');
INSERT INTO `cy_myzc` VALUES ('45', '20', '0xcb03471edbfab17233f05095d36e24012f1ad98e', 'wkc', '30bbf882c475497018adfadb0f979ccb', '50.00000000', '0.00000000', '50.00000000', '0', '1523673823', '0', '1', '123');

-- ----------------------------
-- Table structure for cy_myzc_fee
-- ----------------------------
DROP TABLE IF EXISTS `cy_myzc_fee`;
CREATE TABLE `cy_myzc_fee` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) unsigned NOT NULL,
  `username` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `coinname` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `txid` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `fee` decimal(20,8) NOT NULL,
  `num` decimal(20,8) unsigned NOT NULL,
  `mum` decimal(20,8) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of cy_myzc_fee
-- ----------------------------
INSERT INTO `cy_myzc_fee` VALUES ('1', '102', '', 'fc', 'd86a16e040aab3f381891b747060ac58', '1', '12330.00000000', '1000000.00000000', '987670.00000000', '0', '1486816088', '0', '1');
INSERT INTO `cy_myzc_fee` VALUES ('2', '0', '19thxBCjmXCMLEmiNnD8zSLCjWPDxeQWse', 'btc', '', '2', '0.00001000', '0.10000000', '0.09999000', '0', '1513166217', '0', '1');
INSERT INTO `cy_myzc_fee` VALUES ('3', '0', '19thxBCjmXCMLEmiNnD8zSLCjWPDxeQWse', 'btc', '', '2', '0.00001000', '0.10000000', '0.09999000', '0', '1513167231', '0', '1');
INSERT INTO `cy_myzc_fee` VALUES ('4', '0', '19thxBCjmXCMLEmiNnD8zSLCjWPDxeQWse', 'btc', '', '2', '0.00001903', '0.19033300', '0.19031397', '0', '1513167959', '0', '1');
INSERT INTO `cy_myzc_fee` VALUES ('5', '0', '19thxBCjmXCMLEmiNnD8zSLCjWPDxeQWse', 'btc', '', '2', '0.00010000', '1.00000000', '0.99990000', '0', '1513230003', '0', '1');
INSERT INTO `cy_myzc_fee` VALUES ('28', '0', '0x', 'wkc', '8c1023eca13003fb0250ee83e89cd919', '2', '0.00000000', '10.00000000', '10.00000000', '0', '1522964156', '0', '1');
INSERT INTO `cy_myzc_fee` VALUES ('29', '0', '0x', 'wkc', '30bbf882c475497018adfadb0f979ccb', '2', '0.00000000', '50.00000000', '50.00000000', '0', '1523673823', '0', '1');

-- ----------------------------
-- Table structure for cy_myzr
-- ----------------------------
DROP TABLE IF EXISTS `cy_myzr`;
CREATE TABLE `cy_myzr` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) unsigned NOT NULL,
  `username` varchar(200) NOT NULL,
  `coinname` varchar(200) NOT NULL,
  `txid` varchar(200) NOT NULL,
  `num` decimal(20,8) unsigned NOT NULL,
  `mum` decimal(20,8) unsigned NOT NULL,
  `fee` decimal(20,8) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` int(4) NOT NULL,
  `out_order` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `userid` (`userid`),
  KEY `coinname` (`coinname`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cy_myzr
-- ----------------------------
INSERT INTO `cy_myzr` VALUES ('54', '3', '1GdNJgSsBv1nUHjSgjykiy3aDTva3zQSzK', 'btc', '6afd4fea35e2efcc8731ad1861d69027', '1.00000000', '1.00000000', '0.00000000', '0', '1510831892', '0', '1', null);
INSERT INTO `cy_myzr` VALUES ('55', '3', '188PNpy3AoHiomioVgX5Cbk6USYTUGNvY1', 'btc', '6b0d5c0baf399743d39cb9d5ebb7d851', '1.00000000', '1.00000000', '0.00000000', '0', '1512030995', '0', '1', null);
INSERT INTO `cy_myzr` VALUES ('67', '7', '15urYnyeJe3gwbGJ74wcX89Tz7ZtsFDVew', 'btc', '15urYnyeJe3gwbGJ74wcX89Tz7ZtsFDVew', '1.00050000', '1.00050000', '0.00000000', '0', '1513155639', '0', '1', null);
INSERT INTO `cy_myzr` VALUES ('68', '1', '1252vYnkCo7LUVGYidYc66tB5THzgMSzRo', 'btc', 'd13853f8e6c3ea02dbebfa5120396031', '0.50000000', '0.50000000', '0.00000000', '0', '1513164494', '0', '1', null);
INSERT INTO `cy_myzr` VALUES ('69', '7', '19cZBV79dxZEfd6tiZso2RwxAZvR23YrLr', 'btc', '727619a20d315490c9e8e45b0310af5f', '0.50000000', '0.50000000', '0.00000000', '0', '1513164772', '0', '1', null);
INSERT INTO `cy_myzr` VALUES ('70', '1', '19cZBV79dxZEfd6tiZso2RwxAZvR23YrLr', 'btc', '3ccd0774d9e909fecb8477d640ae8482', '0.10000000', '0.10000000', '0.00000000', '0', '1513164908', '0', '1', null);
INSERT INTO `cy_myzr` VALUES ('71', '7', '19cZBV79dxZEfd6tiZso2RwxAZvR23YrLr', 'btc', 'f26eefcee0ac33105299c00fcf7644db', '0.20000000', '0.20000000', '0.00000000', '0', '1513167924', '0', '1', null);
INSERT INTO `cy_myzr` VALUES ('72', '6', '1Ccb4vrC5atJHHdj3hHhYwJmYxtVZLZXWc', 'btc', '1Ccb4vrC5atJHHdj3hHhYwJmYxtVZLZXWc', '161.63956544', '161.63956544', '0.00000000', '0', '1513224279', '0', '1', null);
INSERT INTO `cy_myzr` VALUES ('81', '1', '0x006487deb7960ad8a5e58d5563d704aa96511486', 'eth', '0x006487deb7960ad8a5e58d5563d704aa96511486', '0.27080277', '0.27080277', '0.00000000', '0', '1514520435', '0', '1', null);
INSERT INTO `cy_myzr` VALUES ('82', '1', '1FVKW4rp5rN23dqFVk2tYGY4niAXMB8eZC', 'btc', '1FVKW4rp5rN23dqFVk2tYGY4niAXMB8eZC', '32.25301112', '32.25301112', '0.00000000', '0', '1514520875', '0', '1', null);
INSERT INTO `cy_myzr` VALUES ('83', '1', 'LWMNHuwiLJyUQoZkEaQM82HQXcmefdW7nk', 'ltc', 'LWMNHuwiLJyUQoZkEaQM82HQXcmefdW7nk', '3.99000000', '3.99000000', '0.00000000', '0', '1514537717', '0', '1', null);
INSERT INTO `cy_myzr` VALUES ('84', '0', '163goPzSjzBN3oAW8aEjJWNAsM9Mme5Pn9', 'btc', '74c824b6ce123b57e4794b6643aa01f3', '1.00000000', '1.00000000', '0.00000000', '0', '1516868299', '0', '1', null);
INSERT INTO `cy_myzr` VALUES ('85', '16', 'river', 'wkc', '0x7332bc93ccf3b7afd89b1757906cb59c157661b1', '5.00000000', '5.00000000', '0.00000000', '0', '1520945655', '0', '1', '20180313205414wx48bjzu8jsyavfw');
INSERT INTO `cy_myzr` VALUES ('86', '16', 'river', 'wkc', '0x7332bc93ccf3b7afd89b1757906cb59c157661b1', '3.00000000', '3.00000000', '0.00000000', '0', '1521011336', '0', '1', '20180314150855ufo3bk0hipcrucuz');
INSERT INTO `cy_myzr` VALUES ('87', '20', 'mltest', 'wkc', '0x2bb3c274f1a5c47edd13e98de97020fc19ad650b', '1.02640000', '1.02640000', '0.00000000', '0', '1524140628', '0', '1', '201804192023472rcjbkvare622eb0');

-- ----------------------------
-- Table structure for cy_newad
-- ----------------------------
DROP TABLE IF EXISTS `cy_newad`;
CREATE TABLE `cy_newad` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) unsigned NOT NULL,
  `ad_type` tinyint(1) NOT NULL COMMENT '广告类型 0为出售 1为购买',
  `coin` varchar(10) NOT NULL COMMENT '币种',
  `country` varchar(20) NOT NULL COMMENT '国家',
  `currency` varchar(20) NOT NULL COMMENT '货币',
  `price` decimal(20,2) NOT NULL,
  `min_amount` varchar(10) NOT NULL COMMENT '最小限额',
  `max_amount` varchar(10) NOT NULL COMMENT '最大限额',
  `paytime` varchar(3) DEFAULT NULL COMMENT '付款期限',
  `provider` varchar(50) NOT NULL COMMENT '收款方式',
  `message` varchar(255) NOT NULL COMMENT '广告留言',
  `status` tinyint(1) unsigned NOT NULL COMMENT '是否上架 0为下架 1为上架',
  `addtime` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cy_newad
-- ----------------------------
INSERT INTO `cy_newad` VALUES ('1', '1', '0', 'btc', 'CN', 'CNY', '53532.70', '50', '20000', null, '2', '测试测试', '1', '1510975428');
INSERT INTO `cy_newad` VALUES ('2', '1', '1', 'btc', 'CN', 'CNY', '37208.00', '50', '6000', '20', '3', '测试2', '1', '1510975428');
INSERT INTO `cy_newad` VALUES ('3', '1', '1', 'btc', 'CN', 'CNY', '54000.00', '500', '50000', '50', '3', '1213', '1', '1510975428');
INSERT INTO `cy_newad` VALUES ('4', '1', '0', 'btc', 'cn', 'cny', '10.11', '50', '51', null, '3', 'qweqwe', '0', '1510975428');
INSERT INTO `cy_newad` VALUES ('5', '4', '0', 'btc', 'cn', 'cny', '2000.00', '50', '2000', null, '1', '111', '1', '1511422678');
INSERT INTO `cy_newad` VALUES ('6', '4', '0', 'btc', 'cn', 'cny', '36589.00', '100', '3000', null, '1', '小同桌死变态', '1', '1511425679');
INSERT INTO `cy_newad` VALUES ('7', '4', '0', 'btc', 'cn', 'cny', '25987.11', '100', '3000', null, '2', '小同桌死变态', '1', '1511425698');
INSERT INTO `cy_newad` VALUES ('8', '4', '0', 'btc', 'cn', 'cny', '6528.00', '100', '3000', null, '1', '小同桌死变态', '1', '1511425708');
INSERT INTO `cy_newad` VALUES ('9', '4', '1', 'btc', 'cn', 'cny', '2485.00', '100', '5000', '50', '1', '小同桌死变态', '1', '1511425901');
INSERT INTO `cy_newad` VALUES ('10', '4', '1', 'btc', 'cn', 'cny', '2000.00', '100', '5000', '51', '2', '同桌死变态1', '1', '1511425913');
INSERT INTO `cy_newad` VALUES ('11', '4', '1', 'btc', 'cn', 'cny', '4263.00', '100', '5000', '50', '1', '小同桌死变态', '1', '1511425920');
INSERT INTO `cy_newad` VALUES ('12', '4', '1', 'btc', 'cn', 'cny', '75203.00', '100', '5000', '50', '1', '小同桌死变态', '1', '1511425928');
INSERT INTO `cy_newad` VALUES ('13', '1', '0', 'ltc', 'cn', 'cny', '2000.00', '50', '10000', null, '1', '111', '1', '1513927346');
INSERT INTO `cy_newad` VALUES ('14', '13', '0', 'ltc', 'cn', 'cny', '5.00', '50', '50', null, '1', '101', '1', '1514012771');
INSERT INTO `cy_newad` VALUES ('15', '1', '0', 'ltc', 'cn', 'cny', '5000.00', '50', '1000', null, '1', '1', '1', '1514467043');
INSERT INTO `cy_newad` VALUES ('16', '1', '1', 'ltc', 'cn', 'cny', '10000.00', '50', '10000', '11', '1', '11', '1', '1514468222');
INSERT INTO `cy_newad` VALUES ('17', '15', '1', 'eth', 'cn', 'cny', '5000.00', '5000', '50000', '10', '1', 'fdsgsgsfd', '1', '1515998741');
INSERT INTO `cy_newad` VALUES ('18', '17', '0', 'btc', 'cn', 'cny', '50000.00', '500', '50000', null, '3', '快来买', '1', '1516786097');
INSERT INTO `cy_newad` VALUES ('19', '17', '0', 'btc', 'cn', 'cny', '5000.00', '500', '5000', null, '3', 'gogo', '1', '1516792547');
INSERT INTO `cy_newad` VALUES ('20', '17', '0', 'btc', 'cn', 'cny', '5000.00', '50', '5000', null, '1', 'test', '1', '1516793449');
INSERT INTO `cy_newad` VALUES ('21', '16', '0', 'btc', 'cn', 'cny', '5000.00', '500', '50000', null, '3', '213456', '1', '1516849911');
INSERT INTO `cy_newad` VALUES ('22', '17', '0', '9dc', 'cn', 'cny', '20.00', '50', '1000', null, '1', '9dbbb', '1', '1516871546');
INSERT INTO `cy_newad` VALUES ('23', '15', '1', '9dc', 'cn', 'cny', '0.07', '1000', '10000', '30', '1', 'ddd', '1', '1516878640');
INSERT INTO `cy_newad` VALUES ('24', '15', '0', '9dc', 'cn', 'cny', '10.00', '1000', '50000', null, '1', 'dd', '1', '1516959982');
INSERT INTO `cy_newad` VALUES ('25', '16', '0', '9dc', 'cn', 'cny', '1.00', '50', '100', null, '2', '来买9d', '1', '1516965550');
INSERT INTO `cy_newad` VALUES ('26', '16', '0', 'wkc', 'cn', 'cny', '2.00', '50', '100', null, '1', 'test', '1', '1520238169');
INSERT INTO `cy_newad` VALUES ('27', '27', '0', 'wkc', 'cn', 'cny', '1.50', '50', '500', null, '1', '支付宝是 34534534', '1', '1522987004');
INSERT INTO `cy_newad` VALUES ('28', '20', '0', 'wkc', 'cn', 'cny', '1.00', '50', '500', null, '1', '111', '1', '1522988503');
INSERT INTO `cy_newad` VALUES ('29', '20', '0', 'wkc', 'cn', 'cny', '1.55', '50', '300', null, '3', '1', '1', '1523001692');
INSERT INTO `cy_newad` VALUES ('30', '27', '0', 'wkc', 'cn', 'cny', '1.00', '50', '100', null, '3', '1', '1', '1523002699');

-- ----------------------------
-- Table structure for cy_oauth_user
-- ----------------------------
DROP TABLE IF EXISTS `cy_oauth_user`;
CREATE TABLE `cy_oauth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) unsigned NOT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `create_time` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cy_oauth_user
-- ----------------------------
INSERT INTO `cy_oauth_user` VALUES ('1', '1', 'Nf4S5l4QgCqE6tv2Vy+aLcjbuPJ/ANNnpTK+dogBKo3i2Jycun2YMkFxfuKNmgOK6oURE6/XXFACNXZ5hoUyMg==', '1513260212');
INSERT INTO `cy_oauth_user` VALUES ('2', '4', 'IXdQj4xF4xVAE+RTl8bkTsjbuPJ/ANNnpTK+dogBKo3i2Jycun2YMp+kRtE7U9VO4KocMxjofvACNXZ5hoUyMg==', '1513260271');
INSERT INTO `cy_oauth_user` VALUES ('3', '13', 'XWMjQT1UIj9i7FnwcWS2YcjbuPJ/ANNnpTK+dogBKo27KaXYYfj2XgvCdHr+lwkWGvDjq8CvlLECNXZ5hoUyMg==', '1514010868');
INSERT INTO `cy_oauth_user` VALUES ('4', '14', 'UyRapi5JBT8IM3Eona/YQlJMtd48pFWtoIiUNii6g9opdgE23PJvbPSVHQ2l7RlrwRUficmJG1gzLzO3NYD5rQ==', '1515993923');
INSERT INTO `cy_oauth_user` VALUES ('5', '15', 'ednbINsI3zc5Z82a3zwDu5fgt32JHJZEab9vzn9K+il/VH/zZ5xMPZcQkA7hUSA4sxJwoGd6lJs=', '1515996482');
INSERT INTO `cy_oauth_user` VALUES ('6', '16', 'Oc1rHBk2X3/0D85JgkkWEJfgt32JHJZEab9vzn9K+inJD2yDAgQjud98r3C70U85EDkVpfDtaV8=', '1516783808');
INSERT INTO `cy_oauth_user` VALUES ('7', '17', 'sM4KNqeU3r7qAPTsypyVQ5fgt32JHJZEab9vzn9K+inJD2yDAgQjuY3+RPqJFoA6TviiyMryCvA=', '1516785532');
INSERT INTO `cy_oauth_user` VALUES ('8', '18', 'Cm9jX+6e7juLi1+1GoH3HlJMtd48pFWtoIiUNii6g9opdgE23PJvbBjLuIp+5FRfMKDsWU4B/kYzLzO3NYD5rQ==', '1516849810');
INSERT INTO `cy_oauth_user` VALUES ('9', '19', 'IWIK4Si0HLYO9AB8P5RjCpfgt32JHJZEab9vzn9K+imDDYSPCXbhK7uEAG+3BjoDxSwctxULIxo=', '1516882353');
INSERT INTO `cy_oauth_user` VALUES ('10', '20', 'GRSNAjxQgWEhTmxgD+h1HsjbuPJ/ANNnpTK+dogBKo1K2qlQDT4TZmBUL2V6y006cLO1wi/PpJgCNXZ5hoUyMg==', '1522745982');
INSERT INTO `cy_oauth_user` VALUES ('11', '27', 'rnDXp1LoeCT/LCS4yidNZcjbuPJ/ANNnpTK+dogBKo0ej9gH7tXrsc6SDxrc8rL/GTel6MduadwCNXZ5hoUyMg==', '1522986470');

-- ----------------------------
-- Table structure for cy_order
-- ----------------------------
DROP TABLE IF EXISTS `cy_order`;
CREATE TABLE `cy_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `buyid` int(11) unsigned NOT NULL,
  `sellid` int(11) NOT NULL,
  `coin` varchar(20) NOT NULL,
  `price` decimal(20,8) NOT NULL,
  `num` decimal(20,8) unsigned NOT NULL,
  `fee` decimal(20,8) NOT NULL COMMENT '手续费',
  `amount` decimal(20,8) NOT NULL,
  `mum` varchar(20) NOT NULL,
  `delaytime` varchar(3) NOT NULL COMMENT '付款期限',
  `type` tinyint(2) NOT NULL COMMENT '0为购买   1为出售',
  `fkfs` tinyint(2) unsigned NOT NULL COMMENT '付款方式',
  `addtime` int(11) NOT NULL,
  `endtime` int(11) NOT NULL,
  `status` tinyint(2) NOT NULL COMMENT '0:已拍下    1:已付款  2:评价状态 3:已结束  4:已取消交易  5:已申述  6:已过期 ',
  `ssqzt` tinyint(2) DEFAULT NULL COMMENT '申诉前状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cy_order
-- ----------------------------
INSERT INTO `cy_order` VALUES ('1', '2', '1', 'btc', '53532.70000000', '0.00093401', '0.00000654', '50.00000000', '50.000077127', '30', '0', '2', '1511315749', '0', '4', null);
INSERT INTO `cy_order` VALUES ('2', '2', '1', 'btc', '53532.70000000', '0.00093401', '0.00000654', '50.00000000', '50.000077127', '30', '0', '2', '1511329342', '1511341773', '3', null);
INSERT INTO `cy_order` VALUES ('3', '2', '1', 'btc', '53532.70000000', '0.00093401', '0.00000654', '50.00000000', '50.000077127', '30', '0', '2', '1511344273', '0', '6', null);
INSERT INTO `cy_order` VALUES ('7', '1', '2', 'btc', '37208.00000000', '0.00134380', '0.00000941', '50.00000000', '50.0001104', '20', '1', '3', '1511359110', '1511359264', '3', null);
INSERT INTO `cy_order` VALUES ('8', '1', '2', 'btc', '37208.00000000', '0.00134380', '0.00000941', '50.00000000', '50.0001104', '20', '1', '3', '1511359362', '1511359882', '3', null);
INSERT INTO `cy_order` VALUES ('9', '1', '2', 'btc', '37208.00000000', '0.00134380', '0.00000941', '50.00000000', '50.0001104', '20', '1', '3', '1511360323', '1511360404', '3', null);
INSERT INTO `cy_order` VALUES ('10', '1', '2', 'btc', '37208.00000000', '0.00134380', '0.00000941', '50.00000000', '50.0001104', '20', '1', '3', '1511360430', '1511360559', '3', null);
INSERT INTO `cy_order` VALUES ('11', '1', '2', 'btc', '37208.00000000', '0.00134380', '0.00000941', '50.00000000', '50.0001104', '20', '1', '3', '1511360604', '1511360915', '3', null);
INSERT INTO `cy_order` VALUES ('12', '1', '2', 'btc', '37208.00000000', '0.00134380', '0.00000941', '50.00000000', '50.0001104', '20', '1', '3', '1511399024', '1511399637', '3', null);
INSERT INTO `cy_order` VALUES ('13', '1', '2', 'btc', '37208.00000000', '0.00134380', '0.00000941', '50.00000000', '50.0001104', '20', '1', '3', '1511399846', '1511399873', '3', null);
INSERT INTO `cy_order` VALUES ('14', '2', '1', 'btc', '53532.70000000', '0.00093401', '0.00000654', '50.00000000', '50.000077127', '30', '0', '2', '1511399905', '1511399941', '3', null);
INSERT INTO `cy_order` VALUES ('15', '2', '1', 'btc', '53532.70000000', '0.00093401', '0.00000654', '50.00000000', '50.000077127', '30', '0', '2', '1511400169', '1511400191', '3', null);
INSERT INTO `cy_order` VALUES ('16', '1', '2', 'btc', '37208.00000000', '0.00134380', '0.00000941', '50.00000000', '50.0001104', '20', '1', '3', '1511400204', '1511400301', '3', null);
INSERT INTO `cy_order` VALUES ('17', '1', '2', 'btc', '37208.00000000', '0.00134380', '0.00000941', '50.00000000', '50.0001104', '20', '1', '3', '1511400444', '1511400500', '3', null);
INSERT INTO `cy_order` VALUES ('18', '2', '1', 'btc', '53532.70000000', '0.00093401', '0.00000654', '50.00000000', '50.000077127', '30', '0', '2', '1511400538', '1511400695', '3', null);
INSERT INTO `cy_order` VALUES ('19', '1', '2', 'btc', '37208.00000000', '0.00134380', '0.00000941', '50.00000000', '50.0001104', '20', '1', '3', '1511401591', '0', '4', null);
INSERT INTO `cy_order` VALUES ('20', '2', '1', 'btc', '53532.70000000', '0.00093401', '0.00000654', '50.00000000', '50.000077127', '30', '0', '2', '1511401660', '0', '4', null);
INSERT INTO `cy_order` VALUES ('21', '1', '2', 'btc', '37208.00000000', '0.00134380', '0.00000941', '50.00000000', '50.0001104', '20', '1', '3', '1511401752', '0', '4', null);
INSERT INTO `cy_order` VALUES ('22', '1', '2', 'btc', '37208.00000000', '0.00134380', '0.00000941', '50.00000000', '50.0001104', '20', '1', '3', '1511402138', '0', '4', null);
INSERT INTO `cy_order` VALUES ('23', '1', '2', 'btc', '37208.00000000', '0.00134380', '0.00000941', '50.00000000', '50.0001104', '20', '1', '3', '1512035229', '1512035299', '4', null);
INSERT INTO `cy_order` VALUES ('24', '4', '1', 'btc', '53532.70000000', '0.20000000', '0.00140000', '10706.54000000', '10706.54', '30', '0', '2', '1511423939', '0', '4', null);
INSERT INTO `cy_order` VALUES ('25', '4', '1', 'btc', '53532.70000000', '0.20000000', '0.00140000', '10706.54000000', '10706.54', '30', '0', '2', '1511424143', '1511424188', '3', null);
INSERT INTO `cy_order` VALUES ('26', '1', '4', 'btc', '37208.00000000', '0.15000000', '0.00105000', '5581.20000000', '5581.2', '20', '1', '3', '1511424609', '1511424642', '3', null);
INSERT INTO `cy_order` VALUES ('27', '1', '4', 'btc', '36589.00000000', '0.00273306', '0.00001913', '100.00000000', '99.99993234', '30', '0', '1', '1511487455', '0', '4', null);
INSERT INTO `cy_order` VALUES ('28', '1', '4', 'btc', '6528.00000000', '0.01531863', '0.00010723', '100.00000000', '100.00001664', '30', '0', '1', '1511487757', '1511487759', '4', null);
INSERT INTO `cy_order` VALUES ('29', '1', '4', 'btc', '36589.00000000', '0.02733062', '0.00019131', '1000.00000000', '1000.00005518', '30', '0', '1', '1511489404', '1511576122', '6', null);
INSERT INTO `cy_order` VALUES ('133', '20', '27', 'wkc', '1.50000000', '33.33333333', '0.23333333', '50.00000000', '49.999999995', '30', '0', '1', '1523599553', '1523602447', '4', null);
INSERT INTO `cy_order` VALUES ('134', '20', '27', 'wkc', '1.50000000', '33.33333333', '0.23333333', '50.00000000', '49.999999995', '30', '0', '1', '1523602458', '0', '6', null);
INSERT INTO `cy_order` VALUES ('135', '20', '27', 'wkc', '1.50000000', '100.00000000', '0.70000000', '150.00000000', '150', '2', '0', '1', '1523605066', '1523605191', '6', null);
INSERT INTO `cy_order` VALUES ('136', '20', '27', 'wkc', '1.50000000', '100.00000000', '0.70000000', '150.00000000', '150', '2', '0', '1', '1523605363', '1523605484', '6', null);
INSERT INTO `cy_order` VALUES ('137', '27', '20', 'wkc', '1.55000000', '64.51612903', '0.45161290', '100.00000000', '99.9999999965', '30', '0', '3', '1523975819', '0', '5', '0');
INSERT INTO `cy_order` VALUES ('138', '20', '27', 'wkc', '1.50000000', '66.66666667', '0.46666667', '100.00000000', '100.000000005', '30', '0', '1', '1523989121', '0', '5', null);
INSERT INTO `cy_order` VALUES ('139', '20', '27', 'wkc', '1.50000000', '66.66666667', '0.46666667', '100.00000000', '100.000000005', '30', '0', '1', '1524147138', '0', '0', null);

-- ----------------------------
-- Table structure for cy_orderlog
-- ----------------------------
DROP TABLE IF EXISTS `cy_orderlog`;
CREATE TABLE `cy_orderlog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) unsigned NOT NULL,
  `traders` int(11) NOT NULL COMMENT '交易伙伴',
  `coin_type` char(20) NOT NULL COMMENT '币种',
  `order_type` tinyint(1) unsigned NOT NULL COMMENT '0买入  1售出',
  `price` decimal(20,8) NOT NULL COMMENT '单价',
  `num` decimal(20,8) NOT NULL COMMENT '数量',
  `amount` decimal(20,8) NOT NULL COMMENT '总价',
  `fee` decimal(20,8) NOT NULL COMMENT '手续费',
  `addtime` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cy_orderlog
-- ----------------------------
INSERT INTO `cy_orderlog` VALUES ('1', '2', '4', 'btc', '0', '36589.00000000', '0.00273306', '100.00000000', '0.00000000', '1512011154');
INSERT INTO `cy_orderlog` VALUES ('2', '4', '2', 'btc', '1', '36589.00000000', '0.00273306', '100.00000000', '0.00001913', '1512011154');
INSERT INTO `cy_orderlog` VALUES ('3', '4', '2', 'btc', '0', '75203.00000000', '0.00132973', '100.00000000', '0.00000931', '1512011984');
INSERT INTO `cy_orderlog` VALUES ('4', '2', '4', 'btc', '1', '75203.00000000', '0.00132973', '100.00000000', '0.00000000', '1512011984');
INSERT INTO `cy_orderlog` VALUES ('5', '2', '4', 'btc', '0', '36589.00000000', '0.00273306', '100.00000000', '0.00000000', '1512012116');
INSERT INTO `cy_orderlog` VALUES ('6', '4', '2', 'btc', '1', '36589.00000000', '0.00273306', '100.00000000', '0.00001913', '1512012116');
INSERT INTO `cy_orderlog` VALUES ('7', '4', '2', 'btc', '0', '5562.00000000', '0.01797914', '100.00000000', '0.00012585', '1512019154');
INSERT INTO `cy_orderlog` VALUES ('8', '2', '4', 'btc', '1', '5562.00000000', '0.01797914', '100.00000000', '0.00000000', '1512019154');
INSERT INTO `cy_orderlog` VALUES ('21', '6', '12', 'btc', '3', '36589.00000000', '0.00000273', '0.09999993', '0.00000000', '1512379457');
INSERT INTO `cy_orderlog` VALUES ('22', '12', '4', 'btc', '0', '36589.00000000', '0.00273306', '100.00000000', '0.00000000', '1512379457');
INSERT INTO `cy_orderlog` VALUES ('23', '4', '12', 'btc', '1', '36589.00000000', '0.00273306', '100.00000000', '0.00001913', '1512379457');
INSERT INTO `cy_orderlog` VALUES ('24', '6', '12', 'btc', '3', '75203.00000000', '0.00000200', '0.15040600', '0.00000000', '1512380230');
INSERT INTO `cy_orderlog` VALUES ('25', '4', '12', 'btc', '0', '75203.00000000', '0.00200000', '150.40600000', '0.00001400', '1512380230');
INSERT INTO `cy_orderlog` VALUES ('26', '12', '4', 'btc', '1', '75203.00000000', '0.00200000', '150.40600000', '0.00000000', '1512380230');
INSERT INTO `cy_orderlog` VALUES ('27', '6', '12', 'btc', '3', '36589.00000000', '0.00000547', '0.19999986', '0.00000000', '1512526978');
INSERT INTO `cy_orderlog` VALUES ('28', '12', '4', 'btc', '0', '36589.00000000', '0.00273306', '100.00000000', '0.00000000', '1512526978');
INSERT INTO `cy_orderlog` VALUES ('29', '4', '12', 'btc', '1', '36589.00000000', '0.00273306', '100.00000000', '0.00001913', '1512526978');
INSERT INTO `cy_orderlog` VALUES ('30', '7', '4', 'btc', '0', '36589.00000000', '0.00273306', '100.00000000', '0.00000000', '1512819819');
INSERT INTO `cy_orderlog` VALUES ('31', '4', '7', 'btc', '1', '36589.00000000', '0.00273306', '100.00000000', '0.00001913', '1512819819');
INSERT INTO `cy_orderlog` VALUES ('32', '4', '7', 'btc', '0', '75203.00000000', '0.00132973', '100.00000000', '0.00000931', '1512822005');
INSERT INTO `cy_orderlog` VALUES ('33', '7', '4', 'btc', '1', '75203.00000000', '0.00132973', '100.00000000', '0.00000000', '1512822005');
INSERT INTO `cy_orderlog` VALUES ('34', '1', '13', 'ltc', '0', '10000.00000000', '1.00000000', '10000.00000000', '0.00700000', '1514471945');
INSERT INTO `cy_orderlog` VALUES ('35', '13', '1', 'ltc', '1', '10000.00000000', '1.00000000', '10000.00000000', '0.00000000', '1514471945');
INSERT INTO `cy_orderlog` VALUES ('36', '17', '16', '9dc', '0', '1.00000000', '50.00000000', '50.00000000', '0.00000000', '1516965758');
INSERT INTO `cy_orderlog` VALUES ('37', '16', '17', '9dc', '1', '1.00000000', '50.00000000', '50.00000000', '0.35000000', '1516965758');
INSERT INTO `cy_orderlog` VALUES ('38', '20', '16', 'wkc', '0', '2.00000000', '25.00000000', '50.00000000', '0.00000000', '1522953331');
INSERT INTO `cy_orderlog` VALUES ('39', '16', '20', 'wkc', '1', '2.00000000', '25.00000000', '50.00000000', '0.17500000', '1522953331');
INSERT INTO `cy_orderlog` VALUES ('40', '27', '16', 'wkc', '0', '2.00000000', '50.00000000', '100.00000000', '0.00000000', '1522986773');
INSERT INTO `cy_orderlog` VALUES ('41', '16', '27', 'wkc', '1', '2.00000000', '50.00000000', '100.00000000', '0.35000000', '1522986773');
INSERT INTO `cy_orderlog` VALUES ('42', '27', '16', 'wkc', '0', '2.00000000', '50.00000000', '100.00000000', '0.00000000', '1522986915');
INSERT INTO `cy_orderlog` VALUES ('43', '16', '27', 'wkc', '1', '2.00000000', '50.00000000', '100.00000000', '0.35000000', '1522986915');
INSERT INTO `cy_orderlog` VALUES ('44', '20', '27', 'wkc', '0', '1.50000000', '35.00000000', '52.50000000', '0.00000000', '1522987634');
INSERT INTO `cy_orderlog` VALUES ('45', '27', '20', 'wkc', '1', '1.50000000', '35.00000000', '52.50000000', '0.24500000', '1522987634');
INSERT INTO `cy_orderlog` VALUES ('46', '27', '16', 'wkc', '0', '2.00000000', '50.00000000', '100.00000000', '0.00000000', '1522988276');
INSERT INTO `cy_orderlog` VALUES ('47', '16', '27', 'wkc', '1', '2.00000000', '50.00000000', '100.00000000', '0.35000000', '1522988276');
INSERT INTO `cy_orderlog` VALUES ('48', '27', '20', 'wkc', '0', '1.00000000', '50.00000000', '50.00000000', '0.00000000', '1523000376');
INSERT INTO `cy_orderlog` VALUES ('49', '20', '27', 'wkc', '1', '1.00000000', '50.00000000', '50.00000000', '0.35000000', '1523000376');
INSERT INTO `cy_orderlog` VALUES ('50', '27', '20', 'wkc', '0', '1.00000000', '50.00000000', '50.00000000', '0.00000000', '1523000655');
INSERT INTO `cy_orderlog` VALUES ('51', '20', '27', 'wkc', '1', '1.00000000', '50.00000000', '50.00000000', '0.35000000', '1523000655');
INSERT INTO `cy_orderlog` VALUES ('52', '27', '20', 'wkc', '0', '1.00000000', '100.00000000', '100.00000000', '0.00000000', '1523001254');
INSERT INTO `cy_orderlog` VALUES ('53', '20', '27', 'wkc', '1', '1.00000000', '100.00000000', '100.00000000', '0.70000000', '1523001254');
INSERT INTO `cy_orderlog` VALUES ('54', '27', '20', 'wkc', '0', '1.55000000', '64.51612903', '100.00000000', '0.00000000', '1523005210');
INSERT INTO `cy_orderlog` VALUES ('55', '20', '27', 'wkc', '1', '1.55000000', '64.51612903', '100.00000000', '0.45161290', '1523005210');
INSERT INTO `cy_orderlog` VALUES ('56', '20', '27', 'wkc', '0', '1.50000000', '33.33333333', '50.00000000', '0.00000000', '1523012264');
INSERT INTO `cy_orderlog` VALUES ('57', '27', '20', 'wkc', '1', '1.50000000', '33.33333333', '50.00000000', '0.23333333', '1523012264');
INSERT INTO `cy_orderlog` VALUES ('58', '20', '27', 'wkc', '0', '1.50000000', '66.66666667', '100.00000000', '0.00000000', '1523989271');
INSERT INTO `cy_orderlog` VALUES ('59', '27', '20', 'wkc', '1', '1.50000000', '66.66666667', '100.00000000', '0.46666667', '1523989271');

-- ----------------------------
-- Table structure for cy_pool
-- ----------------------------
DROP TABLE IF EXISTS `cy_pool`;
CREATE TABLE `cy_pool` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `coinname` varchar(50) NOT NULL,
  `ico` varchar(50) NOT NULL,
  `price` decimal(20,8) unsigned NOT NULL,
  `tian` int(11) unsigned NOT NULL,
  `limit` varchar(50) NOT NULL,
  `power` varchar(50) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='矿机类型表';

-- ----------------------------
-- Records of cy_pool
-- ----------------------------

-- ----------------------------
-- Table structure for cy_pool_log
-- ----------------------------
DROP TABLE IF EXISTS `cy_pool_log`;
CREATE TABLE `cy_pool_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) unsigned NOT NULL,
  `coinname` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `ico` varchar(50) NOT NULL,
  `price` decimal(20,8) unsigned NOT NULL,
  `tian` int(11) unsigned NOT NULL,
  `limit` varchar(50) NOT NULL,
  `power` varchar(50) NOT NULL,
  `num` int(11) unsigned NOT NULL,
  `use` int(11) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='矿机管理';

-- ----------------------------
-- Records of cy_pool_log
-- ----------------------------

-- ----------------------------
-- Table structure for cy_prompt
-- ----------------------------
DROP TABLE IF EXISTS `cy_prompt`;
CREATE TABLE `cy_prompt` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `title` varchar(200) NOT NULL,
  `url` varchar(200) NOT NULL,
  `img` varchar(200) NOT NULL,
  `mytx` varchar(200) NOT NULL,
  `remark` varchar(50) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cy_prompt
-- ----------------------------

-- ----------------------------
-- Table structure for cy_text
-- ----------------------------
DROP TABLE IF EXISTS `cy_text`;
CREATE TABLE `cy_text` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cy_text
-- ----------------------------
INSERT INTO `cy_text` VALUES ('1', 'game_vote', '37', '<span style=\"color:#0096E0;line-height:21px;background-color:#FFFFFF;\"><span>37请在后台修改此处内容</span></span><span style=\"color:#0096E0;line-height:21px;font-family:\'Microsoft Yahei\', \'Sim sun\', tahoma, \'Helvetica,Neue\', Helvetica, STHeiTi, Arial, sans-serif;background-color:#FFFFFF;\">,<span style=\"color:#EE33EE;\">详细信息</span></span>', '0', '1469733741', '0', '1');
INSERT INTO `cy_text` VALUES ('2', 'finance_index', '36', '<span style=\"color:#0096E0;line-height:21px;background-color:#FFFFFF;\"><span>您好，有任何错误请立即与客服反应，希望滑稽君为您带来快乐&lt;</span></span>', '0', '1475325266', '0', '1');
INSERT INTO `cy_text` VALUES ('3', 'finance_myzr', '34', '<span style=\"color:#0096E0;line-height:21px;background-color:#FFFFFF;\"><span>34请在后台修改此处内容</span></span><span style=\"color:#0096E0;line-height:21px;font-family:\'Microsoft Yahei\', \'Sim sun\', tahoma, \'Helvetica,Neue\', Helvetica, STHeiTi, Arial, sans-serif;background-color:#FFFFFF;\">,<span style=\"color:#EE33EE;\">详细信息</span></span>', '0', '1475325312', '0', '1');
INSERT INTO `cy_text` VALUES ('4', 'finance_myzc', '33', '<span style=\"color:#0096E0;line-height:21px;background-color:#FFFFFF;\"><span>审核较慢请耐心等待，滑稽兽呼噜噜~</span></span><span style=\"color:#0096E0;line-height:21px;font-family:&quot;Microsoft Yahei&quot;, &quot;Sim sun&quot;, tahoma, &quot;Helvetica,Neue&quot;, Helvetica, STHeiTi, Arial, sans-serif;background-color:#FFFFFF;\"><span style=\"color:#EE33EE;\"></span></span>', '0', '1475325321', '0', '1');
INSERT INTO `cy_text` VALUES ('5', 'finance_mywt', '32', '<span style=\"color:#0096E0;line-height:21px;background-color:#FFFFFF;\"><span>哇，你已经这么滑稽了呢~</span></span><span style=\"color:#0096E0;line-height:21px;font-family:&quot;Microsoft Yahei&quot;, &quot;Sim sun&quot;, tahoma, &quot;Helvetica,Neue&quot;, Helvetica, STHeiTi, Arial, sans-serif;background-color:#FFFFFF;\"><span style=\"color:#EE33EE;\"></span></span>', '0', '1475325496', '0', '1');
INSERT INTO `cy_text` VALUES ('6', 'finance_mycj', '30成交查询', '<span style=\"color:#9933E5;font-size:14px;\"><span style=\"line-height:21px;color:#9933E5;font-size:14px;background-color:#FFFFFF;\">查询全部买入卖出的成交记录</span></span>', '0', '1475325508', '0', '1');
INSERT INTO `cy_text` VALUES ('7', 'finance_mycz', '29人民币充值', '<span style=\"color:#9933E5;line-height:21px;\"><span style=\"color:#9933E5;\"><span style=\"color:#9933E5;font-family:\'Microsoft YaHei\';font-size:14px;line-height:34px;\">只允许使用本人的支付宝进行</span></span></span><span style=\"color:#0096E0;line-height:21px;\"><span><span style=\"color:#FF0D00;font-family:\'Microsoft YaHei\';font-size:14px;line-height:34px;\"><span style=\"color:#9933E5;\"></span><span style=\"color:#9933E5;\">转账充值，请确保汇款人姓名与注册一致</span></span></span></span>', '0', '1475325515', '0', '1');
INSERT INTO `cy_text` VALUES ('8', 'user_index', '28', '<span style=\"color:#0096E0;line-height:21px;background-color:#FFFFFF;\"><span>哼&nbsp;守护滑稽的安全，义不容辞！ </span></span><span style=\"color: rgb(0, 150, 224); line-height: 21px; font-family:;\" sans-serif;background-color:#ffffff;\"=\"\" arial,=\"\" stheiti,=\"\" helvetica,=\"\" \"helvetica,neue\",=\"\" tahoma,=\"\" sun\",=\"\" \"sim=\"\" yahei\",=\"\" microsoft=\"\"><span style=\"color:#EE33EE;\"></span></span>', '0', '1475325658', '0', '1');
INSERT INTO `cy_text` VALUES ('9', 'finance_mytx', '27人民币提现', '<span style=\"color:#0096E0;line-height:21px;background-color:#FFFFFF;\"><span>\r\n<h3 style=\"font-family:\'Microsoft YaHei\';font-weight:500;font-size:24px;background-color:#FFFFFF;\">\r\n	<span style=\"color:#9933E5;\">提现须知</span>\r\n</h3>\r\n<p style=\"color:#999999;font-family:\'Microsoft YaHei\';font-size:14px;background-color:#FFFFFF;\">\r\n	1. 提现手续费率1％，每笔提现最低收费2元 。\r\n</p>\r\n<p style=\"color:#999999;font-family:\'Microsoft YaHei\';font-size:14px;background-color:#FFFFFF;\">\r\n	2. 单笔提现限额100元——50000元。\r\n</p>\r\n<p style=\"color:#999999;font-family:\'Microsoft YaHei\';font-size:14px;background-color:#FFFFFF;\">\r\n	3. 银行卡提现24小时内到帐，在已汇出24小时后 仍未收到款项，请联系客服。\r\n</p>\r\n</span></span><span style=\"color:#0096E0;line-height:21px;font-family:\'Microsoft Yahei\', \'Sim sun\', tahoma, \'Helvetica,Neue\', Helvetica, STHeiTi, Arial, sans-serif;background-color:#FFFFFF;\"><span style=\"color:#EE33EE;\"></span></span>', '0', '1475325679', '0', '1');
INSERT INTO `cy_text` VALUES ('10', 'user_moble', '26手机绑定', '<span style=\"color:#0096E0;line-height:21px;background-color:#FFFFFF;\"><span> \r\n<h1 style=\"font-weight:normal;font-family:tahoma, \'Microsoft YaHei\', Arial, Helvetica, sans-serif;font-size:20px;color:#333333;background-color:#FFFFFF;\">\r\n	<span style=\"color:#9933E5;\">请绑行定您的手机方便进行充值与提现</span> \r\n</h1>\r\n</span></span>', '0', '1475351892', '0', '1');
INSERT INTO `cy_text` VALUES ('11', 'finance_mytj', '25推荐用户', '<span style=\"color:#9933E5;line-height:21px;font-size:14px;background-color:#FFFFFF;\"><span style=\"color:#9933E5;font-size:14px;\"><span style=\"color:#9933E5;font-family:tahoma, \'Microsoft YaHei\', Arial, Helvetica, sans-serif;line-height:30.8px;font-size:14px;background-color:#FFFFFF;\">这是您的专用邀请码：<span style=\"color:#666666;font-family:tahoma, \'Microsoft YaHei\', Arial, Helvetica, sans-serif;font-size:14px;line-height:normal;background-color:#FFFFFF;\">奖励下线金额三级分红:一代0.3% 二代0.2% 三代0.1</span></span></span></span>', '0', '1475352280', '0', '1');
INSERT INTO `cy_text` VALUES ('12', 'finance_mywd', '24', '<span style=\"color:#0096E0;line-height:21px;background-color:#FFFFFF;\"><span>把滑稽传向世界吧！滑稽兽会亲亲你呢 </span></span>', '0', '1475352284', '0', '1');
INSERT INTO `cy_text` VALUES ('13', 'finance_myjp', '23', '<span style=\"color:#0096E0;line-height:21px;background-color:#FFFFFF;\"><span>呐呐，收取滑稽兽的福利吧 </span></span><span style=\"color: rgb(0, 150, 224); line-height: 21px; font-family:;\" sans-serif;background-color:#ffffff;\"=\"\" arial,=\"\" stheiti,=\"\" helvetica,=\"\" \"helvetica,neue\",=\"\" tahoma,=\"\" sun\",=\"\" \"sim=\"\" yahei\",=\"\" microsoft=\"\"><span style=\"color:#EE33EE;\"></span></span>', '0', '1475352285', '0', '1');
INSERT INTO `cy_text` VALUES ('14', 'game_issue', '22', '<span style=\"color:#0096E0;line-height:21px;background-color:#FFFFFF;\"><span>欢迎认购！上市前较低价格</span></span><span style=\"color:#0096E0;line-height:21px;font-family:&quot;Microsoft Yahei&quot;, &quot;Sim sun&quot;, tahoma, &quot;Helvetica,Neue&quot;, Helvetica, STHeiTi, Arial, sans-serif;background-color:#FFFFFF;\"><span style=\"color:#EE33EE;\"></span></span>', '0', '1475352288', '0', '1');
INSERT INTO `cy_text` VALUES ('15', 'game_issue_log', '21', '<p>\r\n	<span style=\"color:#0096E0;line-height:21px;background-color:#FFFFFF;\"><span>滑稽币，传播快乐！</span></span>\r\n</p>', '0', '1475352293', '0', '1');
INSERT INTO `cy_text` VALUES ('16', 'game_fenhong', '20', '<span style=\"color:#0096E0;line-height:21px;background-color:#FFFFFF;\"><span>分红周期短，持币数大分红多</span></span><span style=\"color:#0096E0;line-height:21px;font-family:&quot;Microsoft Yahei&quot;, &quot;Sim sun&quot;, tahoma, &quot;Helvetica,Neue&quot;, Helvetica, STHeiTi, Arial, sans-serif;background-color:#FFFFFF;\"><span style=\"color:#EE33EE;\"></span></span>', '0', '1475352294', '0', '1');
INSERT INTO `cy_text` VALUES ('17', 'game_fenhong_log', '19', '<span style=\"color:#0096E0;line-height:21px;background-color:#FFFFFF;\"><span>。。</span></span><span style=\"color: rgb(0, 150, 224); line-height: 21px; font-family:;\" helvetica,=\"\" arial,=\"\" yahei\",=\"\" microsoft=\"\" sans-serif;background-color:#ffffff;\"=\"\" stheiti,=\"\" \"helvetica,neue\",=\"\" tahoma,=\"\" sun\",=\"\" \"sim=\"\"><span style=\"color:#EE33EE;\"></span></span>', '0', '1475352296', '0', '1');
INSERT INTO `cy_text` VALUES ('18', 'game_money', '18', '<span style=\"color:#0096E0;line-height:21px;background-color:#FFFFFF;\"><span>滑稽滑稽欢迎您~<img alt=\"\" src=\"http://114.215.40.96/Public/kindeditor/plugins/emoticons/images/44.gif\" border=\"0\" /></span></span><span style=\"color:#0096E0;line-height:21px;font-family:&quot;Microsoft Yahei&quot;, &quot;Sim sun&quot;, tahoma, &quot;Helvetica,Neue&quot;, Helvetica, STHeiTi, Arial, sans-serif;background-color:#FFFFFF;\"><span style=\"color:#EE33EE;\"></span></span>', '0', '1475352297', '0', '1');
INSERT INTO `cy_text` VALUES ('19', 'game_money_log', '17', '<span style=\"color:#0096E0;line-height:21px;background-color:#FFFFFF;\"><span>听说足够滑稽的人，能获得一个滑稽抱枕哦~ </span></span><span style=\"color: rgb(0, 150, 224); line-height: 21px; font-family:;\" sans-serif;background-color:#ffffff;\"=\"\" arial,=\"\" stheiti,=\"\" helvetica,=\"\" \"helvetica,neue\",=\"\" tahoma,=\"\" sun\",=\"\" \"sim=\"\" yahei\",=\"\" microsoft=\"\"><span style=\"color:#EE33EE;\"></span></span>', '0', '1475352298', '0', '1');
INSERT INTO `cy_text` VALUES ('20', 'user_paypassword', '16修改交易密码', '<span style=\"color:#0096E0;line-height:21px;background-color:#FFFFFF;\"><span> \r\n<h1 style=\"font-weight:normal;font-family:tahoma, \'Microsoft YaHei\', Arial, Helvetica, sans-serif;font-size:20px;color:#333333;background-color:#FFFFFF;\">\r\n	<span style=\"color:#9933E5;\">请在下面修改您的交易密码</span> \r\n</h1>\r\n</span></span>', '0', '1475352694', '0', '1');
INSERT INTO `cy_text` VALUES ('21', 'user_password', '', '<span style=\"color:#0096E0;line-height:21px;background-color:#FFFFFF;\"><span>请在下面修改您的登录密码 </span></span><span style=\"color: rgb(0, 150, 224); line-height: 21px; font-family:;\" sans-serif;background-color:#ffffff;\"=\"\" arial,=\"\" stheiti,=\"\" helvetica,=\"\" \"helvetica,neue\",=\"\" tahoma,=\"\" sun\",=\"\" \"sim=\"\" yahei\",=\"\" microsoft=\"\"><span style=\"color:#EE33EE;\"></span></span>', '0', '1475352695', '0', '1');
INSERT INTO `cy_text` VALUES ('22', 'user_nameauth', '15实名认证', '<span style=\"color:#9933E5;\"><span style=\"line-height:21px;color:#9933E5;background-color:#FFFFFF;\">请您实名注册如有错误请联系客服进行修改</span></span>', '0', '1475352696', '0', '1');
INSERT INTO `cy_text` VALUES ('23', 'user_tpwdset', '14', '<span style=\"color:#0096E0;line-height:21px;background-color:#FFFFFF;\"><span>这是你的交易密码，不要被别人偷看了噢</span></span>', '0', '1475352698', '0', '1');
INSERT INTO `cy_text` VALUES ('24', 'game_shop', '13', '<span style=\"color:#0096E0;line-height:21px;background-color:#FFFFFF;\"><span>13请在后台修改此处内容</span></span><span style=\"color:#0096E0;line-height:21px;font-family:\'Microsoft Yahei\', \'Sim sun\', tahoma, \'Helvetica,Neue\', Helvetica, STHeiTi, Arial, sans-serif;background-color:#FFFFFF;\">,<span style=\"color:#EE33EE;\">详细信息</span></span>', '0', '1475352702', '0', '1');
INSERT INTO `cy_text` VALUES ('25', 'game_issue_buy', '12', '<span style=\"color:#0096E0;line-height:21px;background-color:#FFFFFF;\"><span>12请在后台修改此处内容</span></span><span style=\"color:#0096E0;line-height:21px;font-family:\'Microsoft Yahei\', \'Sim sun\', tahoma, \'Helvetica,Neue\', Helvetica, STHeiTi, Arial, sans-serif;background-color:#FFFFFF;\">,<span style=\"color:#EE33EE;\">详细信息</span></span>', '0', '1475352722', '0', '1');
INSERT INTO `cy_text` VALUES ('26', 'game_huafei', '11', '<span style=\"color:#0096E0;line-height:21px;background-color:#FFFFFF;\"><span>话费充值未即时到账请等待，可能是被滑稽怪吃了哦~</span></span>', '0', '1475359119', '0', '1');
INSERT INTO `cy_text` VALUES ('27', 'user_bank', '10', '<p>\r\n	<span style=\"color:#0096E0;line-height:21px;background-color:#FFFFFF;\"><span></span></span><span style=\"color:#0096E0;line-height:21px;font-family:\"Microsoft Yahei\", \"Sim sun\", tahoma, \"Helvetica,Neue\", Helvetica, STHeiTi, Arial, sans-serif;background-color:#FFFFFF;\"><span style=\"color:#EE33EE;\">感觉支付宝被掏空。。。</span></span>\r\n</p>', '0', '1475359192', '0', '1');
INSERT INTO `cy_text` VALUES ('28', 'user_qianbao', '9', '<span style=\"color:#0096E0;line-height:21px;background-color:#FFFFFF;\"><span>请添加真实钱包地址，错误钱包地址导致的充值出金异常平台概不负责 </span></span>', '0', '1475359195', '0', '1');
INSERT INTO `cy_text` VALUES ('29', 'user_log', '8', '<span style=\"color:#0096E0;line-height:21px;background-color:#FFFFFF;\"><span>登陆地址异常请及时联系客服</span></span><span style=\"color:#0096E0;line-height:21px;font-family:&quot;Microsoft Yahei&quot;, &quot;Sim sun&quot;, tahoma, &quot;Helvetica,Neue&quot;, Helvetica, STHeiTi, Arial, sans-serif;background-color:#FFFFFF;\"><span style=\"color:#EE33EE;\"></span></span>', '0', '1475359241', '0', '1');
INSERT INTO `cy_text` VALUES ('30', 'user_ga', '7', '<span style=\"color:#0096E0;line-height:21px;background-color:#FFFFFF;\"><span>7请在后台修改此处内容</span></span><span style=\"color:#0096E0;line-height:21px;font-family:\'Microsoft Yahei\', \'Sim sun\', tahoma, \'Helvetica,Neue\', Helvetica, STHeiTi, Arial, sans-serif;background-color:#FFFFFF;\">,<span style=\"color:#EE33EE;\">详细信息</span></span>', '0', '1475395398', '0', '1');
INSERT INTO `cy_text` VALUES ('31', 'user_alipay', '6', '<span style=\"color:#0096E0;line-height:21px;background-color:#FFFFFF;\"><span>6请在后台修改此处内容</span></span><span style=\"color:#0096E0;line-height:21px;font-family:\'Microsoft Yahei\', \'Sim sun\', tahoma, \'Helvetica,Neue\', Helvetica, STHeiTi, Arial, sans-serif;background-color:#FFFFFF;\">,<span style=\"color:#EE33EE;\">详细信息</span></span>', '0', '1475395410', '0', '1');
INSERT INTO `cy_text` VALUES ('32', 'user_goods', '5', '<span style=\"color:#0096E0;line-height:21px;background-color:#FFFFFF;\"><span>地址可以用于奖品的邮寄哦！</span></span>', '0', '1475395413', '0', '1');
INSERT INTO `cy_text` VALUES ('33', 'game_shop_view', '3', '<span style=\"color:#0096E0;line-height:21px;background-color:#FFFFFF;\"><span>3请在后台修改此处内容</span></span><span style=\"color:#0096E0;line-height:21px;font-family:\'Microsoft Yahei\', \'Sim sun\', tahoma, \'Helvetica,Neue\', Helvetica, STHeiTi, Arial, sans-serif;background-color:#FFFFFF;\">,<span style=\"color:#EE33EE;\">详细信息</span></span>', '0', '1476000366', '0', '1');
INSERT INTO `cy_text` VALUES ('34', 'game_shop_log', '2', '<span style=\"color:#0096E0;line-height:21px;background-color:#FFFFFF;\"><span>2请在后台修改此处内容</span></span><span style=\"color:#0096E0;line-height:21px;font-family:\'Microsoft Yahei\', \'Sim sun\', tahoma, \'Helvetica,Neue\', Helvetica, STHeiTi, Arial, sans-serif;background-color:#FFFFFF;\">,<span style=\"color:#EE33EE;\">详细信息</span></span>', '0', '1476002906', '0', '1');
INSERT INTO `cy_text` VALUES ('35', 'game_shop_goods', '1', '<span style=\"color:#0096E0;line-height:21px;background-color:#FFFFFF;\"><span>1请在后台修改此处内容</span></span><span style=\"color:#0096E0;line-height:21px;font-family:\'Microsoft Yahei\', \'Sim sun\', tahoma, \'Helvetica,Neue\', Helvetica, STHeiTi, Arial, sans-serif;background-color:#FFFFFF;\">,<span style=\"color:#EE33EE;\">详细信息</span></span>', '0', '1476002907', '0', '1');

-- ----------------------------
-- Table structure for cy_trade
-- ----------------------------
DROP TABLE IF EXISTS `cy_trade`;
CREATE TABLE `cy_trade` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) unsigned NOT NULL,
  `market` varchar(50) NOT NULL,
  `price` decimal(20,8) unsigned NOT NULL,
  `num` decimal(20,8) unsigned NOT NULL,
  `deal` decimal(20,8) unsigned NOT NULL,
  `mum` decimal(20,8) unsigned NOT NULL,
  `fee` decimal(20,8) unsigned NOT NULL,
  `type` tinyint(2) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `market` (`market`,`type`,`status`),
  KEY `num` (`num`,`deal`),
  KEY `status` (`status`),
  KEY `market_2` (`market`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='交易下单表';

-- ----------------------------
-- Records of cy_trade
-- ----------------------------

-- ----------------------------
-- Table structure for cy_trade_json
-- ----------------------------
DROP TABLE IF EXISTS `cy_trade_json`;
CREATE TABLE `cy_trade_json` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `market` varchar(100) NOT NULL,
  `data` varchar(500) NOT NULL,
  `type` varchar(100) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `market` (`market`)
) ENGINE=InnoDB AUTO_INCREMENT=12965 DEFAULT CHARSET=utf8 COMMENT='交易图表表';

-- ----------------------------
-- Records of cy_trade_json
-- ----------------------------
INSERT INTO `cy_trade_json` VALUES ('1', 'thc_cny', '[1480488356,\"30.00000000\",\"0.10000000\",\"0.10000000\",\"0.10000000\",\"0.10000000\"]', '1', '0', '1480488356', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('2', 'thc_cny', '[1480488300,\"30.00000000\",\"0.10000000\",\"0.10000000\",\"0.10000000\",\"0.10000000\"]', '3', '0', '1480488300', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('3', 'thc_cny', '[1480488300,\"30.00000000\",\"0.10000000\",\"0.10000000\",\"0.10000000\",\"0.10000000\"]', '5', '0', '1480488300', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('4', 'thc_cny', '[1480488000,\"30.00000000\",\"0.10000000\",\"0.10000000\",\"0.10000000\",\"0.10000000\"]', '10', '0', '1480488000', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('5', 'thc_cny', '[1480488300,\"30.00000000\",\"0.10000000\",\"0.10000000\",\"0.10000000\",\"0.10000000\"]', '15', '0', '1480488300', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('6', 'thc_cny', '[1480487400,\"30.00000000\",\"0.10000000\",\"0.10000000\",\"0.10000000\",\"0.10000000\"]', '30', '0', '1480487400', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('7', 'thc_cny', '[1480485600,\"30.00000000\",\"0.10000000\",\"0.10000000\",\"0.10000000\",\"0.10000000\"]', '60', '0', '1480485600', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('8', 'thc_cny', '[1480485600,\"30.00000000\",\"0.10000000\",\"0.10000000\",\"0.10000000\",\"0.10000000\"]', '120', '0', '1480485600', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('9', 'thc_cny', '[1480485600,\"30.00000000\",\"0.10000000\",\"0.10000000\",\"0.10000000\",\"0.10000000\"]', '240', '0', '1480485600', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('10', 'thc_cny', '[1480485600,\"30.00000000\",\"0.10000000\",\"0.10000000\",\"0.10000000\",\"0.10000000\"]', '360', '0', '1480485600', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('11', 'thc_cny', '[1480485600,\"30.00000000\",\"0.10000000\",\"0.10000000\",\"0.10000000\",\"0.10000000\"]', '720', '0', '1480485600', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('12', 'thc_cny', '[1480485600,\"30.00000000\",\"0.10000000\",\"0.10000000\",\"0.10000000\",\"0.10000000\"]', '1440', '0', '1480485600', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('13', 'thc_cny', '[1480485600,\"30.00000000\",\"0.10000000\",\"0.10000000\",\"0.10000000\",\"0.10000000\"]', '10080', '0', '1480485600', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('14', 'thc_cny', '', '1', '0', '1480488416', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('15', 'thc_cny', '', '3', '0', '1480488480', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('16', 'thc_cny', '', '5', '0', '1480488600', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('17', 'thc_cny', '', '10', '0', '1480488600', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('18', 'thc_cny', '', '15', '0', '1480489200', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('19', 'thc_cny', '', '30', '0', '1480489200', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('20', 'thc_cny', '', '60', '0', '1480489200', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('21', 'thc_cny', '', '120', '0', '1480492800', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('22', 'thc_cny', '', '240', '0', '1480500000', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('23', 'thc_cny', '', '360', '0', '1480507200', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('24', 'thc_cny', '', '720', '0', '1480528800', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('25', 'thc_cny', '', '1440', '0', '1480572000', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('26', 'thc_cny', '', '10080', '0', '1481090400', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('27', 'fc_cny', '[1486376993,\"100000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '1', '0', '1486376993', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('28', 'fc_cny', '[1486376820,\"100000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '3', '0', '1486376820', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('29', 'fc_cny', '[1486377000,\"10000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '3', '0', '1486377000', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('30', 'fc_cny', '[1486376700,\"100000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '5', '0', '1486376700', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('31', 'fc_cny', '[1486377000,\"10000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '5', '0', '1486377000', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('32', 'fc_cny', '[1486376400,\"100000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '10', '0', '1486376400', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('33', 'fc_cny', '[1486377000,\"700000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '10', '0', '1486377000', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('34', 'fc_cny', '[1486376100,\"100000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '15', '0', '1486376100', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('35', 'fc_cny', '[1486377000,\"700000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '15', '0', '1486377000', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('36', 'fc_cny', '[1486375200,\"100000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '30', '0', '1486375200', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('37', 'fc_cny', '[1486377000,\"700000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '30', '0', '1486377000', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('38', 'fc_cny', '[1486375200,\"800000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '60', '0', '1486375200', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('39', 'fc_cny', '[1486375200,\"800000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '120', '0', '1486375200', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('40', 'fc_cny', '[1486375200,\"800000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '240', '0', '1486375200', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('41', 'fc_cny', '[1486375200,\"800000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '360', '0', '1486375200', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('42', 'fc_cny', '[1486375200,\"800000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '720', '0', '1486375200', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('43', 'fc_cny', '[1486375200,\"810000.00000000\",\"0.00000100\",\"0.00000200\",\"0.00000100\",\"0.00000200\"]', '1440', '0', '1486375200', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('44', 'fc_cny', '[1486375200,\"17527668.21000000\",\"0.00000100\",\"0.00000200\",\"0.00000100\",\"0.00000100\"]', '10080', '0', '1486375200', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('47', 'fc_cny', '[1486377113,\"10000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '1', '0', '1486377113', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('50', 'fc_cny', '[1486377300,\"690000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '5', '0', '1486377300', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('56', 'fc_cny', '[1486377473,\"690000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '1', '0', '1486377473', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('58', 'fc_cny', '[1486377360,\"690000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '3', '0', '1486377360', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('69', 'fc_cny', '[1486418400,\"10000.00000000\",\"0.00000200\",\"0.00000200\",\"0.00000200\",\"0.00000200\"]', '720', '0', '1486418400', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('216', 'fc_cny', '[1486450800,\"10000.00000000\",\"0.00000200\",\"0.00000200\",\"0.00000200\",\"0.00000200\"]', '60', '0', '1486450800', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('226', 'fc_cny', '[1486447200,\"10000.00000000\",\"0.00000200\",\"0.00000200\",\"0.00000200\",\"0.00000200\"]', '120', '0', '1486447200', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('231', 'fc_cny', '[1486447200,\"10000.00000000\",\"0.00000200\",\"0.00000200\",\"0.00000200\",\"0.00000200\"]', '240', '0', '1486447200', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('234', 'fc_cny', '[1486440000,\"10000.00000000\",\"0.00000200\",\"0.00000200\",\"0.00000200\",\"0.00000200\"]', '360', '0', '1486440000', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('360', 'fc_cny', '[1486450800,\"10000.00000000\",\"0.00000200\",\"0.00000200\",\"0.00000200\",\"0.00000200\"]', '30', '0', '1486450800', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('657', 'fc_cny', '[1486451700,\"10000.00000000\",\"0.00000200\",\"0.00000200\",\"0.00000200\",\"0.00000200\"]', '15', '0', '1486451700', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('808', 'fc_cny', '[1486451400,\"10000.00000000\",\"0.00000200\",\"0.00000200\",\"0.00000200\",\"0.00000200\"]', '10', '0', '1486451400', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('1174', 'fc_cny', '[1486451700,\"10000.00000000\",\"0.00000200\",\"0.00000200\",\"0.00000200\",\"0.00000200\"]', '5', '0', '1486451700', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('1506', 'fc_cny', '[1486451700,\"10000.00000000\",\"0.00000200\",\"0.00000200\",\"0.00000200\",\"0.00000200\"]', '3', '0', '1486451700', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('2373', 'fc_cny', '[1486451813,\"10000.00000000\",\"0.00000200\",\"0.00000200\",\"0.00000200\",\"0.00000200\"]', '1', '0', '1486451813', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('2378', 'fc_cny', '[1486461600,\"10000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '720', '0', '1486461600', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('2379', 'fc_cny', '[1486461600,\"10000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '1440', '0', '1486461600', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('2502', 'fc_cny', '[1486483200,\"10000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '30', '0', '1486483200', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('2511', 'fc_cny', '[1486483200,\"10000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '60', '0', '1486483200', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('2516', 'fc_cny', '[1486483200,\"10000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '120', '0', '1486483200', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('2518', 'fc_cny', '[1486476000,\"10000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '240', '0', '1486476000', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('2520', 'fc_cny', '[1486483200,\"10000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '360', '0', '1486483200', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('2620', 'fc_cny', '[1486484100,\"10000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '15', '0', '1486484100', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('2698', 'fc_cny', '[1486484400,\"10000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '10', '0', '1486484400', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('2874', 'fc_cny', '[1486484400,\"10000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '5', '0', '1486484400', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('2996', 'fc_cny', '[1486484460,\"10000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '3', '0', '1486484460', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('3383', 'fc_cny', '[1486484513,\"10000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '1', '0', '1486484513', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('3578', 'fc_cny', '[1486634400,\"3190087.28000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '240', '0', '1486634400', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('3585', 'fc_cny', '[1486634400,\"3200000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '360', '0', '1486634400', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('3589', 'fc_cny', '[1486634400,\"3200000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '720', '0', '1486634400', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('3591', 'fc_cny', '[1486634400,\"14710000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '1440', '0', '1486634400', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('3740', 'fc_cny', '[1486641600,\"3190087.28000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '120', '0', '1486641600', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('3870', 'fc_cny', '[1486641600,\"1380087.28000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '60', '0', '1486641600', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('4110', 'fc_cny', '[1486643400,\"1380087.28000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '30', '0', '1486643400', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('4526', 'fc_cny', '[1486643400,\"1380087.28000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '15', '0', '1486643400', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('4930', 'fc_cny', '[1486643400,\"1070087.28000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '10', '0', '1486643400', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('5738', 'fc_cny', '[1486643400,\"320000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '5', '0', '1486643400', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('5739', 'fc_cny', '[1486643700,\"750087.28000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '5', '0', '1486643700', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('6477', 'fc_cny', '[1486643400,\"70000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '3', '0', '1486643400', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('6478', 'fc_cny', '[1486643580,\"250000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '3', '0', '1486643580', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('6479', 'fc_cny', '[1486643760,\"750087.28000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '3', '0', '1486643760', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('6648', 'fc_cny', '[1486643940,\"310000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '3', '0', '1486643940', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('6985', 'fc_cny', '[1486644000,\"310000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '5', '0', '1486644000', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('6986', 'fc_cny', '[1486644000,\"310000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '10', '0', '1486644000', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('8337', 'fc_cny', '[1486643513,\"70000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '1', '0', '1486643513', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('8339', 'fc_cny', '[1486643633,\"250000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '1', '0', '1486643633', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('8341', 'fc_cny', '[1486643753,\"130000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '1', '0', '1486643753', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('8342', 'fc_cny', '[1486643813,\"620087.28000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '1', '0', '1486643813', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('8346', 'fc_cny', '[1486644053,\"310000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '1', '0', '1486644053', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('8351', 'fc_cny', '[1486645200,\"1810000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '30', '0', '1486645200', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('8352', 'fc_cny', '[1486645200,\"1810000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '60', '0', '1486645200', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('8382', 'fc_cny', '[1486645560,\"1810000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '3', '0', '1486645560', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('8387', 'fc_cny', '[1486645500,\"1810000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '5', '0', '1486645500', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('8389', 'fc_cny', '[1486645200,\"1810000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '10', '0', '1486645200', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('8391', 'fc_cny', '[1486645200,\"1810000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '15', '0', '1486645200', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('8397', 'fc_cny', '[1486645613,\"1810000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '1', '0', '1486645613', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('8404', 'fc_cny', '[1486648800,\"9912.72000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '60', '0', '1486648800', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('8405', 'fc_cny', '[1486648800,\"9912.72000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '120', '0', '1486648800', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('8406', 'fc_cny', '[1486648800,\"9912.72000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '240', '0', '1486648800', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('8480', 'fc_cny', '[1486651800,\"9912.72000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '10', '0', '1486651800', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('8488', 'fc_cny', '[1486651500,\"9912.72000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '15', '0', '1486651500', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('8492', 'fc_cny', '[1486650600,\"9912.72000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '30', '0', '1486650600', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('8532', 'fc_cny', '[1486652220,\"9912.72000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '3', '0', '1486652220', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('8535', 'fc_cny', '[1486652100,\"9912.72000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '5', '0', '1486652100', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('8611', 'fc_cny', '[1486652333,\"9912.72000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '1', '0', '1486652333', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('8621', 'fc_cny', '[1486677600,\"11510000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '720', '0', '1486677600', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('8760', 'fc_cny', '[1486695600,\"6510000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '60', '0', '1486695600', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('8766', 'fc_cny', '[1486692000,\"6510000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '120', '0', '1486692000', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('8769', 'fc_cny', '[1486692000,\"11510000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '240', '0', '1486692000', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('8771', 'fc_cny', '[1486677600,\"6510000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '360', '0', '1486677600', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('8882', 'fc_cny', '[1486697400,\"6510000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '30', '0', '1486697400', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('8977', 'fc_cny', '[1486697400,\"6510000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '15', '0', '1486697400', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('9056', 'fc_cny', '[1486697400,\"1510000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '10', '0', '1486697400', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('9299', 'fc_cny', '[1486697700,\"1510000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '5', '0', '1486697700', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('9426', 'fc_cny', '[1486698000,\"5000000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '5', '0', '1486698000', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('9427', 'fc_cny', '[1486698000,\"5000000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '10', '0', '1486698000', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('9503', 'fc_cny', '[1486697760,\"10000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '3', '0', '1486697760', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('9504', 'fc_cny', '[1486697940,\"3500000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '3', '0', '1486697940', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('9631', 'fc_cny', '[1486698120,\"3000000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '3', '0', '1486698120', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('10024', 'fc_cny', '[1486697933,\"1510000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '1', '0', '1486697933', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('10025', 'fc_cny', '[1486697993,\"2000000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '1', '0', '1486697993', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('10029', 'fc_cny', '[1486698233,\"3000000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '1', '0', '1486698233', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('10037', 'fc_cny', '[1486699200,\"5000000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '120', '0', '1486699200', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('10038', 'fc_cny', '[1486699200,\"5000000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '360', '0', '1486699200', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('10114', 'fc_cny', '[1486705800,\"5000000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '10', '0', '1486705800', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('10123', 'fc_cny', '[1486705500,\"5000000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '15', '0', '1486705500', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('10127', 'fc_cny', '[1486704600,\"5000000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '30', '0', '1486704600', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('10129', 'fc_cny', '[1486702800,\"5000000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '60', '0', '1486702800', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('10178', 'fc_cny', '[1486706100,\"5000000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '5', '0', '1486706100', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('10203', 'fc_cny', '[1486706040,\"5000000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '3', '0', '1486706040', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('10278', 'fc_cny', '[1486706153,\"5000000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '1', '0', '1486706153', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('10288', 'fc_cny', '[1486720800,\"1000000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '360', '0', '1486720800', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('10289', 'fc_cny', '[1486720800,\"1000000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '720', '0', '1486720800', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('10290', 'fc_cny', '[1486720800,\"1997668.21000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '1440', '0', '1486720800', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('10408', 'fc_cny', '[1486728000,\"1000000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '30', '0', '1486728000', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('10415', 'fc_cny', '[1486728000,\"1000000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '60', '0', '1486728000', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('10419', 'fc_cny', '[1486728000,\"1000000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '120', '0', '1486728000', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('10421', 'fc_cny', '[1486720800,\"1000000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '240', '0', '1486720800', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('10501', 'fc_cny', '[1486728000,\"1000000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '10', '0', '1486728000', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('10506', 'fc_cny', '[1486728000,\"1000000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '15', '0', '1486728000', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('10624', 'fc_cny', '[1486728000,\"1000000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '5', '0', '1486728000', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('10733', 'fc_cny', '[1486728180,\"1000000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '3', '0', '1486728180', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('10973', 'fc_cny', '[1486728233,\"1000000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '1', '0', '1486728233', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('10986', 'fc_cny', '[1486764000,\"997668.21000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '720', '0', '1486764000', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('11125', 'fc_cny', '[1486774800,\"500000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '60', '0', '1486774800', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('11131', 'fc_cny', '[1486771200,\"500000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '120', '0', '1486771200', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('11134', 'fc_cny', '[1486764000,\"500000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '240', '0', '1486764000', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('11136', 'fc_cny', '[1486764000,\"500000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '360', '0', '1486764000', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('11248', 'fc_cny', '[1486776600,\"500000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '30', '0', '1486776600', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('11346', 'fc_cny', '[1486776600,\"500000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '15', '0', '1486776600', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('11430', 'fc_cny', '[1486776600,\"500000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '10', '0', '1486776600', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('11728', 'fc_cny', '[1486776900,\"500000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '5', '0', '1486776900', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('11930', 'fc_cny', '[1486776960,\"500000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '3', '0', '1486776960', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('12169', 'fc_cny', '[1486778400,\"497668.21000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '240', '0', '1486778400', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('12494', 'fc_cny', '[1486777073,\"500000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '1', '0', '1486777073', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('12506', 'fc_cny', '[1486785600,\"497668.21000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '360', '0', '1486785600', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('12606', 'fc_cny', '[1486791000,\"400000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '15', '0', '1486791000', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('12614', 'fc_cny', '[1486791000,\"497668.21000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '30', '0', '1486791000', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('12618', 'fc_cny', '[1486789200,\"497668.21000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '60', '0', '1486789200', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('12620', 'fc_cny', '[1486785600,\"497668.21000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '120', '0', '1486785600', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('12688', 'fc_cny', '[1486791600,\"497668.21000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '10', '0', '1486791600', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('12739', 'fc_cny', '[1486791600,\"400000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '5', '0', '1486791600', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('12779', 'fc_cny', '[1486791720,\"400000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '3', '0', '1486791720', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('12906', 'fc_cny', '[1486791900,\"96923.96000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '3', '0', '1486791900', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('12907', 'fc_cny', '[1486791900,\"97668.21000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '5', '0', '1486791900', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('12908', 'fc_cny', '[1486791900,\"97668.21000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '15', '0', '1486791900', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('12945', 'fc_cny', '[1486791833,\"400000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '1', '0', '1486791833', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('12949', 'fc_cny', '[1486792013,\"90000.00000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '1', '0', '1486792013', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('12950', 'fc_cny', '[1486792073,\"7668.21000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '1', '0', '1486792073', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('12951', 'fc_cny', '[1486792080,\"744.25000000\",\"0.00000100\",\"0.00000100\",\"0.00000100\",\"0.00000100\"]', '3', '0', '1486792080', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('12952', 'fc_cny', '', '1', '0', '1486792133', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('12953', 'fc_cny', '', '5', '0', '1486792200', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('12954', 'fc_cny', '', '10', '0', '1486792200', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('12955', 'fc_cny', '', '3', '0', '1486792260', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('12956', 'fc_cny', '', '15', '0', '1486792800', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('12957', 'fc_cny', '', '30', '0', '1486792800', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('12958', 'fc_cny', '', '60', '0', '1486792800', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('12959', 'fc_cny', '', '120', '0', '1486792800', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('12960', 'fc_cny', '', '240', '0', '1486792800', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('12961', 'fc_cny', '', '360', '0', '1486807200', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('12962', 'fc_cny', '', '720', '0', '1486807200', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('12963', 'fc_cny', '', '1440', '0', '1486807200', '0', '0');
INSERT INTO `cy_trade_json` VALUES ('12964', 'fc_cny', '', '10080', '0', '1486980000', '0', '0');

-- ----------------------------
-- Table structure for cy_trade_log
-- ----------------------------
DROP TABLE IF EXISTS `cy_trade_log`;
CREATE TABLE `cy_trade_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) unsigned NOT NULL,
  `peerid` int(11) unsigned NOT NULL,
  `market` varchar(50) NOT NULL,
  `price` decimal(20,8) unsigned NOT NULL,
  `num` decimal(20,8) unsigned NOT NULL,
  `mum` decimal(20,8) unsigned NOT NULL,
  `fee_buy` decimal(20,8) unsigned NOT NULL,
  `fee_sell` decimal(20,8) unsigned NOT NULL,
  `type` tinyint(2) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `userid` (`userid`),
  KEY `peerid` (`peerid`),
  KEY `main` (`market`,`status`,`addtime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of cy_trade_log
-- ----------------------------

-- ----------------------------
-- Table structure for cy_ucenter_member
-- ----------------------------
DROP TABLE IF EXISTS `cy_ucenter_member`;
CREATE TABLE `cy_ucenter_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `last_login_ip` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of cy_ucenter_member
-- ----------------------------

-- ----------------------------
-- Table structure for cy_user
-- ----------------------------
DROP TABLE IF EXISTS `cy_user`;
CREATE TABLE `cy_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL COMMENT '父级',
  `username` varchar(50) NOT NULL,
  `country_code` int(10) unsigned NOT NULL COMMENT '国家编号',
  `mobile` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `moneypwd` varchar(32) NOT NULL COMMENT '资金密码',
  `salt` varchar(10) NOT NULL COMMENT '盐',
  `truename` varchar(32) NOT NULL,
  `idcard` varchar(32) NOT NULL,
  `addip` varchar(50) NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '冻结状态为0   正常状态为1',
  `ue_img` varchar(255) DEFAULT '' COMMENT '头像',
  `trusted` varchar(255) DEFAULT NULL COMMENT '信任您的人',
  `trusting` varchar(255) DEFAULT NULL COMMENT '您信任的人',
  `blocking` varchar(255) DEFAULT NULL COMMENT '您屏蔽的人',
  `ga` varchar(50) CHARACTER SET utf8 COLLATE utf8_sinhala_ci DEFAULT NULL COMMENT '谷歌',
  `yqm` varchar(50) NOT NULL COMMENT '邀请码',
  `xinyong` varchar(10) NOT NULL DEFAULT '100' COMMENT '信用额',
  `wkcaddress` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of cy_user
-- ----------------------------
INSERT INTO `cy_user` VALUES ('1', null, 'hyka', '86', '15538703323', 'dc5de42ca609f508960ba02adc2333e7', '42cdbf374951c0fd42bd766536079e1f', 'adc', '', '', '127.0.0.1', '1510137685', '1', '/Uploads/2017-11-08/1510137784.jpg', '12', '3', '', null, 'N2O03R6L', '100', null);
INSERT INTO `cy_user` VALUES ('2', null, 'hykq', '86', '15538703324', 'a30df6eddf773701026557e461261e73', 'ce16718d0ed344ad59ebe2097125d8eb', '8cf', '', '', '127.0.0.1', '1510138861', '1', '/Uploads/head_portrait60.png', '', '', '', null, '', '100', null);
INSERT INTO `cy_user` VALUES ('3', null, 'hykw', '86', '15538703325', 'af2679a63298aa4279061756ab5c6a74', '', '503', '', '', '127.0.0.1', '1510138884', '1', '/Uploads/head_portrait60.png', '1', null, null, null, '', '100', null);
INSERT INTO `cy_user` VALUES ('4', null, 'zlja', '86', '13653912753', '7ae92920cf00acf3e8d5d53587a0ef51', '346a6bafad8de743ec9bd0e32f6f6d6b', 'e28', '', '', '192.168.1.109', '1511422211', '1', '/Uploads/2017-11-23/1511424260.png', null, null, null, 'IOFDFIY5UWRUD4KB', '', '100', null);
INSERT INTO `cy_user` VALUES ('6', null, 'hykaa', '86', '18239191810', 'b06f4429fa9d77ce86a3f504635a356e', 'b06f4429fa9d77ce86a3f504635a356e', '5a0', '', '', '127.0.0.1', '1512098255', '1', '/Uploads/head_portrait60.png', null, null, null, null, '', '100', null);
INSERT INTO `cy_user` VALUES ('7', null, 'liping', '86', '18639911608', 'd7568ed79ba79e765f2e5d96c28f021b', 'd7568ed79ba79e765f2e5d96c28f021b', 'e39', '', '', '127.0.0.1', '1512098833', '1', '/Uploads/head_portrait60.png', null, null, null, null, '', '100', null);
INSERT INTO `cy_user` VALUES ('12', '6', 'hykka', '86', '15978784954', '5dfd43eadecb2584e455aae190a5b604', '', '2c5', '', '', '127.0.0.1', '1512368378', '1', '/Uploads/head_portrait60.png', null, '1', null, null, '5HKUUCNG', '100', null);
INSERT INTO `cy_user` VALUES ('13', null, 'qweqwe', '86', '15538703326', '037cd03dc5000ccda159d261fdea4e3e', '', '8f4', '', '', '127.0.0.1', '1513258937', '1', '/Uploads/head_portrait60.png', null, null, null, null, 'PKS393O1', '100', null);
INSERT INTO `cy_user` VALUES ('15', null, 'scenery', '86', '15671296688', '916a0ab2ac8390f2ccebbf687acafc2c', '', '63b', '黄越', '420621197808057419', '192.168.2.104', '1515996463', '1', '/Uploads/head_portrait60.png', null, null, null, null, 'GUMC1NPS', '100', '');
INSERT INTO `cy_user` VALUES ('16', null, 'river', '86', '15508025870', '182dbd1d9c49f73fd2c32c1024a587e8', '182dbd1d9c49f73fd2c32c1024a587e8', '4b3', '', '', '192.168.2.2', '1516783797', '1', '/Uploads/head_portrait60.png', null, null, null, null, '6PDD6BAF', '100', '');
INSERT INTO `cy_user` VALUES ('17', null, 'sansan', '86', '13330888212', '037cd03dc5000ccda159d261fdea4e3e', '037cd03dc5000ccda159d261fdea4e3e', '8f4', '', '', '192.168.2.2', '1516785509', '1', '/Uploads/head_portrait60.png', null, null, null, '', 'ARLTAL7T', '100', null);
INSERT INTO `cy_user` VALUES ('18', null, 'ename', '86', '13106618217', '92d6e2bbec727e63656ded2462ca7eb1', '', '00d', '', '', '192.168.2.153', '1516849795', '1', '/Uploads/head_portrait60.png', null, null, null, null, 'TEIE8QS6', '100', null);
INSERT INTO `cy_user` VALUES ('20', null, 'mltest', '86', '18627845673', '392b1f5069fa9abfb4bd583361deb0ce', 'b64f35267f49a668aae137d789ca0841', '4ce', '', '', '218.19.113.30', '1522745942', '1', '/Uploads/head_portrait60.png', null, null, null, null, 'CTAE4N20', '100', '0x2bb3c274f1a5c47edd13e98de97020fc19ad650b');
INSERT INTO `cy_user` VALUES ('27', null, 'testml', '86', '17666505673', '2f72f9941e186999ff50d99219bbc1ea', '', 'deb', '', '', '192.168.153.1', '1522986246', '1', '/Uploads/head_portrait60.png', null, null, null, null, 'FS25VCIV', '100', null);

-- ----------------------------
-- Table structure for cy_user_coin
-- ----------------------------
DROP TABLE IF EXISTS `cy_user_coin`;
CREATE TABLE `cy_user_coin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL,
  `btc` decimal(20,8) unsigned NOT NULL,
  `btcd` decimal(20,8) unsigned NOT NULL,
  `btcb` varchar(200) NOT NULL,
  `ltc` decimal(20,8) unsigned NOT NULL,
  `ltcd` decimal(20,8) NOT NULL,
  `ltcb` varchar(200) NOT NULL,
  `eth` decimal(20,8) unsigned NOT NULL,
  `ethd` decimal(20,8) unsigned NOT NULL,
  `ethb` varchar(200) NOT NULL,
  `9dc` decimal(20,4) NOT NULL,
  `9dcd` decimal(20,4) NOT NULL,
  `9dcb` varchar(255) NOT NULL,
  `wkc` decimal(20,8) NOT NULL,
  `wkcd` decimal(20,8) NOT NULL,
  `wkcb` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='用户币种表';

-- ----------------------------
-- Records of cy_user_coin
-- ----------------------------
INSERT INTO `cy_user_coin` VALUES ('1', '1', '31.15231112', '0.10070000', '19X7rAQGhpYQTcLZfKNehudre2R1RLWG1R', '12.99000000', '0.00000000', 'LW5QhUST5ZQXmUuv5DGV8e4AtHh3vS63aw', '0.27080277', '0.00000000', '', '0.0000', '0.0000', '', '0.00000000', '0.00000000', '');
INSERT INTO `cy_user_coin` VALUES ('2', '2', '0.98889031', '0.00000000', '', '0.00000000', '0.00000000', '', '0.00000000', '0.00000000', '', '0.0000', '0.0000', '', '0.00000000', '0.00000000', '');
INSERT INTO `cy_user_coin` VALUES ('3', '3', '2.00000000', '0.00000000', '', '0.00000000', '0.00000000', '', '0.00000000', '0.00000000', '', '0.0000', '0.0000', '', '0.00000000', '0.00000000', '');
INSERT INTO `cy_user_coin` VALUES ('4', '4', '0.00000000', '0.00000000', '', '0.00000000', '0.00000000', '', '0.00000000', '0.00000000', '', '0.0000', '0.0000', '', '0.00000000', '0.00000000', '');
INSERT INTO `cy_user_coin` VALUES ('5', '6', '0.00000000', '0.00000000', '', '0.00000000', '0.00000000', '', '0.00000000', '0.00000000', '', '0.0000', '0.0000', '', '0.00000000', '0.00000000', '');
INSERT INTO `cy_user_coin` VALUES ('6', '7', '0.00000000', '0.00000000', '', '0.00000000', '0.00000000', '', '0.00000000', '0.00000000', '', '0.0000', '0.0000', '', '0.00000000', '0.00000000', '');
INSERT INTO `cy_user_coin` VALUES ('11', '12', '0.00000000', '0.00000000', '', '0.00000000', '0.00000000', '', '0.00000000', '0.00000000', '', '0.0000', '0.0000', '', '0.00000000', '0.00000000', '');
INSERT INTO `cy_user_coin` VALUES ('13', '13', '0.00000000', '0.00000000', '', '0.00000000', '0.00000000', '', '0.00000000', '0.00000000', '', '0.0000', '0.0000', '', '0.00000000', '0.00000000', '');
INSERT INTO `cy_user_coin` VALUES ('15', '0', '1.00000000', '0.00000000', '19thxBCjmXCMLEmiNnD8zSLCjWPDxeQWse', '0.00000000', '0.00000000', '', '0.00000000', '0.00000000', '', '0.0000', '0.0000', '', '0.00000000', '0.00000000', '');
INSERT INTO `cy_user_coin` VALUES ('16', '0', '1.00000000', '0.00000000', '', '0.00000000', '0.00000000', '19thxBCjmXCMLEmiNnD8zSLCjWPDxeQWse', '0.00000000', '0.00000000', '', '0.0000', '0.0000', '', '94.06350000', '-69.91350000', '');
INSERT INTO `cy_user_coin` VALUES ('17', '14', '0.00000000', '0.00000000', '17Wan8LqRqfR95ZfB3e69Wr2RN9hrCBDrK', '0.00000000', '0.00000000', 'LTYVJMGPpX5Bueyk8JCnnDTFoudk2EuYds', '0.00000000', '0.00000000', '', '0.0000', '0.0000', '', '12.00000000', '1.50000000', '');
INSERT INTO `cy_user_coin` VALUES ('18', '15', '5.00000000', '0.00000000', '15shsRw9vcGDn9QwYGtPNrAse6VDWK2Kby', '0.00000000', '0.00000000', '', '0.00000000', '0.00000000', '', '0.0000', '0.0000', '0x0000000000000000000000005', '0.00000000', '0.00000000', '');
INSERT INTO `cy_user_coin` VALUES ('19', '16', '0.89930000', '0.10070000', '1GWYyCkryGksxLVKqTfugjbic97Gr3mvV9', '0.00000000', '0.00000000', 'LfK9TzrwYSkkcv619B2dnbUunXmisydLE2', '0.00000000', '0.00000000', '', '49.6500', '0.0000', '0x0000000000000000000001', '17.53650000', '127.73850000', '');
INSERT INTO `cy_user_coin` VALUES ('21', '17', '1.94124892', '2.05875108', '163goPzSjzBN3oAW8aEjJWNAsM9Mme5Pn9', '1.00000000', '0.00000000', '', '0.00000000', '0.00000000', '', '47.4825', '2.5175', '0xdfasdfsadf65sa1f3dsfsdfdf', '0.00000000', '0.00000000', '');
INSERT INTO `cy_user_coin` VALUES ('22', '18', '0.00000000', '0.00000000', '', '0.00000000', '0.00000000', '', '0.00000000', '0.00000000', '', '1.0000', '0.0000', '', '0.00000000', '0.00000000', '');
INSERT INTO `cy_user_coin` VALUES ('24', '0', '0.00000000', '0.00000000', '', '0.00000000', '0.00000000', '', '0.00000000', '0.00000000', '', '0.3500', '0.0000', 'xxx', '0.00000000', '0.00000000', '');
INSERT INTO `cy_user_coin` VALUES ('25', '0', '0.00000000', '0.00000000', '', '0.00000000', '0.00000000', '', '0.00000000', '0.00000000', '', '0.0000', '0.0000', '', '1004.02161290', '0.00000000', '');
INSERT INTO `cy_user_coin` VALUES ('26', '20', '0.00000000', '0.00000000', '', '0.00000000', '0.00000000', '', '0.00000000', '0.00000000', '', '0.0000', '0.0000', '', '501.02640000', '0.00000000', '');
INSERT INTO `cy_user_coin` VALUES ('27', '23', '0.00000000', '0.00000000', '', '0.00000000', '0.00000000', '', '0.00000000', '0.00000000', '', '0.0000', '0.0000', '', '0.00000000', '0.00000000', '');
INSERT INTO `cy_user_coin` VALUES ('28', '24', '0.00000000', '0.00000000', '', '0.00000000', '0.00000000', '', '0.00000000', '0.00000000', '', '0.0000', '0.0000', '', '0.00000000', '0.00000000', '');
INSERT INTO `cy_user_coin` VALUES ('29', '27', '0.00000000', '0.00000000', '', '0.00000000', '0.00000000', '', '0.00000000', '0.00000000', '', '0.0000', '0.0000', '', '9932.86666666', '67.13333334', '');

-- ----------------------------
-- Table structure for cy_user_log
-- ----------------------------
DROP TABLE IF EXISTS `cy_user_log`;
CREATE TABLE `cy_user_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL,
  `addip` varchar(200) NOT NULL,
  `addtime` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=394 DEFAULT CHARSET=utf8 COMMENT='用户记录表';

-- ----------------------------
-- Records of cy_user_log
-- ----------------------------
INSERT INTO `cy_user_log` VALUES ('1', '1', '127.0.0.1', '1510136945', '1');
INSERT INTO `cy_user_log` VALUES ('2', '1', '127.0.0.1', '1510136967', '1');
INSERT INTO `cy_user_log` VALUES ('3', '1', '127.0.0.1', '1510137551', '1');
INSERT INTO `cy_user_log` VALUES ('4', '1', '127.0.0.1', '1510138083', '1');
INSERT INTO `cy_user_log` VALUES ('5', '1', '127.0.0.1', '1510138903', '1');
INSERT INTO `cy_user_log` VALUES ('6', '2', '127.0.0.1', '1510139054', '1');
INSERT INTO `cy_user_log` VALUES ('7', '1', '127.0.0.1', '1510206296', '1');
INSERT INTO `cy_user_log` VALUES ('8', '1', '127.0.0.1', '1510221030', '1');
INSERT INTO `cy_user_log` VALUES ('9', '1', '127.0.0.1', '1510231377', '1');
INSERT INTO `cy_user_log` VALUES ('10', '2', '127.0.0.1', '1510236935', '1');
INSERT INTO `cy_user_log` VALUES ('11', '1', '127.0.0.1', '1510236972', '1');
INSERT INTO `cy_user_log` VALUES ('12', '1', '127.0.0.1', '1510276234', '1');
INSERT INTO `cy_user_log` VALUES ('13', '1', '127.0.0.1', '1510276288', '1');
INSERT INTO `cy_user_log` VALUES ('14', '2', '127.0.0.1', '1510281089', '1');
INSERT INTO `cy_user_log` VALUES ('15', '1', '127.0.0.1', '1510626382', '1');
INSERT INTO `cy_user_log` VALUES ('16', '1', '127.0.0.1', '1510795427', '1');
INSERT INTO `cy_user_log` VALUES ('17', '2', '127.0.0.1', '1510828397', '1');
INSERT INTO `cy_user_log` VALUES ('18', '3', '127.0.0.1', '1510830136', '1');
INSERT INTO `cy_user_log` VALUES ('19', '2', '127.0.0.1', '1510830225', '1');
INSERT INTO `cy_user_log` VALUES ('20', '1', '127.0.0.1', '1510840949', '1');
INSERT INTO `cy_user_log` VALUES ('21', '1', '127.0.0.1', '1510879798', '1');
INSERT INTO `cy_user_log` VALUES ('22', '2', '127.0.0.1', '1510898148', '1');
INSERT INTO `cy_user_log` VALUES ('23', '2', '127.0.0.1', '1510899340', '1');
INSERT INTO `cy_user_log` VALUES ('24', '3', '127.0.0.1', '1510899369', '1');
INSERT INTO `cy_user_log` VALUES ('25', '1', '127.0.0.1', '1510912570', '1');
INSERT INTO `cy_user_log` VALUES ('26', '1', '127.0.0.1', '1510971465', '1');
INSERT INTO `cy_user_log` VALUES ('27', '1', '127.0.0.1', '1511140023', '1');
INSERT INTO `cy_user_log` VALUES ('28', '1', '127.0.0.1', '1511140068', '1');
INSERT INTO `cy_user_log` VALUES ('29', '1', '127.0.0.1', '1511145638', '1');
INSERT INTO `cy_user_log` VALUES ('30', '1', '127.0.0.1', '1511159374', '1');
INSERT INTO `cy_user_log` VALUES ('31', '1', '127.0.0.1', '1511161378', '1');
INSERT INTO `cy_user_log` VALUES ('32', '1', '127.0.0.1', '1511161379', '1');
INSERT INTO `cy_user_log` VALUES ('33', '1', '127.0.0.1', '1511177654', '1');
INSERT INTO `cy_user_log` VALUES ('34', '2', '127.0.0.1', '1511181857', '1');
INSERT INTO `cy_user_log` VALUES ('35', '1', '127.0.0.1', '1511227066', '1');
INSERT INTO `cy_user_log` VALUES ('36', '2', '127.0.0.1', '1511227084', '1');
INSERT INTO `cy_user_log` VALUES ('37', '1', '127.0.0.1', '1511252948', '1');
INSERT INTO `cy_user_log` VALUES ('38', '2', '127.0.0.1', '1511311710', '1');
INSERT INTO `cy_user_log` VALUES ('39', '1', '127.0.0.1', '1511311742', '1');
INSERT INTO `cy_user_log` VALUES ('40', '1', '192.168.1.109', '1511315456', '1');
INSERT INTO `cy_user_log` VALUES ('41', '2', '192.168.1.109', '1511315717', '1');
INSERT INTO `cy_user_log` VALUES ('42', '1', '127.0.0.1', '1511421620', '1');
INSERT INTO `cy_user_log` VALUES ('43', '1', '192.168.1.109', '1511421645', '1');
INSERT INTO `cy_user_log` VALUES ('44', '4', '192.168.1.109', '1511422221', '1');
INSERT INTO `cy_user_log` VALUES ('45', '1', '192.168.1.113', '1511422374', '1');
INSERT INTO `cy_user_log` VALUES ('46', '1', '192.168.1.109', '1511424028', '1');
INSERT INTO `cy_user_log` VALUES ('47', '1', '127.0.0.1', '1511487437', '1');
INSERT INTO `cy_user_log` VALUES ('48', '1', '127.0.0.1', '1511488541', '1');
INSERT INTO `cy_user_log` VALUES ('49', '4', '127.0.0.1', '1511489488', '1');
INSERT INTO `cy_user_log` VALUES ('50', '1', '192.168.1.113', '1511490635', '1');
INSERT INTO `cy_user_log` VALUES ('51', '1', '127.0.0.1', '1511575946', '1');
INSERT INTO `cy_user_log` VALUES ('52', '1', '127.0.0.1', '1511576600', '1');
INSERT INTO `cy_user_log` VALUES ('53', '1', '127.0.0.1', '1511576771', '1');
INSERT INTO `cy_user_log` VALUES ('54', '1', '127.0.0.1', '1511761596', '1');
INSERT INTO `cy_user_log` VALUES ('55', '1', '127.0.0.1', '1511762120', '1');
INSERT INTO `cy_user_log` VALUES ('56', '1', '127.0.0.1', '1511762133', '1');
INSERT INTO `cy_user_log` VALUES ('57', '1', '127.0.0.1', '1511762211', '1');
INSERT INTO `cy_user_log` VALUES ('58', '1', '127.0.0.1', '1511762221', '1');
INSERT INTO `cy_user_log` VALUES ('59', '1', '127.0.0.1', '1511763200', '1');
INSERT INTO `cy_user_log` VALUES ('60', '1', '127.0.0.1', '1511763462', '1');
INSERT INTO `cy_user_log` VALUES ('61', '1', '127.0.0.1', '1511763573', '1');
INSERT INTO `cy_user_log` VALUES ('62', '1', '127.0.0.1', '1511763594', '1');
INSERT INTO `cy_user_log` VALUES ('63', '1', '127.0.0.1', '1511763670', '1');
INSERT INTO `cy_user_log` VALUES ('64', '1', '127.0.0.1', '1511765014', '1');
INSERT INTO `cy_user_log` VALUES ('65', '1', '127.0.0.1', '1511765223', '1');
INSERT INTO `cy_user_log` VALUES ('66', '1', '127.0.0.1', '1511765248', '1');
INSERT INTO `cy_user_log` VALUES ('67', '1', '127.0.0.1', '1511765267', '1');
INSERT INTO `cy_user_log` VALUES ('68', '1', '127.0.0.1', '1511765500', '1');
INSERT INTO `cy_user_log` VALUES ('69', '1', '127.0.0.1', '1511765542', '1');
INSERT INTO `cy_user_log` VALUES ('70', '1', '127.0.0.1', '1511765652', '1');
INSERT INTO `cy_user_log` VALUES ('71', '1', '127.0.0.1', '1511765667', '1');
INSERT INTO `cy_user_log` VALUES ('72', '1', '127.0.0.1', '1511766581', '1');
INSERT INTO `cy_user_log` VALUES ('73', '1', '127.0.0.1', '1511766792', '1');
INSERT INTO `cy_user_log` VALUES ('74', '1', '127.0.0.1', '1511767111', '1');
INSERT INTO `cy_user_log` VALUES ('75', '1', '127.0.0.1', '1511767136', '1');
INSERT INTO `cy_user_log` VALUES ('76', '1', '127.0.0.1', '1511767252', '1');
INSERT INTO `cy_user_log` VALUES ('77', '1', '127.0.0.1', '1511767306', '1');
INSERT INTO `cy_user_log` VALUES ('78', '1', '127.0.0.1', '1511767425', '1');
INSERT INTO `cy_user_log` VALUES ('79', '1', '127.0.0.1', '1511768221', '1');
INSERT INTO `cy_user_log` VALUES ('80', '1', '127.0.0.1', '1511768548', '1');
INSERT INTO `cy_user_log` VALUES ('81', '1', '127.0.0.1', '1511768630', '1');
INSERT INTO `cy_user_log` VALUES ('82', '1', '127.0.0.1', '1511769640', '1');
INSERT INTO `cy_user_log` VALUES ('83', '1', '127.0.0.1', '1511769953', '1');
INSERT INTO `cy_user_log` VALUES ('84', '1', '127.0.0.1', '1511770390', '1');
INSERT INTO `cy_user_log` VALUES ('85', '1', '127.0.0.1', '1511770607', '1');
INSERT INTO `cy_user_log` VALUES ('86', '1', '127.0.0.1', '1511770826', '1');
INSERT INTO `cy_user_log` VALUES ('87', '1', '127.0.0.1', '1511770882', '1');
INSERT INTO `cy_user_log` VALUES ('88', '1', '127.0.0.1', '1511770934', '1');
INSERT INTO `cy_user_log` VALUES ('89', '1', '127.0.0.1', '1511770960', '1');
INSERT INTO `cy_user_log` VALUES ('90', '1', '127.0.0.1', '1511771025', '1');
INSERT INTO `cy_user_log` VALUES ('91', '1', '127.0.0.1', '1511771071', '1');
INSERT INTO `cy_user_log` VALUES ('92', '1', '127.0.0.1', '1511771123', '1');
INSERT INTO `cy_user_log` VALUES ('93', '1', '127.0.0.1', '1511771401', '1');
INSERT INTO `cy_user_log` VALUES ('94', '1', '127.0.0.1', '1511771435', '1');
INSERT INTO `cy_user_log` VALUES ('95', '1', '127.0.0.1', '1511771709', '1');
INSERT INTO `cy_user_log` VALUES ('96', '1', '127.0.0.1', '1511771741', '1');
INSERT INTO `cy_user_log` VALUES ('97', '1', '127.0.0.1', '1511771803', '1');
INSERT INTO `cy_user_log` VALUES ('98', '1', '127.0.0.1', '1511771930', '1');
INSERT INTO `cy_user_log` VALUES ('99', '1', '127.0.0.1', '1511771970', '1');
INSERT INTO `cy_user_log` VALUES ('100', '1', '127.0.0.1', '1511772017', '1');
INSERT INTO `cy_user_log` VALUES ('101', '1', '127.0.0.1', '1511772059', '1');
INSERT INTO `cy_user_log` VALUES ('102', '1', '127.0.0.1', '1511772110', '1');
INSERT INTO `cy_user_log` VALUES ('103', '1', '127.0.0.1', '1511772153', '1');
INSERT INTO `cy_user_log` VALUES ('104', '1', '127.0.0.1', '1511772190', '1');
INSERT INTO `cy_user_log` VALUES ('105', '1', '127.0.0.1', '1511772354', '1');
INSERT INTO `cy_user_log` VALUES ('106', '1', '127.0.0.1', '1511772548', '1');
INSERT INTO `cy_user_log` VALUES ('107', '1', '127.0.0.1', '1511772611', '1');
INSERT INTO `cy_user_log` VALUES ('108', '1', '127.0.0.1', '1511772643', '1');
INSERT INTO `cy_user_log` VALUES ('109', '1', '127.0.0.1', '1511772844', '1');
INSERT INTO `cy_user_log` VALUES ('110', '1', '127.0.0.1', '1511772883', '1');
INSERT INTO `cy_user_log` VALUES ('111', '4', '192.168.1.109', '1511773404', '1');
INSERT INTO `cy_user_log` VALUES ('112', '4', '192.168.1.109', '1511773413', '1');
INSERT INTO `cy_user_log` VALUES ('113', '4', '192.168.1.109', '1511773418', '1');
INSERT INTO `cy_user_log` VALUES ('114', '4', '192.168.1.109', '1511773464', '1');
INSERT INTO `cy_user_log` VALUES ('115', '1', '127.0.0.1', '1511830368', '1');
INSERT INTO `cy_user_log` VALUES ('116', '1', '127.0.0.1', '1511836237', '1');
INSERT INTO `cy_user_log` VALUES ('117', '4', '192.168.1.109', '1511836308', '1');
INSERT INTO `cy_user_log` VALUES ('118', '4', '192.168.1.109', '1511840110', '1');
INSERT INTO `cy_user_log` VALUES ('119', '4', '192.168.1.109', '1511857926', '1');
INSERT INTO `cy_user_log` VALUES ('120', '2', '127.0.0.1', '1511859811', '1');
INSERT INTO `cy_user_log` VALUES ('121', '4', '127.0.0.1', '1511863713', '1');
INSERT INTO `cy_user_log` VALUES ('122', '2', '127.0.0.1', '1511873859', '1');
INSERT INTO `cy_user_log` VALUES ('123', '4', '127.0.0.1', '1511874306', '1');
INSERT INTO `cy_user_log` VALUES ('124', '4', '127.0.0.1', '1511874341', '1');
INSERT INTO `cy_user_log` VALUES ('125', '1', '127.0.0.1', '1511914377', '1');
INSERT INTO `cy_user_log` VALUES ('126', '2', '127.0.0.1', '1511914695', '1');
INSERT INTO `cy_user_log` VALUES ('127', '4', '127.0.0.1', '1511914983', '1');
INSERT INTO `cy_user_log` VALUES ('128', '4', '127.0.0.1', '1511915008', '1');
INSERT INTO `cy_user_log` VALUES ('129', '4', '127.0.0.1', '1511915772', '1');
INSERT INTO `cy_user_log` VALUES ('130', '1', '127.0.0.1', '1511916853', '1');
INSERT INTO `cy_user_log` VALUES ('131', '1', '127.0.0.1', '1511920084', '1');
INSERT INTO `cy_user_log` VALUES ('132', '1', '127.0.0.1', '1511926897', '1');
INSERT INTO `cy_user_log` VALUES ('133', '4', '127.0.0.1', '1511926906', '1');
INSERT INTO `cy_user_log` VALUES ('134', '1', '127.0.0.1', '1511927056', '1');
INSERT INTO `cy_user_log` VALUES ('135', '1', '127.0.0.1', '1511927319', '1');
INSERT INTO `cy_user_log` VALUES ('136', '4', '127.0.0.1', '1511927333', '1');
INSERT INTO `cy_user_log` VALUES ('137', '1', '127.0.0.1', '1511958125', '1');
INSERT INTO `cy_user_log` VALUES ('138', '1', '127.0.0.1', '1512007240', '1');
INSERT INTO `cy_user_log` VALUES ('139', '2', '127.0.0.1', '1512008807', '1');
INSERT INTO `cy_user_log` VALUES ('140', '4', '127.0.0.1', '1512009063', '1');
INSERT INTO `cy_user_log` VALUES ('141', '4', '127.0.0.1', '1512009782', '1');
INSERT INTO `cy_user_log` VALUES ('142', '4', '127.0.0.1', '1512009852', '1');
INSERT INTO `cy_user_log` VALUES ('143', '2', '127.0.0.1', '1512009940', '1');
INSERT INTO `cy_user_log` VALUES ('144', '4', '127.0.0.1', '1512030355', '1');
INSERT INTO `cy_user_log` VALUES ('145', '1', '127.0.0.1', '1512035289', '1');
INSERT INTO `cy_user_log` VALUES ('146', '1', '127.0.0.1', '1512097887', '1');
INSERT INTO `cy_user_log` VALUES ('147', '6', '127.0.0.1', '1512098272', '1');
INSERT INTO `cy_user_log` VALUES ('148', '6', '127.0.0.1', '1512098327', '1');
INSERT INTO `cy_user_log` VALUES ('149', '6', '127.0.0.1', '1512098416', '1');
INSERT INTO `cy_user_log` VALUES ('150', '6', '127.0.0.1', '1512098509', '1');
INSERT INTO `cy_user_log` VALUES ('151', '6', '127.0.0.1', '1512098603', '1');
INSERT INTO `cy_user_log` VALUES ('152', '7', '127.0.0.1', '1512098838', '1');
INSERT INTO `cy_user_log` VALUES ('153', '1', '127.0.0.1', '1512098956', '1');
INSERT INTO `cy_user_log` VALUES ('154', '4', '127.0.0.1', '1512180359', '1');
INSERT INTO `cy_user_log` VALUES ('155', '1', '127.0.0.1', '1512201333', '1');
INSERT INTO `cy_user_log` VALUES ('156', '4', '127.0.0.1', '1512201347', '1');
INSERT INTO `cy_user_log` VALUES ('157', '1', '127.0.0.1', '1512201390', '1');
INSERT INTO `cy_user_log` VALUES ('158', '4', '127.0.0.1', '1512201399', '1');
INSERT INTO `cy_user_log` VALUES ('159', '1', '127.0.0.1', '1512201576', '1');
INSERT INTO `cy_user_log` VALUES ('160', '4', '127.0.0.1', '1512201586', '1');
INSERT INTO `cy_user_log` VALUES ('161', '4', '127.0.0.1', '1512201594', '1');
INSERT INTO `cy_user_log` VALUES ('162', '4', '127.0.0.1', '1512201619', '1');
INSERT INTO `cy_user_log` VALUES ('163', '4', '127.0.0.1', '1512201753', '1');
INSERT INTO `cy_user_log` VALUES ('164', '4', '127.0.0.1', '1512201755', '1');
INSERT INTO `cy_user_log` VALUES ('165', '4', '127.0.0.1', '1512201768', '1');
INSERT INTO `cy_user_log` VALUES ('166', '4', '127.0.0.1', '1512201769', '1');
INSERT INTO `cy_user_log` VALUES ('167', '4', '127.0.0.1', '1512201835', '1');
INSERT INTO `cy_user_log` VALUES ('168', '4', '127.0.0.1', '1512201837', '1');
INSERT INTO `cy_user_log` VALUES ('169', '4', '127.0.0.1', '1512201849', '1');
INSERT INTO `cy_user_log` VALUES ('170', '4', '127.0.0.1', '1512201908', '1');
INSERT INTO `cy_user_log` VALUES ('171', '4', '127.0.0.1', '1512201947', '1');
INSERT INTO `cy_user_log` VALUES ('172', '4', '127.0.0.1', '1512201951', '1');
INSERT INTO `cy_user_log` VALUES ('173', '4', '127.0.0.1', '1512202055', '1');
INSERT INTO `cy_user_log` VALUES ('174', '4', '127.0.0.1', '1512202057', '1');
INSERT INTO `cy_user_log` VALUES ('175', '4', '127.0.0.1', '1512202060', '1');
INSERT INTO `cy_user_log` VALUES ('176', '4', '127.0.0.1', '1512202063', '1');
INSERT INTO `cy_user_log` VALUES ('177', '4', '127.0.0.1', '1512202081', '1');
INSERT INTO `cy_user_log` VALUES ('178', '4', '127.0.0.1', '1512202084', '1');
INSERT INTO `cy_user_log` VALUES ('179', '4', '127.0.0.1', '1512202303', '1');
INSERT INTO `cy_user_log` VALUES ('180', '4', '127.0.0.1', '1512202306', '1');
INSERT INTO `cy_user_log` VALUES ('181', '1', '127.0.0.1', '1512202544', '1');
INSERT INTO `cy_user_log` VALUES ('182', '4', '127.0.0.1', '1512202553', '1');
INSERT INTO `cy_user_log` VALUES ('183', '4', '127.0.0.1', '1512202624', '1');
INSERT INTO `cy_user_log` VALUES ('184', '4', '127.0.0.1', '1512202791', '1');
INSERT INTO `cy_user_log` VALUES ('185', '4', '127.0.0.1', '1512202795', '1');
INSERT INTO `cy_user_log` VALUES ('186', '4', '127.0.0.1', '1512202797', '1');
INSERT INTO `cy_user_log` VALUES ('187', '4', '127.0.0.1', '1512202810', '1');
INSERT INTO `cy_user_log` VALUES ('188', '4', '127.0.0.1', '1512202841', '1');
INSERT INTO `cy_user_log` VALUES ('189', '4', '127.0.0.1', '1512202851', '1');
INSERT INTO `cy_user_log` VALUES ('190', '4', '127.0.0.1', '1512202857', '1');
INSERT INTO `cy_user_log` VALUES ('191', '4', '127.0.0.1', '1512202872', '1');
INSERT INTO `cy_user_log` VALUES ('192', '4', '127.0.0.1', '1512202933', '1');
INSERT INTO `cy_user_log` VALUES ('193', '4', '127.0.0.1', '1512202950', '1');
INSERT INTO `cy_user_log` VALUES ('194', '4', '127.0.0.1', '1512202971', '1');
INSERT INTO `cy_user_log` VALUES ('195', '4', '127.0.0.1', '1512202986', '1');
INSERT INTO `cy_user_log` VALUES ('196', '4', '127.0.0.1', '1512203001', '1');
INSERT INTO `cy_user_log` VALUES ('197', '4', '127.0.0.1', '1512203031', '1');
INSERT INTO `cy_user_log` VALUES ('198', '4', '127.0.0.1', '1512203049', '1');
INSERT INTO `cy_user_log` VALUES ('199', '4', '127.0.0.1', '1512203148', '1');
INSERT INTO `cy_user_log` VALUES ('200', '4', '127.0.0.1', '1512203627', '1');
INSERT INTO `cy_user_log` VALUES ('201', '4', '127.0.0.1', '1512203679', '1');
INSERT INTO `cy_user_log` VALUES ('202', '4', '127.0.0.1', '1512203740', '1');
INSERT INTO `cy_user_log` VALUES ('203', '4', '127.0.0.1', '1512203746', '1');
INSERT INTO `cy_user_log` VALUES ('204', '4', '127.0.0.1', '1512203841', '1');
INSERT INTO `cy_user_log` VALUES ('205', '4', '127.0.0.1', '1512204213', '1');
INSERT INTO `cy_user_log` VALUES ('206', '4', '127.0.0.1', '1512204335', '1');
INSERT INTO `cy_user_log` VALUES ('207', '4', '127.0.0.1', '1512204420', '1');
INSERT INTO `cy_user_log` VALUES ('208', '4', '127.0.0.1', '1512204954', '1');
INSERT INTO `cy_user_log` VALUES ('209', '1', '127.0.0.1', '1512210421', '1');
INSERT INTO `cy_user_log` VALUES ('210', '4', '127.0.0.1', '1512210941', '1');
INSERT INTO `cy_user_log` VALUES ('211', '4', '127.0.0.1', '1512289794', '1');
INSERT INTO `cy_user_log` VALUES ('212', '4', '127.0.0.1', '1512289805', '1');
INSERT INTO `cy_user_log` VALUES ('213', '1', '127.0.0.1', '1512291254', '1');
INSERT INTO `cy_user_log` VALUES ('214', '1', '127.0.0.1', '1512313059', '1');
INSERT INTO `cy_user_log` VALUES ('215', '1', '127.0.0.1', '1512346665', '1');
INSERT INTO `cy_user_log` VALUES ('216', '1', '127.0.0.1', '1512347182', '1');
INSERT INTO `cy_user_log` VALUES ('217', '4', '127.0.0.1', '1512355690', '1');
INSERT INTO `cy_user_log` VALUES ('218', '4', '127.0.0.1', '1512355884', '1');
INSERT INTO `cy_user_log` VALUES ('219', '4', '127.0.0.1', '1512356047', '1');
INSERT INTO `cy_user_log` VALUES ('220', '4', '127.0.0.1', '1512356118', '1');
INSERT INTO `cy_user_log` VALUES ('221', '4', '127.0.0.1', '1512357453', '1');
INSERT INTO `cy_user_log` VALUES ('222', '4', '127.0.0.1', '1512366410', '1');
INSERT INTO `cy_user_log` VALUES ('223', '1', '127.0.0.1', '1512367030', '1');
INSERT INTO `cy_user_log` VALUES ('224', '1', '127.0.0.1', '1512367145', '1');
INSERT INTO `cy_user_log` VALUES ('225', '1', '127.0.0.1', '1512368419', '1');
INSERT INTO `cy_user_log` VALUES ('226', '4', '127.0.0.1', '1512377236', '1');
INSERT INTO `cy_user_log` VALUES ('227', '12', '127.0.0.1', '1512377314', '1');
INSERT INTO `cy_user_log` VALUES ('228', '12', '127.0.0.1', '1512377354', '1');
INSERT INTO `cy_user_log` VALUES ('229', '12', '127.0.0.1', '1512377398', '1');
INSERT INTO `cy_user_log` VALUES ('230', '1', '127.0.0.1', '1512378537', '1');
INSERT INTO `cy_user_log` VALUES ('231', '12', '127.0.0.1', '1512378804', '1');
INSERT INTO `cy_user_log` VALUES ('232', '6', '127.0.0.1', '1512380543', '1');
INSERT INTO `cy_user_log` VALUES ('233', '1', '127.0.0.1', '1512436290', '1');
INSERT INTO `cy_user_log` VALUES ('234', '1', '127.0.0.1', '1512615144', '1');
INSERT INTO `cy_user_log` VALUES ('235', '1', '127.0.0.1', '1512616564', '1');
INSERT INTO `cy_user_log` VALUES ('236', '1', '127.0.0.1', '1512521920', '1');
INSERT INTO `cy_user_log` VALUES ('237', '1', '127.0.0.1', '1512522882', '1');
INSERT INTO `cy_user_log` VALUES ('238', '4', '127.0.0.1', '1512525651', '1');
INSERT INTO `cy_user_log` VALUES ('239', '2', '127.0.0.1', '1512526089', '1');
INSERT INTO `cy_user_log` VALUES ('240', '2', '127.0.0.1', '1512526089', '1');
INSERT INTO `cy_user_log` VALUES ('241', '6', '127.0.0.1', '1512526342', '1');
INSERT INTO `cy_user_log` VALUES ('242', '12', '127.0.0.1', '1512526516', '1');
INSERT INTO `cy_user_log` VALUES ('243', '6', '127.0.0.1', '1512527232', '1');
INSERT INTO `cy_user_log` VALUES ('244', '4', '127.0.0.1', '1512528156', '1');
INSERT INTO `cy_user_log` VALUES ('245', '1', '127.0.0.1', '1512533217', '1');
INSERT INTO `cy_user_log` VALUES ('246', '1', '127.0.0.1', '1512552637', '1');
INSERT INTO `cy_user_log` VALUES ('247', '1', '127.0.0.1', '1512552808', '1');
INSERT INTO `cy_user_log` VALUES ('248', '1', '127.0.0.1', '1512553215', '1');
INSERT INTO `cy_user_log` VALUES ('249', '7', '127.0.0.1', '1512809091', '1');
INSERT INTO `cy_user_log` VALUES ('250', '4', '127.0.0.1', '1512809531', '1');
INSERT INTO `cy_user_log` VALUES ('251', '4', '127.0.0.1', '1512819872', '1');
INSERT INTO `cy_user_log` VALUES ('252', '1', '127.0.0.1', '1513136271', '1');
INSERT INTO `cy_user_log` VALUES ('253', '4', '127.0.0.1', '1513137009', '1');
INSERT INTO `cy_user_log` VALUES ('254', '7', '127.0.0.1', '1513154583', '1');
INSERT INTO `cy_user_log` VALUES ('255', '1', '127.0.0.1', '1513164422', '1');
INSERT INTO `cy_user_log` VALUES ('256', '1', '127.0.0.1', '1513217818', '1');
INSERT INTO `cy_user_log` VALUES ('257', '6', '127.0.0.1', '1513218933', '1');
INSERT INTO `cy_user_log` VALUES ('258', '1', '127.0.0.1', '1513218962', '1');
INSERT INTO `cy_user_log` VALUES ('259', '6', '127.0.0.1', '1513220175', '1');
INSERT INTO `cy_user_log` VALUES ('260', '1', '127.0.0.1', '1513259128', '1');
INSERT INTO `cy_user_log` VALUES ('261', '4', '127.0.0.1', '1513260235', '1');
INSERT INTO `cy_user_log` VALUES ('262', '1', '127.0.0.1', '1513260287', '1');
INSERT INTO `cy_user_log` VALUES ('263', '1', '127.0.0.1', '1513261377', '1');
INSERT INTO `cy_user_log` VALUES ('264', '4', '127.0.0.1', '1513261405', '1');
INSERT INTO `cy_user_log` VALUES ('265', '1', '127.0.0.1', '1513265722', '1');
INSERT INTO `cy_user_log` VALUES ('266', '1', '127.0.0.1', '1513265755', '1');
INSERT INTO `cy_user_log` VALUES ('267', '1', '127.0.0.1', '1513265779', '1');
INSERT INTO `cy_user_log` VALUES ('268', '1', '127.0.0.1', '1513265828', '1');
INSERT INTO `cy_user_log` VALUES ('269', '1', '127.0.0.1', '1513297270', '1');
INSERT INTO `cy_user_log` VALUES ('270', '4', '127.0.0.1', '1513299310', '1');
INSERT INTO `cy_user_log` VALUES ('271', '4', '192.168.1.109', '1513306935', '1');
INSERT INTO `cy_user_log` VALUES ('272', '4', '192.168.1.109', '1513307158', '1');
INSERT INTO `cy_user_log` VALUES ('273', '4', '127.0.0.1', '1513307275', '1');
INSERT INTO `cy_user_log` VALUES ('274', '4', '127.0.0.1', '1513307406', '1');
INSERT INTO `cy_user_log` VALUES ('275', '1', '192.168.1.109', '1513307420', '1');
INSERT INTO `cy_user_log` VALUES ('276', '1', '127.0.0.1', '1513924109', '1');
INSERT INTO `cy_user_log` VALUES ('277', '1', '127.0.0.1', '1513924133', '1');
INSERT INTO `cy_user_log` VALUES ('278', '1', '127.0.0.1', '1513924288', '1');
INSERT INTO `cy_user_log` VALUES ('279', '1', '127.0.0.1', '1513925574', '1');
INSERT INTO `cy_user_log` VALUES ('280', '1', '127.0.0.1', '1513932015', '1');
INSERT INTO `cy_user_log` VALUES ('281', '1', '127.0.0.1', '1513932016', '1');
INSERT INTO `cy_user_log` VALUES ('282', '1', '127.0.0.1', '1513932016', '1');
INSERT INTO `cy_user_log` VALUES ('283', '1', '127.0.0.1', '1513932016', '1');
INSERT INTO `cy_user_log` VALUES ('284', '1', '127.0.0.1', '1513932016', '1');
INSERT INTO `cy_user_log` VALUES ('285', '1', '127.0.0.1', '1513932017', '1');
INSERT INTO `cy_user_log` VALUES ('286', '13', '127.0.0.1', '1514010868', '1');
INSERT INTO `cy_user_log` VALUES ('287', '13', '127.0.0.1', '1514010869', '1');
INSERT INTO `cy_user_log` VALUES ('288', '13', '127.0.0.1', '1514012410', '1');
INSERT INTO `cy_user_log` VALUES ('289', '1', '127.0.0.1', '1514171232', '1');
INSERT INTO `cy_user_log` VALUES ('290', '1', '127.0.0.1', '1514182769', '1');
INSERT INTO `cy_user_log` VALUES ('291', '1', '127.0.0.1', '1514462569', '1');
INSERT INTO `cy_user_log` VALUES ('292', '1', '127.0.0.1', '1514462743', '1');
INSERT INTO `cy_user_log` VALUES ('293', '13', '127.0.0.1', '1514467146', '1');
INSERT INTO `cy_user_log` VALUES ('294', '1', '127.0.0.1', '1514467238', '1');
INSERT INTO `cy_user_log` VALUES ('295', '1', '127.0.0.1', '1514511396', '1');
INSERT INTO `cy_user_log` VALUES ('296', '1', '127.0.0.1', '1514526286', '1');
INSERT INTO `cy_user_log` VALUES ('297', '1', '192.168.1.113', '1514526726', '1');
INSERT INTO `cy_user_log` VALUES ('298', '1', '192.168.1.113', '1514529864', '1');
INSERT INTO `cy_user_log` VALUES ('299', '1', '127.0.0.1', '1514531037', '1');
INSERT INTO `cy_user_log` VALUES ('300', '4', '127.0.0.1', '1514532355', '1');
INSERT INTO `cy_user_log` VALUES ('301', '1', '127.0.0.1', '1514537690', '1');
INSERT INTO `cy_user_log` VALUES ('302', '14', '192.168.2.110', '1515993923', '1');
INSERT INTO `cy_user_log` VALUES ('303', '15', '192.168.2.104', '1515996482', '1');
INSERT INTO `cy_user_log` VALUES ('304', '14', '192.168.2.2', '1516781163', '1');
INSERT INTO `cy_user_log` VALUES ('305', '16', '192.168.2.2', '1516783808', '1');
INSERT INTO `cy_user_log` VALUES ('306', '17', '192.168.2.2', '1516785532', '1');
INSERT INTO `cy_user_log` VALUES ('307', '13', '192.168.2.2', '1516795275', '1');
INSERT INTO `cy_user_log` VALUES ('308', '18', '192.168.2.153', '1516849810', '1');
INSERT INTO `cy_user_log` VALUES ('309', '16', '192.168.2.153', '1516849875', '1');
INSERT INTO `cy_user_log` VALUES ('310', '16', '192.168.2.153', '1516850425', '1');
INSERT INTO `cy_user_log` VALUES ('311', '16', '192.168.2.2', '1516850552', '1');
INSERT INTO `cy_user_log` VALUES ('312', '16', '192.168.2.153', '1516851887', '1');
INSERT INTO `cy_user_log` VALUES ('313', '16', '192.168.2.153', '1516860684', '1');
INSERT INTO `cy_user_log` VALUES ('314', '17', '192.168.2.2', '1516867048', '1');
INSERT INTO `cy_user_log` VALUES ('315', '16', '192.168.2.2', '1516871094', '1');
INSERT INTO `cy_user_log` VALUES ('316', '16', '192.168.2.153', '1516871321', '1');
INSERT INTO `cy_user_log` VALUES ('317', '16', '192.168.2.153', '1516878334', '1');
INSERT INTO `cy_user_log` VALUES ('318', '15', '192.168.2.102', '1516878457', '1');
INSERT INTO `cy_user_log` VALUES ('319', '16', '192.168.2.2', '1516880775', '1');
INSERT INTO `cy_user_log` VALUES ('320', '19', '192.168.2.111', '1516882353', '1');
INSERT INTO `cy_user_log` VALUES ('321', '19', '192.168.2.111', '1516882389', '1');
INSERT INTO `cy_user_log` VALUES ('322', '16', '192.168.2.153', '1516884028', '1');
INSERT INTO `cy_user_log` VALUES ('323', '18', '192.168.2.153', '1516933919', '1');
INSERT INTO `cy_user_log` VALUES ('324', '16', '192.168.2.153', '1516933990', '1');
INSERT INTO `cy_user_log` VALUES ('325', '16', '192.168.2.2', '1516936239', '1');
INSERT INTO `cy_user_log` VALUES ('326', '16', '192.168.2.2', '1516936783', '1');
INSERT INTO `cy_user_log` VALUES ('327', '16', '127.0.0.1', '1516939039', '1');
INSERT INTO `cy_user_log` VALUES ('328', '15', '192.168.2.102', '1516952086', '1');
INSERT INTO `cy_user_log` VALUES ('329', '15', '192.168.2.102', '1516959942', '1');
INSERT INTO `cy_user_log` VALUES ('330', '17', '192.168.2.2', '1516965572', '1');
INSERT INTO `cy_user_log` VALUES ('331', '19', '192.168.2.111', '1516969706', '1');
INSERT INTO `cy_user_log` VALUES ('332', '15', '192.168.2.102', '1516977717', '1');
INSERT INTO `cy_user_log` VALUES ('333', '16', '192.168.2.2', '1517119553', '1');
INSERT INTO `cy_user_log` VALUES ('334', '19', '192.168.2.111', '1517140607', '1');
INSERT INTO `cy_user_log` VALUES ('335', '19', '192.168.2.111', '1517140608', '1');
INSERT INTO `cy_user_log` VALUES ('336', '16', '192.168.2.2', '1517269194', '1');
INSERT INTO `cy_user_log` VALUES ('337', '16', '192.168.11.225', '1520237188', '1');
INSERT INTO `cy_user_log` VALUES ('338', '16', '192.168.11.225', '1520237537', '1');
INSERT INTO `cy_user_log` VALUES ('339', '17', '192.168.11.225', '1520238477', '1');
INSERT INTO `cy_user_log` VALUES ('340', '16', '220.166.28.144', '1520318322', '1');
INSERT INTO `cy_user_log` VALUES ('341', '16', '118.123.37.70', '1520900659', '1');
INSERT INTO `cy_user_log` VALUES ('342', '16', '118.123.37.70', '1520929369', '1');
INSERT INTO `cy_user_log` VALUES ('343', '16', '118.123.37.70', '1521010169', '1');
INSERT INTO `cy_user_log` VALUES ('344', '15', '107.151.137.219', '1521078607', '1');
INSERT INTO `cy_user_log` VALUES ('345', '16', '118.123.37.70', '1521098715', '1');
INSERT INTO `cy_user_log` VALUES ('346', '15', '107.151.137.219', '1521104690', '1');
INSERT INTO `cy_user_log` VALUES ('347', '16', '118.123.37.70', '1521110797', '1');
INSERT INTO `cy_user_log` VALUES ('348', '15', '107.151.137.219', '1521164748', '1');
INSERT INTO `cy_user_log` VALUES ('349', '16', '118.123.37.70', '1521181124', '1');
INSERT INTO `cy_user_log` VALUES ('350', '16', '118.123.37.70', '1521250122', '1');
INSERT INTO `cy_user_log` VALUES ('351', '15', '107.151.137.219', '1521274792', '1');
INSERT INTO `cy_user_log` VALUES ('352', '16', '118.123.37.70', '1521424535', '1');
INSERT INTO `cy_user_log` VALUES ('353', '20', '218.19.113.30', '1522745982', '1');
INSERT INTO `cy_user_log` VALUES ('354', '20', '192.168.153.1', '1522920846', '1');
INSERT INTO `cy_user_log` VALUES ('355', '20', '192.168.153.1', '1522928775', '1');
INSERT INTO `cy_user_log` VALUES ('356', '20', '192.168.153.1', '1522944460', '1');
INSERT INTO `cy_user_log` VALUES ('357', '20', '192.168.153.1', '1522944628', '1');
INSERT INTO `cy_user_log` VALUES ('358', '20', '192.168.153.1', '1522944990', '1');
INSERT INTO `cy_user_log` VALUES ('359', '16', '192.168.153.1', '1522947597', '1');
INSERT INTO `cy_user_log` VALUES ('360', '16', '192.168.153.1', '1522948016', '1');
INSERT INTO `cy_user_log` VALUES ('361', '20', '192.168.153.1', '1522949571', '1');
INSERT INTO `cy_user_log` VALUES ('362', '16', '192.168.153.1', '1522949714', '1');
INSERT INTO `cy_user_log` VALUES ('363', '20', '192.168.153.1', '1522950090', '1');
INSERT INTO `cy_user_log` VALUES ('364', '16', '192.168.153.1', '1522950613', '1');
INSERT INTO `cy_user_log` VALUES ('365', '20', '192.168.153.1', '1522953403', '1');
INSERT INTO `cy_user_log` VALUES ('366', '20', '192.168.153.1', '1522960532', '1');
INSERT INTO `cy_user_log` VALUES ('367', '20', '192.168.153.1', '1522960757', '1');
INSERT INTO `cy_user_log` VALUES ('368', '20', '192.168.153.1', '1522966325', '1');
INSERT INTO `cy_user_log` VALUES ('369', '27', '192.168.153.1', '1522986470', '1');
INSERT INTO `cy_user_log` VALUES ('370', '16', '192.168.153.1', '1522986738', '1');
INSERT INTO `cy_user_log` VALUES ('371', '20', '192.168.153.1', '1522987039', '1');
INSERT INTO `cy_user_log` VALUES ('372', '16', '192.168.153.1', '1522988260', '1');
INSERT INTO `cy_user_log` VALUES ('373', '20', '192.168.153.1', '1522988482', '1');
INSERT INTO `cy_user_log` VALUES ('374', '20', '192.168.153.1', '1523008747', '1');
INSERT INTO `cy_user_log` VALUES ('375', '27', '192.168.153.1', '1523012241', '1');
INSERT INTO `cy_user_log` VALUES ('376', '20', '192.168.153.1', '1523672650', '1');
INSERT INTO `cy_user_log` VALUES ('377', '27', '192.168.153.1', '1523673316', '1');
INSERT INTO `cy_user_log` VALUES ('378', '20', '192.168.153.1', '1523745304', '1');
INSERT INTO `cy_user_log` VALUES ('379', '27', '192.168.153.1', '1523954849', '1');
INSERT INTO `cy_user_log` VALUES ('380', '27', '192.168.153.1', '1523969738', '1');
INSERT INTO `cy_user_log` VALUES ('381', '20', '192.168.153.1', '1523969787', '1');
INSERT INTO `cy_user_log` VALUES ('382', '27', '192.168.153.1', '1523971214', '1');
INSERT INTO `cy_user_log` VALUES ('383', '20', '192.168.153.1', '1523971279', '1');
INSERT INTO `cy_user_log` VALUES ('384', '27', '192.168.153.1', '1523975881', '1');
INSERT INTO `cy_user_log` VALUES ('385', '20', '192.168.153.1', '1523989210', '1');
INSERT INTO `cy_user_log` VALUES ('386', '27', '192.168.153.1', '1523989263', '1');
INSERT INTO `cy_user_log` VALUES ('387', '27', '192.168.153.1', '1524012120', '1');
INSERT INTO `cy_user_log` VALUES ('388', '20', '192.168.153.1', '1524035820', '1');
INSERT INTO `cy_user_log` VALUES ('389', '20', '192.168.153.1', '1524036153', '1');
INSERT INTO `cy_user_log` VALUES ('390', '20', '192.168.153.1', '1524046539', '1');
INSERT INTO `cy_user_log` VALUES ('391', '20', '192.168.153.1', '1524139453', '1');
INSERT INTO `cy_user_log` VALUES ('392', '27', '192.168.153.1', '1524142288', '1');
INSERT INTO `cy_user_log` VALUES ('393', '20', '192.168.153.1', '1524146970', '1');

-- ----------------------------
-- Table structure for cy_user_shopaddr
-- ----------------------------
DROP TABLE IF EXISTS `cy_user_shopaddr`;
CREATE TABLE `cy_user_shopaddr` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) unsigned NOT NULL DEFAULT '0',
  `truename` varchar(200) NOT NULL DEFAULT '0',
  `moble` varchar(500) NOT NULL,
  `name` varchar(500) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cy_user_shopaddr
-- ----------------------------

-- ----------------------------
-- Table structure for cy_version
-- ----------------------------
DROP TABLE IF EXISTS `cy_version`;
CREATE TABLE `cy_version` (
  `name` varchar(50) NOT NULL COMMENT '版本号',
  `number` int(11) NOT NULL COMMENT '序列号，一般用日期数字标示',
  `title` varchar(50) NOT NULL COMMENT '版本名',
  `create_time` int(11) NOT NULL COMMENT '发布时间',
  `update_time` int(11) NOT NULL COMMENT '更新的时间',
  `log` text NOT NULL COMMENT '更新日志',
  `url` varchar(150) NOT NULL COMMENT '链接到的远程文章',
  `is_current` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`name`),
  KEY `id` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='自动更新表';

-- ----------------------------
-- Records of cy_version
-- ----------------------------
INSERT INTO `cy_version` VALUES ('2.3.7', '10015', '修复更新', '1466394377', '0', '修复首页下拉导航条显示bug\r\n修复交易界面导航条下拉bug', 'http://101.201.199.224/Update/download/2.3.7.zip', '0', '0');
INSERT INTO `cy_version` VALUES ('2.3.8', '10016', '更新权限', '1467096687', '0', '更新权限部分（还未完善）', 'http://101.201.199.224/Update/download/2.3.8.zip', '0', '0');
INSERT INTO `cy_version` VALUES ('2.3.9', '10017', '更新后台内容管理', '1467105573', '0', '更新后台内容管理', 'http://101.201.199.224/Update/download/2.3.9.zip', '0', '0');
INSERT INTO `cy_version` VALUES ('2.4.0', '10018', '更新后台用户管理部分', '1467111754', '0', '更新后台用户管理部分', 'http://101.201.199.224/Update/download/2.4.0.zip', '0', '0');
INSERT INTO `cy_version` VALUES ('2.4.1', '10019', '优化扩展功能', '1467119925', '0', '优化扩展功能', 'http://101.201.199.224/Update/download/2.4.1.zip', '0', '0');
INSERT INTO `cy_version` VALUES ('2.4.2', '10020', '优化后台用户编辑', '1467185261', '0', '优化后台用户编辑', 'http://101.201.199.224/Update/download/2.4.2.zip', '0', '0');
INSERT INTO `cy_version` VALUES ('2.4.3', '10021', '优化后台菜单部分', '1467265786', '0', '优化后台菜单部分', 'http://101.201.199.224/Update/download/2.4.3.zip', '0', '0');
INSERT INTO `cy_version` VALUES ('2.4.4', '10022', '更新后台交易管理部分', '1467266348', '0', '更新后台交易管理部分', 'http://101.201.199.224/Update/download/2.4.4.zip', '0', '0');
INSERT INTO `cy_version` VALUES ('2.4.5', '10023', '优化财务部分', '1467270688', '0', '优化人民币充值 提现\r\n优化虚拟币转入 转出\r\n\r\n需要重新配置充值方式', 'http://101.201.199.224/Update/download/2.4.5.zip', '0', '0');
INSERT INTO `cy_version` VALUES ('2.4.6', '10024', '优化财务部分', '1467346688', '0', '优化充值提现转入转出', 'http://101.201.199.224/Update/download/2.4.6.zip', '0', '0');
INSERT INTO `cy_version` VALUES ('2.4.7', '10025', '更新人民币充值功能', '1467352025', '0', '更新人民币充值功能\r\n优化软件不能自动到账\r\n优化前台充值弹窗的状态', 'http://101.201.199.224/Update/download/2.4.7.zip', '0', '0');
INSERT INTO `cy_version` VALUES ('2.4.8', '10026', '优化自动更新功能', '1467361623', '0', '优化自动更新功能', 'http://101.201.199.224/Update/download/2.4.8.zip', '0', '0');
INSERT INTO `cy_version` VALUES ('2.4.9', '10027', '优化后台首页', '1467362093', '0', '优化后台首页\r\n增加扩展 -客服代码  可以更换钱袋客服代码 \r\n更新之后，需要清理缓存', 'http://os.movesay.com/Auth/upFile/version/2.4.9', '0', '0');
INSERT INTO `cy_version` VALUES ('2.5.0', '10028', '优化所有后台功能', '1467601458', '0', '优化所有后台功能但不包括应用部分\r\n在设置里面增加了导航设置可以控制前台导航了\r\n扩展里面增加客服代码可以更新客服代码了\r\n应用管理里面支持已经购买的 应用安装和卸载了\r\n增加有新的升级所有后台页面都会提示\r\n及时更新修复漏洞能使网站更安全\r\n更新人民币充值方式需要重新配置\r\n优化大部分后台授权可能有个别没有添加授权后期完善\r\n优化整个后台样式让您看着更舒服\r\n优化认购中心需要重新安装卸载如果提示没有授权请联系我们', 'http://os.movesay.com/Auth/upFile/version/2.5.0', '0', '0');
INSERT INTO `cy_version` VALUES ('2.5.1', '10029', '模板更新  更新之后在扩展里面主题设置一下 不然前台打不开不了', '1467685524', '0', '支持客服代码定制\r\n扩展里面增加模板切换支持定制\r\n设置其他设置里面取消模板切换\r\n优化应用管理支持新应用预定\r\n优化用户管理搜索用户名不能用\r\n优化后台提现不能导出选中\r\n优化认购详情界面换成币种图标\r\n\r\n\r\n\r\n\r\n\r\n', 'http://os.movesay.com/Auth/upFile/version/2.5.1', '0', '0');
INSERT INTO `cy_version` VALUES ('2.5.2', '10030', '优化超级管理员功能', '1467714463', '0', '优化只有超级管理员才能看到升级提示\r\n优化只有超级管理员才能升级系统\r\n优化只有超级管理员才能切换模板\r\n优化只有超级管理员才能切换客服代码\r\n', 'http://os.movesay.com/Auth/upFile/version/2.5.2', '0', '0');
INSERT INTO `cy_version` VALUES ('2.5.3', '10031', '更新底部和文章部分', '1467785561', '0', '更新底部新样式\r\n更新文章部分具体效果可以看我们的演示网站\r\n优化首页文章部分\r\n优化交易中心拉100%不能交易\r\n优化后台撤销有时候会出现失败', 'http://os.movesay.com/Auth/upFile/version/2.5.3', '0', '0');
INSERT INTO `cy_version` VALUES ('2.5.4', '10032', '优化文章时间文字', '1467795268', '0', '优化文章时间不能修改的问题', 'http://os.movesay.com/Auth/upFile/version/2.5.4', '0', '0');
INSERT INTO `cy_version` VALUES ('2.5.5', '10033', '优化后台核心', '1467856087', '0', '优化后台核心', 'http://os.movesay.com/Auth/upFile/version/2.5.5', '0', '0');
INSERT INTO `cy_version` VALUES ('2.5.6', '10034', '升级系统文件部分过期的问题', '1469073091', '0', '升级系统文件部分过期的问题', 'http://os.movesay.com/Auth/upFile/version/2.5.6', '0', '0');

-- ----------------------------
-- Table structure for cy_version_game
-- ----------------------------
DROP TABLE IF EXISTS `cy_version_game`;
CREATE TABLE `cy_version_game` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `gongsi` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '名称',
  `shuoming` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '名称',
  `class` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '名称',
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `number` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='应用管理表';

-- ----------------------------
-- Records of cy_version_game
-- ----------------------------
INSERT INTO `cy_version_game` VALUES ('1', '武汉动说科技有限公司', '支持虚拟币的购物商城', '#F1AB0F', 'shop', '云购商城', '1');
INSERT INTO `cy_version_game` VALUES ('2', '武汉动说科技有限公司', '支持对用户进行持币比例分红', '#C53CE7', 'fenhong', '分红中心', '1');
INSERT INTO `cy_version_game` VALUES ('3', '武汉动说科技有限公司', '支持用虚拟币充值手机话费', '#428bca', 'huafei', '话费充值', '1');
INSERT INTO `cy_version_game` VALUES ('4', '武汉动说科技有限公司', '可以发行虚拟币让用户认购', '#e74c3c', 'issue', '认购中心', '1');
INSERT INTO `cy_version_game` VALUES ('5', '武汉动说科技有限公司', '可以对要生效的新币进行投票', '#1abc9c', 'vote', '新币投票', '1');
INSERT INTO `cy_version_game` VALUES ('6', '武汉动说科技有限公司', '存币涨利息类型于存在钱到银行涨利息', '#f1c40f', 'money', '理财中心', '1');
INSERT INTO `cy_version_game` VALUES ('7', '武汉动说科技有限公司', '支持单对单交易', '#3c763d', 'bazaar', '集市交易', '0');
INSERT INTO `cy_version_game` VALUES ('8', '武汉动说科技有限公司', '<span style=\"color: #e74c3c;\">支持预定(8折优惠)原价3000元</span>', '', 'pool', '矿机工厂', '0');
INSERT INTO `cy_version_game` VALUES ('9', '武汉动说科技有限公司', '<span style=\"color: #e74c3c;\">支持预定(8折优惠)原价3000元</span>', '', 'crowd', '众筹中心', '0');
INSERT INTO `cy_version_game` VALUES ('10', '武汉动说科技有限公司', '<span style=\"color: #e74c3c;\">支持预定(8折优惠)原价2000元</span>', '', 'qiandao', '签到功能', '0');
INSERT INTO `cy_version_game` VALUES ('11', '武汉动说科技有限公司', '<span style=\"color: #e74c3c;\">支持预定(8折优惠)原价2000元</span>', '', 'hongbao', '人人红包', '0');
INSERT INTO `cy_version_game` VALUES ('12', '武汉动说科技有限公司', '<span style=\"color: #e74c3c;\">支持预定(8折优惠)原价3000元</span>', '', 'weike', '威客任务', '0');
INSERT INTO `cy_version_game` VALUES ('13', '武汉动说科技有限公司', '<span style=\"color: #e74c3c;\">支持预定(8折优惠)原价2000元</span>', '', 'duihuan', '币币兑换', '0');
INSERT INTO `cy_version_game` VALUES ('14', '武汉动说科技有限公司', '<span style=\"color: #e74c3c;\">支持预定(8折优惠)原价2000元</span>', '', 'shoujiang', '幸运抽奖', '0');
INSERT INTO `cy_version_game` VALUES ('15', '武汉动说科技有限公司', '<span style=\"color: #e74c3c;\">支持预定(8折优惠)原价3000元</span>', '', 'duobao', '一元夺宝', '0');

-- ----------------------------
-- Table structure for cy_vote
-- ----------------------------
DROP TABLE IF EXISTS `cy_vote`;
CREATE TABLE `cy_vote` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) unsigned NOT NULL,
  `coinname` varchar(50) NOT NULL,
  `type` int(20) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` int(4) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cy_vote
-- ----------------------------

-- ----------------------------
-- Table structure for cy_vote_type
-- ----------------------------
DROP TABLE IF EXISTS `cy_vote_type`;
CREATE TABLE `cy_vote_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `coinname` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '状态',
  `img` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `zhichi` bigint(20) unsigned DEFAULT '0',
  `fandui` bigint(20) unsigned DEFAULT '0',
  `zongji` bigint(20) unsigned DEFAULT '0',
  `bili` float DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gbk ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cy_vote_type
-- ----------------------------
INSERT INTO `cy_vote_type` VALUES ('1', 'bcg', 'bcg', '1', '', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for cy_wkc_tradelog
-- ----------------------------
DROP TABLE IF EXISTS `cy_wkc_tradelog`;
CREATE TABLE `cy_wkc_tradelog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` int(11) NOT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `tradeAccount` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `amount` decimal(20,10) NOT NULL,
  `cost` decimal(4,4) NOT NULL COMMENT '花费，成本',
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '标题',
  `extra` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '订单id',
  `myAccount` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '我的链克账户地址',
  PRIMARY KEY (`id`),
  UNIQUE KEY `hash` (`hash`),
  UNIQUE KEY `order` (`order_id`),
  KEY `tradeacc` (`tradeAccount`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of cy_wkc_tradelog
-- ----------------------------
INSERT INTO `cy_wkc_tradelog` VALUES ('1', '1519462381', '1', '0xb7cd1f4e929cf95b641b5603e1abe8345d26bd32', '2.0000000000', '0.0000', '0x1da21eca14ddee4bd7c00fe81283823a73c0d9057b59537344f5893661e6d0ed', '', '', '20180224165301w3fsbjl8glgiiew0', '0x1f76d317ee03388bc506e1dd5d2ffaa9190febef');
INSERT INTO `cy_wkc_tradelog` VALUES ('2', '1519464529', '1', '0x6254c03b57ca974d4d506c168b25242cf3eb1501', '0.1123000000', '0.0000', '0x93bdddc87fff04be0774e815bf9587cd6b95fd16b07823c2b070bba71395eba0', '', '', '20180224172849tumwbjl9806skogo', '0x1f76d317ee03388bc506e1dd5d2ffaa9190febef');
INSERT INTO `cy_wkc_tradelog` VALUES ('3', '1519464722', '1', '0x6254c03b57ca974d4d506c168b25242cf3eb1501', '2.0000000000', '0.0000', '0x056b65d2118c2e02a18088a8d6d0156be91fe33664e0c4ed356c2b5211df1f43', '', '', '20180224173201b2g8bjl9agints3w', '0x1f76d317ee03388bc506e1dd5d2ffaa9190febef');
INSERT INTO `cy_wkc_tradelog` VALUES ('4', '1519468990', '1', '0x5dab766d4e3150a4c9c945296ed10c8d3603c57f', '7.0000000000', '0.0000', '0x6336fdf10ae2fcb15cab302e0288bc41b02d1ed54e8cd89db66812dbbe21e1ec', '', '', '201802241843098qv9bjlasx7x9d3l', '0x1f76d317ee03388bc506e1dd5d2ffaa9190febef');
INSERT INTO `cy_wkc_tradelog` VALUES ('5', '1519469719', '1', '0x89189bcc5d2b0191c5493fafd3b3693bca3e086c', '6.0000000000', '0.0000', '0xc3165cb3aca7440117468240bd5ebb8d39b0df7726208c24167ca52a9a3ceb2e', '', '', '20180224185519hql4bjlb28jyseh2', '0x1f76d317ee03388bc506e1dd5d2ffaa9190febef');
INSERT INTO `cy_wkc_tradelog` VALUES ('6', '1519477717', '1', '0x350aac3bd25b256def23e98b7318eb14d12d5d79', '1.0000000000', '0.0000', '0xe81d376ca3a23dd7b3a6fafc3c4550fff27f4228736a4c31e717e8a659c8ba58', '', '', '20180224210837kv0pbjldwaz2eatd', '0x1f76d317ee03388bc506e1dd5d2ffaa9190febef');
INSERT INTO `cy_wkc_tradelog` VALUES ('7', '1519477851', '1', '0x350aac3bd25b256def23e98b7318eb14d12d5d79', '1.0000000000', '0.0000', '0x17b76c6633689696f9629c9a6547363f37122911a97f47808b40d39aafe7f548', '', '', '20180224211050ai32bjldy07b5uu0', '0x1f76d317ee03388bc506e1dd5d2ffaa9190febef');
INSERT INTO `cy_wkc_tradelog` VALUES ('8', '1519501594', '1', '0x16556525d4aeb16f5774b13c1913ea86a0ffaee8', '1.0000000000', '0.0000', '0x79b0d3db96100697a302e33cfb45fe2ea3db868d11dd74cbe78700480f1f260b', '', '', '20180225034634i1lcbjlmczq6d7s4', '0x1f76d317ee03388bc506e1dd5d2ffaa9190febef');
INSERT INTO `cy_wkc_tradelog` VALUES ('9', '1519554973', '1', '0x4971e53ae254ff86e748fcea235b4f41665a8fd4', '10.0000000000', '0.0000', '0x1710bfeb5679bb791f8eebf3a70606c9e632c697cd0be09877c715eecbf53fed', '', '', '2018022518361249c9bjm5a5fqto6v', '0x1f76d317ee03388bc506e1dd5d2ffaa9190febef');
INSERT INTO `cy_wkc_tradelog` VALUES ('10', '1519621301', '1', '0x6254c03b57ca974d4d506c168b25242cf3eb1501', '5.0000000000', '0.0000', '0x0778907997ef9f96a86219b03cde4f958b363a8a02b0a4e9f27264b09b86e468', '', '', '20180226130141t7axbjmsskad21qv', '0x1f76d317ee03388bc506e1dd5d2ffaa9190febef');
INSERT INTO `cy_wkc_tradelog` VALUES ('11', '1519647688', '1', '0x543ee001e0bf5317231f6e7f503c938ef88994e3', '20.0000000000', '0.0000', '0x12b92ef16616fb102a30cfa95b658a774aac4a6ec4d5e0ee8b1e8741e7f2107c', '', '', '20180226202128r89zbjn25ampn2vl', '0x1f76d317ee03388bc506e1dd5d2ffaa9190febef');
INSERT INTO `cy_wkc_tradelog` VALUES ('12', '1519693298', '1', '0x181686227dea276213131844e8adf146ae17ea22', '0.3921000000', '0.0000', '0x93dbf8522ec17a9326560771304e1e2288068736e0533eb11bf4d4a4e3a529c1', '', '', '20180227090138gz74bjnibba3h3r8', '0x1f76d317ee03388bc506e1dd5d2ffaa9190febef');
INSERT INTO `cy_wkc_tradelog` VALUES ('13', '1519710808', '1', '0x155e356d9f367b545160705d78a9fc96eed132f1', '0.1164000000', '0.0000', '0xe773f35020c3c5eef792e450643940a66ab2ecc04d0c3a8af0a53dd81aa62110', '', '', '20180227135328g21fbjnoird434lp', '0x1f76d317ee03388bc506e1dd5d2ffaa9190febef');
INSERT INTO `cy_wkc_tradelog` VALUES ('14', '1519711631', '1', '0x155e356d9f367b545160705d78a9fc96eed132f1', '25.0000000000', '0.0000', '0x1849b9e0b55fef04dac8381a0254fd0e27d2255c929b8e59c55a0a866b9526c1', '', '', '20180227140710pd56bjnot96485kw', '0x1f76d317ee03388bc506e1dd5d2ffaa9190febef');
INSERT INTO `cy_wkc_tradelog` VALUES ('15', '1519721964', '1', '0x4f752cf4613d905ec524dfda340ca40590a70d27', '0.4405000000', '0.0000', '0x10932340cc8e21acb3dd628ce1cba8c1b74e45d90e9094bdf7a5e4e875920684', '', '', '20180227165924cnogbjnsh4jxwmdu', '0x1f76d317ee03388bc506e1dd5d2ffaa9190febef');
INSERT INTO `cy_wkc_tradelog` VALUES ('16', '1520067780', '1', '0x7be33ed00dc9660a8203fae4fd2f54292d21a7e5', '8249.9000000000', '0.0000', '0xa274b74c01cb9c7d19db672591fac16cd12dc86b15c404685cdba8cef272dbec', '', '', '20180303170300iy3wbjr7223qnnxd', '0x1f76d317ee03388bc506e1dd5d2ffaa9190febef');
INSERT INTO `cy_wkc_tradelog` VALUES ('17', '1520146307', '1', '0x7be33ed00dc9660a8203fae4fd2f54292d21a7e5', '599.9000000000', '0.0000', '0xbe7376b097d3bd769a3a0f6fac4751053ad205ca9ba52056982f4321c1aca5fc', '', '', '20180304145147okfybjryw4oisj1x', '0x1f76d317ee03388bc506e1dd5d2ffaa9190febef');
INSERT INTO `cy_wkc_tradelog` VALUES ('18', '1520155553', '1', '0x7be33ed00dc9660a8203fae4fd2f54292d21a7e5', '600.0000000000', '0.0000', '0x8b5aa5bcbc82d842c28278d558009d6170c8f49d0972ac1f137a9faa55c1d4bb', '', '', '20180304172552w7wobjs26423i52q', '0x1f76d317ee03388bc506e1dd5d2ffaa9190febef');
INSERT INTO `cy_wkc_tradelog` VALUES ('19', '1520298585', '1', '0x86caaa99e8ecad1db52adbe224f4bb4eef96ec75', '10000.0000000000', '0.0000', '0x5fa75ae7242725be2fed32b4f821a742466afddc1a59625cbdef3780d40b5177', '', '', '20180306090945t3c1bjtgvcbqw4or', '0x1f76d317ee03388bc506e1dd5d2ffaa9190febef');
INSERT INTO `cy_wkc_tradelog` VALUES ('20', '1520582646', '1', '0xab4a1355a20acfe143849867c799cf17d152eb3d', '0.4629000000', '0.0000', '0x646cd7514e55973e6cd1d852cc0fc387e86a5d20c6595d43db4ca79f42ff348a', '', '', '20180309160405igq4bjw9k7ss1wvy', '0x1f76d317ee03388bc506e1dd5d2ffaa9190febef');
INSERT INTO `cy_wkc_tradelog` VALUES ('21', '1519642029', '1', '0x71f8f9fe5664e7e6d4c5a0941da025cd615d9fa3', '1.0000000000', '0.0000', '0x07049a1bc9c80a51e17bf0dafae92840e779d883b2ec9af1d691f5e41cf29ca2', '', '', '20180226184708ui8bbjn052jma3s3', '0xfceba9732fdbf46b973398d33ab3e0bc7e569a23');
INSERT INTO `cy_wkc_tradelog` VALUES ('22', '1519710974', '1', '0x71f8f9fe5664e7e6d4c5a0941da025cd615d9fa3', '1.0000000000', '0.0000', '0xe8ecb7244d61ea9a3dd27919f82c520ddeb73994a8d45ec30cffab624612b744', '', '', '20180227135613pkixbjnokvcxxjpl', '0xfceba9732fdbf46b973398d33ab3e0bc7e569a23');
INSERT INTO `cy_wkc_tradelog` VALUES ('23', '1519712715', '1', '0x71f8f9fe5664e7e6d4c5a0941da025cd615d9fa3', '1.0000000000', '0.0000', '0xeeae54facec865a19c7140f6eeac19d0b81d81188dda54faa72809fc271fd44a', '', '', '20180227142514l2cnbjnp737uah1r', '0xfceba9732fdbf46b973398d33ab3e0bc7e569a23');
INSERT INTO `cy_wkc_tradelog` VALUES ('24', '1519714894', '1', '0x71f8f9fe5664e7e6d4c5a0941da025cd615d9fa3', '3.0000000000', '0.0000', '0x37fe8bc6c8ce0ba13346d881ce12c3183da0bf271372a4a8e3cd2559c25af4ac', '', '', '20180227150134xwirbjnpywehn57i', '0xfceba9732fdbf46b973398d33ab3e0bc7e569a23');
INSERT INTO `cy_wkc_tradelog` VALUES ('25', '1519714930', '1', '0x71f8f9fe5664e7e6d4c5a0941da025cd615d9fa3', '6.0000000000', '0.0000', '0x939667eef364e16f9118612b5e1738b1e590255c4ad19cd24e30ad0e2204fd7a', '', '', '20180227150210dvtlbjnpzctlmi9y', '0xfceba9732fdbf46b973398d33ab3e0bc7e569a23');
INSERT INTO `cy_wkc_tradelog` VALUES ('26', '1519715776', '1', '0xd74f23554a59477bf32f70301f987b4bdc33b90b', '9.0000000000', '0.0000', '0x2af2c55eb8baac1b883fa5c84773915d46afde5893d71070deebbecc452125e7', '', '', '20180227151616gsbabjnqa5iwylc3', '0xfceba9732fdbf46b973398d33ab3e0bc7e569a23');
INSERT INTO `cy_wkc_tradelog` VALUES ('27', '1519716112', '1', '0x6bdba8570dcff6ec36680bfa4dd5f56c2596ddeb', '12.0000000000', '0.0000', '0x7899935c988c6de25e05088c4fe23d29a33557cc1b0a5e8c3b6f26cbaa724b77', '', '', '20180227152152mmribjnqefxunevr', '0xfceba9732fdbf46b973398d33ab3e0bc7e569a23');
INSERT INTO `cy_wkc_tradelog` VALUES ('28', '1519716662', '1', '0xb2d9c5a7f4a8e7958348a4a738008bb544389c5a', '1.0000000000', '0.0000', '0x93e8f6e792b5b03497a37b107dc1f2a34e26550d1c5103bc397fcc21e9597340', '', '', '20180227153101g5m4bjnqlgfdiu8v', '0xfceba9732fdbf46b973398d33ab3e0bc7e569a23');
INSERT INTO `cy_wkc_tradelog` VALUES ('29', '1520921370', '1', '0x16ccde832dd990f629fae84d64364d5e25d16e18', '10.0000000000', '0.0000', '0xef8e0f42a55bfd2453127c0a917e8c816709c2fbfe0164fbe428abd08709accc', '', '', '20180313140930p3pdbjzlmnyqarjz', '0xfceba9732fdbf46b973398d33ab3e0bc7e569a23');
INSERT INTO `cy_wkc_tradelog` VALUES ('30', '1520945655', '1', '0x7332bc93ccf3b7afd89b1757906cb59c157661b1', '5.0000000000', '0.0000', '0xd5c2aecd6e682bdb8794907c3013b231f423b672c53dd90012fa3cb7e0ee54ed', '', '', '20180313205414wx48bjzu8jsyavfw', '0xfceba9732fdbf46b973398d33ab3e0bc7e569a23');
INSERT INTO `cy_wkc_tradelog` VALUES ('32', '1523619202', '1', '0x2bb3c274f1a5c47edd13e98de97020fc19ad650b', '0.0348000000', '0.0000', '0x536861c33bc48eafe62a7554b506194c6e0606b58dd3e40cc1de7444ee2609ca', '', '', '20180413193322tfhlbkq5ximqmbgw', '0x43a17ae04cc2c697729698304a7d88dca86aa226');
INSERT INTO `cy_wkc_tradelog` VALUES ('33', '1523618283', '1', '0x2bb3c274f1a5c47edd13e98de97020fc19ad650b', '0.0001000000', '0.0000', '0xff5a4df63fb3745eb71e2a0a773a0a6b23c029a262c0c2a991917041910aa2f2', '', '', '20180413191802dahdbkq5ls9x95jn', '0x22cab55d4a673b09ba17698d1fe35c98689c3987');
INSERT INTO `cy_wkc_tradelog` VALUES ('34', '1523672862', '1', '0x2bb3c274f1a5c47edd13e98de97020fc19ad650b', '0.0114000000', '0.0000', '0x11e583a92f8dbe625521f068ffa15a8b9fbba890ab4da4064822e4c88d044382', '', '', '20180414102742f6qabkqoy9sbyvpd', '0x42a4a9743cb7c760f8402ad0b35bf92fe2469273');
INSERT INTO `cy_wkc_tradelog` VALUES ('35', '1523673128', '1', '0x2bb3c274f1a5c47edd13e98de97020fc19ad650b', '0.0182000000', '0.0000', '0x825a12634b927702f5fe3936e1b5da300d2d9693f7bb54145a73521326d0a81e', '', '', '20180414103208zsydbkqp1o0cp9kh', '0xc64ba127f9dad265ad8403bb2631ad22b4366bf8');
INSERT INTO `cy_wkc_tradelog` VALUES ('36', '1523677452', '1', '0x2bb3c274f1a5c47edd13e98de97020fc19ad650b', '0.0183000000', '0.0000', '0xf00b14d4df80170053ac74cf1976f4d046a7f070eef058d18be9c344d90103ee', '', '', '20180414114412cn78bkqqkufay1tq', '0xc64ba127f9dad265ad8403bb2631ad22b4366bf8');
INSERT INTO `cy_wkc_tradelog` VALUES ('37', '1524137482', '1', '0x2bb3c274f1a5c47edd13e98de97020fc19ad650b', '0.0244000000', '0.0000', '0xd5dc80bd620bcf6b6a61d7258d5e0c12c2e6918ae0cec83a79a922ae4fa4c753', '', '', '201804191931219z5hbkv9n8wspghc', '0xc64ba127f9dad265ad8403bb2631ad22b4366bf8');
INSERT INTO `cy_wkc_tradelog` VALUES ('38', '1524140628', '1', '0x2bb3c274f1a5c47edd13e98de97020fc19ad650b', '1.0264000000', '0.0000', '0x11dccb814fbe33a7fdeadaee3399b73586477d6718c9c7c6e7f920367d3cf278', '', '', '201804192023472rcjbkvare622eb0', '0x42a4a9743cb7c760f8402ad0b35bf92fe2469273');
