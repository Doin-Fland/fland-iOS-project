//
//  SplashViewController.swift
//  Fland-iOS-Project
//
//  Created by 김우성 on 2022/11/20.
//

import UIKit
import SnapKit

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
        label.text = "업무와 수입을 자유롭게 관리해보세요."
        label.font = UIFont.spoqa(14, .medium)
        return label
    }()
    
    let appleLoginButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.blue, for: .normal)
        button.setTitle("Apple로 로그인", for: .normal)
        button.titleLabel?.setTextWithLineHeight("Apple로 로그인")
        return button
    }()
}

// MARK: - View Lifecycle
extension SplashViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
}

// MARK: - Actions
extension SplashViewController {
    
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
}

