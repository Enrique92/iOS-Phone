//
//  AnswerData.swift
//  PersonalityQuiz
//
//  Created by Enrique on 2019-05-10.
//  Copyright © 2019 Enrique. All rights reserved.
//

import Foundation

struct Answer {
    var text: String
    var type: AnimalType
}

enum AnimalType: Character {
    case dog = "🐶", cat = "🐱", rabbit = "🐰", turtle = "🐢"
    
    var definition: String {
        switch self {
        case .dog:
            "You are incredible outgoing. You surround yourself with the people you love and enjoy activities wth your friends."
        case .cat:
            "Mischievous, yet mild-tempered, you enjoy doing things on your own terms."
        case .rabbit:
            "You love everything that's soft. You are healthy and full of energy."
        case .turtle:
            "You are wise beyond your years, and you focus on the details. Slow and steady wins the race."
        }
    return definition
    }
}
