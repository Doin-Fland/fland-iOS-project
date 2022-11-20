//
//  NotificationCenter+Extension.swift
//  Fland-iOS-Project
//
//  Created by 김우성 on 2022/11/20.
//

import UIKit

extension NotificationCenter {
    
    func postOnMainThread(name: String, object anObject: Any? = nil, userInfo aUserInfo: [AnyHashable: Any]? = nil, second: Double = 0) {
        DispatchQueue.main.asyncAfter(deadline: .now() + second) {
            NotificationCenter.default.post(name: Notification.Name(rawValue: name), object: anObject, userInfo: aUserInfo)
        }
    }
}

