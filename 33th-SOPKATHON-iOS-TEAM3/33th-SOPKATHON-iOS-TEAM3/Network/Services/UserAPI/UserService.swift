//
//  UserService.swift.swift
//  33th-SOPKATHON-iOS-TEAM3
//
//  Created by Hyowon Jeon on 11/26/23.
//

import Foundation
import Moya

enum UserService {
    case signup(deviceId: String)
}

extension UserService: TargetType {
    
    var baseURL: URL {
        return URL(string: URLConstant.baseURL)!
    }
    
    var path: String {
        switch self {
        case .signup:
            return URLConstant.userURL
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .signup:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .signup(let deviceId):
            return .requestParameters(parameters: [
                "deviceId": deviceId
            ], encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .signup:
            return [
                "Content-Type": "application/json"
            ]
        }
    }
}
