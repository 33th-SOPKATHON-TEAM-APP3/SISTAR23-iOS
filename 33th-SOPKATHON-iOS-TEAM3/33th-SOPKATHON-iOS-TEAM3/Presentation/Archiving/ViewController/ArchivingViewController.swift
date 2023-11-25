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
    
    // MARK: - UI Components
    
    private let archivingView = ArchivingView()
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setHierarchy()
        setLayout()
        setDelegate()
        getTodayQuestion()
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
}

// MARK: - Network

extension ArchivingViewController {
    
    func getTodayQuestion() {
        QuestionAPI.shared.getQuestionList(userId: UserDefaults.standard.integer(forKey: "USER_ID"), completion: { (response) in
            switch response {
            case .success(let data):
                print("success", data)
                // 데이터 가져온 후
                if let data = data as? QuestionListModel {
                    self.archivingView.todayQuestionLabel.text = data.todayQuestion.questionName
                    self.questionList = data.questionList
                    self.archivingView.questionTableView.reloadData()
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
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ArchivingTableViewCell.dequeueReusableCell(tableView: archivingView.questionTableView)
        cell.selectionStyle = .none
        
        cell.bindData(title: questionList[indexPath.row].questionName)
        return cell
    }
}

extension ArchivingViewController: ArchivingViewCellDelegate {
    func cellClicked() {
        let rootVC = ArchivingDetailViewController()
        self.navigationController?.pushViewController(rootVC, animated: true)
    }
}
