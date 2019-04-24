//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Enrique on 2019-04-23.
//  Copyright © 2019 Enrique. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var appSign: UILabel!
    @IBOutlet var gameLayout: UILabel!
    @IBOutlet var rockButton: UIButton!
    @IBOutlet var paperButton: UIButton!
    @IBOutlet var scissorsButton: UIButton!
    @IBOutlet var playAgainButton: UIButton!
    
    private var state: GameState = .Start
    private var sign: Sign?
    
    fileprivate func updateUI() {
        // Set the second label(status label)
        // Set the color base on the state
        // Hide buttons with the different states
        switch state {
        case .Start:
            gameLayout.text = "Rock, Paper or Scissors?"
            playAgainButton.isHidden = true
            view.backgroundColor = .blue
            return
        case .Win:
            gameLayout.text = "You win!"
            playAgainButton.isHidden = false
            rockButton.isEnabled = false
            paperButton.isEnabled = false
            scissorsButton.isEnabled = false
            view.backgroundColor = .green
            return
        case .Lose:
            gameLayout.text = "You lose!"
            playAgainButton.isHidden = false
            rockButton.isEnabled = false
            paperButton.isEnabled = false
            scissorsButton.isEnabled = false
            view.backgroundColor = .red
            return
        case .Draw:
            gameLayout.text = "You draw!"
            playAgainButton.isHidden = false
            rockButton.isEnabled = false
            paperButton.isEnabled = false
            scissorsButton.isEnabled = false
            view.backgroundColor = .yellow
            return
        }
    }
    
    @IBAction func play(_ sender: UIButton) {
        let compSign = randomSign()
        let mySign: Sign
        appSign.text = compSign.emoji
        
        if (sender.tag == 1) {
            mySign = Sign.Rock
            state = mySign.getGameState(other: compSign)
        } else if (sender.tag == 2) {
            mySign = Sign.Paper
            state = mySign.getGameState(other: compSign)
        } else if (sender.tag == 3) {
            mySign = Sign.Scissors
            state = mySign.getGameState(other: compSign)
        }
    }
    
    @IBAction func playAgain(_ sender: UIButton) {
        state = .Start
        updateUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

