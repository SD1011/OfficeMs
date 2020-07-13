/*  script include COMMON database queries useful in all API'S
*   created export functions  
*/
var ObjDb = require('../connection/DbConnectivity');
exports.AuthResult = function(comp_code,email ,callback) 
{ var AuthCheck = "select * from employee  join company on employee.comp_id=company.comp_id" +
" where comp_code='"+comp_code+"'" +
" and email='"+email+"'" +
" and employee.active='Y' and company.active='1'";
 
    ObjDb.query(AuthCheck, function(err, rows, fields) {
      if (err) {
      
        console.log(err);
        
      }
      return callback(rows);
    });
}

exports.Userprofile = function(_id,callback) 
{  //note : keep space in every query line
var userquery = "select e.comp_id,compname,ticket_number,first_name,sur_name,concat(first_name,' ', middle_name,' ',sur_name) as fullname,"+
" address1,address2,contact_num,email,birth_date,"+
" joining_date,fnf_date,from_date,emp_status,job_title,department_name,level_code,loc_name,w1,w2,w3"+
" from employee e"+
" join employee_professional_data ed on ed.emp_id=e.emp_id"+
" join company c on c.comp_id =e.comp_id"+
" join comp_dept cd on cd.dep_id=ed.department"+
" join company_level cl on cl.level_id=ed.level"+
" join company_location loc on loc.loc_id=ed.location"+
" where e.emp_id="+_id+
" and e.active='Y' and c.active='1' and ed.to_date='0000-00-00'";


    ObjDb.query(userquery, function(err, rows, fields) {
      if (err) {
      
        console.log(err);
        
      }
      return callback(rows);
    });
}

exports.getLeaveTypes = function(_cID,callback) 
{  //note : keep space in every query line
var leavetypequery = "select leave_type_id,leave_type_name from company_leave_types where comp_id="+_cID +" and active=1";

    ObjDb.query(leavetypequery, function(err, rows, fields) {
      if (err) {
      
        console.log(err);
        
      }
      return callback(rows);
    });
}

exports.getReportingManager = function(_uID,application_type,callback) 
{  //note : keep space in every query line
/*var reportingmanagerquery = "select emp.emp_id,concat(first_name,' ', middle_name,' ',sur_name) as fullname"+ 
" from reporting_manager rm"+  
" join employee emp on emp.emp_id=rm.manager_emp_id"+
" where rm.emp_id=" +_uID +" and"+
" application_type_id="+application_type+" and "+
" rm.active_to='0000-00-00' and rm.active=1"; */

var reportingmanagerquery = "select emp.emp_id,concat(first_name,' ', middle_name,' ',sur_name) as fullname,application_type_id"+ 
" from reporting_manager rm"+  
" join employee emp on emp.emp_id=rm.manager_emp_id"+
" where rm.emp_id=" +_uID +" and"+
" rm.active_to='0000-00-00' and rm.active=1";

    ObjDb.query(reportingmanagerquery, function(err, rows, fields) {
      if (err) {
      
        console.log(err);
        
      }
      return callback(rows);
    });
}

exports.getLeaveBalances = function(_uID,callback) 
{  //note : keep space in every query line
var leavebalancequery = "select eb.leave_type_id,leave_type_name,first_opening_balance,appliedapplications.applieddays,credit_between,debited_between,lapse_leaves,taken_leaves,"+ 
" (first_opening_balance-(IFNULL(availeddays,0))-(IFNULL(applieddays,0))) as projected_balance,(first_opening_balance-(IFNULL(availeddays,0))) as closing_balance"+
" from employee_leave_balance eb" +
" join company_leave_types lt on lt.leave_type_id=eb.leave_type_id" +
" left join (" +
  " select leave_type_id,sum(number_of_days) as applieddays"+
  " from employee_applications"+
  " where status_id=1 and emp_id=" +_uID +" group by leave_type_id"+
  " ) as appliedapplications  on appliedapplications.leave_type_id=eb.leave_type_id"+
" left join ("+
  " select leave_type_id,sum(leave_availed_days) as availeddays"+
  " from employee_applications"+
  " where status_id=2 and emp_id=" +_uID +" group by leave_type_id"+
  " ) as approvedapplications  on approvedapplications.leave_type_id=eb.leave_type_id"+
" where emp_id=" +_uID +" and active_to='0000-00-00' and active=1";

    ObjDb.query(leavebalancequery, function(err, rows, fields) {
      if (err) {
      
        console.log(err);
        
      }
      return callback(rows);
    });
}
exports.checkApplication = function(_uID,startdate,enddate,callback) 
{  //note : keep space in every query line
var checkappquery = "select application_id"+
" FROM employee_applications where  emp_id="+_uID+
" AND (( '"+startdate+"' BETWEEN from_date AND to_date)"+
" OR ( '"+enddate+"' BETWEEN from_date AND to_date))";

  ObjDb.query(checkappquery, function(err, rows) {
      if (err) {
      
        console.log(err);
        
      }
      return callback(rows);
    }); 
     
}

exports.submitapplication = function(_uID,postdata,callback) 
{  
var querydata =[_uID,postdata.ApplicationType,postdata.LeaveTypeId,postdata.AppFromToDate,'09:30',postdata.AppToDate,'18:30',postdata.Numberofdays,null,null,postdata.AppRemark,postdata.OdDetails,postdata.ReportingTo,postdata.ApplicationStatus,null];

var submitapplicationquery = "INSERT INTO employee_applications VALUES (NULL, ?, now()," + _uID + ",'0000-00-00 00:00:00',0)";

   ObjDb.query(submitapplicationquery,[querydata], function(err, rows, fields) {
      if (err) {
      
        console.log(err);
        
      }
      return callback(rows);
    }); 
    
       
}

