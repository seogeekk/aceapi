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

    getUserRole: function (req, res, next) {
        if (req.params.username) {
            user.getUserRole(req.params.username, function (err, result) {
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

    createNewUser: function (req, res, next) {
        var username = req.body.username;
        var firstname = req.body.firstname;
        var lastname = req.body.lastname;
        var emailaddress = req.body.emailaddress;
        var password = req.body.password;

        // TODO: encrypt password
        if (username && firstname && lastname && emailaddress && password) {
            user.createUser(username, firstname, lastname, emailaddress, password, function (err, result) {
                if (err) {
                    var error = new errhandler(err.code, err.message, err.stack);
                    res.status(constants.SERVER_ERROR_CODE).json(error);
                } else {
                    if (result.insertId) {
                        var payload = new restobj("SUCCESS", "User created");
                        res.json(payload);
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
                            var payload = new restobj("SUCCESS", "User Status updated");
                            res.json(payload);
                        } else {
                            var error = new errhandler('ERR001')
                            res.status(constants.NOT_FOUND_CODE).json(error);
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
    }

}

module.exports = UserHandler;