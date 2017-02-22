var db = require('../dbconn'); //reference to dbconn.js file

var users ={
  getAllUsers:function(callback){
    return db.query("select * from users", callback);
  },
  getUsersById:function(id, callback){
    return db.query("select * from users where user_id=?", [id], callback);
  },
  addUser:function(User, callback){
    return db.query("insert into users values(?,?,?,?)",
      [User.user_id,
       User.password,
       User.create_date,
       User.is_active], callback);
  },
  deleteUser:function(id, callback){
    return db.query("delete from users where user_id=?", [id], callback);
  },
  updateUser:function(id, User, callback){
    return db.query("update users set password=?, create_date=?, is_active=? where user_id=?",
                    [User.password,
                     User.create_date,
                     User.is_active, id], callback);
  }
};

module.exports = users;
