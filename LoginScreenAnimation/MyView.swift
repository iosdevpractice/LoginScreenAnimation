//
//  MyView.swift
//  LoginScreenAnimation
//
//  Created by Wiley Wimberly on 8/21/14.
//  Copyright (c) 2014 Warm Fuzzy Apps, LLC. All rights reserved.
//

import UIKit

class MyView: UIView {

    var buttonText: String
    var labelText: String
    
    var gradientColor: UIColor! {
        didSet {
            let newColors: NSArray = [gradientColor.CGColor!, AppColors().black.CGColor!]
            gradient.colors = newColors
        }
    }
    
    var newColor: UIColor!
    
    lazy var gradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        let endColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        let colors: NSArray = [self.gradientColor.CGColor!, endColor.CGColor!]
        gradient.colors = colors
        return gradient
    }()

    lazy var button: UIButton = {
        let button = UIButton.buttonWithType(.System) as UIButton
        button.setTranslatesAutoresizingMaskIntoConstraints(false)
        button.setTitle(self.buttonText, forState: .Normal)
        
        return button
    }()

    lazy var label: UILabel = {
        let label = UILabel()
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        label.text = self.labelText
        label.textColor = UIColor.whiteColor()
        return label
    }()

    // MARK: - Initialization

    init(buttonText: String, labelText: String, gradientColor: UIColor) {
        self.buttonText = buttonText
        self.labelText = labelText
        self.gradientColor = gradientColor
        super.init(frame: UIScreen.mainScreen().bounds)
        setup()
    }
  
    required init(coder: NSCoder) {
        fatalError("NSCoding not supported")
    }

    // MARK: - helpers
    
    func setup() {
        
        layer.insertSublayer(gradient, atIndex: 0)
        
        addSubview(button)
        addSubview(label)

        addConstraint(NSLayoutConstraint(item: button, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: button, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1.0, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: label, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: label, attribute: .Bottom, relatedBy: .Equal, toItem: button, attribute: .Top, multiplier: 1.0, constant: -50))
    }
    
    func animateGradientColorChange(color: UIColor) {
        newColor = color
        let newColors: NSArray = [newColor.CGColor!, AppColors().black.CGColor!]
        let animation = CABasicAnimation(keyPath: "colors")
        animation.delegate = self
        animation.fromValue = gradient.colors
        animation.toValue = newColors;
        animation.duration = 1.0
        animation.removedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        gradient.addAnimation(animation, forKey: "gradientChange")
    }
    
    // MARK: - CAAnimation delegate
    
    override func animationDidStop(anim: CAAnimation!, finished flag: Bool) {
        println("animationDidStop")

        if (flag == true) {
            let newColors: NSArray = [newColor.CGColor!, AppColors().black.CGColor!]
            gradient.colors = newColors
            gradient.removeAnimationForKey("gradientChange")
        }
    }
}
