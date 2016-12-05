-- MySQL dump 10.13  Distrib 5.7.13, for Linux (x86_64)
--
-- Host: localhost    Database: agriculture
-- ------------------------------------------------------
-- Server version	5.7.13-0ubuntu0.16.04.2

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
-- Table structure for table `accessLevel`
--

DROP TABLE IF EXISTS `accessLevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accessLevel` (
  `accessLevel` smallint(6) NOT NULL,
  `details` char(64) NOT NULL,
  PRIMARY KEY (`accessLevel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accessLevel`
--

LOCK TABLES `accessLevel` WRITE;
/*!40000 ALTER TABLE `accessLevel` DISABLE KEYS */;
INSERT INTO `accessLevel` VALUES (1,'read add update remove'),(2,'read'),(3,'add update read');
/*!40000 ALTER TABLE `accessLevel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `address1` char(32) NOT NULL,
  `address2` char(32) NOT NULL,
  `city` char(32) NOT NULL,
  `empId` int(11) DEFAULT NULL,
  `addressNo` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`addressNo`),
  KEY `employeeId` (`empId`),
  CONSTRAINT `employeeId` FOREIGN KEY (`empId`) REFERENCES `personalInfo` (`empId`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES ('quater no - 3','near vishwanath temple','varanasi',1,1),('quater no - 30','behind vishwanath temple','varanasi',2,2),('quat 2-2','near br','vang',54,3),('gfdd','gfd','fgsdgd',5421,4),('gfdd','gfd','fgsdgd',54213,5),('gfdd','gfd','fgsdgd',542132,6),('gfdd','gfd','fgsdgd',5421323,7),('gfdd','gfd','fgsdgd',54213235,8),('gfdd','gfd','fgsdgd',542132352,9),('fasdfsaf','sdfsdfsdf','dfsdfasdf',423,10),('fasdfsaf','sdfsdfsdf','dfsdfasdf',4233,11),('fasdfsaf','sdfsdfsdf','dfsdfasdf',42333,12),('fasdfsaf','sdfsdfsdf','dfsdfasdf',423331,13),('fasdfsaf','sdfsdfsdf','dfsdfasdf',4233311,14),('fasdfsaf','sdfsdfsdf','dfsdfasdf',4213311,15),('fdskal;','ewq','eq',56,16),('fdsa','fdsa','fasd',552,17),('sdadsadsa','dsdsadsa','asdsasa',3213213,18),('sdadsadsa','dsdsadsas23','asdsasas32',3213221,19),('sdadsadsa','dsdsadsas23','asdsasas32',32313221,20),('dsaaaaaa','adsss','sdadasd',231,21),('fdsfsd','fdsfsdf','fdsfsdf',2311,22),('dasd','das','dsa',12121,23);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session');
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
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$30000$sm5P8jksqOWy$hKhSi0TE3kDoaMYCXxOEAnHiyrtVV179+5+R+kGwWKQ=','2016-10-22 10:00:31.476768',0,'qwerty','','','',0,1,'2016-10-21 13:27:53.348464'),(2,'pbkdf2_sha256$30000$eAkG73W57ZUM$47piqwSiXpK50MMQK4aVBDGk1SksaeYlfsDvepShpvI=',NULL,0,'asdf','','','',0,1,'2016-10-22 04:48:27.031755'),(5,'pbkdf2_sha256$30000$hMffnKE3HZMO$jdDjFV1IEsQ/wIqk7J+pKrye7VUf8QbjaJO41OvhlqE=',NULL,0,'asdfaa','','','',0,1,'2016-10-22 04:50:17.146678'),(6,'pbkdf2_sha256$30000$2i8Fcj0OxI6s$+vY5njI2eaXExqQ+jKW4ong4bgSxV1mpdEifzwWy3M0=',NULL,0,'adfaa','','','',0,1,'2016-10-22 04:50:56.876630'),(7,'pbkdf2_sha256$30000$j5xtbdKzMhOo$dsA7y+nnPlfm1lhyawe6tJE344ap6xw94zCjkClFJhk=',NULL,0,'adfaaa','','','',0,1,'2016-10-22 04:52:57.615680'),(8,'pbkdf2_sha256$30000$hvKUWWFFW9cg$Z8U8O+ZmdPHHNhSWLMrV6Pa/+t9poiotQsFtFzfLPXs=',NULL,0,'zxcv','','','',0,1,'2016-10-22 05:50:50.633763'),(9,'pbkdf2_sha256$30000$fM0B4hFcrhyH$Sp/iWEOA6G1X8OYhwtiKTtNe+/HMFMTMmhSs6+nACLo=',NULL,0,'asd','','','',0,1,'2016-10-22 05:55:47.317669'),(10,'pbkdf2_sha256$30000$f1eJzvZj8uNR$6U3nZOuqLZGcX5U6+NR1lCGXvVdUuwm9ImKE6cNwnNs=',NULL,0,'asda','','','',0,1,'2016-10-22 05:56:10.897746'),(11,'pbkdf2_sha256$30000$EMrKCUYN5DSG$XUZS6RczY2A+VdvXdu30SD068saS5b8pLBpBrbR+3eQ=',NULL,0,'qqqq','','','',0,1,'2016-10-22 06:05:21.804633'),(12,'pbkdf2_sha256$30000$tsYfxRaDF15Q$pv+jhqxftr0+2GBpb1x2baG5q55+n6y48YEVlPGaHIc=',NULL,0,'ghj','','','',0,1,'2016-10-22 06:23:39.281672'),(13,'pbkdf2_sha256$30000$b827pCc8lzDP$S49REAiDJn36HjZCEPmMKJAHK6XPr2C+zSPC44hkr48=',NULL,0,'kl','','','',0,1,'2016-10-22 09:49:50.699647'),(15,'pbkdf2_sha256$30000$1qYSRmJN9qij$EEMLzRaiTwFo+8K6AYhEZrpeGtLJnZY4XVehXuqqm6E=',NULL,0,'kll','','','',0,1,'2016-10-22 09:50:52.114300');
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
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clearanceLevel`
--

DROP TABLE IF EXISTS `clearanceLevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clearanceLevel` (
  `empId` int(11) NOT NULL,
  `accessLevel` smallint(6) NOT NULL,
  `No` smallint(6) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`No`),
  KEY `employee_id` (`empId`),
  CONSTRAINT `accessLevelVal` FOREIGN KEY (`No`) REFERENCES `accessLevel` (`accessLevel`),
  CONSTRAINT `employee_id` FOREIGN KEY (`empId`) REFERENCES `personalInfo` (`empId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clearanceLevel`
--

LOCK TABLES `clearanceLevel` WRITE;
/*!40000 ALTER TABLE `clearanceLevel` DISABLE KEYS */;
INSERT INTO `clearanceLevel` VALUES (0,1,1),(2,2,2),(3,2,3);
/*!40000 ALTER TABLE `clearanceLevel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credentials`
--

DROP TABLE IF EXISTS `credentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credentials` (
  `username` char(32) NOT NULL,
  `password` char(32) NOT NULL,
  `empId` int(11) DEFAULT NULL,
  PRIMARY KEY (`username`),
  KEY `employeeIdnumber` (`empId`),
  CONSTRAINT `employeeIdnumber` FOREIGN KEY (`empId`) REFERENCES `personalInfo` (`empId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credentials`
--

LOCK TABLES `credentials` WRITE;
/*!40000 ALTER TABLE `credentials` DISABLE KEYS */;
INSERT INTO `credentials` VALUES ('adfaa','123456',3213221),('adfaaa','qqqqqqqq',32313221),('asda','asda',2311),('asdf','asdf',3213213),('fsfdsf','fsdfs',56),('qqqq','qqqq',12121),('qwerty','123456',552),('ragarwal','abcd1234',2),('rpsingh','manjusingh',1),('shivRATHEE','qwerty12345',0),('sShukla','qwerty1234',3),('zxcv','zxcv',231);
/*!40000 ALTER TABLE `credentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `deptName` varchar(64) DEFAULT NULL,
  `deptId` int(11) NOT NULL,
  `noOfEmployees` int(11) NOT NULL,
  PRIMARY KEY (`deptId`),
  UNIQUE KEY `deptName` (`deptName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('Plant Physiology',1,7),('Agronomy',2,6),('Genetics & Plant Breeding',3,6),('Soil Science & Agricultural Chemistry',4,5),('Plant Pathology',5,5),('Agricultural Economics',6,5),('Horticulture',7,5),('Entomology',8,5),('Agriculture Zoology',9,5),('Animal Husbandry & Dairy Farming',10,5),('Farm Engineering',11,5);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deptPhoneNo`
--

DROP TABLE IF EXISTS `deptPhoneNo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deptPhoneNo` (
  `deptId` int(11) DEFAULT NULL,
  `phoneNo` decimal(10,0) NOT NULL,
  PRIMARY KEY (`phoneNo`),
  KEY `number` (`deptId`),
  CONSTRAINT `number` FOREIGN KEY (`deptId`) REFERENCES `department` (`deptId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deptPhoneNo`
--

LOCK TABLES `deptPhoneNo` WRITE;
/*!40000 ALTER TABLE `deptPhoneNo` DISABLE KEYS */;
INSERT INTO `deptPhoneNo` VALUES (1,9721769799),(1,9721788899),(2,9222788899),(3,9232783333),(4,9222783333),(7,9238783292),(10,9232783299),(11,9232783234);
/*!40000 ALTER TABLE `deptPhoneNo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
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
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-09-27 19:07:43.774908'),(2,'auth','0001_initial','2016-09-27 19:07:44.302173'),(3,'admin','0001_initial','2016-09-27 19:07:44.395370'),(4,'admin','0002_logentry_remove_auto_add','2016-09-27 19:07:44.413570'),(5,'contenttypes','0002_remove_content_type_name','2016-09-27 19:07:44.490693'),(6,'auth','0002_alter_permission_name_max_length','2016-09-27 19:07:44.513207'),(7,'auth','0003_alter_user_email_max_length','2016-09-27 19:07:44.536356'),(8,'auth','0004_alter_user_username_opts','2016-09-27 19:07:44.548651'),(9,'auth','0005_alter_user_last_login_null','2016-09-27 19:07:44.592267'),(10,'auth','0006_require_contenttypes_0002','2016-09-27 19:07:44.595776'),(11,'auth','0007_alter_validators_add_error_messages','2016-09-27 19:07:44.628374'),(12,'auth','0008_alter_user_username_max_length','2016-09-27 19:07:44.656382'),(13,'sessions','0001_initial','2016-09-27 19:07:44.687866');
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
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('14mk0l1gmzaw3y16tb4xqnsnhen9bwmk','ZjVlOTA4OWMxNGIyMWM4ZGY2NzYyNjhlYWM0N2FlNGFiNzliMGRlNTp7fQ==','2016-11-04 13:17:36.321416'),('2mn6gx86h8opx8c59a11gnj2iob1pez3','ZjVlOTA4OWMxNGIyMWM4ZGY2NzYyNjhlYWM0N2FlNGFiNzliMGRlNTp7fQ==','2016-11-04 13:14:25.434096'),('qdoxwkmmc3qwsup03jiq243dgh20uqrq','ZWFlZjYzOGU0YThlNWE3MGE3NDQ4NjkzYmY4NmVkMjNmYjlkZTU3MTp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg0M2UwN2FjZjc0YmYwZTg3OGYxN2E5Y2ZmODkwYTBiZjAzMmU1YTEiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2016-11-05 10:00:31.483612');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailaddresses`
--

DROP TABLE IF EXISTS `emailaddresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emailaddresses` (
  `email` char(64) NOT NULL,
  `empId` int(11) DEFAULT NULL,
  PRIMARY KEY (`email`),
  UNIQUE KEY `email` (`email`),
  KEY `empIdcons` (`empId`),
  CONSTRAINT `empIdcons` FOREIGN KEY (`empId`) REFERENCES `personalInfo` (`empId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailaddresses`
--

LOCK TABLES `emailaddresses` WRITE;
/*!40000 ALTER TABLE `emailaddresses` DISABLE KEYS */;
INSERT INTO `emailaddresses` VALUES ('rathee.shiv@gmail.com',0),('rpsingh@gmail.com',1),('ragarwal@gmail.com',2),('sshukla@gmail.com',3),('dsfds@sfsdfs',56),('sdfdsfds@fds',231),('dfsdfdf@fgfg',423),('aaaaaaa@dsss',552),('fsdfsd@fsfds1',2311),('dfsdfdf@fgfgf',4233),('fdss@a',12121),('dfsdfdf@fgfgff',42333),('fdsdsd2fs@sd',54213),('fdsfdsfs2gfdgf@fds',3213213),('fdsfdsfgfdgf@fds1',3213221),('dffdf@fgfgffd',4213311),('dfsdfdf@fgfgffd',4233311),('fdsdsd2fs@sdds',5421323),('fdsffgfdgf@fds1',32313221),('fdsdsd2fs@sdds5',54213235),('fdsdsd2fs@sdds52',542132352);
/*!40000 ALTER TABLE `emailaddresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `name`
--

DROP TABLE IF EXISTS `name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `name` (
  `firstName` char(32) NOT NULL,
  `secondName` char(32) DEFAULT NULL,
  `nameNo` int(11) NOT NULL AUTO_INCREMENT,
  `empId` int(11) DEFAULT NULL,
  PRIMARY KEY (`nameNo`),
  KEY `employeeIDno` (`empId`),
  CONSTRAINT `employeeIDno` FOREIGN KEY (`empId`) REFERENCES `personalInfo` (`empId`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `name`
--

LOCK TABLES `name` WRITE;
/*!40000 ALTER TABLE `name` DISABLE KEYS */;
INSERT INTO `name` VALUES ('Ram Narayan','Singh',1,2),('Devendra','Singh',2,3),('Shiv Naresh','Agarwal',3,1),('Narendra','Shukla',4,4),('Shivendra','Rathee',6,0),('dfjsk','dfjskal',7,54),('gfdgd','fggfg',8,542132352),('fdsafs','fdsafsda',9,423),('fdsafs','fdsafsda',10,42333),('fdsafs','fdsafsda',11,4213311),('ewr','ewq',12,56),('fdsfsd','fdsfdsfsa',13,552),('dasdasdas','dasdasdasdas',14,3213213),('dasdasdas21321','dasdasdasdas321',15,3213221),('dasdasdas21321','dasdasdasdas321',16,32313221),('sdaaa','sdaaaaaa',17,231),('dfsfdsff','dsfsdfs',18,2311),('asas','asa',19,12121);
/*!40000 ALTER TABLE `name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personalInfo`
--

DROP TABLE IF EXISTS `personalInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personalInfo` (
  `empId` int(11) NOT NULL,
  `deptId` int(11) DEFAULT NULL,
  `dateOfBirth` date NOT NULL,
  `joiningDate` date NOT NULL DEFAULT '1980-01-01',
  `resigningDate` date DEFAULT '1980-01-01',
  `reasonForLeaving` varchar(128) DEFAULT 'retirement',
  PRIMARY KEY (`empId`),
  KEY `departmentId` (`deptId`),
  CONSTRAINT `departmentId` FOREIGN KEY (`deptId`) REFERENCES `department` (`deptId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personalInfo`
--

LOCK TABLES `personalInfo` WRITE;
/*!40000 ALTER TABLE `personalInfo` DISABLE KEYS */;
INSERT INTO `personalInfo` VALUES (0,1,'1950-08-23','1970-11-12',NULL,NULL),(1,1,'1960-04-23','1979-10-11',NULL,NULL),(2,9,'1980-08-23','1999-10-11',NULL,NULL),(3,9,'1980-08-23','1999-10-11','2011-05-12','voluntary retirement'),(4,4,'1990-05-23','1999-09-11',NULL,NULL),(5,1,'2012-03-23','2013-02-23',NULL,NULL),(54,1,'2014-05-21','2015-03-04',NULL,NULL),(56,5,'2016-08-07','2016-08-07',NULL,NULL),(231,1,'1987-08-12','1996-07-11',NULL,NULL),(423,1,'2013-07-09','2016-12-12',NULL,NULL),(542,1,'2014-05-21','2015-03-04',NULL,NULL),(552,1,'2016-04-07','2016-04-07',NULL,NULL),(2311,1,'2018-01-11','2018-01-11',NULL,NULL),(4233,1,'2013-07-09','2016-12-12',NULL,NULL),(5421,1,'2014-05-21','2015-03-04',NULL,NULL),(12121,1,'2018-08-12','2018-08-12',NULL,NULL),(42333,1,'2013-07-09','2016-12-12',NULL,NULL),(54213,1,'2014-05-21','2015-03-04',NULL,NULL),(423331,1,'2013-07-09','2016-12-12',NULL,NULL),(542132,1,'2014-05-21','2015-03-04',NULL,NULL),(3213213,1,'2013-08-04','2013-08-04',NULL,NULL),(3213221,1,'2013-08-04','2013-08-04',NULL,NULL),(4213311,1,'2013-07-09','2016-12-12',NULL,NULL),(4233311,1,'2013-07-09','2016-12-12',NULL,NULL),(5421323,1,'2014-05-21','2015-03-04',NULL,NULL),(32313221,1,'2013-08-04','2013-08-04',NULL,NULL),(54213235,1,'2014-05-21','2015-03-04',NULL,NULL),(542132352,1,'2014-05-21','2015-03-04',NULL,NULL);
/*!40000 ALTER TABLE `personalInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phone_num`
--

DROP TABLE IF EXISTS `phone_num`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phone_num` (
  `contactNo` decimal(10,0) NOT NULL,
  `empId` int(11) DEFAULT NULL,
  PRIMARY KEY (`contactNo`),
  KEY `empIdconstrain` (`empId`),
  CONSTRAINT `empIdconstrain` FOREIGN KEY (`empId`) REFERENCES `personalInfo` (`empId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone_num`
--

LOCK TABLES `phone_num` WRITE;
/*!40000 ALTER TABLE `phone_num` DISABLE KEYS */;
INSERT INTO `phone_num` VALUES (9452726347,0),(9452726349,0),(9452723447,1),(99,2),(9987623447,3),(9987623449,4),(32424,56),(123456,231),(94667676,423),(999999999,552),(1234561,2311),(999987,12121),(9466767633,42333),(3453543,3213213),(3454311,3213221),(946676712,4213311),(34543011,32313221),(545345,542132352);
/*!40000 ALTER TABLE `phone_num` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `previousPositionHolder`
--

DROP TABLE IF EXISTS `previousPositionHolder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `previousPositionHolder` (
  `prevEmpId` int(11) NOT NULL,
  `currEmpId` int(11) DEFAULT NULL,
  `position` char(64) NOT NULL,
  KEY `prevHolder` (`prevEmpId`),
  CONSTRAINT `prevHolder` FOREIGN KEY (`prevEmpId`) REFERENCES `personalInfo` (`empId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `previousPositionHolder`
--

LOCK TABLES `previousPositionHolder` WRITE;
/*!40000 ALTER TABLE `previousPositionHolder` DISABLE KEYS */;
INSERT INTO `previousPositionHolder` VALUES (3,1,'Professor');
/*!40000 ALTER TABLE `previousPositionHolder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supervises`
--

DROP TABLE IF EXISTS `supervises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supervises` (
  `supervisorId` int(11) NOT NULL,
  `underlyingId` int(11) NOT NULL,
  `task` varchar(256) NOT NULL,
  KEY `supervisedby` (`supervisorId`),
  KEY `under` (`underlyingId`),
  CONSTRAINT `supervisedby` FOREIGN KEY (`supervisorId`) REFERENCES `personalInfo` (`empId`),
  CONSTRAINT `under` FOREIGN KEY (`underlyingId`) REFERENCES `personalInfo` (`empId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supervises`
--

LOCK TABLES `supervises` WRITE;
/*!40000 ALTER TABLE `supervises` DISABLE KEYS */;
INSERT INTO `supervises` VALUES (3,1,'generation of higher quality wheat seeds '),(2,1,'fdjskla'),(1,2,'dfdfsdfsdf'),(1,2,'fggfdgdfdfg'),(1,2,'fggfdgdfdfg'),(1,2,'fggfdgdfdfg'),(1,2,'fggfdgdfdfg'),(1,1,'dsadasda'),(1,1,'dsadasda'),(2,1,'fgsdfdsfdsfds'),(1,2,'gfsdds'),(1,2,'fdsf'),(1,2,'dfas');
/*!40000 ALTER TABLE `supervises` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-22 16:04:55
