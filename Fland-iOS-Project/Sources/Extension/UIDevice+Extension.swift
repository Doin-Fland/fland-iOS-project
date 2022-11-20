//
//  UIDevice+Extension.swift
//  Fland-iOS-Project
//
//  Created by 김우성 on 2022/11/20.
//

import UIKit

extension UIDevice {
    
    var hasNotch: Bool {
        if #available(iOS 11.0, *) {
            if UIApplication.shared.windows.isEmpty { return false }
            let top = UIApplication.shared.windows[0].safeAreaInsets.top
            return top > 20
        } else {
            // Fallback on earlier versions
            return false
        }
    }
}

