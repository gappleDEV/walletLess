//
//  PersonalInfo.swift
//  Medical_App
//
//  Created by Gregory Johnson on 10/25/16.
//  Copyright © 2016 Gregory Johnson. All rights reserved.
//

import RealmSwift

class PersonalInfo: TableData {
    
    dynamic var email:String = ""
    
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
    dynamic var birthYear:Int = 1800
    
    //View 4
    dynamic var maritalStatus:String = ""
    dynamic var sex:String = ""
    dynamic var race:String = ""
    
    //View 5
    dynamic var denomination:String = ""
    dynamic var preferredLanguage:String = ""
    
    //View 6
    dynamic var socialSecurity:String = ""
    
    //View 7
    dynamic var address:String = ""
    dynamic var zipCode:String = ""
    dynamic var countyCode:String = ""
    
    //View 8
    dynamic var homePhone:String = ""
    dynamic var cellPhone:String = ""
    dynamic var workPhone:String = ""
    
    convenience public init(email: String) {
        self.init()
        self.email = email
    }
    
    override class func primaryKey() -> String? {
        return "email"
    }
    
    override var tableRepresentation: [MyTableData] {
        return [
            ("Mother's First Name", motherFirstName),
            ("Mother's Middle Name", motherMiddleName),
            ("Mother's Maiden Name", motherLastName),
            ("Birthday", "\(birthMonth)/\(birthDay)/\(birthYear)"),
            ("Marital Status", maritalStatus),
            ("Sex", sex),
            ("Race", race),
            ("Denomination", denomination),
            ("Preferred Language", preferredLanguage),
            ("Social Security", "\(socialSecurity.characters.count == 9 ? "*****" + socialSecurity.substring(from: socialSecurity.index(socialSecurity.startIndex, offsetBy: min(socialSecurity.characters.count, 5))) : "")"),
            ("Address", address),
            ("Zip Code", zipCode),
            ("County Code", countyCode),
            ("Home Phone", homePhone),
            ("Cell Phone", cellPhone),
            ("Work Phone", workPhone)
        ]
    }
    
}


