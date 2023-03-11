//
//  HomeLocalDataManager.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 09/03/23.
//  
//

import Foundation

class HomeLocalDataManager: HomeLocalDataManagerInputProtocol {
    var allRecipes: [CollectionRecipesAvailable]? = Bundle.main.decode([CollectionRecipesAvailable].self, from: "recipesAvailable.json")
    
}
