//
//  QuestionService.swift
//  33th-SOPKATHON-iOS-TEAM3
//
//  Created by 민 on 11/25/23.
//

import Foundation
import Moya

enum QuestionService {
    case getTodayQuestion
    case getQuestionList(userId: Int)
}

extension QuestionService: TargetType {
    
    var baseURL: URL {
        return URL(string: URLConstant.baseURL)!
    }
    
    var path: String {
        switch self {
        case .getTodayQuestion:
            return URLConstant.questionURL
        case .getQuestionList:
            return URLConstant.questionURL + "/user"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getTodayQuestion, .getQuestionList:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getTodayQuestion:
            return .requestPlain
        case .getQuestionList(let userId):
            return .requestParameters(parameters: [
                "userId": userId
            ], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getTodayQuestion, .getQuestionList:
            return [
                "Content-Type": "application/json"
            ]
        }
    }
}
