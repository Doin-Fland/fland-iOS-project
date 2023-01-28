//
//  MainViewController.swift
//  Fland-iOS-Project
//
//  Created by 김우성 on 2022/12/10.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    // MARK: - Properties
    let logoImageItem: UIBarButtonItem = {
        let imageView = UIImageView(image: UIImage(named: "grey_logo"))
        return UIBarButtonItem(customView: imageView)
    }()
    
    var alarmItem: UIBarButtonItem!
    var settingItem: UIBarButtonItem!
    
    // TODO: ContainerViewController 추가 할 것.
    let topContainer: UIView = {
        let view = UIView()
//        view.backgroundColor = .Light200()
        view.backgroundColor = .blue
        return view
    }()
    
    // TODO: ContainerViewController 추가 할 것.
    let bottomContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }()
}

// MARK: - View Lifecycle
extension HomeViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAction() // TODO: 호출 순서에 의해 달라지는 부분이므로 수정 필요
        setupNavigation()
        setupLayout()
    }
}

// MARK: - Actions
extension HomeViewController {
    @objc
    func alarmButtonDidTap() {
        print("알림버튼 tap...")
    }
    
    @objc
    func settingButtonDidTap() {
        print("설정버튼 tap...")
    }
}

// MARK: - Helpers
extension HomeViewController {
    
    private func setupNavigation() {
        //        let navigationBarAppearance = UINavigationBarAppearance()
        //        navigationBarAppearance.configureWithDefaultBackground()
        //        navigationBarAppearance.backgroundColor = .systemBlue
        //
        //        navigationItem.standardAppearance = navigationBarAppearance
        //        navigationItem.compactAppearance = navigationBarAppearance
        //        navigationItem.scrollEdgeAppearance = navigationBarAppearance
        //        self.navigationController!.navigationBar.barStyle = .black
        
        navigationItem.leftBarButtonItem = logoImageItem
        navigationItem.rightBarButtonItems = [
            alarmItem,
            settingItem
        ]
    }
    
    private func setupLayout() {
        view.backgroundColor = .Light200()
        
        [
            topContainer,
            bottomContainer
        ].forEach { view.addSubview($0) }

        bottomContainer.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.height.equalTo(393)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        topContainer.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(bottomContainer.snp.top)
        }
        
        setupChileViewControllers()
    }
    
    private func setupChileViewControllers() {
        let flandRoomViewController = FlandRoomViewController()
        let summaryViewController = SummaryViewController()
        [flandRoomViewController, summaryViewController]
            .forEach { self.addChild($0) }
        
        guard let flandRoomParanetView = flandRoomViewController.view else {
            return
        }
        
        guard let summaryParanetView = summaryViewController.view else {
            return
        }
        
        topContainer.addSubview(flandRoomParanetView)
        flandRoomParanetView.snp.makeConstraints { make in
            make.edges.equalTo(topContainer)
        }
        
        bottomContainer.addSubview(summaryParanetView)
        summaryParanetView.snp.makeConstraints { make in
            make.edges.equalTo(bottomContainer)
        }
        
        
        
    }
    
    private func setupAction() {
        let alarmButton  = {
            let button = UIBarButtonItem(
                image: UIImage(named: "notification"),
                style: .plain,
                action: alarmButtonDidTap
            )
            return button
        }()
        
        alarmItem = alarmButton
        
        let settingButtonItem: UIBarButtonItem = {
            return UIBarButtonItem(
                image: settingImage,
                style: .plain,
                action: settingButtonDidTap)
        }()
        settingItem = settingButtonItem
    }
}

