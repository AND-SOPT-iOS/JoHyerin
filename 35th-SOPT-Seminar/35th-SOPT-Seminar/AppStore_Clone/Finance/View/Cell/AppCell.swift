//
//  AppCell.swift
//  35th-SOPT-Seminar
//
//  Created by 조혜린 on 12/2/24.
//

import UIKit

import RxSwift
import RxCocoa
import SnapKit
import Then

final class AppCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    let downloadButtonTapped = PublishSubject<UUID>()
    let disposeBag = DisposeBag()
    var itemID: UUID?
   
    //MARK: - UI Properties
    
    private let iconImageView = UIImageView()
    private let labelStackView = UIStackView()
    private let appNameLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let downloadButton = UIButton()
    private let deviderView = UIView()
    
    //MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStyle()
        setupHierarchy()
        setupLayout()
        
        downloadButton.rx.tap
            .map { [weak self] in self?.itemID }
            .compactMap { $0 }
            .bind(to: downloadButtonTapped)
            .disposed(by: disposeBag)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        downloadButtonTapped.onCompleted()
    }
}

extension AppCell {
    
    //MARK: - Layout
    
    private func setupStyle() {
        iconImageView.do {
            $0.image = .iconToss
            $0.roundCorners(cornerRadius: 15)
            $0.makeBorder(width: 0.5, color: .lightGray)
        }
        
        labelStackView.do {
            $0.axis = .vertical
            $0.spacing = 2
            $0.alignment = .leading
        }
        
        appNameLabel.do {
            $0.text = "토스"
            $0.textColor = .label
            $0.font = .systemFont(ofSize: 12, weight: .semibold)
        }
        
        descriptionLabel.do {
            $0.text = "금융이 쉬워진다"
            $0.textColor = .systemGray4
            $0.font = .systemFont(ofSize: 11)
        }
        
        downloadButton.do {
            $0.setTitleColor(.systemBlue, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 13, weight: .heavy)
            $0.backgroundColor = .systemGray6
            $0.roundCorners(cornerRadius: 14)
        }
        
        deviderView.do {
            $0.backgroundColor = .systemGray5
            $0.isHidden = true
        }
    }
    
    private func setupHierarchy() {
        contentView.addSubviews(
            iconImageView,
            labelStackView,
            downloadButton,
            deviderView
        )
        labelStackView.addArrangedSubviews(appNameLabel, descriptionLabel)
    }
    
    private func setupLayout() {
        iconImageView.snp.makeConstraints {
            $0.leading.centerY.equalToSuperview().inset(5)
            $0.size.equalTo(60)
        }
        
        labelStackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(iconImageView.snp.trailing).offset(7)
        }
        
        downloadButton.snp.makeConstraints {
            $0.width.equalTo(65)
            $0.leading.equalTo(labelStackView.snp.trailing).offset(7)
            $0.trailing.equalToSuperview().inset(5)
            $0.centerY.equalToSuperview()
        }
        
        deviderView.snp.makeConstraints {
            $0.leading.equalTo(labelStackView.snp.leading)
            $0.trailing.equalToSuperview().inset(5)
            $0.height.equalTo(1)
            $0.top.equalTo(iconImageView.snp.bottom).offset(5)
        }
    }
    
    //MARK: - Func
    
    func configureCell(with app: AppModel) {
        itemID = app.id
        iconImageView.image = app.appIconImage
        appNameLabel.text = app.appTitle
        descriptionLabel.text = app.description
        
        if app.downloadState == .download {
            downloadButton.setTitle("받기", for: .normal)
        } else if app.downloadState == .installed {
            downloadButton.setTitle("열기", for: .normal)
        }
    }
    
    func isDeviderViewHidden(_ bool: Bool) {
        deviderView.isHidden = bool
    }
}
