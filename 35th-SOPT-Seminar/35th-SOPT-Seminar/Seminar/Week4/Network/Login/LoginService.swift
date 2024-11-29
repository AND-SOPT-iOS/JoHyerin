//
//  LoginService.swift
//  35th-SOPT-Seminar
//
//  Created by 조혜린 on 11/2/24.
//

import Foundation

import Alamofire

final class LoginService {
    func register(
        username: String,
        password: String,
        completion: @escaping (Result<Bool, NetworkError>) -> Void
    ) {
        
        let url = Environment.baseURL + "/login"
        let parameters = LoginRequestDTO(username: username, password: password)
        
        AF.request(
            url,
            method: .post,
            parameters: parameters,
            encoder: JSONParameterEncoder.default
        )
        .validate()
        .response { [weak self] response in
            guard let statusCode = response.response?.statusCode,
                  let data = response.data,
                  let self
            else {
                completion(.failure(.unknownError))
                return
            }
            
            switch response.result {
            case .success:
                completion(.success(true))
            case .failure:
                let error = self.handleStatusCode(statusCode, data: data)
                completion(.failure(error))
            }
        }
    }
    
    /// 서버의 명세서 기반으로 에러 처리를 진행해줌
    func handleStatusCode(
        _ statusCode: Int,
        data: Data
    ) -> NetworkError {
        let errorCode = decodeError(data: data)
        switch (statusCode, errorCode) {
        case (400, "01"):
            return .decodingError
        case (400, "02"):
            return .invalidRequest
        case (403, "01"):
            return .passwordError
        case (404, "00"):
            return .invalidURL
        case (500, ""):
            return .serverError
        default:
            return .unknownError
        }
    }
    
    func decodeError(data: Data) -> String {
        guard let errorResponse = try? JSONDecoder().decode(
            ErrorResponse.self,
            from: data
        ) else { return "" }
        return errorResponse.code
    }
}
