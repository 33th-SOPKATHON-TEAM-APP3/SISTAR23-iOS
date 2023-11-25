//
//  UILabel+Extension.swift
//  33th-SOPKATHON-iOS-TEAM3
//
//  Created by 민 on 11/25/23.
//

import UIKit

extension UILabel {
    /// 특정 부분만 폰트, 색상 적용
    func partFontChange(targetString: String, font: UIFont, textColor: UIColor) {
        let fullText = self.text ?? ""
        let range = (fullText as NSString).range(of: targetString)
        let attributedString = NSMutableAttributedString(string: fullText)
        attributedString.addAttribute(.font, value: font, range: range)
        attributedString.addAttribute(.foregroundColor, value: textColor, range: range)
        self.attributedText = attributedString
    }
    
    /// 특정 부분 색상 적용
    func partColorChange(targetString: String, textColor: UIColor) {
        guard let existingText = self.text else {
            return
        }
        let existingAttributes = self.attributedText?.attributes(at: 0, effectiveRange: nil) ?? [:]
        let attributedStr = NSMutableAttributedString(string: existingText, attributes: existingAttributes)
        let range = (existingText as NSString).range(of: targetString)
        attributedStr.addAttribute(NSAttributedString.Key.foregroundColor, value: textColor, range: range)
        self.attributedText = attributedStr
    }
    
    /// 특정 text에 underline을 추가하는 함수
    /// > 사용 예시 : label.underLineText(forText: ["맛집을 추천"])
    func underLineText(forText: [String]) {
        guard let labelText = self.text else { return }
        
        let underLineText = NSMutableAttributedString(string: labelText)
        
        for text in forText {
            let range = (labelText as NSString).range(of: text)
            underLineText.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: range)
        }
        
        self.attributedText = underLineText
    }
    
    /// UILabel에 Image를 같이 사용하고 싶을 때 사용하는 함수
    func labelWithImg(composition: NSAttributedString...) {
        let attributedString = NSMutableAttributedString()
        for i in composition {
            attributedString.append(i)
            attributedString.append(NSAttributedString(string: " "))
        }
        self.attributedText = attributedString
    }
    
    /// UILabel 기본 세팅  => 폰트, 텍스트, 텍스트색상, 정렬방법(옵션)
    func setupLabel(font: UIFont, text: String, textColor: UIColor, alignment: NSTextAlignment? = nil) {
        self.font = font
        self.text = text
        self.textColor = textColor
        self.textAlignment = alignment ?? .center
    }
    
}
