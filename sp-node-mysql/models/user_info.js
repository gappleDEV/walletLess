/* AUTHOR: MATTHEW AQUILES
** WALLETLESS LLC
** DATE LAST EDITED: 3/1/2017
** NOTES: MODEL CREATED TO DEFINE FUNCTIONS TO QUERY USER_INFO TABLE IN walletlessDB
*/

var db = require('../dbconn'); //reference to dbconn.js file to connect to database

var user_info={
  //function to add user_info to user_info table
  //this will only work if the user_id (PK and FK) matches an existing user_id in the users table
  addUserInfo:function(Info, callback){
    return db.query("insert into users values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",[
      Info.user_id,
      Info.first_name,
      Info.last_name,
      Info.middle_name,
      Info.dob,
      Info.mom_first_name,
      Info.mom_middle_name,
      Info.mom_last_name,
      Info.marital_status,
      Info.sex,
      Info.race,
      Info.religion,
      Info.user_infocol,
      Info.ssn,
      Info.address,
      Info.city,
      Info.county,
      Info.state,
      Info.country,
      Info.zip_code,
      Info.county_code,
      Info.home_phone,
      Info.cell_phone,
      Info.work_phone,
      Info.prim_care_phys_name,
      Info.prim_care_phys_addr,
      Info.prim_care_phys_phone,
      Info.nok_first_name,
      Info.nok_last_name,
      Info.nok_relationship,
      Info.nok_cell_phone,
      Info.nok_home_phone,
      Info.emergency_contact_name,
      Info.emergency_contact_addr,
      Info.emergency_contact_relationship,
      Info.emergency_contact_phone,
      Info.guarantor_name,
      Info.guarantor_addr,
      Info.uarantor_phone,
      Info.guarantor_relationship,
      Info.guarantor_ssn,
      Info.guarantor_dob,
      Info.employer_company,
      Info.employer_addr,
      Info.employer_phone,
      Info.employee_title,
      Info.employer_hr_contact_name,
      Info.employer_hr_contact_phone], callback);
  },
  //function to query user_info table for data by id
  getUserInfo:function(id, callback){
    return db.query("select * from user_info where user_id=?", [id], callback);
  },
  //function to query user_info table to update data by id
  updateUserInfo:function(id, User, callback){
    return db.query("update users set password=?, create_date=?, is_active=? where user_id=?",
                    [User.password,
                     User.create_date,
                     User.is_active, id], callback);
  },
  //function to query user_info table to delete data
  //if the user_id from users table is deleted, it should cascade delete entry in user_info table
  //but data can be deleted from user_info table while user still exists in users table
  deleteUserInfo:function(id, callback){
    return db.query("delete from user_info where user_id=/", [id], callback);
  }
};

module.exports = user_info;
