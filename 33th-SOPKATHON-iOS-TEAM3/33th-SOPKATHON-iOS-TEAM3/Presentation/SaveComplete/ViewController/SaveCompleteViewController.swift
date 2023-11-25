//
//  SaveCompleteViewController.swift
//  33th-SOPKATHON-iOS-TEAM3
//
//  Created by 민 on 11/25/23.
//

import UIKit

import SnapKit
import Then

final class SaveCompleteViewController: UIViewController {
    
    private let backgroundImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.image = UIImage(named: "illu_back_2")
    }
    
    private let rootView = SaveCompleteView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setHierarchy()
        setLayout()
        setDelegate()
    }
}

private extension SaveCompleteViewController {
    func setUI() {
        view.backgroundColor = .black
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setHierarchy() {
        view.addSubviews(backgroundImageView, rootView)
    }
    
    func setLayout() {
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        rootView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func setDelegate() {
        rootView.saveCompleteButtonDelegate = self
    }
}

extension SaveCompleteViewController: SaveCompleteButtonDelegate {
    func closeButtonClicked() {
        let rootVC = ArchivingViewController()
        self.navigationController?.pushViewController(rootVC, animated: true)
    }
}
