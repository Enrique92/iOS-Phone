//
//  EditViewController.swift
//  Assignment6
//
//  Created by Enrique on 2019-05-02.
//  Copyright © 2019 Enrique. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {
    
    // Reference to the tableViewController
    var takeDataFromTable = MainTableViewController()
    
    @IBOutlet var editTextTitle: UITextField!
    @IBOutlet var buttonSaveEditing: UIButton!
    
    @IBAction func saveEditing(_ sender: Any) {
        let editItem = Item()
        
        if let titleEditText = editTextTitle.text {
            editItem.name = titleEditText
            
            // Add to the array the new Item
            takeDataFromTable.itemsList.append(ItemPriority(prio: "Normal", includePriority: []))
            
            // Reload the previous viewController
            takeDataFromTable.tableView.reloadData()
            
            // Add animation to the controllView
            navigationController?.popViewController(animated: true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
