/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 8.0.13 : Database - ssm_crud
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ssm_crud` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ssm_crud`;

/*Table structure for table `dictory` */

DROP TABLE IF EXISTS `dictory`;

CREATE TABLE `dictory` (
  `tableName` varchar(100) NOT NULL,
  `filedName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `filedExpression` varchar(100) NOT NULL,
  PRIMARY KEY (`tableName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dictory` */

insert  into `dictory`(`tableName`,`filedName`,`filedExpression`) values ('tbl_login','type','1:admin;0:gust');

/*Table structure for table `tbl_course` */

DROP TABLE IF EXISTS `tbl_course`;

CREATE TABLE `tbl_course` (
  `Cno` varchar(100) NOT NULL,
  `Cname` varchar(100) DEFAULT NULL,
  `Ctime` varchar(100) DEFAULT NULL,
  `testTime` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Cno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_course` */

insert  into `tbl_course`(`Cno`,`Cname`,`Ctime`,`testTime`) values ('1','计算机网络','2018-9-1~2018-12-21','2019-1-12 8:00~12:00'),('2','jsp','2018-9-1~2018-12-21','2019-1-15 8:00~12:00'),('3','软件质量测','2018-9-1~2018-12-21','2019-1-15 12:00~16:00'),('4','软件项目管理','2018-9-1~2018-12-21','2019-1-15 20:00~22:00'),('5','uml建模','2018-10-12~2018-12-21','2019-1-16 20:00~22:00');

/*Table structure for table `tbl_dept` */

DROP TABLE IF EXISTS `tbl_dept`;

CREATE TABLE `tbl_dept` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_dept` */

insert  into `tbl_dept`(`dept_id`,`dept_name`) values (1,'计算机与信息工程学院'),(2,'董事会'),(3,'经管'),(4,'旅游'),(5,'法律');

/*Table structure for table `tbl_emp` */

DROP TABLE IF EXISTS `tbl_emp`;

CREATE TABLE `tbl_emp` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_name` varchar(100) DEFAULT NULL,
  `gender` varchar(2) DEFAULT NULL,
  `eamil` varchar(100) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_emp` */

insert  into `tbl_emp`(`emp_id`,`emp_name`,`gender`,`eamil`,`dept_id`) values (1,'朱旭','男','123@qq.com',1),(2,'admin','男','324495670@qq.com',2),(3,'z1','女','23134654',1),(4,'中','男','23134654',1),(5,'阿斯蒂芬','男','23134654',1),(6,'是大法官','女','23134654',3),(7,'zx','男','ffffffffff@qqaaaaaa',3);

/*Table structure for table `tbl_login` */

DROP TABLE IF EXISTS `tbl_login`;

CREATE TABLE `tbl_login` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `resetProblem` varchar(300) DEFAULT NULL,
  `resetQuestion` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_login` */

insert  into `tbl_login`(`user_id`,`user_name`,`password`,`type`,`resetProblem`,`resetQuestion`) values (1,'朱旭','202cb962ac59075b964b07152d234b70',0,'123','123'),(2,'admin','e10adc3949ba59abbe56e057f20f883e',1,'身份证号','123456'),(3,'z1','202cb962ac59075b964b07152d234b70',0,'123','123'),(4,'中','202cb962ac59075b964b07152d234b70',0,'123','123'),(5,'阿斯蒂芬','202cb962ac59075b964b07152d234b70',0,'123','123'),(6,'是大法官','202cb962ac59075b964b07152d234b70',0,'123','123');

/*Table structure for table `tbl_sc` */

DROP TABLE IF EXISTS `tbl_sc`;

CREATE TABLE `tbl_sc` (
  `Cno` varchar(100) NOT NULL,
  `Score` double DEFAULT NULL,
  `emp_id` int(11) NOT NULL,
  PRIMARY KEY (`Cno`,`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_sc` */

insert  into `tbl_sc`(`Cno`,`Score`,`emp_id`) values ('1',100,1),('1',80,2),('1',60,3),('1',33,4),('1',90,5),('1',100,6),('2',100,1),('2',80,2),('2',59,3),('2',33,4),('2',30,6),('3',100,1),('3',80,2),('3',55,3),('3',60,6),('4',100,1),('4',80,2),('4',33,4),('5',100,1),('5',0,2),('5',12,5);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
