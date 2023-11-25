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
    
    private let questionLabel = UILabel().then {
        $0.numberOfLines = 2
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
        self.backgroundColor = .black
    }
    
    func setHierarchy() {
        addSubviews(questionLabel)
    }
    
    func setLayout() {
        questionLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}


