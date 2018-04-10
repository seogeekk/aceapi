/*
   WorkLog model
 */

var db = require('../functions/dbconnect');
var logger = require('../functions/logger');

var datetime = require('node-datetime');

const ATTACHMENTTYPE_GID = 10;
const WORKTYPE_GID = 11;

var WorkLogDTO = {
    createNewWorkLog: function(workItem, callback) {


        logger.debug("createNewWorkLog()");
        // Start new transaction
        db.getConnection(function(err, connection) {
            logger.debug("beginTransaction()");
            connection.beginTransaction(function(err) {
                if(err) { callback(err); }

                var now = datetime.create();
                var auditdate = now.format("Y-m-d H:M:S");

                // 1. Insert into workloghistory
                logger.debug("trans() : insert into workloghistory");
                connection.query("INSERT INTO workloghistory (worklogid, worktype, description, notes, auditwho, auditwhen) VALUES (?,?,?,?,?,?)",
                    [workItem.worklogid, workItem.worktype, workItem.description, workItem.notes, workItem.username, auditdate], function(err, result) {
                        if(err) {
                            return connection.rollback(function() {
                                callback(err);
                            });
                        }

                        // 2. Get new workitem id
                        var workitemid;
                        if(result) {
                            workitemid = result.insertId;
                        }
                        else {
                            return connection.rollback(function() {
                                callback(new Error("Workitem insert failed"));
                            });
                        }

                        // 3. If there's attachment upload,
                        // else commit transaction and return workitem id
                        if (workItem.attachment) {
                            // 3a. Insert into attachment
                            logger.debug("trans(): insert into attachment");
                            connection.query("INSERT INTO attachment (attachment, type, auditwho, auditwhen) VALUES(?,?,?,?)", [workItem.attachment, workItem.attachmenttype, workItem.username, auditdate], function(err, result) {
                                if (err) {
                                    return connection.rollback(function() {
                                        callback(err);
                                    });
                                }

                                // 3b. Get new attachment id
                                var itemid;
                                if(result) {
                                    itemid = result.insertId;
                                }
                                else {
                                    return connection.rollback(function() {
                                        callback(new Error("Attachment insert failed"));
                                    });
                                }

                                // TODO: Check if there's existing attachment relationship - Remove if any
                                // 3c. create relationship
                                logger.debug("trans(): insert into worklogattachrel");
                                connection.query("INSERT INTO worklogattachrel(workitemid, itemid) VALUES (?, ?)", [workitemid, itemid], function(err, result) {
                                    if (err) {
                                        return connection.rollback(function() {
                                            callback(err);
                                        });
                                    }

                                    // 3d. If worktype == 2 (Inspection)
                                    // else commit transaction
                                    if (workItem.worktype == 2) {
                                        logger.debug("trans(): insert into inspection");
                                        connection.query("INSERT INTO inspection (workitemid, description, inspectiondate, auditwho, auditwhen) " +
                                            "VALUES(?,?,?,?,?)",
                                            [
                                                workitemid,
                                                workItem.description,
                                                workItem.inspectiondate,
                                                workItem.username,
                                                auditdate
                                            ], function(err, result) {
                                                if (err) {
                                                    return connection.rollback(function() {
                                                        callback(err);
                                                    });
                                                }

                                                // 3e. Commit transaction and return workitem id
                                                return connection.commit(function(err) {
                                                    if(err) {
                                                        return connection.rollback(function() {
                                                            callback(err);
                                                        });
                                                    }

                                                    logger.debug("end_transaction()");
                                                    connection.release();
                                                    callback(null, workitemid);
                                                });
                                            });
                                    } else {
                                        return connection.commit(function(err) {
                                            if(err) {
                                                return connection.rollback(function() {
                                                    callback(err);
                                                });
                                            }

                                            logger.debug("end_transaction()");
                                            connection.release();
                                            callback(null, workitemid);
                                        });
                                    }

                                });
                            });
                        } else {
                            // 3a. If worktype == 2 (Inspection)
                            // else commit transaction
                            if (workItem.worktype == 2) {
                                logger.debug("trans(): insert into inspection");
                                connection.query("INSERT INTO inspection (workitemid, description, inspectiondate, auditwho, auditwhen) " +
                                    "VALUES(?,?,?,?,?)",
                                    [
                                        workitemid,
                                        workItem.notes,
                                        workItem.inspectiondate,
                                        workItem.username,
                                        auditdate
                                    ], function(err, result) {
                                        if (err) {
                                            return connection.rollback(function() {
                                                callback(err);
                                            });
                                        }

                                        // 3b. Commit transaction and return workitem id
                                        return connection.commit(function(err) {
                                            if(err) {
                                                return connection.rollback(function() {
                                                    callback(err);
                                                });
                                            }

                                            logger.debug("end_transaction()");
                                            connection.release();
                                            callback(null, workitemid);
                                        });
                                    });
                            } else {
                                return connection.commit(function(err) {
                                    if(err) {
                                        return connection.rollback(function() {
                                            callback(err);
                                        });
                                    }

                                    logger.debug("end_transaction()");
                                    connection.release();
                                    callback(null, workitemid);
                                });
                            }
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

        logger.info("query: updateWorkLog[]");
        db.getConnection(function(err, connection) {
            connection.beginTransaction(function(err) {
                logger.debug("start_transaction()");
                if(err) { callback(err); }
                // Insert into query
                var now = datetime.create();
                var auditdate = now.format("Y-m-d H:M:S");
                logger.debug("trans(): insert into workloghistory");
                connection.query("UPDATE workloghistory " +
                    "SET worktype = ?," +
                    "description = ?," +
                    "notes = ?," +
                    "auditwho = ?," +
                    "auditwhen = ? " +
                    "WHERE workitemid = ?",
                    [workItem.worktype, workItem.description, workItem.notes, workItem.username, auditdate, workItem.workitemid], function(err, result) {
                        if(err) {
                            return connection.rollback(function() {
                                callback(err);
                            });
                        }

                        var workitemid = workItem.workitemid;

                        // if there's attachment
                        if (workItem.attachment) {
                            logger.debug("trans(): insert into attachment");
                            connection.query("INSERT INTO attachment (attachment, type, auditwho, auditwhen) VALUES(?,?,?,?)", [workItem.attachment, workItem.attachmenttype, workItem.username, auditdate], function(err, result) {
                                if (err) {
                                    return connection.rollback(function() {
                                        callback(err);
                                    });
                                }
                                var itemid = result.insertId;

                                // create relationship
                                logger.debug("trans(): insert into worklogattachrel");
                                connection.query("INSERT INTO worklogattachrel(workitemid, itemid) VALUES (?, ?)", [workitemid, itemid], function(err, result) {
                                    if (err) {
                                        return connection.rollback(function() {
                                            callback(err);
                                        });
                                    }


                                    if (workItem.worktype == 2) {
                                        logger.debug("trans(): update inspection");

                                        connection.query("UPDATE inspection SET description = ?, inspectiondate = ?, auditwho = ?, auditwhen = ? WHERE inspectionid = ? ",
                                            [
                                                workItem.description,
                                                workItem.inspectiondate,
                                                workItem.username,
                                                auditdate,
                                                workItem.inspectionid
                                            ], function(err, result) {
                                                if (err) {
                                                    return connection.rollback(function() {
                                                        callback(err);
                                                    });
                                                }

                                                // 3e. Commit transaction and return workitem id
                                                return connection.commit(function(err) {
                                                    if(err) {
                                                        return connection.rollback(function() {
                                                            callback(err);
                                                        });
                                                    }

                                                    logger.debug("end_transaction()");
                                                    connection.release();
                                                    callback(null, workitemid);
                                                });
                                            });
                                    } else {
                                        return connection.commit(function(err) {
                                            if(err) {
                                                return connection.rollback(function() {
                                                    callback(err);
                                                });
                                            }

                                            logger.debug("end_transaction()");
                                            connection.release();
                                            callback(null, workitemid);
                                        });
                                    }
                                });
                            });
                        } else {
                            if (workItem.worktype == 2) {
                                logger.debug("trans(): update inspection");

                                connection.query("UPDATE inspection SET description = ?, inspectiondate = ?, auditwho = ?, auditwhen = ? WHERE inspectionid = ? ",
                                    [
                                        workItem.description,
                                        workItem.inspectiondate,
                                        workItem.username,
                                        auditdate,
                                        workItem.inspectionid
                                    ], function(err, result) {
                                        if (err) {
                                            return connection.rollback(function() {
                                                callback(err);
                                            });
                                        }

                                        // 3e. Commit transaction and return workitem id
                                        return connection.commit(function(err) {
                                            if(err) {
                                                return connection.rollback(function() {
                                                    callback(err);
                                                });
                                            }

                                            logger.debug("end_transaction()");
                                            connection.release();
                                            callback(null, workitemid);
                                        });
                                    });
                            } else {
                                return connection.commit(function(err) {
                                    if(err) {
                                        return connection.rollback(function() {
                                            callback(err);
                                        });
                                    }

                                    logger.debug("end_transaction()");
                                    connection.release();
                                    callback(null, workitemid);
                                });
                            }
                        }

                    });
            });
        });




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
            "itemid, attachment, attachmenttype, filetypename, attachwho, attachwhen, inspectionid, inspectiondesc, inspectionresp, inspectioncreatedate," +
            "inspectionrespdate, inspectiondate, inspectionwho, inspectionwhen " +
            "FROM workitemdetails " +
            "WHERE worklogid = ?", [worklogid], callback);
    },
    getWorkItemLog: function(workitemid, callback) {
        logger.info("query: getWorkItemLog["+workitemid+"]");
        db.query("SELECT workitemid, worklogid, worktype, worktypename, creationdate, description, notes, auditwho, auditwhen," +
            "itemid, attachment, attachmenttype, filetypename, attachwho, attachwhen, inspectionid, inspectiondesc, inspectionresp, inspectioncreatedate," +
            "inspectionrespdate, inspectiondate, inspectionwho, inspectionwhen " +
            "FROM workitemdetails " +
            "WHERE workitemid = ?", [workitemid], callback);
    }
};

module.exports = WorkLogDTO;