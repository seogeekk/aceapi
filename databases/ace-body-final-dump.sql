-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: acebody
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu0.17.10.1

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
-- Current Database: `acebody`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `acebody` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `acebody`;

--
-- Table structure for table `aceconfig`
--

DROP TABLE IF EXISTS `aceconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aceconfig` (
  `groupid` int(11) DEFAULT NULL,
  `ordinal` int(11) DEFAULT NULL,
  `integer` int(11) DEFAULT NULL,
  `float` float(9,2) DEFAULT NULL,
  `shortdesc` varchar(20) DEFAULT NULL,
  `longdesc` varchar(150) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `auditwho` varchar(16) DEFAULT NULL,
  `auditwhen` datetime DEFAULT CURRENT_TIMESTAMP,
  KEY `groupconfigfk_idx` (`groupid`),
  CONSTRAINT `acegroupconfigfk` FOREIGN KEY (`groupid`) REFERENCES `aceconfig_group` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aceconfig`
--

LOCK TABLES `aceconfig` WRITE;
/*!40000 ALTER TABLE `aceconfig` DISABLE KEYS */;
INSERT INTO `aceconfig` VALUES (1,1,NULL,NULL,'Admin',NULL,NULL,'root','2018-04-27 23:15:19'),(1,2,NULL,NULL,'Manager',NULL,NULL,'root','2018-04-27 23:15:19'),(1,3,NULL,NULL,'Staff',NULL,NULL,'root','2018-04-27 23:15:19'),(1,4,NULL,NULL,'Customer',NULL,NULL,'root','2018-04-27 23:15:19'),(1,5,NULL,NULL,'External',NULL,NULL,'root','2018-04-27 23:15:19'),(2,1,NULL,NULL,'Open',NULL,NULL,'root','2018-04-27 23:15:19'),(2,2,NULL,NULL,'Active',NULL,NULL,'root','2018-04-27 23:15:19'),(2,3,NULL,NULL,'Locked',NULL,NULL,'root','2018-04-27 23:15:19'),(3,1,NULL,NULL,'Inquiry',NULL,NULL,'root','2018-04-27 23:15:19'),(3,2,NULL,NULL,'Complaint',NULL,NULL,'root','2018-04-27 23:15:19'),(3,3,NULL,NULL,'Request',NULL,NULL,'root','2018-04-27 23:15:19'),(3,4,NULL,NULL,'Maintenance',NULL,NULL,'root','2018-04-27 23:15:19'),(4,1,NULL,NULL,NULL,'Open',NULL,'root','2018-04-27 23:15:19'),(4,2,NULL,NULL,NULL,'Assigned',NULL,'root','2018-04-27 23:15:19'),(4,3,NULL,NULL,NULL,'In Review',NULL,'root','2018-04-27 23:15:19'),(4,4,NULL,NULL,NULL,'For Approval',NULL,'root','2018-04-27 23:15:19'),(4,5,NULL,NULL,NULL,'Approved',NULL,'root','2018-04-27 23:15:19'),(4,6,NULL,NULL,NULL,'Schedule for Action',NULL,'root','2018-04-27 23:15:20'),(4,7,NULL,NULL,NULL,'Closed',NULL,'root','2018-04-27 23:15:20'),(4,8,NULL,NULL,NULL,'Rejected',NULL,'root','2018-04-27 23:15:20'),(4,9,NULL,NULL,NULL,'Cancelled',NULL,'root','2018-04-27 23:15:20'),(5,1,NULL,NULL,'LOGIN','User login',NULL,'root','2018-04-27 23:15:20'),(5,2,NULL,NULL,'LOGOUT','User logout',NULL,'root','2018-04-27 23:15:20'),(6,1,NULL,NULL,NULL,'Home Owner',NULL,'root','2018-04-27 23:15:20'),(6,2,NULL,NULL,NULL,'Body Corporate',NULL,'root','2018-04-27 23:15:20'),(6,3,NULL,NULL,NULL,'Tenant',NULL,'root','2018-04-27 23:15:20'),(6,4,NULL,NULL,NULL,'Property Manager',NULL,'root','2018-04-27 23:15:20'),(7,1,NULL,NULL,NULL,'Relationship Management',NULL,'root','2018-04-27 23:15:20'),(7,2,NULL,NULL,NULL,'Insurance',NULL,'root','2018-04-27 23:15:20'),(7,3,NULL,NULL,NULL,'Legal',NULL,'root','2018-04-27 23:15:20'),(7,4,NULL,NULL,NULL,'Marketing',NULL,'root','2018-04-27 23:15:20'),(8,1,NULL,NULL,NULL,'Staff',NULL,'root','2018-04-27 23:15:20'),(8,2,NULL,NULL,NULL,'Manager',NULL,'root','2018-04-27 23:15:20'),(8,3,NULL,NULL,NULL,'Approver',NULL,'root','2018-04-27 23:15:20'),(8,4,NULL,NULL,NULL,'Head',NULL,'root','2018-04-27 23:15:21'),(9,1,NULL,NULL,NULL,'House',NULL,'root','2018-04-27 23:15:21'),(9,2,NULL,NULL,NULL,'Unit - Apartment',NULL,'root','2018-04-27 23:15:21'),(9,3,NULL,NULL,NULL,'Commercial',NULL,'root','2018-04-27 23:15:21'),(9,4,NULL,NULL,NULL,'Strata Property',NULL,'root','2018-04-27 23:15:21'),(9,5,NULL,NULL,NULL,'Others',NULL,'root','2018-04-27 23:15:21'),(10,1,NULL,NULL,'jpg',NULL,NULL,'root','2018-04-27 23:15:21'),(10,2,NULL,NULL,'pdf',NULL,NULL,'root','2018-04-27 23:15:21'),(10,3,NULL,NULL,'doc',NULL,NULL,'root','2018-04-27 23:15:21'),(11,1,NULL,NULL,NULL,'Work Log Details',NULL,'root','2018-04-27 23:15:21'),(11,2,NULL,NULL,NULL,'Inspection',NULL,'root','2018-04-27 23:15:21'),(11,3,NULL,NULL,NULL,'Service Log',NULL,'root','2018-04-27 23:15:21'),(12,1,NULL,NULL,NULL,'No Response',NULL,'root','2018-04-27 23:15:21'),(12,2,NULL,NULL,NULL,'Accepted',NULL,'root','2018-04-27 23:15:21'),(12,3,NULL,NULL,NULL,'Re-scheduled',NULL,'root','2018-04-27 23:15:21'),(12,4,NULL,NULL,NULL,'Cancelled',NULL,'root','2018-04-27 23:15:21');
/*!40000 ALTER TABLE `aceconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aceconfig_group`
--

DROP TABLE IF EXISTS `aceconfig_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aceconfig_group` (
  `groupid` int(11) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `lockflag` enum('1','0') DEFAULT NULL,
  `auditwho` varchar(16) DEFAULT NULL,
  `auditwhen` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aceconfig_group`
--

LOCK TABLES `aceconfig_group` WRITE;
/*!40000 ALTER TABLE `aceconfig_group` DISABLE KEYS */;
INSERT INTO `aceconfig_group` VALUES (1,'User Roles','0','root','2018-04-27 23:15:19'),(2,'Account Status','0','root','2018-04-27 23:15:19'),(3,'Claim Type','0','root','2018-04-27 23:15:19'),(4,'Claim Status','0','root','2018-04-27 23:15:19'),(5,'Login - Action Types','0','root','2018-04-27 23:15:20'),(6,'Customer Type','0','root','2018-04-27 23:15:20'),(7,'Staff Department','0','root','2018-04-27 23:15:20'),(8,'Staff Access Type','0','root','2018-04-27 23:15:20'),(9,'Property Type','0','root','2018-04-27 23:15:21'),(10,'Attachment Type','0','root','2018-04-27 23:15:21'),(11,'Work Type','0','root','2018-04-27 23:15:21'),(12,'Inspection Reponse Type','0','root','2018-04-27 23:15:21');
/*!40000 ALTER TABLE `aceconfig_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignhistory`
--

DROP TABLE IF EXISTS `assignhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignhistory` (
  `historyid` int(11) NOT NULL AUTO_INCREMENT,
  `claimid` float(9,2) DEFAULT NULL,
  `action` int(11) DEFAULT NULL,
  `username` varchar(16) DEFAULT NULL,
  `auditwho` varchar(16) DEFAULT NULL,
  `auditwhen` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`historyid`),
  KEY `claimassignfk_idx` (`claimid`),
  KEY `userassignfk_idx` (`username`),
  CONSTRAINT `claimassignfk` FOREIGN KEY (`claimid`) REFERENCES `claim` (`claimid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `userassignfk` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignhistory`
--

LOCK TABLES `assignhistory` WRITE;
/*!40000 ALTER TABLE `assignhistory` DISABLE KEYS */;
INSERT INTO `assignhistory` VALUES (1,1002.00,NULL,'jacky.chang','jacky.chang','2018-04-28 16:12:38'),(2,1000.00,NULL,'amber.sheppard','tina.chung','2018-04-28 00:35:56'),(3,1001.00,NULL,'tina.chung','tina.chung','2018-04-28 00:36:16'),(4,1003.00,NULL,'tina.chung','tina.chung','2018-04-24 13:38:07'),(5,1006.00,NULL,'tina.chung','tina.chung','2018-04-24 13:50:38'),(6,1007.00,NULL,'tina.chung','tina.chung','2018-04-28 00:41:00'),(7,1004.00,NULL,'amber.sheppard','amber.sheppard','2018-04-28 00:41:55'),(8,1009.00,NULL,'amber.sheppard','amber.sheppard','2018-04-24 13:42:17'),(9,1004.00,NULL,'jacky.chang','jacky.chang','2018-04-27 15:10:22');
/*!40000 ALTER TABLE `assignhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachment`
--

DROP TABLE IF EXISTS `attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachment` (
  `itemid` int(11) NOT NULL AUTO_INCREMENT,
  `attachment` varchar(200) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `auditwho` varchar(16) DEFAULT NULL,
  `auditwhen` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`itemid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachment`
--

LOCK TABLES `attachment` WRITE;
/*!40000 ALTER TABLE `attachment` DISABLE KEYS */;
INSERT INTO `attachment` VALUES (1,'attachment-20180427-151221.pdf',NULL,'jacky.chang','2018-04-27 15:12:21');
/*!40000 ALTER TABLE `attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit`
--

DROP TABLE IF EXISTS `audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit` (
  `auditid` int(11) NOT NULL AUTO_INCREMENT,
  `referenceid` varchar(20) DEFAULT NULL,
  `auditkey` int(11) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  `auditwho` varchar(16) DEFAULT NULL,
  `auditwhen` datetime DEFAULT NULL,
  PRIMARY KEY (`auditid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit`
--

LOCK TABLES `audit` WRITE;
/*!40000 ALTER TABLE `audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claim`
--

DROP TABLE IF EXISTS `claim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claim` (
  `claimid` float(9,2) NOT NULL AUTO_INCREMENT,
  `property_canonical_id` varchar(50) NOT NULL,
  `claimtypeid` int(11) NOT NULL,
  `summary` varchar(150) DEFAULT NULL,
  `description` text,
  `submitteddate` datetime DEFAULT CURRENT_TIMESTAMP,
  `submitteduser` varchar(16) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `approvaldate` datetime DEFAULT NULL,
  `approveruser` varchar(16) DEFAULT NULL,
  `auditwho` varchar(16) NOT NULL,
  PRIMARY KEY (`claimid`),
  UNIQUE KEY `claimid_UNIQUE` (`claimid`),
  KEY `userclaimfk_idx` (`submitteduser`),
  KEY `propertyclaimfk_idx` (`property_canonical_id`),
  KEY `submituserfk_idx` (`auditwho`),
  CONSTRAINT `propertyclaimfk` FOREIGN KEY (`property_canonical_id`) REFERENCES `property` (`property_canonical_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `submituserfk` FOREIGN KEY (`auditwho`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `userclaimfk` FOREIGN KEY (`submitteduser`) REFERENCES `user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=1010 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claim`
--

LOCK TABLES `claim` WRITE;
/*!40000 ALTER TABLE `claim` DISABLE KEYS */;
INSERT INTO `claim` VALUES (1000.00,'64acda72-3d2f-4cde-bdbb-d8f6f4f6cd34',3,'Strata Property Report','Can I request for a strata property report for 2018?','2018-04-24 13:05:25','csotto',2,NULL,NULL,'csotto'),(1001.00,'449ee81a-e973-47ad-ba71-c83468bf0758',4,'Pipe leaking from next door','Water flowing into our living room from a possible pipe leak from next door unit','2018-04-24 13:08:21','csotto',3,NULL,NULL,'csotto'),(1002.00,'b8c563e1-d77f-45ff-879c-afdbde123057',2,'Building heater is not working','Heater is not working. It\'s nearly winter! We\'re going to freeze to death','2018-04-24 13:11:16','miles',7,'2018-04-28 00:16:39','jacky.chang','miles'),(1003.00,'b8c563e1-d77f-45ff-879c-afdbde123057',1,'When will we get a new security locks','We need new security locks','2018-04-24 13:19:06','miles',7,NULL,NULL,'miles'),(1004.00,'93171da5-002c-4c49-a410-d011f9e75e4e',3,'Requesting new Strata guidelines for 208','I just recently moved and I want to read a copy of our strata property guidelines. Can you please send me one?','2018-03-15 00:21:31','heyzel',7,NULL,NULL,'heyzel'),(1005.00,'fd32a6ff-e98b-44fd-95ab-378672d7da4b',4,'Trash area is stinking','Our trash area is not properly cleaned. Can you get it sorted out?','2018-04-24 13:23:45','karezb',1,NULL,NULL,'karezb'),(1006.00,'fd32a6ff-e98b-44fd-95ab-378672d7da4b',1,'Do you guys cover fix for bathroom leaking pipes?','Our bathroom pipes are leaking. Is this covered strata fees?','2018-04-24 13:25:34','karezb',8,NULL,NULL,'karezb'),(1007.00,'fd32a6ff-e98b-44fd-95ab-378672d7da4b',3,'Corridor light is burnt out','Can you get it replaced? Hard to see at night.','2018-04-24 13:26:35','karezb',3,NULL,NULL,'karezb'),(1008.00,'11035157-b1e4-42f7-850e-6d68b1d790bd',2,'Lift unavailable','Lift is unavailable for days. This is so annoying!','2018-04-24 13:29:54','guy1',1,NULL,NULL,'guy1'),(1009.00,'4bcbd52a-dca6-4d11-9a88-273b3112fc11',3,'When can we have a building gym','We\'re paying a lot of strata fees and not getting any project done','2018-04-24 13:33:21','kitty',7,NULL,NULL,'kitty');
/*!40000 ALTER TABLE `claim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `claimassigndetails`
--

DROP TABLE IF EXISTS `claimassigndetails`;
/*!50001 DROP VIEW IF EXISTS `claimassigndetails`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `claimassigndetails` AS SELECT 
 1 AS `claimid`,
 1 AS `assignusername`,
 1 AS `assignname`,
 1 AS `auditwhen`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `claimdetails`
--

DROP TABLE IF EXISTS `claimdetails`;
/*!50001 DROP VIEW IF EXISTS `claimdetails`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `claimdetails` AS SELECT 
 1 AS `claimid`,
 1 AS `propertyid`,
 1 AS `property_canonical_id`,
 1 AS `address1`,
 1 AS `address2`,
 1 AS `suburb`,
 1 AS `state`,
 1 AS `postcode`,
 1 AS `country`,
 1 AS `propertytypeid`,
 1 AS `propertytypename`,
 1 AS `latitude`,
 1 AS `longitude`,
 1 AS `mesh_block`,
 1 AS `unit_type`,
 1 AS `claimtypeid`,
 1 AS `claimtypename`,
 1 AS `summary`,
 1 AS `description`,
 1 AS `submitteddate`,
 1 AS `submitteduser`,
 1 AS `submittedname`,
 1 AS `status`,
 1 AS `statusname`,
 1 AS `approvaldate`,
 1 AS `approveruser`,
 1 AS `auditwho`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `claimdurationstat`
--

DROP TABLE IF EXISTS `claimdurationstat`;
/*!50001 DROP VIEW IF EXISTS `claimdurationstat`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `claimdurationstat` AS SELECT 
 1 AS `claimid`,
 1 AS `year`,
 1 AS `month`,
 1 AS `status`,
 1 AS `startdate`,
 1 AS `enddate`,
 1 AS `duration`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `correspondence`
--

DROP TABLE IF EXISTS `correspondence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `correspondence` (
  `corroid` int(11) NOT NULL AUTO_INCREMENT,
  `corrorefid` varchar(12) DEFAULT NULL,
  `corrotypeid` int(11) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `description` text,
  `createddate` datetime DEFAULT CURRENT_TIMESTAMP,
  `sentdate` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `auditwho` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`corroid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `correspondence`
--

LOCK TABLES `correspondence` WRITE;
/*!40000 ALTER TABLE `correspondence` DISABLE KEYS */;
/*!40000 ALTER TABLE `correspondence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custclass`
--

DROP TABLE IF EXISTS `custclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custclass` (
  `custclass` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `abn` varchar(15) DEFAULT NULL,
  `contactnumber` varchar(12) DEFAULT NULL,
  `address1` varchar(50) DEFAULT NULL,
  `address2` varchar(50) DEFAULT NULL,
  `suburb` varchar(25) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `postcode` int(11) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `auditwho` varchar(16) DEFAULT NULL,
  `auditwhen` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`custclass`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custclass`
--

LOCK TABLES `custclass` WRITE;
/*!40000 ALTER TABLE `custclass` DISABLE KEYS */;
/*!40000 ALTER TABLE `custclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `customerid` int(11) NOT NULL AUTO_INCREMENT,
  `customertypeid` int(11) DEFAULT NULL,
  `custclass` int(11) DEFAULT NULL,
  `username` varchar(16) NOT NULL,
  `customername` varchar(30) DEFAULT NULL,
  `address1` varchar(50) DEFAULT NULL,
  `address2` varchar(50) DEFAULT NULL,
  `suburb` varchar(25) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `postcode` int(11) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`customerid`),
  UNIQUE KEY `customeruser_ux` (`username`),
  KEY `usercustomerfk_idx` (`username`),
  KEY `custclassfk_idx` (`custclass`),
  CONSTRAINT `custclassfk` FOREIGN KEY (`custclass`) REFERENCES `custclass` (`custclass`),
  CONSTRAINT `usercustomerfk` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=1007 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1000,1,NULL,'karezb','Karez Bartolo','Unit 4','43-45 Neil Street','MERRYLANDS','NSW',2160,'AUSTRALIA'),(1001,2,NULL,'sureshsingh','Suresh Singh','24 Palmer Street',NULL,'BALMAIN','NSW',2041,'AUSTRALIA'),(1002,1,NULL,'guy1','Glenn Uy',NULL,NULL,NULL,NULL,NULL,'AUSTRALIA'),(1003,1,NULL,'csotto','Camille Sotto',NULL,NULL,NULL,NULL,NULL,'AUSTRALIA'),(1004,1,NULL,'miles','Miles Jones','30 Allen Street',NULL,'LEICHHARDT','NSW',2040,'AUSTRALIA'),(1005,3,NULL,'heyzel','Hazel Pineda',NULL,NULL,NULL,NULL,NULL,'AUSTRALIA'),(1006,1,NULL,'kitty','Kitty Nguyen',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerhistory`
--

DROP TABLE IF EXISTS `customerhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customerhistory` (
  `custhistoryid` int(11) NOT NULL AUTO_INCREMENT,
  `customerid` int(11) DEFAULT NULL,
  `customertype` int(11) DEFAULT NULL,
  `customername` varchar(30) DEFAULT NULL,
  `address1` varchar(50) DEFAULT NULL,
  `address2` varchar(50) DEFAULT NULL,
  `suburb` varchar(25) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `postcode` int(11) DEFAULT NULL,
  `country` int(11) DEFAULT NULL,
  `auditwho` varchar(16) DEFAULT NULL,
  `auditwhen` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`custhistoryid`),
  CONSTRAINT `custhistoryfk` FOREIGN KEY (`custhistoryid`) REFERENCES `customer` (`customerid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerhistory`
--

LOCK TABLES `customerhistory` WRITE;
/*!40000 ALTER TABLE `customerhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `customerhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `customerstat`
--

DROP TABLE IF EXISTS `customerstat`;
/*!50001 DROP VIEW IF EXISTS `customerstat`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `customerstat` AS SELECT 
 1 AS `username`,
 1 AS `year`,
 1 AS `month`,
 1 AS `requests`,
 1 AS `openrequests`,
 1 AS `completedrequests`,
 1 AS `cancelledrequests`,
 1 AS `allproperties`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `inspection`
--

DROP TABLE IF EXISTS `inspection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inspection` (
  `inspectionid` int(11) NOT NULL AUTO_INCREMENT,
  `workitemid` int(11) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `response` int(11) DEFAULT NULL,
  `submitteddate` datetime DEFAULT CURRENT_TIMESTAMP,
  `responsedate` datetime DEFAULT NULL,
  `inspectiondate` datetime NOT NULL,
  `auditwho` varchar(16) DEFAULT NULL,
  `auditwhen` datetime DEFAULT CURRENT_TIMESTAMP,
  `token` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`inspectionid`),
  KEY `workloginspectfk_idx` (`workitemid`),
  CONSTRAINT `workloginspectfk` FOREIGN KEY (`workitemid`) REFERENCES `workloghistory` (`workitemid`)
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inspection`
--

LOCK TABLES `inspection` WRITE;
/*!40000 ALTER TABLE `inspection` DISABLE KEYS */;
INSERT INTO `inspection` VALUES (1000,1000,'This is to inspect the building heater',1,'2018-04-24 13:12:24','2018-04-25 08:14:33','2018-04-26 10:00:00','jacky.chang','2018-04-23 13:12:24','30825189cc224814ffe08f56cf32c443125a3f57280f1d4f6151cc08f0f2eab9'),(1001,1003,'A pipe inspector will be coming to check if the leak is from your neighbour\'s pipe',NULL,'2018-04-28 00:37:33',NULL,'2018-04-28 12:00:00','tina.chung','2018-04-28 00:37:33','f490db8d3a0d0691ea94dc273ea0f0200dd543c8f3a4ac00cefe217f301825bf');
/*!40000 ALTER TABLE `inspection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `inspectiondetails`
--

DROP TABLE IF EXISTS `inspectiondetails`;
/*!50001 DROP VIEW IF EXISTS `inspectiondetails`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `inspectiondetails` AS SELECT 
 1 AS `inspectionid`,
 1 AS `valid`,
 1 AS `response`,
 1 AS `responsedate`,
 1 AS `inspectiondate`,
 1 AS `claimid`,
 1 AS `description`,
 1 AS `address1`,
 1 AS `address2`,
 1 AS `suburb`,
 1 AS `state`,
 1 AS `postcode`,
 1 AS `latitude`,
 1 AS `longitude`,
 1 AS `token`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `loginhistory`
--

DROP TABLE IF EXISTS `loginhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loginhistory` (
  `username` varchar(16) DEFAULT NULL,
  `actiontype` int(11) DEFAULT NULL,
  `eventdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ipaddress` varchar(32) DEFAULT NULL,
  `page` varchar(255) DEFAULT NULL,
  KEY `useridloginhistfk_idx` (`username`),
  CONSTRAINT `useridloginhistfk` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loginhistory`
--

LOCK TABLES `loginhistory` WRITE;
/*!40000 ALTER TABLE `loginhistory` DISABLE KEYS */;
INSERT INTO `loginhistory` VALUES ('aceadmin',1,'2018-04-27 23:04:10',NULL,'/api/v1/config/8'),('aceadmin',1,'2018-04-27 23:04:10',NULL,'/api/v1/staff/'),('aceadmin',1,'2018-04-27 23:04:10',NULL,'/api/v1/config/7'),('aceadmin',1,'2018-04-27 23:04:44',NULL,'/api/v1/config/8'),('aceadmin',1,'2018-04-27 23:04:44',NULL,'/api/v1/config/1'),('aceadmin',1,'2018-04-27 23:04:44',NULL,'/api/v1/config/7'),('aceadmin',1,'2018-04-27 23:04:44',NULL,'/api/v1/config/2'),('aceadmin',1,'2018-04-27 23:05:32',NULL,'/api/v1/config/8'),('aceadmin',1,'2018-04-27 23:05:32',NULL,'/api/v1/config/1'),('aceadmin',1,'2018-04-27 23:05:32',NULL,'/api/v1/config/7'),('aceadmin',1,'2018-04-27 23:05:32',NULL,'/api/v1/config/2'),('aceadmin',1,'2018-04-27 23:05:38',NULL,'/api/v1/staff/'),('aceadmin',1,'2018-04-27 23:05:38',NULL,'/api/v1/config/7'),('aceadmin',1,'2018-04-27 23:05:38',NULL,'/api/v1/config/8'),('aceadmin',1,'2018-04-27 23:05:39',NULL,'/api/v1/config/7'),('aceadmin',1,'2018-04-27 23:05:39',NULL,'/api/v1/config/8'),('aceadmin',1,'2018-04-27 23:05:39',NULL,'/api/v1/config/1'),('aceadmin',1,'2018-04-27 23:05:39',NULL,'/api/v1/config/2'),('aceadmin',1,'2018-04-27 23:05:45',NULL,'/api/v1/customer'),('aceadmin',1,'2018-04-27 23:05:45',NULL,'/api/v1/config/6'),('aceadmin',1,'2018-04-27 23:05:46',NULL,'/api/v1/config/6'),('aceadmin',1,'2018-04-27 23:05:47',NULL,'/api/v1/config/2'),('aceadmin',1,'2018-04-27 23:06:06',NULL,'/api/v1/config/6'),('aceadmin',1,'2018-04-27 23:06:06',NULL,'/api/v1/config/2'),('aceadmin',1,'2018-04-27 23:06:18',NULL,'/api/v1/config/6'),('aceadmin',1,'2018-04-27 23:06:18',NULL,'/api/v1/config/2'),('aceadmin',1,'2018-04-27 23:06:20',NULL,'/api/v1/property/'),('aceadmin',1,'2018-04-27 23:06:20',NULL,'/api/v1/config/9'),('aceadmin',1,'2018-04-27 23:06:21',NULL,'/api/v1/config/9'),('aceadmin',1,'2018-04-27 23:06:31',NULL,'/api/v1/customer'),('aceadmin',1,'2018-04-27 23:06:31',NULL,'/api/v1/config/6'),('aceadmin',1,'2018-04-27 23:06:33',NULL,'/api/v1/config/6'),('aceadmin',1,'2018-04-27 23:06:33',NULL,'/api/v1/config/2'),('aceadmin',1,'2018-04-27 23:06:34',NULL,'/api/v1/staff/'),('aceadmin',1,'2018-04-27 23:06:34',NULL,'/api/v1/config/7'),('aceadmin',1,'2018-04-27 23:06:34',NULL,'/api/v1/config/8'),('aceadmin',1,'2018-04-27 23:06:36',NULL,'/api/v1/config/7'),('aceadmin',1,'2018-04-27 23:06:36',NULL,'/api/v1/config/8'),('aceadmin',1,'2018-04-27 23:06:36',NULL,'/api/v1/config/2'),('aceadmin',1,'2018-04-27 23:06:36',NULL,'/api/v1/config/1'),('aceadmin',1,'2018-04-27 23:08:56',NULL,'/api/v1/config/7'),('aceadmin',1,'2018-04-27 23:08:56',NULL,'/api/v1/config/8'),('aceadmin',1,'2018-04-27 23:08:56',NULL,'/api/v1/config/1'),('aceadmin',1,'2018-04-27 23:08:56',NULL,'/api/v1/config/2'),('aceadmin',1,'2018-04-27 23:09:26',NULL,'/api/v1/config/7'),('aceadmin',1,'2018-04-27 23:09:26',NULL,'/api/v1/config/8'),('aceadmin',1,'2018-04-27 23:09:26',NULL,'/api/v1/config/2'),('aceadmin',1,'2018-04-27 23:09:26',NULL,'/api/v1/config/1'),('aceadmin',1,'2018-04-27 23:09:31',NULL,'/api/v1/config/8'),('aceadmin',1,'2018-04-27 23:09:31',NULL,'/api/v1/config/7'),('aceadmin',1,'2018-04-27 23:09:31',NULL,'/api/v1/staff/'),('aceadmin',1,'2018-04-27 23:09:32',NULL,'/api/v1/staff/aceadmin'),('aceadmin',1,'2018-04-27 23:09:32',NULL,'/api/v1/config/7'),('aceadmin',1,'2018-04-27 23:09:32',NULL,'/api/v1/config/8'),('aceadmin',1,'2018-04-27 23:09:32',NULL,'/api/v1/config/2'),('aceadmin',1,'2018-04-27 23:09:32',NULL,'/api/v1/config/1'),('aceadmin',1,'2018-04-27 23:09:32',NULL,'/api/v1/user/getstatus/aceadmin'),('aceadmin',1,'2018-04-27 23:09:32',NULL,'/api/v1/claim/staff/aceadmin'),('aceadmin',1,'2018-04-27 23:09:53',NULL,'/api/v1/staff/'),('aceadmin',1,'2018-04-27 23:09:53',NULL,'/api/v1/config/7'),('aceadmin',1,'2018-04-27 23:09:53',NULL,'/api/v1/config/8'),('aceadmin',1,'2018-04-27 23:09:53',NULL,'/api/v1/config/8'),('aceadmin',1,'2018-04-27 23:09:53',NULL,'/api/v1/config/7'),('aceadmin',1,'2018-04-27 23:09:53',NULL,'/api/v1/config/1'),('aceadmin',1,'2018-04-27 23:09:53',NULL,'/api/v1/config/2'),('aceadmin',1,'2018-04-27 23:10:13',NULL,'/api/v1/config/7'),('aceadmin',1,'2018-04-27 23:10:13',NULL,'/api/v1/config/2'),('aceadmin',1,'2018-04-27 23:10:13',NULL,'/api/v1/config/1'),('aceadmin',1,'2018-04-27 23:10:13',NULL,'/api/v1/config/8'),('aceadmin',1,'2018-04-27 23:10:17',NULL,'/api/v1/config/7'),('aceadmin',1,'2018-04-27 23:10:17',NULL,'/api/v1/config/8'),('aceadmin',1,'2018-04-27 23:10:17',NULL,'/api/v1/staff/'),('aceadmin',1,'2018-04-27 23:10:18',NULL,'/api/v1/config/7'),('aceadmin',1,'2018-04-27 23:10:18',NULL,'/api/v1/config/8'),('aceadmin',1,'2018-04-27 23:10:18',NULL,'/api/v1/config/1'),('aceadmin',1,'2018-04-27 23:10:18',NULL,'/api/v1/config/2'),('aceadmin',1,'2018-04-27 23:10:18',NULL,'/api/v1/staff/aceadmin'),('aceadmin',1,'2018-04-27 23:10:18',NULL,'/api/v1/user/getstatus/aceadmin'),('aceadmin',1,'2018-04-27 23:10:18',NULL,'/api/v1/claim/staff/aceadmin'),('aceadmin',1,'2018-04-27 23:10:21',NULL,'/api/v1/dashboard/staff/aceadmin'),('aceadmin',1,'2018-04-27 23:10:21',NULL,'/api/v1/dashboard/calendar/aceadmin'),('aceadmin',1,'2018-04-27 23:10:21',NULL,'/api/v1/dashboard/admin/'),('aceadmin',1,'2018-04-27 23:10:23',NULL,'/api/v1/staff/'),('aceadmin',1,'2018-04-27 23:10:23',NULL,'/api/v1/config/7'),('aceadmin',1,'2018-04-27 23:10:23',NULL,'/api/v1/config/8'),('aceadmin',1,'2018-04-27 23:10:24',NULL,'/api/v1/config/7'),('aceadmin',1,'2018-04-27 23:10:24',NULL,'/api/v1/config/8'),('aceadmin',1,'2018-04-27 23:10:24',NULL,'/api/v1/config/1'),('aceadmin',1,'2018-04-27 23:10:24',NULL,'/api/v1/config/2'),('aceadmin',1,'2018-04-27 23:11:16',NULL,'/api/v1/staff/amber.sheppard'),('aceadmin',1,'2018-04-27 23:11:16',NULL,'/api/v1/config/7'),('aceadmin',1,'2018-04-27 23:11:16',NULL,'/api/v1/config/2'),('aceadmin',1,'2018-04-27 23:11:16',NULL,'/api/v1/config/8'),('aceadmin',1,'2018-04-27 23:11:16',NULL,'/api/v1/config/1'),('aceadmin',1,'2018-04-27 23:11:16',NULL,'/api/v1/user/getstatus/amber.sheppard'),('aceadmin',1,'2018-04-27 23:11:16',NULL,'/api/v1/claim/staff/amber.sheppard'),('aceadmin',1,'2018-04-27 23:11:21',NULL,'/api/v1/user/changestatus'),('aceadmin',1,'2018-04-27 23:11:25',NULL,'/api/v1/dashboard/staff/aceadmin'),('aceadmin',1,'2018-04-27 23:11:25',NULL,'/api/v1/dashboard/calendar/aceadmin'),('aceadmin',1,'2018-04-27 23:11:25',NULL,'/api/v1/dashboard/admin/'),('aceadmin',1,'2018-04-27 23:11:26',NULL,'/api/v1/staff/'),('aceadmin',1,'2018-04-27 23:11:26',NULL,'/api/v1/config/7'),('aceadmin',1,'2018-04-27 23:11:26',NULL,'/api/v1/config/8'),('aceadmin',1,'2018-04-27 23:11:30',NULL,'/api/v1/config/7'),('aceadmin',1,'2018-04-27 23:11:30',NULL,'/api/v1/config/8'),('aceadmin',1,'2018-04-27 23:11:30',NULL,'/api/v1/config/1'),('aceadmin',1,'2018-04-27 23:11:30',NULL,'/api/v1/config/2'),('aceadmin',1,'2018-04-27 23:12:16',NULL,'/api/v1/staff/tina.chung'),('aceadmin',1,'2018-04-27 23:12:16',NULL,'/api/v1/config/7'),('aceadmin',1,'2018-04-27 23:12:16',NULL,'/api/v1/config/8'),('aceadmin',1,'2018-04-27 23:12:16',NULL,'/api/v1/config/2'),('aceadmin',1,'2018-04-27 23:12:16',NULL,'/api/v1/config/1'),('aceadmin',1,'2018-04-27 23:12:16',NULL,'/api/v1/user/getstatus/tina.chung'),('aceadmin',1,'2018-04-27 23:12:16',NULL,'/api/v1/claim/staff/tina.chung'),('aceadmin',1,'2018-04-27 23:12:31',NULL,'/api/v1/staff/'),('aceadmin',1,'2018-04-27 23:12:31',NULL,'/api/v1/config/7'),('aceadmin',1,'2018-04-27 23:12:31',NULL,'/api/v1/config/8'),('aceadmin',1,'2018-04-27 23:12:36',NULL,'/api/v1/config/7'),('aceadmin',1,'2018-04-27 23:12:36',NULL,'/api/v1/config/8'),('aceadmin',1,'2018-04-27 23:12:36',NULL,'/api/v1/config/2'),('aceadmin',1,'2018-04-27 23:12:36',NULL,'/api/v1/config/1'),('aceadmin',1,'2018-04-27 23:13:26',NULL,'/api/v1/config/7'),('aceadmin',1,'2018-04-27 23:13:26',NULL,'/api/v1/staff/shawn.xu'),('aceadmin',1,'2018-04-27 23:13:26',NULL,'/api/v1/config/8'),('aceadmin',1,'2018-04-27 23:13:26',NULL,'/api/v1/config/1'),('aceadmin',1,'2018-04-27 23:13:26',NULL,'/api/v1/config/2'),('aceadmin',1,'2018-04-27 23:13:26',NULL,'/api/v1/user/getstatus/shawn.xu'),('aceadmin',1,'2018-04-27 23:13:26',NULL,'/api/v1/claim/staff/shawn.xu'),('aceadmin',1,'2018-04-27 23:13:28',NULL,'/api/v1/config/7'),('aceadmin',1,'2018-04-27 23:13:28',NULL,'/api/v1/config/8'),('aceadmin',1,'2018-04-27 23:13:28',NULL,'/api/v1/staff/'),('aceadmin',1,'2018-04-27 23:13:30',NULL,'/api/v1/customer'),('aceadmin',1,'2018-04-27 23:13:30',NULL,'/api/v1/config/6'),('aceadmin',1,'2018-04-27 23:13:32',NULL,'/api/v1/config/6'),('aceadmin',1,'2018-04-27 23:13:32',NULL,'/api/v1/config/2'),('aceadmin',1,'2018-04-27 23:13:41',NULL,'/api/v1/address/search/?q=undefined'),('aceadmin',1,'2018-04-27 23:13:43',NULL,'/api/v1/address/search/?q=4'),('aceadmin',1,'2018-04-27 23:13:43',NULL,'/api/v1/address/search/?q=4.'),('aceadmin',1,'2018-04-27 23:13:43',NULL,'/api/v1/address/search/?q=4'),('aceadmin',1,'2018-04-27 23:13:43',NULL,'/api/v1/address/search/?q=4/4'),('aceadmin',1,'2018-04-27 23:13:44',NULL,'/api/v1/address/search/?q=4/4'),('aceadmin',1,'2018-04-27 23:13:44',NULL,'/api/v1/address/search/?q=4/4r'),('aceadmin',1,'2018-04-27 23:13:44',NULL,'/api/v1/address/search/?q=4/4'),('aceadmin',1,'2018-04-27 23:13:44',NULL,'/api/v1/address/search/?q=4/'),('aceadmin',1,'2018-04-27 23:13:45',NULL,'/api/v1/address/search/?q=4'),('aceadmin',1,'2018-04-27 23:13:45',NULL,'/api/v1/address/search/?q='),('aceadmin',1,'2018-04-27 23:13:45',NULL,'/api/v1/address/search/?q=U'),('aceadmin',1,'2018-04-27 23:13:45',NULL,'/api/v1/address/search/?q=U'),('aceadmin',1,'2018-04-27 23:13:45',NULL,'/api/v1/address/search/?q=Un'),('aceadmin',1,'2018-04-27 23:13:45',NULL,'/api/v1/address/search/?q=Unt'),('aceadmin',1,'2018-04-27 23:13:46',NULL,'/api/v1/address/search/?q=Unt'),('aceadmin',1,'2018-04-27 23:13:46',NULL,'/api/v1/address/search/?q=Unt%204'),('aceadmin',1,'2018-04-27 23:13:47',NULL,'/api/v1/address/search/?q=Unt%204'),('aceadmin',1,'2018-04-27 23:13:47',NULL,'/api/v1/address/search/?q=Unt%204%2043'),('aceadmin',1,'2018-04-27 23:13:48',NULL,'/api/v1/address/search/?q=Unt%204%2043'),('aceadmin',1,'2018-04-27 23:13:48',NULL,'/api/v1/address/search/?q=Unt%204%2043'),('aceadmin',1,'2018-04-27 23:13:48',NULL,'/api/v1/address/search/?q=Unt%204%2043%20N'),('aceadmin',1,'2018-04-27 23:13:48',NULL,'/api/v1/address/search/?q=Unt%204%2043%20Nei'),('aceadmin',1,'2018-04-27 23:13:48',NULL,'/api/v1/address/search/?q=Unt%204%2043%20N'),('aceadmin',1,'2018-04-27 23:13:48',NULL,'/api/v1/address/search/?q=Unt%204%2043%20Neil'),('aceadmin',1,'2018-04-27 23:13:48',NULL,'/api/v1/address/search/?q=Unt%204%2043%20Neil'),('aceadmin',1,'2018-04-27 23:13:48',NULL,'/api/v1/address/search/?q=Unt%204%2043%20Neil'),('aceadmin',1,'2018-04-27 23:13:49',NULL,'/api/v1/address/search/?q=Unt%204%2043%20Neil%20st'),('aceadmin',1,'2018-04-27 23:13:49',NULL,'/api/v1/address/search/?q=Unt%204%2043%20Neil%20st'),('aceadmin',1,'2018-04-27 23:13:59',NULL,'/api/v1/customer/karezb'),('aceadmin',1,'2018-04-27 23:13:59',NULL,'/api/v1/config/6'),('aceadmin',1,'2018-04-27 23:13:59',NULL,'/api/v1/config/2'),('aceadmin',1,'2018-04-27 23:13:59',NULL,'/api/v1/user/getstatus/karezb'),('aceadmin',1,'2018-04-27 23:13:59',NULL,'/api/v1/claim/user/karezb'),('aceadmin',1,'2018-04-27 23:14:02',NULL,'/api/v1/user/changestatus'),('aceadmin',1,'2018-04-27 23:14:04',NULL,'/api/v1/staff/'),('aceadmin',1,'2018-04-27 23:14:04',NULL,'/api/v1/config/8'),('aceadmin',1,'2018-04-27 23:14:04',NULL,'/api/v1/config/7'),('aceadmin',1,'2018-04-27 23:14:05',NULL,'/api/v1/config/7'),('aceadmin',1,'2018-04-27 23:14:05',NULL,'/api/v1/config/8'),('aceadmin',1,'2018-04-27 23:14:05',NULL,'/api/v1/staff/tina.chung'),('aceadmin',1,'2018-04-27 23:14:05',NULL,'/api/v1/config/1'),('aceadmin',1,'2018-04-27 23:14:05',NULL,'/api/v1/config/2'),('aceadmin',1,'2018-04-27 23:14:05',NULL,'/api/v1/user/getstatus/tina.chung'),('aceadmin',1,'2018-04-27 23:14:05',NULL,'/api/v1/claim/staff/tina.chung'),('aceadmin',1,'2018-04-27 23:14:07',NULL,'/api/v1/user/changestatus'),('aceadmin',1,'2018-04-27 23:14:08',NULL,'/api/v1/customer'),('aceadmin',1,'2018-04-27 23:14:08',NULL,'/api/v1/config/6'),('aceadmin',1,'2018-04-27 23:14:08',NULL,'/api/v1/staff/'),('aceadmin',1,'2018-04-27 23:14:08',NULL,'/api/v1/config/7'),('aceadmin',1,'2018-04-27 23:14:08',NULL,'/api/v1/config/8'),('aceadmin',1,'2018-04-27 23:14:09',NULL,'/api/v1/config/1'),('aceadmin',1,'2018-04-27 23:14:09',NULL,'/api/v1/config/2'),('aceadmin',1,'2018-04-27 23:14:09',NULL,'/api/v1/staff/shawn.xu'),('aceadmin',1,'2018-04-27 23:14:09',NULL,'/api/v1/config/7'),('aceadmin',1,'2018-04-27 23:14:09',NULL,'/api/v1/config/8'),('aceadmin',1,'2018-04-27 23:14:09',NULL,'/api/v1/user/getstatus/shawn.xu'),('aceadmin',1,'2018-04-27 23:14:09',NULL,'/api/v1/claim/staff/shawn.xu'),('aceadmin',1,'2018-04-27 23:14:15',NULL,'/api/v1/user/changestatus'),('aceadmin',1,'2018-04-27 23:14:30',NULL,'/api/v1/staff/'),('aceadmin',1,'2018-04-27 23:14:30',NULL,'/api/v1/config/7'),('aceadmin',1,'2018-04-27 23:14:30',NULL,'/api/v1/config/8'),('aceadmin',1,'2018-04-27 23:14:50',NULL,'/api/v1/staff/shawn.xu'),('aceadmin',1,'2018-04-27 23:14:50',NULL,'/api/v1/config/7'),('aceadmin',1,'2018-04-27 23:14:50',NULL,'/api/v1/config/8'),('aceadmin',1,'2018-04-27 23:14:50',NULL,'/api/v1/config/2'),('aceadmin',1,'2018-04-27 23:14:50',NULL,'/api/v1/config/1'),('aceadmin',1,'2018-04-27 23:14:50',NULL,'/api/v1/user/getstatus/shawn.xu'),('aceadmin',1,'2018-04-27 23:14:50',NULL,'/api/v1/claim/staff/shawn.xu'),('aceadmin',1,'2018-04-27 23:14:52',NULL,'/api/v1/config/7'),('aceadmin',1,'2018-04-27 23:14:52',NULL,'/api/v1/config/8'),('aceadmin',1,'2018-04-27 23:14:52',NULL,'/api/v1/staff/'),('aceadmin',1,'2018-04-27 23:15:23',NULL,'/api/v1/staff/shawn.xu'),('aceadmin',1,'2018-04-27 23:15:23',NULL,'/api/v1/config/7'),('aceadmin',1,'2018-04-27 23:15:23',NULL,'/api/v1/config/8'),('aceadmin',1,'2018-04-27 23:15:23',NULL,'/api/v1/config/1'),('aceadmin',1,'2018-04-27 23:15:23',NULL,'/api/v1/config/2'),('aceadmin',1,'2018-04-27 23:15:23',NULL,'/api/v1/user/getstatus/shawn.xu'),('aceadmin',1,'2018-04-27 23:15:23',NULL,'/api/v1/claim/staff/shawn.xu'),('aceadmin',1,'2018-04-27 23:15:26',NULL,'/api/v1/user/changestatus'),('aceadmin',1,'2018-04-27 23:15:28',NULL,'/api/v1/config/7'),('aceadmin',1,'2018-04-27 23:15:28',NULL,'/api/v1/config/8'),('aceadmin',1,'2018-04-27 23:15:28',NULL,'/api/v1/staff/'),('aceadmin',1,'2018-04-27 23:15:40',NULL,'/api/v1/staff/tina.chung'),('aceadmin',1,'2018-04-27 23:15:40',NULL,'/api/v1/config/7'),('aceadmin',1,'2018-04-27 23:15:40',NULL,'/api/v1/config/8'),('aceadmin',1,'2018-04-27 23:15:40',NULL,'/api/v1/config/2'),('aceadmin',1,'2018-04-27 23:15:40',NULL,'/api/v1/config/1'),('aceadmin',1,'2018-04-27 23:15:40',NULL,'/api/v1/user/getstatus/tina.chung'),('aceadmin',1,'2018-04-27 23:15:40',NULL,'/api/v1/claim/staff/tina.chung'),('aceadmin',1,'2018-04-27 23:15:48',NULL,'/api/v1/staff/'),('aceadmin',1,'2018-04-27 23:15:48',NULL,'/api/v1/config/7'),('aceadmin',1,'2018-04-27 23:15:48',NULL,'/api/v1/config/8'),('aceadmin',1,'2018-04-27 23:15:58',NULL,'/api/v1/config/7'),('aceadmin',1,'2018-04-27 23:15:58',NULL,'/api/v1/config/8'),('aceadmin',1,'2018-04-27 23:15:58',NULL,'/api/v1/config/1'),('aceadmin',1,'2018-04-27 23:15:58',NULL,'/api/v1/config/2'),('aceadmin',1,'2018-04-27 23:16:26',NULL,'/api/v1/staff/jacky.chang'),('aceadmin',1,'2018-04-27 23:16:26',NULL,'/api/v1/config/7'),('aceadmin',1,'2018-04-27 23:16:26',NULL,'/api/v1/config/8'),('aceadmin',1,'2018-04-27 23:16:26',NULL,'/api/v1/config/1'),('aceadmin',1,'2018-04-27 23:16:26',NULL,'/api/v1/config/2'),('aceadmin',1,'2018-04-27 23:16:26',NULL,'/api/v1/user/getstatus/jacky.chang'),('aceadmin',1,'2018-04-27 23:16:26',NULL,'/api/v1/claim/staff/jacky.chang'),('aceadmin',1,'2018-04-27 23:16:29',NULL,'/api/v1/user/changestatus'),('aceadmin',1,'2018-04-27 23:16:41',NULL,'/api/v1/customer'),('aceadmin',1,'2018-04-27 23:16:41',NULL,'/api/v1/config/6'),('aceadmin',1,'2018-04-27 23:16:45',NULL,'/api/v1/config/6'),('aceadmin',1,'2018-04-27 23:16:46',NULL,'/api/v1/customer/karezb'),('aceadmin',1,'2018-04-27 23:16:46',NULL,'/api/v1/config/2'),('aceadmin',1,'2018-04-27 23:16:46',NULL,'/api/v1/user/getstatus/karezb'),('aceadmin',1,'2018-04-27 23:16:46',NULL,'/api/v1/claim/user/karezb'),('aceadmin',1,'2018-04-27 23:21:56',NULL,'/api/v1/config/6'),('aceadmin',1,'2018-04-27 23:21:56',NULL,'/api/v1/config/7'),('aceadmin',1,'2018-04-27 23:21:56',NULL,'/api/v1/config/8'),('aceadmin',1,'2018-04-27 23:21:56',NULL,'/api/v1/staff/aceadmin'),('aceadmin',1,'2018-04-27 23:22:29',NULL,'/api/v1/dashboard/user/karezb'),('aceadmin',1,'2018-04-27 23:22:32',NULL,'/api/v1/customer/karezb'),('aceadmin',1,'2018-04-27 23:22:32',NULL,'/api/v1/config/6'),('aceadmin',1,'2018-04-27 23:22:32',NULL,'/api/v1/config/7'),('aceadmin',1,'2018-04-27 23:22:32',NULL,'/api/v1/config/8'),('karezb',1,'2018-04-27 23:28:05',NULL,'/api/v1/customer/karezb'),('karezb',1,'2018-04-27 23:28:05',NULL,'/api/v1/config/6'),('karezb',1,'2018-04-27 23:28:05',NULL,'/api/v1/config/8'),('karezb',1,'2018-04-27 23:28:05',NULL,'/api/v1/config/7'),('aceadmin',1,'2018-04-27 23:28:13',NULL,'/api/v1/dashboard/staff/aceadmin'),('aceadmin',1,'2018-04-27 23:28:13',NULL,'/api/v1/dashboard/calendar/aceadmin'),('aceadmin',1,'2018-04-27 23:28:13',NULL,'/api/v1/dashboard/admin/'),('karezb',1,'2018-04-27 23:28:15',NULL,'/api/v1/staff/'),('karezb',1,'2018-04-27 23:28:15',NULL,'/api/v1/config/7'),('karezb',1,'2018-04-27 23:28:15',NULL,'/api/v1/config/8'),('karezb',1,'2018-04-27 23:28:16',NULL,'/api/v1/customer'),('karezb',1,'2018-04-27 23:28:16',NULL,'/api/v1/config/6'),('karezb',1,'2018-04-27 23:28:17',NULL,'/api/v1/config/6'),('karezb',1,'2018-04-27 23:28:17',NULL,'/api/v1/customer/karezb'),('karezb',1,'2018-04-27 23:28:17',NULL,'/api/v1/config/2'),('karezb',1,'2018-04-27 23:28:17',NULL,'/api/v1/user/getstatus/karezb'),('karezb',1,'2018-04-27 23:28:17',NULL,'/api/v1/claim/user/karezb'),('aceadmin',1,'2018-04-27 23:28:48',NULL,'/api/v1/customer/karezb'),('aceadmin',1,'2018-04-27 23:28:48',NULL,'/api/v1/config/6'),('aceadmin',1,'2018-04-27 23:28:48',NULL,'/api/v1/config/2'),('aceadmin',1,'2018-04-27 23:28:48',NULL,'/api/v1/user/getstatus/karezb'),('aceadmin',1,'2018-04-27 23:28:48',NULL,'/api/v1/claim/user/karezb'),('aceadmin',1,'2018-04-27 23:28:53',NULL,'/api/v1/property/undefined'),('aceadmin',1,'2018-04-27 23:28:53',NULL,'/api/v1/customer/update'),('aceadmin',1,'2018-04-27 23:28:58',NULL,'/api/v1/customer/karezb'),('aceadmin',1,'2018-04-27 23:28:58',NULL,'/api/v1/config/6'),('aceadmin',1,'2018-04-27 23:28:58',NULL,'/api/v1/config/2'),('aceadmin',1,'2018-04-27 23:28:58',NULL,'/api/v1/user/getstatus/karezb'),('aceadmin',1,'2018-04-27 23:28:58',NULL,'/api/v1/claim/user/karezb'),('aceadmin',1,'2018-04-27 23:29:04',NULL,'/api/v1/address/search/?q=4'),('aceadmin',1,'2018-04-27 23:29:05',NULL,'/api/v1/address/search/?q=4'),('aceadmin',1,'2018-04-27 23:29:06',NULL,'/api/v1/address/search/?q=4%2043'),('aceadmin',1,'2018-04-27 23:29:06',NULL,'/api/v1/address/search/?q=4%2043'),('aceadmin',1,'2018-04-27 23:29:07',NULL,'/api/v1/address/search/?q=4%2043'),('aceadmin',1,'2018-04-27 23:29:07',NULL,'/api/v1/address/search/?q=4%2043%20n'),('aceadmin',1,'2018-04-27 23:29:07',NULL,'/api/v1/address/search/?q=4%2043%20nei'),('aceadmin',1,'2018-04-27 23:29:07',NULL,'/api/v1/address/search/?q=4%2043%20neil'),('aceadmin',1,'2018-04-27 23:29:07',NULL,'/api/v1/address/search/?q=4%2043%20neil'),('aceadmin',1,'2018-04-27 23:29:08',NULL,'/api/v1/address/search/?q=4%2043%20neil'),('aceadmin',1,'2018-04-27 23:29:08',NULL,'/api/v1/address/search/?q=4%2043%20neil%20st'),('aceadmin',1,'2018-04-27 23:29:08',NULL,'/api/v1/address/search/?q=4%2043%20neil%20st'),('aceadmin',1,'2018-04-27 23:29:14',NULL,'/api/v1/property/undefined'),('aceadmin',1,'2018-04-27 23:29:14',NULL,'/api/v1/customer/update'),('aceadmin',1,'2018-04-27 23:29:21',NULL,'/api/v1/customer/karezb'),('aceadmin',1,'2018-04-27 23:29:21',NULL,'/api/v1/config/6'),('aceadmin',1,'2018-04-27 23:29:21',NULL,'/api/v1/config/2'),('aceadmin',1,'2018-04-27 23:29:21',NULL,'/api/v1/user/getstatus/karezb'),('aceadmin',1,'2018-04-27 23:29:21',NULL,'/api/v1/claim/user/karezb'),('aceadmin',1,'2018-04-27 23:36:31',NULL,'/api/v1/customer/karezb'),('aceadmin',1,'2018-04-27 23:36:31',NULL,'/api/v1/config/2'),('aceadmin',1,'2018-04-27 23:36:31',NULL,'/api/v1/config/6'),('aceadmin',1,'2018-04-27 23:36:31',NULL,'/api/v1/user/getstatus/karezb'),('aceadmin',1,'2018-04-27 23:36:31',NULL,'/api/v1/claim/user/karezb'),('aceadmin',1,'2018-04-27 23:36:38',NULL,'/api/v1/address/complete/?q='),('aceadmin',1,'2018-04-27 23:36:39',NULL,'/api/v1/customer/update'),('aceadmin',1,'2018-04-27 23:37:06',NULL,'/api/v1/customer/karezb'),('aceadmin',1,'2018-04-27 23:37:06',NULL,'/api/v1/config/6'),('aceadmin',1,'2018-04-27 23:37:06',NULL,'/api/v1/config/2'),('aceadmin',1,'2018-04-27 23:37:06',NULL,'/api/v1/user/getstatus/karezb'),('aceadmin',1,'2018-04-27 23:37:06',NULL,'/api/v1/claim/user/karezb'),('aceadmin',1,'2018-04-27 23:37:57',NULL,'/api/v1/customer/karezb'),('aceadmin',1,'2018-04-27 23:37:57',NULL,'/api/v1/config/6'),('aceadmin',1,'2018-04-27 23:37:57',NULL,'/api/v1/config/2'),('aceadmin',1,'2018-04-27 23:37:57',NULL,'/api/v1/user/getstatus/karezb'),('aceadmin',1,'2018-04-27 23:37:57',NULL,'/api/v1/claim/user/karezb'),('aceadmin',1,'2018-04-27 23:38:05',NULL,'/api/v1/address/complete/?q='),('aceadmin',1,'2018-04-27 23:38:05',NULL,'/api/v1/customer/update'),('aceadmin',1,'2018-04-27 23:39:58',NULL,'/api/v1/address/search/?q=4'),('aceadmin',1,'2018-04-27 23:39:58',NULL,'/api/v1/address/search/?q=4%2043'),('aceadmin',1,'2018-04-27 23:39:58',NULL,'/api/v1/address/search/?q=4%2043%20n'),('aceadmin',1,'2018-04-27 23:39:58',NULL,'/api/v1/address/search/?q=4%2043%20ne'),('aceadmin',1,'2018-04-27 23:39:58',NULL,'/api/v1/address/search/?q=4%2043%20neil'),('aceadmin',1,'2018-04-27 23:39:58',NULL,'/api/v1/address/search/?q=4%2043%20neil%20st'),('aceadmin',1,'2018-04-27 23:39:58',NULL,'/api/v1/address/search/?q=4%2043%20neil'),('aceadmin',1,'2018-04-27 23:39:58',NULL,'/api/v1/address/search/?q=4'),('aceadmin',1,'2018-04-27 23:39:58',NULL,'/api/v1/address/search/?q=4%2043'),('aceadmin',1,'2018-04-27 23:39:58',NULL,'/api/v1/address/search/?q=4%2043%20neil%20st'),('aceadmin',1,'2018-04-27 23:39:58',NULL,'/api/v1/address/search/?q='),('aceadmin',1,'2018-04-27 23:39:58',NULL,'/api/v1/address/search/?q=4%2043%20neil'),('aceadmin',1,'2018-04-27 23:39:58',NULL,'/api/v1/address/search/?q=4%2043'),('aceadmin',1,'2018-04-27 23:39:58',NULL,'/api/v1/address/search/?q=4%2043%20neil%20st'),('aceadmin',1,'2018-04-27 23:39:59',NULL,'/api/v1/address/search/?q=4%2043%20neil%20st'),('aceadmin',1,'2018-04-27 23:40:03',NULL,'/api/v1/address/complete/?q=Unit%204,%2043%20Neil%20Street,%20MERRYLANDS%20NSW%202160'),('aceadmin',1,'2018-04-27 23:40:03',NULL,'/api/v1/customer/update'),('aceadmin',1,'2018-04-27 23:43:01',NULL,'/api/v1/customer/karezb'),('aceadmin',1,'2018-04-27 23:43:01',NULL,'/api/v1/config/6'),('aceadmin',1,'2018-04-27 23:43:01',NULL,'/api/v1/config/2'),('aceadmin',1,'2018-04-27 23:43:01',NULL,'/api/v1/user/getstatus/karezb'),('aceadmin',1,'2018-04-27 23:43:01',NULL,'/api/v1/claim/user/karezb'),('aceadmin',1,'2018-04-27 23:43:07',NULL,'/api/v1/address/search/?q='),('aceadmin',1,'2018-04-27 23:43:07',NULL,'/api/v1/address/search/?q='),('aceadmin',1,'2018-04-27 23:43:07',NULL,'/api/v1/address/search/?q='),('aceadmin',1,'2018-04-27 23:43:08',NULL,'/api/v1/address/search/?q='),('aceadmin',1,'2018-04-27 23:43:08',NULL,'/api/v1/address/search/?q='),('aceadmin',1,'2018-04-27 23:43:08',NULL,'/api/v1/address/search/?q='),('aceadmin',1,'2018-04-27 23:43:08',NULL,'/api/v1/address/search/?q='),('aceadmin',1,'2018-04-27 23:43:08',NULL,'/api/v1/address/search/?q='),('aceadmin',1,'2018-04-27 23:43:08',NULL,'/api/v1/address/search/?q='),('aceadmin',1,'2018-04-27 23:43:10',NULL,'/api/v1/address/search/?q=U'),('aceadmin',1,'2018-04-27 23:43:10',NULL,'/api/v1/address/search/?q=Un'),('aceadmin',1,'2018-04-27 23:43:10',NULL,'/api/v1/address/search/?q=U'),('aceadmin',1,'2018-04-27 23:43:10',NULL,'/api/v1/address/search/?q=Unit'),('aceadmin',1,'2018-04-27 23:43:10',NULL,'/api/v1/address/search/?q=Unit'),('aceadmin',1,'2018-04-27 23:43:10',NULL,'/api/v1/address/search/?q=Unit'),('aceadmin',1,'2018-04-27 23:43:11',NULL,'/api/v1/address/search/?q=Unit%204'),('aceadmin',1,'2018-04-27 23:43:12',NULL,'/api/v1/address/search/?q=Unit%204'),('aceadmin',1,'2018-04-27 23:43:12',NULL,'/api/v1/address/search/?q=Unit%204%2043'),('aceadmin',1,'2018-04-27 23:43:12',NULL,'/api/v1/address/search/?q=Unit%204%2043'),('aceadmin',1,'2018-04-27 23:43:13',NULL,'/api/v1/address/search/?q=Unit%204%2043'),('aceadmin',1,'2018-04-27 23:43:14',NULL,'/api/v1/address/search/?q=Unit%204%2043%20n'),('aceadmin',1,'2018-04-27 23:43:14',NULL,'/api/v1/address/search/?q=Unit%204%2043%20nei'),('aceadmin',1,'2018-04-27 23:43:14',NULL,'/api/v1/address/search/?q=Unit%204%2043%20neil'),('aceadmin',1,'2018-04-27 23:43:14',NULL,'/api/v1/address/search/?q=Unit%204%2043%20neil'),('aceadmin',1,'2018-04-27 23:43:16',NULL,'/api/v1/address/complete/?q=Unit%204,%2043%20Neil%20Street,%20MERRYLANDS%20NSW%202160'),('aceadmin',1,'2018-04-27 23:43:29',NULL,'/api/v1/customer/karezb'),('aceadmin',1,'2018-04-27 23:43:29',NULL,'/api/v1/config/6'),('aceadmin',1,'2018-04-27 23:43:29',NULL,'/api/v1/config/2'),('aceadmin',1,'2018-04-27 23:43:29',NULL,'/api/v1/user/getstatus/karezb'),('aceadmin',1,'2018-04-27 23:43:29',NULL,'/api/v1/claim/user/karezb'),('aceadmin',1,'2018-04-27 23:43:32',NULL,'/api/v1/address/search/?q='),('aceadmin',1,'2018-04-27 23:43:32',NULL,'/api/v1/address/search/?q='),('aceadmin',1,'2018-04-27 23:43:32',NULL,'/api/v1/address/search/?q='),('aceadmin',1,'2018-04-27 23:43:32',NULL,'/api/v1/address/search/?q='),('aceadmin',1,'2018-04-27 23:43:33',NULL,'/api/v1/address/search/?q=U'),('aceadmin',1,'2018-04-27 23:43:33',NULL,'/api/v1/address/search/?q=U'),('aceadmin',1,'2018-04-27 23:43:33',NULL,'/api/v1/address/search/?q=Un'),('aceadmin',1,'2018-04-27 23:43:33',NULL,'/api/v1/address/search/?q=Uni'),('aceadmin',1,'2018-04-27 23:43:33',NULL,'/api/v1/address/search/?q=Unit'),('aceadmin',1,'2018-04-27 23:43:34',NULL,'/api/v1/address/search/?q=Unit'),('aceadmin',1,'2018-04-27 23:43:34',NULL,'/api/v1/address/search/?q=Unit%204'),('aceadmin',1,'2018-04-27 23:43:35',NULL,'/api/v1/address/search/?q=Unit%204'),('aceadmin',1,'2018-04-27 23:43:36',NULL,'/api/v1/address/search/?q=Unit%204'),('aceadmin',1,'2018-04-27 23:43:36',NULL,'/api/v1/address/search/?q=Unit%204'),('aceadmin',1,'2018-04-27 23:43:37',NULL,'/api/v1/address/search/?q=Unit%204'),('aceadmin',1,'2018-04-27 23:43:38',NULL,'/api/v1/address/search/?q=Unit%204%203'),('aceadmin',1,'2018-04-27 23:43:38',NULL,'/api/v1/address/search/?q=Unit%204%203'),('aceadmin',1,'2018-04-27 23:43:38',NULL,'/api/v1/address/search/?q=Unit%204%204'),('aceadmin',1,'2018-04-27 23:43:38',NULL,'/api/v1/address/search/?q=Unit%204%2043'),('aceadmin',1,'2018-04-27 23:43:38',NULL,'/api/v1/address/search/?q=Unit%204%203'),('aceadmin',1,'2018-04-27 23:43:39',NULL,'/api/v1/address/search/?q=Unit%204%2043'),('aceadmin',1,'2018-04-27 23:43:39',NULL,'/api/v1/address/search/?q=Unit%204%2043%20N'),('aceadmin',1,'2018-04-27 23:43:39',NULL,'/api/v1/address/search/?q=Unit%204%2043'),('aceadmin',1,'2018-04-27 23:43:39',NULL,'/api/v1/address/search/?q=Unit%204%2043%20Nei'),('aceadmin',1,'2018-04-27 23:43:39',NULL,'/api/v1/address/search/?q=Unit%204%2043%20N'),('aceadmin',1,'2018-04-27 23:43:39',NULL,'/api/v1/address/search/?q=Unit%204%2043%20Neil'),('aceadmin',1,'2018-04-27 23:43:39',NULL,'/api/v1/address/search/?q=Unit%204%2043%20Neil'),('aceadmin',1,'2018-04-27 23:43:39',NULL,'/api/v1/address/search/?q=Unit%204%2043%20Neil'),('aceadmin',1,'2018-04-27 23:43:40',NULL,'/api/v1/address/search/?q=Unit%204%2043%20Neil%20st'),('aceadmin',1,'2018-04-27 23:43:40',NULL,'/api/v1/address/search/?q=Unit%204%2043%20Neil%20st'),('aceadmin',1,'2018-04-27 23:43:45',NULL,'/api/v1/address/complete/?q=Unit%204,%2043%20Neil%20Street,%20MERRYLANDS%20NSW%202160'),('aceadmin',1,'2018-04-27 23:44:04',NULL,'/api/v1/customer/karezb'),('aceadmin',1,'2018-04-27 23:44:04',NULL,'/api/v1/config/6'),('aceadmin',1,'2018-04-27 23:44:04',NULL,'/api/v1/config/2'),('aceadmin',1,'2018-04-27 23:44:05',NULL,'/api/v1/user/getstatus/karezb'),('aceadmin',1,'2018-04-27 23:44:05',NULL,'/api/v1/claim/user/karezb'),('aceadmin',1,'2018-04-27 23:44:08',NULL,'/api/v1/address/search/?q='),('aceadmin',1,'2018-04-27 23:44:08',NULL,'/api/v1/address/search/?q='),('aceadmin',1,'2018-04-27 23:44:08',NULL,'/api/v1/address/search/?q='),('aceadmin',1,'2018-04-27 23:44:09',NULL,'/api/v1/address/search/?q=4'),('aceadmin',1,'2018-04-27 23:44:09',NULL,'/api/v1/address/search/?q=4'),('aceadmin',1,'2018-04-27 23:44:09',NULL,'/api/v1/address/search/?q=4'),('aceadmin',1,'2018-04-27 23:44:09',NULL,'/api/v1/address/search/?q='),('aceadmin',1,'2018-04-27 23:44:10',NULL,'/api/v1/address/search/?q=4'),('aceadmin',1,'2018-04-27 23:44:10',NULL,'/api/v1/address/search/?q=4'),('aceadmin',1,'2018-04-27 23:44:11',NULL,'/api/v1/address/search/?q=4%2043'),('aceadmin',1,'2018-04-27 23:44:11',NULL,'/api/v1/address/search/?q=4%2043'),('aceadmin',1,'2018-04-27 23:44:11',NULL,'/api/v1/address/search/?q=4%2043'),('aceadmin',1,'2018-04-27 23:44:11',NULL,'/api/v1/address/search/?q=4%2043%20n'),('aceadmin',1,'2018-04-27 23:44:11',NULL,'/api/v1/address/search/?q=4%2043%20nei'),('aceadmin',1,'2018-04-27 23:44:11',NULL,'/api/v1/address/search/?q=4%2043%20neil'),('aceadmin',1,'2018-04-27 23:44:12',NULL,'/api/v1/address/search/?q=4%2043%20neil'),('aceadmin',1,'2018-04-27 23:44:19',NULL,'/api/v1/address/complete/?q=Unit%204,%2043%20Neil%20Street,%20MERRYLANDS%20NSW%202160'),('aceadmin',1,'2018-04-27 23:44:19',NULL,'/api/v1/customer/update'),('aceadmin',1,'2018-04-27 23:44:19',NULL,'/api/v1/user/update'),('aceadmin',1,'2018-04-27 23:44:24',NULL,'/api/v1/customer/karezb'),('aceadmin',1,'2018-04-27 23:44:24',NULL,'/api/v1/config/6'),('aceadmin',1,'2018-04-27 23:44:24',NULL,'/api/v1/config/2'),('aceadmin',1,'2018-04-27 23:44:24',NULL,'/api/v1/user/getstatus/karezb'),('aceadmin',1,'2018-04-27 23:44:24',NULL,'/api/v1/claim/user/karezb'),('aceadmin',1,'2018-04-27 23:44:59',NULL,'/api/v1/customer'),('aceadmin',1,'2018-04-27 23:44:59',NULL,'/api/v1/config/6'),('aceadmin',1,'2018-04-27 23:45:02',NULL,'/api/v1/config/6'),('aceadmin',1,'2018-04-27 23:45:02',NULL,'/api/v1/config/2'),('aceadmin',1,'2018-04-27 23:45:15',NULL,'/api/v1/address/search/?q=undefined'),('aceadmin',1,'2018-04-27 23:45:19',NULL,'/api/v1/address/search/?q=b'),('aceadmin',1,'2018-04-27 23:45:19',NULL,'/api/v1/address/search/?q=bal'),('aceadmin',1,'2018-04-27 23:45:19',NULL,'/api/v1/address/search/?q=bal'),('aceadmin',1,'2018-04-27 23:45:19',NULL,'/api/v1/address/search/?q=balm'),('aceadmin',1,'2018-04-27 23:45:20',NULL,'/api/v1/address/search/?q=balmai'),('aceadmin',1,'2018-04-27 23:45:20',NULL,'/api/v1/address/search/?q=balmain'),('aceadmin',1,'2018-04-27 23:45:20',NULL,'/api/v1/address/search/?q=balmain'),('aceadmin',1,'2018-04-27 23:45:21',NULL,'/api/v1/address/search/?q=balmain'),('aceadmin',1,'2018-04-27 23:45:21',NULL,'/api/v1/address/search/?q=balmain'),('aceadmin',1,'2018-04-27 23:45:21',NULL,'/api/v1/address/search/?q=vi'),('aceadmin',1,'2018-04-27 23:45:22',NULL,'/api/v1/address/search/?q=vic'),('aceadmin',1,'2018-04-27 23:45:22',NULL,'/api/v1/address/search/?q=victo'),('aceadmin',1,'2018-04-27 23:45:22',NULL,'/api/v1/address/search/?q=victo'),('aceadmin',1,'2018-04-27 23:45:22',NULL,'/api/v1/address/search/?q=victori'),('aceadmin',1,'2018-04-27 23:45:22',NULL,'/api/v1/address/search/?q=victori'),('aceadmin',1,'2018-04-27 23:45:22',NULL,'/api/v1/address/search/?q=victoria'),('aceadmin',1,'2018-04-27 23:45:23',NULL,'/api/v1/address/search/?q=victoria'),('aceadmin',1,'2018-04-27 23:45:23',NULL,'/api/v1/address/search/?q=victoria%20r'),('aceadmin',1,'2018-04-27 23:45:23',NULL,'/api/v1/address/search/?q=vi'),('aceadmin',1,'2018-04-27 23:45:23',NULL,'/api/v1/address/search/?q=victoria%20rd'),('aceadmin',1,'2018-04-27 23:45:23',NULL,'/api/v1/address/search/?q=victoria%20rd'),('aceadmin',1,'2018-04-27 23:45:24',NULL,'/api/v1/address/search/?q=victoria%20rd%20a'),('aceadmin',1,'2018-04-27 23:45:24',NULL,'/api/v1/address/search/?q=victoria%20rd'),('aceadmin',1,'2018-04-27 23:45:24',NULL,'/api/v1/address/search/?q=victoria%20rd%20b'),('aceadmin',1,'2018-04-27 23:45:24',NULL,'/api/v1/address/search/?q=victoria%20rd%20bal'),('aceadmin',1,'2018-04-27 23:45:25',NULL,'/api/v1/address/search/?q=victoria%20rd%20bal'),('aceadmin',1,'2018-04-27 23:45:25',NULL,'/api/v1/address/search/?q=victoria%20rd%20balma'),('aceadmin',1,'2018-04-27 23:45:25',NULL,'/api/v1/address/search/?q=victoria%20rd%20balmai'),('aceadmin',1,'2018-04-27 23:45:25',NULL,'/api/v1/address/search/?q=victoria%20rd%20balmain'),('aceadmin',1,'2018-04-27 23:45:26',NULL,'/api/v1/address/search/?q=victoria%20rd%20balmain'),('aceadmin',1,'2018-04-27 23:45:26',NULL,'/api/v1/address/search/?q=victoria%20rd%20balmai'),('aceadmin',1,'2018-04-27 23:45:27',NULL,'/api/v1/address/search/?q=victoria%20rd%20balma'),('aceadmin',1,'2018-04-27 23:45:27',NULL,'/api/v1/address/search/?q=victoria%20rd%20balm'),('aceadmin',1,'2018-04-27 23:45:27',NULL,'/api/v1/address/search/?q=victoria%20rd%20bal'),('aceadmin',1,'2018-04-27 23:45:27',NULL,'/api/v1/address/search/?q=victoria%20rd%20ba'),('aceadmin',1,'2018-04-27 23:45:27',NULL,'/api/v1/address/search/?q=victoria%20rd%20b'),('aceadmin',1,'2018-04-27 23:45:27',NULL,'/api/v1/address/search/?q=victoria%20rd'),('aceadmin',1,'2018-04-27 23:45:27',NULL,'/api/v1/address/search/?q=victoria%20rd'),('aceadmin',1,'2018-04-27 23:45:28',NULL,'/api/v1/address/search/?q=victoria%20rd,'),('aceadmin',1,'2018-04-27 23:45:30',NULL,'/api/v1/address/search/?q=victoria%20rd,'),('aceadmin',1,'2018-04-27 23:45:30',NULL,'/api/v1/address/search/?q=victoria%20rd,%20b'),('aceadmin',1,'2018-04-27 23:45:30',NULL,'/api/v1/address/search/?q=victoria%20rd,%20ba'),('aceadmin',1,'2018-04-27 23:45:31',NULL,'/api/v1/address/search/?q=victoria%20rd,%20bal'),('aceadmin',1,'2018-04-27 23:45:32',NULL,'/api/v1/address/search/?q=victoria%20rd,%20balm'),('aceadmin',1,'2018-04-27 23:45:32',NULL,'/api/v1/address/search/?q=victoria%20rd,%20balmai'),('aceadmin',1,'2018-04-27 23:45:32',NULL,'/api/v1/address/search/?q=victoria%20rd,%20balmain'),('aceadmin',1,'2018-04-27 23:45:32',NULL,'/api/v1/address/search/?q=victoria%20rd,%20balmain'),('aceadmin',1,'2018-04-27 23:45:34',NULL,'/api/v1/address/search/?q=victoria%20rd,%20b'),('aceadmin',1,'2018-04-27 23:45:34',NULL,'/api/v1/address/search/?q=victoria%20rd,'),('aceadmin',1,'2018-04-27 23:45:34',NULL,'/api/v1/address/search/?q=victoria%20rd,'),('aceadmin',1,'2018-04-27 23:45:35',NULL,'/api/v1/address/search/?q=victoria%20rd,'),('aceadmin',1,'2018-04-27 23:45:35',NULL,'/api/v1/address/search/?q='),('aceadmin',1,'2018-04-27 23:45:35',NULL,'/api/v1/address/search/?q=da'),('aceadmin',1,'2018-04-27 23:45:36',NULL,'/api/v1/address/search/?q=dai'),('aceadmin',1,'2018-04-27 23:45:36',NULL,'/api/v1/address/search/?q=dai'),('aceadmin',1,'2018-04-27 23:45:36',NULL,'/api/v1/address/search/?q=dais'),('aceadmin',1,'2018-04-27 23:45:36',NULL,'/api/v1/address/search/?q=daisy'),('aceadmin',1,'2018-04-27 23:45:36',NULL,'/api/v1/address/search/?q=daisy'),('aceadmin',1,'2018-04-27 23:45:36',NULL,'/api/v1/address/search/?q=daisy%20ro'),('aceadmin',1,'2018-04-27 23:45:37',NULL,'/api/v1/address/search/?q=daisy%20ro'),('aceadmin',1,'2018-04-27 23:45:37',NULL,'/api/v1/address/search/?q=daisy%20road'),('aceadmin',1,'2018-04-27 23:45:37',NULL,'/api/v1/address/search/?q=daisy%20road'),('aceadmin',1,'2018-04-27 23:45:37',NULL,'/api/v1/address/search/?q=daisy%20road'),('aceadmin',1,'2018-04-27 23:45:37',NULL,'/api/v1/address/search/?q=daisy%20road%20b'),('aceadmin',1,'2018-04-27 23:45:38',NULL,'/api/v1/address/search/?q=daisy%20road'),('aceadmin',1,'2018-04-27 23:45:38',NULL,'/api/v1/address/search/?q=daisy%20road%20b'),('aceadmin',1,'2018-04-27 23:45:38',NULL,'/api/v1/address/search/?q=daisy%20road%20bal'),('aceadmin',1,'2018-04-27 23:45:38',NULL,'/api/v1/address/search/?q=daisy%20road%20bal'),('aceadmin',1,'2018-04-27 23:45:39',NULL,'/api/v1/address/search/?q=daisy%20road%20balm'),('aceadmin',1,'2018-04-27 23:45:40',NULL,'/api/v1/address/search/?q=daisy%20road%20balma'),('aceadmin',1,'2018-04-27 23:45:40',NULL,'/api/v1/address/search/?q=daisy%20road%20balmai'),('aceadmin',1,'2018-04-27 23:45:41',NULL,'/api/v1/address/search/?q=daisy%20road%20balmai'),('aceadmin',1,'2018-04-27 23:45:41',NULL,'/api/v1/address/search/?q=daisy%20road%20balmai'),('aceadmin',1,'2018-04-27 23:45:41',NULL,'/api/v1/address/search/?q=b'),('aceadmin',1,'2018-04-27 23:45:42',NULL,'/api/v1/address/search/?q=ba'),('aceadmin',1,'2018-04-27 23:45:42',NULL,'/api/v1/address/search/?q=bal'),('aceadmin',1,'2018-04-27 23:45:42',NULL,'/api/v1/address/search/?q=balm'),('aceadmin',1,'2018-04-27 23:45:43',NULL,'/api/v1/address/search/?q=balmai'),('aceadmin',1,'2018-04-27 23:45:43',NULL,'/api/v1/address/search/?q=balmai'),('aceadmin',1,'2018-04-27 23:45:43',NULL,'/api/v1/address/search/?q=balmain'),('aceadmin',1,'2018-04-27 23:45:46',NULL,'/api/v1/address/search/?q=balmain'),('aceadmin',1,'2018-04-27 23:45:46',NULL,'/api/v1/address/search/?q=balmain%20ns'),('aceadmin',1,'2018-04-27 23:45:46',NULL,'/api/v1/address/search/?q=balmain%20ns'),('aceadmin',1,'2018-04-27 23:45:46',NULL,'/api/v1/address/search/?q=balmain%20nsw'),('aceadmin',1,'2018-04-27 23:45:49',NULL,'/api/v1/address/search/?q=balmain%20nsw'),('aceadmin',1,'2018-04-27 23:45:50',NULL,'/api/v1/address/search/?q=,balmain%20nsw'),('aceadmin',1,'2018-04-27 23:45:51',NULL,'/api/v1/address/search/?q=,balmain%20nsw'),('aceadmin',1,'2018-04-27 23:45:53',NULL,'/api/v1/address/search/?q=d,balmain%20nsw'),('aceadmin',1,'2018-04-27 23:45:53',NULL,'/api/v1/address/search/?q=dai,balmain%20nsw'),('aceadmin',1,'2018-04-27 23:45:54',NULL,'/api/v1/address/search/?q=dai,balmain%20nsw'),('aceadmin',1,'2018-04-27 23:45:54',NULL,'/api/v1/address/search/?q=daisy,balmain%20nsw'),('aceadmin',1,'2018-04-27 23:45:54',NULL,'/api/v1/address/search/?q=daisy,balmain%20nsw'),('aceadmin',1,'2018-04-27 23:45:55',NULL,'/api/v1/address/search/?q=daisy%20,balmain%20nsw'),('aceadmin',1,'2018-04-27 23:45:56',NULL,'/api/v1/address/search/?q=daisy,balmain%20nsw'),('aceadmin',1,'2018-04-27 23:45:56',NULL,'/api/v1/address/search/?q=daisy,balmain%20nsw'),('aceadmin',1,'2018-04-27 23:45:57',NULL,'/api/v1/address/search/?q=daisy,balmain%20nsw'),('aceadmin',1,'2018-04-27 23:45:57',NULL,'/api/v1/address/search/?q=,balmain%20nsw'),('aceadmin',1,'2018-04-27 23:46:13',NULL,'/api/v1/address/search/?q=pa,balmain%20nsw'),('aceadmin',1,'2018-04-27 23:46:13',NULL,'/api/v1/address/search/?q=pal,balmain%20nsw'),('aceadmin',1,'2018-04-27 23:46:13',NULL,'/api/v1/address/search/?q=pa,balmain%20nsw'),('aceadmin',1,'2018-04-27 23:46:13',NULL,'/api/v1/address/search/?q=palm,balmain%20nsw'),('aceadmin',1,'2018-04-27 23:46:14',NULL,'/api/v1/address/search/?q=palmer,balmain%20nsw'),('aceadmin',1,'2018-04-27 23:46:14',NULL,'/api/v1/address/search/?q=palmer,balmain%20nsw'),('aceadmin',1,'2018-04-27 23:47:12',NULL,'/api/v1/address/complete/?q=24%20Palmer%20Street,%20BALMAIN%20NSW%202041'),('aceadmin',1,'2018-04-27 23:49:52','127.0.0.1','/api/v1/config/2'),('aceadmin',1,'2018-04-27 23:49:52',NULL,'/api/v1/config/6'),('aceadmin',1,'2018-04-27 23:50:04',NULL,'/api/v1/address/search/?q=undefined'),('aceadmin',1,'2018-04-27 23:50:05',NULL,'/api/v1/address/search/?q=24'),('aceadmin',1,'2018-04-27 23:50:05',NULL,'/api/v1/address/search/?q=24'),('aceadmin',1,'2018-04-27 23:50:05',NULL,'/api/v1/address/search/?q=24'),('aceadmin',1,'2018-04-27 23:50:05',NULL,'/api/v1/address/search/?q=24%20pa'),('aceadmin',1,'2018-04-27 23:50:06',NULL,'/api/v1/address/search/?q=24%20pa'),('aceadmin',1,'2018-04-27 23:50:06',NULL,'/api/v1/address/search/?q=24%20par'),('aceadmin',1,'2018-04-27 23:50:06',NULL,'/api/v1/address/search/?q=24%20pa'),('aceadmin',1,'2018-04-27 23:50:07',NULL,'/api/v1/address/search/?q=24%20pal'),('aceadmin',1,'2018-04-27 23:50:07',NULL,'/api/v1/address/search/?q=24%20palme'),('aceadmin',1,'2018-04-27 23:50:07',NULL,'/api/v1/address/search/?q=24%20palmer'),('aceadmin',1,'2018-04-27 23:50:07',NULL,'/api/v1/address/search/?q=24%20palmer'),('aceadmin',1,'2018-04-27 23:50:07',NULL,'/api/v1/address/search/?q=24%20palmer%20st'),('aceadmin',1,'2018-04-27 23:50:07',NULL,'/api/v1/address/search/?q=24%20palmer'),('aceadmin',1,'2018-04-27 23:50:07',NULL,'/api/v1/address/search/?q=24%20palmer%20st'),('aceadmin',1,'2018-04-27 23:50:08',NULL,'/api/v1/address/search/?q=24%20palmer%20st'),('aceadmin',1,'2018-04-27 23:50:08',NULL,'/api/v1/address/search/?q=24%20palmer%20st%20b'),('aceadmin',1,'2018-04-27 23:50:09',NULL,'/api/v1/address/search/?q=24%20palmer%20st%20bl'),('aceadmin',1,'2018-04-27 23:50:09',NULL,'/api/v1/address/search/?q=24%20palmer%20st%20bla'),('aceadmin',1,'2018-04-27 23:50:10',NULL,'/api/v1/address/search/?q=24%20palmer%20st%20bl'),('aceadmin',1,'2018-04-27 23:50:10',NULL,'/api/v1/address/search/?q=24%20palmer%20st%20b'),('aceadmin',1,'2018-04-27 23:50:10',NULL,'/api/v1/address/search/?q=24%20palmer%20st%20bal'),('aceadmin',1,'2018-04-27 23:50:11',NULL,'/api/v1/address/search/?q=24%20palmer%20st%20bal'),('aceadmin',1,'2018-04-27 23:50:11',NULL,'/api/v1/address/search/?q=24%20palmer%20st%20balm'),('aceadmin',1,'2018-04-27 23:50:12',NULL,'/api/v1/address/search/?q=24%20palmer%20st%20balm'),('aceadmin',1,'2018-04-27 23:50:21',NULL,'/api/v1/address/complete/?q=24%20Palmer%20Street,%20BALMAIN%20NSW%202041'),('aceadmin',1,'2018-04-27 23:50:25',NULL,'/api/v1/customer/sureshsingh'),('aceadmin',1,'2018-04-27 23:50:25',NULL,'/api/v1/config/6'),('aceadmin',1,'2018-04-27 23:50:25',NULL,'/api/v1/config/2'),('aceadmin',1,'2018-04-27 23:50:25',NULL,'/api/v1/user/getstatus/sureshsingh'),('aceadmin',1,'2018-04-27 23:50:25',NULL,'/api/v1/claim/user/sureshsingh'),('aceadmin',1,'2018-04-27 23:51:26',NULL,'/api/v1/dashboard/staff/aceadmin'),('aceadmin',1,'2018-04-27 23:51:26',NULL,'/api/v1/dashboard/calendar/aceadmin'),('aceadmin',1,'2018-04-27 23:51:26',NULL,'/api/v1/dashboard/admin/'),('aceadmin',1,'2018-04-27 23:51:27',NULL,'/api/v1/customer'),('aceadmin',1,'2018-04-27 23:51:27',NULL,'/api/v1/config/6'),('aceadmin',1,'2018-04-27 23:51:29',NULL,'/api/v1/config/6'),('aceadmin',1,'2018-04-27 23:51:29',NULL,'/api/v1/customer/sureshsingh'),('aceadmin',1,'2018-04-27 23:51:29',NULL,'/api/v1/config/2'),('aceadmin',1,'2018-04-27 23:51:29',NULL,'/api/v1/user/getstatus/sureshsingh'),('aceadmin',1,'2018-04-27 23:51:29',NULL,'/api/v1/claim/user/sureshsingh'),('aceadmin',1,'2018-04-27 23:51:32',NULL,'/api/v1/address/complete/?q=24%20Palmer%20Street%20%20BALMAIN%20NSW%202041'),('aceadmin',1,'2018-04-27 23:51:32',NULL,'/api/v1/customer/update'),('aceadmin',1,'2018-04-27 23:51:32',NULL,'/api/v1/user/update'),('aceadmin',1,'2018-04-27 23:51:38',NULL,'/api/v1/customer/sureshsingh'),('aceadmin',1,'2018-04-27 23:51:38',NULL,'/api/v1/config/6'),('aceadmin',1,'2018-04-27 23:51:38',NULL,'/api/v1/config/2'),('aceadmin',1,'2018-04-27 23:51:38',NULL,'/api/v1/user/getstatus/sureshsingh'),('aceadmin',1,'2018-04-27 23:51:38',NULL,'/api/v1/claim/user/sureshsingh'),('aceadmin',1,'2018-04-27 23:51:41',NULL,'/api/v1/address/complete/?q=24%20Palmer%20Street%20%20BALMAIN%20NSW%202041'),('aceadmin',1,'2018-04-27 23:51:41',NULL,'/api/v1/customer/update'),('aceadmin',1,'2018-04-27 23:51:41',NULL,'/api/v1/user/update'),('aceadmin',1,'2018-04-27 23:51:43',NULL,'/api/v1/dashboard/staff/aceadmin'),('aceadmin',1,'2018-04-27 23:51:43',NULL,'/api/v1/dashboard/calendar/aceadmin'),('aceadmin',1,'2018-04-27 23:51:43',NULL,'/api/v1/dashboard/admin/'),('aceadmin',1,'2018-04-27 23:51:46',NULL,'/api/v1/config/3'),('aceadmin',1,'2018-04-27 23:51:46',NULL,'/api/v1/config/4'),('aceadmin',1,'2018-04-27 23:51:46',NULL,'/api/v1/claim/all/undefined/undefined'),('aceadmin',1,'2018-04-27 23:51:46',NULL,'/api/v1/claim/all/undefined/undefined'),('aceadmin',1,'2018-04-27 23:51:48',NULL,'/api/v1/property/'),('aceadmin',1,'2018-04-27 23:51:48',NULL,'/api/v1/config/9'),('aceadmin',1,'2018-04-27 23:51:49',NULL,'/api/v1/staff/'),('aceadmin',1,'2018-04-27 23:51:49',NULL,'/api/v1/config/7'),('aceadmin',1,'2018-04-27 23:51:49',NULL,'/api/v1/config/8'),('aceadmin',1,'2018-04-27 23:51:50',NULL,'/api/v1/customer'),('aceadmin',1,'2018-04-27 23:51:50',NULL,'/api/v1/config/6'),('aceadmin',1,'2018-04-27 23:51:55',NULL,'/api/v1/config/6'),('aceadmin',1,'2018-04-27 23:51:55',NULL,'/api/v1/customer/karezb'),('aceadmin',1,'2018-04-27 23:51:55',NULL,'/api/v1/config/2'),('aceadmin',1,'2018-04-27 23:51:55',NULL,'/api/v1/user/getstatus/karezb'),('aceadmin',1,'2018-04-27 23:51:55',NULL,'/api/v1/claim/user/karezb'),('aceadmin',1,'2018-04-27 23:51:56',NULL,'/api/v1/customer'),('aceadmin',1,'2018-04-27 23:51:56',NULL,'/api/v1/config/6'),('jacky.chang',1,'2018-04-28 00:01:21',NULL,'/api/v1/dashboard/calendar/jacky.chang'),('jacky.chang',1,'2018-04-28 00:01:21',NULL,'/api/v1/dashboard/staff/jacky.chang'),('jacky.chang',1,'2018-04-28 00:01:21',NULL,'/api/v1/dashboard/admin/'),('jacky.chang',1,'2018-04-28 00:01:27',NULL,'/api/v1/customer'),('jacky.chang',1,'2018-04-28 00:01:27',NULL,'/api/v1/config/6'),('jacky.chang',1,'2018-04-28 00:01:29',NULL,'/api/v1/config/6'),('jacky.chang',1,'2018-04-28 00:01:29',NULL,'/api/v1/customer/guy1'),('jacky.chang',1,'2018-04-28 00:01:29',NULL,'/api/v1/config/2'),('jacky.chang',1,'2018-04-28 00:01:29',NULL,'/api/v1/user/getstatus/guy1'),('jacky.chang',1,'2018-04-28 00:01:29',NULL,'/api/v1/claim/user/guy1'),('jacky.chang',1,'2018-04-28 00:01:34',NULL,'/api/v1/address/complete/?q='),('jacky.chang',1,'2018-04-28 00:01:34',NULL,'/api/v1/customer/update'),('jacky.chang',1,'2018-04-28 00:01:34',NULL,'/api/v1/user/update'),('jacky.chang',1,'2018-04-28 00:01:41',NULL,'/api/v1/customer'),('jacky.chang',1,'2018-04-28 00:01:41',NULL,'/api/v1/config/6'),('jacky.chang',1,'2018-04-28 00:01:42',NULL,'/api/v1/config/6'),('jacky.chang',1,'2018-04-28 00:01:42',NULL,'/api/v1/customer/csotto'),('jacky.chang',1,'2018-04-28 00:01:42',NULL,'/api/v1/config/2'),('jacky.chang',1,'2018-04-28 00:01:42',NULL,'/api/v1/user/getstatus/csotto'),('jacky.chang',1,'2018-04-28 00:01:42',NULL,'/api/v1/claim/user/csotto'),('jacky.chang',1,'2018-04-28 00:01:46',NULL,'/api/v1/address/complete/?q='),('jacky.chang',1,'2018-04-28 00:01:46',NULL,'/api/v1/customer/update'),('jacky.chang',1,'2018-04-28 00:01:46',NULL,'/api/v1/user/update'),('jacky.chang',1,'2018-04-28 00:01:51',NULL,'/api/v1/address/complete/?q='),('jacky.chang',1,'2018-04-28 00:01:51',NULL,'/api/v1/customer/update'),('jacky.chang',1,'2018-04-28 00:01:51',NULL,'/api/v1/user/update'),('jacky.chang',1,'2018-04-28 00:01:53',NULL,'/api/v1/customer'),('jacky.chang',1,'2018-04-28 00:01:53',NULL,'/api/v1/config/6'),('jacky.chang',1,'2018-04-28 00:01:55',NULL,'/api/v1/config/6'),('jacky.chang',1,'2018-04-28 00:01:55',NULL,'/api/v1/config/2'),('jacky.chang',1,'2018-04-28 00:01:55',NULL,'/api/v1/customer/guy1'),('jacky.chang',1,'2018-04-28 00:01:55',NULL,'/api/v1/user/getstatus/guy1'),('jacky.chang',1,'2018-04-28 00:01:55',NULL,'/api/v1/claim/user/guy1'),('jacky.chang',1,'2018-04-28 00:02:00',NULL,'/api/v1/address/complete/?q='),('jacky.chang',1,'2018-04-28 00:02:00',NULL,'/api/v1/customer/update'),('jacky.chang',1,'2018-04-28 00:02:00',NULL,'/api/v1/user/update'),('jacky.chang',1,'2018-04-28 00:02:01',NULL,'/api/v1/dashboard/staff/jacky.chang'),('jacky.chang',1,'2018-04-28 00:02:01',NULL,'/api/v1/dashboard/calendar/jacky.chang'),('jacky.chang',1,'2018-04-28 00:02:01',NULL,'/api/v1/dashboard/admin/'),('jacky.chang',1,'2018-04-28 00:02:16',NULL,'/api/v1/dashboard/staff/jacky.chang'),('jacky.chang',1,'2018-04-28 00:02:16',NULL,'/api/v1/dashboard/admin/'),('jacky.chang',1,'2018-04-28 00:02:16',NULL,'/api/v1/dashboard/calendar/jacky.chang'),('jacky.chang',1,'2018-04-28 00:02:17',NULL,'/api/v1/customer'),('jacky.chang',1,'2018-04-28 00:02:17',NULL,'/api/v1/config/6'),('jacky.chang',1,'2018-04-28 00:02:18',NULL,'/api/v1/config/6'),('jacky.chang',1,'2018-04-28 00:02:18',NULL,'/api/v1/customer/csotto'),('jacky.chang',1,'2018-04-28 00:02:18',NULL,'/api/v1/config/2'),('jacky.chang',1,'2018-04-28 00:02:18',NULL,'/api/v1/user/getstatus/csotto'),('jacky.chang',1,'2018-04-28 00:02:18',NULL,'/api/v1/claim/user/csotto'),('jacky.chang',1,'2018-04-28 00:02:20',NULL,'/api/v1/user/changestatus'),('jacky.chang',1,'2018-04-28 00:02:28',NULL,'/api/v1/dashboard/user/csotto'),('csotto',1,'2018-04-28 00:02:30',NULL,'/api/v1/property/user/csotto'),('csotto',1,'2018-04-28 00:02:30',NULL,'/api/v1/config/9'),('csotto',1,'2018-04-28 00:02:31',NULL,'/api/v1/config/3'),('csotto',1,'2018-04-28 00:02:31',NULL,'/api/v1/config/4'),('csotto',1,'2018-04-28 00:02:31',NULL,'/api/v1/claim/all/undefined/undefined'),('csotto',1,'2018-04-28 00:02:31',NULL,'/api/v1/claim/all/undefined/undefined'),('jacky.chang',1,'2018-04-28 00:02:33',NULL,'/api/v1/customer/csotto'),('jacky.chang',1,'2018-04-28 00:02:33',NULL,'/api/v1/config/6'),('csotto',1,'2018-04-28 00:02:33',NULL,'/api/v1/config/8'),('csotto',1,'2018-04-28 00:02:33',NULL,'/api/v1/config/7'),('jacky.chang',1,'2018-04-28 00:02:39',NULL,'/api/v1/address/complete/?q='),('jacky.chang',1,'2018-04-28 00:02:39',NULL,'/api/v1/customer/update'),('jacky.chang',1,'2018-04-28 00:02:39',NULL,'/api/v1/user/update'),('jacky.chang',1,'2018-04-28 00:02:41',NULL,'/api/v1/dashboard/user/csotto'),('csotto',1,'2018-04-28 00:02:44',NULL,'/api/v1/config/3'),('csotto',1,'2018-04-28 00:02:44',NULL,'/api/v1/config/4'),('csotto',1,'2018-04-28 00:02:44',NULL,'/api/v1/claim/all/undefined/undefined'),('csotto',1,'2018-04-28 00:02:44',NULL,'/api/v1/claim/all/undefined/undefined'),('jacky.chang',1,'2018-04-28 00:02:56',NULL,'/api/v1/dashboard/user/csotto'),('jacky.chang',1,'2018-04-28 00:03:53',NULL,'/api/v1/property/'),('jacky.chang',1,'2018-04-28 00:03:53',NULL,'/api/v1/config/9'),('jacky.chang',1,'2018-04-28 00:03:53',NULL,'/api/v1/staff/'),('jacky.chang',1,'2018-04-28 00:03:53',NULL,'/api/v1/config/7'),('jacky.chang',1,'2018-04-28 00:03:53',NULL,'/api/v1/config/8'),('jacky.chang',1,'2018-04-28 00:03:57',NULL,'/api/v1/config/7'),('jacky.chang',1,'2018-04-28 00:03:57',NULL,'/api/v1/config/8'),('jacky.chang',1,'2018-04-28 00:03:57',NULL,'/api/v1/staff/jacky.chang'),('jacky.chang',1,'2018-04-28 00:03:57',NULL,'/api/v1/config/1'),('jacky.chang',1,'2018-04-28 00:03:57',NULL,'/api/v1/config/2'),('jacky.chang',1,'2018-04-28 00:03:57',NULL,'/api/v1/user/getstatus/jacky.chang'),('jacky.chang',1,'2018-04-28 00:03:57',NULL,'/api/v1/claim/staff/jacky.chang'),('jacky.chang',1,'2018-04-28 00:04:00',NULL,'/api/v1/staff/'),('jacky.chang',1,'2018-04-28 00:04:00',NULL,'/api/v1/config/7'),('jacky.chang',1,'2018-04-28 00:04:00',NULL,'/api/v1/config/8'),('jacky.chang',1,'2018-04-28 00:04:01',NULL,'/api/v1/config/7'),('jacky.chang',1,'2018-04-28 00:04:01',NULL,'/api/v1/config/8'),('jacky.chang',1,'2018-04-28 00:04:01',NULL,'/api/v1/config/1'),('jacky.chang',1,'2018-04-28 00:04:01',NULL,'/api/v1/config/2'),('jacky.chang',1,'2018-04-28 00:04:01',NULL,'/api/v1/staff/amber.sheppard'),('jacky.chang',1,'2018-04-28 00:04:01',NULL,'/api/v1/user/getstatus/amber.sheppard'),('jacky.chang',1,'2018-04-28 00:04:01',NULL,'/api/v1/claim/staff/amber.sheppard'),('jacky.chang',1,'2018-04-28 00:04:10',NULL,'/api/v1/dashboard/user/csotto'),('csotto',1,'2018-04-28 00:04:12',NULL,'/api/v1/config/3'),('csotto',1,'2018-04-28 00:04:12',NULL,'/api/v1/config/4'),('csotto',1,'2018-04-28 00:04:12',NULL,'/api/v1/claim/all/undefined/undefined'),('csotto',1,'2018-04-28 00:04:12',NULL,'/api/v1/claim/all/undefined/undefined'),('csotto',1,'2018-04-28 00:04:14',NULL,'/api/v1/config/3'),('csotto',1,'2018-04-28 00:04:14',NULL,'/api/v1/config/11'),('jacky.chang',1,'2018-04-28 00:04:38',NULL,'/api/v1/address/search/?q=c'),('jacky.chang',1,'2018-04-28 00:04:38',NULL,'/api/v1/address/search/?q=ch'),('jacky.chang',1,'2018-04-28 00:04:38',NULL,'/api/v1/address/search/?q=cha'),('jacky.chang',1,'2018-04-28 00:04:38',NULL,'/api/v1/address/search/?q=chal'),('jacky.chang',1,'2018-04-28 00:04:39',NULL,'/api/v1/address/search/?q=chalm'),('jacky.chang',1,'2018-04-28 00:04:39',NULL,'/api/v1/address/search/?q=chalmer'),('jacky.chang',1,'2018-04-28 00:04:39',NULL,'/api/v1/address/search/?q=chalmers'),('jacky.chang',1,'2018-04-28 00:04:39',NULL,'/api/v1/address/search/?q=chalmers'),('jacky.chang',1,'2018-04-28 00:04:39',NULL,'/api/v1/address/search/?q=chalmers'),('jacky.chang',1,'2018-04-28 00:04:40',NULL,'/api/v1/address/search/?q=chalmers%20st'),('jacky.chang',1,'2018-04-28 00:04:40',NULL,'/api/v1/address/search/?q=chalmers%20st'),('jacky.chang',1,'2018-04-28 00:04:40',NULL,'/api/v1/address/search/?q=chalmers%20stt'),('jacky.chang',1,'2018-04-28 00:04:41',NULL,'/api/v1/address/search/?q=chalmers%20str'),('jacky.chang',1,'2018-04-28 00:04:41',NULL,'/api/v1/address/search/?q=chalmers%20stre'),('jacky.chang',1,'2018-04-28 00:04:41',NULL,'/api/v1/address/search/?q=chalmers%20stre'),('jacky.chang',1,'2018-04-28 00:04:41',NULL,'/api/v1/address/search/?q=chalmers%20street'),('jacky.chang',1,'2018-04-28 00:04:42',NULL,'/api/v1/address/search/?q=chalmers%20street'),('jacky.chang',1,'2018-04-28 00:04:43',NULL,'/api/v1/address/search/?q=chalmers%20street'),('jacky.chang',1,'2018-04-28 00:04:43',NULL,'/api/v1/address/search/?q=chalmers%20street'),('jacky.chang',1,'2018-04-28 00:04:43',NULL,'/api/v1/address/search/?q=undefined'),('jacky.chang',1,'2018-04-28 00:04:47',NULL,'/api/v1/address/search/?q=d'),('jacky.chang',1,'2018-04-28 00:04:48',NULL,'/api/v1/address/search/?q=du'),('jacky.chang',1,'2018-04-28 00:04:48',NULL,'/api/v1/address/search/?q=dum'),('jacky.chang',1,'2018-04-28 00:04:48',NULL,'/api/v1/address/search/?q=dumo'),('jacky.chang',1,'2018-04-28 00:04:49',NULL,'/api/v1/address/search/?q=dum'),('jacky.chang',1,'2018-04-28 00:04:49',NULL,'/api/v1/address/search/?q=du'),('jacky.chang',1,'2018-04-28 00:04:49',NULL,'/api/v1/address/search/?q=d'),('jacky.chang',1,'2018-04-28 00:04:49',NULL,'/api/v1/address/search/?q=dr'),('jacky.chang',1,'2018-04-28 00:04:49',NULL,'/api/v1/address/search/?q=dry'),('jacky.chang',1,'2018-04-28 00:04:50',NULL,'/api/v1/address/search/?q=dr'),('jacky.chang',1,'2018-04-28 00:04:50',NULL,'/api/v1/address/search/?q=dru'),('jacky.chang',1,'2018-04-28 00:04:50',NULL,'/api/v1/address/search/?q=drum'),('jacky.chang',1,'2018-04-28 00:04:50',NULL,'/api/v1/address/search/?q=drumo'),('jacky.chang',1,'2018-04-28 00:04:51',NULL,'/api/v1/address/search/?q=drumoy'),('jacky.chang',1,'2018-04-28 00:04:51',NULL,'/api/v1/address/search/?q=drumoyn'),('jacky.chang',1,'2018-04-28 00:04:51',NULL,'/api/v1/address/search/?q=drumoynn'),('jacky.chang',1,'2018-04-28 00:04:51',NULL,'/api/v1/address/search/?q=drumoynne'),('jacky.chang',1,'2018-04-28 00:04:53',NULL,'/api/v1/address/search/?q=drumoynne'),('jacky.chang',1,'2018-04-28 00:04:53',NULL,'/api/v1/address/search/?q=drumoynne'),('jacky.chang',1,'2018-04-28 00:04:53',NULL,'/api/v1/address/search/?q=undefined'),('jacky.chang',1,'2018-04-28 00:04:54',NULL,'/api/v1/address/search/?q=d'),('jacky.chang',1,'2018-04-28 00:04:54',NULL,'/api/v1/address/search/?q=dru'),('jacky.chang',1,'2018-04-28 00:04:54',NULL,'/api/v1/address/search/?q=dru'),('jacky.chang',1,'2018-04-28 00:04:55',NULL,'/api/v1/address/search/?q=drum'),('jacky.chang',1,'2018-04-28 00:04:57',NULL,'/api/v1/address/search/?q=drumo'),('jacky.chang',1,'2018-04-28 00:04:57',NULL,'/api/v1/address/search/?q=drum'),('jacky.chang',1,'2018-04-28 00:04:58',NULL,'/api/v1/address/search/?q=drumm'),('jacky.chang',1,'2018-04-28 00:04:58',NULL,'/api/v1/address/search/?q=drummo'),('jacky.chang',1,'2018-04-28 00:05:00',NULL,'/api/v1/address/search/?q=drummoy'),('jacky.chang',1,'2018-04-28 00:05:02',NULL,'/api/v1/address/search/?q=drummoyn'),('jacky.chang',1,'2018-04-28 00:05:04',NULL,'/api/v1/address/search/?q=drummoyne'),('jacky.chang',1,'2018-04-28 00:05:05',NULL,'/api/v1/address/search/?q=drummoyne'),('jacky.chang',1,'2018-04-28 00:05:06',NULL,'/api/v1/address/search/?q=drummoyne%20n'),('jacky.chang',1,'2018-04-28 00:05:06',NULL,'/api/v1/address/search/?q=drummoyne%20ns'),('jacky.chang',1,'2018-04-28 00:05:08',NULL,'/api/v1/address/complete/?q=9%20Drummoyne%20Avenue,%20DRUMMOYNE%20NSW%202047'),('csotto',1,'2018-04-28 00:05:25',NULL,'/api/v1/property/canonical/64acda72-3d2f-4cde-bdbb-d8f6f4f6cd34'),('csotto',1,'2018-04-28 00:05:25',NULL,'/api/v1/property/new'),('csotto',1,'2018-04-28 00:05:25',NULL,'/api/v1/claim/new'),('csotto',1,'2018-04-28 00:05:28',NULL,'/api/v1/config/3'),('csotto',1,'2018-04-28 00:05:28',NULL,'/api/v1/config/4'),('csotto',1,'2018-04-28 00:05:28',NULL,'/api/v1/claim/all/undefined/undefined'),('csotto',1,'2018-04-28 00:05:28',NULL,'/api/v1/claim/all/undefined/undefined'),('csotto',1,'2018-04-28 00:05:46',NULL,'/api/v1/claim/all/2018%20March%2001/undefined'),('csotto',1,'2018-04-28 00:05:54',NULL,'/api/v1/claim/all/2018%20March%2001/2018%20March%2030'),('csotto',1,'2018-04-28 00:05:58',NULL,'/api/v1/claim/all/2018%20March%2001/2018%20February%2007'),('csotto',1,'2018-04-28 00:06:02',NULL,'/api/v1/claim/all/2018%20March%2001/2018%20April%2018'),('csotto',1,'2018-04-28 00:06:26',NULL,'/api/v1/config/3'),('csotto',1,'2018-04-28 00:06:26',NULL,'/api/v1/config/4'),('csotto',1,'2018-04-28 00:06:26',NULL,'/api/v1/claim/all/undefined/undefined'),('csotto',1,'2018-04-28 00:06:26',NULL,'/api/v1/claim/all/undefined/undefined'),('csotto',1,'2018-04-28 00:06:30',NULL,'/api/v1/claim/all/2018%20March%2001/undefined'),('csotto',1,'2018-04-28 00:06:35',NULL,'/api/v1/claim/all/2018%20March%2001/2018%20March%2008'),('csotto',1,'2018-04-28 00:06:40',NULL,'/api/v1/claim/all/2018%20March%2001/2018%20April%2030'),('csotto',1,'2018-04-28 00:06:43',NULL,'/api/v1/claim/1000'),('csotto',1,'2018-04-28 00:06:43',NULL,'/api/v1/worklog/workitems/1000'),('csotto',1,'2018-04-28 00:06:43',NULL,'/api/v1/claim/assign/1000'),('csotto',1,'2018-04-28 00:06:43',NULL,'/api/v1/config/3'),('csotto',1,'2018-04-28 00:06:43',NULL,'/api/v1/config/11'),('csotto',1,'2018-04-28 00:06:52',NULL,'/api/v1/config/3'),('csotto',1,'2018-04-28 00:06:52',NULL,'/api/v1/config/4'),('csotto',1,'2018-04-28 00:06:52',NULL,'/api/v1/claim/all/undefined/undefined'),('csotto',1,'2018-04-28 00:06:52',NULL,'/api/v1/claim/all/undefined/undefined'),('csotto',1,'2018-04-28 00:07:01',NULL,'/api/v1/config/3'),('csotto',1,'2018-04-28 00:07:01',NULL,'/api/v1/config/11'),('csotto',1,'2018-04-28 00:07:03',NULL,'/api/v1/config/3'),('csotto',1,'2018-04-28 00:07:03',NULL,'/api/v1/config/4'),('csotto',1,'2018-04-28 00:07:03',NULL,'/api/v1/claim/all/undefined/undefined'),('csotto',1,'2018-04-28 00:07:03',NULL,'/api/v1/claim/all/undefined/undefined'),('csotto',1,'2018-04-28 00:07:04',NULL,'/api/v1/config/3'),('csotto',1,'2018-04-28 00:07:04',NULL,'/api/v1/config/11'),('csotto',1,'2018-04-28 00:07:29',NULL,'/api/v1/address/search/?q=undefined'),('csotto',1,'2018-04-28 00:07:36',NULL,'/api/v1/address/search/?q=l'),('csotto',1,'2018-04-28 00:07:36',NULL,'/api/v1/address/search/?q=lei'),('csotto',1,'2018-04-28 00:07:36',NULL,'/api/v1/address/search/?q=lei'),('csotto',1,'2018-04-28 00:07:37',NULL,'/api/v1/address/search/?q=leich'),('csotto',1,'2018-04-28 00:07:37',NULL,'/api/v1/address/search/?q=leich'),('csotto',1,'2018-04-28 00:07:37',NULL,'/api/v1/address/search/?q=leichar'),('csotto',1,'2018-04-28 00:07:37',NULL,'/api/v1/address/search/?q=leichar'),('csotto',1,'2018-04-28 00:07:37',NULL,'/api/v1/address/search/?q=leichard'),('csotto',1,'2018-04-28 00:07:41',NULL,'/api/v1/address/search/?q=leichard'),('csotto',1,'2018-04-28 00:07:41',NULL,'/api/v1/address/search/?q=leichard%20ns'),('csotto',1,'2018-04-28 00:07:41',NULL,'/api/v1/address/search/?q=leichard%20ns'),('csotto',1,'2018-04-28 00:07:41',NULL,'/api/v1/address/search/?q=leichard%20nsw'),('csotto',1,'2018-04-28 00:07:47',NULL,'/api/v1/address/search/?q=leichardt%20nsw'),('csotto',1,'2018-04-28 00:07:49',NULL,'/api/v1/address/search/?q=leichardt%20nsw'),('csotto',1,'2018-04-28 00:07:49',NULL,'/api/v1/address/search/?q=leichardt%20nsw'),('csotto',1,'2018-04-28 00:07:50',NULL,'/api/v1/address/search/?q=leichardt%20nsw'),('csotto',1,'2018-04-28 00:07:50',NULL,'/api/v1/address/search/?q=undefined'),('csotto',1,'2018-04-28 00:07:54',NULL,'/api/v1/address/search/?q=fi'),('csotto',1,'2018-04-28 00:07:54',NULL,'/api/v1/address/search/?q=fi'),('csotto',1,'2018-04-28 00:07:54',NULL,'/api/v1/address/search/?q=five'),('csotto',1,'2018-04-28 00:07:54',NULL,'/api/v1/address/search/?q=five'),('csotto',1,'2018-04-28 00:07:55',NULL,'/api/v1/address/search/?q=five'),('csotto',1,'2018-04-28 00:07:55',NULL,'/api/v1/address/search/?q=five%20do'),('csotto',1,'2018-04-28 00:07:55',NULL,'/api/v1/address/search/?q=five%20do'),('csotto',1,'2018-04-28 00:07:55',NULL,'/api/v1/address/search/?q=five%20dock'),('csotto',1,'2018-04-28 00:07:55',NULL,'/api/v1/address/search/?q=five%20dock'),('csotto',1,'2018-04-28 00:07:57',NULL,'/api/v1/address/complete/?q=15%20Hycraft%20Walk,%20FIVE%20DOCK%20NSW%202046'),('csotto',1,'2018-04-28 00:08:21',NULL,'/api/v1/property/canonical/449ee81a-e973-47ad-ba71-c83468bf0758'),('csotto',1,'2018-04-28 00:08:21',NULL,'/api/v1/property/new'),('csotto',1,'2018-04-28 00:08:21',NULL,'/api/v1/claim/new'),('csotto',1,'2018-04-28 00:08:28',NULL,'/api/v1/config/3'),('csotto',1,'2018-04-28 00:08:28',NULL,'/api/v1/config/4'),('csotto',1,'2018-04-28 00:08:28',NULL,'/api/v1/claim/all/undefined/undefined'),('csotto',1,'2018-04-28 00:08:28',NULL,'/api/v1/claim/all/undefined/undefined'),('jacky.chang',1,'2018-04-28 00:08:37',NULL,'/api/v1/customer'),('jacky.chang',1,'2018-04-28 00:08:37',NULL,'/api/v1/config/6'),('jacky.chang',1,'2018-04-28 00:08:39',NULL,'/api/v1/config/6'),('jacky.chang',1,'2018-04-28 00:08:39',NULL,'/api/v1/config/2'),('jacky.chang',1,'2018-04-28 00:08:57',NULL,'/api/v1/address/search/?q=P'),('jacky.chang',1,'2018-04-28 00:08:57',NULL,'/api/v1/address/search/?q=P'),('jacky.chang',1,'2018-04-28 00:08:57',NULL,'/api/v1/address/search/?q=Pal'),('jacky.chang',1,'2018-04-28 00:08:58',NULL,'/api/v1/address/search/?q=Pal'),('jacky.chang',1,'2018-04-28 00:08:58',NULL,'/api/v1/address/search/?q=Pa'),('jacky.chang',1,'2018-04-28 00:08:59',NULL,'/api/v1/address/search/?q=P'),('jacky.chang',1,'2018-04-28 00:08:59',NULL,'/api/v1/address/search/?q='),('jacky.chang',1,'2018-04-28 00:08:59',NULL,'/api/v1/address/search/?q='),('jacky.chang',1,'2018-04-28 00:09:21',NULL,'/api/v1/address/search/?q=a'),('jacky.chang',1,'2018-04-28 00:09:22',NULL,'/api/v1/address/search/?q=al'),('jacky.chang',1,'2018-04-28 00:09:22',NULL,'/api/v1/address/search/?q=all'),('jacky.chang',1,'2018-04-28 00:09:22',NULL,'/api/v1/address/search/?q=allen'),('jacky.chang',1,'2018-04-28 00:09:22',NULL,'/api/v1/address/search/?q=allen'),('jacky.chang',1,'2018-04-28 00:09:22',NULL,'/api/v1/address/search/?q=allen'),('jacky.chang',1,'2018-04-28 00:09:23',NULL,'/api/v1/address/search/?q=allen%20st'),('jacky.chang',1,'2018-04-28 00:09:23',NULL,'/api/v1/address/search/?q=allen%20st'),('jacky.chang',1,'2018-04-28 00:09:23',NULL,'/api/v1/address/search/?q=allen%20st'),('jacky.chang',1,'2018-04-28 00:09:31',NULL,'/api/v1/address/search/?q=allen%20st%20le'),('jacky.chang',1,'2018-04-28 00:09:31',NULL,'/api/v1/address/search/?q=allen%20st%20le'),('jacky.chang',1,'2018-04-28 00:09:31',NULL,'/api/v1/address/search/?q=allen%20st%20lei'),('jacky.chang',1,'2018-04-28 00:09:32',NULL,'/api/v1/address/search/?q=allen%20st%20leich'),('jacky.chang',1,'2018-04-28 00:09:32',NULL,'/api/v1/address/search/?q=allen%20st%20leich'),('jacky.chang',1,'2018-04-28 00:09:39',NULL,'/api/v1/address/complete/?q=30%20Allen%20Street,%20LEICHHARDT%20NSW%202040'),('jacky.chang',1,'2018-04-28 00:09:41',NULL,'/api/v1/customer/miles'),('jacky.chang',1,'2018-04-28 00:09:41',NULL,'/api/v1/config/6'),('jacky.chang',1,'2018-04-28 00:09:41',NULL,'/api/v1/config/2'),('jacky.chang',1,'2018-04-28 00:09:41',NULL,'/api/v1/user/getstatus/miles'),('jacky.chang',1,'2018-04-28 00:09:41',NULL,'/api/v1/claim/user/miles'),('jacky.chang',1,'2018-04-28 00:09:54',NULL,'/api/v1/user/changestatus'),('miles',1,'2018-04-28 00:10:05',NULL,'/api/v1/dashboard/user/miles'),('csotto',1,'2018-04-28 00:10:11',NULL,'/api/v1/config/3'),('csotto',1,'2018-04-28 00:10:11',NULL,'/api/v1/config/4'),('csotto',1,'2018-04-28 00:10:11',NULL,'/api/v1/claim/all/undefined/undefined'),('csotto',1,'2018-04-28 00:10:11',NULL,'/api/v1/claim/all/undefined/undefined'),('csotto',1,'2018-04-28 00:10:15',NULL,'/api/v1/config/3'),('csotto',1,'2018-04-28 00:10:15',NULL,'/api/v1/config/11'),('csotto',1,'2018-04-28 00:10:43',NULL,'/api/v1/address/search/?q=undefined'),('csotto',1,'2018-04-28 00:10:44',NULL,'/api/v1/address/search/?q=al'),('csotto',1,'2018-04-28 00:10:44',NULL,'/api/v1/address/search/?q=al'),('csotto',1,'2018-04-28 00:10:44',NULL,'/api/v1/address/search/?q=ale'),('csotto',1,'2018-04-28 00:10:45',NULL,'/api/v1/address/search/?q=al'),('csotto',1,'2018-04-28 00:10:45',NULL,'/api/v1/address/search/?q=alle'),('csotto',1,'2018-04-28 00:10:45',NULL,'/api/v1/address/search/?q=allen'),('csotto',1,'2018-04-28 00:10:45',NULL,'/api/v1/address/search/?q=allen'),('csotto',1,'2018-04-28 00:10:45',NULL,'/api/v1/address/search/?q=allen'),('csotto',1,'2018-04-28 00:10:46',NULL,'/api/v1/address/search/?q=allen%20s'),('csotto',1,'2018-04-28 00:10:46',NULL,'/api/v1/address/search/?q=allen%20st'),('csotto',1,'2018-04-28 00:10:47',NULL,'/api/v1/address/search/?q=allen%20st'),('csotto',1,'2018-04-28 00:10:47',NULL,'/api/v1/address/search/?q=allen%20st%20le'),('csotto',1,'2018-04-28 00:10:47',NULL,'/api/v1/address/search/?q=allen%20st%20le'),('csotto',1,'2018-04-28 00:10:47',NULL,'/api/v1/address/search/?q=allen%20st%20lei'),('csotto',1,'2018-04-28 00:10:47',NULL,'/api/v1/address/search/?q=allen%20st%20leich'),('csotto',1,'2018-04-28 00:10:48',NULL,'/api/v1/address/search/?q=allen%20st%20leich'),('csotto',1,'2018-04-28 00:10:49',NULL,'/api/v1/address/complete/?q=30%20Allen%20Street,%20LEICHHARDT%20NSW%202040'),('csotto',1,'2018-04-28 00:11:16',NULL,'/api/v1/property/canonical/b8c563e1-d77f-45ff-879c-afdbde123057'),('csotto',1,'2018-04-28 00:11:16',NULL,'/api/v1/property/new'),('csotto',1,'2018-04-28 00:11:16',NULL,'/api/v1/claim/new'),('csotto',1,'2018-04-28 00:11:20',NULL,'/api/v1/config/3'),('csotto',1,'2018-04-28 00:11:20',NULL,'/api/v1/config/4'),('csotto',1,'2018-04-28 00:11:20',NULL,'/api/v1/claim/all/undefined/undefined'),('csotto',1,'2018-04-28 00:11:20',NULL,'/api/v1/claim/all/undefined/undefined'),('jacky.chang',1,'2018-04-28 00:11:25',NULL,'/api/v1/customer'),('jacky.chang',1,'2018-04-28 00:11:25',NULL,'/api/v1/config/6'),('jacky.chang',1,'2018-04-28 00:11:27',NULL,'/api/v1/config/6'),('jacky.chang',1,'2018-04-28 00:11:27',NULL,'/api/v1/customer/miles'),('jacky.chang',1,'2018-04-28 00:11:27',NULL,'/api/v1/config/2'),('jacky.chang',1,'2018-04-28 00:11:27',NULL,'/api/v1/user/getstatus/miles'),('jacky.chang',1,'2018-04-28 00:11:27',NULL,'/api/v1/claim/user/miles'),('jacky.chang',1,'2018-04-28 00:11:29',NULL,'/api/v1/claim/1002'),('jacky.chang',1,'2018-04-28 00:11:29',NULL,'/api/v1/worklog/workitems/1002'),('jacky.chang',1,'2018-04-28 00:11:29',NULL,'/api/v1/claim/assign/1002'),('jacky.chang',1,'2018-04-28 00:11:29',NULL,'/api/v1/config/3'),('jacky.chang',1,'2018-04-28 00:11:29',NULL,'/api/v1/config/11'),('jacky.chang',1,'2018-04-28 00:11:29',NULL,'/api/v1/config/4'),('csotto',1,'2018-04-28 00:11:52',NULL,'/api/v1/customer/miles'),('csotto',1,'2018-04-28 00:11:52',NULL,'/api/v1/config/6'),('csotto',1,'2018-04-28 00:11:52',NULL,'/api/v1/config/7'),('csotto',1,'2018-04-28 00:11:52',NULL,'/api/v1/config/8'),('csotto',1,'2018-04-28 00:11:56',NULL,'/api/v1/address/complete/?q=30%20Allen%20Street%20%20LEICHHARDT%20NSW%202040'),('csotto',1,'2018-04-28 00:11:56',NULL,'/api/v1/customer/update'),('miles',1,'2018-04-28 00:11:56',NULL,'/api/v1/user/update'),('jacky.chang',1,'2018-04-28 00:12:24',NULL,'/api/v1/worklog/new'),('jacky.chang',1,'2018-04-28 00:12:25',NULL,'/api/v1/worklog/workitems/1002'),('jacky.chang',1,'2018-04-28 00:12:25',NULL,'/api/v1/notification/inspection'),('jacky.chang',1,'2018-04-28 00:12:33',NULL,'/api/v1/staff/search/?query=Unassigned'),('jacky.chang',1,'2018-04-28 00:12:33',NULL,'/api/v1/staff/search/?query=Unassigned'),('jacky.chang',1,'2018-04-28 00:12:33',NULL,'/api/v1/staff/search/?query=ja'),('jacky.chang',1,'2018-04-28 00:12:33',NULL,'/api/v1/staff/search/?query=jac'),('jacky.chang',1,'2018-04-28 00:12:33',NULL,'/api/v1/staff/search/?query=jack'),('jacky.chang',1,'2018-04-28 00:12:33',NULL,'/api/v1/staff/search/?query=jack'),('jacky.chang',1,'2018-04-28 00:12:34',NULL,'/api/v1/staff/search/?query=jack'),('jacky.chang',1,'2018-04-28 00:12:34',NULL,'/api/v1/staff/search/?query=Unassigned'),('jacky.chang',1,'2018-04-28 00:12:35',NULL,'/api/v1/staff/search/?query=Unassigned'),('jacky.chang',1,'2018-04-28 00:12:35',NULL,'/api/v1/staff/search/?query=Unassigned'),('jacky.chang',1,'2018-04-28 00:12:36',NULL,'/api/v1/staff/search/?query=ja'),('jacky.chang',1,'2018-04-28 00:12:36',NULL,'/api/v1/staff/search/?query=jac'),('jacky.chang',1,'2018-04-28 00:12:36',NULL,'/api/v1/staff/search/?query=jack'),('jacky.chang',1,'2018-04-28 00:12:36',NULL,'/api/v1/staff/search/?query=jack'),('jacky.chang',1,'2018-04-28 00:12:38',NULL,'/api/v1/claim/assign'),('jacky.chang',1,'2018-04-28 00:12:38',NULL,'/api/v1/claim/assign/1002'),('jacky.chang',1,'2018-04-28 00:12:38',NULL,'/api/v1/claim/status/'),('jacky.chang',1,'2018-04-28 00:12:46',NULL,'/api/v1/claim/status/'),('jacky.chang',1,'2018-04-28 00:12:46',NULL,'/api/v1/notification/claimstatus'),('jacky.chang',1,'2018-04-28 00:12:53',NULL,'/api/v1/dashboard/staff/jacky.chang'),('jacky.chang',1,'2018-04-28 00:12:53',NULL,'/api/v1/dashboard/calendar/jacky.chang'),('jacky.chang',1,'2018-04-28 00:12:53',NULL,'/api/v1/dashboard/admin/'),('jacky.chang',1,'2018-04-28 00:13:01',NULL,'/api/v1/config/3'),('jacky.chang',1,'2018-04-28 00:13:01',NULL,'/api/v1/config/4'),('jacky.chang',1,'2018-04-28 00:13:01',NULL,'/api/v1/claim/all/undefined/undefined'),('jacky.chang',1,'2018-04-28 00:13:01',NULL,'/api/v1/claim/all/undefined/undefined'),('jacky.chang',1,'2018-04-28 00:13:04',NULL,'/api/v1/config/3'),('jacky.chang',1,'2018-04-28 00:13:04',NULL,'/api/v1/config/4'),('jacky.chang',1,'2018-04-28 00:13:04',NULL,'/api/v1/claim/1002'),('jacky.chang',1,'2018-04-28 00:13:04',NULL,'/api/v1/worklog/workitems/1002'),('jacky.chang',1,'2018-04-28 00:13:04',NULL,'/api/v1/claim/assign/1002'),('jacky.chang',1,'2018-04-28 00:13:04',NULL,'/api/v1/config/11'),('jacky.chang',1,'2018-04-28 00:15:11',NULL,'/api/v1/claim/1002'),('jacky.chang',1,'2018-04-28 00:15:11',NULL,'/api/v1/worklog/workitems/1002'),('jacky.chang',1,'2018-04-28 00:15:11',NULL,'/api/v1/claim/assign/1002'),('jacky.chang',1,'2018-04-28 00:15:11',NULL,'/api/v1/config/11'),('jacky.chang',1,'2018-04-28 00:15:11',NULL,'/api/v1/config/3'),('jacky.chang',1,'2018-04-28 00:15:11',NULL,'/api/v1/config/4'),('miles',1,'2018-04-28 00:15:20',NULL,'/api/v1/dashboard/user/miles'),('csotto',1,'2018-04-28 00:15:21',NULL,'/api/v1/config/3'),('csotto',1,'2018-04-28 00:15:21',NULL,'/api/v1/config/4'),('csotto',1,'2018-04-28 00:15:21',NULL,'/api/v1/claim/all/undefined/undefined'),('csotto',1,'2018-04-28 00:15:21',NULL,'/api/v1/claim/all/undefined/undefined'),('csotto',1,'2018-04-28 00:15:22',NULL,'/api/v1/config/3'),('csotto',1,'2018-04-28 00:15:22',NULL,'/api/v1/claim/1002'),('csotto',1,'2018-04-28 00:15:22',NULL,'/api/v1/worklog/workitems/1002'),('csotto',1,'2018-04-28 00:15:22',NULL,'/api/v1/claim/assign/1002'),('csotto',1,'2018-04-28 00:15:22',NULL,'/api/v1/config/11'),('jacky.chang',1,'2018-04-28 00:16:33',NULL,'/api/v1/worklog/new'),('jacky.chang',1,'2018-04-28 00:16:33',NULL,'/api/v1/worklog/workitems/1002'),('jacky.chang',1,'2018-04-28 00:16:36',NULL,'/api/v1/claim/status/'),('jacky.chang',1,'2018-04-28 00:16:39',NULL,'/api/v1/claim/approve/'),('jacky.chang',1,'2018-04-28 00:16:39',NULL,'/api/v1/claim/status/'),('jacky.chang',1,'2018-04-28 00:16:39',NULL,'/api/v1/notification/claimstatus'),('jacky.chang',1,'2018-04-28 00:16:47',NULL,'/api/v1/claim/status/'),('jacky.chang',1,'2018-04-28 00:17:10',NULL,'/api/v1/worklog/new'),('jacky.chang',1,'2018-04-28 00:17:10',NULL,'/api/v1/worklog/workitems/1002'),('jacky.chang',1,'2018-04-28 00:17:21',NULL,'/api/v1/config/3'),('jacky.chang',1,'2018-04-28 00:17:21',NULL,'/api/v1/config/4'),('jacky.chang',1,'2018-04-28 00:17:21',NULL,'/api/v1/claim/all/undefined/undefined'),('jacky.chang',1,'2018-04-28 00:17:21',NULL,'/api/v1/claim/all/undefined/undefined'),('jacky.chang',1,'2018-04-28 00:17:27',NULL,'/api/v1/stats/completion/undefined'),('jacky.chang',1,'2018-04-28 00:17:27',NULL,'/api/v1/stats/suburb/undefined'),('jacky.chang',1,'2018-04-28 00:17:27',NULL,'/api/v1/stats/requesttype/undefined'),('jacky.chang',1,'2018-04-28 00:17:27',NULL,'/api/v1/stats/staff/undefined'),('jacky.chang',1,'2018-04-28 00:17:27',NULL,'/api/v1/stats/requestduration/undefined'),('jacky.chang',1,'2018-04-28 00:17:27',NULL,'/api/v1/stats/requestcount/undefined'),('jacky.chang',1,'2018-04-28 00:17:27',NULL,'/api/v1/stats/customer/undefined'),('jacky.chang',1,'2018-04-28 00:17:36',NULL,'/api/v1/staff/jacky.chang'),('jacky.chang',1,'2018-04-28 00:17:36',NULL,'/api/v1/config/7'),('jacky.chang',1,'2018-04-28 00:17:36',NULL,'/api/v1/config/8'),('jacky.chang',1,'2018-04-28 00:17:36',NULL,'/api/v1/config/2'),('jacky.chang',1,'2018-04-28 00:17:36',NULL,'/api/v1/config/1'),('jacky.chang',1,'2018-04-28 00:17:36',NULL,'/api/v1/user/getstatus/jacky.chang'),('jacky.chang',1,'2018-04-28 00:17:36',NULL,'/api/v1/claim/staff/jacky.chang'),('jacky.chang',1,'2018-04-28 00:17:38',NULL,'/api/v1/claim/1002'),('jacky.chang',1,'2018-04-28 00:17:38',NULL,'/api/v1/worklog/workitems/1002'),('jacky.chang',1,'2018-04-28 00:17:38',NULL,'/api/v1/claim/assign/1002'),('jacky.chang',1,'2018-04-28 00:17:38',NULL,'/api/v1/config/3'),('jacky.chang',1,'2018-04-28 00:17:38',NULL,'/api/v1/config/11'),('jacky.chang',1,'2018-04-28 00:17:38',NULL,'/api/v1/config/4'),('jacky.chang',1,'2018-04-28 00:17:44',NULL,'/api/v1/claim/status/'),('jacky.chang',1,'2018-04-28 00:17:44',NULL,'/api/v1/notification/claimstatus'),('jacky.chang',1,'2018-04-28 00:17:47',NULL,'/api/v1/stats/completion/undefined'),('jacky.chang',1,'2018-04-28 00:17:47',NULL,'/api/v1/stats/suburb/undefined'),('jacky.chang',1,'2018-04-28 00:17:47',NULL,'/api/v1/stats/requesttype/undefined'),('jacky.chang',1,'2018-04-28 00:17:47',NULL,'/api/v1/stats/requestcount/undefined'),('jacky.chang',1,'2018-04-28 00:17:47',NULL,'/api/v1/stats/requestduration/undefined'),('jacky.chang',1,'2018-04-28 00:17:47',NULL,'/api/v1/stats/staff/undefined'),('jacky.chang',1,'2018-04-28 00:17:47',NULL,'/api/v1/stats/customer/undefined'),('jacky.chang',1,'2018-04-28 00:18:02',NULL,'/api/v1/property/'),('jacky.chang',1,'2018-04-28 00:18:02',NULL,'/api/v1/config/9'),('miles',1,'2018-04-28 00:18:08',NULL,'/api/v1/claim/1002'),('miles',1,'2018-04-28 00:18:08',NULL,'/api/v1/worklog/workitems/1002'),('miles',1,'2018-04-28 00:18:08',NULL,'/api/v1/claim/assign/1002'),('miles',1,'2018-04-28 00:18:08',NULL,'/api/v1/config/11'),('miles',1,'2018-04-28 00:18:08',NULL,'/api/v1/config/3'),('miles',1,'2018-04-28 00:18:24',NULL,'/api/v1/config/3'),('miles',1,'2018-04-28 00:18:24',NULL,'/api/v1/config/4'),('miles',1,'2018-04-28 00:18:24',NULL,'/api/v1/claim/all/undefined/undefined'),('miles',1,'2018-04-28 00:18:24',NULL,'/api/v1/claim/all/undefined/undefined'),('miles',1,'2018-04-28 00:18:26',NULL,'/api/v1/config/3'),('miles',1,'2018-04-28 00:18:26',NULL,'/api/v1/config/11'),('miles',1,'2018-04-28 00:18:52',NULL,'/api/v1/address/search/?q=undefined'),('miles',1,'2018-04-28 00:18:53',NULL,'/api/v1/address/search/?q=30'),('miles',1,'2018-04-28 00:18:53',NULL,'/api/v1/address/search/?q=30'),('miles',1,'2018-04-28 00:18:53',NULL,'/api/v1/address/search/?q=30%20al'),('miles',1,'2018-04-28 00:18:53',NULL,'/api/v1/address/search/?q=30'),('miles',1,'2018-04-28 00:18:54',NULL,'/api/v1/address/search/?q=30%20al'),('miles',1,'2018-04-28 00:18:54',NULL,'/api/v1/address/search/?q=30%20alle'),('miles',1,'2018-04-28 00:18:54',NULL,'/api/v1/address/search/?q=30%20alle'),('miles',1,'2018-04-28 00:18:54',NULL,'/api/v1/address/search/?q=30%20allen'),('miles',1,'2018-04-28 00:18:55',NULL,'/api/v1/address/search/?q=30%20allen%20s'),('miles',1,'2018-04-28 00:18:55',NULL,'/api/v1/address/search/?q=30%20allen%20st'),('miles',1,'2018-04-28 00:18:55',NULL,'/api/v1/address/search/?q=30%20allen%20st'),('miles',1,'2018-04-28 00:18:55',NULL,'/api/v1/address/search/?q=30%20allen%20st'),('miles',1,'2018-04-28 00:18:55',NULL,'/api/v1/address/search/?q=30%20allen%20st%20le'),('miles',1,'2018-04-28 00:18:56',NULL,'/api/v1/address/search/?q=30%20allen%20st%20le'),('miles',1,'2018-04-28 00:18:56',NULL,'/api/v1/address/search/?q=30%20allen%20st%20lei'),('miles',1,'2018-04-28 00:18:56',NULL,'/api/v1/address/search/?q=30%20allen%20st%20leic'),('miles',1,'2018-04-28 00:18:57',NULL,'/api/v1/address/search/?q=30%20allen%20st%20leic'),('miles',1,'2018-04-28 00:18:58',NULL,'/api/v1/address/complete/?q=30%20Allen%20Street,%20LEICHHARDT%20NSW%202040'),('miles',1,'2018-04-28 00:19:06',NULL,'/api/v1/property/canonical/b8c563e1-d77f-45ff-879c-afdbde123057'),('miles',1,'2018-04-28 00:19:06',NULL,'/api/v1/claim/new'),('miles',1,'2018-04-28 00:19:09',NULL,'/api/v1/config/3'),('miles',1,'2018-04-28 00:19:09',NULL,'/api/v1/config/4'),('miles',1,'2018-04-28 00:19:09',NULL,'/api/v1/claim/all/undefined/undefined'),('miles',1,'2018-04-28 00:19:09',NULL,'/api/v1/claim/all/undefined/undefined'),('jacky.chang',1,'2018-04-28 00:20:00',NULL,'/api/v1/customer'),('jacky.chang',1,'2018-04-28 00:20:00',NULL,'/api/v1/config/6'),('jacky.chang',1,'2018-04-28 00:20:02',NULL,'/api/v1/config/6'),('jacky.chang',1,'2018-04-28 00:20:02',NULL,'/api/v1/customer/heyzel'),('jacky.chang',1,'2018-04-28 00:20:02',NULL,'/api/v1/config/2'),('jacky.chang',1,'2018-04-28 00:20:02',NULL,'/api/v1/user/getstatus/heyzel'),('jacky.chang',1,'2018-04-28 00:20:02',NULL,'/api/v1/claim/user/heyzel'),('jacky.chang',1,'2018-04-28 00:20:07',NULL,'/api/v1/user/changestatus'),('heyzel',1,'2018-04-28 00:20:12',NULL,'/api/v1/dashboard/user/heyzel'),('miles',1,'2018-04-28 00:20:14',NULL,'/api/v1/config/3'),('miles',1,'2018-04-28 00:20:14',NULL,'/api/v1/config/4'),('miles',1,'2018-04-28 00:20:14',NULL,'/api/v1/claim/all/undefined/undefined'),('miles',1,'2018-04-28 00:20:14',NULL,'/api/v1/claim/all/undefined/undefined'),('miles',1,'2018-04-28 00:20:14',NULL,'/api/v1/config/3'),('miles',1,'2018-04-28 00:20:14',NULL,'/api/v1/config/11'),('miles',1,'2018-04-28 00:20:41',NULL,'/api/v1/address/search/?q=undefined'),('miles',1,'2018-04-28 00:20:54',NULL,'/api/v1/address/search/?q=ir'),('miles',1,'2018-04-28 00:20:54',NULL,'/api/v1/address/search/?q=irm'),('miles',1,'2018-04-28 00:20:54',NULL,'/api/v1/address/search/?q=irm'),('miles',1,'2018-04-28 00:20:54',NULL,'/api/v1/address/search/?q=irmon'),('miles',1,'2018-04-28 00:20:55',NULL,'/api/v1/address/search/?q=irmon'),('miles',1,'2018-04-28 00:20:55',NULL,'/api/v1/address/search/?q=irmon'),('miles',1,'2018-04-28 00:20:55',NULL,'/api/v1/address/search/?q=irmon'),('miles',1,'2018-04-28 00:20:55',NULL,'/api/v1/address/search/?q=o'),('miles',1,'2018-04-28 00:20:56',NULL,'/api/v1/address/search/?q=or'),('miles',1,'2018-04-28 00:20:56',NULL,'/api/v1/address/search/?q=ormo'),('miles',1,'2018-04-28 00:20:56',NULL,'/api/v1/address/search/?q=ormon'),('miles',1,'2018-04-28 00:20:57',NULL,'/api/v1/address/search/?q=ormond'),('miles',1,'2018-04-28 00:20:57',NULL,'/api/v1/address/search/?q=ormon'),('miles',1,'2018-04-28 00:20:57',NULL,'/api/v1/address/search/?q=ormond%20st'),('miles',1,'2018-04-28 00:20:57',NULL,'/api/v1/address/search/?q=ormond'),('miles',1,'2018-04-28 00:20:57',NULL,'/api/v1/address/search/?q=ormond%20st'),('miles',1,'2018-04-28 00:20:57',NULL,'/api/v1/address/search/?q=ormond%20st%20a'),('miles',1,'2018-04-28 00:20:57',NULL,'/api/v1/address/search/?q=ormond%20st'),('miles',1,'2018-04-28 00:20:58',NULL,'/api/v1/address/search/?q=ormond%20st%20ash'),('miles',1,'2018-04-28 00:20:58',NULL,'/api/v1/address/search/?q=ormond%20st%20ash'),('miles',1,'2018-04-28 00:20:58',NULL,'/api/v1/address/search/?q=ormond%20st%20ashfi'),('miles',1,'2018-04-28 00:20:58',NULL,'/api/v1/address/search/?q=ormond%20st%20ashfi'),('miles',1,'2018-04-28 00:20:58',NULL,'/api/v1/address/search/?q=ormond%20st%20ashfiel'),('miles',1,'2018-04-28 00:20:58',NULL,'/api/v1/address/search/?q=ormond%20st%20ashfiel'),('miles',1,'2018-04-28 00:20:58',NULL,'/api/v1/address/search/?q=ormond%20st%20ashfield'),('miles',1,'2018-04-28 00:21:00',NULL,'/api/v1/address/complete/?q=2%20Ormond%20Street,%20ASHFIELD%20NSW%202131'),('miles',1,'2018-04-28 00:21:31',NULL,'/api/v1/property/canonical/93171da5-002c-4c49-a410-d011f9e75e4e'),('miles',1,'2018-04-28 00:21:31',NULL,'/api/v1/property/new'),('miles',1,'2018-04-28 00:21:31',NULL,'/api/v1/claim/new'),('miles',1,'2018-04-28 00:21:33',NULL,'/api/v1/config/3'),('miles',1,'2018-04-28 00:21:33',NULL,'/api/v1/claim/all/undefined/undefined'),('miles',1,'2018-04-28 00:21:33',NULL,'/api/v1/config/4'),('miles',1,'2018-04-28 00:21:33',NULL,'/api/v1/claim/all/undefined/undefined'),('jacky.chang',1,'2018-04-28 00:22:45',NULL,'/api/v1/stats/completion/undefined'),('jacky.chang',1,'2018-04-28 00:22:45',NULL,'/api/v1/stats/suburb/undefined'),('jacky.chang',1,'2018-04-28 00:22:45',NULL,'/api/v1/stats/requesttype/undefined'),('jacky.chang',1,'2018-04-28 00:22:45',NULL,'/api/v1/stats/requestcount/undefined'),('jacky.chang',1,'2018-04-28 00:22:45',NULL,'/api/v1/stats/requestduration/undefined'),('jacky.chang',1,'2018-04-28 00:22:45',NULL,'/api/v1/stats/staff/undefined'),('jacky.chang',1,'2018-04-28 00:22:45',NULL,'/api/v1/stats/customer/undefined'),('heyzel',1,'2018-04-28 00:23:03',NULL,'/api/v1/dashboard/user/karezb'),('miles',1,'2018-04-28 00:23:05',NULL,'/api/v1/config/3'),('miles',1,'2018-04-28 00:23:05',NULL,'/api/v1/config/4'),('miles',1,'2018-04-28 00:23:05',NULL,'/api/v1/claim/all/undefined/undefined'),('miles',1,'2018-04-28 00:23:05',NULL,'/api/v1/claim/all/undefined/undefined'),('miles',1,'2018-04-28 00:23:06',NULL,'/api/v1/config/3'),('miles',1,'2018-04-28 00:23:06',NULL,'/api/v1/config/11'),('miles',1,'2018-04-28 00:23:25',NULL,'/api/v1/address/search/?q=undefined'),('miles',1,'2018-04-28 00:23:26',NULL,'/api/v1/address/search/?q=4'),('miles',1,'2018-04-28 00:23:27',NULL,'/api/v1/address/search/?q=4'),('miles',1,'2018-04-28 00:23:27',NULL,'/api/v1/address/search/?q=4%2043'),('miles',1,'2018-04-28 00:23:27',NULL,'/api/v1/address/search/?q=4%2043'),('miles',1,'2018-04-28 00:23:27',NULL,'/api/v1/address/search/?q=4%2043'),('miles',1,'2018-04-28 00:23:28',NULL,'/api/v1/address/search/?q=4%2043%20n'),('miles',1,'2018-04-28 00:23:28',NULL,'/api/v1/address/search/?q=4%2043%20nei'),('miles',1,'2018-04-28 00:23:28',NULL,'/api/v1/address/search/?q=4%2043%20neil'),('miles',1,'2018-04-28 00:23:28',NULL,'/api/v1/address/search/?q=4%2043%20neil'),('miles',1,'2018-04-28 00:23:28',NULL,'/api/v1/address/search/?q=4%2043%20neil%20s'),('miles',1,'2018-04-28 00:23:28',NULL,'/api/v1/address/search/?q=4%2043%20neil%20s'),('miles',1,'2018-04-28 00:23:28',NULL,'/api/v1/address/search/?q=4%2043%20neil%20st'),('miles',1,'2018-04-28 00:23:30',NULL,'/api/v1/address/complete/?q=Unit%204,%2043%20Neil%20Street,%20MERRYLANDS%20NSW%202160'),('miles',1,'2018-04-28 00:23:45',NULL,'/api/v1/property/canonical/fd32a6ff-e98b-44fd-95ab-378672d7da4b'),('miles',1,'2018-04-28 00:23:45',NULL,'/api/v1/property/new'),('miles',1,'2018-04-28 00:23:45',NULL,'/api/v1/claim/new'),('miles',1,'2018-04-28 00:23:47',NULL,'/api/v1/config/3'),('miles',1,'2018-04-28 00:23:47',NULL,'/api/v1/config/4'),('miles',1,'2018-04-28 00:23:47',NULL,'/api/v1/claim/all/undefined/undefined'),('miles',1,'2018-04-28 00:23:47',NULL,'/api/v1/claim/all/undefined/undefined'),('miles',1,'2018-04-28 00:23:53',NULL,'/api/v1/config/3'),('miles',1,'2018-04-28 00:23:53',NULL,'/api/v1/config/11'),('miles',1,'2018-04-28 00:25:04',NULL,'/api/v1/address/search/?q=undefined'),('miles',1,'2018-04-28 00:25:05',NULL,'/api/v1/address/search/?q=4/'),('miles',1,'2018-04-28 00:25:05',NULL,'/api/v1/address/search/?q=4/'),('miles',1,'2018-04-28 00:25:06',NULL,'/api/v1/address/search/?q=4/43'),('miles',1,'2018-04-28 00:25:06',NULL,'/api/v1/address/search/?q=4/43'),('miles',1,'2018-04-28 00:25:06',NULL,'/api/v1/address/search/?q=4/43'),('miles',1,'2018-04-28 00:25:06',NULL,'/api/v1/address/search/?q=4/43%20n'),('miles',1,'2018-04-28 00:25:06',NULL,'/api/v1/address/search/?q=4/43%20n'),('miles',1,'2018-04-28 00:25:07',NULL,'/api/v1/address/search/?q=4/43%20nei'),('miles',1,'2018-04-28 00:25:07',NULL,'/api/v1/address/search/?q=4/43%20neil'),('miles',1,'2018-04-28 00:25:07',NULL,'/api/v1/address/search/?q=4/43%20neil'),('miles',1,'2018-04-28 00:25:07',NULL,'/api/v1/address/search/?q=4/43%20neil'),('miles',1,'2018-04-28 00:25:07',NULL,'/api/v1/address/search/?q=4/43%20neil%20st'),('miles',1,'2018-04-28 00:25:07',NULL,'/api/v1/address/search/?q=4/43%20neil%20st'),('miles',1,'2018-04-28 00:25:09',NULL,'/api/v1/address/complete/?q=Unit%204,%2043%20Neil%20Street,%20MERRYLANDS%20NSW%202160'),('miles',1,'2018-04-28 00:25:34',NULL,'/api/v1/property/canonical/fd32a6ff-e98b-44fd-95ab-378672d7da4b'),('miles',1,'2018-04-28 00:25:34',NULL,'/api/v1/claim/new'),('miles',1,'2018-04-28 00:25:36',NULL,'/api/v1/config/3'),('miles',1,'2018-04-28 00:25:36',NULL,'/api/v1/config/4'),('miles',1,'2018-04-28 00:25:36',NULL,'/api/v1/claim/all/undefined/undefined'),('miles',1,'2018-04-28 00:25:36',NULL,'/api/v1/claim/all/undefined/undefined'),('miles',1,'2018-04-28 00:25:38',NULL,'/api/v1/config/3'),('miles',1,'2018-04-28 00:25:38',NULL,'/api/v1/config/11'),('miles',1,'2018-04-28 00:26:18',NULL,'/api/v1/address/search/?q=undefined'),('miles',1,'2018-04-28 00:26:20',NULL,'/api/v1/address/search/?q=4'),('miles',1,'2018-04-28 00:26:20',NULL,'/api/v1/address/search/?q=4'),('miles',1,'2018-04-28 00:26:20',NULL,'/api/v1/address/search/?q=4%2043'),('miles',1,'2018-04-28 00:26:20',NULL,'/api/v1/address/search/?q=4%2043'),('miles',1,'2018-04-28 00:26:20',NULL,'/api/v1/address/search/?q=4%2043'),('miles',1,'2018-04-28 00:26:21',NULL,'/api/v1/address/search/?q=4%2043%20n'),('miles',1,'2018-04-28 00:26:21',NULL,'/api/v1/address/search/?q=4%2043%20nei'),('miles',1,'2018-04-28 00:26:21',NULL,'/api/v1/address/search/?q=4%2043%20nei'),('miles',1,'2018-04-28 00:26:21',NULL,'/api/v1/address/search/?q=4%2043%20neil'),('miles',1,'2018-04-28 00:26:22',NULL,'/api/v1/address/search/?q=4%2043%20neil'),('miles',1,'2018-04-28 00:26:23',NULL,'/api/v1/address/complete/?q=Unit%204,%2043%20Neil%20Street,%20MERRYLANDS%20NSW%202160'),('miles',1,'2018-04-28 00:26:35',NULL,'/api/v1/property/canonical/fd32a6ff-e98b-44fd-95ab-378672d7da4b'),('miles',1,'2018-04-28 00:26:35',NULL,'/api/v1/claim/new'),('miles',1,'2018-04-28 00:26:37',NULL,'/api/v1/config/3'),('miles',1,'2018-04-28 00:26:37',NULL,'/api/v1/config/4'),('miles',1,'2018-04-28 00:26:37',NULL,'/api/v1/claim/all/undefined/undefined'),('miles',1,'2018-04-28 00:26:37',NULL,'/api/v1/claim/all/undefined/undefined'),('jacky.chang',1,'2018-04-28 00:26:41',NULL,'/api/v1/config/3'),('jacky.chang',1,'2018-04-28 00:26:41',NULL,'/api/v1/config/4'),('jacky.chang',1,'2018-04-28 00:26:41',NULL,'/api/v1/claim/all/undefined/undefined'),('jacky.chang',1,'2018-04-28 00:26:41',NULL,'/api/v1/claim/all/undefined/undefined'),('jacky.chang',1,'2018-04-28 00:26:42',NULL,'/api/v1/stats/completion/undefined'),('jacky.chang',1,'2018-04-28 00:26:42',NULL,'/api/v1/stats/suburb/undefined'),('jacky.chang',1,'2018-04-28 00:26:42',NULL,'/api/v1/stats/requesttype/undefined'),('jacky.chang',1,'2018-04-28 00:26:42',NULL,'/api/v1/stats/requestcount/undefined'),('jacky.chang',1,'2018-04-28 00:26:42',NULL,'/api/v1/stats/requestduration/undefined'),('jacky.chang',1,'2018-04-28 00:26:42',NULL,'/api/v1/stats/staff/undefined'),('jacky.chang',1,'2018-04-28 00:26:42',NULL,'/api/v1/stats/customer/undefined'),('jacky.chang',1,'2018-04-28 00:26:53',NULL,'/api/v1/config/9'),('jacky.chang',1,'2018-04-28 00:26:53',NULL,'/api/v1/property/'),('jacky.chang',1,'2018-04-28 00:26:58',NULL,'/api/v1/config/3'),('jacky.chang',1,'2018-04-28 00:26:58',NULL,'/api/v1/config/4'),('jacky.chang',1,'2018-04-28 00:26:58',NULL,'/api/v1/claim/all/undefined/undefined'),('jacky.chang',1,'2018-04-28 00:26:58',NULL,'/api/v1/claim/all/undefined/undefined'),('jacky.chang',1,'2018-04-28 00:27:08',NULL,'/api/v1/staff/'),('jacky.chang',1,'2018-04-28 00:27:08',NULL,'/api/v1/config/7'),('jacky.chang',1,'2018-04-28 00:27:08',NULL,'/api/v1/config/8'),('jacky.chang',1,'2018-04-28 00:27:21',NULL,'/api/v1/customer'),('jacky.chang',1,'2018-04-28 00:27:21',NULL,'/api/v1/config/6'),('jacky.chang',1,'2018-04-28 00:27:23',NULL,'/api/v1/config/6'),('jacky.chang',1,'2018-04-28 00:27:23',NULL,'/api/v1/customer/guy1'),('jacky.chang',1,'2018-04-28 00:27:23',NULL,'/api/v1/config/2'),('jacky.chang',1,'2018-04-28 00:27:23',NULL,'/api/v1/user/getstatus/guy1'),('jacky.chang',1,'2018-04-28 00:27:23',NULL,'/api/v1/claim/user/guy1'),('jacky.chang',1,'2018-04-28 00:27:26',NULL,'/api/v1/user/changestatus'),('heyzel',1,'2018-04-28 00:27:28',NULL,'/api/v1/dashboard/user/guy1'),('miles',1,'2018-04-28 00:27:29',NULL,'/api/v1/config/3'),('miles',1,'2018-04-28 00:27:29',NULL,'/api/v1/config/4'),('miles',1,'2018-04-28 00:27:29',NULL,'/api/v1/claim/all/undefined/undefined'),('miles',1,'2018-04-28 00:27:29',NULL,'/api/v1/claim/all/undefined/undefined'),('miles',1,'2018-04-28 00:27:30',NULL,'/api/v1/config/3'),('miles',1,'2018-04-28 00:27:30',NULL,'/api/v1/config/11'),('miles',1,'2018-04-28 00:28:20',NULL,'/api/v1/address/search/?q=undefined'),('miles',1,'2018-04-28 00:29:24',NULL,'/api/v1/address/search/?q=lu'),('miles',1,'2018-04-28 00:29:24',NULL,'/api/v1/address/search/?q=lu'),('miles',1,'2018-04-28 00:29:24',NULL,'/api/v1/address/search/?q=luna'),('miles',1,'2018-04-28 00:29:24',NULL,'/api/v1/address/search/?q=luna'),('miles',1,'2018-04-28 00:29:24',NULL,'/api/v1/address/search/?q=luna'),('miles',1,'2018-04-28 00:29:25',NULL,'/api/v1/address/search/?q=luna%20b'),('miles',1,'2018-04-28 00:29:25',NULL,'/api/v1/address/search/?q=luna%20by'),('miles',1,'2018-04-28 00:29:25',NULL,'/api/v1/address/search/?q=luna%20by'),('miles',1,'2018-04-28 00:29:25',NULL,'/api/v1/address/search/?q=luna%20by%20m'),('miles',1,'2018-04-28 00:29:26',NULL,'/api/v1/address/search/?q=luna%20by%20mer'),('miles',1,'2018-04-28 00:29:26',NULL,'/api/v1/address/search/?q=luna%20by%20mer'),('miles',1,'2018-04-28 00:29:26',NULL,'/api/v1/address/search/?q=luna%20by%20meri'),('miles',1,'2018-04-28 00:29:26',NULL,'/api/v1/address/search/?q=luna%20by%20merit'),('miles',1,'2018-04-28 00:29:26',NULL,'/api/v1/address/search/?q=luna%20by%20merito'),('miles',1,'2018-04-28 00:29:26',NULL,'/api/v1/address/search/?q=luna%20by%20meriton'),('miles',1,'2018-04-28 00:29:27',NULL,'/api/v1/address/search/?q=luna%20by%20meriton'),('miles',1,'2018-04-28 00:29:27',NULL,'/api/v1/address/search/?q=luna%20by%20meriton'),('miles',1,'2018-04-28 00:29:27',NULL,'/api/v1/address/search/?q=undefined'),('miles',1,'2018-04-28 00:29:28',NULL,'/api/v1/address/search/?q=2'),('miles',1,'2018-04-28 00:29:28',NULL,'/api/v1/address/search/?q=22'),('miles',1,'2018-04-28 00:29:29',NULL,'/api/v1/address/search/?q=22'),('miles',1,'2018-04-28 00:29:29',NULL,'/api/v1/address/search/?q=22%20hu'),('miles',1,'2018-04-28 00:29:29',NULL,'/api/v1/address/search/?q=22%20hud'),('miles',1,'2018-04-28 00:29:29',NULL,'/api/v1/address/search/?q=22%20hud'),('miles',1,'2018-04-28 00:29:30',NULL,'/api/v1/address/search/?q=22%20hudso'),('miles',1,'2018-04-28 00:29:30',NULL,'/api/v1/address/search/?q=22%20hudson'),('miles',1,'2018-04-28 00:29:30',NULL,'/api/v1/address/search/?q=22%20hudson'),('miles',1,'2018-04-28 00:29:30',NULL,'/api/v1/address/search/?q=22%20hudson'),('miles',1,'2018-04-28 00:29:30',NULL,'/api/v1/address/search/?q=22%20hudson%20st'),('miles',1,'2018-04-28 00:29:31',NULL,'/api/v1/address/search/?q=22%20hudson%20st'),('miles',1,'2018-04-28 00:29:32',NULL,'/api/v1/address/complete/?q=22%20Hudson%20Street,%20LEWISHAM%20NSW%202049'),('miles',1,'2018-04-28 00:29:54',NULL,'/api/v1/property/canonical/11035157-b1e4-42f7-850e-6d68b1d790bd'),('miles',1,'2018-04-28 00:29:54',NULL,'/api/v1/property/new'),('miles',1,'2018-04-28 00:29:54',NULL,'/api/v1/claim/new'),('miles',1,'2018-04-28 00:29:56',NULL,'/api/v1/config/3'),('miles',1,'2018-04-28 00:29:56',NULL,'/api/v1/config/4'),('miles',1,'2018-04-28 00:29:56',NULL,'/api/v1/claim/all/undefined/undefined'),('miles',1,'2018-04-28 00:29:56',NULL,'/api/v1/claim/all/undefined/undefined'),('miles',1,'2018-04-28 00:30:12',NULL,'/api/v1/property/user/guy1'),('miles',1,'2018-04-28 00:30:12',NULL,'/api/v1/config/9'),('miles',1,'2018-04-28 00:30:14',NULL,'/api/v1/config/9'),('miles',1,'2018-04-28 00:30:14',NULL,'/api/v1/property/6'),('miles',1,'2018-04-28 00:30:14',NULL,'/api/v1/claim/property/11035157-b1e4-42f7-850e-6d68b1d790bd'),('jacky.chang',1,'2018-04-28 00:30:38',NULL,'/api/v1/customer'),('jacky.chang',1,'2018-04-28 00:30:38',NULL,'/api/v1/config/6'),('jacky.chang',1,'2018-04-28 00:30:39',NULL,'/api/v1/config/6'),('jacky.chang',1,'2018-04-28 00:30:39',NULL,'/api/v1/config/2'),('jacky.chang',1,'2018-04-28 00:30:58',NULL,'/api/v1/address/search/?q=undefined'),('jacky.chang',1,'2018-04-28 00:31:06',NULL,'/api/v1/customer/kitty'),('jacky.chang',1,'2018-04-28 00:31:06',NULL,'/api/v1/config/6'),('jacky.chang',1,'2018-04-28 00:31:06',NULL,'/api/v1/config/2'),('jacky.chang',1,'2018-04-28 00:31:06',NULL,'/api/v1/user/getstatus/kitty'),('jacky.chang',1,'2018-04-28 00:31:06',NULL,'/api/v1/claim/user/kitty'),('jacky.chang',1,'2018-04-28 00:31:27',NULL,'/api/v1/user/changestatus'),('heyzel',1,'2018-04-28 00:31:40',NULL,'/api/v1/dashboard/user/kitty'),('miles',1,'2018-04-28 00:31:42',NULL,'/api/v1/config/3'),('miles',1,'2018-04-28 00:31:42',NULL,'/api/v1/config/4'),('miles',1,'2018-04-28 00:31:42',NULL,'/api/v1/claim/all/undefined/undefined'),('miles',1,'2018-04-28 00:31:42',NULL,'/api/v1/claim/all/undefined/undefined'),('miles',1,'2018-04-28 00:31:42',NULL,'/api/v1/config/3'),('miles',1,'2018-04-28 00:31:42',NULL,'/api/v1/config/11'),('miles',1,'2018-04-28 00:31:43',NULL,'/api/v1/config/4'),('miles',1,'2018-04-28 00:31:43',NULL,'/api/v1/config/3'),('miles',1,'2018-04-28 00:31:43',NULL,'/api/v1/claim/all/undefined/undefined'),('miles',1,'2018-04-28 00:31:43',NULL,'/api/v1/claim/all/undefined/undefined'),('miles',1,'2018-04-28 00:31:44',NULL,'/api/v1/property/user/kitty'),('miles',1,'2018-04-28 00:31:44',NULL,'/api/v1/config/9'),('heyzel',1,'2018-04-28 00:31:48',NULL,'/api/v1/dashboard/user/kitty'),('miles',1,'2018-04-28 00:31:50',NULL,'/api/v1/config/3'),('miles',1,'2018-04-28 00:31:50',NULL,'/api/v1/config/4'),('miles',1,'2018-04-28 00:31:50',NULL,'/api/v1/claim/all/undefined/undefined'),('miles',1,'2018-04-28 00:31:50',NULL,'/api/v1/claim/all/undefined/undefined'),('miles',1,'2018-04-28 00:31:51',NULL,'/api/v1/config/3'),('miles',1,'2018-04-28 00:31:51',NULL,'/api/v1/config/11'),('miles',1,'2018-04-28 00:32:56',NULL,'/api/v1/address/search/?q=1'),('miles',1,'2018-04-28 00:32:56',NULL,'/api/v1/address/search/?q=11'),('miles',1,'2018-04-28 00:32:57',NULL,'/api/v1/address/search/?q=118'),('miles',1,'2018-04-28 00:32:57',NULL,'/api/v1/address/search/?q=118'),('miles',1,'2018-04-28 00:32:57',NULL,'/api/v1/address/search/?q=118%20o'),('miles',1,'2018-04-28 00:32:57',NULL,'/api/v1/address/search/?q=118%20ol'),('miles',1,'2018-04-28 00:32:57',NULL,'/api/v1/address/search/?q=118%20old'),('miles',1,'2018-04-28 00:32:58',NULL,'/api/v1/address/search/?q=118%20old'),('miles',1,'2018-04-28 00:32:58',NULL,'/api/v1/address/search/?q=118%20old%20c'),('miles',1,'2018-04-28 00:32:58',NULL,'/api/v1/address/search/?q=118%20old%20can'),('miles',1,'2018-04-28 00:32:58',NULL,'/api/v1/address/search/?q=118%20old%20can'),('miles',1,'2018-04-28 00:32:58',NULL,'/api/v1/address/search/?q=118%20old%20cant'),('miles',1,'2018-04-28 00:32:58',NULL,'/api/v1/address/search/?q=118%20old%20canter'),('miles',1,'2018-04-28 00:32:58',NULL,'/api/v1/address/search/?q=118%20old%20canter'),('miles',1,'2018-04-28 00:32:59',NULL,'/api/v1/address/search/?q=118%20old%20canter'),('miles',1,'2018-04-28 00:33:00',NULL,'/api/v1/address/complete/?q=118%20Old%20Canterbury%20Road,%20LEWISHAM%20NSW%202049'),('miles',1,'2018-04-28 00:33:21',NULL,'/api/v1/property/canonical/4bcbd52a-dca6-4d11-9a88-273b3112fc11'),('miles',1,'2018-04-28 00:33:21',NULL,'/api/v1/property/new'),('miles',1,'2018-04-28 00:33:21',NULL,'/api/v1/claim/new'),('heyzel',1,'2018-04-28 00:33:24',NULL,'/api/v1/dashboard/user/kitty'),('heyzel',1,'2018-04-28 00:33:36',NULL,'/api/v1/dashboard/user/csotto'),('miles',1,'2018-04-28 00:33:37',NULL,'/api/v1/config/3'),('miles',1,'2018-04-28 00:33:37',NULL,'/api/v1/config/4'),('miles',1,'2018-04-28 00:33:37',NULL,'/api/v1/claim/all/undefined/undefined'),('miles',1,'2018-04-28 00:33:37',NULL,'/api/v1/claim/all/undefined/undefined'),('heyzel',1,'2018-04-28 00:33:52',NULL,'/api/v1/dashboard/user/heyzel'),('miles',1,'2018-04-28 00:33:54',NULL,'/api/v1/config/3'),('miles',1,'2018-04-28 00:33:54',NULL,'/api/v1/config/4'),('miles',1,'2018-04-28 00:33:54',NULL,'/api/v1/claim/all/undefined/undefined'),('miles',1,'2018-04-28 00:33:54',NULL,'/api/v1/claim/all/undefined/undefined'),('jacky.chang',1,'2018-04-28 00:34:01',NULL,'/api/v1/customer'),('jacky.chang',1,'2018-04-28 00:34:01',NULL,'/api/v1/config/6'),('heyzel',1,'2018-04-28 00:34:11',NULL,'/api/v1/dashboard/user/guy1'),('miles',1,'2018-04-28 00:34:13',NULL,'/api/v1/config/3'),('miles',1,'2018-04-28 00:34:13',NULL,'/api/v1/config/4'),('miles',1,'2018-04-28 00:34:13',NULL,'/api/v1/claim/all/undefined/undefined'),('miles',1,'2018-04-28 00:34:13',NULL,'/api/v1/claim/all/undefined/undefined'),('jacky.chang',1,'2018-04-28 00:34:24',NULL,'/api/v1/config/3'),('jacky.chang',1,'2018-04-28 00:34:24',NULL,'/api/v1/config/4'),('jacky.chang',1,'2018-04-28 00:34:24',NULL,'/api/v1/claim/all/undefined/undefined'),('jacky.chang',1,'2018-04-28 00:34:24',NULL,'/api/v1/claim/all/undefined/undefined'),('miles',1,'2018-04-28 00:34:31',NULL,'/api/v1/config/9'),('miles',1,'2018-04-28 00:34:31',NULL,'/api/v1/property/user/guy1'),('heyzel',1,'2018-04-28 00:34:48',NULL,'/api/v1/dashboard/user/miles'),('miles',1,'2018-04-28 00:34:49',NULL,'/api/v1/config/3'),('miles',1,'2018-04-28 00:34:49',NULL,'/api/v1/config/4'),('miles',1,'2018-04-28 00:34:49',NULL,'/api/v1/claim/all/undefined/undefined'),('miles',1,'2018-04-28 00:34:49',NULL,'/api/v1/claim/all/undefined/undefined'),('miles',1,'2018-04-28 00:35:02',NULL,'/api/v1/property/user/miles'),('miles',1,'2018-04-28 00:35:02',NULL,'/api/v1/config/9'),('heyzel',1,'2018-04-28 00:35:04',NULL,'/api/v1/dashboard/user/miles'),('miles',1,'2018-04-28 00:35:06',NULL,'/api/v1/property/user/miles'),('miles',1,'2018-04-28 00:35:06',NULL,'/api/v1/config/9'),('miles',1,'2018-04-28 00:35:07',NULL,'/api/v1/config/9'),('miles',1,'2018-04-28 00:35:07',NULL,'/api/v1/property/3'),('miles',1,'2018-04-28 00:35:07',NULL,'/api/v1/claim/property/b8c563e1-d77f-45ff-879c-afdbde123057'),('jacky.chang',1,'2018-04-28 00:35:11',NULL,'/api/v1/stats/completion/undefined'),('jacky.chang',1,'2018-04-28 00:35:11',NULL,'/api/v1/stats/suburb/undefined'),('jacky.chang',1,'2018-04-28 00:35:11',NULL,'/api/v1/stats/requesttype/undefined'),('jacky.chang',1,'2018-04-28 00:35:11',NULL,'/api/v1/stats/requestcount/undefined'),('jacky.chang',1,'2018-04-28 00:35:11',NULL,'/api/v1/stats/requestduration/undefined'),('jacky.chang',1,'2018-04-28 00:35:11',NULL,'/api/v1/stats/staff/undefined'),('jacky.chang',1,'2018-04-28 00:35:11',NULL,'/api/v1/stats/customer/undefined'),('heyzel',1,'2018-04-28 00:35:40',NULL,'/api/v1/dashboard/staff/tina.chung'),('heyzel',1,'2018-04-28 00:35:40',NULL,'/api/v1/dashboard/calendar/tina.chung'),('heyzel',1,'2018-04-28 00:35:40',NULL,'/api/v1/dashboard/admin/'),('miles',1,'2018-04-28 00:35:42',NULL,'/api/v1/config/3'),('miles',1,'2018-04-28 00:35:42',NULL,'/api/v1/config/4'),('miles',1,'2018-04-28 00:35:42',NULL,'/api/v1/claim/all/undefined/undefined'),('miles',1,'2018-04-28 00:35:42',NULL,'/api/v1/claim/all/undefined/undefined'),('miles',1,'2018-04-28 00:35:47',NULL,'/api/v1/config/3'),('miles',1,'2018-04-28 00:35:47',NULL,'/api/v1/config/4'),('miles',1,'2018-04-28 00:35:47',NULL,'/api/v1/claim/1000'),('miles',1,'2018-04-28 00:35:47',NULL,'/api/v1/worklog/workitems/1000'),('miles',1,'2018-04-28 00:35:47',NULL,'/api/v1/claim/assign/1000'),('miles',1,'2018-04-28 00:35:47',NULL,'/api/v1/config/11'),('miles',1,'2018-04-28 00:35:51',NULL,'/api/v1/staff/search/?query='),('miles',1,'2018-04-28 00:35:51',NULL,'/api/v1/staff/search/?query=am'),('miles',1,'2018-04-28 00:35:51',NULL,'/api/v1/staff/search/?query=am'),('miles',1,'2018-04-28 00:35:51',NULL,'/api/v1/staff/search/?query=amb'),('miles',1,'2018-04-28 00:35:51',NULL,'/api/v1/staff/search/?query=amber'),('miles',1,'2018-04-28 00:35:51',NULL,'/api/v1/staff/search/?query=amber'),('miles',1,'2018-04-28 00:35:52',NULL,'/api/v1/staff/search/?query=amber'),('miles',1,'2018-04-28 00:35:56',NULL,'/api/v1/claim/assign'),('miles',1,'2018-04-28 00:35:56',NULL,'/api/v1/claim/assign/1000'),('miles',1,'2018-04-28 00:35:56',NULL,'/api/v1/claim/status/'),('miles',1,'2018-04-28 00:36:01',NULL,'/api/v1/config/3'),('miles',1,'2018-04-28 00:36:01',NULL,'/api/v1/config/4'),('miles',1,'2018-04-28 00:36:01',NULL,'/api/v1/claim/all/undefined/undefined'),('miles',1,'2018-04-28 00:36:01',NULL,'/api/v1/claim/all/undefined/undefined'),('miles',1,'2018-04-28 00:36:08',NULL,'/api/v1/claim/1001'),('miles',1,'2018-04-28 00:36:08',NULL,'/api/v1/worklog/workitems/1001'),('miles',1,'2018-04-28 00:36:08',NULL,'/api/v1/claim/assign/1001'),('miles',1,'2018-04-28 00:36:08',NULL,'/api/v1/config/11'),('miles',1,'2018-04-28 00:36:08',NULL,'/api/v1/config/3'),('miles',1,'2018-04-28 00:36:08',NULL,'/api/v1/config/4'),('miles',1,'2018-04-28 00:36:11',NULL,'/api/v1/staff/search/?query='),('miles',1,'2018-04-28 00:36:14',NULL,'/api/v1/staff/search/?query=ti'),('miles',1,'2018-04-28 00:36:14',NULL,'/api/v1/staff/search/?query=tin'),('miles',1,'2018-04-28 00:36:14',NULL,'/api/v1/staff/search/?query=tina'),('miles',1,'2018-04-28 00:36:14',NULL,'/api/v1/staff/search/?query=tina'),('miles',1,'2018-04-28 00:36:14',NULL,'/api/v1/staff/search/?query=tina.'),('miles',1,'2018-04-28 00:36:16',NULL,'/api/v1/claim/assign'),('miles',1,'2018-04-28 00:36:16',NULL,'/api/v1/claim/status/'),('miles',1,'2018-04-28 00:36:16',NULL,'/api/v1/claim/assign/1001'),('tina.chung',1,'2018-04-28 00:37:33',NULL,'/api/v1/worklog/new'),('miles',1,'2018-04-28 00:37:33',NULL,'/api/v1/worklog/workitems/1001'),('miles',1,'2018-04-28 00:37:33',NULL,'/api/v1/notification/inspection'),('miles',1,'2018-04-28 00:37:39',NULL,'/api/v1/claim/status/'),('miles',1,'2018-04-28 00:37:39',NULL,'/api/v1/notification/claimstatus'),('miles',1,'2018-04-28 00:37:48',NULL,'/api/v1/config/3'),('miles',1,'2018-04-28 00:37:48',NULL,'/api/v1/config/4'),('miles',1,'2018-04-28 00:37:48',NULL,'/api/v1/claim/all/undefined/undefined'),('miles',1,'2018-04-28 00:37:48',NULL,'/api/v1/claim/all/undefined/undefined'),('miles',1,'2018-04-28 00:37:59',NULL,'/api/v1/claim/1003'),('miles',1,'2018-04-28 00:37:59',NULL,'/api/v1/worklog/workitems/1003'),('miles',1,'2018-04-28 00:37:59',NULL,'/api/v1/claim/assign/1003'),('miles',1,'2018-04-28 00:37:59',NULL,'/api/v1/config/11'),('miles',1,'2018-04-28 00:37:59',NULL,'/api/v1/config/3'),('miles',1,'2018-04-28 00:37:59',NULL,'/api/v1/config/4'),('miles',1,'2018-04-28 00:38:04',NULL,'/api/v1/staff/search/?query=tin'),('miles',1,'2018-04-28 00:38:04',NULL,'/api/v1/staff/search/?query=tin'),('miles',1,'2018-04-28 00:38:04',NULL,'/api/v1/staff/search/?query=tin'),('miles',1,'2018-04-28 00:38:05',NULL,'/api/v1/staff/search/?query=tin.'),('miles',1,'2018-04-28 00:38:05',NULL,'/api/v1/staff/search/?query=tin'),('miles',1,'2018-04-28 00:38:06',NULL,'/api/v1/staff/search/?query=tin'),('miles',1,'2018-04-28 00:38:07',NULL,'/api/v1/claim/assign'),('miles',1,'2018-04-28 00:38:07',NULL,'/api/v1/claim/status/'),('miles',1,'2018-04-28 00:38:07',NULL,'/api/v1/claim/assign/1003'),('tina.chung',1,'2018-04-28 00:39:09',NULL,'/api/v1/worklog/new'),('miles',1,'2018-04-28 00:39:09',NULL,'/api/v1/worklog/workitems/1003'),('miles',1,'2018-04-28 00:39:14',NULL,'/api/v1/claim/status/'),('miles',1,'2018-04-28 00:39:14',NULL,'/api/v1/notification/claimstatus'),('miles',1,'2018-04-28 00:39:18',NULL,'/api/v1/config/3'),('miles',1,'2018-04-28 00:39:18',NULL,'/api/v1/config/4'),('miles',1,'2018-04-28 00:39:18',NULL,'/api/v1/claim/all/undefined/undefined'),('miles',1,'2018-04-28 00:39:18',NULL,'/api/v1/claim/all/undefined/undefined'),('miles',1,'2018-04-28 00:39:31',NULL,'/api/v1/claim/1006'),('miles',1,'2018-04-28 00:39:31',NULL,'/api/v1/worklog/workitems/1006'),('miles',1,'2018-04-28 00:39:31',NULL,'/api/v1/claim/assign/1006'),('miles',1,'2018-04-28 00:39:31',NULL,'/api/v1/config/3'),('miles',1,'2018-04-28 00:39:31',NULL,'/api/v1/config/11'),('miles',1,'2018-04-28 00:39:31',NULL,'/api/v1/config/4'),('miles',1,'2018-04-28 00:39:35',NULL,'/api/v1/staff/search/?query=T'),('miles',1,'2018-04-28 00:39:35',NULL,'/api/v1/staff/search/?query=T'),('miles',1,'2018-04-28 00:39:36',NULL,'/api/v1/staff/search/?query=Tin'),('miles',1,'2018-04-28 00:39:36',NULL,'/api/v1/staff/search/?query=Tin'),('miles',1,'2018-04-28 00:39:36',NULL,'/api/v1/staff/search/?query=Tina'),('miles',1,'2018-04-28 00:39:38',NULL,'/api/v1/claim/assign'),('miles',1,'2018-04-28 00:39:38',NULL,'/api/v1/claim/assign/1006'),('miles',1,'2018-04-28 00:39:38',NULL,'/api/v1/claim/status/'),('tina.chung',1,'2018-04-28 00:40:32',NULL,'/api/v1/worklog/new'),('miles',1,'2018-04-28 00:40:32',NULL,'/api/v1/worklog/workitems/1006'),('miles',1,'2018-04-28 00:40:35',NULL,'/api/v1/claim/status/'),('miles',1,'2018-04-28 00:40:36',NULL,'/api/v1/notification/claimstatus'),('miles',1,'2018-04-28 00:40:40',NULL,'/api/v1/config/3'),('miles',1,'2018-04-28 00:40:40',NULL,'/api/v1/config/4'),('miles',1,'2018-04-28 00:40:40',NULL,'/api/v1/claim/all/undefined/undefined'),('miles',1,'2018-04-28 00:40:40',NULL,'/api/v1/claim/all/undefined/undefined'),('miles',1,'2018-04-28 00:40:48',NULL,'/api/v1/claim/1007'),('miles',1,'2018-04-28 00:40:48',NULL,'/api/v1/worklog/workitems/1007'),('miles',1,'2018-04-28 00:40:48',NULL,'/api/v1/claim/assign/1007'),('miles',1,'2018-04-28 00:40:48',NULL,'/api/v1/config/11'),('miles',1,'2018-04-28 00:40:48',NULL,'/api/v1/config/3'),('miles',1,'2018-04-28 00:40:48',NULL,'/api/v1/config/4'),('miles',1,'2018-04-28 00:40:57',NULL,'/api/v1/staff/search/?query=ti'),('miles',1,'2018-04-28 00:40:57',NULL,'/api/v1/staff/search/?query=tin'),('miles',1,'2018-04-28 00:40:57',NULL,'/api/v1/staff/search/?query=tin'),('miles',1,'2018-04-28 00:40:57',NULL,'/api/v1/staff/search/?query=tina'),('miles',1,'2018-04-28 00:40:58',NULL,'/api/v1/staff/search/?query=tina.'),('miles',1,'2018-04-28 00:41:00',NULL,'/api/v1/claim/assign'),('miles',1,'2018-04-28 00:41:00',NULL,'/api/v1/claim/status/'),('miles',1,'2018-04-28 00:41:00',NULL,'/api/v1/claim/assign/1007'),('miles',1,'2018-04-28 00:41:04',NULL,'/api/v1/claim/status/'),('miles',1,'2018-04-28 00:41:04',NULL,'/api/v1/notification/claimstatus'),('miles',1,'2018-04-28 00:41:08',NULL,'/api/v1/config/3'),('miles',1,'2018-04-28 00:41:08',NULL,'/api/v1/config/4'),('miles',1,'2018-04-28 00:41:08',NULL,'/api/v1/claim/all/undefined/undefined'),('miles',1,'2018-04-28 00:41:08',NULL,'/api/v1/claim/all/undefined/undefined'),('heyzel',1,'2018-04-28 00:41:39',NULL,'/api/v1/dashboard/staff/amber.sheppard'),('heyzel',1,'2018-04-28 00:41:39',NULL,'/api/v1/dashboard/calendar/amber.sheppard'),('miles',1,'2018-04-28 00:41:41',NULL,'/api/v1/config/3'),('miles',1,'2018-04-28 00:41:41',NULL,'/api/v1/config/4'),('miles',1,'2018-04-28 00:41:41',NULL,'/api/v1/claim/all/undefined/undefined'),('miles',1,'2018-04-28 00:41:41',NULL,'/api/v1/claim/all/undefined/undefined'),('miles',1,'2018-04-28 00:41:50',NULL,'/api/v1/claim/1004'),('miles',1,'2018-04-28 00:41:50',NULL,'/api/v1/worklog/workitems/1004'),('miles',1,'2018-04-28 00:41:50',NULL,'/api/v1/claim/assign/1004'),('miles',1,'2018-04-28 00:41:50',NULL,'/api/v1/config/3'),('miles',1,'2018-04-28 00:41:50',NULL,'/api/v1/config/11'),('miles',1,'2018-04-28 00:41:50',NULL,'/api/v1/config/4'),('miles',1,'2018-04-28 00:41:53',NULL,'/api/v1/staff/search/?query=a'),('miles',1,'2018-04-28 00:41:53',NULL,'/api/v1/staff/search/?query=am'),('miles',1,'2018-04-28 00:41:53',NULL,'/api/v1/staff/search/?query=ambe'),('miles',1,'2018-04-28 00:41:53',NULL,'/api/v1/staff/search/?query=amber'),('miles',1,'2018-04-28 00:41:53',NULL,'/api/v1/staff/search/?query=amber'),('miles',1,'2018-04-28 00:41:55',NULL,'/api/v1/claim/assign'),('miles',1,'2018-04-28 00:41:55',NULL,'/api/v1/claim/assign/1004'),('miles',1,'2018-04-28 00:41:55',NULL,'/api/v1/claim/status/'),('miles',1,'2018-04-28 00:41:57',NULL,'/api/v1/config/3'),('miles',1,'2018-04-28 00:41:57',NULL,'/api/v1/config/4'),('miles',1,'2018-04-28 00:41:57',NULL,'/api/v1/claim/all/undefined/undefined'),('miles',1,'2018-04-28 00:41:57',NULL,'/api/v1/claim/all/undefined/undefined'),('miles',1,'2018-04-28 00:42:12',NULL,'/api/v1/claim/1009'),('miles',1,'2018-04-28 00:42:12',NULL,'/api/v1/worklog/workitems/1009'),('miles',1,'2018-04-28 00:42:12',NULL,'/api/v1/claim/assign/1009'),('miles',1,'2018-04-28 00:42:12',NULL,'/api/v1/config/11'),('miles',1,'2018-04-28 00:42:12',NULL,'/api/v1/config/3'),('miles',1,'2018-04-28 00:42:12',NULL,'/api/v1/config/4'),('miles',1,'2018-04-28 00:42:15',NULL,'/api/v1/staff/search/?query=a'),('miles',1,'2018-04-28 00:42:15',NULL,'/api/v1/staff/search/?query=am'),('miles',1,'2018-04-28 00:42:15',NULL,'/api/v1/staff/search/?query=amb'),('miles',1,'2018-04-28 00:42:15',NULL,'/api/v1/staff/search/?query=amber'),('miles',1,'2018-04-28 00:42:15',NULL,'/api/v1/staff/search/?query=amber'),('miles',1,'2018-04-28 00:42:17',NULL,'/api/v1/claim/assign'),('miles',1,'2018-04-28 00:42:17',NULL,'/api/v1/claim/assign/1009'),('miles',1,'2018-04-28 00:42:17',NULL,'/api/v1/claim/status/'),('amber.sheppard',1,'2018-04-28 00:43:43',NULL,'/api/v1/worklog/new'),('miles',1,'2018-04-28 00:43:43',NULL,'/api/v1/worklog/workitems/1009'),('miles',1,'2018-04-28 00:43:45',NULL,'/api/v1/claim/status/'),('miles',1,'2018-04-28 00:43:45',NULL,'/api/v1/notification/claimstatus'),('miles',1,'2018-04-28 00:43:57',NULL,'/api/v1/claim/status/'),('miles',1,'2018-04-28 00:43:57',NULL,'/api/v1/notification/claimstatus'),('heyzel',1,'2018-04-28 00:43:59',NULL,'/api/v1/dashboard/staff/amber.sheppard'),('heyzel',1,'2018-04-28 00:43:59',NULL,'/api/v1/dashboard/calendar/amber.sheppard'),('miles',1,'2018-04-28 00:44:15',NULL,'/api/v1/customer'),('miles',1,'2018-04-28 00:44:15',NULL,'/api/v1/config/6'),('miles',1,'2018-04-28 00:44:21',NULL,'/api/v1/customer/karezb'),('miles',1,'2018-04-28 00:44:21',NULL,'/api/v1/config/6'),('amber.sheppard',1,'2018-04-28 00:44:21',NULL,'/api/v1/config/2'),('amber.sheppard',1,'2018-04-28 00:44:21',NULL,'/api/v1/user/getstatus/karezb'),('miles',1,'2018-04-28 00:44:21',NULL,'/api/v1/claim/user/karezb'),('miles',1,'2018-04-28 00:44:28',NULL,'/api/v1/config/9'),('miles',1,'2018-04-28 00:44:28',NULL,'/api/v1/property/'),('jacky.chang',1,'2018-04-28 00:44:47',NULL,'/api/v1/stats/completion/undefined'),('jacky.chang',1,'2018-04-28 00:44:47',NULL,'/api/v1/stats/suburb/undefined'),('jacky.chang',1,'2018-04-28 00:44:47',NULL,'/api/v1/stats/requesttype/undefined'),('jacky.chang',1,'2018-04-28 00:44:47',NULL,'/api/v1/stats/requestduration/undefined'),('jacky.chang',1,'2018-04-28 00:44:47',NULL,'/api/v1/stats/requestcount/undefined'),('jacky.chang',1,'2018-04-28 00:44:47',NULL,'/api/v1/stats/staff/undefined'),('jacky.chang',1,'2018-04-28 00:44:47',NULL,'/api/v1/stats/customer/undefined'),('miles',1,'2018-04-28 00:46:07',NULL,'/api/v1/config/3'),('miles',1,'2018-04-28 00:46:07',NULL,'/api/v1/config/4'),('miles',1,'2018-04-28 00:46:07',NULL,'/api/v1/claim/all/undefined/undefined'),('miles',1,'2018-04-28 00:46:07',NULL,'/api/v1/claim/all/undefined/undefined'),('heyzel',1,'2018-04-28 00:46:14',NULL,'/api/v1/dashboard/staff/amber.sheppard'),('heyzel',1,'2018-04-28 00:46:14',NULL,'/api/v1/dashboard/calendar/amber.sheppard'),('miles',1,'2018-04-28 00:46:26',NULL,'/api/v1/property/'),('miles',1,'2018-04-28 00:46:26',NULL,'/api/v1/config/9'),('miles',1,'2018-04-28 00:46:30',NULL,'/api/v1/config/3'),('miles',1,'2018-04-28 00:46:30',NULL,'/api/v1/config/4'),('miles',1,'2018-04-28 00:46:30',NULL,'/api/v1/claim/all/undefined/undefined'),('miles',1,'2018-04-28 00:46:30',NULL,'/api/v1/claim/all/undefined/undefined'),('jacky.chang',1,'2018-04-28 00:47:12',NULL,'/api/v1/stats/customer/2018%20March'),('jacky.chang',1,'2018-04-28 00:47:35',NULL,'/api/v1/stats/completion/undefined'),('jacky.chang',1,'2018-04-28 00:47:35',NULL,'/api/v1/stats/suburb/undefined'),('jacky.chang',1,'2018-04-28 00:47:35',NULL,'/api/v1/stats/requesttype/undefined'),('jacky.chang',1,'2018-04-28 00:47:35',NULL,'/api/v1/stats/requestduration/undefined'),('jacky.chang',1,'2018-04-28 00:47:35',NULL,'/api/v1/stats/requestcount/undefined'),('jacky.chang',1,'2018-04-28 00:47:35',NULL,'/api/v1/stats/staff/undefined'),('jacky.chang',1,'2018-04-28 00:47:35',NULL,'/api/v1/stats/customer/undefined'),('heyzel',1,'2018-04-28 00:49:46',NULL,'/api/v1/dashboard/staff/tina.chung'),('heyzel',1,'2018-04-28 00:49:46',NULL,'/api/v1/dashboard/calendar/tina.chung'),('heyzel',1,'2018-04-28 00:49:46',NULL,'/api/v1/dashboard/admin/'),('miles',1,'2018-04-28 00:49:49',NULL,'/api/v1/config/3'),('miles',1,'2018-04-28 00:49:49',NULL,'/api/v1/config/4'),('miles',1,'2018-04-28 00:49:49',NULL,'/api/v1/claim/all/undefined/undefined'),('miles',1,'2018-04-28 00:49:49',NULL,'/api/v1/claim/all/undefined/undefined'),('jacky.chang',1,'2018-04-28 00:53:48',NULL,'/api/v1/stats/completion/undefined'),('jacky.chang',1,'2018-04-28 00:53:49',NULL,'/api/v1/stats/suburb/undefined'),('jacky.chang',1,'2018-04-28 00:53:49',NULL,'/api/v1/stats/requesttype/undefined'),('jacky.chang',1,'2018-04-28 00:53:49',NULL,'/api/v1/stats/requestduration/undefined'),('jacky.chang',1,'2018-04-28 00:53:49',NULL,'/api/v1/stats/requestcount/undefined'),('jacky.chang',1,'2018-04-28 00:53:49',NULL,'/api/v1/stats/staff/undefined'),('jacky.chang',1,'2018-04-28 00:53:49',NULL,'/api/v1/stats/customer/undefined'),('jacky.chang',1,'2018-04-28 00:55:01',NULL,'/api/v1/dashboard/staff/jacky.chang'),('jacky.chang',1,'2018-04-28 00:55:01',NULL,'/api/v1/dashboard/calendar/jacky.chang'),('jacky.chang',1,'2018-04-28 00:55:01',NULL,'/api/v1/dashboard/admin/'),('jacky.chang',1,'2018-04-28 00:55:05',NULL,'/api/v1/config/3'),('jacky.chang',1,'2018-04-28 00:55:05',NULL,'/api/v1/config/4'),('jacky.chang',1,'2018-04-28 00:55:05',NULL,'/api/v1/claim/all/undefined/undefined'),('jacky.chang',1,'2018-04-28 00:55:05',NULL,'/api/v1/claim/all/undefined/undefined'),('jacky.chang',1,'2018-04-28 00:55:08',NULL,'/api/v1/config/3'),('jacky.chang',1,'2018-04-28 00:55:08',NULL,'/api/v1/config/4'),('jacky.chang',1,'2018-04-28 00:55:08',NULL,'/api/v1/claim/1009'),('jacky.chang',1,'2018-04-28 00:55:08',NULL,'/api/v1/worklog/workitems/1009'),('jacky.chang',1,'2018-04-28 00:55:08',NULL,'/api/v1/claim/assign/1009'),('jacky.chang',1,'2018-04-28 00:55:08',NULL,'/api/v1/config/11'),('jacky.chang',1,'2018-04-28 00:55:13',NULL,'/api/v1/config/3'),('jacky.chang',1,'2018-04-28 00:55:13',NULL,'/api/v1/config/4'),('jacky.chang',1,'2018-04-28 00:55:13',NULL,'/api/v1/claim/all/undefined/undefined'),('jacky.chang',1,'2018-04-28 00:55:13',NULL,'/api/v1/claim/all/undefined/undefined'),('jacky.chang',1,'2018-04-28 00:55:20',NULL,'/api/v1/claim/1002'),('jacky.chang',1,'2018-04-28 00:55:20',NULL,'/api/v1/config/4'),('jacky.chang',1,'2018-04-28 00:55:20',NULL,'/api/v1/config/3'),('jacky.chang',1,'2018-04-28 00:55:20',NULL,'/api/v1/config/11'),('jacky.chang',1,'2018-04-28 00:55:20',NULL,'/api/v1/claim/assign/1002'),('jacky.chang',1,'2018-04-28 00:55:20',NULL,'/api/v1/worklog/workitems/1002'),('jacky.chang',1,'2018-04-28 00:57:38',NULL,'/api/v1/claim/1002'),('jacky.chang',1,'2018-04-28 00:57:38',NULL,'/api/v1/worklog/workitems/1002'),('jacky.chang',1,'2018-04-28 00:57:38',NULL,'/api/v1/claim/assign/1002'),('jacky.chang',1,'2018-04-28 00:57:38',NULL,'/api/v1/config/11'),('jacky.chang',1,'2018-04-28 00:57:38',NULL,'/api/v1/config/3'),('jacky.chang',1,'2018-04-28 00:57:38',NULL,'/api/v1/config/4'),('jacky.chang',1,'2018-04-28 00:58:36',NULL,'/api/v1/claim/1002'),('jacky.chang',1,'2018-04-28 00:58:36',NULL,'/api/v1/worklog/workitems/1002'),('jacky.chang',1,'2018-04-28 00:58:36',NULL,'/api/v1/claim/assign/1002'),('jacky.chang',1,'2018-04-28 00:58:36',NULL,'/api/v1/config/11'),('jacky.chang',1,'2018-04-28 00:58:36',NULL,'/api/v1/config/3'),('jacky.chang',1,'2018-04-28 00:58:36',NULL,'/api/v1/config/4'),('jacky.chang',1,'2018-04-28 00:58:56',NULL,'/api/v1/stats/completion/undefined'),('jacky.chang',1,'2018-04-28 00:58:56',NULL,'/api/v1/stats/suburb/undefined'),('jacky.chang',1,'2018-04-28 00:58:56',NULL,'/api/v1/stats/requesttype/undefined'),('jacky.chang',1,'2018-04-28 00:58:56',NULL,'/api/v1/stats/requestduration/undefined'),('jacky.chang',1,'2018-04-28 00:58:56',NULL,'/api/v1/stats/requestcount/undefined'),('jacky.chang',1,'2018-04-28 00:58:56',NULL,'/api/v1/stats/staff/undefined'),('jacky.chang',1,'2018-04-28 00:58:56',NULL,'/api/v1/stats/customer/undefined'),('jacky.chang',1,'2018-04-28 01:00:09',NULL,'/api/v1/stats/completion/undefined'),('jacky.chang',1,'2018-04-28 01:00:09',NULL,'/api/v1/stats/suburb/undefined'),('jacky.chang',1,'2018-04-28 01:00:09',NULL,'/api/v1/stats/requesttype/undefined'),('jacky.chang',1,'2018-04-28 01:00:09',NULL,'/api/v1/stats/requestcount/undefined'),('jacky.chang',1,'2018-04-28 01:00:09',NULL,'/api/v1/stats/requestduration/undefined'),('jacky.chang',1,'2018-04-28 01:00:09',NULL,'/api/v1/stats/staff/undefined'),('jacky.chang',1,'2018-04-28 01:00:09',NULL,'/api/v1/stats/customer/undefined'),('jacky.chang',1,'2018-04-28 01:00:37',NULL,'/api/v1/stats/completion/2010'),('jacky.chang',1,'2018-04-28 01:00:37',NULL,'/api/v1/stats/suburb/2010'),('jacky.chang',1,'2018-04-28 01:00:37',NULL,'/api/v1/stats/requesttype/2010'),('jacky.chang',1,'2018-04-28 01:00:37',NULL,'/api/v1/stats/requestcount/2010'),('jacky.chang',1,'2018-04-28 01:00:41',NULL,'/api/v1/stats/completion/2018'),('jacky.chang',1,'2018-04-28 01:00:41',NULL,'/api/v1/stats/requesttype/2018'),('jacky.chang',1,'2018-04-28 01:00:41',NULL,'/api/v1/stats/suburb/2018'),('jacky.chang',1,'2018-04-28 01:00:41',NULL,'/api/v1/stats/requestcount/2018'),('jacky.chang',1,'2018-04-28 01:00:48',NULL,'/api/v1/stats/requestduration/2018%20March'),('jacky.chang',1,'2018-04-28 01:00:53',NULL,'/api/v1/dashboard/staff/jacky.chang'),('jacky.chang',1,'2018-04-28 01:00:53',NULL,'/api/v1/dashboard/calendar/jacky.chang'),('jacky.chang',1,'2018-04-28 01:00:53',NULL,'/api/v1/dashboard/admin/'),('jacky.chang',1,'2018-04-28 01:01:13',NULL,'/api/v1/stats/completion/undefined'),('jacky.chang',1,'2018-04-28 01:01:13',NULL,'/api/v1/stats/suburb/undefined'),('jacky.chang',1,'2018-04-28 01:01:13',NULL,'/api/v1/stats/requesttype/undefined'),('jacky.chang',1,'2018-04-28 01:01:13',NULL,'/api/v1/stats/requestduration/undefined'),('jacky.chang',1,'2018-04-28 01:01:13',NULL,'/api/v1/stats/requestcount/undefined'),('jacky.chang',1,'2018-04-28 01:01:13',NULL,'/api/v1/stats/staff/undefined'),('jacky.chang',1,'2018-04-28 01:01:13',NULL,'/api/v1/stats/customer/undefined'),('jacky.chang',1,'2018-04-28 01:01:16',NULL,'/api/v1/dashboard/staff/jacky.chang'),('jacky.chang',1,'2018-04-28 01:01:16',NULL,'/api/v1/dashboard/calendar/jacky.chang'),('jacky.chang',1,'2018-04-28 01:01:16',NULL,'/api/v1/dashboard/admin/'),('jacky.chang',1,'2018-04-28 01:01:23',NULL,'/api/v1/stats/completion/undefined'),('jacky.chang',1,'2018-04-28 01:01:23',NULL,'/api/v1/stats/suburb/undefined'),('jacky.chang',1,'2018-04-28 01:01:23',NULL,'/api/v1/stats/requesttype/undefined'),('jacky.chang',1,'2018-04-28 01:01:23',NULL,'/api/v1/stats/requestcount/undefined'),('jacky.chang',1,'2018-04-28 01:01:23',NULL,'/api/v1/stats/requestduration/undefined'),('jacky.chang',1,'2018-04-28 01:01:23',NULL,'/api/v1/stats/staff/undefined'),('jacky.chang',1,'2018-04-28 01:01:23',NULL,'/api/v1/stats/customer/undefined'),('jacky.chang',1,'2018-04-28 01:01:26',NULL,'/api/v1/config/3'),('jacky.chang',1,'2018-04-28 01:01:26',NULL,'/api/v1/config/4'),('jacky.chang',1,'2018-04-28 01:01:26',NULL,'/api/v1/claim/all/undefined/undefined'),('jacky.chang',1,'2018-04-28 01:01:26',NULL,'/api/v1/claim/all/undefined/undefined'),('jacky.chang',1,'2018-04-28 01:01:28',NULL,'/api/v1/config/3'),('jacky.chang',1,'2018-04-28 01:01:28',NULL,'/api/v1/config/4'),('jacky.chang',1,'2018-04-28 01:01:28',NULL,'/api/v1/claim/1000'),('jacky.chang',1,'2018-04-28 01:01:28',NULL,'/api/v1/worklog/workitems/1000'),('jacky.chang',1,'2018-04-28 01:01:28',NULL,'/api/v1/claim/assign/1000'),('jacky.chang',1,'2018-04-28 01:01:28',NULL,'/api/v1/config/11'),('jacky.chang',1,'2018-04-28 01:01:40',NULL,'/api/v1/stats/completion/undefined'),('jacky.chang',1,'2018-04-28 01:01:40',NULL,'/api/v1/stats/suburb/undefined'),('jacky.chang',1,'2018-04-28 01:01:40',NULL,'/api/v1/stats/requesttype/undefined'),('jacky.chang',1,'2018-04-28 01:01:40',NULL,'/api/v1/stats/requestduration/undefined'),('jacky.chang',1,'2018-04-28 01:01:40',NULL,'/api/v1/stats/staff/undefined'),('jacky.chang',1,'2018-04-28 01:01:40',NULL,'/api/v1/stats/requestcount/undefined'),('jacky.chang',1,'2018-04-28 01:01:40',NULL,'/api/v1/stats/customer/undefined'),('jacky.chang',1,'2018-04-28 01:01:43',NULL,'/api/v1/staff/tina.chung'),('jacky.chang',1,'2018-04-28 01:01:43',NULL,'/api/v1/config/7'),('jacky.chang',1,'2018-04-28 01:01:43',NULL,'/api/v1/config/8'),('jacky.chang',1,'2018-04-28 01:01:43',NULL,'/api/v1/config/1'),('jacky.chang',1,'2018-04-28 01:01:43',NULL,'/api/v1/config/2'),('jacky.chang',1,'2018-04-28 01:01:43',NULL,'/api/v1/user/getstatus/tina.chung'),('jacky.chang',1,'2018-04-28 01:01:43',NULL,'/api/v1/claim/staff/tina.chung'),('jacky.chang',1,'2018-04-28 01:01:51',NULL,'/api/v1/claim/1001'),('jacky.chang',1,'2018-04-28 01:01:51',NULL,'/api/v1/worklog/workitems/1001'),('jacky.chang',1,'2018-04-28 01:01:51',NULL,'/api/v1/config/11'),('jacky.chang',1,'2018-04-28 01:01:51',NULL,'/api/v1/claim/assign/1001'),('jacky.chang',1,'2018-04-28 01:01:51',NULL,'/api/v1/config/3'),('jacky.chang',1,'2018-04-28 01:01:51',NULL,'/api/v1/config/4'),('jacky.chang',1,'2018-04-28 01:02:17',NULL,'/api/v1/claim/1001'),('jacky.chang',1,'2018-04-28 01:02:17',NULL,'/api/v1/worklog/workitems/1001'),('jacky.chang',1,'2018-04-28 01:02:17',NULL,'/api/v1/claim/assign/1001'),('jacky.chang',1,'2018-04-28 01:02:17',NULL,'/api/v1/config/11'),('jacky.chang',1,'2018-04-28 01:02:17',NULL,'/api/v1/config/3'),('jacky.chang',1,'2018-04-28 01:02:17',NULL,'/api/v1/config/4'),('jacky.chang',1,'2018-04-28 01:02:19',NULL,'/api/v1/stats/completion/undefined'),('jacky.chang',1,'2018-04-28 01:02:19',NULL,'/api/v1/stats/suburb/undefined'),('jacky.chang',1,'2018-04-28 01:02:19',NULL,'/api/v1/stats/requesttype/undefined'),('jacky.chang',1,'2018-04-28 01:02:19',NULL,'/api/v1/stats/requestcount/undefined'),('jacky.chang',1,'2018-04-28 01:02:19',NULL,'/api/v1/stats/requestduration/undefined'),('jacky.chang',1,'2018-04-28 01:02:19',NULL,'/api/v1/stats/staff/undefined'),('jacky.chang',1,'2018-04-28 01:02:19',NULL,'/api/v1/stats/customer/undefined'),('jacky.chang',1,'2018-04-28 01:02:21',NULL,'/api/v1/config/11'),('jacky.chang',1,'2018-04-28 01:02:21',NULL,'/api/v1/config/3'),('jacky.chang',1,'2018-04-28 01:02:21',NULL,'/api/v1/config/4'),('jacky.chang',1,'2018-04-28 01:02:21',NULL,'/api/v1/claim/1000'),('jacky.chang',1,'2018-04-28 01:02:21',NULL,'/api/v1/worklog/workitems/1000'),('jacky.chang',1,'2018-04-28 01:02:21',NULL,'/api/v1/claim/assign/1000'),('jacky.chang',1,'2018-04-28 01:02:24',NULL,'/api/v1/stats/completion/undefined'),('jacky.chang',1,'2018-04-28 01:02:24',NULL,'/api/v1/stats/suburb/undefined'),('jacky.chang',1,'2018-04-28 01:02:24',NULL,'/api/v1/stats/requesttype/undefined'),('jacky.chang',1,'2018-04-28 01:02:24',NULL,'/api/v1/stats/requestcount/undefined'),('jacky.chang',1,'2018-04-28 01:02:24',NULL,'/api/v1/stats/requestduration/undefined'),('jacky.chang',1,'2018-04-28 01:02:24',NULL,'/api/v1/stats/staff/undefined'),('jacky.chang',1,'2018-04-28 01:02:24',NULL,'/api/v1/stats/customer/undefined'),('jacky.chang',1,'2018-04-28 01:02:26',NULL,'/api/v1/claim/1006'),('jacky.chang',1,'2018-04-28 01:02:26',NULL,'/api/v1/worklog/workitems/1006'),('jacky.chang',1,'2018-04-28 01:02:26',NULL,'/api/v1/claim/assign/1006'),('jacky.chang',1,'2018-04-28 01:02:26',NULL,'/api/v1/config/3'),('jacky.chang',1,'2018-04-28 01:02:26',NULL,'/api/v1/config/11'),('jacky.chang',1,'2018-04-28 01:02:26',NULL,'/api/v1/config/4'),('jacky.chang',1,'2018-04-28 01:02:28',NULL,'/api/v1/dashboard/staff/jacky.chang'),('jacky.chang',1,'2018-04-28 01:02:28',NULL,'/api/v1/dashboard/calendar/jacky.chang'),('jacky.chang',1,'2018-04-28 01:02:28',NULL,'/api/v1/dashboard/admin/'),('jacky.chang',1,'2018-04-28 01:02:30',NULL,'/api/v1/config/4'),('jacky.chang',1,'2018-04-28 01:02:30',NULL,'/api/v1/config/3'),('jacky.chang',1,'2018-04-28 01:02:30',NULL,'/api/v1/claim/all/undefined/undefined'),('jacky.chang',1,'2018-04-28 01:02:30',NULL,'/api/v1/claim/all/undefined/undefined'),('jacky.chang',1,'2018-04-28 01:02:38',NULL,'/api/v1/dashboard/staff/jacky.chang'),('jacky.chang',1,'2018-04-28 01:02:38',NULL,'/api/v1/dashboard/calendar/jacky.chang'),('jacky.chang',1,'2018-04-28 01:02:38',NULL,'/api/v1/dashboard/admin/'),('jacky.chang',1,'2018-04-28 01:02:40',NULL,'/api/v1/config/3'),('jacky.chang',1,'2018-04-28 01:02:40',NULL,'/api/v1/config/4'),('jacky.chang',1,'2018-04-28 01:02:40',NULL,'/api/v1/claim/all/undefined/undefined'),('jacky.chang',1,'2018-04-28 01:02:40',NULL,'/api/v1/claim/all/undefined/undefined'),('jacky.chang',1,'2018-04-28 01:02:48',NULL,'/api/v1/stats/completion/undefined'),('jacky.chang',1,'2018-04-28 01:02:48',NULL,'/api/v1/stats/suburb/undefined'),('jacky.chang',1,'2018-04-28 01:02:48',NULL,'/api/v1/stats/requesttype/undefined'),('jacky.chang',1,'2018-04-28 01:02:48',NULL,'/api/v1/stats/requestduration/undefined'),('jacky.chang',1,'2018-04-28 01:02:48',NULL,'/api/v1/stats/requestcount/undefined'),('jacky.chang',1,'2018-04-28 01:02:48',NULL,'/api/v1/stats/staff/undefined'),('jacky.chang',1,'2018-04-28 01:02:48',NULL,'/api/v1/stats/customer/undefined'),('jacky.chang',1,'2018-04-28 01:04:18',NULL,'/api/v1/config/3'),('jacky.chang',1,'2018-04-28 01:04:18',NULL,'/api/v1/config/4'),('jacky.chang',1,'2018-04-28 01:04:18',NULL,'/api/v1/claim/all/undefined/undefined'),('jacky.chang',1,'2018-04-28 01:04:18',NULL,'/api/v1/claim/all/undefined/undefined'),('jacky.chang',1,'2018-04-28 01:05:23',NULL,'/api/v1/config/6'),('jacky.chang',1,'2018-04-28 01:05:23',NULL,'/api/v1/customer'),('jacky.chang',1,'2018-04-28 01:05:24',NULL,'/api/v1/customer'),('jacky.chang',1,'2018-04-28 01:05:24',NULL,'/api/v1/config/6'),('jacky.chang',1,'2018-04-28 01:05:25',NULL,'/api/v1/config/3'),('jacky.chang',1,'2018-04-28 01:05:25',NULL,'/api/v1/config/4'),('jacky.chang',1,'2018-04-28 01:05:25',NULL,'/api/v1/claim/all/undefined/undefined'),('jacky.chang',1,'2018-04-28 01:05:25',NULL,'/api/v1/claim/all/undefined/undefined'),('aceadmin',1,'2018-04-27 15:09:40','10.142.0.3','/api/v1/dashboard/admin/'),('aceadmin',1,'2018-04-27 15:09:40','10.142.0.3','/api/v1/dashboard/calendar/aceadmin'),('aceadmin',1,'2018-04-27 15:09:40','10.142.0.3','/api/v1/dashboard/staff/aceadmin'),('aceadmin',1,'2018-04-27 15:09:50','10.142.0.3','/api/v1/dashboard/staff/jacky.chang'),('aceadmin',1,'2018-04-27 15:09:50','10.142.0.3','/api/v1/dashboard/calendar/jacky.chang'),('aceadmin',1,'2018-04-27 15:09:50','10.142.0.3','/api/v1/dashboard/admin/'),('aceadmin',1,'2018-04-27 15:09:53','10.142.0.3','/api/v1/stats/completion/undefined'),('aceadmin',1,'2018-04-27 15:09:53','10.142.0.3','/api/v1/stats/suburb/undefined'),('aceadmin',1,'2018-04-27 15:09:53','10.142.0.3','/api/v1/stats/requesttype/undefined'),('aceadmin',1,'2018-04-27 15:09:53','10.142.0.3','/api/v1/stats/requestcount/undefined'),('aceadmin',1,'2018-04-27 15:09:53','10.142.0.3','/api/v1/stats/requestduration/undefined'),('aceadmin',1,'2018-04-27 15:09:53','10.142.0.3','/api/v1/stats/staff/undefined'),('aceadmin',1,'2018-04-27 15:09:53','10.142.0.3','/api/v1/stats/customer/undefined'),('jacky.chang',1,'2018-04-27 15:10:02','10.142.0.3','/api/v1/config/3'),('jacky.chang',1,'2018-04-27 15:10:02','10.142.0.3','/api/v1/config/4'),('jacky.chang',1,'2018-04-27 15:10:02','10.142.0.3','/api/v1/claim/all/undefined/undefined'),('jacky.chang',1,'2018-04-27 15:10:03','10.142.0.3','/api/v1/claim/all/undefined/undefined'),('jacky.chang',1,'2018-04-27 15:10:16','10.142.0.3','/api/v1/claim/1004'),('jacky.chang',1,'2018-04-27 15:10:16','10.142.0.3','/api/v1/worklog/workitems/1004'),('jacky.chang',1,'2018-04-27 15:10:16','10.142.0.3','/api/v1/claim/assign/1004'),('jacky.chang',1,'2018-04-27 15:10:16','10.142.0.3','/api/v1/config/3'),('jacky.chang',1,'2018-04-27 15:10:16','10.142.0.3','/api/v1/config/11'),('jacky.chang',1,'2018-04-27 15:10:16','10.142.0.3','/api/v1/config/4'),('jacky.chang',1,'2018-04-27 15:10:19','10.142.0.3','/api/v1/staff/search/?query=ja'),('jacky.chang',1,'2018-04-27 15:10:19','10.142.0.3','/api/v1/staff/search/?query=jac'),('jacky.chang',1,'2018-04-27 15:10:19','10.142.0.3','/api/v1/staff/search/?query=jack'),('jacky.chang',1,'2018-04-27 15:10:20','10.142.0.3','/api/v1/staff/search/?query=jack'),('jacky.chang',1,'2018-04-27 15:10:20','10.142.0.3','/api/v1/staff/search/?query=jacky'),('jacky.chang',1,'2018-04-27 15:10:22','10.142.0.3','/api/v1/claim/assign'),('jacky.chang',1,'2018-04-27 15:10:23','10.142.0.3','/api/v1/claim/assign/1004'),('jacky.chang',1,'2018-04-27 15:12:21','10.142.0.3','/api/v1/worklog/new'),('jacky.chang',1,'2018-04-27 15:12:22','10.142.0.3','/api/v1/worklog/workitems/1004'),('jacky.chang',1,'2018-04-27 15:12:27','10.142.0.3','/api/v1/claim/status/'),('jacky.chang',1,'2018-04-27 15:12:28','10.142.0.3','/api/v1/notification/claimstatus'),('aceadmin',1,'2018-04-27 15:12:30','10.142.0.3','/api/v1/dashboard/staff/jacky.chang'),('aceadmin',1,'2018-04-27 15:12:30','10.142.0.3','/api/v1/dashboard/calendar/jacky.chang'),('aceadmin',1,'2018-04-27 15:12:30','10.142.0.3','/api/v1/dashboard/admin/'),('jacky.chang',1,'2018-04-27 15:12:34','10.142.0.3','/api/v1/customer'),('jacky.chang',1,'2018-04-27 15:12:34','10.142.0.3','/api/v1/config/6'),('jacky.chang',1,'2018-04-27 15:12:36','10.142.0.3','/api/v1/config/6'),('jacky.chang',1,'2018-04-27 15:12:36','10.142.0.3','/api/v1/customer/heyzel'),('jacky.chang',1,'2018-04-27 15:12:36','10.142.0.3','/api/v1/config/2'),('jacky.chang',1,'2018-04-27 15:12:37','10.142.0.3','/api/v1/user/getstatus/heyzel'),('jacky.chang',1,'2018-04-27 15:12:37','10.142.0.3','/api/v1/claim/user/heyzel'),('jacky.chang',1,'2018-04-27 15:12:39','10.142.0.3','/api/v1/customer'),('jacky.chang',1,'2018-04-27 15:12:39','10.142.0.3','/api/v1/config/6'),('jacky.chang',1,'2018-04-27 15:12:43','10.142.0.3','/api/v1/customer/kitty'),('jacky.chang',1,'2018-04-27 15:12:43','10.142.0.3','/api/v1/config/6'),('jacky.chang',1,'2018-04-27 15:12:43','10.142.0.3','/api/v1/config/2'),('jacky.chang',1,'2018-04-27 15:12:44','10.142.0.3','/api/v1/user/getstatus/kitty'),('jacky.chang',1,'2018-04-27 15:12:44','10.142.0.3','/api/v1/claim/user/kitty'),('jacky.chang',1,'2018-04-27 15:12:48','10.142.0.3','/api/v1/claim/1009'),('jacky.chang',1,'2018-04-27 15:12:48','10.142.0.3','/api/v1/worklog/workitems/1009'),('jacky.chang',1,'2018-04-27 15:12:48','10.142.0.3','/api/v1/claim/assign/1009'),('jacky.chang',1,'2018-04-27 15:12:48','10.142.0.3','/api/v1/config/3'),('jacky.chang',1,'2018-04-27 15:12:48','10.142.0.3','/api/v1/config/11'),('jacky.chang',1,'2018-04-27 15:12:48','10.142.0.3','/api/v1/config/4'),('aceadmin',1,'2018-04-27 15:12:52','10.142.0.3','/api/v1/dashboard/staff/jacky.chang'),('aceadmin',1,'2018-04-27 15:12:52','10.142.0.3','/api/v1/dashboard/calendar/jacky.chang'),('aceadmin',1,'2018-04-27 15:12:52','10.142.0.3','/api/v1/dashboard/admin/'),('jacky.chang',1,'2018-04-27 15:13:01','10.142.0.3','/api/v1/config/3'),('jacky.chang',1,'2018-04-27 15:13:01','10.142.0.3','/api/v1/config/4'),('jacky.chang',1,'2018-04-27 15:13:01','10.142.0.3','/api/v1/claim/all/undefined/undefined'),('jacky.chang',1,'2018-04-27 15:13:01','10.142.0.3','/api/v1/claim/all/undefined/undefined'),('jacky.chang',1,'2018-04-27 15:13:12','10.142.0.3','/api/v1/claim/1004'),('jacky.chang',1,'2018-04-27 15:13:12','10.142.0.3','/api/v1/worklog/workitems/1004'),('jacky.chang',1,'2018-04-27 15:13:12','10.142.0.3','/api/v1/claim/assign/1004'),('jacky.chang',1,'2018-04-27 15:13:12','10.142.0.3','/api/v1/config/3'),('jacky.chang',1,'2018-04-27 15:13:13','10.142.0.3','/api/v1/config/11'),('jacky.chang',1,'2018-04-27 15:13:13','10.142.0.3','/api/v1/config/4'),('jacky.chang',1,'2018-04-27 15:13:16','10.142.0.3','/api/v1/attachment/download/1'),('jacky.chang',1,'2018-04-27 15:13:25','10.142.0.3','/api/v1/attachment/download/1'),('aceadmin',1,'2018-04-27 15:13:37','10.142.0.3','/api/v1/dashboard/staff/jacky.chang'),('aceadmin',1,'2018-04-27 15:13:37','10.142.0.3','/api/v1/dashboard/calendar/jacky.chang'),('aceadmin',1,'2018-04-27 15:13:37','10.142.0.3','/api/v1/dashboard/admin/'),('jacky.chang',1,'2018-04-27 15:13:40','10.142.0.3','/api/v1/property/'),('jacky.chang',1,'2018-04-27 15:13:40','10.142.0.3','/api/v1/config/9'),('jacky.chang',1,'2018-04-27 15:13:48','10.142.0.3','/api/v1/property/1'),('jacky.chang',1,'2018-04-27 15:13:48','10.142.0.3','/api/v1/config/9'),('jacky.chang',1,'2018-04-27 15:13:49','10.142.0.3','/api/v1/claim/property/64acda72-3d2f-4cde-bdbb-d8f6f4f6cd34'),('aceadmin',1,'2018-04-27 15:14:07','10.142.0.3','/api/v1/stats/completion/undefined'),('aceadmin',1,'2018-04-27 15:14:07','10.142.0.3','/api/v1/stats/suburb/undefined'),('aceadmin',1,'2018-04-27 15:14:07','10.142.0.3','/api/v1/stats/requesttype/undefined'),('aceadmin',1,'2018-04-27 15:14:08','10.142.0.3','/api/v1/stats/requestcount/undefined'),('aceadmin',1,'2018-04-27 15:14:08','10.142.0.3','/api/v1/stats/requestduration/undefined'),('aceadmin',1,'2018-04-27 15:14:08','10.142.0.3','/api/v1/stats/staff/undefined'),('aceadmin',1,'2018-04-27 15:14:08','10.142.0.3','/api/v1/stats/customer/undefined'),('jacky.chang',1,'2018-04-27 15:14:08','10.142.0.3','/api/v1/customer'),('jacky.chang',1,'2018-04-27 15:14:08','10.142.0.3','/api/v1/config/6'),('jacky.chang',1,'2018-04-27 15:14:10','10.142.0.3','/api/v1/config/6'),('jacky.chang',1,'2018-04-27 15:14:10','10.142.0.3','/api/v1/customer/guy1'),('jacky.chang',1,'2018-04-27 15:14:10','10.142.0.3','/api/v1/config/2'),('jacky.chang',1,'2018-04-27 15:14:11','10.142.0.3','/api/v1/user/getstatus/guy1'),('jacky.chang',1,'2018-04-27 15:14:11','10.142.0.3','/api/v1/claim/user/guy1'),('jacky.chang',1,'2018-04-27 15:14:15','10.142.0.3','/api/v1/address/complete/?q='),('jacky.chang',1,'2018-04-27 15:14:17','10.142.0.3','/api/v1/customer/update'),('jacky.chang',1,'2018-04-27 15:14:17','10.142.0.3','/api/v1/user/update'),('jacky.chang',1,'2018-04-27 15:14:21','10.142.0.3','/api/v1/customer'),('jacky.chang',1,'2018-04-27 15:14:21','10.142.0.3','/api/v1/config/6'),('jacky.chang',1,'2018-04-27 15:14:25','10.142.0.3','/api/v1/config/6'),('jacky.chang',1,'2018-04-27 15:14:25','10.142.0.3','/api/v1/customer/heyzel'),('jacky.chang',1,'2018-04-27 15:14:25','10.142.0.3','/api/v1/config/2'),('jacky.chang',1,'2018-04-27 15:14:26','10.142.0.3','/api/v1/user/getstatus/heyzel'),('jacky.chang',1,'2018-04-27 15:14:26','10.142.0.3','/api/v1/claim/user/heyzel'),('jacky.chang',1,'2018-04-27 15:14:30','10.142.0.3','/api/v1/address/complete/?q='),('jacky.chang',1,'2018-04-27 15:14:31','10.142.0.3','/api/v1/customer/update'),('jacky.chang',1,'2018-04-27 15:14:32','10.142.0.3','/api/v1/user/update'),('jacky.chang',1,'2018-04-27 15:14:33','10.142.0.3','/api/v1/customer'),('jacky.chang',1,'2018-04-27 15:14:33','10.142.0.3','/api/v1/config/6'),('jacky.chang',1,'2018-04-27 15:14:40','10.142.0.3','/api/v1/customer/csotto'),('jacky.chang',1,'2018-04-27 15:14:40','10.142.0.3','/api/v1/config/6'),('jacky.chang',1,'2018-04-27 15:14:40','10.142.0.3','/api/v1/config/2'),('jacky.chang',1,'2018-04-27 15:14:40','10.142.0.3','/api/v1/user/getstatus/csotto'),('jacky.chang',1,'2018-04-27 15:14:40','10.142.0.3','/api/v1/claim/user/csotto'),('jacky.chang',1,'2018-04-27 15:14:56','10.142.0.3','/api/v1/customer/csotto'),('jacky.chang',1,'2018-04-27 15:14:56','10.142.0.3','/api/v1/config/6'),('jacky.chang',1,'2018-04-27 15:14:56','10.142.0.3','/api/v1/config/2'),('jacky.chang',1,'2018-04-27 15:14:56','10.142.0.3','/api/v1/user/getstatus/csotto'),('jacky.chang',1,'2018-04-27 15:14:56','10.142.0.3','/api/v1/claim/user/csotto'),('jacky.chang',1,'2018-04-27 15:15:00','10.142.0.3','/api/v1/config/6'),('jacky.chang',1,'2018-04-27 15:15:00','10.142.0.3','/api/v1/customer'),('jacky.chang',1,'2018-04-27 15:15:13','10.142.0.3','/api/v1/customer/csotto'),('jacky.chang',1,'2018-04-27 15:15:13','10.142.0.3','/api/v1/config/6'),('jacky.chang',1,'2018-04-27 15:15:13','10.142.0.3','/api/v1/config/2'),('jacky.chang',1,'2018-04-27 15:15:13','10.142.0.3','/api/v1/user/getstatus/csotto'),('jacky.chang',1,'2018-04-27 15:15:13','10.142.0.3','/api/v1/claim/user/csotto'),('jacky.chang',1,'2018-04-27 15:15:18','10.142.0.3','/api/v1/address/search/?q='),('jacky.chang',1,'2018-04-27 15:15:20','10.142.0.3','/api/v1/address/complete/?q='),('jacky.chang',1,'2018-04-27 15:15:21','10.142.0.3','/api/v1/customer/update'),('jacky.chang',1,'2018-04-27 15:15:22','10.142.0.3','/api/v1/user/update'),('jacky.chang',1,'2018-04-27 15:15:24','10.142.0.3','/api/v1/customer'),('jacky.chang',1,'2018-04-27 15:15:24','10.142.0.3','/api/v1/config/6'),('jacky.chang',1,'2018-04-27 15:15:26','10.142.0.3','/api/v1/config/6'),('jacky.chang',1,'2018-04-27 15:15:26','10.142.0.3','/api/v1/customer/miles'),('jacky.chang',1,'2018-04-27 15:15:26','10.142.0.3','/api/v1/config/2'),('jacky.chang',1,'2018-04-27 15:15:27','10.142.0.3','/api/v1/user/getstatus/miles'),('jacky.chang',1,'2018-04-27 15:15:27','10.142.0.3','/api/v1/claim/user/miles'),('jacky.chang',1,'2018-04-27 15:15:37','10.142.0.3','/api/v1/address/complete/?q=30%20Allen%20Street%20%20LEICHHARDT%20NSW%202040'),('jacky.chang',1,'2018-04-27 15:15:38','10.142.0.3','/api/v1/customer/update'),('jacky.chang',1,'2018-04-27 15:15:39','10.142.0.3','/api/v1/user/update'),('jacky.chang',1,'2018-04-27 15:18:36','10.142.0.3','/api/v1/stats/completion/undefined'),('jacky.chang',1,'2018-04-27 15:18:36','10.142.0.3','/api/v1/stats/suburb/undefined'),('jacky.chang',1,'2018-04-27 15:18:36','10.142.0.3','/api/v1/stats/requesttype/undefined'),('jacky.chang',1,'2018-04-27 15:18:36','10.142.0.3','/api/v1/stats/requestcount/undefined'),('jacky.chang',1,'2018-04-27 15:18:36','10.142.0.3','/api/v1/stats/requestduration/undefined'),('jacky.chang',1,'2018-04-27 15:18:36','10.142.0.3','/api/v1/stats/staff/undefined'),('jacky.chang',1,'2018-04-27 15:18:36','10.142.0.3','/api/v1/stats/customer/undefined'),('jacky.chang',1,'2018-04-27 15:18:49','10.142.0.3','/api/v1/stats/completion/undefined'),('jacky.chang',1,'2018-04-27 15:18:49','10.142.0.3','/api/v1/stats/suburb/undefined'),('jacky.chang',1,'2018-04-27 15:18:49','10.142.0.3','/api/v1/stats/requesttype/undefined'),('jacky.chang',1,'2018-04-27 15:18:49','10.142.0.3','/api/v1/stats/requestcount/undefined'),('jacky.chang',1,'2018-04-27 15:18:49','10.142.0.3','/api/v1/stats/requestduration/undefined'),('jacky.chang',1,'2018-04-27 15:18:49','10.142.0.3','/api/v1/stats/staff/undefined'),('jacky.chang',1,'2018-04-27 15:18:49','10.142.0.3','/api/v1/stats/customer/undefined'),('jacky.chang',1,'2018-04-27 15:20:59','10.142.0.3','/api/v1/dashboard/staff/jacky.chang'),('jacky.chang',1,'2018-04-27 15:20:59','10.142.0.3','/api/v1/dashboard/calendar/jacky.chang'),('jacky.chang',1,'2018-04-27 15:20:59','10.142.0.3','/api/v1/dashboard/admin/'),('jacky.chang',1,'2018-04-27 15:22:02','10.142.0.3','/api/v1/dashboard/staff/jacky.chang'),('jacky.chang',1,'2018-04-27 15:22:02','10.142.0.3','/api/v1/dashboard/calendar/jacky.chang'),('jacky.chang',1,'2018-04-27 15:22:02','10.142.0.3','/api/v1/dashboard/admin/'),('jacky.chang',1,'2018-04-27 15:22:04','10.142.0.3','/api/v1/stats/completion/undefined'),('jacky.chang',1,'2018-04-27 15:22:04','10.142.0.3','/api/v1/stats/suburb/undefined'),('jacky.chang',1,'2018-04-27 15:22:04','10.142.0.3','/api/v1/stats/requesttype/undefined'),('jacky.chang',1,'2018-04-27 15:22:04','10.142.0.3','/api/v1/stats/requestcount/undefined'),('jacky.chang',1,'2018-04-27 15:22:04','10.142.0.3','/api/v1/stats/requestduration/undefined'),('jacky.chang',1,'2018-04-27 15:22:04','10.142.0.3','/api/v1/stats/staff/undefined'),('jacky.chang',1,'2018-04-27 15:22:04','10.142.0.3','/api/v1/stats/customer/undefined'),('jacky.chang',1,'2018-04-27 15:22:24','10.142.0.3','/api/v1/stats/completion/undefined'),('jacky.chang',1,'2018-04-27 15:22:24','10.142.0.3','/api/v1/stats/suburb/undefined'),('jacky.chang',1,'2018-04-27 15:22:24','10.142.0.3','/api/v1/stats/requesttype/undefined'),('jacky.chang',1,'2018-04-27 15:22:24','10.142.0.3','/api/v1/stats/requestcount/undefined'),('jacky.chang',1,'2018-04-27 15:22:24','10.142.0.3','/api/v1/stats/requestduration/undefined'),('jacky.chang',1,'2018-04-27 15:22:24','10.142.0.3','/api/v1/stats/staff/undefined'),('jacky.chang',1,'2018-04-27 15:22:24','10.142.0.3','/api/v1/stats/customer/undefined'),('jacky.chang',1,'2018-04-27 15:23:34','10.142.0.3','/api/v1/stats/completion/undefined'),('jacky.chang',1,'2018-04-27 15:23:34','10.142.0.3','/api/v1/stats/suburb/undefined'),('jacky.chang',1,'2018-04-27 15:23:34','10.142.0.3','/api/v1/stats/requesttype/undefined'),('jacky.chang',1,'2018-04-27 15:23:34','10.142.0.3','/api/v1/stats/requestcount/undefined'),('jacky.chang',1,'2018-04-27 15:23:34','10.142.0.3','/api/v1/stats/requestduration/undefined'),('jacky.chang',1,'2018-04-27 15:23:34','10.142.0.3','/api/v1/stats/staff/undefined'),('jacky.chang',1,'2018-04-27 15:23:34','10.142.0.3','/api/v1/stats/customer/undefined'),('jacky.chang',1,'2018-04-27 15:24:09','10.142.0.3','/api/v1/stats/completion/undefined'),('jacky.chang',1,'2018-04-27 15:24:09','10.142.0.3','/api/v1/stats/suburb/undefined'),('jacky.chang',1,'2018-04-27 15:24:09','10.142.0.3','/api/v1/stats/requesttype/undefined'),('jacky.chang',1,'2018-04-27 15:24:09','10.142.0.3','/api/v1/stats/requestcount/undefined'),('jacky.chang',1,'2018-04-27 15:24:09','10.142.0.3','/api/v1/stats/requestduration/undefined'),('jacky.chang',1,'2018-04-27 15:24:10','10.142.0.3','/api/v1/stats/staff/undefined'),('jacky.chang',1,'2018-04-27 15:24:10','10.142.0.3','/api/v1/stats/customer/undefined'),('jacky.chang',1,'2018-04-27 15:24:51','10.142.0.3','/api/v1/dashboard/staff/jacky.chang'),('jacky.chang',1,'2018-04-27 15:24:51','10.142.0.3','/api/v1/dashboard/calendar/jacky.chang'),('jacky.chang',1,'2018-04-27 15:24:51','10.142.0.3','/api/v1/dashboard/admin/'),('jacky.chang',1,'2018-04-27 15:24:52','10.142.0.3','/api/v1/stats/completion/undefined'),('jacky.chang',1,'2018-04-27 15:24:52','10.142.0.3','/api/v1/stats/suburb/undefined'),('jacky.chang',1,'2018-04-27 15:24:52','10.142.0.3','/api/v1/stats/requesttype/undefined'),('jacky.chang',1,'2018-04-27 15:24:52','10.142.0.3','/api/v1/stats/requestcount/undefined'),('jacky.chang',1,'2018-04-27 15:24:52','10.142.0.3','/api/v1/stats/requestduration/undefined'),('jacky.chang',1,'2018-04-27 15:24:52','10.142.0.3','/api/v1/stats/staff/undefined'),('jacky.chang',1,'2018-04-27 15:24:52','10.142.0.3','/api/v1/stats/customer/undefined');
/*!40000 ALTER TABLE `loginhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `notifid` int(11) NOT NULL AUTO_INCREMENT,
  `referenceid` varchar(12) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `fromuserid` varchar(16) DEFAULT NULL,
  `touserid` varchar(16) DEFAULT NULL,
  `notifdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `notifflag` int(11) DEFAULT NULL,
  PRIMARY KEY (`notifid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property`
--

DROP TABLE IF EXISTS `property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `property` (
  `propertyid` float(9,2) NOT NULL AUTO_INCREMENT,
  `property_canonical_id` varchar(50) NOT NULL,
  `address1` varchar(50) DEFAULT NULL,
  `address2` varchar(50) DEFAULT NULL,
  `suburb` varchar(25) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `postcode` int(11) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `propertytype` int(11) DEFAULT NULL,
  `latitude` decimal(12,6) DEFAULT NULL,
  `longitude` decimal(12,6) DEFAULT NULL,
  `unit_type` varchar(25) DEFAULT NULL,
  `mesh_block` decimal(12,0) DEFAULT NULL,
  PRIMARY KEY (`propertyid`,`property_canonical_id`),
  UNIQUE KEY `propertyid_UNIQUE` (`propertyid`),
  UNIQUE KEY `property_canonical_id_UNIQUE` (`property_canonical_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property`
--

LOCK TABLES `property` WRITE;
/*!40000 ALTER TABLE `property` DISABLE KEYS */;
INSERT INTO `property` VALUES (1.00,'64acda72-3d2f-4cde-bdbb-d8f6f4f6cd34','9 Drummoyne Avenue',NULL,'DRUMMOYNE','NSW',2047,'AUSTRALIA',5,-33.843267,151.151909,NULL,10181251000),(2.00,'449ee81a-e973-47ad-ba71-c83468bf0758','15 Hycraft Walk',NULL,'FIVE DOCK','NSW',2046,'AUSTRALIA',5,-33.867381,151.128943,NULL,10178350000),(3.00,'b8c563e1-d77f-45ff-879c-afdbde123057','30 Allen Street',NULL,'LEICHHARDT','NSW',2040,'AUSTRALIA',5,-33.880370,151.155059,NULL,10461400000),(4.00,'93171da5-002c-4c49-a410-d011f9e75e4e','2 Ormond Street',NULL,'ASHFIELD','NSW',2131,'AUSTRALIA',5,-33.887758,151.132420,NULL,10014280000),(5.00,'fd32a6ff-e98b-44fd-95ab-378672d7da4b','Unit 4','43-45 Neil Street','MERRYLANDS','NSW',2160,'AUSTRALIA',5,-33.833046,150.989745,'Unit',10365680000),(6.00,'11035157-b1e4-42f7-850e-6d68b1d790bd','22 Hudson Street',NULL,'LEWISHAM','NSW',2049,'AUSTRALIA',5,-33.893457,151.144605,NULL,10509893000),(7.00,'4bcbd52a-dca6-4d11-9a88-273b3112fc11','118 Old Canterbury Road',NULL,'LEWISHAM','NSW',2049,'AUSTRALIA',5,-33.894795,151.144106,NULL,10509891000);
/*!40000 ALTER TABLE `property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `requestcompletionstat`
--

DROP TABLE IF EXISTS `requestcompletionstat`;
/*!50001 DROP VIEW IF EXISTS `requestcompletionstat`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `requestcompletionstat` AS SELECT 
 1 AS `year`,
 1 AS `allrequests`,
 1 AS `avgcompleted`,
 1 AS `pcntcompleted`,
 1 AS `avgduration`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `requestcountstat`
--

DROP TABLE IF EXISTS `requestcountstat`;
/*!50001 DROP VIEW IF EXISTS `requestcountstat`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `requestcountstat` AS SELECT 
 1 AS `year`,
 1 AS `allrequests`,
 1 AS `openrequests`,
 1 AS `closedrequests`,
 1 AS `rejectedrequests`,
 1 AS `cancelledrequests`,
 1 AS `closed1d`,
 1 AS `closed1w`,
 1 AS `closedgt1w`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `staffid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL,
  `staffname` varchar(30) DEFAULT NULL,
  `department` int(11) DEFAULT NULL,
  `accesstype` int(11) DEFAULT NULL,
  PRIMARY KEY (`staffid`),
  KEY `userstafffk_idx` (`username`),
  CONSTRAINT `userstafffk` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=1005 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1000,'aceadmin','Ace Admin',1,1),(1001,'amber.sheppard','Amber Sheppard',1,2),(1002,'tina.chung','Tina Chung',3,1),(1003,'shawn.xu','Shawn Xu',4,3),(1004,'jacky.chang','Jacky Chang',3,4);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `staffstat`
--

DROP TABLE IF EXISTS `staffstat`;
/*!50001 DROP VIEW IF EXISTS `staffstat`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `staffstat` AS SELECT 
 1 AS `username`,
 1 AS `year`,
 1 AS `month`,
 1 AS `assigned`,
 1 AS `openassigned`,
 1 AS `forapproval`,
 1 AS `completed`,
 1 AS `throughput`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `suburbstat`
--

DROP TABLE IF EXISTS `suburbstat`;
/*!50001 DROP VIEW IF EXISTS `suburbstat`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `suburbstat` AS SELECT 
 1 AS `suburb`,
 1 AS `year`,
 1 AS `allrequest`,
 1 AS `openrequest`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL,
  `firstname` varchar(20) DEFAULT NULL,
  `lastname` varchar(20) DEFAULT NULL,
  `password` varchar(250) DEFAULT NULL,
  `roleid` int(11) DEFAULT NULL,
  `mobilenumber` varchar(12) DEFAULT NULL,
  `emailaddress` varchar(50) DEFAULT NULL,
  `createddate` datetime DEFAULT CURRENT_TIMESTAMP,
  `modifieddate` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'aceadmin','Ace','Admin','7c1ce17a4fe2fca8ffd7f552ad03238d5b51b141',1,NULL,'ktbartolo@up.edu.ph','2018-04-27 23:01:38',NULL,2),(2,'amber.sheppard','Amber','Sheppard','5bcfe00e72a941bf31a1d625e419cd7abba17203',2,NULL,'ktbartolo@up.edu.ph','2018-04-27 23:11:08',NULL,2),(3,'tina.chung','Tina','Chung','5bcfe00e72a941bf31a1d625e419cd7abba17203',1,NULL,'ktbartolo@up.edu.ph','2018-04-27 23:12:14',NULL,2),(4,'shawn.xu','Shawn','Xu','5bcfe00e72a941bf31a1d625e419cd7abba17203',2,NULL,'ktbartolo@up.edu.ph','2018-04-27 23:13:25',NULL,3),(5,'karezb','Karez','Bartolo','5bcfe00e72a941bf31a1d625e419cd7abba17203',4,'415232985','ktbartolo@up.edu.ph','2018-04-27 23:13:58',NULL,2),(6,'jacky.chang','Jacky','Chang','5bcfe00e72a941bf31a1d625e419cd7abba17203',1,NULL,'ktbartolo@up.edu.ph','2018-04-27 23:16:25',NULL,2),(9,'sureshsingh','Suresh','Singh','5bcfe00e72a941bf31a1d625e419cd7abba17203',4,'415232985','ktbartolo@up.edu.ph','2018-04-27 23:50:21',NULL,1),(11,'guy1','Glenn','Uy','5bcfe00e72a941bf31a1d625e419cd7abba17203',4,'415232985','ktbartolo@up.edu.ph','2018-04-27 23:56:43',NULL,2),(12,'csotto','Camille','Sotto','5bcfe00e72a941bf31a1d625e419cd7abba17203',4,'415232985','ktbartolo@up.edu.ph','2018-04-27 23:59:39',NULL,2),(13,'miles','Miles','Jones','5bcfe00e72a941bf31a1d625e419cd7abba17203',4,'415232985','ktbartolo@up.edu.ph','2018-04-28 00:09:39',NULL,2),(14,'heyzel','Hazel','Pineda','5bcfe00e72a941bf31a1d625e419cd7abba17203',4,NULL,'ktbartolo@up.edu.ph','2018-04-28 00:19:54',NULL,2),(15,'kitty','Kitty','Nguyen','5bcfe00e72a941bf31a1d625e419cd7abba17203',4,'415232985','ktbartolo@up.edu.ph','2018-04-28 00:31:05',NULL,2);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verification`
--

DROP TABLE IF EXISTS `verification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verification` (
  `verifyid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL,
  `method` int(11) DEFAULT NULL,
  `submitteddate` datetime DEFAULT CURRENT_TIMESTAMP,
  `verifykey` varchar(50) DEFAULT NULL,
  `token` varchar(6) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `processeddate` datetime DEFAULT NULL,
  PRIMARY KEY (`verifyid`),
  KEY `userverifyfk_idx` (`username`),
  CONSTRAINT `userverifyfk` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verification`
--

LOCK TABLES `verification` WRITE;
/*!40000 ALTER TABLE `verification` DISABLE KEYS */;
/*!40000 ALTER TABLE `verification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `workitemdetails`
--

DROP TABLE IF EXISTS `workitemdetails`;
/*!50001 DROP VIEW IF EXISTS `workitemdetails`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `workitemdetails` AS SELECT 
 1 AS `workitemid`,
 1 AS `worklogid`,
 1 AS `worktype`,
 1 AS `worktypename`,
 1 AS `creationdate`,
 1 AS `description`,
 1 AS `notes`,
 1 AS `auditwho`,
 1 AS `auditwhen`,
 1 AS `itemid`,
 1 AS `attachment`,
 1 AS `attachmenttype`,
 1 AS `filetypename`,
 1 AS `attachwho`,
 1 AS `attachwhen`,
 1 AS `inspectionid`,
 1 AS `inspectiondesc`,
 1 AS `inspectionresp`,
 1 AS `inspectioncreatedate`,
 1 AS `inspectionrespdate`,
 1 AS `inspectiondate`,
 1 AS `inspectionwho`,
 1 AS `inspectionwhen`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `worklogattachrel`
--

DROP TABLE IF EXISTS `worklogattachrel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `worklogattachrel` (
  `workitemid` int(11) NOT NULL,
  `itemid` int(11) NOT NULL,
  PRIMARY KEY (`workitemid`,`itemid`),
  KEY `relattachid_FK` (`itemid`),
  CONSTRAINT `relattachid_FK` FOREIGN KEY (`itemid`) REFERENCES `attachment` (`itemid`),
  CONSTRAINT `relworkitemid_FK` FOREIGN KEY (`workitemid`) REFERENCES `workloghistory` (`workitemid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worklogattachrel`
--

LOCK TABLES `worklogattachrel` WRITE;
/*!40000 ALTER TABLE `worklogattachrel` DISABLE KEYS */;
INSERT INTO `worklogattachrel` VALUES (1007,1);
/*!40000 ALTER TABLE `worklogattachrel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workloghistory`
--

DROP TABLE IF EXISTS `workloghistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workloghistory` (
  `workitemid` int(11) NOT NULL AUTO_INCREMENT,
  `worklogid` float(9,2) DEFAULT NULL,
  `worktype` int(11) DEFAULT NULL,
  `creationdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `description` varchar(350) DEFAULT NULL,
  `notes` text,
  `auditwho` varchar(16) DEFAULT NULL,
  `auditwhen` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`workitemid`),
  KEY `claimworklogfk_idx` (`worklogid`),
  CONSTRAINT `claimworklogfk` FOREIGN KEY (`worklogid`) REFERENCES `claim` (`claimid`)
) ENGINE=InnoDB AUTO_INCREMENT=1008 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workloghistory`
--

LOCK TABLES `workloghistory` WRITE;
/*!40000 ALTER TABLE `workloghistory` DISABLE KEYS */;
INSERT INTO `workloghistory` VALUES (1000,1002.00,2,'2018-04-24 13:12:24','Heater inspection','This is to inspect the building heater','jacky.chang','2018-04-24 13:12:24'),(1001,1002.00,1,'2018-04-26 15:16:33','Inspection done','Heater will be replaced. Sending for approval','jacky.chang','2018-04-26 15:16:33'),(1002,1002.00,1,'2018-04-26 15:20:10','Service logged: INC10000123','Requested for heater to be replaced','jacky.chang','2018-04-26 15:20:10'),(1003,1001.00,2,'2018-04-24 13:37:33','Inspection of possible pipe leak','A pipe inspector will be coming to check if the leak is from your neighbour\'s pipe','tina.chung','2018-04-24 13:37:33'),(1004,1003.00,1,'2018-04-24 13:39:09','Security lock','The new security locks ordered haven\'t arrived yet. A strata announcement will be sent when this is ready to be installed.','tina.chung','2018-04-24 13:39:09'),(1005,1006.00,1,'2018-04-24 13:40:32','Bathroom leaking pipes','I\'m sorry but this is not covered by your strata arrangement. If you\'re the home owner then you have to get it fixed yourself.\r\n\r\nCheers.','tina.chung','2018-04-24 13:40:32'),(1006,1009.00,1,'2018-04-24 13:43:43','Building Gym','The Body corporate executives will be having a meeting next week to discuss the details of the new facility. You might want to wait for the official bulletin from them after the said meeting','amber.sheppard','2018-04-24 13:43:43'),(1007,1004.00,1,'2018-04-27 15:12:21','New Ashfield Strata guidelines','Please see attached latest Ashfield strata guidelines','jacky.chang','2018-04-27 15:12:21');
/*!40000 ALTER TABLE `workloghistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `acebody`
--

USE `acebody`;

--
-- Final view structure for view `claimassigndetails`
--

/*!50001 DROP VIEW IF EXISTS `claimassigndetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `claimassigndetails` AS select `a`.`claimid` AS `claimid`,`a`.`username` AS `assignusername`,concat(`u`.`firstname`,' ',`u`.`lastname`) AS `assignname`,`a`.`auditwhen` AS `auditwhen` from ((`acebody`.`assignhistory` `a` join (select `acebody`.`assignhistory`.`claimid` AS `claimid`,max(`acebody`.`assignhistory`.`historyid`) AS `historyid` from `acebody`.`assignhistory` group by `acebody`.`assignhistory`.`claimid`) `c`) join `acebody`.`user` `u`) where ((`c`.`claimid` = `a`.`claimid`) and (`a`.`historyid` = `c`.`historyid`) and (`u`.`username` = `a`.`username`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `claimdetails`
--

/*!50001 DROP VIEW IF EXISTS `claimdetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `claimdetails` AS select `c`.`claimid` AS `claimid`,`p`.`propertyid` AS `propertyid`,`c`.`property_canonical_id` AS `property_canonical_id`,`p`.`address1` AS `address1`,`p`.`address2` AS `address2`,`p`.`suburb` AS `suburb`,`p`.`state` AS `state`,`p`.`postcode` AS `postcode`,`p`.`country` AS `country`,`p`.`propertytype` AS `propertytypeid`,`ac9`.`longdesc` AS `propertytypename`,`p`.`latitude` AS `latitude`,`p`.`longitude` AS `longitude`,`p`.`mesh_block` AS `mesh_block`,`p`.`unit_type` AS `unit_type`,`c`.`claimtypeid` AS `claimtypeid`,`ac3`.`shortdesc` AS `claimtypename`,`c`.`summary` AS `summary`,`c`.`description` AS `description`,`c`.`submitteddate` AS `submitteddate`,`c`.`submitteduser` AS `submitteduser`,(select concat(`user`.`firstname`,' ',`user`.`lastname`) from `user` where (`user`.`username` = `c`.`submitteduser`)) AS `submittedname`,`c`.`status` AS `status`,`ac4`.`longdesc` AS `statusname`,`c`.`approvaldate` AS `approvaldate`,`c`.`approveruser` AS `approveruser`,`c`.`auditwho` AS `auditwho` from ((((`claim` `c` join `property` `p` on((`p`.`property_canonical_id` = `c`.`property_canonical_id`))) left join `aceconfig` `ac9` on(((`p`.`propertytype` = `ac9`.`ordinal`) and (`ac9`.`groupid` = 9)))) left join `aceconfig` `ac4` on(((`c`.`status` = `ac4`.`ordinal`) and (`ac4`.`groupid` = 4)))) left join `aceconfig` `ac3` on(((`c`.`claimtypeid` = `ac3`.`ordinal`) and (`ac3`.`groupid` = 3)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `claimdurationstat`
--

/*!50001 DROP VIEW IF EXISTS `claimdurationstat`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `claimdurationstat` AS select `c`.`claimid` AS `claimid`,year(`c`.`submitteddate`) AS `year`,month(`c`.`submitteddate`) AS `month`,`c`.`status` AS `status`,`c`.`submitteddate` AS `startdate`,(case when (`c`.`status` >= 7) then `ca`.`auditwhen` else NULL end) AS `enddate`,(to_days((case when (`c`.`status` >= 7) then `ca`.`auditwhen` else curdate() end)) - to_days(`c`.`submitteddate`)) AS `duration` from (`acebody`.`claimdetails` `c` join `acebody`.`claimassigndetails` `ca` on((`c`.`claimid` = `ca`.`claimid`))) group by year(`c`.`submitteddate`),month(`c`.`submitteddate`),`c`.`claimid` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customerstat`
--

/*!50001 DROP VIEW IF EXISTS `customerstat`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customerstat` AS select `cu`.`username` AS `username`,year(`c`.`submitteddate`) AS `year`,month(`c`.`submitteddate`) AS `month`,count(`c`.`claimid`) AS `requests`,count((case when (`c`.`status` < 7) then `c`.`claimid` else NULL end)) AS `openrequests`,count((case when (`c`.`status` = 7) then `c`.`claimid` else NULL end)) AS `completedrequests`,count((case when (`c`.`status` >= 8) then `c`.`claimid` else NULL end)) AS `cancelledrequests`,count(distinct `c`.`property_canonical_id`) AS `allproperties` from (`customer` `cu` join `claimdetails` `c` on((`c`.`submitteduser` = `cu`.`username`))) group by `cu`.`username`,year(`c`.`submitteddate`),month(`c`.`submitteddate`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `inspectiondetails`
--

/*!50001 DROP VIEW IF EXISTS `inspectiondetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `inspectiondetails` AS select `i`.`inspectionid` AS `inspectionid`,(case when (`i`.`inspectiondate` <= curdate()) then 0 else 1 end) AS `valid`,`i`.`response` AS `response`,`i`.`responsedate` AS `responsedate`,`i`.`inspectiondate` AS `inspectiondate`,`c`.`claimid` AS `claimid`,`w`.`description` AS `description`,`p`.`address1` AS `address1`,`p`.`address2` AS `address2`,`p`.`suburb` AS `suburb`,`p`.`state` AS `state`,`p`.`postcode` AS `postcode`,`p`.`latitude` AS `latitude`,`p`.`longitude` AS `longitude`,`i`.`token` AS `token` from (((`inspection` `i` join `workloghistory` `w`) join `claim` `c`) join `property` `p`) where ((`w`.`workitemid` = `i`.`workitemid`) and (`c`.`claimid` = `w`.`worklogid`) and (`p`.`property_canonical_id` = `c`.`property_canonical_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `requestcompletionstat`
--

/*!50001 DROP VIEW IF EXISTS `requestcompletionstat`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `requestcompletionstat` AS select year(`c`.`submitteddate`) AS `year`,count(`c`.`claimid`) AS `allrequests`,avg((case when (`c`.`status` <= 7) then 1 else NULL end)) AS `avgcompleted`,((count((case when (`c`.`status` >= 7) then 1 else NULL end)) / count(`c`.`claimid`)) * 100) AS `pcntcompleted`,avg((case when (`c`.`status` >= 7) then (to_days(`ca`.`auditwhen`) - to_days(`c`.`submitteddate`)) else NULL end)) AS `avgduration` from (`acebody`.`claimdetails` `c` join `acebody`.`claimassigndetails` `ca` on((`c`.`claimid` = `ca`.`claimid`))) group by year(`c`.`submitteddate`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `requestcountstat`
--

/*!50001 DROP VIEW IF EXISTS `requestcountstat`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `requestcountstat` AS select year(`c`.`submitteddate`) AS `year`,count(`c`.`claimid`) AS `allrequests`,count((case when (`c`.`status` < 7) then `c`.`status` else NULL end)) AS `openrequests`,count((case when (`c`.`status` = 7) then `c`.`status` else NULL end)) AS `closedrequests`,count((case when (`c`.`status` = 8) then `c`.`status` else NULL end)) AS `rejectedrequests`,count((case when (`c`.`status` = 9) then `c`.`status` else NULL end)) AS `cancelledrequests`,count((case when (((to_days((case when (`c`.`status` >= 7) then `ca`.`auditwhen` else curdate() end)) - to_days(`c`.`submitteddate`)) <= 1) and (`c`.`status` >= 7)) then `c`.`claimid` else NULL end)) AS `closed1d`,count((case when (((to_days((case when (`c`.`status` >= 7) then `ca`.`auditwhen` else curdate() end)) - to_days(`c`.`submitteddate`)) <= 7) and (`c`.`status` >= 7)) then `c`.`claimid` else NULL end)) AS `closed1w`,count((case when (((to_days((case when (`c`.`status` >= 7) then `ca`.`auditwhen` else curdate() end)) - to_days(`c`.`submitteddate`)) > 7) and (`c`.`status` >= 7)) then `c`.`claimid` else NULL end)) AS `closedgt1w` from (`acebody`.`claimdetails` `c` join `acebody`.`claimassigndetails` `ca` on((`c`.`claimid` = `ca`.`claimid`))) group by year(`c`.`submitteddate`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `staffstat`
--

/*!50001 DROP VIEW IF EXISTS `staffstat`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `staffstat` AS select `s`.`username` AS `username`,year(`c`.`submitteddate`) AS `year`,month(`c`.`submitteddate`) AS `month`,count(`ca`.`claimid`) AS `assigned`,count((case when (`c`.`status` < 7) then `ca`.`claimid` else NULL end)) AS `openassigned`,count((case when (`c`.`status` = 4) then `ca`.`claimid` else NULL end)) AS `forapproval`,count((case when (`c`.`status` >= 7) then `ca`.`claimid` else NULL end)) AS `completed`,(count((case when (`c`.`status` >= 7) then `ca`.`claimid` else NULL end)) / (select ifnull(avg(`requestcompletionstat`.`avgcompleted`),1) from `acebody`.`requestcompletionstat`)) AS `throughput` from ((`acebody`.`staff` `s` join `acebody`.`claimassigndetails` `ca` on((`s`.`username` = `ca`.`assignusername`))) join `acebody`.`claimdetails` `c` on((`ca`.`claimid` = `c`.`claimid`))) group by `s`.`username`,year(`c`.`submitteddate`),month(`c`.`submitteddate`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `suburbstat`
--

/*!50001 DROP VIEW IF EXISTS `suburbstat`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `suburbstat` AS select `claimdetails`.`suburb` AS `suburb`,year(`claimdetails`.`submitteddate`) AS `year`,count(`claimdetails`.`claimid`) AS `allrequest`,count((case when (`claimdetails`.`status` < 7) then `claimdetails`.`status` else NULL end)) AS `openrequest` from `claimdetails` group by `claimdetails`.`suburb`,year(`claimdetails`.`submitteddate`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `workitemdetails`
--

/*!50001 DROP VIEW IF EXISTS `workitemdetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `workitemdetails` AS select `wh`.`workitemid` AS `workitemid`,`wh`.`worklogid` AS `worklogid`,`wh`.`worktype` AS `worktype`,`ac11`.`longdesc` AS `worktypename`,`wh`.`creationdate` AS `creationdate`,`wh`.`description` AS `description`,`wh`.`notes` AS `notes`,`wh`.`auditwho` AS `auditwho`,`wh`.`auditwhen` AS `auditwhen`,`a`.`itemid` AS `itemid`,`a`.`attachment` AS `attachment`,`a`.`type` AS `attachmenttype`,`ac10`.`shortdesc` AS `filetypename`,`a`.`auditwho` AS `attachwho`,`a`.`auditwhen` AS `attachwhen`,`i`.`inspectionid` AS `inspectionid`,`i`.`description` AS `inspectiondesc`,`i`.`response` AS `inspectionresp`,`i`.`submitteddate` AS `inspectioncreatedate`,`i`.`responsedate` AS `inspectionrespdate`,`i`.`inspectiondate` AS `inspectiondate`,`i`.`auditwho` AS `inspectionwho`,`i`.`auditwhen` AS `inspectionwhen` from (((((`workloghistory` `wh` join `aceconfig` `ac11` on(((`ac11`.`ordinal` = `wh`.`worktype`) and (`ac11`.`groupid` = 11)))) left join `worklogattachrel` `wl` on((`wl`.`workitemid` = `wh`.`workitemid`))) left join `attachment` `a` on((`wl`.`itemid` = `a`.`itemid`))) left join `aceconfig` `ac10` on(((`ac10`.`ordinal` = `a`.`type`) and (`ac11`.`groupid` = 10)))) left join `inspection` `i` on((`wh`.`workitemid` = `i`.`workitemid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-27 15:26:22
