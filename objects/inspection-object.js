
var inspectionid,
    workitemid,
    description,
    response,
    submitteddate,
    responsedate,
    inspectiondate,
    auditwho,
    auditwhen;

module.exports = { Inspection, InspectionDetail };

function Inspection () {
    this.inspectionid = inspectionid;
    this.workitemid = workitemid;
    this.description = description;
    this.response = response;
    this.submitteddate = submitteddate;
    this.responsedate = responsedate;
    this.inspectiondate = inspectiondate;
    this.auditwho = auditwho;
    this.auditwhen = auditwhen;
}

function InspectionDetail (inspection) {
    this.inspectionid = inspection.inspectionid;
    this.workitemid = inspection.workitemid;
    this.description = inspection.description;
    this.response =  {
        responseid: inspection.responseid,
        responsename: inspection.responsename
    };
    this.submitteddate = inspection.submitteddate;
    this.responsedate = inspection.responsedate;
    this.inspectiondate = inspection.inspectiondate;
    this.auditwho = inspection.auditwho;
    this.auditwhen = inspection.auditwhen;
}
