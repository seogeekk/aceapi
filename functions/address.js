
var request = require('request');
var querystring = require('querystring');
var rp = require('request-promise');

var constants = require('./constants');
var errhandler = require('../objects/apperror-object');

const access_key = 'ADDRESSFINDER_DEMO_KEY',
      secret_key = 'ADDRESSFINDER_DEMO_SECRET';

var addressdomain = 'https://api.addressfinder.io';


var AddressApi =  {
    searchAddress: function(req, response, next) {
        var query = req.query.q;

        rp({
            uri: addressdomain + '/api/au/address/?' + 'key=' + access_key + '&secret=' + secret_key + '&q=' + query + '&format=json',
            method: 'GET'
        })
            .then(function(res) {
                var json = JSON.parse(res);
                console.log(json);
                response.json({
                    address: json.completions
                });
            })
            .catch(function(err){
                response.status(err.statusCode).json(new errhandler(err.code, err.message));
            });
    },
    completeAddress: function(req, response, next) {
        var query = req.query.q;

        rp({
            uri: addressdomain + '/api/au/address/cleanse/?' + 'key=' + access_key + '&secret=' + secret_key + '&q=' + query + '&format=json',
            method: 'GET'
        })
            .then(function(res) {
                var json = JSON.parse(res);
                if(json.matched) {
                    response.json({
                        success: true,
                        address: {
                            property_canonical_address: json.address.canonical_address_id,
                            address1: json.address.address_line_1,
                            address2: json.address.address_line_2,
                            suburb: json.address.locality_name,
                            state: json.address.state_territory,
                            postcode: json.address.postcode,
                            latitude: json.address.latitude,
                            longitude: json.address.longitude,
                            mesh_block: json.address.meshblock,
                            unit_type: json.address.unit_type
                        }
                    });
                } else {
                    response.json({
                        success: false
                    });
                }
            })
            .catch(function(err){
                response.status(err.statusCode).json(new errhandler(err.code, err.message));
            });
    }
};

module.exports = AddressApi;