exports.getApplicationrecords = function(_uID,callback) 
{  //note : keep space in every query line
var applicationrecordsquery = "select application_id,concat(from_date,'  To  ',to_date) as application_date,number_of_days,leave_availed_days,credited_days,application_remark,od_details,application_type_name,ap.leave_type_id,leave_type_name,ap.status_id,application_status_name,irr_type_name from employee_applications ap"+
" join sys_applicationtypes at on at.application_type_id=ap.application_type_id"+
" left join company_leave_types lt on lt.leave_type_id=ap.leave_type_id"+
" join sys_static_applicationstatus aps on aps.status_id=ap.status_id"+
" left join employee_irregular_attendance irr_att on irr_att.attendance_id=ap.attendance_id"+
" left join sys_static_irregular_attendance_type irr_att_type on irr_att_type.irr_type_id=irr_att.irr_type_id"+
" where ap.emp_id="+_uID +" order by from_date desc";


    ObjDb.query(applicationrecordsquery, function(err, rows, fields) {
      if (err) {
      
        console.log(err);
        
      }
      return callback(rows);
    });
}

exports.getAttendanceData = function(_uID,callback) 
{  //note : keep space in every query line
var attendancedataquery = "select attendance.attendance_id,date_of_attendance,from_time,to_time,working_hours,IF(att_status_id=2,'Present','Absent') as attendance_status," +
" GROUP_CONCAT(irr_type_name) as irr_type" +
" from employee_attendance attendance "+
" join employee_irregular_attendance irr on attendance.attendance_id=irr.attendance_id" +
" join sys_static_irregular_attendance_type irrtype on irrtype.irr_type_id=irr.irr_type_id" +
" where emp_id=" +_uID +
" GROUP BY attendance.attendance_id";

    ObjDb.query(attendancedataquery, function(err, rows, fields) {
      if (err) {
      
        console.log(err);
        
      }
      return callback(rows);
    });
}

exports.getEmployeeWeekOff = function(_uID,startdate,enddate,callback) 
{  //note : keep space in every query line
var weekoffquery = "select from_date,to_date,w1,w2,w3"+
" FROM employee_professional_data where fnf_date='0000-00-00' and emp_id="+_uID+
" AND ((to_date IS NULL AND from_date <='"+startdate+"')"+
" OR ( '"+startdate+"' BETWEEN from_date AND '"+enddate+"')"+
" OR ( '"+enddate+"' BETWEEN from_date AND to_date)" +
" OR from_date between '"+startdate+"' AND '"+enddate+"')" +
" order by from_date";

  ObjDb.query(weekoffquery, function(err, rows) {
      if (err) {
      
        console.log(err);
        
      }
      return callback(rows);
    }); 
     
}



exports.getCompanyMonths = function(_cID,monthclause,yearclause,statusclause,callback) 
{  //note : keep space in every query line
  var whereclause;
if(monthclause){
  whereclause =" month="+monthclause + " and " ;}
else if (statusclause){
whereclause = " status='"+statusclause+ "' and " ;}
else if(yearclause) {
  whereclause = " year="+yearclause +" and " ; }
else if(monthclause && statusclause) {
  whereclause = " month="+monthclause + " and status='"+statusclause+ "' and ";}
  else if(monthclause && yearclause) {
    whereclause = " month="+monthclause + " and year="+yearclause+ " and ";}
    else if(statusclause && yearclause ) {
      whereclause = " year="+yearclause + "and status='"+statusclause+ "' and ";}
      else if(monthclause && statusclause && yearclause ) {
        whereclause = " month="+monthclause + " year="+yearclause + "and status='"+statusclause+ "' and ";}
else
{
whereclause="";
}
var companymonthquery = "SELECT year,month,start_date,if(date(now())<end_date,date(now()),end_date) as end_date"+
 " FROM sys_dynamic_company_months where" + whereclause+  " comp_id=" +_cID+ " order by month desc ";


  ObjDb.query(companymonthquery, function(err, rows) {
      if (err) {
      
        console.log(err);
        
      }
     return callback(rows);
    
    }); 
     
}

/* activity module */

exports.getEmployeeWorkList= function(_uID,callback) 
{  //note : keep space in every query line
var worklistquery = "select wl.from_date,wl.to_date,cp.project_name,subject,list  from employee_worklist wl"+
" left join company_projects cp  on wl.project_id=cp.project_id"+
" where emp_id ="+_uID+" order by wl.from_date";

  ObjDb.query(worklistquery, function(err, rows) {
      if (err) {
      
        console.log(err);
        
      }
      return callback(rows);
    }); 
     
}

exports.getEmployeeProjects = function(_uID,callback) 
{  //note : keep space in every query line
var a = "select project_name,client_name,client_details,project_category,project_description,project_status,cp.from_date,expected_date from employee_projects ep" +
" join  company_projects cp on cp.project_id=ep.project_id"+
" where emp_id="+_uID+" and to_date='0000-00-00' and cp.end_date='0000-00-00'";

  ObjDb.query(a, function(err, rows) {
      if (err) {
      
        console.log(err);
        
      }
      return callback(rows);
    }); 
     
}


exports.saveWorkList = function(_uID,postdata,callback) 
{  
var querydata =[_uID,postdata.ReportingTo,postdata.SecondManager,postdata.FromDate,postdata.ToDate,postdata.Project,postdata.Subject,postdata.prioritylist];
var saveworklistquery = "INSERT INTO employee_worklist VALUES (NULL, ? , " + _uID + ",now()," + _uID + ",now())";


   ObjDb.query(saveworklistquery,[querydata], function(err, rows, fields) {
      if (err) {
      console.log(err);
        return callback(false);
        
      }
      return callback(true);
    }); 
    
}