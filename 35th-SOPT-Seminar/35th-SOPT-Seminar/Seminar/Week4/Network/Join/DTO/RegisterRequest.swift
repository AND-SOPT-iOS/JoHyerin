//
//  RegisterRequest.swift
//  35th-SOPT-Seminar
//
//  Created by 조혜린 on 11/2/24.
//

import Foundation

struct RegisterRequest: Codable {
    let username: String
    let password: String
    let hobby: String
}
