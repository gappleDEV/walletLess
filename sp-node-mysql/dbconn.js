/* AUTHOR: MATTHEW AQUILES
** WALLETLESS LLC
** DATE LAST EDITED: 3/1/2017
** NOTES: DEFINE CONNECTION TO DB
*/

var mysql = require('mysql');

var connection = mysql.createPool({
  host:'localhost',
  user:'root',
  password:'p0o9I*U&', //should probably not hard code this, but its ok for now
  database:'walletlessDB'
});

module.exports = connection;
