//
//  LoginViewController_v2.swift
//  Medical_App
//
//  Created by Gregory Johnson on 11/14/17.
//  Copyright © 2017 Gregory Johnson. All rights reserved.
//

import UIKit
import TextFieldEffects

class LoginViewController_v2: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var i_email: AkiraTextField!
    @IBOutlet var i_password: AkiraTextField!
    
    @IBOutlet var underline_email: UIView!
    @IBOutlet var underline_password: UIView!
    
    let touchMe = TouchIDAuth()
    
    let greyUnselected:UIColor = UIColor(red:0.36, green:0.40, blue:0.45, alpha:1.0)
    let greenSelected:UIColor = UIColor(red:0.09, green:0.63, blue:0.52, alpha:1.0)
    let redNeedsMore:UIColor = UIColor(red:0.98, green:0.22, blue:0.26, alpha:1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        i_email.delegate = self
        i_password.delegate = self
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField.tag {
        case 0:
            underline_email.backgroundColor = greenSelected
        case 1:
            underline_password.backgroundColor = greenSelected
        default:
            print("Tag \(textField.tag) found but not expected")
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField.tag {
        case 0:
            underline_email.backgroundColor = greyUnselected
        case 1:
            underline_password.backgroundColor = greyUnselected
        default:
            print("Tag \(textField.tag) found but not expected")
        }
    }
    
    @IBAction func login(_ sender: Any) {
        
        var check:Bool = true
        
        if i_email.text! == "" {
            underline_email.backgroundColor = redNeedsMore
            check = false
        }
        
        if i_password!.text == "" {
            underline_password.backgroundColor = redNeedsMore
            check = false
        }
        
        if check && correctLogin(i_email.text!, password: i_password.text!) {
            print("Login correct")
        } else {
            let message = check ? "Email or password incorrect." : "Please finish entering credentials."
            let alertView = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alertView.addAction(okAction)
            self.present(alertView, animated: true)
        }

    }
    
    func correctLogin(_ username: String, password: String) -> Bool {
        guard let userEntry = UserRepository.userRep.getUser() else {
            return false
        }
        
        if(userEntry.email == username.uppercased() && userEntry.password == password) {
            if(!userEntry.rememberMe) {
                let alertView = UIAlertController(title: userEntry.email, message: "Would you like WalletLess to remember your email for future logins?", preferredStyle: .alert)
                let yesAction = UIAlertAction(title: "Yes", style: .default, handler: { (UIAlertAction) in
                    //Update to be remembered
                    let thisUser = User(firstName: userEntry.firstName, middleName: userEntry.middleName, lastName: userEntry.lastName, email: userEntry.email, password: userEntry.password)
                    thisUser.rememberMe = true
                    if UserRepository.userRep.updateUser(thisUser) {
                        //Move to next controller
                        self.setupTables()
                        self.performSegue(withIdentifier: "loginUser", sender: self)
                    }
                })
                let noAction = UIAlertAction(title: "No", style: .default, handler: { (UIAlertAction) in
                    //Move to next controller
                    self.setupTables()
                    self.performSegue(withIdentifier: "loginUser", sender: self)
                })
                
                alertView.addAction(yesAction)
                alertView.addAction(noAction)
                alertView.preferredAction = yesAction
                self.present(alertView, animated: true)
            } else {
                //Move to next controller
                setupTables()
                self.performSegue(withIdentifier: "loginUser", sender: self)
            }
            return true
        } else {
            return false
        }
    }
    
    @IBAction func touchIdLogin(_ sender: UIButton) {
        //We need to have a user to sign in with
        guard UserRepository.userRep.getUser() != nil else {
            let alertView = UIAlertController(title: "Error",
                                              message: "No user to sign in as.",
                                              preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alertView.addAction(okAction)
            self.present(alertView, animated: true)
            return
        }
        
        touchMe.authenticateUser() { message in
            
            if let message = message {
                // if the completion is not nil show an alert
                let alertView = UIAlertController(title: "Error",
                                                  message: message,
                                                  preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: .default)
                alertView.addAction(okAction)
                self.present(alertView, animated: true)
                
            } else {
                self.setupTables()
                self.performSegue(withIdentifier: "loginUser", sender: self)
            }
        }
    }
    
    func setupTables() {
        let within = PersonalInfoRepository.persRep.getUser()
        if within == nil || within!.email != i_email.text! {
            let _ = PersonalInfoRepository.persRep.addUser(PersonalInfo(email: i_email.text!))
        }
    }
    
    @IBAction func signUp(_ sender: Any) {
        let v1: SignUpViewController = SignUpViewController(nibName: "SignUpViewController", bundle: nil)
        v1.modalTransitionStyle = .crossDissolve
        self.present(v1, animated: true) {
            print("Done moving to nib")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
