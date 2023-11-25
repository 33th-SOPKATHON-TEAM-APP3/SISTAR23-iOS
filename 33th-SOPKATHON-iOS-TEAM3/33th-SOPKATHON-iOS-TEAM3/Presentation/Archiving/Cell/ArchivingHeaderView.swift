//
//  ArchivingHeaderView.swift
//  33th-SOPKATHON-iOS-TEAM3
//
//  Created by 민 on 11/26/23.
//

import UIKit
import SnapKit

final class ArchivingHeaderView: UIView {

    // MARK: - Properties
    
    var index: Int = 0
    
    // MARK: - UI Components
    
    private let questionHeaderLabel = UILabel()
    
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
extension ArchivingHeaderView {
    func setUI() {
        
    }
    
    func setHierarchy() {

    }
    
    func setLayout() {

    }
    
    func setAddTarget() {

    }
    
    @objc
    func buttonTapped() {
        
    }
    
    func setRegisterCell() {
        
    }
    
    func setDataBind() {
        
    }
}

