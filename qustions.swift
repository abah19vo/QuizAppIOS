//
//  qustions.swift
//  quizz
//
//  Created by Ahmad Adnan Abdullah on 2020-11-09.
//

import Foundation



struct Question: Decodable {
    enum questionType: String, Decodable {
        case multiple
    }
    
    enum Difficulty: String, Decodable {
        case easy, medium, hard
    }
    
    
    let category: String
    let type: questionType
    let difficulty: Difficulty
    let question: String
    let correctAnswer: String
    let incorrectAnswers:[String]
}
