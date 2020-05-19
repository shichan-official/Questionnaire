//
//  QuizEngine.swift
//  Questionnaire
//
//  Created by Siavash Jalali on 2020/05/19.
//  Copyright © 2020 shichan-official. All rights reserved.
//

import Foundation

struct QuizEngine {
    let questions = [
        Question(q: "Today is Friday", a: true),
        Question(q: "Everyday is Friday", a: true),
        Question(q: "Tomorrow is Monday", a: false),
        Question(q: "Yesterday was Tuesday", a: false),
        Question(q: "Tomorrow is Friday", a: true)
    ]
    
    var questionIndex = 0
    
    var score = 0
    
    func verifyAnswer(_ answer: Bool) -> Bool {
        if(answer == questions[questionIndex].answer) {
            return true
        } else {
            return false
        }
    }
    
    mutating func addScore() {
        score += 1
    }
    
    mutating func nextQuestion() {
        if(questionIndex + 1 < questions.count) {
            questionIndex += 1
        } else {
            questionIndex = 0
            score = 0
        }
    }
    
    func calculateProgress() -> Float {
        return Float(questionIndex + 1) / Float(questions.count)
    }
    
    func getCurrentQuestion() -> String {
        return questions[questionIndex].question
    }
}
