-- MySQL dump 10.13  Distrib 5.7.19, for Win64 (x86_64)
--
-- Host: localhost    Database: acebody
-- ------------------------------------------------------
-- Server version	5.7.19

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
INSERT INTO `aceconfig` VALUES (1,1,NULL,NULL,'Admin',NULL,NULL,'root','2018-04-01 22:12:16'),(1,2,NULL,NULL,'Manager',NULL,NULL,'root','2018-04-01 22:12:16'),(1,3,NULL,NULL,'Staff',NULL,NULL,'root','2018-04-01 22:12:16'),(1,4,NULL,NULL,'Customer',NULL,NULL,'root','2018-04-01 22:12:16'),(1,5,NULL,NULL,'External',NULL,NULL,'root','2018-04-01 22:12:16'),(2,1,NULL,NULL,'Open',NULL,NULL,'root','2018-04-01 22:12:16'),(2,2,NULL,NULL,'Active',NULL,NULL,'root','2018-04-01 22:12:16'),(2,3,NULL,NULL,'Locked',NULL,NULL,'root','2018-04-01 22:12:16'),(2,4,NULL,NULL,'Deleted',NULL,NULL,'root','2018-04-01 22:12:16'),(3,1,NULL,NULL,'Inquiry',NULL,NULL,'root','2018-04-01 22:12:16'),(3,2,NULL,NULL,'Complaint',NULL,NULL,'root','2018-04-01 22:12:16'),(3,3,NULL,NULL,'Request',NULL,NULL,'root','2018-04-01 22:12:16'),(3,4,NULL,NULL,'Maintenance',NULL,NULL,'root','2018-04-01 22:12:16'),(4,1,NULL,NULL,NULL,'Open',NULL,'root','2018-04-01 22:12:17'),(4,2,NULL,NULL,NULL,'Assigned',NULL,'root','2018-04-01 22:12:17'),(4,3,NULL,NULL,NULL,'In Review',NULL,'root','2018-04-01 22:12:17'),(4,4,NULL,NULL,NULL,'For Inspection',NULL,'root','2018-04-01 22:12:17'),(4,5,NULL,NULL,NULL,'For Approval',NULL,'root','2018-04-01 22:12:17'),(4,6,NULL,NULL,NULL,'Scheduled to Action',NULL,'root','2018-04-01 22:12:17'),(4,7,NULL,NULL,NULL,'Action Completed',NULL,'root','2018-04-01 22:12:17'),(4,8,NULL,NULL,NULL,'Closed',NULL,'root','2018-04-01 22:12:17'),(4,9,NULL,NULL,NULL,'Rejected',NULL,'root','2018-04-01 22:12:17'),(4,10,NULL,NULL,NULL,'Cancelled',NULL,'root','2018-04-01 22:12:17'),(5,1,NULL,NULL,'LOGIN','User login',NULL,'root','2018-04-01 22:12:17'),(5,2,NULL,NULL,'LOGOUT','User logout',NULL,'root','2018-04-01 22:12:17'),(6,1,NULL,NULL,NULL,'Home Owner',NULL,'root','2018-04-01 22:12:17'),(6,2,NULL,NULL,NULL,'Body Corporate',NULL,'root','2018-04-01 22:12:17'),(6,3,NULL,NULL,NULL,'Tenant',NULL,'root','2018-04-01 22:12:17'),(6,4,NULL,NULL,NULL,'Property Manager',NULL,'root','2018-04-01 22:12:18'),(7,1,NULL,NULL,NULL,'Relationship Management',NULL,'root','2018-04-01 22:12:18'),(7,2,NULL,NULL,NULL,'Insurance',NULL,'root','2018-04-01 22:12:18'),(7,3,NULL,NULL,NULL,'Legal',NULL,'root','2018-04-01 22:12:18'),(7,4,NULL,NULL,NULL,'Marketing',NULL,'root','2018-04-01 22:12:18'),(8,1,NULL,NULL,NULL,'Staff',NULL,'root','2018-04-01 22:12:18'),(8,2,NULL,NULL,NULL,'Manager',NULL,'root','2018-04-01 22:12:18'),(8,3,NULL,NULL,NULL,'Approver',NULL,'root','2018-04-01 22:12:18'),(8,4,NULL,NULL,NULL,'Head',NULL,'root','2018-04-01 22:12:18'),(9,1,NULL,NULL,NULL,'House',NULL,'root','2018-04-01 22:12:18'),(9,2,NULL,NULL,NULL,'Unit - Apartment',NULL,'root','2018-04-01 22:12:18'),(9,3,NULL,NULL,NULL,'Commercial',NULL,'root','2018-04-01 22:12:19'),(9,4,NULL,NULL,NULL,'Strata Property',NULL,'root','2018-04-01 22:12:19'),(9,5,NULL,NULL,NULL,'Others',NULL,'root','2018-04-01 22:12:19'),(10,1,NULL,NULL,'jpg',NULL,NULL,'root','2018-04-01 22:12:19'),(10,2,NULL,NULL,'pdf',NULL,NULL,'root','2018-04-01 22:12:19'),(10,3,NULL,NULL,'doc',NULL,NULL,'root','2018-04-01 22:12:19'),(11,1,NULL,NULL,NULL,'Work Log Details',NULL,'root','2018-04-01 22:12:19'),(11,2,NULL,NULL,NULL,'Inspection',NULL,'root','2018-04-01 22:12:19'),(11,3,NULL,NULL,NULL,'Service Log',NULL,'root','2018-04-01 22:12:19'),(12,1,NULL,NULL,NULL,'No Response',NULL,'root','2018-04-01 22:12:19'),(12,2,NULL,NULL,NULL,'Accepted',NULL,'root','2018-04-01 22:12:19'),(12,3,NULL,NULL,NULL,'Re-scheduled',NULL,'root','2018-04-01 22:12:19'),(12,4,NULL,NULL,NULL,'Cancelled',NULL,'root','2018-04-01 22:12:19');
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
INSERT INTO `aceconfig_group` VALUES (1,'User Roles','0','root','2018-04-01 22:12:16'),(2,'Account Status','0','root','2018-04-01 22:12:16'),(3,'Claim Type','0','root','2018-04-01 22:12:16'),(4,'Claim Status','0','root','2018-04-01 22:12:17'),(5,'Login - Action Types','0','root','2018-04-01 22:12:17'),(6,'Customer Type','0','root','2018-04-01 22:12:17'),(7,'Staff Department','0','root','2018-04-01 22:12:18'),(8,'Staff Access Type','0','root','2018-04-01 22:12:18'),(9,'Property Type','0','root','2018-04-01 22:12:18'),(10,'Attachment Type','0','root','2018-04-01 22:12:19'),(11,'Work Type','0','root','2018-04-01 22:12:19'),(12,'Inspection Reponse Type','0','root','2018-04-01 22:12:19');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignhistory`
--

LOCK TABLES `assignhistory` WRITE;
/*!40000 ALTER TABLE `assignhistory` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachment`
--

LOCK TABLES `attachment` WRITE;
/*!40000 ALTER TABLE `attachment` DISABLE KEYS */;
INSERT INTO `attachment` VALUES (2,'attachment-20180404-214648.jpg',NULL,NULL,'2018-04-04 21:46:48'),(3,'attachment-20180404-233534.jpg',NULL,NULL,'2018-04-04 23:35:34');
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
  `reviewstartdate` datetime DEFAULT NULL,
  `reviewenddate` datetime DEFAULT NULL,
  `approvaldate` datetime DEFAULT NULL,
  `authoriseddate` datetime DEFAULT NULL,
  `approveruser` varchar(16) DEFAULT NULL,
  `processeddate` datetime DEFAULT NULL,
  PRIMARY KEY (`claimid`),
  UNIQUE KEY `claimid_UNIQUE` (`claimid`),
  KEY `userclaimfk_idx` (`submitteduser`),
  KEY `propertyclaimfk_idx` (`property_canonical_id`),
  CONSTRAINT `userclaimfk` FOREIGN KEY (`submitteduser`) REFERENCES `user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claim`
--

