//
//  User.swift
//  Medical_App
//
//  Created by Gregory Johnson on 8/9/17.
//  Copyright © 2017 Gregory Johnson. All rights reserved.
//

import RealmSwift

class User: Object {
    
    dynamic var email:String = ""
    dynamic var password:String = ""
    
    convenience public init(email: String, password: String) {
        self.init()
        self.email = email
        self.password = password
    }
    
    override class func primaryKey() -> String? {
        return "email"
    }

}

typealias UserData = (title: String, value: String)

extension User {
    var userRepresentation: [UserData] {
        return [
            ("Email", email),
            ("Password", password),
        ]
    }
}

var user = User(email: "", password: "")
