

var staffid;
var username;
var staffname;
var department;
var accesstype;

module.exports = { Staff, StaffDetail };

function Staff(username) {
    this.username = username;
    this.staffid = staffid;
    this.staffname = staffname;
    this.department = department;
    this.accesstype = accesstype;
}

function StaffDetail(Staff) {
    this.username = Staff.username;
    this.staffid = Staff.staffid;
    this.staffname = Staff.staffname;
    this.department = {
                        id: Staff.departmentid,
                        name: Staff.departmentname
                      };
    this.accesstype = {
                        typeid: Staff.accesstypeid,
                        name: Staff.accesstypename
                      };
}