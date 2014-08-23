//
//  SecondViewController.swift
//  LoginScreenAnimation
//
//  Created by Wiley Wimberly on 8/21/14.
//  Copyright (c) 2014 Warm Fuzzy Apps, LLC. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var myView: MyView! { return self.view as MyView }
    
    override func loadView() {
        view = MyView(buttonText: "Go Back", labelText: "Second View Controller", gradientColor: AppColors().green);
        
        myView.button.addTarget(self, action: Selector("buttonTapped"), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    // MARK: - Actions
    
    func buttonTapped() {
        
        presentingViewController.dismissViewControllerAnimated(true, completion: nil)
    }
}
