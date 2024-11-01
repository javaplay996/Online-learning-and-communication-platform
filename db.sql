/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.7.32-log : Database - ssm2236x
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ssm2236x` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ssm2236x`;

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='配置文件';

/*Data for the table `config` */

insert  into `config`(`id`,`name`,`value`) values (1,'picture1','http://localhost:8080/ssm2236x/upload/1616398740106.jpg'),(2,'picture2','http://localhost:8080/ssm2236x/upload/picture2.jpg'),(3,'picture3','http://localhost:8080/ssm2236x/upload/picture3.jpg'),(6,'homepage',NULL);

/*Table structure for table `discusszaixianxuexi` */

DROP TABLE IF EXISTS `discusszaixianxuexi`;

CREATE TABLE `discusszaixianxuexi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint(20) NOT NULL COMMENT '关联表id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `nickname` varchar(200) DEFAULT NULL COMMENT '用户名',
  `content` longtext NOT NULL COMMENT '评论内容',
  `reply` longtext COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 COMMENT='在线学习评论表';

/*Data for the table `discusszaixianxuexi` */

insert  into `discusszaixianxuexi`(`id`,`addtime`,`refid`,`userid`,`nickname`,`content`,`reply`) values (81,'2021-03-22 15:28:01',1,1,'用户名1','评论内容1','回复内容1'),(82,'2021-03-22 15:28:01',2,2,'用户名2','评论内容2','回复内容2'),(83,'2021-03-22 15:28:01',3,3,'用户名3','评论内容3','回复内容3'),(84,'2021-03-22 15:28:01',4,4,'用户名4','评论内容4','回复内容4'),(85,'2021-03-22 15:28:01',5,5,'用户名5','评论内容5','回复内容5'),(86,'2021-03-22 15:28:01',6,6,'用户名6','评论内容6','回复内容6');

/*Table structure for table `exampaper` */

DROP TABLE IF EXISTS `exampaper`;

CREATE TABLE `exampaper` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name` varchar(200) NOT NULL COMMENT '试卷名称',
  `time` int(11) NOT NULL COMMENT '考试时长(分钟)',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '试卷状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1616398613988 DEFAULT CHARSET=utf8 COMMENT='试卷表';

/*Data for the table `exampaper` */

insert  into `exampaper`(`id`,`addtime`,`name`,`time`,`status`) values (1616398613987,'2021-03-22 15:36:53','临床医学题库1',100,1);

/*Table structure for table `examquestion` */

DROP TABLE IF EXISTS `examquestion`;

