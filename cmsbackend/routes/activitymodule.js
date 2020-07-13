var express = require('express');
var activtymodlink = express.Router();
var QueryConfig = require('../CommonFunctions/configQueries');

activtymodlink.get('/getuserworklist', function(req, res) {
    try{
    QueryConfig.getEmployeeWorkList(7,function(adata){
    
        if(adata.length > 0)
        {
          res.json(adata);
    
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

activtymodlink.get('/getmanager', function(req, res) {
    try{
    QueryConfig.getReportingManager(req.userID,6,function(managerdata){
    //6 = activity .
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

activtymodlink.get('/getEmpProjects', function(req, res) {
    try{
    QueryConfig.getEmployeeProjects(req.userID,function(projectdata){
    //6 = activity .
        if(projectdata.length > 0)
        {
          res.json(projectdata);
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


activtymodlink.post('/saveworklist', function(req, res) {
   
  try{
  
  QueryConfig.saveWorkList(req.userID,req.body,function(inserted){
  
      if(inserted)
      {
        res.json("Work List Saved");
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


module.exports = activtymodlink;