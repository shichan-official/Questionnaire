//
//  Question.swift
//  Questionnaire
//
//  Created by Siavash Jalali on 2020/05/19.
//  Copyright © 2020 shichan-official. All rights reserved.
//

import Foundation

struct Question {
    let question: String
    let answer: Bool
    
    init(q: String, a: Bool) {
        question = q
        answer = a
    }
}
