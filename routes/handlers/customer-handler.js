/*
    Customer handler
 */

var customer = require('../../models/customer');
var constants = require('../../functions/constants');
var errhandler = require('../../objects/apperror-object');
var restobj = require('../../objects/rest-object');

// Objects
var custObj = require('../../objects/customer-object').Customer;
var custDetObj = require('../../objects/customer-object').CustomerDetails;
var custClassObj = require('../../objects/customer-object').CustClass;

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

var CustHandler = {

    createNewCustomer: function(req, res, next) {
        var newCust = new custObj();

        newCust.customertypeid = req.body.customertypeid;
        if (req.body.custclass) { newCust.custclass = req.body.custclass; } // custclass id
        newCust.username = req.body.username;
        newCust.customername = req.body.customername;
        newCust.address1 = req.body.address1;
        newCust.address2 = req.body.address2;
        newCust.suburb = req.body.suburb;
        newCust.state = req.body.state;
        newCust.postcode = req.body.postcode;
        newCust.country = req.body.country;

        if(newCust.username) {
            customer.createCustomer(newCust, function(error, results) {
               if (error) {
                   res.status(constants.SERVER_ERROR_CODE).json(new errhandler(error.code, error.message, error.stack));
               }
               if (results.insertId) {
                   newCust.customerid = results.insertId;
                   res.json({
                       success: true,
                       customer: newCust
                   });
               } else {
                   res.json({
                       success: false,
                       customer: null
                   })
               }
            });
        } else {
            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR003'));
        }
    },
    createNewCustClass: function(req, res, next) {
        var newCustClass = new custClassObj();

        newCustClass.name = req.body.name;
        newCustClass.abn = req.body.abn;
        newCustClass.contactnumber = req.body.contactnumber;
        newCustClass.address1 = req.body.address1;
        newCustClass.address2 = req.body.address2;
        newCustClass.suburb = req.body.suburb;
        newCustClass.state = req.body.state;
        newCustClass.postcode = req.body.postcode;
        newCustClass.country = req.body.country;

        if(newCustClass) {
            customer.createCustClass(newCustClass, function(error, results) {
                if (error) {
                    res.status(constants.SERVER_ERROR_CODE).json(new errhandler(error.code, error.message, error.stack));
                }
                if (results.insertId) {
                    newCustClass.custclass = results.insertId;
                    res.json({
                        success: true,
                        custclass: newCustClass
                    });
                } else {
                    res.json({
                        success: false,
                        custclass: null
                    })
                }
            });
        } else {
            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR003'));
        }
    },
    getCustomerDetails: function(req, res, next) {

        var username = req.params.username;

        if(username) {
            customer.getCustomerDetails(username, function(error, results) {
                logger.info("getCustomerDetails[" + username + "]");
                if (error) {
                    logger.error("error code - " + error.code + ", message - " + error.message);
                    logger.error(error.stack);
                    res.status(constants.SERVER_ERROR_CODE).json(new errhandler(error.code, error.message, error.stack));
                }

                if (results.length == 1) {
                    var custDetails = new custDetObj(results[0]);
                    res.json({
                        success: true,
                        customer: custDetails
                    });
                } else {
                    res.json({
                        success: false,
                        customer: null
                    })
                }
            })
        } else {
            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR003'));
        }
    },
    getAllCustomers: function(req, res, next) {

        /*var numPerPage = parseInt(req.query.npp, 10) || 5;
        var page = parseInt(req.query.page, 10) || 0;
        var skip = (page-1) * numPerPage;

        if(skip < 0) { skip = 0 }*/

        customer.getAllCustomers(function(error, results) {
            logger.info("getAllCustomers()", req.id);
            console.log(results);
            if (error) {
                logger.error("error code - " + error.code + ", message - " + error.message);
                logger.error(error.stack);
                res.status(constants.SERVER_ERROR_CODE).json(new errhandler(error.code, error.message, error.stack));
            }

            logger.info("getAllCustomers() ret: " + results.length);
            var rows = [];
            for (var i = 0; i < results.length; i++) {
                rows.push(new custDetObj(results[i]));
            }

            if(results.length > 0) {
                res.json({
                    success: true,
                    customers: rows
                });

            } else {
                res.json({
                    success: false,
                    customer: null
                })
            }
        });

    },
    updateCustomerDetails: function(req, res, next) {
        var Cust = new custObj();

        Cust.username = req.body.username;
        Cust.customertypeid = req.body.customertypeid;
        Cust.customername = req.body.customername;
        Cust.address1 = req.body.address1;
        Cust.address2 = req.body.address2;
        Cust.suburb = req.body.suburb;
        Cust.state = req.body.state;
        Cust.postcode = req.body.postcode;
        Cust.country = req.body.country;

        console.log(Cust);
        if(Cust.username) {
            customer.updateCustomer(Cust, function(error, results) {
                if (error) {
                    res.status(constants.SERVER_ERROR_CODE).json(new errhandler(error.code, error.message, error.stack));
                }
                if (results.changedRows === 1 || results.affectedRows === 1) {
                    res.json({
                        success: true,
                        customer: Cust
                    });
                } else {
                    res.json({
                        success: false,
                        customer: null
                    })
                }
            });
        } else {
            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR003'));
        }
    },
    searchCustomer: function(req, res, next) {
        var query = req.query.query;

        logger.debug(query, req.id);
        customer.searchCustomer(query, function(error, results) {
            if (error) {
                // Handle basic error
                res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                return;
            }

            logger.info("searchCustomer() ret: " + results.length, req.id);
            var rows = [];
            for (var i = 0; i < results.length; i++) {
                rows.push(new custDetObj(results[i]));
            }

            if(results.length > 0) {
                res.json({
                    success: true,
                    customer: rows
                });

            } else {
                res.json({
                    success: false,
                    customer: null
                })
            }
        });
    },
    getCustomerStat: function(req, res, next) {
        var querydate = Date.parse(req.params.reportdate) || Date.now();

        console.log(querydate);
        if(querydate) {
            customer.getCustomerStat(querydate, function(error, results) {
                logger.info("getCustomerStat[" + querydate + "]");
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
}


module.exports = CustHandler;