//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Enrique on 2019-05-09.
//  Copyright © 2019 Enrique. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var resultAnswerLbl: UILabel!
    @IBOutlet var resultDescLbl: UILabel!
    
    var responses: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Calculate which type of animal is the user
        calculatePersonalityResult()
        
        // Hide the back button
        navigationItem.hidesBackButton = true
    }
    
    func calculatePersonalityResult() {
        // Dictionary of answers
        var freequenceAnswers: [AnimalType: Int] = [:]
        let responseType = responses.map{$0.type}
        
        // Check if the answer match with the one of the user
        for response in responseType {
            freequenceAnswers[response] = (freequenceAnswers[response] ?? 0) + 1
        }
        
        // Sort the answers
        let frequencyAnswerSorted = freequenceAnswers.sorted(by:
        {(pair1, pair2) -> Bool in
            return pair1.value < pair2.value
        })
        
        // Get the most common answer and show
        let mostCommonAnswer = frequencyAnswerSorted.first!.key
        
        // Print the results
        resultAnswerLbl.text = "You are \(mostCommonAnswer.rawValue)!"
        resultDescLbl.text = mostCommonAnswer.definition
    }
}
