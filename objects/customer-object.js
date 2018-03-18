

// Private variables

var custid;
var custtypeid;
var custclass;
var username;
var custname;
var address1;
var address2;
var suburb;
var state;
var postcode;
var country;
var custtype;

var customertypeid;
var custclass;
var name;
var abn;
var contactnumber;


module.exports = {Customer, CustClass, CustomerDetails};


function Customer(custid) {
    this.customerid = custid;
    this.customertypeid = custtypeid;
    this.custclass = custclass;
    this.username = username;
    this.customername = custname;
    this.address1 = address1;
    this.address2 = address2;
    this.suburb = suburb;
    this.state = state;
    this.postcode = postcode;
    this.country = country;
}

function CustomerDetails(Customer) {
    this.customerid = Customer.customerid;
    this.customertype = { typeid: Customer.custtypeid, name: Customer.custtype };
    this.custclass = Customer.custclass;
    this.username = Customer.username;
    this.customername = Customer.customername;
    this.address1 = Customer.address1;
    this.address2 = Customer.address2;
    this.suburb = Customer.suburb;
    this.state = Customer.state;
    this.postcode = Customer.postcode;
    this.country = Customer.country;
}

function CustClass(custclass) {
    this.custclass = custclass;
    this.name = name;
    this.abn = abn;
    this.contactnumber = contactnumber;
    this.address1 = address1;
    this.address2 = address2;
    this.suburb = suburb;
    this.state = state;
    this.postcode = postcode;
    this.country = country;
}