//
//  HomeInteractor.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 09/03/23.
//  
//

import Foundation

class YPHomeInteractor: YPHomeInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: YPHomeInteractorOutputProtocol?
    var allRecipes: [YPCollectionRecipesAvailable]?

    func loadData() {
        searchRecipe()
    }
    func searchRecipe(text: String? = nil) {
        allRecipes = Bundle.main.decode([YPCollectionRecipesAvailable].self, from: "recipesAvailable.json")
        guard let allRecipes = allRecipes else { return }
        let searchText = text?.replacingOccurrences(of: "\n", with: "")
        if let search = searchText?.lowercased(), !search.isEmpty {
            let resultFind = allRecipes.filter({ $0.name.lowercased().contains(search) ||
                                                 $0.ingredients.description.localizedLowercase.contains(search) })
            presenter?.loadData(recipesAvailable: resultFind)
        } else {
            presenter?.loadData(recipesAvailable: allRecipes)
        }
    }
}
