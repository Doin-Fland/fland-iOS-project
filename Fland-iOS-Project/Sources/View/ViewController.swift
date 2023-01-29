//
//  ViewController.swift
//  Fland-iOS-Project
//
//  Created by 김우성 on 2022/11/13.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    let model = JoinModel()
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchJoin()
    }
    
    func fetchJoin() {
        let userInfo = JoinRequest(
            userEmail: "123",
            userPassword: "!234Qwer"
        )

        
        Observable<String>.just("userInfo")
            .map { _ -> URL in
                return URL(string: "https://flandforyou.com/api/v1/users/join")!
            }
            .map { url -> URLRequest in
                var request = URLRequest(url: url)
                let data = try! JSONEncoder().encode(userInfo)
                request.httpMethod = "POST"
                request.httpBody = data
                return request
            }
            .flatMap { request -> Observable<(response: HTTPURLResponse, data: Data)> in
                return URLSession.shared.rx.response(request: request)
            }
            .filter { response, _ in
                return 200..<300 ~= response.statusCode
            }
            .map { _, data -> JoinResponse in
                guard let response = try? JSONDecoder().decode(JoinResponse.self, from: data) else {
                    return JoinResponse()
                }
                return response
            }
            .subscribe(
                onNext: { print("DEBUG: ", $0) }
            )
            .disposed(by: disposeBag)
    }
}

