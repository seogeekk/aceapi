/*
   Property model
 */

var db = require('../functions/dbconnect');
var logger = require('../functions/logger');

const PROPERTYTYPE_GID = 9;

var PropertyDTO = {
    createNewProperty: function(propertyObj, callback) {
        logger.info("query: createNewProperty["+propertyObj.propertyname+"]");
        db.query("INSERT INTO property SET ?", [propertyObj], callback);
    },
    updatePropertyDetails: function(propertyObj, callback) {
        // this requires property id to be unique
        logger.info("query: updatePropertyDetails["+propertyObj.propertyid+"]");
        db.query("UPDATE property SET propertyname = ?," +
                                    " address1 = ?," +
                                    " suburb = ?," +
                                    " state = ?," +
                                    " postcode = ?," +
                                    " country = ?," +
                                    " propertytype = ?," +
                                    " latitude = ?," +
                                    " longitude = ?" +
                " WHERE propertyid = ?",
                    [   propertyObj.propertyname,
                        propertyObj.address1,
                        propertyObj.address2,
                        propertyObj.suburb,
                        propertyObj.state,
                        propertyObj.postcode,
                        propertyObj.country,
                        propertyObj.propertytype,
                        propertyObj.latitude,
                        propertyObj.longitude,
                        propertyObj.propertyid
                    ], callback);
    },
    getAllProperties: function(limit, offset, callback) {

        logger.info("query: getAllProperties["+limit+","+offset+"]");
        db.query("SELECT p.propertyid, p.propertyname, p.address1, p.address2, p.suburb, p.state, p.postcode, p.country, p.propertytype as propertytypeid, ac.longdesc as propertytypename, p.latitude, p.longitude " +
            "FROM property p LEFT JOIN aceconfig ac ON ac.ordinal = p.propertytype AND ac.groupid = ? " +
            "LIMIT ?, ?", [PROPERTYTYPE_GID, limit, offset], callback);
    },
    getPropertyDetails: function(propertyid, callback) {

        logger.info("query: getPropertyDetails["+propertyid+"]");
        db.query("SELECT p.propertyid, p.propertyname, p.address1, p.address2, p.suburb, p.state, p.postcode, p.country, p.propertytype as propertytypeid, ac.longdesc as propertytypename, p.latitude, p.longitude " +
            "FROM property p LEFT JOIN aceconfig ac ON ac.ordinal = p.propertytype AND ac.groupid = ? " +
            "WHERE p.propertyid = ?", [PROPERTYTYPE_GID, propertyid], callback);
    }
};

module.exports = PropertyDTO;