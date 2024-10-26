//
//  PracticeViewController.swift
//  35th-SOPT-Seminar
//
//  Created by 조혜린 on 10/5/24.
//

import UIKit

class PracticeViewController: UIViewController {
    
    private var isNavigationMode = true
    
    private let navigationModeLabel: UILabel = {
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
        textField.layer.cornerRadius = 5
        
        return textField
    }()
    
    private let contentTextView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 14)
        textView.layer.borderColor = UIColor.gray.cgColor
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 5
        
        return textView
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
        [navigationModeLabel, titleTextField, contentTextView, nextButton, changeModeButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate(
            [
                navigationModeLabel.topAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.topAnchor,
                    constant: 20
                ),
                navigationModeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                titleTextField.topAnchor.constraint(
                    equalTo: navigationModeLabel.bottomAnchor,
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
                
                contentTextView.topAnchor.constraint(
                    equalTo: titleTextField.bottomAnchor,
                    constant: 20
                ),
                contentTextView.leadingAnchor.constraint(
                    equalTo: view.leadingAnchor,
                    constant: 20
                ),
                contentTextView.trailingAnchor.constraint(
                    equalTo: view.trailingAnchor,
                    constant: -20
                ),
                contentTextView.heightAnchor.constraint(
                    equalToConstant: 100
                ),
                
                nextButton.topAnchor.constraint(
                    equalTo: contentTextView.bottomAnchor,
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
                changeModeButton.widthAnchor.constraint(equalToConstant: 200)
            ]
        )
    }
    
    @objc private func nextButtonTapped() {
        let detailViewController = DetailViewController()
        
        if let title = titleTextField.text, let content = contentTextView.text {
//            detailViewController.bindData(title: title, content: content)
        }
        
        isNavigationMode ? self.navigationController?.pushViewController(detailViewController, animated: true) : self.present(detailViewController, animated: true)
    }
    
    @objc private func changeModeButtonTapped() {
        isNavigationMode.toggle()
        navigationModeLabel.text = isNavigationMode ? "Navigation Mode" : "Presentation Mode"
    }
}

