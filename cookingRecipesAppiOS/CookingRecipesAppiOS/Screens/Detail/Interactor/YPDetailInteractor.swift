//
//  DetailInteractor.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 09/03/23.
//  
//

import Foundation

class YPDetailInteractor: YPDetailInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: YPDetailInteractorOutputProtocol?
    var recipeDatailData: YPCollectionRecipesAvailable?
    let recommendedRecipes: [YPCollectionRecipesAvailable] = Bundle.main.decode([YPCollectionRecipesAvailable].self,
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
