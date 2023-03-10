//
//  UIColorExtension.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 09/03/23.
//

import UIKit

enum CPColorType: String {
    case principal = "#DC862A"
    case secundary = "#05771A"
    case text100 = "#272727"
    case text200 = "#9F9F9F"
    case white100 = "#FFFFFF"
    case base100 = "#F9F9F9"
    case base200 = "#FAFAFA"
    case red100 = "#D14722"
    case gray100 = "#C6C6C6"
    case gray200 = "#F7F7F7"
    case blue100 = "#09D6D3"
    case purple100 = "#7112BC"
    case yellow100 = "#D3B72F"
}

extension UIColor {
    static var CPPrincipal: UIColor {
        return .getColorWith(hex: CPColorType.principal.rawValue)
    }
    static var CPSecundary: UIColor {
        return .getColorWith(hex: CPColorType.secundary.rawValue)
    }
    static var CPText100: UIColor {
        return .getColorWith(hex: CPColorType.text100.rawValue)
    }
    static var CPText200: UIColor {
        return .getColorWith(hex: CPColorType.text200.rawValue)
    }
    static var CPWhite100: UIColor {
        return .getColorWith(hex: CPColorType.white100.rawValue)
    }
    static var CPBase100: UIColor {
        return .getColorWith(hex: CPColorType.base100.rawValue)
    }
    static var CPBase200: UIColor {
        return .getColorWith(hex: CPColorType.base200.rawValue)
    }
    static var CPRed100: UIColor {
        return .getColorWith(hex: CPColorType.red100.rawValue)
    }
    static var CPGray100: UIColor {
        return .getColorWith(hex: CPColorType.gray100.rawValue)
    }
    static var CPGray200: UIColor {
        return .getColorWith(hex: CPColorType.gray200.rawValue)
    }
    static var CPBlue100: UIColor {
        return .getColorWith(hex: CPColorType.blue100.rawValue)
    }
    static var CPPurple100: UIColor {
        return .getColorWith(hex: CPColorType.purple100.rawValue)
    }
    static var CPYellow100: UIColor {
        return .getColorWith(hex: CPColorType.yellow100.rawValue)
    }
}
extension UIColor {
    
    static func getColorWith(hex: String, alpha: CGFloat = 1.0) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }
        if (cString.count) != 6 {
            return UIColor.gray
        }
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha)
    }
    
}


