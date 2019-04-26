//
//  ViewController.swift
//  SingleViewController
//
//  Created by Enrique on 2019-04-24.
//  Copyright © 2019 Enrique. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Green View Controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add image to the tab bar 
        tabBarItem = UITabBarItem(title: "Hello", image: UIImage(contentsOfFile: "vancouver"), tag: 0)
    }


}

