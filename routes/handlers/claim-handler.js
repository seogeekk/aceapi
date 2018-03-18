/*
 Claim Handler
 */


var claim = require('../../models/claim');
var constants = require('../../functions/constants');
var errhandler = require('../../objects/apperror-object');
var restobj = require('../../objects/rest-object');

// Objects
var claimObj = require('../../objects/claim-object').Claim;
var claimDetObj = require('../../objects/claim-object').ClaimDetail;

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


var ClaimHandler = {
    createNewClaim: function(req, res, next) {
        // create new instance of claimObj
        var Claim = new claimObj();

        // Hard code open status id
        const CLAIM_OPEN_STATUS = 1;

        // Define parameters json body
        Claim.propertyid = parseInt(req.body.propertyid);
        Claim.claimtypeid = parseInt(req.body.claimtypeid);
        Claim.summary = req.body.summary;
        Claim.description = req.body.description;
        Claim.submitteduser = req.body.submitteduser;
        Claim.status = CLAIM_OPEN_STATUS;

        // TODO: Add validations to json body
        if(Claim.propertyid && Claim.claimtypeid && Claim.summary && Claim.submitteduser) {
            claim.createNewClaim(Claim, function(error, results) {
                if (error) {
                    // Handle basic error
                    res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                    return;
                }
                if (results.insertId) {
                    Claim.claimid = results.insertId;
                    res.json({
                        success: true,
                        claim: Claim
                    });
                } else {
                    res.json({
                        success: false,
                        claim: null
                    })
                }
            })
        } else {
            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR003'));
        }
    },
    updateClaimDetails: function(req, res, next) {
        // create new instance of propertyObj
        var Claim = new claimObj();

        // Define parameters json body
        Claim.claimid = parseInt(req.body.claimid);
        Claim.propertyid = parseInt(req.body.propertyid);
        Claim.claimtypeid = parseInt(req.body.claimtypeid);
        Claim.summary = req.body.summary;
        Claim.description = req.body.description;
        Claim.submitteduser = req.body.submitteduser;
        Claim.status = parseInt(req.body.status);
        Claim.reviewstartdate = Date.parse(req.body.reviewstartdate) || undefined;
        Claim.reviewenddate = Date.parse(req.body.reviewenddate) || undefined;
        Claim.approvaldate = Date.parse(req.body.approvaldate) || undefined;
        Claim.authoriseddate = Date.parse(req.body.authoriseddate) || undefined;
        Claim.approveruser = req.body.approveruser || undefined;
        Claim.processeddate = Date.parse(req.body.processeddate) || undefined;

        console.log(Claim);
        // TODO: Add validations to json body
        if(Claim.claimid && Claim.propertyid && Claim.claimtypeid && Claim.summary && Claim.submitteduser && Claim.status) {
            logger.info("updateClaimDetails["+Claim.claimid+"]");
            claim.updateClaimDetails(Claim, function(error, results) {
                if (error) {
                    // Handle basic error
                    res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                    return;
                }
                if (results.changedRows === 1 || results.affectedRows === 1) {
                    res.json({
                        success: true,
                        claim: Claim
                    });
                } else {
                    res.json({
                        success: false,
                        claim: null
                    })
                }
            })
        } else {
            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR003'));
        }
    },
    getAllClaims: function(req, res, next) {
        var numPerPage = parseInt(req.query.npp, 10) || 5;
        var page = parseInt(req.query.page, 10) || 0;
        var skip = (page-1) * numPerPage;

        if(skip < 0) { skip = 0 }

        claim.getAllClaims(skip, numPerPage, function(error, results) {
            logger.info("c [" + skip + "," + numPerPage + "]");
            console.log(results);
            if (error) {
                // Handle basic error
                res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                return;
            }

            logger.info("getAllClaims() ret: " + results.length);
            var rows = [];
            for (var i = 0; i < results.length; i++) {
                rows.push(new claimDetObj(results[i]));
            }

            if(results.length > 0) {
                res.json({
                    success: true,
                    page: page,
                    claims: rows
                });

            } else {
                res.json({
                    success: false,
                    page: page,
                    claims: null
                })
            }
        });
    },
    getClaimDetails: function(req, res, next) {
        var claimid = req.params.claimid;

        if(claimid) {
            claim.getClaimDetails(claimid, function(error, results) {
                logger.info("getClaimDetails [" + claimid + "]");
                if (error) {
                    res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                    return;
                }

                if (results.length == 1) {
                    var claimDetails = new claimDetObj(results[0]);
                    res.json({
                        success: true,
                        claim: claimDetails
                    });
                } else {
                    res.json({
                        success: false,
                        claim: null
                    })
                }
            });
        } else {
            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR003'));
        }
    }
};

module.exports = ClaimHandler;