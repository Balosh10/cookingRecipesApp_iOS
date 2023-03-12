//
//  Icon.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 09/03/23.
//

import UIKit

enum YPImagen: String {
    case seaFoodSoup
    case soupMushroom
    case brandadeCod
    case potatoMayonnaise
    case defaultPlaceholder
    case icClose
    case icPoint
    case icDelevery
    case icPin
    case icRecepe
    case tingaPollo
    case carneChile
    case alitasSalsa
    case tortaArroz
}

struct YPIcon {
    static func of(_ name: YPImagen) -> UIImage? {
        return UIImage(named: name.rawValue)
    }
}
