//
//  InfoView.swift
//  35th-SOPT-Seminar
//
//  Created by 조혜린 on 10/29/24.
//

import UIKit

import SnapKit
import Then

final class InfoView: UIView {

    //MARK: - UI Properties
    
    private let evaluationView = InfoDetailView(titleString: "8.4만개의 평가", imageString: "star.circle", subString: "★★★★★")
    private let awardView = InfoDetailView(titleString: "수상", imageString: "person", subString: "앱")
    private let ageView = InfoDetailView(titleString: "연령", imageString: "4.circle", subString: "세")
    private let chartView = InfoDetailView(titleString: "차트", imageString: "chart.bar.fill", subString: "금융")
    
    private let deviderView1 = UIView()
    private let deviderView2 = UIView()
    private let deviderView3 = UIView()

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

extension InfoView {
    
    // MARK: - Layout
    
    private func setupStyle() {
        backgroundColor = .systemBackground
        
        [deviderView1, deviderView2, deviderView3].forEach {
            $0.do {
                $0.backgroundColor = .systemGray4
            }
        }
    }
    
    private func setupHierarchy() {
        addSubviews(
            evaluationView,
            deviderView1,
            awardView,
            deviderView2,
            ageView,
            deviderView3,
            chartView
        )
    }
    
    private func setupLayout() {
        evaluationView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(5)
            $0.width.equalTo(100)
            $0.leading.equalToSuperview()
        }
        
        deviderView1.snp.makeConstraints {
            $0.width.equalTo(0.3)
            $0.height.equalTo(30)
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(evaluationView.snp.trailing)
        }
        
        awardView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(5)
            $0.width.equalTo(110)
            $0.leading.equalTo(deviderView1.snp.trailing)
        }
        
        deviderView2.snp.makeConstraints {
            $0.width.equalTo(0.3)
            $0.height.equalTo(30)
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(awardView.snp.trailing)
        }
        
        ageView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(5)
            $0.width.equalTo(110)
            $0.leading.equalTo(deviderView2.snp.trailing)
        }
        
        deviderView3.snp.makeConstraints {
            $0.width.equalTo(0.3)
            $0.height.equalTo(30)
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(ageView.snp.trailing)
        }
        
        chartView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(5)
            $0.width.equalTo(110)
            $0.leading.equalTo(deviderView3.snp.trailing)
        }
    }
}
