//
//  ViewController.swift
//  ElementQuiz
//
//  Created by Enrique on 2019-04-16.
//  Copyright © 2019 Enrique. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let elementsList = ["Carbon","Gold", "Chlorine", "Sodium"]
    var currentElementIndex = 0
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var answerLabel: UILabel!
    
    func updateElement() {
        answerLabel.text = "?"
        let elementName = elementsList[currentElementIndex]
        let image = UIImage(named: elementName)
        imageView.image = image
    }
    
    @IBAction func showAnswer(_ sender: Any) {
        answerLabel.text = elementsList[currentElementIndex]
    }
    
    
    @IBAction func goToNextElement(_ sender: Any) {
        currentElementIndex += 1
        if (currentElementIndex >= elementsList.count) {
            currentElementIndex = 0
        }
        updateElement()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateElement()
    }
    
}

