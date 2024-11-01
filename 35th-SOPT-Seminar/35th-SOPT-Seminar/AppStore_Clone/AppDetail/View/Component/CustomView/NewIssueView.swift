//
//  NewIssueView.swift
//  35th-SOPT-Seminar
//
//  Created by 조혜린 on 10/29/24.
//

import UIKit

import SnapKit
import Then

final class NewIssueView: UIView {

    //MARK: - UI Properties
    
    private let newIssueLabel = UILabel()
    private let versionRecordButton = UIButton()
    private let versionLabel = UILabel()
    private let updateAtLabel = UILabel()
    private let updateContentLabel = UILabel()
    private let previewLabel = UILabel()
    private let previewImageView = UIImageView()
    private let reviewLabel = UILabel()
    private let viewAllButton = UIButton()
        
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

extension NewIssueView {
    
    // MARK: - Layout
    
    private func setupStyle() {
        backgroundColor = .systemBackground
        
        newIssueLabel.do {
            $0.text = "새로운 소식"
            $0.textColor = .label
            $0.font = .systemFont(ofSize: 20, weight: .bold)
        }
        
        versionRecordButton.do {
            $0.setTitle("버전 기록", for: .normal)
            $0.setTitleColor(.systemBlue, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 17)
        }
        
        versionLabel.do {
            $0.text = "버전 5.186.0"
            $0.textColor = .label
            $0.font = .systemFont(ofSize: 12)
        }
        
        updateAtLabel.do {
            $0.text = "5일 전"
            $0.textColor = .label
            $0.font = .systemFont(ofSize: 12)
        }
        
        updateContentLabel.do {
            $0.text = "• 구석구석 숨어있던 버그들을 잡았어요. 또 다른 버그가 나타나면 토스 고객센터를 찾아주세요. 늘 열려있답니다. 365일 24시간 언제든지요."
            $0.numberOfLines = 2
            $0.textColor = .label
            $0.font = .systemFont(ofSize: 12)
            $0.setLineHeight(percentage: 150)
        }
    }
    
    private func setupHierarchy() {
        addSubviews(
            newIssueLabel,
            versionRecordButton,
            versionLabel,
            updateAtLabel,
            updateContentLabel
        )
    }
    
    private func setupLayout() {
        
        newIssueLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        
        versionRecordButton.snp.makeConstraints {
            $0.centerY.equalTo(newIssueLabel.snp.centerY)
            $0.trailing.equalToSuperview()
        }
        
        versionLabel.snp.makeConstraints {
            $0.top.equalTo(newIssueLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview()
        }
        
        updateAtLabel.snp.makeConstraints {
            $0.centerY.equalTo(versionLabel.snp.centerY)
            $0.trailing.equalToSuperview()
        }
        
        updateContentLabel.snp.makeConstraints {
            $0.top.equalTo(updateAtLabel.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview().inset(10)
        }
    }
}
