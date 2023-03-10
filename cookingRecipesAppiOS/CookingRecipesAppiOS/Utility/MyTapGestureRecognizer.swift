//
//  MyTapGestureRecognizer.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 09/03/23.
//

import UIKit

class MyTapGestureRecognizer: UITapGestureRecognizer {
    var action: (() -> Void)?
}
