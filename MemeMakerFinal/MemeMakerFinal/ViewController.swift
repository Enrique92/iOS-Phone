//
//  ViewController.swift
//  MemeMakerFinal
//
//  Created by Enrique on 2019-04-23.
//  Copyright © 2019 Enrique. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var topCaptionSegmentedControl: UISegmentedControl!
    @IBOutlet var topCaptionLabel: UILabel!
    @IBOutlet var bottomCaptionLabel: UILabel!
    @IBOutlet var bottomCaptionSegmentedControl: UISegmentedControl!
    
    // Create the array
    var topChoices = [CaptionChoice]()
    var bottomChoices = [CaptionChoice]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Add the captions to then add to the Segmented -> Top
        let goodchoice = CaptionChoice(emoji: "🕶", caption: "You know what's cool?")
        let normalchoice = CaptionChoice(emoji: "😻", caption: "I love it!")
        let badchoice = CaptionChoice(emoji: "💥", caption: "You make me mad!")
        
        // Add the captions to the Segmented
        topChoices = [goodchoice, normalchoice, badchoice]
        
        // Remove all the Segmented before
        topCaptionSegmentedControl.removeAllSegments()
        
        // Add to the Segmented the emojis and titles
        for choice in topChoices {
            topCaptionSegmentedControl.insertSegment(withTitle: choice.emoji, at: topChoices.count, animated: false)
        }
        
        // Set the Segmented to the index zero to appears the first one
        topCaptionSegmentedControl.selectedSegmentIndex = 0
        
        //---------------------- BOTTOM --------------------//
        
        // Add the captions to then add to the Segmented -> Bottom
        let catChoice = CaptionChoice(emoji: "🐱", caption: "Cats wearing hats!")
        let dogChoice = CaptionChoice(emoji: "🐶", caption: "Dogs carrying logs!")
        let monkeyChoice = CaptionChoice(emoji: "🐵", caption: "Monkeys being funky!")
        
        // Add the captions to the Segmented
        bottomChoices = [catChoice, dogChoice, monkeyChoice]
        
        // Remove all the Segmented before
        bottomCaptionSegmentedControl .removeAllSegments()
        
        // Add to the Segmented the emojis and titles
        for choice in bottomChoices {
            bottomCaptionSegmentedControl.insertSegment(withTitle: choice.emoji, at: bottomChoices.count, animated: false)
        }
        
        // Set the Segmented to the index zero to appears the first one
        bottomCaptionSegmentedControl.selectedSegmentIndex = 0
        
        // Update the Labels for the first time (Default)
        updateLabels()
    }
    
    // Method to update the text of the Labels
    func updateLabels() {
        let topIndex = topCaptionSegmentedControl.selectedSegmentIndex
        let bottomIndex = bottomCaptionSegmentedControl.selectedSegmentIndex
        
        // Add to the arrays the index
        let topChoice = topChoices[topIndex]
        let bottomChoice = bottomChoices[bottomIndex]
        
        // Update the text of each Label
        topCaptionLabel.text = topChoice.caption
        bottomCaptionLabel.text = bottomChoice.caption
    }
    
    @IBAction func choseSelected(_ sender: Any) {
        // Update the top and bottom Label
        updateLabels()
    }
}

