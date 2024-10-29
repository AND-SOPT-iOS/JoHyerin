//
//  Photo.swift
//  35th-SOPT-Seminar
//
//  Created by 조혜린 on 10/26/24.
//

import UIKit

struct Photo {
    let imege: UIImage
    let isLiked: Bool
}

extension Photo {
    static let samplePhotos: [Photo] = [
        Photo(imege: UIImage(systemName: "book")!, isLiked: false),
        Photo(imege: UIImage(systemName: "book")!, isLiked: false),
        Photo(imege: UIImage(systemName: "book")!, isLiked: false),
        Photo(imege: UIImage(systemName: "book")!, isLiked: false),
        Photo(imege: UIImage(systemName: "book")!, isLiked: false),
        Photo(imege: UIImage(systemName: "book")!, isLiked: false),
        Photo(imege: UIImage(systemName: "book")!, isLiked: false),
        Photo(imege: UIImage(systemName: "book")!, isLiked: false),
        Photo(imege: UIImage(systemName: "book")!, isLiked: false),
        Photo(imege: UIImage(systemName: "book")!, isLiked: false)
    ]
}
