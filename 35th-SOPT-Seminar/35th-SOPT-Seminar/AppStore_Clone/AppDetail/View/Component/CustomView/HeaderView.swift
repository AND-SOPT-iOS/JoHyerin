//
//  HeaderView.swift
//  35th-SOPT-Seminar
//
//  Created by 조혜린 on 10/29/24.
//

import UIKit

import SnapKit
import Then

final class HeaderView: UIView {

    //MARK: - UI Properties
    
    private let appIconImageView = UIImageView()
    private let appLabelStackView = UIStackView()
    private let appNameLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let downloadButton = UIButton()
    private let shareButton = UIButton()
    private let appButtonStackView = UIStackView()
        
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

extension HeaderView {
    
    // MARK: - Layout
    
    private func setupStyle() {
        backgroundColor = .white
        
        appIconImageView.do {
            $0.image = .iconToss
            $0.roundCorners(cornerRadius: 20)
            $0.makeBorder(width: 0.5, color: .lightGray)
        }
        
        appLabelStackView.do {
            $0.axis = .vertical
            $0.spacing = 2
            $0.alignment = .leading
            $0.addArrangedSubviews(appNameLabel, descriptionLabel)
        }
        
        appNameLabel.do {
            $0.text = "토스"
            $0.textColor = .black
            $0.font = .systemFont(ofSize: 20, weight: .semibold)
        }
        
        descriptionLabel.do {
            $0.text = "금융이 쉬워진다"
            $0.textColor = .lightGray
            $0.font = .systemFont(ofSize: 12)
        }
        
        appButtonStackView.do {
            $0.axis = .horizontal
            $0.distribution = .equalSpacing
            $0.addArrangedSubviews(downloadButton, shareButton)
        }
        
        downloadButton.do {
            $0.setTitle("열기", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 13, weight: .heavy)
            $0.backgroundColor = .systemBlue
            $0.roundCorners(cornerRadius: 14)
        }
        
        shareButton.do {
            $0.setImage(UIImage(systemName: "square.and.arrow.up", withConfiguration: UIImage.SymbolConfiguration(pointSize: 15)), for: .normal)
            $0.tintColor = .systemBlue
        }
    }
    
    private func setupHierarchy() {
        addSubviews(
            appIconImageView,
            appLabelStackView,
            appButtonStackView
        )
    }
    
    private func setupLayout() {
        
        appIconImageView.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.width.height.equalTo(120)
            $0.bottom.equalToSuperview().inset(15)
        }
        
        appLabelStackView.snp.makeConstraints {
            $0.top.equalTo(appIconImageView.snp.top)
            $0.leading.equalTo(appIconImageView.snp.trailing).offset(20)
        }
        
        downloadButton.snp.makeConstraints {
            $0.width.equalTo(65)
        }
        
        appButtonStackView.snp.makeConstraints {
            $0.bottom.equalTo(appIconImageView.snp.bottom)
            $0.leading.equalTo(appLabelStackView.snp.leading)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(30)
        }
    }
}
