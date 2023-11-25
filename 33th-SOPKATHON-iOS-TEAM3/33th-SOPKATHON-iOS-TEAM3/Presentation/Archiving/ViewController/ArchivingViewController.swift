//
//  ArchivingViewController.swift
//  33th-SOPKATHON-iOS-TEAM3
//
//  Created by 민 on 11/25/23.
//

import UIKit
import SnapKit

final class ArchivingViewController: UIViewController {

    // MARK: - Properties
    
    var questionList: [QuestionModel] = []
    var todayQuestionId: Int = 0
    
    // MARK: - UI Components
    
    private let archivingView = ArchivingView()
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getQuestionList {
            self.setUI()
            self.setHierarchy()
            self.setLayout()
            self.setDelegate()
            self.setupGestureRecognizer()
        }
    }
}

// MARK: - Extensions
extension ArchivingViewController {
    func setUI() {
        self.view.backgroundColor = .grey7
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setHierarchy() {
        view.addSubviews(archivingView)
    }
    
    func setLayout() {
        archivingView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setDelegate() {
        archivingView.questionTableView.dataSource = self
        archivingView.questionTableView.delegate = self
    }
    
    func setupGestureRecognizer() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewClicked))
        archivingView.todayQuestionView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc
    func viewClicked() {
        let vc = ArchivingDetailViewController()
        vc.questionId = self.todayQuestionId
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Network

extension ArchivingViewController {
    
    func getQuestionList(completion: @escaping() -> Void) {
        QuestionAPI.shared.getQuestionList(userId: UserDefaults.standard.integer(forKey: "USER_ID"), completion: { (response) in
            switch response {
            case .success(let data):
                // 데이터 가져온 후
                if let data = data as? QuestionListModel {
                    self.todayQuestionId = data.todayQuestion.questionId
                    self.archivingView.todayQuestionLabel.text = data.todayQuestion.questionName
                    self.questionList = data.questionList
                    self.archivingView.questionTableView.reloadData()
                    completion()
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

}


// MARK: - TableView Delegate
extension ArchivingViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 94
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ArchivingDetailViewController()
        vc.questionId = questionList[indexPath.row].questionId
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

// MARK: - TableView DataSource
extension ArchivingViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ArchivingTableViewCell.dequeueReusableCell(tableView: archivingView.questionTableView)
        cell.selectionStyle = .none
        
        cell.bindData(title: questionList[indexPath.row].questionName)
        return cell
    }
}
