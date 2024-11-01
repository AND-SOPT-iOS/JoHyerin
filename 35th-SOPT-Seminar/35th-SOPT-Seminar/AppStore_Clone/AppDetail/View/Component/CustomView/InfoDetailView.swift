//
//  InfoDetailView.swift
//  35th-SOPT-Seminar
//
//  Created by 조혜린 on 10/29/24.
//

import UIKit

import SnapKit
import Then

final class InfoDetailView: UIView {

    //MARK: - UI Properties
    
    private let titleLabel = UILabel()
    private let mainImageView = UIImageView()
    private let subLabel = UILabel()
        
    // MARK: - Life Cycle
    
    init(titleString: String, imageString: String, subString: String) {
        super.init(frame: .zero)
        
        setupStyle(titleText: titleString, imageNameText: imageString, subText: subString)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension InfoDetailView {
    
    // MARK: - Layout
    
    private func setupStyle(titleText: String, imageNameText: String, subText: String) {
        backgroundColor = .systemBackground
        
        titleLabel.do {
            $0.text = titleText
            $0.textColor = .label
            $0.textAlignment = .center
            $0.font = .systemFont(ofSize: 10)
        }
        
        mainImageView.do {
            $0.image = UIImage(systemName: imageNameText, withConfiguration: UIImage.SymbolConfiguration(weight: .bold))
            $0.tintColor = .systemGray
        }
        
        subLabel.do {
            $0.text = subText
            $0.textColor = .systemGray4
            $0.textAlignment = .center
            $0.font = .systemFont(ofSize: 10)
        }
    }
    
    private func setupHierarchy() {
        addSubviews(titleLabel, mainImageView, subLabel)
    }
    
    private func setupLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            
        }
        
        mainImageView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(3)
            $0.centerX.equalToSuperview()
        }
        
        subLabel.snp.makeConstraints {
            $0.top.equalTo(mainImageView.snp.bottom).offset(3)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}
