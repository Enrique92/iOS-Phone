//
//  ViewController.swift
//  AnimalsSounds
//
//  Created by Enrique on 2019-04-16.
//  Copyright © 2019 Enrique. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var animalSoundLabel: UILabel!
    let meowSound = SimpleSound(named: "meow")
    let dogSound = SimpleSound(named: "woof")
    let mooSound = SimpleSound(named: "moo")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func catButtonTapped(_ sender: Any) {
        animalSoundLabel.text = "Meow!"
        meowSound.play()
    }
    
    @IBAction func dogButtonTapped(_ sender: Any) {
        animalSoundLabel.text = "Woof!"
        dogSound.play()
    }
    
    @IBAction func cowButtonTapped(_ sender: Any) {
        animalSoundLabel.text = "Moo!"
        mooSound.play()
    }
    
}

