var winston = require('winston');

var winstonLogger = new winston.Logger({
    transports: [
        new winston.transports.Console({
            level: 'debug',
            handleExceptions: true,
            json: false,
            colorize: true,
            timestamp: true
        })
    ],
    exitOnError: false
});

winstonLogger.stream = {
    write: function (message, encoding) {
        winstonLogger.info(message);
    }
};

// Wrap Winston logger to print reqId in each log
var formatMessage = function(message, requestid) {

    if (requestid) {
        message = "[" + requestid + "] - " + message;
    } else {
        message = "[] - " + message;
    }

    //message =  myRequest && myRequest.get('reqId') ? "reqid [" + myRequest.get('reqId') + "] - " + message : message;
    return message;
};

var logger = {
    log: function(level, message) {
        winstonLogger.log(level, formatMessage(message, requestid));
    },
    error: function(message, requestid) {
        winstonLogger.error(formatMessage(message, requestid));
    },
    warn: function(message, requestid) {
        winstonLogger.warn(formatMessage(message, requestid));
    },
    verbose: function(message, requestid) {
        winstonLogger.verbose(formatMessage(message, requestid));
    },
    info: function(message, requestid) {
        winstonLogger.info(formatMessage(message, requestid));
    },
    debug: function(message, requestid) {
        winstonLogger.debug(formatMessage(message, requestid));
    },
    silly: function(message, requestid) {
        winstonLogger.silly(formatMessage(message, requestid));
    }
};

module.exports = logger;