//
//  CategoryHeaderView.swift
//  Medical_App
//
//  Created by Gregory Johnson on 8/14/17.
//  Copyright © 2017 Gregory Johnson. All rights reserved.
//

import UIKit

class CategoryHeaderView: UIView {

    var colorView:UIView!
    var bgColor = UIColor(red:0.31, green:0.20, blue:0.18, alpha:1.0)
    var titleLabel = UILabel()
    var nameLabel = UILabel()
    var logoIcon:UIImageView!
    var mailButton:UIButton!
    var collapseButton:UIButton!
    
    var logoIconTopConstraint: NSLayoutConstraint!
    
    init(frame:CGRect,title: String, name:String) {
        super.init(frame: frame)
        self.titleLabel.text = title
        self.nameLabel.text = name
        setUpView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        
        self.backgroundColor = UIColor.white
        
        //Background of the view
        colorView = UIView()
        colorView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(colorView)
        let constraints:[NSLayoutConstraint] = [
            colorView.topAnchor.constraint(equalTo: self.topAnchor),
            colorView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            colorView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            colorView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
        colorView.backgroundColor = bgColor
        //Title text in view
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(titleLabel)
        let titlesConstraints:[NSLayoutConstraint] = [
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            ]
        NSLayoutConstraint.activate(titlesConstraints)
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        //Name text in view
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(nameLabel)
        let nameConstraints:[NSLayoutConstraint] = [
            nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 40)
        ]
        NSLayoutConstraint.activate(nameConstraints)
        nameLabel.font = UIFont.systemFont(ofSize: 16)
        nameLabel.textColor = .white
        nameLabel.textAlignment = .center
        //Logo icon in view
        logoIcon = UIImageView()
        logoIcon.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(logoIcon)
        logoIconTopConstraint = logoIcon.topAnchor.constraint(equalTo: self.topAnchor, constant: 20)
        let imageConstraints:[NSLayoutConstraint] = [
            logoIcon.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            logoIconTopConstraint,
            logoIcon.widthAnchor.constraint(equalToConstant: 65),
            logoIcon.heightAnchor.constraint(equalToConstant: 65)
        ]
        NSLayoutConstraint.activate(imageConstraints)
        logoIcon.image = UIImage(named: "Logo")
        logoIcon.contentMode = .scaleAspectFit
        //Mail button to the left of the title to bring to mail page
        mailButton = UIButton()
        mailButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(mailButton)
        let mailConstraints:[NSLayoutConstraint] = [
            mailButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            mailButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            mailButton.widthAnchor.constraint(equalToConstant: 40),
            mailButton.heightAnchor.constraint(equalToConstant: 40)
        ]
        NSLayoutConstraint.activate(mailConstraints)
        mailButton.setImage(UIImage(named: "mail"), for: .normal)
        mailButton.contentMode = .scaleAspectFit
        //Button at bottom to collapse view
        collapseButton = UIButton()
        collapseButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(collapseButton)
        let collapseConstraints:[NSLayoutConstraint] = [
            collapseButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 5),
            collapseButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            collapseButton.widthAnchor.constraint(equalToConstant: 40),
            collapseButton.heightAnchor.constraint(equalToConstant: 40)
        ]
        NSLayoutConstraint.activate(collapseConstraints)
        collapseButton.setTitle("^", for: .normal)
        collapseButton.titleLabel!.textColor = .white
        collapseButton.titleLabel!.font = UIFont.systemFont(ofSize: 20)
        collapseButton.titleLabel!.textAlignment = .center
    }
    
    /*func decrementArticleAlpha(offset: CGFloat) {
        if self.logoIcon.alpha >= 0 {
            let alphaOffset = max((offset - 65)/85.0, 0)
            self.logoIcon.alpha = alphaOffset
        }
    }
    
    func incrementArticleAlpha(offset: CGFloat) {
        if self.logoIcon.alpha <= 1 {
            let alphaOffset = max((offset - 65)/85, 0)
            self.logoIcon.alpha = alphaOffset
        }
    }*/
    
    func decrementTitleAlpha(offset: CGFloat) {
        if self.titleLabel.alpha >= 0 {
            let alphaOffset = min(1, max((offset - 65)/85.0, 0))
            self.titleLabel.alpha = alphaOffset
            self.nameLabel.alpha = alphaOffset
            self.collapseButton.alpha = alphaOffset
            logoIconTopConstraint.constant = 20 * alphaOffset
            self.layoutIfNeeded()
        }
    }
    
    func incrementTitleAlpha(offset: CGFloat) {
        if self.titleLabel.alpha <= 1 {
            let alphaOffset = min(1, max((offset - 65)/85, 0))
            self.titleLabel.alpha = alphaOffset
            self.nameLabel.alpha = alphaOffset
            self.collapseButton.alpha = alphaOffset
            logoIconTopConstraint.constant = 20 * alphaOffset
            self.layoutIfNeeded()
        }
    }


}
