var express = require('express');
var Attendancelink = express.Router();
var QueryConfig = require('../CommonFunctions/configQueries');
var callfunction = require('../CommonFunctions/functions');

Attendancelink.get('/getmonths', function(req, res) {
    
  try{
  QueryConfig.getCompanyMonths(req.compID,null,req.query.year,null,function(result){
  
    var monthlist=[];
    var month= ["January","February","March","April","May","June","July",
    "August","September","October","November","December"];


 var month_name = {
  "month_name": null,
 
};
      if(result.length > 0)
      {
        result.forEach(element => {

          monthlist.push({...element,...{"month_name":month[element.month]}});
          
       
        }); 
        
        res.json(monthlist);
  
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


Attendancelink.get('/getattendancedata', function(req, res) {
  try {
      var  MonthDates,AttendanceRecords;
    
    QueryConfig.getAttendanceData(req.userID,function(Attendancedata){

      if(Attendancedata.length > 0) {  
        
        QueryConfig.getCompanyMonths(req.compID,req.query.month,2020,null,function(montharray) { 

         MonthDates=callfunction.getDates(montharray[0].start_date, montharray[montharray.length-1].end_date);  
       
           QueryConfig.getEmployeeWeekOff(req.userID,montharray[0].start_date,montharray[montharray.length-1].end_date,
            function(EmpWeekOff) {
         
            AttendanceRecords=callfunction.config_AttendanceRecord_with_MonthDates(MonthDates,Attendancedata,EmpWeekOff);
            res.json(AttendanceRecords); 
          
           });
          
        });
         
        } else {
          res.status(400).send('zero result');
        } 
    
    });

  }
  catch(err)
    {
     res.status(404).send(err);
    }
}); 

module.exports = Attendancelink;