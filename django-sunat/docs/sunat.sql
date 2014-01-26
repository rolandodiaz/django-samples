CREATE DATABASE  IF NOT EXISTS `sunat` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `sunat`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: sunat
-- ------------------------------------------------------
-- Server version	5.6.11-log

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
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
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
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add site',6,'add_site'),(17,'Can change site',6,'change_site'),(18,'Can delete site',6,'delete_site'),(19,'Can add log entry',7,'add_logentry'),(20,'Can change log entry',7,'change_logentry'),(21,'Can delete log entry',7,'delete_logentry'),(22,'Can add flat page',8,'add_flatpage'),(23,'Can change flat page',8,'change_flatpage'),(24,'Can delete flat page',8,'delete_flatpage'),(25,'Can add Person',9,'add_person'),(26,'Can change Person',9,'change_person'),(27,'Can delete Person',9,'delete_person'),(28,'Can add concept',10,'add_concept'),(29,'Can change concept',10,'change_concept'),(30,'Can delete concept',10,'delete_concept'),(31,'Can add debt',11,'add_debt'),(32,'Can change debt',11,'change_debt'),(33,'Can delete debt',11,'delete_debt');
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
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$10000$YlrFKWVKtPQX$nLetHCaPzzVR3/NJT4RY9tbbxm6RZwbKybHYhkPfSD4=','2013-10-06 14:02:16',1,'admin','','','heraldmatias.oz@gmail.com',1,1,'2013-10-05 22:11:07');
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
  KEY `auth_user_groups_6340c63c` (`user_id`),
  KEY `auth_user_groups_5f412f9a` (`group_id`),
  CONSTRAINT `user_id_refs_id_40c41112` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `group_id_refs_id_274b862c` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
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
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_6340c63c` (`user_id`),
  KEY `auth_user_user_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `user_id_refs_id_4dc23c39` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `permission_id_refs_id_35d9ac25` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
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
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_6340c63c` (`user_id`),
  KEY `django_admin_log_37ef4eb4` (`content_type_id`),
  CONSTRAINT `user_id_refs_id_c0d12874` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `content_type_id_refs_id_93d2d1f8` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2013-10-05 22:48:09',1,10,'1','Concept object',1,''),(2,'2013-10-05 22:48:27',1,10,'2','Concept object',1,''),(3,'2013-10-05 22:51:48',1,9,'1','43432433333',1,''),(4,'2013-10-05 23:21:06',1,11,'1','Debt object',1,''),(5,'2013-10-06 12:47:44',1,11,'1','Debt object',2,'Modificado/a tax_code.'),(6,'2013-10-06 13:07:47',1,11,'2','Debt object',1,''),(7,'2013-10-06 13:07:55',1,11,'3','Debt object',1,''),(8,'2013-10-06 13:08:13',1,11,'4','Debt object',1,''),(9,'2013-10-06 13:08:20',1,11,'5','Debt object',1,''),(10,'2013-10-06 13:08:30',1,11,'6','Debt object',1,''),(11,'2013-10-06 14:03:53',1,10,'105','Papeleta',1,''),(12,'2013-10-06 14:05:09',1,10,'105','Papeleta de Tránsito',2,'Modificado/a name.'),(13,'2013-10-06 14:15:43',1,10,'105','Papeleta de Tránsito',3,''),(14,'2013-10-06 14:19:24',1,9,'48','10666666661',1,''),(15,'2013-10-06 14:20:36',1,9,'48','10666666661',2,'Modificado/a name y phone.'),(16,'2013-10-06 14:21:43',1,9,'48','10666666661',3,''),(17,'2013-10-06 14:24:21',1,9,'49','10666666661',1,''),(18,'2013-10-06 14:24:55',1,11,'7','Debt object',1,''),(19,'2013-10-06 14:27:51',1,11,'8','Debt object',1,''),(20,'2013-10-06 14:29:09',1,11,'8','Debt object',2,'Modificado/a period, tax_code y amount.'),(21,'2013-10-06 14:34:15',1,11,'3','Multa por Fraccionamiento pertenciente a 43432433333 en Diciembre equivalente 200.00',3,''),(22,'2013-10-06 14:34:15',1,11,'2','Multa por Fraccionamiento pertenciente a 43432433333 en Diciembre equivalente 200.00',3,''),(23,'2013-10-06 14:34:15',1,11,'1','Multa por Fraccionamiento pertenciente a 43432433333 en Diciembre equivalente 200.00',3,''),(24,'2013-10-06 14:41:16',1,11,'9','Multa por Tributo pertenciente a 43432433333 en Primer Trimestre de 2013 equivalente 2400.00',1,''),(25,'2013-10-06 14:41:25',1,11,'10','Multa por Fraccionamiento pertenciente a 43432433333 en Segundo Trimestre de 2013 equivalente 2400.00',1,''),(26,'2013-10-06 14:41:45',1,11,'11','Multa por Tributo pertenciente a 43432433333 en Primer Trimestre de 2013 equivalente 7067.55',1,''),(27,'2013-10-06 14:41:54',1,11,'12','Multa por Tributo pertenciente a 43432433333 en Primer Trimestre de 2013 equivalente 2400.00',1,'');
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
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'content type','contenttypes','contenttype'),(5,'session','sessions','session'),(6,'site','sites','site'),(7,'log entry','admin','logentry'),(8,'flat page','flatpages','flatpage'),(9,'Person','sunat','person'),(10,'concept','sunat','concept'),(11,'debt','sunat','debt');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
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
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('ekhef4qrgkyy6r1spb99hjoijdvsmxwk','ODg2ZTY1NmE1ZTYzYTBkN2M4Mjk4YTk2ZDM3ZjIwMzIwYTRjMjkwOTqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==','2013-10-20 14:02:16');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rollback_test`
--

