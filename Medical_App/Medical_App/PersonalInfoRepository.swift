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
    
    func updateDOBInfo(user: PersonalInfo, month: Int, day: Int, year: Int) -> Bool{
        
        do {
            //Attempt to update
            try realm.write {
                user.birthMonth = month
                user.birthDay = day
                user.birthYear = year
                realm.add(user, update: true)
            }
            return true
        } catch let e as NSError{
            //Catch and print any error
            print("Error: \(e)")
            return false;
        }
    }
    
    func updateBasicInfoOne(user: PersonalInfo, maritalStatus: String, sex: String, race: String) -> Bool{
        
        do {
            //Attempt to update
            try realm.write {
                user.maritalStatus = maritalStatus
                user.sex = sex
                user.race = race
                realm.add(user, update: true)
            }
            return true
        } catch let e as NSError{
            //Catch and print any error
            print("Error: \(e)")
            return false;
        }
    }
    
    func updateBasicInfoTwo(user: PersonalInfo, denomination: String, preferredLanguage: String) -> Bool {
        do {
            //Attempt to update
            try realm.write {
                user.denomination = denomination
                user.preferredLanguage = preferredLanguage
                realm.add(user, update: true)
            }
            return true
        } catch let e as NSError{
            //Catch and print any error
            print("Error: \(e)")
            return false;
        }
    }
    
    func updateSocialSecurity(user: PersonalInfo, socialSecurity: String) -> Bool {
        do {
            //Attempt to update
            try realm.write {
                user.socialSecurity = socialSecurity
                realm.add(user, update: true)
            }
            return true
        } catch let e as NSError{
            //Catch and print any error
            print("Error: \(e)")
            return false;
        }
    }
    
    func updateLocation(user: PersonalInfo, address: String, zipCode: String, countyCode: String) -> Bool {
        do {
            //Attempt to update
            try realm.write {
                user.address = address
                user.zipCode = zipCode
                user.countyCode = countyCode
                realm.add(user, update: true)
            }
            return true
        } catch let e as NSError{
            //Catch and print any error
            print("Error: \(e)")
            return false;
        }
    }
    
    func updatePhone(user: PersonalInfo, home: String, cell: String, work: String) -> Bool {
        do {
            //Attempt to update
            try realm.write {
                user.homePhone = home
                user.cellPhone = cell
                user.workPhone = work
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
