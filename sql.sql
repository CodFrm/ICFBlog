/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : 127.0.0.1:3306
Source Database       : icf

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-01-29 21:43:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for icf_article
-- ----------------------------
DROP TABLE IF EXISTS `icf_article`;
CREATE TABLE `icf_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `title` varchar(255) NOT NULL COMMENT '文章标题',
  `content` text NOT NULL COMMENT '文章内容',
  `time` int(11) NOT NULL COMMENT '发表时间戳',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of icf_article
-- ----------------------------
INSERT INTO `icf_article` VALUES ('1', '我是文章', '我是内容', '165464452');
INSERT INTO `icf_article` VALUES ('2', '文章2', '内容2', '411561658');
INSERT INTO `icf_article` VALUES ('3', '文章3', '我有一段很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长的内容', '1465161465');

-- ----------------------------
-- Table structure for icf_navibar
-- ----------------------------
DROP TABLE IF EXISTS `icf_navibar`;
CREATE TABLE `icf_navibar` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '导航条id',
  `title` varchar(128) CHARACTER SET utf8 NOT NULL COMMENT '导航条标题',
  `alias` varchar(128) CHARACTER SET utf8 NOT NULL COMMENT '别名',
  `father` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of icf_navibar
-- ----------------------------
INSERT INTO `icf_navibar` VALUES ('1', '首页', 'host', '-1');
INSERT INTO `icf_navibar` VALUES ('2', '编程笔记', 'pro', '-1');
INSERT INTO `icf_navibar` VALUES ('3', 'EPL', 'EPL', '2');
INSERT INTO `icf_navibar` VALUES ('4', 'C/C++', 'C', '2');
INSERT INTO `icf_navibar` VALUES ('5', 'test', 't', '1');
INSERT INTO `icf_navibar` VALUES ('82', 'test123', 't2', '-1');
