//
//  PracticeViewController_Delegate.swift
//  35th-SOPT-Seminar
//
//  Created by 조혜린 on 10/12/24.
//

import UIKit

final class PracticeViewController_Delegate: UIViewController {
    
    private var isNavigationMode = true
        
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Navigation Mode"
        label.font = .systemFont(ofSize: 16)
        
        return label
    }()
    
    private let titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "제목을 입력해주세요."
        textField.clearButtonMode = .whileEditing
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1
        
        return textField
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("다음", for: .normal)
        button.backgroundColor = .tintColor
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var changeModeButton: UIButton = {
        let button = UIButton()
        button.setTitle("전환 모드 변경", for: .normal)
        button.backgroundColor = .tintColor
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(changeModeButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    private let nicknameLabel: UILabel = {
        let label = UILabel()
        label.text = "닉네임이 뭔가요"
        label.font = .systemFont(ofSize: 16)
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupStyle()
        setupHierarchy()
        setupLayout()
    }
    
    private func setupStyle() {
        self.view.backgroundColor = .white
    }
    
    private func setupHierarchy() {
        [titleLabel, titleTextField, nextButton, changeModeButton, nicknameLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate(
            [
                titleLabel.topAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.topAnchor,
                    constant: 20
                ),
                titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                titleTextField.topAnchor.constraint(
                    equalTo: titleLabel.bottomAnchor,
                    constant: 20
                ),
                titleTextField.leadingAnchor.constraint(
                    equalTo: view.leadingAnchor,
                    constant: 20
                ),
                titleTextField.trailingAnchor.constraint(
                    equalTo: view.trailingAnchor,
                    constant: -20
                ),
                titleTextField.heightAnchor.constraint(equalToConstant: 40),
                
                nextButton.topAnchor.constraint(
                    equalTo: titleTextField.bottomAnchor,
                    constant: 20
                ),
                nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                nextButton.heightAnchor.constraint(equalToConstant: 50),
                nextButton.widthAnchor.constraint(equalToConstant: 200),
                
                changeModeButton.topAnchor.constraint(
                    equalTo: nextButton.bottomAnchor,
                    constant: 20
                ),
                changeModeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                changeModeButton.heightAnchor.constraint(equalToConstant: 50),
                changeModeButton.widthAnchor.constraint(equalToConstant: 200),
                
                nicknameLabel.topAnchor.constraint(
                    equalTo: changeModeButton.bottomAnchor,
                    constant: 20
                ),
                nicknameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ]
        )
    }
    
    @objc private func nextButtonTapped() {
        let nicknameViewController = NicknameViewController_Delegate()
        nicknameViewController.delegate = self
        
        if let title = titleTextField.text {
            nicknameViewController.bindData(title: title)
        }
        
        isNavigationMode ? self.navigationController?.pushViewController(nicknameViewController, animated: true) : self.present(nicknameViewController, animated: true)
    }
    
    @objc private func changeModeButtonTapped() {
        isNavigationMode.toggle()
        titleLabel.text = isNavigationMode ? "Navigation Mode" : "Presentation Mode"
    }
}

extension PracticeViewController_Delegate: NicknameDelegate {
    func setNickname(nickname: String) {
        nicknameLabel.text = nickname
    }
}
