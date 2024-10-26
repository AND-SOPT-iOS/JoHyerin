//
//  PracticeViewController_MVC.swift
//  35th-SOPT-Seminar
//
//  Created by 조혜린 on 10/25/24.
//

import UIKit

final class PracticeViewController_MVC: UIViewController {
    
    //MARK: - Properties
    
    private let rootView = PracticeView()
    
    private var isNavigationMode = true
    private var practiceModel = PracticeModel(title: "initial title", content: "initial content")
    
    // MARK: - Life Cycle
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTarget()
    }
}

extension PracticeViewController_MVC {
    
    // MARK: - Private Method
    
    private func setupTarget() {
        rootView.nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        rootView.changeModeButton.addTarget(self, action: #selector(changeModeButtonTapped), for: .touchUpInside)
    }
    
    //MARK: - @objc Method
    
    @objc private func nextButtonTapped() {
        let detailViewController = DetailViewController()
        
        if let title = rootView.titleTextField.text, let content = rootView.contentTextView.text {
            practiceModel.title = title
            practiceModel.content = content
        }
//        detailViewController.bindData(data: practiceModel)
        isNavigationMode ? self.navigationController?.pushViewController(detailViewController, animated: true) : self.present(detailViewController, animated: true)
    }
    
    @objc private func changeModeButtonTapped() {
        isNavigationMode.toggle()
        rootView.navigationModeLabel.text = isNavigationMode ? "Navigation Mode" : "Presentation Mode"
    }
}
