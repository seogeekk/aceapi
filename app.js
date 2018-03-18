var express = require('express');
var path = require('path');
var favicon = require('serve-favicon');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var fileUpload = require('express-fileupload');
var cors = require('cors');

// logger-related
// var uuid = require('node-uuid');
// var cls = require('continuation-local-storage');
// var namespace = cls.createNamespace('my request');

// routes
var index = require('./routes/index');

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');

// uncomment after placing your favicon in /public
//app.use(favicon(path.join(__dirname, 'public', 'favicon.ico')));
app.use(cors());
app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
app.use(fileUpload());

// Swagger
var swaggerJSDoc = require('swagger-jsdoc');
const swaggerUi = require('swagger-ui-express');

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

app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerSpec));
// swaggerUi.runner.config.swagger.securityHandlers = {
//     apikey1: function (req, authOrSecDef, scopesOrApiKey, callback) {
//         // ...
//     }
// }
//
// // install middleware
// swaggerUi.register(app);

// Run the context for each request. Assign a unique identifier to each request
// app.use(function(req, res, next) {
//     namespace.run(function() {
//         namespace.set('reqId', uuid.v1());
//         next();
//     })
// });

// Auth Middleware
app.all('/api/*', [require('./middlewares/validateRequest')]);

app.use('/', require('./routes/index'));

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
