//
//  DetailViewController.swift
//  Assignment6
//
//  Created by Enrique on 2019-05-02.
//  Copyright © 2019 Enrique. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var detailsName: UILabel!
    @IBOutlet var cancelButton: UIButton!
    
    var getName: Item?
    
    // Reference to the previous viewController
    var previousVC = MainTableViewController()
    var selectDetailsItem = Item()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Show in the labels the values of the item selected
        detailsName.text = "\((getName?.name)!)"
    }
    
    @IBAction func cancelAdd(_ sender: UIButton) {
        dismiss(animated: true)
        detailsName.resignFirstResponder()
    }
}
