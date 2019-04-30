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
    @IBOutlet var tipAmountTextField: UITextField!
    @IBOutlet var billFinalAmountLabel: UILabel!
    @IBOutlet var sliderTipAmount: UISlider!
    @IBOutlet var calculateTip: UIButton!
    @IBOutlet var mainStackView: UIStackView!
    
    var result: Double = 0.0
    var tip: Double = 0.0
    var bill: Double = 0.0
    
    // Update the textField of the tip if we change the value of the slider
    @IBAction func updateAmountTipWithSlider(_ sender: UISlider) {
        tipAmountTextField.text = String(sender.value)
    }
    
    @IBAction func calculateTheTip(_ sender: Any) {
        //let bill = billAmountTextField.text
        if let doubleValue = Double(billAmountTextField.text!) {
            bill = doubleValue
            
            if (tipAmountTextField.text != "") {
                // If the person write tip get it if not the default one
                if let tipAmount = Double(tipAmountTextField.text!) {
                    tip = doubleValue * (tipAmount/100)
                    result = doubleValue + tip
                    
                } else {
                    result = 0.0
                    tip = 0.0
                    // Show the result in the Label
                    billFinalAmountLabel.text = String(result)
                    print("Not a valid number: \(tipAmountTextField.text!)")
                }
            } else {
                tip = doubleValue * 0.15
                result = doubleValue + tip
            }
            
            // Show the result in the Label
            billFinalAmountLabel.text = String(result)
        } else {
            result = 0.0
            tip = 0.0
            // Show the result in the Label
            billFinalAmountLabel.text = String(result)
            print("Not a valid number: \(billAmountTextField.text!)")
        }
    }
    
    @objc func keywordWillChangeNotification(notification: Notification) {
        
        let keyboardRect = mainStackView.alignment.rawValue-100
        
        if notification.name == UIResponder.keyboardWillShowNotification ||
           notification.name == UIResponder.keyboardWillChangeFrameNotification {
            // Move the original view to see the amount of the final bill
            view.frame.origin.y = CGFloat(keyboardRect)
        } else {
            // Move the original view to see the amount of the final bill
            view.frame.origin.y = 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billAmountTextField.delegate = self
        tipAmountTextField.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keywordWillChangeNotification(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keywordWillChangeNotification(notification:)), name: UIResponder.keyboardWillShowNotification , object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    }
}

// Update the Label everytime it change
extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if Double(textField.text!) != tip {
            calculateTheTip((Any).self)
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

