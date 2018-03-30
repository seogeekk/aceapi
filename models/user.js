/*
    Interacts with user table
 */

var db = require('../functions/dbconnect');

var UserDTO = {

    // TODO: Log SQL error to console
    getUserId: function (username, callback) {
        return db.query("SELECT userid FROM user WHERE username = ?", username, callback);
    },
    getUserDetails: function(username, callback) {
        return db.query("SELECT userid, username, firstname, lastname, roleid, status FROM user WHERE username = ?", [username], callback);
    },
    getAllUsers: function(callback) {
        return db.query("SELECT userid, username, firstname, lastname, roleid, status FROM user", callback);
    },
    getUserRole: function (username, callback) {
        return db.query("SELECT u.roleid, a.shortdesc FROM user u, aceconfig a WHERE a.groupid = 2 AND a.ordinal = u.roleid AND u.username = ?", [username], callback);
    },
    createUser: function (username, firstname, lastname, emailaddress, password, roleid, callback) {
        // default account status to Open
        return db.query("INSERT INTO user (username, firstname, lastname, emailaddress, password, roleid, status)" +
                        "VALUES (?, ?, ?, ?, SHA(?), ?, 1)", [username, firstname, lastname, emailaddress, password, roleid], callback);
    },
    lockUser: function(username, status, callback) {
        return db.query("UPDATE user SET status = ? WHERE username = ?", [status, username], callback);
    },
    logUserAccess: function(user, callback) {
        return db.query("INSERT INTO loginhistory(username, actiontype, ipaddress, page)" +
                 "VALUES (?, ?, ?, ?)", [user.username, user.actiontype, user.ipaddress, user.page], callback);
    },
    validateCredentials: function(username, password, callback) {
        db.query("SELECT username, firstname, lastname, roleid, status FROM user WHERE username = ? AND password = SHA(?)", [username, password], function(error, results) {
           if (error) return callback(error);
           if (results.length == 1) {
               callback(undefined, results[0]);
           } else {
               callback(undefined);
           }
        });

    },
    validateUsername : function(username, callback) {
        db.query("SELECT username, firstname, lastname, roleid, status FROM user WHERE username = ?", [username], function(error, results) {
            if (error) return callback(error);
            if (results.length == 1) {
                callback(undefined, results[0]);
            } else {
                callback(undefined);
            }
        });
    },
    changePassword: function(username, password, callback) {
        db.query("UPDATE user SET password = SHA(?) WHERE username = ?", [password, username], callback);
    }
}

module.exports = UserDTO;
