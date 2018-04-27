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
        Claim.property_canonical_id = req.body.property_canonical_id;
        Claim.claimtypeid = parseInt(req.body.claimtypeid);
        Claim.summary = req.body.summary;
        Claim.description = req.body.description;
        Claim.submitteduser = req.body.submitteduser;
        Claim.auditwho = req.body.auditwho;
        Claim.status = CLAIM_OPEN_STATUS;

        console.log(Claim);
        // TODO: Add validations to json body
        if(Claim.property_canonical_id && Claim.claimtypeid && Claim.summary && Claim.submitteduser && Claim.auditwho) {
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
        Claim.property_canonical_id = req.body.property_canonical_id;
        Claim.claimtypeid = parseInt(req.body.claimtypeid);
        Claim.summary = req.body.summary;
        Claim.description = req.body.description;
        Claim.submitteduser = req.body.submitteduser;
        Claim.approvaldate = Date.parse(req.body.approvaldate) || undefined;
        Claim.approveruser = req.body.approveruser || undefined;
        Claim.auditwho = req.body.auditwho;

        console.log(Claim);
        // TODO: Add validations to json body
        if(Claim.claimid && Claim.property_canonical_id && Claim.claimtypeid && Claim.summary && Claim.submitteduser && Claim.auditwho) {
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
        /*var numPerPage = parseInt(req.query.npp, 10) || 5;
        var page = parseInt(req.query.page, 10) || 0;
        var skip = (page-1) * numPerPage;*/

        //if(skip < 0) { skip = 0 }

        var startdate = Date.parse(req.params.startdate) || Date.now();
        var enddate = Date.parse(req.params.enddate) || Date.now();

        claim.getAllClaims(startdate, enddate, function(error, results) {
            logger.info("getAllClaims()", req.id);
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
                    claims: rows
                });

            } else {
                res.json({
                    success: false,
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
    },
    getClaimByUser: function(req, res, next) {

        var username = req.params.username;

        if(username) {
            claim.getClaimByUser(username, function(error, results) {
                logger.info("getClaimByUser[" + username + "]");
                console.log(results);
                if (error) {
                    // Handle basic error
                    res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                    return;
                }

                logger.info("getClaimByUser() ret: " + results.length);
                var rows = [];
                for (var i = 0; i < results.length; i++) {
                    rows.push(new claimDetObj(results[i]));
                }

                if(results.length > 0) {
                    res.json({
                        success: true,
                        claims: rows
                    });

                } else {
                    res.json({
                        success: false,
                        claims: null
                    })
                }
            });
        } else {
            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR003'));
        }
    },
    assignClaim: function(req, res, next) {

        var username = req.body.username;
        var claimid = parseInt(req.body.claimid);
        var auditwho = req.body.auditwho;

        logger.info("assignClaim[" + username + ", " + claimid + "]", req.id);
        if(username && claimid && auditwho) {
            claim.assignClaim(username, claimid, auditwho, function(error, results) {
                logger.info("assignClaim[" + username + ", " + claimid + "]");
                console.log(results);
                if (error) {
                    // Handle basic error
                    res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                    return;
                }

                if(results.insertId) {
                    res.json({
                        success: true,
                        username: username
                    });

                } else {
                    res.json({
                        success: false,
                        username: null
                    })
                }
            });
        } else {
            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR003'));
        }
    },
    getClaimByProperty: function(req, res, next) {
        var property_canonical_id = req.params.property;

        if(property_canonical_id) {
            claim.getClaimByProperty(property_canonical_id, function(error, results) {
                logger.info("getClaimByProperty[" + property_canonical_id + "]");
                console.log(results);
                if (error) {
                    // Handle basic error
                    res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                    return;
                }

                if(results.length > 0) {
                    res.json({
                        success: true,
                        claims: results
                    });

                } else {
                    res.json({
                        success: false,
                        claims: null
                    })
                }
            });
        } else {
            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR003'));
        }
    },
    getClaimByStaff: function(req, res, next) {
        var username = req.params.username;

        if(username) {
            claim.getClaimByStaff(username, function(error, results) {
                logger.info("getClaimByStaff[" + username + "]");
                console.log(results);
                if (error) {
                    // Handle basic error
                    res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                    return;
                }

                if(results.length > 0) {
                    res.json({
                        success: true,
                        claims: results
                    });

                } else {
                    res.json({
                        success: false,
                        claims: null
                    })
                }
            });
        } else {
            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR003'));
        }
    },
    getAssignedByUser: function(req, res, next) {
        var username = req.params.username;

        if(username) {
            claim.getAssignedByUser(username, function(error, results) {
                logger.info("getAssignedByUser[" + username + "]");
                console.log(results);
                if (error) {
                    // Handle basic error
                    res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                    return;
                }

                if(results.length > 0) {
                    res.json({
                        success: true,
                        assign: results
                    });

                } else {
                    res.json({
                        success: false,
                        assign: null
                    })
                }
            });
        } else {
            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR003'));
        }
    },
    getAssignment: function(req, res, next) {
        var claimid = req.params.claimid;

        if(claimid) {
            claim.getAssignment(claimid, function(error, results) {
                logger.info("getAssignment[" + claimid + "]");
                console.log(results);
                if (error) {
                    // Handle basic error
                    res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                    return;
                }

                if(results.length == 1) {
                    res.json({
                        success: true,
                        staff: {
                            username: results[0].username,
                            staffname: results[0].staffname
                        }
                    });

                } else {
                    res.json({
                        success: false,
                        staff: null
                    })
                }
            });
        } else {
            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR003'));
        }
    },
    updateClaimStatus: function(req, res, next) {
        var claimid = req.body.claimid;
        var status = req.body.status

        console.log({claimid: claimid, status: status})
        if(claimid && status) {
            claim.updateClaimStatus(claimid, status, function(error, results) {
                logger.info("updateClaimStatus[" + claimid + ", " + status + "]");

                if (error) {
                    // Handle basic error
                    res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                    return;
                }

                if(results.affectedRows == 1 || results.changedRows == 1) {
                    res.json({
                        success: true,
                        claimid: claimid
                    });

                } else {
                    res.json({
                        success: false,
                        claimid: claimid
                    })
                }
            });
        } else {
            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR003'));
        }
    },
    approveClaim: function(req, res, next) {
        var claimid = req.body.claimid;
        var username = req.body.username;

        console.log({claimid: claimid, username: username})
        if(claimid && username) {
            claim.approveClaim(claimid, username, function(error, results) {
                logger.info("approveClaim[" + claimid + ", " + username + "]");

                if (error) {
                    // Handle basic error
                    res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                    return;
                }

                if(results.affectedRows == 1 || results.changedRows == 1) {
                    res.json({
                        success: true,
                        claimid: claimid
                    });

                } else {
                    res.json({
                        success: false,
                        claimid: claimid
                    })
                }
            });
        } else {
            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR003'));
        }
    },
    getSuburbStat: function(req, res, next) {
        var querydate = Date.parse(req.params.reportdate) || Date.now();

        console.log(querydate);
        if(querydate) {
            claim.getSuburbStat(querydate, function(error, results) {
                logger.info("getSuburbStat[" + querydate + "]");
                console.log(results);
                if (error) {
                    // Handle basic error
                    res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                    return;
                }

                if(results.length > 0) {
                    res.json({
                        success: true,
                        stats: results
                    });

                } else {
                    res.json({
                        success: false,
                        stats: null
                    })
                }
            });
        } else {
            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR003'));
        }
    },
    getCompletionStat: function(req, res, next) {
        var querydate = Date.parse(req.params.reportdate) || Date.now();

        console.log(querydate);
        if(querydate) {
            claim.getCompletionStat(querydate, function(error, results) {
                logger.info("getCompletionStat[" + querydate + "]");
                console.log(results);
                if (error) {
                    // Handle basic error
                    res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                    return;
                }

                if(results.length > 0) {
                    res.json({
                        success: true,
                        stats: results
                    });

                } else {
                    res.json({
                        success: false,
                        stats: null
                    })
                }
            });
        } else {
            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR003'));
        }
    },
    getRequestTypeStat: function(req, res, next) {
        var querydate = Date.parse(req.params.reportdate) || Date.now();

        console.log(querydate);
        if(querydate) {
            claim.getRequestTypeStat(querydate, function(error, results) {
                logger.info("getRequestTypeStat[" + querydate + "]");
                console.log(results);
                if (error) {
                    // Handle basic error
                    res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                    return;
                }

                if(results.length > 0) {
                    res.json({
                        success: true,
                        stats: results
                    });

                } else {
                    res.json({
                        success: false,
                        stats: null
                    })
                }
            });
        } else {
            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR003'));
        }
    },
    getRequestCountStat: function(req, res, next) {
        var querydate = Date.parse(req.params.reportdate) || Date.now();

        console.log(querydate);
        if(querydate) {
            claim.getRequestCountStat(querydate, function(error, results) {
                logger.info("getRequestCountStat[" + querydate + "]");
                console.log(results);
                if (error) {
                    // Handle basic error
                    res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                    return;
                }

                if(results.length > 0) {
                    res.json({
                        success: true,
                        stats: results
                    });

                } else {
                    res.json({
                        success: false,
                        stats: null
                    })
                }
            });
        } else {
            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR003'));
        }
    },
    getRequestDurationStat: function(req, res, next) {
        var querydate = Date.parse(req.params.reportdate) || Date.now();

        console.log(querydate);
        if(querydate) {
            claim.getRequestDurationStat(querydate, function(error, results) {
                logger.info("getRequestDurationStat[" + querydate + "]");
                console.log(results);
                if (error) {
                    // Handle basic error
                    res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                    return;
                }

                if(results.length > 0) {
                    res.json({
                        success: true,
                        stats: results
                    });

                } else {
                    res.json({
                        success: false,
                        stats: null
                    })
                }
            });
        } else {
            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR003'));
        }
    }
};

module.exports = ClaimHandler;