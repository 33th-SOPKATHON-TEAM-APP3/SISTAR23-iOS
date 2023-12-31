//
//  QuestionViewController.swift
//  33th-SOPKATHON-iOS-TEAM3
//
//  Created by 민 on 11/25/23.
//

import UIKit
import SnapKit

final class QuestionViewController: UIViewController {
    private var isFirstTimeKeyboardShown = true
    
    private let myView = QuestionView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        
        view = myView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setHierarchy()
        setLayout()
        setDelegate()
        getTodayQuestion()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if isFirstTimeKeyboardShown {
            let textView = myView.textView
            textView.becomeFirstResponder()
            isFirstTimeKeyboardShown = false
        }
    }
}

// MARK: - Extensions
extension QuestionViewController {
    func setUI() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setHierarchy() {
        
    }
    
    func setLayout() {
        
    }
    
    func setDelegate() {
        myView.questionViewButtonDelegate = self
    }
}

// MARK: - Network

private extension QuestionViewController {
    
    func getTodayQuestion() {
        QuestionAPI.shared.getTodayQuestion(completion: { (response) in
            switch response {
            case .success(let data):
                print("success", data)
                if let data = data as? QuestionModel {
                    self.myView.questionId = data.questionId
                    self.myView.questionLabel.text = data.questionName
                }
            case .requestErr(let statusCode):
                print("requestErr", statusCode)
            case .pathErr:
                print(".pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        })
    }
    
    func postTodayAnswer(questionId: Int, userId: Int, answer: String, completion: @escaping() -> Void) {
        AnswerAPI.shared.postTodayAnswer(questionId: questionId, userId: userId, answer: answer, completion: { (response) in
            switch response {
            case .success(let data):
                print("success", data)
                let saveCompleteVC = SaveCompleteViewController()
                self.navigationController?.pushViewController(saveCompleteVC, animated: true)
                completion()
                // 데이터 가져온 후
            case .requestErr(let statusCode):
                print("requestErr", statusCode)
            case .pathErr:
                print(".pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        })
    }
}

extension QuestionViewController: QuestionViewButtonDelegate {
    func saveButtonClicked(questionId: Int, userId: Int, answer: String) {
        postTodayAnswer(questionId: questionId, userId: userId, answer: answer) {
            let rootVC = SaveCompleteViewController()
            self.navigationController?.pushViewController(rootVC, animated: true)
        }
    }
    
}
