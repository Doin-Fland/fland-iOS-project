//
//  JoinAPI.swift
//  Fland-iOS-Project
//
//  Created by 김우성 on 2023/01/28.
//

import RxSwift
import RxCocoa
import Foundation

struct JoinAPI {
    static let scheme = "https"
    static let host = "flandforyou.com"
    static let path = "/api/v1/user/join"
    
    func join(_ body: JoinRequest) -> URLComponents {
        var components = URLComponents()
        components.scheme = JoinAPI.scheme
        components.host = JoinAPI.host
        components.path = JoinAPI.path
    
        components.queryItems = [
            URLQueryItem(name: "userEmail", value: body.userEmail),
            URLQueryItem(name: "userPassword", value: body.userPassword)
        ]
        
        return components
    }
}

class JoinNetwork {
    private let session: URLSession
    let api = JoinAPI()
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    public func join(_ body: JoinRequest) -> Single<Result<JoinResponse, JoinNetworkError>> {
        guard let url = api.join(body).url else {
            return .just(.failure(.invalidURL))
        }
        
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return session.rx.data(request: request as URLRequest)
            .map { data in
                do {
                    let response = try JSONDecoder().decode(JoinResponse.self, from: data)
                    return .success(response)
                } catch {
                    return .failure(.invalidJSON)
                }
            }
            .catch { _ in
                .just(.failure(.networkError))
            }
            .asSingle()
    }
}
