//
//  TransitionAnimator.swift
//  LoginScreenAnimation
//
//  Created by Wiley Wimberly on 8/21/14.
//  Copyright (c) 2014 Warm Fuzzy Apps, LLC. All rights reserved.
//

import UIKit

class TransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {

    var presenting = false
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning!) -> NSTimeInterval {
        
        return NSTimeInterval(0.5)
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning!) {
        
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        
        let baseFrame = transitionContext.containerView().bounds
        let offset = transitionContext.containerView().bounds.width
        
        let appColors = AppColors()
                
        if (self.presenting) {
        
            fromViewController.view.userInteractionEnabled = false
            
            transitionContext.containerView().addSubview(fromViewController.view)
            transitionContext.containerView().addSubview(toViewController.view)
        
            let secondEndFrame = baseFrame
            
            var secondStartFrame = baseFrame
            secondStartFrame.origin.x += offset
            
            var homeEndFrame = baseFrame
            homeEndFrame.origin.x -= offset
            
            toViewController.view.frame = secondStartFrame
            
            let homeViewController = fromViewController as HomeViewController
            let secondViewController = toViewController as SecondViewController
            
            secondViewController.myView.gradientColor = appColors.blue
            
            UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
                fromViewController.view.tintAdjustmentMode = .Dimmed
                toViewController.view.frame = secondEndFrame
                fromViewController.view.frame = homeEndFrame
            }){
                finished in
                transitionContext.completeTransition(true)
                
                secondViewController.myView.animateGradientColorChange(appColors.green)
            }
        } else {
            
            toViewController.view.userInteractionEnabled = true
            
            transitionContext.containerView().addSubview(toViewController.view)
            transitionContext.containerView().addSubview(fromViewController.view)
            
            let homeEndFrame = baseFrame
            
            var homeStartFrame = baseFrame
            homeStartFrame.origin.x -= offset
            
            var secondEndFrame = baseFrame
            secondEndFrame.origin.x += offset
            
            toViewController.view.frame = homeStartFrame
            
            let homeViewController = toViewController as HomeViewController
            let secondViewController = fromViewController as SecondViewController
            
            homeViewController.myView.gradientColor = appColors.green
            
            UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
                toViewController.view.tintAdjustmentMode = .Automatic
                fromViewController.view.frame = secondEndFrame
                toViewController.view.frame = homeEndFrame
            }) {
                finished in
                transitionContext.completeTransition(true)
                
                homeViewController.myView.animateGradientColorChange(appColors.blue)
            }
        }
    }
}
