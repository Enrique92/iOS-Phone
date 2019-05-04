//
//  AddViewController.swift
//  Assignment6
//
//  Created by Enrique on 2019-05-01.
//  Copyright © 2019 Enrique. All rights reserved.
//

import UIKit

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
        textFieldTitle.textColor = .blue
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(with:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    @IBAction func cancelAdd(_ sender: UIButton) {
        dismiss(animated: true)
        textFieldTitle.resignFirstResponder()
    }
    
    // Add the item to the tableViewController
    @IBAction func addItem(_ sender: Any) {
        // Add a new Item
        let addItem = ToDo()
        
        if let titleText = textFieldTitle.text, !titleText.isEmpty {
            // Add the fields to the class
            addItem.name = titleText
            addItem.important = false
            
            // Add to the array the new Item
            previousVC.items.append(addItem)
            
            // Reload the previous viewController
            previousVC.tableView.reloadData()
            
            // Add animation to the controllView
            navigationController?.popViewController(animated: true)
            dismiss(animated: true)
            textFieldTitle.resignFirstResponder()
        }
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
        if !addITem.isHidden {
            textView.text.removeAll()
            textView.textColor = .white
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        }
    }
}
