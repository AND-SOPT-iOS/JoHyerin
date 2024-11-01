//
//  DiffableDataSourcePractice.swift
//  35th-SOPT-Seminar
//
//  Created by 조혜린 on 11/1/24.
//

import UIKit

import SnapKit

enum MySection: Int {
    case first
    case second
}

final class DiffableDataSourcePractice: UIViewController {
    
    //MARK: - Properties
    
    var dataSource: UICollectionViewDiffableDataSource<MySection, Int>!
    
    //MARK: - UI Properties
    
    private lazy var collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionalLayout())
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupStyle()
        setupHierarchy()
        setupLayout()
        
        configureDataSource()
        applySnapshot()
    }
}

extension DiffableDataSourcePractice {
    
    // MARK: - Layout
    
    private func setupStyle() {
        collectionView.do {
            $0.backgroundColor = .white
            $0.register(FirstPracticeCell.self, forCellWithReuseIdentifier: FirstPracticeCell.identifier)
            $0.register(SecondPracticeCell.self, forCellWithReuseIdentifier: SecondPracticeCell.identifier)
        }
    }
    
    private func setupHierarchy() {
        view.addSubview(collectionView)
    }
    
    private func setupLayout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Private Func
    
    // layout
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionIndex, environment) -> NSCollectionLayoutSection? in
            
            let layoutSection: NSCollectionLayoutSection
            switch sectionIndex {
            case 0:
                layoutSection = self.createFirstSection()
            default:
                layoutSection = self.createSecondSection()
            }
            return layoutSection
        }
    }
    
    // first section
    private func createFirstSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(100))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        return NSCollectionLayoutSection(group: group)
    }
    
    // second section
    private func createSecondSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(150))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        return NSCollectionLayoutSection(group: group)
    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<MySection, Int>(collectionView: collectionView) { collectionView, indexPath, item in
            switch MySection(rawValue: indexPath.section) {
            case .first:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FirstPracticeCell.identifier, for: indexPath) as? FirstPracticeCell else { return UICollectionViewCell() }
                return cell
            case .second:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SecondPracticeCell.identifier, for: indexPath) as? SecondPracticeCell else { return UICollectionViewCell() }
                return cell
            default:
                break
            }
            return UICollectionViewCell()
        }
    }
    
    private func applySnapshot() {
        // 데이터 추가
        var snapshot = NSDiffableDataSourceSnapshot<MySection, Int>()
        snapshot.appendSections([.first, .second])
        snapshot.appendItems(Array(0..<3), toSection: .first)
        snapshot.appendItems(Array(3..<9), toSection: .second)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}
