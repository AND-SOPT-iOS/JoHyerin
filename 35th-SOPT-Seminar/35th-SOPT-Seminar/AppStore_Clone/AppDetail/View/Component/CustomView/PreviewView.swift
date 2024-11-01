//
//  PreviewView.swift
//  35th-SOPT-Seminar
//
//  Created by 조혜린 on 10/29/24.
//

import UIKit

import SnapKit
import Then

final class PreviewView: UIView {

    //MARK: - UI Properties
    
    private let previewLabel = UILabel()
    private let previewImageView = UIImageView()
    private let iPhoneIconView = UIImageView()
    private let iPhoneLabel = UILabel()
        
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStyle()
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PreviewView {
    
    // MARK: - Layout
    
    private func setupStyle() {
        backgroundColor = .systemBackground
        
        previewLabel.do {
            $0.text = "미리 보기"
            $0.textColor = .label
            $0.font = .systemFont(ofSize: 20, weight: .bold)
        }
        
        previewImageView.do {
            $0.roundCorners(cornerRadius: 20)
            $0.image = UIImage(resource: .imgPreview1)
            $0.makeBorder(width: 0.5, color: .lightGray)
        }
        
        iPhoneIconView.do {
            $0.image = UIImage(systemName: "iphone")
            $0.tintColor = .systemGray4
        }
        
        iPhoneLabel.do {
            $0.text = "iPhone"
            $0.textColor = .systemGray4
            $0.font = .systemFont(ofSize: 12, weight: .semibold)
        }
    }
    
    private func setupHierarchy() {
        addSubviews(
            previewLabel,
            previewImageView,
            iPhoneIconView,
            iPhoneLabel
        )
    }
    
    private func setupLayout() {
        previewLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        
        previewImageView.snp.makeConstraints {
            $0.top.equalTo(previewLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview()
            $0.width.equalTo(250)
            $0.height.equalTo(530)
        }
        
        iPhoneIconView.snp.makeConstraints {
            $0.top.equalTo(previewImageView.snp.bottom).offset(10)
            $0.leading.equalToSuperview()
        }
        
        iPhoneLabel.snp.makeConstraints {
            $0.leading.equalTo(iPhoneIconView.snp.trailing).offset(12)
            $0.top.equalTo(previewImageView.snp.bottom).offset(14)
            $0.bottom.equalToSuperview().inset(20)
        }
    }
}
