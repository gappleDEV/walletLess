//
//  CustomPickerView.swift
//  Medical_App
//
//  Created by Gregory Johnson on 8/16/17.
//  Copyright © 2017 Gregory Johnson. All rights reserved.
//

import UIKit

class CustomPickerView: UIPickerView {

    var height:CGFloat = 1.0
    
    init(frame: CGRect, del: UIPickerViewDelegate, dat: UIPickerViewDataSource) {
        super.init(frame: frame)
        self.delegate = del
        self.dataSource = dat
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let size:CGSize = CGSize(width: self.frame.size.width, height: height)
        return size
    }
    
    func setUpView() {
        self.backgroundColor = UIColor(red:0.56, green:0.79, blue:0.98, alpha:1.0)
        self.translatesAutoresizingMaskIntoConstraints = false
        let inputConstraints:[NSLayoutConstraint] = [
            self.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            self.heightAnchor.constraint(equalToConstant: 75),
            self.widthAnchor.constraint(equalToConstant: 200)
        ]
        NSLayoutConstraint.activate(inputConstraints)    }
}
