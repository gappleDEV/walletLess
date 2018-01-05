//
//  PopAnimator.swift
//  Medical_App
//
//  Created by Gregory Johnson on 1/5/18.
//  Copyright © 2018 Gregory Johnson. All rights reserved.
//

import UIKit

// Anomation for opening controllers from the collection view cells on menu view

class PopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    let duration = 0.5
    var presenting = true
    var originFrame = CGRect.zero
    
    var dismissCompletion: (() -> Void)?
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        // Get container view and view to be presented
        let containerView = transitionContext.containerView
        let toView = transitionContext.view(forKey: .to)!
        
        // movingView is the view to animate. Depends on presenting or dismissing
        let movingView = presenting ? toView : transitionContext.view(forKey: .from)!
        
        // Setup for animation
        let initialFrame = presenting ? originFrame : movingView.frame
        let finalFrame = presenting ? movingView.frame : originFrame
        
        let xScaleFactor = presenting ? initialFrame.width / finalFrame.width : finalFrame.width / initialFrame.width
        
        let yScaleFactor = presenting ? initialFrame.height / finalFrame.height : finalFrame.height / initialFrame.height
        
        let scaleTransform = CGAffineTransform(scaleX: xScaleFactor, y: yScaleFactor)
        
        if presenting {
            movingView.transform = scaleTransform
            movingView.center = CGPoint(x: initialFrame.midX, y: initialFrame.midY)
            movingView.clipsToBounds = true
        }
        
        //Add view to be presented as child of container view and animate
        containerView.addSubview(toView)
        containerView.bringSubview(toFront: movingView)
        
        UIView.animate(withDuration: duration, animations: {
            movingView.transform = self.presenting ? CGAffineTransform.identity : scaleTransform
            movingView.center = CGPoint(x: finalFrame.midX, y: finalFrame.midY)
            if !self.presenting {
                movingView.alpha = 0.0
            }
        }) { _ in
            if !self.presenting {
                self.dismissCompletion?()
            }
            
            transitionContext.completeTransition(true)
        }
        
    }
    
    
}

