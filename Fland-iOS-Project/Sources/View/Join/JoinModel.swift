//
//  JoinModel.swift
//  Fland-iOS-Project
//
//  Created by 김우성 on 2023/01/28.
//

import Foundation
import RxSwift
import RxCocoa

struct JoinModel {
    let network = JoinNetwork()
    
    func joinUser(_ userInfo: JoinRequest) -> Single<Result<JoinResponse, JoinNetworkError>> {
        return network.join(userInfo)
    }
    
    func getJoinUserResponse(_ result: Result<JoinResponse, JoinNetworkError>) -> JoinResponse? {
        guard case .success(let value) = result else {
            return nil
        }
        return value
    }
    
    func getJoinError(_ result: Result<JoinResponse, JoinNetworkError>) -> String? {
        guard case .failure(let error) = result else {
            return nil
        }
        return error.message
    }
}
