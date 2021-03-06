//
//  ViewController.swift
//  RollTheDice
//
//  Created by Enrique on 2019-04-24.
//  Copyright © 2019 Enrique. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let diceArray = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    
    var randomDiceIndex1: Int = 0
    var randomDiceIndex2: Int = 0
    
    @IBOutlet var diceImageView1: UIImageView!
    @IBOutlet var diceImageView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Update the dice when we roll
        updateDiceImages()
    }
    
    @IBAction func rollButtonPress(_ sender: UIButton) {
        updateDiceImages()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        // Call the method and update images
        updateDiceImages()
    }
    
    func updateDiceImages() {
        // Random number between 0 and 5
        randomDiceIndex1 = Int.random(in: 1...6)
        randomDiceIndex2 = Int.random(in: 1...6)
        
        diceImageView1.image = UIImage(named: "dice\(randomDiceIndex1)")
        diceImageView2.image = UIImage(named: "dice\(randomDiceIndex2)")
    }
}

