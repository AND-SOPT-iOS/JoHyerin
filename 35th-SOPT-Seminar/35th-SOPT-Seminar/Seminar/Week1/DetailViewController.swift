//
//  DetailViewController.swift
//  35th-SOPT-Seminar
//
//  Created by 조혜린 on 10/5/24.
//

import UIKit

final class DetailViewController: UIViewController {
    
    private var recievedTitle: String?
    private var recievedContent: String?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .left
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
        [titleLabel, contentLabel, backButton].forEach {
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
                
                contentLabel.topAnchor.constraint(
                    equalTo: titleLabel.bottomAnchor,
                    constant: 20
                ),
                contentLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                backButton.topAnchor.constraint(
                    equalTo: contentLabel.bottomAnchor,
                    constant: 20
                ),
                backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                backButton.heightAnchor.constraint(equalToConstant: 44),
                backButton.widthAnchor.constraint(equalToConstant: 300),
            ]
        )
    }
    
    func updateUI() {
        titleLabel.text = recievedTitle
        contentLabel.text = recievedContent
    }
    
    func bindData(data: PracticeModel_MVVM) {
        recievedTitle = data.nickname
        recievedContent = data.content
        updateUI()
    }
    
    @objc func backButtonTapped() {
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
