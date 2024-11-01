//
//  SecondPracticeCell.swift
//  35th-SOPT-Seminar
//
//  Created by 조혜린 on 11/1/24.
//

import UIKit

import SnapKit

class SecondPracticeCell: UICollectionViewCell {
    
    static let identifier = "SecondPracticeCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStyle() {
        backgroundColor = .yellow
    }
}
