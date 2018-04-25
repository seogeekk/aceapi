/*
 Staff Handler
 */


var staff = require('../../models/staff');
var constants = require('../../functions/constants');
var errhandler = require('../../objects/apperror-object');
var restobj = require('../../objects/rest-object');

// Objects
var staffObj = require('../../objects/staff-object').Staff;
var staffDetObj = require('../../objects/staff-object').StaffDetail;

// Logger
var logger = require('../../functions/logger');

function parseError(error) {
    switch (error.code) {
        case 'ER_NO_REFERENCED_ROW_2':
            logger.error(error.code + ": " + error.message);
            return new errhandler(error.code, "Username doesn't exists");
        default:
            logger.error(error.code + ": " + error.message);
            return new errhandler(error.code, error.message, error.stack)
    }
    return null;
}


var StaffHandler = {
    createNewStaff: function(req, res, next) {
        // create new instance of staffObj
        var Staff = new staffObj();

        // Define parameters json body
        Staff.username = req.body.username;
        Staff.staffname = req.body.staffname;
        Staff.department = parseInt(req.body.department) || undefined;
        Staff.accesstype = parseInt(req.body.accesstype);

        // TODO: Add validations to json body
        if(Staff.username && Staff.accesstype && Staff.staffname) {
            staff.createNewStaff(Staff, function(error, results) {
                if (error) {
                    // Handle basic error
                    res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                    return;
                }
                if (results.insertId) {
                    Staff.staffid = results.insertId;
                    res.json({
                        success: true,
                        staff: Staff
                    });
                } else {
                    res.json({
                        success: false,
                        staff: null
                    })
                }
            })
        } else {
            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR003'));
        }
    },
    updateStaffDetails: function(req, res, next) {
        // create new instance of staffObj
        var Staff = new staffObj();

        // Define parameters json body
        Staff.username = req.body.username;
        Staff.staffname = req.body.staffname;
        Staff.department = parseInt(req.body.department) || undefined;
        Staff.accesstype = parseInt(req.body.accesstype);

        console.log(Staff);
        // TODO: Add validations to json body
        if(Staff.username && Staff.accesstype && Staff.staffname) {
            staff.updateStaffDetails(Staff, function(error, results) {
                if (error) {
                    // Handle basic error
                    res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                    return;
                }
                if (results.changedRows === 1 || results.affectedRows === 1) {
                    res.json({
                        success: true,
                        staff: Staff
                    });
                } else {
                    res.json({
                        success: false,
                        staff: null
                    })
                }
            })
        } else {
            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR003'));
        }
    },
    getAllStaff: function(req, res, next) {
        var numPerPage = parseInt(req.query.npp, 10) || 5;
        var page = parseInt(req.query.page, 10) || 0;
        var skip = (page-1) * numPerPage;

        if(skip < 0) { skip = 0 }

        staff.getAllStaff(skip, numPerPage, function(error, results) {
            logger.info("c [" + skip + "," + numPerPage + "]");
            console.log(results);
            if (error) {
                // Handle basic error
                res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                return;
            }

            logger.info("getAllStaff() ret: " + results.length);
            var rows = [];
            for (var i = 0; i < results.length; i++) {
                rows.push(new staffDetObj(results[i]));
            }

            if(results.length > 0) {
                res.json({
                    success: true,
                    page: page,
                    staff: rows
                });

            } else {
                res.json({
                    success: false,
                    page: page,
                    staff: null
                })
            }
        });
    },
    getStaffDetails: function(req, res, next) {
        var username = req.params.username;

        if(username) {
            staff.getStaffDetails(username, function(error, results) {
                logger.info("getCustomerDetails [" + username + "]");
                if (error) {
                    res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                    return;
                }

                if (results.length == 1) {
                    var staffDetails = new staffDetObj(results[0]);
                    res.json({
                        success: true,
                        staff: staffDetails
                    });
                } else {
                    res.json({
                        success: false,
                        staff: null
                    })
                }
            })
        } else {
            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR003'));
        }
    },
    searchStaff: function(req, res, next) {
        var query = req.query.query;

        logger.debug(query, req.id);
        staff.searchStaff(query, function(error, results) {
            if (error) {
                // Handle basic error
                res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                return;
            }

            logger.info("searchStaff() ret: " + results.length, req.id);
            var rows = [];
            for (var i = 0; i < results.length; i++) {
                rows.push(new staffDetObj(results[i]));
            }

            if(results.length > 0) {
                res.json({
                    success: true,
                    staff: rows
                });

            } else {
                res.json({
                    success: false,
                    staff: null
                })
            }
        });
    },
    getStaffStat: function(req, res, next) {
    var querydate = Date.parse(req.params.reportdate) || Date.now();

    console.log(querydate);
    if(querydate) {
        staff.getStaffStat(querydate, function(error, results) {
            logger.info("getStaffStat[" + querydate + "]");
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

module.exports = StaffHandler;