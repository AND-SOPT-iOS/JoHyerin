//
//  UIView+.swift
//  35th-SOPT-Seminar
//
//  Created by 조혜린 on 10/12/24.
//

import UIKit

extension UIView {
    
    /// subview들을 한꺼번에 추가
    /// - Parameter views: 추가할 subview들
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
