//
//  CollectionRecipesAvailable.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 09/03/23.
//

import Foundation
struct YPCollectionRecipesAvailable: Codable {
    let id: Int
    let imagen: String
    let name: String
    let genres: String
    let description: String
    let ingredients: [String]
    let qualification: String
    let deliveryTime: String
    let latitude: Double
    let longitude: Double
}
