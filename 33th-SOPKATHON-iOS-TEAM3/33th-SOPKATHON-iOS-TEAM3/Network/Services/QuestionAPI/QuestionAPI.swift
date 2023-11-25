//
//  QuestionAPI.swift
//  33th-SOPKATHON-iOS-TEAM3
//
//  Created by 민 on 11/25/23.
//

import Foundation
import Moya

final class QuestionAPI {
    
    static let shared = QuestionAPI()
    var questionProvider = MoyaProvider<QuestionService>(plugins: [MoyaLoggerPlugin()])
    
    public init() { }
    

    func getTodayQuestion(completion: @escaping (NetworkResult<Any>) -> Void) {
        questionProvider.request(.getTodayQuestion) { (result) in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                
                let networkResult = self.judgeTodayQuestionStatus(by: statusCode, data)
                completion(networkResult)
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getQuestionList(userId: Int, completion: @escaping (NetworkResult<Any>) -> Void) {
        questionProvider.request(.getQuestionList(userId: userId)) { (result) in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                
                let networkResult = self.judgeQuestionListStatus(by: statusCode, data)
                completion(networkResult)
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func judgeTodayQuestionStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<QuestionModel>.self, from: data)
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
    
    private func judgeQuestionListStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<QuestionListModel>.self, from: data)
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
