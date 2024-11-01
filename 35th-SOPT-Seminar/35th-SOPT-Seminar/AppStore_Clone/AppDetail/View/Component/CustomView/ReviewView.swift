//
//  ReviewView.swift
//  35th-SOPT-Seminar
//
//  Created by 조혜린 on 10/30/24.
//

import UIKit

import SnapKit
import Then

final class ReviewView: UIView {

    //MARK: - UI Properties
    
    private let evaluationReviewLabel = UILabel()
    private let viewAllButton = UIButton()
    private let ratingScoreLabel = UILabel()
    private let descriptionImageView = UIImageView()
    private let descriptionLabel = UILabel()
    private let descriptionStackView = UIStackView()
    private let mostHelpfulReviewLabel = UILabel()
    private let evaluateLabel = UILabel()
    private let reviewDetailView = UIView()
    private var starButtonArray = [UIButton]()
    private let starButtonStackView = UIStackView()
    private let writeReviewButton = UIButton()
    private let appSupportButton = UIButton()
    private let buttonStackView = UIStackView()

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

extension ReviewView {
    
    // MARK: - Layout
    
    private func setupStyle() {
        backgroundColor = .systemBackground
        
        evaluationReviewLabel.do {
            $0.text = "평가 및 리뷰"
            $0.textColor = .label
            $0.font = .systemFont(ofSize: 20, weight: .bold)
        }
        
        viewAllButton.do {
            $0.setTitle("모두 보기", for: .normal)
            $0.setTitleColor(.systemBlue, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 17)
        }
        
        ratingScoreLabel.do {
            $0.text = "4.4"
            $0.textColor = .label
            $0.font = .systemFont(ofSize: 70, weight: .heavy)
        }
        
        descriptionImageView.do {
            $0.image = UIImage(resource: .imgRatingScore)
        }
        
        descriptionLabel.do {
            $0.text = "8.4만개의 평가"
            $0.textColor = .label
            $0.font = .systemFont(ofSize: 14, weight: .semibold)
        }
        
        descriptionStackView.do {
            $0.axis = .vertical
            $0.spacing = 5
            $0.alignment = .trailing
            $0.addArrangedSubviews(descriptionImageView, descriptionLabel)
        }
        
        mostHelpfulReviewLabel.do {
            $0.text = "가장 도움이 되는 리뷰"
            $0.textColor = .label
            $0.font = .systemFont(ofSize: 16, weight: .regular)
        }
        
        reviewDetailView.do {
            $0.backgroundColor = .systemGray6
            $0.roundCorners(cornerRadius: 15)
        }
        
        evaluateLabel.do {
            $0.text = "탭하여 평가하기"
            $0.textColor = .label
            $0.font = .systemFont(ofSize: 16, weight: .regular)
        }
        
        for i in 0...4 {
            let button = UIButton()
            
            button.setImage(UIImage(systemName: "star", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25, weight: .semibold)), for: .normal)
            button.setImage(UIImage(systemName: "star.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25, weight: .semibold)), for: .selected)
            button.tintColor = .systemBlue
            button.tag = i
            starButtonArray.append(button)
            starButtonStackView.addArrangedSubviews(starButtonArray[i])
        }
        
        starButtonStackView.do {
            $0.axis = .horizontal
            $0.spacing = 10
        }
        
        [writeReviewButton, appSupportButton].forEach { button in
            button.do {
                if $0 == writeReviewButton {
                    $0.setButtonWithImageAndTitle(title: "리뷰 작성", image: UIImage(systemName: "square.and.pencil", withConfiguration: UIImage.SymbolConfiguration(pointSize: 12, weight: .bold))!, imagePadding: 2, imagePlacement: .leading)
                } else {
                    $0.setButtonWithImageAndTitle(title: "앱 지원", image: UIImage(systemName: "questionmark.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 12, weight: .bold))!, imagePadding: 2, imagePlacement: .leading)
                }
                $0.tintColor = .systemBlue
                $0.setTitleColor(.systemBlue, for: .normal)
                $0.titleLabel?.font = .systemFont(ofSize: 12, weight: .bold)
                $0.backgroundColor = .systemGray6
                $0.roundCorners(cornerRadius: 10)
            }
        }
        
        buttonStackView.do {
            $0.axis = .horizontal
            $0.spacing = 10
            $0.addArrangedSubviews(writeReviewButton, appSupportButton)
        }
    }
    
    private func setupHierarchy() {
        addSubviews(
            evaluationReviewLabel,
            viewAllButton,
            ratingScoreLabel,
            descriptionStackView,
            mostHelpfulReviewLabel,
            reviewDetailView,
            evaluateLabel,
            starButtonStackView,
            buttonStackView
        )
    }
    
    private func setupLayout() {
        
        evaluationReviewLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        
        viewAllButton.snp.makeConstraints {
            $0.centerY.equalTo(evaluationReviewLabel.snp.centerY)
            $0.trailing.equalToSuperview()
        }
        
        ratingScoreLabel.snp.makeConstraints {
            $0.top.equalTo(evaluationReviewLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview()
        }
        
        descriptionStackView.snp.makeConstraints {
            $0.bottom.equalTo(ratingScoreLabel.snp.bottom)
            $0.trailing.equalToSuperview()
        }
        
        mostHelpfulReviewLabel.snp.makeConstraints {
            $0.top.equalTo(ratingScoreLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview()
        }
        
        reviewDetailView.snp.makeConstraints {
            $0.top.equalTo(mostHelpfulReviewLabel.snp.bottom).offset(15)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(200)
        }
        
        evaluateLabel.snp.makeConstraints {
            $0.top.equalTo(reviewDetailView.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        starButtonStackView.snp.makeConstraints {
            $0.top.equalTo(evaluateLabel.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
        
        buttonStackView.snp.makeConstraints {
            $0.top.equalTo(starButtonStackView.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(50)
            $0.bottom.equalToSuperview().inset(20)
        }
    }
}
