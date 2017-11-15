//
//  SignUpViewController.swift
//  Medical_App
//
//  Created by Gregory Johnson on 11/15/17.
//  Copyright © 2017 Gregory Johnson. All rights reserved.
//

import UIKit
import TextFieldEffects

class SignUpViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var firstName: AkiraTextField!
    @IBOutlet var middleName: AkiraTextField!
    @IBOutlet var lastName: AkiraTextField!
    @IBOutlet var email: AkiraTextField!
    @IBOutlet var password: AkiraTextField!
    @IBOutlet var confirmPassword: AkiraTextField!
    
    @IBOutlet var underline_firstName: UIView!
    @IBOutlet var underline_middleName: UIView!
    @IBOutlet var underline_lastName: UIView!
    @IBOutlet var underline_email: UIView!
    @IBOutlet var underline_password: UIView!
    @IBOutlet var underline_confirmPassword: UIView!
    
    @IBOutlet var b_done: UIButton!
    
    let greyUnselected:UIColor = UIColor(red:0.36, green:0.40, blue:0.45, alpha:1.0)
    let greenSelected:UIColor = UIColor(red:0.09, green:0.63, blue:0.52, alpha:1.0)
    let redNeedsMore:UIColor = UIColor(red:0.98, green:0.22, blue:0.26, alpha:1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firstName.delegate = self
        middleName.delegate = self
        lastName.delegate = self
        email.delegate = self
        password.delegate = self
        confirmPassword.delegate = self
        
        b_done.layer.cornerRadius = 8
        b_done.isEnabled = false
        b_done.alpha = 0.75
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField.tag {
        case 0:
            underline_firstName.backgroundColor = greenSelected
        case 1:
            underline_middleName.backgroundColor = greenSelected
        case 2:
            underline_lastName.backgroundColor = greenSelected
        case 3:
            underline_email.backgroundColor = greenSelected
        case 4:
            underline_password.backgroundColor = greenSelected
        case 5:
            underline_confirmPassword.backgroundColor = greenSelected
        default:
            print("Tag \(textField.tag) found but not expected")
        }
    }
    
    @IBAction func passwordChange(_ sender: UITextField) {
        if confirmPassword.text! != "" {
            if confirmPassword.text! == password.text! {
                underline_confirmPassword.backgroundColor = greyUnselected
                b_done.isEnabled = true
                b_done.alpha = 1
            } else {
                underline_confirmPassword.backgroundColor = redNeedsMore
                b_done.isEnabled = false
                b_done.alpha = 0.75
            }
        }
    }
    
    @IBAction func confirmPasswordChange(_ sender: UITextField) {
        if confirmPassword.text! == password.text! {
            underline_confirmPassword.backgroundColor = greenSelected
            b_done.isEnabled = true
            b_done.alpha = 1
        } else {
            underline_confirmPassword.backgroundColor = redNeedsMore
            b_done.isEnabled = false
            b_done.alpha = 0.75
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField.tag {
        case 0:
            underline_firstName.backgroundColor = greyUnselected
        case 1:
            underline_middleName.backgroundColor = greyUnselected
        case 2:
            underline_lastName.backgroundColor = greyUnselected
        case 3:
            underline_email.backgroundColor = greyUnselected
        case 4:
            underline_password.backgroundColor = greyUnselected
        case 5:
            if underline_confirmPassword.backgroundColor != redNeedsMore {
                underline_confirmPassword.backgroundColor = greyUnselected
            }
        default:
            print("Tag \(textField.tag) found but not expected")
        }
    }
    
    @IBAction func cancelToLogin(_ sender: UIButton) {
        let v1: LoginViewController_v2 = LoginViewController_v2(nibName: "LoginViewController_v2", bundle: nil)
        v1.modalTransitionStyle = .crossDissolve
        self.present(v1, animated: true) {
            print("Done moving to nib")
        }
    }
    
    func getValuesFromTextInput() -> [String] {
        var toRet:[String] = []
        
        toRet.append(firstName.text!)
        toRet.append(middleName.text!)
        toRet.append(lastName.text!)
        toRet.append(email.text!)
        toRet.append(password.text!)
        toRet.append(confirmPassword.text!)
        
        return toRet
    }
    
    func inputIsGood() -> Bool {
        var check:Bool = true
        
        if firstName.text! == "" {
            underline_firstName.backgroundColor = redNeedsMore
            check = false
        }
        
        if middleName.text! == "" {
            underline_middleName.backgroundColor = redNeedsMore
            check = false
        }
        
        if lastName.text! == "" {
            underline_lastName.backgroundColor = redNeedsMore
            check = false
        }
        
        if email.text! == "" {
            underline_email.backgroundColor = redNeedsMore
            check = false
        }
        
        if password.text! == "" { //Needs to include regex for to require stronger passwords
            underline_password.backgroundColor = redNeedsMore
            check = false
        }
        
        if confirmPassword.text == "" || confirmPassword.text! != password.text!{
            underline_confirmPassword.backgroundColor = redNeedsMore
            check = false
        }
        
        return check
    }
    
    @IBAction func done(_ sender: Any) {
        
        if(inputIsGood()) {
            let values = getValuesFromTextInput()
            if(UserRepository.userRep.addUser(User(firstName: values[0], middleName: values[1], lastName: values[2], email: values[3].lowercased(), password: values[4]))) {
                print("User saved")
            } else {
                print("Didn't save User correctly")
            }
            cancelToLogin(UIButton())
        } else {
            let message = "Please finish entering credentials and confirm password."
            let alertView = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alertView.addAction(okAction)
            self.present(alertView, animated: true)
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
