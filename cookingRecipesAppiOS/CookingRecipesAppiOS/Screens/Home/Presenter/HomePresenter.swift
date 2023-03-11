//
//  HomePresenter.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 09/03/23.
//  
//

import Foundation

class HomePresenter {
    // MARK: Properties
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var router: HomeRouterProtocol?
}

extension HomePresenter: HomePresenterProtocol {
    func viewDidLoad() {
        view?.initUI()
        interactor?.loadData()
    }
    func searchRecipe(text: String? = nil) {
        interactor?.searchRecipe(text: text)
    }
    func fetchRecipeDetail(_ item: CollectionRecipesAvailable) {
        router?.presentRecipeDetail(from: view, recipeData: item)
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    func loadData(recipesAvailable: [CollectionRecipesAvailable]) {
        view?.loadData(recipesAvailable: recipesAvailable)
    }
}
