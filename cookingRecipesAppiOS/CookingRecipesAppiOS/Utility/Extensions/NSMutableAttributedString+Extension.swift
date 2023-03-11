//
//  NSMutableAttributedString+Extension.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 09/03/23.
//

import UIKit

extension NSMutableAttributedString {
    func boldText(_ value: String,
                  _ color: UIColor = UIColor.CPWhite100,
                  _ alignment: NSTextAlignment = .center,
                  _ size: CPSizeTitle = .smail,
                  _ background: UIColor = UIColor.clear) -> NSMutableAttributedString {
        
        var attributes:[NSAttributedString.Key: Any] = [:]
        attributes[.font] = CPFont.gothamMedium.size(size)
        attributes[.foregroundColor] = color
        attributes[.backgroundColor] = background
        self.append(NSAttributedString(string: value, attributes: attributes))
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 6
        paragraphStyle.alignment = alignment
        self.addAttribute(NSAttributedString.Key.paragraphStyle,
                          value: paragraphStyle,
                          range: NSMakeRange(0, self.length))
        return self
    }
    func normalText(_ value: String,
                    _ color: UIColor = UIColor.CPText100,
                    _ alignment: NSTextAlignment = .center,
                    _ size: CPSizeTitle = .medium,
                    isBold: Bool = false) -> NSMutableAttributedString {
        let font = isBold ? CPFont.gothamMedium.size(size) : CPFont.gothamBook.size(size)
        var attributes: [NSAttributedString.Key : Any] = [:]
        attributes[.font] = font
        attributes[.foregroundColor] = color
        self.append(NSAttributedString(string: value, attributes: attributes))
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 6
        paragraphStyle.alignment = alignment
        self.addAttribute(NSAttributedString.Key.paragraphStyle,
                          value: paragraphStyle,
                          range: NSMakeRange(0, self.length))
        return self
    }
}
