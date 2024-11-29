//
//  BannerCell.swift
//  35th-SOPT-Seminar
//
//  Created by 조혜린 on 11/2/24.
//

import UIKit

import SnapKit

final class BannerCell: UICollectionViewCell {
    
    //MARK: - UI Properties
    
    private let appTypeLabel = UILabel()
    private let appTitleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let headerLabelStackView = UIStackView()
    private let bannerImageView = UIImageView()
    private let appIconImageView = UIImageView()
    private let appTitleLabelInBannerImage = UILabel()
    private let descriptionLabelInBannerImage = UILabel()
    private let labelStackViewInBannerImage = UIStackView()
    private let installButton = UIButton()
    private let payTypeLabel = UILabel()
    
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

extension BannerCell {
    
    //MARK: - Layout
    
    private func setupStyle() {
        appTypeLabel.do {
            $0.text = "앱 타입"
            $0.font = .systemFont(ofSize: 12, weight: .semibold)
            $0.textColor = .systemBlue
            $0.textAlignment = .left
        }
        
        appTitleLabel.do {
            $0.text = "앱 이름"
            $0.font = .systemFont(ofSize: 15)
            $0.textColor = .label
            $0.textAlignment = .left
        }
        
        descriptionLabel.do {
            $0.text = "앱 설명"
            $0.font = .systemFont(ofSize: 14)
            $0.textColor = .systemGray4
            $0.textAlignment = .left
        }
        
        headerLabelStackView.do {
            $0.axis = .vertical
            $0.spacing = 5
            $0.addArrangedSubviews(appTypeLabel, appTitleLabel, descriptionLabel)
            $0.alignment = .leading
        }
        
        bannerImageView.do {
            $0.backgroundColor = .blue
            $0.roundCorners(cornerRadius: 5)
        }
        
        appIconImageView.do {
            $0.backgroundColor = .red
            $0.roundCorners(cornerRadius: 5)
        }
        
        appTitleLabelInBannerImage.do {
            $0.text = "앱 이름"
            $0.font = .systemFont(ofSize: 12, weight: .bold)
            $0.textColor = .white
            $0.textAlignment = .left
        }
        
        descriptionLabelInBannerImage.do {
            $0.text = "앱 설명"
            $0.font = .systemFont(ofSize: 20)
            $0.textColor = .lightGray
            $0.textAlignment = .left
        }
        
        labelStackViewInBannerImage.do {
            $0.axis = .vertical
            $0.spacing = 3
            $0.addArrangedSubviews(appTitleLabelInBannerImage, descriptionLabelInBannerImage)
            $0.alignment = .leading
        }
    }
    
    private func setupHierarchy() {
        addSubviews(headerLabelStackView, bannerImageView)
        bannerImageView.addSubviews(appIconImageView, labelStackViewInBannerImage)
    }
    
    private func setupLayout() {
        headerLabelStackView.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        
        bannerImageView.snp.makeConstraints {
            $0.top.equalTo(headerLabelStackView.snp.bottom).offset(8)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        appIconImageView.snp.makeConstraints {
            $0.leading.bottom.equalToSuperview().inset(15)
            $0.height.width.equalTo(40)
        }
        
        labelStackViewInBannerImage.snp.makeConstraints {
            $0.centerY.equalTo(appIconImageView.snp.centerY)
            $0.leading.equalTo(appIconImageView.snp.trailing).offset(8)
        }
    }
    
    //MARK: - Func
    
    func configureCell() {
        
    }
}
