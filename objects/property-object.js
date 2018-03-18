

var propertyid;
var propertyname;
var address1;
var address2;
var suburb;
var state;
var postcode;
var country
var propertytype;
var typename;
var latitude
var longitude;

module.exports = { Property, PropertyDetail };


function Property() {
    this.propertyid = propertyid;
    this.propertyname = propertyname;
    this.address1 = address1;
    this.address2 = address2;
    this.suburb = suburb;
    this.state = state;
    this.postcode = postcode;
    this.country = country;
    this.propertytype = propertytype;
    this.latitude = latitude;
    this.longitude = longitude;
}

function PropertyDetail(Property) {
    this.propertyid = Property.propertyid;
    this.propertyname = Property.propertyname;
    this.address1 = Property.address1;
    this.address2 = Property.address2;
    this.suburb = Property.suburb;
    this.state = Property.state;
    this.postcode = Property.postcode;
    this.country = Property.country;
    this.propertytype = {
        typeid: Property.propertytypeid,
        name: Property.propertytypename
    };
    this.latitude = Property.latitude;
    this.longitude = Property.longitude;
}
