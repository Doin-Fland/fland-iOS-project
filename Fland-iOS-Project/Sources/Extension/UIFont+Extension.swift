//
//  UIFont+Extension.swift
//  Fland-iOS-Project
//
//  Created by 김우성 on 2022/11/20.
//

import UIKit

extension UIFont {
    enum FontWeight: String {
        case bold    = "Bold"    // 700
        case medium  = "Medium"  // 500
        case regular = "Regular" // 400
        case light   = "Light"   // 300
        case thin    = "Thin"    // 100
    }
    
    static func spoqa(
        _ size: CGFloat = 11,
        _ weight: FontWeight = .regular
    ) -> UIFont {
        return UIFont(name: "SpoqaHanSansNeo-\(weight.rawValue)", size: size) ?? UIFont()
    }
    
    private func flandLargeTitle(
        _ weight: FontWeight = .regular
    ) -> UIFont {
        return UIFont.spoqa(32, weight)
    }
    
    private func flandTitle1(
        _ weight: FontWeight = .regular
    ) -> UIFont {
        return UIFont.spoqa(32, weight)
    }
}

enum FlandFont {
    case largeTitle
    case title1
    case title2
    case title3
    case headline
    case body
    case callout
    case subhead
    case footnote
    case caption
    
    
    var lineHeight: CGFloat {
        switch self {
        case .largeTitle:
            return 42
        case .title1:
            return 34
        case .title2:
            return 28
        case .title3:
            return 26
        case .headline:
            return 21
        case .body:
            return 21
        case .callout:
            return 20
        case .subhead:
            return 19
        case .footnote:
            return 16
        case .caption:
            return 15
        }
    }
    
    var size: CGFloat {
        switch self {
        case .largeTitle:
            return 32
        case .title1:
            return 26
        case .title2:
            return 20
        case .title3:
            return 18
        case .headline:
            return 15
        case .body:
            return 15
        case .callout:
            return 14
        case .subhead:
            return 13
        case .footnote:
            return 12
        case .caption:
            return 11
        }
    }
    
    var bold: UIFont.FontWeight {
        return .bold
    }
    
    var regular: UIFont.FontWeight {
        switch self {
        case .largeTitle, .title1, .title2, .title3, .body, .callout, .subhead, .footnote,
                .caption:
            return .regular
        case .headline:
            return .medium
        }
    }
}

extension UILabel {
    func setTextWithLineHeight(
        _ text: String?,
        _ flandFont: FlandFont = .title1,
        isBold: Bool = false
    ){
        let lineHeight = flandFont.lineHeight
        let size = flandFont.size
        let font = UIFont.spoqa(size, isBold ? flandFont.bold : flandFont.regular)
        
        if let text = text {
            let style = NSMutableParagraphStyle()
            style.maximumLineHeight = lineHeight
            style.minimumLineHeight = lineHeight
            
            let greenColor = UIColor(red: 10/255, green: 190/255, blue: 50/255, alpha: 1)
            let attributes: [NSAttributedString.Key: Any] = [
                .paragraphStyle: style,
                .baselineOffset: (lineHeight - font.lineHeight) / 4,
                .font: font,
                .foregroundColor: greenColor
            ]
            
            let attrString = NSAttributedString(string: text,
                                                attributes: attributes)
            self.attributedText = attrString
        }
    }
}


