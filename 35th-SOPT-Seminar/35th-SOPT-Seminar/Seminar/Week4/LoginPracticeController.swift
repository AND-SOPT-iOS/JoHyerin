//
//  LoginPracticeController.swift
//  35th-SOPT-Seminar
//
//  Created by 조혜린 on 11/2/24.
//

import UIKit

import SnapKit
import Then

final class LoginPracticeController: UIViewController {
    
    //MARK: - UI Properties
    
    private let idTextField = UITextField()
    private let pasewordTextField = UITextField()
    private let loginButton = UIButton()
    private let loginStackView = UIStackView()
    private let resultLabel = UILabel()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupStyle()
        setupHierarchy()
        setupLayout()
    }
}

extension LoginPracticeController {
    
    // MARK: - Private Method
    
    private func setupStyle() {
        view.backgroundColor = .systemBackground
        
        idTextField.do {
            $0.placeholder = "아이디를 입력하세요"
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.lightGray.cgColor
            $0.roundCorners(cornerRadius: 5)
        }
        
        pasewordTextField.do {
            $0.placeholder = "비밀번호를 입력하세요"
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.lightGray.cgColor
            $0.roundCorners(cornerRadius: 5)
        }
        
        loginButton.do {
            $0.backgroundColor = .systemBlue
            $0.setTitle("로그인", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        }
        
        loginStackView.do {
            $0.axis = .vertical
            $0.spacing = 8
            $0.alignment = .fill
            $0.distribution = .fillEqually
            $0.addArrangedSubviews(idTextField, pasewordTextField, loginButton)
        }
    }
    
    private func setupHierarchy() {
        view.addSubviews(loginStackView, resultLabel)
    }
    
    private func setupLayout() {
        loginStackView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(200)
        }
        
        resultLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(loginStackView.snp.bottom).offset(10)
        }
    }
    
    //MARK: - @objc Func
    
    @objc private func loginButtonTapped() {
        let loginService = LoginService()
        
        loginService.register(
            username: idTextField.text!,
            password: pasewordTextField.text!
        ) { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                var text: String
                
                switch result {
                case .success:
                    text = "로그인 성공!"
                case let .failure(error):
                    text = error.errorMessage
                }
                self.resultLabel.text = text
            }
        }
    }
}

