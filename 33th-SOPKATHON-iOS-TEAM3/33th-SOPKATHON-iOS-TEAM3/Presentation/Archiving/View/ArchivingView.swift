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
    
    private let questionTableView = UITableView(frame: .zero, style: .insetGrouped).then {
        $0.backgroundColor = .black
    }
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
        setAddTarget()
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
        self.addSubviews(characterImage, questionTableView)
    }
    
    func setLayout() {
        characterImage.snp.makeConstraints {
            $0.size.equalTo(122)
            $0.top.equalToSuperview().inset(72)
            $0.trailing.equalToSuperview().inset(46)
        }
        
        questionTableView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(96)
            $0.leading.trailing.equalTo(16)
            $0.bottom.equalToSuperview().inset(74)
        }
    }
    
    func setAddTarget() {

    }
    
    @objc
    func buttonTapped() {
        
    }
    
    func setRegisterCell() {
        ArchivingTableViewCell.register(tableView: questionTableView)
    }
    
    func setDataBind() {
        
    }
}

