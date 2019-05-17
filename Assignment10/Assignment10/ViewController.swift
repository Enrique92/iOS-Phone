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
        
        inicialUpdate()
    }
    
    func inicialUpdate(){
        
        let c = Default.getColors()
        red = c.r
        blue = c.b
        green = c.g
        redSlider.setValue(Float(red), animated: true)
        greenSlider.setValue(Float(green), animated: true)
        blueSlider.setValue(Float(blue), animated: true)
        
        updateColor()
    }
    
    fileprivate func updateColor() {
        // Get the user default
        let defaultUser = UserDefaults.standard
        
        // Red color
        if redSwitch.isOn {
            red = CGFloat(redSlider.value)
        }
        
        // Green color
        if greenSwitch.isOn {
            green = CGFloat(greenSlider.value)
        }
        
        // Blue color
        if blueSwitch.isOn {
            blue = CGFloat(blueSlider.value)
        }
        
        bgColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        colorView.backgroundColor = bgColor
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

