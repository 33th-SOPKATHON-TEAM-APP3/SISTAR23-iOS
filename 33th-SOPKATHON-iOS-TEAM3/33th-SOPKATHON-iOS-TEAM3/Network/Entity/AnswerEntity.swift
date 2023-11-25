//
//  AnswerEntity.swift
//  33th-SOPKATHON-iOS-TEAM3
//
//  Created by Hyowon Jeon on 11/26/23.
//

import Foundation

struct IsAnsweredModel: Codable {
    let isAnswered: Bool
}

struct MyAnswerModel: Codable {
    let questionDto: QuestionModel
    let myAnswer: String
}

struct RandomAnswerModel: Codable {
    let randomAnswer: String
}
