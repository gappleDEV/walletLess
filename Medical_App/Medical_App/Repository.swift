//
//  UserRepository.swift
//  Medical_App
//
//  Created by Gregory Johnson on 8/12/17.
//  Copyright © 2017 Gregory Johnson. All rights reserved.
//

import Foundation
import RealmSwift
import Security
import UIKit

class Repository {
    
    internal var configuration: Realm.Configuration!
    internal var realm: Realm!
    
    internal init() {
        configuration = Realm.Configuration(encryptionKey: self.getKey() as Data)
        do {
            realm = try Realm(configuration: configuration)
            print("Realm successfully setup")
            print(Realm.Configuration.defaultConfiguration.fileURL!)
            let key = "\(self.getKey())".replacingOccurrences(of: " ", with: "")
            print("Key: \(key)")
        } catch let e as NSError{
            //Catch and print any error
            print("Error: \(e)")
        }
    }
    
    func getKey() -> NSData {
        // Identifier for our keychain entry - should be unique for your application
        let keychainIdentifier = "io.Realm.WalletLess"
        let keychainIdentifierData = keychainIdentifier.data(using: String.Encoding.utf8, allowLossyConversion: false)!
        
        // First check in the keychain for an existing key
        var query: [NSString: AnyObject] = [
            kSecClass: kSecClassKey,
            kSecAttrApplicationTag: keychainIdentifierData as AnyObject,
            kSecAttrKeySizeInBits: 512 as AnyObject,
            kSecReturnData: true as AnyObject
        ]
        
        // To avoid Swift optimization bug, should use withUnsafeMutablePointer() function to retrieve the keychain item
        var dataTypeRef: AnyObject?
        var status = withUnsafeMutablePointer(to: &dataTypeRef) { SecItemCopyMatching(query as CFDictionary, UnsafeMutablePointer($0)) }
        if status == errSecSuccess {
            return dataTypeRef as! NSData
        }
        
        // No pre-existing key from this application, so generate a new one
        let keyData = NSMutableData(length: 64)!
        let result = SecRandomCopyBytes(kSecRandomDefault, 64, keyData.mutableBytes.bindMemory(to: UInt8.self, capacity: 64))
        assert(result == 0, "Failed to get random bytes")
        
        // Store the key in the keychain
        query = [
            kSecClass: kSecClassKey,
            kSecAttrApplicationTag: keychainIdentifierData as AnyObject,
            kSecAttrKeySizeInBits: 512 as AnyObject,
            kSecValueData: keyData
        ]
        
        status = SecItemAdd(query as CFDictionary, nil)
        assert(status == errSecSuccess, "Failed to insert the new key in the keychain")
        
        return keyData
    }
}
