//
//  UIDevice+Extension.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 09/03/23.
//

import UIKit
public extension UIDevice {
    class var isPhone: Bool {
        UIDevice.current.userInterfaceIdiom == .phone
    }
}

