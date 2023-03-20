//
//  ConerRadius+Shadow+UIViewExtension.swift
//  Fland-iOS-Project
//
//  Created by 김우성 on 2023/03/20.
//

import UIKit

extension UIView {
    func addCornerRadiusShadow(
        cornerRadius: CGFloat = 15,
        shadowRadius: Float = 7,
        shadowOpacity: Float = 0.6,
        shadowOffSet: CGSize = CGSize(width: 0, height: 5),
        shadowColor: CGColor = UIColor.black.cgColor
    ) {
        self.layer.cornerRadius = 15
        self.clipsToBounds = true
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 7
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowOffset = shadowOffSet
        self.layer.shadowColor = shadowColor
    }
    
    
    func addDefaultShadow(opacity: Float = 0.3, radius: CGFloat = 7) {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = radius
    }
    
    func addCornerRadius(cornerRadius: CGFloat = 8, maskToBounds: Bool = true) {
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = maskToBounds  // optional
    }
}
