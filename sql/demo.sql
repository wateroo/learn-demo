/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 8.0.15 : Database - zcdb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`zcdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;

USE `zcdb`;

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `user_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
  `user_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `nick_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '昵称',
  `create_date` date NOT NULL COMMENT '注册时间',
  `last_update_date` date DEFAULT NULL COMMENT '修改时间',
  `user_order` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '注册顺序',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码  md5',
  `user_status` tinyint(1) DEFAULT NULL COMMENT '用户状态',
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT '897238156@qq.com',
  PRIMARY KEY (`user_id`),
  KEY `id` (`user_order`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `t_user` */

insert  into `t_user`(`user_id`,`user_name`,`nick_name`,`create_date`,`last_update_date`,`user_order`,`password`,`user_status`,`phone`,`email`) values 
('admin','admin','管理员','2020-11-15','2020-11-15',1,'202cb962ac59075b964b07152d234b70',1,NULL,'897238156@qq.com'),
('admin1','admin','管理员','2020-11-15','2020-11-15',1,'202cb962ac59075b964b07152d234b70',1,NULL,'897238156@qq.com'),
('admin10','admin','管理员','2020-11-15','2020-11-15',10,'202cb962ac59075b964b07152d234b70',1,NULL,'897238156@qq.com'),
('admin11','admin','管理员','2020-11-15','2020-11-15',11,'202cb962ac59075b964b07152d234b70',1,NULL,'897238156@qq.com'),
('admin12','admin','管理员','2020-11-15','2020-11-15',12,'202cb962ac59075b964b07152d234b70',1,NULL,'897238156@qq.com'),
('admin2','admin','管理员','2020-11-15','2020-11-15',2,'202cb962ac59075b964b07152d234b70',1,NULL,'897238156@qq.com'),
('admin3','admin','管理员','2020-11-15','2020-11-15',3,'202cb962ac59075b964b07152d234b70',1,NULL,'897238156@qq.com'),
('admin4','admin','管理员','2020-11-15','2020-11-15',4,'202cb962ac59075b964b07152d234b70',1,NULL,'897238156@qq.com'),
('admin5','admin','管理员','2020-11-15','2020-11-15',5,'202cb962ac59075b964b07152d234b70',1,NULL,'897238156@qq.com'),
('admin6','admin','管理员','2020-11-15','2020-11-15',6,'202cb962ac59075b964b07152d234b70',1,NULL,'897238156@qq.com'),
('admin7','admin','管理员','2020-11-15','2020-11-15',7,'202cb962ac59075b964b07152d234b70',1,NULL,'897238156@qq.com'),
('admin8','admin','管理员','2020-11-15','2020-11-15',8,'202cb962ac59075b964b07152d234b70',1,NULL,'897238156@qq.com'),
('admin9','admin','管理员','2020-11-15','2020-11-15',9,'202cb962ac59075b964b07152d234b70',1,NULL,'897238156@qq.com');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
