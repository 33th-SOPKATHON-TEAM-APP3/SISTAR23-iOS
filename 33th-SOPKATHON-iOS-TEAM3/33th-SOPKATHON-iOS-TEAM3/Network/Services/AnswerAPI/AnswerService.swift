//
//  AnswerService.swift
//  33th-SOPKATHON-iOS-TEAM3
//
//  Created by 민 on 11/25/23.
//

import Foundation
import Moya

enum AnswerService {
    case postTodayAnswer(questionId: Int, userId: Int, answer: String)
    case getMyAnswer(questionId: Int, userId: Int)
    case getRandomAnswer(questionId: Int, userId: Int)
}

extension AnswerService: TargetType {
    
    var baseURL: URL {
        return URL(string: URLConstant.baseURL)!
    }
    
    var path: String {
        switch self {
        case .postTodayAnswer(let questionId, _, _):
            return URLConstant.answerURL + "/\(questionId)"
        case .getMyAnswer:
            return URLConstant.answerURL
        case .getRandomAnswer:
            return URLConstant.answerURL + "/random"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .postTodayAnswer:
            return .post
        case .getMyAnswer, .getRandomAnswer:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .postTodayAnswer(_, let userId, let answer):
            return .requestParameters(parameters: [
                "userId": userId,
                "answer": answer
            ], encoding: JSONEncoding.default)
        case .getMyAnswer(let questionId, let userId), .getRandomAnswer(let questionId, let userId):
            return .requestParameters(parameters: [
                "questionId": questionId,
                "userId": userId
            ], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .postTodayAnswer, .getMyAnswer, .getRandomAnswer:
            return [
                "Content-Type": "application/json"
            ]
        }
    }
}
