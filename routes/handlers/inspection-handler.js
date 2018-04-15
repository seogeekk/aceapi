/*
 Property Handler
 */


var inspection = require('../../models/inspection');
var constants = require('../../functions/constants');
var errhandler = require('../../objects/apperror-object');
var restobj = require('../../objects/rest-object');

// Objects
var inspectionObj = require('../../objects/inspection-object').Inspection;
var inspectionDetObj = require('../../objects/inspection-object').InspectionDetail;

var mailx = require('../../functions/mailer');
// Logger
var logger = require('../../functions/logger');
var datetime = require('node-datetime');

function parseError(error) {
    switch (error.code) {
        default:
            logger.error(error.code + ": " + error.message);
            return new errhandler(error.code, error.message, error.stack)
    }
    return null;
}


var InspectionHandler = {
    createNewInspection: function(req, res, next) {
        // create new instance of propertyObj
        var Inspection = new inspectionObj();

        // Define parameters json body
        Inspection.workitemid = parseInt(req.body.workitemid);
        Inspection.description = req.body.description;
        Inspection.inspectiondate = datetime.create(req.body.inspectiondate).format("Y-m-d H:M:S");
        Inspection.auditwho = req.body.username;

        console.log(Inspection);
        // TODO: Add validations to json body
        if(Inspection.workitemid && Inspection.description && Inspection.inspectiondate && Inspection.auditwho) {
            inspection.createNewInspection(Inspection, function(error, results) {
                if (error) {
                    // Handle basic error
                    res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                    return;
                }
                if (results.insertId) {
                    Inspection.inspectionid = results.insertId;
                    res.json({
                        success: true,
                        inspection: Inspection
                    });
                } else {
                    res.json({
                        success: false,
                        inspection: null
                    })
                }
            })
        } else {
            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR003'));
        }
    },
    updateInspectionDetail: function(req, res, next) {
        // create new instance of propertyObj
        var Inspection = new inspectionObj();

        // Define parameters json body
        Inspection.inspectionid = parseInt(req.body.inspectionid);
        Inspection.description = req.body.description;
        Inspection.inspectiondate = datetime.create(req.body.inspectiondate).format("Y-m-d H:M:S");
        Inspection.auditwho = req.body.username;

        console.log(Inspection);
        // TODO: Add validations to json body
        if(Inspection.inspectionid && Inspection.description && Inspection.inspectiondate && Inspection.auditwho) {
            inspection.createNewInspection(Inspection, function(error, results) {
                if (error) {
                    // Handle basic error
                    res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                    return;
                }
                if (results.changedRows == 1 || results.affectedRows == 1) {
                    res.json({
                        success: true,
                        inspection: Inspection
                    });
                } else {
                    res.json({
                        success: false,
                        inspection: null
                    })
                }
            })
        } else {
            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR003'));
        }
    },
    updateInspectionStatus: function(req, res, next) {

        var payload = {};
        // Define parameters json body
        payload.inspectionid = parseInt(req.body.inspectionid);
        payload.response = parseInt(req.body.response);

        console.log(payload);
        if(payload.inspectionid && (payload.response == 0 || payload.response == 1)) {
            inspection.updateInspectionStatus(payload.inspectionid, payload.response, function(error, results) {
                if (error) {
                    // Handle basic error
                    res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                    return;
                }
                if (results.changedRows == 1 || results.affectedRows == 1) {
                    res.json({
                        success: true,
                        response: payload
                    });
                } else {
                    res.json({
                        success: false,
                        response: null
                    })
                }
            })
        } else {
            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR003'));
        }
    },
    getInspectionDetailsByWorkItem: function(req, res, next) {
        var workitemid = req.params.workitemid;

        if(workitemid) {
            inspection.getInspectionDetailsByWorkItem(workitemid, function(error, results) {
                logger.info("getInspectionDetailsByWorkItem [" + workitemid + "]");
                if (error) {
                    res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                    return;
                }

                logger.info("getInspectionDetailsByWorkItem() ret: " + results.length);
                var rows = [];
                for (var i = 0; i < results.length; i++) {
                    rows.push(new inspectionDetObj(results[i]));
                }

                if (results.length > 0) {
                    res.json({
                        success: true,
                        inspection: rows
                    });
                } else {
                    res.json({
                        success: false,
                        inspection: null
                    })
                }
            })
        } else {
            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR003'));
        }
    },
    getInspectionDetailsById: function(req, res, next) {
        var inspectionid = req.params.inspectionid;

        if(inspectionid) {
            inspection.getInspectionDetailsById(inspectionid, function(error, results) {
                logger.info("getInspectionDetailsById [" + inspectionid + "]");
                if (error) {
                    res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                    return;
                }

                if (results.length == 1) {
                    var inspectionDetails = new inspectionDetObj(results[0]);
                    res.json({
                        success: true,
                        inspection: inspectionDetails
                    });
                } else {
                    res.json({
                        success: false,
                        inspection: null
                    })
                }
            })
        } else {
            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR003'));
        }
    },
    getInspectionDetailsByToken: function(req, res, next) {
        var token = req.params.token;

        if(token) {
            inspection.getInspectionDetailsByToken(token, function(error, results) {
                logger.info("getInspectionDetailsByToken [" + token + "]");
                if (error) {
                    res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                    return;
                }

                if (results.length == 1) {
                    res.json({
                        success: true,
                        inspection: results[0]
                    });
                } else {
                    res.json({
                        success: false,
                        inspection: null
                    })
                }
            })
        } else {
            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR003'));
        }
    }
};

module.exports = InspectionHandler;