//
//  AppDetailViewController.swift
//  35th-SOPT-Seminar
//
//  Created by 조혜린 on 10/29/24.
//

import UIKit

import RxSwift
import RxCocoa

final class AppDetailViewController: UIViewController {
    
    //MARK: - Properties
    
    private let rootView = AppDetailView()
    
    var appDataRelay: BehaviorRelay<[AppModel]>!
    var selectedItemIndex: Int?
    
    // MARK: - Life Cycle
    
    init(downloadState: DownloadState) {
        rootView.headerView.downloadState = downloadState
        
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        rootView.headerView.downloadButton.addTarget(self, action: #selector(downloadButtonTapped), for: .touchUpInside)
    }
    
    //MARK: - @Objc Method
    
    @objc private func downloadButtonTapped() {
        rootView.headerView.downloadState = .installed
        
        guard let index = selectedItemIndex else { return }
        var updatedData = appDataRelay.value
        updatedData[index].id = UUID()
        updatedData[index].downloadState = .installed
        appDataRelay.accept(updatedData)
    }
}

