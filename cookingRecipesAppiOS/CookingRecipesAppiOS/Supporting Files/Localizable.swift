//
//  Localizable.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 10/03/23.
//

import Foundation

protocol LocalizableDelegate {
    var rawValue: String { get }
    var table: String? { get }
    var localized: String { get }
}

extension LocalizableDelegate {
    var localized: String {
        return Bundle.main.localizedString(forKey: rawValue, value: nil, table: table)
    }
    var table: String? {
        return nil
    }
}

enum Localizable {
    enum HomeView: String, LocalizableDelegate {
        case searchPlaceholder
        case recipesAvailable
    }
    enum RecipeDetail: String, LocalizableDelegate {
        case ingredients
        case recommendedRecipes
        case hour
        case minute
        case dealerDelevery
    }
    enum MapRecipe: String, LocalizableDelegate {
        case profile
        case favoriteShows
    }
    static func text(_ description: HomeView) -> String {
        return description.localized
    }
    static func text(_ description: RecipeDetail) -> String {
        return description.localized
    }
    static func text(_ description: MapRecipe) -> String {
        return description.localized
    }
}
