/*
Navicat MySQL Data Transfer

Source Server         : server
Source Server Version : 50627
Source Host           : 192.168.100.138:3306
Source Database       : im

Target Server Type    : MYSQL
Target Server Version : 50627
File Encoding         : 65001

Date: 2016-02-18 14:39:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `company`
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `departmentId` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '企业号',
  `departmentName` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '企业名称',
  `parentId` int(11) DEFAULT NULL,
  `code` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '本地json格式',
  `depth` int(1) DEFAULT '0' COMMENT '0: 免费用户  1: 交费用户',
  `fullName` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES ('1', '3', '广东温迪数字传播股份有限公司', '0', null, '1', '广东温迪数字传播股份有限公司');
INSERT INTO `company` VALUES ('2', '4', '董事局', '3', null, '2', '广东温迪数字传播股份有限公司 > 董事局');
INSERT INTO `company` VALUES ('3', '5', '董事办', '3', null, '2', '广东温迪数字传播股份有限公司 > 董事办');
INSERT INTO `company` VALUES ('4', '11', '审计部', '3', null, '2', '广东温迪数字传播股份有限公司 > 审计部');
INSERT INTO `company` VALUES ('5', '15', '财务部', '3', null, '2', '广东温迪数字传播股份有限公司 > 财务部');
INSERT INTO `company` VALUES ('6', '14', '行政部', '3', null, '2', '广东温迪数字传播股份有限公司 > 行政部');
INSERT INTO `company` VALUES ('7', '13', '人力资源部', '3', null, '2', '广东温迪数字传播股份有限公司 > 人力资源部');
INSERT INTO `company` VALUES ('8', '20', '投资管理部', '3', null, '2', '广东温迪数字传播股份有限公司 > 投资管理部');
INSERT INTO `company` VALUES ('9', '10', '市场部', '3', null, '2', '广东温迪数字传播股份有限公司 > 市场部');
INSERT INTO `company` VALUES ('10', '21', '客户服务部', '3', null, '2', '广东温迪数字传播股份有限公司 > 客户服务部');
INSERT INTO `company` VALUES ('11', '12', '孵化平台运营部', '3', null, '2', '广东温迪数字传播股份有限公司 > 孵化平台运营部');
INSERT INTO `company` VALUES ('12', '22', '数字平台运营部', '3', null, '2', '广东温迪数字传播股份有限公司 > 数字平台运营部');
INSERT INTO `company` VALUES ('13', '23', '整合平台运营部', '3', null, '2', '广东温迪数字传播股份有限公司 > 整合平台运营部');
INSERT INTO `company` VALUES ('14', '24', '信息管理部', '3', null, '2', '广东温迪数字传播股份有限公司 > 信息管理部');
INSERT INTO `company` VALUES ('15', '26', '战略决策委员会', '3', null, '2', '广东温迪数字传播股份有限公司 > 战略决策委员会');
INSERT INTO `company` VALUES ('16', '25', '法务部', '3', null, '2', '广东温迪数字传播股份有限公司 > 法务部');
INSERT INTO `company` VALUES ('17', '29', '广州彼亚互联网科技有限公司', '0', null, '1', '广州彼亚互联网科技有限公司');
INSERT INTO `company` VALUES ('18', '32', '总经办', '29', null, '2', '广州彼亚互联网科技有限公司 > 总经办');
INSERT INTO `company` VALUES ('19', '33', '技术开发部', '29', null, '2', '广州彼亚互联网科技有限公司 > 技术开发部');
INSERT INTO `company` VALUES ('20', '34', '产品测试部', '29', null, '2', '广州彼亚互联网科技有限公司 > 产品测试部');
INSERT INTO `company` VALUES ('21', '37', '产品设计部部', '29', null, '2', '广州彼亚互联网科技有限公司 > 产品设计部部');
INSERT INTO `company` VALUES ('22', '35', '技术产品规划部', '29', null, '2', '广州彼亚互联网科技有限公司 > 技术产品规划部');
INSERT INTO `company` VALUES ('23', '31', '行政部', '29', null, '2', '广州彼亚互联网科技有限公司 > 行政部');
INSERT INTO `company` VALUES ('24', '30', '财务部', '29', null, '2', '广州彼亚互联网科技有限公司 > 财务部');
INSERT INTO `company` VALUES ('25', '36', '上海运营中心', '29', null, '2', '广州彼亚互联网科技有限公司 > 上海运营中心');
INSERT INTO `company` VALUES ('26', '27', '广州温迪正合公共关系服务有限公司', '0', null, '1', '广州温迪正合公共关系服务有限公司');
INSERT INTO `company` VALUES ('27', '16', '广州悦协人力资源管理有限公司', '0', null, '1', '广州悦协人力资源管理有限公司');
INSERT INTO `company` VALUES ('28', '28', '广州市网睿信息科技有限公司', '0', null, '1', '广州市网睿信息科技有限公司');
INSERT INTO `company` VALUES ('29', '2', '广州财汛通商业数字传播有限公司', '0', null, '1', '广州财汛通商业数字传播有限公司');
INSERT INTO `company` VALUES ('30', '49', '广州娱悦文化传播有限公司', '0', null, '1', '广州娱悦文化传播有限公司');
INSERT INTO `company` VALUES ('31', '48', '广州云播资产管理有限公司', '0', null, '1', '广州云播资产管理有限公司');
INSERT INTO `company` VALUES ('32', '47', '广州云社信息科技有限公司', '0', null, '1', '广州云社信息科技有限公司');
INSERT INTO `company` VALUES ('33', '46', '广州市弗林信息科技有限公司', '0', null, '1', '广州市弗林信息科技有限公司');
INSERT INTO `company` VALUES ('34', '45', '广州市艾索互联网信息服务有限公司', '0', null, '1', '广州市艾索互联网信息服务有限公司');
INSERT INTO `company` VALUES ('35', '44', '广州玛莉隔壁信息科技有限公司', '0', null, '1', '广州玛莉隔壁信息科技有限公司');
INSERT INTO `company` VALUES ('36', '43', '广州科铄软件科技有限公司', '0', null, '1', '广州科铄软件科技有限公司');
INSERT INTO `company` VALUES ('37', '42', '广州聚采数据服务有限公司', '0', null, '1', '广州聚采数据服务有限公司');
INSERT INTO `company` VALUES ('38', '41', '广州合悦邑互联网服务有限公司', '0', null, '1', '广州合悦邑互联网服务有限公司');
INSERT INTO `company` VALUES ('39', '40', '广州芬格营销策划有限公司', '0', null, '1', '广州芬格营销策划有限公司');
INSERT INTO `company` VALUES ('40', '38', '测试公司', '0', null, '1', '测试公司');
INSERT INTO `company` VALUES ('41', '1', '广州公作信息科技有限公司', '0', null, '1', '广州公作信息科技有限公司');
INSERT INTO `company` VALUES ('42', '52', '测试新建', '0', null, '1', '测试新建');

-- ----------------------------
-- Table structure for `emojis`
-- ----------------------------
DROP TABLE IF EXISTS `emojis`;
CREATE TABLE `emojis` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `emoji_name` varchar(5) CHARACTER SET utf8 DEFAULT NULL,
  `emoji_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of emojis
-- ----------------------------
INSERT INTO `emojis` VALUES ('1', '微笑', '01/emoji_01.png');
INSERT INTO `emojis` VALUES ('2', '哈哈', '01/emoji_02.png');
INSERT INTO `emojis` VALUES ('3', '鄙视', '01/emoji_03.png');
INSERT INTO `emojis` VALUES ('4', '委屈', '01/emoji_04.png');
INSERT INTO `emojis` VALUES ('5', '哈欠', '01/emoji_05.png');
INSERT INTO `emojis` VALUES ('6', '嘻嘻', '01/emoji_06.png');
INSERT INTO `emojis` VALUES ('7', '可怜', '01/emoji_07.png');
INSERT INTO `emojis` VALUES ('8', '安静', '01/emoji_08.png');
INSERT INTO `emojis` VALUES ('9', '闭嘴', '01/emoji_09.png');
INSERT INTO `emojis` VALUES ('10', '嘘', '01/emoji_10.png');
INSERT INTO `emojis` VALUES ('11', '晕', '01/emoji_11.png');
INSERT INTO `emojis` VALUES ('12', '失望', '01/emoji_12.png');

-- ----------------------------
-- Table structure for `group_history`
-- ----------------------------
DROP TABLE IF EXISTS `group_history`;
CREATE TABLE `group_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL COMMENT '聊天组id',
  `uid` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '加入此聊天组的成员id',
  `time` char(10) COLLATE utf8_bin DEFAULT NULL COMMENT '更新聊天信息的时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '默认0为存在，1为删除',
  `object` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '当前会话的对象',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1061 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of group_history
-- ----------------------------
INSERT INTO `group_history` VALUES ('897', '204', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1453799890', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('898', '204', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '1453799893', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('899', '204', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTX', '1453799893', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('900', '204', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTt', '1453799893', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('901', '204', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTJ', '1453799893', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('902', '204', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTc', '1453799893', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('903', '204', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTb', '1453799893', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('904', '204', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTr', '1453799893', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('905', '204', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyT9', '1453799893', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('906', '204', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUz', '1453799893', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('907', '204', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUB', '1453799893', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('908', '204', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUn', '1453799893', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('909', '204', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUX', '1453799893', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('910', '204', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUt', '1453799893', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('911', '204', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUJ', '1453799893', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('912', '204', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUc', '1453799893', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('913', '204', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUb', '1453799893', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('914', '204', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUr', '1453799893', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('915', '204', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLU9', '1453799893', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('916', '204', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkz', '1453799893', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('917', '204', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkB', '1453799893', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('918', '204', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLX9', '1453799893', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('919', '205', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUb', '1453799988', '0', '系统管理员');
INSERT INTO `group_history` VALUES ('920', '206', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUb', '1453799992', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('921', '206', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1453799997', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('922', '206', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '1453799997', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('923', '206', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTX', '1453799997', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('924', '206', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTt', '1453799997', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('925', '206', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTJ', '1453799997', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('926', '206', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTc', '1453799997', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('927', '206', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTb', '1453799997', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('928', '206', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTr', '1453799997', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('929', '206', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyT9', '1453799997', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('930', '206', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUz', '1453799997', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('931', '206', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUB', '1453799997', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('932', '206', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUn', '1453799997', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('933', '206', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUX', '1453799997', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('934', '206', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUt', '1453799997', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('935', '206', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUJ', '1453799997', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('936', '206', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUc', '1453799997', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('937', '206', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUr', '1453799997', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('938', '206', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLU9', '1453799997', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('939', '206', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkz', '1453799997', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('940', '206', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkB', '1453799997', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('941', '206', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLX9', '1453799997', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('942', '207', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1453800071', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('943', '207', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '1453800073', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('944', '207', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTX', '1453800073', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('945', '207', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTt', '1453800073', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('946', '207', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTJ', '1453800073', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('947', '207', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTc', '1453800073', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('948', '207', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTb', '1453800073', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('949', '207', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTr', '1453800073', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('950', '207', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyT9', '1453800073', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('951', '207', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUz', '1453800073', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('952', '207', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUB', '1453800073', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('953', '207', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUn', '1453800073', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('954', '207', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUX', '1453800073', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('955', '207', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUt', '1453800073', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('956', '207', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUJ', '1453800073', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('957', '207', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUc', '1453800073', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('958', '207', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUb', '1453800073', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('959', '207', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUr', '1453800073', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('960', '207', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLU9', '1453800073', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('961', '207', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkz', '1453800073', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('962', '207', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkB', '1453800073', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('963', '207', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLX9', '1453800073', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('964', '208', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1453800152', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('965', '208', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '1453800152', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('966', '208', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTX', '1453800152', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('967', '208', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTt', '1453800152', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('968', '208', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTJ', '1453800152', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('969', '208', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTc', '1453800152', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('970', '208', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTb', '1453800152', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('971', '208', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTr', '1453800152', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('972', '208', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyT9', '1453800152', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('973', '208', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUz', '1453800152', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('974', '208', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUB', '1453800152', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('975', '208', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUn', '1453800152', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('976', '208', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUX', '1453800152', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('977', '208', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUt', '1453800152', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('978', '208', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUJ', '1453800152', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('979', '208', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUc', '1453800152', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('980', '208', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUb', '1453800152', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('981', '208', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUr', '1453800152', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('982', '208', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLU9', '1453800152', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('983', '208', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkz', '1453800152', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('984', '208', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkB', '1453800152', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('985', '208', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLX9', '1453800152', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('986', '209', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1453800387', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('987', '209', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '1453800387', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('988', '209', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTX', '1453800387', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('989', '209', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTt', '1453800387', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('990', '209', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTJ', '1453800387', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('991', '209', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTc', '1453800387', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('992', '209', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTb', '1453800387', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('993', '209', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTr', '1453800387', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('994', '209', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyT9', '1453800387', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('995', '209', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUz', '1453800387', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('996', '209', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUB', '1453800387', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('997', '209', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUn', '1453800387', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('998', '209', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUX', '1453800387', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('999', '209', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUt', '1453800387', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('1000', '209', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUJ', '1453800387', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('1001', '209', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUc', '1453800387', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('1002', '209', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUb', '1453800387', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('1003', '209', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUr', '1453800387', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('1004', '209', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLU9', '1453800387', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('1005', '209', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkz', '1453800387', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('1006', '209', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkB', '1453800387', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('1007', '209', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLX9', '1453800387', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('1008', '210', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1453801071', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('1009', '210', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '1453801071', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('1010', '210', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTX', '1453801071', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('1011', '210', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTt', '1453801071', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('1012', '210', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTJ', '1453801071', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('1013', '210', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTc', '1453801071', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('1014', '210', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTb', '1453801071', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('1015', '210', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTr', '1453801071', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('1016', '210', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyT9', '1453801071', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('1017', '210', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUz', '1453801071', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('1018', '210', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUB', '1453801071', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('1019', '210', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUn', '1453801071', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('1020', '210', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUX', '1453801071', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('1021', '210', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUt', '1453801071', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('1022', '210', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUJ', '1453801071', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('1023', '210', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUc', '1453801071', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('1024', '210', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUb', '1453801071', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('1025', '210', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUr', '1453801071', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('1026', '210', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLU9', '1453801071', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('1027', '210', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkz', '1453801071', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('1028', '210', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkB', '1453801071', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('1029', '210', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLX9', '1453801071', '1', '广州公作信息科技有限公司');
INSERT INTO `group_history` VALUES ('1030', '211', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyT9', '1453862845', '1', '广州合悦邑互联网服务有限公司');
INSERT INTO `group_history` VALUES ('1031', '212', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1454317455', '0', '杜献韬');
INSERT INTO `group_history` VALUES ('1032', '212', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '1454317455', '1', '系统管理员');
INSERT INTO `group_history` VALUES ('1033', '213', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1453882668', '1', '欧天成');
INSERT INTO `group_history` VALUES ('1034', '213', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLX9', '1453882668', '0', '系统管理员');
INSERT INTO `group_history` VALUES ('1035', '214', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1453882721', '0', '广州温迪正合公共关系服务有限公司');
INSERT INTO `group_history` VALUES ('1036', '215', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyT9', '1454048581', '1', '广州合悦邑互联网服务有限公司');
INSERT INTO `group_history` VALUES ('1037', '216', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1454048922', '1', '广东温迪数字传播股份有限公司');
INSERT INTO `group_history` VALUES ('1038', '218', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1454049591', '1', '广州悦协人力资源管理有限公司');
INSERT INTO `group_history` VALUES ('1039', '219', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1454049358', '1', '广州市网睿信息科技有限公司');
INSERT INTO `group_history` VALUES ('1040', '220', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1454049384', '0', '吴漫丽');
INSERT INTO `group_history` VALUES ('1041', '218', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLv9', '1454049591', '1', '广州悦协人力资源管理有限公司');
INSERT INTO `group_history` VALUES ('1042', '218', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXn', '1454049591', '1', '广州悦协人力资源管理有限公司');
INSERT INTO `group_history` VALUES ('1043', '218', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXX', '1454049591', '1', '广州悦协人力资源管理有限公司');
INSERT INTO `group_history` VALUES ('1044', '218', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXt', '1454049591', '1', '广州悦协人力资源管理有限公司');
INSERT INTO `group_history` VALUES ('1045', '218', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXJ', '1454049591', '1', '广州悦协人力资源管理有限公司');
INSERT INTO `group_history` VALUES ('1046', '218', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXc', '1454049591', '1', '广州悦协人力资源管理有限公司');
INSERT INTO `group_history` VALUES ('1047', '218', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXb', '1454049591', '1', '广州悦协人力资源管理有限公司');
INSERT INTO `group_history` VALUES ('1048', '221', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1454049904', '1', '苏秋端');
INSERT INTO `group_history` VALUES ('1049', '222', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1454049910', '1', '谭敬欣');
INSERT INTO `group_history` VALUES ('1050', '223', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1455700385', '0', '系统管理员、杜献韬、罗耀康');
INSERT INTO `group_history` VALUES ('1051', '224', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1454050340', '1', '关丽芬');
INSERT INTO `group_history` VALUES ('1052', '225', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyT9', '1454317409', '0', '系统管理员');
INSERT INTO `group_history` VALUES ('1053', '225', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1454317411', '0', '曾耀钧');
INSERT INTO `group_history` VALUES ('1054', '226', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '1455614706', '0', '广州彼亚互联网科技有限公司');
INSERT INTO `group_history` VALUES ('1055', '227', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '1455614713', '0', '技术开发部');
INSERT INTO `group_history` VALUES ('1056', '228', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '1455615261', '1', '张艳玲');
INSERT INTO `group_history` VALUES ('1057', '228', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUTJ', '1455615261', '0', '杜献韬');
INSERT INTO `group_history` VALUES ('1058', '229', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '1455616033', '1', '罗君兰');
INSERT INTO `group_history` VALUES ('1059', '223', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '1455700385', '0', '系统管理员、杜献韬、罗耀康');
INSERT INTO `group_history` VALUES ('1060', '223', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTX', '1455700385', '0', '系统管理员、杜献韬、罗耀康');

-- ----------------------------
-- Table structure for `groups`
-- ----------------------------
DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relation` text COLLATE utf8_bin NOT NULL COMMENT '存储聊天组，json格式',
  `create_id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '创建人id',
  `flag` int(11) NOT NULL DEFAULT '1' COMMENT '1为组内成员创建，2为组外成员创建',
  `type` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '聊天类型',
  `name` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '聊天组名',
  `history_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0未创建过会话，1已创建。',
  `add_new` tinyint(4) NOT NULL DEFAULT '0' COMMENT '当没有新增群到群聊时为0，有新增为一',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of groups
-- ----------------------------
INSERT INTO `groups` VALUES ('204', '', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1', 'delete', '广州公作信息科技有限公司', '1', '0');
INSERT INTO `groups` VALUES ('205', 0x7B227573657231223A22717358663265556358716458713453744D506E4273647870366A3562676A627A766144724A63635058564977734D4A3656394E3767795442222C227573657232223A22717358663265556358716458713453744D506E4273647870366A3562676A627A766144724A63635058564977734D4A3656394E37674C5562227D, '', '1', 'single', '', '0', '0');
INSERT INTO `groups` VALUES ('206', '', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUb', '1', 'delete', '广州公作信息科技有限公司', '1', '0');
INSERT INTO `groups` VALUES ('207', '', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1', 'delete', '广州公作信息科技有限公司', '1', '0');
INSERT INTO `groups` VALUES ('208', '', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1', 'delete', '广州公作信息科技有限公司', '1', '0');
INSERT INTO `groups` VALUES ('209', '', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1', 'delete', '广州公作信息科技有限公司', '1', '0');
INSERT INTO `groups` VALUES ('210', '', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1', 'delete', '广州公作信息科技有限公司', '1', '0');
INSERT INTO `groups` VALUES ('211', '', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyT9', '2', 'delete', '广州合悦邑互联网服务有限公司', '0', '0');
INSERT INTO `groups` VALUES ('212', 0x7B227573657231223A22717358663265556358716458713453744D506E4273647870366A3562676A627A766144724A63635058564977734D4A3656394E376779546E222C227573657232223A22717358663265556358716458713453744D506E4273647870366A3562676A627A766144724A63635058564977734D4A3656394E3767795442227D, '', '1', 'single', '', '1', '0');
INSERT INTO `groups` VALUES ('213', 0x7B227573657231223A22717358663265556358716458713453744D506E4273647870366A3562676A627A766144724A63635058564977734D4A3656394E37674C5839222C227573657232223A22717358663265556358716458713453744D506E4273647870366A3562676A627A766144724A63635058564977734D4A3656394E3767795442227D, '', '1', 'single', '', '1', '0');
INSERT INTO `groups` VALUES ('214', 0x7B22676964223A223237227D, 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '2', 'group', '广州温迪正合公共关系服务有限公司', '0', '0');
INSERT INTO `groups` VALUES ('215', '', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyT9', '2', 'delete', '广州合悦邑互联网服务有限公司', '1', '0');
INSERT INTO `groups` VALUES ('216', '', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '2', 'delete', '广东温迪数字传播股份有限公司', '0', '0');
INSERT INTO `groups` VALUES ('217', 0x7B227573657231223A22222C227573657232223A22717358663265556358716458713453744D506E4273647870366A3562676A627A766144724A63635058564977734D4A3656394E3767795442227D, '', '1', 'single', '', '0', '0');
INSERT INTO `groups` VALUES ('218', '', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '2', 'delete', '广州悦协人力资源管理有限公司', '1', '0');
INSERT INTO `groups` VALUES ('219', '', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '2', 'delete', '广州市网睿信息科技有限公司', '0', '0');
INSERT INTO `groups` VALUES ('220', 0x7B227573657231223A22717358663265556358716458713453744D506E4273647870366A3562676A627A766144724A63635058564977734D4A3656394E37674C6663222C227573657232223A22717358663265556358716458713453744D506E4273647870366A3562676A627A766144724A63635058564977734D4A3656394E3767795442227D, '', '1', 'single', '', '0', '0');
INSERT INTO `groups` VALUES ('221', 0x7B227573657231223A22717358663265556358716458713453744D506E4273647870366A3562676A627A766144724A63635058564977734D4A3656394E37674C586E222C227573657232223A22717358663265556358716458713453744D506E4273647870366A3562676A627A766144724A63635058564977734D4A3656394E3767795442227D, '', '1', 'single', '', '0', '0');
INSERT INTO `groups` VALUES ('222', 0x7B227573657231223A22717358663265556358716458713453744D506E4273647870366A3562676A627A766144724A63635058564977734D4A3656394E37674C5858222C227573657232223A22717358663265556358716458713453744D506E4273647870366A3562676A627A766144724A63635058564977734D4A3656394E3767795442227D, '', '1', 'single', '', '0', '0');
INSERT INTO `groups` VALUES ('223', 0x5B22717358663265556358716458713453744D506E4273647870366A3562676A627A766144724A63635058564977734D4A3656394E376779546E222C22717358663265556358716458713453744D506E4273647870366A3562676A627A766144724A63635058564977734D4A3656394E3767795442222C22717358663265556358716458713453744D506E4273647870366A3562676A627A766144724A63635058564977734D4A3656394E3767795458225D, 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1', 'custom', '系统管理员、杜献韬、罗耀康', '1', '0');
INSERT INTO `groups` VALUES ('224', 0x7B227573657231223A22717358663265556358716458713453744D506E4273647870366A3562676A627A766144724A63635058564977734D4A3656394E37674C7642222C227573657232223A22717358663265556358716458713453744D506E4273647870366A3562676A627A766144724A63635058564977734D4A3656394E3767795442227D, '', '1', 'single', '', '0', '0');
INSERT INTO `groups` VALUES ('225', 0x7B227573657231223A22717358663265556358716458713453744D506E4273647870366A3562676A627A766144724A63635058564977734D4A3656394E3767795442222C227573657232223A22717358663265556358716458713453744D506E4273647870366A3562676A627A766144724A63635058564977734D4A3656394E3767795439227D, '', '1', 'single', '', '1', '0');
INSERT INTO `groups` VALUES ('226', 0x7B22676964223A223239227D, 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '2', 'group', '广州彼亚互联网科技有限公司', '0', '0');
INSERT INTO `groups` VALUES ('227', 0x7B22676964223A223333227D, 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '2', 'group', '技术开发部', '0', '0');
INSERT INTO `groups` VALUES ('228', 0x7B227573657231223A22717358663265556358716458713453744D506E4273647870366A3562676A627A766144724A63635058564977734D4A3656394E377A55544A222C227573657232223A22717358663265556358716458713453744D506E4273647870366A3562676A627A766144724A63635058564977734D4A3656394E376779546E227D, '', '1', 'single', '', '1', '0');
INSERT INTO `groups` VALUES ('229', 0x7B227573657231223A22717358663265556358716458713453744D506E4273647870366A3562676A627A766144724A63635058564977734D4A3656394E37674C7639222C227573657232223A22717358663265556358716458713453744D506E4273647870366A3562676A627A766144724A63635058564977734D4A3656394E376779546E227D, '', '1', 'single', '', '0', '0');

-- ----------------------------
-- Table structure for `history_export`
-- ----------------------------
DROP TABLE IF EXISTS `history_export`;
CREATE TABLE `history_export` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_message_id` int(11) NOT NULL COMMENT '开始标记的消息id',
  `start_content` text CHARACTER SET utf8 NOT NULL COMMENT '起始消息的内容',
  `start_time` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '消息1的发送时间',
  `end_message_id` int(11) NOT NULL COMMENT '结束标记的消息id',
  `end_content` text CHARACTER SET utf8 NOT NULL COMMENT '结束的消息内容',
  `end_time` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '消息2发送的时间',
  `id_str` text CHARACTER SET utf8 NOT NULL COMMENT '存储当前导出历史的所有消息id',
  `marked_group` int(11) NOT NULL COMMENT '进行标记的消息组',
  `marked_user_id` int(11) NOT NULL COMMENT '进行标记的用户',
  `time` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '标记的时间',
  `state` int(2) NOT NULL DEFAULT '1' COMMENT '1为存在，2为删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of history_export
-- ----------------------------

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8 NOT NULL COMMENT '消息内容',
  `send_time` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '发送时间',
  `msg_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0为普通消息，1图片，2文档，3抖动',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=322 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('257', 'yhhh', '2016/1/26 下午5:20:48', '0');
INSERT INTO `message` VALUES ('258', 'dddd', '2016/1/26 下午5:22:52', '0');
INSERT INTO `message` VALUES ('259', 'dd', '2016/1/26 下午5:23:49', '0');
INSERT INTO `message` VALUES ('260', 'fgfff', '2016/1/26 下午5:24:45', '0');
INSERT INTO `message` VALUES ('261', 'fgfffd', '2016/1/26 下午5:24:45', '0');
INSERT INTO `message` VALUES ('262', 'd', '2016/1/26 下午5:24:45', '0');
INSERT INTO `message` VALUES ('263', 'd', '2016/1/26 下午5:24:46', '0');
INSERT INTO `message` VALUES ('264', 'dd', '2016/1/26 下午5:24:46', '0');
INSERT INTO `message` VALUES ('265', 'd', '2016/1/26 下午5:24:46', '0');
INSERT INTO `message` VALUES ('266', 'dd', '2016/1/26 下午5:24:47', '0');
INSERT INTO `message` VALUES ('267', 'dddd', '2016/1/26 下午5:25:07', '0');
INSERT INTO `message` VALUES ('268', 'ddddd', '2016/1/26 下午5:25:07', '0');
INSERT INTO `message` VALUES ('269', 'dddddd', '2016/1/26 下午5:25:07', '0');
INSERT INTO `message` VALUES ('270', 'd', '2016/1/26 下午5:25:07', '0');
INSERT INTO `message` VALUES ('271', 'd', '2016/1/26 下午5:25:07', '0');
INSERT INTO `message` VALUES ('272', 'nbbb', '2016/1/26 下午5:26:31', '0');
INSERT INTO `message` VALUES ('273', 'nbbbb', '2016/1/26 下午5:26:31', '0');
INSERT INTO `message` VALUES ('274', 'nbbbbb', '2016/1/26 下午5:26:31', '0');
INSERT INTO `message` VALUES ('275', 'bdd', '2016/1/26 下午5:29:01', '0');
INSERT INTO `message` VALUES ('276', 'bddd', '2016/1/26 下午5:29:01', '0');
INSERT INTO `message` VALUES ('277', 'd', '2016/1/26 下午5:29:01', '0');
INSERT INTO `message` VALUES ('278', 'dd', '2016/1/26 下午5:29:02', '0');
INSERT INTO `message` VALUES ('279', 'ddd', '2016/1/26 下午5:29:02', '0');
INSERT INTO `message` VALUES ('280', 'd', '2016/1/26 下午5:29:02', '0');
INSERT INTO `message` VALUES ('281', 'dfddd', '2016/1/26 下午5:40:24', '0');
INSERT INTO `message` VALUES ('282', 'd', '2016/1/26 下午5:40:25', '0');
INSERT INTO `message` VALUES ('283', 'dd', '2016/1/26 下午5:40:25', '0');
INSERT INTO `message` VALUES ('284', 'ddd', '2016/1/26 下午5:40:25', '0');
INSERT INTO `message` VALUES ('285', 'd', '2016/1/26 下午5:40:25', '0');
INSERT INTO `message` VALUES ('286', 'dd', '2016/1/26 下午5:40:26', '0');
INSERT INTO `message` VALUES ('287', 'ddd', '2016/1/26 下午5:40:26', '0');
INSERT INTO `message` VALUES ('288', '[哈哈]', '2016/1/27 下午4:14:44', '0');
INSERT INTO `message` VALUES ('289', 'hello！！', '2016/1/27 下午4:15:22', '0');
INSERT INTO `message` VALUES ('290', '[失望]', '2016/1/27 下午4:18:33', '0');
INSERT INTO `message` VALUES ('291', 'uploads/images/a1ba477a54ac1b5dc8a5b85c4b4c011c.png', '2016/1/27 下午4:18:39', '1');
INSERT INTO `message` VALUES ('292', '功放', '2016/1/29 下午2:23:47', '0');
INSERT INTO `message` VALUES ('293', 'cdgfg', '2016/1/29 下午2:42:32', '0');
INSERT INTO `message` VALUES ('294', 'df', '2016/1/29 下午2:42:33', '0');
INSERT INTO `message` VALUES ('295', 'dfdf', '2016/1/29 下午2:42:33', '0');
INSERT INTO `message` VALUES ('296', 'd', '2016/1/29 下午2:42:34', '0');
INSERT INTO `message` VALUES ('297', 'f', '2016/1/29 下午2:42:34', '0');
INSERT INTO `message` VALUES ('298', 'f', '2016/1/29 下午2:42:34', '0');
INSERT INTO `message` VALUES ('299', 'fdsf', '2016/1/29 下午2:42:34', '0');
INSERT INTO `message` VALUES ('300', 'dsf', '2016/1/29 下午2:42:34', '0');
INSERT INTO `message` VALUES ('301', 'test', '2016/2/1 下午5:04:17', '0');
INSERT INTO `message` VALUES ('302', 'd', '2016/2/1 下午5:07:08', '0');
INSERT INTO `message` VALUES ('303', '', '‎2016‎年‎2‎月‎16‎日‎ ‎1', '3');
INSERT INTO `message` VALUES ('304', 'jjjakka', '‎2016‎年‎2‎月‎16‎日‎ ‎1', '0');
INSERT INTO `message` VALUES ('305', 'dfddd', '‎2016‎年‎2‎月‎16‎日‎ ‎1', '0');
INSERT INTO `message` VALUES ('306', 'vggh', '‎2016‎年‎2‎月‎16‎日‎ ‎1', '0');
INSERT INTO `message` VALUES ('307', '[嘘]', '‎2016‎年‎2‎月‎16‎日‎ ‎1', '0');
INSERT INTO `message` VALUES ('308', 'hhh', '‎2016‎年‎2‎月‎16‎日‎ ‎1', '0');
INSERT INTO `message` VALUES ('309', 'ik', '‎2016‎年‎2‎月‎16‎日‎ ‎1', '0');
INSERT INTO `message` VALUES ('310', 'hhh', '‎2016‎年‎2‎月‎16‎日‎ ‎1', '0');
INSERT INTO `message` VALUES ('311', 'hh', '‎2016‎年‎2‎月‎16‎日‎ ‎1', '0');
INSERT INTO `message` VALUES ('312', 'bhh', '‎2016‎年‎2‎月‎16‎日‎ ‎1', '0');
INSERT INTO `message` VALUES ('313', 'hhh', '‎2016‎年‎2‎月‎16‎日‎ ‎1', '0');
INSERT INTO `message` VALUES ('314', 'bbb', '‎2016‎年‎2‎月‎16‎日‎ ‎1', '0');
INSERT INTO `message` VALUES ('315', 'jj', '‎2016‎年‎2‎月‎16‎日‎ ‎1', '0');
INSERT INTO `message` VALUES ('316', 'n[哈哈]', '‎2016‎年‎2‎月‎16‎日‎ ‎1', '0');
INSERT INTO `message` VALUES ('317', 'ewr', '2016/2/17 下午5:15:31', '0');
INSERT INTO `message` VALUES ('318', 'ewrf', '2016/2/17 下午5:15:31', '0');
INSERT INTO `message` VALUES ('319', 'ewrfd', '2016/2/17 下午5:15:31', '0');
INSERT INTO `message` VALUES ('320', 'sdf', '2016/2/17 下午5:15:32', '0');
INSERT INTO `message` VALUES ('321', 'sdfsdf', '2016/2/17 下午5:15:32', '0');

-- ----------------------------
-- Table structure for `message_history`
-- ----------------------------
DROP TABLE IF EXISTS `message_history`;
CREATE TABLE `message_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_id` int(11) NOT NULL COMMENT '消息的id',
  `uid` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '能看到此消息的用户id',
  `type` tinyint(4) NOT NULL COMMENT '1为发送者，0为接收者',
  `read` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0为未读，1为已读',
  `message_type` varchar(255) COLLATE utf8_bin DEFAULT 'single' COMMENT '消息的类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2566 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of message_history
-- ----------------------------
INSERT INTO `message_history` VALUES ('1764', '257', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1765', '257', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1766', '257', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1767', '257', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1768', '257', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1769', '257', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1770', '257', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1771', '257', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyT9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1772', '257', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1773', '257', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1774', '257', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1775', '257', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1776', '257', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1777', '257', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1778', '257', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1779', '257', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1780', '257', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1781', '257', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLU9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1782', '257', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1783', '257', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1784', '257', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLX9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1785', '257', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1', '1', 'group');
INSERT INTO `message_history` VALUES ('1786', '258', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1787', '258', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1788', '258', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1789', '258', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1790', '258', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1791', '258', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1792', '258', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1793', '258', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1794', '258', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyT9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1795', '258', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1796', '258', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1797', '258', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1798', '258', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1799', '258', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1800', '258', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1801', '258', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1802', '258', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1803', '258', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLU9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1804', '258', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1805', '258', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1806', '258', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLX9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1807', '258', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUb', '1', '1', 'group');
INSERT INTO `message_history` VALUES ('1808', '259', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1809', '259', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1810', '259', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1811', '259', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1812', '259', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1813', '259', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1814', '259', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1815', '259', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyT9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1816', '259', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1817', '259', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1818', '259', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1819', '259', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1820', '259', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1821', '259', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1822', '259', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1823', '259', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1824', '259', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1825', '259', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLU9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1826', '259', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1827', '259', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1828', '259', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLX9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1829', '259', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1', '1', 'group');
INSERT INTO `message_history` VALUES ('1830', '260', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1831', '260', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1832', '260', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1833', '260', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1834', '260', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1835', '260', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1836', '260', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1837', '260', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyT9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1838', '260', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1839', '260', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1840', '260', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1841', '260', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1842', '260', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1843', '260', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1844', '260', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1845', '260', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1846', '260', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1847', '260', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLU9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1848', '260', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1849', '260', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1850', '260', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLX9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1851', '260', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1', '1', 'group');
INSERT INTO `message_history` VALUES ('1852', '261', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1853', '261', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1854', '261', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1855', '261', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1856', '261', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1857', '261', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1858', '261', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1859', '261', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyT9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1860', '261', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1861', '261', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1862', '261', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1863', '261', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1864', '261', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1865', '261', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1866', '261', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1867', '261', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1868', '261', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1869', '261', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLU9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1870', '261', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1871', '261', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1872', '261', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLX9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1873', '261', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1', '1', 'group');
INSERT INTO `message_history` VALUES ('1874', '262', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1875', '262', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1876', '262', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1877', '262', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1878', '262', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1879', '262', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1880', '262', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1881', '262', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyT9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1882', '262', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1883', '262', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1884', '262', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1885', '262', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1886', '262', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1887', '262', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1888', '262', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1889', '262', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1890', '262', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1891', '262', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLU9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1892', '262', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1893', '262', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1894', '262', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLX9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1895', '262', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1', '1', 'group');
INSERT INTO `message_history` VALUES ('1896', '263', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1897', '263', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1898', '263', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1899', '263', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1900', '263', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1901', '263', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1902', '263', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1903', '263', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyT9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1904', '263', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1905', '263', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1906', '263', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1907', '263', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1908', '263', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1909', '263', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1910', '263', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1911', '263', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1912', '263', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1913', '263', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLU9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1914', '263', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1915', '263', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1916', '263', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLX9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1917', '263', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1', '1', 'group');
INSERT INTO `message_history` VALUES ('1918', '264', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1919', '264', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1920', '264', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1921', '264', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1922', '264', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1923', '264', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1924', '264', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1925', '264', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyT9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1926', '264', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1927', '264', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1928', '264', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1929', '264', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1930', '264', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1931', '264', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1932', '264', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1933', '264', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1934', '264', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1935', '264', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLU9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1936', '264', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1937', '264', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1938', '264', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLX9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1939', '264', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1', '1', 'group');
INSERT INTO `message_history` VALUES ('1940', '265', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1941', '265', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1942', '265', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1943', '265', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1944', '265', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1945', '265', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1946', '265', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1947', '265', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyT9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1948', '265', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1949', '265', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1950', '265', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1951', '265', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1952', '265', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1953', '265', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1954', '265', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1955', '265', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1956', '265', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1957', '265', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLU9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1958', '265', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1959', '265', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1960', '265', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLX9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1961', '265', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1', '1', 'group');
INSERT INTO `message_history` VALUES ('1962', '266', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1963', '266', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1964', '266', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1965', '266', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1966', '266', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1967', '266', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1968', '266', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1969', '266', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyT9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1970', '266', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1971', '266', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1972', '266', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1973', '266', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1974', '266', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1975', '266', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1976', '266', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1977', '266', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1978', '266', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1979', '266', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLU9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1980', '266', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1981', '266', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1982', '266', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLX9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1983', '266', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1', '1', 'group');
INSERT INTO `message_history` VALUES ('1984', '267', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1985', '267', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1986', '267', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1987', '267', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1988', '267', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1989', '267', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1990', '267', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1991', '267', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyT9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1992', '267', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1993', '267', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1994', '267', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1995', '267', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1996', '267', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1997', '267', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1998', '267', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('1999', '267', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2000', '267', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2001', '267', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLU9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2002', '267', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2003', '267', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2004', '267', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLX9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2005', '267', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1', '1', 'group');
INSERT INTO `message_history` VALUES ('2006', '268', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2007', '268', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2008', '268', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2009', '268', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2010', '268', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2011', '268', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2012', '268', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2013', '268', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyT9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2014', '268', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2015', '268', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2016', '268', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2017', '268', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2018', '268', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2019', '268', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2020', '268', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2021', '268', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2022', '268', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2023', '268', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLU9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2024', '268', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2025', '268', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2026', '268', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLX9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2027', '268', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1', '1', 'group');
INSERT INTO `message_history` VALUES ('2028', '269', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2029', '269', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2030', '269', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2031', '269', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2032', '269', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2033', '269', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2034', '269', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2035', '269', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyT9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2036', '269', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2037', '269', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2038', '269', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2039', '269', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2040', '269', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2041', '269', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2042', '269', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2043', '269', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2044', '269', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2045', '269', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLU9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2046', '269', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2047', '269', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2048', '269', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLX9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2049', '269', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1', '1', 'group');
INSERT INTO `message_history` VALUES ('2050', '270', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2051', '270', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2052', '270', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2053', '270', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2054', '270', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2055', '270', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2056', '270', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2057', '270', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyT9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2058', '270', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2059', '270', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2060', '270', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2061', '270', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2062', '270', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2063', '270', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2064', '270', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2065', '270', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2066', '270', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2067', '270', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLU9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2068', '270', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2069', '270', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2070', '270', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLX9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2071', '270', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1', '1', 'group');
INSERT INTO `message_history` VALUES ('2072', '271', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2073', '271', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2074', '271', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2075', '271', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2076', '271', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2077', '271', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2078', '271', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2079', '271', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyT9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2080', '271', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2081', '271', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2082', '271', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2083', '271', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2084', '271', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2085', '271', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2086', '271', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2087', '271', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2088', '271', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2089', '271', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLU9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2090', '271', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2091', '271', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2092', '271', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLX9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2093', '271', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1', '1', 'group');
INSERT INTO `message_history` VALUES ('2094', '272', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2095', '272', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2096', '272', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2097', '272', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2098', '272', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2099', '272', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2100', '272', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2101', '272', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyT9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2102', '272', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2103', '272', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2104', '272', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2105', '272', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2106', '272', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2107', '272', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2108', '272', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2109', '272', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2110', '272', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2111', '272', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLU9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2112', '272', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2113', '272', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2114', '272', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLX9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2115', '272', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1', '1', 'group');
INSERT INTO `message_history` VALUES ('2116', '273', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2117', '273', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2118', '273', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2119', '273', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2120', '273', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2121', '273', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2122', '273', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2123', '273', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyT9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2124', '273', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2125', '273', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2126', '273', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2127', '273', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2128', '273', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2129', '273', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2130', '273', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2131', '273', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2132', '273', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2133', '273', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLU9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2134', '273', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2135', '273', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2136', '273', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLX9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2137', '273', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1', '1', 'group');
INSERT INTO `message_history` VALUES ('2138', '274', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2139', '274', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2140', '274', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2141', '274', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2142', '274', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2143', '274', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2144', '274', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2145', '274', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyT9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2146', '274', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2147', '274', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2148', '274', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2149', '274', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2150', '274', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2151', '274', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2152', '274', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2153', '274', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2154', '274', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2155', '274', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLU9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2156', '274', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2157', '274', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2158', '274', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLX9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2159', '274', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1', '1', 'group');
INSERT INTO `message_history` VALUES ('2160', '275', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2161', '275', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2162', '275', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2163', '275', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2164', '275', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2165', '275', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2166', '275', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2167', '275', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyT9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2168', '275', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2169', '275', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2170', '275', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2171', '275', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2172', '275', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2173', '275', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2174', '275', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2175', '275', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2176', '275', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2177', '275', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLU9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2178', '275', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2179', '275', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2180', '275', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLX9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2181', '275', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1', '1', 'group');
INSERT INTO `message_history` VALUES ('2182', '276', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2183', '276', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2184', '276', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2185', '276', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2186', '276', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2187', '276', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2188', '276', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2189', '276', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyT9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2190', '276', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2191', '276', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2192', '276', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2193', '276', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2194', '276', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2195', '276', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2196', '276', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2197', '276', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2198', '276', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2199', '276', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLU9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2200', '276', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2201', '276', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2202', '276', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLX9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2203', '276', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1', '1', 'group');
INSERT INTO `message_history` VALUES ('2204', '277', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2205', '277', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2206', '277', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2207', '277', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2208', '277', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2209', '277', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2210', '277', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2211', '277', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyT9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2212', '277', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2213', '277', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2214', '277', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2215', '277', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2216', '277', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2217', '277', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2218', '277', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2219', '277', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2220', '277', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2221', '277', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLU9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2222', '277', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2223', '277', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2224', '277', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLX9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2225', '277', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1', '1', 'group');
INSERT INTO `message_history` VALUES ('2226', '278', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2227', '278', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2228', '278', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2229', '278', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2230', '278', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2231', '278', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2232', '278', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2233', '278', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyT9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2234', '278', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2235', '278', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2236', '278', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2237', '278', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2238', '278', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2239', '278', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2240', '278', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2241', '278', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2242', '278', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2243', '278', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLU9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2244', '278', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2245', '278', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2246', '278', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLX9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2247', '278', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1', '1', 'group');
INSERT INTO `message_history` VALUES ('2248', '279', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2249', '279', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2250', '279', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2251', '279', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2252', '279', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2253', '279', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2254', '279', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2255', '279', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyT9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2256', '279', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2257', '279', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2258', '279', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2259', '279', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2260', '279', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2261', '279', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2262', '279', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2263', '279', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2264', '279', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2265', '279', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLU9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2266', '279', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2267', '279', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2268', '279', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLX9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2269', '279', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1', '1', 'group');
INSERT INTO `message_history` VALUES ('2270', '280', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2271', '280', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2272', '280', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2273', '280', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2274', '280', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2275', '280', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2276', '280', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2277', '280', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyT9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2278', '280', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2279', '280', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2280', '280', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2281', '280', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2282', '280', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2283', '280', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2284', '280', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2285', '280', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2286', '280', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2287', '280', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLU9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2288', '280', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2289', '280', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2290', '280', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLX9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2291', '280', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1', '1', 'group');
INSERT INTO `message_history` VALUES ('2292', '281', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2293', '281', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2294', '281', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2295', '281', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2296', '281', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2297', '281', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2298', '281', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2299', '281', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyT9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2300', '281', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2301', '281', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2302', '281', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2303', '281', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2304', '281', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2305', '281', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2306', '281', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2307', '281', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2308', '281', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2309', '281', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLU9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2310', '281', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2311', '281', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2312', '281', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLX9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2313', '281', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1', '1', 'group');
INSERT INTO `message_history` VALUES ('2314', '282', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2315', '282', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2316', '282', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2317', '282', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2318', '282', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2319', '282', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2320', '282', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2321', '282', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyT9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2322', '282', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2323', '282', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2324', '282', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2325', '282', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2326', '282', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2327', '282', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2328', '282', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2329', '282', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2330', '282', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2331', '282', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLU9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2332', '282', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2333', '282', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2334', '282', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLX9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2335', '282', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1', '1', 'group');
INSERT INTO `message_history` VALUES ('2336', '283', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2337', '283', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2338', '283', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2339', '283', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2340', '283', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2341', '283', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2342', '283', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2343', '283', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyT9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2344', '283', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2345', '283', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2346', '283', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2347', '283', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2348', '283', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2349', '283', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2350', '283', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2351', '283', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2352', '283', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2353', '283', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLU9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2354', '283', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2355', '283', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2356', '283', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLX9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2357', '283', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1', '1', 'group');
INSERT INTO `message_history` VALUES ('2358', '284', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2359', '284', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2360', '284', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2361', '284', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2362', '284', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2363', '284', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2364', '284', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2365', '284', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyT9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2366', '284', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2367', '284', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2368', '284', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2369', '284', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2370', '284', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2371', '284', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2372', '284', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2373', '284', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2374', '284', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2375', '284', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLU9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2376', '284', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2377', '284', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2378', '284', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLX9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2379', '284', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1', '1', 'group');
INSERT INTO `message_history` VALUES ('2380', '285', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2381', '285', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2382', '285', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2383', '285', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2384', '285', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2385', '285', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2386', '285', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2387', '285', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyT9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2388', '285', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2389', '285', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2390', '285', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2391', '285', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2392', '285', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2393', '285', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2394', '285', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2395', '285', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2396', '285', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2397', '285', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLU9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2398', '285', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2399', '285', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2400', '285', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLX9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2401', '285', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1', '1', 'group');
INSERT INTO `message_history` VALUES ('2402', '286', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2403', '286', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2404', '286', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2405', '286', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2406', '286', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2407', '286', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2408', '286', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2409', '286', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyT9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2410', '286', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2411', '286', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2412', '286', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2413', '286', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2414', '286', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2415', '286', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2416', '286', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2417', '286', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2418', '286', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2419', '286', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLU9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2420', '286', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2421', '286', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2422', '286', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLX9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2423', '286', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1', '1', 'group');
INSERT INTO `message_history` VALUES ('2424', '287', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2425', '287', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2426', '287', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2427', '287', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2428', '287', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2429', '287', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2430', '287', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2431', '287', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyT9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2432', '287', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2433', '287', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2434', '287', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2435', '287', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2436', '287', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2437', '287', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2438', '287', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2439', '287', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2440', '287', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUr', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2441', '287', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLU9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2442', '287', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkz', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2443', '287', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkB', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2444', '287', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLX9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2445', '287', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1', '1', 'group');
INSERT INTO `message_history` VALUES ('2446', '288', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1', '1', 'single');
INSERT INTO `message_history` VALUES ('2447', '288', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '0', '1', 'single');
INSERT INTO `message_history` VALUES ('2448', '289', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1', '1', 'single');
INSERT INTO `message_history` VALUES ('2449', '289', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '0', '1', 'single');
INSERT INTO `message_history` VALUES ('2450', '290', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1', '1', 'single');
INSERT INTO `message_history` VALUES ('2451', '290', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLX9', '0', '0', 'single');
INSERT INTO `message_history` VALUES ('2452', '291', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1', '1', 'single');
INSERT INTO `message_history` VALUES ('2453', '291', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLX9', '0', '0', 'single');
INSERT INTO `message_history` VALUES ('2454', '292', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyT9', '1', '1', 'group');
INSERT INTO `message_history` VALUES ('2455', '293', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLv9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2456', '293', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2457', '293', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2458', '293', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2459', '293', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2460', '293', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2461', '293', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2462', '293', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1', '1', 'group');
INSERT INTO `message_history` VALUES ('2463', '294', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLv9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2464', '294', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2465', '294', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2466', '294', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2467', '294', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2468', '294', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2469', '294', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2470', '294', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1', '1', 'group');
INSERT INTO `message_history` VALUES ('2471', '295', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLv9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2472', '295', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2473', '295', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2474', '295', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2475', '295', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2476', '295', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2477', '295', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2478', '295', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1', '1', 'group');
INSERT INTO `message_history` VALUES ('2479', '296', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLv9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2480', '296', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2481', '296', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2482', '296', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2483', '296', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2484', '296', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2485', '296', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2486', '296', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1', '1', 'group');
INSERT INTO `message_history` VALUES ('2487', '297', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLv9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2488', '297', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2489', '297', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2490', '297', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2491', '297', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2492', '297', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2493', '297', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2494', '297', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1', '1', 'group');
INSERT INTO `message_history` VALUES ('2495', '298', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLv9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2496', '298', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2497', '298', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2498', '298', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2499', '298', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2500', '298', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2501', '298', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2502', '298', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1', '1', 'group');
INSERT INTO `message_history` VALUES ('2503', '299', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLv9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2504', '299', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2505', '299', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2506', '299', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2507', '299', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2508', '299', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2509', '299', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2510', '299', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1', '1', 'group');
INSERT INTO `message_history` VALUES ('2511', '300', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLv9', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2512', '300', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXn', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2513', '300', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXX', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2514', '300', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXt', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2515', '300', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXJ', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2516', '300', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXc', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2517', '300', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXb', '0', '1', 'group');
INSERT INTO `message_history` VALUES ('2518', '300', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1', '1', 'group');
INSERT INTO `message_history` VALUES ('2519', '301', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyT9', '1', '1', 'single');
INSERT INTO `message_history` VALUES ('2520', '301', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '0', '1', 'single');
INSERT INTO `message_history` VALUES ('2521', '302', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1', '1', 'single');
INSERT INTO `message_history` VALUES ('2522', '302', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '0', '1', 'single');
INSERT INTO `message_history` VALUES ('2523', '303', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '1', '1', 'single');
INSERT INTO `message_history` VALUES ('2524', '303', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUTJ', '0', '0', 'single');
INSERT INTO `message_history` VALUES ('2525', '304', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '1', '1', 'single');
INSERT INTO `message_history` VALUES ('2526', '304', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUTJ', '0', '0', 'single');
INSERT INTO `message_history` VALUES ('2527', '305', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '1', '1', 'single');
INSERT INTO `message_history` VALUES ('2528', '305', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUTJ', '0', '0', 'single');
INSERT INTO `message_history` VALUES ('2529', '306', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '1', '1', 'single');
INSERT INTO `message_history` VALUES ('2530', '306', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUTJ', '0', '0', 'single');
INSERT INTO `message_history` VALUES ('2531', '307', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '1', '1', 'single');
INSERT INTO `message_history` VALUES ('2532', '307', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUTJ', '0', '0', 'single');
INSERT INTO `message_history` VALUES ('2533', '308', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '1', '1', 'single');
INSERT INTO `message_history` VALUES ('2534', '308', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUTJ', '0', '0', 'single');
INSERT INTO `message_history` VALUES ('2535', '309', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '1', '1', 'single');
INSERT INTO `message_history` VALUES ('2536', '309', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUTJ', '0', '0', 'single');
INSERT INTO `message_history` VALUES ('2537', '310', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '1', '1', 'single');
INSERT INTO `message_history` VALUES ('2538', '310', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUTJ', '0', '0', 'single');
INSERT INTO `message_history` VALUES ('2539', '311', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '1', '1', 'single');
INSERT INTO `message_history` VALUES ('2540', '311', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUTJ', '0', '0', 'single');
INSERT INTO `message_history` VALUES ('2541', '312', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '1', '1', 'single');
INSERT INTO `message_history` VALUES ('2542', '312', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUTJ', '0', '0', 'single');
INSERT INTO `message_history` VALUES ('2543', '313', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '1', '1', 'single');
INSERT INTO `message_history` VALUES ('2544', '313', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUTJ', '0', '0', 'single');
INSERT INTO `message_history` VALUES ('2545', '314', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '1', '1', 'single');
INSERT INTO `message_history` VALUES ('2546', '314', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUTJ', '0', '0', 'single');
INSERT INTO `message_history` VALUES ('2547', '315', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '1', '1', 'single');
INSERT INTO `message_history` VALUES ('2548', '315', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUTJ', '0', '0', 'single');
INSERT INTO `message_history` VALUES ('2549', '316', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '1', '1', 'single');
INSERT INTO `message_history` VALUES ('2550', '316', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUTJ', '0', '0', 'single');
INSERT INTO `message_history` VALUES ('2551', '317', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '0', '0', 'custom');
INSERT INTO `message_history` VALUES ('2552', '317', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTX', '0', '0', 'custom');
INSERT INTO `message_history` VALUES ('2553', '317', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1', '1', 'custom');
INSERT INTO `message_history` VALUES ('2554', '318', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '0', '0', 'custom');
INSERT INTO `message_history` VALUES ('2555', '318', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTX', '0', '0', 'custom');
INSERT INTO `message_history` VALUES ('2556', '318', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1', '1', 'custom');
INSERT INTO `message_history` VALUES ('2557', '319', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '0', '0', 'custom');
INSERT INTO `message_history` VALUES ('2558', '319', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTX', '0', '0', 'custom');
INSERT INTO `message_history` VALUES ('2559', '319', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1', '1', 'custom');
INSERT INTO `message_history` VALUES ('2560', '320', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '0', '0', 'custom');
INSERT INTO `message_history` VALUES ('2561', '320', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTX', '0', '0', 'custom');
INSERT INTO `message_history` VALUES ('2562', '320', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1', '1', 'custom');
INSERT INTO `message_history` VALUES ('2563', '321', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', '0', '0', 'custom');
INSERT INTO `message_history` VALUES ('2564', '321', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTX', '0', '0', 'custom');
INSERT INTO `message_history` VALUES ('2565', '321', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', '1', '1', 'custom');

-- ----------------------------
-- Table structure for `relation`
-- ----------------------------
DROP TABLE IF EXISTS `relation`;
CREATE TABLE `relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL COMMENT '聊天组id',
  `message_id` int(11) NOT NULL COMMENT '消息的id',
  `msg_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0为普通消息，1图片，2文档，3抖动',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=322 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of relation
-- ----------------------------
INSERT INTO `relation` VALUES ('257', '204', '257', '0');
INSERT INTO `relation` VALUES ('258', '206', '258', '0');
INSERT INTO `relation` VALUES ('259', '207', '259', '0');
INSERT INTO `relation` VALUES ('260', '208', '260', '0');
INSERT INTO `relation` VALUES ('261', '208', '261', '0');
INSERT INTO `relation` VALUES ('262', '208', '262', '0');
INSERT INTO `relation` VALUES ('263', '208', '263', '0');
INSERT INTO `relation` VALUES ('264', '208', '264', '0');
INSERT INTO `relation` VALUES ('265', '208', '265', '0');
INSERT INTO `relation` VALUES ('266', '208', '266', '0');
INSERT INTO `relation` VALUES ('267', '208', '267', '0');
INSERT INTO `relation` VALUES ('268', '208', '268', '0');
INSERT INTO `relation` VALUES ('269', '208', '269', '0');
INSERT INTO `relation` VALUES ('270', '208', '270', '0');
INSERT INTO `relation` VALUES ('271', '208', '271', '0');
INSERT INTO `relation` VALUES ('272', '209', '272', '0');
INSERT INTO `relation` VALUES ('273', '209', '273', '0');
INSERT INTO `relation` VALUES ('274', '209', '274', '0');
INSERT INTO `relation` VALUES ('275', '209', '275', '0');
INSERT INTO `relation` VALUES ('276', '209', '276', '0');
INSERT INTO `relation` VALUES ('277', '209', '277', '0');
INSERT INTO `relation` VALUES ('278', '209', '278', '0');
INSERT INTO `relation` VALUES ('279', '209', '279', '0');
INSERT INTO `relation` VALUES ('280', '209', '280', '0');
INSERT INTO `relation` VALUES ('281', '210', '281', '0');
INSERT INTO `relation` VALUES ('282', '210', '282', '0');
INSERT INTO `relation` VALUES ('283', '210', '283', '0');
INSERT INTO `relation` VALUES ('284', '210', '284', '0');
INSERT INTO `relation` VALUES ('285', '210', '285', '0');
INSERT INTO `relation` VALUES ('286', '210', '286', '0');
INSERT INTO `relation` VALUES ('287', '210', '287', '0');
INSERT INTO `relation` VALUES ('288', '212', '288', '0');
INSERT INTO `relation` VALUES ('289', '212', '289', '0');
INSERT INTO `relation` VALUES ('290', '213', '290', '0');
INSERT INTO `relation` VALUES ('291', '213', '291', '1');
INSERT INTO `relation` VALUES ('292', '215', '292', '0');
INSERT INTO `relation` VALUES ('293', '218', '293', '0');
INSERT INTO `relation` VALUES ('294', '218', '294', '0');
INSERT INTO `relation` VALUES ('295', '218', '295', '0');
INSERT INTO `relation` VALUES ('296', '218', '296', '0');
INSERT INTO `relation` VALUES ('297', '218', '297', '0');
INSERT INTO `relation` VALUES ('298', '218', '298', '0');
INSERT INTO `relation` VALUES ('299', '218', '299', '0');
INSERT INTO `relation` VALUES ('300', '218', '300', '0');
INSERT INTO `relation` VALUES ('301', '225', '301', '0');
INSERT INTO `relation` VALUES ('302', '212', '302', '0');
INSERT INTO `relation` VALUES ('303', '228', '303', '3');
INSERT INTO `relation` VALUES ('304', '228', '304', '0');
INSERT INTO `relation` VALUES ('305', '228', '305', '0');
INSERT INTO `relation` VALUES ('306', '228', '306', '0');
INSERT INTO `relation` VALUES ('307', '228', '307', '0');
INSERT INTO `relation` VALUES ('308', '228', '308', '0');
INSERT INTO `relation` VALUES ('309', '228', '309', '0');
INSERT INTO `relation` VALUES ('310', '228', '310', '0');
INSERT INTO `relation` VALUES ('311', '228', '311', '0');
INSERT INTO `relation` VALUES ('312', '228', '312', '0');
INSERT INTO `relation` VALUES ('313', '228', '313', '0');
INSERT INTO `relation` VALUES ('314', '228', '314', '0');
INSERT INTO `relation` VALUES ('315', '228', '315', '0');
INSERT INTO `relation` VALUES ('316', '228', '316', '0');
INSERT INTO `relation` VALUES ('317', '223', '317', '0');
INSERT INTO `relation` VALUES ('318', '223', '318', '0');
INSERT INTO `relation` VALUES ('319', '223', '319', '0');
INSERT INTO `relation` VALUES ('320', '223', '320', '0');
INSERT INTO `relation` VALUES ('321', '223', '321', '0');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `employee_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `fullName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `eMail` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `enName` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `sex` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `departmentId` int(11) DEFAULT NULL,
  `departmentName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `postion` varchar(255) COLLATE utf8_bin DEFAULT '',
  `mobile` int(11) DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `op` (`openid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTB', 'test00', '系统管理员', 'services@icom2work.com', 'Administrator', 'M', '1', null, '谜一样的男人', null, '14f1ca9bc28f26664f07fbdfdb525d2c.jpg');
INSERT INTO `users` VALUES ('2', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTn', 'GZGZ0013', '杜献韬', '61886468@qq.com', 'Xavier', 'M', '1', null, '项目组长', null, 'da075bc51e5e48856ca50abcd4558b86.jpg');
INSERT INTO `users` VALUES ('3', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTX', 'GZGZ0010', '罗耀康', '315061277@qq.com', 'Yelken', 'M', '1', null, 'PHP开发工程师', null, '4bf8e4822ff4785046c61d41d052b7d7.jpg');
INSERT INTO `users` VALUES ('4', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTt', 'GZGZ0002', '黎诺勤', 'kleine.li@icom2work.com', 'Kleine', 'M', '1', null, '运营总监', null, '61555fce47bba17ff0c6177e9b307748.jpg');
INSERT INTO `users` VALUES ('5', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTJ', 'GZGZ0003', '陈家辞', 'alex.chen@icom2work.com', 'Alex', 'M', '1', null, '产品总监', null, '01bfb8b0c5d9971a6f6e30d7ec5bf93c.jpg');
INSERT INTO `users` VALUES ('6', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTc', 'GZGZ0022', '赵碧霞', 'alice.zhao@icom2work.com', 'Alice', 'F', '1', null, '人力资源产品经理', null, '58f50f8efeec1d2cd8ce7a98a5ad93e0.jpg');
INSERT INTO `users` VALUES ('7', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTb', 'GZGZ0020', '郑子豪', 'piko.zheng@icom2work.com', 'Piko', 'M', '1', null, '售后工程师', null, 'fe6ff4eb5a0f7bb34348ddbff4112a72.png');
INSERT INTO `users` VALUES ('8', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyTr', 'test0001', '测试猿', 'xaviertoo@outlook.com', 'test', null, '1', null, '', null, '3d1ad9750d71b4348f4cd7fe470373ba.jpg');
INSERT INTO `users` VALUES ('9', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gyT9', 'GZGZ0005', '曾耀钧', 'john.zeng@icom2work.com', 'John', 'M', '1', null, '技术经理', null, '2584b82b169768dd5ffbc2f5ab5f0b47.png');
INSERT INTO `users` VALUES ('10', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUz', 'GZGZ0007', '梁文翔', 'frank.liang@icom2work.com', 'Frank', 'M', '1', null, '项目策划', null, '38ae5ecea5acec110655bbd2451f87a2.jpg');
INSERT INTO `users` VALUES ('11', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUB', 'GZGZ0015', '张敏宁', 'miki.zhang@icom2work.com', 'Miki', 'F', '1', null, '办公室助理', null, '5b0d40104dd58d46ae57ded760b2e59f.jpg');
INSERT INTO `users` VALUES ('12', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUn', 'GZGZ0014', '古建明', 'jianming.gu@icom2work.com', 'Ming', 'M', '1', null, '前端工程师', null, '8d5314edc6f6c235ed7c9a64487677d0.jpg');
INSERT INTO `users` VALUES ('13', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUX', 'GZGZ0017', '陈思海', 'coman.chen@icom2work.com', 'Coman', 'M', '1', null, '前端工程师', null, '3a65c1fcdd244130a69416390005cb1a.png');
INSERT INTO `users` VALUES ('14', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUt', 'GZGZ0019', '陈纪强', 'jq.chen@icom2work.com', 'JQ', 'M', '1', null, 'PHP开发工程师', null, '3eb62650158ed38bc74d8b5fd0d22938.png');
INSERT INTO `users` VALUES ('15', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUJ', 'GZGZ0018', '梁艳', 'sunday.liang@icom2work.com', 'Sunday', 'F', '1', null, 'UI设计师', null, '3b0e03ddf6c7a0897ccc6fdf62d241a4.jpg');
INSERT INTO `users` VALUES ('16', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUc', 'GZGZ0021', '潘伟伦', 'will.pan@icom2work.com', 'Will', 'M', '1', null, '前端工程师', null, '007860585d88191c903f25e2442123cd.png');
INSERT INTO `users` VALUES ('17', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUb', 'GZGZ0023', '覃志鹏', 'alvin.qin@icom2work.com', 'alvin', 'M', '1', null, 'PHP编程员', null, 'de8110c4b39234cb77b060325cf8356c.png');
INSERT INTO `users` VALUES ('18', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUr', 'GZGZ0025', '甘敏杰', 'minjie.gan@icom2work.com', 'Minjie', 'M', '1', null, '售后工程师', null, '93c31b92633cb1811a59b25ca5adc668.jpg');
INSERT INTO `users` VALUES ('19', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLU9', 'GZGZ0008', '杨卓', '421246363@qq.com', 'Yang', 'M', '1', null, '工作流开发工程师', null, 'a519b5b2b2d73181912cf3200f28c74e.png');
INSERT INTO `users` VALUES ('20', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkz', 'GZGZ0012', '杨云峰', '601958331@qq.com', 'Efun', 'M', '1', null, '移动应用开发工程师', null, '513ae3ae3bc91e6ca6fdbd07294668c6.gif');
INSERT INTO `users` VALUES ('21', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkB', 'GZGZ0011', '卢泉', '706402516@qq.com', 'Eeb', 'M', '1', null, '移动应用开发工程师', null, '1b4054fb6b73368f021d5c2550bcfac0.png');
INSERT INTO `users` VALUES ('22', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkn', 'CXTGZ0001', '练妙平', 'annie.lian@wendydigital.com', 'Annie', 'F', '2', null, '集团副总经理', null, '9120ee644b9b28d321276663a10961c8.png');
INSERT INTO `users` VALUES ('23', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkX', 'CXTGZ0002', '卢冠毅', 'maggie.lu@finapower.com', 'Maggie', 'M', '2', null, '集团总监', null, 'e686ecedc364467fc2df734583e5b1f1.png');
INSERT INTO `users` VALUES ('24', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkt', 'CXTGZ0003', '林晓耿', 'sherry.lin@finapower.com', 'Sherry', 'F', '2', null, '集团总监', null, '49cb3f4434f2e173e7ecd27422118aea.png');
INSERT INTO `users` VALUES ('25', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkJ', 'CXTGZ0005', '黎燊', 'leo.lai@finapower.com', 'Leo', 'M', '2', null, '项目总监', null, '58020bc127934431207b00a35ac4c365.png');
INSERT INTO `users` VALUES ('26', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkc', 'CXTGZ0006', '蒋滔炜', 'terry.jiang@finapower.com', 'Terry', 'M', '2', null, '项目总监', null, '9005dd7e8aa2d601d5529613bb319f0c.png');
INSERT INTO `users` VALUES ('27', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkb', 'CXTGZ0007', '陈俊亮', 'nick.chen@finapower.com', 'Nick', 'M', '2', null, '项目经理', null, '3b20d4810b08a2b3af91a32a2fc6c673.png');
INSERT INTO `users` VALUES ('28', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLkr', 'CXTGZ0008', '齐英豪', 'jonah.qi@finapower.com', 'Jonah', 'M', '2', null, '项目经理', null, '79436f67b5f1c11987fbb0cc83c314e0.png');
INSERT INTO `users` VALUES ('29', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLk9', 'CXTGZ0027', '潘军', 'panda.pan@finapower.com', 'Panda', 'M', '2', null, '集团副总经理', null, '80abf2d5daccf4ac952c3feac6faf3d7.png');
INSERT INTO `users` VALUES ('30', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLhz', 'CXTGZ0015', '罗千红', 'lucy.luo@finapower.com', 'Lucy', 'F', '2', null, '项目总监', null, '6ca9b51cb61a2d06373189cdd1dbc22b.png');
INSERT INTO `users` VALUES ('31', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLhB', 'CXTGZ0025', '方圻', 'charlotte.fang@finapower.com', 'Charlotte', 'F', '2', null, '项目专员', null, '875b75ef9c5297272702d35c4841a602.png');
INSERT INTO `users` VALUES ('32', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLhn', 'CXTGZ0020', '胡安玲', 'echo.hu@finapower.com', 'Echo', 'F', '2', null, '项目总监', null, 'ff3dd48c31e0a56f944d090ee50b87b5.png');
INSERT INTO `users` VALUES ('33', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLhX', 'CXTGZ0013', '杨紫丽', 'zaile.yang@finapower.com', 'Zaile', 'F', '2', null, '项目经理', null, '846a8abad2a8abf07b3f04bf980d99ee.png');
INSERT INTO `users` VALUES ('34', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLht', 'CXTGZ0028', '黄启健', 'ken.huang@finapower.com', 'Ken', 'M', '2', null, '项目经理', null, '0c914bfba940ef927320c5dae82e1f36.png');
INSERT INTO `users` VALUES ('35', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLhJ', 'CXTGZ0012', '林欣瑜', 'cindy.lin@finapower.com', 'Cindy', 'F', '2', null, '项目专员', null, '22e593cba324eec23a0dd5c5bfc46db6.png');
INSERT INTO `users` VALUES ('36', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLhc', 'CXTGZ0014', '陈柏淇', 'ken.chen@finapower.com', 'Ken', 'M', '2', null, '项目专员', null, 'a33ba7de30618983dda8eeb1e0516f47.png');
INSERT INTO `users` VALUES ('37', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLhb', 'CXTGZ0018', '张晓雷', 'jacky.zhang@finapower.com', 'Jacky', 'M', '2', null, '集团总监', null, 'ebc58ff0f35ffe2a27693d8203607267.png');
INSERT INTO `users` VALUES ('38', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLhr', 'CXTGZ0024', '庄苾', 'abbie.zhuang@finapower.com', 'Abbie', 'F', '2', null, '人力资源主管', null, '11e8e168d74a5afa6b6ee5933154ddab.png');
INSERT INTO `users` VALUES ('39', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLh9', 'CXTGZ0029', '神宝琪', 'lucy.shen@finapower.com', 'Lucy', 'M', '2', null, '人力资源主管', null, '3b27faf590d2f6da37d1ace7c9419b39.png');
INSERT INTO `users` VALUES ('40', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLvz', 'CXTGZ0030', '祝青', 'vicky.zhu@finapower.com', 'Vicky', 'F', '2', null, '项目经理', null, 'e01780a4e1db7091570bffb48378e776.png');
INSERT INTO `users` VALUES ('41', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLvB', 'GDWD0001', '关丽芬', 'wendy.kwan@wendydigital.com', 'Wendy', 'F', '4', null, '董事局主席', null, 'ba1d454c8e3dbee32080e6c7172e6950.png');
INSERT INTO `users` VALUES ('42', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLvn', 'GDWD0002', '关丽华', 'nicole.kwan@wendydigital.com', 'Nicole', 'F', '11', null, '审计总监', null, 'b2aff8b7787dcebd37ebd15d1716ec06.png');
INSERT INTO `users` VALUES ('43', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLvX', 'GDWD0003', '关丽碧', 'ivy.kwan@wendydigital.com', 'Ivy', 'F', '5', null, '总经理', null, 'e5b8b9a33ab53e59e3dd118b76d0d697.png');
INSERT INTO `users` VALUES ('44', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLvt', 'GZWD0042', '于群瑶', 'evans.yu@wendydigital.com', 'Evans', 'F', '12', null, '副总监', null, '96772e2abf5a40479d22f6691cac53a1.png');
INSERT INTO `users` VALUES ('45', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLvJ', 'GDWD0040', '袁茵', 'doris.yuan@wendydigital.com', 'Doris', 'F', '12', null, '总监', null, '556efc0a6376d549a106ea67d4bafedc.png');
INSERT INTO `users` VALUES ('46', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLvc', 'GDWD0041', '罗淑妮', 'kayuri.luo@wendydigital.com', 'Kayuri', 'F', '5', null, '董事长助理', null, '6858b1f92fc64ca9df75ade16e78b813.jpg');
INSERT INTO `users` VALUES ('47', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLvb', 'GDWD0006', '杨宇', 'kevin.yang@wendydigital.com', 'Kevin', 'M', '13', null, '人力资源总监', null, '253708e2d9da86dfd5d4f5e9421d45b8.png');
INSERT INTO `users` VALUES ('48', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLvr', 'GDWD0037', '龙方程', 'tina.long@wendydigital.com', 'Tina', 'F', '13', null, '人力资源经理', null, '50a5ee56a5d62031c5ce46063aa0508d.png');
INSERT INTO `users` VALUES ('49', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLv9', 'GZYXHR0009', '罗君兰', 'niki.luo@ezhenghe.com', 'Niki', 'F', '16', null, '人力资源专员', null, 'f6950c5fa5738c68a3046e101f232808.png');
INSERT INTO `users` VALUES ('50', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLZz', 'GDWD0012', '曹国媚', 'eva.cao@wendydigital.com', 'Eva Cao', 'F', '14', null, '行政经理', null, '0c02995979f017ad3db79812a2fd6b37.jpg');
INSERT INTO `users` VALUES ('51', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLZB', 'GDWD0016', '陈文豪', 'tony.chen@wendydigital.com', 'Tony', 'M', '5', null, '董事会秘书', null, '3ced5cc84c28b1f2ea579b004feccaaa.png');
INSERT INTO `users` VALUES ('52', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLZn', 'GDWD0017', '付咏梅', 'candy.fu@wendydigital.com', 'Candy', 'F', '5', null, '证券事务代表', null, 'b52347cbf2f54bd89a0f2d16a33ece13.png');
INSERT INTO `users` VALUES ('53', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLZX', 'GDWD0018', '王立军', 'jason.wang@wendydigital.com', 'Jason ', 'M', '15', null, '财务总监', null, '1ffebfc062fc5b223709ad84eb6de0b7.png');
INSERT INTO `users` VALUES ('54', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLZt', 'GDWD0019', '黄茵莹', 'kris.huang@wendydigital.com', 'Kris', 'F', '15', null, '财务经理', null, 'd43cc66c630d69cda1df07302493225c.png');
INSERT INTO `users` VALUES ('55', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLZJ', 'GDWD0020', '邓春霞', 'joey.deng@wendydigital.com', 'Joey', 'F', '15', null, '税务会计', null, '9db8e55d1de367fe82fcf652ac063dad.png');
INSERT INTO `users` VALUES ('56', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLZc', 'GDWD0021', '张伟兰', 'ellen.zhang@wendydigital.com', 'Ellen', 'F', '15', null, '出纳', null, 'bac924dc7b4e3eecd1c613d11caa3a21.png');
INSERT INTO `users` VALUES ('57', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLZb', 'GDWD0038', '郭凤仪', 'stephanie.guo@wendydigital.com', 'Stephanie', 'F', '15', null, '应收会计', null, 'e321386e83d2d8f5e3e4695dc31bb07c.jpg');
INSERT INTO `users` VALUES ('58', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLZr', 'GDWD0031', '方小敏', 'fiona.fang@wendydigital.com', 'Fiona', 'F', '10', null, '总监', null, '8a0092ea940ac9b4b84f0f9253e88f79.png');
INSERT INTO `users` VALUES ('59', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLZ9', 'GDWD0032', '李建芳', 'sophia.li@wendydigital.com', 'Sophia', 'F', '10', null, '副总监', null, '8e777f72e010cf598d26c1354dc74549.png');
INSERT INTO `users` VALUES ('60', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXz', 'GDWD0033', '彭志华', 'pan.peng@wendydigital.com', 'Pan', 'M', '10', null, '公关经理', null, 'b269f213b4890c66d28d959375f80e55.png');
INSERT INTO `users` VALUES ('61', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXB', 'GDWD0034', '李婧琦', 'tina.li@wendydigital.com', 'Tina ', 'F', '10', null, '策划经理', null, 'afeb99f01fa85113a4ff3fd2d92ddac3.png');
INSERT INTO `users` VALUES ('62', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXn', 'GZYXHR0001', '苏秋端', 'suki.su@wendydigital.com', 'Suki', 'F', '16', null, '人力资源经理', null, 'fa9236382b9759c5561fe02610a70ac0.jpg');
INSERT INTO `users` VALUES ('63', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXX', 'GZYXHR0003', '谭敬欣', 'kinki.tan@wendydigital.com', 'Kinki', 'F', '16', null, '人力资源专员', null, '32bc5faec5a09ceba7d82da23a94bbf1.png');
INSERT INTO `users` VALUES ('64', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXt', 'GZYXHR0002', '韩梦娜', 'mona.han@wendydigital.com', 'Mona', 'F', '16', null, '薪酬专员', null, '4addb3d67d65204f0716cd49bd72e1e1.png');
INSERT INTO `users` VALUES ('65', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXJ', 'GZYXHR0007', '卢洁萍', 'noel.lu@ezhenhe.com', 'Noel', 'F', '16', null, '项目经理', null, 'f0d0a198485ed39d857eea98a8c8a9e3.png');
INSERT INTO `users` VALUES ('66', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXc', 'GZYXHR0008', '邓嘉敏', 'jamie.deng@ezhenhe.com', 'Jamie', 'F', '16', null, '招聘专员', null, '7e5f3e5a6e1d515f5537f31e8c1e130b.png');
INSERT INTO `users` VALUES ('67', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLXb', 'GZYXHR0005', '杨菁华', 'carolina.yang@ezhenhe.com', 'Carolina', 'F', '16', null, '总经理', null, '959febc9c1a8b820b9d43be00660ce87.png');
INSERT INTO `users` VALUES ('68', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLX9', '', '欧天成', '104770788@qq.com', 'godsam', 'M', '1', null, '工作流开发', null, '94d5c7288e52e642dd3002f1079f97bb.png');
INSERT INTO `users` VALUES ('69', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gL3z', null, '面试访客', 'services@icom2work.com', 'Interview Guest', null, null, null, null, null, 'f25169412d52c397078fb5623b8f9d1d.png');
INSERT INTO `users` VALUES ('70', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLBz', '', '测试测试', 'test2@icom2work.com', 'ctest', null, null, null, '', null, 'f0d3b5a733ad43e222cda90eca315c53.png');
INSERT INTO `users` VALUES ('71', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLBB', 'GZZH0046', '吴小川', 'jeff.wu@ezhenhe.com', 'Jeff', 'M', '27', null, '投资管理部总经理', null, 'd41432172b995cee09be8a810f764485.png');
INSERT INTO `users` VALUES ('72', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLBn', 'GZZH0001', '劳慧君', 'jen.lao@wendydigital.com', 'Jen', 'F', '27', null, '行政专员', null, '38cf9d7555850e3bd5a4507a51f02ec5.png');
INSERT INTO `users` VALUES ('73', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLBX', 'GZZH0035', '马蔚然', 'janet.ma@ezhenhe.com', 'Janet', 'F', '27', null, '行政经理', null, 'c1a8e876ccca9d2100df4b22560bb469.png');
INSERT INTO `users` VALUES ('74', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLBt', 'GZZH0003', '梁子兢', 'crystal.liang@ezhenhe.com', 'Crystal', 'F', '27', null, '行政主管', null, '1b5a11592f7af2dfdb16c85e9c308176.png');
INSERT INTO `users` VALUES ('75', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLBJ', 'GZZH0048', '林群立', 'johnson.lin@ezhenhe.com', 'Johnson', 'M', '27', null, '财务总监', null, '18f133a8949c6541a4d113fcb083e9f3.png');
INSERT INTO `users` VALUES ('76', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLBc', 'GZZH0038', '林良科', 'ken.lin@ezhenhe.com', 'Ken', 'M', '27', null, '财务经理', null, 'd8952a00278b26a51f2c2649bcce9dd3.png');
INSERT INTO `users` VALUES ('77', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLBb', 'GZZH0039', '陈慧思', 'vicky.chen@ezhenhe.com', 'Vicky', 'F', '27', null, '主办会计', null, '4a15747b0ff1e786ff263688cd3d6784.png');
INSERT INTO `users` VALUES ('78', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLBr', 'GZZH0009', '郑嘉', 'carol.zheng@ezhenhe.com', 'Carol', 'F', '27', null, '出纳', null, 'a0ec3d7f8c860340a435b31836f06874.png');
INSERT INTO `users` VALUES ('79', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLB9', 'GZZH0010', '李艳芬', 'fen.li@ezhenhe.com', 'Fen', 'F', '27', null, '会计', null, '2ba8c8799272eb964008a1a98f94143c.png');
INSERT INTO `users` VALUES ('80', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLfz', 'GZZH0027', '孙宇', 'sun.yu@ezhenhe.com', 'Peter', 'M', '27', null, '客户总监', null, 'c5f7942478619f01a7f963aeaef2d7c7.png');
INSERT INTO `users` VALUES ('81', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLfB', 'GZZH0028', '魏玲', 'wei.ling@ezhenhe.com', 'Ling', 'F', '27', null, '客户经理', null, '9a74546ea0b7e8140ce131c344a3a9c8.png');
INSERT INTO `users` VALUES ('82', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLfn', 'GZZH0037', '董明勤', 'dongming.qin@ezhenhe.com', 'Sunny', 'M', '27', null, '高级策划经理', null, '3bea47f92952f582042ee4b42ecd0242.png');
INSERT INTO `users` VALUES ('83', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLfX', 'GZZH0034', '陈秋娜', 'alicia.chen@ezhenhe.com', 'Alicia', 'F', '27', null, '互动策划主管', null, '3fd20dfcf7490100b0579c5fec30bc5a.png');
INSERT INTO `users` VALUES ('84', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLft', 'GDWD0036', '梁静雅', 'jessiea-ya@163.com', 'Jessie', 'F', '27', null, '媒介专员', null, '74f2c4f6bda9a05d7aa6aa7225c20d51.png');
INSERT INTO `users` VALUES ('85', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLfJ', 'GZWR0003', '张欢欢', 'echo.zhang@biyatech.com', 'Echo', 'F', '28', null, '人力资源总监', null, '604e20ea9154fe6a7b10d41e659069bb.png');
INSERT INTO `users` VALUES ('86', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLfc', 'GZWR0005', '吴漫丽', 'marry.wu@biyatech.com', 'Marry', 'F', '28', null, '人事行政经理', null, '9365eadded35910aab3f3560beb5906c.png');
INSERT INTO `users` VALUES ('87', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLfb', 'GZWR0004', '陈兴', 'alan.chen@biyatech.com', 'Alan', 'M', '28', null, '高级产品经理', null, '043f59e61436d2f422391334e3a03a2d.png');
INSERT INTO `users` VALUES ('88', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLfr', 'GZWR0008', '张学宁', 'nick.zhang@biyatech.com', 'Nick', 'M', '28', null, 'PHP程序员', null, 'e9e5b8657217bea2b46f087258a4d843.png');
INSERT INTO `users` VALUES ('89', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLf9', 'GZWR0007', '何子扬', 'zion.he@biyatech.com', 'Zion', 'M', '28', null, 'UI设计师', null, '210ef1162f8cb34c19e646d4cb9e8ee7.png');
INSERT INTO `users` VALUES ('90', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUTz', 'GZWR0010', '朱俊杰', 'jacky.zhu@biyatech.com', 'Jacky', 'M', '28', null, 'PHP工程师', null, 'a3e9368c826fd2eda9d3bbb7007b49eb.png');
INSERT INTO `users` VALUES ('91', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUTB', '', '甘敏霖', 'gerry.gan@wendydigital.com', 'Gerry', 'M', '29', null, '董事长', null, '3b7f91efb6ea25f545967174fcfde7b0.png');
INSERT INTO `users` VALUES ('92', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUTn', 'GZBY0003', '朱春国', 'king.zhu@biyatech.com', 'King', 'M', '32', null, '技术总监', null, 'c7f5f02bd5e74f7f9ec772fbf83a319d.png');
INSERT INTO `users` VALUES ('93', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUTX', 'GZBY0006', '邓晖', 'vivian.deng@biyatech.com', 'Vivian', 'F', '32', null, '财务总监', null, '2fdd028799344b3bd6674e3568fbe872.png');
INSERT INTO `users` VALUES ('94', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUTt', 'GZBY0022', '张丽嘉', 'ricky.zhang@biyatech.com', 'Ricky', 'F', '32', null, '总经理助理', null, '08642371265e488e8c3d7f9b6ed23a11.jpg');
INSERT INTO `users` VALUES ('95', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUTJ', 'GZBY0017', '张艳玲', 'ling.zhang@biyatech.com', 'Ling', 'F', '29', null, '结算员', null, '8142218185963dc0ec2f5e981472235f.png');
INSERT INTO `users` VALUES ('96', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUTc', 'GZBY0023', '江颖欣', 'kama.jiang@biyatech.com', 'Kama', 'F', '31', null, '行政经理', null, '04e05b9865ed0fe159d8983ddb23f5fd.png');
INSERT INTO `users` VALUES ('97', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUTb', 'GZBY0024', '卢绮妮', 'lily.lu@biyatech.com', 'Lily', 'F', '31', null, '行政专员', null, '8ac97a2f892a1e691e41abc959957c64.png');
INSERT INTO `users` VALUES ('98', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUTr', 'GZBY0026', '劳琪琦', 'irene.lao@wendydigital.com', 'Irene', 'F', '14', null, '行政专员', null, '93657bfcf7c4e351f3055498fe3f3795.png');
INSERT INTO `users` VALUES ('99', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUT9', 'GZBY0027', '马丽仪', 'lili.ma@biyatech.com', 'Lili', 'F', '30', null, '财务出纳', null, 'd4f2da2e706412dca30f3392bfa509b4.png');
INSERT INTO `users` VALUES ('100', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUUz', 'GZBY0063', '胡桂芳', 'sulli.hu@biyatech.com', 'Sulli', 'F', '30', null, '会计', null, 'fc4160536666c439f509df193b2979a2.png');
INSERT INTO `users` VALUES ('101', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUUB', 'GZBY0036', '韩芬', 'vivian.han@biyatech.com', 'Vivian', 'F', '29', null, '推广部经理', null, '9f812fc2df473048960fd727c3a157ac.png');
INSERT INTO `users` VALUES ('102', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUUn', 'GZBY0038', '黄国剑', 'jerry.huang@biyatech.com', 'Jerry', 'M', '33', null, '产品开发经理', null, 'a446887306a21fc336f4f1e879954c8b.png');
INSERT INTO `users` VALUES ('103', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUUX', 'GZBY0039', '李雁', 'pierre.li@biyatech.com', 'Pierre', 'M', '33', null, '技术主管', null, 'bd45c2f96df4e117d22a5640f7730bfb.png');
INSERT INTO `users` VALUES ('104', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUUt', 'GZBY0040', '许海波', 'bob.xu@biyatech.com', 'Bob', 'M', '33', null, 'PHP程序员', null, '70d61a1a3428e831e0131bde2050eca2.png');
INSERT INTO `users` VALUES ('105', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUUJ', 'GZBY0041', '陈东剑', 'terry.chen@biyatech.com', 'terry', 'M', '33', null, 'web前端开发', null, '7519517564f12435f0655d146bc050f6.png');
INSERT INTO `users` VALUES ('106', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUUc', 'GZBY0042', '曾云龙', 'kenneth.zeng@biyatech.com', 'Kenneth', 'M', '33', null, 'PHP程序员', null, '4b414da3d8acd521b0cd55e594ae8bcd.png');
INSERT INTO `users` VALUES ('107', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUUb', 'GZBY0043', '关旗少', 'johnny.guan@biyatech.com', 'Johnny', 'M', '33', null, 'PHP程序员', null, '7d948f49f7820fc50bdc01de87c04735.png');
INSERT INTO `users` VALUES ('108', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUUr', 'GZBY0044', '黄洁霞', 'jie.huang@biyatech.com', 'jie', 'F', '33', null, 'PHP程序员', null, 'c959bc40b3c97082a921f10271bfd95b.png');
INSERT INTO `users` VALUES ('109', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUU9', 'GZBY0047', '郑日曾', 'jackie.zheng@biyatech.com', 'Jackie', 'M', '33', null, 'web前端开发', null, 'db3064957bf7f9e082e570f3c3f7f40a.png');
INSERT INTO `users` VALUES ('110', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUkz', 'GZBY0066', '杨海涛', '270441134@qq.com', 'Heter', 'M', '33', null, 'PHP工程师', null, 'b5343c72de19d44716a789b05a5b9dc3.png');
INSERT INTO `users` VALUES ('111', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUkB', 'GZBY0069', '曾健毅', 'carlton.zeng@biyatech.com', 'Carlton', 'M', '33', null, 'PHP工程师', null, '2bd27ed235b5f035c805c7c34ac26501.png');
INSERT INTO `users` VALUES ('112', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUkn', 'GZBY0071', '易嘉杰', 'terrye.yi@biyatech.com', 'Terry', 'M', '33', null, 'PHP工程师', null, 'd02252d60a8df7fa3c256d04ed09301f.png');
INSERT INTO `users` VALUES ('113', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUkX', 'GZBY0073', '柯振泳', 'yong.ke@biyatech.com', 'Yong', 'M', '33', null, 'PHP开发主管', null, '64140205a3d2e86cec8bc67e20f7a7c0.png');
INSERT INTO `users` VALUES ('114', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUkt', 'GZBY0076', '黎山', 'hill.li@biyatech.com', 'Hill', 'M', '33', null, 'PHP工程师', null, '2f55a03f404813410f48fa1a3788d9fc.png');
INSERT INTO `users` VALUES ('115', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUkJ', 'GZBY0075', '卢春霞', '260945493@qq.com', 'Lulu', 'F', '34', null, '软件测试主管', null, 'e7ad72079d42f537c847e606cc58b50d.png');
INSERT INTO `users` VALUES ('116', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUkc', 'GZBY0050', '周娟', 'sandy.zhou@biyatech.com', 'Sandy', 'F', '34', null, 'web测试员', null, '84d65f48f1b3bd05ba81122bc685fa36.png');
INSERT INTO `users` VALUES ('117', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUkb', 'GZBY0061', '王春国', 'jason.wang@biyatech.com', 'Jason', 'M', '37', null, '产品设计经理', null, '37445e89834b3dc77b91ee638d7c8a63.png');
INSERT INTO `users` VALUES ('118', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUkr', 'GZBY0051', '涂瑞琼', 'ruiki.tu@biyatech.com', 'Ruiki', 'F', '37', null, '视觉设计', null, 'a13b42dbcdd614298ae021a203b6b000.png');
INSERT INTO `users` VALUES ('119', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUk9', 'GZBY0052', '陈志颖', 'wing.chen@biyatech.com', 'Wing', 'M', '37', null, 'web前端开发', null, '1ca27923774008aca9b7c518fd8fe9e4.png');
INSERT INTO `users` VALUES ('120', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUhz', 'GZBY0053', '陈月恩', 'ann.chen@biyatech.com', 'Ann', 'F', '37', null, 'UI设计师', null, '5c6022bb3e7eac40ceb790b98a251e8d.jpg');
INSERT INTO `users` VALUES ('121', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUhB', 'GZBY0054', '刘理鸿', 'wyman.liu@biyatech.com', 'Wyman', 'M', '37', null, 'UI设计师', null, 'a8ba1464b5d0e7a43b85fa829a671728.png');
INSERT INTO `users` VALUES ('122', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUhn', 'GZBY0074', '杨裕鹏', 'terry.yang@biyatech.com', 'Terry', 'M', '35', null, '产品经理', null, '67c5206e4d2bdd454dcea1f55fe544de.png');
INSERT INTO `users` VALUES ('123', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUhX', 'GZBY0049', '龙振业', 'ericson.loong@biyatech.com', 'Ericson', 'M', '35', null, '产品专员', null, 'ec70afb38eec7fc31b937f7207688f0a.png');
INSERT INTO `users` VALUES ('124', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUht', 'GZBY0007', '凌禕', 'vincent.ling@biyatech.com', 'Vincent', 'M', '36', null, '营销运营总监', null, '73b707b39ccd1ebab4ebc6c156ac4e82.png');
INSERT INTO `users` VALUES ('125', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUhJ', 'GZBY0068', '陈健炫', 'jack.chen@biyatech.com', 'Jack', 'M', '33', null, 'PHP工程师', null, '7bef1d95bc2d9a2f3364466308c9dd17.png');
INSERT INTO `users` VALUES ('126', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUhb', 'CXTGZ0032', '辛绪清', 'sinn.xing@finapower.com', 'Sinn', 'F', '2', null, '项目经理', null, '375824a1f067d8c7a025958b4f366ac9.png');
INSERT INTO `users` VALUES ('127', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUhr', 'test_lizhi', '离职者', '234@123.com', 'lizhi', null, '38', null, '销售', null, 'd840822cb344d23418a38ea9355f2265.png');
INSERT INTO `users` VALUES ('128', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUh9', null, '人事', '456@234.com', 'renshi', null, '38', null, null, null, 'e70866486536dc35506a6d9a1ec54d19.png');
INSERT INTO `users` VALUES ('129', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUvz', 'test_bumenfuze', '部门负责', '666@163.com', 'superior', null, '38', null, null, null, '2ad9054c0e8651b200872457180ed4a5.png');
INSERT INTO `users` VALUES ('130', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUvB', null, '政政', '678@163.com', 'zheng', null, '38', null, null, null, '0972eb1af309ef422e482026f3bc6a2a.png');
INSERT INTO `users` VALUES ('131', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUvn', null, '财财', '992@163.com', 'cai', null, '38', null, null, null, 'd91ae8a1b9f22045f540c5ad9e02b58f.png');
INSERT INTO `users` VALUES ('132', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUvX', 'GDWD0043', '冯欣', 'milk.feng@wendydigital.com', 'Milk', 'F', '10', null, '新媒体副总监', null, '89d0c8b70f5a7803a7a25f3a45c58cd9.png');
INSERT INTO `users` VALUES ('133', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUvJ', 'GZYB0001', '张鹏', 'zhangpeng@cloudfunding.com.cn', 'zhangpeng', 'M', '48', null, '财务副总监', null, '2870b14f4f07366c7b455f5d0835ca29.png');
INSERT INTO `users` VALUES ('134', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUvc', 'GZYB0003', '陈超', 'sandy@cloudfunding.com.cn', 'sandy', 'F', '48', null, '出纳', null, 'a67a04d7085527cee6c58d4f2c991c63.png');
INSERT INTO `users` VALUES ('135', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUvb', 'GZYB0015', '黎伟健', 'vkin@cloudfunding.com.cn', 'VKIN', 'M', '48', null, '人力资源经理', null, '0f089c63fc5114c333902e0b299ee9b3.png');
INSERT INTO `users` VALUES ('136', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUvr', 'GZYB0004', '林嘉宝', 'gabrielle@cloudfunding.com.cn', 'gabrielle', 'F', '48', null, '行政专员', null, '53b90ec506a2b056825ddf79868899eb.png');
INSERT INTO `users` VALUES ('137', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUv9', 'GZYB0005', '钟雪霞', 'michael@cloudfunding.com.cn', 'michel', 'F', '48', null, '投资副总经理', null, '389701e7e5666a621492118848da8a65.png');
INSERT INTO `users` VALUES ('138', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUZz', 'GZYB0006', '阙永红', 'lucky@cloudfunding.com.cn', 'LUCKY', 'F', '48', null, '基金经理', null, '01f58e13ab3fdce553a883c027b4af3b.png');
INSERT INTO `users` VALUES ('139', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUZB', 'GZYB0007', '单斌', 'bun@cloudfunding.com.cn', 'BUN', 'M', '48', null, '基金经理', null, 'c0dd45f1f18c627d83f9a23315bad99f.png');
INSERT INTO `users` VALUES ('140', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUZn', 'GZYB0008', '彭嵩', 'pengsong@cloudfunding.com.cn', 'PENGSONG', 'M', '48', null, '助理', null, '95701e0ad7aa9c7f93597b2153ce9d9f.png');
INSERT INTO `users` VALUES ('141', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUZX', 'GZYB0009', '凌翔凯', 'ken@cloudfunding.com.cn', 'KEN', 'M', '48', null, '开发总监', null, '3d6d1856c26663e1980e239b56af720c.png');
INSERT INTO `users` VALUES ('142', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUZt', 'GZYB0010', '何健琨', 'kun@cloudfunding.com.cn', 'KUN', 'M', '48', null, '并购经理', null, '72badd99e2f87ea21437c17678111d55.png');
INSERT INTO `users` VALUES ('143', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUZJ', 'GZYB0011', '庄颖琳', 'jing@cloudfunding.com.cn', 'JING', 'F', '48', null, '并购专员', null, '18f7cd1cb0064854f1d0c5e561793f7f.png');
INSERT INTO `users` VALUES ('144', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUZc', 'GZYB0012', '杨文舟', 'jojo@cloudfunding.com.cn', 'JOJO', 'M', '48', null, '并购专员', null, 'd43d934726ff69d97f8e1250766b0e95.png');
INSERT INTO `users` VALUES ('145', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUZb', 'GZYB0013', '郑昶', 'bc@cloudfunding.com.cn', 'bc', 'M', '48', null, '助理', null, '0ca79086f0c0101726d52de5ad0aeb14.png');
INSERT INTO `users` VALUES ('146', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUZr', 'GZYB0014', '将红宇', 'honny@cloudfunding.com.cn', 'HONNY', 'M', '48', null, '战略总监', null, 'f32a9c2fad1e82752da7e6eb7648bbc1.png');
INSERT INTO `users` VALUES ('147', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUZ9', 'GZYB0002', '钟宝莹', 'ying@cloudfunding.com.cn', 'Ying', 'F', '48', null, '会计', null, 'b150765f0c7a7267e9673afebd306e15.png');
INSERT INTO `users` VALUES ('148', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUXz', 'CXTGZ0033', '林挺', 'tim.lin@finapower.com', 'Tim', 'M', '2', null, '高级编辑', null, 'b388370ee82b076d69e817648ac49d54.png');
INSERT INTO `users` VALUES ('149', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUXB', 'CXTGZ0034', '周晓敏', 'elaine.zhou@finapower.com', 'Elaine', 'F', '2', null, '品牌推广经理', null, '0f2bf7ab164f9814641e485aec7c83f6.png');
INSERT INTO `users` VALUES ('150', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUXn', 'GZWR0014', '孙久龙', 'Leo.sun@biyatech.com', 'Leo', 'M', '28', null, '总经理', null, 'efa8ccb73cd23f42f76d42cc3f07c82b.png');
INSERT INTO `users` VALUES ('151', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUXX', 'GZWR0015', '任立峰', 'Crazy.ren@biyatech.com', 'Crazy', 'M', '28', null, '技术总监', null, '5c5dd2b32a534fee5527f01d25b8d2bf.png');
INSERT INTO `users` VALUES ('152', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUXt', 'GZWR0016', '王义军', 'Andy.wang@biyatech.com', 'Andy', 'M', '28', null, '技术经理', null, '5b423386b437337172e96ada6096105a.png');
INSERT INTO `users` VALUES ('153', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUXJ', 'GZWR0017', '张振军', 'Vito.zhang@biyatech.com', 'Vito', 'M', '28', null, '技术经理', null, 'f9ac93bf4dbc902f3f87ca27a1ce7b40.png');
INSERT INTO `users` VALUES ('154', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUXc', 'GZWR0018', '陈剑雄', 'eric.chen@biyatech.com', 'Eric', 'M', '28', null, '工程师', null, 'fc90e8899e6a4afb2feb79700069593d.png');
INSERT INTO `users` VALUES ('155', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUXb', 'GZWR0011', '陈巧泳', 'charis.chen@biyatech.com', 'Charis', 'M', '28', null, '总监助理', null, 'fd7491840cc5e17f47d4056831cee61c.png');
INSERT INTO `users` VALUES ('156', 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7zUXr', 'test_hui', '辉测试', '422677892@qq.com', 'test_hui', 'M', null, null, null, null, '81938b021fc23b5afbbb5aaafefde2a6.png');
