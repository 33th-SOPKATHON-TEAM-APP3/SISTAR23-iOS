//
//  UITableViewRegisterable.swift
//  33th-SOPKATHON-iOS-TEAM3
//
//  Created by 민 on 11/25/23.
//

import UIKit

public protocol UITableViewRegisterable where Self: UITableViewCell {
    static func register(tableView: UITableView)
    static func dequeueReusableCell(tableView: UITableView) -> Self
    static var reuseIdentifier: String { get }
}

extension UITableViewRegisterable {
    public static func register(tableView: UITableView) {
        /**
         이런 형태로 사용합니다!
         MenuCollectionViewCell.register(collectionView: homeCollectionView)
         */
        tableView.register(Self.self, forCellReuseIdentifier: self.reuseIdentifier)
    }
    
    public static func dequeueReusableCell(tableView: UITableView) -> Self {
        /**
         이런 형태로 사용합니다!
         let cell = MenuCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
         */
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.reuseIdentifier) as? Self else { fatalError("Error! \(self.reuseIdentifier)") }
        return cell
    }
    
    public static var reuseIdentifier: String {
        return String(describing: self)
    }
}
