//
//  SaveCompleteView.swift
//  33th-SOPKATHON-iOS-TEAM3
//
//  Created by 민 on 11/25/23.
//

import UIKit

import SnapKit
import Then

final class SaveCompleteView: UIView {
    
    // MARK: - UI Components
    
    public let titleLabel = UILabel().then {
        $0.setupLabel(font: .bigLargeTitle1, text: "저장 완료!", textColor: .white)
    }
    
    public let completeImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(named: "illu_cha_2")
    }
    
    public let dotView = UIView().then {
        $0.backgroundColor = .pink
        $0.layer.cornerRadius = 3
    }
    
    public let descriptionLabel = UILabel().then {
        $0.setupLabel(font: .subTitle2, text: "당연한 것이\n당연하지 않은 것임을 깨달을 때\n우리의 삶은 풍요로워진다", textColor: .white)
        $0.numberOfLines = 0
    }
    
    public let closeButton = UIButton().then {
        $0.setButtonAttributedTitle(text: "나의 답변들 보기", font: .subTitle3, color: .white)
        $0.backgroundColor = .pink
        $0.layer.cornerRadius = 8
    }
    
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
}

private extension SaveCompleteView {
    func setUI() {
        self.backgroundColor = .clear
    }
    
    func setHierarchy() {
        addSubviews(titleLabel,
                    completeImageView,
                    dotView,
                    descriptionLabel,
                    closeButton)
    }
    
    func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(completeImageView.snp.top).offset(-16)
        }
        
        completeImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-52)
            $0.size.equalTo(260)
        }
        
        dotView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(completeImageView.snp.bottom).offset(16)
            $0.size.equalTo(6)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(dotView.snp.bottom).offset(16)
        }
        
        closeButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(22)
            $0.height.equalTo(50)
        }
    }
}
