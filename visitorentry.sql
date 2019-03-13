/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : gate_pass

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-01-29 05:37:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for visitorentry
-- ----------------------------
DROP TABLE IF EXISTS `visitorentry`;
CREATE TABLE `visitorentry` (
  `V_ID` int(11) NOT NULL,
  `VISIT_DEPARTMENT` varchar(50) NOT NULL,
  `VISIT_DATE` datetime NOT NULL,
  `VISIT_TIME` time DEFAULT NULL,
  `Pass_No` int(11) NOT NULL,
  `user` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Pass_No`),
  KEY `fk_visitor_id` (`V_ID`),
  CONSTRAINT `fk_visitor_id` FOREIGN KEY (`V_ID`) REFERENCES `visitor` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET FOREIGN_KEY_CHECKS=1;
