//
//  UIFont+.swift
//  ATSOPT_Assignment
//
//  Created by MaengKim on 4/16/25.
//

import UIKit

extension UIFont {
    static func pretendard(size fontSize: CGFloat, weight: UIFont.Weight) -> UIFont {
            let familyName = "Pretendard"

            var weightString: String
            switch weight {
            case .bold:
                weightString = "Blod"
            case .medium:
                weightString = "Medium"
            case .regular:
                weightString = "Regular"
            default:
                weightString = "Regular"
            }

            return UIFont(name: "\(familyName)-\(weightString)", size: fontSize) ?? .systemFont(ofSize: fontSize, weight: weight)
        }
}
