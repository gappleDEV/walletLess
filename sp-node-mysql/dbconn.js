//MATTHEW AQUILES
//WALLETLESS LLC

var mysql = require('mysql');

var connection = mysql.createPool({
  host:'localhost',
  user:'root',
  password:'p0o9I*U&',
  database:'walletlessDB'
});

module.exports = connection;
