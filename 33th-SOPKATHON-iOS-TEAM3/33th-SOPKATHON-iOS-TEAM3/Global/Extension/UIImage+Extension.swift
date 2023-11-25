//
//  UIImage+Extension.swift
//  33th-SOPKATHON-iOS-TEAM3
//
//  Created by 민 on 11/26/23.
//

import UIKit

extension UIImage {
    static func load(name: String) -> UIImage {
        guard let image = UIImage(named: name, in: nil, compatibleWith: nil) else {
            return UIImage()
        }
        image.accessibilityIdentifier = name
        return image
    }
}
