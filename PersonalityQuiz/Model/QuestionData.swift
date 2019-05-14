//
//  QuestionData.swift
//  PersonalityQuiz
//
//  Created by Enrique on 2019-05-10.
//  Copyright © 2019 Enrique. All rights reserved.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType {
    case single, multiple, range
}
