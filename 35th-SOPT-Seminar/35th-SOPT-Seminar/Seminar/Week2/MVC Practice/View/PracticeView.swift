//
//  PracticeView.swift
//  35th-SOPT-Seminar
//
//  Created by 조혜린 on 10/25/24.
//

import UIKit

final class PracticeView: UIView {
    
    //MARK: - UI Properties
    
    let navigationModeLabel: UILabel = {
        let label = UILabel()
        label.text = "Navigation Mode"
        label.font = .systemFont(ofSize: 16)
        
        return label
    }()
    
    let titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "제목을 입력해주세요."
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
        button.backgroundColor = .tintColor
        button.setTitleColor(.white, for: .normal)
        
        return button
    }()
    
    lazy var changeModeButton: UIButton = {
        let button = UIButton()
        button.setTitle("전환 모드 변경", for: .normal)
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

extension PracticeView {
    
    //MARK: - Layout
    
    private func setupStyle() {
        backgroundColor = .white
    }
    
    private func setupHierarchy() {
        [navigationModeLabel, titleTextField, contentTextView, nextButton, changeModeButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate(
            [
                navigationModeLabel.topAnchor.constraint(
                    equalTo: safeAreaLayoutGuide.topAnchor,
                    constant: 20
                ),
                navigationModeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                
                titleTextField.topAnchor.constraint(
                    equalTo: navigationModeLabel.bottomAnchor,
                    constant: 20
                ),
                titleTextField.leadingAnchor.constraint(
                    equalTo: leadingAnchor,
                    constant: 20
                ),
                titleTextField.trailingAnchor.constraint(
                    equalTo: trailingAnchor,
                    constant: -20
                ),
                titleTextField.heightAnchor.constraint(equalToConstant: 40),
                
                contentTextView.topAnchor.constraint(
                    equalTo: titleTextField.bottomAnchor,
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
                
                changeModeButton.topAnchor.constraint(
                    equalTo: nextButton.bottomAnchor,
                    constant: 20
                ),
                changeModeButton.centerXAnchor.constraint(equalTo: centerXAnchor),
                changeModeButton.heightAnchor.constraint(equalToConstant: 50),
                changeModeButton.widthAnchor.constraint(equalToConstant: 200)
            ]
        )
    }
}
