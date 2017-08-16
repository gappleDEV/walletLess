//
//  PersonalInfoRepository.swift
//  Medical_App
//
//  Created by Gregory Johnson on 8/16/17.
//  Copyright © 2017 Gregory Johnson. All rights reserved.
//

import Foundation

final class PersonalInfoRepository: Repository {
    
    static let persRep = PersonalInfoRepository()
    
    private override init() {
        super.init()
    }
    
    func addUser(user: PersonalInfo) -> Bool {
        print("Adding personal info user")
        do {
            try realm.write {
                //Delete all users (only 1 active on device at a time)
                realm.delete(realm.objects(PersonalInfo.self))
                //Add the new user
                realm.add(user, update: true)
            }
            return true
        } catch {
            return false;
        }
        
    }
    
    func getUser() -> PersonalInfo? {
        return realm.objects(PersonalInfo.self).first
    }
    
    func updateMotherInfo(user: PersonalInfo, first: String, middle: String, last: String) -> Bool{
        
        do {
            //Attempt to update
            try realm.write {
                user.motherFirstName = first
                user.motherMiddleName = middle
                user.motherLastName = last
                realm.add(user, update: true)
            }
            return true
        } catch let e as NSError{
            //Catch and print any error
            print("Error: \(e)")
            return false;
        }
    }
    
}
