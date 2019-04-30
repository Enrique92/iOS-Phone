//
//  ViewController.swift
//  TipCalculator
//
//  Created by Enrique on 2019-04-29.
//  Copyright © 2019 Enrique. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var billAmountTextField: UITextField!
    @IBOutlet var calculateTip: UIButton!
    @IBOutlet var tipAmountLabel: UILabel!
    @IBOutlet var tipPercentageTextField: UITextField!
    
    
    @IBAction func calculateTip(_ sender: Any) {
        var result: Double = 0.0
        var tip: Double = 0.0
        //let bill = billAmountTextField.text
        if let doubleValue = Double(billAmountTextField.text!) {
            if (tipPercentageTextField.text != "") {
                // If the person write tip get it if not the default one
                if let tipAmount = Double(tipPercentageTextField.text!) {
                    tip = doubleValue * (tipAmount/100)
                    result = doubleValue + tip
                } else {
                    result = 0.0
                    tip = 0.0
                    // Show the result in the Label
                    tipAmountLabel.text = String(result)
                    print("Not a valid number: \(tipPercentageTextField.text!)")
                }
            } else {
                tip = doubleValue * 0.15
                result = doubleValue + tip
            }
            
            // Show the result in the Label
            tipAmountLabel.text = String(result)
        } else {
            result = 0.0
            tip = 0.0
            // Show the result in the Label
            tipAmountLabel.text = String(result)
            print("Not a valid number: \(billAmountTextField.text!)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

