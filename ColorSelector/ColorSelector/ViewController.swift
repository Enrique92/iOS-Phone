//
//  ViewController.swift
//  ColorSelector
//
//  Created by Enrique on 2019-04-15.
//  Copyright © 2019 Enrique. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var colorViews: UIView!
    @IBOutlet var redSwitch: UISwitch!
    @IBOutlet var greenSwitch: UISwitch!
    @IBOutlet var blueSwitch: UISwitch!
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var color_View: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        colorViews.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
    }
    
    fileprivate func updateColor() {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        
        if redSwitch.isOn {
            red = 0
        }
        
        if greenSwitch.isOn {
            green = 0
        }
        
        if blueSwitch.isOn {
            blue = 0
        }
        
        let bgColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        colorViews.backgroundColor = bgColor
    }
    @IBAction func resetButton(_ sender: UIButton) {
        redSlider.value = 1
        greenSlider.value = 1
        blueSlider.value = 1
    }
    
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        updateColor()
    }
}

