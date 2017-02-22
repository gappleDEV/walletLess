var db = require('../dbconn');

var user_info={
  /*dont really want to get all
  getAllUserInfo:function(callback){
    return db.query("select * from users", callback);
  },*/
  getUserInfo:function(id, callback){
    return db.query("select * from user_info where user_id=?", [id], callback);
  },
  addUserInfo:function(User, callback){
    return db.query("insert into users values(?,?,?,?)",
      [User.user_id,
       User.password,
       User.create_date,
       User.is_active], callback);
  },
  deleteUserInfo:function(id, callback){
    return db.query("delete from users where user_id=?", [id], callback);
  },
  updateUserInfo:function(id, User, callback){
    return db.query("update users set password=?, create_date=?, is_active=? where user_id=?",
                    [User.password,
                     User.create_date,
                     User.is_active, id], callback);
  }
};

module.exports = users;