CREATE TABLE `examquestion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `paperid` bigint(20) NOT NULL COMMENT '所属试卷id（外键）',
  `papername` varchar(200) NOT NULL COMMENT '试卷名称',
  `questionname` varchar(200) NOT NULL COMMENT '试题名称',
  `options` longtext COMMENT '选项，json字符串',
  `score` bigint(20) DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COMMENT '答案解析',
  `type` bigint(20) DEFAULT '0' COMMENT '试题类型，0：单选题 1：多选题 2：判断题 3：填空题（暂不考虑多项填空）',
  `sequence` bigint(20) DEFAULT '100' COMMENT '试题排序，值越大排越前面',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1616398715297 DEFAULT CHARSET=utf8 COMMENT='试题表';

/*Data for the table `examquestion` */

insert  into `examquestion`(`id`,`addtime`,`paperid`,`papername`,`questionname`,`options`,`score`,`answer`,`analysis`,`type`,`sequence`) values (1616398715296,'2021-03-22 15:38:34',1616398613987,'临床医学题库1','生命的之源是水','[{\"text\":\"A.对\",\"code\":\"A\"},{\"text\":\"B.错\",\"code\":\"B\"}]',4,'A','对的，这是常识',2,1);

/*Table structure for table `examrecord` */

DROP TABLE IF EXISTS `examrecord`;

CREATE TABLE `examrecord` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `paperid` bigint(20) NOT NULL COMMENT '试卷id（外键）',
  `papername` varchar(200) NOT NULL COMMENT '试卷名称',
  `questionid` bigint(20) NOT NULL COMMENT '试题id（外键）',
  `questionname` varchar(200) NOT NULL COMMENT '试题名称',
  `options` longtext COMMENT '选项，json字符串',
  `score` bigint(20) DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COMMENT '答案解析',
  `myscore` bigint(20) NOT NULL DEFAULT '0' COMMENT '试题得分',
  `myanswer` varchar(200) DEFAULT NULL COMMENT '考生答案',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1616398837887 DEFAULT CHARSET=utf8 COMMENT='考试记录表';

/*Data for the table `examrecord` */

insert  into `examrecord`(`id`,`addtime`,`userid`,`username`,`paperid`,`papername`,`questionid`,`questionname`,`options`,`score`,`answer`,`analysis`,`myscore`,`myanswer`) values (1616398837886,'2021-03-22 15:40:37',1616398783054,NULL,1616398613987,'临床医学题库1',1616398715296,'生命的之源是水','[{\"text\":\"A.对\",\"code\":\"A\"},{\"text\":\"B.错\",\"code\":\"B\"}]',4,'A','对的，这是常识',4,'A');

/*Table structure for table `forum` */

DROP TABLE IF EXISTS `forum`;

CREATE TABLE `forum` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) DEFAULT NULL COMMENT '帖子标题',
  `content` longtext NOT NULL COMMENT '帖子内容',
  `parentid` bigint(20) DEFAULT NULL COMMENT '父节点id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `isdone` varchar(200) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1616398253550 DEFAULT CHARSET=utf8 COMMENT='交流吧';

/*Data for the table `forum` */

insert  into `forum`(`id`,`addtime`,`title`,`content`,`parentid`,`userid`,`username`,`isdone`) values (31,'2021-03-22 15:28:01','帖子标题1','帖子内容1',1,1,'用户名1','开放'),(32,'2021-03-22 15:28:01','帖子标题2','帖子内容2',2,2,'用户名2','开放'),(33,'2021-03-22 15:28:01','帖子标题3','帖子内容3',3,3,'用户名3','开放'),(34,'2021-03-22 15:28:01','帖子标题4','帖子内容4',4,4,'用户名4','开放'),(35,'2021-03-22 15:28:01','帖子标题5','帖子内容5',5,5,'用户名5','开放'),(36,'2021-03-22 15:28:01','帖子标题6','帖子内容6',6,6,'用户名6','开放'),(1616398238682,'2021-03-22 15:30:38','请好好学习','<p>大家好好学习，加油啊</p>',0,1616398178397,'111','开放'),(1616398253549,'2021-03-22 15:30:53',NULL,'好的，谢谢\n',1616398238682,1616398178397,'111',NULL);

/*Table structure for table `storeup` */

DROP TABLE IF EXISTS `storeup`;

CREATE TABLE `storeup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `refid` bigint(20) DEFAULT NULL COMMENT '收藏id',
  `tablename` varchar(200) DEFAULT NULL COMMENT '表名',
  `name` varchar(200) NOT NULL COMMENT '收藏名称',
  `picture` varchar(200) NOT NULL COMMENT '收藏图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1616398205160 DEFAULT CHARSET=utf8 COMMENT='收藏表';

/*Data for the table `storeup` */

insert  into `storeup`(`id`,`addtime`,`userid`,`refid`,`tablename`,`name`,`picture`) values (1616398205159,'2021-03-22 15:30:04',1616398178397,21,'zaixianxuexi','课程名称1','http://localhost:8080/ssm2236x/upload/zaixianxuexi_kechengfengmian1.jpg');

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='token表';

/*Data for the table `token` */

insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (1,1616398178397,'111','yonghu','用户','3uput12kziqgt4pmeawnojugix9niznb','2021-03-22 15:29:48','2021-03-22 16:29:49'),(2,1,'abo','users','管理员','vv62olx4wffwncu1zk819x1mjitqqd0p','2021-03-22 15:34:25','2021-03-22 16:34:26'),(3,1616398783054,'1','yonghu','用户','ycwrryu98vqm3x8x9ox964z2ws0hcbqq','2021-03-22 15:39:54','2021-03-22 16:39:54');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role`,`addtime`) values (1,'abo','abo','管理员','2021-03-22 15:28:01');

/*Table structure for table `yonghu` */

DROP TABLE IF EXISTS `yonghu`;

CREATE TABLE `yonghu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `zhanghao` varchar(200) NOT NULL COMMENT '账号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `touxiang` varchar(200) DEFAULT NULL COMMENT '头像',
  `lianxidianhua` varchar(200) DEFAULT NULL COMMENT '联系电话',
  `lianxiyouxiang` varchar(200) DEFAULT NULL COMMENT '联系邮箱',
  PRIMARY KEY (`id`),
  UNIQUE KEY `zhanghao` (`zhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=1616398783055 DEFAULT CHARSET=utf8 COMMENT='用户';

/*Data for the table `yonghu` */

insert  into `yonghu`(`id`,`addtime`,`zhanghao`,`mima`,`xingming`,`xingbie`,`touxiang`,`lianxidianhua`,`lianxiyouxiang`) values (11,'2021-03-22 15:28:01','171030114','123456','李六','女','http://localhost:8080/ssm2236x/upload/1616398530982.jpg','13823888881','773890001@qq.com'),(12,'2021-03-22 15:28:01','用户2','123456','姓名2','男','http://localhost:8080/ssm2236x/upload/yonghu_touxiang2.jpg','13823888882','773890002@qq.com'),(13,'2021-03-22 15:28:01','用户3','123456','姓名3','男','http://localhost:8080/ssm2236x/upload/yonghu_touxiang3.jpg','13823888883','773890003@qq.com'),(14,'2021-03-22 15:28:01','用户4','123456','姓名4','男','http://localhost:8080/ssm2236x/upload/yonghu_touxiang4.jpg','13823888884','773890004@qq.com'),(15,'2021-03-22 15:28:01','用户5','123456','姓名5','男','http://localhost:8080/ssm2236x/upload/yonghu_touxiang5.jpg','13823888885','773890005@qq.com'),(16,'2021-03-22 15:28:01','用户6','123456','姓名6','男','http://localhost:8080/ssm2236x/upload/yonghu_touxiang6.jpg','13823888886','773890006@qq.com'),(1616398178397,'2021-03-22 15:29:38','111','111','王五','男','http://localhost:8080/ssm2236x/upload/1616398354723.jpg','13800138000','1@qq.com'),(1616398783054,'2021-03-22 15:39:43','1','1','1',NULL,NULL,'','');

/*Table structure for table `zaixianxuexi` */

DROP TABLE IF EXISTS `zaixianxuexi`;

CREATE TABLE `zaixianxuexi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `kechengmingcheng` varchar(200) DEFAULT NULL COMMENT '课程名称',
  `kechengbianhao` varchar(200) DEFAULT NULL COMMENT '课程编号',
  `kechengleibie` varchar(200) DEFAULT NULL COMMENT '课程类别',
  `kechengfengmian` varchar(200) DEFAULT NULL COMMENT '课程封面',
  `kechengxiangqing` varchar(200) DEFAULT NULL COMMENT '课程详情',
  `thumbsupnum` int(11) DEFAULT '0' COMMENT '赞',
  `crazilynum` int(11) DEFAULT '0' COMMENT '踩',
  `clicknum` int(11) DEFAULT '0' COMMENT '点击次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1616398552317 DEFAULT CHARSET=utf8 COMMENT='在线学习';

/*Data for the table `zaixianxuexi` */

insert  into `zaixianxuexi`(`id`,`addtime`,`kechengmingcheng`,`kechengbianhao`,`kechengleibie`,`kechengfengmian`,`kechengxiangqing`,`thumbsupnum`,`crazilynum`,`clicknum`) values (21,'2021-03-22 15:28:01','课程名称1','课程编号1','基础医学','http://localhost:8080/ssm2236x/upload/zaixianxuexi_kechengfengmian1.jpg','',3,2,3),(22,'2021-03-22 15:28:01','课程名称2','课程编号2','基础医学','http://localhost:8080/ssm2236x/upload/zaixianxuexi_kechengfengmian2.jpg','',2,2,2),(23,'2021-03-22 15:28:01','课程名称3','课程编号3','基础医学','http://localhost:8080/ssm2236x/upload/zaixianxuexi_kechengfengmian3.jpg','',3,3,3),(24,'2021-03-22 15:28:01','课程名称4','课程编号4','基础医学','http://localhost:8080/ssm2236x/upload/zaixianxuexi_kechengfengmian4.jpg','',4,4,4),(25,'2021-03-22 15:28:01','课程名称5','课程编号5','基础医学','http://localhost:8080/ssm2236x/upload/zaixianxuexi_kechengfengmian5.jpg','',5,5,5),(26,'2021-03-22 15:28:01','课程名称6','课程编号6','基础医学','http://localhost:8080/ssm2236x/upload/zaixianxuexi_kechengfengmian6.jpg','',6,6,6),(1616398443150,'2021-03-22 15:34:03','生命科学','1111','基础医学','http://localhost:8080/ssm2236x/upload/1616398428153.jpg','http://localhost:8080/ssm2236x/upload/1616398440577.mp4',0,0,0),(1616398552316,'2021-03-22 15:35:51','111','11','基础医学','','',0,0,0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
