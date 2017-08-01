/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : hi_exam

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2017-08-01 23:50:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tm_grade
-- ----------------------------
DROP TABLE IF EXISTS `tm_grade`;
CREATE TABLE `tm_grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` int(11) NOT NULL,
  `name` varchar(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_grade
-- ----------------------------
INSERT INTO `tm_grade` VALUES ('1', '1', '小学一年级', '1');
INSERT INTO `tm_grade` VALUES ('2', '1', '小学二年级', '1');
INSERT INTO `tm_grade` VALUES ('3', '1', '小学三年级', '1');
INSERT INTO `tm_grade` VALUES ('4', '1', '小学四年级', '1');
INSERT INTO `tm_grade` VALUES ('5', '1', '小学五年级', '1');
INSERT INTO `tm_grade` VALUES ('6', '1', '小学六年级', '1');
INSERT INTO `tm_grade` VALUES ('7', '2', '初中一年级', '1');
INSERT INTO `tm_grade` VALUES ('8', '2', '初中二年级', '1');
INSERT INTO `tm_grade` VALUES ('9', '2', '初中三年级', '1');
INSERT INTO `tm_grade` VALUES ('10', '3', '高中一年级', '1');
INSERT INTO `tm_grade` VALUES ('11', '3', '高中二年级', '1');
INSERT INTO `tm_grade` VALUES ('12', '3', '高中三年级', '1');

-- ----------------------------
-- Table structure for tm_menu
-- ----------------------------
DROP TABLE IF EXISTS `tm_menu`;
CREATE TABLE `tm_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `ismenu` int(11) NOT NULL,
  `isopen` int(11) NOT NULL,
  `levels` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `num` int(11) NOT NULL,
  `pcode` varchar(255) NOT NULL,
  `pcodes` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `tips` varchar(255) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_menu
-- ----------------------------
INSERT INTO `tm_menu` VALUES ('1', 'qdb', '', '1', '1', '1', '题库管理', '1', '0', '[0],', '1', null, '/qdb');
INSERT INTO `tm_menu` VALUES ('2', 'paper', '', '1', '1', '1', '试卷管理', '1', '0', '[0],', '1', null, '/paper');
INSERT INTO `tm_menu` VALUES ('3', 'selftest', '', '1', '1', '1', '自测管理', '1', '0', '[0],', '1', null, '/selftest');
INSERT INTO `tm_menu` VALUES ('4', 'test', '', '1', '1', '1', '测试管理', '1', '0', '[0],', '1', null, '/test');
INSERT INTO `tm_menu` VALUES ('5', 'analysis', '', '1', '1', '1', '统计分析', '1', '0', '[0],', '1', null, '/analysis');
INSERT INTO `tm_menu` VALUES ('6', 'student', '', '1', '1', '1', '学生管理', '1', '0', '[0],', '1', null, '/student');
INSERT INTO `tm_menu` VALUES ('7', 'teacher', '', '1', '1', '1', '教师管理', '1', '0', '[0],', '1', null, '/teacher');
INSERT INTO `tm_menu` VALUES ('8', 'system', '', '1', '1', '1', '系统管理', '1', '0', '[0],', '1', null, '/system');
INSERT INTO `tm_menu` VALUES ('15', 'grade', '', '1', '1', '2', '年级管理', '1', 'info', 'null[info],', '1', null, '/grade');
INSERT INTO `tm_menu` VALUES ('16', 'subject', '', '1', '1', '2', '学科管理', '1', 'info', 'null[info],', '1', null, '/subject');
INSERT INTO `tm_menu` VALUES ('17', 'text-version', '', '1', '1', '2', '教材版本', '1', 'info', 'null[info],', '1', null, '/textVersion');
INSERT INTO `tm_menu` VALUES ('18', 'info', '', '1', '1', '1', '信息管理', '1', '0', null, '1', null, '/message');
INSERT INTO `tm_menu` VALUES ('19', 'website', '', '1', '1', '2', '站点设置', '1', 'system', '[0],[system],', '1', null, '/website');
INSERT INTO `tm_menu` VALUES ('20', 'questiondb', '', '1', '1', '2', '题库管理', '1', 'qdb', '[0],[qdb],', '1', null, '/questionDb');

-- ----------------------------
-- Table structure for tm_menu_role_relation
-- ----------------------------
DROP TABLE IF EXISTS `tm_menu_role_relation`;
CREATE TABLE `tm_menu_role_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menuid` int(11) NOT NULL,
  `roleid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_menu_role_relation
-- ----------------------------

-- ----------------------------
-- Table structure for tm_role
-- ----------------------------
DROP TABLE IF EXISTS `tm_role`;
CREATE TABLE `tm_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `num` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `tips` varchar(11) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_role
-- ----------------------------

-- ----------------------------
-- Table structure for tm_subject
-- ----------------------------
DROP TABLE IF EXISTS `tm_subject`;
CREATE TABLE `tm_subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_subject
-- ----------------------------
INSERT INTO `tm_subject` VALUES ('1', '语文', '1');
INSERT INTO `tm_subject` VALUES ('2', '数学', '1');
INSERT INTO `tm_subject` VALUES ('3', '英语', '1');
INSERT INTO `tm_subject` VALUES ('4', '物理', '1');
INSERT INTO `tm_subject` VALUES ('5', '化学', '1');
INSERT INTO `tm_subject` VALUES ('6', '生物', '1');
INSERT INTO `tm_subject` VALUES ('7', '政治', '1');
INSERT INTO `tm_subject` VALUES ('8', '历史', '1');
INSERT INTO `tm_subject` VALUES ('10', '地理', '1');

-- ----------------------------
-- Table structure for tm_text_version
-- ----------------------------
DROP TABLE IF EXISTS `tm_text_version`;
CREATE TABLE `tm_text_version` (
  `id` int(65) NOT NULL AUTO_INCREMENT,
  `name` varchar(65) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_text_version
-- ----------------------------
INSERT INTO `tm_text_version` VALUES ('1', '人教版', '1');
INSERT INTO `tm_text_version` VALUES ('2', '新人教版', '1');
INSERT INTO `tm_text_version` VALUES ('3', '苏教版', '1');
INSERT INTO `tm_text_version` VALUES ('4', '浙科版', '1');
INSERT INTO `tm_text_version` VALUES ('5', '岳麓版', '1');
INSERT INTO `tm_text_version` VALUES ('6', '京教版', '1');
INSERT INTO `tm_text_version` VALUES ('7', '沪教版', '1');

-- ----------------------------
-- Function structure for tm_strip_tags
-- ----------------------------
DROP FUNCTION IF EXISTS `tm_strip_tags`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `tm_strip_tags`($str text) RETURNS text CHARSET utf8
BEGIN
  DECLARE $start, $end INT DEFAULT 1;
  IF ($str IS NULL) THEN RETURN NULL; END IF;
  LOOP
    SET $start = LOCATE("<", $str, $start);
    IF (!$start) THEN RETURN $str; END IF;
    SET $end = LOCATE(">", $str, $start);
    IF (!$end) THEN SET $end = $start; END IF;
    SET $str = INSERT($str, $start, $end - $start + 1, "");
  END LOOP;
END
;;
DELIMITER ;
SET FOREIGN_KEY_CHECKS=1;
