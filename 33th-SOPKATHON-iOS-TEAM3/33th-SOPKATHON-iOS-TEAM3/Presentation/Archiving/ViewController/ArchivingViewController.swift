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
    
    // MARK: - UI Components
    
    private let archivingView = ArchivingView()
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getAPI()
        setUI()
        setHierarchy()
        setLayout()
        setDelegate()
    }
}

// MARK: - Extensions
extension ArchivingViewController {
    func setUI() {
        
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
        
    }
}

// MARK: - Network

extension ArchivingViewController {
    func getAPI() {
        
    }
}

//extension ViewController: UICollectionViewDelegate {
//
//}
//
//extension ViewController: UICollectionViewDataSource {
//
//}
//
//extension ViewController: UICollectionViewFlowLayout {
//
//}

