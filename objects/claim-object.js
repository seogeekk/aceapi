

var claimid,
    propertyid,
    propertyname,
    address1,
    address2,
    suburb,
    state,
    postcode,
    country,
    propertytypeid,
    propertytypename,
    latitude,
    longitude,
    claimtypeid,
    claimtypename,
    summary,
    description,
    submitteddate,
    submitteduser,
    status,
    statusname,
    reviewstartdate,
    reviewenddate,
    approvaldate,
    authoriseddate,
    approveruser,
    processeddate;

module.exports = { Claim, ClaimDetail };

function Claim() {
    this.claimid = claimid;
    this.propertyid = propertyid;
    this.claimtypeid = claimtypeid;
    this.summary = summary;
    this.description = description;
    this.submitteddate = submitteddate;
    this.submitteduser = submitteduser;
    this.status = status;
    this.reviewstartdate = reviewstartdate;
    this.reviewenddate = reviewenddate;
    this.approvaldate = approvaldate;
    this.authoriseddate = authoriseddate;
    this.approveruser = approveruser;
    this.processeddate = processeddate;
}

function ClaimDetail(Claim) {
    this.claimid = Claim.claimid;
    this.property = {
        id: Claim.propertyid,
        name: Claim.propertyname,
        address1: Claim.address1,
        address2: Claim.address2,
        suburb: Claim.suburb,
        state: Claim.state,
        postcode: Claim.postcode,
        country: Claim.country,
        propertytype: {
            typeid: Claim.propertytypeid,
            name: Claim.propertytypename
        },
        latitude: Claim.latitude,
        longitude: Claim.longitude
    };
    this.claimtype = {
        typeid: Claim.claimtypeid,
        name: Claim.claimtypename
    }
    this.summary = Claim.summary;
    this.description = Claim.description;
    this.submitteddate = Claim.submitteddate;
    this.submitteduser = Claim.submitteduser;
    this.status = {
        statusid: Claim.status,
        statusname: Claim.statusname
    }
    this.reviewstartdate = Claim.reviewstartdate;
    this.reviewenddate = Claim.reviewenddate;
    this.approvaldate = Claim.approvaldate;
    this.authoriseddate = Claim.authoriseddate;
    this.approveruser = Claim.approveruser;
    this.processeddate = Claim.processeddate;
}