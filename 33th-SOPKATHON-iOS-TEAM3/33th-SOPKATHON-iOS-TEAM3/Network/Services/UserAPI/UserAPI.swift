//
//  UserAPI.swift
//  33th-SOPKATHON-iOS-TEAM3
//
//  Created by Hyowon Jeon on 11/26/23.
//

import Foundation
import Moya

final class UserAPI {
    
    static let shared = UserAPI()
    var userProvider = MoyaProvider<UserService>(plugins: [MoyaLoggerPlugin()])
    
    public init() { }
    

    func signup(deviceId: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        userProvider.request(.signup(deviceId: deviceId)) { (result) in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                
                let networkResult = self.judgeSignupStatus(by: statusCode, data)
                completion(networkResult)
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func judgeSignupStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<UserModel>.self, from: data)
        else {
            return .pathErr
        }
        switch statusCode {
        case 200, 201:
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
