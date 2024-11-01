//
//  FinanceView.swift
//  35th-SOPT-Seminar
//
//  Created by 조혜린 on 11/2/24.
//

import UIKit

import SnapKit
import Then

final class FinanceView: UIView {

    //MARK: - UI Properties
    
    private lazy var financeCollectionView = UICollectionView()
        
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

extension FinanceView {
    
    // MARK: - Layout
    
    private func setupStyle() {
        backgroundColor = .systemBackground
    }
    
    private func setupHierarchy() {
        addSubview(financeCollectionView)
    }
    
    private func setupLayout() {
        financeCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
