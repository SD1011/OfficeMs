CREATE DATABASE  IF NOT EXISTS `oms` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `oms`;
-- MySQL dump 10.13  Distrib 8.0.11, for Win64 (x86_64)
--
-- Host: localhost    Database: ecom
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `c1_file_reader`
--

DROP TABLE IF EXISTS `c1_file_reader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `c1_file_reader` (
  `card_no` int NOT NULL,
  `comp_id` int NOT NULL,
  `AttendanceDate` varchar(20) NOT NULL,
  `read_from_row` int DEFAULT NULL,
  `user_id_column` int DEFAULT NULL,
  `Intime_column` int DEFAULT NULL,
  `Outtime_column` int DEFAULT NULL,
  `sheet_number` int DEFAULT NULL,
  `active` enum('1','0') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c1_file_reader`
--

LOCK TABLES `c1_file_reader` WRITE;
/*!40000 ALTER TABLE `c1_file_reader` DISABLE KEYS */;
INSERT INTO `c1_file_reader` VALUES (101,1,'C2',3,2,4,5,NULL,'1');
/*!40000 ALTER TABLE `c1_file_reader` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comp_dept`
--

DROP TABLE IF EXISTS `comp_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `comp_dept` (
  `dep_id` int NOT NULL AUTO_INCREMENT,
  `comp_id` int NOT NULL,
  `department_name` varchar(45) NOT NULL,
  `active` enum('1','0') NOT NULL DEFAULT '0',
  `created_by` int NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`dep_id`),
  UNIQUE KEY `department-name` (`department_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comp_dept`
--

LOCK TABLES `comp_dept` WRITE;
/*!40000 ALTER TABLE `comp_dept` DISABLE KEYS */;
INSERT INTO `comp_dept` VALUES (1,1,'IT','1',1,'2020-04-28 00:01:03',1,'2020-04-28 00:01:03'),(2,2,'IT-avenue','1',1,'2020-04-28 00:01:03',1,'2020-04-28 00:01:03');
/*!40000 ALTER TABLE `comp_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `company` (
  `comp_id` int NOT NULL AUTO_INCREMENT,
  `compname` varchar(45) NOT NULL,
  `comp_add` varchar(45) NOT NULL,
  `comp_code` varchar(15) NOT NULL,
  `active` enum('1','0') NOT NULL DEFAULT '0',
  `created_by` int NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`comp_id`),
  UNIQUE KEY `compname` (`compname`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'demo company india pvt ltd','xyz st 1234 pune','DEMOI','1',1,'2020-04-19 16:22:05',1,'2020-04-19 16:22:05'),(2,'Avenue Products pvt ltd','XXXXXXXXXXX','AVENUEP','1',1,'2020-04-19 16:22:05',1,'2020-04-19 16:22:05');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_leave_types`
--

DROP TABLE IF EXISTS `company_leave_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `company_leave_types` (
  `leave_type_id` int NOT NULL AUTO_INCREMENT,
  `comp_id` int NOT NULL,
  `leave_type_name` varchar(20) NOT NULL,
  `active` enum('1','0') NOT NULL DEFAULT '0',
  `created_by` int NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`leave_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_leave_types`
--

LOCK TABLES `company_leave_types` WRITE;
/*!40000 ALTER TABLE `company_leave_types` DISABLE KEYS */;
INSERT INTO `company_leave_types` VALUES (1,1,'Earn Leave','1',1,'2020-05-01 19:08:54',1,'2020-05-01 19:08:54'),(2,1,'Casual Leave','1',1,'2020-05-01 19:08:54',1,'2020-05-01 19:08:54');
/*!40000 ALTER TABLE `company_leave_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_level`
--

DROP TABLE IF EXISTS `company_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `company_level` (
  `level_id` int NOT NULL AUTO_INCREMENT,
  `comp_id` int NOT NULL,
  `level_code` varchar(45) NOT NULL,
  `active` enum('1','0') NOT NULL DEFAULT '0',
  `created_by` int NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_level`
--

LOCK TABLES `company_level` WRITE;
/*!40000 ALTER TABLE `company_level` DISABLE KEYS */;
INSERT INTO `company_level` VALUES (1,1,'L1','1',1,'2020-04-28 00:01:03',1,'2020-04-28 00:01:03'),(2,1,'L2','1',1,'2020-04-28 00:01:03',1,'2020-04-28 00:01:03'),(3,1,'L3','1',1,'2020-04-28 00:01:03',1,'2020-04-28 00:01:03'),(4,1,'L4','1',1,'2020-04-28 00:01:03',1,'2020-04-28 00:01:03'),(5,2,'aL1','1',1,'2020-04-28 00:01:03',1,'2020-04-28 00:01:03'),(6,2,'aL2','1',1,'2020-04-28 00:01:03',1,'2020-04-28 00:01:03'),(7,2,'aL3','1',1,'2020-04-28 00:01:03',1,'2020-04-28 00:01:03'),(8,2,'al4','1',1,'2020-04-28 00:01:03',1,'2020-04-28 00:01:03');
/*!40000 ALTER TABLE `company_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_location`
--

DROP TABLE IF EXISTS `company_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `company_location` (
  `loc_id` int NOT NULL AUTO_INCREMENT,
  `comp_id` int NOT NULL,
  `loc_name` varchar(20) NOT NULL,
  `active` enum('1','0') NOT NULL DEFAULT '0',
  `created_by` int NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`loc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_location`
--

LOCK TABLES `company_location` WRITE;
/*!40000 ALTER TABLE `company_location` DISABLE KEYS */;
INSERT INTO `company_location` VALUES (1,1,'Pune','1',1,'2020-04-28 00:01:04',1,'2020-04-28 00:01:04'),(2,2,'ave-Pune','1',1,'2020-04-28 00:01:04',1,'2020-04-28 00:01:04');
/*!40000 ALTER TABLE `company_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_projects`
--

DROP TABLE IF EXISTS `company_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `company_projects` (
  `project_id` int NOT NULL AUTO_INCREMENT,
  `comp_id` int NOT NULL,
  `from_date` date DEFAULT '0000-00-00',
  `expected_date` date DEFAULT '0000-00-00',
  `end_date` date DEFAULT '0000-00-00',
  `project_name` longtext NOT NULL,
  `client_name` mediumtext,
  `client_details` longtext,
  `project_category` varchar(45) DEFAULT NULL,
  `project_description` longtext,
  `project_status` varchar(45) DEFAULT NULL,
  `created_by` int NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_projects`
--

LOCK TABLES `company_projects` WRITE;
/*!40000 ALTER TABLE `company_projects` DISABLE KEYS */;
INSERT INTO `company_projects` VALUES (1,1,'2020-01-01','2020-09-01','0000-00-00','company management system','Demo1 Pvt Ltd',NULL,NULL,'fefewgregergherkbjwgklrwbgkrbgkerbgkjerbggebgkierbgier\\n aefbksehfkishiwhgirhsig\\nfuehfiweif','Open',1,'2020-06-14 02:40:32',1,'2020-06-14 02:40:32'),(2,1,'2020-01-01','2020-09-01','0000-00-00','Student portal','Demo2 Pvt Ltd',NULL,NULL,NULL,'Open',1,'2020-06-14 02:41:31',1,'2020-06-14 02:41:31');
/*!40000 ALTER TABLE `company_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_shift`
--

DROP TABLE IF EXISTS `company_shift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `company_shift` (
  `shift_id` int NOT NULL AUTO_INCREMENT,
  `comp_id` int NOT NULL,
  `shift-total-hours` varchar(4) NOT NULL,
  `shift-working-hours` varchar(4) NOT NULL,
  `shift-name` varchar(10) NOT NULL,
  `shiftstart_time` time DEFAULT NULL,
  `shiftend_time` time DEFAULT NULL,
  `active` enum('1','0') NOT NULL DEFAULT '0',
  `created_by` int NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`shift_id`),
  UNIQUE KEY `shift-name` (`shift-name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_shift`
--

LOCK TABLES `company_shift` WRITE;
/*!40000 ALTER TABLE `company_shift` DISABLE KEYS */;
INSERT INTO `company_shift` VALUES (1,1,'9','9','demo-shift','09:30:00','18:30:00','1',1,'2020-04-28 00:01:03',1,'2020-04-28 00:01:03'),(2,2,'9','9','av-shift','09:30:00','18:30:00','1',1,'2020-04-28 00:01:03',1,'2020-04-28 00:01:03');
/*!40000 ALTER TABLE `company_shift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_teams`
--

DROP TABLE IF EXISTS `company_teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `company_teams` (
  `team_id` int NOT NULL AUTO_INCREMENT,
  `team_name` varchar(45) NOT NULL,
  `created_by` int NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active` enum('1','0') NOT NULL DEFAULT '0',
  PRIMARY KEY (`team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_teams`
--

LOCK TABLES `company_teams` WRITE;
/*!40000 ALTER TABLE `company_teams` DISABLE KEYS */;
INSERT INTO `company_teams` VALUES (1,'IT',7,'2020-07-12 02:02:22',0,'0000-00-00 00:00:00','1');
/*!40000 ALTER TABLE `company_teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employee` (
  `emp_id` int NOT NULL AUTO_INCREMENT,
  `comp_id` int NOT NULL,
  `ticket_number` varchar(45) NOT NULL,
  `title` varchar(5) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `middle_name` varchar(45) DEFAULT NULL,
  `sur_name` varchar(45) NOT NULL,
  `address1` varchar(200) NOT NULL,
  `address2` varchar(200) DEFAULT NULL,
  `contact_num` varchar(30) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(100) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `created_by` int NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`emp_id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (6,2,'A001','mr.','Steve','robin','jonas','xxxxy','','8208170425','steve@mail.com','$2b$10$kKrqRErrUE5/NIGZ.QrBku6H.bbQ2LwOc1bU.aJldHIeK9hqfOBOG','1996-11-10','Male','Y',1,'2020-02-22 17:16:08',1,'2020-02-22 17:16:08'),(7,1,'001','mr.','shubham','suhas','deshpande','xxxxy','','8208170425','demoemail@mail.com','$2b$10$kKrqRErrUE5/NIGZ.QrBku6H.bbQ2LwOc1bU.aJldHIeK9hqfOBOG','1996-11-10','Male','Y',1,'2020-04-30 23:49:39',1,'2020-04-30 23:49:39'),(9,1,'002','Mr.','Steve','Gunesh','jonas','xxxxy','','8208170425','approver@mail.com','$2b$10$kKrqRErrUE5/NIGZ.QrBku6H.bbQ2LwOc1bU.aJldHIeK9hqfOBOG','1996-11-10','Female','Y',1,'2020-05-04 01:08:31',1,'2020-05-04 01:08:31');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_applications`
--

DROP TABLE IF EXISTS `employee_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employee_applications` (
  `application_id` int NOT NULL AUTO_INCREMENT,
  `emp_id` int NOT NULL,
  `application_type_id` int DEFAULT NULL,
  `leave_type_id` int DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `from_time` time DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `to_time` time DEFAULT NULL,
  `number_of_days` varchar(5) DEFAULT NULL,
  `leave_availed_days` varchar(5) DEFAULT NULL,
  `credited_days` varchar(5) DEFAULT NULL,
  `application_remark` mediumtext NOT NULL,
  `od_details` mediumtext,
  `reporting_to` int NOT NULL,
  `status_id` int NOT NULL,
  `attendance_id` int DEFAULT NULL,
  `applied_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `applied_by` int NOT NULL DEFAULT '0',
  `approved_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `approved_by` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`application_id`),
  KEY `emp_id_idx` (`emp_id`),
  KEY `app_status_idx` (`status_id`),
  KEY `att_id_idx` (`attendance_id`),
  KEY `reporting_to_idx` (`reporting_to`),
  KEY `leave_type_idx` (`leave_type_id`),
  CONSTRAINT `app_status` FOREIGN KEY (`status_id`) REFERENCES `sys_static_applicationstatus` (`status_id`),
  CONSTRAINT `att_id` FOREIGN KEY (`attendance_id`) REFERENCES `employee_attendance` (`attendance_id`),
  CONSTRAINT `emp_id` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`),
  CONSTRAINT `leave_type` FOREIGN KEY (`leave_type_id`) REFERENCES `company_leave_types` (`leave_type_id`),
  CONSTRAINT `reporting_to` FOREIGN KEY (`reporting_to`) REFERENCES `employee` (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_applications`
--

LOCK TABLES `employee_applications` WRITE;
/*!40000 ALTER TABLE `employee_applications` DISABLE KEYS */;
INSERT INTO `employee_applications` VALUES (51,7,1,1,'2020-07-07','09:30:00','2020-07-10','18:30:00','4',NULL,NULL,'dawa',NULL,9,1,NULL,'2020-07-04 03:25:41',7,'0000-00-00 00:00:00',0),(52,7,1,2,'2020-08-17','09:30:00','2020-08-21','18:30:00','5',NULL,NULL,'faefse',NULL,9,1,NULL,'2020-07-04 03:26:01',7,'0000-00-00 00:00:00',0),(53,7,1,1,'2020-07-20','09:30:00','2020-07-24','18:30:00','5',NULL,NULL,'faf',NULL,9,1,NULL,'2020-07-04 03:26:27',7,'0000-00-00 00:00:00',0),(54,7,1,2,'2020-07-29','09:30:00','2020-07-29','18:30:00','1',NULL,NULL,'awfae',NULL,9,1,NULL,'2020-07-04 20:29:59',7,'0000-00-00 00:00:00',0),(55,7,1,1,'2020-07-30','09:30:00','2020-07-30','18:30:00','1',NULL,NULL,'afaef',NULL,9,1,NULL,'2020-07-04 20:32:06',7,'0000-00-00 00:00:00',0),(56,7,1,1,'2020-08-11','09:30:00','2020-08-11','18:30:00','1',NULL,NULL,'aefae',NULL,9,1,NULL,'2020-07-04 20:34:02',7,'0000-00-00 00:00:00',0),(57,7,1,1,'2020-08-31','09:30:00','2020-08-31','18:30:00','0.5',NULL,NULL,'wafwa',NULL,9,1,NULL,'2020-07-05 03:05:51',7,'0000-00-00 00:00:00',0),(58,7,2,NULL,'2020-08-10','09:30:00','2020-08-10','18:30:00',NULL,NULL,NULL,'aefe','fafe',9,1,NULL,'2020-07-07 18:41:46',7,'0000-00-00 00:00:00',0),(59,7,2,NULL,'2020-08-13','09:30:00','2020-08-13','18:30:00',NULL,NULL,NULL,'aefe','wafae',9,1,NULL,'2020-07-07 18:44:23',7,'0000-00-00 00:00:00',0),(60,7,2,NULL,NULL,'09:30:00',NULL,'18:30:00',NULL,NULL,NULL,'srgsr','srgs',9,1,NULL,'2020-07-07 18:49:43',7,'0000-00-00 00:00:00',0),(61,7,2,NULL,'2020-09-13','09:30:00','2020-09-13','18:30:00',NULL,NULL,NULL,'zdvd','sczdv',9,1,NULL,'2020-07-07 19:40:02',7,'0000-00-00 00:00:00',0),(62,7,2,NULL,'2020-06-15','09:30:00','2020-06-15','18:30:00',NULL,NULL,NULL,'aefae','aefae',9,1,NULL,'2020-07-07 19:42:06',7,'0000-00-00 00:00:00',0),(63,7,2,NULL,'2020-06-23','09:30:00','2020-06-23','18:30:00',NULL,NULL,NULL,'aefae','aefae',9,1,NULL,'2020-07-07 19:43:01',7,'0000-00-00 00:00:00',0);
/*!40000 ALTER TABLE `employee_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_attendance`
--

DROP TABLE IF EXISTS `employee_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employee_attendance` (
  `attendance_id` int NOT NULL AUTO_INCREMENT,
  `emp_id` int NOT NULL,
  `date_of_attendance` date DEFAULT NULL,
  `from_time` time DEFAULT NULL,
  `to_time` time DEFAULT NULL,
  `working_hours` varchar(5) DEFAULT '0',
  `att_status_id` int NOT NULL,
  `shift_id` int NOT NULL,
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`attendance_id`),
  KEY `employee_id_idx` (`emp_id`),
  CONSTRAINT `employee_id` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_attendance`
--

LOCK TABLES `employee_attendance` WRITE;
/*!40000 ALTER TABLE `employee_attendance` DISABLE KEYS */;
INSERT INTO `employee_attendance` VALUES (1,7,'2020-05-01','09:30:00','18:30:00','9',2,1,'2020-05-16 17:22:38',1,'2020-05-16 17:22:38'),(2,7,'2020-05-02','09:30:00','18:30:00','9',2,1,'2020-05-16 17:22:38',1,'2020-05-16 17:22:38'),(5,7,'2020-05-05','00:00:00','00:00:00',NULL,1,1,'2020-05-16 17:22:38',1,'2020-05-16 17:22:38'),(7,7,'2020-05-06','09:30:00','13:30:00','4',2,1,'2020-05-23 02:56:41',1,'2020-05-23 02:56:41'),(8,7,'2020-05-07','09:30:00','13:30:00','4',2,1,'2020-05-23 02:56:47',1,'2020-05-23 02:56:47'),(9,7,'2020-05-13','10:00:00','18:30:00','8.5',2,1,'2020-05-23 02:57:34',1,'2020-05-23 02:57:34');
/*!40000 ALTER TABLE `employee_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_irregular_attendance`
--

DROP TABLE IF EXISTS `employee_irregular_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employee_irregular_attendance` (
  `attendance_id` int NOT NULL,
  `irr_type_id` int DEFAULT NULL,
  `irr_from_time` time DEFAULT NULL,
  `irr_to_time` time DEFAULT NULL,
  `irr_hours` varchar(5) DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `attendance_id_idx` (`attendance_id`),
  KEY `status_idx` (`status_id`),
  KEY `irr_type_idx` (`irr_type_id`),
  CONSTRAINT `attendance_id` FOREIGN KEY (`attendance_id`) REFERENCES `employee_attendance` (`attendance_id`),
  CONSTRAINT `irr_type` FOREIGN KEY (`irr_type_id`) REFERENCES `sys_static_irregular_attendance_type` (`irr_type_id`),
  CONSTRAINT `status` FOREIGN KEY (`status_id`) REFERENCES `sys_static_applicationstatus` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_irregular_attendance`
--

LOCK TABLES `employee_irregular_attendance` WRITE;
/*!40000 ALTER TABLE `employee_irregular_attendance` DISABLE KEYS */;
INSERT INTO `employee_irregular_attendance` VALUES (5,1,'09:30:00','18:30:00','9',NULL,'2020-05-23 03:04:14',1,'2020-05-23 03:04:14'),(7,4,'13:30:00','18:30:00','4.5',NULL,'2020-05-23 03:04:15',1,'2020-05-23 03:04:15'),(8,4,'13:30:00','18:30:00','4.5',NULL,'2020-05-23 03:04:15',1,'2020-05-23 03:04:15'),(9,2,'09:30:00','10:00:00',NULL,NULL,'2020-05-23 03:04:15',1,'2020-05-23 03:04:15'),(9,3,'09:30:00','10:00:00',NULL,NULL,'2020-05-23 03:17:31',1,'2020-05-23 03:17:31');
/*!40000 ALTER TABLE `employee_irregular_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_leave_balance`
--

DROP TABLE IF EXISTS `employee_leave_balance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employee_leave_balance` (
  `emp_id` int NOT NULL,
  `leave_type_id` int NOT NULL,
  `active_from` date DEFAULT '0000-00-00',
  `active_to` date DEFAULT '0000-00-00',
  `first_opening_balance` varchar(10) NOT NULL DEFAULT '0',
  `credit_between` varchar(10) NOT NULL DEFAULT '0',
  `debited_between` varchar(10) NOT NULL DEFAULT '0',
  `lapse_leaves` varchar(10) NOT NULL DEFAULT '0',
  `taken_leaves` varchar(10) NOT NULL DEFAULT '0',
  `closing_balance` varchar(10) NOT NULL DEFAULT '0',
  `carryforwarded_balance` varchar(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_leave_balance`
--

LOCK TABLES `employee_leave_balance` WRITE;
/*!40000 ALTER TABLE `employee_leave_balance` DISABLE KEYS */;
INSERT INTO `employee_leave_balance` VALUES (7,2,'2020-01-10','0000-00-00','10','0','0','0','0','10','0'),(7,1,'2020-01-10','0000-00-00','14','0','0','0','0','14','0');
/*!40000 ALTER TABLE `employee_leave_balance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_menu`
--

DROP TABLE IF EXISTS `employee_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employee_menu` (
  `emp_id` int NOT NULL,
  `m_id` int DEFAULT NULL,
  `active_from` date DEFAULT '0000-00-00',
  `active_to` date DEFAULT '0000-00-00',
  `active` enum('1','0') NOT NULL DEFAULT '0',
  `created_by` int NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_menu`
--

LOCK TABLES `employee_menu` WRITE;
/*!40000 ALTER TABLE `employee_menu` DISABLE KEYS */;
INSERT INTO `employee_menu` VALUES (7,2,'2020-01-01','0000-00-00','1',1,'2020-06-06 17:11:29',1,'2020-06-06 17:11:29');
/*!40000 ALTER TABLE `employee_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_professional_data`
--

DROP TABLE IF EXISTS `employee_professional_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employee_professional_data` (
  `pd_id` int NOT NULL AUTO_INCREMENT,
  `emp_id` int NOT NULL,
  `joining_date` date DEFAULT '0000-00-00',
  `fnf_date` date DEFAULT '0000-00-00',
  `from_date` date DEFAULT '0000-00-00',
  `to_date` date DEFAULT '0000-00-00',
  `emp_status` int NOT NULL,
  `location` int NOT NULL,
  `department` int NOT NULL,
  `level` int NOT NULL,
  `job_title` varchar(100) NOT NULL,
  `w1` varchar(10) DEFAULT NULL,
  `w2` varchar(10) DEFAULT NULL,
  `w3` varchar(10) DEFAULT NULL,
  `active` enum('1','0') NOT NULL DEFAULT '0',
  `created_by` int NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`pd_id`),
  KEY `location_id_idx` (`location`),
  KEY `level_idx` (`level`),
  KEY `department_idx` (`department`),
  CONSTRAINT `department` FOREIGN KEY (`department`) REFERENCES `comp_dept` (`dep_id`),
  CONSTRAINT `level` FOREIGN KEY (`level`) REFERENCES `company_level` (`level_id`),
  CONSTRAINT `location_id` FOREIGN KEY (`location`) REFERENCES `company_location` (`loc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_professional_data`
--

LOCK TABLES `employee_professional_data` WRITE;
/*!40000 ALTER TABLE `employee_professional_data` DISABLE KEYS */;
INSERT INTO `employee_professional_data` VALUES (1,7,'2019-10-10','0000-00-00','2020-05-01','0000-00-00',1,1,1,4,'Software Developer','0',NULL,NULL,'1',1,'2020-04-28 00:02:11',1,'2020-04-28 00:02:11'),(2,6,'2019-01-10','0000-00-00','2019-10-01','0000-00-00',1,2,2,6,'Software Dev-node','0','6',NULL,'1',1,'2020-04-28 00:02:11',1,'2020-04-28 00:02:11'),(3,7,'2019-10-10','0000-00-00','2019-10-10','2020-04-30',1,1,1,4,'Software Developer','0','6',NULL,'1',1,'2020-05-01 00:04:10',1,'2020-05-01 00:04:10');
/*!40000 ALTER TABLE `employee_professional_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_projects`
--

DROP TABLE IF EXISTS `employee_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employee_projects` (
  `comp_id` int NOT NULL,
  `emp_id` int NOT NULL,
  `project_id` int DEFAULT NULL,
  `from_date` date DEFAULT '0000-00-00',
  `to_date` date DEFAULT '0000-00-00',
  `created_by` int NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_projects`
--

LOCK TABLES `employee_projects` WRITE;
/*!40000 ALTER TABLE `employee_projects` DISABLE KEYS */;
INSERT INTO `employee_projects` VALUES (1,7,1,'2020-01-01','0000-00-00',1,'2020-06-16 00:40:33',1,'2020-06-16 00:40:33'),(1,7,2,'2020-01-01','0000-00-00',1,'2020-06-16 00:40:40',1,'2020-06-16 00:40:40');
/*!40000 ALTER TABLE `employee_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_teams`
--

DROP TABLE IF EXISTS `employee_teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employee_teams` (
  `comp_id` int NOT NULL,
  `emp_id` int NOT NULL,
  `team_id` int NOT NULL,
  `from_date` date DEFAULT '0000-00-00',
  `to_date` date DEFAULT '0000-00-00',
  `created_by` int NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_teams`
--

LOCK TABLES `employee_teams` WRITE;
/*!40000 ALTER TABLE `employee_teams` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_worklist`
--

DROP TABLE IF EXISTS `employee_worklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employee_worklist` (
  `a_id` int NOT NULL AUTO_INCREMENT,
  `emp_id` int NOT NULL,
  `reporting_manager1` int NOT NULL,
  `reporting_manager2` int DEFAULT NULL,
  `from_date` date DEFAULT '0000-00-00',
  `to_date` date DEFAULT '0000-00-00',
  `project_id` int DEFAULT NULL,
  `subject` longtext NOT NULL,
  `list` longtext NOT NULL,
  `created_by` int NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_worklist`
--

LOCK TABLES `employee_worklist` WRITE;
/*!40000 ALTER TABLE `employee_worklist` DISABLE KEYS */;
INSERT INTO `employee_worklist` VALUES (1,7,9,NULL,'2020-06-01','2020-06-13',NULL,'my test list','1)hello shubham deshpande here \n2)test activity module \n3) list of my work \n',1,'2020-06-13 02:40:20',1,'2020-06-13 02:40:20'),(8,7,9,NULL,'2020-06-01','2020-06-10',2,'hello testing for poly cab project ','1) done with report\n2)afeafegfesg',7,'2020-06-24 19:51:35',7,'2020-06-24 19:51:35'),(9,7,9,NULL,'2020-06-01','2020-06-19',1,'test3','qwfqef',7,'2020-06-27 01:43:34',7,'2020-06-27 01:43:34'),(10,7,9,NULL,'2020-06-01','2020-06-26',2,'egsagsg','agsgsgr',7,'2020-06-27 01:44:04',7,'2020-06-27 01:44:04'),(11,7,9,NULL,'2020-06-01','2020-06-19',1,'xcjvhbj,kjk,','jhvkvgkgbkbgkbgmkgbjm',7,'2020-06-27 21:35:16',7,'2020-06-27 21:35:16');
/*!40000 ALTER TABLE `employee_worklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporting_manager`
--

DROP TABLE IF EXISTS `reporting_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reporting_manager` (
  `comp_id` int NOT NULL,
  `emp_id` int NOT NULL,
  `application_type_id` int NOT NULL,
  `manager_emp_id` int NOT NULL,
  `second_manager_emp_id` int DEFAULT NULL,
  `active_from` date DEFAULT '0000-00-00',
  `active_to` date DEFAULT '0000-00-00',
  `active` enum('1','0') NOT NULL DEFAULT '0',
  `created_by` int NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `application_type_idx` (`application_type_id`),
  KEY `employee_idx` (`emp_id`),
  KEY `manager_idx` (`manager_emp_id`),
  CONSTRAINT `application_type` FOREIGN KEY (`application_type_id`) REFERENCES `sys_applicationtypes` (`application_type_id`),
  CONSTRAINT `employee` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`),
  CONSTRAINT `manager` FOREIGN KEY (`manager_emp_id`) REFERENCES `employee` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporting_manager`
--

LOCK TABLES `reporting_manager` WRITE;
/*!40000 ALTER TABLE `reporting_manager` DISABLE KEYS */;
INSERT INTO `reporting_manager` VALUES (1,7,6,9,NULL,'2020-01-01','0000-00-00','1',1,'2020-05-04 03:36:56',1,'2020-05-04 03:36:56'),(1,7,1,9,NULL,'2020-01-01','0000-00-00','1',1,'2020-05-04 03:36:56',1,'2020-05-04 03:36:56'),(1,7,2,9,NULL,'2020-01-01','0000-00-00','1',1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00');
/*!40000 ALTER TABLE `reporting_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_applicationtypes`
--

DROP TABLE IF EXISTS `sys_applicationtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_applicationtypes` (
  `application_type_id` int NOT NULL AUTO_INCREMENT,
  `application_type_name` varchar(45) NOT NULL,
  `active` enum('1','0') NOT NULL DEFAULT '0',
  PRIMARY KEY (`application_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_applicationtypes`
--

LOCK TABLES `sys_applicationtypes` WRITE;
/*!40000 ALTER TABLE `sys_applicationtypes` DISABLE KEYS */;
INSERT INTO `sys_applicationtypes` VALUES (1,'leave','1'),(2,'onduty','1'),(3,'overtime','1'),(4,'compensatoryoff','1'),(5,'extrawork','1'),(6,'activity','1');
/*!40000 ALTER TABLE `sys_applicationtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dynamic_company_months`
--

DROP TABLE IF EXISTS `sys_dynamic_company_months`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_dynamic_company_months` (
  `comp_month_id` int NOT NULL AUTO_INCREMENT,
  `comp_id` int NOT NULL,
  `year` int NOT NULL,
  `month` int NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `active` enum('1','0') NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`comp_month_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dynamic_company_months`
--

LOCK TABLES `sys_dynamic_company_months` WRITE;
/*!40000 ALTER TABLE `sys_dynamic_company_months` DISABLE KEYS */;
INSERT INTO `sys_dynamic_company_months` VALUES (2,1,2020,4,'2020-05-01','2020-05-31','Open','1','2020-05-27 01:06:15','2020-05-27 01:06:15'),(3,1,2020,3,'2020-04-01','2020-04-30','Open','1','2020-05-27 20:02:35','2020-05-27 20:02:35'),(4,1,2020,2,'2020-03-01','2020-03-31','Open','1','2020-05-27 20:02:35','2020-05-27 20:02:35');
/*!40000 ALTER TABLE `sys_dynamic_company_months` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menus`
--

DROP TABLE IF EXISTS `sys_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_menus` (
  `m_id` int NOT NULL AUTO_INCREMENT,
  `menu_code` varchar(45) NOT NULL,
  `menu_description` longtext NOT NULL,
  `active` enum('1','0') NOT NULL DEFAULT '0',
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menus`
--

LOCK TABLES `sys_menus` WRITE;
/*!40000 ALTER TABLE `sys_menus` DISABLE KEYS */;
INSERT INTO `sys_menus` VALUES (7,'system_master','Complete access of website to create company and its users','1'),(8,'HR_Admin','Complete access to all HR activities and reports','1'),(9,'HR_team','limited access of HR activities , can be customize','1'),(10,'reporting_manager','access to take action against employee application','1'),(11,'team_leader','Team Leader','1'),(12,'team_member','Team member','1');
/*!40000 ALTER TABLE `sys_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_static_applicationstatus`
--

DROP TABLE IF EXISTS `sys_static_applicationstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_static_applicationstatus` (
  `status_id` int NOT NULL AUTO_INCREMENT,
  `application_status_name` varchar(45) NOT NULL,
  `active` enum('1','0') NOT NULL DEFAULT '0',
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_static_applicationstatus`
--

LOCK TABLES `sys_static_applicationstatus` WRITE;
/*!40000 ALTER TABLE `sys_static_applicationstatus` DISABLE KEYS */;
INSERT INTO `sys_static_applicationstatus` VALUES (1,'applied','1'),(2,'approved','1'),(3,'rejected','1'),(4,'cancelled','1'),(5,'reverse','1');
/*!40000 ALTER TABLE `sys_static_applicationstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_static_attendance_status`
--

DROP TABLE IF EXISTS `sys_static_attendance_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_static_attendance_status` (
  `att_status_id` int NOT NULL AUTO_INCREMENT,
  `attendance_status_name` varchar(45) NOT NULL,
  `active` enum('1','0') NOT NULL DEFAULT '0',
  PRIMARY KEY (`att_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_static_attendance_status`
--

LOCK TABLES `sys_static_attendance_status` WRITE;
/*!40000 ALTER TABLE `sys_static_attendance_status` DISABLE KEYS */;
INSERT INTO `sys_static_attendance_status` VALUES (1,'Absent','1'),(2,'Present','1');
/*!40000 ALTER TABLE `sys_static_attendance_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_static_irregular_attendance_type`
--

DROP TABLE IF EXISTS `sys_static_irregular_attendance_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_static_irregular_attendance_type` (
  `irr_type_id` int NOT NULL AUTO_INCREMENT,
  `irr_type_name` varchar(45) NOT NULL,
  `active` enum('1','0') NOT NULL DEFAULT '0',
  PRIMARY KEY (`irr_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_static_irregular_attendance_type`
--

LOCK TABLES `sys_static_irregular_attendance_type` WRITE;
/*!40000 ALTER TABLE `sys_static_irregular_attendance_type` DISABLE KEYS */;
INSERT INTO `sys_static_irregular_attendance_type` VALUES (1,'Absent','1'),(2,'Late_in','1'),(3,'Early_Out','1'),(4,'less_work_hours','1'),(5,'Out_of_shift','1'),(6,'Extra_work','1'),(7,'present_weeklyoff','1'),(8,'present_Holiday','1');
/*!40000 ALTER TABLE `sys_static_irregular_attendance_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temp_filedata`
--

DROP TABLE IF EXISTS `temp_filedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `temp_filedata` (
  `AttendanceDate` date DEFAULT NULL,
  `comp_user_id` int DEFAULT NULL,
  `InTime` time DEFAULT NULL,
  `OutTime` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temp_filedata`
--
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-14  2:03:44
