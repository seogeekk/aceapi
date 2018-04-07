

var propertyid;
var property_canonical_id;
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
var unit_type;
var mesh_block;

module.exports = { Property, PropertyDetail };


function Property() {
    this.propertyid = propertyid;
    this.property_canonical_id = property_canonical_id;
    this.address1 = address1;
    this.address2 = address2;
    this.suburb = suburb;
    this.state = state;
    this.postcode = postcode;
    this.country = country;
    this.propertytype = propertytype;
    this.latitude = latitude;
    this.longitude = longitude;
    this.unit_type = unit_type;
    this.mesh_block = mesh_block;
}

function PropertyDetail(Property) {
    this.propertyid = Property.propertyid;
    this.property_canonical_id = Property.property_canonical_id;
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
    this.unit_type = Property.unit_type;
    this.mesh_block = Property.mesh_block;
}
