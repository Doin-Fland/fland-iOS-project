//
//  UINavigationController+Extension.swift
//  Fland-iOS-Project
//
//  Created by 김우성 on 2022/11/20.
//

import UIKit

extension UINavigationController {

    // https://stackoverflow.com/questions/6131205/how-to-find-topmost-view-controller-on-ios
    func topMostViewController() -> UIViewController {
        return (self.navigationController?.topMostViewController())!
    }

    func setFileAppreance() {

        navigationBar.tintColor = .systemBlue

        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.configureWithDefaultBackground()

        standardAppearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.label]
        standardAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.label]
        standardAppearance.backgroundColor = .systemGray6
        navigationBar.standardAppearance = standardAppearance

        let scrollEdgeAppearance = UINavigationBarAppearance()
        scrollEdgeAppearance.configureWithDefaultBackground()

        scrollEdgeAppearance.backgroundColor = .systemBackground
        scrollEdgeAppearance.shadowColor = .clear
        scrollEdgeAppearance.shadowImage = UIImage()
        navigationBar.scrollEdgeAppearance = scrollEdgeAppearance
    }

    func setGroupeAppreance() {

        navigationBar.tintColor = .systemBlue

        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.configureWithDefaultBackground()

        standardAppearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.label]
        standardAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.label]
        standardAppearance.backgroundColor = .systemGray6
        navigationBar.standardAppearance = standardAppearance

        let scrollEdgeAppearance = UINavigationBarAppearance()
        scrollEdgeAppearance.configureWithDefaultBackground()

        scrollEdgeAppearance.backgroundColor = .systemGroupedBackground
        scrollEdgeAppearance.shadowColor = .clear
        scrollEdgeAppearance.shadowImage = UIImage()
        navigationBar.scrollEdgeAppearance = scrollEdgeAppearance
    }

    func setMediaAppreance() {

        setNavigationBarHidden(true, animated: false)
    }
}

