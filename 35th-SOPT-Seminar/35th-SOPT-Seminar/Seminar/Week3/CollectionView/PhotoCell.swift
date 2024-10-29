//
//  PhotoCell.swift
//  35th-SOPT-Seminar
//
//  Created by 조혜린 on 10/26/24.
//

import UIKit

import SnapKit

class PhotoCell: UICollectionViewCell {
    
    static let identifier = "PhotoCell"
    
    private var isLiked = Bool()
    
    private lazy var photoImageView = UIImageView()
    private lazy var likeButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStyle()
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStyle() {
        likeButton.do {
            $0.tintColor = .red

        }
    }
    
    private func setupHierarchy() {
        addSubviews(photoImageView, likeButton)
    }
    
    private func setupLayout() {
        photoImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        likeButton.snp.makeConstraints {
            $0.trailing.bottom.equalToSuperview().inset(8)
            $0.size.equalTo(20)
        }
    }
    
    func configureCell(data: Photo) {
        photoImageView.image = data.imege
        let likeImage = data.isLiked ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
        likeButton.setImage(likeImage, for: .normal)
    }
}
