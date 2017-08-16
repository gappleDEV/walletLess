//
//  TextInputView.swift
//  Medical_App
//
//  Created by Gregory Johnson on 8/15/17.
//  Copyright © 2017 Gregory Johnson. All rights reserved.
//

import UIKit

class CustomLabelView: UILabel {
    
    let labelFontSize:CGFloat = 14
    
    init(frame:CGRect, title:String, top:Bool) {
        super.init(frame: frame)
        self.text = title
        if top {
            setUpView()
        } else {
            setUpSideView()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        
        //Field title
        self.translatesAutoresizingMaskIntoConstraints = false
        let titlesConstraints:[NSLayoutConstraint] = [
            self.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.topAnchor.constraint(equalTo: self.topAnchor),
            self.heightAnchor.constraint(equalToConstant: 20)
        ]
        NSLayoutConstraint.activate(titlesConstraints)
        self.font = UIFont.systemFont(ofSize: labelFontSize)
        self.textColor = .white
        
    }
    
    func setUpSideView() {
        //Field title
        self.translatesAutoresizingMaskIntoConstraints = false
        let titlesConstraints:[NSLayoutConstraint] = [
            self.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.topAnchor.constraint(equalTo: self.topAnchor),
            self.widthAnchor.constraint(equalToConstant: 100)
        ]
        NSLayoutConstraint.activate(titlesConstraints)
        self.font = UIFont.systemFont(ofSize: labelFontSize)
        self.textColor = .white
    }
    
}
