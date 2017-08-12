//
//  User.swift
//  Medical_App
//
//  Created by Gregory Johnson on 8/9/17.
//  Copyright © 2017 Gregory Johnson. All rights reserved.
//

import Realm
import RealmSwift

class User: Object {
    
    dynamic var email:String = ""
    dynamic var password:String = ""
    
    required init() {
        super.init()
    }
    
    init(email: String, password: String) {
        super.init()
        self.email = email
        self.password = password
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        fatalError("init(realm:schema:) has not been implemented")
    }
    
    required init(value: Any, schema: RLMSchema) {
        fatalError("init(value:schema:) has not been implemented")
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
