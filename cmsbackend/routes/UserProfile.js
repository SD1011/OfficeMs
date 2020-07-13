var express = require('express');
var Profilelink = express.Router();
var QueryConfig = require('../CommonFunctions/configQueries');

process.env.SECRET_KEY = '#@securekey$#0519238476';


Profilelink.get('/userdetails', function(req, res) {
    
try{
//var decoded = jwt.verify(req.headers['authorization'], process.env.SECRET_KEY,{ algorithm:'HS256'});

QueryConfig.Userprofile(req.userID,function(userdata){

    if(userdata.length > 0)
    {
      res.json(userdata);
     
    }else 
    {
        res.status(400).send('zero result');
    } 

});
}
catch(err)
{
    res.status(404).send(err);
}

   
   }); 

   
   
   module.exports = Profilelink;