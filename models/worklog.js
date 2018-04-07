/*
   WorkLog model
 */

var db = require('../functions/dbconnect');
var logger = require('../functions/logger');

var uuid = require('node-uuid');

var datetime = require('node-datetime');

const ATTACHMENTTYPE_GID = 10;
const WORKTYPE_GID = 11;

var WorkLogDTO = {
    createNewWorkLog: function(workItem, callback) {

        logger.info("query: createNewWorkLog[]");

        db.getConnection(function(err, connection) {
            connection.beginTransaction(function(err) {

                var trans_id = uuid.v1();

                logger.debug("start_transaction(" + trans_id + ")");
                if(err) { callback(err); }
                // Insert into query
                var now = datetime.create();
                var auditdate = now.format("Y-m-d H:M:S");
                logger.debug("trans(" + trans_id + "): insert into workloghistory");
                connection.query("INSERT INTO workloghistory (worklogid, worktype, description, notes, auditwho, auditwhen) VALUES (?,?,?,?,?,?)",
                    [workItem.worklogid, workItem.worktype, workItem.description, workItem.notes, workItem.username, auditdate], function(err, result) {
                        if(err) {
                            connection.rollback(function() {
                                callback(err);
                            });
                        }
                        var workitemid = result.insertId;

                        // if there's attachment
                        if (workItem.attachment) {
                            logger.debug("trans(" + trans_id + "): insert into attachment");
                            connection.query("INSERT INTO attachment (attachment, type, auditwho, auditwhen) VALUES(?,?,?,?)", [workItem.attachment, workItem.attachmenttype, workItem.username, auditdate], function(err, result) {
                                if (err) {
                                    connection.rollback(function() {
                                        callback(err);
                                    });
                                }
                                var itemid = result.insertId;

                                // create relationship
                                logger.debug("trans(" + trans_id + "): insert into worklogattachrel");
                                connection.query("INSERT INTO worklogattachrel(workitemid, itemid) VALUES (?, ?)", [workitemid, itemid], function(err, result) {
                                    if (err) {
                                        connection.rollback(function() {
                                            callback(err);
                                        });
                                    }
                                    // commit transaction
                                    connection.commit(function(err) {
                                        if(err) {
                                            connection.rollback(function() {
                                                callback(err);
                                            });
                                        }
                                        logger.debug("end_transaction(" + trans_id+ ")");
                                        callback(null, workitemid);
                                    });
                                });
                            });
                        } else {
                            // commit transaction
                            connection.commit(function(err) {
                                if(err) {
                                    connection.rollback(function() {
                                        callback(err);
                                    });
                                }
                                logger.debug("end_transaction(" + trans_id+ ")");
                                callback(null, workitemid);
                            });
                        }

                    });
            });
        });



    },
    createNewAttachment: function(Attachment, callback) {

        logger.info("query: createNewAttachment[]");

        db.beginTransaction(function(err) {
            console.log("transaction start");
            if (err) {
                callback(err);
            }
            // Insert into query
            var now = datetime.create();
            var auditdate = now.format("Y-m-d H:M:S");

            db.query("INSERT INTO attachment (attachment, type, auditwho, auditwhen) VALUES(?,?,?,?)", [Attachment.attachment, Attachment.attachmenttype, Attachment.username, auditdate], function (err, result) {
                if (err) {
                    db.rollback(function () {
                        callback(err);
                    });
                }
                var itemid = result.insertId;

                // create relationship
                logger.info("query: linkItemToWorkLog[" + itemid + "," + Attachment.workitemid + "]");
                db.query("INSERT INTO worklogattachrel(workitemid, itemid) VALUES (?, ?)", [Attachment.workitemid, itemid], function (err, result) {
                    if (err) {
                        db.rollback(function () {
                            callback(err);
                        });
                    }
                    // commit transaction
                    db.commit(function (err) {
                        if (err) {
                            db.rollback(function () {
                                callback(err);
                            });
                        }
                        logger.info("transaction complete");
                        callback(null, itemid);
                    })
                });
            });
        });
    },
    updateWorkLog: function(workItem, callback) {
        var now = datetime.create();
        var auditdate = now.format("Y-m-d H:M:S");

        logger.info("query: updateWorklog[]");
        db.query("UPDATE workloghistory " +
                 "SET worktype = ?," +
                    "description = ?," +
                    "notes = ?," +
                    "auditwho = ?," +
                    "auditwhen = ?, " +
                 "WHERE workitemid = ?",
            [workItem.worktype, workItem.description, workItem.notes, workItem.username, auditdate, workItem.workitemid], callback);
    },
    updateAttachment: function(Attachment, callback) {
        var now = datetime.create();
        var auditdate = now.format("Y-m-d H:M:S");

        logger.info("query: updateAttachment[]");
        db.query("UPDATE attachment " +
            "SET attachment = ?," +
            "type = ?," +
            "auditwho = ?," +
            "auditwhen = ? " +
            "WHERE itemid = ?",
            [Attachment.attachment, Attachment.type, Attachment.username, auditdate, Attachment.itemid], callback);
    },
    deleteAttachment: function(itemid, workitemid, callback) {
        logger.info("query: deleteAttachment["+itemid+","+workitemid+"]");
        db.query("DELETE FROM worklogattachrel WHERE workitemid = ? AND itemid = ?", [workitemid, itemid], callback);
    },
    createNewInspection: function(workLog, callback) {

    },
    updateInspection: function(workLog, callback) {

    },
    getAllWorkItemLog: function(worklogid, callback) {
        logger.info("query: getAllWorkItemLog["+worklogid+"]");
        db.query("SELECT workitemid, worklogid, worktype, worktypename, creationdate, description, notes, auditwho, auditwhen," +
            "itemid, attachment, attachmenttype, filetypename, attachwho, attachwhen " +
            "FROM workitemdetails " +
            "WHERE worklogid = ?", [worklogid], callback);
    },
    getWorkItemLog: function(workitemid, callback) {
        logger.info("query: getAllWorkItemLog["+worklogid+"]");
        db.query("SELECT workitemid, worklogid, worktype, worktypename, creationdate, description, notes, auditwho, auditwhen," +
            "itemid, attachment, attachmenttype, filetypename, attachwho, attachwhen " +
            "FROM workitemdetails " +
            "WHERE workitemid = ?", [workitemid], callback);
    }
};

module.exports = WorkLogDTO;