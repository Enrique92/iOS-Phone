//
//  ViewController.swift
//  StorageData
//
//  Created by Enrique on 2019-05-13.
//  Copyright © 2019 Enrique. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var bluetoothSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get the default user again
        let defaultObject = UserDefaults.standard
        
        if defaultObject.object(forKey: "switch") != nil {
            bluetoothSwitch.isOn = defaultObject.bool(forKey: "switch")
        }
    }
    
    @IBAction func saveSwitchState(_ sender: UISwitch) {
        // Get the user default
        let defaultUser = UserDefaults.standard
        
        // Standar default object
        if sender.isOn {
            defaultUser.set(true, forKey: "switch")
        } else {
            defaultUser.set(false, forKey: "switch")
        }
    }
    
}

