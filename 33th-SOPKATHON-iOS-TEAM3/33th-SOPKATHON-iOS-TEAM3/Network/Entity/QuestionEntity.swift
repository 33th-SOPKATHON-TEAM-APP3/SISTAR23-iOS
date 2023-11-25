//
//  QuestionEntity.swift
//  33th-SOPKATHON-iOS-TEAM3
//
//  Created by 민 on 11/25/23.
//

import Foundation

struct QuestionListModel: Codable {
    let todayQuestion: QuestionModel
    let questionList: [QuestionModel]
}

struct QuestionModel: Codable {
    let questionId: Int
    let questionName: String
}
