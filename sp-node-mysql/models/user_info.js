/* AUTHOR: MATTHEW AQUILES
** WALLETLESS LLC
** DATE LAST EDITED: 3/18/2017
** NOTES: MODEL CREATED TO DEFINE FUNCTIONS TO QUERY USER_INFO TABLE IN walletlessDB
*/

var db = require('../dbconn'); //reference to dbconn.js file to connect to database

var user_info={
  //function to add user_info to user_info table
  //this will only work if the user_id (PK and FK) matches an existing user_id in the users table
  addUserInfo:function(Info, callback){
    return db.query("insert into user_info values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",[
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
      Info.guarantor_phone,
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
  updateUserInfo:function(id, Info, callback){
    return db.query("update user_info set first_name=?, last_name=?, middle_name=?, dob=?, mom_first_name=?, mom_middle_name=?, mom_last_name=?, marital_status=?, sex=?, race=?, religion=?, ssn=?, address=?, city=?, county=?, state=?, country=?, zip_code=?, county_code=?, home_phone=?, cell_phone=?, work_phone=?, prim_care_phys_name=?, prim_care_phys_addr=?, prim_care_phys_phone=?, nok_first_name=?, nok_last_name=?, nok_relationship=?, nok_cell_phone=?, nok_home_phone=?, emergency_contact_name=?, emergency_contact_addr=?, emergency_contact_relationship=?, emergency_contact_phone=?, guarantor_name=?, guarantor_addr=?, uarantor_phone=?, guarantor_relationship=?, guarantor_ssn=?, guarantor_dob=?, employer_company=?, employer_addr=?, employer_phone=?, employee_title=?, employer_hr_contact_name=?, Info.employer_hr_contact_phone where user_id=?",
                    [Info.first_name,
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
                    Info.employer_hr_contact_phone, id], callback);
  },
  //function to query user_info table to delete data
  //if the user_id from users table is deleted, it should cascade delete entry in user_info table
  //but data can be deleted from user_info table while user still exists in users table
  deleteUserInfo:function(id, callback){
    return db.query("delete from user_info where user_id=?", [id], callback);
  }
};

module.exports = user_info;
