//
//  DetailPresenter.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 09/03/23.
//  
//

import Foundation

class DetailPresenter {
    // MARK: Properties
    weak var view: DetailViewProtocol?
    var interactor: DetailInteractorInputProtocol?
    var router: DetailRouterProtocol?
}

extension DetailPresenter: DetailPresenterProtocol {
    func viewDidLoad() {
        view?.initUI()
        interactor?.getInfo()
    }
    func presentMapRecipe() {
        interactor?.getRecipeDetail()
    }
}

extension DetailPresenter: DetailInteractorOutputProtocol {
    func loadData(detail: CollectionRecipesAvailable, recommendedRecipes: [CollectionRecipesAvailable]) {
        view?.loadInfoRecipe(detail: detail,
                             recommendedRecipes: recommendedRecipes)
    }
    func presentMapRecipe(detail: CollectionRecipesAvailable) {
        router?.presentMapRecipe(from: view, recipeData: detail)
    }
}
