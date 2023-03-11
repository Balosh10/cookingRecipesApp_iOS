//
//  DetailInteractor.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 09/03/23.
//  
//

import Foundation

class DetailInteractor: DetailInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: DetailInteractorOutputProtocol?
    var recipeDatailData: CollectionRecipesAvailable?
    let recommendedRecipes: [CollectionRecipesAvailable] = Bundle.main.decode([CollectionRecipesAvailable].self,
                                                                              from: "recipesAvailable.json")
    func getInfo() {
        guard let data = recipeDatailData else { return }
        presenter?.loadData(detail: data, recommendedRecipes: recommendedRecipes)
    }
    func getRecipeDetail() {
        guard let data = recipeDatailData else { return }
        presenter?.presentMapRecipe(detail: data)
    }
}
