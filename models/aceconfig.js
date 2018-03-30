/*
   Ace Config model
 */

var db = require('../functions/dbconnect');
var logger = require('../functions/logger');

var AceConfigDTO = {
    getGroupid: function(groupid, callback) {

        logger.info("query: getGroupid["+groupid+"]");
        db.query("SELECT ordinal, shortdesc, longdesc " +
            "FROM aceconfig WHERE groupid = ?", [groupid], callback);
    },
    getOrdinal: function(groupid, ordinal, callback) {

        logger.info("query: getOrdinal["+groupid+", "+ ordinal + "]");
        db.query("SELECT ordinal, shortdesc, longdesc " +
            "FROM aceconfig WHERE groupid = ? AND ordinal = ?", [groupid, ordinal], callback);
    }
};

module.exports = AceConfigDTO;