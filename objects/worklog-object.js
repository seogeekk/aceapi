
// Private declarations

var workitemid;
var worklogid;
var worktype;
var creationdate;
var description;
var notes;
var auditwho;
var auditwhen;

module.exports = { WorkItem, WorkItemDetail, Attachment, AttachmentDetail };

function WorkItem() {
    this.workitemid = workitemid;
    this.worklogid = worklogid; // Maps to claimid
    this.worktype = worktype;
    this.creationdate = Date.parse(creationdate);
    this.description = description;
    this.notes = notes;
    this.auditwho = auditwho;
    this.auditwhen = Date.parse(auditwhen);
}

function WorkItemDetail(workItem) {
    this.workitemid = parseInt(workItem.workitemid);
    this.worklogid = parseInt(workItem.worklogid);
    this.worktype = {
        typeid: workItem.worktype,
        name: workItem.worktypename
    };
    this.creationdate = Date.parse(workItem.creationdate);
    this.description = workItem.description;
    this.notes = workItem.notes;
    this.auditwho = workItem.auditwho;
    this.auditwhen = Date.parse(workItem.auditwhen);

    this.attachment = {
        itemid: workItem.itemid,
        attachment: workItem.attachment,
        type: {
            typeid: workItem.attachmenttype,
            typeext: workItem.filetypename
        },
        auditwho: workItem.attachwho,
        auditwhen: workItem.attachwhen
    }

}

var itemid;
var attachment;
var type; // attachment type

function Attachment(itemid) {
    this.itemid = itemid;
    this.workitemid = workitemid;
    this.attachment = attachment;
    this.type = type;
    this.auditwho = auditwho;
    this.auditwhen = auditwhen;
}

function AttachmentDetail(attachment) {
    this.itemid = attachment.itemid;
    this.workitemid = attachment.workitemid;
    this.attachment = attachment.attachment;
    this.type = {
        typeid: attachment.typeid,
        typeext: attachment.typeext
    }
    this.auditwho = attachment.auditwho
    this.auditwhen = attachment.auditwhen;
}