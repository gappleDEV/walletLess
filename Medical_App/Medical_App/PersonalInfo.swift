//
//  PersonalInfo.swift
//  Medical_App
//
//  Created by Gregory Johnson on 10/25/16.
//  Copyright © 2016 Gregory Johnson. All rights reserved.
//

import RealmSwift

class PersonalInfo: TableData {
    
    @objc dynamic var email:String = ""
    
    //View 1
    @objc dynamic var firstName:String = ""
    @objc dynamic var middleName:String = ""
    @objc dynamic var lastName:String = ""
    
    //View 2
    @objc dynamic var motherFirstName:String = ""
    @objc dynamic var motherMiddleName:String = ""
    @objc dynamic var motherLastName:String = ""
    
    //View 3
    @objc dynamic var birthDay:Int = 1
    @objc dynamic var birthMonth:Int = 1
    @objc dynamic var birthYear:Int = 1800
    
    //View 4
    @objc dynamic var maritalStatus:String = ""
    @objc dynamic var sex:String = ""
    @objc dynamic var race:String = ""
    
    //View 5
    @objc dynamic var denomination:String = ""
    @objc dynamic var preferredLanguage:String = ""
    
    //View 6
    @objc dynamic var socialSecurity:String = ""
    
    //View 7
    @objc dynamic var address:String = ""
    @objc dynamic var zipCode:String = ""
    @objc dynamic var countyCode:String = ""
    
    //View 8
    @objc dynamic var homePhone:String = ""
    @objc dynamic var cellPhone:String = ""
    @objc dynamic var workPhone:String = ""
    
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
            ("Social Security", "\(socialSecurity.count == 9 ? "*****" + socialSecurity.substring(from: socialSecurity.index(socialSecurity.startIndex, offsetBy: min(socialSecurity.count, 5))) : "")"),
            ("Address", address),
            ("Zip Code", zipCode),
            ("County Code", countyCode),
            ("Home Phone", homePhone),
            ("Cell Phone", cellPhone),
            ("Work Phone", workPhone)
        ]
    }
    
}


