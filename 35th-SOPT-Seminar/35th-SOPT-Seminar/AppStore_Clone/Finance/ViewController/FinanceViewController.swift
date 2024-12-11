//
//  FinanceViewController.swift
//  35th-SOPT-Seminar
//
//  Created by 조혜린 on 11/2/24.
//

import UIKit

import RxSwift
import RxCocoa

enum SectionType: Int {
    case banner
    case essential
}

final class FinanceViewController: UIViewController {
    
    //MARK: - Properties
    
    private let rootView = FinanceView()
    
    private let bannerData = BannerModel.mock()
    private var appData = BehaviorRelay<[AppModel]>(value: AppModel.mock())
    var dataSource: UICollectionViewDiffableDataSource<SectionType, UUID>!
    
    private let disposeBag = DisposeBag()
    
    // MARK: - Life Cycle
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDelegate()
        configureDataSource()
        applySnapshot()
        bindData()
    }
}

extension FinanceViewController {
    
    // MARK: - Private Method
    
    private func setupDelegate() {
        rootView.financeCollectionView.delegate = self
    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<SectionType, UUID>(collectionView: rootView.financeCollectionView) { collectionView, indexPath, item in
            switch SectionType(rawValue: indexPath.section) {
            case .banner:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCell.className, for: indexPath) as? BannerCell else { return UICollectionViewCell() }
                cell.configureCell(with: self.bannerData[indexPath.row])
                return cell
            case .essential:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppCell.className, for: indexPath) as? AppCell else { return UICollectionViewCell() }
                let app = self.appData.value[indexPath.row]
                cell.configureCell(with: app)
                
                if indexPath.row % 3 == 2 {
                    cell.isDeviderViewHidden(true)
                } else {
                    cell.isDeviderViewHidden(false)
                }
                
                cell.downloadButtonTapped
                    .subscribe(onNext: { [weak self] id in
                        self?.handleButtonTap(for: id)
                    })
                    .disposed(by: cell.disposeBag)
                
                return cell
            default:
                break
            }
            return UICollectionViewCell()
        }
        
        dataSource.supplementaryViewProvider = { collectionView, kind, indexPath in
            guard kind == UICollectionView.elementKindSectionHeader else { return nil }
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: AppHeaderView.className, for: indexPath) as? AppHeaderView
            return view
        }
    }
    
    private func applySnapshot() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            var snapshot = NSDiffableDataSourceSnapshot<SectionType, UUID>()
            snapshot.appendSections([.banner, .essential])
            snapshot.appendItems(self.bannerData.map { $0.id }, toSection: .banner)
            snapshot.appendItems(self.appData.value.map { $0.id }, toSection: .essential)
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }
    
    private func bindData() {
        appData
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] _ in
                self?.applySnapshot()
            })
            .disposed(by: disposeBag)
    }
    
    private func handleButtonTap(for id: UUID) {
        guard let index = appData.value.firstIndex(where: { $0.id == id }) else { return }
        var updatedData = appData.value
        updatedData[index].id = UUID()
        updatedData[index].downloadState = .installed
        appData.accept(updatedData)
    }
}

extension FinanceViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let selectedUUID = dataSource.itemIdentifier(for: indexPath) else { return }
        
        if let section = dataSource.snapshot().sectionIdentifier(containingItem: selectedUUID), section == .essential,
           let selectedItemIndex = appData.value.firstIndex(where: { $0.id == selectedUUID }) {
            
            let selectedItem = appData.value[selectedItemIndex]
            let appDetailViewController = AppDetailViewController(downloadState: selectedItem.downloadState)
            appDetailViewController.selectedItemIndex = selectedItemIndex
            appDetailViewController.appDataRelay = appData
            
            navigationController?.pushViewController(appDetailViewController, animated: true)
        }
    }
}
