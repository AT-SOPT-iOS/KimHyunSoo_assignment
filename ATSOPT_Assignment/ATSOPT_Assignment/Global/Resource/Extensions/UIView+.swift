//
//  UIView+.swift
//  ATSOPT_Assignment
//
//  Created by MaengKim on 4/16/25.
//

import UIKit

extension UIView {
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
