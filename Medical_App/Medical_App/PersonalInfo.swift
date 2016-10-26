//
//  PersonalInfo.swift
//  Medical_App
//
//  Created by Gregory Johnson on 10/25/16.
//  Copyright © 2016 Gregory Johnson. All rights reserved.
//

import RealmSwift

class PersonalInfo: Object {
    
    //View 1
    var firstName:String = ""
    var middleName:String = ""
    var lastName:String = ""
    
    //View 2
    var motherFirstName:String = ""
    var motherMiddleName:String = ""
    var motherLastName:String = ""
    
    //View 3
    var birthDay:Int = 1
    var birthMonth:Int = 1
    var birthYear:Int = 2016
    
    //View 4
    var maritalStatus:String = "Single"
    var sex:String = "Male"
    var race:String = "Caucasion"
    
    //View 5
    var denomination:String = "Christianity"
    var preferredLanguage:String = "English"
    
    //View 6
    var socialSecurity:String = "123456789"
    
    //View 7
    var address:String = "1 street road"
    var zipCode:String = "12345"
    var countyCode:String = "town"
    
    //View 8
    var homePhone:String = "1234567890"
    var cellPhone:String = "1234567890"
    var workPhone:String = "1234567890"
    
}

let realm = try! Realm()
let personInfo = realm.objects(PersonalInfo.self)


