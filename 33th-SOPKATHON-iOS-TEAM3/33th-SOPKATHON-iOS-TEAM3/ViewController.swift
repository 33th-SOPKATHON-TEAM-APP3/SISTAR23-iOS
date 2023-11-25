//
//  ViewController.swift
//  33th-SOPKATHON-iOS-TEAM3
//
//  Created by 민 on 11/25/23.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {

    // MARK: - Properties
    
    // MARK: - UI Components
    
    private let myView = View()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        view = myView
    }
    
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
extension ViewController {
    func setUI() {
        
    }
    
    func setHierarchy() {
        
    }
    
    func setLayout() {
        
    }
    
    func setDelegate() {
        
    }
}

// MARK: - Network

extension ViewController {
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
