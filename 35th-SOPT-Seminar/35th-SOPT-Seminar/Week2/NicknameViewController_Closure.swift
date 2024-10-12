//
//  NicknameViewController_Closure.swift
//  35th-SOPT-Seminar
//
//  Created by 조혜린 on 10/12/24.
//

import UIKit

final class NicknameViewController_Closure: UIViewController {
    
    var setNickname: ((String) -> ())?
        
    private var recievedTitle: String?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("이전 화면으로", for: .normal)
        button.backgroundColor = .tintColor
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var nicknameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "닉네임을 입력해주세요"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private lazy var settingButton: UIButton = {
        let button = UIButton()
        button.setTitle("데이터 전달", for: .normal)
        button.backgroundColor = .tintColor
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(settingButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupStyle()
        setupHierarchy()
        setupLayout()
    }
    
    private func setupStyle() {
        self.view.backgroundColor = .lightGray
    }
    
    private func setupHierarchy() {
        [titleLabel, backButton, nicknameTextField, settingButton].forEach {
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
                
                backButton.topAnchor.constraint(
                    equalTo: titleLabel.bottomAnchor,
                    constant: 20
                ),
                backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                backButton.heightAnchor.constraint(equalToConstant: 44),
                backButton.widthAnchor.constraint(equalToConstant: 300),
                
                nicknameTextField.topAnchor.constraint(
                    equalTo: backButton.bottomAnchor,
                    constant: 20
                ),
                nicknameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                nicknameTextField.heightAnchor.constraint(equalToConstant: 44),
                nicknameTextField.widthAnchor.constraint(equalToConstant: 300),
                
                settingButton.topAnchor.constraint(
                    equalTo: nicknameTextField.bottomAnchor,
                    constant: 20
                ),
                settingButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                settingButton.heightAnchor.constraint(equalToConstant: 44),
                settingButton.widthAnchor.constraint(equalToConstant: 300)
            ]
        )
    }
    
    func updateUI() {
        titleLabel.text = recievedTitle
    }
    
    func bindData(title: String) {
        recievedTitle = title
        updateUI()
    }
    
    @objc func backButtonTapped() {
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @objc func settingButtonTapped() {
        let nicknameText = nicknameTextField.text
        setNickname?(nicknameText ?? "")
    }
}
