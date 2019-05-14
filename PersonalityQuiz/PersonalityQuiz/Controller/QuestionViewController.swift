//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by Enrique on 2019-05-09.
//  Copyright © 2019 Enrique. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleBtn1: UIButton!
    @IBOutlet var singleBtn2: UIButton!
    @IBOutlet var singleBtn3: UIButton!
    @IBOutlet var singleBtn4: UIButton!
    
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multipleLb1: UILabel!
    @IBOutlet var multipleLb2: UILabel!
    @IBOutlet var multipleLb3: UILabel!
    @IBOutlet var multipleLb4: UILabel!
    
    @IBOutlet var multipleSwitch1: UISwitch!
    @IBOutlet var multipleSwitch2: UISwitch!
    @IBOutlet var multipleSwitch3: UISwitch!
    @IBOutlet var multipleSwitch4: UISwitch!
    
    @IBOutlet var rangeStackView: UIStackView!
    @IBOutlet var rangeLb1: UILabel!
    @IBOutlet var rangeLb2: UILabel!
    
    @IBOutlet var questionProgressBar: UIProgressView!
    
    @IBOutlet var rangeSlider: UISlider!
    
    
    // Question to show to the user
    var questions: [Question] = [
        Question(text: "Which food do you like the most?",
                 type:.single,
                 answers: [
                    Answer(text: "Steak", type: .dog),
                    Answer(text: "Fish", type: .cat),
                    Answer(text: "Carrots", type: .rabbit),
                    Answer(text: "Corn", type: .turtle)]),
        Question(text: "Which activities do you enjoy?",
                 type: .multiple,
                 answers: [
                    Answer(text: "Swimming", type: .turtle),
                    Answer(text: "Sleeping", type: .cat),
                    Answer(text: "Cuddling", type: .rabbit),
                    Answer(text: "Eating", type: .dog)]),
        Question(text: "How much do you enjoy car rides?",
                 type: .ranged, answers: [
                    Answer(text: "I dislike them", type: .cat),
                    Answer(text: "I get a little nervous", type: .rabbit),
                    Answer(text: "I barely notice them", type: .turtle),
                    Answer(text: "I love them", type: .dog)])
    ]
    
    var questionIndex = 0
    
    // Set the array of answers
    var answerChosen: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    // Update the UI
    func updateUI() {
        // Hide the questions before we saw
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangeStackView.isHidden = true
        
        // Increase the questions of the Array
        navigationItem.title = "Question - \(questionIndex + 1)"
        
        
        let currentQuestion = questions[questionIndex]
        let currentAnswer = currentQuestion.answers
        
        // Get the progress
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        // Update the question label and progress view
        questionLabel.text = currentQuestion.text
        questionProgressBar.setProgress(totalProgress, animated: true)
        
        // Update depending the questions
        func updateSingleStack(using answers: [Answer]) {
            // Hide the view
            singleStackView.isHidden = false
            
            // Set title for the buttons
            singleBtn1.setTitle(answers[0].text, for: .normal)
            singleBtn2.setTitle(answers[1].text, for: .normal)
            singleBtn3.setTitle(answers[2].text, for: .normal)
            singleBtn4.setTitle(answers[3].text, for: .normal)
        }
        
        func updateMultipleStack(using answers: [Answer]) {
            // Hide the view
            multipleStackView.isHidden = false
            
            multipleSwitch1.isOn = false
            multipleSwitch2.isOn = false
            multipleSwitch3.isOn = false
            multipleSwitch4.isOn = false
            
            // Set title for the buttons
            multipleLb1.text = answers[0].text
            multipleLb2.text = answers[1].text
            multipleLb3.text = answers[2].text
            multipleLb4.text = answers[3].text
        }
        
        func updateRangedStack(using answers: [Answer]) {
            // Hide the view
            rangeStackView.isHidden = false
            
            rangeSlider.setValue(0.5, animated: false)
            
            // Set title for the buttons
            rangeLb1.text = answers.first?.text
            rangeLb2.text = answers.last?.text
        }
        
        switch currentQuestion.type {
        case .single:
            updateSingleStack(using: currentAnswer)
        case .multiple:
            updateMultipleStack(using: currentAnswer)
        case .ranged:
            updateRangedStack(using: currentAnswer)
        }
    }
    
    @IBAction func singleAnswerBtn(_ sender: UIButton) {
        // Array of answers for the current question
        let currentAnswers = questions[questionIndex].answers
        
        switch sender {
        case singleBtn1:
            answerChosen.append(currentAnswers[0])
        case singleBtn2:
            answerChosen.append(currentAnswers[1])
        case singleBtn3:
            answerChosen.append(currentAnswers[2])
        case singleBtn4:
            answerChosen.append(currentAnswers[3])
        default:
            break
        }
        // Call the next question
        nextQuestion()
    }
    
    // Continue the the next question
    func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        } else {
            // Move to the Result screen
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        }
    }
    
    @IBAction func multipleSubmitAnswer() {
        // Array of answers for the current question
        let currentAnswers = questions[questionIndex].answers
        
        if multipleSwitch1.isOn {
            answerChosen.append(currentAnswers[0])
        }
        if multipleSwitch2.isOn {
            answerChosen.append(currentAnswers[1])
        }
        if multipleSwitch3.isOn {
            answerChosen.append(currentAnswers[2])
        }
        if multipleSwitch4.isOn {
            answerChosen.append(currentAnswers[3])
        }
        
        // Call the next question
        nextQuestion()
    }
    
    @IBAction func rangeSubmitAnswer() {
        // Array of answers for the current question
        let currentAnswers = questions[questionIndex].answers
        
        // Get the index of the progress to show in the progress bar
        let index = Int(round(rangeSlider.value * Float(currentAnswers.count - 1)))
        
        // Get the current answer(Correct one)
        answerChosen.append(currentAnswers[index])
        
        // Call the next question
        nextQuestion()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultsSegue" {
            // Reference to the viewController
            let resultsViewController = segue.destination as! ResultViewController
            // Send the response and show the answer
            resultsViewController.responses = answerChosen
        }
    }
}
