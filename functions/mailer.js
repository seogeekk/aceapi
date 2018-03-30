'use strict';

var nodemailer = require('nodemailer');
var handlebars = require('handlebars');
var fs = require('fs');

const aceemail = '"Ace Body" <acebodyonline@gmail.com>';

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

function sendNewInspectionMail (recipient, custname, address, inspectiondate, claimid, summary, callback) {

    readHTMLFile(__dirname + './../templates/inspection.html', function(err, html) {
        var template = handlebars.compile(html);

        var replacements = {
            customer: custname,
            property: address,
            inspectiondate: inspectiondate,
            claimid: claimid,
            summary: summary,
            accepturl : '',
            declineurl: ''
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


module.exports = { sendNewInspectionMail };