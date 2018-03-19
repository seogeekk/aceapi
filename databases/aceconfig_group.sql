USE acebody;

SET SQL_SAFE_UPDATES = 0; 
 DELETE FROM aceconfig;
 DELETE FROM aceconfig_group;
SET SQL_SAFE_UPDATES = 1;

SET  @l_user = REPLACE(USER(), '@localhost', '');

SELECT @l_user;

select * from aceconfig_group;
/*
 User Roles
*/
INSERT INTO aceconfig_group
(groupid, description, lockflag, auditwho)
VALUES (1, 'User Roles', '0', @l_user);

INSERT INTO aceconfig (groupid, ordinal, shortdesc, auditwho) 
				VALUES(1, 1, 'Admin', @l_user);
INSERT INTO aceconfig (groupid, ordinal, shortdesc, auditwho) 
				VALUES(1, 2, 'Manager', @l_user);
INSERT INTO aceconfig (groupid, ordinal, shortdesc, auditwho) 
				VALUES(1, 3, 'Staff', @l_user);
INSERT INTO aceconfig (groupid, ordinal, shortdesc, auditwho) 
				VALUES(1, 4, 'Customer', @l_user);
INSERT INTO aceconfig (groupid, ordinal, shortdesc, auditwho) 
				VALUES(1, 5, 'External', @l_user);

select * from aceconfig where groupid = 1;

/*
 Account Status
*/
INSERT INTO aceconfig_group
(groupid, description, lockflag, auditwho)
VALUES (2, 'Account Status', '0', @l_user);

INSERT INTO aceconfig (groupid, ordinal, shortdesc, auditwho) 
				VALUES(2, 1, 'Open', @l_user);
INSERT INTO aceconfig (groupid, ordinal, shortdesc, auditwho) 
				VALUES(2, 2, 'Active', @l_user);
INSERT INTO aceconfig (groupid, ordinal, shortdesc, auditwho) 
				VALUES(2, 3, 'Locked', @l_user);
INSERT INTO aceconfig (groupid, ordinal, shortdesc, auditwho) 
				VALUES(2, 4, 'Deleted', @l_user);

select * from aceconfig where groupid = 2;

/*
 Claim Type
*/
INSERT INTO aceconfig_group
(groupid, description, lockflag, auditwho)
VALUES (3, 'Claim Type', '0', @l_user);

INSERT INTO aceconfig (groupid, ordinal, shortdesc, auditwho) 
				VALUES(3, 1, 'Inquiry', @l_user);
INSERT INTO aceconfig (groupid, ordinal, shortdesc, auditwho) 
				VALUES(3, 2, 'Complaint', @l_user);
INSERT INTO aceconfig (groupid, ordinal, shortdesc, auditwho) 
				VALUES(3, 3, 'Request', @l_user);
INSERT INTO aceconfig (groupid, ordinal, shortdesc, auditwho) 
				VALUES(3, 4, 'Maintenance', @l_user);

select * from aceconfig where groupid = 3;

/*
 Claim Status
*/
INSERT INTO aceconfig_group
(groupid, description, lockflag, auditwho)
VALUES (4, 'Claim Status', '0', @l_user);

INSERT INTO aceconfig (groupid, ordinal, longdesc, auditwho) 
				VALUES(4, 1, 'Open', @l_user);
INSERT INTO aceconfig (groupid, ordinal, longdesc, auditwho) 
				VALUES(4, 2, 'Assigned', @l_user);
INSERT INTO aceconfig (groupid, ordinal, longdesc, auditwho) 
				VALUES(4, 3, 'In Review', @l_user);
INSERT INTO aceconfig (groupid, ordinal, longdesc, auditwho) 
				VALUES(4, 4, 'For Inspection', @l_user);
INSERT INTO aceconfig (groupid, ordinal, longdesc, auditwho) 
				VALUES(4, 5, 'For Approval', @l_user);
INSERT INTO aceconfig (groupid, ordinal, longdesc, auditwho) 
				VALUES(4, 6, 'Scheduled to Action', @l_user);
INSERT INTO aceconfig (groupid, ordinal, longdesc, auditwho) 
				VALUES(4, 7, 'Action Completed', @l_user);
INSERT INTO aceconfig (groupid, ordinal, longdesc, auditwho) 
				VALUES(4, 8, 'Closed', @l_user);
INSERT INTO aceconfig (groupid, ordinal, longdesc, auditwho) 
				VALUES(4, 9, 'Rejected', @l_user);
INSERT INTO aceconfig (groupid, ordinal, longdesc, auditwho) 
				VALUES(4, 10, 'Cancelled', @l_user);

select * from aceconfig where groupid = 4;

/*
 Login History - Action Types
*/
INSERT INTO aceconfig_group
(groupid, description, lockflag, auditwho)
VALUES (5, 'Login - Action Types', '0', @l_user);

INSERT INTO aceconfig (groupid, ordinal, shortdesc, longdesc, auditwho) 
				VALUES(5, 1, 'LOGIN', 'User login', @l_user);
INSERT INTO aceconfig (groupid, ordinal, shortdesc, longdesc, auditwho) 
				VALUES(5, 2, 'LOGOUT', 'User logout', @l_user);

