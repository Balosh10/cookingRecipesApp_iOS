//
//  HomePresenter.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 09/03/23.
//  
//

import Foundation

class YPHomePresenter {
    // MARK: Properties
    weak var view: YPHomeViewProtocol?
    var interactor: YPHomeInteractorInputProtocol?
    var router: YPHomeRouterProtocol?
}

extension YPHomePresenter: YPHomePresenterProtocol {
    func viewDidLoad() {
        view?.initUI()
        interactor?.loadData()
    }
    func searchRecipe(text: String? = nil) {
        interactor?.searchRecipe(text: text)
    }
    func fetchRecipeDetail(_ item: YPCollectionRecipesAvailable) {
        router?.presentRecipeDetail(from: view, recipeData: item)
    }
}

extension YPHomePresenter: YPHomeInteractorOutputProtocol {
    func loadData(recipesAvailable: [YPCollectionRecipesAvailable]) {
        view?.loadData(recipesAvailable: recipesAvailable)
    }
}
