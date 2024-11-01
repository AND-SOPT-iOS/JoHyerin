//
//  AppDetailView.swift
//  35th-SOPT-Seminar
//
//  Created by 조혜린 on 10/29/24.
//

import UIKit

import SnapKit
import Then

final class AppDetailView: UIView {

    //MARK: - UI Properties
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let headerView = HeaderView()
    private let infoView = InfoView()
    private let newIssueView = NewIssueView()
    private let previewView = PreviewView()
    private let reviewView = ReviewView()
    
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

extension AppDetailView {
    
    // MARK: - Layout
    
    private func setupStyle() {
        backgroundColor = .white
        
        [deviderView1, deviderView2, deviderView3].forEach {
            $0.do {
                $0.backgroundColor = .lightGray
            }
        }
    }
    
    private func setupHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubviews(
            headerView,
            deviderView1,
            infoView,
            deviderView2,
            newIssueView,
            previewView,
            deviderView3,
            reviewView
        )
    }
    
    private func setupLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.greaterThanOrEqualToSuperview().priority(.high)
        }
        
        headerView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        deviderView1.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom)
            $0.height.equalTo(0.3)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview()
        }
        
        infoView.snp.makeConstraints {
            $0.top.equalTo(deviderView1.snp.bottom).offset(5)
            $0.leading.equalToSuperview().inset(20)
        }
        
        deviderView2.snp.makeConstraints {
            $0.top.equalTo(infoView.snp.bottom).offset(5)
            $0.height.equalTo(0.3)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview()
        }
        
        newIssueView.snp.makeConstraints {
            $0.top.equalTo(deviderView2.snp.bottom).offset(15)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        previewView.snp.makeConstraints {
            $0.top.equalTo(newIssueView.snp.bottom).offset(15)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        deviderView3.snp.makeConstraints {
            $0.top.equalTo(previewView.snp.bottom).offset(5)
            $0.height.equalTo(0.3)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        reviewView.snp.makeConstraints {
            $0.top.equalTo(deviderView3.snp.bottom).offset(15)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(20)
        }
    }
}
