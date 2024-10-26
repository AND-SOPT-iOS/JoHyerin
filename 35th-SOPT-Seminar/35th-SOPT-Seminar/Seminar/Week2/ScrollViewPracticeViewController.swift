//
//  ScrollViewPracticeViewController.swift
//  35th-SOPT-Seminar
//
//  Created by 조혜린 on 10/12/24.
//

import UIKit

import SnapKit
import Then

final class ScrollViewPracticeViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let redView = UIView()
    private let greenView = UIView()
    private let blueView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        setupStyle()
        setupHierarchy()
        setupLayout()
    }
}

extension ScrollViewPracticeViewController {
    
    //MARK: - Layout
    
    private func setupStyle() {
        redView.do {
            $0.backgroundColor = .red
        }
        
        greenView.do {
            $0.backgroundColor = .green
        }
        
        blueView.do {
            $0.backgroundColor = .blue
        }
    }
    
    private func setupHierarchy() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(redView, greenView, blueView)
    }
    
    private func setupLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.greaterThanOrEqualToSuperview().priority(.low)
        }
        
        redView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(300)
        }
        
        greenView.snp.makeConstraints {
            $0.top.equalTo(redView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(300)
        }
        
        blueView.snp.makeConstraints {
            $0.top.equalTo(greenView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(300)
        }
    }
}
