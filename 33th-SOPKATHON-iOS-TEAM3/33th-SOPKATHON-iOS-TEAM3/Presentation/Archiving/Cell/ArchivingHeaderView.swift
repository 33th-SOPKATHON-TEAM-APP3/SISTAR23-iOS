//
//  ArchivingHeaderView.swift
//  33th-SOPKATHON-iOS-TEAM3
//
//  Created by 민 on 11/26/23.
//

import UIKit
import SnapKit

final class ArchivingHeaderView: UIView {
    
    // MARK: - UI Components
    
    let questionHeaderLabel = UILabel()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
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
extension ArchivingHeaderView {
    func setUI() {
        self.backgroundColor = .clear
    }
    
    func setHierarchy() {
        self.addSubviews(questionHeaderLabel)
    }
    
    func setLayout() {
        questionHeaderLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.width.equalTo(120)
            $0.height.equalTo(30)
        }
    }
    
    func setDataBind(headerName: String) {
        questionHeaderLabel.text = headerName
    }
}

