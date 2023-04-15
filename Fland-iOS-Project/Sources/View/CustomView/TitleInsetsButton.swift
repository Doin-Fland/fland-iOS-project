//
//  TitleInsetsButton.swift
//  Fland-iOS-Project
//
//  Created by MIN SEONG KIM on 2023/04/15.
//

import UIKit

class TitleInsetsButton: UIButton {
    
    // titleEdgeInsets에 따른 intrinsicContentSize 계산
    override var intrinsicContentSize: CGSize {
        let size = titleLabel?.sizeThatFits(CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)) ?? CGSize.zero
        let width = size.width + titleEdgeInsets.left + titleEdgeInsets.right
        let height = size.height + titleEdgeInsets.top + titleEdgeInsets.bottom
        return CGSize(width: width, height: height)
    }
    
    // layoutSubviews에서 버튼 크기 조절
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel?.sizeToFit()
        self.frame.size = intrinsicContentSize
    }
    
}
