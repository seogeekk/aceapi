
var constants = require('../functions/constants');
var errhandler = require('../objects/apperror-object');
var user = require('../models/user');
var validateToken = require('../models/inspection').validateToken;
var jwt = require('jwt-simple');
var encrypt = require('../functions/crypto').encrypt;
var decrypt = require('../functions/crypto').decrypt;
var UserLogObj = require('../objects/user-object').UserLog;

var auth = {

    login: function(req, res) {

        var username = req.body.username || '';
        var password = req.body.password || '';

        if (username == '' || password ==  '') {
            res.status(constants.UNAUTHORIZED);
            res.json(new errhandler('ERR401'));
            return;
        }

        // Verify from database
        user.validateCredentials(username, password, function(err, dbUserObj) {

            if(dbUserObj instanceof Error) {
                console.log('User validation error: ' + dbUserObj);
                res.status(constants.UNAUTHORIZED);
                res.json(new errhandler('ERR401', 'Validation error.', dbUserObj.stack));
            } else if(!dbUserObj) {
                res.status(constants.UNAUTHORIZED);
                res.json(new errhandler('ERR401'));
            } else {
                res.json(genToken(dbUserObj));
            }
        });

    },
    validateUser: function(username, callback) {
        user.validateUsername(username, function(err, dbUserObj) {
            callback(err, dbUserObj);
        });
    },
    loginUserAccess: function (username, ipaddress, page, callback) {

        const actiontype = 1; // see list of aceconfig.groupid = 5
        var UserLog = new UserLogObj(username, actiontype, ipaddress, page);
        user.logUserAccess(UserLog, function (err, result) {
            if (err) {
                callback(err);
            }
            callback(undefined);
        });
    },
    validateToken: function(token, callback) {
        validateToken(token, callback);
    }
}

function genToken(user) {
    var expires = expiresIn(constants.TOKEN_EXPIRATION_DAYS);
    var token = jwt.encode({
        exp: expires
    }, require('../config/secret')());

    return {
        token: token,
        expires: expires,
        user: user
    };
}

function expiresIn(numDays) {
    var dateObj = new Date();
    return dateObj.setDate(dateObj.getDate() + numDays);
}

module.exports = auth;