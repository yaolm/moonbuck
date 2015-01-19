CREATE DATABASE  IF NOT EXISTS `mis` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mis`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: mis
-- ------------------------------------------------------
-- Server version	5.6.20-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_0e939a4f` (`group_id`),
  KEY `auth_group_permissions_8373b171` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_58c48ba9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_417f1b1c` (`content_type_id`),
  CONSTRAINT `auth_permissi_content_type_id_51277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add site',6,'add_site'),(17,'Can change site',6,'change_site'),(18,'Can delete site',6,'delete_site'),(19,'Can add customer',7,'add_customer'),(20,'Can change customer',7,'change_customer'),(21,'Can delete customer',7,'delete_customer'),(22,'Can add piece',8,'add_piece'),(23,'Can change piece',8,'change_piece'),(24,'Can delete piece',8,'delete_piece'),(25,'Can add order',9,'add_order'),(26,'Can change order',9,'change_order'),(27,'Can delete order',9,'delete_order'),(28,'Can add order piece',10,'add_orderpiece'),(29,'Can change order piece',10,'change_orderpiece'),(30,'Can delete order piece',10,'delete_orderpiece'),(31,'Can add project',11,'add_project'),(32,'Can change project',11,'change_project'),(33,'Can delete project',11,'delete_project'),(34,'Can add customer group',12,'add_customergroup'),(35,'Can change customer group',12,'change_customergroup'),(36,'Can delete customer group',12,'delete_customergroup'),(37,'Can add media',13,'add_media'),(38,'Can change media',13,'change_media'),(39,'Can delete media',13,'delete_media'),(40,'Can add price',14,'add_price'),(41,'Can change price',14,'change_price'),(42,'Can delete price',14,'delete_price'),(43,'Can add order media',15,'add_ordermedia'),(44,'Can change order media',15,'change_ordermedia'),(45,'Can delete order media',15,'delete_ordermedia');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$20000$bUPTkhlT8Jre$xSeXrn84p2XKqaOw5OSz6Bvi3NxSTUkL4QBHCto5Krk=',NULL,1,'agnes','','','agnesyao1110@gmail.com',1,1,'2015-01-18 12:50:06');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_e8701ad4` (`user_id`),
  KEY `auth_user_groups_0e939a4f` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_30a071c9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_24702650_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_e8701ad4` (`user_id`),
  KEY `auth_user_user_permissions_8373b171` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_3ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'content type','contenttypes','contenttype'),(5,'session','sessions','session'),(6,'site','sites','site'),(7,'customer','mis','customer'),(8,'piece','mis','piece'),(9,'order','mis','order'),(10,'order piece','mis','orderpiece'),(11,'project','mis','project'),(12,'customer group','mis','customergroup'),(13,'media','mis','media'),(14,'price','mis','price'),(15,'order media','mis','ordermedia');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2015-01-18 12:49:24'),(2,'auth','0001_initial','2015-01-18 12:49:26'),(3,'auth','0002_alter_permission_name_max_length','2015-01-18 12:49:26'),(4,'auth','0003_alter_user_email_max_length','2015-01-18 12:49:27'),(5,'auth','0004_alter_user_username_opts','2015-01-18 12:49:27'),(6,'auth','0005_alter_user_last_login_null','2015-01-18 12:49:27'),(7,'sessions','0001_initial','2015-01-18 12:49:28'),(8,'sites','0001_initial','2015-01-18 12:49:28');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mis_customer`
--

