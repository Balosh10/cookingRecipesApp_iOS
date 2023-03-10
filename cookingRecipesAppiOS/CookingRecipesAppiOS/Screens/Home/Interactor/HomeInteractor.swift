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
    var remoteDatamanager: HomeRemoteDataManagerInputProtocol?
    let nacionalidades: [CollectionRecipesAvailable] = Bundle.main.decode([CollectionRecipesAvailable].self,
                                                                          from: "recipesAvailable.json")
    func loadData() {
        searchRecipe()
    }
    func searchRecipe(text: String? = nil) {
        let searchText = text?.replacingOccurrences(of: "\n", with: "")
        if let search = searchText?.lowercased(), !search.isEmpty {
            let resultFind = nacionalidades.filter({ $0.name.lowercased().contains(search) ||
                                                     $0.ingredients.contains(search) })
            presenter?.loadData(recipesAvailable: resultFind)
        } else {
            presenter?.loadData(recipesAvailable: nacionalidades)
        }
    }
}

extension HomeInteractor: HomeRemoteDataManagerOutputProtocol {
    
}
