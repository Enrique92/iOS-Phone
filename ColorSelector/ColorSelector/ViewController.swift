//
//  ViewController.swift
//  ColorSelector
//
//  Created by Derrick Park on 2019-04-15.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redSwitch: UISwitch!
    @IBOutlet var greenSwitch: UISwitch!
    @IBOutlet var blueSwitch: UISwitch!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.borderWidth = 5.0
        colorView.layer.cornerRadius = 20
        colorView.layer.borderColor = UIColor.black.cgColor
        
        updateControls()
        updateColor()
        
        // Get the default user again
        let defaultObject = UserDefaults.standard
        
        if defaultObject.object(forKey: "redSlider") != nil {
            redSwitch.isOn = defaultObject.bool(forKey: "redSlider")
        } else if (defaultObject.object(forKey: "greenSlider") != nil) {
            greenSwitch.isOn = defaultObject.bool(forKey: "greenSlider")
        } else if (defaultObject.object(forKey: "blueSlider") != nil) {
            blueSwitch.isOn = defaultObject.bool(forKey: "blueSlider")
        }
    }
    
    fileprivate func updateColor() {
        // Get the user default
        let defaultUser = UserDefaults.standard
        
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        
        if redSwitch.isOn {
            red = CGFloat(redSlider.value)
            defaultUser.set(true, forKey: "redSlider")
        }
        if greenSwitch.isOn {
            green = CGFloat(greenSlider.value)
            defaultUser.set(true, forKey: "greenSlider")
        }
        if blueSwitch.isOn {
            blue = CGFloat(blueSlider.value)
            defaultUser.set(true, forKey: "blueSlider")
        }
        let bgColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        colorView.backgroundColor = bgColor
    }
    
    fileprivate func updateControls() {
        redSlider.isEnabled = redSwitch.isOn
        greenSlider.isEnabled = greenSwitch.isOn
        blueSlider.isEnabled = blueSwitch.isOn
    }
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        updateControls()
        updateColor()
    }
    @IBAction func sliderChanged(_ sender: UISlider) {
        updateColor()
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        redSlider.value = 1
        greenSlider.value = 1
        blueSlider.value = 1
        
        redSwitch.isOn = false
        greenSwitch.isOn = false
        blueSwitch.isOn = false
        
        updateControls()
        updateColor()
    }
    
}

