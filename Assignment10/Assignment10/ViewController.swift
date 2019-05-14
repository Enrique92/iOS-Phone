//
//  ViewController.swift
//  Assignment10
//
//  Created by Enrique on 2019-05-13.
//  Copyright © 2019 Enrique. All rights reserved.
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
    
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    
    var bgColor = UIColor()
    
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
            redSlider.value = defaultObject.float(forKey: "redSlider")
            red = CGFloat(defaultObject.float(forKey: "colorRed"))
        }
        
        if (defaultObject.object(forKey: "greenSlider") != nil) {
            greenSlider.value = defaultObject.float(forKey: "greenSlider")
            green = CGFloat(defaultObject.float(forKey: "colorGreen"))
        }
        
        if (defaultObject.object(forKey: "blueSlider") != nil) {
            blueSlider.value = defaultObject.float(forKey: "blueSlider")
            blue = CGFloat(defaultObject.float(forKey: "colorBlue"))
        }
        
        let bgColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        colorView.backgroundColor = bgColor
    }
    
    fileprivate func updateColor() {
        // Get the user default
        let defaultUser = UserDefaults.standard
        
        // Red color
        if redSwitch.isOn {
            red = CGFloat(redSlider.value)
            defaultUser.set(red, forKey: "colorRed")
            defaultUser.set(redSlider.value, forKey: "redSlider")
        }
        
        // Green color
        if greenSwitch.isOn {
            green = CGFloat(greenSlider.value)
            defaultUser.set(green, forKey: "colorGreen")
            defaultUser.set(greenSlider.value, forKey: "greenSlider")
        }
        
        // Blue color
        if blueSwitch.isOn {
            blue = CGFloat(blueSlider.value)
            defaultUser.set(blue, forKey: "colorBlue")
            defaultUser.set(blueSlider.value, forKey: "blueSlider")
        }
        
        bgColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        colorView.backgroundColor = bgColor
        defaultUser.set(bgColor, forKey: "colorView")
    }
    
    fileprivate func updateControls() {
        redSlider.isEnabled = redSwitch.isOn
        greenSlider.isEnabled = greenSwitch.isOn
        blueSlider.isEnabled = blueSwitch.isOn
    }
    
    @IBAction func sliderChange(_ sender: UISlider) {
        updateColor()
    }
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        updateControls()
        updateColor()
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        redSlider.value = 0
        greenSlider.value = 0
        blueSlider.value = 0
        
        redSwitch.isOn = false
        greenSwitch.isOn = false
        blueSwitch.isOn = false
        
        updateControls()
        updateColor()
    }
    
}

