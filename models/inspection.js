/*
   Property model
 */

var db = require('../functions/dbconnect');
var logger = require('../functions/logger');

const RESPONSETYPE_GID = 12;

var datetime = require('node-datetime');

var InspectionDTO = {
    createNewInspection: function(inspectionObj, callback) {
        logger.info("query: createNewInspection["+inspectionObj.workitemid+"]");
        var now = datetime.create();
        var auditdate = now.format("Y-m-d H:M:S");
        db.query("INSERT INTO inspection (workitemid, description, inspectiondate, auditwho, auditwhen) " +
                    "VALUES(?,?,?,?,?)",
                    [
                        inspectionObj.workitemid,
                        inspectionObj.description,
                        inspectionObj.inspectiondate,
                        inspectionObj.auditwho,
                        auditdate
                    ], callback);
    },
    updateInspectionDetail: function(inspectionObj, callback) {
        logger.info("query: updateInspection");
        var now = datetime.create();
        var auditdate = now.format("Y-m-d H:M:S");
        db.query("UPDATE inspection " +
                "SET description = ?," +
                "inspectiondate = ?," +
                "auditwho = ?," +
                "auditwhen = ? " +
                "WHERE inspectionid = ?", [
                    inspectionObj.description,
                    inspectionObj.inspectiondate,
                    inspectionObj.auditwho,
                    auditdate,
                    inspectionObj.inspectionid
                ], callback);
    },
    updateInspectionStatus: function(inspectionid, response, callback) {
        logger.info("query: updateInspectionStatus[" + inspectionid + "]");
        var now = datetime.create();
        var auditdate = now.format("Y-m-d H:M:S");
        db.query("UPDATE inspection " +
                "SET response = ?," +
                    "responsedate = ? " +
                    "WHERE inspectionid = ?", [
                        response,
                        auditdate,
                        inspectionid
                    ], callback);
    },
    getInspectionDetailsByWorkItem: function(workitemid, callback) {
        logger.info("query: getInspectionDetailsByWorkItem["+workitemid+"]");
        db.query("SELECT inspectionid, description, response as responseid, ac12.longdesc as responsename, submitteddate, responsedate, inspectiondate, auditwho, auditwhen " +
            "FROM inspection i JOIN aceconfig ac12 ON ac12.ordinal = i.response AND ac12.groupid = ? WHERE workitemid = ?", [RESPONSETYPE_GID, workitemid], callback);
    },
    getInspectionDetailsById: function(inspectionid, callback) {
        logger.info("query: getInspectionDetailsById["+inspectionid+"]");
        db.query("SELECT workitemid, description, response as responseid, ac12.longdesc as responsename, submitteddate, responsedate, inspectiondate, auditwho, auditwhen " +
            "FROM inspection i JOIN aceconfig ac12 ON ac12.ordinal = i.response AND ac12.groupid = ? WHERE inspectionid = ?", [RESPONSETYPE_GID, inspectionid], callback);
    },
    getInspectionDetailsByToken: function(token, callback) {
        logger.info("query: getInspectionDetailsByToken["+token+"]");
        db.query("SELECT inspectionid, valid, response, responsedate, inspectiondate, claimid, description, address1, address2, suburb, state, postcode, latitude, longitude " +
            "FROM inspectiondetails WHERE token = ?", [token], callback);
    },
    validateToken: function(token, callback) {
        logger.info("query: validateToken["+token+"]");
        db.query("SELECT inspectionid FROM inspection WHERE token = ?", [token], callback);
    }
};

module.exports = InspectionDTO;