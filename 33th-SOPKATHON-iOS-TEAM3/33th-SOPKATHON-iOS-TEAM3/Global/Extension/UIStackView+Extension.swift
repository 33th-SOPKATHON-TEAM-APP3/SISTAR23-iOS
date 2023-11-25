//
//  UIStackView+Extension.swift
//  33th-SOPKATHON-iOS-TEAM3
//
//  Created by 민 on 11/25/23.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        for view in views {
            self.addArrangedSubview(view)
        }
    }
}
