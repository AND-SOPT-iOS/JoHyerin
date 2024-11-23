//
//  LoginResponseDTO.swift
//  35th-SOPT-Seminar
//
//  Created by 조혜린 on 11/2/24.
//

import Foundation

struct LoginResponseDTO: Codable {
    let result: TokenData
}

struct TokenData: Codable {
    let token: String
}
