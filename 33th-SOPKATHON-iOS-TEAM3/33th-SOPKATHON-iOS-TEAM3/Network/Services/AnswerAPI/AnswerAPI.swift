//
//  AnswerAPI.swift
//  33th-SOPKATHON-iOS-TEAM3
//
//  Created by 민 on 11/25/23.
//

import Foundation
import Moya

final class AnswerAPI {
    
    static let shared = AnswerAPI()
    var answerProvider = MoyaProvider<AnswerService>(plugins: [MoyaLoggerPlugin()])
    
    public init() { }
    

    func postTodayAnswer(questionId: Int, userId: Int, answer: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        answerProvider.request(.postTodayAnswer(questionId: questionId, userId: userId, answer: answer)) { (result) in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                
                let networkResult = self.judgeIsAnsweredStatus(by: statusCode, data)
                completion(networkResult)
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getMyAnswer(questionId: Int, userId: Int, completion: @escaping (NetworkResult<Any>) -> Void) {
        answerProvider.request(.getMyAnswer(questionId: questionId, userId: userId)) { (result) in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                
                let networkResult = self.judgeMyAnswerStatus(by: statusCode, data)
                completion(networkResult)
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getRandomAnswer(questionId: Int, userId: Int, completion: @escaping (NetworkResult<Any>) -> Void) {
        answerProvider.request(.getRandomAnswer(questionId: questionId, userId: userId)) { (result) in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                
                let networkResult = self.judgeRandomAnswerStatus(by: statusCode, data)
                completion(networkResult)
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func judgeIsAnsweredStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<IsAnsweredModel>.self, from: data)
        else {
            return .pathErr
        }
        switch statusCode {
        case 201:
            return .success(decodedData.data ?? "success")
        case 400..<500:
            return .requestErr(decodedData.code)
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
    
    private func judgeMyAnswerStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<MyAnswerModel>.self, from: data)
        else {
            return .pathErr
        }
        switch statusCode {
        case 200:
            return .success(decodedData.data ?? "success")
        case 400..<500:
            return .requestErr(decodedData.code)
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
    
    private func judgeRandomAnswerStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<RandomAnswerModel>.self, from: data)
        else {
            return .pathErr
        }
        switch statusCode {
        case 200:
            return .success(decodedData.data ?? "success")
        case 400..<500:
            return .requestErr(decodedData.code)
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }

}
