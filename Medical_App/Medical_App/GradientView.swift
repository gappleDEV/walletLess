//
//  GradientView.swift
//  Medical_App
//
//  Created by Gregory Johnson on 8/20/16.
//  Copyright © 2016 Gregory Johnson. All rights reserved.
//

import UIKit

@IBDesignable class GradientView: UIView {
    
    //The properties for the gradient
    @IBInspectable var startColor: UIColor = UIColor.red
    @IBInspectable var endColor: UIColor = UIColor.green
    
    override func draw(_ rect: CGRect) {
        
        //Get the current context
        let context = UIGraphicsGetCurrentContext()
        let colors = [startColor.cgColor, endColor.cgColor]
        
        //Set up the color space
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        //Set up the color stops
        let colorLocations:[CGFloat] = [0.0, 1.0]
        
        //Create the gradient
        let gradient = CGGradient(colorsSpace: colorSpace,
                                                  colors: colors as CFArray,
                                                  locations: colorLocations)
        
        //Draw the gradient
        let startPoint = CGPoint.zero
        let endPoint = CGPoint(x:0, y:self.bounds.height)
        context?.drawLinearGradient(gradient!,
                                    start: startPoint,
                                    end: endPoint,
                                    options: [])
    }
}
