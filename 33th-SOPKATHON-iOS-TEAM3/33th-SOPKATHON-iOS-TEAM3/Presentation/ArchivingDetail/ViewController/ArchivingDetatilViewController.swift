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
    
    public var questionId: Int = 0
    
    // MARK: - UI Properties
    
    private let captureButton = UIButton()
    
    private let backButton = UIButton()
    
    private let capturedView = UIView()
    
    private let createdAtLabel = UILabel()
    private let questionLabel = UILabel()
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
        getMyAnswer()
        getRandomAnswer()
    }
}

// MARK: - Private Method

private extension ArchivingDetailViewController {
    func getMyAnswer() {
        AnswerAPI.shared.getMyAnswer(questionId: questionId, userId: UserDefaults.standard.integer(forKey: "USER_ID"), completion: { (response) in
            switch response {
            case .success(let data):
                print("success", data)
                // 데이터 가져온 후
                if let data = data as? MyAnswerModel {
                    self.questionLabel.text = data.questionDto.questionName
                    self.myAnswerCardView.contentLabel.text = data.myAnswer
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
    
    func getRandomAnswer() {
        AnswerAPI.shared.getRandomAnswer(questionId: questionId, userId: UserDefaults.standard.integer(forKey: "USER_ID"), completion: { (response) in
            switch response {
            case .success(let data):
                print("success", data)
                // 데이터 가져온 후
                if let data = data as? RandomAnswerModel {
                    self.othersAnswerCardView.contentLabel.text = data.randomAnswer
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
    
    func setAddTarget() {
        captureButton.addTarget(self, action: #selector(imageButtonTapped), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        randomButton.addTarget(self, action: #selector(randomButtonTapped), for: .touchUpInside)
    }
    
    @objc
    func imageButtonTapped() {
        saveImage()
    }
    
    @objc
    func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    func randomButtonTapped() {
        getRandomAnswer()
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
            $0.top.equalToSuperview().offset(96)
            $0.centerX.equalToSuperview()
        }
        
        questionLabel.snp.makeConstraints {
            $0.top.equalTo(createdAtLabel.snp.bottom).offset(6)
            $0.centerX.equalToSuperview()
        }
        
        detailImageView.snp.makeConstraints {
            $0.top.equalTo(questionLabel.snp.bottom)
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

        myAnswerCardView.do {
            $0.titleLabel.text = "나의 답변"
        }
        
        othersAnswerCardView.do {
            $0.titleLabel.text = "누군가의 답변입니다"
        }
        
        createdAtLabel.setupLabel(font: .caption1, text: "11/26", textColor: .white)
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
}
