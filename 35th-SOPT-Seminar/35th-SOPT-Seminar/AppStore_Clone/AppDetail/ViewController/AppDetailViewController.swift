//
//  AppDetailViewController.swift
//  35th-SOPT-Seminar
//
//  Created by 조혜린 on 10/29/24.
//

import UIKit

final class AppDetailViewController: UIViewController {
    
    //MARK: - Properties
    
    private let rootView = AppDetailView()
    
    // MARK: - Life Cycle
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTarget()
    }
}

extension AppDetailViewController {
    
    // MARK: - Private Method
    
    private func setupTarget() {
        
    }
    
    private func buttonTapped() {
        
    }
}

