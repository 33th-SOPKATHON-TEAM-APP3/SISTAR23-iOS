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
    
    let uuid = UIDevice.current.identifierForVendor?.uuidString
    
    // MARK: - UI Components
    
    private let backgroundImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.image = UIImage(named: "illu_back_1")
    }
    
    private let myView = View()
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setHierarchy()
        setLayout()
        setDelegate()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.signup()
        }
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
    func signup() {
        UserAPI.shared.signup(deviceId: uuid!, completion: { (response) in
            switch response {
            case .success(let data):
                print("success", data)
                // 데이터 가져온 후
                if let data = data as? UserModel {
                    UserDefaults.standard.setValue(data.userId, forKey: "USER_ID")
                    if data.isAnswered {
                        self.navigationController?.pushViewController(ArchivingViewController(), animated: true)
                    } else {
                        self.navigationController?.pushViewController(QuestionViewController(), animated: true)
                    }
                }
            case .requestErr(let statusCode):
                print("requestErr", statusCode)
            case .pathErr:
                print(".pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        })
    }
}
