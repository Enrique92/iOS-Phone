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
    
    
    @IBOutlet var editTextView: UITextView!
    @IBOutlet var buttonCancelEditing: UIButton!
    @IBOutlet var buttonSaveEditing: UIButton!
    
    
    var itemsList: Item?
    
    @IBAction func cancelAdd(_ sender: UIButton) {
        dismiss(animated: true)
        editTextView.resignFirstResponder()
    }
    
    @IBAction func saveEditing(_ sender: Any) {
        let editItem = Item(name: "")
        
        if let titleEditText = editTextView.text {
            editItem.name = titleEditText
            
            // Add to the array the edited Item
            takeDataFromTable.itemsList.append(ItemPriority(includePriority: [Item(name: titleEditText)]))

            // Reload the previous viewController
            takeDataFromTable.tableView.reloadData()
            
            // Add animation to the controllView
            navigationController?.popViewController(animated: true)
            dismiss(animated: true)
            editTextView.resignFirstResponder()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editTextView.text = itemsList?.name
    }
}
