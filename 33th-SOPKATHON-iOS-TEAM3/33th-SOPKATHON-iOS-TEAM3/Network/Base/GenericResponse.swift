//
//  GenericResponse.swift
//  33th-SOPKATHON-iOS-TEAM3
//
//  Created by 민 on 11/25/23.
//

import Foundation

struct GenericResponse<T: Codable>: Codable {
    let code: String?
    let message: String?
    let status: Int
    let data: T?
    
    enum CodingKeys: String, CodingKey {
        case code, message, status
        case data = "result"
    }
}
