//
//  UIStackView+.swift
//  ATSOPT_Assignment
//
//  Created by MaengKim on 4/17/25.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { self.addArrangedSubview($0) }
    }
}
