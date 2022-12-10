//
//  NotificationImage.swift
//  Fland-iOS-Project
//
//  Created by 김우성 on 2022/12/10.
//

import UIKit

let notificationImage: UIImageView = {
    let image = UIImage(named: "notification")
    let imageView = UIImageView(image: image)
    imageView.contentMode = .scaleAspectFit
    return imageView
}()
