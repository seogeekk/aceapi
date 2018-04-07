/*
   Property model
 */

var db = require('../functions/dbconnect');
var logger = require('../functions/logger');

const PROPERTYTYPE_GID = 9;

var PropertyDTO = {
    createNewProperty: function(propertyObj, callback) {
        logger.info("query: createNewProperty["+propertyObj+"]");
        db.query("INSERT INTO property (property_canonical_id, address1, address2, suburb, state, postcode, country, propertytype, latitude, longitude, unit_type, mesh_block) " +
            "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
            [
                propertyObj.property_canonical_id,
                propertyObj.address1,
                propertyObj.address2,
                propertyObj.suburb,
                propertyObj.state,
                propertyObj.postcode,
                propertyObj.country,
                propertyObj.propertytype,
                propertyObj.latitude,
                propertyObj.longitude,
                propertyObj.unit_type,
                propertyObj.mesh_block
            ], callback);
    },
    updatePropertyDetails: function(propertyObj, callback) {
        // this requires property id to be unique
        logger.info("query: updatePropertyDetails["+propertyObj.propertyid+"]");
        db.query("UPDATE property SET address1 = ?," +
                                    " address2 = ?," +
                                    " suburb = ?," +
                                    " state = ?," +
                                    " postcode = ?," +
                                    " country = ?," +
                                    " propertytype = ?," +
                                    " latitude = ?," +
                                    " longitude = ?," +
                                    " mesh_block = ?," +
                                    " unit_type = ?" +
                " WHERE property_canonical_id = ?",
                    [   propertyObj.address1,
                        propertyObj.address2,
                        propertyObj.suburb,
                        propertyObj.state,
                        propertyObj.postcode,
                        propertyObj.country,
                        propertyObj.propertytype,
                        propertyObj.latitude,
                        propertyObj.longitude,
                        propertyObj.mesh_block,
                        propertyObj.unit_type,
                        propertyObj.property_canonical_id
                    ], callback);
    },
    getAllProperties: function(limit, offset, callback) {

        logger.info("query: getAllProperties["+limit+","+offset+"]");
        db.query("SELECT p.propertyid, p.property_canonical_id, p.address1, p.address2, p.suburb, p.state, p.postcode, p.country, p.propertytype as propertytypeid, ac.longdesc as propertytypename, p.latitude, p.longitude, p.mesh_block, p.unit_type " +
            "FROM property p LEFT JOIN aceconfig ac ON ac.ordinal = p.propertytype AND ac.groupid = ? " +
            "LIMIT ?, ?", [PROPERTYTYPE_GID, limit, offset], callback);
    },
    getPropertyDetails: function(propertyid, callback) {

        logger.info("query: getPropertyDetails["+property_canonical_id+"]");
        db.query("SELECT p.propertyid, p.property_canonical_id, p.address1, p.address2, p.suburb, p.state, p.postcode, p.country, p.propertytype as propertytypeid, ac.longdesc as propertytypename, p.latitude, p.longitude, p.mesh_block, p.unit_type " +
            "FROM property p LEFT JOIN aceconfig ac ON ac.ordinal = p.propertytype AND ac.groupid = ? " +
            "WHERE p.propertyid = ?", [PROPERTYTYPE_GID, propertyid], callback);
    },
    getPropertyByCanonical: function(canonicalid, callback) {

        logger.info("query: getPropertyDetails["+canonicalid+"]");
        db.query("SELECT p.propertyid, p.property_canonical_id, p.address1, p.address2, p.suburb, p.state, p.postcode, p.country, p.propertytype as propertytypeid, ac.longdesc as propertytypename, p.latitude, p.longitude, p.mesh_block, p.unit_type " +
            "FROM property p LEFT JOIN aceconfig ac ON ac.ordinal = p.propertytype AND ac.groupid = ? " +
            "WHERE p.property_canonical_id = ?", [PROPERTYTYPE_GID, canonicalid], callback);
    }
};

module.exports = PropertyDTO;