//
//  DetailRouter.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 09/03/23.
//  
//

import Foundation
import UIKit

class YPDetailRouter: YPDetailRouterProtocol {

    class func createDetailModule(_ recipeDatailData: YPCollectionRecipesAvailable) -> UIViewController {
        let view: YPDetailViewProtocol = YPRecipeDetailView()
        let presenter: YPDetailPresenterProtocol & YPDetailInteractorOutputProtocol = YPDetailPresenter()
        let interactor: YPDetailInteractorInputProtocol = YPDetailInteractor()
        let router: YPDetailRouterProtocol = YPDetailRouter()
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.recipeDatailData = recipeDatailData
        guard let view = view as? UIViewController else { return UIViewController() }
        return view

    }
    func presentMapRecipe(from view: YPDetailViewProtocol?, recipeData: YPCollectionRecipesAvailable) {
        guard let newView = view as? YPRecipeDetailView else { return }
        let recipeDetail = YPMapRouter.createMapModule(recipeData)
        recipeDetail.modalPresentationStyle = .overFullScreen
        DispatchQueue.main.async {
            newView.present(recipeDetail, animated: true)
        }
    }
}
