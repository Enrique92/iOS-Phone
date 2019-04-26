//
//  ViewController.swift
//  SplitViewController
//
//  Created by Enrique on 2019-04-24.
//  Copyright © 2019 Enrique. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISplitViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Delegate the split view controller
        splitViewController?.delegate = self
        // Display everything visible
        splitViewController?.preferredDisplayMode = .allVisible
    }
    
    // Delegate method from the UISplitViewControllerDelegate
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        // Don't collapse the view avobe the other(Primary)
        return true
    }
    
}

