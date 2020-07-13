/*  script include COMMON functions useful for all API'S
*
*/
var moment = require('moment');         

/*this function used to get date array to represent attendance*/
exports.getDates= function (StartDate, EndDate) {
    var dateArray = [];
    var currentDate = moment(StartDate);
    var EndDate = moment(EndDate);
    while (currentDate <= EndDate) {
        dateArray.push( {'date' : moment(currentDate).format('YYYY-MM-DD')} )
        currentDate = moment(currentDate).add(1, 'days');
    }
    return dateArray;
}

/*for internal use */
function getDates(StartDate, EndDate) {
    var dateArray = [];
    var currentDate = moment(StartDate);
    var EndDate = moment(EndDate);
    while (currentDate <= EndDate) {
        dateArray.push( {'date' : moment(currentDate).format('YYYY-MM-DD')} )
        currentDate = moment(currentDate).add(1, 'days');
    }
    return dateArray;
}

exports.config_AttendanceRecord_with_MonthDates=function(arr1,arr2,arr3){
    let AttendanceRecords = [];    
    var nulldata = {
        "attendance_id": null,
        "date_of_attendance":  null,
        "from_time":  null,
        "to_time":  null,
        "working_hours":  null,
        "attendance_status": "Not Processed",
        "irr_type": "Not Processed"
    }; // used to get where data is not process     

    for (var i = 0; i < arr1.length; i++) {
        arr2.forEach(e2 => 
         {
           if(arr1[i].date === e2.date_of_attendance)
            {
              if(AttendanceRecords.find(o => o.date === arr1[i].date))
              { 
                AttendanceRecords.pop(AttendanceRecords.find(o => o.date === arr1[i].date));
                AttendanceRecords.push({...arr1[i],...e2});  
              } else 
              {
               AttendanceRecords.push({...arr1[i],...e2}); 
              }
            } else 
            {  
             if(!AttendanceRecords.includes(arr1[i]) && !AttendanceRecords.find(o => o.date === arr1[i].date))
              {  
              AttendanceRecords.push({...arr1[i],...nulldata});
              } 
            }
        });           
    };

 // set attendance as weekly-off  start from here 
    AttendanceRecords.forEach(attdate => {
        

      var weekoffarr =[]  //will contain weekoff dates as per employee professional data
        
        /*start pushing weekoffarr */
        arr3.forEach(variableweekoff => {
            
            var w1=variableweekoff.w1;
            var w2=variableweekoff.w2;
            var w3=variableweekoff.w3;

            if(variableweekoff.to_date !='0000-00-00') {
            
              getDates(variableweekoff.from_date,variableweekoff.to_date).forEach(element => {
                var day = new Date(element.date); 
                
                if(day.getDay() == w1 || day.getDay() == w2 || day.getDay() ==w3 )
                {
                 weekoffarr.push({...element});
               
                }
               });
            }
            else {
              
                getDates(variableweekoff.from_date,attdate[attdate.length-1]).forEach(element => {
                    var day = new Date(element.date); 
                   
                    if(day.getDay() == w1 || day.getDay() == w2 || day.getDay() ==w3 )
                    {
                     weekoffarr.push({...element});
                    }
                });
            }          
        });
        /*End of Weekoffarr */

        //compare and map weekoff status using weekoffarr dates and attendance dates
     weekoffarr.forEach(element => {
           if(element.date == attdate.date)
           { 
            attdate.attendance_status= "Weekly-Off";
            attdate.irr_type= null;
           } 
        });
       
        
    });
    
return AttendanceRecords;
}       


    