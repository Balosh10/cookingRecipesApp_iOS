//
//  UIToolbar+Extension.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 09/03/23.
//

import Foundation
import UIKit
extension UIToolbar {
    func setBackgroundColor(image: UIImage) {
        setBackgroundImage(image, forToolbarPosition: .any, barMetrics: .default)
    }
}

