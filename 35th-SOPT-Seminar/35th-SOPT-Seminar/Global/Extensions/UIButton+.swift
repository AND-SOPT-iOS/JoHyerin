//
//  UIButton+.swift
//  35th-SOPT-Seminar
//
//  Created by 조혜린 on 10/30/24.
//

import UIKit

extension UIButton {
    
    /// UIButton에 image와 title을 함께 설정하기
    /// - Parameters:
    ///   - title: Title의 Text
    ///   - image: Image
    ///   - imagePadding: title과 Image 사이의 간격
    ///   - imagePlacement: Title을 기준으로 Image가 들어갈 위치 (.leading, .trailing, .top, .bottom)
    func setButtonWithImageAndTitle(title: String, image: UIImage, imagePadding: CGFloat, imagePlacement: NSDirectionalRectEdge) {
        var config = UIButton.Configuration.plain()
        config.title = title
        config.image = image
        config.imagePadding = imagePadding
        config.imagePlacement = imagePlacement

        self.configuration = config
    }
}
