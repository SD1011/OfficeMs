var express = require('express');
var Authentication = express.Router();
var bcrypt =require('bcrypt'); 
const jwt = require('jsonwebtoken');
var QueryConfig = require('../CommonFunctions/configQueries');
var bodyParser = require("body-parser"); 
var cookieParser = require('cookie-parser');

process.env.SECRET_KEY = '#@securekey$#0519238476';

Authentication.use(bodyParser.urlencoded({extended: true}));
Authentication.use(cookieParser());

// main code starts//
Authentication.post('/login', function(req, res)
{
  QueryConfig.AuthResult(req.body.CompanyCode,req.body.AssociateEmail, function(rows) 
  {
    
      if(rows.length > 0)
      {
        
      const match=  bcrypt.compareSync(req.body.AssociatePassword,rows[0].password);
          if(match)
          { 
           var  _uId = rows[0].emp_id;
           var  _cID = rows[0].comp_id;
         
        const token = jwt.sign({ _uId,_cID }, process.env.SECRET_KEY,{ algorithm:'HS256',expiresIn:1200});//20 minutes of exp

             //res.cookie("ssess_id",token);  //save secure token in cookies  (_id )
             res.status(200).send( {token : token});
             
          } else { 
            res.status(401).send("Password does not match !! Incorrect password");
           
            }  
      }
      else { 
          
        res.status(401).send("Access Code or Email does not exist !! Please check and enter again"); 

        }
    
   });
});
module.exports = Authentication;