LOCK TABLES `claim` WRITE;
/*!40000 ALTER TABLE `claim` DISABLE KEYS */;
INSERT INTO `claim` VALUES (4.00,'fd32a6ff-e98b-44fd-95ab-378672d7da4b',1,'Strata inspection','inspection','2018-04-01 23:02:54','karezb',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5.00,'fd32a6ff-e98b-44fd-95ab-378672d7da4b',1,'Strata inspection','inspection','2018-04-01 23:03:08','karezb',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `claim` ENABLE KEYS */;
UNLOCK TABLES;

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
 1 AS `status`,
 1 AS `statusname`,
 1 AS `reviewstartdate`,
 1 AS `reviewenddate`,
 1 AS `approvaldate`,
 1 AS `authoriseddate`,
 1 AS `approveruser`,
 1 AS `processeddate`*/;
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (10,1,NULL,'karezb','Karez Bartolo','Unit 4','43-45 Neil Street','MERRYLANDS','NSW',2160,'AUSTRALIA');
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
  `inspectiondate` datetime DEFAULT NULL,
  `auditwho` varchar(16) DEFAULT NULL,
  `auditwhen` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`inspectionid`),
  KEY `workloginspectfk_idx` (`workitemid`),
  CONSTRAINT `workloginspectfk` FOREIGN KEY (`workitemid`) REFERENCES `workloghistory` (`workitemid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inspection`
--

LOCK TABLES `inspection` WRITE;
/*!40000 ALTER TABLE `inspection` DISABLE KEYS */;
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
 1 AS `customer`,
 1 AS `emailaddress`,
 1 AS `property`,
 1 AS `inspectiondate`,
 1 AS `claimid`,
 1 AS `summary`*/;
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
INSERT INTO `loginhistory` VALUES ('karezb',1,'2018-04-01 12:57:52',NULL,'/api/v1/claim'),('karezb',1,'2018-04-01 12:57:55',NULL,'/api/v1/claim'),('karezb',1,'2018-04-01 12:57:58',NULL,'/api/v1/customer/karezb'),('karezb',1,'2018-04-01 12:57:58',NULL,'/api/v1/config/6'),('karezb',1,'2018-04-01 12:58:06',NULL,'/api/v1/address/search/?q=43'),('karezb',1,'2018-04-01 12:58:06',NULL,'/api/v1/address/search/?q=43'),('karezb',1,'2018-04-01 12:58:06',NULL,'/api/v1/address/search/?q=43%20N'),('karezb',1,'2018-04-01 12:58:06',NULL,'/api/v1/address/search/?q=43'),('karezb',1,'2018-04-01 12:58:06',NULL,'/api/v1/address/search/?q=43%20N'),('karezb',1,'2018-04-01 12:58:06',NULL,'/api/v1/address/search/?q=43%20Nei'),('karezb',1,'2018-04-01 12:58:06',NULL,'/api/v1/address/search/?q=43%20Neil'),('karezb',1,'2018-04-01 12:58:06',NULL,'/api/v1/address/search/?q=43%20Neil'),('karezb',1,'2018-04-01 12:58:07',NULL,'/api/v1/address/search/?q=43%20Neil'),('karezb',1,'2018-04-01 12:58:07',NULL,'/api/v1/address/search/?q=43%20Neil%20st'),('karezb',1,'2018-04-01 12:58:08',NULL,'/api/v1/address/search/?q=43%20Neil%20st'),('karezb',1,'2018-04-01 12:58:08',NULL,'/api/v1/address/search/?q=43%20Neil%20st,'),('karezb',1,'2018-04-01 12:58:08',NULL,'/api/v1/address/search/?q=43%20Neil%20st,'),('karezb',1,'2018-04-01 12:58:08',NULL,'/api/v1/address/search/?q=43%20Neil%20st,%20m'),('karezb',1,'2018-04-01 12:58:08',NULL,'/api/v1/address/search/?q=43%20Neil%20st,%20me'),('karezb',1,'2018-04-01 12:58:09',NULL,'/api/v1/address/search/?q=43%20Neil%20st,%20mer'),('karezb',1,'2018-04-01 12:58:09',NULL,'/api/v1/address/search/?q=43%20Neil%20st,%20merry'),('karezb',1,'2018-04-01 12:58:09',NULL,'/api/v1/address/search/?q=43%20Neil%20st,%20merry'),('karezb',1,'2018-04-01 12:58:12',NULL,'/api/v1/address/complete/?q=Unit%204,%2043%20Neil%20Street,%20MERRYLANDS%20NSW%202160'),('karezb',1,'2018-04-01 12:58:12',NULL,'/api/v1/customer/karezb'),('karezb',1,'2018-04-01 12:58:12',NULL,'/api/v1/customer/new'),('karezb',1,'2018-04-01 12:58:12',NULL,'/api/v1/claim'),('karezb',1,'2018-04-01 13:01:03',NULL,'/api/v1/claim'),('karezb',1,'2018-04-01 13:01:36',NULL,'/api/v1/claim'),('karezb',1,'2018-04-01 13:01:37',NULL,'/api/v1/claim'),('karezb',1,'2018-04-01 13:01:37',NULL,'/api/v1/claim'),('karezb',1,'2018-04-01 13:01:38',NULL,'/api/v1/claim'),('karezb',1,'2018-04-01 13:01:43',NULL,'/api/v1/claim'),('karezb',1,'2018-04-01 13:02:00',NULL,'/api/v1/claim'),('karezb',1,'2018-04-01 13:02:45',NULL,'/api/v1/claim'),('karezb',1,'2018-04-01 13:04:29',NULL,'/api/v1/claim'),('karezb',1,'2018-04-01 13:08:46',NULL,'/api/v1/claim'),('karezb',1,'2018-04-01 13:09:55',NULL,'/api/v1/claim'),('karezb',1,'2018-04-01 13:20:55',NULL,'/api/v1/claim'),('karezb',1,'2018-04-01 13:21:48',NULL,'/api/v1/claim'),('karezb',1,'2018-04-01 13:25:48',NULL,'/api/v1/claim'),('karezb',1,'2018-04-01 13:25:49',NULL,'/api/v1/claim'),('karezb',1,'2018-04-01 13:26:09',NULL,'/api/v1/claim'),('karezb',1,'2018-04-01 13:26:26',NULL,'/api/v1/claim'),('karezb',1,'2018-04-01 13:27:01',NULL,'/api/v1/claim'),('karezb',1,'2018-04-01 13:27:02',NULL,'/api/v1/claim'),('karezb',1,'2018-04-01 13:27:02',NULL,'/api/v1/claim'),('karezb',1,'2018-04-01 13:27:03',NULL,'/api/v1/claim'),('karezb',1,'2018-04-01 13:27:03',NULL,'/api/v1/claim'),('karezb',1,'2018-04-01 13:27:03',NULL,'/api/v1/claim'),('karezb',1,'2018-04-01 13:27:03',NULL,'/api/v1/claim'),('karezb',1,'2018-04-01 13:27:32',NULL,'/api/v1/claim'),('karezb',1,'2018-04-01 13:27:43',NULL,'/api/v1/claim'),('karezb',1,'2018-04-01 14:09:14',NULL,'/api/v1/config/6'),('karezb',1,'2018-04-01 14:09:14',NULL,'/api/v1/customer/karezb'),('karezb',1,'2018-04-01 14:10:17',NULL,'/api/v1/customer/karezb'),('karezb',1,'2018-04-01 14:11:25',NULL,'/api/v1/customer/karezb'),('karezb',1,'2018-04-01 14:11:25',NULL,'/api/v1/config/6'),('karezb',1,'2018-04-01 14:13:15',NULL,'/api/v1/customer/karezb'),('karezb',1,'2018-04-01 14:13:15',NULL,'/api/v1/config/6'),('karezb',1,'2018-04-01 14:14:10',NULL,'/api/v1/customer/karezb'),('karezb',1,'2018-04-01 14:14:10',NULL,'/api/v1/config/6'),('karezb',1,'2018-04-01 14:14:26',NULL,'/api/v1/customer/karezb'),('karezb',1,'2018-04-01 14:14:26',NULL,'/api/v1/config/6'),('karezb',1,'2018-04-01 14:14:42',NULL,'/api/v1/customer/karezb'),('karezb',1,'2018-04-01 14:14:42',NULL,'/api/v1/config/6'),('karezb',1,'2018-04-01 14:19:57',NULL,'/api/v1/customer/karezb'),('karezb',1,'2018-04-01 14:19:57',NULL,'/api/v1/config/6'),('karezb',1,'2018-04-01 14:19:59',NULL,'/api/v1/address/complete/?q=Unit%204%2043-45%20Neil%20Street%20MERRYLANDS%20NSW%202160'),('karezb',1,'2018-04-01 14:20:20',NULL,'/api/v1/customer/karezb'),('karezb',1,'2018-04-01 14:20:20',NULL,'/api/v1/config/6'),('karezb',1,'2018-04-01 14:20:21',NULL,'/api/v1/address/complete/?q=Unit%204%2043-45%20Neil%20Street%20MERRYLANDS%20NSW%202160'),('karezb',1,'2018-04-01 14:21:06',NULL,'/api/v1/customer/karezb'),('karezb',1,'2018-04-01 14:21:06',NULL,'/api/v1/config/6'),('karezb',1,'2018-04-01 14:22:06',NULL,'/api/v1/customer/karezb'),('karezb',1,'2018-04-01 14:22:06',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 14:22:10',NULL,'/api/v1/address/search/?q=1'),('karezb',1,'2018-04-01 14:22:10',NULL,'/api/v1/address/search/?q=1'),('karezb',1,'2018-04-01 14:22:10',NULL,'/api/v1/address/search/?q=1%20S'),('karezb',1,'2018-04-01 14:22:10',NULL,'/api/v1/address/search/?q=1%20Sh'),('karezb',1,'2018-04-01 14:22:11',NULL,'/api/v1/address/search/?q=1%20She'),('karezb',1,'2018-04-01 14:22:11',NULL,'/api/v1/address/search/?q=1%20Shei'),('karezb',1,'2018-04-01 14:22:11',NULL,'/api/v1/address/search/?q=1%20S'),('karezb',1,'2018-04-01 14:22:12',NULL,'/api/v1/address/search/?q=1%20She'),('karezb',1,'2018-04-01 14:22:12',NULL,'/api/v1/address/search/?q=1%20Shel'),('karezb',1,'2018-04-01 14:22:12',NULL,'/api/v1/address/search/?q=1%20Shell'),('karezb',1,'2018-04-01 14:22:12',NULL,'/api/v1/address/search/?q=1%20Shelle'),('karezb',1,'2018-04-01 14:22:13',NULL,'/api/v1/address/search/?q=1%20Shelley'),('karezb',1,'2018-04-01 14:22:13',NULL,'/api/v1/address/search/?q=1%20Shelley'),('karezb',1,'2018-04-01 14:22:13',NULL,'/api/v1/address/search/?q=1%20Shelley%20S'),('karezb',1,'2018-04-01 14:22:13',NULL,'/api/v1/address/search/?q=1%20Shelley%20St'),('karezb',1,'2018-04-01 14:22:13',NULL,'/api/v1/address/search/?q=1%20Shelley%20St'),('karezb',1,'2018-04-01 14:22:14',NULL,'/api/v1/address/search/?q=1%20Shelley%20St,'),('karezb',1,'2018-04-01 14:22:14',NULL,'/api/v1/address/search/?q=1%20Shelley%20St,'),('karezb',1,'2018-04-01 14:22:15',NULL,'/api/v1/address/search/?q=1%20Shelley%20St,%20S'),('karezb',1,'2018-04-01 14:22:15',NULL,'/api/v1/address/search/?q=1%20Shelley%20St,%20Sy'),('karezb',1,'2018-04-01 14:22:15',NULL,'/api/v1/address/search/?q=1%20Shelley%20St,%20Sy'),('karezb',1,'2018-04-01 14:22:15',NULL,'/api/v1/address/search/?q=1%20Shelley%20St,%20Syd'),('karezb',1,'2018-04-01 14:22:15',NULL,'/api/v1/address/search/?q=1%20Shelley%20St,%20Sydn'),('karezb',1,'2018-04-01 14:22:15',NULL,'/api/v1/address/search/?q=1%20Shelley%20St,%20Sydne'),('karezb',1,'2018-04-01 14:22:15',NULL,'/api/v1/address/search/?q=1%20Shelley%20St,%20Sydney'),('karezb',1,'2018-04-01 14:22:18',NULL,'/api/v1/address/complete/?q=1%20Shelley%20Street,%20SYDNEY%20NSW%202000'),('karezb',1,'2018-04-01 14:23:24',NULL,'/api/v1/customer/karezb'),('karezb',1,'2018-04-01 14:23:24',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 14:24:57',NULL,'/api/v1/claim'),('karezb',1,'2018-04-01 14:25:01',NULL,'/api/v1/claim'),('karezb',1,'2018-04-01 14:25:02',NULL,'/api/v1/claim'),('karezb',1,'2018-04-01 14:25:07',NULL,'/api/v1/claim'),('karezb',1,'2018-04-01 14:25:15',NULL,'/api/v1/claim'),('karezb',1,'2018-04-01 14:25:19',NULL,'/api/v1/customer/karezb'),('karezb',1,'2018-04-01 14:25:19',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 14:46:04',NULL,'/api/v1/claim'),('karezb',1,'2018-04-01 14:46:22',NULL,'/api/v1/claim'),('karezb',1,'2018-04-01 14:46:52',NULL,'/api/v1/claim'),('karezb',1,'2018-04-01 14:46:59',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 14:46:59',NULL,'/api/v1/property/1'),('karezb',1,'2018-04-01 14:48:25',NULL,'/api/v1/property/1'),('karezb',1,'2018-04-01 14:48:25',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 15:05:34',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 15:05:37',NULL,'/api/v1/address/search/?q=4'),('karezb',1,'2018-04-01 15:05:37',NULL,'/api/v1/address/search/?q='),('karezb',1,'2018-04-01 15:05:38',NULL,'/api/v1/address/search/?q=U'),('karezb',1,'2018-04-01 15:05:38',NULL,'/api/v1/address/search/?q=U'),('karezb',1,'2018-04-01 15:05:38',NULL,'/api/v1/address/search/?q=Un'),('karezb',1,'2018-04-01 15:05:38',NULL,'/api/v1/address/search/?q=Uni'),('karezb',1,'2018-04-01 15:05:38',NULL,'/api/v1/address/search/?q=Unit'),('karezb',1,'2018-04-01 15:05:39',NULL,'/api/v1/address/search/?q=Unit%204'),('karezb',1,'2018-04-01 15:05:39',NULL,'/api/v1/address/search/?q=Unit%204%2043'),('karezb',1,'2018-04-01 15:05:40',NULL,'/api/v1/address/search/?q=Unit%204%2043'),('karezb',1,'2018-04-01 15:05:40',NULL,'/api/v1/address/search/?q=Unit%204%2043%20N'),('karezb',1,'2018-04-01 15:05:40',NULL,'/api/v1/address/search/?q=Unit%204'),('karezb',1,'2018-04-01 15:05:40',NULL,'/api/v1/address/search/?q=Unit'),('karezb',1,'2018-04-01 15:05:40',NULL,'/api/v1/address/search/?q=Unit%204%2043%20Nei'),('karezb',1,'2018-04-01 15:05:40',NULL,'/api/v1/address/search/?q=Unit%204%2043%20N'),('karezb',1,'2018-04-01 15:05:40',NULL,'/api/v1/address/search/?q=Unit%204%2043%20Neil'),('karezb',1,'2018-04-01 15:05:40',NULL,'/api/v1/address/search/?q=Unit%204%2043'),('karezb',1,'2018-04-01 15:05:40',NULL,'/api/v1/address/search/?q=Unit%204%2043%20Neil'),('karezb',1,'2018-04-01 15:05:41',NULL,'/api/v1/address/search/?q=Unit%204%2043%20Neil'),('karezb',1,'2018-04-01 15:05:41',NULL,'/api/v1/address/search/?q=Unit%204%2043%20Neil%20S'),('karezb',1,'2018-04-01 15:05:41',NULL,'/api/v1/address/search/?q=Unit%204%2043%20Neil%20St'),('karezb',1,'2018-04-01 15:05:41',NULL,'/api/v1/address/search/?q=Unit%204%2043%20Neil%20St'),('karezb',1,'2018-04-01 15:05:44',NULL,'/api/v1/address/complete/?q=Unit%204,%2043%20Neil%20Street,%20MERRYLANDS%20NSW%202160'),('karezb',1,'2018-04-01 15:05:54',NULL,'/api/v1/property/new'),('karezb',1,'2018-04-01 15:06:40',NULL,'/api/v1/property/new'),('karezb',1,'2018-04-01 15:09:28',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 15:09:31',NULL,'/api/v1/address/search/?q=U'),('karezb',1,'2018-04-01 15:09:32',NULL,'/api/v1/address/search/?q=Uni'),('karezb',1,'2018-04-01 15:09:32',NULL,'/api/v1/address/search/?q=U'),('karezb',1,'2018-04-01 15:09:32',NULL,'/api/v1/address/search/?q=Unit'),('karezb',1,'2018-04-01 15:09:32',NULL,'/api/v1/address/search/?q=Unit'),('karezb',1,'2018-04-01 15:09:32',NULL,'/api/v1/address/search/?q=Unit'),('karezb',1,'2018-04-01 15:09:32',NULL,'/api/v1/address/search/?q=Unit%203'),('karezb',1,'2018-04-01 15:09:33',NULL,'/api/v1/address/search/?q=Unit'),('karezb',1,'2018-04-01 15:09:33',NULL,'/api/v1/address/search/?q=Unit%204'),('karezb',1,'2018-04-01 15:09:34',NULL,'/api/v1/address/search/?q=Unit%204'),('karezb',1,'2018-04-01 15:09:34',NULL,'/api/v1/address/search/?q=Unit%204%2043'),('karezb',1,'2018-04-01 15:09:34',NULL,'/api/v1/address/search/?q=Unit%204%2043'),('karezb',1,'2018-04-01 15:09:34',NULL,'/api/v1/address/search/?q=Unit%204'),('karezb',1,'2018-04-01 15:09:35',NULL,'/api/v1/address/search/?q=Unit%204%2043%20N'),('karezb',1,'2018-04-01 15:09:35',NULL,'/api/v1/address/search/?q=Unit%204%2043'),('karezb',1,'2018-04-01 15:09:35',NULL,'/api/v1/address/search/?q=Unit%204%2043%20N'),('karezb',1,'2018-04-01 15:09:35',NULL,'/api/v1/address/search/?q=Unit%204%2043%20Nei'),('karezb',1,'2018-04-01 15:09:35',NULL,'/api/v1/address/search/?q=Unit%204%2043%20Neil'),('karezb',1,'2018-04-01 15:09:35',NULL,'/api/v1/address/search/?q=Unit%204%2043%20Neil'),('karezb',1,'2018-04-01 15:09:35',NULL,'/api/v1/address/search/?q=Unit%204%2043%20Neil'),('karezb',1,'2018-04-01 15:09:36',NULL,'/api/v1/address/search/?q=Unit%204%2043%20Neil%20S'),('karezb',1,'2018-04-01 15:09:36',NULL,'/api/v1/address/search/?q=Unit%204%2043%20Neil%20St'),('karezb',1,'2018-04-01 15:09:36',NULL,'/api/v1/address/search/?q=Unit%204%2043%20Neil%20St'),('karezb',1,'2018-04-01 15:09:36',NULL,'/api/v1/address/search/?q=Unit%204%2043%20Neil%20St,'),('karezb',1,'2018-04-01 15:09:38',NULL,'/api/v1/address/complete/?q=Unit%204,%2043%20Neil%20Street,%20MERRYLANDS%20NSW%202160'),('karezb',1,'2018-04-01 15:09:43',NULL,'/api/v1/property/new'),('karezb',1,'2018-04-01 15:13:25',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 15:13:28',NULL,'/api/v1/address/search/?q=4'),('karezb',1,'2018-04-01 15:13:28',NULL,'/api/v1/address/search/?q=4/'),('karezb',1,'2018-04-01 15:13:28',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 15:13:28',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 15:13:28',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 15:13:28',NULL,'/api/v1/address/search/?q=4/43%20N'),('karezb',1,'2018-04-01 15:13:29',NULL,'/api/v1/address/search/?q=4/43%20N'),('karezb',1,'2018-04-01 15:13:29',NULL,'/api/v1/address/search/?q=4/43%20Nei'),('karezb',1,'2018-04-01 15:13:29',NULL,'/api/v1/address/search/?q=4/43%20Neil'),('karezb',1,'2018-04-01 15:13:29',NULL,'/api/v1/address/search/?q=4/43%20Neil'),('karezb',1,'2018-04-01 15:13:29',NULL,'/api/v1/address/search/?q=4/43%20Neil'),('karezb',1,'2018-04-01 15:13:29',NULL,'/api/v1/address/search/?q=4/43%20Neil%20S'),('karezb',1,'2018-04-01 15:13:29',NULL,'/api/v1/address/search/?q=4/43%20Neil%20St'),('karezb',1,'2018-04-01 15:13:30',NULL,'/api/v1/address/search/?q=4/43%20Neil%20St'),('karezb',1,'2018-04-01 15:13:33',NULL,'/api/v1/address/complete/?q=Unit%204,%2043%20Neil%20Street,%20MERRYLANDS%20NSW%202160'),('karezb',1,'2018-04-01 15:13:37',NULL,'/api/v1/property/new'),('karezb',1,'2018-04-01 15:14:54',NULL,'/api/v1/address/complete/?q=1230-1230A%20Bucca%20Road,%20BUCCA%20NSW%202450'),('karezb',1,'2018-04-01 15:15:23',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 15:15:26',NULL,'/api/v1/address/search/?q=4'),('karezb',1,'2018-04-01 15:15:26',NULL,'/api/v1/address/search/?q=4/'),('karezb',1,'2018-04-01 15:15:26',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 15:15:26',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 15:15:27',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 15:15:27',NULL,'/api/v1/address/search/?q=4/43%20n'),('karezb',1,'2018-04-01 15:15:27',NULL,'/api/v1/address/search/?q=4/43%20ne'),('karezb',1,'2018-04-01 15:15:27',NULL,'/api/v1/address/search/?q=4/43%20neil'),('karezb',1,'2018-04-01 15:15:27',NULL,'/api/v1/address/search/?q=4/43%20neil'),('karezb',1,'2018-04-01 15:15:28',NULL,'/api/v1/address/search/?q=4/43%20neil'),('karezb',1,'2018-04-01 15:15:28',NULL,'/api/v1/address/search/?q=4/43%20neil%20st'),('karezb',1,'2018-04-01 15:15:28',NULL,'/api/v1/address/search/?q=4/43%20neil%20st'),('karezb',1,'2018-04-01 15:15:30',NULL,'/api/v1/address/complete/?q=Unit%204,%2043%20Neil%20Street,%20MERRYLANDS%20NSW%202160'),('karezb',1,'2018-04-01 15:15:34',NULL,'/api/v1/property/new'),('karezb',1,'2018-04-01 15:17:37',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 15:17:39',NULL,'/api/v1/address/search/?q=43'),('karezb',1,'2018-04-01 15:17:39',NULL,'/api/v1/address/search/?q=43'),('karezb',1,'2018-04-01 15:17:39',NULL,'/api/v1/address/search/?q=43'),('karezb',1,'2018-04-01 15:17:40',NULL,'/api/v1/address/search/?q=43'),('karezb',1,'2018-04-01 15:17:40',NULL,'/api/v1/address/search/?q=43'),('karezb',1,'2018-04-01 15:17:40',NULL,'/api/v1/address/search/?q=4'),('karezb',1,'2018-04-01 15:17:40',NULL,'/api/v1/address/search/?q='),('karezb',1,'2018-04-01 15:17:41',NULL,'/api/v1/address/search/?q=4'),('karezb',1,'2018-04-01 15:17:41','127.0.0.1','/api/v1/address/search/?q=4/'),('karezb',1,'2018-04-01 15:17:41','127.0.0.1','/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 15:17:41','127.0.0.1','/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 15:17:42','127.0.0.1','/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 15:17:42','127.0.0.1','/api/v1/address/search/?q=4/43%20N'),('karezb',1,'2018-04-01 15:17:42',NULL,'/api/v1/address/search/?q=4/43%20NE'),('karezb',1,'2018-04-01 15:17:42',NULL,'/api/v1/address/search/?q=4/43%20NE'),('karezb',1,'2018-04-01 15:17:42','127.0.0.1','/api/v1/address/search/?q=4/43%20NEi'),('karezb',1,'2018-04-01 15:17:42','127.0.0.1','/api/v1/address/search/?q=4/43%20NEil'),('karezb',1,'2018-04-01 15:17:45','127.0.0.1','/api/v1/address/complete/?q=Unit%204,%2043%20Neil%20Street,%20MERRYLANDS%20NSW%202160'),('karezb',1,'2018-04-01 15:17:51',NULL,'/api/v1/property/new'),('karezb',1,'2018-04-01 15:18:36',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 15:18:38',NULL,'/api/v1/address/search/?q=4'),('karezb',1,'2018-04-01 15:18:38',NULL,'/api/v1/address/search/?q=4/'),('karezb',1,'2018-04-01 15:18:38',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 15:18:38',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 15:18:38',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 15:18:39',NULL,'/api/v1/address/search/?q=4/43%20N'),('karezb',1,'2018-04-01 15:18:39',NULL,'/api/v1/address/search/?q=4/43%20N'),('karezb',1,'2018-04-01 15:18:39',NULL,'/api/v1/address/search/?q=4/43%20Ne'),('karezb',1,'2018-04-01 15:18:39',NULL,'/api/v1/address/search/?q=4/43%20Neil'),('karezb',1,'2018-04-01 15:18:39',NULL,'/api/v1/address/search/?q=4/43%20Neil'),('karezb',1,'2018-04-01 15:18:39',NULL,'/api/v1/address/search/?q=4/43%20Neil'),('karezb',1,'2018-04-01 15:18:41',NULL,'/api/v1/address/complete/?q=Unit%204,%2043%20Neil%20Street,%20MERRYLANDS%20NSW%202160'),('karezb',1,'2018-04-01 15:18:45',NULL,'/api/v1/property/new'),('karezb',1,'2018-04-01 15:21:10',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 15:21:11',NULL,'/api/v1/address/search/?q=4'),('karezb',1,'2018-04-01 15:21:11','127.0.0.1','/api/v1/address/search/?q=4/'),('karezb',1,'2018-04-01 15:21:11','127.0.0.1','/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 15:21:11','127.0.0.1','/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 15:21:13','127.0.0.1','/api/v1/address/complete/?q=Unit%204,%2043%20Broadway,%20ELWOOD%20VIC%203184'),('karezb',1,'2018-04-01 15:21:20',NULL,'/api/v1/property/new'),('karezb',1,'2018-04-01 15:21:45',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 15:21:46',NULL,'/api/v1/address/search/?q=4'),('karezb',1,'2018-04-01 15:21:47','127.0.0.1','/api/v1/address/search/?q=4/'),('karezb',1,'2018-04-01 15:21:47','127.0.0.1','/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 15:21:47','127.0.0.1','/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 15:21:49','127.0.0.1','/api/v1/address/complete/?q=Unit%204,%20435%20Esplanade,%20MANLY%20QLD%204179'),('karezb',1,'2018-04-01 15:21:56',NULL,'/api/v1/property/new'),('karezb',1,'2018-04-01 15:23:01',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 15:23:03',NULL,'/api/v1/address/search/?q=2'),('karezb',1,'2018-04-01 15:23:03',NULL,'/api/v1/address/search/?q=2/'),('karezb',1,'2018-04-01 15:23:03',NULL,'/api/v1/address/search/?q=2/34'),('karezb',1,'2018-04-01 15:23:04',NULL,'/api/v1/address/search/?q=2/34'),('karezb',1,'2018-04-01 15:23:07',NULL,'/api/v1/address/search/?q=2/34'),('karezb',1,'2018-04-01 15:23:08',NULL,'/api/v1/address/search/?q=2/34%20ns'),('karezb',1,'2018-04-01 15:23:08',NULL,'/api/v1/address/search/?q=2/34%20nsw'),('karezb',1,'2018-04-01 15:23:09',NULL,'/api/v1/address/search/?q=2/34%20ns'),('karezb',1,'2018-04-01 15:23:11',NULL,'/api/v1/address/complete/?q=Unit%2034,%2020-34%20Albert%20Road,%20STRATHFIELD%20NSW%202135'),('karezb',1,'2018-04-01 15:23:15',NULL,'/api/v1/property/new'),('karezb',1,'2018-04-01 15:25:16',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 15:25:19',NULL,'/api/v1/address/search/?q=23'),('karezb',1,'2018-04-01 15:25:20',NULL,'/api/v1/address/search/?q=23'),('karezb',1,'2018-04-01 15:25:20',NULL,'/api/v1/address/search/?q=23/'),('karezb',1,'2018-04-01 15:25:21',NULL,'/api/v1/address/search/?q=23/23'),('karezb',1,'2018-04-01 15:25:22',NULL,'/api/v1/address/search/?q=23/23'),('karezb',1,'2018-04-01 15:25:22',NULL,'/api/v1/address/search/?q=23/23'),('karezb',1,'2018-04-01 15:25:22',NULL,'/api/v1/address/search/?q=23/23%20pa'),('karezb',1,'2018-04-01 15:25:22',NULL,'/api/v1/address/search/?q=23/23%20par'),('karezb',1,'2018-04-01 15:25:23',NULL,'/api/v1/address/search/?q=23/23%20par'),('karezb',1,'2018-04-01 15:25:24',NULL,'/api/v1/address/search/?q=23/23%20parra'),('karezb',1,'2018-04-01 15:25:24',NULL,'/api/v1/address/search/?q=23/23%20parra'),('karezb',1,'2018-04-01 15:25:25',NULL,'/api/v1/address/search/?q=23/23%20parr'),('karezb',1,'2018-04-01 15:25:25',NULL,'/api/v1/address/search/?q=23/23%20par'),('karezb',1,'2018-04-01 15:25:25',NULL,'/api/v1/address/search/?q=23/23%20para'),('karezb',1,'2018-04-01 15:25:26',NULL,'/api/v1/address/search/?q=23/23%20param'),('karezb',1,'2018-04-01 15:25:26',NULL,'/api/v1/address/search/?q=23/23%20parama'),('karezb',1,'2018-04-01 15:25:26',NULL,'/api/v1/address/search/?q=23/23%20paramat'),('karezb',1,'2018-04-01 15:25:27',NULL,'/api/v1/address/search/?q=23/23%20paramatta'),('karezb',1,'2018-04-01 15:25:27',NULL,'/api/v1/address/search/?q=23/23%20paramatta'),('karezb',1,'2018-04-01 15:25:30',NULL,'/api/v1/address/complete/?q=Unit%2023,%2024%20Parramatta%20Street,%20CRONULLA%20NSW%202230'),('karezb',1,'2018-04-01 15:25:35',NULL,'/api/v1/property/new'),('karezb',1,'2018-04-01 15:26:21',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 15:26:22',NULL,'/api/v1/address/search/?q=34'),('karezb',1,'2018-04-01 15:26:23',NULL,'/api/v1/address/search/?q=34'),('karezb',1,'2018-04-01 15:26:23',NULL,'/api/v1/address/search/?q=34/'),('karezb',1,'2018-04-01 15:26:23',NULL,'/api/v1/address/search/?q=34/23'),('karezb',1,'2018-04-01 15:26:24',NULL,'/api/v1/address/search/?q=34/234'),('karezb',1,'2018-04-01 15:26:24',NULL,'/api/v1/address/search/?q=34/234'),('karezb',1,'2018-04-01 15:26:24',NULL,'/api/v1/address/search/?q=34/234'),('karezb',1,'2018-04-01 15:26:25',NULL,'/api/v1/address/search/?q=34/234%20ad'),('karezb',1,'2018-04-01 15:26:25',NULL,'/api/v1/address/search/?q=34/234%20ad'),('karezb',1,'2018-04-01 15:26:28',NULL,'/api/v1/address/complete/?q=32-34%20Cove%20Avenue,%20BUNDABAH%20NSW%202324'),('karezb',1,'2018-04-01 15:26:31',NULL,'/api/v1/property/new'),('karezb',1,'2018-04-01 15:27:36',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 15:27:50',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 15:28:11',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 15:28:22',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 15:29:19',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 15:32:07',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 15:32:32',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 15:32:34',NULL,'/api/v1/address/search/?q=4'),('karezb',1,'2018-04-01 15:32:34',NULL,'/api/v1/address/search/?q=4/'),('karezb',1,'2018-04-01 15:32:34',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 15:32:35',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 15:32:35',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 15:32:35',NULL,'/api/v1/address/search/?q=4/43%20en'),('karezb',1,'2018-04-01 15:32:35',NULL,'/api/v1/address/search/?q=4/43%20en'),('karezb',1,'2018-04-01 15:32:36',NULL,'/api/v1/address/search/?q=4/43%20e'),('karezb',1,'2018-04-01 15:32:36',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 15:32:36',NULL,'/api/v1/address/search/?q=4/43%20ne'),('karezb',1,'2018-04-01 15:32:36',NULL,'/api/v1/address/search/?q=4/43%20nei'),('karezb',1,'2018-04-01 15:32:36',NULL,'/api/v1/address/search/?q=4/43%20neil'),('karezb',1,'2018-04-01 15:32:36',NULL,'/api/v1/address/search/?q=4/43%20neil'),('karezb',1,'2018-04-01 15:32:39',NULL,'/api/v1/address/complete/?q=Unit%204,%2043%20Neil%20Street,%20MERRYLANDS%20NSW%202160'),('karezb',1,'2018-04-01 15:32:42',NULL,'/api/v1/property/new'),('karezb',1,'2018-04-01 15:32:46',NULL,'/api/v1/property/fd32a6ff-e98b-44fd-95ab-378672d7da4b'),('karezb',1,'2018-04-01 15:32:46',NULL,'/api/v1/property/update'),('karezb',1,'2018-04-01 15:33:38',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 15:33:40',NULL,'/api/v1/address/search/?q=43'),('karezb',1,'2018-04-01 15:33:40',NULL,'/api/v1/address/search/?q=43'),('karezb',1,'2018-04-01 15:33:42',NULL,'/api/v1/address/search/?q=43'),('karezb',1,'2018-04-01 15:33:43',NULL,'/api/v1/address/search/?q=43'),('karezb',1,'2018-04-01 15:33:43',NULL,'/api/v1/address/search/?q=4/'),('karezb',1,'2018-04-01 15:33:43',NULL,'/api/v1/address/search/?q=4/'),('karezb',1,'2018-04-01 15:33:43',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 15:33:44',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 15:33:44',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 15:33:44',NULL,'/api/v1/address/search/?q=4/43%20ne'),('karezb',1,'2018-04-01 15:33:45',NULL,'/api/v1/address/search/?q=4/43%20nei'),('karezb',1,'2018-04-01 15:33:45',NULL,'/api/v1/address/search/?q=4/43%20neil'),('karezb',1,'2018-04-01 15:33:45',NULL,'/api/v1/address/search/?q=4/43%20neil'),('karezb',1,'2018-04-01 15:33:47',NULL,'/api/v1/address/complete/?q=Unit%204,%2043%20Neil%20Street,%20MERRYLANDS%20NSW%202160'),('karezb',1,'2018-04-01 15:33:50',NULL,'/api/v1/property/new'),('karezb',1,'2018-04-01 15:33:53',NULL,'/api/v1/property/fd32a6ff-e98b-44fd-95ab-378672d7da4b'),('karezb',1,'2018-04-01 15:33:53',NULL,'/api/v1/property/update'),('karezb',1,'2018-04-01 15:37:55',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 15:37:57',NULL,'/api/v1/address/search/?q=4'),('karezb',1,'2018-04-01 15:37:58',NULL,'/api/v1/address/search/?q=4/'),('karezb',1,'2018-04-01 15:37:59',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 15:37:59',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 15:37:59',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 15:37:59',NULL,'/api/v1/address/search/?q=4/43%20N'),('karezb',1,'2018-04-01 15:37:59',NULL,'/api/v1/address/search/?q=4/43%20Nei'),('karezb',1,'2018-04-01 15:37:59',NULL,'/api/v1/address/search/?q=4/43%20N'),('karezb',1,'2018-04-01 15:37:59',NULL,'/api/v1/address/search/?q=4/43%20Neil'),('karezb',1,'2018-04-01 15:37:59',NULL,'/api/v1/address/search/?q=4/43%20Neil'),('karezb',1,'2018-04-01 15:38:01',NULL,'/api/v1/address/complete/?q=Unit%204,%2043%20Neil%20Street,%20MERRYLANDS%20NSW%202160'),('karezb',1,'2018-04-01 15:38:05',NULL,'/api/v1/property/new'),('karezb',1,'2018-04-01 15:39:42',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 15:39:44',NULL,'/api/v1/address/search/?q=4'),('karezb',1,'2018-04-01 15:39:44',NULL,'/api/v1/address/search/?q=4/'),('karezb',1,'2018-04-01 15:39:44',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 15:39:44',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 15:39:44',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 15:39:45',NULL,'/api/v1/address/search/?q=4/43%20N'),('karezb',1,'2018-04-01 15:39:45',NULL,'/api/v1/address/search/?q=4/43%20N'),('karezb',1,'2018-04-01 15:39:45',NULL,'/api/v1/address/search/?q=4/43%20Nei'),('karezb',1,'2018-04-01 15:39:45',NULL,'/api/v1/address/search/?q=4/43%20Neil'),('karezb',1,'2018-04-01 15:39:45',NULL,'/api/v1/address/search/?q=4/43%20Neil'),('karezb',1,'2018-04-01 15:39:47',NULL,'/api/v1/address/complete/?q=Unit%204,%2043%20Neil%20Street,%20MERRYLANDS%20NSW%202160'),('karezb',1,'2018-04-01 15:39:50',NULL,'/api/v1/property/new'),('karezb',1,'2018-04-01 15:41:25',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 15:41:27',NULL,'/api/v1/address/search/?q=4/'),('karezb',1,'2018-04-01 15:41:27',NULL,'/api/v1/address/search/?q=4/'),('karezb',1,'2018-04-01 15:41:27',NULL,'/api/v1/address/search/?q=4/4'),('karezb',1,'2018-04-01 15:41:28',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 15:41:28',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 15:41:28',NULL,'/api/v1/address/search/?q=4/43%20ne'),('karezb',1,'2018-04-01 15:41:29',NULL,'/api/v1/address/search/?q=4/43%20ne'),('karezb',1,'2018-04-01 15:41:29',NULL,'/api/v1/address/search/?q=4/43%20neil'),('karezb',1,'2018-04-01 15:41:29',NULL,'/api/v1/address/search/?q=4/43%20neil'),('karezb',1,'2018-04-01 15:41:31',NULL,'/api/v1/address/complete/?q=Unit%204,%2043%20Neil%20Street,%20MERRYLANDS%20NSW%202160'),('karezb',1,'2018-04-01 15:41:34',NULL,'/api/v1/property/new'),('karezb',1,'2018-04-01 15:42:41',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 15:42:42',NULL,'/api/v1/address/search/?q=4'),('karezb',1,'2018-04-01 15:42:43',NULL,'/api/v1/address/search/?q=4/'),('karezb',1,'2018-04-01 15:42:43',NULL,'/api/v1/address/search/?q=4/4'),('karezb',1,'2018-04-01 15:42:43',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 15:42:43',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 15:42:43',NULL,'/api/v1/address/search/?q=4/43%20N'),('karezb',1,'2018-04-01 15:42:43',NULL,'/api/v1/address/search/?q=4/43%20Nei'),('karezb',1,'2018-04-01 15:42:43',NULL,'/api/v1/address/search/?q=4/43%20N'),('karezb',1,'2018-04-01 15:42:44',NULL,'/api/v1/address/search/?q=4/43%20Neil'),('karezb',1,'2018-04-01 15:42:44',NULL,'/api/v1/address/search/?q=4/43%20Neil'),('karezb',1,'2018-04-01 15:42:46',NULL,'/api/v1/address/complete/?q=Unit%204,%2043%20Neil%20Street,%20MERRYLANDS%20NSW%202160'),('karezb',1,'2018-04-01 15:42:49',NULL,'/api/v1/property/new'),('karezb',1,'2018-04-01 15:44:26',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 15:44:28',NULL,'/api/v1/address/search/?q=4'),('karezb',1,'2018-04-01 15:44:29',NULL,'/api/v1/address/search/?q=4/4'),('karezb',1,'2018-04-01 15:44:29',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 15:44:29',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 15:44:29',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 15:44:29',NULL,'/api/v1/address/search/?q=4/43%20N'),('karezb',1,'2018-04-01 15:44:29',NULL,'/api/v1/address/search/?q=4/43%20N'),('karezb',1,'2018-04-01 15:44:29',NULL,'/api/v1/address/search/?q=4/43%20Nei'),('karezb',1,'2018-04-01 15:44:29',NULL,'/api/v1/address/search/?q=4/43%20Neil'),('karezb',1,'2018-04-01 15:44:30',NULL,'/api/v1/address/search/?q=4/43%20Neil'),('karezb',1,'2018-04-01 15:44:31',NULL,'/api/v1/address/complete/?q=Unit%204,%2043%20Neil%20Street,%20MERRYLANDS%20NSW%202160'),('karezb',1,'2018-04-01 15:44:34',NULL,'/api/v1/property/new'),('karezb',1,'2018-04-01 15:45:02',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 15:45:03',NULL,'/api/v1/address/search/?q=4'),('karezb',1,'2018-04-01 15:45:04',NULL,'/api/v1/address/search/?q=4/'),('karezb',1,'2018-04-01 15:45:04',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 15:45:04',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 15:45:04',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 15:45:04',NULL,'/api/v1/address/search/?q=4/43%20N'),('karezb',1,'2018-04-01 15:45:05',NULL,'/api/v1/address/search/?q=4/43%20Nei'),('karezb',1,'2018-04-01 15:45:05',NULL,'/api/v1/address/search/?q=4/43%20N'),('karezb',1,'2018-04-01 15:45:05',NULL,'/api/v1/address/search/?q=4/43%20Neil'),('karezb',1,'2018-04-01 15:45:05',NULL,'/api/v1/address/search/?q=4/43%20Neil'),('karezb',1,'2018-04-01 15:45:06',NULL,'/api/v1/address/complete/?q=Unit%204,%2043%20Neil%20Street,%20MERRYLANDS%20NSW%202160'),('karezb',1,'2018-04-01 15:45:11',NULL,'/api/v1/property/new'),('karezb',1,'2018-04-01 15:45:37',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 15:45:39',NULL,'/api/v1/address/search/?q=4'),('karezb',1,'2018-04-01 15:45:39',NULL,'/api/v1/address/search/?q=4/'),('karezb',1,'2018-04-01 15:45:39',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 15:45:40',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 15:45:40',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 15:45:40',NULL,'/api/v1/address/search/?q=4/43%20N'),('karezb',1,'2018-04-01 15:45:40',NULL,'/api/v1/address/search/?q=4/43%20N'),('karezb',1,'2018-04-01 15:45:40',NULL,'/api/v1/address/search/?q=4/43%20Nei'),('karezb',1,'2018-04-01 15:45:40',NULL,'/api/v1/address/search/?q=4/43%20Neil'),('karezb',1,'2018-04-01 15:45:40',NULL,'/api/v1/address/search/?q=4/43%20Neil'),('karezb',1,'2018-04-01 15:45:42',NULL,'/api/v1/address/complete/?q=Unit%204,%2043%20Neil%20Street,%20MERRYLANDS%20NSW%202160'),('karezb',1,'2018-04-01 15:45:46',NULL,'/api/v1/property/new'),('karezb',1,'2018-04-01 15:47:13',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 15:47:15',NULL,'/api/v1/address/search/?q=4'),('karezb',1,'2018-04-01 15:47:15',NULL,'/api/v1/address/search/?q=4/4'),('karezb',1,'2018-04-01 15:47:16',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 15:47:16',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 15:47:16',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 15:47:16',NULL,'/api/v1/address/search/?q=4/43%20N'),('karezb',1,'2018-04-01 15:47:16',NULL,'/api/v1/address/search/?q=4/43%20Nei'),('karezb',1,'2018-04-01 15:47:16',NULL,'/api/v1/address/search/?q=4/43%20N'),('karezb',1,'2018-04-01 15:47:16',NULL,'/api/v1/address/search/?q=4/43%20Neil'),('karezb',1,'2018-04-01 15:47:17',NULL,'/api/v1/address/search/?q=4/43%20Neil'),('karezb',1,'2018-04-01 15:47:18',NULL,'/api/v1/address/complete/?q=Unit%204,%2043%20Neil%20Street,%20MERRYLANDS%20NSW%202160'),('karezb',1,'2018-04-01 15:47:22',NULL,'/api/v1/property/new'),('karezb',1,'2018-04-01 15:47:31',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 15:47:32',NULL,'/api/v1/address/search/?q=4'),('karezb',1,'2018-04-01 15:47:33',NULL,'/api/v1/address/search/?q=4/'),('karezb',1,'2018-04-01 15:47:33',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 15:47:33',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 15:47:33',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 15:47:33',NULL,'/api/v1/address/search/?q=4/43%20n'),('karezb',1,'2018-04-01 15:47:33',NULL,'/api/v1/address/search/?q=4/43%20nei'),('karezb',1,'2018-04-01 15:47:33',NULL,'/api/v1/address/search/?q=4/43%20neil'),('karezb',1,'2018-04-01 15:47:34',NULL,'/api/v1/address/search/?q=4/43%20neil'),('karezb',1,'2018-04-01 15:47:35',NULL,'/api/v1/address/complete/?q=Unit%204,%2043%20Neil%20Street,%20MERRYLANDS%20NSW%202160'),('karezb',1,'2018-04-01 15:47:38',NULL,'/api/v1/property/new'),('karezb',1,'2018-04-01 15:48:47',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 15:48:49',NULL,'/api/v1/address/search/?q=4'),('karezb',1,'2018-04-01 15:48:49',NULL,'/api/v1/address/search/?q=4/'),('karezb',1,'2018-04-01 15:48:50',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 15:48:50',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 15:48:50',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 15:48:50',NULL,'/api/v1/address/search/?q=4/43%20N'),('karezb',1,'2018-04-01 15:48:50',NULL,'/api/v1/address/search/?q=4/43%20Nei'),('karezb',1,'2018-04-01 15:48:50',NULL,'/api/v1/address/search/?q=4/43%20N'),('karezb',1,'2018-04-01 15:48:50',NULL,'/api/v1/address/search/?q=4/43%20Neil'),('karezb',1,'2018-04-01 15:48:50',NULL,'/api/v1/address/search/?q=4/43%20Neil'),('karezb',1,'2018-04-01 15:48:52',NULL,'/api/v1/address/complete/?q=Unit%204,%2043%20Neil%20Street,%20MERRYLANDS%20NSW%202160'),('karezb',1,'2018-04-01 15:48:55',NULL,'/api/v1/property/new'),('karezb',1,'2018-04-01 15:49:28',NULL,'/api/v1/address/search/?q=Unit%208,%2043%20Neil%20Street,%20MERRYLANDS%20NSW%202160'),('karezb',1,'2018-04-01 15:49:31',NULL,'/api/v1/address/complete/?q=Unit%208,%2043%20Neil%20Street,%20MERRYLANDS%20NSW%202160'),('karezb',1,'2018-04-01 15:49:34',NULL,'/api/v1/property/new'),('karezb',1,'2018-04-01 15:51:34',NULL,'/api/v1/property/17'),('karezb',1,'2018-04-01 15:51:34',NULL,'/api/v1/property/update'),('karezb',1,'2018-04-01 15:52:21',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 15:52:44',NULL,'/api/v1/claim'),('karezb',1,'2018-04-01 15:52:45',NULL,'/api/v1/claim'),('karezb',1,'2018-04-01 15:52:47',NULL,'/api/v1/claim'),('karezb',1,'2018-04-01 15:52:51',NULL,'/api/v1/claim'),('karezb',1,'2018-04-01 17:25:37',NULL,'/api/v1/claim'),('karezb',1,'2018-04-01 17:25:40',NULL,'/api/v1/claim'),('karezb',1,'2018-04-01 17:25:41',NULL,'/api/v1/claim'),('karezb',1,'2018-04-01 17:25:47',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 17:25:59',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 17:26:22',NULL,'/api/v1/claim'),('karezb',1,'2018-04-01 17:26:27',NULL,'/api/v1/customer/karezb'),('karezb',1,'2018-04-01 17:26:27',NULL,'/api/v1/config/6'),('karezb',1,'2018-04-01 17:27:12',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 17:27:59',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 17:29:35',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 17:29:46',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 17:31:17',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 17:32:06',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 17:36:11',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 18:10:39',NULL,'/api/v1/claim'),('karezb',1,'2018-04-01 18:10:42',NULL,'/api/v1/claim'),('karezb',1,'2018-04-01 18:17:03',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-01 18:17:35',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-01 18:18:45',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-01 18:19:01',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-01 18:19:36','127.0.0.1','/api/v1/claim/username/karezb'),('karezb',1,'2018-04-01 18:22:39',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-01 18:24:08','127.0.0.1','/api/v1/claim/username/karezb'),('karezb',1,'2018-04-01 18:24:39','127.0.0.1','/api/v1/claim/username/karezb'),('karezb',1,'2018-04-01 18:26:30','127.0.0.1','/api/v1/claim/username/karezb'),('karezb',1,'2018-04-01 18:27:04',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-01 18:29:09',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-01 18:30:06',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-01 18:32:47',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-01 18:38:32',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-01 18:38:32',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-01 18:39:00',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-01 18:39:01',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-01 18:39:44',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-01 18:39:44',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-01 18:40:19',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-01 18:40:19',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-01 18:41:08',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-01 18:41:08',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-01 18:41:09',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-01 18:41:09',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-01 18:41:52',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-01 18:41:52',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-01 18:43:56',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-01 18:43:56',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-01 18:45:34',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-01 18:45:34',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-01 18:45:37',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-01 18:45:37',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-01 18:46:04',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-01 18:46:04',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-01 18:46:19',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-01 18:46:19',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-01 18:46:58',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-01 18:46:58',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-01 18:47:02',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 18:47:44',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 18:48:05',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 18:50:11',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 18:50:40',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 18:50:54',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 18:52:06',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 18:52:47',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 18:53:41',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 18:56:42',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 18:57:42',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 19:02:17',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 19:03:48',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 19:04:12',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 19:04:25',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 19:04:35',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 19:04:49',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 19:05:13',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 19:05:26',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 19:15:22',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 19:26:08',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 19:27:03',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 19:28:38',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 19:31:02',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 19:32:55',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 19:38:07',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 19:42:01',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 19:43:12',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 19:43:23',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 19:43:37',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 19:44:20',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 19:47:10',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 19:47:34',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 19:47:49',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 19:48:42',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 19:48:56',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 19:50:53',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 19:52:50',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 19:53:14',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-01 19:53:14',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-01 19:53:21',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 19:56:21',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 19:56:55',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 19:57:59',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 19:58:11',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 19:58:46',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 19:59:23',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 19:59:35',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 20:00:05',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 20:00:53',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 20:01:05',NULL,'/api/v1/address/search/?q=4'),('karezb',1,'2018-04-01 20:01:07',NULL,'/api/v1/address/search/?q=44'),('karezb',1,'2018-04-01 20:01:07',NULL,'/api/v1/address/search/?q=444'),('karezb',1,'2018-04-01 20:01:07',NULL,'/api/v1/address/search/?q=4444'),('karezb',1,'2018-04-01 20:01:07',NULL,'/api/v1/address/search/?q=44444'),('karezb',1,'2018-04-01 20:01:08',NULL,'/api/v1/address/search/?q=444444'),('karezb',1,'2018-04-01 20:01:08',NULL,'/api/v1/address/search/?q=4444444'),('karezb',1,'2018-04-01 20:01:54',NULL,'/api/v1/address/search/?q=undefined'),('karezb',1,'2018-04-01 20:04:18',NULL,'/api/v1/address/search/?q=4'),('karezb',1,'2018-04-01 20:04:18',NULL,'/api/v1/address/search/?q=4/'),('karezb',1,'2018-04-01 20:06:01',NULL,'/api/v1/address/search/?q=4'),('karezb',1,'2018-04-01 20:06:13',NULL,'/api/v1/address/search/?q=undefined'),('karezb',1,'2018-04-01 20:06:38',NULL,'/api/v1/address/search/?q=4'),('karezb',1,'2018-04-01 20:06:43',NULL,'/api/v1/address/search/?q=undefined'),('karezb',1,'2018-04-01 20:06:43',NULL,'/api/v1/address/search/?q=undefined'),('karezb',1,'2018-04-01 21:40:41',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-01 21:40:41',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-01 21:40:42',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-01 21:40:42',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-01 21:40:43',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-01 21:40:43',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-01 21:41:57',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-01 22:08:57',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-01 22:09:10',NULL,'/api/v1/address/search/?q=undefined'),('karezb',1,'2018-04-01 22:09:12',NULL,'/api/v1/address/search/?q=4'),('karezb',1,'2018-04-01 22:09:12',NULL,'/api/v1/address/search/?q=4/'),('karezb',1,'2018-04-01 22:09:12',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 22:09:12',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 22:09:13',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 22:09:13',NULL,'/api/v1/address/search/?q=4/43%20N'),('karezb',1,'2018-04-01 22:09:13',NULL,'/api/v1/address/search/?q=4/43%20N'),('karezb',1,'2018-04-01 22:09:13',NULL,'/api/v1/address/search/?q=4/43%20Ne'),('karezb',1,'2018-04-01 22:09:13',NULL,'/api/v1/address/search/?q=4/43%20Neil'),('karezb',1,'2018-04-01 22:09:13',NULL,'/api/v1/address/search/?q=4/43%20Neil'),('karezb',1,'2018-04-01 22:09:31',NULL,'/api/v1/claim/1'),('karezb',1,'2018-04-01 22:10:19',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-01 22:10:26',NULL,'/api/v1/address/search/?q=undefined'),('karezb',1,'2018-04-01 22:10:26',NULL,'/api/v1/address/search/?q=undefined'),('karezb',1,'2018-04-01 22:10:27',NULL,'/api/v1/address/search/?q=3/'),('karezb',1,'2018-04-01 22:10:27',NULL,'/api/v1/address/search/?q=3/'),('karezb',1,'2018-04-01 22:10:27',NULL,'/api/v1/address/search/?q=3'),('karezb',1,'2018-04-01 22:10:27',NULL,'/api/v1/address/search/?q=4'),('karezb',1,'2018-04-01 22:10:27',NULL,'/api/v1/address/search/?q=4'),('karezb',1,'2018-04-01 22:10:28',NULL,'/api/v1/address/search/?q=4/'),('karezb',1,'2018-04-01 22:10:28',NULL,'/api/v1/address/search/?q=4/3'),('karezb',1,'2018-04-01 22:10:28',NULL,'/api/v1/address/search/?q=4/'),('karezb',1,'2018-04-01 22:10:29',NULL,'/api/v1/address/search/?q=4/4'),('karezb',1,'2018-04-01 22:10:29',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 22:10:29',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 22:10:29',NULL,'/api/v1/address/search/?q=4/43%20N'),('karezb',1,'2018-04-01 22:10:30',NULL,'/api/v1/address/search/?q=4/43%20N'),('karezb',1,'2018-04-01 22:10:30',NULL,'/api/v1/address/search/?q=4/43%20Nei'),('karezb',1,'2018-04-01 22:10:30',NULL,'/api/v1/address/search/?q=4/43%20Neil'),('karezb',1,'2018-04-01 22:10:30',NULL,'/api/v1/address/search/?q=4/43%20Neil'),('karezb',1,'2018-04-01 22:10:30',NULL,'/api/v1/address/search/?q=4/43%20Neil'),('karezb',1,'2018-04-01 22:10:30',NULL,'/api/v1/address/search/?q=4/43%20Neil%20S'),('karezb',1,'2018-04-01 22:10:30',NULL,'/api/v1/address/search/?q=4/43%20Neil%20St'),('karezb',1,'2018-04-01 22:10:30',NULL,'/api/v1/address/search/?q=4/43%20Neil%20St'),('karezb',1,'2018-04-01 22:10:31',NULL,'/api/v1/address/complete/?q=Unit%204,%2043%20Neil%20Street,%20MERRYLANDS%20NSW%202160'),('karezb',1,'2018-04-01 22:10:58',NULL,'/api/v1/claim/1'),('karezb',1,'2018-04-01 22:10:59',NULL,'/api/v1/property/fd32a6ff-e98b-44fd-95ab-378672d7da4b'),('karezb',1,'2018-04-01 22:10:59',NULL,'/api/v1/property/new'),('karezb',1,'2018-04-01 22:11:31',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 22:13:11',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-01 22:13:17',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-01 22:13:17',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-01 22:13:19',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-01 22:13:26',NULL,'/api/v1/address/search/?q=undefined'),('karezb',1,'2018-04-01 22:13:27',NULL,'/api/v1/address/search/?q=undefined'),('karezb',1,'2018-04-01 22:13:27',NULL,'/api/v1/address/search/?q=4'),('karezb',1,'2018-04-01 22:13:27',NULL,'/api/v1/address/search/?q=4/'),('karezb',1,'2018-04-01 22:13:27',NULL,'/api/v1/address/search/?q=4/4'),('karezb',1,'2018-04-01 22:13:27',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 22:13:28',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 22:13:28',NULL,'/api/v1/address/search/?q=4/43%20N'),('karezb',1,'2018-04-01 22:13:28',NULL,'/api/v1/address/search/?q=4/43%20N'),('karezb',1,'2018-04-01 22:13:28',NULL,'/api/v1/address/search/?q=4/43%20Nei'),('karezb',1,'2018-04-01 22:13:28',NULL,'/api/v1/address/search/?q=4/43%20Neil'),('karezb',1,'2018-04-01 22:13:28',NULL,'/api/v1/address/search/?q=4/43%20Neil'),('karezb',1,'2018-04-01 22:13:29',NULL,'/api/v1/address/search/?q=4/43%20Neil'),('karezb',1,'2018-04-01 22:13:29',NULL,'/api/v1/address/search/?q=4/43%20Neil%20S'),('karezb',1,'2018-04-01 22:13:29',NULL,'/api/v1/address/search/?q=4/43%20Neil%20St'),('karezb',1,'2018-04-01 22:13:29',NULL,'/api/v1/address/search/?q=4/43%20Neil%20St'),('karezb',1,'2018-04-01 22:13:30',NULL,'/api/v1/address/search/?q=4/43%20Neil%20St'),('karezb',1,'2018-04-01 22:13:31',NULL,'/api/v1/address/complete/?q=Unit%204,%2043%20Neil%20Street,%20MERRYLANDS%20NSW%202160'),('karezb',1,'2018-04-01 22:15:27',NULL,'/api/v1/property/canonical/fd32a6ff-e98b-44fd-95ab-378672d7da4b'),('karezb',1,'2018-04-01 22:15:52','127.0.0.1','/api/v1/property/canonical/fd32a6ff-e98b-44fd-95ab-378672d7da4b'),('karezb',1,'2018-04-01 22:16:12',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-01 22:16:19',NULL,'/api/v1/address/search/?q=undefined'),('karezb',1,'2018-04-01 22:16:20',NULL,'/api/v1/address/search/?q=4'),('karezb',1,'2018-04-01 22:16:20',NULL,'/api/v1/address/search/?q=4/'),('karezb',1,'2018-04-01 22:16:21',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 22:16:21',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 22:16:21',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 22:16:21',NULL,'/api/v1/address/search/?q=4/43%20N'),('karezb',1,'2018-04-01 22:16:21',NULL,'/api/v1/address/search/?q=4/43%20N'),('karezb',1,'2018-04-01 22:16:21',NULL,'/api/v1/address/search/?q=4/43%20Nei'),('karezb',1,'2018-04-01 22:16:21',NULL,'/api/v1/address/search/?q=4/43%20Neil'),('karezb',1,'2018-04-01 22:16:21',NULL,'/api/v1/address/search/?q=4/43%20Neil'),('karezb',1,'2018-04-01 22:16:22',NULL,'/api/v1/address/complete/?q=Unit%204,%2043%20Neil%20Street,%20MERRYLANDS%20NSW%202160'),('karezb',1,'2018-04-01 22:16:38',NULL,'/api/v1/claim/1'),('karezb',1,'2018-04-01 22:16:38',NULL,'/api/v1/property/canonical/fd32a6ff-e98b-44fd-95ab-378672d7da4b'),('karezb',1,'2018-04-01 22:16:38',NULL,'/api/v1/claim/update'),('karezb',1,'2018-04-01 22:19:24',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-01 22:19:34',NULL,'/api/v1/address/search/?q=4'),('karezb',1,'2018-04-01 22:19:34',NULL,'/api/v1/address/search/?q=4/'),('karezb',1,'2018-04-01 22:19:35',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 22:19:35',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 22:19:35',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 22:19:36',NULL,'/api/v1/address/search/?q=4/43%20n'),('karezb',1,'2018-04-01 22:19:36',NULL,'/api/v1/address/search/?q=4/43%20nei'),('karezb',1,'2018-04-01 22:19:36',NULL,'/api/v1/address/search/?q=4/43%20neil'),('karezb',1,'2018-04-01 22:19:36',NULL,'/api/v1/address/search/?q=4/43%20neil'),('karezb',1,'2018-04-01 22:19:37',NULL,'/api/v1/address/complete/?q=Unit%204,%2043%20Neil%20Street,%20MERRYLANDS%20NSW%202160'),('karezb',1,'2018-04-01 22:19:44',NULL,'/api/v1/claim/1'),('karezb',1,'2018-04-01 22:19:44',NULL,'/api/v1/property/canonical/fd32a6ff-e98b-44fd-95ab-378672d7da4b'),('karezb',1,'2018-04-01 22:19:44',NULL,'/api/v1/claim/update'),('karezb',1,'2018-04-01 22:21:41',NULL,'/api/v1/claim/1'),('karezb',1,'2018-04-01 22:21:41',NULL,'/api/v1/property/canonical/fd32a6ff-e98b-44fd-95ab-378672d7da4b'),('karezb',1,'2018-04-01 22:21:41',NULL,'/api/v1/claim/update'),('karezb',1,'2018-04-01 22:23:05',NULL,'/api/v1/claim/1'),('karezb',1,'2018-04-01 22:23:05',NULL,'/api/v1/property/canonical/fd32a6ff-e98b-44fd-95ab-378672d7da4b'),('karezb',1,'2018-04-01 22:23:05',NULL,'/api/v1/claim/update'),('karezb',1,'2018-04-01 22:28:50',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-01 22:29:02',NULL,'/api/v1/address/search/?q=undefined'),('karezb',1,'2018-04-01 22:29:03',NULL,'/api/v1/address/search/?q=4'),('karezb',1,'2018-04-01 22:29:03',NULL,'/api/v1/address/search/?q=4/'),('karezb',1,'2018-04-01 22:29:03',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 22:29:04',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 22:29:04',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 22:29:04',NULL,'/api/v1/address/search/?q=4/43%20N'),('karezb',1,'2018-04-01 22:29:04',NULL,'/api/v1/address/search/?q=4/43%20Nei'),('karezb',1,'2018-04-01 22:29:04',NULL,'/api/v1/address/search/?q=4/43%20N'),('karezb',1,'2018-04-01 22:29:04',NULL,'/api/v1/address/search/?q=4/43%20Neil'),('karezb',1,'2018-04-01 22:29:04',NULL,'/api/v1/address/search/?q=4/43%20Neil'),('karezb',1,'2018-04-01 22:29:05',NULL,'/api/v1/address/search/?q=4/43%20Neil'),('karezb',1,'2018-04-01 22:29:07',NULL,'/api/v1/address/complete/?q=Unit%204,%2043%20Neil%20Street,%20MERRYLANDS%20NSW%202160'),('karezb',1,'2018-04-01 22:31:50',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-01 22:31:58',NULL,'/api/v1/address/search/?q=undefined'),('karezb',1,'2018-04-01 22:31:59',NULL,'/api/v1/address/search/?q=4'),('karezb',1,'2018-04-01 22:31:59',NULL,'/api/v1/address/search/?q=4/'),('karezb',1,'2018-04-01 22:31:59',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 22:31:59',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 22:32:00',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 22:32:00',NULL,'/api/v1/address/search/?q=4/43%20n'),('karezb',1,'2018-04-01 22:32:00',NULL,'/api/v1/address/search/?q=4/43%20nei'),('karezb',1,'2018-04-01 22:32:00',NULL,'/api/v1/address/search/?q=4/43%20neil'),('karezb',1,'2018-04-01 22:32:00',NULL,'/api/v1/address/search/?q=4/43%20neil'),('karezb',1,'2018-04-01 22:32:01',NULL,'/api/v1/address/search/?q=4/43%20neil'),('karezb',1,'2018-04-01 22:32:01',NULL,'/api/v1/address/search/?q=4/43%20neil'),('karezb',1,'2018-04-01 22:32:04',NULL,'/api/v1/address/complete/?q=Unit%204,%2043%20Neil%20Street,%20MERRYLANDS%20NSW%202160'),('karezb',1,'2018-04-01 22:32:13',NULL,'/api/v1/property/canonical/fd32a6ff-e98b-44fd-95ab-378672d7da4b'),('karezb',1,'2018-04-01 22:32:13',NULL,'/api/v1/claim/update'),('karezb',1,'2018-04-01 22:38:07',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-01 22:38:13',NULL,'/api/v1/address/search/?q=undefined'),('karezb',1,'2018-04-01 22:38:14',NULL,'/api/v1/address/search/?q=4'),('karezb',1,'2018-04-01 22:38:15',NULL,'/api/v1/address/search/?q=4/4'),('karezb',1,'2018-04-01 22:38:15',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 22:38:15',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 22:38:15',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 22:38:15',NULL,'/api/v1/address/search/?q=4/43%20N'),('karezb',1,'2018-04-01 22:38:15',NULL,'/api/v1/address/search/?q=4/43%20Nei'),('karezb',1,'2018-04-01 22:38:15',NULL,'/api/v1/address/search/?q=4/43%20N'),('karezb',1,'2018-04-01 22:38:15',NULL,'/api/v1/address/search/?q=4/43%20Neil'),('karezb',1,'2018-04-01 22:38:16',NULL,'/api/v1/address/search/?q=4/43%20Neil'),('karezb',1,'2018-04-01 22:38:17',NULL,'/api/v1/address/complete/?q=Unit%204,%2043%20Neil%20Street,%20MERRYLANDS%20NSW%202160'),('karezb',1,'2018-04-01 22:38:25',NULL,'/api/v1/property/canonical/fd32a6ff-e98b-44fd-95ab-378672d7da4b'),('karezb',1,'2018-04-01 22:38:25',NULL,'/api/v1/claim/new'),('karezb',1,'2018-04-01 22:39:20',NULL,'/api/v1/property/canonical/fd32a6ff-e98b-44fd-95ab-378672d7da4b'),('karezb',1,'2018-04-01 22:39:20',NULL,'/api/v1/claim/new'),('karezb',1,'2018-04-01 22:40:40',NULL,'/api/v1/property/canonical/fd32a6ff-e98b-44fd-95ab-378672d7da4b'),('karezb',1,'2018-04-01 22:40:40',NULL,'/api/v1/claim/new'),('karezb',1,'2018-04-01 22:40:50',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-01 22:40:57',NULL,'/api/v1/address/search/?q=undefined'),('karezb',1,'2018-04-01 22:40:58',NULL,'/api/v1/address/search/?q=4'),('karezb',1,'2018-04-01 22:40:59',NULL,'/api/v1/address/search/?q=44'),('karezb',1,'2018-04-01 22:40:59',NULL,'/api/v1/address/search/?q=44/'),('karezb',1,'2018-04-01 22:40:59',NULL,'/api/v1/address/search/?q=44'),('karezb',1,'2018-04-01 22:40:59',NULL,'/api/v1/address/search/?q=4'),('karezb',1,'2018-04-01 22:40:59',NULL,'/api/v1/address/search/?q=4/'),('karezb',1,'2018-04-01 22:41:00',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 22:41:00',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 22:41:00',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 22:41:00',NULL,'/api/v1/address/search/?q=4/43%20N'),('karezb',1,'2018-04-01 22:41:00',NULL,'/api/v1/address/search/?q=4/43%20N'),('karezb',1,'2018-04-01 22:41:00',NULL,'/api/v1/address/search/?q=4/43%20Nei'),('karezb',1,'2018-04-01 22:41:00',NULL,'/api/v1/address/search/?q=4/43%20Neil'),('karezb',1,'2018-04-01 22:41:01',NULL,'/api/v1/address/search/?q=4/43%20Neil'),('karezb',1,'2018-04-01 22:41:01',NULL,'/api/v1/address/search/?q=4/43%20Neil'),('karezb',1,'2018-04-01 22:41:02',NULL,'/api/v1/address/complete/?q=Unit%204,%2043%20Neil%20Street,%20MERRYLANDS%20NSW%202160'),('karezb',1,'2018-04-01 22:41:09',NULL,'/api/v1/property/canonical/fd32a6ff-e98b-44fd-95ab-378672d7da4b'),('karezb',1,'2018-04-01 22:41:09',NULL,'/api/v1/claim/new'),('karezb',1,'2018-04-01 22:55:20',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-01 22:55:26',NULL,'/api/v1/address/search/?q=undefined'),('karezb',1,'2018-04-01 22:55:27',NULL,'/api/v1/address/search/?q=4'),('karezb',1,'2018-04-01 22:55:27',NULL,'/api/v1/address/search/?q=4/'),('karezb',1,'2018-04-01 22:55:27',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 22:55:27',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 22:55:28',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 22:55:29',NULL,'/api/v1/address/search/?q=4/43%20N'),('karezb',1,'2018-04-01 22:55:29',NULL,'/api/v1/address/search/?q=4/43%20N'),('karezb',1,'2018-04-01 22:55:29',NULL,'/api/v1/address/search/?q=4/43%20Nei'),('karezb',1,'2018-04-01 22:55:29',NULL,'/api/v1/address/search/?q=4/43%20Neil'),('karezb',1,'2018-04-01 22:55:29',NULL,'/api/v1/address/search/?q=4/43%20Neil'),('karezb',1,'2018-04-01 22:55:29',NULL,'/api/v1/address/search/?q=4/43%20Neils'),('karezb',1,'2018-04-01 22:55:30',NULL,'/api/v1/address/search/?q=4/43%20Neil'),('karezb',1,'2018-04-01 22:55:31',NULL,'/api/v1/address/search/?q=4/43%20Neil'),('karezb',1,'2018-04-01 22:55:31',NULL,'/api/v1/address/complete/?q=Unit%204,%2043%20Neil%20Street,%20MERRYLANDS%20NSW%202160'),('karezb',1,'2018-04-01 22:55:43',NULL,'/api/v1/property/canonical/fd32a6ff-e98b-44fd-95ab-378672d7da4b'),('karezb',1,'2018-04-01 22:55:43',NULL,'/api/v1/claim/new'),('karezb',1,'2018-04-01 22:56:58',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-01 22:57:05',NULL,'/api/v1/address/search/?q=undefined'),('karezb',1,'2018-04-01 22:57:05',NULL,'/api/v1/address/search/?q=4/'),('karezb',1,'2018-04-01 22:57:06',NULL,'/api/v1/address/search/?q=4/'),('karezb',1,'2018-04-01 22:57:06',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 22:57:06',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 22:57:06',NULL,'/api/v1/address/search/?q=4/43'),('karezb',1,'2018-04-01 22:57:06',NULL,'/api/v1/address/search/?q=4/43%20n'),('karezb',1,'2018-04-01 22:57:06',NULL,'/api/v1/address/search/?q=4/43%20ne'),('karezb',1,'2018-04-01 22:57:07',NULL,'/api/v1/address/search/?q=4/43%20neil'),('karezb',1,'2018-04-01 22:57:07',NULL,'/api/v1/address/search/?q=4/43%20neil'),('karezb',1,'2018-04-01 22:57:08',NULL,'/api/v1/address/complete/?q=Unit%204,%2043%20Neil%20Street,%20MERRYLANDS%20NSW%202160'),('karezb',1,'2018-04-01 22:57:19',NULL,'/api/v1/property/canonical/fd32a6ff-e98b-44fd-95ab-378672d7da4b'),('karezb',1,'2018-04-01 22:57:19',NULL,'/api/v1/claim/new'),('karezb',1,'2018-04-01 22:59:08',NULL,'/api/v1/property/canonical/fd32a6ff-e98b-44fd-95ab-378672d7da4b'),('karezb',1,'2018-04-01 22:59:08',NULL,'/api/v1/claim/new'),('karezb',1,'2018-04-01 23:02:54',NULL,'/api/v1/property/canonical/fd32a6ff-e98b-44fd-95ab-378672d7da4b'),('karezb',1,'2018-04-01 23:02:54',NULL,'/api/v1/claim/new'),('karezb',1,'2018-04-01 23:03:08',NULL,'/api/v1/property/canonical/fd32a6ff-e98b-44fd-95ab-378672d7da4b'),('karezb',1,'2018-04-01 23:03:08',NULL,'/api/v1/claim/new'),('karezb',1,'2018-04-01 23:03:38',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-01 23:03:38',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-01 23:03:59',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-01 23:03:59',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-02 18:43:12',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-02 18:43:12',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-02 18:43:16',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-02 18:43:16',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-02 18:43:19',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-02 18:43:32',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-02 18:43:39',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-02 18:43:44',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-02 18:43:44',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-02 18:43:46',NULL,'/api/v1/customer/karezb'),('karezb',1,'2018-04-02 18:43:46',NULL,'/api/v1/config/6'),('karezb',1,'2018-04-03 19:56:05',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 19:56:05',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-03 20:50:47',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 20:50:47',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-03 20:52:30',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-03 20:52:30',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 20:55:12',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 20:55:12',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-03 20:58:38',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-03 20:58:44',NULL,'/api/v1/config/123'),('karezb',1,'2018-04-03 21:00:47',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-03 21:00:47',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 21:01:20',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-03 21:01:20',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 21:02:10',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-03 21:02:10',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 21:04:45',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-03 21:04:45',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 21:08:38',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 21:08:38',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-03 21:09:14',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-03 21:09:14',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 21:10:47',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-03 21:10:47',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 21:11:24',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-03 21:11:24',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 21:12:29',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-03 21:12:29',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 21:13:06',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-03 21:13:06',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 21:14:17',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-03 21:14:17',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 21:18:01',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-03 21:18:01',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 21:19:07',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-03 21:19:07',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 21:19:07',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-03 21:19:30',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 21:19:42',NULL,'/api/v1/address/search/?q=undefined'),('karezb',1,'2018-04-03 21:19:43',NULL,'/api/v1/address/search/?q=4'),('karezb',1,'2018-04-03 21:19:44',NULL,'/api/v1/address/search/?q=4/'),('karezb',1,'2018-04-03 21:19:45',NULL,'/api/v1/address/search/?q=4'),('karezb',1,'2018-04-03 21:19:45',NULL,'/api/v1/address/search/?q=undefined'),('karezb',1,'2018-04-03 21:19:46',NULL,'/api/v1/address/search/?q=234'),('karezb',1,'2018-04-03 21:19:47',NULL,'/api/v1/address/search/?q=234'),('karezb',1,'2018-04-03 21:19:47',NULL,'/api/v1/address/search/?q=234'),('karezb',1,'2018-04-03 21:19:47',NULL,'/api/v1/address/search/?q=234'),('karezb',1,'2018-04-03 21:19:47',NULL,'/api/v1/address/search/?q=234%20p'),('karezb',1,'2018-04-03 21:19:47',NULL,'/api/v1/address/search/?q=234%20pet'),('karezb',1,'2018-04-03 21:19:48',NULL,'/api/v1/address/search/?q=234%20pet'),('karezb',1,'2018-04-03 21:19:48',NULL,'/api/v1/address/search/?q=234%20peter'),('karezb',1,'2018-04-03 21:19:48',NULL,'/api/v1/address/search/?q=234%20peter'),('karezb',1,'2018-04-03 21:19:48',NULL,'/api/v1/address/search/?q=234%20petersh'),('karezb',1,'2018-04-03 21:19:48',NULL,'/api/v1/address/search/?q=234%20petersh'),('karezb',1,'2018-04-03 21:19:48',NULL,'/api/v1/address/search/?q=234%20petersham'),('karezb',1,'2018-04-03 21:19:48',NULL,'/api/v1/address/search/?q=234%20petersham'),('karezb',1,'2018-04-03 21:19:51',NULL,'/api/v1/address/complete/?q=234%20New%20Canterbury%20Road,%20PETERSHAM%20NSW%202049'),('karezb',1,'2018-04-03 21:20:02',NULL,'/api/v1/property/canonical/5bc66dd4-8d4d-49ad-a209-0dfc6cd0143a'),('karezb',1,'2018-04-03 21:20:02',NULL,'/api/v1/property/new'),('karezb',1,'2018-04-03 21:23:04',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 21:25:32',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 21:25:50',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 21:26:14',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 21:26:45',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 21:27:13',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 21:28:34',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 21:29:03',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 21:29:08',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 21:29:21',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 21:29:51',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 21:30:03',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-03 21:30:03',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 21:30:03',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-03 21:30:09',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 21:30:26',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 21:30:46',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 21:30:53',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 21:31:35',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 21:31:41',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 21:32:16',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 21:33:52',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 21:39:20',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 21:43:01',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 21:43:39',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 21:44:36',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 21:44:44',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 21:45:59',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 21:50:22',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 21:50:41',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 21:50:57',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 21:51:34',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 21:51:49',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 21:52:02',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 21:52:10',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 21:53:54',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 21:54:48',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 21:55:12',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 21:58:03',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:01:34',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:03:44',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:04:14',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:04:14',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:04:37',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:04:37',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:06:29',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:06:29',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:08:08',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:08:08',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:08:38',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:08:38',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:09:12',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:09:12',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:10:29',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:10:29',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:10:57',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:10:57',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:11:46',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:11:46',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:12:05',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:12:05',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:12:13',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:12:13',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:12:22',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:12:22',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:13:00',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:13:00',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:13:07',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:13:07',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:13:57',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:13:57',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:14:22',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:14:22',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:15:08',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:15:08',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:15:25',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:15:25',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:16:27',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:16:27',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:17:42',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:17:42',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:18:32',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:18:32',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:18:49',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:18:49',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:19:10',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:19:10',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:19:25',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:19:25',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:19:34',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:19:34',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:19:53',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:19:53',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:20:01',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:20:01',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:20:49',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:20:49',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:21:19',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:21:19',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:22:33',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:22:33',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:22:52',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:22:52',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:23:21',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:23:21',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:23:55',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:23:55',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:24:15',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:24:15',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:24:44',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:24:44',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:25:11',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:25:11',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:25:23',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:25:42',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:25:42',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:25:49',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:26:20',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:26:20',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:26:23',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:26:31',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:26:31',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:26:39',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:26:39',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:26:42',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:26:54',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:26:54',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:27:07',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:27:07',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:27:10',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:29:42',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:29:42',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:29:49',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:29:49',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:29:51',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:30:05',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:30:05',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:30:08',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:30:28',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:30:28',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:30:32',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:31:32',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:31:32',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:31:34',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:31:57',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:31:57',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:32:00',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:32:22',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:35:24',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:35:24',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:36:26',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:36:26',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:37:04',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:37:04',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:38:10',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:38:11',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:38:20',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:38:20',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:39:15',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:39:15',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:40:41',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:40:41',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:40:45',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:40:59',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:40:59',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:41:02',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:41:54',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:41:54',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:42:28',NULL,'/api/v1/config/9'),('karezb',1,'2018-04-03 22:42:34',NULL,'/api/v1/customer/karezb'),('karezb',1,'2018-04-03 22:42:34',NULL,'/api/v1/config/6'),('karezb',1,'2018-04-03 22:42:36',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-03 22:42:36',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:42:36',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-03 22:43:41',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-03 22:43:41',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:43:41',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-03 22:43:41',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:43:41',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:43:59',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:43:59',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 22:44:02',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:44:05',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:44:06',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:44:08',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:44:08',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:44:08',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:44:09',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:44:09',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:45:36',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 22:45:36',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 23:08:21',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 23:08:21',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 23:10:17',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 23:10:17',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 23:12:14',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 23:12:14',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 23:12:33',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 23:12:33',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 23:14:09',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 23:14:09',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 23:14:57',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-03 23:14:57',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 23:15:17',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 23:17:04',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 23:17:25',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-03 23:17:39',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 18:45:03',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 18:46:42',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 18:46:52',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 18:47:06',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 18:47:08',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 18:47:08',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-04 18:47:08',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-04 18:47:22',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 19:08:06',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-04 19:08:06',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-04 19:08:06',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 19:08:08',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-04 19:08:08',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-04 19:08:08',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 19:08:10',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-04 19:08:10',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 19:08:10',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-04 19:08:11',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 19:59:06',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-04 19:59:06',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 19:59:06',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-04 19:59:07',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 20:03:53',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-04 20:03:53',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 20:03:53',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-04 20:03:58',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-04 20:03:58',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 20:03:58',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-04 20:04:00',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 20:04:00',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-04 20:04:20',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-04 20:04:20',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 20:04:20',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-04 20:04:23',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-04 20:04:23',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 20:04:23',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-04 20:04:26',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-04 20:04:26',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 20:04:34',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 20:04:37',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 20:04:37',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-04 20:04:37',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-04 20:04:38',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 20:04:38',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-04 20:06:11',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 20:06:14',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 20:06:14',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-04 20:06:14',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-04 20:06:15',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 20:06:15',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-04 20:07:40',NULL,'/api/v1/worklog'),('karezb',1,'2018-04-04 20:08:38',NULL,'/api/v1/worklog/workitem/'),('karezb',1,'2018-04-04 20:08:46',NULL,'/api/v1/worklog/workitem/4'),('karezb',1,'2018-04-04 20:09:47','127.0.0.1','/api/v1/worklog/workitem/4'),('karezb',1,'2018-04-04 20:10:12','127.0.0.1','/api/v1/worklog/workitem/4'),('karezb',1,'2018-04-04 20:10:39',NULL,'/api/v1/worklog/workitem/4'),('karezb',1,'2018-04-04 20:11:35',NULL,'/api/v1/worklog/workitems/4'),('karezb',1,'2018-04-04 20:12:54',NULL,'/api/v1/worklog/workitems/5'),('karezb',1,'2018-04-04 20:14:17',NULL,'/api/v1/worklog/workitems/4'),('karezb',1,'2018-04-04 20:15:17',NULL,'/api/v1/worklog/workitems/4'),('karezb',1,'2018-04-04 21:32:24',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 21:32:27',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 21:32:27',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-04 21:32:27',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-04 21:32:29',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 21:32:29',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-04 21:33:29',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 21:33:29',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 21:33:30',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 21:33:30',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-04 21:33:30',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-04 21:33:31',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-04 21:33:31',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 21:33:31',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-04 21:33:32',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 21:33:32',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 21:33:32',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-04 21:34:45',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 21:34:45',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 21:34:46',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 21:34:46',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-04 21:34:46',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-04 21:34:48',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 21:34:48',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 21:34:48',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-04 21:35:23',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 21:35:23',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 21:35:25',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 21:35:25',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-04 21:35:25',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-04 21:35:26',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 21:35:26',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 21:35:26',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-04 21:37:28',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 21:37:28',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 21:37:30',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 21:37:30',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-04 21:37:30',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-04 21:37:31',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 21:37:31',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 21:37:31',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-04 21:41:33',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-04 21:42:15',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 21:42:15',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 21:42:17',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 21:42:17',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-04 21:42:17',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-04 21:42:18',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 21:42:18',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 21:42:18',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-04 21:44:02',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 21:44:02',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 21:44:03',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 21:44:03',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-04 21:44:03',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-04 21:44:04',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 21:44:04',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 21:44:04',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-04 21:44:16',NULL,'/api/v1/worklog/new'),('karezb',1,'2018-04-04 21:45:19',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 21:45:19',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 21:45:21',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 21:45:21',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-04 21:45:21',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-04 21:45:22',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 21:45:22',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 21:45:23',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-04 21:45:32',NULL,'/api/v1/worklog/new'),('karezb',1,'2018-04-04 21:45:47',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 21:45:47',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 21:45:48',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 21:45:48',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-04 21:45:48',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-04 21:45:50',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 21:45:50',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 21:45:50',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-04 21:45:57',NULL,'/api/v1/worklog/new'),('karezb',1,'2018-04-04 21:46:48',NULL,'/api/v1/worklog/new'),('karezb',1,'2018-04-04 21:48:40',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 21:48:40',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 21:48:41',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 21:48:41',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-04 21:48:41',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-04 21:48:43',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 21:48:43',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 21:48:43',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-04 21:48:52',NULL,'/api/v1/worklog/new'),('karezb',1,'2018-04-04 21:51:26',NULL,'/api/v1/worklog/new'),('karezb',1,'2018-04-04 21:51:32',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 21:51:32',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 21:51:34',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 21:51:34',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-04 21:51:34',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-04 21:51:37',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-04 21:51:37',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 21:51:37',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 21:52:02',NULL,'/api/v1/worklog/new'),('karezb',1,'2018-04-04 21:55:04',NULL,'/api/v1/worklog/new'),('karezb',1,'2018-04-04 21:55:33',NULL,'/api/v1/worklog/new'),('karezb',1,'2018-04-04 21:56:27',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 21:56:27',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 21:56:29',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 21:56:29',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-04 21:56:29',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-04 21:56:30',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 21:56:30',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 21:56:30',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-04 21:56:38',NULL,'/api/v1/worklog/new'),('karezb',1,'2018-04-04 21:56:53',NULL,'/api/v1/worklog/new'),('karezb',1,'2018-04-04 22:01:22',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 22:01:22',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 22:01:23',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 22:01:23',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-04 22:01:23',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-04 22:01:24',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 22:01:24',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 22:01:24',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-04 22:01:34',NULL,'/api/v1/worklog/new'),('karezb',1,'2018-04-04 22:06:05',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 22:06:05',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 22:06:06',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 22:06:06',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-04 22:06:06',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-04 22:06:07',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 22:06:07',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 22:06:07',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-04 22:06:16',NULL,'/api/v1/worklog/new'),('karezb',1,'2018-04-04 22:13:39',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 22:13:39',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 22:13:42',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 22:13:42',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-04 22:13:42',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-04 22:13:43',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 22:13:43',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 22:13:43',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-04 22:14:35',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 22:14:35',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 22:14:36',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 22:14:36',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-04 22:14:36',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-04 22:14:39',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 22:14:39',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 22:14:39',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-04 22:17:47',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 22:17:47',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 22:17:48',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 22:17:48',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-04 22:17:48',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-04 22:17:50',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 22:17:50',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 22:17:50',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-04 22:18:00',NULL,'/api/v1/worklog/new'),('karezb',1,'2018-04-04 22:19:03',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 22:19:03',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 22:19:04',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 22:19:04',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-04 22:19:04',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-04 22:19:05',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 22:19:05',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 22:19:05',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-04 22:19:14',NULL,'/api/v1/worklog/new'),('karezb',1,'2018-04-04 22:19:35',NULL,'/api/v1/worklog/new'),('karezb',1,'2018-04-04 22:20:05','127.0.0.1','/api/v1/worklog/new'),('karezb',1,'2018-04-04 22:20:33',NULL,'/api/v1/worklog/new'),('karezb',1,'2018-04-04 22:28:40',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 22:28:40',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 22:28:41',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 22:28:41',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-04 22:28:41',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-04 22:28:43',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 22:28:43',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 22:28:43',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-04 22:28:50',NULL,'/api/v1/worklog/new'),('karezb',1,'2018-04-04 22:31:25',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 22:31:25',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 22:31:28',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 22:31:28',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-04 22:31:28',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-04 22:31:29',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 22:31:29',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 22:31:29',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-04 22:31:38',NULL,'/api/v1/worklog/new'),('karezb',1,'2018-04-04 22:33:08',NULL,'/api/v1/worklog/new'),('karezb',1,'2018-04-04 22:34:06',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 22:34:06',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-04 22:34:06',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-04 22:34:09',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-04 22:34:09',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 22:34:09',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-04 22:34:10',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 22:34:10',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-04 22:34:10',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 22:34:18',NULL,'/api/v1/worklog/new'),('karezb',1,'2018-04-04 22:35:12',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 22:35:12',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 22:35:12',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 22:35:13',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-04 22:35:13',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-04 22:35:15',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 22:35:15',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 22:35:15',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-04 22:35:23',NULL,'/api/v1/worklog/new'),('karezb',1,'2018-04-04 22:36:15',NULL,'/api/v1/worklog/new'),('karezb',1,'2018-04-04 22:45:28',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 22:45:28',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 22:45:30',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 22:45:30',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-04 22:45:30',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-04 22:45:31',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 22:45:31',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 22:45:31',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-04 22:45:39',NULL,'/api/v1/worklog/new'),('karezb',1,'2018-04-04 22:52:08',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 22:52:08',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 22:52:09',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 22:52:09',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-04 22:52:09',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-04 22:52:11',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 22:52:11',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 22:52:11',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-04 22:52:20',NULL,'/api/v1/worklog/new'),('karezb',1,'2018-04-04 22:53:04',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 22:53:04',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 22:53:05',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 22:53:05',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-04 22:53:05',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-04 22:53:06',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 22:53:06',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 22:53:06',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-04 22:53:15',NULL,'/api/v1/worklog/new'),('karezb',1,'2018-04-04 23:15:55',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 23:15:55',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 23:15:57',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 23:15:58',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-04 23:15:58',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-04 23:16:00',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 23:16:00',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 23:16:00',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-04 23:16:08',NULL,'/api/v1/worklog/new'),('karezb',1,'2018-04-04 23:21:50',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 23:21:50',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 23:21:52',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 23:21:52',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-04 23:21:52',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-04 23:21:54',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 23:21:54',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 23:21:54',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-04 23:22:21',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 23:22:21',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 23:22:22',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 23:22:22',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-04 23:22:22',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-04 23:22:23',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 23:22:23',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 23:22:23',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-04 23:26:21',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 23:26:21',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 23:26:27',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-04 23:26:27',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 23:26:27',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-04 23:26:28',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 23:26:28',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-04 23:26:28',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 23:26:35',NULL,'/api/v1/worklog/new'),('karezb',1,'2018-04-04 23:28:08',NULL,'/api/v1/worklog/new'),('karezb',1,'2018-04-04 23:31:09',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 23:31:09',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 23:31:10',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 23:31:10',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-04 23:31:10',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-04 23:31:12',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 23:31:12',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 23:31:12',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-04 23:31:21',NULL,'/api/v1/worklog/new'),('karezb',1,'2018-04-04 23:32:12',NULL,'/api/v1/worklog/new'),('karezb',1,'2018-04-04 23:32:58',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 23:32:58',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 23:32:59',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 23:32:59',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-04 23:32:59',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-04 23:33:01',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 23:33:01',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 23:33:01',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-04 23:33:09',NULL,'/api/v1/worklog/new'),('karezb',1,'2018-04-04 23:33:31','127.0.0.1','/api/v1/worklog/new'),('karezb',1,'2018-04-04 23:33:52',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 23:33:52',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 23:33:53',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 23:33:53',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-04 23:33:53',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-04 23:33:54',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 23:33:54',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 23:33:54',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-04 23:34:54',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 23:34:54',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 23:34:55',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 23:34:55',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-04 23:34:55',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-04 23:34:57',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 23:34:57',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 23:34:57',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-04 23:35:25',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 23:35:25',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 23:35:26',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 23:35:26',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-04 23:35:26',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-04 23:35:27',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 23:35:27',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 23:35:27',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-04 23:35:34',NULL,'/api/v1/worklog/new'),('karezb',1,'2018-04-04 23:38:37',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 23:38:37',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 23:38:40',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 23:38:40',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-04 23:38:40',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-04 23:38:47',NULL,'/api/v1/worklog/workitems/4'),('karezb',1,'2018-04-04 23:53:55',NULL,'/api/v1/worklog/workitems/4'),('karezb',1,'2018-04-04 23:55:29','127.0.0.1','/api/v1/worklog/workitems/4'),('karezb',1,'2018-04-04 23:56:16',NULL,'/api/v1/worklog/workitems/4'),('karezb',1,'2018-04-04 23:56:40',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 23:56:40',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 23:56:40',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-04 23:56:43',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 23:56:43',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 23:56:44',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 23:56:45',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-04 23:56:45',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-04 23:56:46',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 23:56:46',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 23:56:46',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-04 23:56:56',NULL,'/api/v1/worklog/new'),('karezb',1,'2018-04-04 23:57:41',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 23:57:41',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 23:57:42',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 23:57:42',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-04 23:57:42',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-04 23:57:43',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-04 23:57:43',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-04 23:57:44',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-04 23:57:59',NULL,'/api/v1/worklog/new'),('karezb',1,'2018-04-04 23:59:43',NULL,'/api/v1/worklog/new'),('karezb',1,'2018-04-05 21:27:41',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-05 21:27:41',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-05 21:27:45',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-05 21:27:45',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-05 21:27:45',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-05 21:27:47',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-05 21:27:47',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-05 21:27:47',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-05 21:28:13',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-05 21:28:13',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-05 21:29:05',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-05 21:29:05',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-05 21:29:05',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-05 21:32:51',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-05 21:32:51',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-05 21:32:51',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-05 21:32:58',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-05 21:32:58',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-05 21:33:03',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-05 21:33:03',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-05 21:33:03',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-05 21:33:35',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-05 21:33:35',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-05 21:33:35',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-05 21:35:58',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-05 21:35:58',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-05 21:35:58',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-05 21:36:03',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-05 21:36:03',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-05 21:36:03',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-05 21:36:12',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-05 21:36:12',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-05 21:36:12',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-05 21:36:17',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-05 21:36:17',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-05 21:36:17',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-05 21:36:26',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-05 21:36:26',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-05 21:36:33',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-05 21:36:33',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-05 21:36:33',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-05 21:36:34',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-05 21:36:34',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-05 21:36:34',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-05 21:36:37',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-05 21:36:37',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-05 21:36:37',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-05 21:36:46',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-05 21:36:46',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-05 21:36:46',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-05 21:36:48',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-05 21:36:48',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-05 21:36:48',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-05 21:37:40',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-05 21:37:40',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-05 21:37:40',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-05 21:38:06',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-05 21:38:06',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-05 21:38:06',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-05 21:38:40',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-05 21:38:40',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-05 21:38:40',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-05 21:40:44',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-05 21:40:44',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-05 21:42:18',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-05 21:42:18',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-05 21:42:18',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-05 21:43:11',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-05 21:43:11',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-05 21:43:11',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-05 21:43:16',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-05 21:43:16',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-05 21:43:25',NULL,'/api/v1/claim/1'),('karezb',1,'2018-04-05 21:43:25',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-05 21:43:25',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-05 21:43:29',NULL,'/api/v1/claim/1'),('karezb',1,'2018-04-05 21:43:29',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-05 21:43:29',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-05 21:43:34',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-05 21:43:34',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-05 21:43:34',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-05 21:43:39',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-05 21:43:39',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-05 21:43:41',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-05 21:43:41',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-05 21:43:41',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-05 21:43:48',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-05 21:43:48',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-05 21:43:48',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-05 21:45:11',NULL,'/api/v1/worklog/workitems/4'),('karezb',1,'2018-04-05 22:00:29',NULL,'/api/v1/worklog/workitems/undefined'),('karezb',1,'2018-04-05 22:00:29',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-05 22:00:29',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-05 22:00:29',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-05 22:02:27',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-05 22:02:27',NULL,'/api/v1/worklog/workitems/undefined'),('karezb',1,'2018-04-05 22:02:27',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-05 22:02:27',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-05 22:04:21',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-05 22:04:21',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-05 22:04:21',NULL,'/api/v1/worklog/workitems/undefined'),('karezb',1,'2018-04-05 22:04:21',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-05 22:05:13',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-05 22:05:13',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-05 22:05:13',NULL,'/api/v1/worklog/workitems/4'),('karezb',1,'2018-04-05 22:05:13',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-05 22:12:33',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-05 22:12:33',NULL,'/api/v1/worklog/workitems/4'),('karezb',1,'2018-04-05 22:12:33',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-05 22:12:33',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-05 22:16:42',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-05 22:16:42',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-05 22:16:42',NULL,'/api/v1/worklog/workitems/4'),('karezb',1,'2018-04-05 22:16:42',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-05 22:43:43',NULL,'/api/v1/worklog/workitems/4'),('karezb',1,'2018-04-05 22:43:43',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-05 22:43:43',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-05 22:43:43',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-05 22:48:02',NULL,'/api/v1/claim/9'),('karezb',1,'2018-04-05 22:48:02',NULL,'/api/v1/worklog/workitems/9'),('karezb',1,'2018-04-05 22:48:02',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-05 22:48:02',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-05 22:50:45',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-05 22:50:45',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-05 22:50:45',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-05 22:50:49',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-05 22:50:49',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-07 10:54:38',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-07 10:54:38',NULL,'/api/v1/config/4'),('karezb',1,'2018-04-07 10:54:38',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-07 10:54:43',NULL,'/api/v1/claim/4'),('karezb',1,'2018-04-07 10:54:43',NULL,'/api/v1/worklog/workitems/4'),('karezb',1,'2018-04-07 10:54:43',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-07 10:54:43',NULL,'/api/v1/config/11'),('karezb',1,'2018-04-07 10:55:09',NULL,'/api/v1/claim/username/karezb'),('karezb',1,'2018-04-07 10:55:09',NULL,'/api/v1/config/3'),('karezb',1,'2018-04-07 10:55:09',NULL,'/api/v1/config/4');
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property`
--

LOCK TABLES `property` WRITE;
/*!40000 ALTER TABLE `property` DISABLE KEYS */;
INSERT INTO `property` VALUES (2.00,'1da49d3c-20e7-414a-846f-f44b7857c9d7','Unit 34','20-34 Albert Road','STRATHFIELD','NSW',2135,'AUSTRALIA',2,-33.871677,151.092772,'Unit',10714890000),(3.00,'86e24051-9239-4a02-aed4-7056dbd70b9f','Unit 23','24 Parramatta Street','CRONULLA','NSW',2230,'AUSTRALIA',2,-34.059873,151.153903,'Unit',10724700000),(4.00,'ceb9cda8-8ff0-4572-a4bf-790bf1f20ffc','32-34 Cove Avenue',NULL,'BUNDABAH','NSW',2324,'AUSTRALIA',2,-32.666150,152.064818,NULL,10327570000),(5.00,'fd32a6ff-e98b-44fd-95ab-378672d7da4b','Unit 4','43-45 Neil Street','MERRYLANDS','NSW',2160,'AUSTRALIA',2,-33.833046,150.989745,'Unit',10365680000),(17.00,'cd0673fd-6e0e-4c22-bd54-e4b271025160','Unit 8','43-45 Neil Street','MERRYLANDS','NSW',2160,'AUSTRALIA',2,-33.833046,150.989745,'Unit',10365680000),(18.00,'5bc66dd4-8d4d-49ad-a209-0dfc6cd0143a','234 New Canterbury Road',NULL,'LEWISHAM','NSW',2049,'AUSTRALIA',5,-33.897309,151.148177,NULL,10510210000);
/*!40000 ALTER TABLE `property` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (19,'karezb','Karez','Bartolo','5bcfe00e72a941bf31a1d625e419cd7abba17203',4,NULL,'ktbartolo@up.edu.ph','2018-04-01 12:57:45',NULL,1);
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
 1 AS `attachwhen`*/;
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
INSERT INTO `worklogattachrel` VALUES (2,2),(3,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workloghistory`
--

LOCK TABLES `workloghistory` WRITE;
/*!40000 ALTER TABLE `workloghistory` DISABLE KEYS */;
INSERT INTO `workloghistory` VALUES (2,4.00,1,'2018-04-04 21:46:48','Photo Attachment','',NULL,'2018-04-04 21:46:48'),(3,4.00,1,'2018-04-04 23:35:34','Strata inspection','undefined',NULL,'2018-04-04 23:35:34'),(4,4.00,3,'2018-04-04 23:59:43','Strata inspection','undefined','karezb','2018-04-04 23:59:43');
/*!40000 ALTER TABLE `workloghistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `acebody`
--

USE `acebody`;

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
/*!50001 VIEW `claimdetails` AS select `c`.`claimid` AS `claimid`,`p`.`propertyid` AS `propertyid`,`c`.`property_canonical_id` AS `property_canonical_id`,`p`.`address1` AS `address1`,`p`.`address2` AS `address2`,`p`.`suburb` AS `suburb`,`p`.`state` AS `state`,`p`.`postcode` AS `postcode`,`p`.`country` AS `country`,`p`.`propertytype` AS `propertytypeid`,`ac9`.`longdesc` AS `propertytypename`,`p`.`latitude` AS `latitude`,`p`.`longitude` AS `longitude`,`p`.`mesh_block` AS `mesh_block`,`p`.`unit_type` AS `unit_type`,`c`.`claimtypeid` AS `claimtypeid`,`ac3`.`shortdesc` AS `claimtypename`,`c`.`summary` AS `summary`,`c`.`description` AS `description`,`c`.`submitteddate` AS `submitteddate`,`c`.`submitteduser` AS `submitteduser`,`c`.`status` AS `status`,`ac4`.`longdesc` AS `statusname`,`c`.`reviewstartdate` AS `reviewstartdate`,`c`.`reviewenddate` AS `reviewenddate`,`c`.`approvaldate` AS `approvaldate`,`c`.`authoriseddate` AS `authoriseddate`,`c`.`approveruser` AS `approveruser`,`c`.`processeddate` AS `processeddate` from ((((`claim` `c` join `property` `p` on((`p`.`property_canonical_id` = `c`.`property_canonical_id`))) left join `aceconfig` `ac9` on(((`p`.`propertytype` = `ac9`.`ordinal`) and (`ac9`.`groupid` = 9)))) left join `aceconfig` `ac4` on(((`c`.`status` = `ac4`.`ordinal`) and (`ac4`.`groupid` = 4)))) left join `aceconfig` `ac3` on(((`c`.`claimtypeid` = `ac3`.`ordinal`) and (`ac3`.`groupid` = 3)))) */;
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
/*!50001 VIEW `inspectiondetails` AS select `i`.`inspectionid` AS `inspectionid`,concat(`u`.`firstname`,' ',`u`.`lastname`) AS `customer`,`u`.`emailaddress` AS `emailaddress`,concat(`c`.`address1`,' ',`c`.`address2`,', ',`c`.`suburb`,', ',`c`.`state`,' ',`c`.`postcode`) AS `property`,date_format(`i`.`inspectiondate`,'%M %c, %Y %H:%i:%S, %W') AS `inspectiondate`,`c`.`claimid` AS `claimid`,(select `claim`.`summary` from `claim` where (`claim`.`claimid` = `c`.`claimid`)) AS `summary` from (((`inspection` `i` join `workloghistory` `w` on((`i`.`workitemid` = `w`.`workitemid`))) join `claimdetails` `c` on((`c`.`claimid` = `w`.`worklogid`))) join `user` `u` on((`u`.`username` = `c`.`submitteduser`))) */;
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
/*!50001 VIEW `workitemdetails` AS select `wh`.`workitemid` AS `workitemid`,`wh`.`worklogid` AS `worklogid`,`wh`.`worktype` AS `worktype`,`ac11`.`longdesc` AS `worktypename`,`wh`.`creationdate` AS `creationdate`,`wh`.`description` AS `description`,`wh`.`notes` AS `notes`,`wh`.`auditwho` AS `auditwho`,`wh`.`auditwhen` AS `auditwhen`,`a`.`itemid` AS `itemid`,`a`.`attachment` AS `attachment`,`a`.`type` AS `attachmenttype`,`ac10`.`shortdesc` AS `filetypename`,`a`.`auditwho` AS `attachwho`,`a`.`auditwhen` AS `attachwhen` from ((((`workloghistory` `wh` join `aceconfig` `ac11` on(((`ac11`.`ordinal` = `wh`.`worktype`) and (`ac11`.`groupid` = 11)))) left join `worklogattachrel` `wl` on((`wl`.`workitemid` = `wh`.`workitemid`))) left join `attachment` `a` on((`wl`.`itemid` = `a`.`itemid`))) left join `aceconfig` `ac10` on(((`ac10`.`ordinal` = `a`.`type`) and (`ac11`.`groupid` = 10)))) */;
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

-- Dump completed on 2018-04-07 22:12:09
