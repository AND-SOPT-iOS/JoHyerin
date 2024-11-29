//
//  FinanceViewController.swift
//  35th-SOPT-Seminar
//
//  Created by 조혜린 on 11/2/24.
//

import UIKit

enum SectionType: Int {
    case banner
}

final class FinanceViewController: UIViewController {
    
    //MARK: - Properties
    
    private let rootView = FinanceView()
    
    var dataSource: UICollectionViewDiffableDataSource<SectionType, Int>!
    
    // MARK: - Life Cycle
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureDataSource()
        applySnapshot()
    }
}

extension FinanceViewController {
    
    // MARK: - Private Method
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<SectionType, Int>(collectionView: rootView.financeCollectionView) { collectionView, indexPath, item in
            switch SectionType(rawValue: indexPath.section) {
            case .banner:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCell.className, for: indexPath) as? BannerCell else { return UICollectionViewCell() }
                return cell
            default:
                break
            }
            return UICollectionViewCell()
        }
    }
    
    private func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<SectionType, Int>()
        snapshot.appendSections([.banner])
        snapshot.appendItems(Array(0..<4), toSection: .banner)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}
