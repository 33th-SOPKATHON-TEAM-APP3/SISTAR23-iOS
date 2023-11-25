//
//  ArchivingDetatilViewController.swift
//  33th-SOPKATHON-iOS-TEAM3
//
//  Created by 민 on 11/25/23.
//

import UIKit

import Then
import SnapKit

class ArchivingDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    
    // MARK: - UI Properties
    private let captureBtn = UIButton()
    
    private let capturedView = UIView()
    
    private let createdAtLabel = UILabel()
    private let questioinLabel = UILabel()
    private let image = UIImageView()
    
    private lazy var myAnswerCardView: UIView = { createCardView() }()
    private lazy var myAnswerStackView: UIStackView = { createStackView(forSpacing: 14)}()
    private lazy var myTitleStackView: UIStackView = { createStackView(forSpacing: 5)}()
    private lazy var pinkHorzLine1: UIView = { createEmptyView(forColor: .pink, forWidth: 82, forHeight: 1)}()
    private let myTitleLabel = UILabel()
    private let myAnswerContent = UILabel()
    
    private lazy var dividingLine: UIView = { createEmptyView(forColor: .grey5, forWidth: 344, forHeight: 2)}()
    
    private lazy var othersAnswerCardView: UIView = { createCardView() }()
    private lazy var othersAnswerStackView: UIStackView = { createStackView(forSpacing: 14)}()
    private lazy var othersTitleStackView: UIStackView = { createStackView(forSpacing: 5)}()
    private lazy var pinkHorizLine2: UIView = { createEmptyView(forColor: .pink, forWidth: 169, forHeight: 1)}()
    private let othersTitleLabel = UILabel()
    private let othersAnswerContent = UILabel()
    
    private let randomBtn = UIButton()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupStyles()
        setupViews()
        setupConstraints()
        setupProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private Method

private extension ArchivingDetailViewController {
    
    func setupStyles() {
        view.backgroundColor = .grey7
    }
    
    func setupViews() {
        view.addSubviews(captureBtn,
                         createdAtLabel,
                         questioinLabel,
                         image,
                         myAnswerCardView,
                         dividingLine,
                         othersAnswerCardView,
                         randomBtn)
        
        myAnswerCardView.addSubview(myAnswerStackView)
        myAnswerStackView.addArrangedSubviews(myTitleStackView, myAnswerContent)
        myTitleStackView.addArrangedSubviews(myTitleLabel, pinkHorzLine1)
        
        othersAnswerCardView.addSubview(othersAnswerStackView)
        othersAnswerStackView.addArrangedSubviews(othersTitleStackView, othersAnswerContent)
        othersTitleStackView.addArrangedSubviews(othersTitleLabel, pinkHorizLine2)
    }
    
    func setupConstraints() {
        captureBtn.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(56)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(40)
        }
        
        createdAtLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(62)
            $0.centerX.equalToSuperview()
        }
        
    }
    
    func setupProperties() {
        captureBtn.do {
            $0.setImage(UIImage(named: "ic_picture"), for: .normal)
            $0.layer.cornerRadius = 20
            $0.clipsToBounds = true
            $0.layer.backgroundColor = UIColor.white.cgColor
        }
        
//        randomBtn.setButtonAttributedTitle(text: "다른 사람의 답변 둘러보기", font: <#T##UIFont#>, color: <#T##UIColor#>)
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
}
