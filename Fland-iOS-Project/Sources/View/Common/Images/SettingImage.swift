//
//  SettingImage.swift
//  Fland-iOS-Project
//
//  Created by 김우성 on 2022/12/10.
//

import UIKit

let settingImage: UIImage = {
    let image = UIImage(named: "setting")
    return image ?? UIImage()
}()

let settingImageView: UIImageView = {
    let imageView = UIImageView(image: settingImage)
    imageView.contentMode = .scaleAspectFit
    return imageView
}()


