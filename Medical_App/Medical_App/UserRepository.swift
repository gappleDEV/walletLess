//
//  UserRepository.swift
//  Medical_App
//
//  Created by Gregory Johnson on 8/12/17.
//  Copyright © 2017 Gregory Johnson. All rights reserved.
//

import Foundation

final class UserRepository: Repository {
    
    static let userRep = UserRepository()
    
    private override init() {
        super.init()
    }
    
    func addUser(user: User) -> Bool {
        
        do {
            try realm.write {
                realm.add(user)
            }
            return true
        } catch {
            return false;
        }
        
    }
    
    func updateUser(user: User) -> Bool {
        
        //See if the user is in the DB
        let user = realm.objects(User.self).filter("email = \(user.email)")
        if(user.count > 0) {
            do {
                //Attempt to update
                try realm.write {
                    realm.add(user, update: true)
                }
                return true
            } catch let e as NSError{
                //Catch and print any error
                print("Error: \(e)")
                return false;
            }
        } else {
            //Only update if the entry is in DB
            print("Entry does not exist in table")
            return false
        }
    }
    
}
