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
    dynamic var firstName:String = ""
    dynamic var middleName:String = ""
    dynamic var lastName:String = ""
    
    required init() {
        super.init()
    }
    
    init(email: String, firstName:String, middleName:String, lastName:String) {
        super.init()
        self.email = email
        self.firstName = firstName
        self.middleName = middleName
        self.lastName = lastName
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
    
    func toArray() -> [String] {
        return [email, firstName, middleName, lastName]
    }
}

var user:User = User(email: "something@gmail.com", firstName: "Gregory", middleName: "Aaron", lastName: "Johnson")
