//
//  AppHeaderView.swift
//  35th-SOPT-Seminar
//
//  Created by 조혜린 on 12/3/24.
//

import UIKit

import SnapKit
import Then

final class AppHeaderView: UICollectionReusableView {
    
    //MARK: - UI Properties
    
    private let headerButton = UIButton()
    private let descriptionLabel = UILabel()
    private let buttonStackView = UIStackView()
    
    //MARK: - Life Cycle
    
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

extension AppHeaderView {
    
    //MARK: - Layout
    
    private func setupStyle() {
        headerButton.do {
            var configuration = UIButton.Configuration.plain()
            configuration.attributedTitle = AttributedString("필수 금융 앱", attributes: AttributeContainer([.font: UIFont.systemFont(ofSize: 17, weight: .bold), .foregroundColor: UIColor.label]))
            configuration.image = UIImage(systemName: "chevron.right", withConfiguration: UIImage.SymbolConfiguration(pointSize: 11, weight: .heavy))?.withTintColor(.systemGray2, renderingMode: .alwaysOriginal)
            configuration.imagePlacement = .trailing
            configuration.imagePadding = 5
            configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
            configuration.baseBackgroundColor = .clear
            
            $0.configuration = configuration
        }
        
        descriptionLabel.do {
            $0.text = "App Store 에디터가 직접 골랐습니다"
            $0.font = .systemFont(ofSize: 13)
            $0.textColor = .systemGray3
        }
        
        buttonStackView.do {
            $0.axis = .vertical
            $0.alignment = .leading
        }
    }
    
    private func setupHierarchy() {
        addSubview(buttonStackView)
        buttonStackView.addArrangedSubviews(headerButton, descriptionLabel)
    }
    
    private func setupLayout() {
        buttonStackView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(5)
            $0.centerY.equalToSuperview()
        }
    }
}

