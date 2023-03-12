//
//  Font.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 09/03/23.
//

import UIKit

internal enum YPSizeTitle: CGFloat {
    case smail = 12.0
    case medium = 14.0
    case large = 16.0
    case title = 22.0
}

internal enum YPFont: String {
    case gothamMedium = "GothamMedium"
    case gothamBold = "GothamBold"
    case gothamBook = "GothamBook"
    case gothamLight = "GothamLight"
    func size(_ sizeTitle: YPSizeTitle = .smail) -> UIFont {
        guard let font = UIFont(name: self.rawValue, size: sizeTitle.rawValue) else {
            return  UIFont.systemFont(ofSize: 12)
        }
        return font
    }
}
