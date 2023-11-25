//
//  ArchivingDetailAnswerView.swift
//  33th-SOPKATHON-iOS-TEAM3
//
//  Created by 윤영서 on 11/26/23.
//

import UIKit

import Then
import SnapKit

final class ArchivingDetailAnswerView: UIView {
    
    // MARK: - UI Properties
    
    public var titleLabel = UILabel()
    public let pinkHorzLineView = UIView()
    public var contentLabel = UILabel()
    
    // MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStyles()
        setupViews()
        setupConstraints()
        setupProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private Method

private extension ArchivingDetailAnswerView {
    
    func setupStyles() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 15
    }
    
    func setupViews() {
        addSubviews(titleLabel, pinkHorzLineView, contentLabel)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(21)
            $0.centerX.equalToSuperview()
        }
        
        pinkHorzLineView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.leading.equalTo(titleLabel.snp.leading).offset(-16)
            $0.trailing.equalTo(titleLabel.snp.trailing).offset(16)
            $0.height.equalTo(1)
        }
        
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(pinkHorzLineView.snp.bottom).offset(14)
            $0.leading.trailing.equalToSuperview().inset(37)
            $0.bottom.equalToSuperview().inset(22)
        }
    }
    
    func setupProperties() {
        titleLabel.do {
            $0.font = .title3
            $0.textColor = .black
        }
        
        pinkHorzLineView.do {
            $0.backgroundColor = .pink
        }
        
        contentLabel.do {
            $0.font = .body1
            $0.textColor = .black
            $0.numberOfLines = 0
        }
    }
}
