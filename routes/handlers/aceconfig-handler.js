/*
 Ace Config Handler
 */


var aceconfig = require('../../models/aceconfig');
var constants = require('../../functions/constants');
var errhandler = require('../../objects/apperror-object');
var restobj = require('../../objects/rest-object');


var mailx = require('../../functions/mailer');
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


var AceConfigHandler = {
    getGroupid: function(req, res, next) {
        var groupid = req.params.groupid;

        if(groupid) {
            aceconfig.getGroupid(groupid, function(error, results) {
                logger.info("getGroupid [" + groupid + "]");
                if (error) {
                    res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                    return;
                }

                logger.info("getGroupid() ret: " + results.length);
                var rows = [];
                for (var i = 0; i < results.length; i++) {
                    rows.push(results[i]);
                }

                if (results.length > 0) {
                    res.json({
                        success: true,
                        config: rows
                    });
                } else {
                    res.json({
                        success: false,
                        config: null
                    })
                }
            })
        } else {
            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR003'));
        }
    },
    getOrdinal: function(req, res, next) {
        var groupid = req.params.groupid;
        var ordinal = req.params.ordinal;

        if(groupid && ordinal) {
            aceconfig.getOrdinal(groupid, ordinal, function(error, results) {
                logger.info("getOrdinal [" + groupid + ", " + ordinal + "]");
                if (error) {
                    res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                    return;
                }

                if (results.length == 1) {
                    res.json({
                        success: true,
                        config: results[0]
                    });
                } else {
                    res.json({
                        success: false,
                        config: null
                    })
                }
            })
        } else {
            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR003'));
        }
    }
};

module.exports = AceConfigHandler;