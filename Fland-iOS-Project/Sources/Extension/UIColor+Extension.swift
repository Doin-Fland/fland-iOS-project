//
//  UIColor+Extension.swift
//  Fland-iOS-Project
//
//  Created by 김우성 on 2022/11/20.
//

import UIKit.UIColor

class ColorSet {
    static let primary_600_main = UIColor(hex: "#FF5C00")
    static let grey_000 = UIColor(hex: "#FFFFFF")
    static let grey_100 = UIColor(hex: "#F9F9FB")
    static let grey_600 = UIColor(hex: "#ADADB3")
    static let grey_800 = UIColor(hex: "#636366")
    static let grey_1000 = UIColor(hex: "#3A3A3C")
}

// MARK: - System Alerts Colors
extension UIColor {
    var systemAlertRed: UIColor {
        return UIColor { (trait) -> UIColor in
            switch trait.userInterfaceStyle {
            case .dark:
                return UIColor(r: 250, g: 69, b: 58)
            default:
                return UIColor(r: 250, g: 59, b: 48)
            }
        }
    }
    
    var systemAlertOrange: UIColor {
        return UIColor { (trait) -> UIColor in
            switch trait.userInterfaceStyle {
            case .dark:
                return UIColor(r: 250, g: 160, b: 8)
            default:
                return UIColor(r: 250, g: 150, b: 0)
            }
        }
    }
    
    var systemAlertGreen: UIColor {
        return UIColor { (trait) -> UIColor in
            switch trait.userInterfaceStyle {
            case .dark:
                return UIColor(r: 53, g: 210, b: 88)
            default:
                return UIColor(r: 57, g: 200, b: 90)
            }
        }
    }
    
    var systemAlertBlue: UIColor {
        return UIColor { (trait) -> UIColor in
            switch trait.userInterfaceStyle {
            case .dark:
                return UIColor(r: 62, g: 130, b: 255)
            default:
                return UIColor(r: 60, g: 118, b: 255)
            }
        }
    }
    
}


// MARK: System Gray Colors
extension UIColor {
    
    static func Light600(_ opacity: Opacity = ._w100) -> UIColor {
        return UIColor(r: 174.0, g: 174.0, b: 174.0, a: opacity.rawValue)
    }
    
    static func Light500(_ opacity: Opacity = ._w100) -> UIColor {
        return UIColor(r: 199.0, g: 199.0, b: 204.0, a: opacity.rawValue)
    }
    
    static func Light400(_ opacity: Opacity = ._w100) -> UIColor {
        return UIColor(r: 209.0, g: 209.0, b: 215.0, a: opacity.rawValue)
    }
    
    static func Light300(_ opacity: Opacity = ._w100) -> UIColor {
        return UIColor(r: 229.0, g: 229.0, b: 234.0, a: opacity.rawValue)
    }
    
    static func Light200(_ opacity: Opacity = ._w100) -> UIColor {
        return UIColor(r: 242.0, g: 242.0, b: 247.0, a: opacity.rawValue)
    }
    
    static func Light100(_ opacity: Opacity = ._w100) -> UIColor {
        return UIColor(r: 242.0, g: 242.0, b: 247.0, a: opacity.rawValue)
    }
    
    static func Light0(_ opacity: Opacity = ._w100) -> UIColor {
        return UIColor(r: 255.0, g: 255.0, b: 255.0, a: opacity.rawValue)
    }
    
    static func Dark1200(_ opacity: Opacity = ._w100) -> UIColor {
        return UIColor(r: 28.0, g: 28.0, b: 30.0, a: opacity.rawValue)
    }
    
    static func Dark1100(_ opacity: Opacity = ._w100) -> UIColor {
        return UIColor(r: 44.0, g: 44.0, b: 46.0, a: opacity.rawValue)
    }
    
    static func Dark1000(_ opacity: Opacity = ._w100) -> UIColor {
        return UIColor(r: 58.0, g: 58.0, b: 60.0, a: opacity.rawValue)
    }
    
    static func Dark900(_ opacity: Opacity = ._w100) -> UIColor {
        return UIColor(r: 72.0, g: 73.0, b: 74.0, a: opacity.rawValue)
    }
    
    static func Dark800(_ opacity: Opacity = ._w100) -> UIColor {
        return UIColor(r: 99.0, g: 99.0, b: 102.0, a: opacity.rawValue)
    }
    
    static func Dark700(_ opacity: Opacity = ._w100) -> UIColor {
        return UIColor(r: 142.0, g: 142.0, b: 147.0, a: opacity.rawValue)
    }
}


