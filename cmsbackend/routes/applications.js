var express = require('express');
var Applicationlink = express.Router();
var QueryConfig = require('../CommonFunctions/configQueries');


Applicationlink.get('/getleavetypes', function(req, res) {
try{
QueryConfig.getLeaveTypes(req.compID,function(leavedata){

    if(leavedata.length > 0)
    {
      res.json(leavedata);

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

Applicationlink.get('/getmanager', function(req, res) {
    try{
    QueryConfig.getReportingManager(req.userID,1,function(managerdata){
    
        if(managerdata.length > 0)
        {
          res.json(managerdata);
    
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

Applicationlink.get('/getleavebalances', function(req, res) {
    try{
    QueryConfig.getLeaveBalances(req.userID,function(balancedata){
    
        if(balancedata.length > 0)
        {
          res.json(balancedata);
    
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


Applicationlink.get('/getapplicationrecords', function(req, res) {
    try{
    QueryConfig.getApplicationrecords(req.userID,function(app_records){
    
        if(app_records.length > 0)
        {
          res.json(app_records);

    
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

Applicationlink.get('/validateapplication', function(req, res) {
    try{
    QueryConfig.checkApplication(req.userID,req.query.from,req.query.to,function(check){
    
        if(check.length > 0)
        {
          res.json(false);
    
        }else 
        {
            res.json(true);
        } 
    
    });
    }
    catch(err)
    {
        res.status(404).send(err);
    }
});

Applicationlink.post('/appliedapplication', function(req, res) {
   
    try{
    
    QueryConfig.submitapplication(req.userID,req.body,function(inserted){
    
        if(inserted.affectedRows>0)
        {
          res.json("Application Applied successfully");
          //res.send(); 
    
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

module.exports = Applicationlink;