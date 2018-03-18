SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `acebody` ;
CREATE SCHEMA IF NOT EXISTS `acebody` DEFAULT CHARACTER SET latin1 ;
USE `acebody` ;

-- -----------------------------------------------------
-- Table `acebody`.`aceconfig_group`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `acebody`.`aceconfig_group` ;

CREATE  TABLE IF NOT EXISTS `acebody`.`aceconfig_group` (
  `groupid` INT(11) NOT NULL ,
  `description` VARCHAR(50) NULL DEFAULT NULL ,
  `lockflag` ENUM('1','0') NULL DEFAULT NULL ,
  `auditwho` VARCHAR(16) NULL DEFAULT NULL ,
  `auditwhen` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ,
  PRIMARY KEY (`groupid`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `acebody`.`aceconfig`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `acebody`.`aceconfig` ;

CREATE  TABLE IF NOT EXISTS `acebody`.`aceconfig` (
  `groupid` INT(11) NULL DEFAULT NULL ,
  `ordinal` INT(11) NULL DEFAULT NULL ,
  `integer` INT(11) NULL DEFAULT NULL ,
  `float` FLOAT(9,2) NULL DEFAULT NULL ,
  `shortdesc` VARCHAR(20) NULL DEFAULT NULL ,
  `longdesc` VARCHAR(150) NULL DEFAULT NULL ,
  `datetime` DATETIME NULL DEFAULT NULL ,
  `auditwho` VARCHAR(16) NULL DEFAULT NULL ,
  `auditwhen` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ,
  CONSTRAINT `acegroupconfigfk`
    FOREIGN KEY (`groupid` )
    REFERENCES `acebody`.`aceconfig_group` (`groupid` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE INDEX `groupconfigfk_idx` ON `acebody`.`aceconfig` (`groupid` ASC) ;


-- -----------------------------------------------------
-- Table `acebody`.`property`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `acebody`.`property` ;

CREATE  TABLE IF NOT EXISTS `acebody`.`property` (
  `propertyid` FLOAT(9,2) NOT NULL AUTO_INCREMENT ,
  `propertyname` VARCHAR(80) NULL DEFAULT NULL ,
  `address1` VARCHAR(50) NULL DEFAULT NULL ,
  `address2` VARCHAR(50) NULL DEFAULT NULL ,
  `suburb` VARCHAR(25) NULL DEFAULT NULL ,
  `state` VARCHAR(50) NULL DEFAULT NULL ,
  `postcode` INT(11) NULL DEFAULT NULL ,
  `country` VARCHAR(50) NULL DEFAULT NULL ,
  `propertytype` INT(11) NULL DEFAULT NULL ,
  `latitude` INT(11) NULL DEFAULT NULL ,
  `longitude` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`propertyid`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `propertyid_UNIQUE` ON `acebody`.`property` (`propertyid` ASC) ;


-- -----------------------------------------------------
-- Table `acebody`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `acebody`.`user` ;

CREATE  TABLE IF NOT EXISTS `acebody`.`user` (
  `userid` INT(11) NOT NULL AUTO_INCREMENT ,
  `username` VARCHAR(16) NOT NULL ,
  `firstname` VARCHAR(20) NULL DEFAULT NULL ,
  `lastname` VARCHAR(20) NULL DEFAULT NULL ,
  `password` VARCHAR(250) NULL DEFAULT NULL ,
  `roleid` INT(11) NULL DEFAULT NULL ,
  `mobilenumber` VARCHAR(12) NULL DEFAULT NULL ,
  `emailaddress` VARCHAR(50) NULL DEFAULT NULL ,
  `createddate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ,
  `modifieddate` DATETIME NULL DEFAULT NULL ,
  `status` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`userid`) )
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `username_UNIQUE` ON `acebody`.`user` (`username` ASC) ;


-- -----------------------------------------------------
-- Table `acebody`.`claim`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `acebody`.`claim` ;

CREATE  TABLE IF NOT EXISTS `acebody`.`claim` (
  `claimid` FLOAT(9,2) NOT NULL AUTO_INCREMENT,
  `propertyid` FLOAT(9,2) NOT NULL ,
  `claimtypeid` INT(11) NOT NULL ,
  `summary` VARCHAR(150) NULL DEFAULT NULL ,
  `description` TEXT NULL DEFAULT NULL ,
  `submitteddate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ,
  `submitteduser` VARCHAR(16) NOT NULL ,
  `status` INT(11) NULL DEFAULT NULL ,
  `reviewstartdate` DATETIME NULL DEFAULT NULL ,
  `reviewenddate` DATETIME NULL DEFAULT NULL ,
  `approvaldate` DATETIME NULL DEFAULT NULL ,
  `authoriseddate` DATETIME NULL DEFAULT NULL ,
  `approveruser` VARCHAR(16) NULL DEFAULT NULL ,
  `processeddate` DATETIME NULL DEFAULT NULL ,
  PRIMARY KEY (`claimid`) ,
  CONSTRAINT `propertyclaimfk`
    FOREIGN KEY (`propertyid` )
    REFERENCES `acebody`.`property` (`propertyid` ),
  CONSTRAINT `userclaimfk`
    FOREIGN KEY (`submitteduser` )
    REFERENCES `acebody`.`user` (`username` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `claimid_UNIQUE` ON `acebody`.`claim` (`claimid` ASC) ;

CREATE INDEX `userclaimfk_idx` ON `acebody`.`claim` (`submitteduser` ASC) ;

CREATE INDEX `propertyclaimfk_idx` ON `acebody`.`claim` (`propertyid` ASC) ;


-- -----------------------------------------------------
-- Table `acebody`.`assignhistory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `acebody`.`assignhistory` ;

CREATE  TABLE IF NOT EXISTS `acebody`.`assignhistory` (
  `historyid` INT(11) NOT NULL AUTO_INCREMENT ,
  `claimid` FLOAT(9,2) NULL DEFAULT NULL ,
  `action` INT(11) NULL DEFAULT NULL ,
  `username` VARCHAR(16) NULL DEFAULT NULL ,
  `auditwho` VARCHAR(16) NULL DEFAULT NULL ,
  `auditwhen` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ,
  PRIMARY KEY (`historyid`) ,
  CONSTRAINT `claimassignfk`
    FOREIGN KEY (`claimid` )
    REFERENCES `acebody`.`claim` (`claimid` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `userassignfk`
    FOREIGN KEY (`username` )
    REFERENCES `acebody`.`user` (`username` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE INDEX `claimassignfk_idx` ON `acebody`.`assignhistory` (`claimid` ASC) ;

CREATE INDEX `userassignfk_idx` ON `acebody`.`assignhistory` (`username` ASC) ;


-- -----------------------------------------------------
-- Table `acebody`.`attachment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `acebody`.`attachment` ;

CREATE  TABLE IF NOT EXISTS `acebody`.`attachment` (
  `itemid` INT(11) NOT NULL AUTO_INCREMENT ,
  `attachment` VARCHAR(200) NULL DEFAULT NULL ,
  `type` INT(11) NULL DEFAULT NULL ,
  `auditwho` VARCHAR(16) NULL DEFAULT NULL ,
  `auditwhen` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ,
  PRIMARY KEY (`itemid`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `acebody`.`audit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `acebody`.`audit` ;

CREATE  TABLE IF NOT EXISTS `acebody`.`audit` (
  `auditid` INT(11) NOT NULL AUTO_INCREMENT ,
  `referenceid` VARCHAR(20) NULL DEFAULT NULL ,
  `auditkey` INT(11) NULL DEFAULT NULL ,
  `description` VARCHAR(150) NULL DEFAULT NULL ,
  `auditwho` VARCHAR(16) NULL DEFAULT NULL ,
  `auditwhen` DATETIME NULL DEFAULT NULL ,
  PRIMARY KEY (`auditid`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `acebody`.`correspondence`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `acebody`.`correspondence` ;

CREATE  TABLE IF NOT EXISTS `acebody`.`correspondence` (
  `corroid` INT(11) NOT NULL AUTO_INCREMENT ,
  `corrorefid` VARCHAR(12) NULL DEFAULT NULL ,
  `corrotypeid` INT(11) NULL DEFAULT NULL ,
  `subject` VARCHAR(50) NULL DEFAULT NULL ,
  `description` TEXT NULL DEFAULT NULL ,
  `createddate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ,
  `sentdate` DATETIME NULL DEFAULT NULL ,
  `status` INT(11) NULL DEFAULT NULL ,
  `auditwho` VARCHAR(16) NULL DEFAULT NULL ,
  PRIMARY KEY (`corroid`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `acebody`.`custclass`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `acebody`.`custclass` ;

CREATE  TABLE IF NOT EXISTS `acebody`.`custclass` (
  `custclass` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(100) NULL DEFAULT NULL ,
  `abn` VARCHAR(15) NULL DEFAULT NULL ,
  `contactnumber` VARCHAR(12) NULL DEFAULT NULL ,
  `address1` VARCHAR(50) NULL DEFAULT NULL ,
  `address2` VARCHAR(50) NULL DEFAULT NULL ,
  `suburb` VARCHAR(25) NULL DEFAULT NULL ,
  `state` VARCHAR(50) NULL DEFAULT NULL ,
  `postcode` INT(11) NULL DEFAULT NULL ,
  `country` VARCHAR(50) NULL DEFAULT NULL ,
  `auditwho` VARCHAR(16) NULL DEFAULT NULL ,
  `auditwhen` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ,
  PRIMARY KEY (`custclass`) )
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `acebody`.`customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `acebody`.`customer` ;

CREATE  TABLE IF NOT EXISTS `acebody`.`customer` (
  `customerid` INT(11) NOT NULL AUTO_INCREMENT ,
  `customertypeid` INT(11) NULL DEFAULT NULL ,
  `custclass` INT(11) NULL DEFAULT NULL ,
  `username` VARCHAR(16) NOT NULL ,
  `customername` VARCHAR(30) NULL DEFAULT NULL ,
  `address1` VARCHAR(50) NULL DEFAULT NULL ,
  `address2` VARCHAR(50) NULL DEFAULT NULL ,
  `suburb` VARCHAR(25) NULL DEFAULT NULL ,
  `state` VARCHAR(50) NULL DEFAULT NULL ,
  `postcode` INT(11) NULL DEFAULT NULL ,
  `country` VARCHAR(50) NULL DEFAULT NULL ,
  PRIMARY KEY (`customerid`) ,
  CONSTRAINT `custclassfk`
    FOREIGN KEY (`custclass` )
    REFERENCES `acebody`.`custclass` (`custclass` ),
  CONSTRAINT `usercustomerfk`
    FOREIGN KEY (`username` )
    REFERENCES `acebody`.`user` (`username` ))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `customeruser_ux` ON `acebody`.`customer` (`username` ASC) ;

CREATE INDEX `usercustomerfk_idx` ON `acebody`.`customer` (`username` ASC) ;

CREATE INDEX `custclassfk_idx` ON `acebody`.`customer` (`custclass` ASC) ;


-- -----------------------------------------------------
-- Table `acebody`.`customerhistory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `acebody`.`customerhistory` ;

CREATE  TABLE IF NOT EXISTS `acebody`.`customerhistory` (
  `custhistoryid` INT(11) NOT NULL AUTO_INCREMENT ,
  `customerid` INT(11) NULL DEFAULT NULL ,
  `customertype` INT(11) NULL DEFAULT NULL ,
  `customername` VARCHAR(30) NULL DEFAULT NULL ,
  `address1` VARCHAR(50) NULL DEFAULT NULL ,
  `address2` VARCHAR(50) NULL DEFAULT NULL ,
  `suburb` VARCHAR(25) NULL DEFAULT NULL ,
  `state` INT(11) NULL DEFAULT NULL ,
  `postcode` INT(11) NULL DEFAULT NULL ,
  `country` INT(11) NULL DEFAULT NULL ,
  `auditwho` VARCHAR(16) NULL DEFAULT NULL ,
  `auditwhen` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ,
  PRIMARY KEY (`custhistoryid`) ,
  CONSTRAINT `custhistoryfk`
    FOREIGN KEY (`custhistoryid` )
    REFERENCES `acebody`.`customer` (`customerid` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `acebody`.`workloghistory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `acebody`.`workloghistory` ;

CREATE  TABLE IF NOT EXISTS `acebody`.`workloghistory` (
  `workitemid` INT(11) NOT NULL AUTO_INCREMENT ,
  `worklogid` FLOAT(9,2) NULL DEFAULT NULL ,
  `worktype` INT(11) NULL DEFAULT NULL ,
  `creationdate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ,
  `description` VARCHAR(350) NULL DEFAULT NULL ,
  `notes` TEXT NULL DEFAULT NULL ,
  `auditwho` VARCHAR(16) NULL DEFAULT NULL ,
  `auditwhen` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ,
  PRIMARY KEY (`workitemid`) ,
  CONSTRAINT `claimworklogfk`
    FOREIGN KEY (`worklogid` )
    REFERENCES `acebody`.`claim` (`claimid` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE INDEX `claimworklogfk_idx` ON `acebody`.`workloghistory` (`worklogid` ASC) ;


-- -----------------------------------------------------
-- Table `acebody`.`inspection`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `acebody`.`inspection` ;

CREATE  TABLE IF NOT EXISTS `acebody`.`inspection` (
  `inspectionid` INT(11) NOT NULL AUTO_INCREMENT ,
  `workitemid` INT(11) NULL DEFAULT NULL ,
  `description` VARCHAR(200) NULL DEFAULT NULL ,
  `response` INT(11) NULL DEFAULT NULL ,
  `submitteddate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ,
  `responsedate` DATETIME NULL DEFAULT NULL ,
  `inspectiondate` DATETIME NULL DEFAULT NULL ,
  `auditwho` VARCHAR(16) NULL DEFAULT NULL ,
  `auditwhen` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ,
  PRIMARY KEY (`inspectionid`) ,
  CONSTRAINT `workloginspectfk`
    FOREIGN KEY (`workitemid` )
    REFERENCES `acebody`.`workloghistory` (`workitemid` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE INDEX `workloginspectfk_idx` ON `acebody`.`inspection` (`workitemid` ASC) ;


-- -----------------------------------------------------
-- Table `acebody`.`loginhistory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `acebody`.`loginhistory` ;

CREATE  TABLE IF NOT EXISTS `acebody`.`loginhistory` (
  `username` VARCHAR(16) NULL DEFAULT NULL ,
  `actiontype` INT(11) NULL DEFAULT NULL ,
  `eventdate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ,
  `ipaddress` VARCHAR(32) NULL DEFAULT NULL ,
  `page` VARCHAR(255) NULL DEFAULT NULL ,
  CONSTRAINT `useridloginhistfk`
    FOREIGN KEY (`username` )
    REFERENCES `acebody`.`user` (`username` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE INDEX `useridloginhistfk_idx` ON `acebody`.`loginhistory` (`username` ASC) ;


-- -----------------------------------------------------
-- Table `acebody`.`notification`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `acebody`.`notification` ;

CREATE  TABLE IF NOT EXISTS `acebody`.`notification` (
  `notifid` INT(11) NOT NULL AUTO_INCREMENT ,
  `referenceid` VARCHAR(12) NULL DEFAULT NULL ,
  `description` VARCHAR(100) NULL DEFAULT NULL ,
  `fromuserid` VARCHAR(16) NULL DEFAULT NULL ,
  `touserid` VARCHAR(16) NULL DEFAULT NULL ,
  `notifdate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ,
  `notifflag` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`notifid`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `acebody`.`staff`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `acebody`.`staff` ;

CREATE  TABLE IF NOT EXISTS `acebody`.`staff` (
  `staffid` INT(11) NOT NULL AUTO_INCREMENT ,
  `username` VARCHAR(16) NOT NULL ,
  `staffname` VARCHAR(30) NULL DEFAULT NULL ,
  `department` INT(11) NULL DEFAULT NULL ,
  `accesstype` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`staffid`) ,
  CONSTRAINT `userstafffk`
    FOREIGN KEY (`username` )
    REFERENCES `acebody`.`user` (`username` ))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = latin1;

CREATE INDEX `userstafffk_idx` ON `acebody`.`staff` (`username` ASC) ;


-- -----------------------------------------------------
-- Table `acebody`.`verification`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `acebody`.`verification` ;

CREATE  TABLE IF NOT EXISTS `acebody`.`verification` (
  `verifyid` INT(11) NOT NULL AUTO_INCREMENT ,
  `username` VARCHAR(16) NOT NULL ,
  `method` INT(11) NULL DEFAULT NULL ,
  `submitteddate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ,
  `verifykey` VARCHAR(50) NULL DEFAULT NULL ,
  `token` VARCHAR(6) NULL DEFAULT NULL ,
  `status` INT(11) NULL DEFAULT NULL ,
  `processeddate` DATETIME NULL DEFAULT NULL ,
  PRIMARY KEY (`verifyid`) ,
  CONSTRAINT `userverifyfk`
    FOREIGN KEY (`username` )
    REFERENCES `acebody`.`user` (`username` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE INDEX `userverifyfk_idx` ON `acebody`.`verification` (`username` ASC) ;


-- -----------------------------------------------------
-- Table `acebody`.`worklogattachrel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `acebody`.`worklogattachrel` ;

CREATE  TABLE IF NOT EXISTS `acebody`.`worklogattachrel` (
  `workitemid` INT(11) NOT NULL ,
  `itemid` INT(11) NOT NULL ,
  PRIMARY KEY (`workitemid`, `itemid`) ,
  CONSTRAINT `relattachid_FK`
    FOREIGN KEY (`itemid` )
    REFERENCES `acebody`.`attachment` (`itemid` ),
  CONSTRAINT `relworkitemid_FK`
    FOREIGN KEY (`workitemid` )
    REFERENCES `acebody`.`workloghistory` (`workitemid` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE INDEX `relattachid_FK` ON `acebody`.`worklogattachrel` (`itemid` ASC) ;

USE `acebody` ;

-- -----------------------------------------------------
-- Placeholder table for view `acebody`.`claimdetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `acebody`.`claimdetails` (`claimid` INT, `propertyid` INT, `propertyname` INT, `address1` INT, `address2` INT, `suburb` INT, `state` INT, `postcode` INT, `country` INT, `propertytypeid` INT, `propertytypename` INT, `latitude` INT, `longitude` INT, `claimtypeid` INT, `claimtypename` INT, `summary` INT, `description` INT, `submitteddate` INT, `submitteduser` INT, `status` INT, `statusname` INT, `reviewstartdate` INT, `reviewenddate` INT, `approvaldate` INT, `authoriseddate` INT, `approveruser` INT, `processeddate` INT);

-- -----------------------------------------------------
-- Placeholder table for view `acebody`.`workitemdetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `acebody`.`workitemdetails` (`workitemid` INT, `worklogid` INT, `worktype` INT, `worktypename` INT, `creationdate` INT, `description` INT, `notes` INT, `auditwho` INT, `auditwhen` INT, `itemid` INT, `attachment` INT, `attachmenttype` INT, `filetypename` INT, `attachwho` INT, `attachwhen` INT);

-- -----------------------------------------------------
-- procedure sp_validate_user
-- -----------------------------------------------------

USE `acebody`;
DROP procedure IF EXISTS `acebody`.`sp_validate_user`;

DELIMITER $$
USE `acebody`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_validate_user`(IN p_username VARCHAR(16), 
								  IN p_password VARCHAR(200),
								  IN p_actiontype INT,
								  IN p_ipaddress VARCHAR(32),
								  IN p_browser VARCHAR(30),
									OUT p_retcode INT)
exit_prog:BEGIN

declare l_exists int;

set p_retcode = 0;

SELECT COUNT(*) INTO l_exists
FROM user 
WHERE username = p_username AND password = SHA(p_password);

if (l_exists = 1) then
	INSERT INTO loginhistory (username, actiontype, ipaddress, browser)
	VALUES(p_username, p_actiontype, p_ipaddress, p_browser);
	
	if (row_count() = 1) then
		set p_retcode = 1;
		leave exit_prog;
	end if;
end if;

END$$

DELIMITER ;

-- -----------------------------------------------------
-- View `acebody`.`claimdetails`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `acebody`.`claimdetails` ;
DROP TABLE IF EXISTS `acebody`.`claimdetails`;
USE `acebody`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `acebody`.`claimdetails` AS select `c`.`claimid` AS `claimid`,`c`.`propertyid` AS `propertyid`,`p`.`propertyname` AS `propertyname`,`p`.`address1` AS `address1`,`p`.`address2` AS `address2`,`p`.`suburb` AS `suburb`,`p`.`state` AS `state`,`p`.`postcode` AS `postcode`,`p`.`country` AS `country`,`p`.`propertytype` AS `propertytypeid`,`ac9`.`longdesc` AS `propertytypename`,`p`.`latitude` AS `latitude`,`p`.`longitude` AS `longitude`,`c`.`claimtypeid` AS `claimtypeid`,`ac3`.`shortdesc` AS `claimtypename`,`c`.`summary` AS `summary`,`c`.`description` AS `description`,`c`.`submitteddate` AS `submitteddate`,`c`.`submitteduser` AS `submitteduser`,`c`.`status` AS `status`,`ac4`.`longdesc` AS `statusname`,`c`.`reviewstartdate` AS `reviewstartdate`,`c`.`reviewenddate` AS `reviewenddate`,`c`.`approvaldate` AS `approvaldate`,`c`.`authoriseddate` AS `authoriseddate`,`c`.`approveruser` AS `approveruser`,`c`.`processeddate` AS `processeddate` from ((((`acebody`.`claim` `c` join `acebody`.`property` `p` on((`p`.`propertyid` = `c`.`propertyid`))) left join `acebody`.`aceconfig` `ac9` on(((`p`.`propertytype` = `ac9`.`ordinal`) and (`ac9`.`groupid` = 9)))) left join `acebody`.`aceconfig` `ac4` on(((`c`.`status` = `ac4`.`ordinal`) and (`ac4`.`groupid` = 4)))) left join `acebody`.`aceconfig` `ac3` on(((`c`.`claimtypeid` = `ac3`.`ordinal`) and (`ac3`.`groupid` = 3))));

-- -----------------------------------------------------
-- View `acebody`.`workitemdetails`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `acebody`.`workitemdetails` ;
DROP TABLE IF EXISTS `acebody`.`workitemdetails`;
USE `acebody`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `acebody`.`workitemdetails` AS select `wh`.`workitemid` AS `workitemid`,`wh`.`worklogid` AS `worklogid`,`wh`.`worktype` AS `worktype`,`ac11`.`longdesc` AS `worktypename`,`wh`.`creationdate` AS `creationdate`,`wh`.`description` AS `description`,`wh`.`notes` AS `notes`,`wh`.`auditwho` AS `auditwho`,`wh`.`auditwhen` AS `auditwhen`,`a`.`itemid` AS `itemid`,`a`.`attachment` AS `attachment`,`a`.`type` AS `attachmenttype`,`ac10`.`shortdesc` AS `filetypename`,`a`.`auditwho` AS `attachwho`,`a`.`auditwhen` AS `attachwhen` from ((((`acebody`.`workloghistory` `wh` join `acebody`.`worklogattachrel` `wl` on((`wl`.`workitemid` = `wh`.`workitemid`))) join `acebody`.`attachment` `a` on((`wl`.`itemid` = `a`.`itemid`))) join `acebody`.`aceconfig` `ac11` on(((`ac11`.`ordinal` = `wh`.`worktype`) and (`ac11`.`groupid` = 11)))) join `acebody`.`aceconfig` `ac10` on(((`ac10`.`ordinal` = `a`.`type`) and (`ac11`.`groupid` = 10))));


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
