//
//  Icon.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 09/03/23.
//

import UIKit

enum CpImagen: String {
    case seaFoodSoup
    case soupMushroom
    case brandadeCod
    case potatoMayonnaise
    case defaultPlaceholder
    case icClose
    case icPoint
    case icDelevery
}

struct CPIcon {
    static func of(_ name: CpImagen) -> UIImage? {
        return UIImage(named: name.rawValue)
    }
}
