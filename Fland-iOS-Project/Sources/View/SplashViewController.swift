//
//  SplashViewController.swift
//  Fland-iOS-Project
//
//  Created by 김우성 on 2022/11/20.
//

import UIKit
import SnapKit
import AuthenticationServices


//class AppleLoginService: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
//
//}

class SplashViewController: UIViewController {
    
    // MARK: - Properties
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "프랜드에 오신 것을\n환영합니다!"
        label.numberOfLines = 2
        label.font = UIFont.spoqa(26, .bold)
        return label
    }()
    
    let welcomeSubLabel: UILabel = {
        let label = UILabel()
        let text = "업무와 수입을 자유롭게 관리해보세요."
        label.text = text
        label.setTextWithLineHeight(text, .callout)
        
        // TODO: 컬러셋 변경 필요 Design System 에 맞게
        label.textColor = UIColor.Dark700()
        return label
    }()
    
    let appleLoginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle("Apple로 로그인", for: .normal)
        button.titleLabel?.setTextWithLineHeight("Apple로 로그인", .headline)
        return button
    }()
}

// MARK: - View Lifecycle
extension SplashViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupAction()
    }
}

// MARK: - Actions
extension SplashViewController {
    
    @objc func appleLoginButtonDidTap() {
        let tabBarController = MainTabBarController()
        let navigationController
        = UINavigationController(
            rootViewController: tabBarController
        )
        
        // TODO: Change Root View Controller
        self.view.window?.replaceRootViewControllerWith(
            navigationController,
            animated: true,
            completion: nil)
    }
}

// MARK: - Helpers
extension SplashViewController {
    
    func setupLayout() {
        view.backgroundColor = .white
        
        [
            logoImageView,
            handImageView,
            welcomeLabel,
            welcomeSubLabel,
            appleLoginButton
        ].forEach { view.addSubview($0)}
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(25)
            make.leading.equalTo(view.snp.leading).offset(20)
        }
        
        handImageView.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(55)
            make.leading.equalTo(logoImageView.snp.leading)
        }
        
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(handImageView.snp.bottom).offset(5)
            make.leading.equalTo(logoImageView.snp.leading)
        }
        
        welcomeSubLabel.snp.makeConstraints { make in
            make.top.equalTo(welcomeLabel.snp.bottom).offset(5)
            make.leading.equalTo(logoImageView.snp.leading)
        }
        
        appleLoginButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.snp.bottom).inset(34)
            make.centerX.equalTo(view.snp.centerX)
            make.leading.equalTo(view.snp.leading).offset(20)
            make.trailing.equalTo(view.snp.trailing).inset(20)
            make.height.equalTo(56)
        }
    }
    
    
    // 공식문서 코드
//    func setupProviderLoginView() {
//      let authorizationButton = ASAuthorizationAppleIDButton()
//      authorizationButton.addTarget(self, action: #selector(handleAuthorizationAppleIDButtonPress), for: .touchUpInside)
//      self.loginProviderStackView.addArrangedSubview(authorizationButton)
//    }
    
//    @objc
//    func handleAuthorizationAppleIDButtonPress() {
//      let appleIDProvider = ASAuthorizationAppleIDProvider()
//      let request = appleIDProvider.createRequest()
//      request.requestedScopes = [.fullName, .email]
//
//      let authorizationController = ASAuthorizationController(authorizationRequests: [request])
//      authorizationController.delegate = self
//      authorizationController.presentationContextProvider = self
//      authorizationController.performRequests()
//    }
    
    func setupAction() {
        self.appleLoginButton.addTarget(
            self,
            action: #selector(appleLoginButtonDidTap),
            for: .touchUpInside)
    }
}

