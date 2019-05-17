//
//  AddViewController.swift
//  Assignment6
//
//  Created by Enrique on 2019-05-01.
//  Copyright © 2019 Enrique. All rights reserved.
//

import UIKit
import CoreData

class AddViewController: UIViewController {
    
    // Reference to the previous viewController
    var previousVC = MainTableViewController() 
    
    @IBOutlet var textFieldTitle: UITextView!
    @IBOutlet var cancelButton: UIButton!
    @IBOutlet var bottomContraint: NSLayoutConstraint!
    @IBOutlet var addITem: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldTitle.text = "Write something..."
        textFieldTitle.textColor = .white
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(with:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    @IBAction func cancelAdd(_ sender: UIButton) {
        dismiss(animated: true)
        textFieldTitle.resignFirstResponder()
    }
    
    // Add the item to the tableViewController
    @IBAction func addItem(_ sender: Any) {
        // Add to the core data
        let context = [UIApplication.shared.delegate as? AppDelegate].persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Item", in: context)
        let newItem = NSManagedObject(entity: entity!, insertInto: context)
        
        newItem.setValue(textFieldTitle.text, forKey: "name")
        
        // Add a new Item
        let addItem = Item(name: "")
        
        if let titleText = textFieldTitle.text, !titleText.isEmpty {
            // Add the fields to the class
            addItem.name = titleText
            
            
            // Add to the array the new Item
            if !previousVC.itemsListNormal.isEmpty {
                previousVC.itemsListNormal.insert(ItemPriority(includePriority: [Item(name: titleText)]), at: 0)
            } else {
                previousVC.itemsListNormal.append(ItemPriority(includePriority: [Item(name: titleText)]))
            }
            
            
            // Add to the main list the rest of the priority tasks
            previousVC.itemsList.append(contentsOf: previousVC.itemsListNormal)
            
            // Reload the previous viewController
            previousVC.tableView.reloadData()
            
            // Add animation to the controllView
            navigationController?.popViewController(animated: true)
            dismiss(animated: true)
            textFieldTitle.resignFirstResponder()
        }
        
        context.save()
    }
    
    @objc func keyboardWillShow(with notification: Notification) {
        let key = "UIKeyboardFrameEndUserInfoKey"
        guard let keyboardFrame = notification.userInfo?[key] as? NSValue else { return }
        
        let keyboardHeight = keyboardFrame.cgRectValue.height - 16
        bottomContraint.constant = keyboardHeight
        UIView.animate(withDuration: 0.3){
            self.view.layoutIfNeeded()
        }
    }
}

extension AddViewController: UITextViewDelegate {
    func textViewDidChangeSelection(_ textView: UITextView) {
        textView.text.removeAll()
        textView.textColor = .white
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        })
    }
}
