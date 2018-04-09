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
        // create new instance of propertyObj
        var Inspection = new inspectionObj();

        // Define parameters json body
        Inspection.inspectionid = parseInt(req.body.workitemid);
        Inspection.response = parseInt(req.body.reponse);
        Inspection.responsedate = datetime.create(req.body.responsedate).format("Y-m-d H:M:S");
        Inspection.auditwho = req.body.username;

        console.log(Inspection);
        // TODO: Add validations to json body
        if(Inspection.workitemid && Inspection.response && Inspection.responsedate && Inspection.auditwho) {
            inspection.updateInspectionStatus(Inspection.workitemid, Inspection.response, Inspection.responsedate, Inspection.auditwho, function(error, results) {
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
    sendInspectionEmail: function(req, res, next) {
        var inspectionid = parseInt(req.body.inspectionid);

        if(inspectionid) {
            inspection.getInspectionSMSDetails(inspectionid, function(error, results) {
                logger.info("sendInspectionEmail [" + inspectionid + "]");
                if (error) {
                    res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                    return;
                }

                if (results.length == 1) {
                    var inspectionDetails = results[0];
                    console.log(inspectionDetails);
                    mailx.sendNewInspectionMail(inspectionDetails.emailaddress, inspectionDetails.customer, inspectionDetails.property, inspectionDetails.inspectiondate, inspectionDetails.claimid, inspectionDetails.summary, function(error, email) {
                        if(error) {
                            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR004', error.message, error.stack));
                            return;
                        } else {
                            res.json ({
                                success: true,
                                message: email
                            });
                            return;
                        }
                    });


                } else {
                    res.json({
                        success: false,
                        message: null
                    })
                }
            })

        } else {
            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR003'));
        }
    }
};

module.exports = InspectionHandler;