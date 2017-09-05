//
//  User.swift
//  Medical_App
//
//  Created by Gregory Johnson on 8/9/17.
//  Copyright © 2017 Gregory Johnson. All rights reserved.
//

import RealmSwift

class User: TableData {
    
    dynamic var firstName:String = ""
    dynamic var middleName:String = ""
    dynamic var lastName:String = ""
    dynamic var email:String = ""
    dynamic var password:String = ""
    dynamic var rememberMe:Bool = false
    
    convenience public init(firstName: String, middleName: String, lastName: String, email: String, password: String) {
        self.init()
        self.firstName = firstName
        self.middleName = middleName
        self.lastName = lastName
        self.email = email
        self.password = password
    }
    
    override class func primaryKey() -> String? {
        return "email"
    }
    
    override var tableRepresentation: [MyTableData] {
        return [
            ("First Name", firstName),
            ("Middle Name", middleName),
            ("Last Name", lastName),
            ("Email", email),
            ("Password", password),
            ("Remember Me", "\(rememberMe)")
        ]
    }

}
