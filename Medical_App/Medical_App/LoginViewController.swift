//
//  LogInViewController.swift
//  Medical_App
//
//  Created by Gregory Johnson on 2/20/17.
//  Copyright © 2017 Gregory Johnson. All rights reserved.
//

import UIKit
import Alamofire

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
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @IBAction func touchIdLogin(_ sender: UIButton) {
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
                self.performSegue(withIdentifier: "loginUser", sender: self)
            }
        }
    }
    
    @IBAction func signIn(_ sender: Any) {
        
        if correctLogin(username: i_email.text!, password: i_password.text!) {
            self.performSegue(withIdentifier: "loginUser", sender: self)
        }
        
        /*Alamofire.request("http://155.246.138.185:3000/users").responseString {
            response in
            
            switch (response.result) {
            case .success:
                print(response)
                let nextViewController = self.storyboard!.instantiateViewController(withIdentifier: "MenuScene")
                self.present(nextViewController, animated:true, completion:nil)
                break
            case .failure(let error):
                if error._code == NSURLErrorTimedOut {
                    //timeout
                    print("There was a timout")
                }
                break
            }
            print(response)
        } */
        
        
        
    }

    @IBAction func register(_ sender: Any) {
        if(UserRepository.userRep.addUser(user: User(email: i_email.text!, password: i_password.text!))) {
            print("User saved")
        } else {
            print("Didn't save User correctly")
        }
    }
    
    func correctLogin(username: String, password: String) -> Bool {
        guard let userEntry = UserRepository.userRep.getUserInfo(about: username) else {
            return false
        }
        
        if(userEntry.email == username && userEntry.password == password) {
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
