//
//  SaveCompleteViewController.swift
//  33th-SOPKATHON-iOS-TEAM3
//
//  Created by 민 on 11/25/23.
//

import UIKit

import SnapKit

final class SaveCompleteViewController: UIViewController {
        
    private let rootView = SaveCompleteView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setHierarchy()
        setLayout()
    }
}

private extension SaveCompleteViewController {
    func setUI() {
        view.backgroundColor = .black
    }
    
    func setHierarchy() {
        view.addSubview(rootView)
    }
    
    func setLayout() {
        rootView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