DROP TABLE IF EXISTS `mis_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mis_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cuId` int(11) NOT NULL,
  `cuName` varchar(10) DEFAULT NULL,
  `cuEmail` varchar(254) NOT NULL,
  `cuPhone` varchar(13) NOT NULL,
  `cuScore` int(11) NOT NULL,
  `cuCreate` time NOT NULL,
  `cuYear` int(11) DEFAULT NULL,
  `cuZone` varchar(12) DEFAULT NULL,
  `cuType` varchar(10) DEFAULT NULL,
  `cumonth` int(11) DEFAULT NULL,
  `cuday` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mis_customer`
--

LOCK TABLES `mis_customer` WRITE;
/*!40000 ALTER TABLE `mis_customer` DISABLE KEYS */;
INSERT INTO `mis_customer` VALUES (1,10001,'苗1','1200093001@pku.edu.cn','18612531701',50,'12:02:01',2010,'北京','学生',8,1),(2,10002,'苗2','1200093002@pku.edu.cn','18612531702',100,'12:02:02',2010,'北京','学生',8,2),(3,10003,'苗3','1200093003@pku.edu.cn','18612531703',150,'12:02:03',2010,'广州','学生',8,3),(4,10004,'苗4','1200093004@pku.edu.cn','18612531704',200,'12:02:04',2010,'天津','学生',8,4),(5,10005,'苗5','1200093005@pku.edu.cn','18612531705',250,'12:02:05',2010,'广州','学生',8,5),(6,10006,'苗6','1200093006@pku.edu.cn','18612531706',300,'12:02:06',2010,'北京','学生',8,6),(7,10007,'苗7','1200093007@pku.edu.cn','18612531707',350,'12:02:07',2010,'北京','老人',8,23),(8,10008,'图尔1','1200093008@pku.edu.cn','18612531708',400,'12:02:08',2010,'吉林','老人',7,12),(9,10009,'图尔2','1200093009@pku.edu.cn','18612531709',450,'12:02:08',2010,'吉林','老人',1,23),(10,10010,'图尔3','1200093010@pku.edu.cn','18612531710',500,'12:02:08',2010,'北京','学生 ',2,23),(11,10011,'图尔4','1200093011@pku.edu.cn','18612531711',550,'12:02:08',2010,'北京','学生 ',2,12),(12,10012,'图尔5','1200093012@pku.edu.cn','18612531712',600,'12:02:08',2010,'北京','学生 ',3,21),(13,10013,'图尔6','1200093013@pku.edu.cn','18612531713',770,'12:02:08',2010,'北京','学生 ',3,21);
/*!40000 ALTER TABLE `mis_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mis_customergroup`
--

DROP TABLE IF EXISTS `mis_customergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mis_customergroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grId` int(11) NOT NULL,
  `grTy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mis_customergroup`
--

LOCK TABLES `mis_customergroup` WRITE;
/*!40000 ALTER TABLE `mis_customergroup` DISABLE KEYS */;
INSERT INTO `mis_customergroup` VALUES (1,101,NULL),(2,102,NULL),(3,103,NULL),(4,104,NULL),(5,105,NULL),(6,106,NULL),(7,107,NULL),(8,108,NULL),(9,109,NULL),(10,110,NULL);
/*!40000 ALTER TABLE `mis_customergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mis_media`
--

DROP TABLE IF EXISTS `mis_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mis_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meId` int(11) NOT NULL,
  `meTo_id` int(11) NOT NULL,
  `meEffe` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mis_media_9da53f3b` (`meTo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mis_media`
--

LOCK TABLES `mis_media` WRITE;
/*!40000 ALTER TABLE `mis_media` DISABLE KEYS */;
INSERT INTO `mis_media` VALUES (1,1,101,5),(2,2,102,5),(3,3,103,5),(4,4,104,5),(5,5,105,5),(6,6,106,4),(7,7,107,4),(8,8,108,4),(9,9,109,4),(10,10,110,4),(11,11,111,3),(12,12,112,3),(13,13,113,3),(14,14,114,3),(15,15,115,3),(16,16,116,2),(17,17,117,2),(18,18,118,2),(19,19,119,2),(20,20,120,2),(21,21,121,1),(22,22,122,1),(23,23,123,1),(24,24,124,1),(25,25,125,1);
/*!40000 ALTER TABLE `mis_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mis_order`
--

DROP TABLE IF EXISTS `mis_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mis_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orId` int(11) NOT NULL,
  `orCu_id` int(11) NOT NULL,
  `orTime` time NOT NULL,
  `orPay` varchar(10) NOT NULL,
  `orOff` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mis_order_daec168c` (`orCu_id`),
  CONSTRAINT `orCu_id_refs_id_976a0256` FOREIGN KEY (`orCu_id`) REFERENCES `mis_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mis_order`
--

LOCK TABLES `mis_order` WRITE;
/*!40000 ALTER TABLE `mis_order` DISABLE KEYS */;
INSERT INTO `mis_order` VALUES (1,1001,1,'12:01:01','asd',10),(2,1002,2,'12:01:03','asd',20),(3,1003,3,'12:01:02','asd',10),(4,1004,4,'12:02:02','asd',12),(5,1005,5,'12:12:23','asd',12);
/*!40000 ALTER TABLE `mis_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mis_ordermedia`
--

DROP TABLE IF EXISTS `mis_ordermedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mis_ordermedia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `omId` int(11) NOT NULL,
  `omTi` time NOT NULL,
  `omMe_id` int(11) NOT NULL,
  `omSer_id` int(11) NOT NULL,
  `omPr` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mis_ordermedia_ee2aa2fc` (`omMe_id`),
  KEY `mis_ordermedia_e3ed39c9` (`omSer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mis_ordermedia`
--

LOCK TABLES `mis_ordermedia` WRITE;
/*!40000 ALTER TABLE `mis_ordermedia` DISABLE KEYS */;
INSERT INTO `mis_ordermedia` VALUES (1,1001,'12:12:12',1,1,1),(2,1002,'12:02:12',2,2,3),(3,1003,'12:02:14',3,3,2),(4,1004,'13:01:01',4,4,1),(5,1005,'13:02:02',5,5,2),(6,1006,'13:03:03',6,6,3),(7,1007,'14:01:01',7,7,1),(8,1008,'14:02:01',8,8,2),(9,1009,'14:03:01',9,9,3),(10,1010,'15:01:01',10,10,1);
/*!40000 ALTER TABLE `mis_ordermedia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mis_orderpiece`
--

DROP TABLE IF EXISTS `mis_orderpiece`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mis_orderpiece` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `opId_id` int(11) NOT NULL,
  `opPiece_id` int(11) NOT NULL,
  `opNum` int(11) NOT NULL,
  `opOff` int(11) DEFAULT NULL,
  `opPrefer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mis_orderpiece_5092ceec` (`opId_id`),
  KEY `mis_orderpiece_eefbc1ae` (`opPiece_id`),
  KEY `mis_orderpiece_59723c3d` (`opPrefer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mis_orderpiece`
--

LOCK TABLES `mis_orderpiece` WRITE;
/*!40000 ALTER TABLE `mis_orderpiece` DISABLE KEYS */;
INSERT INTO `mis_orderpiece` VALUES (1,1001,1,11,1,1),(2,1002,2,12,2,2),(3,1003,3,13,1,3),(4,1004,4,10,2,4),(5,1005,5,10,1,5),(6,1006,6,10,2,6),(7,1007,7,14,1,7),(8,1008,8,15,2,8),(9,1009,9,15,1,9),(10,1010,10,10,2,10);
/*!40000 ALTER TABLE `mis_orderpiece` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mis_piece`
--

DROP TABLE IF EXISTS `mis_piece`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mis_piece` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `piId` int(11) NOT NULL,
  `piProfit` double DEFAULT NULL,
  `piTime` time NOT NULL,
  `piPerfer` varchar(10) DEFAULT NULL,
  `piOff` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mis_piece`
--

LOCK TABLES `mis_piece` WRITE;
/*!40000 ALTER TABLE `mis_piece` DISABLE KEYS */;
INSERT INTO `mis_piece` VALUES (1,101,110,'12:23:12','asd',2),(2,102,111,'12:23:12','asd',3),(3,103,122,'12:23:12','asd',2),(4,104,123,'12:23:12','asd',1),(5,105,124,'12:23:12','asd',2),(6,106,152,'12:23:12','asd',2),(7,107,1231,'12:23:12','asd',2),(8,108,1234,'12:23:12','asd',1),(9,109,123,'12:23:12','asd',3),(10,110,23,'12:23:12','asd',2),(11,111,121,'12:23:12','asd',2);
/*!40000 ALTER TABLE `mis_piece` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mis_price`
--

DROP TABLE IF EXISTS `mis_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mis_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prId` int(11) NOT NULL,
  `prMe_id` int(11) NOT NULL,
  `prTy` int(11) DEFAULT NULL,
  `prPr` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mis_price_05324847` (`prMe_id`),
  CONSTRAINT `prMe_id_refs_id_aa854a81` FOREIGN KEY (`prMe_id`) REFERENCES `mis_media` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mis_price`
--

LOCK TABLES `mis_price` WRITE;
/*!40000 ALTER TABLE `mis_price` DISABLE KEYS */;
INSERT INTO `mis_price` VALUES (1,1001,1,1,1),(2,1002,2,2,1),(3,1003,3,3,1),(4,1004,4,1,2),(5,1005,5,2,2),(6,1006,6,3,2),(7,1007,7,1,3),(8,1008,8,2,3),(9,1009,9,3,3),(10,1010,10,1,1);
/*!40000 ALTER TABLE `mis_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mis_project`
--

DROP TABLE IF EXISTS `mis_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mis_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poId` int(11) NOT NULL,
  `poCu` int(11) DEFAULT NULL,
  `poBegin` time NOT NULL,
  `poEnd` time NOT NULL,
  `poType` int(11) DEFAULT NULL,
  `poBemonth` int(11) DEFAULT NULL,
  `poBeday` int(11) DEFAULT NULL,
  `poEnmonth` int(11) DEFAULT NULL,
  `poEnday` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mis_project`
--

LOCK TABLES `mis_project` WRITE;
/*!40000 ALTER TABLE `mis_project` DISABLE KEYS */;
INSERT INTO `mis_project` VALUES (1,101,1,'12:01:01','12:02:01',3,1,1,2,1),(2,201,2,'12:02:01','12:02:03',1,2,1,3,1),(3,301,3,'12:03:01','12:03:02',2,3,1,4,1),(4,401,4,'12:03:04','12:03:06',2,4,1,5,1),(5,501,5,'13:01:01','13:02:03',2,7,1,8,1),(6,601,1,'12:03:23','12:03:25',3,5,1,6,1),(7,701,3,'14:12:15','14:12:29',2,12,1,12,25),(8,801,2,'13:11:01','13:12:01',2,9,1,10,1),(9,901,1,'14:02:14','14:03:14',1,11,1,12,1),(10,1001,3,'13:02:14','13:03:14',2,8,1,9,1),(11,1101,2,'14:02:05','14:03:14',3,10,1,11,1);
/*!40000 ALTER TABLE `mis_project` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-01-20  6:03:34
