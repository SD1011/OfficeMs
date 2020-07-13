/*database connectivvity */

var mysql = require('mysql');
var DataConnector = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "root1234",
  database: "oms",
  dateStrings : true  // used to get date in string from 
});

DataConnector.connect(function(err) {
  if (err) throw err;
  console.log("Connected With Database!");
});

module.exports = DataConnector;
