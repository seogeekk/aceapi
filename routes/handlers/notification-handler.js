/*
 Notification Handler
 */


var sendmail = require('../../functions/mailer');
var sms = require('../../functions/sms');
var constants = require('../../functions/constants');
var notification = require('../../models/notification');
var errhandler = require('../../objects/apperror-object');

var crypto = require('crypto');
// Objects



// Logger
var logger = require('../../functions/logger');
var datetime = require('node-datetime');

function parseError(error) {
    switch (error.code) {
        default:
            logger.error(error.code + ": " + error.message);
            return new errhandler(error.code, error.message, error.stack)
    }
    return null;
}


var NotificationHandler = {

    sendInspectionEmail: function (req, res, next) {
        // generate token
        var MailDetails = {
            custname: req.body.custname,
            address: req.body.address,
            claimid: req.body.claimid,
            inspectiondate: req.body.inspectiondate,
            summary: req.body.summary
        };


        var username = req.body.username;
        var inspectionid = parseInt(req.body.inspectionid);
        var token = crypto.randomBytes(32).toString('hex');
        // set object token
        MailDetails.accepturl = 'http://localhost:8000/#!/workitem/' + token;
        console.log(MailDetails);
        if (username && MailDetails.custname && MailDetails.address && MailDetails.claimid && MailDetails.summary && MailDetails.inspectiondate && inspectionid && token) {
            notification.getContactDetails(username, function(error, contact) {
                if(error) {
                    res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR004', error.message, error.stack));
                    return;
                }

                if (contact) {
                    MailDetails.recipient = contact[0].emailaddress;
                    MailDetails.tonumber = contact[0].mobilenumber;
                    // update inspection id token
                    notification.insertInspectionToken(inspectionid, token, function(error, results) {
                        if(error) {
                            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR004', error.message, error.stack));
                            return;
                        }
                        // send email
                        sendmail.sendInspectionMail(MailDetails, function (error, email) {
                            if (error) {
                                res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR004', error.message, error.stack));
                                return;
                            }

                            logger.info("Email request sent");
                            if (email) {
                                logger.info("Determine if SMS is required");
                                if(MailDetails.tonumber) {
                                    logger.info("sendSMS("+MailDetails.tonumber+")");
                                    // build sms message
                                    var message = 'An inspection is requested on your property ' + MailDetails.address + '. Please respond if you are available on '+ MailDetails.inspectiondate + '. '+ MailDetails.accepturl;

                                    sms.sendSMS('+61' + MailDetails.tonumber, message, function(err, sms) {
                                        if (err) {
                                            res.json({
                                                success: true,
                                                email: email,
                                                sms: {success: false}
                                            });
                                            return;
                                        }
                                        res.json({
                                            success: true,
                                            email: email,
                                            sms: sms
                                        });
                                        return;
                                    });
                                } else {
                                    logger.info("No SMS provided")
                                    res.json({
                                        success: true,
                                        email: email
                                    });
                                    return;
                                }
                            } else {
                                logger.info("No email sent");
                                res.json({
                                    success: false,
                                    email: null
                                });
                                return;
                            }
                        });
                    })
                } else {
                    res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR004', "Contact details not found for user"));
                    return;
                }

            })
        } else {
            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR003'));
        }

    },
    sendVerifyEmail: function (req, res, next) {
        var MailDetails = {
            custname: req.body.custname,
            accepturl: req.body.token
        }
        var username = req.body.username;
        var inspectionid = parseInt(req.body.inspectionid);
        var token = crypto.randomBytes(32).toString('hex');
        // set object token
        MailDetails.accepturl = 'http://localhost:8000/#!/verify/' + token;

        if (MailDetails.custname && MailDetails.accepturl && username) {
            notification.getContactDetails(username, function(error, contact) {
                if (error) {
                    res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR004', error.message, error.stack));
                    return;
                }
                if (contact) {
                    MailDetails.recipient = contact[0].emailaddress;
                    sendmail.sendMailVerification(MailDetails, function (error, email) {
                        if (error) {
                            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR004', error.message, error.stack));
                            return;
                        } else {
                            res.json({
                                success: true,
                                message: email
                            });
                            return;
                        }
                    });
                } else {
                    res.json({
                        success: false,
                        message: email
                    });
                    return;
                }

            });
        } else {
            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR003'));
        }
    },
    sendClaimStatusEmail: function(req, res, next) {
        var MailDetails = {
            custname: req.body.custname,
            address: req.body.address,
            claimid: req.body.claimid,
            summary: req.body.summary,
            status: req.body.status
        }

        var username = req.body.username;

        MailDetails.accepturl = 'http://localhost:8000/#!/request/manage/' + MailDetails.claimid;
        console.log(MailDetails);
        if (username && MailDetails.custname && MailDetails.address && MailDetails.claimid && MailDetails.summary && MailDetails.status) {
            notification.getContactDetails(username, function(error, contact) {
                if (error) {
                    res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR004', error.message, error.stack));
                    return;
                }
                if (contact) {
                    MailDetails.recipient = contact[0].emailaddress;
                    MailDetails.tonumber = contact[0].mobilenumber;
                    sendmail.sendStatusMail(MailDetails, function (error, email) {
                        if (error) {
                            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR004', error.message, error.stack));
                            return;
                        } else {
                            if (MailDetails.tonumber) {
                                var message = 'Your request id ' + MailDetails.claimid + ' is now ' + MailDetails.status + '. View more details on ' + MailDetails.accepturl;

                                sms.sendSMS('+61' + MailDetails.tonumber, message, function(err, sms) {
                                    if (err) {
                                        res.json({
                                            success: true,
                                            email: email,
                                            sms: {success: false}
                                        });
                                        return;
                                    }
                                    res.json({
                                        success: true,
                                        email: email,
                                        sms: sms
                                    });
                                    return;
                                });
                            } else {
                                res.json({
                                    success: true,
                                    message: email
                                });
                                return;
                            }
                        }
                    });

                } else {
                    res.json({
                        success: false,
                        message: "No email address provided"
                    });
                    return;
                }
            });
        } else {
            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR003'));
        }
    }

}


module.exports = NotificationHandler;