//
//  ArchivingTableViewCell.swift
//  33th-SOPKATHON-iOS-TEAM3
//
//  Created by 민 on 11/26/23.
//

import UIKit
import SnapKit

final class ArchivingTableViewCell: UITableViewCell, UITableViewRegisterable {
    
    // MARK: - Properties
    
    // MARK: - UI Components
    
    private let whiteBackgroundView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 4
    }
    
    private let questionLabel = UILabel().then {
        $0.numberOfLines = 2
        $0.font = .subTitle2
        $0.textColor = .grey6
        $0.text = "노트북 배터리가 0% 상태에서 정전이 되었다. 당신의 기분은?"
    }
    
    // MARK: - Life Cycles
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
        setHierarchy()
        setLayout()
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions
extension ArchivingTableViewCell {
    func setUI() {
        self.backgroundColor = .grey7
    }
    
    func setHierarchy() {
        addSubviews(whiteBackgroundView)
        whiteBackgroundView.addSubviews(questionLabel)
    }
    
    func setLayout() {
        whiteBackgroundView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(82)
        }
        
        questionLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(303)
            $0.height.equalTo(44)
        }
    }
    
    func bindData(title: String) {
        questionLabel.text = title
    }
}


