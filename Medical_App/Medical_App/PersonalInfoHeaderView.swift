//
//  PersonalInfoHeadView.swift
//  Medical_App
//
//  Created by Gregory Johnson on 8/15/17.
//  Copyright © 2017 Gregory Johnson. All rights reserved.
//

import UIKit

class PersonalInfoHeaderView: UIView {

    var backButton:UIButton!
    var titleLabel = UILabel()
    
    var bgColor = UIColor(red:0.05, green:0.28, blue:0.63, alpha:1.0)
    
    init(frame:CGRect, title:String) {
        super.init(frame: frame)
        self.titleLabel.text = title
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        
        self.backgroundColor = bgColor
        
        //Button to go back
        backButton = UIButton()
        backButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(backButton)
        let backConstraints:[NSLayoutConstraint] = [
            backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            backButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 10),
            backButton.widthAnchor.constraint(equalToConstant: 40),
            backButton.heightAnchor.constraint(equalToConstant: 40)
        ]
        NSLayoutConstraint.activate(backConstraints)
        backButton.setTitle("<", for: .normal)
        backButton.titleLabel!.textColor = .white
        backButton.titleLabel!.font = UIFont.systemFont(ofSize: 20)
        backButton.titleLabel!.textAlignment = .center
        
        //Title of page
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(titleLabel)
        let titlesConstraints:[NSLayoutConstraint] = [
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 10)
        ]
        NSLayoutConstraint.activate(titlesConstraints)
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
    }

}
