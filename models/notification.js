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
    }
};

module.exports = InspectionDTO;