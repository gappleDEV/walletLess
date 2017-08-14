//
//  User.swift
//  Medical_App
//
//  Created by Gregory Johnson on 8/9/17.
//  Copyright © 2017 Gregory Johnson. All rights reserved.
//

import RealmSwift

class User: TableData {
    
    dynamic var email:String = ""
    dynamic var password:String = ""
    dynamic var rememberMe:Bool = false
    
    convenience public init(email: String, password: String) {
        self.init()
        self.email = email
        self.password = password
    }
    
    override class func primaryKey() -> String? {
        return "email"
    }
    
    override var tableRepresentation: [MyTableData] {
        return [
            ("Email", email),
            ("Password", password),
            ("Remember Me", "\(rememberMe)")
        ]
    }

}
