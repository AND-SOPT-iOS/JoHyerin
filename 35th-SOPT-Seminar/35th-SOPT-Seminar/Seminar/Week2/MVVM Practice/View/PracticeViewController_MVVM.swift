//
//  PracticeViewController_MVVM.swift
//  35th-SOPT-Seminar
//
//  Created by 조혜린 on 10/25/24.
//

import UIKit

final class PracticeViewController_MVVM: UIViewController {
    
    //MARK: - Properties
    
    private let rootView = PracticeView_MVVM()
    private let viewModel = PracticeViewModel()
        
    // MARK: - Life Cycle
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTarget()
        bindViewModel()
    }
}

extension PracticeViewController_MVVM {
    
    // MARK: - Private Method
    
    private func setupTarget() {
        rootView.nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        rootView.checkNicknameButton.addTarget(self, action: #selector(checkNicknameButtonTapped), for: .touchUpInside)
    }
    
    private func toggleStateForNextButton(isEnabled: Bool) {
        rootView.nextButton.isEnabled = isEnabled
        rootView.nextButton.backgroundColor = isEnabled ? .systemBlue : .gray
    }
    
    private func bindViewModel() {
        viewModel.isNicknameValid = { [weak self] isValid, message in
            self?.rootView.nicknameValidationLabel.text = message
            self?.toggleStateForNextButton(isEnabled: isValid)
        }
    }
    
    //MARK: - @objc Method
    
    @objc private func nextButtonTapped() {
        let detailViewController = DetailViewController()
        
        if let nickname = rootView.nicknameTextField.text,
           let content = rootView.contentTextView.text {
            viewModel.updateNicknameAndContent(nickname: nickname, content: content)
        }
        
        detailViewController.bindData(data: viewModel.practiceModel)
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    @objc private func checkNicknameButtonTapped() {
        if let nickname = rootView.nicknameTextField.text {
            viewModel.checkValid(nickname: nickname)
        }
    }
}
