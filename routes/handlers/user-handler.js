/*
    User handler
 */

var user = require('../../models/user');
var constants = require('../../functions/constants');
var errhandler = require('../../objects/apperror-object');
var restobj = require('../../objects/rest-object');

var logger = require('../../functions/logger');

function parseError(error) {
    switch (error.code) {
        default:
            logger.error(error.code + ": " + error.message);
            return new errhandler(error.code, error.message, error.stack)
    }
    return null;
}

var UserHandler = {
    getUserID: function (req, res, next) {
        if (req.params.username) {
            user.getUserId(req.params.username, function (err, result) {
                logger.info("getUserId [" + req.params.username + "]");
                if (err) {
                    var error = new errhandler(err.status, err.message, err.stack);
                    res.status(constants.SERVER_ERROR_CODE).json(error);
                } else {
                    // return rows
                    if (result.length == 1) {
                        res.json(result);
                    } else {
                        var error = new errhandler('ERR001')
                        res.status(constants.NO_RESULTS).json(error);
                    }
                }
            });
        } else {
            var error = new errhandler('ERR003')
            res.status(constants.SERVER_ERROR_CODE).json(error);
        }
    },

    getUserDetails: function (req, res, next) {
        if (req.params.username) {
            user.getUserDetails(req.params.username, function (err, result) {
                if (err) {
                    res.status(constants.SERVER_ERROR_CODE).json(err);
                } else {
                    // return rows
                    if (result.length == 1) {
                        res.json(result);
                    } else {
                        var error = new errhandler('ERR001')
                        res.status(constants.NO_RESULTS).json(error);
                    }
                }
            });
        } else {
            var error = new errhandler('ERR003')
            res.status(constants.SERVER_ERROR_CODE).json(error);
        }
    },

    getAllUsers: function (req, res, next) {
        user.getAllUsers(function (err, result) {
            if (err) {
                res.status(constants.SERVER_ERROR_CODE).json(err);
            } else {
                // return rows
                if (result.length > 0) {
                    res.json(result);
                } else {
                    var error = new errhandler('ERR001')
                    res.status(constants.NO_RESULTS).json(error);
                }
            }
        });
    },

    getUserStatus: function (req, res, next) {
        if (req.params.username) {
            user.getUserStatus(req.params.username, function (err, result) {
                if (err) {
                    var error = new errhandler(err.status, err.message, err.stack);
                    res.status(constants.SERVER_ERROR_CODE).json(error);
                } else {
                    // return rows
                    if (result.length == 1) {
                        res.json({
                            success: true,
                            user: result[0]
                        });
                    } else {
                        var error = new errhandler('ERR001')
                        res.status(constants.NO_RESULTS).json(error);
                    }
                }
            });
        } else {
            var error = new errhandler('ERR003')
            res.status(constants.SERVER_ERROR_CODE).json(error);
        }
    },

    createNewUser: function (req, res, next) {
        var username = req.body.username;
        var firstname = req.body.firstname;
        var lastname = req.body.lastname;
        var emailaddress = req.body.emailaddress;
        var password = req.body.password;
        var address = req.body.address;
        var mobile = req.body.mobilenumber;
        var customertype = req.body.customertypeid;
        var roleid = parseInt(req.body.roleid) || 4; // default to client if not provided

        // Staff related
        var department = parseInt(req.body.department);
        var accesstype = parseInt(req.body.accesstype);

        // Default to client
        /*if (! roleid) {
            roleid = 4;
        }*/

        var User = {
            username: username,
            firstname: firstname,
            lastname: lastname,
            emailaddress: emailaddress,
            password: password,
            roleid: roleid,
            department: department,
            accesstype: accesstype,
            address: address,
            mobilenumber: mobile,
            customertype: customertype
        }

        console.log(User);
        // TODO: encrypt password
        if (username && firstname && lastname && emailaddress && password) {
            user.createUser(User, function (err, result) {

                if (err) {
                    // Handle basic error
                    res.status(constants.SERVER_ERROR_CODE).json(parseError(err));
                    return;
                } else {
                    if (result) {
                        res.json({
                            success: true,
                            message: "User created",
                            id: result.insertId
                        });
                    } else {
                        res.json({
                            success: false,
                            message: "User not created"
                        })
                    }
                }
            });
        } else {
            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR003'));
        }
    },

    updateUser: function(req, res, next) {
        var username = req.body.username;
        var firstname = req.body.firstname;
        var lastname = req.body.lastname;
        var emailaddress = req.body.emailaddress;
        var mobilenumber = req.body.mobilenumber;

        // TODO: encrypt password
        if (username && firstname && lastname && emailaddress) {
            user.updateUser(username, firstname, lastname, emailaddress, mobilenumber, function (error, results) {
                if (error) {
                    // Handle basic error
                    res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                    return;
                }
                if (results.changedRows === 1 || results.affectedRows === 1) {
                    res.json({
                        success: true,
                        user: results[0]
                    });
                } else {
                    res.json({
                        success: false,
                        user: null
                    })
                }
            });
        } else {
            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR003'));
        }
    },
    changeUserStatus: function (req, res, next) {
        var username = req.body.username;
        var status = req.body.status; // see aceconfig.groupid = 2

        if (username && status) {
            if (status > 0 && status <= 4) {
                user.lockUser(username, status, function (err, result) {
                    if (err) {
                        var error = new errhandler(err.status, err.message, err.stack);
                        res.status(constants.SERVER_ERROR_CODE).json(error);
                    } else {
                        // return rows
                        if (result.affectedRows == 1) {
                            res.json({
                                success: true,
                                message: "Status updated"
                            });
                        } else {
                            res.json({
                                success: false,
                                message: "Status update failed"
                            });
                        }
                    }
                });
            } else {
                var error = new errhandler('ERR004')
                res.status(constants.SERVER_ERROR_CODE).json(error);
            }
        } else {
            var error = new errhandler('ERR003')
            res.status(constants.SERVER_ERROR_CODE).json(error);
        }
    },

    changePassword: function (req, res, next) {
        var username = req.body.username;
        var password = req.body.password;

        if (username && password) {
            // TODO: implement validation on password
            user.validateUsername(username, function(error, result) {
                if (error) {
                    // Handle basic error
                    res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                    return;
                }
                if (result.username === username) {
                    // change password
                    user.changePassword(username, password, function(error, result) {
                        if (error) {
                            // Handle basic error
                            res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                            return;
                        }
                        if (result.changedRows === 1 || result.affectedRows === 1) {
                            res.json({
                                username: username,
                                success: true,
                                message: "Password changed"
                            });
                        } else {
                            res.json({
                                username: username,
                                success: false,
                                message: "Password change failed"
                            })
                        }
                    })
                } else {
                    error = new errhandler("ERR404", "Username NOT FOUND");
                    res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                }
            })
        } else {
            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR003'));
        }

    }

}

module.exports = UserHandler;