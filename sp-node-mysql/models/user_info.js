var db = require('../dbconn');

var user_info={
  addUserInfo:function(Info, callback){
    return db.query("insert into users values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",[
      Info.user_id,
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
  getUserInfo:function(id, callback){
    return db.query("select * from user_info where user_id=?", [id], callback);
  },
  updateUserInfo:function(id, User, callback){
    return db.query("update users set password=?, create_date=?, is_active=? where user_id=?",
                    [User.password,
                     User.create_date,
                     User.is_active, id], callback);
  },
  deleteUserInfo:function(id, callback){
    return db.query("delete from user_info where user_id=/", [id], callback);
  }
};

module.exports = user_info;
