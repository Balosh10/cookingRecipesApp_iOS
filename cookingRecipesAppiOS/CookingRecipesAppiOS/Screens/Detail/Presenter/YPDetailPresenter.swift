//
//  DetailPresenter.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 09/03/23.
//  
//

import Foundation

class YPDetailPresenter {
    // MARK: Properties
    weak var view: YPDetailViewProtocol?
    var interactor: YPDetailInteractorInputProtocol?
    var router: YPDetailRouterProtocol?
}

extension YPDetailPresenter: YPDetailPresenterProtocol {
    func viewDidLoad() {
        view?.initUI()
        interactor?.getInfo()
    }
    func presentMapRecipe() {
        interactor?.getRecipeDetail()
    }
}

extension YPDetailPresenter: YPDetailInteractorOutputProtocol {
    func loadData(detail: YPCollectionRecipesAvailable, recommendedRecipes: [YPCollectionRecipesAvailable]) {
        view?.loadInfoRecipe(detail: detail,
                             recommendedRecipes: recommendedRecipes)
    }
    func presentMapRecipe(detail: YPCollectionRecipesAvailable) {
        router?.presentMapRecipe(from: view, recipeData: detail)
    }
}
