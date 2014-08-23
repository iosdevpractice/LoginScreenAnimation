//
//  AppDelegate.swift
//  LoginScreenAnimation
//
//  Created by Wiley Wimberly on 8/21/14.
//  Copyright (c) 2014 Warm Fuzzy Apps, LLC. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?
    
    func application(application: UIApplication!, didFinishLaunchingWithOptions launchOptions: NSDictionary!) -> Bool {
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        let homeViewController = HomeViewController()
        
        window!.rootViewController = homeViewController
        
        window!.backgroundColor = UIColor.whiteColor()
        window!.makeKeyAndVisible()
        return true
    }

}

