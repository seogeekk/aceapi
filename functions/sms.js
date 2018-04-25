
var request = require('request');
var querystring = require('querystring');
var rp = require('request-promise');

var constants = require('./constants');
var errhandler = require('../objects/apperror-object');

const sms_access_key = 'j0zC2hSwJ74jtrfIQ27wMTMkU9sMvu1i',
      sms_secret_key = '7J6dzeelEQonZGvF';

var smsdomain = 'https://tapi.telstra.com';
var provision = '+61472880423';

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
    sendSMS: function(tonumber, message, callback) {

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
                        callback(null, res) ;
                    })
                    .catch(function(err) {
                        callback(err);
                    })
            })
            .catch(function(err) {
                callback(err);
            });
    }
};

module.exports = SMSApi;