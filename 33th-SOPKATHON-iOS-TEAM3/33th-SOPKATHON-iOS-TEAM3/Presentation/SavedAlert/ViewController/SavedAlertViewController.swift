//
//  SavedAlertViewController.swift
//  33th-SOPKATHON-iOS-TEAM3
//
//  Created by 윤영서 on 11/26/23.
//

import UIKit

import SnapKit
import Then

final class SavedAlertViewController: UIViewController {
    
    private let alertView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 15
    }
    
    private let alertLabel = UILabel().then {
        $0.setupLabel(font: .subTitle3, text: "사진이 저장되었습니다.", textColor: .black)
    }
    
    public let okButton = UIButton().then {
        $0.setButtonAttributedTitle(text: "확인", font: .subTitle3, color: .white)
        $0.backgroundColor = .pink
        $0.layer.cornerRadius = 5
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setHierarchy()
        setLayout()
        setAddTarget()
    }
}

private extension SavedAlertViewController {
    func setUI() {
        view.backgroundColor = .black.withAlphaComponent(0.4)
    }
    
    func setHierarchy() {
        view.addSubview(alertView)
        alertView.addSubviews(alertLabel,
                              okButton)
    }
    
    func setLayout() {
        alertView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(36)
        }
        
        alertLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.centerX.equalToSuperview()
        }
        
        okButton.snp.makeConstraints {
            $0.top.equalTo(alertLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(82)
            $0.height.equalTo(38)
            $0.bottom.equalToSuperview().inset(20)
        }
    }
    
    func setAddTarget() {
        okButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc
    func buttonTapped() {
        self.dismiss(animated: false)
    }
}

