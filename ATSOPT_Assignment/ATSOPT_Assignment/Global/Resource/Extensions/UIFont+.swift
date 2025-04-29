//
//  UIFont+.swift
//  ATSOPT_Assignment
//
//  Created by MaengKim on 4/16/25.
//

import UIKit

enum FontName: String {
    case pretendardRegular = "Pretendard-Regular"
    case pretendardMedium = "Pretendard-Medium"
    case pretendardBold = "Pretendard-Bold"
}

extension UIFont {
    static func pretendard(_ weight: FontName, size: CGFloat) -> UIFont {
        return UIFont(name: weight.rawValue, size: size) ?? .systemFont(ofSize: size)
    }
}
