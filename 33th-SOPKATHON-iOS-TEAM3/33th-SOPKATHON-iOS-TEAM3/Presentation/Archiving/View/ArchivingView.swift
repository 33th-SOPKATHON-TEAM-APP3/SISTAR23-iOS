//
//  ArchivingView.swift
//  33th-SOPKATHON-iOS-TEAM3
//
//  Created by 민 on 11/25/23.
//

import UIKit
import SnapKit
import Then

final class ArchivingView: UIView {

    // MARK: - Properties
    
    var index: Int = 0
    
    // MARK: - UI Components
    
    private let characterImage = UIImageView()
    
    private let todayLabel = UILabel().then {
        $0.text = "오늘의 질문"
        $0.textColor = .white
        $0.font = .title3
    }
    
    private let todayQuestionView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 4
    }
    
    private let todayQuestionLabel = UILabel().then {
        $0.text = "노트북 배터리가 0% 상태에서 정전이 되었다. 당신의 기분은?"
        $0.textColor = .pinkPale
        $0.font = .subTitle3
        $0.numberOfLines = 2
    }
    
    private let previousLabel = UILabel().then {
        $0.text = "이전 질문들"
        $0.textColor = .white
        $0.font = .title3
    }
    
    private let questionTableView = UITableView(frame: .zero, style: .plain).then {
        $0.isScrollEnabled = false
        $0.backgroundColor = .grey7
    }
        
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
        setAddTarget()
        setDelegate()
        setRegisterCell()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions
extension ArchivingView {
    func setUI() {
        
    }
    
    func setHierarchy() {
        self.addSubviews(characterImage, todayLabel, todayQuestionView, previousLabel, questionTableView)
        todayQuestionView.addSubviews(todayQuestionLabel)
    }
    
    func setLayout() {
        characterImage.snp.makeConstraints {
            $0.size.equalTo(122)
            $0.top.equalToSuperview().inset(72)
            $0.trailing.equalToSuperview().inset(46)
        }
        
        todayLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(96)
            $0.leading.equalToSuperview().inset(16)
        }
        
        todayQuestionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalTo(todayLabel.snp.bottom).offset(12)
            $0.height.equalTo(82)
        }
        
        todayQuestionLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(303)
            $0.height.equalTo(44)
        }
        
        previousLabel.snp.makeConstraints {
            $0.top.equalTo(todayQuestionView.snp.bottom).offset(22)
            $0.leading.equalToSuperview().inset(16)
            $0.width.equalTo(120)
            $0.height.equalTo(28)
        }
        
        questionTableView.snp.makeConstraints {
            $0.top.equalTo(previousLabel.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(74)
        }
    }
    
    func setAddTarget() {

    }
    
    func setDelegate() {
        questionTableView.dataSource = self
        questionTableView.delegate = self
    }
    
    func setRegisterCell() {
        ArchivingTableViewCell.register(tableView: questionTableView)
    }
    
    func setDataBind() {
        
    }
}

// MARK: - TableView Delegate
extension ArchivingView: UITableViewDelegate { 
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 94
    }
    
}

// MARK: - TableView DataSource
extension ArchivingView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ArchivingTableViewCell.dequeueReusableCell(tableView: questionTableView)
        cell.selectionStyle = .none
        return cell
    }
}

