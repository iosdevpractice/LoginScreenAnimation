//
//  HomeViewController.swift
//  LoginScreenAnimation
//
//  Created by Wiley Wimberly on 8/21/14.
//  Copyright (c) 2014 Warm Fuzzy Apps, LLC. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UIViewControllerTransitioningDelegate {

    var myView: MyView! { return self.view as MyView }
    
    override func loadView() {
        
        view = MyView(buttonText: "Go Forward", labelText: "Home View Controller",
            gradientColor: AppColors().blue);
        myView.button.addTarget(self, action: Selector("buttonTapped"), forControlEvents: UIControlEvents.TouchUpInside)
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    // MARK: - Actions
    
    func buttonTapped() {
        
        let secondViewController = SecondViewController()
        
        secondViewController.transitioningDelegate = self
        
        // The following line makes the HomeViewController disappear when the SecondViewController is dismissed. No idea why. Doesn't seem to be needed, however.
        //secondViewController.modalPresentationStyle = .Custom
        
        presentViewController(secondViewController, animated: true, completion: nil)
    }
    
    // MARK: - UIViewControllerTransitioningDelegate
    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        
        let animator = TransitionAnimator()
        animator.presenting = true;
        return animator;
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        
        let animator = TransitionAnimator()
        return animator;
    }
}
