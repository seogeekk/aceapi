/*
 Property Handler
 */


var property = require('../../models/property');
var constants = require('../../functions/constants');
var errhandler = require('../../objects/apperror-object');
var restobj = require('../../objects/rest-object');

// Objects
var propertyObj = require('../../objects/property-object').Property;
var propertyDetObj = require('../../objects/property-object').PropertyDetail;

// Logger
var logger = require('../../functions/logger');

function parseError(error) {
    switch (error.code) {
        default:
            logger.error(error.code + ": " + error.message);
            return new errhandler(error.code, error.message, error.stack)
    }
    return null;
}


var PropertyHandler = {
    createNewProperty: function(req, res, next) {
        // create new instance of propertyObj
        var Property = {};

        // Define parameters json body
        Property.property_canonical_id = req.body.property_canonical_id;
        Property.address1 = req.body.address1;
        Property.address2 = req.body.address2;
        Property.suburb = req.body.suburb;
        Property.state = req.body.state;
        Property.postcode = parseInt(req.body.postcode);
        Property.country = req.body.country;
        Property.propertytype = parseInt(req.body.propertytype);
        Property.latitude = req.body.latitude;
        Property.longitude = req.body.longitude;
        Property.unit_type = req.body.unit_type || undefined;
        Property.mesh_block = req.body.mesh_block;

        console.log(Property);
        // TODO: Add validations to json body
        if(Property.property_canonical_id && Property.address1 && Property.suburb && Property.state && Property.postcode && Property.country) {
            property.createNewProperty(Property, function(error, results) {
                if (error) {
                    // Handle basic error
                    res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                    return;
                }
                if (results.insertId) {
                    Property.propertyid = results.insertId;
                    res.json({
                        success: true,
                        property: Property
                    });
                } else {
                    res.json({
                        success: false,
                        property: null
                    })
                }
            })
        } else {
            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR003'));
        }
    },
    updatePropertyDetails: function(req, res, next) {
        // create new instance of propertyObj
        var Property = new propertyObj();

        // Define parameters json body
        Property.property_canonical_id = req.body.property_canonical_id;
        Property.address1 = req.body.address1;
        Property.address2 = req.body.address2;
        Property.suburb = req.body.suburb;
        Property.state = req.body.state;
        Property.postcode = parseInt(req.body.postcode);
        Property.country = req.body.country;
        Property.propertytype = parseInt(req.body.propertytype);
        Property.latitude = req.body.latitude;
        Property.longitude = req.body.longitude;
        Property.unit_type = req.body.unit_type || undefined;
        Property.mesh_block = req.body.mesh_block;

        console.log(Property);
        // TODO: Add validations to json body
        if(Property.property_canonical_id && Property.address1 && Property.suburb && Property.state && Property.postcode && Property.country) {
            property.updatePropertyDetails(Property, function(error, results) {
                if (error) {
                    // Handle basic error
                    res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                    return;
                }
                if (results.changedRows === 1 || results.affectedRows === 1) {
                    res.json({
                        success: true,
                        property: Property
                    });
                } else {
                    res.json({
                        success: false,
                        property: null
                    })
                }
            })
        } else {
            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR003'));
        }
    },
    getAllProperties: function(req, res, next) {
        /*var numPerPage = parseInt(req.query.npp, 10) || 5;
        var page = parseInt(req.query.page, 10) || 0;
        var skip = (page-1) * numPerPage;

        if(skip < 0) { skip = 0 }*/

        property.getAllProperties(function(error, results) {
            logger.info("getAllProperties()", req.id);
            console.log(results);
            if (error) {
                // Handle basic error
                res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                return;
            }

            logger.info("getAllProperties() ret: " + results.length);
            var rows = [];
            for (var i = 0; i < results.length; i++) {
                rows.push(new propertyDetObj(results[i]));
            }

            if(results.length > 0) {
                res.json({
                    success: true,
                    properties: rows
                });

            } else {
                res.json({
                    success: false,
                    properties: null
                })
            }
        });
    },
    getAllPropertiesByUser: function(req, res, next) {
        /*var numPerPage = parseInt(req.query.npp, 10) || 5;
        var page = parseInt(req.query.page, 10) || 0;
        var skip = (page-1) * numPerPage;

        if(skip < 0) { skip = 0 }*/

        var username = req.params.username;

        if (username) {
            property.getAllPropertiesByUser(username, function(error, results) {
                logger.info("getAllPropertiesByUser("+username+")", req.id);
                console.log(results);
                if (error) {
                    // Handle basic error
                    res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                    return;
                }

                logger.info("getAllProperties() ret: " + results.length);
                var rows = [];
                for (var i = 0; i < results.length; i++) {
                    rows.push(new propertyDetObj(results[i]));
                }

                if(results.length > 0) {
                    res.json({
                        success: true,
                        properties: rows
                    });

                } else {
                    res.json({
                        success: false,
                        properties: null
                    })
                }
            });
        } else {
            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR003'));
        }

    },
    getPropertyDetails: function(req, res, next) {
        var propertyid = req.params.propertyid;

        if(propertyid) {
            property.getPropertyDetails(propertyid, function(error, results) {
                logger.info("getPropertyDetails [" + propertyid + "]");
                if (error) {
                    res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                    return;
                }

                if (results.length == 1) {
                    var propertyDetails = new propertyDetObj(results[0]);
                    res.json({
                        success: true,
                        property: propertyDetails
                    });
                } else {
                    res.json({
                        success: false,
                        property: null
                    })
                }
            })
        } else {
            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR003'));
        }
    },
    getPropertyByCanonical: function(req, res, next) {
        var canonicalid = req.params.canonicalid;

        if(canonicalid) {
            property.getPropertyByCanonical(canonicalid, function(error, results) {
                logger.info("getPropertyByCanonical [" + canonicalid + "]");
                if (error) {
                    res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                    return;
                }

                if (results.length == 1) {
                    var propertyDetails = new propertyDetObj(results[0]);
                    res.json({
                        success: true,
                        property: propertyDetails
                    });
                } else {
                    res.json({
                        success: false,
                        property: null
                    })
                }
            })
        } else {
            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR003'));
        }
    }
};

module.exports = PropertyHandler;