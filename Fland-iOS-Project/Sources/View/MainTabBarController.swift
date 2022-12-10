//
//  MainTabBarController.swift
//  Fland-iOS-Project
//
//  Created by 김우성 on 2022/12/10.
//

import UIKit

class MainTabBarController: UITabBarController {
    let logoImageItem: UIBarButtonItem = {
        let imageView = UIImageView(image: UIImage(named: "grey_logo"))
        return UIBarButtonItem(customView: imageView)
    }()
    var alarmItem: UIBarButtonItem!
    var settingItem: UIBarButtonItem!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAction()
        setupTabBarItems()
        setupNavigation()
        setupTabBar()
    }
    
    private func setupTabBarItems() {
        let homeViewController = HomeViewController()
        let homeTabBarItem = UITabBarItem(
            title: "홈",
            image: homeImage,
            selectedImage: homeImage
        )
        homeViewController.tabBarItem = homeTabBarItem
        
        let statisticViewController = StatisticViewController()
        let statisticTabBarItem = UITabBarItem(
            title: "통계",
            image: statisticImage,
            selectedImage: statisticImage
        )
        statisticViewController.tabBarItem = statisticTabBarItem
        
        let communityViewController = CommunityViewController()
        let communityTabBarItem = UITabBarItem(
            title: "커뮤니티",
            image: communityImage,
            selectedImage: communityImage
        )
        communityViewController.tabBarItem = communityTabBarItem
        
        let moreViewController = MoreViewController()
        let moreTabBarItem = UITabBarItem(
            title: "더보기",
            image: moreImage,
            selectedImage: moreImage
        )
        moreViewController.tabBarItem = moreTabBarItem
        
        self.viewControllers = [
            homeViewController,
            statisticViewController,
            communityViewController,
            moreViewController
        ]
    }
    
    @objc
    func alarmButtonDidTap() {
        print("알림버튼 tap...")
    }
    
    @objc
    func settingButtonDidTap() {
        print("설정버튼 tap...")
    }
    
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
    
    private func setupTabBar() {
        self.tabBar.isTranslucent = false
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            
            //바꾸고 싶은 색으로 backgroundColor를 설정
            UITabBar.appearance().backgroundColor = UIColor.white
        }
    }
}

extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        // do something...
    }
}
