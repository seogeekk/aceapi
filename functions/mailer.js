'use strict';

var nodemailer = require('nodemailer');
var handlebars = require('handlebars');
var fs = require('fs');

const aceemail = '"Ace Body" <donotreply-mailer@acebodyonline.com>';

var transporter = nodemailer.createTransport({
    host: 'smtp.gmail.com',
    port: 587,
    secure: false,
    auth: {
        user: 'acebodyonline@gmail.com',
        pass: 'Eth3real'
    }
});

var readHTMLFile = function(path, callback) {
    fs.readFile(path, {encoding: 'utf-8'}, function(err, html) {
        if(err) {
            throw err;
            callback(err);
        } else {
            callback(null, html);
        }
    })
};

function sendInspectionMail (MailDetails, callback) {

    readHTMLFile(__dirname + './../templates/inspection.html', function(err, html) {
        var template = handlebars.compile(html);

        var replacements = {
            customer: MailDetails.custname,
            property: MailDetails.address,
            inspectiondate: MailDetails.inspectiondate,
            claimid: MailDetails.claimid,
            summary: MailDetails.summary,
            accepturl : MailDetails.accepturl
        }

        var htmlToSend = template(replacements);

        var mailOptions = {
            from: aceemail,
            to: recipient,
            subject: 'Inspection Required',
            html: htmlToSend
        };

        console.log(mailOptions);

        transporter.sendMail(mailOptions, (error, info) => {
            if(error) {
                callback(error);
            }
                        console.log(info);
            callback(null, info);
        });
    });

}

function sendStatusMail (MailDetails, callback) {

    readHTMLFile(__dirname + './../templates/claimnotification.html', function(err, html) {
        var template = handlebars.compile(html);

        var replacements = {
            customer: MailDetails.custname,
            property: MailDetails.address,
            claimid: MailDetails.claimid,
            summary: MailDetails.summary,
            accepturl : MailDetails.accepturl
        }

        var htmlToSend = template(replacements);

        var mailOptions = {
            from: aceemail,
            to: recipient,
            subject: 'Request ' + MailDetails.claimid + ' - Status Update',
            html: htmlToSend
        };

        console.log(mailOptions);

        transporter.sendMail(mailOptions, (error, info) => {
            if(error) {
                callback(error);
            }
            console.log(info);
            callback(null, info);
        });
    });

}

function sendMailVerification (MailDetails, callback) {

    readHTMLFile(__dirname + './../templates/verifyemail.html', function(err, html) {
        var template = handlebars.compile(html);

        var replacements = {
            customer: MailDetails.custname,
            accepturl : MailDetails.accepturl
        }

        var htmlToSend = template(replacements);

        var mailOptions = {
            from: aceemail,
            to: recipient,
            subject: 'Ace Body Online - Verify Email',
            html: htmlToSend
        };

        console.log(mailOptions);

        transporter.sendMail(mailOptions, (error, info) => {
            if(error) {
                callback(error);
            }
            console.log(info);
            callback(null, info);
        });
    });

}


module.exports = { sendInspectionMail, sendStatusMail };