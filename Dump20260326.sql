-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tn_college_events
-- ------------------------------------------------------
-- Server version	9.6.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '06748758-26d3-11f1-a89a-40c2ba86aa7c:1-185';

--
-- Table structure for table `account_emailaddress`
--

DROP TABLE IF EXISTS `account_emailaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_emailaddress` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_emailaddress_user_id_email_987c8728_uniq` (`user_id`,`email`),
  KEY `account_emailaddress_email_03be32b2` (`email`),
  CONSTRAINT `account_emailaddress_user_id_2c513194_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailaddress`
--

LOCK TABLES `account_emailaddress` WRITE;
/*!40000 ALTER TABLE `account_emailaddress` DISABLE KEYS */;
INSERT INTO `account_emailaddress` VALUES (1,'vaibhavakanna182005@gmail.com',1,1,2);
/*!40000 ALTER TABLE `account_emailaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_emailconfirmation`
--

DROP TABLE IF EXISTS `account_emailconfirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_emailconfirmation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`),
  CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailconfirmation`
--

LOCK TABLES `account_emailconfirmation` WRITE;
/*!40000 ALTER TABLE `account_emailconfirmation` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailconfirmation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add site',7,'add_site'),(26,'Can change site',7,'change_site'),(27,'Can delete site',7,'delete_site'),(28,'Can view site',7,'view_site'),(29,'Can add Token',8,'add_token'),(30,'Can change Token',8,'change_token'),(31,'Can delete Token',8,'delete_token'),(32,'Can view Token',8,'view_token'),(33,'Can add Token',9,'add_tokenproxy'),(34,'Can change Token',9,'change_tokenproxy'),(35,'Can delete Token',9,'delete_tokenproxy'),(36,'Can view Token',9,'view_tokenproxy'),(37,'Can add college',10,'add_college'),(38,'Can change college',10,'change_college'),(39,'Can delete college',10,'delete_college'),(40,'Can view college',10,'view_college'),(41,'Can add student',11,'add_student'),(42,'Can change student',11,'change_student'),(43,'Can delete student',11,'delete_student'),(44,'Can view student',11,'view_student'),(45,'Can add event',12,'add_event'),(46,'Can change event',12,'change_event'),(47,'Can delete event',12,'delete_event'),(48,'Can view event',12,'view_event'),(49,'Can add saved event',13,'add_savedevent'),(50,'Can change saved event',13,'change_savedevent'),(51,'Can delete saved event',13,'delete_savedevent'),(52,'Can view saved event',13,'view_savedevent'),(53,'Can add registration',14,'add_registration'),(54,'Can change registration',14,'change_registration'),(55,'Can delete registration',14,'delete_registration'),(56,'Can view registration',14,'view_registration'),(57,'Can add email address',15,'add_emailaddress'),(58,'Can change email address',15,'change_emailaddress'),(59,'Can delete email address',15,'delete_emailaddress'),(60,'Can view email address',15,'view_emailaddress'),(61,'Can add email confirmation',16,'add_emailconfirmation'),(62,'Can change email confirmation',16,'change_emailconfirmation'),(63,'Can delete email confirmation',16,'delete_emailconfirmation'),(64,'Can view email confirmation',16,'view_emailconfirmation'),(65,'Can add social account',17,'add_socialaccount'),(66,'Can change social account',17,'change_socialaccount'),(67,'Can delete social account',17,'delete_socialaccount'),(68,'Can view social account',17,'view_socialaccount'),(69,'Can add social application',18,'add_socialapp'),(70,'Can change social application',18,'change_socialapp'),(71,'Can delete social application',18,'delete_socialapp'),(72,'Can view social application',18,'view_socialapp'),(73,'Can add social application token',19,'add_socialtoken'),(74,'Can change social application token',19,'change_socialtoken'),(75,'Can delete social application token',19,'delete_socialtoken'),(76,'Can view social application token',19,'view_socialtoken'),(77,'Can add otp verification',20,'add_otpverification'),(78,'Can change otp verification',20,'change_otpverification'),(79,'Can delete otp verification',20,'delete_otpverification'),(80,'Can view otp verification',20,'view_otpverification'),(81,'Can add website feedback',21,'add_websitefeedback'),(82,'Can change website feedback',21,'change_websitefeedback'),(83,'Can delete website feedback',21,'delete_websitefeedback'),(84,'Can view website feedback',21,'view_websitefeedback');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1000000$y3VLbIqNu4ggTeeLSnq6ot$ZfB2uTMxfh1rNAHSkcgiT2ckiSbaKbweTIwxFeY60hw=','2026-03-26 05:37:56.938960',1,'vk18','','','vaibhavakanna07@gmail.com',1,1,'2026-03-25 15:06:49.689731'),(2,'!oVp4mb9DQKpGzto14sznrPe5ovOuTDFclFSS0qJi','2026-03-25 15:27:59.517233',0,'vaibhavakanna','Vaibhavakanna','P','vaibhavakanna182005@gmail.com',0,1,'2026-03-25 15:19:32.604294');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2026-03-25 15:11:07.176670','1','Google',1,'[{\"added\": {}}]',18,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (15,'account','emailaddress'),(16,'account','emailconfirmation'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(8,'authtoken','token'),(9,'authtoken','tokenproxy'),(5,'contenttypes','contenttype'),(10,'events','college'),(12,'events','event'),(20,'events','otpverification'),(14,'events','registration'),(13,'events','savedevent'),(11,'events','student'),(21,'events','websitefeedback'),(6,'sessions','session'),(7,'sites','site'),(17,'socialaccount','socialaccount'),(18,'socialaccount','socialapp'),(19,'socialaccount','socialtoken');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-03-14 15:18:30.495327'),(2,'auth','0001_initial','2026-03-14 15:18:31.333181'),(3,'account','0001_initial','2026-03-14 15:18:31.567409'),(4,'account','0002_email_max_length','2026-03-14 15:18:31.586867'),(5,'account','0003_alter_emailaddress_create_unique_verified_email','2026-03-14 15:18:31.631693'),(6,'account','0004_alter_emailaddress_drop_unique_email','2026-03-14 15:18:31.688654'),(7,'account','0005_emailaddress_idx_upper_email','2026-03-14 15:18:31.721229'),(8,'account','0006_emailaddress_lower','2026-03-14 15:18:31.738769'),(9,'account','0007_emailaddress_idx_email','2026-03-14 15:18:31.800467'),(10,'account','0008_emailaddress_unique_primary_email_fixup','2026-03-14 15:18:31.816948'),(11,'account','0009_emailaddress_unique_primary_email','2026-03-14 15:18:31.834215'),(12,'admin','0001_initial','2026-03-14 15:18:32.018692'),(13,'admin','0002_logentry_remove_auto_add','2026-03-14 15:18:32.028691'),(14,'admin','0003_logentry_add_action_flag_choices','2026-03-14 15:18:32.043701'),(15,'contenttypes','0002_remove_content_type_name','2026-03-14 15:18:32.185478'),(16,'auth','0002_alter_permission_name_max_length','2026-03-14 15:18:32.280824'),(17,'auth','0003_alter_user_email_max_length','2026-03-14 15:18:32.320545'),(18,'auth','0004_alter_user_username_opts','2026-03-14 15:18:32.339542'),(19,'auth','0005_alter_user_last_login_null','2026-03-14 15:18:32.424063'),(20,'auth','0006_require_contenttypes_0002','2026-03-14 15:18:32.426061'),(21,'auth','0007_alter_validators_add_error_messages','2026-03-14 15:18:32.436061'),(22,'auth','0008_alter_user_username_max_length','2026-03-14 15:18:32.534673'),(23,'auth','0009_alter_user_last_name_max_length','2026-03-14 15:18:32.611491'),(24,'auth','0010_alter_group_name_max_length','2026-03-14 15:18:32.645255'),(25,'auth','0011_update_proxy_permissions','2026-03-14 15:18:32.655536'),(26,'auth','0012_alter_user_first_name_max_length','2026-03-14 15:18:32.745782'),(27,'authtoken','0001_initial','2026-03-14 15:18:32.917243'),(28,'authtoken','0002_auto_20160226_1747','2026-03-14 15:18:32.954250'),(29,'authtoken','0003_tokenproxy','2026-03-14 15:18:32.961247'),(30,'authtoken','0004_alter_tokenproxy_options','2026-03-14 15:18:32.974250'),(31,'events','0001_initial','2026-03-14 15:18:33.498318'),(32,'events','0002_alter_registration_unique_together','2026-03-14 15:18:33.524442'),(33,'events','0003_college_profile_completed','2026-03-14 15:18:33.617937'),(34,'events','0004_student_profile_completed','2026-03-14 15:18:33.712452'),(35,'sessions','0001_initial','2026-03-14 15:18:33.755455'),(36,'sites','0001_initial','2026-03-14 15:18:33.776458'),(37,'sites','0002_alter_domain_unique','2026-03-14 15:18:33.803467'),(38,'socialaccount','0001_initial','2026-03-14 15:18:34.641220'),(39,'socialaccount','0002_token_max_lengths','2026-03-14 15:18:34.786709'),(40,'socialaccount','0003_extra_data_default_dict','2026-03-14 15:18:34.809719'),(41,'socialaccount','0004_app_provider_id_settings','2026-03-14 15:18:35.052724'),(42,'socialaccount','0005_socialtoken_nullable_app','2026-03-14 15:18:35.233503'),(43,'socialaccount','0006_alter_socialaccount_extra_data','2026-03-14 15:18:35.341223'),(44,'events','0005_otpverification','2026-03-25 14:28:12.664247'),(45,'events','0005_websitefeedback','2026-03-25 18:17:30.230583');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('bs0aedl8ecmbspn4kfpssumo3gbx6hmq','.eJytVWtvozgU_Su7fG5S3o9KK21CGkhC3k1Jshohgx1wIECMoSGj_vc1SdppR7Oj0Wq-YV_73HPvPcd85YoswCABQZCVKfWuqyQLcco9fOVyklUYItJ8Y8g9cGGWhQni7jiQ5-0gwYjduQQ0UdcETVck3ZBbMANESItKrNLgYBwUQ6eoEPnS2Gv-Hui0zW4X7StWWSASZCllSO0gO3CvDPtK5i1pWibJHdec874tvzH7xqm8MBEYDVmXRVXTRElWdIERM1g0AQX1bpVdMSCgyNtnOEXvsOhECfBYAFyyFwUDjCjNi4f7-xutN-IXtozsOf-d5TPA8rf2844rSv8nbUEHgBMWrwD2I1CBGKQp4LW_w2b_hnA541WI4B1uekVJiRhR6kWgiNhds3aLqApsz7Wz2TKfnkZjwwnZxRQcEIs_f8T-Y8YCOQ5oSdCH7iaR9OMK7sF9xwz1LBjZ1mmiFtH02DM97O0ei9Z-xdvmpLUvLUnt08WuGmxfWrZNepgeT_pfhaG2ApYtxBVKvR-RYcEdOOCkfos25DBg2hM0TZZVSZD4RhX524aqSfzr61WOnwWag6J4yUgzvD8FKT4DlPQ3gmPheTQnJhRdaNfDl50J8DYJfN1eLaerH8oSF15R5ohcU-xAUqBrvhvFhjMm7NZ_FHRB_FDOr0y4yUnBbveej22AgLK-vU37k1k4kRfVFi-1ROVJ0B9E5UGS25oibxv7MiCKbq9HgC4WutZ3AQHv_YoD5AUZRG_Carz8Igch8cyju7KdYR50tyaCtL-Y77eldDQ3IU-BkeysxUu-wLOZsAqHk4lxtO1tZgiw6u47aAadzRjgRR4-Ruqib4F9x14OaPxU6cXzIupNIqdUUset7TNzggt7Hp654zoM-4lTvDT8r2oHEBJGHjH6__zkHfqV5n5vnJzgAyD1dfn6hW1EWYre-9IsPpjtNhCaxSj9rDjm-gsT4f3J_EDsdp6rgWi0Ad95ijMzUIOT5baO03S1gnXfGGz941ldOJ2n_rAe03kF7bScazupu6fb4Sx9dInYial9SPDU1j1Nk4BstmziGFE01rZ7dyGPe2AwP-37zznqnDRv3e_nmzJ2YyuTB4q_IKNzzwrWhZNGU-jEY3O23Cxm0UbF2cgZESMJ-Wo0qZ8OJzzgn3MIN5JRB_AkWxG16kE278iTXdHxfIrGXRfywAw3ow7Ql51FZ9mf29ZaHOPlo-NA0lOs2iGTxyrh5cV6HfIir3K3PngFCgiiV_MwN2M2Wq9x-SchGxchS21FMZiQmRI8UNLIe584J3Cf9nwQMOwmAPcgDbN282oR7LebI-1btGiPmcaT7u3sJ4Db8wmBApEiQwOqvriTFegHiqIBQUZIUA3BF0UV8rKBZC1AoiwbvKJIMgpE5PO86muN57_7izcOLBqxPE6fhlV22ByDRAVleb6I-X_4Ml7G82nXfQSVqG9J6I67K3e0PJ99crK8wzBMz5E7IKMlAfwpxV4MV8SeTtZgR9wRf_LqoUYnQmSd4tx3h9451_WjMg-qznI9LC0nqad2S1s8HbpzapjP4d5Uy7n3HL6MdsN8H8utZ-bL5v1VBE3S-bYoK7xkfHl9_RdkuOhn:1w5h24:-3iSnywqofHW2tyo_Q8aXV1MNO0x63K5Xa_w8eRlwtg','2026-04-09 09:29:40.246111'),('hq7u111gyy0k2ai790p2y6na2jh25yxt','.eJxVT0luhDAQ_EufEaK9YDe35BtRhBovAwrBETa5jObvAcKFW3dtqnoCO5e2pfS8lTEsZXJcprT036GMyWfoPp7wf0MHObmJ58sBFXCBDo1RSgtlqNYNoUVZwc-aficf1t3ySOkxh127TUcCojDSSq2MQCS5P0gKXp8VnAX6LYe1P5UCbtjA7issB8HzfMD1VaM-NRed67fbjPfLdYsaOY9HDkZltKK9_UDGtDI2aL1xGEUb2BPSwFGTEi1xEyxH51AZTzqgtF4hvP4A3aBl9Q:1w5Q9H:YvhZog4coETtDbBLsdQpt62dwMbKmA12Sg54I8J5VXQ','2026-04-08 15:27:59.540775');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_site` (
  `id` int NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
-- Table structure for table `events_college`
--

DROP TABLE IF EXISTS `events_college`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events_college` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(200) NOT NULL,
  `profile_completed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events_college`
--

LOCK TABLES `events_college` WRITE;
/*!40000 ALTER TABLE `events_college` DISABLE KEYS */;
INSERT INTO `events_college` VALUES (1,'College','college1@gmail.com','pbkdf2_sha256$1000000$Nw1Aebq8oyzIE4NtT8tIO8$S47oXL9tuCzVt75iKl7L7j7p9FdEncGmDX4Rq5Zb7Ms=',1),(2,'College','Sonacollege@gmail.com','pbkdf2_sha256$1000000$eLy4WFExD94mPaQyrwLz2n$2boAmIb3b7Z8nofjCdUo8xm0PG8IXyi2gUrM8J6JYos=',1),(3,'College','vaibhavakanna182005@gmail.com','pbkdf2_sha256$1000000$JXmAup8Zn4kvO17wjqhTgx$+unIfjrJccprPRPJKM1QDZ5nm+BZUZWlLNdL0FoVtr0=',0);
/*!40000 ALTER TABLE `events_college` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events_event`
--

DROP TABLE IF EXISTS `events_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events_event` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `event_name` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `poster` varchar(100) NOT NULL,
  `event_type` varchar(50) NOT NULL,
  `registration_deadline` date NOT NULL,
  `location_link` varchar(200) NOT NULL,
  `registration_link` varchar(200) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `contact_details` varchar(200) NOT NULL,
  `college_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `events_event_college_id_4caa2c74_fk_events_college_id` (`college_id`),
  CONSTRAINT `events_event_college_id_4caa2c74_fk_events_college_id` FOREIGN KEY (`college_id`) REFERENCES `events_college` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events_event`
--

LOCK TABLES `events_event` WRITE;
/*!40000 ALTER TABLE `events_event` DISABLE KEYS */;
INSERT INTO `events_event` VALUES (1,'sports','sdfghjkl','event_posters/ChatGPT_Image_Mar_15_2026_03_32_35_PM.png','sports','2026-04-15','https://www.sonatech.ac.in','https://sonaevents.in/hackathon-registration','2026-03-15 10:14:08.319126','7894562312',1),(2,'erty','fghj','event_posters/ChatGPT_Image_Mar_15_2026_03_28_43_PM_pLe3vUC.png','hackathon','2026-03-19','',NULL,'2026-03-15 12:22:44.024850','',1),(3,'Krivas','qwertyuio','event_posters/ChatGPT_Image_Mar_15_2026_03_36_57_PM.png','cultural','2026-03-28','',NULL,'2026-03-24 04:39:51.694919','',1),(4,'Flutter App Development','Application Development','event_posters/WhatsApp_Image_2026-03-25_at_3.42.22_PM.jpeg','hackathon','2026-03-30','',NULL,'2026-03-25 18:36:17.849526','',2),(5,'Flutter App Development','xcvbnm,','event_posters/6978702_1.jpg','sports','2026-03-28','',NULL,'2026-03-26 04:45:14.688995','',2),(6,'Inter-College Football League','Compete with top college teams across Tamil Nadu.','event_posters/WhatsApp_Image_2026-03-25_at_3.51.46_PM.jpeg','sports','2026-04-17','',NULL,'2026-03-26 04:58:26.415110','',2),(7,'Smart India Mini Hack','Solve smart city challenges using IoT and data analytics.','event_posters/WhatsApp_Image_2026-03-25_at_3.51.34_PM.jpeg','hackathon','2026-04-10','',NULL,'2026-03-26 04:59:34.928178','',2),(8,'Drama & Theatre Fest','Showcase acting talents through stage performances.','event_posters/WhatsApp_Image_2026-03-25_at_3.50.15_PM.jpeg','cultural','2026-03-28','',NULL,'2026-03-26 05:00:42.102968','',2),(9,'Athletics Championship 2025','Track and field events including sprint, relay, and long jump.','event_posters/WhatsApp_Image_2026-03-25_at_3.50.17_PM.jpeg','sports','2026-04-11','',NULL,'2026-03-26 05:01:54.058435','',2),(10,'CodeStorm 24','24-hour coding marathon focused on fintech innovations.','event_posters/WhatsApp_Image_2026-03-25_at_3.39.38_PM.jpeg','hackathon','2026-05-01','',NULL,'2026-03-26 05:02:56.148619','',2),(11,'Dance Fiesta','Solo and group dance competitions with exciting prizes.','event_posters/WhatsApp_Image_2026-03-25_at_3.40.59_PM.jpeg','cultural','2026-06-13','',NULL,'2026-03-26 05:04:31.893430','',2),(12,'Flutter App Development','12 hrs hackathon','event_posters/WhatsApp_Image_2026-02-12_at_10.51.55_PM.jpeg','hackathon','2026-03-31','',NULL,'2026-03-26 15:52:32.596739','',2);
/*!40000 ALTER TABLE `events_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events_otpverification`
--

DROP TABLE IF EXISTS `events_otpverification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events_otpverification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `otp` varchar(6) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events_otpverification`
--

LOCK TABLES `events_otpverification` WRITE;
/*!40000 ALTER TABLE `events_otpverification` DISABLE KEYS */;
/*!40000 ALTER TABLE `events_otpverification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events_registration`
--

DROP TABLE IF EXISTS `events_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events_registration` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `registered_at` datetime(6) NOT NULL,
  `event_id` bigint NOT NULL,
  `student_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `events_registration_student_id_event_id_396bd389_uniq` (`student_id`,`event_id`),
  KEY `events_registration_event_id_75b6f198_fk_events_event_id` (`event_id`),
  CONSTRAINT `events_registration_event_id_75b6f198_fk_events_event_id` FOREIGN KEY (`event_id`) REFERENCES `events_event` (`id`),
  CONSTRAINT `events_registration_student_id_c42d5429_fk_events_student_id` FOREIGN KEY (`student_id`) REFERENCES `events_student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events_registration`
--

LOCK TABLES `events_registration` WRITE;
/*!40000 ALTER TABLE `events_registration` DISABLE KEYS */;
INSERT INTO `events_registration` VALUES (1,'2026-03-15 11:30:36.706316',1,1),(2,'2026-03-15 12:23:48.801006',2,1),(3,'2026-03-26 05:26:21.002294',10,7);
/*!40000 ALTER TABLE `events_registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events_savedevent`
--

DROP TABLE IF EXISTS `events_savedevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events_savedevent` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `event_id` bigint NOT NULL,
  `student_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `events_savedevent_event_id_8598796d_fk_events_event_id` (`event_id`),
  KEY `events_savedevent_student_id_dd97ccfb_fk_events_student_id` (`student_id`),
  CONSTRAINT `events_savedevent_event_id_8598796d_fk_events_event_id` FOREIGN KEY (`event_id`) REFERENCES `events_event` (`id`),
  CONSTRAINT `events_savedevent_student_id_dd97ccfb_fk_events_student_id` FOREIGN KEY (`student_id`) REFERENCES `events_student` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events_savedevent`
--

LOCK TABLES `events_savedevent` WRITE;
/*!40000 ALTER TABLE `events_savedevent` DISABLE KEYS */;
/*!40000 ALTER TABLE `events_savedevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events_student`
--

DROP TABLE IF EXISTS `events_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events_student` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(200) NOT NULL,
  `profile_completed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events_student`
--

LOCK TABLES `events_student` WRITE;
/*!40000 ALTER TABLE `events_student` DISABLE KEYS */;
INSERT INTO `events_student` VALUES (1,'Student','student1@gmail.com','pbkdf2_sha256$1000000$cec8izo67FL6S14gRZ0HPw$JFkKHMo43Q9NOxFrt6GMSWNTdVmEvH9m07lJRwl+YjQ=',1),(2,'Student','supree@gmail.com','pbkdf2_sha256$1000000$MtawLpT5HY8v3gMoqUtNWf$bAh/D6fiPPKgbBH91KfpTKy5wFDkhqXasEL0amDavHA=',0),(3,'Student','Vaibhav@gmail.com','pbkdf2_sha256$1000000$vA2TWGo8gF6ZwgkdJluMOP$tKi36jmNF0FdwA0gyQb18CRyleZJ/up/ifLTkQ7jGGo=',1),(4,'Student','vaibhav1@gmail.com','pbkdf2_sha256$1000000$Egb9ry0UsKz9udbu5q47pb$sOnNxy+0zlzU1cwlMM2IUE82Flkr0WindfWrnQ111nk=',0),(5,'Student','vaibhavakanna182005@gmail.com','pbkdf2_sha256$1000000$WFKcdVALTDEHYgV7Hny1xu$fnVR/RLAuBNfsxBOwcWqVnWiBgylAN98cLWJsGbBofo=',0),(6,'Student','vaibhavakanna.vk@gmail.com','pbkdf2_sha256$1000000$tnm53BTBlmgCSfyFQfX8lI$r/4R/AfFidZLFuHU4n2ZVoAo7JlKGMU1YFsJjTRmdfc=',1),(7,'Student','supreethaudayakumar@gmail.com','pbkdf2_sha256$1000000$Hj0cMk36xeOme3GNdkkDZC$7b8gfF22v3L2nk6HSDjUZTG8TcfWi9w6JzydYZxU0vc=',1),(8,'Student','sugumarans135@gmail.com','pbkdf2_sha256$1000000$73yZR8WmqG4g7BCgDu3kkK$tABWo616U0jB5TIcdZWcF7o0yjGg9xLm2bbt4OMg0bE=',0),(9,'Student','jusupreetha@gmail.com','pbkdf2_sha256$1000000$E0p7ePGA7PESb17lGsvcQF$jb+OdOe2XDw2YuMRdhFcONBgdXxSJvOannYlBfOSKhE=',0),(10,'Student','vishwa.sonatech@gmail.com','pbkdf2_sha256$1000000$jgYI3SCPm2HzOJMqQCfRiV$9ZgH/FHRTtwRA/XA8NGgY6PKNopaiyWgk6ZDWMWyXRY=',0);
/*!40000 ALTER TABLE `events_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events_websitefeedback`
--

DROP TABLE IF EXISTS `events_websitefeedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events_websitefeedback` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role` varchar(10) NOT NULL,
  `user_id` int NOT NULL,
  `rating` int NOT NULL,
  `message` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events_websitefeedback`
--

LOCK TABLES `events_websitefeedback` WRITE;
/*!40000 ALTER TABLE `events_websitefeedback` DISABLE KEYS */;
INSERT INTO `events_websitefeedback` VALUES (1,'student',3,4,'good','2026-03-25 18:29:47.246393'),(2,'college',1,4,'good','2026-03-26 06:42:39.158023');
/*!40000 ALTER TABLE `events_websitefeedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialaccount`
--

DROP TABLE IF EXISTS `socialaccount_socialaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialaccount` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(200) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `extra_data` json NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialaccount_provider_uid_fc810c6e_uniq` (`provider`,`uid`),
  KEY `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` (`user_id`),
  CONSTRAINT `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialaccount`
--

LOCK TABLES `socialaccount_socialaccount` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialaccount` DISABLE KEYS */;
INSERT INTO `socialaccount_socialaccount` VALUES (1,'google','112738354721193273194','2026-03-25 15:27:59.480801','2026-03-25 15:19:32.644391','{\"aud\": \"728717853894-doar1nsv2vncm9m598tes20u9j7bja8t.apps.googleusercontent.com\", \"azp\": \"728717853894-doar1nsv2vncm9m598tes20u9j7bja8t.apps.googleusercontent.com\", \"exp\": 1774456075, \"iat\": 1774452475, \"iss\": \"https://accounts.google.com\", \"sub\": \"112738354721193273194\", \"name\": \"Vaibhavakanna P\", \"email\": \"vaibhavakanna182005@gmail.com\", \"at_hash\": \"9yhp5itWz9Ewhk0D7spX_A\", \"picture\": \"https://lh3.googleusercontent.com/a/ACg8ocK-mo1TKhiwVu-mGMHKzfbJeB2Xrq2y47mHGd2JBPfrvVQy8T69=s96-c\", \"given_name\": \"Vaibhavakanna\", \"family_name\": \"P\", \"email_verified\": true}',2);
/*!40000 ALTER TABLE `socialaccount_socialaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp`
--

DROP TABLE IF EXISTS `socialaccount_socialapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialapp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL,
  `provider_id` varchar(200) NOT NULL,
  `settings` json NOT NULL DEFAULT (_utf8mb4'{}'),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp`
--

LOCK TABLES `socialaccount_socialapp` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp` DISABLE KEYS */;
INSERT INTO `socialaccount_socialapp` VALUES (1,'google','Google','728717853894-doar1nsv2vncm9m598tes20u9j7bja8t.apps.googleusercontent.com','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','','','{}');
/*!40000 ALTER TABLE `socialaccount_socialapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp_sites`
--

DROP TABLE IF EXISTS `socialaccount_socialapp_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialapp_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `socialapp_id` int NOT NULL,
  `site_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialapp_sites_socialapp_id_site_id_71a9a768_uniq` (`socialapp_id`,`site_id`),
  KEY `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` (`site_id`),
  CONSTRAINT `socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc` FOREIGN KEY (`socialapp_id`) REFERENCES `socialaccount_socialapp` (`id`),
  CONSTRAINT `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp_sites`
--

LOCK TABLES `socialaccount_socialapp_sites` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` DISABLE KEYS */;
INSERT INTO `socialaccount_socialapp_sites` VALUES (1,1,1);
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialtoken`
--

DROP TABLE IF EXISTS `socialaccount_socialtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialtoken` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `account_id` int NOT NULL,
  `app_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  KEY `socialaccount_social_account_id_951f210e_fk_socialacc` (`account_id`),
  CONSTRAINT `socialaccount_social_account_id_951f210e_fk_socialacc` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`),
  CONSTRAINT `socialaccount_social_app_id_636a42d7_fk_socialacc` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialtoken`
--

LOCK TABLES `socialaccount_socialtoken` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialtoken` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-26 22:45:25
