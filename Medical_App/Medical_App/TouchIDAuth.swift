//
//  TouchIDAuthentication.swift
//  Medical_App
//
//  Created by Gregory Johnson on 8/12/17.
//  Copyright © 2017 Gregory Johnson. All rights reserved.
//

import Foundation
import LocalAuthentication

class TouchIDAuth {
    
    let context = LAContext()
    
    func canEvaluatePolicy() -> Bool {
        return context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
    }
    
    func authenticateUser(_ completion: @escaping (String?) -> Void) {
        
        //Leave function if touchID isn't supported
        guard canEvaluatePolicy() else {
            return
        }
        
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                               localizedReason: "Logging in with Touch ID") {
                                (success, evaluateError) in
                                if success {
                                    DispatchQueue.main.async {
                                        // User authenticated successfully, take appropriate action
                                        completion(nil)
                                    }
                                } else {
                                    
                                    let message: String
                                    
                                    switch evaluateError {
                                    case LAError.authenticationFailed?:
                                        message = "There was a problem verifying your identity."
                                    case LAError.userCancel?:
                                        message = "Cancel pressed. Please input email and password."
                                    case LAError.userFallback?:
                                        message = "Password pressed. Please input email and password."
                                    case LAError.touchIDNotAvailable?:
                                        message = "Device is not Touch-ID compatible."
                                    case LAError.touchIDNotEnrolled?:
                                        message = "There are no fingerprints stored."
                                    default:
                                        message = "Touch ID may not be configured"
                                    }
                                    
                                    completion(message)
                                }
        }
    }
}
