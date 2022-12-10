//
//  UIApplication+Extension.swift
//  Fland-iOS-Project
//
//  Created by 김우성 on 2022/11/20.
//

import UIKit

extension UIApplication {
    // indicates if current device is in landscape orientation
    var isLandscape: Bool {
        if UIDevice.current.orientation.isValidInterfaceOrientation {
            return UIDevice.current.orientation.isLandscape
        } else  {
            return windows.first?.windowScene?.interfaceOrientation.isLandscape ?? false
        }
    }
}
