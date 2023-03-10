//
//  CollectionRecipesAvailable.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 09/03/23.
//

import Foundation
struct CollectionRecipesAvailable: Codable {
    let id: Int
    let imagen: String
    let name: String
    let description: String
    let ingredients: [String]
}
