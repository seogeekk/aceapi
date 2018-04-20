/*
   Property model
 */

var db = require('../functions/dbconnect');
var logger = require('../functions/logger');

const RESPONSETYPE_GID = 12;

var datetime = require('node-datetime');

var InspectionDTO = {
    insertInspectionToken: function(inspectionid, token, callback) {
        logger.info("query: insertInspectionToken["+inspectionid+"]");
        return db.query("UPDATE inspection SET token = ? WHERE workitemid = ?", [token, inspectionid], callback);
    },
    getContactDetails: function(username, callback) {
        logger.info("query: getContactDetails["+username+"]");
        return db.query("SELECT emailaddress, mobilenumber FROM user WHERE username = ?", [username], callback);
    },
    getUserDashboard: function(username, callback) {
        db.query("SELECT c.submitteduser, COUNT(DISTINCT c.claimid) as requests, COUNT(i.inspectionid) as inspections, COUNT(distinct(property_canonical_id)) as properties " +
            "FROM claimdetails c " +
            "LEFT JOIN inspectiondetails i ON i.claimid = c.claimid and i.inspectiondate >= CURRENT_DATE " +
            "WHERE c.submitteduser = ?" +
            "GROUP BY c.submitteduser", [username], callback);
    },
    getStaffDashboard: function(username, callback) {
        db.query("SELECT ca.assignusername, " +
                        "(select count(1) from claim) as allrequests, " +
                        "(select count(1) from claim where status < 7) as openrequests, " +
                        "(select count(1) from claim where status = 4) as allapprovals, " +
                        "(select count(1) from property) as allproperties, " +
                        "COUNT(CASE WHEN c.status = 4 THEN 1 ELSE null END) as forapprovals, " +
                        "COUNT(DISTINCT c.claimid) as requests, " +
                        "COUNT(i.inspectionid) as inspections, " +
                        "COUNT(distinct(property_canonical_id)) as properties " +
                "FROM claimassigndetails ca " +
                "JOIN claim c ON c.claimid = ca.claimid " +
                "LEFT JOIN inspectiondetails i ON i.claimid = c.claimid AND i.inspectiondate >= CURRENT_DATE " +
                "WHERE ca.assignusername = ? " +
                "GROUP BY ca.assignusername", username, callback);
    },
    getStaffCalendar: function(username, callback) {
        db.query("SELECT i.claimid, i.description, i.inspectiondate " +
                "FROM inspectiondetails i " +
                "JOIN claimassigndetails ca ON ca.claimid = i.claimid " +
                "WHERE i.inspectiondate >= CURRENT_DATE " +
                "AND ca.assignusername = ?", [username], callback);
    }
};

module.exports = InspectionDTO;