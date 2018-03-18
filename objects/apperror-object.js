

var code;
var message;
var stack;

// ERROR CODE
var HashMap = require('hashmap');
var ErrorCodes = new HashMap();

ErrorCodes.set("ERR001", "No results");
ErrorCodes.set("ERR002", "User does not exists");
ErrorCodes.set("ERR404", "Not Found");
ErrorCodes.set("ERR401", "Invalid Credentials");
ErrorCodes.set("ERR003", "Invalid Parameters");
ErrorCodes.set("ERR004", "Invalid Account Status");
ErrorCodes.set("400", "Bad Request");

module.exports = AppError;

function AppError(code, message, stack) {
    this.code = code || "APP001";
    // get description if exists
    var desc = ErrorCodes.get(code);
    if (message) {
        this.message = message;
    } else if (desc) {
        this.message = desc;
    } else {
        this.message = "Unhandled Error";
    }
    this.stack = stack;
    console.log("Exception Occured: " + this.code + " - " + this.message);
}