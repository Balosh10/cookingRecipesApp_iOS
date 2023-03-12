//
//  NSMutableAttributedString+Extension.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 09/03/23.
//

import UIKit

extension NSMutableAttributedString {
    func boldText(_ value: String,
                  _ color: UIColor = UIColor.YPWhite100,
                  _ alignment: NSTextAlignment = .center,
                  _ size: YPSizeTitle = .smail,
                  _ background: UIColor = UIColor.clear) -> NSMutableAttributedString {
        var attributes: [NSAttributedString.Key: Any] = [:]
        attributes[.font] = YPFont.gothamMedium.size(size)
        attributes[.foregroundColor] = color
        attributes[.backgroundColor] = background
        self.append(NSAttributedString(string: value, attributes: attributes))
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 6
        paragraphStyle.alignment = alignment
        self.addAttribute(NSAttributedString.Key.paragraphStyle,
                          value: paragraphStyle,
                          range: NSRange(location: 0, length: self.length))
        return self
    }
    func normalText(_ value: String,
                    _ color: UIColor = UIColor.YPText100,
                    _ alignment: NSTextAlignment = .center,
                    _ size: YPSizeTitle = .medium,
                    isBold: Bool = false) -> NSMutableAttributedString {
        let font = isBold ? YPFont.gothamMedium.size(size) : YPFont.gothamBook.size(size)
        var attributes: [NSAttributedString.Key: Any] = [:]
        attributes[.font] = font
        attributes[.foregroundColor] = color
        self.append(NSAttributedString(string: value, attributes: attributes))
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 6
        paragraphStyle.alignment = alignment
        self.addAttribute(NSAttributedString.Key.paragraphStyle,
                          value: paragraphStyle,
                          range: NSRange(location: 0, length: self.length) )
        return self
    }
}
