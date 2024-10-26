//
//  PracticeView_MVVM.swift
//  35th-SOPT-Seminar
//
//  Created by 조혜린 on 10/25/24.
//

import UIKit

final class PracticeView_MVVM: UIView {
    
    //MARK: - UI Properties
    
    let nicknameValidationLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        
        return label
    }()
    
    let nicknameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "닉네임을 입력해주세요."
        textField.clearButtonMode = .whileEditing
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        
        return textField
    }()
    
    let contentTextView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 14)
        textView.layer.borderColor = UIColor.gray.cgColor
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 5
        
        return textView
    }()
    
    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("다음", for: .normal)
        button.backgroundColor = .gray
        button.isEnabled = false
        button.setTitleColor(.white, for: .normal)
        
        return button
    }()
    
    lazy var checkNicknameButton: UIButton = {
        let button = UIButton()
        button.setTitle("닉네임 유효성 확인", for: .normal)
        button.backgroundColor = .tintColor
        button.setTitleColor(.white, for: .normal)
        
        return button
    }()
    
    // MARK: - Life Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStyle()
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("SecondView Error!")
    }
}

extension PracticeView_MVVM {
    
    //MARK: - Layout
    
    private func setupStyle() {
        backgroundColor = .white
    }
    
    private func setupHierarchy() {
        [nicknameValidationLabel, nicknameTextField, contentTextView, nextButton, checkNicknameButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate(
            [
                nicknameValidationLabel.topAnchor.constraint(
                    equalTo: safeAreaLayoutGuide.topAnchor,
                    constant: 20
                ),
                nicknameValidationLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                
                nicknameTextField.topAnchor.constraint(
                    equalTo: nicknameValidationLabel.bottomAnchor,
                    constant: 20
                ),
                nicknameTextField.leadingAnchor.constraint(
                    equalTo: leadingAnchor,
                    constant: 20
                ),
                nicknameTextField.trailingAnchor.constraint(
                    equalTo: trailingAnchor,
                    constant: -20
                ),
                nicknameTextField.heightAnchor.constraint(equalToConstant: 40),
                
                contentTextView.topAnchor.constraint(
                    equalTo: nicknameTextField.bottomAnchor,
                    constant: 20
                ),
                contentTextView.leadingAnchor.constraint(
                    equalTo: leadingAnchor,
                    constant: 20
                ),
                contentTextView.trailingAnchor.constraint(
                    equalTo: trailingAnchor,
                    constant: -20
                ),
                contentTextView.heightAnchor.constraint(
                    equalToConstant: 100
                ),
                
                nextButton.topAnchor.constraint(
                    equalTo: contentTextView.bottomAnchor,
                    constant: 20
                ),
                nextButton.centerXAnchor.constraint(equalTo: centerXAnchor),
                nextButton.heightAnchor.constraint(equalToConstant: 50),
                nextButton.widthAnchor.constraint(equalToConstant: 200),
                
                checkNicknameButton.topAnchor.constraint(
                    equalTo: nextButton.bottomAnchor,
                    constant: 20
                ),
                checkNicknameButton.centerXAnchor.constraint(equalTo: centerXAnchor),
                checkNicknameButton.heightAnchor.constraint(equalToConstant: 50),
                checkNicknameButton.widthAnchor.constraint(equalToConstant: 200)
            ]
        )
    }
}
