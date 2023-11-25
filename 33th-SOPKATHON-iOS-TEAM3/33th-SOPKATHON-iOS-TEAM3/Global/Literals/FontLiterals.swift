//
//  FontLiterals.swift
//  33th-SOPKATHON-iOS-TEAM3
//
//  Created by 민 on 11/25/23.
//

import UIKit

enum FontName: String {
    case pretendardBold = "Pretendard-Bold"
    case pretendardMedium = "Pretendard-Medium"
    case pretendardRegular = "Pretendard-Regular"
}

extension UIFont {
    
    // MARK: - BigLargeTitle

    class var bigLargeTitle1: UIFont {
        return UIFont.font(.pretendardBold, ofSize: 30)
    }
    
    // MARK: - LargeTitle
    
    class var largeTitle1: UIFont {
        return UIFont.font(.pretendardRegular, ofSize: 24)
    }
    
    class var largeTitle2: UIFont {
        return UIFont.font(.pretendardMedium, ofSize: 24)
    }
    
    class var largeTitle3: UIFont {
        return UIFont.font(.pretendardBold, ofSize: 24)
    }
    
    // MARK: - Title

    class var title1: UIFont {
        return UIFont.font(.pretendardRegular, ofSize: 20)
    }
    
    class var title2: UIFont {
        return UIFont.font(.pretendardMedium, ofSize: 20)
    }
    
    class var title3: UIFont {
        return UIFont.font(.pretendardBold, ofSize: 20)
    }
    
    // MARK: - SubTitle

    class var subTitle1: UIFont {
        return UIFont.font(.pretendardRegular, ofSize: 16)
    }
    
    class var subTitle2: UIFont {
        return UIFont.font(.pretendardMedium, ofSize: 16)
    }
    
    class var subTitle3: UIFont {
        return UIFont.font(.pretendardBold, ofSize: 16)
    }
    
    // MARK: - Body

    class var body1: UIFont {
        return UIFont.font(.pretendardRegular, ofSize: 14)
    }
    
    class var body2: UIFont {
        return UIFont.font(.pretendardMedium, ofSize: 14)
    }
    
    class var body3: UIFont {
        return UIFont.font(.pretendardBold, ofSize: 14)
    }
    
    // MARK: - Caption

    class var caption1: UIFont {
        return UIFont.font(.pretendardRegular, ofSize: 12)
    }
    
    class var caption2: UIFont {
        return UIFont.font(.pretendardMedium, ofSize: 12)
    }
    
    class var caption3: UIFont {
        return UIFont.font(.pretendardBold, ofSize: 12)
    }
}

extension UIFont {
    static func font(_ style: FontName, ofSize size: CGFloat) -> UIFont {
        return UIFont(name: style.rawValue, size: size)!
    }
}
