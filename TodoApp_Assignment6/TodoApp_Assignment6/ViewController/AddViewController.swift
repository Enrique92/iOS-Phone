//
//  AddViewController.swift
//  TodoApp
//
//  Created by Enrique on 2019-05-02.
//  Copyright © 2019 Enrique. All rights reserved.
//

import UIKit
import CoreData

class AddViewController: UIViewController {
    
    // MARK: - Properties
    
    var manageContext: NSManagedObjectContext!
    
    // MARK: - Outlets
    @IBOutlet var textView: UITextView!
    @IBOutlet var cancelButton: UIButton!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var bottomContraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(with:)), name: UIResponder.keyboardWillShowNotification, object: nil)
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
    
    @IBAction func cancelAdd(_ sender: UIButton) {
        dismiss(animated: true)
        textView.resignFirstResponder()
    }
    
    @IBAction func addTodo(_ sender: UIButton) {
        guard let title = textView.text, !title.isEmpty else {
            return
        }
        
        let todo = Todo(context: manageContext)
        todo.title = title
        todo.priority = Int16(1)
        todo.date = Date()
        
        // Save the Todo
        do {
            try manageContext.save()
            dismiss(animated: true)
            textView.resignFirstResponder()
        } catch {
            print("Error saving todo: \(error)")
        }
        

    }
    
}

extension AddViewController: UITextViewDelegate {
    func textViewDidChangeSelection(_ textView: UITextView) {
        if addButton.isHidden {
            textView.text.removeAll()
            textView.textColor = .white
            
            addButton.isHidden = false
            
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
                })
        }
    }
}