// MARK: - Opacity
enum Opacity: CGFloat {
    case _w10 = 0.1
    case _w20 = 0.2
    case _w30 = 0.3
    case _w40 = 0.4
    case _w50 = 0.5
    case _w60 = 0.6
    case _w70 = 0.7
    case _w80 = 0.8
    case _w90 = 0.9
    case _w100 = 1.0
}


// MARK: - Helpers
extension UIColor {
    convenience init(r: CGFloat,g:CGFloat,b:CGFloat,a:CGFloat = 1) {
        self.init(
            red: r / 255.0,
            green: g / 255.0,
            blue: b / 255.0,
            alpha: a
        )
    }
}

extension UIColor {
    
    var hexString: String {
        
        let cgColorInRGB = cgColor.converted(to: CGColorSpace(name: CGColorSpace.sRGB)!, intent: .defaultIntent, options: nil)!
        let colorRef = cgColorInRGB.components
        let r = colorRef?[0] ?? 0
        let g = colorRef?[1] ?? 0
        let b = ((colorRef?.count ?? 0) > 2 ? colorRef?[2] : g) ?? 0
        let a = cgColor.alpha
        
        var color = String(
            format: "#%02lX%02lX%02lX",
            lroundf(Float(r * 255)),
            lroundf(Float(g * 255)),
            lroundf(Float(b * 255))
        )
        
        if a < 1 {
            color += String(format: "%02lX", lroundf(Float(a * 255)))
        }
        
        return color
    }
    
    @objc convenience init?(hex: String) {
        
        let r, g, b, a: CGFloat
        
        if hex.hasPrefix("#") {
            
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            let scanner = Scanner(string: hexColor)
            var hexNumber: UInt64 = 0
            
            if hexColor.count == 6 && scanner.scanHexInt64(&hexNumber) {
                
                r = CGFloat((hexNumber & 0xff0000) >> 16) / 255.0
                g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255.0
                b = CGFloat(hexNumber & 0x0000ff) / 255.0
                
                self.init(red: r, green: g, blue: b, alpha: 1)
                return
                
            } else if hexColor.count == 7 && scanner.scanHexInt64(&hexNumber) {
                
                r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                a = CGFloat(hexNumber & 0x000000ff) / 255
                
                self.init(red: r, green: g, blue: b, alpha: a)
                return
            }
        }
        
        return nil
    }
    
    @objc func lighter(by percentage: CGFloat = 30.0) -> UIColor? {
        return self.adjust(by: abs(percentage) )
    }
    
    @objc func darker(by percentage: CGFloat = 30.0) -> UIColor? {
        return self.adjust(by: -1 * abs(percentage) )
    }
    
    func adjust(by percentage: CGFloat = 30.0) -> UIColor? {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            return UIColor(red: min(red + percentage/100, 1.0),
                           green: min(green + percentage/100, 1.0),
                           blue: min(blue + percentage/100, 1.0),
                           alpha: alpha)
        } else {
            return nil
        }
    }
    
    @objc func isTooLight() -> Bool {
        
        var white: CGFloat = 0.0
        self.getWhite(&white, alpha: nil)
        if white == 1 { return true }
        
        guard let components = cgColor.components, components.count > 2 else {return false}
        let brightness = ((components[0] * 299) + (components[1] * 587) + (components[2] * 114)) / 1000
        return (brightness > 0.95)
    }
    
    @objc func isTooDark() -> Bool {
        
        var white: CGFloat = 0.0
        self.getWhite(&white, alpha: nil)
        if white == 0 { return true }
        
        guard let components = cgColor.components, components.count > 2 else {return false}
        let brightness = ((components[0] * 299) + (components[1] * 587) + (components[2] * 114)) / 1000
        return (brightness < 0.05)
    }
    
    func isLight(threshold: Float = 0.7) -> Bool {
        let originalCGColor = self.cgColor
        
        // Now we need to convert it to the RGB colorspace. UIColor.white / UIColor.black are greyscale and not RGB.
        // If you don't do this then you will crash when accessing components index 2 below when evaluating greyscale colors.
        let RGBCGColor = originalCGColor.converted(to: CGColorSpaceCreateDeviceRGB(), intent: .defaultIntent, options: nil)
        guard let components = RGBCGColor?.components else { return false }
        guard components.count >= 3 else { return false }
        
        let brightness = Float(((components[0] * 299) + (components[1] * 587) + (components[2] * 114)) / 1000)
        return (brightness > threshold)
    }
    
    func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
}


