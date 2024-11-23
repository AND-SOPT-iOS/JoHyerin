//
//  Environment.swift
//  35th-SOPT-Seminar
//
//  Created by 조혜린 on 11/2/24.
//

import Foundation

enum Environment {
  static let baseURL: String = Bundle.main.infoDictionary?["BASE_URL"] as! String
}
