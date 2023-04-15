//
//  UIView+Extension.swift
//  Fland-iOS-Project
//
//  Created by MIN SEONG KIM on 2023/04/15.
//

import UIKit

extension UIView {
    func addShadow(color: UIColor, radius: CGFloat, offset: CGSize, opacity: Float) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
    }
}
