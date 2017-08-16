//
//  CustomTextInputView.swift
//  Medical_App
//
//  Created by Gregory Johnson on 8/16/17.
//  Copyright © 2017 Gregory Johnson. All rights reserved.
//

import UIKit

class CustomTextInputView: UITextField {

    let inputFontSize:CGFloat = 24
    
    init(frame: CGRect, text:String, placeholder:String, del: UITextFieldDelegate) {
        super.init(frame: frame)
        self.placeholder = placeholder
        self.text = text
        self.delegate = del
        setUpView()
    }
    
    override func didMoveToSuperview() {
        self.layer.addSublayer(getBorder(self))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        
        //Field input
        self.font = UIFont.systemFont(ofSize: inputFontSize)
        self.autocorrectionType = UITextAutocorrectionType.no
        self.keyboardType = UIKeyboardType.default
        self.returnKeyType = UIReturnKeyType.done
        self.clearButtonMode = UITextFieldViewMode.always
        self.translatesAutoresizingMaskIntoConstraints = false
        let inputConstraints:[NSLayoutConstraint] = [
            self.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            self.heightAnchor.constraint(equalToConstant: 50),
            self.widthAnchor.constraint(equalToConstant: 300)
        ]
        NSLayoutConstraint.activate(inputConstraints)

    }
    
    private func getBorder(_ textInput:UITextField) -> CALayer
    {
        let border = CALayer()                  //the bottom line under the input
        let bwidth = CGFloat(2.0)
        border.borderColor = UIColor(hue: 0.33, saturation: 0.52, brightness: 0.20, alpha: 1).cgColor
        border.frame = CGRect(x: 0, y: textInput.frame.size.height - bwidth, width: textInput.frame.size.width, height: 2)//textInput.frame.size.height)
        border.borderWidth = bwidth
        
        return border
    }

}
