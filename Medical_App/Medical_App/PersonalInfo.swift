//
//  PersonalInfo.swift
//  Medical_App
//
//  Created by Gregory Johnson on 10/25/16.
//  Copyright © 2016 Gregory Johnson. All rights reserved.
//

import RealmSwift

class PersonalInfo: Object {
    
    dynamic var username:String = "user"
    
    //View 1
    dynamic var firstName:String = ""
    dynamic var middleName:String = ""
    dynamic var lastName:String = ""
    
    //View 2
    dynamic var motherFirstName:String = ""
    dynamic var motherMiddleName:String = ""
    dynamic var motherLastName:String = ""
    
    //View 3
    dynamic var birthDay:Int = 1
    dynamic var birthMonth:Int = 1
    dynamic var birthYear:Int = 2016
    
    //View 4
    dynamic var maritalStatus:String = "Single"
    dynamic var sex:String = "Male"
    dynamic var race:String = "Caucasion"
    
    //View 5
    dynamic var denomination:String = "Christianity"
    dynamic var preferredLanguage:String = "English"
    
    //View 6
    dynamic var socialSecurity:String = "123456789"
    
    //View 7
    dynamic var address:String = "1 street road"
    dynamic var zipCode:String = "12345"
    dynamic var countyCode:String = "town"
    
    //View 8
    dynamic var homePhone:String = "1234567890"
    dynamic var cellPhone:String = "1234567890"
    dynamic var workPhone:String = "1234567890"
    
    override class func primaryKey() -> String? {
        return "username"
    }
    
}


