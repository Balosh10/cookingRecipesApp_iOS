//
//  HomeInteractor.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 09/03/23.
//  
//

import Foundation

class HomeInteractor: HomeInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: HomeInteractorOutputProtocol?
    var localDatamanager: HomeLocalDataManagerInputProtocol?
    
    func loadData() {
        searchRecipe()
    }
    func searchRecipe(text: String? = nil) {
        guard let allRecipes = localDatamanager?.allRecipes else { return }
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
