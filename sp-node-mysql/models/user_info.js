var db = require('../dbconn');

var user_info={
  getUserInfo:function(id, callback){
    return db.query("select * from user_info where user_id=?", [id], callback);
  },
  updateUserInfo:function(id, User, callback){
    return db.query("update users set password=?, create_date=?, is_active=? where user_id=?",
                    [User.password,
                     User.create_date,
                     User.is_active, id], callback);
  }
};

module.exports = user_info;
