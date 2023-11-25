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
        
    // MARK: - UI Components
    
    private let characterImage = UIImageView().then {
        $0.image = ImageLiterals.Archiving.illu_cha_3
    }
    
    private let todayLabel = UILabel().then {
        $0.text = "오늘의 질문"
        $0.textColor = .white
        $0.font = .title3
    }
    
    public let todayQuestionView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 4
    }
    
    public let todayQuestionLabel = UILabel().then {
        $0.textColor = .pinkPale
        $0.font = .subTitle3
        $0.numberOfLines = 2
    }
    
    private let previousLabel = UILabel().then {
        $0.text = "이전 질문들"
        $0.textColor = .white
        $0.font = .title3
    }
    
    public let questionTableView = UITableView(frame: .zero, style: .plain).then {
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
        
    }
    
    func setRegisterCell() {
        ArchivingTableViewCell.register(tableView: questionTableView)
    }
    
    func setDataBind() {
        
    }
}

