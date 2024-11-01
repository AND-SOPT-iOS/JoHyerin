//
//  NSObject+.swift
//  35th-SOPT-Seminar
//
//  Created by 조혜린 on 11/2/24.
//

import Foundation

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}
