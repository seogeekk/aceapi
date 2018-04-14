var express = require('express');
var router = express.Router();


// Swagger
var swaggerJSDoc = require('swagger-jsdoc');
const swaggerUi = require('swagger-ui-express');
var path    = require("path");

var options = {
    swaggerDefinition: {
        info: {
            title: 'Ace API', // Title (required)
            version: '1.0.0', // Version (required)
        },
    },
    apis: ['./routes/index.js'], // Path to the API docs
};

// Initialize swagger-jsdoc -> returns validated swagger spec in json format
var swaggerSpec = swaggerJSDoc(options);

router.get('/swagger.json', function(req, res, next) {
    res.setHeader('Content-Type', 'application/json');
    res.send(swaggerSpec);
});

module.exports = router;