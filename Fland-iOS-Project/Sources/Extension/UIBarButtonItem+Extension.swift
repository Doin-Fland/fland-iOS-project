//
//  UIBarButtonItem+Extension.swift
//  Fland-iOS-Project
//
//  Created by 김우성 on 2022/11/20.
//

import UIKit

private var actionKey: Void?

extension UIBarButtonItem {
    // https://stackoverflow.com/a/36983811/9506784
    private var _action: () -> Void {
        get {
            return objc_getAssociatedObject(self, &actionKey) as? () -> Void ?? { }
        }
        set {
            objc_setAssociatedObject(self, &actionKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    convenience init(title: String?, style: UIBarButtonItem.Style, action: @escaping () -> Void) {
        self.init(title: title, style: style, target: nil, action: #selector(pressed))
        self.target = self
        self._action = action
    }

    convenience init(image: UIImage?, style: UIBarButtonItem.Style, action: @escaping () -> Void) {
        self.init(image: image, style: style, target: nil, action: #selector(pressed))
        self.target = self
        self._action = action
    }

    @objc private func pressed(sender: UIBarButtonItem) {
        _action()
    }
}

