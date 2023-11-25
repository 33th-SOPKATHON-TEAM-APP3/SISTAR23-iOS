//
//  ArchivingView.swift
//  33th-SOPKATHON-iOS-TEAM3
//
//  Created by 민 on 11/25/23.
//

import UIKit
import SnapKit
import Then

final class ArchivingView: UIView {

    // MARK: - Properties
    
    var index: Int = 0
    
    // MARK: - UI Components
    
    private let characterImage = UIImageView()
    
    private let questionTableView = UITableView(frame: .zero, style: .plain).then {
        $0.isScrollEnabled = false
        $0.backgroundColor = .grey7
    }
    
    private let archivingHeaderView = ArchivingHeaderView()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
        setAddTarget()
        setDelegate()
        setRegisterCell()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions
extension ArchivingView {
    func setUI() {
        
    }
    
    func setHierarchy() {
        self.addSubviews(characterImage, questionTableView)
    }
    
    func setLayout() {
        characterImage.snp.makeConstraints {
            $0.size.equalTo(122)
            $0.top.equalToSuperview().inset(72)
            $0.trailing.equalToSuperview().inset(46)
        }
        
        questionTableView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(96)
            $0.leading.trailing.equalTo(16)
            $0.bottom.equalToSuperview().inset(74)
        }
    }
    
    func setAddTarget() {

    }
    
    func setDelegate() {
        questionTableView.dataSource = self
        questionTableView.delegate = self
    }
    
    func setRegisterCell() {
        ArchivingTableViewCell.register(tableView: questionTableView)
        questionTableView.tableHeaderView = archivingHeaderView
    }
    
    func setDataBind() {
        
    }
}

// MARK: - TableView Delegate
extension ArchivingView: UITableViewDelegate { 
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 82
    }
    
}

// MARK: - TableView DataSource
extension ArchivingView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ArchivingHeaderView")
        return headerView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 5
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ArchivingTableViewCell.dequeueReusableCell(tableView: questionTableView)
        cell.selectionStyle = .none
        return cell
    }
}

