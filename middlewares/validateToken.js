
var validateToken = require('../routes/auth').validateToken;

var constants = require('../functions/constants');
var errhandler = require('../objects/apperror-object');

var logger = require('../functions/logger');

module.exports = function(req, res, next) {

    var token = (req.body && req.body.access_token) || (req.query && req.query.access_token) || req.headers['x-access-token'];

    if(token) {
        try {

            // Authorise the handlers to see if s/he can access our resources
            validateToken(token, function(error, inspectionid) {

                if (error) throw (error);

                if (inspectionid.length == 1) {
                    next();
                } else {
                    res.status(constants.UNAUTHORIZED);
                    res.json(new errhandler("401", "Invalid Token"));
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
        res.json(new errhandler("401", "Invalid Token"));
        return;
    }
}