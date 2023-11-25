//
//  UICollectionViewRegisterable.swift
//  33th-SOPKATHON-iOS-TEAM3
//
//  Created by 민 on 11/25/23.
//

import UIKit

public protocol UICollectionViewRegisterable where Self: UICollectionViewCell {
    static func register(collectionView: UICollectionView)
    
    static func dequeueReusableCell(collectionView: UICollectionView, indexPath: IndexPath) -> Self
    static var reuseIdentifier: String { get }
}

extension UICollectionViewRegisterable {
    public static func register(collectionView: UICollectionView) {
        /**
         이런 형태로 사용합니다!
         MenuCollectionViewCell.register(collectionView: homeCollectionView)
         */
        collectionView.register(self, forCellWithReuseIdentifier: self.reuseIdentifier)
    }
    
    public static func dequeueReusableCell(collectionView: UICollectionView, indexPath: IndexPath) -> Self {
        /**
         이런 형태로 사용합니다!
         let cell = MenuCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
         */
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.reuseIdentifier, for: indexPath) as? Self else { fatalError()}
        return cell
    }
    
    public static var reuseIdentifier: String {
        return String(describing: self)
    }
}
