/*
   Claim model
 */

var db = require('../functions/dbconnect');
var logger = require('../functions/logger');

const CLAIMTYPE_GID = 3;
const CLAIMSTATUS_GID = 4;

var ClaimDTO = {
    createNewClaim: function(claimObj, callback) {

        logger.info("query: createNewClaim[]");
        console.log(claimObj);
        db.query("INSERT INTO claim (property_canonical_id, claimtypeid, summary, description, submitteduser, status)" +
            "VALUES(?, ?, ?, ?, ?, ?)",
            [
                claimObj.property_canonical_id,
                claimObj.claimtypeid,
                claimObj.summary,
                claimObj.description,
                claimObj.submitteduser,
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
                        "submitteduser = ?," +
                        "status = ?," +
                        "reviewstartdate = ?," +
                        "reviewenddate = ?," +
                        "approvaldate = ?," +
                        "authoriseddate = ?," +
                        "approveruser = ?," +
                        "processeddate = ? " +
                    "WHERE claimid = ?",
                        [
                            claimObj.property_canonical_id,
                            claimObj.claimtypeid,
                            claimObj.summary,
                            claimObj.description,
                            claimObj.submitteduser,
                            claimObj.status,
                            claimObj.reviewstartdate,
                            claimObj.reviewenddate,
                            claimObj.approvaldate,
                            claimObj.authoriseddate,
                            claimObj.approveuser,
                            claimObj.processeddate,
                            claimObj.claimid
                        ], callback);
    },
    getAllClaims: function(limit, offset, callback) {

        logger.info("query: getAllClaims["+limit+","+offset+"]");
        db.query("SELECT claimid," +
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
                        "status," +
                        "statusname," +
                        "reviewstartdate," +
                        "reviewenddate," +
                        "approvaldate," +
                        "authoriseddate," +
                        "approveruser," +
                        "processeddate " +
                    "FROM claimdetails " +
                        "LIMIT ?, ?", [limit, offset], callback);
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
                        "status," +
                        "statusname," +
                        "reviewstartdate," +
                        "reviewenddate," +
                        "approvaldate," +
                        "authoriseddate," +
                        "approveruser," +
                        "processeddate " +
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
            "status," +
            "statusname," +
            "reviewstartdate," +
            "reviewenddate," +
            "approvaldate," +
            "authoriseddate," +
            "approveruser," +
            "processeddate " +
            "FROM claimdetails " +
            "WHERE submitteduser = ?", [username], callback);
    },

    getAssignment: function(claimid, callback) {
        return db.query("SELECT a.username, s.staffname FROM assignhistory a " +
            "JOIN staff s ON s.username = a.username " +
            "WHERE a.claimid = ? ORDER BY a.auditwhen DESC LIMIT 1", [claimid], callback);
    },
    assignClaim: function(username, claimid, auditwho, callback) {

        return db.query("SELECT username FROM assignhistory WHERE claimid = ? ORDER BY auditwhen DESC LIMIT 1", [claimid], function(error, results) {
            if(error) {
                callback(error);
            }
            if (results) {
                var lastuser = results[0].username;
                if (username == lastuser) {
                    // we shouldn't assign any
                    callback(null, results);
                } else {
                    return db.query("INSERT INTO assignhistory (claimid, username, auditwho) " +
                        "VALUES(?, ?, ?)", [claimid, username, auditwho], callback);
                }
            }
        })
    }
};

module.exports = ClaimDTO;