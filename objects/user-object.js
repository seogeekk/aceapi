
// Private declarations
var userid;
var username;
var firstname;
var lastname;
var roleid;
var mobilenumber
var emailaddress;
var status;
var actiontype;
var ipaddress;
var page;

// Public declarations
module.exports = { User, UserLog };

function User(username) {
    this.userid = userid;
    this.username = username;
    this.fisrtname = firstname;
    this.lastname = lastname;
    this.roleid = roleid;
    this.mobilenumber = mobilenumber;
    this.emailaddress = emailaddress;
    this.status = status;
}


function UserLog(username, actiontype, ipaddress, page) {
    this.username = username;
    this.actiontype = actiontype;
    this.ipaddress = ipaddress;
    this.page = page;
}