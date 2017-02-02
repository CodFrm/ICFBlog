/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : 127.0.0.1:3306
Source Database       : icf

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-02-02 19:13:22
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
  `author` varchar(255) NOT NULL COMMENT '作者',
  `sortid` int(11) NOT NULL,
  `time` int(11) NOT NULL COMMENT '发表时间戳',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of icf_article
-- ----------------------------
INSERT INTO `icf_article` VALUES ('1', 'Hello World!', '#Hello World!\r\n>This my first article\r\n\r\n**I very happy**\r\n\r\n--....\r\n```php\r\n<?php\r\necho \'hello\';\r\n?>\r\n```\r\n\r\n```\r\ncout<<\"hello world\";\r\n```\r\n[blog](http://blog.icodef.com)', 'Farmer', '3', '165464452');
INSERT INTO `icf_article` VALUES ('2', '文章2', '内容2![hello](http://127.0.0.1/icf/public/img/895e296b74f654438d2b020989f51dae.jpg) 内容2![hell1o](http://22222)', 'Farmer', '3', '411561658');
INSERT INTO `icf_article` VALUES ('3', '文章3', '我有一段很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很内容2![hello](http://127.0.0.1/icf/public/img/thumb-1920-739922.jpg)', 'Farmer', '0', '1465161465');

-- ----------------------------
-- Table structure for icf_config
-- ----------------------------
DROP TABLE IF EXISTS `icf_config`;
CREATE TABLE `icf_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '配置id',
  `key` varchar(255) NOT NULL COMMENT '配置键名',
  `value` varchar(255) NOT NULL COMMENT '配置值',
  `time` int(11) NOT NULL COMMENT '配置设置时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of icf_config
-- ----------------------------
INSERT INTO `icf_config` VALUES ('1', 'title', '爱编码的Farmer', '0');
INSERT INTO `icf_config` VALUES ('2', 'subtitle', '我是Farmer，我为自己代言 | 农夫小站icodef.com', '0');
INSERT INTO `icf_config` VALUES ('3', 'title2', '我是Farmer，我为自己代言', '0');

-- ----------------------------
-- Table structure for icf_sortlist
-- ----------------------------
DROP TABLE IF EXISTS `icf_sortlist`;
CREATE TABLE `icf_sortlist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `title` varchar(128) CHARACTER SET utf8 NOT NULL COMMENT '分类标题',
  `alias` varchar(128) CHARACTER SET utf8 NOT NULL COMMENT '别名',
  `father` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of icf_sortlist
-- ----------------------------
INSERT INTO `icf_sortlist` VALUES ('1', '首页', '', '-1');
INSERT INTO `icf_sortlist` VALUES ('2', '编程笔记', 'pro', '-1');
INSERT INTO `icf_sortlist` VALUES ('3', 'EPL', 'EPL', '2');
INSERT INTO `icf_sortlist` VALUES ('4', 'C/C++', 'C', '2');
INSERT INTO `icf_sortlist` VALUES ('5', 'test', 't', '1');
INSERT INTO `icf_sortlist` VALUES ('82', 'test123', 't2', '-1');
