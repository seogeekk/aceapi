var express = require('express');
var path = require('path');
var favicon = require('serve-favicon');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var fileUpload = require('express-fileupload');
var cors = require('cors');

// routes
var index = require('./routes/index');

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');

// uncomment after placing your favicon in /public
//app.use(favicon(path.join(__dirname, 'public', 'favicon.ico')));
app.use(cors());

var addRequestId = require('express-request-id')();

app.use(addRequestId);

// set-up access logging
var fs = require('fs');
var requestLogDir = process.env.REQUEST_DIRECTORY;
if (!fs.existsSync(requestLogDir)){
    fs.mkdirSync(requestLogDir);
}
var accessLogStream = fs.createWriteStream(path.join(requestLogDir, 'access.log'), {flags: 'a'})
app.use(logger('dev'));
app.use(logger(':remote-addr - :remote-user [:date[clf]] ":method :url HTTP/:http-version" :status :res[content-length] ":referrer" ":user-agent" - :response-time ms', {stream: accessLogStream}));

// body parser and file upload
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());

app.use(fileUpload());

// Swagger UI
var auth = require('http-auth');

// Basic authentication
var basic = auth.basic({
        realm: "swagger-ui",
    }, function (username, password, callback) {
        callback(username === "sweg" && password === "swaggeryou");
    }
);
var authMiddleware = auth.connect(basic);
app.use( "/api-docs", [ authMiddleware, express.static(path.join(__dirname, 'api-docs')) ] );
app.use('/', require('./middlewares/swagger'));

// Auth Middleware
app.all('/inspection-view/*', [require('./middlewares/validateToken')]);
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
