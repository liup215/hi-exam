/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : hi_exam

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2017-07-22 17:43:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tm_admin
-- ----------------------------
DROP TABLE IF EXISTS `tm_admin`;
CREATE TABLE `tm_admin` (
  `a_id` varchar(50) NOT NULL,
  `a_username` varchar(50) DEFAULT NULL,
  `a_userpass` varchar(50) DEFAULT NULL,
  `a_roleid` varchar(50) DEFAULT NULL,
  `a_realname` varchar(50) DEFAULT NULL,
  `a_photo` varchar(100) DEFAULT NULL,
  `a_phone` varchar(50) DEFAULT NULL,
  `a_email` varchar(50) DEFAULT NULL,
  `a_status` int(2) DEFAULT NULL,
  `a_createdate` datetime DEFAULT NULL,
  `a_salt` varchar(10) DEFAULT NULL,
  `a_remark` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`a_id`),
  KEY `FK_ref_admin_role` (`a_roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_admin
-- ----------------------------
INSERT INTO `tm_admin` VALUES ('898cefdf-d372-410d-b5d5-332e71b43e64', 'admin', '6FA02139601E4D8F578A2B5AAD015449', '7e33ecad-b7c5-4b93-a4ff-b13f12a067be', '管理员', '', '139231', 'admin@tomexam.com', '1', '2016-03-12 21:52:46', 't8kgmtbiom', 'This is administrator&#39;s account');

-- ----------------------------
-- Table structure for tm_admin_addition
-- ----------------------------
DROP TABLE IF EXISTS `tm_admin_addition`;
CREATE TABLE `tm_admin_addition` (
  `a_id` varchar(50) DEFAULT NULL,
  `a_logintimes` int(11) DEFAULT '0',
  `a_lastlogin` datetime DEFAULT NULL,
  KEY `FK_ref_admin_addtion` (`a_id`),
  CONSTRAINT `tm_admin_addition_ibfk_1` FOREIGN KEY (`a_id`) REFERENCES `tm_admin` (`a_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_admin_addition
-- ----------------------------
INSERT INTO `tm_admin_addition` VALUES ('898cefdf-d372-410d-b5d5-332e71b43e64', '101', '2017-07-22 15:46:14');

-- ----------------------------
-- Table structure for tm_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `tm_admin_role`;
CREATE TABLE `tm_admin_role` (
  `r_id` varchar(50) NOT NULL,
  `r_name` varchar(50) DEFAULT NULL,
  `r_status` int(2) DEFAULT NULL,
  `r_createdate` datetime DEFAULT NULL,
  `r_privilege` text,
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_admin_role
-- ----------------------------
INSERT INTO `tm_admin_role` VALUES ('7e33ecad-b7c5-4b93-a4ff-b13f12a067be', '超级管理员', '1', '2016-03-11 22:48:03', 'M-QDB,F-QDB,P-QDB-ADD,P-QDB-DELETE,P-QDB-UPDATE,P-QDB-VIEW,F-QES,P-QES-ADD,P-QES-DELETE,P-QES-UPDATE,P-QES-VIEW,P-QES-IMPORT,M-PAPER,F-PAPER,P-PAPER-ADD,P-PAPER-DELETE,P-PAPER-CLONE,P-PAPER-EXPORTWORD,P-PAPER-UPDATE,P-PAPER-VIEW,P-PAPER-HISTORY-VIEW,P-PAPER-HISTORY-CHECK,P-PAPER-HISTORY-REMOVE,F-PAPER-CATE,P-PAPER-CATE-ADD,P-PAPER-CATE-DELETE,P-PAPER-CATE-UPDATE,P-PAPER-CATE-VIEW,M-SELFTEST,F-SELFTEST,P-SELFTEST-RECORDS-VIEW,P-SELFTEST-RECORDS-DELETE,M-ANALYSIS,F-ANALYSIS,P-ANA-EXAM,P-ANA-PAPER,P-ANA-SCORE,M-USERS,F-USERS,P-USER-ADD,P-USER-IMPORT,P-USER-DELETE,P-USER-UPDATE,P-USER-VIEW,P-USER-EXAMVIEW,F-BRANCH,P-BRANCH-ADD,P-BRANCH-DELETE,P-BRANCH-UPDATE,P-BRANCH-VIEW,F-UPOSITION,P-UPOSITION-ADD,P-UPOSITION-DELETE,P-UPOSITION-UPDATE,P-UPOSITION-VIEW,M-INTERACTION,F-NEWS,P-NEWS-ADD,P-NEWS-DELETE,P-NEWS-UPDATE,P-NEWS-VIEW,F-NEWSCATE,P-NEWSCATE-ADD,P-NEWSCATE-DELETE,P-NEWSCATE-UPDATE,P-NEWSCATE-VIEW,M-LEARNING,F-COURSE,P-COURSE-ADD,P-COURSE-DELETE,P-COURSE-UPDATE,P-COURSE-DATAVIEW,F-COURSE-CATEGORY,P-COURSE-CATEGORY-ADD,P-COURSE-CATEGORY-DELETE,P-COURSE-CATEGORY-UPDATE,F-COURSE-TEACHER,P-COURSE-TEACHER-ADD,P-COURSE-TEACHER-DELETE,P-COURSE-TEACHER-UPDATE,M-SYSTEM,F-SYS,P-SYS-CONFIG,P-SYS-LOG,F-ADMIN,P-ADMIN-ADD,P-ADMIN-DELETE,P-ADMIN-UPDATE,P-ADMIN-VIEW,F-ROLE,P-ROLE-ADD,P-ROLE-DELETE,P-ROLE-UPDATE,P-ROLE-VIEW,M-OTHER,F-SUPER,P-OTH-SUPER');

-- ----------------------------
-- Table structure for tm_branch
-- ----------------------------
DROP TABLE IF EXISTS `tm_branch`;
CREATE TABLE `tm_branch` (
  `b_id` varchar(50) NOT NULL,
  `b_name` varchar(50) DEFAULT NULL,
  `b_pid` varchar(50) DEFAULT NULL,
  `b_remark` varchar(50) DEFAULT NULL,
  `b_order` int(3) DEFAULT NULL,
  `b_status` int(2) DEFAULT NULL,
  `b_poster` varchar(50) DEFAULT NULL,
  `b_createdate` datetime DEFAULT NULL,
  `b_modifyor` varchar(50) DEFAULT NULL,
  `b_modifydate` datetime DEFAULT NULL,
  PRIMARY KEY (`b_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_branch
-- ----------------------------
INSERT INTO `tm_branch` VALUES ('827ea7bb-138d-425e-9fdf-13e97172b039', '测试部门', '0', '', '1', '1', 'admin', '2016-06-11 23:04:17', 'admin', '2016-06-11 23:04:17');

-- ----------------------------
-- Table structure for tm_course
-- ----------------------------
DROP TABLE IF EXISTS `tm_course`;
CREATE TABLE `tm_course` (
  `c_id` varchar(50) NOT NULL,
  `c_name` varchar(100) DEFAULT NULL,
  `c_logo` varchar(100) DEFAULT NULL,
  `c_tid` varchar(50) DEFAULT NULL,
  `c_caid` varchar(50) DEFAULT NULL,
  `c_score` int(11) DEFAULT NULL,
  `c_type` int(2) DEFAULT NULL COMMENT '1必修，0选修',
  `c_introduce` text,
  `c_postdate` datetime DEFAULT NULL,
  `c_modifydate` datetime DEFAULT NULL,
  `c_status` int(2) DEFAULT '0' COMMENT '1正常，-9已删除，0待审核',
  `c_stars` int(11) DEFAULT NULL COMMENT '管理员给的分值，如：5代表5颗星',
  `c_data` longtext,
  `c_poster` varchar(50) DEFAULT NULL,
  `c_modifier` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_course
-- ----------------------------

-- ----------------------------
-- Table structure for tm_course_category
-- ----------------------------
DROP TABLE IF EXISTS `tm_course_category`;
CREATE TABLE `tm_course_category` (
  `ca_id` varchar(50) NOT NULL,
  `ca_name` varchar(50) DEFAULT NULL,
  `ca_desc` text,
  `ca_logo` varchar(100) DEFAULT NULL,
  `ca_pid` varchar(50) DEFAULT NULL,
  `ca_status` int(2) DEFAULT NULL,
  `ca_order` int(11) DEFAULT NULL,
  `ca_postdate` datetime DEFAULT NULL,
  PRIMARY KEY (`ca_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_course_category
-- ----------------------------

-- ----------------------------
-- Table structure for tm_course_comments
-- ----------------------------
DROP TABLE IF EXISTS `tm_course_comments`;
CREATE TABLE `tm_course_comments` (
  `c_id` varchar(50) NOT NULL,
  `c_cid` varchar(50) DEFAULT NULL,
  `c_uid` varchar(50) DEFAULT NULL,
  `c_content` text,
  `c_postdate` datetime DEFAULT NULL,
  `c_ip` varchar(50) DEFAULT NULL,
  `c_status` int(2) DEFAULT NULL COMMENT '1正常，-9已删除',
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_course_comments
-- ----------------------------

-- ----------------------------
-- Table structure for tm_course_favorites
-- ----------------------------
DROP TABLE IF EXISTS `tm_course_favorites`;
CREATE TABLE `tm_course_favorites` (
  `f_id` varchar(50) NOT NULL,
  `f_cid` varchar(50) DEFAULT NULL,
  `f_uid` varchar(50) DEFAULT NULL,
  `f_favdate` datetime DEFAULT NULL,
  PRIMARY KEY (`f_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_course_favorites
-- ----------------------------

-- ----------------------------
-- Table structure for tm_course_note
-- ----------------------------
DROP TABLE IF EXISTS `tm_course_note`;
CREATE TABLE `tm_course_note` (
  `n_id` varchar(50) NOT NULL,
  `n_cid` varchar(50) DEFAULT NULL,
  `n_sid` varchar(50) DEFAULT NULL,
  `n_leid` varchar(50) DEFAULT NULL,
  `n_uid` varchar(50) DEFAULT NULL,
  `n_content` text,
  `n_postdate` datetime DEFAULT NULL,
  `n_status` int(2) DEFAULT NULL,
  PRIMARY KEY (`n_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_course_note
-- ----------------------------

-- ----------------------------
-- Table structure for tm_course_progress_history
-- ----------------------------
DROP TABLE IF EXISTS `tm_course_progress_history`;
CREATE TABLE `tm_course_progress_history` (
  `p_id` varchar(50) NOT NULL,
  `p_cid` varchar(50) DEFAULT NULL,
  `p_sid` varchar(50) DEFAULT NULL,
  `p_leid` varchar(50) DEFAULT NULL,
  `p_uid` varchar(50) DEFAULT NULL,
  `p_startdate` datetime DEFAULT NULL COMMENT '1完成，0进行中',
  `p_enddate` datetime DEFAULT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_course_progress_history
-- ----------------------------

-- ----------------------------
-- Table structure for tm_course_qa
-- ----------------------------
DROP TABLE IF EXISTS `tm_course_qa`;
CREATE TABLE `tm_course_qa` (
  `q_id` varchar(50) NOT NULL,
  `q_cid` varchar(50) DEFAULT NULL,
  `q_uid` varchar(50) DEFAULT NULL,
  `q_question` text,
  `q_answer` text,
  `q_postdate` datetime DEFAULT NULL,
  `q_answerdate` datetime DEFAULT NULL,
  `q_status` int(2) DEFAULT NULL COMMENT '0未回答，1已回答（正常），-9已删除',
  PRIMARY KEY (`q_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_course_qa
-- ----------------------------

-- ----------------------------
-- Table structure for tm_course_teacher
-- ----------------------------
DROP TABLE IF EXISTS `tm_course_teacher`;
CREATE TABLE `tm_course_teacher` (
  `t_id` varchar(50) NOT NULL,
  `t_name` varchar(50) DEFAULT NULL,
  `t_phone` varchar(50) DEFAULT NULL,
  `t_email` varchar(50) DEFAULT NULL,
  `t_photo` varchar(100) DEFAULT NULL,
  `t_info` text,
  `t_createdate` datetime DEFAULT NULL,
  `t_modifydate` datetime DEFAULT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_course_teacher
-- ----------------------------

-- ----------------------------
-- Table structure for tm_course_userscore_detail
-- ----------------------------
DROP TABLE IF EXISTS `tm_course_userscore_detail`;
CREATE TABLE `tm_course_userscore_detail` (
  `d_id` varchar(50) NOT NULL,
  `d_cid` varchar(50) DEFAULT NULL,
  `d_uid` varchar(50) DEFAULT NULL,
  `d_passdate` datetime DEFAULT NULL,
  `d_score` int(11) DEFAULT NULL,
  PRIMARY KEY (`d_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_course_userscore_detail
-- ----------------------------

-- ----------------------------
-- Table structure for tm_examdata
-- ----------------------------
DROP TABLE IF EXISTS `tm_examdata`;
CREATE TABLE `tm_examdata` (
  `e_id` varchar(50) NOT NULL,
  `e_pid` varchar(50) DEFAULT NULL,
  `e_uid` varchar(50) DEFAULT NULL,
  `e_starttime` datetime DEFAULT NULL,
  `e_endtime` datetime DEFAULT NULL,
  `e_ip` varchar(50) DEFAULT NULL,
  `e_score` int(4) DEFAULT NULL,
  `e_status` int(2) DEFAULT NULL COMMENT '0未交卷，1已交卷待批改，2已批改',
  `e_data` longtext,
  `e_check` longtext,
  PRIMARY KEY (`e_id`),
  KEY `IDX_PID` (`e_pid`),
  KEY `IDX_UID` (`e_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_examdata
-- ----------------------------

-- ----------------------------
-- Table structure for tm_examdata_addition
-- ----------------------------
DROP TABLE IF EXISTS `tm_examdata_addition`;
CREATE TABLE `tm_examdata_addition` (
  `e_id` int(11) NOT NULL,
  `e_pid` varchar(50) DEFAULT NULL,
  `e_uid` varchar(50) DEFAULT NULL,
  `e_remarker` varchar(50) DEFAULT NULL,
  `e_remark` text,
  `e_remarkdate` datetime DEFAULT NULL,
  PRIMARY KEY (`e_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_examdata_addition
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_menu
-- ----------------------------
INSERT INTO `tm_menu` VALUES ('1', '1', '', '1', '1', '1', '题库管理', '1', '0', null, '1', null, '/qdb');
INSERT INTO `tm_menu` VALUES ('2', '1', '', '1', '1', '1', '试卷管理', '1', '0', null, '1', null, '/paper');
INSERT INTO `tm_menu` VALUES ('3', '1', '', '1', '1', '1', '自测管理', '1', '0', null, '1', null, '/selftest');
INSERT INTO `tm_menu` VALUES ('4', '1', '', '1', '1', '1', '测试管理', '1', '0', null, '1', null, '/test');
INSERT INTO `tm_menu` VALUES ('5', '1', '', '1', '1', '1', '统计分析', '1', '0', null, '1', null, '/analysis');
INSERT INTO `tm_menu` VALUES ('6', '1', '', '1', '1', '1', '学生管理', '1', '0', null, '1', null, '/student');
INSERT INTO `tm_menu` VALUES ('7', '1', '', '1', '1', '1', '教师管理', '1', '0', null, '1', null, '/teacher');
INSERT INTO `tm_menu` VALUES ('8', '1', '', '1', '1', '1', '系统管理', '1', '0', null, '1', null, '/system');

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
-- Table structure for tm_news
-- ----------------------------
DROP TABLE IF EXISTS `tm_news`;
CREATE TABLE `tm_news` (
  `n_id` varchar(50) NOT NULL,
  `n_title` varchar(100) DEFAULT NULL,
  `n_title_color` varchar(20) DEFAULT NULL,
  `n_classid` varchar(50) DEFAULT NULL,
  `n_content` text,
  `n_status` int(2) DEFAULT NULL,
  `n_totop` int(2) DEFAULT NULL,
  `n_visit` int(10) DEFAULT NULL,
  `n_photo` varchar(50) DEFAULT NULL,
  `n_author` varchar(20) DEFAULT NULL,
  `n_newsfrom` varchar(50) DEFAULT NULL,
  `n_poster` varchar(50) DEFAULT NULL,
  `n_createdate` datetime DEFAULT NULL,
  `n_modifyor` varchar(50) DEFAULT NULL,
  `n_modifydate` datetime DEFAULT NULL,
  PRIMARY KEY (`n_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_news
-- ----------------------------
INSERT INTO `tm_news` VALUES ('67e3806e-51e5-4b86-a161-8fa2245d2bb1', '欢迎使用TomExam3.0网络考试系统', '#000000', 'ec18ebd1-75f5-4a74-8be6-eba3efece1a4', '<p>TomExam第一版发布于2010年，在过去的数年中，它为数以万计的用户提供了良好的网络考试解决方案。</p>\r\n\r\n<p>TomExam是一款基于JAVA与MYSQL开发的网络考试系统，考生和管理人员可以通过浏览器直接进行操作，无需安装任何程序或插件。</p>\r\n\r\n<p>TomExam可以稳定、顺畅的运行在Windows与Linux平台上。考试组织者可以通过它快捷方便的创建题库，发布试卷，组织考试，并由系统自动批改。高度的可配置性和灵活性使得它可以被应用于很多领域。TomExam3.0版本新增试题批量导入，在线学习，断电数据保存等若干实用新功能。并对试卷自动批改，统计分析，试卷创建等功能进行功能和性能优化。</p>\r\n\r\n<p>TomExam网络考试系统基于B/S架构实现，考生和管理员通过浏览器即可管理系统和考试，无需安装任何程序或插件。</p>\r\n\r\n<p>系统支持普通试卷（随机混排模式）、随机试卷（每个考生的试卷各不相同）、单体模式、整卷模式等控制，有效防止考生作弊。系统采用对象化的题型模板，可以根据需要扩展新的题型。默认支持：单选题、多选题、判断题、填空题、问答题等题型。</p>\r\n', '1', '0', '4', '', '', '', 'admin', '2017-05-27 11:27:19', 'admin', '2017-05-27 11:28:46');

-- ----------------------------
-- Table structure for tm_news_cateogry
-- ----------------------------
DROP TABLE IF EXISTS `tm_news_cateogry`;
CREATE TABLE `tm_news_cateogry` (
  `c_id` varchar(50) NOT NULL,
  `c_name` varchar(50) DEFAULT NULL,
  `c_pid` varchar(50) DEFAULT NULL,
  `c_poster` varchar(50) DEFAULT NULL,
  `c_orderid` int(11) DEFAULT NULL,
  `c_remark` varchar(200) DEFAULT NULL,
  `c_createdate` datetime DEFAULT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_news_cateogry
-- ----------------------------
INSERT INTO `tm_news_cateogry` VALUES ('ec18ebd1-75f5-4a74-8be6-eba3efece1a4', '考试须知', '0', 'admin', '1', '', '2016-06-09 09:16:14');

-- ----------------------------
-- Table structure for tm_paper
-- ----------------------------
DROP TABLE IF EXISTS `tm_paper`;
CREATE TABLE `tm_paper` (
  `p_id` varchar(50) NOT NULL,
  `p_name` varchar(100) DEFAULT NULL,
  `p_cid` varchar(50) DEFAULT NULL,
  `p_status` int(2) DEFAULT NULL COMMENT '试卷状态，1正常可用，0不可???',
  `p_starttime` datetime DEFAULT NULL,
  `p_endtime` datetime DEFAULT NULL,
  `p_duration` int(5) DEFAULT NULL,
  `p_showtime` datetime DEFAULT NULL,
  `p_total_score` int(5) DEFAULT NULL,
  `p_pass_score` int(5) DEFAULT NULL,
  `p_question_order` int(1) DEFAULT NULL COMMENT '0正常，1随机',
  `p_papertype` int(1) DEFAULT NULL COMMENT '0普通试卷，1随机生成试卷',
  `p_remark` text,
  `p_data` longtext,
  `p_poster` varchar(50) DEFAULT NULL,
  `p_createdate` datetime DEFAULT NULL,
  `p_modifyor` varchar(50) DEFAULT NULL,
  `p_modifydate` datetime DEFAULT NULL,
  `p_showkey` int(2) DEFAULT '1',
  `p_showmode` int(2) DEFAULT '1',
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_paper
-- ----------------------------

-- ----------------------------
-- Table structure for tm_paper_category
-- ----------------------------
DROP TABLE IF EXISTS `tm_paper_category`;
CREATE TABLE `tm_paper_category` (
  `c_id` varchar(50) NOT NULL DEFAULT '',
  `c_name` varchar(100) DEFAULT NULL,
  `c_remark` varchar(500) DEFAULT NULL,
  `c_status` int(2) DEFAULT NULL,
  `c_poster` varchar(50) DEFAULT NULL,
  `c_createdate` datetime DEFAULT NULL,
  `c_modifyor` varchar(50) DEFAULT NULL,
  `c_modifydate` datetime DEFAULT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_paper_category
-- ----------------------------
INSERT INTO `tm_paper_category` VALUES ('4909eb01-d045-4434-9656-06e128fbf19e', '2017年度考试卷', '2017年度试卷备注', '1', 'admin', '2016-04-16 22:00:18', 'admin', '2016-04-16 22:00:18');

-- ----------------------------
-- Table structure for tm_paper_link_branch
-- ----------------------------
DROP TABLE IF EXISTS `tm_paper_link_branch`;
CREATE TABLE `tm_paper_link_branch` (
  `ln_pid` varchar(50) DEFAULT NULL,
  `ln_buid` varchar(50) DEFAULT NULL,
  `ln_type` int(2) DEFAULT NULL COMMENT '1部门关系，0个人关系'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_paper_link_branch
-- ----------------------------
INSERT INTO `tm_paper_link_branch` VALUES ('9a7c4551-06f4-4409-a507-2e3d7bd1de87', '09031ebf-8fcc-40c6-9101-68a52e3ff09b', '1');
INSERT INTO `tm_paper_link_branch` VALUES ('9a7c4551-06f4-4409-a507-2e3d7bd1de87', '827ea7bb-138d-425e-9fdf-13e97172b039', '1');
INSERT INTO `tm_paper_link_branch` VALUES ('6d804574-1586-4b01-b789-9667b18daee6', '09031ebf-8fcc-40c6-9101-68a52e3ff09b', '1');
INSERT INTO `tm_paper_link_branch` VALUES ('6d804574-1586-4b01-b789-9667b18daee6', '827ea7bb-138d-425e-9fdf-13e97172b039', '1');
INSERT INTO `tm_paper_link_branch` VALUES ('8e7c0b98-4887-484d-aa4f-55bb2657af5d', '827ea7bb-138d-425e-9fdf-13e97172b039', '1');

-- ----------------------------
-- Table structure for tm_paper_random
-- ----------------------------
DROP TABLE IF EXISTS `tm_paper_random`;
CREATE TABLE `tm_paper_random` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `r_pid` varchar(50) DEFAULT NULL,
  `r_uid` varchar(50) DEFAULT NULL,
  `r_detail` longtext,
  `r_createdate` datetime DEFAULT NULL,
  PRIMARY KEY (`r_id`),
  KEY `IDX_PID` (`r_pid`),
  KEY `IDX_UID` (`r_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_paper_random
-- ----------------------------

-- ----------------------------
-- Table structure for tm_question
-- ----------------------------
DROP TABLE IF EXISTS `tm_question`;
CREATE TABLE `tm_question` (
  `q_id` varchar(50) NOT NULL,
  `q_dbid` varchar(50) DEFAULT NULL,
  `q_type` int(2) DEFAULT NULL,
  `q_level` int(2) DEFAULT NULL,
  `q_from` varchar(50) DEFAULT NULL,
  `q_status` int(2) DEFAULT NULL,
  `q_content` longtext,
  `q_key` text,
  `q_resolve` text,
  `q_poster` varchar(50) DEFAULT NULL,
  `q_createdate` datetime DEFAULT NULL,
  `q_modifyor` varchar(50) DEFAULT NULL,
  `q_modifydate` datetime DEFAULT NULL,
  `q_data` longtext,
  PRIMARY KEY (`q_id`),
  KEY `FK_ref_question_db` (`q_dbid`),
  KEY `IDX_QTYPE` (`q_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_question
-- ----------------------------
INSERT INTO `tm_question` VALUES ('091e9d2f-971e-4067-ab0e-76dcf13cda65', '9ef3867b-be99-459e-ad4a-79d1eabaa0ec', '3', '3', '', '1', '驾驶人在道路上醉酒驾驶机动车的处3年以上有期徒刑。', 'N', '', 'admin', '2017-03-23 18:42:58', 'admin', '2017-03-23 18:42:58', '<com.tom.model.paper.QuestionJudgment>\n  <id>091e9d2f-971e-4067-ab0e-76dcf13cda65</id>\n  <type>3</type>\n  <content>驾驶人在道路上醉酒驾驶机动车的处3年以上有期徒刑。</content>\n  <key>N</key>\n  <score>0</score>\n  <ext></ext>\n</com.tom.model.paper.QuestionJudgment>');
INSERT INTO `tm_question` VALUES ('0cd9896d-5ce9-46ce-8e7b-682a7fabc9b6', '9ef3867b-be99-459e-ad4a-79d1eabaa0ec', '2', '3', '', '1', '下列哪几项属于交通信号：', 'ABD', '', 'admin', '2017-03-23 18:43:14', 'admin', '2017-03-23 18:43:14', '<com.tom.model.paper.QuestionMultipleChoice>\n  <id>0cd9896d-5ce9-46ce-8e7b-682a7fabc9b6</id>\n  <type>2</type>\n  <content>下列哪几项属于交通信号：</content>\n  <key>ABD</key>\n  <score>0</score>\n  <ext></ext>\n  <options>\n    <com.tom.model.paper.Option>\n      <alisa>A</alisa>\n      <text>交通信号灯</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>B</alisa>\n      <text>交通标志、交通标线</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>C</alisa>\n      <text>交通宣传广告</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>D</alisa>\n      <text>交通警察的指挥</text>\n    </com.tom.model.paper.Option>\n  </options>\n</com.tom.model.paper.QuestionMultipleChoice>');
INSERT INTO `tm_question` VALUES ('1a3252b3-299a-4883-8a07-9fceb64ab91c', '9ef3867b-be99-459e-ad4a-79d1eabaa0ec', '4', '3', '', '1', '在火场中，充满了各种各样的危险：烈焰、高温、烟雾、毒气等。自我保护措施是用湿毛巾捂住[BlankArea1]，必要时[BlankArea2]前行', '口鼻,匍匐', '', 'admin', '2017-03-23 18:43:04', 'admin', '2017-03-23 18:43:04', '<com.tom.model.paper.QuestionBlankFill>\n  <id>1a3252b3-299a-4883-8a07-9fceb64ab91c</id>\n  <type>4</type>\n  <content>在火场中，充满了各种各样的危险：烈焰、高温、烟雾、毒气等。自我保护措施是用湿毛巾捂住[BlankArea1]，必要时[BlankArea2]前行</content>\n  <key></key>\n  <score>0</score>\n  <ext></ext>\n  <blanks>\n    <com.tom.model.paper.QBlank>\n      <id>1</id>\n      <name>BLANK1</name>\n      <value>口鼻</value>\n    </com.tom.model.paper.QBlank>\n    <com.tom.model.paper.QBlank>\n      <id>2</id>\n      <name>BLANK2</name>\n      <value>匍匐</value>\n    </com.tom.model.paper.QBlank>\n  </blanks>\n  <isComplex>false</isComplex>\n</com.tom.model.paper.QuestionBlankFill>');
INSERT INTO `tm_question` VALUES ('1d68c4bf-4f71-4538-b49c-f2bbc0a5989a', '9ef3867b-be99-459e-ad4a-79d1eabaa0ec', '3', '3', '', '1', '在划有道路中心线的道路上会车时，应做到保持安全车速、不越线行驶。', 'Y', '', 'admin', '2017-03-23 18:42:58', 'admin', '2017-03-23 18:42:58', '<com.tom.model.paper.QuestionJudgment>\n  <id>1d68c4bf-4f71-4538-b49c-f2bbc0a5989a</id>\n  <type>3</type>\n  <content>在划有道路中心线的道路上会车时，应做到保持安全车速、不越线行驶。</content>\n  <key>Y</key>\n  <score>0</score>\n  <ext></ext>\n</com.tom.model.paper.QuestionJudgment>');
INSERT INTO `tm_question` VALUES ('22a2de20-6bbc-40a5-86de-a68cff7bf147', '9ef3867b-be99-459e-ad4a-79d1eabaa0ec', '3', '3', '', '1', '驾驶车辆时，长时间左臂搭在车门窗上，或者长时间右手抓住变速器操纵杆，是一种驾驶陋习。', 'Y', '', 'admin', '2017-03-23 18:42:58', 'admin', '2017-03-23 18:42:58', '<com.tom.model.paper.QuestionJudgment>\n  <id>22a2de20-6bbc-40a5-86de-a68cff7bf147</id>\n  <type>3</type>\n  <content>驾驶车辆时，长时间左臂搭在车门窗上，或者长时间右手抓住变速器操纵杆，是一种驾驶陋习。</content>\n  <key>Y</key>\n  <score>0</score>\n  <ext></ext>\n</com.tom.model.paper.QuestionJudgment>');
INSERT INTO `tm_question` VALUES ('23fc995b-4396-4f28-9bb5-4eb64747bfb4', '9ef3867b-be99-459e-ad4a-79d1eabaa0ec', '4', '3', '', '1', '身上衣服着火时，立即采取的正确灭火方法是[BlankArea1]', '就地打滚压灭身上火苗', '', 'admin', '2017-03-23 18:43:04', 'admin', '2017-03-23 18:43:04', '<com.tom.model.paper.QuestionBlankFill>\n  <id>23fc995b-4396-4f28-9bb5-4eb64747bfb4</id>\n  <type>4</type>\n  <content>身上衣服着火时，立即采取的正确灭火方法是[BlankArea1]</content>\n  <key></key>\n  <score>0</score>\n  <ext></ext>\n  <blanks>\n    <com.tom.model.paper.QBlank>\n      <id>1</id>\n      <name>BLANK1</name>\n      <value>就地打滚压灭身上火苗</value>\n    </com.tom.model.paper.QBlank>\n  </blanks>\n  <isComplex>false</isComplex>\n</com.tom.model.paper.QuestionBlankFill>');
INSERT INTO `tm_question` VALUES ('243f170c-5fa0-4a6d-984c-49a660ae19f0', '9ef3867b-be99-459e-ad4a-79d1eabaa0ec', '4', '3', '', '1', '《道路交通安全法》于[BlankArea1]（按照如下格式填写：2001年1月1日）起施行。', '2004年5月1日', '', 'admin', '2017-03-23 18:43:04', 'admin', '2017-03-23 18:43:04', '<com.tom.model.paper.QuestionBlankFill>\n  <id>243f170c-5fa0-4a6d-984c-49a660ae19f0</id>\n  <type>4</type>\n  <content>《道路交通安全法》于[BlankArea1]（按照如下格式填写：2001年1月1日）起施行。</content>\n  <key></key>\n  <score>0</score>\n  <ext></ext>\n  <blanks>\n    <com.tom.model.paper.QBlank>\n      <id>1</id>\n      <name>BLANK1</name>\n      <value>2004年5月1日</value>\n    </com.tom.model.paper.QBlank>\n  </blanks>\n  <isComplex>false</isComplex>\n</com.tom.model.paper.QuestionBlankFill>');
INSERT INTO `tm_question` VALUES ('27205522-3baa-49c2-884f-5df7ebd30e54', '9ef3867b-be99-459e-ad4a-79d1eabaa0ec', '3', '3', '', '1', '机动车在高速公路上发生交通事故无法正常行驶时，用救援车、清障车拖曳、牵引。', 'Y', '', 'admin', '2017-03-23 18:42:58', 'admin', '2017-03-23 18:42:58', '<com.tom.model.paper.QuestionJudgment>\n  <id>27205522-3baa-49c2-884f-5df7ebd30e54</id>\n  <type>3</type>\n  <content>机动车在高速公路上发生交通事故无法正常行驶时，用救援车、清障车拖曳、牵引。</content>\n  <key>Y</key>\n  <score>0</score>\n  <ext></ext>\n</com.tom.model.paper.QuestionJudgment>');
INSERT INTO `tm_question` VALUES ('2a4f6417-c280-459d-8a0f-d3bff012d736', '9ef3867b-be99-459e-ad4a-79d1eabaa0ec', '2', '3', '', '1', '下列哪些情形不得驾驶机动车？', 'ABC', '', 'admin', '2017-03-23 18:43:14', 'admin', '2017-03-23 18:43:14', '<com.tom.model.paper.QuestionMultipleChoice>\n  <id>2a4f6417-c280-459d-8a0f-d3bff012d736</id>\n  <type>2</type>\n  <content>下列哪些情形不得驾驶机动车？</content>\n  <key>ABC</key>\n  <score>0</score>\n  <ext></ext>\n  <options>\n    <com.tom.model.paper.Option>\n      <alisa>A</alisa>\n      <text>饮酒、服用国家管制的精神药品或者麻醉药品</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>B</alisa>\n      <text>患有妨碍安全驾驶机动车的疾病</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>C</alisa>\n      <text>过度疲劳影响安全驾驶的</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>D</alisa>\n      <text>下肢有残疾的</text>\n    </com.tom.model.paper.Option>\n  </options>\n</com.tom.model.paper.QuestionMultipleChoice>');
INSERT INTO `tm_question` VALUES ('2e5f26b3-ede6-48da-9a13-59d50c220e9e', '9ef3867b-be99-459e-ad4a-79d1eabaa0ec', '2', '3', '', '1', '交通信号灯由（）组成。', 'ABC', '', 'admin', '2017-03-23 18:43:14', 'admin', '2017-03-23 18:43:14', '<com.tom.model.paper.QuestionMultipleChoice>\n  <id>2e5f26b3-ede6-48da-9a13-59d50c220e9e</id>\n  <type>2</type>\n  <content>交通信号灯由（）组成。</content>\n  <key>ABC</key>\n  <score>0</score>\n  <ext></ext>\n  <options>\n    <com.tom.model.paper.Option>\n      <alisa>A</alisa>\n      <text>红灯</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>B</alisa>\n      <text>绿灯</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>C</alisa>\n      <text>黄灯</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>D</alisa>\n      <text>蓝灯</text>\n    </com.tom.model.paper.Option>\n  </options>\n</com.tom.model.paper.QuestionMultipleChoice>');
INSERT INTO `tm_question` VALUES ('2e8da294-811f-4622-ae6e-f17175e86e32', '9ef3867b-be99-459e-ad4a-79d1eabaa0ec', '2', '3', '', '1', '行人不得有下列哪些行为：', 'ABC', '', 'admin', '2017-03-23 18:43:14', 'admin', '2017-03-23 18:43:14', '<com.tom.model.paper.QuestionMultipleChoice>\n  <id>2e8da294-811f-4622-ae6e-f17175e86e32</id>\n  <type>2</type>\n  <content>行人不得有下列哪些行为：</content>\n  <key>ABC</key>\n  <score>0</score>\n  <ext></ext>\n  <options>\n    <com.tom.model.paper.Option>\n      <alisa>A</alisa>\n      <text>跨越、倚坐道路隔离设施</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>B</alisa>\n      <text>扒车、强行拦车</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>C</alisa>\n      <text>实施妨碍道路交通安全的其他行为</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>D</alisa>\n      <text>在人行道左侧行走</text>\n    </com.tom.model.paper.Option>\n  </options>\n</com.tom.model.paper.QuestionMultipleChoice>');
INSERT INTO `tm_question` VALUES ('30e2537a-32ce-41b0-888a-db6d9f311390', '9ef3867b-be99-459e-ad4a-79d1eabaa0ec', '3', '3', '', '1', '在没有交通信号指示的交叉路口，转弯的机动车让直行的车辆和行人先行。', 'Y', '', 'admin', '2017-03-23 18:42:58', 'admin', '2017-03-23 18:42:58', '<com.tom.model.paper.QuestionJudgment>\n  <id>30e2537a-32ce-41b0-888a-db6d9f311390</id>\n  <type>3</type>\n  <content>在没有交通信号指示的交叉路口，转弯的机动车让直行的车辆和行人先行。</content>\n  <key>Y</key>\n  <score>0</score>\n  <ext></ext>\n</com.tom.model.paper.QuestionJudgment>');
INSERT INTO `tm_question` VALUES ('32204703-c2ab-41cd-a356-5a1518b38ff6', '9ef3867b-be99-459e-ad4a-79d1eabaa0ec', '5', '3', '', '1', '机动车发生交通事故造成人身伤亡、财产损失的，由保险公司在机动车第三者责任强制保险责任限额范围内予以赔偿;不足的部分，按照哪些规定承担赔偿责任？', '(一)机动车之间发生交通事故的，由有过错的一方承担赔偿责任;双方都有过错的，按照各自过错的比例分担责任。 (二)机动车与非机动车驾驶人、行人之间发生交通事故，非机动车驾驶人、行人没有过错的，由机动车一方承担赔偿责任;有证据证明非机动车驾驶人、行人有过错的，根据过错程度适当减轻机动车一方的赔偿责任;机动车一方没有过错的，承担不超过百分之十的赔偿责任。', '', 'admin', '2017-03-23 18:43:09', 'admin', '2017-03-23 18:43:09', '<com.tom.model.paper.QuestionEssay>\n  <id>32204703-c2ab-41cd-a356-5a1518b38ff6</id>\n  <type>5</type>\n  <content>机动车发生交通事故造成人身伤亡、财产损失的，由保险公司在机动车第三者责任强制保险责任限额范围内予以赔偿;不足的部分，按照哪些规定承担赔偿责任？</content>\n  <key>(一)机动车之间发生交通事故的，由有过错的一方承担赔偿责任;双方都有过错的，按照各自过错的比例分担责任。 (二)机动车与非机动车驾驶人、行人之间发生交通事故，非机动车驾驶人、行人没有过错的，由机动车一方承担赔偿责任;有证据证明非机动车驾驶人、行人有过错的，根据过错程度适当减轻机动车一方的赔偿责任;机动车一方没有过错的，承担不超过百分之十的赔偿责任。</key>\n  <score>0</score>\n  <ext></ext>\n</com.tom.model.paper.QuestionEssay>');
INSERT INTO `tm_question` VALUES ('35578b04-8aa1-4773-bcd7-b276c791b521', '9ef3867b-be99-459e-ad4a-79d1eabaa0ec', '4', '3', '', '1', '放学路上如果被陌生人跟踪，要赶紧[BlankArea1]', '打电话报警或告知家长', '', 'admin', '2017-03-23 18:43:04', 'admin', '2017-03-23 18:43:04', '<com.tom.model.paper.QuestionBlankFill>\n  <id>35578b04-8aa1-4773-bcd7-b276c791b521</id>\n  <type>4</type>\n  <content>放学路上如果被陌生人跟踪，要赶紧[BlankArea1]</content>\n  <key></key>\n  <score>0</score>\n  <ext></ext>\n  <blanks>\n    <com.tom.model.paper.QBlank>\n      <id>1</id>\n      <name>BLANK1</name>\n      <value>打电话报警或告知家长</value>\n    </com.tom.model.paper.QBlank>\n  </blanks>\n  <isComplex>false</isComplex>\n</com.tom.model.paper.QuestionBlankFill>');
INSERT INTO `tm_question` VALUES ('37d3f587-afda-4d8e-8d9c-78a8562ed82e', '9ef3867b-be99-459e-ad4a-79d1eabaa0ec', '5', '3', '', '1', '冬季驾驶员驾驶车辆应采取哪些安全措施?', '提高安全行车意识、出车前驾驶员必须认真检查车上的安全设备、平稳驾驶、加大车距、降低车速等等', '', 'admin', '2017-03-23 18:43:09', 'admin', '2017-03-23 18:43:09', '<com.tom.model.paper.QuestionEssay>\n  <id>37d3f587-afda-4d8e-8d9c-78a8562ed82e</id>\n  <type>5</type>\n  <content>冬季驾驶员驾驶车辆应采取哪些安全措施?</content>\n  <key>提高安全行车意识、出车前驾驶员必须认真检查车上的安全设备、平稳驾驶、加大车距、降低车速等等</key>\n  <score>0</score>\n  <ext></ext>\n</com.tom.model.paper.QuestionEssay>');
INSERT INTO `tm_question` VALUES ('48375e24-cf8f-4d4a-a32a-77db64238f55', '9ef3867b-be99-459e-ad4a-79d1eabaa0ec', '3', '3', '', '1', '初次申领的机动车驾驶证的有效期为6年。', 'Y', '', 'admin', '2017-03-23 18:42:58', 'admin', '2017-03-23 18:42:58', '<com.tom.model.paper.QuestionJudgment>\n  <id>48375e24-cf8f-4d4a-a32a-77db64238f55</id>\n  <type>3</type>\n  <content>初次申领的机动车驾驶证的有效期为6年。</content>\n  <key>Y</key>\n  <score>0</score>\n  <ext></ext>\n</com.tom.model.paper.QuestionJudgment>');
INSERT INTO `tm_question` VALUES ('4eff1aa3-356b-4ee2-9ca5-2f6e84e08191', '9ef3867b-be99-459e-ad4a-79d1eabaa0ec', '2', '3', '', '1', '驾驶非机动车，必须遵守哪些规定？', 'ABCD', '', 'admin', '2017-03-23 18:43:14', 'admin', '2017-03-23 18:43:14', '<com.tom.model.paper.QuestionMultipleChoice>\n  <id>4eff1aa3-356b-4ee2-9ca5-2f6e84e08191</id>\n  <type>2</type>\n  <content>驾驶非机动车，必须遵守哪些规定？</content>\n  <key>ABCD</key>\n  <score>0</score>\n  <ext></ext>\n  <options>\n    <com.tom.model.paper.Option>\n      <alisa>A</alisa>\n      <text>醉酒的人不准驾驶</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>B</alisa>\n      <text>丧失正常驾驶能力的残疾人不准驾驶（残疾人专用车除外）</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>C</alisa>\n      <text>未满十六岁的人，不准在道路上赶畜力车</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>D</alisa>\n      <text>未满十二岁的儿童，不准在道路上骑自行车、三轮车和推、拉人力车</text>\n    </com.tom.model.paper.Option>\n  </options>\n</com.tom.model.paper.QuestionMultipleChoice>');
INSERT INTO `tm_question` VALUES ('4f09645b-6a58-4551-b9d6-df5f908dc561', '9ef3867b-be99-459e-ad4a-79d1eabaa0ec', '4', '3', '', '1', '行人不得[BlankArea1]道路隔离栏', '跨越', '', 'admin', '2017-03-23 18:43:04', 'admin', '2017-03-23 18:43:04', '<com.tom.model.paper.QuestionBlankFill>\n  <id>4f09645b-6a58-4551-b9d6-df5f908dc561</id>\n  <type>4</type>\n  <content>行人不得[BlankArea1]道路隔离栏</content>\n  <key></key>\n  <score>0</score>\n  <ext></ext>\n  <blanks>\n    <com.tom.model.paper.QBlank>\n      <id>1</id>\n      <name>BLANK1</name>\n      <value>跨越</value>\n    </com.tom.model.paper.QBlank>\n  </blanks>\n  <isComplex>false</isComplex>\n</com.tom.model.paper.QuestionBlankFill>');
INSERT INTO `tm_question` VALUES ('51b91cb7-9922-4a89-a2cc-7d41770f3f52', '9ef3867b-be99-459e-ad4a-79d1eabaa0ec', '2', '3', '', '1', '在道路上驾驶自行车、电动自行车应当遵守下列规定：', 'ACD', '', 'admin', '2017-03-23 18:43:14', 'admin', '2017-03-23 18:43:14', '<com.tom.model.paper.QuestionMultipleChoice>\n  <id>51b91cb7-9922-4a89-a2cc-7d41770f3f52</id>\n  <type>2</type>\n  <content>在道路上驾驶自行车、电动自行车应当遵守下列规定：</content>\n  <key>ACD</key>\n  <score>0</score>\n  <ext></ext>\n  <options>\n    <com.tom.model.paper.Option>\n      <alisa>A</alisa>\n      <text>不得牵引、攀扶车辆或者被其他车辆牵引</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>B</alisa>\n      <text>不得双手离把但可以手中持物</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>C</alisa>\n      <text>不得扶身并行、互相追逐或者曲折竞驶</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>D</alisa>\n      <text>不得在道路上骑独轮自行车或者2人以上骑行的自行车</text>\n    </com.tom.model.paper.Option>\n  </options>\n</com.tom.model.paper.QuestionMultipleChoice>');
INSERT INTO `tm_question` VALUES ('56bd0bd4-5bc4-4d2c-aab5-9e52627b15d2', '9ef3867b-be99-459e-ad4a-79d1eabaa0ec', '2', '3', '', '1', '对道路交通安全违法行为的处罚种类包括：', 'ABCD', '', 'admin', '2017-03-23 18:43:14', 'admin', '2017-03-23 18:43:14', '<com.tom.model.paper.QuestionMultipleChoice>\n  <id>56bd0bd4-5bc4-4d2c-aab5-9e52627b15d2</id>\n  <type>2</type>\n  <content>对道路交通安全违法行为的处罚种类包括：</content>\n  <key>ABCD</key>\n  <score>0</score>\n  <ext></ext>\n  <options>\n    <com.tom.model.paper.Option>\n      <alisa>A</alisa>\n      <text>警告</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>B</alisa>\n      <text>罚款</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>C</alisa>\n      <text>暂扣或者吊销机动车驾驶证</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>D</alisa>\n      <text>拘留</text>\n    </com.tom.model.paper.Option>\n  </options>\n</com.tom.model.paper.QuestionMultipleChoice>');
INSERT INTO `tm_question` VALUES ('5a8c1aad-61f3-49c5-b135-b239d4f4c4fa', '9ef3867b-be99-459e-ad4a-79d1eabaa0ec', '1', '3', '', '1', '下面哪种做法能帮助您避免被其他车辆从后方追撞？', 'C', '其它三个选项，都不能给其它车辆明确的信号提示。', 'admin', '2017-03-23 18:43:13', 'admin', '2017-03-23 18:43:13', '<com.tom.model.paper.QuestionSingleChoice>\n  <id>5a8c1aad-61f3-49c5-b135-b239d4f4c4fa</id>\n  <type>1</type>\n  <content>下面哪种做法能帮助您避免被其他车辆从后方追撞？</content>\n  <key>C</key>\n  <score>0</score>\n  <ext>其它三个选项，都不能给其它车辆明确的信号提示。</ext>\n  <options>\n    <com.tom.model.paper.Option>\n      <alisa>A</alisa>\n      <text>在任何时候都打开转向灯</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>B</alisa>\n      <text>一直打开双闪</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>C</alisa>\n      <text>在转弯前提前打开相应的转向灯</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>D</alisa>\n      <text>转弯前鸣笛示意</text>\n    </com.tom.model.paper.Option>\n  </options>\n</com.tom.model.paper.QuestionSingleChoice>');
INSERT INTO `tm_question` VALUES ('5cf1d830-023c-4a7d-a3b9-974fe87b14dc', '9ef3867b-be99-459e-ad4a-79d1eabaa0ec', '2', '3', '', '1', '警车、消防车、救护车、工程救险车执行紧急任务时，可以使用警报器、标志灯具；在确保安全的前提下，不受（）的限制，其他车辆和行人应当让行。', 'ABCD', '', 'admin', '2017-03-23 18:43:14', 'admin', '2017-03-23 18:43:14', '<com.tom.model.paper.QuestionMultipleChoice>\n  <id>5cf1d830-023c-4a7d-a3b9-974fe87b14dc</id>\n  <type>2</type>\n  <content>警车、消防车、救护车、工程救险车执行紧急任务时，可以使用警报器、标志灯具；在确保安全的前提下，不受（）的限制，其他车辆和行人应当让行。</content>\n  <key>ABCD</key>\n  <score>0</score>\n  <ext></ext>\n  <options>\n    <com.tom.model.paper.Option>\n      <alisa>A</alisa>\n      <text>行驶路线</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>B</alisa>\n      <text>行驶方向</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>C</alisa>\n      <text>行驶速度</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>D</alisa>\n      <text>信号灯</text>\n    </com.tom.model.paper.Option>\n  </options>\n</com.tom.model.paper.QuestionMultipleChoice>');
INSERT INTO `tm_question` VALUES ('5f14b2cb-5d59-4faa-8be9-1b5d12f06afc', '9ef3867b-be99-459e-ad4a-79d1eabaa0ec', '2', '3', '', '1', '在道路上发生交通事故，车辆驾驶人应当', 'ABC', '', 'admin', '2017-03-23 18:43:14', 'admin', '2017-03-23 18:43:14', '<com.tom.model.paper.QuestionMultipleChoice>\n  <id>5f14b2cb-5d59-4faa-8be9-1b5d12f06afc</id>\n  <type>2</type>\n  <content>在道路上发生交通事故，车辆驾驶人应当</content>\n  <key>ABC</key>\n  <score>0</score>\n  <ext></ext>\n  <options>\n    <com.tom.model.paper.Option>\n      <alisa>A</alisa>\n      <text>立即停车</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>B</alisa>\n      <text>保护现场</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>C</alisa>\n      <text>抢救伤员</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>D</alisa>\n      <text>撤离现场，自行协商处理损害赔偿事宜</text>\n    </com.tom.model.paper.Option>\n  </options>\n</com.tom.model.paper.QuestionMultipleChoice>');
INSERT INTO `tm_question` VALUES ('6797109c-087e-4dd4-aaf1-688f0dd756e6', '9ef3867b-be99-459e-ad4a-79d1eabaa0ec', '1', '3', '', '1', '遇到前方车辆停车排队或者缓慢行驶时，强行穿插，以下说法正确的是什么？', 'D', '强行穿插，会扰乱车流，加重拥堵，是不文明的表现，应该禁止。', 'admin', '2017-03-23 18:43:13', 'admin', '2017-03-23 18:43:13', '<com.tom.model.paper.QuestionSingleChoice>\n  <id>6797109c-087e-4dd4-aaf1-688f0dd756e6</id>\n  <type>1</type>\n  <content>遇到前方车辆停车排队或者缓慢行驶时，强行穿插，以下说法正确的是什么？</content>\n  <key>D</key>\n  <score>0</score>\n  <ext>强行穿插，会扰乱车流，加重拥堵，是不文明的表现，应该禁止。</ext>\n  <options>\n    <com.tom.model.paper.Option>\n      <alisa>A</alisa>\n      <text>允许,因为可以省油</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>B</alisa>\n      <text>允许,因为可以快速地通过拥堵区</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>C</alisa>\n      <text>禁止,因为这样不利于省油</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>D</alisa>\n      <text>禁止,因为这样扰乱车流,加重拥堵</text>\n    </com.tom.model.paper.Option>\n  </options>\n</com.tom.model.paper.QuestionSingleChoice>');
INSERT INTO `tm_question` VALUES ('754d7304-468d-4d90-bb09-704fc85f7100', '9ef3867b-be99-459e-ad4a-79d1eabaa0ec', '1', '3', '', '1', '驾驶机动车在道路上向左变更车道时如何使用灯光？', 'C', '无论左转还有右转都得提前打灯告诉其他车你的意图，这样才比较安全。', 'admin', '2017-03-23 18:43:14', 'admin', '2017-03-23 18:43:14', '<com.tom.model.paper.QuestionSingleChoice>\n  <id>754d7304-468d-4d90-bb09-704fc85f7100</id>\n  <type>1</type>\n  <content>驾驶机动车在道路上向左变更车道时如何使用灯光？</content>\n  <key>C</key>\n  <score>0</score>\n  <ext>无论左转还有右转都得提前打灯告诉其他车你的意图，这样才比较安全。</ext>\n  <options>\n    <com.tom.model.paper.Option>\n      <alisa>A</alisa>\n      <text>提前开启右转向灯</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>B</alisa>\n      <text>不用开启转向灯</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>C</alisa>\n      <text>提前开启左转向灯</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>D</alisa>\n      <text>提前开启近光灯</text>\n    </com.tom.model.paper.Option>\n  </options>\n</com.tom.model.paper.QuestionSingleChoice>');
INSERT INTO `tm_question` VALUES ('80540ed9-680d-46e0-b7a6-583d6cfd2d84', '9ef3867b-be99-459e-ad4a-79d1eabaa0ec', '1', '3', '', '1', '驾驶的车辆正在被其他车辆超越时，若此时后方有跟随行驶的车辆，应怎样做？', 'B', '我们都应该让,安全行驶,一定要和谐。', 'admin', '2017-03-23 18:43:13', 'admin', '2017-03-23 18:43:13', '<com.tom.model.paper.QuestionSingleChoice>\n  <id>80540ed9-680d-46e0-b7a6-583d6cfd2d84</id>\n  <type>1</type>\n  <content>驾驶的车辆正在被其他车辆超越时，若此时后方有跟随行驶的车辆，应怎样做？</content>\n  <key>B</key>\n  <score>0</score>\n  <ext>我们都应该让,安全行驶,一定要和谐。</ext>\n  <options>\n    <com.tom.model.paper.Option>\n      <alisa>A</alisa>\n      <text>继续加速行驶</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>B</alisa>\n      <text>稍向右侧行驶，保证横向安全距离</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>C</alisa>\n      <text>靠道路中心行驶</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>D</alisa>\n      <text>加速向右侧让路</text>\n    </com.tom.model.paper.Option>\n  </options>\n</com.tom.model.paper.QuestionSingleChoice>');
INSERT INTO `tm_question` VALUES ('81bcbd35-27a7-42ed-97e7-5980014924f1', '9ef3867b-be99-459e-ad4a-79d1eabaa0ec', '4', '3', '', '1', '乘车人不得向[BlankArea1]抛洒物品，不得有[BlankArea2]驾驶人安全驾驶的行为', '车外,影响', '', 'admin', '2017-03-23 18:43:04', 'admin', '2017-03-23 18:43:04', '<com.tom.model.paper.QuestionBlankFill>\n  <id>81bcbd35-27a7-42ed-97e7-5980014924f1</id>\n  <type>4</type>\n  <content>乘车人不得向[BlankArea1]抛洒物品，不得有[BlankArea2]驾驶人安全驾驶的行为</content>\n  <key></key>\n  <score>0</score>\n  <ext></ext>\n  <blanks>\n    <com.tom.model.paper.QBlank>\n      <id>1</id>\n      <name>BLANK1</name>\n      <value>车外</value>\n    </com.tom.model.paper.QBlank>\n    <com.tom.model.paper.QBlank>\n      <id>2</id>\n      <name>BLANK2</name>\n      <value>影响</value>\n    </com.tom.model.paper.QBlank>\n  </blanks>\n  <isComplex>false</isComplex>\n</com.tom.model.paper.QuestionBlankFill>');
INSERT INTO `tm_question` VALUES ('84556610-7ce8-4ac9-b97e-c814c83e96b9', '9ef3867b-be99-459e-ad4a-79d1eabaa0ec', '3', '3', '', '1', '使用其他机动车号牌、行驶证的一次记3分。', 'N', '', 'admin', '2017-03-23 18:42:58', 'admin', '2017-03-23 18:42:58', '<com.tom.model.paper.QuestionJudgment>\n  <id>84556610-7ce8-4ac9-b97e-c814c83e96b9</id>\n  <type>3</type>\n  <content>使用其他机动车号牌、行驶证的一次记3分。</content>\n  <key>N</key>\n  <score>0</score>\n  <ext></ext>\n</com.tom.model.paper.QuestionJudgment>');
INSERT INTO `tm_question` VALUES ('892b22e1-8add-4f98-8698-3ae4547c819c', '9ef3867b-be99-459e-ad4a-79d1eabaa0ec', '1', '3', '', '1', '湿滑路面制动过程中，发现车辆偏离方向，以下做法正确的是？', 'D', '这个情况下，立即踏制动踏板容易引起侧翻。如后轮一直被刹住的情况下，不松开踏板，汽车会出现甩尾现象;如前轮一直被刹住的情况下不松开踏板，汽车会出现方向失去控制。正确的做法是先握紧方向盘，不要紧急踩刹车。', 'admin', '2017-03-23 18:43:14', 'admin', '2017-03-23 18:43:14', '<com.tom.model.paper.QuestionSingleChoice>\n  <id>892b22e1-8add-4f98-8698-3ae4547c819c</id>\n  <type>1</type>\n  <content>湿滑路面制动过程中，发现车辆偏离方向，以下做法正确的是？</content>\n  <key>D</key>\n  <score>0</score>\n  <ext>这个情况下，立即踏制动踏板容易引起侧翻。如后轮一直被刹住的情况下，不松开踏板，汽车会出现甩尾现象;如前轮一直被刹住的情况下不松开踏板，汽车会出现方向失去控制。正确的做法是先握紧方向盘，不要紧急踩刹车。</ext>\n  <options>\n    <com.tom.model.paper.Option>\n      <alisa>A</alisa>\n      <text>任意踩制动踏板</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>B</alisa>\n      <text>连续轻踩轻放制动踏板</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>C</alisa>\n      <text>用力踩制动踏板</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>D</alisa>\n      <text>不要踩制动踏板</text>\n    </com.tom.model.paper.Option>\n  </options>\n</com.tom.model.paper.QuestionSingleChoice>');
INSERT INTO `tm_question` VALUES ('96c36195-f77b-42dd-9523-a03d469af248', '9ef3867b-be99-459e-ad4a-79d1eabaa0ec', '4', '3', '', '1', '行人在没有人行道的道路上行走，应当靠路的[BlankArea1]行走', '右边', '', 'admin', '2017-03-23 18:43:04', 'admin', '2017-03-23 18:43:04', '<com.tom.model.paper.QuestionBlankFill>\n  <id>96c36195-f77b-42dd-9523-a03d469af248</id>\n  <type>4</type>\n  <content>行人在没有人行道的道路上行走，应当靠路的[BlankArea1]行走</content>\n  <key></key>\n  <score>0</score>\n  <ext></ext>\n  <blanks>\n    <com.tom.model.paper.QBlank>\n      <id>1</id>\n      <name>BLANK1</name>\n      <value>右边</value>\n    </com.tom.model.paper.QBlank>\n  </blanks>\n  <isComplex>false</isComplex>\n</com.tom.model.paper.QuestionBlankFill>');
INSERT INTO `tm_question` VALUES ('9bb72b32-984b-4c7f-bc11-600fa9a76e56', '9ef3867b-be99-459e-ad4a-79d1eabaa0ec', '3', '3', '', '1', '机动车在高速公路上发生故障时，在来车方向50至100米处设置警告标志。', 'N', '', 'admin', '2017-03-23 18:42:58', 'admin', '2017-03-23 18:42:58', '<com.tom.model.paper.QuestionJudgment>\n  <id>9bb72b32-984b-4c7f-bc11-600fa9a76e56</id>\n  <type>3</type>\n  <content>机动车在高速公路上发生故障时，在来车方向50至100米处设置警告标志。</content>\n  <key>N</key>\n  <score>0</score>\n  <ext></ext>\n</com.tom.model.paper.QuestionJudgment>');
INSERT INTO `tm_question` VALUES ('ace45e36-cb61-409a-bad4-9a587222d332', '9ef3867b-be99-459e-ad4a-79d1eabaa0ec', '4', '3', '', '1', '使用电灯时，灯炮不要[BlankArea1]可燃物', '接触或靠近', '', 'admin', '2017-03-23 18:43:04', 'admin', '2017-03-23 18:43:04', '<com.tom.model.paper.QuestionBlankFill>\n  <id>ace45e36-cb61-409a-bad4-9a587222d332</id>\n  <type>4</type>\n  <content>使用电灯时，灯炮不要[BlankArea1]可燃物</content>\n  <key></key>\n  <score>0</score>\n  <ext></ext>\n  <blanks>\n    <com.tom.model.paper.QBlank>\n      <id>1</id>\n      <name>BLANK1</name>\n      <value>接触或靠近</value>\n    </com.tom.model.paper.QBlank>\n  </blanks>\n  <isComplex>false</isComplex>\n</com.tom.model.paper.QuestionBlankFill>');
INSERT INTO `tm_question` VALUES ('b6a6cbb8-320e-4ec7-84c6-612872cfaf97', '9ef3867b-be99-459e-ad4a-79d1eabaa0ec', '3', '3', '', '1', '驾驶人要按照驾驶证载明的准驾车型驾驶车辆。', 'Y', '', 'admin', '2017-03-23 18:42:58', 'admin', '2017-03-23 18:42:58', '<com.tom.model.paper.QuestionJudgment>\n  <id>b6a6cbb8-320e-4ec7-84c6-612872cfaf97</id>\n  <type>3</type>\n  <content>驾驶人要按照驾驶证载明的准驾车型驾驶车辆。</content>\n  <key>Y</key>\n  <score>0</score>\n  <ext></ext>\n</com.tom.model.paper.QuestionJudgment>');
INSERT INTO `tm_question` VALUES ('b7538ad9-6245-45fc-b79b-a4c4f7583920', '9ef3867b-be99-459e-ad4a-79d1eabaa0ec', '1', '3', '', '1', '醉酒驾驶机动车在道路上行驶会受到什么处罚？', 'C', '醉酒驾驶，由公安机关约束至酒醒。吊销机驾驶证，依法追究刑事责任，5年内不得重新取得驾驶证。', 'admin', '2017-03-23 18:43:14', 'admin', '2017-03-23 18:43:14', '<com.tom.model.paper.QuestionSingleChoice>\n  <id>b7538ad9-6245-45fc-b79b-a4c4f7583920</id>\n  <type>1</type>\n  <content>醉酒驾驶机动车在道路上行驶会受到什么处罚？</content>\n  <key>C</key>\n  <score>0</score>\n  <ext>醉酒驾驶，由公安机关约束至酒醒。吊销机驾驶证，依法追究刑事责任，5年内不得重新取得驾驶证。</ext>\n  <options>\n    <com.tom.model.paper.Option>\n      <alisa>A</alisa>\n      <text>处管制，并处罚金</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>B</alisa>\n      <text>处2年以上徒刑</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>C</alisa>\n      <text>处拘役，并处罚金</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>D</alisa>\n      <text>处2年以下徒刑</text>\n    </com.tom.model.paper.Option>\n  </options>\n</com.tom.model.paper.QuestionSingleChoice>');
INSERT INTO `tm_question` VALUES ('b828e46d-3ab2-463c-bbb1-c936f999f8d5', '9ef3867b-be99-459e-ad4a-79d1eabaa0ec', '3', '3', '', '1', '车辆下坡行驶，要适当控制车速，充分利用发动机进行制动。', 'Y', '', 'admin', '2017-03-23 18:42:58', 'admin', '2017-03-23 18:42:58', '<com.tom.model.paper.QuestionJudgment>\n  <id>b828e46d-3ab2-463c-bbb1-c936f999f8d5</id>\n  <type>3</type>\n  <content>车辆下坡行驶，要适当控制车速，充分利用发动机进行制动。</content>\n  <key>Y</key>\n  <score>0</score>\n  <ext></ext>\n</com.tom.model.paper.QuestionJudgment>');
INSERT INTO `tm_question` VALUES ('b9d6ecf2-908e-4df6-9a41-200041f8f401', '9ef3867b-be99-459e-ad4a-79d1eabaa0ec', '1', '3', '', '1', '饮酒后或者醉酒驾驶机动车发生重大交通事故构成犯罪的，依法追究刑事责任，吊销机动车驾驶证，将多少年内不得申请机动车驾驶证？', 'D', '', 'admin', '2017-03-23 18:43:13', 'admin', '2017-03-23 18:43:13', '<com.tom.model.paper.QuestionSingleChoice>\n  <id>b9d6ecf2-908e-4df6-9a41-200041f8f401</id>\n  <type>1</type>\n  <content>饮酒后或者醉酒驾驶机动车发生重大交通事故构成犯罪的，依法追究刑事责任，吊销机动车驾驶证，将多少年内不得申请机动车驾驶证？</content>\n  <key>D</key>\n  <score>0</score>\n  <ext></ext>\n  <options>\n    <com.tom.model.paper.Option>\n      <alisa>A</alisa>\n      <text>五年</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>B</alisa>\n      <text>十年</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>C</alisa>\n      <text>二十年</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>D</alisa>\n      <text>终生</text>\n    </com.tom.model.paper.Option>\n  </options>\n</com.tom.model.paper.QuestionSingleChoice>');
INSERT INTO `tm_question` VALUES ('bbc293c7-001b-4ef1-ae90-56cb6d41bcb7', '9ef3867b-be99-459e-ad4a-79d1eabaa0ec', '1', '3', '', '1', '上道路行驶的机动车有哪种情形交通警察可依法扣留车辆？', 'A', '未放置检验合格标志，未悬挂机动车号牌，未放置保险标志的，未携带机动车行驶证的都是可依法扣留车辆的。', 'admin', '2017-03-23 18:43:14', 'admin', '2017-03-23 18:43:14', '<com.tom.model.paper.QuestionSingleChoice>\n  <id>bbc293c7-001b-4ef1-ae90-56cb6d41bcb7</id>\n  <type>1</type>\n  <content>上道路行驶的机动车有哪种情形交通警察可依法扣留车辆？</content>\n  <key>A</key>\n  <score>0</score>\n  <ext>未放置检验合格标志，未悬挂机动车号牌，未放置保险标志的，未携带机动车行驶证的都是可依法扣留车辆的。</ext>\n  <options>\n    <com.tom.model.paper.Option>\n      <alisa>A</alisa>\n      <text>未放置检验合格标志</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>B</alisa>\n      <text>未携带身份证</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>C</alisa>\n      <text>未放置城市环保标志</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>D</alisa>\n      <text>未携带机动车登记证书</text>\n    </com.tom.model.paper.Option>\n  </options>\n</com.tom.model.paper.QuestionSingleChoice>');
INSERT INTO `tm_question` VALUES ('bfa546e2-910a-459c-8599-1062bc093456', '9ef3867b-be99-459e-ad4a-79d1eabaa0ec', '5', '3', '', '1', '简述机动车辆安全行车的的基本要求', '执行派车制度，不应将车辆交他人驾驶; 驾驶人员随时携带国家公安交通管理机关核发的《中华人民共和国机动车驾驶证》和《烟草系统机动车驾驶员上岗证》; 严禁酒后、醉酒、超速等违章驾驶;货车载物应当符合核定的载物量，严禁超载;载物的长、宽、高不应违反装载要求，不应遗洒、飘散载运物;机动车行驶时，驾驶人、乘坐人员应按规定使用安全带;进入厂(场)区主干道最高行驶速度为30 km/h，其它道路最高行驶速度为20 km/h;道口、交叉口、装卸作业、人行稠密地段、下坡道和设有警告标识处，最高行驶速度为15 km/h;进出厂房、仓库大门、停车场、危险地段和生产现场，最高行驶速度为5 km/h;机动车在高速公路上发生故障时，警告标志应当设置在故障车来车方向150 m以外，车上人员应当迅速转移到右侧路肩上或者应急车道内;在道路上发生故障，需要停车排除故障时，驾驶人应当立即开启危险报警闪光灯，将机动车移至不妨碍交。通的地方停放;难以移动的，应当持续开启危险报警闪光灯，并在来车方向设置警告标志等措施扩大示警距离;交通事故专项应急预案的演练，具体执行YC/T384第1部分4.18的要求。', '', 'admin', '2017-03-23 18:43:09', 'admin', '2017-03-23 18:43:09', '<com.tom.model.paper.QuestionEssay>\n  <id>bfa546e2-910a-459c-8599-1062bc093456</id>\n  <type>5</type>\n  <content>简述机动车辆安全行车的的基本要求</content>\n  <key>执行派车制度，不应将车辆交他人驾驶; 驾驶人员随时携带国家公安交通管理机关核发的《中华人民共和国机动车驾驶证》和《烟草系统机动车驾驶员上岗证》; 严禁酒后、醉酒、超速等违章驾驶;货车载物应当符合核定的载物量，严禁超载;载物的长、宽、高不应违反装载要求，不应遗洒、飘散载运物;机动车行驶时，驾驶人、乘坐人员应按规定使用安全带;进入厂(场)区主干道最高行驶速度为30 km/h，其它道路最高行驶速度为20 km/h;道口、交叉口、装卸作业、人行稠密地段、下坡道和设有警告标识处，最高行驶速度为15 km/h;进出厂房、仓库大门、停车场、危险地段和生产现场，最高行驶速度为5 km/h;机动车在高速公路上发生故障时，警告标志应当设置在故障车来车方向150 m以外，车上人员应当迅速转移到右侧路肩上或者应急车道内;在道路上发生故障，需要停车排除故障时，驾驶人应当立即开启危险报警闪光灯，将机动车移至不妨碍交。通的地方停放;难以移动的，应当持续开启危险报警闪光灯，并在来车方向设置警告标志等措施扩大示警距离;交通事故专项应急预案的演练，具体执行YC/T384第1部分4.18的要求。</key>\n  <score>0</score>\n  <ext></ext>\n</com.tom.model.paper.QuestionEssay>');
INSERT INTO `tm_question` VALUES ('c75d20b4-a417-4cda-b7f6-2e42b090b131', '9ef3867b-be99-459e-ad4a-79d1eabaa0ec', '5', '3', '', '1', '道路交通安全法规定哪些人和车辆不能进入高速公路？', '行人、非机动车、拖拉机、轮式专用机械车、铰接式客车、全挂拖斗车以及其他设计最高时速低于七十公里的机动车，不得进入高速公路。', '', 'admin', '2017-03-23 18:43:09', 'admin', '2017-03-23 18:43:09', '<com.tom.model.paper.QuestionEssay>\n  <id>c75d20b4-a417-4cda-b7f6-2e42b090b131</id>\n  <type>5</type>\n  <content>道路交通安全法规定哪些人和车辆不能进入高速公路？</content>\n  <key>行人、非机动车、拖拉机、轮式专用机械车、铰接式客车、全挂拖斗车以及其他设计最高时速低于七十公里的机动车，不得进入高速公路。</key>\n  <score>0</score>\n  <ext></ext>\n</com.tom.model.paper.QuestionEssay>');
INSERT INTO `tm_question` VALUES ('ccecf2c5-4c48-4a5d-87ff-728b136e2465', '9ef3867b-be99-459e-ad4a-79d1eabaa0ec', '1', '3', '', '1', '防抱死制动系统（ABS）在什么情况下可以最大限度发挥制动器效能?', 'C', 'ABS的目的就是为了防止刹车的时候一脚踩死，导致翻车什么的。 不过刹车刹死就比较慢（速度N快的时候），效果等于踩下刹车，再松下刹车，反复几次！', 'admin', '2017-03-23 18:43:13', 'admin', '2017-03-23 18:43:13', '<com.tom.model.paper.QuestionSingleChoice>\n  <id>ccecf2c5-4c48-4a5d-87ff-728b136e2465</id>\n  <type>1</type>\n  <content>防抱死制动系统（ABS）在什么情况下可以最大限度发挥制动器效能?</content>\n  <key>C</key>\n  <score>0</score>\n  <ext>ABS的目的就是为了防止刹车的时候一脚踩死，导致翻车什么的。 不过刹车刹死就比较慢（速度N快的时候），效果等于踩下刹车，再松下刹车，反复几次！</ext>\n  <options>\n    <com.tom.model.paper.Option>\n      <alisa>A</alisa>\n      <text>间歇制动</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>B</alisa>\n      <text>持续制动</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>C</alisa>\n      <text>紧急制动</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>D</alisa>\n      <text>缓踏制动踏板</text>\n    </com.tom.model.paper.Option>\n  </options>\n</com.tom.model.paper.QuestionSingleChoice>');
INSERT INTO `tm_question` VALUES ('d2fe687b-c82c-4bd5-b2e8-3dcd32df2fa5', '9ef3867b-be99-459e-ad4a-79d1eabaa0ec', '5', '3', '', '1', '如何做一名合格的驾驶员？', '首先要有法治观念、要有熟练的驾驶技术并对自己驾驶的汽车了如指掌、要养成良好的驾驶习惯，文明驾驶、要充分照顾交通弱势群体的利益、要有平和的驾驶心态等等', '', 'admin', '2017-03-23 18:43:09', 'admin', '2017-03-23 18:43:09', '<com.tom.model.paper.QuestionEssay>\n  <id>d2fe687b-c82c-4bd5-b2e8-3dcd32df2fa5</id>\n  <type>5</type>\n  <content>如何做一名合格的驾驶员？</content>\n  <key>首先要有法治观念、要有熟练的驾驶技术并对自己驾驶的汽车了如指掌、要养成良好的驾驶习惯，文明驾驶、要充分照顾交通弱势群体的利益、要有平和的驾驶心态等等</key>\n  <score>0</score>\n  <ext></ext>\n</com.tom.model.paper.QuestionEssay>');
INSERT INTO `tm_question` VALUES ('dd932ec0-5ce1-49f1-a17b-34acd84c6198', '9ef3867b-be99-459e-ad4a-79d1eabaa0ec', '4', '3', '', '1', '每年\"中小学生安全教育日\"是在[BlankArea1]。', '3月份最后一周的周一', '', 'admin', '2017-03-23 18:43:04', 'admin', '2017-03-23 18:43:04', '<com.tom.model.paper.QuestionBlankFill>\n  <id>dd932ec0-5ce1-49f1-a17b-34acd84c6198</id>\n  <type>4</type>\n  <content>每年&quot;中小学生安全教育日&quot;是在[BlankArea1]。</content>\n  <key></key>\n  <score>0</score>\n  <ext></ext>\n  <blanks>\n    <com.tom.model.paper.QBlank>\n      <id>1</id>\n      <name>BLANK1</name>\n      <value>3月份最后一周的周一</value>\n    </com.tom.model.paper.QBlank>\n  </blanks>\n  <isComplex>false</isComplex>\n</com.tom.model.paper.QuestionBlankFill>');
INSERT INTO `tm_question` VALUES ('e4191110-a718-4ad3-a207-4ebceaa08211', '9ef3867b-be99-459e-ad4a-79d1eabaa0ec', '4', '3', '', '1', '我国交通事故报警求救电话号码是[BlankArea1]', '122', '', 'admin', '2017-03-23 18:43:04', 'admin', '2017-03-23 18:43:04', '<com.tom.model.paper.QuestionBlankFill>\n  <id>e4191110-a718-4ad3-a207-4ebceaa08211</id>\n  <type>4</type>\n  <content>我国交通事故报警求救电话号码是[BlankArea1]</content>\n  <key></key>\n  <score>0</score>\n  <ext></ext>\n  <blanks>\n    <com.tom.model.paper.QBlank>\n      <id>1</id>\n      <name>BLANK1</name>\n      <value>122</value>\n    </com.tom.model.paper.QBlank>\n  </blanks>\n  <isComplex>false</isComplex>\n</com.tom.model.paper.QuestionBlankFill>');
INSERT INTO `tm_question` VALUES ('e552dafb-2d05-4e14-b743-84f7d2315d28', '9ef3867b-be99-459e-ad4a-79d1eabaa0ec', '2', '3', '', '1', '乘坐机动车应当遵守下列规定：', 'BCD', '', 'admin', '2017-03-23 18:43:14', 'admin', '2017-03-23 18:43:14', '<com.tom.model.paper.QuestionMultipleChoice>\n  <id>e552dafb-2d05-4e14-b743-84f7d2315d28</id>\n  <type>2</type>\n  <content>乘坐机动车应当遵守下列规定：</content>\n  <key>BCD</key>\n  <score>0</score>\n  <ext></ext>\n  <options>\n    <com.tom.model.paper.Option>\n      <alisa>A</alisa>\n      <text>乘坐两轮摩托车可以侧向骑坐</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>B</alisa>\n      <text>不得在机动车道上拦乘机动车</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>C</alisa>\n      <text>在机动车道上不得从机动车左侧上下车</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>D</alisa>\n      <text>开关车门不得妨碍其他车辆和行人通行</text>\n    </com.tom.model.paper.Option>\n  </options>\n</com.tom.model.paper.QuestionMultipleChoice>');
INSERT INTO `tm_question` VALUES ('f6e4b641-bc54-4388-8ca9-11add871bfed', '9ef3867b-be99-459e-ad4a-79d1eabaa0ec', '1', '3', '', '1', '车辆在较窄的山路上行驶时，如果靠山体的一方不让行，应怎样做？', 'C', '如果没特别指明我们有优先权，选事事让着别人就对了，做人和开车，都要学会淡定。', 'admin', '2017-03-23 18:43:13', 'admin', '2017-03-23 18:43:13', '<com.tom.model.paper.QuestionSingleChoice>\n  <id>f6e4b641-bc54-4388-8ca9-11add871bfed</id>\n  <type>1</type>\n  <content>车辆在较窄的山路上行驶时，如果靠山体的一方不让行，应怎样做？</content>\n  <key>C</key>\n  <score>0</score>\n  <ext>如果没特别指明我们有优先权，选事事让着别人就对了，做人和开车，都要学会淡定。</ext>\n  <options>\n    <com.tom.model.paper.Option>\n      <alisa>A</alisa>\n      <text>鸣喇叭催其让行</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>B</alisa>\n      <text>保持正常车速行驶</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>C</alisa>\n      <text>提前减速或停车避让</text>\n    </com.tom.model.paper.Option>\n    <com.tom.model.paper.Option>\n      <alisa>D</alisa>\n      <text>向左占道，谨慎驶过</text>\n    </com.tom.model.paper.Option>\n  </options>\n</com.tom.model.paper.QuestionSingleChoice>');

-- ----------------------------
-- Table structure for tm_question_db
-- ----------------------------
DROP TABLE IF EXISTS `tm_question_db`;
CREATE TABLE `tm_question_db` (
  `d_id` varchar(50) NOT NULL,
  `d_name` varchar(100) DEFAULT NULL,
  `d_logo` varchar(100) DEFAULT NULL,
  `d_status` int(2) DEFAULT NULL,
  `d_remark` varchar(200) DEFAULT NULL,
  `d_poster` varchar(50) DEFAULT NULL,
  `d_createdate` datetime DEFAULT NULL,
  `d_modifyor` varchar(50) DEFAULT NULL,
  `d_modifydate` datetime DEFAULT NULL,
  PRIMARY KEY (`d_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_question_db
-- ----------------------------
INSERT INTO `tm_question_db` VALUES ('9ef3867b-be99-459e-ad4a-79d1eabaa0ec', '测试题库', '', '1', '测试题库', 'admin', '2016-07-14 22:02:30', 'admin', '2016-07-31 22:11:06');

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
-- Table structure for tm_system_config
-- ----------------------------
DROP TABLE IF EXISTS `tm_system_config`;
CREATE TABLE `tm_system_config` (
  `c_id` int(11) NOT NULL,
  `c_config` text,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_system_config
-- ----------------------------
INSERT INTO `tm_system_config` VALUES ('1', '<map>\n  <entry>\n    <string>sys_allow_register</string>\n    <string>allow</string>\n  </entry>\n  <entry>\n    <string>sys_lang</string>\n    <string>zh_CN</string>\n  </entry>\n  <entry>\n    <string>sys_sitename</string>\n    <string>TomExam3.0免费版</string>\n  </entry>\n  <entry>\n    <string>sys_allow_test</string>\n    <string>allow</string>\n  </entry>\n  <entry>\n    <string>sys_access_control</string>\n    <string>close</string>\n  </entry>\n  <entry>\n    <string>sys_allow_exam</string>\n    <string>allow</string>\n  </entry>\n  <entry>\n    <string>sys_access_ips</string>\n    <string>10.32.0.1</string>\n  </entry>\n  <entry>\n    <string>sys_allow_login</string>\n    <string>allow</string>\n  </entry>\n</map>');
INSERT INTO `tm_system_config` VALUES ('2', 'UE83SS1ZT1JYLU1TQU8tVEJaUS1IMVI2');

-- ----------------------------
-- Table structure for tm_system_function_lib
-- ----------------------------
DROP TABLE IF EXISTS `tm_system_function_lib`;
CREATE TABLE `tm_system_function_lib` (
  `f_code` varchar(50) DEFAULT NULL,
  `f_cname` varchar(50) DEFAULT NULL,
  `f_ename` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_system_function_lib
-- ----------------------------
INSERT INTO `tm_system_function_lib` VALUES ('M-QDB', '题库管理', 'Question Bank Manage');
INSERT INTO `tm_system_function_lib` VALUES ('F-QDB', '题库管理', 'Question Bank Manage');
INSERT INTO `tm_system_function_lib` VALUES ('P-QDB-ADD', '增加题库', 'Add Question Bank');
INSERT INTO `tm_system_function_lib` VALUES ('P-QDB-DELETE', '删除题库', 'Delete Question Bank');
INSERT INTO `tm_system_function_lib` VALUES ('P-QDB-UPDATE', '修改题库', 'Modify Question Bank');
INSERT INTO `tm_system_function_lib` VALUES ('P-QDB-VIEW', '查看题库', 'View Question Bank');
INSERT INTO `tm_system_function_lib` VALUES ('F-QES', '试题管理', 'Question Manage');
INSERT INTO `tm_system_function_lib` VALUES ('P-QES-ADD', '增加试题', 'Add Question');
INSERT INTO `tm_system_function_lib` VALUES ('P-QES-DELETE', '删除试题', 'Delete Question');
INSERT INTO `tm_system_function_lib` VALUES ('P-QES-UPDATE', '修改试题', 'Modify Question');
INSERT INTO `tm_system_function_lib` VALUES ('P-QES-VIEW', '查看试题', 'View Question');
INSERT INTO `tm_system_function_lib` VALUES ('P-QES-IMPORT', '导入试题', 'Import Questions');
INSERT INTO `tm_system_function_lib` VALUES ('M-PAPER', '试题管理', 'Paper Manage');
INSERT INTO `tm_system_function_lib` VALUES ('F-PAPER', '试题管理', 'Paper Manage');
INSERT INTO `tm_system_function_lib` VALUES ('P-PAPER-ADD', '增加试卷', 'Add Paper');
INSERT INTO `tm_system_function_lib` VALUES ('P-PAPER-DELETE', '删除试卷', 'Delete Paper');
INSERT INTO `tm_system_function_lib` VALUES ('P-PAPER-UPDATE', '修改试卷', 'Modify Paper');
INSERT INTO `tm_system_function_lib` VALUES ('P-PAPER-VIEW', '查看试卷', 'View Paper');
INSERT INTO `tm_system_function_lib` VALUES ('P-PAPER-HISTORY-VIEW', '查看考试记录', 'View Exam History');
INSERT INTO `tm_system_function_lib` VALUES ('P-PAPER-HISTORY-CHECK', '批改考试记录', 'Check Exam History');
INSERT INTO `tm_system_function_lib` VALUES ('P-PAPER-HISTORY-REMOVE', '删除考试记录', 'Delete Exam History');
INSERT INTO `tm_system_function_lib` VALUES ('F-PAPER-CATE', '试题分类管理', 'Paper Category Manage');
INSERT INTO `tm_system_function_lib` VALUES ('P-PAPER-CATE-ADD', '增加试卷分类', 'Add Paper Category');
INSERT INTO `tm_system_function_lib` VALUES ('P-PAPER-CATE-DELETE', '删除试卷分类', 'Delete Paper Category');
INSERT INTO `tm_system_function_lib` VALUES ('P-PAPER-CATE-UPDATE', '修改试卷分类', 'Modify Paper Category');
INSERT INTO `tm_system_function_lib` VALUES ('P-PAPER-CATE-VIEW', '查看试卷分类', 'View Paper Category');
INSERT INTO `tm_system_function_lib` VALUES ('M-ANALYSIS', '数据分析', 'Data Analysis');
INSERT INTO `tm_system_function_lib` VALUES ('F-ANALYSIS', '数据分析', 'Data Analysis');
INSERT INTO `tm_system_function_lib` VALUES ('P-ANA-EXAM', '考试分析', 'Exam Analysis');
INSERT INTO `tm_system_function_lib` VALUES ('P-ANA-PAPER', '试卷分析', 'Paper Analysis');
INSERT INTO `tm_system_function_lib` VALUES ('P-ANA-SCORE', '成绩分析', 'Score Analysis');
INSERT INTO `tm_system_function_lib` VALUES ('M-USERS', '用户管理', 'User Manage');
INSERT INTO `tm_system_function_lib` VALUES ('F-USERS', '用户管理', 'User Manage');
INSERT INTO `tm_system_function_lib` VALUES ('P-USER-ADD', '增加用户', 'Add User');
INSERT INTO `tm_system_function_lib` VALUES ('P-USER-IMPORT', '批量导入用户', 'Import Users');
INSERT INTO `tm_system_function_lib` VALUES ('P-USER-DELETE', '删除用户', 'Delete User');
INSERT INTO `tm_system_function_lib` VALUES ('P-USER-UPDATE', '修改用户', 'Modify User');
INSERT INTO `tm_system_function_lib` VALUES ('P-USER-VIEW', '查看用户', 'View User');
INSERT INTO `tm_system_function_lib` VALUES ('P-USER-EXAMVIEW', '查看用户考试记录', 'View Exam History');
INSERT INTO `tm_system_function_lib` VALUES ('F-BRANCH', '用户部门管理', 'User Department Manage');
INSERT INTO `tm_system_function_lib` VALUES ('P-BRANCH-ADD', '增加用户部门', 'Add Department');
INSERT INTO `tm_system_function_lib` VALUES ('P-BRANCH-DELETE', '删除用户部门', 'Delete Department');
INSERT INTO `tm_system_function_lib` VALUES ('P-BRANCH-UPDATE', '修改用户部门', 'Modify Department');
INSERT INTO `tm_system_function_lib` VALUES ('P-BRANCH-VIEW', '查看用户部门', 'View Department');
INSERT INTO `tm_system_function_lib` VALUES ('F-UPOSITION', '用户职务管理', 'User Positions Manage');
INSERT INTO `tm_system_function_lib` VALUES ('P-UPOSITION-ADD', '增加用户职务', 'Add Position');
INSERT INTO `tm_system_function_lib` VALUES ('P-UPOSITION-DELETE', '删除用户职务', 'Delete Position');
INSERT INTO `tm_system_function_lib` VALUES ('P-UPOSITION-UPDATE', '修改用户职务', 'Modify Position');
INSERT INTO `tm_system_function_lib` VALUES ('P-UPOSITION-VIEW', '查看用户职务', 'View Position');
INSERT INTO `tm_system_function_lib` VALUES ('M-INTERACTION', '互动交流', 'Interaction and Communication');
INSERT INTO `tm_system_function_lib` VALUES ('F-NEWS', '文章管理', 'Article Manage');
INSERT INTO `tm_system_function_lib` VALUES ('P-NEWS-ADD', '增加文章', 'Add Article');
INSERT INTO `tm_system_function_lib` VALUES ('P-NEWS-DELETE', '删除文章', 'Delete Article');
INSERT INTO `tm_system_function_lib` VALUES ('P-NEWS-UPDATE', '修改文章', 'Modify Article');
INSERT INTO `tm_system_function_lib` VALUES ('P-NEWS-VIEW', '查看文章', 'View Article');
INSERT INTO `tm_system_function_lib` VALUES ('F-NEWSCATE', '文章分类管理', 'Article Category Manage');
INSERT INTO `tm_system_function_lib` VALUES ('P-NEWSCATE-ADD', '增加文章分类', 'Add Category');
INSERT INTO `tm_system_function_lib` VALUES ('P-NEWSCATE-DELETE', '删除文章分类', 'Delete Category');
INSERT INTO `tm_system_function_lib` VALUES ('P-NEWSCATE-UPDATE', '修改文章分类', 'Modify Category');
INSERT INTO `tm_system_function_lib` VALUES ('P-NEWSCATE-VIEW', '查看文章分类', 'View Category');
INSERT INTO `tm_system_function_lib` VALUES ('M-SYSTEM', '系统管理', 'System Manage');
INSERT INTO `tm_system_function_lib` VALUES ('F-SYS', '系统设置', 'System Config');
INSERT INTO `tm_system_function_lib` VALUES ('P-SYS-CONFIG', '系统参数设置', 'System Setting');
INSERT INTO `tm_system_function_lib` VALUES ('P-SYS-LOG', '查看系统日志', 'View System Logs');
INSERT INTO `tm_system_function_lib` VALUES ('F-ADMIN', '管理员管理', 'Administrators Manage');
INSERT INTO `tm_system_function_lib` VALUES ('P-ADMIN-ADD', '增加管理', 'Add Administrator');
INSERT INTO `tm_system_function_lib` VALUES ('P-ADMIN-DELETE', '删除管理员', 'Delete Administrator');
INSERT INTO `tm_system_function_lib` VALUES ('P-ADMIN-UPDATE', '修改管理员', 'Modify Administrator');
INSERT INTO `tm_system_function_lib` VALUES ('P-ADMIN-VIEW', '查看管理员', 'View Administrator');
INSERT INTO `tm_system_function_lib` VALUES ('F-ROLE', '管理员角色管理', 'Administrator Role Manage');
INSERT INTO `tm_system_function_lib` VALUES ('P-ROLE-ADD', '增加管理员角色', 'Add Role');
INSERT INTO `tm_system_function_lib` VALUES ('P-ROLE-DELETE', '删除管理员角色', 'Delete Role');
INSERT INTO `tm_system_function_lib` VALUES ('P-ROLE-UPDATE', '修改管理员角色', 'Modify Role');
INSERT INTO `tm_system_function_lib` VALUES ('P-ROLE-VIEW', '查看管理员角色', 'View Role');
INSERT INTO `tm_system_function_lib` VALUES ('M-OTHER', '其他权限', 'Others');
INSERT INTO `tm_system_function_lib` VALUES ('F-SUPER', '超级管理员 ', 'Super-Administrator');
INSERT INTO `tm_system_function_lib` VALUES ('P-OTH-SUPER', '超级管理员权限', 'Super-Administrator Privileges');
INSERT INTO `tm_system_function_lib` VALUES ('doLogin', '登录', 'Login');
INSERT INTO `tm_system_function_lib` VALUES ('doLogout', '登出', 'Logout');
INSERT INTO `tm_system_function_lib` VALUES ('updateProfile', '修改账户信息', 'Update Account');
INSERT INTO `tm_system_function_lib` VALUES ('M-LEARNING', '学习系统', 'Learning System');
INSERT INTO `tm_system_function_lib` VALUES ('F-COURSE', '课程管理', 'Course Manage');
INSERT INTO `tm_system_function_lib` VALUES ('P-COURSE-ADD', '增加课程', 'Add Course');
INSERT INTO `tm_system_function_lib` VALUES ('P-COURSE-DELETE', '删除课程', 'Delete Course');
INSERT INTO `tm_system_function_lib` VALUES ('P-COURSE-UPDATE', '修改课程', 'Modify Course');
INSERT INTO `tm_system_function_lib` VALUES ('P-COURSE-DATAVIEW', '查看课程数据', 'View Course Data');
INSERT INTO `tm_system_function_lib` VALUES ('F-COURSE-CATEGORY', '课程分类管理', 'Course Category Manage');
INSERT INTO `tm_system_function_lib` VALUES ('P-COURSE-CATEGORY-ADD', '增加课程分类', 'Add Category');
INSERT INTO `tm_system_function_lib` VALUES ('P-COURSE-CATEGORY-DELETE', '删除课程分类', 'Delete Category');
INSERT INTO `tm_system_function_lib` VALUES ('P-COURSE-CATEGORY-UPDATE', '修改课程分类', 'Modify Category');
INSERT INTO `tm_system_function_lib` VALUES ('F-COURSE-TEACHER', '课程讲师管理', 'Course Teacher Manage');
INSERT INTO `tm_system_function_lib` VALUES ('P-COURSE-TEACHER-ADD', '增加讲师', 'Add Teacher');
INSERT INTO `tm_system_function_lib` VALUES ('P-COURSE-TEACHER-DELETE', '删除讲师', 'Delete Teacher');
INSERT INTO `tm_system_function_lib` VALUES ('P-COURSE-TEACHER-UPDATE', '修改讲师', 'Modify Teacher');
INSERT INTO `tm_system_function_lib` VALUES ('P-PAPER-CLONE', '克隆试卷', 'Clone Paper');
INSERT INTO `tm_system_function_lib` VALUES ('P-PAPER-EXPORTWORD', '导出试卷', 'Export Paper');

-- ----------------------------
-- Table structure for tm_system_log
-- ----------------------------
DROP TABLE IF EXISTS `tm_system_log`;
CREATE TABLE `tm_system_log` (
  `l_id` int(11) NOT NULL AUTO_INCREMENT,
  `l_usertype` int(11) DEFAULT NULL COMMENT '1管理员，2用户',
  `l_username` varchar(50) DEFAULT NULL,
  `l_action` varchar(50) DEFAULT NULL COMMENT '汉??说明，如：登录',
  `l_url` varchar(500) DEFAULT NULL,
  `l_logdate` datetime DEFAULT NULL,
  `l_logdesc` varchar(500) DEFAULT NULL,
  `l_ip` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`l_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1571 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_system_log
-- ----------------------------
INSERT INTO `tm_system_log` VALUES ('1557', '1', 'admin', 'doLogin', '/common/login.do', '2017-07-21 17:24:47', '用户验证码错误(verify_code_wrong)', '0:0:0:0:0:0:0:1');
INSERT INTO `tm_system_log` VALUES ('1558', '1', 'admin', 'doLogin', '/common/login.do', '2017-07-21 17:24:54', '登录成功(login_success)', '0:0:0:0:0:0:0:1');
INSERT INTO `tm_system_log` VALUES ('1559', '1', 'admin', 'P-QDB-ADD', '/system/qdb/add.thtml', '2017-07-21 17:25:08', 'true', '0:0:0:0:0:0:0:1');
INSERT INTO `tm_system_log` VALUES ('1560', '1', 'admin', 'F-QDB', '/system/qdb/list.thtml', '2017-07-21 17:25:10', 'true', '0:0:0:0:0:0:0:1');
INSERT INTO `tm_system_log` VALUES ('1561', '1', 'admin', 'P-QES-ADD', '/system/question/add.thtml', '2017-07-21 17:25:12', 'true', '0:0:0:0:0:0:0:1');
INSERT INTO `tm_system_log` VALUES ('1562', '1', 'admin', 'P-QES-IMPORT', '/system/question/import.thtml', '2017-07-21 17:25:15', 'true', '0:0:0:0:0:0:0:1');
INSERT INTO `tm_system_log` VALUES ('1563', '1', 'admin', 'F-USERS', '/system/user/list.thtml', '2017-07-21 17:27:20', 'true', '0:0:0:0:0:0:0:1');
INSERT INTO `tm_system_log` VALUES ('1564', '1', 'admin', 'P-USER-UPDATE', '/system/user/load.thtml?id=ecb1b788-83f7-4f65-9d29-1453142c6b1d', '2017-07-21 17:28:29', 'true', '0:0:0:0:0:0:0:1');
INSERT INTO `tm_system_log` VALUES ('1565', '1', 'admin', 'P-USER-UPDATE', '/system/user/update.do', '2017-07-21 17:28:37', 'true', '0:0:0:0:0:0:0:1');
INSERT INTO `tm_system_log` VALUES ('1566', '1', 'admin', 'P-USER-UPDATE', '/system/user/load.thtml?id=ecb1b788-83f7-4f65-9d29-1453142c6b1d', '2017-07-21 17:28:47', 'true', '0:0:0:0:0:0:0:1');
INSERT INTO `tm_system_log` VALUES ('1567', '1', 'admin', 'doLogout', '/common/logout.do', '2017-07-21 17:28:53', '登出成功(logout_success)', '0:0:0:0:0:0:0:1');
INSERT INTO `tm_system_log` VALUES ('1568', '0', 'king', 'doLogin', '/common/login.do', '2017-07-21 17:29:01', '登录成功(login_success)', '0:0:0:0:0:0:0:1');
INSERT INTO `tm_system_log` VALUES ('1569', '1', 'admin', 'doLogin', '/common/login.do', '2017-07-22 15:46:15', '登录成功(login_success)', '0:0:0:0:0:0:0:1');
INSERT INTO `tm_system_log` VALUES ('1570', '1', 'admin', 'P-QDB-ADD', '/system/qdb/add.thtml', '2017-07-22 15:48:09', 'true', '0:0:0:0:0:0:0:1');

-- ----------------------------
-- Table structure for tm_user
-- ----------------------------
DROP TABLE IF EXISTS `tm_user`;
CREATE TABLE `tm_user` (
  `u_id` varchar(50) NOT NULL,
  `u_username` varchar(50) DEFAULT NULL,
  `u_userpass` varchar(50) DEFAULT NULL,
  `u_photo` varchar(100) DEFAULT NULL,
  `u_branchid` varchar(50) DEFAULT NULL,
  `u_realname` varchar(50) DEFAULT NULL,
  `u_score` int(10) DEFAULT NULL,
  `u_no` varchar(50) DEFAULT NULL,
  `u_phone` varchar(50) DEFAULT NULL,
  `u_email` varchar(50) DEFAULT NULL,
  `u_status` int(2) DEFAULT NULL COMMENT '1正常，0待审核，-9已删除',
  `u_address` varchar(200) DEFAULT NULL,
  `u_remark` varchar(500) DEFAULT NULL,
  `u_salt` varchar(10) DEFAULT NULL,
  `u_regdate` datetime DEFAULT NULL,
  PRIMARY KEY (`u_id`),
  KEY `FK_ref_user_branch` (`u_branchid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_user
-- ----------------------------
INSERT INTO `tm_user` VALUES ('3293456d-6705-4672-8816-8741fd40fb5a', 'zhangyusheng', 'C6500C45FEF04C8AB78DFC3051DC34CB', '', '827ea7bb-138d-425e-9fdf-13e97172b039', '康耐特', '0', '2011007', '1390000007', '', '1', '', '', 'l0812u34wr', '2016-07-14 21:47:09');
INSERT INTO `tm_user` VALUES ('4788c491-c279-4497-ba44-42b2443d7760', 'master', '2AF1780FB07A85BB487C24279921E8EE', '', '827ea7bb-138d-425e-9fdf-13e97172b039', '圣埃蒂安', '0', '2011005', '1390000005', '', '1', '', '', 'e7d5vjmq1m', '2016-07-14 21:47:09');
INSERT INTO `tm_user` VALUES ('4e9a25c4-4c1e-4543-9330-211fa7ae89ea', 'ring', 'C8E3E359E902641F00832E2949E1C72C', '', '827ea7bb-138d-425e-9fdf-13e97172b039', '陈伟强', '0', '2011009', '1390000009', '', '1', '', '', 'volto216nz', '2016-07-14 21:47:09');
INSERT INTO `tm_user` VALUES ('572400f0-7957-4612-a2b3-7767f0106f23', 'snoopy', 'BCE4B4C8997EAA3156A6BFA1F355F251', '', '827ea7bb-138d-425e-9fdf-13e97172b039', '狗狗', '0', '2011010', '1390000010', '', '1', '', '', '9dmso109ak', '2016-07-14 21:47:09');
INSERT INTO `tm_user` VALUES ('76800b8f-4827-4732-94f4-729315cbfc18', 'zhangsan', '028661B5714A050B6568C8618709CBF8', '', '827ea7bb-138d-425e-9fdf-13e97172b039', '张三', '0', '2011001', '1390000001', 'zhangsan@tom.com', '1', '', '', 'ut43t2rvh9', '2016-07-14 21:47:09');
INSERT INTO `tm_user` VALUES ('7c62905f-964b-4a88-b3b8-ad0cdec1de2e', 'wanger', 'BFC5A6BC1F526CF7E9724B95F8650050', '', '827ea7bb-138d-425e-9fdf-13e97172b039', '王二', '0', '2011003', '1390000003', '', '1', '', '', '1xl8lah0eh', '2016-07-14 21:47:09');
INSERT INTO `tm_user` VALUES ('b65152d6-2ea5-4a77-b265-4287ff199c67', 'liudehua', 'B1A64FEE43744D40033757A0E3397207', '', '827ea7bb-138d-425e-9fdf-13e97172b039', '王玉婷', '0', '2011006', '1390000006', '', '1', '', '', '02oqx4z3h3', '2016-07-14 21:47:09');
INSERT INTO `tm_user` VALUES ('bab5c0f8-a759-4705-a945-d6a1fb8f18f1', 'zhangxueyou', 'F5B8E7959090DC7BC9233AA61B1C5125', '', '827ea7bb-138d-425e-9fdf-13e97172b039', '成亲王', '0', '2011008', '1390000008', '', '1', '', '', 'p8pxsosrxh', '2016-07-14 21:47:09');
INSERT INTO `tm_user` VALUES ('d74a23f7-de6d-4648-857e-3f150d3940a5', 'lisi', 'FC478E165055EDE29409C4EED224928D', '', '827ea7bb-138d-425e-9fdf-13e97172b039', '李四', '0', '2011002', '1390000002', '', '1', '', '', 'uiqhzpmh8l', '2016-07-14 21:47:09');
INSERT INTO `tm_user` VALUES ('ecb1b788-83f7-4f65-9d29-1453142c6b1d', 'king', '63D96AC745E14A3A8B49E2A4073D3382', '', '827ea7bb-138d-425e-9fdf-13e97172b039', '李长征', '0', '2011004', '1390000004', 'licz@sina.com.cn', '1', '', '', 'yzmrqrzyf8', '2016-07-14 21:47:09');

-- ----------------------------
-- Table structure for tm_usertest
-- ----------------------------
DROP TABLE IF EXISTS `tm_usertest`;
CREATE TABLE `tm_usertest` (
  `t_tid` varchar(50) NOT NULL,
  `t_name` varchar(50) DEFAULT NULL,
  `t_duration` int(11) DEFAULT NULL,
  `t_uid` varchar(50) DEFAULT NULL,
  `t_totalscore` int(4) DEFAULT NULL,
  `t_userscore` int(4) DEFAULT NULL,
  `t_paper` longtext,
  `t_answer` longtext,
  `t_check` longtext,
  `t_testdate` datetime DEFAULT NULL,
  `t_timecost` int(11) DEFAULT NULL,
  PRIMARY KEY (`t_tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_usertest
-- ----------------------------
INSERT INTO `tm_usertest` VALUES ('5076e391-414f-403b-9e05-89d1c6a5c816', '222', '2', '4788c491-c279-4497-ba44-42b2443d7760', '10', '4', '<com.tom.model.paper.Paper>\n  <id>0</id>\n  <name>222</name>\n  <status>1</status>\n  <duration>2</duration>\n  <totalscore>10</totalscore>\n  <passscore>0</passscore>\n  <ordertype>0</ordertype>\n  <papertype>2</papertype>\n  <remark></remark>\n  <sections>\n    <com.tom.model.paper.PaperSection>\n      <name>单选</name>\n      <remark></remark>\n      <id>0</id>\n      <questions>\n        <com.tom.model.paper.QuestionSingleChoice>\n          <id>68c584f9-d1a7-43cc-b325-d619c7385ec8</id>\n          <type>1</type>\n          <content>防抱死制动系统（ABS）在什么情况下可以最大限度发挥制动器效能?</content>\n          <key>C</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>间歇制动</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>持续制动</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>紧急制动</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>缓踏制动踏板</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionSingleChoice>\n        <com.tom.model.paper.QuestionSingleChoice>\n          <id>515c7c31-db05-4ee8-b802-7dca0bd08c8d</id>\n          <type>1</type>\n          <content>上道路行驶的机动车有哪种情形交通警察可依法扣留车辆？</content>\n          <key>A</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>未放置检验合格标志</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>未携带身份证</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>未放置城市环保标志</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>未携带机动车登记证书</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionSingleChoice>\n        <com.tom.model.paper.QuestionSingleChoice>\n          <id>f27ca2e4-c511-45df-afc7-6534c909190e</id>\n          <type>1</type>\n          <content>驾驶机动车在道路上向左变更车道时如何使用灯光？</content>\n          <key>C</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>提前开启右转向灯</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>不用开启转向灯</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>提前开启左转向灯</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>提前开启近光灯</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionSingleChoice>\n        <com.tom.model.paper.QuestionSingleChoice>\n          <id>3bab31fa-9676-49b7-b642-1b3098fc2819</id>\n          <type>1</type>\n          <content>湿滑路面制动过程中，发现车辆偏离方向，以下做法正确的是？</content>\n          <key>D</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>任意踩制动踏板</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>连续轻踩轻放制动踏板</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>用力踩制动踏板</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>不要踩制动踏板</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionSingleChoice>\n        <com.tom.model.paper.QuestionSingleChoice>\n          <id>1e65e7a9-2005-4cdf-9419-d14d4327ab8a</id>\n          <type>1</type>\n          <content>车辆在较窄的山路上行驶时，如果靠山体的一方不让行，应怎样做？</content>\n          <key>C</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>鸣喇叭催其让行</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>保持正常车速行驶</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>提前减速或停车避让</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>向左占道，谨慎驶过</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionSingleChoice>\n      </questions>\n      <rnum>0</rnum>\n      <rtype>0</rtype>\n      <rlevel>0</rlevel>\n      <rscore>0</rscore>\n    </com.tom.model.paper.PaperSection>\n    <com.tom.model.paper.PaperSection>\n      <name>多选</name>\n      <remark></remark>\n      <id>1</id>\n      <questions>\n        <com.tom.model.paper.QuestionMultipleChoice>\n          <id>aa55ff1e-e183-41aa-a830-b855d77382e2</id>\n          <type>2</type>\n          <content>驾驶非机动车，必须遵守哪些规定？</content>\n          <key>ABCD</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>醉酒的人不准驾驶</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>丧失正常驾驶能力的残疾人不准驾驶（残疾人专用车除外）</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>未满十六岁的人，不准在道路上赶畜力车</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>未满十二岁的儿童，不准在道路上骑自行车、三轮车和推、拉人力车</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionMultipleChoice>\n        <com.tom.model.paper.QuestionMultipleChoice>\n          <id>ffd4e580-c453-4912-9767-38df2537f6ee</id>\n          <type>2</type>\n          <content>警车、消防车、救护车、工程救险车执行紧急任务时，可以使用警报器、标志灯具；在确保安全的前提下，不受（）的限制，其他车辆和行人应当让行。</content>\n          <key>ABCD</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>行驶路线</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>行驶方向</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>行驶速度</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>信号灯</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionMultipleChoice>\n        <com.tom.model.paper.QuestionMultipleChoice>\n          <id>00be0845-acaa-4d32-a002-0f5f843b3575</id>\n          <type>2</type>\n          <content>行人不得有下列哪些行为：</content>\n          <key>ABC</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>跨越、倚坐道路隔离设施</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>扒车、强行拦车</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>实施妨碍道路交通安全的其他行为</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>在人行道左侧行走</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionMultipleChoice>\n        <com.tom.model.paper.QuestionMultipleChoice>\n          <id>f5d68879-a9dd-438b-9389-cc1ec6c7fd6a</id>\n          <type>2</type>\n          <content>乘坐机动车应当遵守下列规定：</content>\n          <key>BCD</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>乘坐两轮摩托车可以侧向骑坐</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>不得在机动车道上拦乘机动车</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>在机动车道上不得从机动车左侧上下车</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>开关车门不得妨碍其他车辆和行人通行</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionMultipleChoice>\n        <com.tom.model.paper.QuestionMultipleChoice>\n          <id>b26bccad-f138-4f67-bc32-85b4dc755579</id>\n          <type>2</type>\n          <content>在道路上驾驶自行车、电动自行车应当遵守下列规定：</content>\n          <key>ACD</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>不得牵引、攀扶车辆或者被其他车辆牵引</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>不得双手离把但可以手中持物</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>不得扶身并行、互相追逐或者曲折竞驶</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>不得在道路上骑独轮自行车或者2人以上骑行的自行车</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionMultipleChoice>\n      </questions>\n      <rnum>0</rnum>\n      <rtype>0</rtype>\n      <rlevel>0</rlevel>\n      <rscore>0</rscore>\n    </com.tom.model.paper.PaperSection>\n  </sections>\n</com.tom.model.paper.Paper>', '{\"Q-f27ca2e4-c511-45df-afc7-6534c909190e\":\"C\",\"Q-aa55ff1e-e183-41aa-a830-b855d77382e2\":\"A,B,C,D\",\"Q-515c7c31-db05-4ee8-b802-7dca0bd08c8d\":\"D\",\"Q-68c584f9-d1a7-43cc-b325-d619c7385ec8\":\"C\",\"Q-3bab31fa-9676-49b7-b642-1b3098fc2819\":\"D\",\"Q-ffd4e580-c453-4912-9767-38df2537f6ee\":\"A,B,C\"}', '{\"Q-68c584f9-d1a7-43cc-b325-d619c7385ec8\":1,\"Q-515c7c31-db05-4ee8-b802-7dca0bd08c8d\":0,\"Q-f27ca2e4-c511-45df-afc7-6534c909190e\":1,\"Q-3bab31fa-9676-49b7-b642-1b3098fc2819\":1,\"Q-1e65e7a9-2005-4cdf-9419-d14d4327ab8a\":0,\"Q-aa55ff1e-e183-41aa-a830-b855d77382e2\":1,\"Q-ffd4e580-c453-4912-9767-38df2537f6ee\":0,\"Q-00be0845-acaa-4d32-a002-0f5f843b3575\":0,\"Q-f5d68879-a9dd-438b-9389-cc1ec6c7fd6a\":0,\"Q-b26bccad-f138-4f67-bc32-85b4dc755579\":0}', '2016-08-20 00:17:16', '2');
INSERT INTO `tm_usertest` VALUES ('a258f3e4-e49e-45e0-9f4e-dd2fa9e13201', '111111111111111111111111111111', '1', '4788c491-c279-4497-ba44-42b2443d7760', '10', '1', '<com.tom.model.paper.Paper>\n  <id>0</id>\n  <name>111111111111111111111111111111</name>\n  <status>1</status>\n  <duration>1</duration>\n  <totalscore>10</totalscore>\n  <passscore>0</passscore>\n  <ordertype>0</ordertype>\n  <papertype>2</papertype>\n  <remark></remark>\n  <sections>\n    <com.tom.model.paper.PaperSection>\n      <name>1111</name>\n      <remark></remark>\n      <id>0</id>\n      <questions>\n        <com.tom.model.paper.QuestionSingleChoice>\n          <id>422d18ce-2092-4f6c-a8e9-b0971421e65b</id>\n          <type>1</type>\n          <content>醉酒驾驶机动车在道路上行驶会受到什么处罚？</content>\n          <key>C</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>处管制，并处罚金</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>处2年以上徒刑</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>处拘役，并处罚金</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>处2年以下徒刑</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionSingleChoice>\n        <com.tom.model.paper.QuestionSingleChoice>\n          <id>d0aaf4be-f05a-498d-a83b-35dfe41bfa49</id>\n          <type>1</type>\n          <content>饮酒后或者醉酒驾驶机动车发生重大交通事故构成犯罪的，依法追究刑事责任，吊销机动车驾驶证，将多少年内不得申请机动车驾驶证？</content>\n          <key>D</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>五年</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>十年</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>二十年</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>终生</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionSingleChoice>\n        <com.tom.model.paper.QuestionSingleChoice>\n          <id>515c7c31-db05-4ee8-b802-7dca0bd08c8d</id>\n          <type>1</type>\n          <content>上道路行驶的机动车有哪种情形交通警察可依法扣留车辆？</content>\n          <key>A</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>未放置检验合格标志</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>未携带身份证</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>未放置城市环保标志</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>未携带机动车登记证书</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionSingleChoice>\n        <com.tom.model.paper.QuestionSingleChoice>\n          <id>246297ee-d1a5-41d0-adaa-b14d517d97a9</id>\n          <type>1</type>\n          <content>遇到前方车辆停车排队或者缓慢行驶时，强行穿插，以下说法正确的是什么？</content>\n          <key>D</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>允许,因为可以省油</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>允许,因为可以快速地通过拥堵区</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>禁止,因为这样不利于省油</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>禁止,因为这样扰乱车流,加重拥堵</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionSingleChoice>\n        <com.tom.model.paper.QuestionSingleChoice>\n          <id>68c584f9-d1a7-43cc-b325-d619c7385ec8</id>\n          <type>1</type>\n          <content>防抱死制动系统（ABS）在什么情况下可以最大限度发挥制动器效能?</content>\n          <key>C</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>间歇制动</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>持续制动</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>紧急制动</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>缓踏制动踏板</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionSingleChoice>\n        <com.tom.model.paper.QuestionSingleChoice>\n          <id>3bab31fa-9676-49b7-b642-1b3098fc2819</id>\n          <type>1</type>\n          <content>湿滑路面制动过程中，发现车辆偏离方向，以下做法正确的是？</content>\n          <key>D</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>任意踩制动踏板</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>连续轻踩轻放制动踏板</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>用力踩制动踏板</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>不要踩制动踏板</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionSingleChoice>\n        <com.tom.model.paper.QuestionSingleChoice>\n          <id>f27ca2e4-c511-45df-afc7-6534c909190e</id>\n          <type>1</type>\n          <content>驾驶机动车在道路上向左变更车道时如何使用灯光？</content>\n          <key>C</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>提前开启右转向灯</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>不用开启转向灯</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>提前开启左转向灯</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>提前开启近光灯</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionSingleChoice>\n        <com.tom.model.paper.QuestionSingleChoice>\n          <id>1e65e7a9-2005-4cdf-9419-d14d4327ab8a</id>\n          <type>1</type>\n          <content>车辆在较窄的山路上行驶时，如果靠山体的一方不让行，应怎样做？</content>\n          <key>C</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>鸣喇叭催其让行</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>保持正常车速行驶</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>提前减速或停车避让</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>向左占道，谨慎驶过</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionSingleChoice>\n        <com.tom.model.paper.QuestionSingleChoice>\n          <id>2d58eee2-33e0-4334-8259-9a16c23f6832</id>\n          <type>1</type>\n          <content>驾驶的车辆正在被其他车辆超越时，若此时后方有跟随行驶的车辆，应怎样做？</content>\n          <key>B</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>继续加速行驶</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>稍向右侧行驶，保证横向安全距离</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>靠道路中心行驶</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>加速向右侧让路</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionSingleChoice>\n        <com.tom.model.paper.QuestionSingleChoice>\n          <id>fba4649a-f6a4-4f53-921c-089b881dfd32</id>\n          <type>1</type>\n          <content>下面哪种做法能帮助您避免被其他车辆从后方追撞？</content>\n          <key>C</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>在任何时候都打开转向灯</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>一直打开双闪</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>在转弯前提前打开相应的转向灯</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>转弯前鸣笛示意</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionSingleChoice>\n      </questions>\n      <rnum>0</rnum>\n      <rtype>0</rtype>\n      <rlevel>0</rlevel>\n      <rscore>0</rscore>\n    </com.tom.model.paper.PaperSection>\n  </sections>\n</com.tom.model.paper.Paper>', '{\"Q-422d18ce-2092-4f6c-a8e9-b0971421e65b\":\"D\",\"Q-d0aaf4be-f05a-498d-a83b-35dfe41bfa49\":\"D\"}', '{\"Q-422d18ce-2092-4f6c-a8e9-b0971421e65b\":0,\"Q-d0aaf4be-f05a-498d-a83b-35dfe41bfa49\":1,\"Q-515c7c31-db05-4ee8-b802-7dca0bd08c8d\":0,\"Q-246297ee-d1a5-41d0-adaa-b14d517d97a9\":0,\"Q-68c584f9-d1a7-43cc-b325-d619c7385ec8\":0,\"Q-3bab31fa-9676-49b7-b642-1b3098fc2819\":0,\"Q-f27ca2e4-c511-45df-afc7-6534c909190e\":0,\"Q-1e65e7a9-2005-4cdf-9419-d14d4327ab8a\":0,\"Q-2d58eee2-33e0-4334-8259-9a16c23f6832\":0,\"Q-fba4649a-f6a4-4f53-921c-089b881dfd32\":0}', '2016-08-20 00:23:45', '1');
INSERT INTO `tm_usertest` VALUES ('bf181426-5fbf-4078-aee2-48bce730bf26', '随机', '3', '4788c491-c279-4497-ba44-42b2443d7760', '10', '8', '<com.tom.model.paper.Paper>\n  <id>0</id>\n  <name>随机</name>\n  <status>1</status>\n  <duration>3</duration>\n  <totalscore>10</totalscore>\n  <passscore>0</passscore>\n  <ordertype>0</ordertype>\n  <papertype>2</papertype>\n  <remark></remark>\n  <sections>\n    <com.tom.model.paper.PaperSection>\n      <name>1111</name>\n      <remark>111</remark>\n      <id>0</id>\n      <questions>\n        <com.tom.model.paper.QuestionSingleChoice>\n          <id>515c7c31-db05-4ee8-b802-7dca0bd08c8d</id>\n          <type>1</type>\n          <content>上道路行驶的机动车有哪种情形交通警察可依法扣留车辆？</content>\n          <key>A</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>未放置检验合格标志</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>未携带身份证</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>未放置城市环保标志</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>未携带机动车登记证书</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionSingleChoice>\n        <com.tom.model.paper.QuestionSingleChoice>\n          <id>1e65e7a9-2005-4cdf-9419-d14d4327ab8a</id>\n          <type>1</type>\n          <content>车辆在较窄的山路上行驶时，如果靠山体的一方不让行，应怎样做？</content>\n          <key>C</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>鸣喇叭催其让行</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>保持正常车速行驶</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>提前减速或停车避让</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>向左占道，谨慎驶过</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionSingleChoice>\n        <com.tom.model.paper.QuestionSingleChoice>\n          <id>3bab31fa-9676-49b7-b642-1b3098fc2819</id>\n          <type>1</type>\n          <content>湿滑路面制动过程中，发现车辆偏离方向，以下做法正确的是？</content>\n          <key>D</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>任意踩制动踏板</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>连续轻踩轻放制动踏板</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>用力踩制动踏板</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>不要踩制动踏板</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionSingleChoice>\n        <com.tom.model.paper.QuestionSingleChoice>\n          <id>d0aaf4be-f05a-498d-a83b-35dfe41bfa49</id>\n          <type>1</type>\n          <content>饮酒后或者醉酒驾驶机动车发生重大交通事故构成犯罪的，依法追究刑事责任，吊销机动车驾驶证，将多少年内不得申请机动车驾驶证？</content>\n          <key>D</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>五年</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>十年</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>二十年</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>终生</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionSingleChoice>\n        <com.tom.model.paper.QuestionSingleChoice>\n          <id>68c584f9-d1a7-43cc-b325-d619c7385ec8</id>\n          <type>1</type>\n          <content>防抱死制动系统（ABS）在什么情况下可以最大限度发挥制动器效能?</content>\n          <key>C</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>间歇制动</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>持续制动</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>紧急制动</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>缓踏制动踏板</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionSingleChoice>\n        <com.tom.model.paper.QuestionSingleChoice>\n          <id>2d58eee2-33e0-4334-8259-9a16c23f6832</id>\n          <type>1</type>\n          <content>驾驶的车辆正在被其他车辆超越时，若此时后方有跟随行驶的车辆，应怎样做？</content>\n          <key>B</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>继续加速行驶</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>稍向右侧行驶，保证横向安全距离</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>靠道路中心行驶</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>加速向右侧让路</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionSingleChoice>\n        <com.tom.model.paper.QuestionSingleChoice>\n          <id>fba4649a-f6a4-4f53-921c-089b881dfd32</id>\n          <type>1</type>\n          <content>下面哪种做法能帮助您避免被其他车辆从后方追撞？</content>\n          <key>C</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>在任何时候都打开转向灯</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>一直打开双闪</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>在转弯前提前打开相应的转向灯</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>转弯前鸣笛示意</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionSingleChoice>\n        <com.tom.model.paper.QuestionSingleChoice>\n          <id>422d18ce-2092-4f6c-a8e9-b0971421e65b</id>\n          <type>1</type>\n          <content>醉酒驾驶机动车在道路上行驶会受到什么处罚？</content>\n          <key>C</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>处管制，并处罚金</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>处2年以上徒刑</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>处拘役，并处罚金</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>处2年以下徒刑</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionSingleChoice>\n        <com.tom.model.paper.QuestionSingleChoice>\n          <id>f27ca2e4-c511-45df-afc7-6534c909190e</id>\n          <type>1</type>\n          <content>驾驶机动车在道路上向左变更车道时如何使用灯光？</content>\n          <key>C</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>提前开启右转向灯</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>不用开启转向灯</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>提前开启左转向灯</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>提前开启近光灯</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionSingleChoice>\n        <com.tom.model.paper.QuestionSingleChoice>\n          <id>246297ee-d1a5-41d0-adaa-b14d517d97a9</id>\n          <type>1</type>\n          <content>遇到前方车辆停车排队或者缓慢行驶时，强行穿插，以下说法正确的是什么？</content>\n          <key>D</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>允许,因为可以省油</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>允许,因为可以快速地通过拥堵区</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>禁止,因为这样不利于省油</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>禁止,因为这样扰乱车流,加重拥堵</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionSingleChoice>\n      </questions>\n      <rnum>0</rnum>\n      <rtype>0</rtype>\n      <rlevel>0</rlevel>\n      <rscore>0</rscore>\n    </com.tom.model.paper.PaperSection>\n  </sections>\n</com.tom.model.paper.Paper>', '{\"Q-422d18ce-2092-4f6c-a8e9-b0971421e65b\":\"C\",\"Q-2d58eee2-33e0-4334-8259-9a16c23f6832\":\"B\",\"Q-f27ca2e4-c511-45df-afc7-6534c909190e\":\"C\",\"Q-d0aaf4be-f05a-498d-a83b-35dfe41bfa49\":\"D\",\"Q-246297ee-d1a5-41d0-adaa-b14d517d97a9\":\"D\",\"Q-515c7c31-db05-4ee8-b802-7dca0bd08c8d\":\"A\",\"Q-68c584f9-d1a7-43cc-b325-d619c7385ec8\":\"C\",\"Q-1e65e7a9-2005-4cdf-9419-d14d4327ab8a\":\"D\",\"Q-3bab31fa-9676-49b7-b642-1b3098fc2819\":\"B\",\"Q-fba4649a-f6a4-4f53-921c-089b881dfd32\":\"C\"}', '{\"Q-515c7c31-db05-4ee8-b802-7dca0bd08c8d\":1,\"Q-1e65e7a9-2005-4cdf-9419-d14d4327ab8a\":0,\"Q-3bab31fa-9676-49b7-b642-1b3098fc2819\":0,\"Q-d0aaf4be-f05a-498d-a83b-35dfe41bfa49\":1,\"Q-68c584f9-d1a7-43cc-b325-d619c7385ec8\":1,\"Q-2d58eee2-33e0-4334-8259-9a16c23f6832\":1,\"Q-fba4649a-f6a4-4f53-921c-089b881dfd32\":1,\"Q-422d18ce-2092-4f6c-a8e9-b0971421e65b\":1,\"Q-f27ca2e4-c511-45df-afc7-6534c909190e\":1,\"Q-246297ee-d1a5-41d0-adaa-b14d517d97a9\":1}', '2016-08-20 00:12:53', '3');

-- ----------------------------
-- Table structure for tm_user_addition
-- ----------------------------
DROP TABLE IF EXISTS `tm_user_addition`;
CREATE TABLE `tm_user_addition` (
  `u_id` varchar(50) DEFAULT NULL,
  `u_logintimes` int(11) DEFAULT '0',
  `u_lastlogin` datetime DEFAULT NULL,
  `u_positionid` varchar(50) DEFAULT NULL,
  KEY `FK_ref_user_addtion` (`u_id`),
  CONSTRAINT `tm_user_addition_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `tm_user` (`u_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_user_addition
-- ----------------------------
INSERT INTO `tm_user_addition` VALUES ('76800b8f-4827-4732-94f4-729315cbfc18', '6', '2017-05-27 11:22:58', '3da6a11e-c646-477a-bc4c-62c9856dcca0');
INSERT INTO `tm_user_addition` VALUES ('d74a23f7-de6d-4648-857e-3f150d3940a5', '0', null, '3da6a11e-c646-477a-bc4c-62c9856dcca0');
INSERT INTO `tm_user_addition` VALUES ('7c62905f-964b-4a88-b3b8-ad0cdec1de2e', '0', null, '3da6a11e-c646-477a-bc4c-62c9856dcca0');
INSERT INTO `tm_user_addition` VALUES ('ecb1b788-83f7-4f65-9d29-1453142c6b1d', '1', '2017-07-21 17:29:01', '3da6a11e-c646-477a-bc4c-62c9856dcca0');
INSERT INTO `tm_user_addition` VALUES ('4788c491-c279-4497-ba44-42b2443d7760', '14', '2016-08-20 21:53:40', '3da6a11e-c646-477a-bc4c-62c9856dcca0');
INSERT INTO `tm_user_addition` VALUES ('b65152d6-2ea5-4a77-b265-4287ff199c67', '0', null, '3da6a11e-c646-477a-bc4c-62c9856dcca0');
INSERT INTO `tm_user_addition` VALUES ('3293456d-6705-4672-8816-8741fd40fb5a', '0', null, '3da6a11e-c646-477a-bc4c-62c9856dcca0');
INSERT INTO `tm_user_addition` VALUES ('bab5c0f8-a759-4705-a945-d6a1fb8f18f1', '0', null, '3da6a11e-c646-477a-bc4c-62c9856dcca0');
INSERT INTO `tm_user_addition` VALUES ('4e9a25c4-4c1e-4543-9330-211fa7ae89ea', '0', null, '3da6a11e-c646-477a-bc4c-62c9856dcca0');
INSERT INTO `tm_user_addition` VALUES ('572400f0-7957-4612-a2b3-7767f0106f23', '0', null, '3da6a11e-c646-477a-bc4c-62c9856dcca0');

-- ----------------------------
-- Table structure for tm_user_collection
-- ----------------------------
DROP TABLE IF EXISTS `tm_user_collection`;
CREATE TABLE `tm_user_collection` (
  `c_id` varchar(50) NOT NULL,
  `c_tid` varchar(50) DEFAULT NULL,
  `c_uid` varchar(50) DEFAULT NULL,
  `c_qid` varchar(50) DEFAULT NULL,
  `c_creatdate` datetime DEFAULT NULL,
  `c_userkey` text,
  `c_remark` text,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_user_collection
-- ----------------------------
INSERT INTO `tm_user_collection` VALUES ('18b907d4-e5c4-4a6e-8fef-9257c977244c', '', '76800b8f-4827-4732-94f4-729315cbfc18', '1e65e7a9-2005-4cdf-9419-d14d4327ab8a', '2017-05-27 11:23:13', 'B', '');
INSERT INTO `tm_user_collection` VALUES ('2f1a665d-09c3-4fc4-8b54-bec27b2e514b', '', '76800b8f-4827-4732-94f4-729315cbfc18', 'f27ca2e4-c511-45df-afc7-6534c909190e', '2017-05-27 11:23:06', 'B', '');
INSERT INTO `tm_user_collection` VALUES ('88a6fb5c-6fd2-4647-a5e5-3f9c8bddf226', '', '76800b8f-4827-4732-94f4-729315cbfc18', '5cf1d830-023c-4a7d-a3b9-974fe87b14dc', '2017-05-27 11:23:58', '', '');

-- ----------------------------
-- Table structure for tm_user_collection_type
-- ----------------------------
DROP TABLE IF EXISTS `tm_user_collection_type`;
CREATE TABLE `tm_user_collection_type` (
  `t_id` varchar(50) NOT NULL,
  `t_name` varchar(50) DEFAULT NULL,
  `t_uid` varchar(50) DEFAULT NULL,
  `t_createdate` datetime DEFAULT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_user_collection_type
-- ----------------------------
INSERT INTO `tm_user_collection_type` VALUES ('fd687290-fc13-43a1-8613-4d4408b73b6b', '0000', '4788c491-c279-4497-ba44-42b2443d7760', '2016-08-18 23:23:01');

-- ----------------------------
-- Table structure for tm_user_position
-- ----------------------------
DROP TABLE IF EXISTS `tm_user_position`;
CREATE TABLE `tm_user_position` (
  `p_id` varchar(50) NOT NULL,
  `p_name` varchar(50) DEFAULT NULL,
  `p_remark` varchar(50) DEFAULT NULL,
  `p_status` int(2) DEFAULT NULL,
  `p_poster` varchar(50) DEFAULT NULL,
  `p_createdate` datetime DEFAULT NULL,
  `p_modifor` varchar(50) DEFAULT NULL,
  `p_modifydate` datetime DEFAULT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_user_position
-- ----------------------------
INSERT INTO `tm_user_position` VALUES ('3da6a11e-c646-477a-bc4c-62c9856dcca0', '测试职务', '测试职务', '1', 'admin', '2016-07-14 21:46:45', 'admin', '2016-07-14 21:46:45');

-- ----------------------------
-- Table structure for tm_vote
-- ----------------------------
DROP TABLE IF EXISTS `tm_vote`;
CREATE TABLE `tm_vote` (
  `v_id` varchar(50) NOT NULL,
  `v_title` varchar(200) DEFAULT NULL,
  `v_body` text,
  `v_starttime` datetime DEFAULT NULL,
  `v_endtime` datetime DEFAULT NULL,
  `v_status` int(2) DEFAULT NULL,
  `v_data` text,
  `v_poster` varchar(50) DEFAULT NULL,
  `v_createdate` datetime DEFAULT NULL,
  `v_modifyor` varchar(50) DEFAULT NULL,
  `v_modifydate` datetime DEFAULT NULL,
  PRIMARY KEY (`v_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_vote
-- ----------------------------

-- ----------------------------
-- Table structure for tm_vote_log
-- ----------------------------
DROP TABLE IF EXISTS `tm_vote_log`;
CREATE TABLE `tm_vote_log` (
  `l_id` int(11) NOT NULL AUTO_INCREMENT,
  `l_uid` varchar(50) DEFAULT NULL,
  `l_vid` varchar(50) DEFAULT NULL,
  `l_vdata` varchar(500) DEFAULT NULL,
  `l_votedate` datetime DEFAULT NULL,
  PRIMARY KEY (`l_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_vote_log
-- ----------------------------

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
