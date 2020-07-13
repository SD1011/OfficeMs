
var socket_io = require('socket.io');
var io       = socket_io();
var socketio = {};
socketio.io  = io;
var users = [];

 io.on('connection', function(socket){
    
    console.log('A user connected');

    socket.on('join', function (user){
       socket.username = user.username;
       users.push(socket.username);
       io.emit('user joined', { 'username': user.username, users:users });
       console.log({ 'username': user.username, users:users });
    });

    
    socket.on('typing', function (msg) {
        io.emit('typing', { 'message': msg.message, 'username': msg.username });
    });

    socket.on('new_message', function (msg) {
         io.emit('chat message', { 'message': msg.message, 'username': msg.username });
    });
    
    socket.on('disconnect', function(){
        console.log('user disconnected');
        users.splice(users.indexOf(socket.username), 1);
        io.emit('user disconnected', { 'username': socket.username });
    });
     
 });
 
module.exports = socketio;


/*var express = require('express');
var router = express.Router();
//var mongoose = require('mongoose');
var app = express();
var server = require('http').createServer(app);
var io = require('socket.io')(server);
//var Chat = require('../models/Chat.js');

server.listen(4000);

// socket io
io.on('connection', function (socket) {
  console.log('User connected');
  socket.on('disconnect', function() {
    console.log('User disconnected');
  });
  socket.on('save-message', function (data) {
    console.log(data);
    io.emit('new-message', { message: data });
  });
});

/* GET ALL CHATS 
router.get('/:room', function(req, res, next) {
 // Chat.find({ room: req.params.room }, function (err, chats) {
   // if (err) return next(err);
    //res.json(chats);
  //});
});

/* GET SINGLE CHAT BY ID 
router.get('/:id', function(req, res, next) {
  //Chat.findById(req.params.id, function (err, post) {
   // if (err) return next(err);
   // res.json(post);
  //});
});

/* SAVE CHAT 
router.post('/', function(req, res, next) {
  //Chat.create(req.body, function (err, post) {
    //if (err) return next(err);
    //res.json(post);
  //});
});

/* UPDATE CHAT 
router.put('/:id', function(req, res, next) {
 // Chat.findByIdAndUpdate(req.params.id, req.body, function (err, post) {
 //   if (err) return next(err);
  //  res.json(post);
  //});
});

/* DELETE CHAT 
router.delete('/:id', function(req, res, next) {
  //Chat.findByIdAndRemove(req.params.id, req.body, function (err, post) {
  //  if (err) return next(err);
  //  res.json(post);
 // });
});

module.exports = router;

*/

/*
var express = require('express');
var stream = express.Router();
io = require('socket.io')();
stream.io=io;

io.of('/st/api').on('connection', function (socket) {
   console.log('User has connected to Index');


   socket.on('join', function(data){
     //joining
     console.log(data);
     socket.join(data.room);

     console.log(data.user + 'joined the room : ' + data.room);

     socket.broadcast.to(data.room).emit('new user joined', {user:data.user, message:'has joined this room.'});
   
   });


   socket.on('leave', function(data){
   
     console.log(data.user + 'left the room : ' + data.room);

     socket.broadcast.to(data.room).emit('left room', {user:data.user, message:'has left this room.'});

     socket.leave(data.room);
   });

   socket.on('message',(data) =>{

      socket.broadcast.to(data.room).emit('new',{user:data.user, message:data.message});
       
   })
});

   module.exports=   stream;
*/

