//
//  ViewController.swift
//  SegueStoryBoard
//
//  Created by Enrique on 2019-04-25.
//  Copyright © 2019 Enrique. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var phoneTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goSecond" {
            // Unwrapping the secondVC
            if let secondVC = segue.destination as? SecondViewController {
                secondVC.phoneLabel.text = phoneTextField.text
            }
        }
    }
    
    @IBAction func goToSecondVC(_ sender: UIButton) {
        
    }
    
}

