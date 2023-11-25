//
//  QuestionViewController.swift
//  33th-SOPKATHON-iOS-TEAM3
//
//  Created by 민 on 11/25/23.
//

import UIKit
import SnapKit

final class QuestionViewController: UIViewController {
//    let provider = MoyaProvider<QuestionAPI>()
//            provider.request(.randomJokes("GilDong", "Hong")) { (result) in
//                switch result {
//                case let .success(response):
//                    let result = try? response.map(Joke.self)
//                    self.jokeTextView.text = result?.value.joke
//                case let .failure(error):
//                    print(error.localizedDescription)
//                }
//                
//            }
    
    private var isFirstTimeKeyboardShown = true
    
    private let myView = QuestionView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        
        view = myView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getAPI()
        setUI()
        setHierarchy()
        setLayout()
        setDelegate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
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
        
    }
    
    func setHierarchy() {
        
    }
    
    func setLayout() {
        
    }
    
    func setDelegate() {
        
    }
}

// MARK: - Network

extension QuestionViewController {
    func getAPI() {
        
    }
}

extension QuestionViewController: UITextViewDelegate {
}
