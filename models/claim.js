/*
   Claim model
 */

var db = require('../functions/dbconnect');
var logger = require('../functions/logger');

const CLAIMTYPE_GID = 3;
const CLAIMSTATUS_GID = 4;

var datetime = require('node-datetime');


var ClaimDTO = {
    createNewClaim: function(claimObj, callback) {
        logger.info("query: createNewClaim[]");
        db.query("INSERT INTO claim (property_canonical_id, claimtypeid, summary, description, submitteduser, auditwho, status)" +
            "VALUES(?, ?, ?, ?, ?, ?, ?)",
            [
                claimObj.property_canonical_id,
                claimObj.claimtypeid,
                claimObj.summary,
                claimObj.description,
                claimObj.submitteduser,
                claimObj.auditwho,
                claimObj.status
            ], callback);
    },
    updateClaimDetails: function(claimObj, callback) {
        // this requires claimid to be unique
        logger.info("query: updateClaimDetails["+claimObj.claimid+"]");
        db.query("UPDATE claim " +
                    "SET property_canonical_id = ?," +
                        "claimtypeid = ?," +
                        "summary = ?," +
                        "description = ?," +
                        "submitteduser = ? ," +
                        "auditwho = ? " +
                    "WHERE claimid = ?",
                        [
                            claimObj.property_canonical_id,
                            claimObj.claimtypeid,
                            claimObj.summary,
                            claimObj.description,
                            claimObj.submitteduser,
                            claimObj.auditwho,
                            claimObj.claimid
                        ], callback);
    },
    getAllClaims: function(startdate, enddate, callback) {

        var now = datetime.create(startdate);
        startdate = now.format("Y-m-d H:M:S");
        now = datetime.create(enddate);
        enddate = now.format("Y-m-d H:M:S");

        logger.info("query: getAllClaims[]");
        if (startdate == enddate) {
            db.query("SELECT c.claimid," +
                "c.property_canonical_id," +
                "c.propertyid," +
                "c.address1," +
                "c.address2," +
                "c.suburb," +
                "c.state," +
                "c.postcode," +
                "c.country," +
                "c.propertytypeid," +
                "c.propertytypename," +
                "c.latitude," +
                "c.longitude," +
                "c.mesh_block," +
                "c.unit_type," +
                "c.claimtypeid," +
                "c.claimtypename," +
                "c.summary," +
                "c.description," +
                "c.submitteddate," +
                "c.submitteduser," +
                "c.submittedname," +
                "ca.assignusername," +
                "ca.assignname," +
                "c.status," +
                "c.statusname," +
                "c.approvaldate," +
                "c.approveruser," +
                "c.auditwho " +
                "FROM claimdetails c " +
                "LEFT JOIN claimassigndetails ca ON ca.claimid = c.claimid "
                , callback);
        } else {
            db.query("SELECT c.claimid," +
                "c.property_canonical_id," +
                "c.propertyid," +
                "c.address1," +
                "c.address2," +
                "c.suburb," +
                "c.state," +
                "c.postcode," +
                "c.country," +
                "c.propertytypeid," +
                "c.propertytypename," +
                "c.latitude," +
                "c.longitude," +
                "c.mesh_block," +
                "c.unit_type," +
                "c.claimtypeid," +
                "c.claimtypename," +
                "c.summary," +
                "c.description," +
                "c.submitteddate," +
                "c.submitteduser," +
                "c.submittedname," +
                "ca.assignusername," +
                "ca.assignname," +
                "c.status," +
                "c.statusname," +
                "c.approvaldate," +
                "c.approveruser," +
                "c.auditwho " +
                "FROM claimdetails c " +
                "LEFT JOIN claimassigndetails ca ON ca.claimid = c.claimid " +
                "WHERE c.submitteddate BETWEEN ? AND ?",
                [startdate, enddate]    , callback);
        }
    },
    getClaimDetails: function(claimid, callback) {
        logger.info("query: getClaimDetails["+claimid+"]");
        db.query("SELECT claimid," +
                        "propertyid," +
                        "property_canonical_id," +
                        "address1," +
                        "address2," +
                        "suburb," +
                        "state," +
                        "postcode," +
                        "country," +
                        "propertytypeid," +
                        "propertytypename," +
                        "latitude," +
                        "longitude," +
                        "mesh_block," +
                        "unit_type," +
                        "claimtypeid," +
                        "claimtypename," +
                        "summary," +
                        "description," +
                        "submitteddate," +
                        "submitteduser," +
                        "submittedname," +
                        "status," +
                        "statusname," +
                        "approvaldate," +
                        "approveruser," +
                        "auditwho " +
                        "FROM claimdetails " +
                        "WHERE claimid = ?", [claimid], callback);
    },
    getClaimByUser: function(username, callback) {
        logger.info("query: getClaimByUser["+username+"]");
        db.query("SELECT claimid," +
                        "propertyid," +
                        "property_canonical_id," +
                        "address1," +
                        "address2," +
                        "suburb," +
                        "state," +
                        "postcode," +
                        "country," +
                        "propertytypeid," +
                        "propertytypename," +
                        "latitude," +
                        "longitude," +
                        "mesh_block," +
                        "unit_type," +
                        "claimtypeid," +
                        "claimtypename," +
                        "summary," +
                        "description," +
                        "submitteddate," +
                        "submitteduser," +
                        "submittedname," +
                        "status," +
                        "statusname," +
                        "approvaldate," +
                        "approveruser," +
                        "auditwho " +
                    "FROM claimdetails " +
                    "WHERE submitteduser = ?", [username], callback);
    },
    getAssignedByUser: function(username, callback) {
        logger.info("query: getAssignedByUser(" +username + ")");
        db.query("SELECT claimid, assignuser, assignname, auditwhen " +
            "FROM claimassigndetails " +
            "WHERE username = ?", [username], callback);
    },
    getAssignment: function(claimid, callback) {
        logger.info("query: getAssignment("+claimid+")");
        db.query("SELECT a.username, s.staffname FROM assignhistory a " +
                    "JOIN staff s ON s.username = a.username " +
                    "WHERE a.claimid = ? ORDER BY a.auditwhen DESC LIMIT 1", [claimid], callback);
    },
    assignClaim: function(username, claimid, auditwho, callback) {
        logger.info("query: assignClaim()");
        db.query("SELECT username FROM assignhistory WHERE claimid = ? ORDER BY auditwhen DESC LIMIT 1", [claimid], function(error, results) {
            if(error) {
                logger.error("query: assignClaim() - select");
                callback(error);
            }
            if (results.length == 1) {
                var lastuser = results[0].username;
                if (username == lastuser) {
                    // we shouldn't assign any
                    callback(null, results);
                } else {
                    logger.info("query: assignClaim() - insert");
                    db.query("INSERT INTO assignhistory (claimid, username, auditwho) " +
                        "VALUES(?, ?, ?)", [claimid, username, auditwho], function(error, assign) {
                        if (error) {
                            callback(error);
                        } else {
                            callback(null, assign);
                        }
                    });
                }
            }else {
                logger.info("query: assignClaim() - insert");
                db.query("INSERT INTO assignhistory (claimid, username, auditwho) " +
                    "VALUES(?, ?, ?)", [claimid, username, auditwho], function(error, assign) {
                    if (error) {
                        callback(error);
                    } else {
                        callback(null, assign);
                    }
                });
            }
        })
    },
    updateClaimStatus: function(claimid, status, callback) {
        logger.info("query: updateClaimStatus("+claimid+")");
        db.query("UPDATE claim SET status = ? WHERE claimid = ?", [status, claimid], callback);
    },
    approveClaim: function(claimid, username, callback) {
        var now = datetime.create();
        var auditdate = now.format("Y-m-d H:M:S");

        logger.info("query: approveClaim("+claimid+")");
        db.query("UPDATE claim SET approvaldate = ?, approveruser = ? WHERE claimid = ?", [auditdate, username, claimid], callback);
    },
    getSuburbStat: function(reportdate, callback) {
        var now = datetime.create(reportdate);
        var querydate = now.format("Y-m-d H:M:S");

        logger.info("query: getSuburbStat("+querydate+")");
        db.query("SELECT suburb, allrequest, openrequest " +
                "FROM suburbstat " +
            "WHERE year = year(?)", [querydate], callback);
    },
    getCompletionStat: function(reportdate, callback) {
        var now = datetime.create(reportdate);
        var querydate = now.format("Y-m-d H:M:S");

        logger.info("query: getCompletionStat("+querydate+")");
        db.query("SELECT IFNULL(allrequests,0) allrequests, ROUND(IFNULL(avgcompleted,0),0) avgcompleted, ROUND(IFNULL(pcntcompleted,0),2) pcntcompleted, ROUND(IFNULL(avgduration,0),0) avgduration " +
            "FROM requestcompletionstat " +
            "WHERE year = year(?)", [querydate], callback);
    },
    getRequestTypeStat: function(reportdate, callback) {
        var now = datetime.create(reportdate);
        var querydate = now.format("Y-m-d H:M:S");

        logger.info("query: getCompletionStat("+querydate+")");
        db.query("SELECT ac.shortdesc requesttype, count(c.claimid) count " +
                "FROM aceconfig ac " +
                "LEFT JOIN claimdetails c ON c.claimtypeid = ac.ordinal " +
                "AND year(c.submitteddate) = year(?) " +
                "WHERE ac.groupid = 3 " +
            "GROUP BY ac.shortdesc", [querydate], callback);
    },
    getRequestCountStat: function(reportdate, callback) {
        var now = datetime.create(reportdate);
        var querydate = now.format("Y-m-d H:M:S");

        logger.info("query: getRequestCountStat("+querydate+")");
        db.query("SELECT allrequests, openrequests, closedrequests, rejectedrequests, cancelledrequests, closed1d, closed1w, closedgt1w " +
            "FROM requestcountstat " +
            "WHERE year = year(?)", [querydate], callback);
    },
    getRequestDurationStat: function(reportdate, callback) {
        var now = datetime.create(reportdate);
        var querydate = now.format("Y-m-d H:M:S");

        logger.info("query: getRequestDurationStat("+querydate+")");
        db.query("SELECT c.claimid, ac.longdesc status, c.startdate, c.enddate, c.duration " +
            "FROM claimdurationstat c " +
            "JOIN aceconfig ac ON ac.ordinal = c.status " +
            "AND ac.groupid = 4 " +
            "WHERE c.year = year(?) AND c.month = month(?)", [querydate, querydate], callback);
    },
    getClaimByProperty: function(property_canonical_id, callback) {

        logger.info("query: getClaimByProperty("+property_canonical_id+")");
        db.query("SELECT claimid, summary, claimtypename, submitteddate " +
            "FROM claimdetails " +
            "WHERE property_canonical_id = ?", [property_canonical_id], callback);
    },
    getClaimByStaff: function(username, callback) {

        logger.info("query: getClaimByUser("+username+")");
        db.query("SELECT c.claimid, c.summary, c.claimtypename, c.submitteddate " +
            "FROM claimdetails c " +
            "JOIN claimassigndetails ca ON ca.claimid = c.claimid " +
            "WHERE ca.assignusername = ?", [username], callback);
    }
};

module.exports = ClaimDTO;