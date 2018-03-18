/*
 Interacts with customer table
 */

var db = require('../functions/dbconnect');
var logger = require('../functions/logger');

const CUSTTYPE_GID = 6;

var customerDTO = {

    createCustomer: function(custObj, callback) {
        var query = "INSERT INTO customer SET ?";
        db.query(query, [custObj], callback);
    },
    createCustClass: function(custClassObj, callback) {
        return db.query("INSERT INTO custclass SET ?", [custClassObj], callback);
    },
    getCustomerDetails: function(username, callback) {
        logger.info("query: getCustomerDetails [" + username + "]");
        return db.query("SELECT customerid, customertypeid as custtypeid, longdesc as custtype, username, customername, address1, address2, suburb, state, postcode, country FROM customer " +
            " LEFT JOIN aceconfig ON aceconfig.ordinal = customer.customertypeid AND groupid = ? " +
            " WHERE username = ?", [CUSTTYPE_GID, username], callback);
    },
    getCustomerType: function(typeid, callback) {
        db.query("SELECT ordinal as typeid, longdesc as name FROM aceconfig WHERE groupid = ? AND ordinal = ?", [CUSTTYPE_GID, typeid], function(error, results){
            if (error) {
                logger.error(error.message);
            }
            callback(error, results[0]);
        });
    },
    getAllCustomers: function(limit, npp, callback) {
        logger.info("query: getAllCustomers["+limit+","+npp+"]");
        db.query("SELECT customerid, customertypeid as custtypeid, longdesc as custtype, username, customername, address1, address2, suburb, state, postcode, country FROM customer " +
            " LEFT JOIN aceconfig ON aceconfig.ordinal = customer.customertypeid AND groupid = ? " +
            " LIMIT ?, ?", [CUSTTYPE_GID, limit, npp], callback);
    },
    updateCustomer: function(custObj, callback) {
        logger.info("query: updateCustomer[" + custObj.customerid + "]");
        db.query("UPDATE customer " +
                "SET customertypeid = ?, " +
                    "customername = ?, " +
                    "address1 = ?, " +
                    "address2 = ?, " +
                    "suburb = ?, " +
                    "state = ?, " +
                    "postcode = ?, " +
                    "country = ? " +
                "WHERE customerid = ?",
            [custObj.customertypeid, custObj.customername, custObj.address1, custObj.address2, custObj.suburb,
             custObj.state, custObj.postcode, custObj.country, custObj.customerid], callback);

        // TODO: Insert to customerhistory - Any customer details changes
    }
}

module.exports = customerDTO;