DROP TABLE IF EXISTS `rollback_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rollback_test` (
  `X` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rollback_test`
--

LOCK TABLES `rollback_test` WRITE;
/*!40000 ALTER TABLE `rollback_test` DISABLE KEYS */;
/*!40000 ALTER TABLE `rollback_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sunat_concept`
--

DROP TABLE IF EXISTS `sunat_concept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sunat_concept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sunat_concept_4da47e07` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sunat_concept`
--

LOCK TABLES `sunat_concept` WRITE;
/*!40000 ALTER TABLE `sunat_concept` DISABLE KEYS */;
INSERT INTO `sunat_concept` VALUES (1,'Fraccionamiento'),(2,'Tributo');
/*!40000 ALTER TABLE `sunat_concept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sunat_debt`
--

DROP TABLE IF EXISTS `sunat_debt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sunat_debt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `concept_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `period` varchar(30) NOT NULL,
  `resolution_number` varchar(20) DEFAULT NULL,
  `tax_code` varchar(10) DEFAULT NULL,
  `amount` decimal(14,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sunat_debt_8a386586` (`concept_id`),
  KEY `sunat_debt_16f39487` (`person_id`),
  CONSTRAINT `concept_id_refs_id_bfb091c0` FOREIGN KEY (`concept_id`) REFERENCES `sunat_concept` (`id`),
  CONSTRAINT `person_id_refs_id_b8c66205` FOREIGN KEY (`person_id`) REFERENCES `sunat_person` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sunat_debt`
--

LOCK TABLES `sunat_debt` WRITE;
/*!40000 ALTER TABLE `sunat_debt` DISABLE KEYS */;
INSERT INTO `sunat_debt` VALUES (4,1,1,'Diciembre','','',200.00),(5,1,1,'Diciembre','','',200.00),(6,2,1,'Diciembre','','',200.00),(7,2,49,'Primer Trimestre de 2013','','63784',7067.55),(8,1,49,'Segundo Trimestre de 2013','4532543','4434',2400.00),(9,2,1,'Primer Trimestre de 2013','','',2400.00),(10,1,1,'Segundo Trimestre de 2013','','',2400.00),(11,2,1,'Primer Trimestre de 2013','','',7067.55),(12,2,1,'Primer Trimestre de 2013','','',2400.00);
/*!40000 ALTER TABLE `sunat_debt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sunat_person`
--

DROP TABLE IF EXISTS `sunat_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sunat_person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `ruc` varchar(11) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sunat_person_4da47e07` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sunat_person`
--

LOCK TABLES `sunat_person` WRITE;
/*!40000 ALTER TABLE `sunat_person` DISABLE KEYS */;
INSERT INTO `sunat_person` VALUES (1,'INEI','43432433333','4324332',2),(49,'Martín Mimbela','10666666661','',1);
/*!40000 ALTER TABLE `sunat_person` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-10-06 15:01:10
