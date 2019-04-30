//
//  ViewController.swift
//  Magic_8_Ball
//
//  Created by Enrique on 2019-04-29.
//  Copyright © 2019 Enrique. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var ballArray = ["ball1", "ball2", "ball3", "ball4", "ball5"]
    
    var randomBallNumber: Int = 0
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var askButtonPressed: UIButton!
    
    @IBAction func askButtonPressed(_ sender: Any) {
        newBallImage()
    }
    
    func newBallImage() {
        // Random number between 0 and 5
        randomBallNumber = Int.random(in: 0...4)
        
        // Update the image with the random value
        imageView.image = UIImage(named: ballArray[randomBallNumber])
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        newBallImage()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        newBallImage()
    }

}

