//
//  ColorLiterals.swift
//  33th-SOPKATHON-iOS-TEAM3
//
//  Created by 민 on 11/25/23.
//

import UIKit

extension UIColor {
    
    static var white: UIColor {
        return UIColor(hex: "#FFFFFF")
    }
    
    static var grey1: UIColor {
        return UIColor(hex: "#F0F0F0")
    }
    
    static var grey2: UIColor {
        return UIColor(hex: "#D9D8DA")
    }
    
    static var grey3: UIColor {
        return UIColor(hex: "#B8B5B9")
    }
    
    static var grey4: UIColor {
        return UIColor(hex: "#9A969C")
    }
    
    static var grey5: UIColor {
        return UIColor(hex: "#767179")
    }
    
    static var grey6: UIColor {
        return UIColor(hex: "#5E5A60")
    }
    
    static var grey7: UIColor {
        return UIColor(hex: "#38363A")
    }
    
    static var black: UIColor {
        return UIColor(hex: "#100F11")
    }
    
    static var pink: UIColor {
        return UIColor(hex: "#FF41CA")
    }
    
    static var pinkPale: UIColor {
        return UIColor(hex: "#FF78D9")
    }
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()

        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }

        assert(hexFormatted.count == 6, "Invalid hex code used.")
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)

        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0, alpha: alpha)
    }
}
