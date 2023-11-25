//
//  UIButton+Extension.swift
//  33th-SOPKATHON-iOS-TEAM3
//
//  Created by 민 on 11/25/23.
//

import UIKit

extension UIButton {
    func setButtonAttributedTitle(text: String, font: UIFont, color: UIColor) {
        let attributedString = NSMutableAttributedString(string: text, attributes: [.font: font, .foregroundColor: color])
        
        self.setAttributedTitle(attributedString, for: .normal)
    }
}
