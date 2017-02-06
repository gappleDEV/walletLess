//
//  InsuranceInfo.swift
//  Medical_App
//
//  Created by Gregory Johnson on 2/6/17.
//  Copyright © 2017 Gregory Johnson. All rights reserved.
//

import RealmSwift

class InsuranceInfo: Object {
    
    dynamic var username:String = "user"
    
    //View 1
    dynamic var insuranceCard:NSData = NSData()
    
    override class func primaryKey() -> String? {
        return "username"
    }
    
}