select * from aceconfig where groupid = 5;

/*
 Customer Class
*/
INSERT INTO aceconfig_group
(groupid, description, lockflag, auditwho)
VALUES (6, 'Customer Type', '0', @l_user);

INSERT INTO aceconfig (groupid, ordinal, longdesc, auditwho) 
				VALUES(6, 1, 'Home Owner', @l_user);
INSERT INTO aceconfig (groupid, ordinal, longdesc, auditwho) 
				VALUES(6, 2, 'Body Corporate', @l_user);
INSERT INTO aceconfig (groupid, ordinal, longdesc, auditwho) 
				VALUES(6, 3, 'Tenant', @l_user);
INSERT INTO aceconfig (groupid, ordinal, longdesc, auditwho) 
				VALUES(6, 4, 'Property Manager', @l_user);

select * from aceconfig where groupid = 6;

/*
 Staff Department
*/
SET @l_groupid = 7;
INSERT INTO aceconfig_group
(groupid, description, lockflag, auditwho)
VALUES (@l_groupid, 'Staff Department', '0', @l_user);

INSERT INTO aceconfig (groupid, ordinal, longdesc, auditwho) 
				VALUES(@l_groupid, 1, 'Relationship Management', @l_user);
INSERT INTO aceconfig (groupid, ordinal, longdesc, auditwho) 
				VALUES(@l_groupid, 2, 'Insurance', @l_user);
INSERT INTO aceconfig (groupid, ordinal, longdesc, auditwho) 
				VALUES(@l_groupid, 3, 'Legal', @l_user);
INSERT INTO aceconfig (groupid, ordinal, longdesc, auditwho) 
				VALUES(@l_groupid, 4, 'Marketing', @l_user);

select * from aceconfig where groupid = @l_groupid;

/*
 Staff Access Type
*/
SET @l_groupid = 8;
INSERT INTO aceconfig_group
(groupid, description, lockflag, auditwho)
VALUES (@l_groupid, 'Staff Access Type', '0', @l_user);

INSERT INTO aceconfig (groupid, ordinal, longdesc, auditwho) 
				VALUES(@l_groupid, 1, 'Staff', @l_user);
INSERT INTO aceconfig (groupid, ordinal, longdesc, auditwho) 
				VALUES(@l_groupid, 2, 'Manager', @l_user);
INSERT INTO aceconfig (groupid, ordinal, longdesc, auditwho) 
				VALUES(@l_groupid, 3, 'Approver', @l_user);
INSERT INTO aceconfig (groupid, ordinal, longdesc, auditwho) 
				VALUES(@l_groupid, 4, 'Head', @l_user);

select * from aceconfig where groupid = @l_groupid;

/*
  Property Type
*/
SET @l_groupid = 9;
INSERT INTO aceconfig_group
(groupid, description, lockflag, auditwho)
VALUES (@l_groupid, 'Property Type', '0', @l_user);

INSERT INTO aceconfig (groupid, ordinal, longdesc, auditwho) 
				VALUES(@l_groupid, 1, 'House', @l_user);
INSERT INTO aceconfig (groupid, ordinal, longdesc, auditwho) 
				VALUES(@l_groupid, 2, 'Unit - Apartment', @l_user);
INSERT INTO aceconfig (groupid, ordinal, longdesc, auditwho) 
				VALUES(@l_groupid, 3, 'Commercial', @l_user);
INSERT INTO aceconfig (groupid, ordinal, longdesc, auditwho) 
				VALUES(@l_groupid, 4, 'Strata Property', @l_user);

select * from aceconfig where groupid = @l_groupid;

/*
  Attachment Type
*/
SET @l_groupid = 10;
INSERT INTO aceconfig_group
(groupid, description, lockflag, auditwho)
VALUES (@l_groupid, 'Attachment Type', '0', @l_user);

INSERT INTO aceconfig (groupid, ordinal, shortdesc, auditwho) 
				VALUES(@l_groupid, 1, 'jpg', @l_user);
INSERT INTO aceconfig (groupid, ordinal, shortdesc, auditwho) 
				VALUES(@l_groupid, 2, 'pdf', @l_user);
INSERT INTO aceconfig (groupid, ordinal, shortdesc, auditwho) 
				VALUES(@l_groupid, 3, 'doc', @l_user);

select * from aceconfig where groupid = @l_groupid;

/*
  Work Type
*/
SET @l_groupid = 11;
INSERT INTO aceconfig_group
(groupid, description, lockflag, auditwho)
VALUES (@l_groupid, 'Work Type', '0', @l_user);

INSERT INTO aceconfig (groupid, ordinal, longdesc, auditwho) 
				VALUES(@l_groupid, 1, 'Work Log Details', @l_user);
INSERT INTO aceconfig (groupid, ordinal, longdesc, auditwho) 
				VALUES(@l_groupid, 2, 'Inspection', @l_user);
INSERT INTO aceconfig (groupid, ordinal, longdesc, auditwho) 
				VALUES(@l_groupid, 3, 'Service Log', @l_user);

select * from aceconfig where groupid = @l_groupid;