//
//  URLConstant.swift
//  33th-SOPKATHON-iOS-TEAM3
//
//  Created by 민 on 11/25/23.
//

import Foundation

enum URLConstant {
    
    // MARK: - Base URL
    
    static let baseURL = ""
    
    // MARK: - User
    
    // 유저 회원가입 (POST)
    static let userURL = "/user/signup"
    
    // MARK: - Question
    
    // 오늘의 질문 조회 (GET), 내가 답변한 질문 리스트 조회 (GET)
    static let questionURL = "/question"
    
    // MARK: - Answer
    
    // 오늘의 답변 저장 (POST), 나의 답변 조회 (GET), 랜덤 답변 조회 (GET)
    static let answerURL = "/answer"
}
