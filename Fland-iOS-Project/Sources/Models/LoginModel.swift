//
//  LoginModel.swift
//  Fland-iOS-Project
//
//  Created by 김우성 on 2023/02/27.
//

import Foundation
import RxSwift

struct LoginModel {
    // API 통신 객체
    let network = JoinNetwork()
    
    // Response 획득
    func login(email: String, password: String) -> Single<Result<JoinResponse, JoinNetworkError>> {
        return network
            .join(
                JoinRequest(
                    userEmail: email,
                    userPassword: password
                )
            )
    }
    
    // 성공 케이스
    func getLoginValue(_ result: Result<JoinResponse, JoinNetworkError>) -> JoinResponse? {
        guard case .success(let value) = result else {
            return nil
        }
        return value
    }
    
    // 실패 케이스
    func getLoginError(_ result: Result<JoinResponse, JoinNetworkError>) -> String? {
        guard case .failure(let error) = result else {
            return nil
        }
        return error.message
    }
}
