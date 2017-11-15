//
//  LogInViewController.swift
//  Medical_App
//
//  Created by Gregory Johnson on 2/20/17.
//  Copyright © 2017 Gregory Johnson. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var i_email: UITextField!
    @IBOutlet weak var i_password: UITextField!
    @IBOutlet weak var b_touchId: UIButton!
    
    let touchMe = TouchIDAuth()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        i_password.isSecureTextEntry = true
        
        i_email.layer.borderWidth = 1
        i_email.layer.borderColor = UIColor.white.cgColor
        i_password.layer.borderWidth = 1
        i_password.layer.borderColor = UIColor.white.cgColor
        
        b_touchId.isHidden = !touchMe.canEvaluatePolicy()
        
        guard let userEntry = UserRepository.userRep.getUser() else {
            return
        }
        DispatchQueue.main.async() {
            self.i_email.text = userEntry.rememberMe ? userEntry.email : ""
        }
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let v1: LoginViewController_v2 = LoginViewController_v2(nibName: "LoginViewController_v2", bundle: nil)
        self.present(v1, animated: true) {
            print("Done moving to nib")
        }
    }
    
    func setupTables() {
        let within = PersonalInfoRepository.persRep.getUser()
        if within == nil || within!.email != i_email.text! {
            let _ = PersonalInfoRepository.persRep.addUser(PersonalInfo(email: i_email.text!))
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
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
    
    @IBAction func signIn(_ sender: Any) {
        
        if correctLogin(i_email.text!, password: i_password.text!) {
            print("Login correct")
        } else {
            let alertView = UIAlertController(title: "Error", message: "Email or password incorrect.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alertView.addAction(okAction)
            self.present(alertView, animated: true)
        }
        
    }
    
    @IBAction func register(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Register", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "register")
        self.present(nextViewController, animated: true, completion: nil)
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
