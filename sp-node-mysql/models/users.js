/* AUTHOR: MATTHEW AQUILES
** WALLETLESS LLC
** DATE LAST EDITED: 3/1/2017
** NOTES: MODEL CREATED TO DEFINE FUNCTIONS TO QUERY USERS TABLE IN walletlessDB
*/

var db = require('../dbconn'); //reference to dbconn.js file to conenct to database

var users ={
  //query all users in users table
  getAllUsers:function(callback){
    return db.query("select * from users", callback);
  },
  //query for user info by id in users table
  getUsersById:function(id, callback){
    return db.query("select * from users where user_id=?", [id], callback);
  },
  //query to add a new user to the users table
  addUser:function(User, callback){
    return db.query("insert into users values(?,?,?,?)",
      [User.user_id,
       User.password,
       User.create_date,
       User.is_active], callback);
  },
  //query to delete a user from the users table
  deleteUser:function(id, callback){
    return db.query("delete from users where user_id=?", [id], callback);
  },
  //query to update data in users table by id
  updateUser:function(id, User, callback){
    return db.query("update users set password=?, create_date=?, is_active=? where user_id=?",
                    [User.password,
                     User.create_date,
                     User.is_active, id], callback);
  }
};

//export functions to use in other js files
module.exports = users;
