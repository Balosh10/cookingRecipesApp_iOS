//
//  Localizable.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 10/03/23.
//

import Foundation

enum Localizable {
    enum HomeView: String {
        case searchPlaceholder
        case recipesAvailable
    }
    enum RecipeDetail: String {
        case ingredients
        case recommendedRecipes
        case hour
        case minute
        case dealerDelevery
    }
    enum MapRecipe: String {
        case profile
        case favoriteShows
    }
    static func text(_ description: HomeView) -> String {
        return NSLocalizedString(description.rawValue, comment: "")
    }
    static func text(_ description: RecipeDetail) -> String {
        return NSLocalizedString(description.rawValue, comment: "")
    }
    static func text(_ description: MapRecipe) -> String {
        return NSLocalizedString(description.rawValue, comment: "")
    }
}
