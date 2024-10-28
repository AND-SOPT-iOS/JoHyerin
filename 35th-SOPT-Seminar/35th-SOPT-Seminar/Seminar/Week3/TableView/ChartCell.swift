//
//  ChartCell.swift
//  35th-SOPT-Seminar
//
//  Created by 조혜린 on 10/26/24.
//

import UIKit

import SnapKit
import Then

final class ChartCell: UITableViewCell {
    static let identifier: String = "ChartCell"
    
    private let iconImageView = UIImageView()
    private let rankingLabel = UILabel()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let verticalStackView = UIStackView()
    private let downloadButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupStyle()
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ChartCell {
    private func setupStyle() {
        titleLabel.do {
            $0.numberOfLines = 2
        }
        
        verticalStackView.do {
            $0.axis = .vertical
            $0.alignment = .top
            $0.distribution = .equalSpacing
            $0.spacing = 4
        }
    }
    
    private func setupHierarchy() {
        addSubviews(
            iconImageView,
            rankingLabel,
            verticalStackView,
            downloadButton
        )
        verticalStackView.addArrangedSubviews(titleLabel, subtitleLabel)
    }
    
    private func setupLayout() {
        iconImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.size.equalTo(80)
        }
        
        rankingLabel.snp.makeConstraints {
            $0.leading.equalTo(iconImageView.snp.trailing).offset(8)
            $0.top.equalToSuperview().offset(12)
        }
        
        verticalStackView.snp.makeConstraints {
            $0.leading.equalTo(rankingLabel.snp.trailing).offset(8)
            $0.trailing.equalTo(downloadButton.snp.leading).offset(-20)
            $0.top.equalToSuperview().inset(12)
            $0.bottom.greaterThanOrEqualToSuperview().inset(12)
        }
        
        downloadButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-20)
            $0.width.equalTo(44)
            $0.height.equalTo(20)
        }
    }
}

extension ChartCell {
    func configureCell(data: App) {
        iconImageView.image = data.iconImage
        rankingLabel.text = "\(data.ranking)"
        titleLabel.text = data.title
        subtitleLabel.text = data.subtitle
    }
}
