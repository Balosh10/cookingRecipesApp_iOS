//
//  UIColorExtension.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 09/03/23.
//

import UIKit

extension UIColor {
    static var YPPrincipal: UIColor {
        return .getColorWith(hex: YPColorType.principal.rawValue)
    }
    static var YPSecundary: UIColor {
        return .getColorWith(hex: YPColorType.secundary.rawValue)
    }
    static var YPText100: UIColor {
        return .getColorWith(hex: YPColorType.text100.rawValue)
    }
    static var YPWhite100: UIColor {
        return .getColorWith(hex: YPColorType.white100.rawValue)
    }
    static var YPBase100: UIColor {
        return .getColorWith(hex: YPColorType.base100.rawValue)
    }
    static var YPBase200: UIColor {
        return .getColorWith(hex: YPColorType.base200.rawValue)
    }
    static var YPRed100: UIColor {
        return .getColorWith(hex: YPColorType.red100.rawValue)
    }
    static var YPGray100: UIColor {
        return .getColorWith(hex: YPColorType.gray100.rawValue)
    }
    static var YPBlue100: UIColor {
        return .getColorWith(hex: YPColorType.blue100.rawValue)
    }
    static var YPPurple100: UIColor {
        return .getColorWith(hex: YPColorType.purple100.rawValue)
    }
    static var YPYellow100: UIColor {
        return .getColorWith(hex: YPColorType.yellow100.rawValue)
    }
}
extension UIColor {
    static func getColorWith(hex: String, alpha: CGFloat = 1.0) -> UIColor {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }
        if (cString.count) != 6 {
            return UIColor.gray
        }
        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha)
    }
}
