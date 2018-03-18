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
        db.query("INSERT INTO claim SET ?", [claimObj], callback);
    },
    updateClaimDetails: function(claimObj, callback) {
        // this requires claimid to be unique

        logger.info("query: updateClaimDetails["+claimObj.claimid+"]");
        db.query("UPDATE claim " +
                    "SET propertyid = ?," +
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
                            claimObj.propertyid,
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
                        "propertyid," +
                        "propertyname," +
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
                        "propertyname," +
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
                        "processeddate" +
                        "FROM claimdetails " +
                        "WHERE claimid = ?", [claimid], callback);
    },
    getClaimByParam: function(username, status, callback) {

    }
};

module.exports = ClaimDTO;