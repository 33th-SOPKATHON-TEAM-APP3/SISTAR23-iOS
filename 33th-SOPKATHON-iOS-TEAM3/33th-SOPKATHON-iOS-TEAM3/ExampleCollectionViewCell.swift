//
//  ExampleCollectionViewCell.swift
//  33th-SOPKATHON-iOS-TEAM3
//
//  Created by 민 on 11/25/23.
//

import UIKit
import SnapKit

final class ExampleCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    // MARK: - Properties
    
    // MARK: - UI Components
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        setUI()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // UITableViewCell인 경우
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//
//        setUI()
//        setHierarchy()
//        setLayout()
//    }
//    @available(*, unavailable)
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
}

// MARK: - Extensions
extension ExampleCollectionViewCell {
    func setUI() {
        
    }
    
    func setHierarchy() {
        
    }
    
    func setLayout() {
        
    }
}

