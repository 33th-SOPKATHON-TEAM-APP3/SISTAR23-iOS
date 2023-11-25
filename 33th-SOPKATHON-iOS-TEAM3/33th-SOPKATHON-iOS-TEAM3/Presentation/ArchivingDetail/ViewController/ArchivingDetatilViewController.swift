//
//  ArchivingDetatilViewController.swift
//  33th-SOPKATHON-iOS-TEAM3
//
//  Created by 민 on 11/25/23.
//

import UIKit

import Then
import SnapKit
import Photos

class ArchivingDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - UI Properties
    
    private let captureButton = UIButton()
    
    private let backButton = UIButton()
    
    private let capturedView = UIView()
    
    private lazy var createdAtLabel: UILabel = { createLabel(forFont: .caption1, forColor: .white, text: "11/25")}()
    private lazy var questionLabel: UILabel = { createLabel(forFont: .subTitle3, forColor: .white, text: "당신의 기분은?")}()
    private let detailImageView = UIImageView()
    
    private let myAnswerCardView = ArchivingDetailAnswerView()
    
    private lazy var dividingLine: UIView = { createEmptyView(forColor: .grey5, forWidth: 344, forHeight: 2)}()
    
    private let othersAnswerCardView = ArchivingDetailAnswerView()
    
    private let randomButton = UIButton()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupStyles()
        setupViews()
        setupConstraints()
        setupProperties()
        setAddTarget()
    }
}

// MARK: - Private Method

private extension ArchivingDetailViewController {
    func setAddTarget() {
        captureButton.addTarget(self, action: #selector(imageButtonTapped), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    @objc
    func imageButtonTapped() {
        saveImage()
    }
    
    @objc
    func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func saveImage() {
        if let image = self.capturedView.layer.makeLayerToImage() {
            UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
        }
    }
    
    @objc func saveCompleted(_ image: UIImage,
                             didFinishSavingWithError error: Error?,
                             contextInfo: UnsafeRawPointer) {
        print("Save finished!")
        let vc = SavedAlertViewController()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overFullScreen
        
        self.present(vc, animated: true)
    }
    
    func setupStyles() {
        view.backgroundColor = .grey7
        self.navigationController?.isNavigationBarHidden = true
        
        myAnswerCardView.titleLabel.text = "나의 답변"
        myAnswerCardView.contentLabel.text = "답변이에요"
        othersAnswerCardView.titleLabel.text = "누군가의 답변입니다"
        othersAnswerCardView.contentLabel.text = "답변이에요"
    }
    
    func setupViews() {
        view.addSubviews(capturedView, captureButton, backButton, dividingLine, othersAnswerCardView, randomButton)
        capturedView.addSubviews(createdAtLabel, questionLabel, detailImageView, myAnswerCardView)
    }
    
    func setupConstraints() {
        backButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            $0.leading.equalToSuperview().inset(14)
            $0.size.equalTo(44)
        }
        
        captureButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(12)
            $0.trailing.equalToSuperview().inset(16)
            $0.size.equalTo(40)
        }
        
        capturedView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalTo(dividingLine.snp.top)
            $0.leading.trailing.equalToSuperview()
        }
        
        createdAtLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(62)
            $0.centerX.equalToSuperview()
        }
        
        questionLabel.snp.makeConstraints {
            $0.top.equalTo(createdAtLabel.snp.bottom).offset(18)
            $0.centerX.equalToSuperview()
        }
        
        detailImageView.snp.makeConstraints {
            $0.top.equalTo(questionLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(82)
        }
        
        myAnswerCardView.snp.makeConstraints {
            $0.top.equalTo(detailImageView.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(19)
        }
        
        dividingLine.snp.makeConstraints {
            $0.centerX.equalToSuperview()
        }
        
        othersAnswerCardView.snp.makeConstraints {
            $0.top.equalTo(dividingLine.snp.bottom).offset(19)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        randomButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-22)
            $0.height.equalTo(50)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
    }
    
    func setupProperties() {
        captureButton.do {
            $0.setImage(UIImage(named: "ic_picture"), for: .normal)
            $0.layer.cornerRadius = 20
            $0.clipsToBounds = true
            $0.layer.backgroundColor = UIColor.white.cgColor
        }
        
        randomButton.setButtonAttributedTitle(text: "다른 사람의 답변 둘러보기", font: .subTitle3, color: .white)
        randomButton.do {
            $0.layer.backgroundColor = UIColor.pink.cgColor
            $0.layer.cornerRadius = 8
            $0.clipsToBounds = true
        }
        
        backButton.do {
            $0.setImage(UIImage(named: "icn_backward"), for: .normal)
        }
        
        detailImageView.do {
            $0.image = UIImage(named: "detail_img")
        }
    }
    
    // MARK: - Create UI Properites Method
    func createCardView() -> UIView {
        let card = UIView()
        card.layer.backgroundColor = UIColor.white.cgColor
        card.makeRounded(radius: 15)
        card.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        return card
    }
    
    func createEmptyView(forColor: UIColor, forWidth: CGFloat, forHeight: CGFloat) -> UIView {
        let view = UIView()
        view.backgroundColor = forColor
        view.snp.makeConstraints {
            $0.width.equalTo(forWidth)
            $0.height.equalTo(forHeight)
        }
        return view
    }
    
    func createStackView(forSpacing: CGFloat) -> UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = forSpacing
        stack.alignment = .center
        return stack
    }
    
    func createLabel(forFont: UIFont, forColor: UIColor, text: String) -> UILabel {
        let label = UILabel()
        label.textAlignment = .center
        label.font = forFont
        label.text = text
        label.textColor = forColor
        return label
    }
}
