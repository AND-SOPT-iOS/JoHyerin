//
//  UILabel+.swift
//  35th-SOPT-Seminar
//
//  Created by 조혜린 on 10/29/24.
//

import UIKit

extension UILabel {
    
    /// UILabel의 행간을 설정하는 함수
    /// - Parameter percentage: 기존 행간 대비 변경할 퍼센티지
    func setLineHeight(percentage: CGFloat) {
        guard let text = text else { return }
        
        let attributeString = NSMutableAttributedString(string: text)
        let style = NSMutableParagraphStyle()
        let lineSpacing = font.ascender * ((percentage-100)/100) + font.descender
        style.lineSpacing = lineSpacing
        style.alignment = textAlignment
        style.lineBreakMode = lineBreakMode
        style.lineBreakStrategy = lineBreakStrategy
        attributeString.addAttribute(.paragraphStyle,
                                     value: style,
                                     range: NSRange(location: 0, length: attributeString.length))
        attributedText = attributeString
    }
}
