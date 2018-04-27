-- MySQL dump 10.13  Distrib 5.7.19, for Win64 (x86_64)
--
-- Host: localhost    Database: acebody
-- ------------------------------------------------------
-- Server version	5.7.19

DROP SCHEMA IF EXISTS `acebody` ;
CREATE SCHEMA IF NOT EXISTS `acebody` DEFAULT CHARACTER SET latin1 ;
USE `acebody` ;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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

-- -----------------------------------------------------
-- Insert admin user (Super User)
-- -----------------------------------------------------
INSERT INTO user (username, firstname, lastname, password, roleid, emailaddress, status)
VALUES('aceadmin', 'Ace', 'Admin', SHA('memoday'), 1, 'ktbartolo@up.edu.ph', 2);
INSERT INTO staff(username, staffname, department, accesstype)
VALUES('aceadmin', 'Ace Admin', 1, 1);

-- Dump completed on 2018-04-27 22:56:55
