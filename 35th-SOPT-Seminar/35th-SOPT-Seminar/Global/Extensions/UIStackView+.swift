//
//  UIStackView+.swift
//  35th-SOPT-Seminar
//
//  Created by 조혜린 on 10/26/24.
//

import UIKit

extension UIStackView {
    
    /// arrangedSubviews를 한번에!~
    /// - Parameter views: 추가할 arrangedSubview들
    func addArrangedSubviews(_ views: UIView...) {
        for view in views {
            self.addArrangedSubview(view)
        }
    }
}
