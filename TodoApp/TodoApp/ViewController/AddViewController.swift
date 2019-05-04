//
//  AddViewController.swift
//  TodoApp
//
//  Created by Enrique on 2019-05-02.
//  Copyright © 2019 Enrique. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet var textView: UITextView!
    @IBOutlet var cancelButton: UIButton!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var bottomContraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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
    }
    
    @IBAction func addTodo(_ sender: UIButton) {
    }
    
}
