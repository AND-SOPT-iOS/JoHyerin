//
//  CollectionViewPractice.swift
//  35th-SOPT-Seminar
//
//  Created by 조혜린 on 10/26/24.
//

import UIKit

import SnapKit

final class CollectionViewPractice: UIViewController {
    
    //MARK: - Properties
    
    let photoData = Photo.samplePhotos
    
    //MARK: - UI Properties
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupStyle()
        setupHierarchy()
        setupLayout()
    }
}

extension CollectionViewPractice {
    
    // MARK: - Layout
    
    private func setupStyle() {
        collectionView.do {
            let flowLayout = UICollectionViewFlowLayout()
            let itemSize = (UIScreen.main.bounds.width - 6) / 3
            flowLayout.itemSize = .init(width: itemSize, height: itemSize)
            flowLayout.minimumLineSpacing = 3
            flowLayout.minimumInteritemSpacing = 3
            
            $0.setCollectionViewLayout(flowLayout, animated: false)
            $0.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.identifier)
            $0.delegate = self
            $0.dataSource = self
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
}

extension CollectionViewPractice: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.identifier, for: indexPath) as? PhotoCell else { return UICollectionViewCell() }
        cell.configureCell(data: photoData[indexPath.row])
        return cell
    }
}
