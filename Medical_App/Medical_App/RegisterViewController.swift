//
//  RegisterViewController.swift
//  Medical_App
//
//  Created by Gregory Johnson on 8/29/17.
//  Copyright © 2017 Gregory Johnson. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var headerView:PersonalInfoHeaderView!
    var bodyView:UIStackView!
    var headerHeightConstraint:NSLayoutConstraint!
    let headerHeight:CGFloat = 90
    let bodyHeight:CGFloat = 300
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenTap = UITapGestureRecognizer()
        screenTap.addTarget(self, action: #selector(resignKeyboard))
        self.view.addGestureRecognizer(screenTap)
        
        setUpHeader()
        setUpBody()
        setUpContent()
    }
    
    //Called when screen is tapped
    @objc func resignKeyboard(){
        self.view.endEditing(true)
    }
    
    func setUpHeader() {
        //Sets header view to the custom view that was created
        headerView = PersonalInfoHeaderView(frame: .zero, title: "Register")
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.homeButton.setTitle("Done", for: .normal)
        view.addSubview(headerView)
        headerHeightConstraint = headerView.heightAnchor.constraint(equalToConstant: headerHeight)
        headerHeightConstraint.isActive = true
        let constraints:[NSLayoutConstraint] = [
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        headerView.backButton.addTarget(self, action: #selector(toHomeView), for: .touchUpInside)
        headerView.homeButton.addTarget(self, action: #selector(doneRegister), for: .touchUpInside)
        NSLayoutConstraint.activate(constraints)
    }
    
    func setUpBody() {
        bodyView = UIStackView(frame: .zero)
        bodyView.axis = .vertical
        bodyView.distribution = .fillEqually
        bodyView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bodyView)
        bodyView.spacing = 35
        let constraints:[NSLayoutConstraint] = [
            bodyView.topAnchor.constraint(equalTo: view.topAnchor, constant: 125),
            bodyView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            bodyView.heightAnchor.constraint(equalToConstant: 450)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func setUpContent() {
        bodyView.addArrangedSubview(getInputStack("", placeholder: "First Name"))
        bodyView.addArrangedSubview(getInputStack("", placeholder: "Middle Name"))
        bodyView.addArrangedSubview(getInputStack("", placeholder: "Last Name"))
        bodyView.addArrangedSubview(getInputStack("", placeholder: "Email"))
        bodyView.addArrangedSubview(getInputStack("", placeholder: "Password"))
        
        ((bodyView.arrangedSubviews[4] as! UIStackView).arrangedSubviews[1] as! CustomTextInputView).isSecureTextEntry = true
    }
    
    //Stackview with text input
    func getInputStack(_ text:String, placeholder:String) -> UIStackView {
        let label = CustomLabelView(frame: .zero, title: placeholder, top: true)
        let input = CustomTextInputView(frame: CGRect(x: 0, y: 0, width: 300, height: 50), text: text, placeholder: placeholder, del: self)
        let stack:UIStackView = UIStackView()
        stack.axis = .vertical
        stack.addArrangedSubview(label)
        stack.addArrangedSubview(input)
        
        return stack
    }
    
    func getValuesFromTextInput() -> [String] {
        var toRet:[String] = []
        for e in bodyView.arrangedSubviews {
            if e is UIStackView {
                for l in (e as! UIStackView).arrangedSubviews {
                    if l is UITextField {
                        toRet.append((l as! UITextField).text!)
                    }
                }
            }
        }
        return toRet
    }
    
    @objc func toHomeView() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func doneRegister() {
        print("Finished")
        let values = getValuesFromTextInput()
        if(UserRepository.userRep.addUser(User(firstName: values[0], middleName: values[1], lastName: values[2], email: values[3].uppercased(), password: values[4]))) {
            print("User saved")
        } else {
            print("Didn't save User correctly")
        }
        toHomeView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension RegisterViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
}
