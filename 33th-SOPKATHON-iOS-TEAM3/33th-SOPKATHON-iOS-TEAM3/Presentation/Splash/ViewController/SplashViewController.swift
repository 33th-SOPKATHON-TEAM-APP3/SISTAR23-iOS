//
//  SplashViewController.swift
//  33th-SOPKATHON-iOS-TEAM3
//
//  Created by 민 on 11/25/23.
//

import UIKit

import SnapKit
import Then

final class SplashViewController: UIViewController {

    // MARK: - Properties
    
    // MARK: - UI Components
    
    private let backgroundImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.image = UIImage(named: "illu_back_1")
    }
    
    private let myView = View()
    
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
extension SplashViewController {
    func setUI() {

    }
    
    func setHierarchy() {
        view.addSubview(backgroundImageView)
    }
    
    func setLayout() {
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func setDelegate() {
        
    }
}

// MARK: - Network

extension SplashViewController {
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
