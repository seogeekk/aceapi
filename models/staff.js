/*
   Staff model
 */

var db = require('../functions/dbconnect');
var logger = require('../functions/logger');

const STAFFDEPT_GID = 7;
const STAFFACCESS_GID = 8;

var StaffDTO = {
    createNewStaff: function(staffObj, callback) {
        db.query("INSERT INTO staff SET ?", [staffObj], callback);
    },
    updateStaffDetails: function(staffObj, callback) {
        // this requires staff username to be unique
        db.query("UPDATE staff SET staffname = ?, department = ?, accesstype = ? WHERE username = ?",
            [staffObj.staffname, staffObj.department, staffObj.accesstype, staffObj.username], callback);
    },
    getAllStaff: function(limit, offset, callback) {
        logger.info("query: getAllCustomers["+limit+","+offset+"]");
        db.query("SELECT s.staffid, s.username, s.staffname, s.department as departmentid, ac1.longdesc as departmentname, s.accesstype as accesstypeid, ac2.longdesc as accesstypename FROM staff s " +
            "LEFT JOIN aceconfig ac1 ON ac1.ordinal = s.department AND ac1.groupid = ? " +
            "LEFT JOIN aceconfig ac2 ON ac2.ordinal = s.accesstype AND ac2.groupid = ? " +
            "LIMIT ?, ?", [STAFFDEPT_GID, STAFFACCESS_GID, limit, offset], callback);
    },
    getStaffDetails: function(username, callback) {
        logger.info("query: getStaffDetails["+username+"]");
        db.query("SELECT s.staffid, s.username, s.staffname, s.department as departmentid, ac1.longdesc as departmentname, u.mobilenumber, u.emailaddress, s.accesstype as accesstypeid, ac2.longdesc as accesstypename FROM staff s " +
            "LEFT JOIN aceconfig ac1 ON ac1.ordinal = s.department AND ac1.groupid = ? " +
            "LEFT JOIN aceconfig ac2 ON ac2.ordinal = s.accesstype AND ac2.groupid = ? " +
            "JOIN user u ON u.username = s.username " +
            "WHERE s.username = ?", [STAFFDEPT_GID, STAFFACCESS_GID, username], callback);
    },
    searchStaff: function(query, callback) {
        logger.info("query: searchStaff["+query+"]");
        db.query("SELECT s.staffid, s.username, s.staffname, s.department as departmentid, ac1.longdesc as departmentname, u.mobilenumber, u.emailaddress, s.accesstype as accesstypeid, ac2.longdesc as accesstypename FROM staff s " +
            "LEFT JOIN aceconfig ac1 ON ac1.ordinal = s.department AND ac1.groupid = ? " +
            "LEFT JOIN aceconfig ac2 ON ac2.ordinal = s.accesstype AND ac2.groupid = ? " +
            "JOIN user u ON u.username = s.username " +
            "WHERE s.username LIKE ? OR s.staffname LIKE ? LIMIT 10", [STAFFDEPT_GID, STAFFACCESS_GID, '%'+query+'%', '%'+query+'%'], callback);
    }
};

module.exports = StaffDTO;