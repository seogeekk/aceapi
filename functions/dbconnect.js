/*
    This is to connect to the database
 */

var mysql = require('mysql');

var connection = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: 'admin',
    database: 'acebody'
});

module.exports = connection;