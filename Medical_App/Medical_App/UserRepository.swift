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
    
    fileprivate override init() {
        super.init()
    }
    
    /**
     Add a user to the table. Maintains constraint that there is only 1 User active at a time on the device
     - Parameter user: User object to be added
     - Returns: boolean representing if the add worked
     */
    func addUser(_ user: User) -> Bool {
        
        do {
            try realm.write {
                //Delete all users (only 1 active on device at a time)
                realm.delete(realm.objects(User.self))
                //Add the new user
                realm.add(user, update: true)
            }
            return true
        } catch {
            return false;
        }
        
    }
    
    func getUser() -> User? {
        return realm.objects(User.self).first
    }
    
    func updateUser(_ user: User) -> Bool {
        
        //See if the user is in the DB
        let foundUser = realm.object(ofType: User.self, forPrimaryKey: user.email as AnyObject)
        if(foundUser != nil) {
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
