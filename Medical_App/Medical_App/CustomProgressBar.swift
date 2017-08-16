//
//  CustomProgressBar.swift
//  Medical_App
//
//  Created by Gregory Johnson on 8/16/17.
//  Copyright © 2017 Gregory Johnson. All rights reserved.
//

import UIKit

class CustomProgressBar: UIProgressView {
    
    var height:CGFloat = 1.0
    var pages:Int = 0
    
    init(frame: CGRect, numPages:Int) {
        super.init(frame: frame)
        pages = numPages
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
        
        //Progress Bar
        self.layer.borderWidth = 1.0
        self.trackTintColor = .clear
        self.progressTintColor = .blue
    }
    
}
