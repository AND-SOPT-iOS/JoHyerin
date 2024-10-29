//
//  TableViewPractice.swift
//  35th-SOPT-Seminar
//
//  Created by 조혜린 on 10/26/24.
//

import UIKit

import SnapKit
import Then

final class TableViewPractice: UIViewController {
    
    //MARK: - Properties
    
    let appData = App.sampleApps
    
    //MARK: - UI Properties
    
    private let tableView = UITableView()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupStyle()
        setupHierarchy()
        setupLayout()
    }
}

extension TableViewPractice {
    
    // MARK: - Layout
    
    private func setupStyle() {        
        tableView.do {
            $0.dataSource = self
            $0.delegate = self
            $0.register(ChartCell.self, forCellReuseIdentifier: ChartCell.identifier)
            $0.rowHeight = 250
        }
    }
    
    private func setupHierarchy() {
        view.addSubview(tableView)
    }
    
    private func setupLayout() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension TableViewPractice: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChartCell.identifier, for: indexPath) as? ChartCell else { return UITableViewCell() }
        cell.configureCell(data: appData[indexPath.row])
        return cell
    }
}
