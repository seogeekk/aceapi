/*
 WorkLog Handler
 */


var worklog = require('../../models/worklog');
var constants = require('../../functions/constants');
var errhandler = require('../../objects/apperror-object');
var restobj = require('../../objects/rest-object');
var fs = require('fs');
var datetime = require('node-datetime');
var path = require('path');

// Objects

var WorkItemObj = require('../../objects/worklog-object').WorkItem;
var WorkItemDetObj = require('../../objects/worklog-object').WorkItemDetail;
var AttachmentObj = require('../../objects/worklog-object').Attachment;
var AttachmentDetObj = require('../../objects/worklog-object').AttachmentDetail;

// Logger
var logger = require('../../functions/logger');

var uploadRootDir = process.env.UPLOAD_DIRECTORY;

function parseError(error) {
    switch (error.code) {
        default:
            logger.error(error.code + ": " + error.message);
            return new errhandler(error.code, error.message, error.stack)
    }
    return null;
}

function checkDir(directory) {
    logger.debug("Checking directory: "+ directory);

    if (!fs.existsSync(directory)){
        logger.debug("Creating directory: " + directory);
        fs.mkdirSync(directory);
    }
}

var WorkLogHandler = {
    createNewWorkItem: function(req, res, next) {
        // create new instance of WorkItemObj
        var WorkItem = new WorkItemObj();

        // Define parameters json body
        WorkItem.worklogid = parseInt(req.body.worklogid);
        WorkItem.worktype = parseInt(req.body.worktype);
        WorkItem.description = req.body.description;
        WorkItem.notes = req.body.notes;
        WorkItem.username = req.body.username;
        // Optional
        WorkItem.inspectiondate = new Date(req.body.inspectiondate);

        // Attachment - Get attachment, if any
        var uploadFile;
        if (req.files) { uploadFile =  req.files.attachment; }

        console.log(WorkItem);
        // TODO: Add validations to json body
        logger.info("createNewWorkItem()", req.id);
        // Validate parameters
        if (WorkItem.worktype == 2 && isNaN(WorkItem.inspectiondate.getTime())) {
            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR003'));
        }
        else if(WorkItem.worklogid && WorkItem.worktype && WorkItem.description && WorkItem.username) {
            // If there's an upload file
            if (uploadFile) {

                if(uploadFile.truncated) {
                    // Check if it's over the size limit
                    error.code = "ERR500";
                    error.message = "File too large!";
                    res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                    return;
                } else {
                    // Upload file to server
                    logger.info("Uploading file to claims dir: " + uploadFile.name);
                    // check directory if exists else create
                    checkDir(uploadRootDir);
                    var claimDir = uploadRootDir + WorkItem.worklogid + '/';
                    checkDir(claimDir);

                    // Build attachment filename
                    var now = datetime.create();
                    var datesuffix = now.format("Ymd-HMS");
                    var ext = path.extname(uploadFile.name);
                    WorkItem.attachment = 'attachment-' + datesuffix + ext;
                    WorkItem.type = uploadFile.mimetype;

                    // 1. Copy to server
                    uploadFile.mv(claimDir + WorkItem.attachment, function(error) {
                        if (error) {
                            res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                            return;
                        }
                        // 2. Create workitem
                        worklog.createNewWorkLog(WorkItem, function(error, result) {
                            if (error) {
                                // Handle basic error
                                res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                                return;
                            }
                            if (result) {
                                WorkItem.workitemid = result;
                                res.json({
                                    success: true,
                                    workitem: WorkItem
                                });
                            } else {
                                res.json({
                                    success: false,
                                    workitem: null
                                });
                            }
                        });
                    });
                }

            } else {
                // 1. Create workitem now
                worklog.createNewWorkLog(WorkItem, function(error, result) {
                    if (error) {
                        // Handle basic error
                        res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                        return;
                    }
                    if (result) {
                        WorkItem.workitemid = result;
                        res.json({
                            success: true,
                            workitem: WorkItem
                        });
                    } else {
                        res.json({
                            success: false,
                            workitem: null
                        });
                    }
                });
            }
        } else {
            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR003'));
        }
    },
    updateWorkLogItem: function(req, res, next) {
        // create new instance of WorkItemObj
        var WorkItem = new WorkItemObj();

        // Define parameters json body
        WorkItem.workitemid = req.body.workitemid;
        WorkItem.worklogid = parseInt(req.body.worklogid);
        WorkItem.worktype = parseInt(req.body.worktype);
        WorkItem.description = req.body.description;
        WorkItem.notes = req.body.notes;
        WorkItem.username = req.body.username;
        WorkItem.inspectiondate = new Date(req.body.inspectiondate);
        WorkItem.inspectionid = req.body.inspectionid;

        // Attachment - Get attachment, if any
        var uploadFile;
        if (req.files) { uploadFile =  req.files.attachment; }

        console.log(WorkItem);
        // Validate parameters
        if (WorkItem.worktype == 2 && isNaN(WorkItem.inspectiondate.getTime()) && WorkItem.inspectionid) {
            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR003'));
        }
        else if(WorkItem.workitemid && WorkItem.worklogid && WorkItem.worktype && WorkItem.description && WorkItem.username) {

            // If there's an upload file
            if (uploadFile) {

                // Check if it's over the size limit
                if(uploadFile.truncated) {
                    error.code = "ERR500";
                    error.message = "File too large!";
                    res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                    return;
                } else {

                    // Upload file to server
                    logger.info("Uploading file to claims dir: " + uploadFile.name, req.id);
                    // check directory if exists else create
                    checkDir(uploadRootDir);
                    var claimDir = uploadRootDir + WorkItem.worklogid + '/';
                    checkDir(claimDir);

                    var now = datetime.create();
                    var datesuffix = now.format("Ymd-HMS");
                    var ext = path.extname(uploadFile.name);
                    WorkItem.attachment = 'attachment-' + datesuffix + ext;
                    WorkItem.type = uploadFile.mimetype;

                    uploadFile.mv(claimDir + WorkItem.attachment, function(error) {
                        if (error) {
                            res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                            return;
                        }

                        // Create workitem now
                        worklog.updateWorkLog(WorkItem, function(error, result) {
                            if (error) {
                                // Handle basic error
                                res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                                return;
                            }
                            if (result) {
                                WorkItem.workitemid = result;
                                res.json({
                                    success: true,
                                    workitem: WorkItem
                                });
                            } else {
                                res.json({
                                    success: false,
                                    workitem: null
                                });
                            }
                        });
                    });
                }

            } else {
                // Create workitem now
                worklog.updateWorkLog(WorkItem, function(error, result) {
                    console.log(result);
                    if (error) {
                        // Handle basic error
                        res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                        return;
                    }

                    if (result) {
                        WorkItem.workitemid = result;
                        res.json({
                            success: true,
                            workitem: WorkItem
                        });
                    } else {
                        res.json({
                            success: false,
                            workitem: null
                        });
                    }
                });
            }
        } else {
            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR003'));
        }

    },
    getAllWorkItemLog: function(req, res, next) {
        var numPerPage = parseInt(req.query.npp, 10) || 5;
        var page = parseInt(req.query.page, 10) || 0;
        var skip = (page-1)  * numPerPage;

        if(skip < 0) { skip = 0 }

        var worklogid = req.params.worklogid;

        if (worklogid) {
            worklog.getAllWorkItemLog(worklogid, function(error, results) {
                logger.info("getAllWorkItemLog [" + worklogid + "]");
                if (error) {
                    res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                    return;
                }

                logger.info("getAllWorkItemLog() ret: " + results.length);
                var rows = [];
                for (var i = 0; i < results.length; i++) {
                    rows.push(new WorkItemDetObj(results[i]));
                }

                if (results.length > 0) {
                    res.json({
                        success: true,
                        workitems: rows
                    });
                } else {
                    res.json({
                        success: false,
                        workitems: null
                    })
                }
            });
        } else {
            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR003'));
        }
    },
    getWorkItemLog: function(req, res, next) {

        var worklogid = req.params.worklogid;

        if (worklogid) {
            worklog.getWorkItemLog(worklogid, function(error, results) {
                logger.info("getWorkItemLog [" + worklogid + "]");
                if (error) {
                    res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                    return;
                }

                if (results.length == 1) {
                    var WorkItemDetails = new WorkItemDetObj(results[0]);
                    res.json({
                        success: true,
                        workitems: WorkItemDetails
                    });
                } else {
                    res.json({
                        success: false,
                        workitems: null
                    })
                }
            });
        } else {
            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR003'));
        }
    },
    uploadAttachment: function(req, res, next) {

        var Attachment = new AttachmentObj();

        Attachment.workitemid = parseInt(req.body.workitemid);
        var uploadFile = req.files.attachment;
        Attachment.auditwho = req.body.username;

        if (uploadFile && Attachment.workitemid) {

            // Check if it's over the size limit
            if(uploadFile.truncated) {
                error.code = "ERR500";
                error.message = "File too large!";
                res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                return;
            } else {

                // Upload file to server
                checkDir(uploadRootDir);
                var claimDir = uploadRootDir + WorkItem.worklogid + '/';
                checkDir(claimDir);

                var now = datetime.create();
                var datesuffix = now.format("Ymd-HMS");
                var ext = path.extname(uploadFile.name);
                Attachment.attachment = 'attachment-' + datesuffix + ext;
                Attachment.type = uploadFile.mimetype;

                uploadFile.mv(claimDir + Attachment.attachment, function(error) {
                    if (error) {
                        res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                        return;
                    }

                    // Create workitem now
                    worklog.createNewAttachment(Attachment, function(error, result) {
                        if (error) {
                            // Handle basic error
                            res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                            return;
                        }
                        if (result) {
                            Attachment.itemid = result;
                            res.json({
                                success: true,
                                attachment: Attachment
                            });
                        } else {
                            res.json({
                                success: false,
                                attachment: null
                            });
                        }
                    });
                });
            }

        } else {
            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR003'));
        }

    },
    updateAttachment: function(req, res, next) {
        var Attachment = new AttachmentObj();

        Attachment.itemid = parseInt(req.body.itemid);
        Attachment.workitemid = parseInt(req.body.workitemid);
        var uploadFile = req.files.attachment;
        Attachment.auditwho = req.body.username;

        if(uploadFile && Attachment.itemid && Attachment.workitemid) {
            // Check if it's over the size limit
            if(uploadFile.truncated) {
                error.code = "ERR500";
                error.message = "File too large!";
                res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                return;
            } else {

                // Upload file to server
                checkDir(uploadRootDir);
                var claimDir = uploadRootDir + WorkItem.worklogid + '/';
                checkDir(claimDir);

                var now = datetime.create();
                var datesuffix = now.format("Ymd-HMS");
                var ext = path.extname(uploadFile.name);
                Attachment.attachment = 'attachment-' + datesuffix + ext;
                Attachment.type = uploadFile.mimetype;

                uploadFile.mv(claimDir + Attachment.attachment, function(error) {
                    if (error) {
                        res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                        return;
                    }

                    // Create workitem now
                    worklog.updateAttachment(Attachment, function(error, result) {
                        if (error) {
                            // Handle basic error
                            res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                            return;
                        }
                        if (result) {
                            Attachment.itemid = result;
                            res.json({
                                success: true,
                                attachment: Attachment
                            });
                        } else {
                            res.json({
                                success: false,
                                attachment: null
                            });
                        }
                    });
                });
            }
        } else {
            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR003'));
        }

    },
    deleteAttachment: function(req, res, next) {
        var workitemid = parseInt(req.body.workitemid);
        var itemid = parseInt(req.body.itemid);

        if(workitemid && itemid) {
            worklog.deleteAttachment(itemid, workitemid, function(error, results) {
                if (error) {
                    res.status(constants.SERVER_ERROR_CODE).json(parseError(error));
                    return;
                }

                if (results.affectedRows == 1) {
                    res.json({
                        success: true,
                        message: "Deleted successfully!"
                    });
                } else {
                    res.json({
                        success: false,
                        message: "Delete error!"
                    })
                }
            });
        } else {
            res.status(constants.SERVER_ERROR_CODE).json(new errhandler('ERR003'));
        }

    }
};

module.exports = WorkLogHandler;