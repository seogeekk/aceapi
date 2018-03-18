

var jwt = require('jwt-simple');
var validateUser = require('../routes/auth').validateUser;
var logUserAccess = require('../routes/auth').loginUserAccess;
var constants = require('../functions/constants');
var errhandler = require('../objects/apperror-object');

var logger = require('../functions/logger');

module.exports = function(req, res, next) {

    var token = (req.body && req.body.access_token) || (req.query && req.query.access_token) || req.headers['x-access-token'];
    var key = (req.body && req.body.x_key) || (req.query && req.query.x_key) || req.headers['x-key'];
    var ipaddress = req.connection.remoteAddress;

    ipaddress = ipaddress.split(':')[3];


    if(token || key) {
        try {

            var decoded = jwt.decode(token, require('../config/secret')());

            if(decoded.exp <= Date.now()) {
                res.status(constants.BAD_REQUEST);
                res.json(new errhandler("404", "Token Expired"));

                return;
            }

            // Authorise the handlers to see if s/he can access our resources
            validateUser(key, function(error, dbUser) {

                if (error) throw (error);

                if (dbUser) {
                    // Login User Access
                    //logger.info("user access: " + dbUser.username  + ", page: " + req.url);
                    // TODO: Fix catch Exception
                    logUserAccess(dbUser.username, ipaddress, req.url, function(error, results) {
                        if (error) {
                            console.error("Error logging user access: " + dbUser.username + ", error: " + error);
                        }
                    });

                    // Restrict admin urls
                    if((dbUser.roleid == 1) && req.url.indexOf('admin') >= 0) {
                        next();
                    } else if (dbUser.roleid > 0 && req.url.indexOf('admin') < 0) {
                        next();
                    } else {
                        res.status(constants.FORBIDDEN);
                        res.json(new errhandler("403", "Not Authorized"));
                        return;
                    }

                } else {
                    res.status(constants.UNAUTHORIZED);
                    res.json(new errhandler("401", "Invalid User"));
                    return;
                }
            });


        } catch(err) {
            res.status(constants.SERVER_ERROR_CODE);
            res.json(new errhandler("500", "Oops something went wrong", err));
            return;
        }
    } else {
        res.status(constants.UNAUTHORIZED);
        res.json(new errhandler("401", "Invalid Token or Key"));
        return;
    }
}