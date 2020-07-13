var createError = require('http-errors');
const cors = require('cors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var app = express();


/* create route variable for api files  Start-here */
var UserAuthRoute = require('./UserLogin/authentication');
var auth =require('./UserLogin/checkauth');
var UserProfileRoute = require('./routes/UserProfile');
var ApplicationRoute =require('./routes/applications');
var AttendanceRoute =require('./routes/attendance');
var ActivtyRoute =require('./routes/activitymodule');
/* create route variable for api files  END -here */


//app.io = require('socket.io')();
//app.io.path('/chat/socket.io');
//require('./stream/ioStream')(app.io);
//var streaming = require('./stream/ioStream');

app.use(cors());
app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());

/*Link with angular (prod)front end application */
app.use(express.static(path.join(__dirname, 'public/cms')));

/*assign route link  START*/
app.use('/authentication', UserAuthRoute); //login authentication
app.use('/profile',auth.isauthenticatedJWT,UserProfileRoute); //get profile deatils 
app.use('/activity',auth.isauthenticatedJWT,ActivtyRoute); // Save worklist and project related api's
app.use('/empapplication',auth.isauthenticatedJWT,ApplicationRoute); //all related to user applications(leave,od,work from home,etc)
app.use('/attendance',auth.isauthenticatedJWT,AttendanceRoute); //mark, show and all related to attendance &irregularity
//app.use('./chat',streaming);
/*assign route link  START*/


// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
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
