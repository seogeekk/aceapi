
var request = require('request');
var querystring = require('querystring');
var rp = require('request-promise');

var constants = require('./constants');
var errhandler = require('../objects/apperror-object');

const sms_access_key = 'j0zC2hSwJ74jtrfIQ27wMTMkU9sMvu1i',
      sms_secret_key = '7J6dzeelEQonZGvF';

var smsdomain = 'https://tapi.telstra.com';
var provision = '+61472880424';

var callbackURL = '';
var replyflag = 'false';

// Login to get token --
function getToken() {
        var form = {
            grant_type: 'client_credentials',
            client_id: sms_access_key,
            client_secret: sms_secret_key
        };

        var formData = querystring.stringify(form);
        var contentLength = formData.length;

        return rp({
            headers: {
                'Content-Length': contentLength,
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            uri: smsdomain + '/v2/oauth/token',
            body: formData,
            method: 'POST'
        })
            .then(function(response) {
                var json = JSON.parse(response);
                return json.access_token;
            })
            .catch(function(err){
                throw err;
            })
}

var SMSApi =  {
    sendSMS: function(req, response, next) {
        var tonumber = req.body.to;
        var message = req.body.message;


        var smsdata = {
            to: tonumber,
            body: message,
            from: provision,
            validity: 5,
            scheduledDelivery: 1,
            notifyURL: callbackURL,
            replyRequest: replyflag
        };

        getToken()
            .then(function(token) {

                var header = {
                    'Authorization': 'Bearer ' + token
                };
                rp({
                    headers: header,
                    url: smsdomain + '/v2/messages/sms',
                    body: smsdata,
                    method: 'POST',
                    json: true
                })
                    .then(function(res){
                        console.log(res);
                        response.json({
                            success: true
                        });

                    })
                    .catch(function(err) {
                        response.status(err.statusCode).json(new errhandler(err.code, err.message));
                    })
            })
            .catch(function(err) {
                response.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR004', "Invalid/No Token"));
            });
    }
};

module.exports = SMSApi;