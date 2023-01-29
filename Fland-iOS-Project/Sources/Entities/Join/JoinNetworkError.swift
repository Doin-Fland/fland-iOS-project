//
//  JoinNetworkError.swift
//  Fland-iOS-Project
//
//  Created by 김우성 on 2023/01/28.
//

import Foundation

enum JoinNetworkError: Error {
    case invalidURL
    case invalidJSON
    case networkError
    
    var message: String {
        switch self {
        case .invalidURL, .invalidJSON:
            return "데이터를 불러올 수 없습니다."
        case .networkError:
            return "네트워크 상태를 확인해주세요."
        }
    }
}
