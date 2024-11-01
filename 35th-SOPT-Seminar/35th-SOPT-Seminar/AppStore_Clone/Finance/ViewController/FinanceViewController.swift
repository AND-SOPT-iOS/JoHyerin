//
//  FinanceViewController.swift
//  35th-SOPT-Seminar
//
//  Created by 조혜린 on 11/2/24.
//

import UIKit

final class FinanceViewController: UIViewController {
    
    //MARK: - Properties
    
    private let rootView = FinanceView()
    
    // MARK: - Life Cycle
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTarget()
    }
}

extension FinanceViewController {
    
    // MARK: - Private Method
    
    private func setupTarget() {
        
    }
    
    private func buttonTapped() {
        
    }
}

