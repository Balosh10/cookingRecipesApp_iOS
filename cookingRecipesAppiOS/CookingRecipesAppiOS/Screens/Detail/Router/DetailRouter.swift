//
//  DetailRouter.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 09/03/23.
//  
//

import Foundation
import UIKit

class DetailRouter: DetailRouterProtocol {

    class func createDetailModule(_ recipeDatailData: CollectionRecipesAvailable) -> UIViewController {
        let view: DetailViewProtocol = YPRecipeDetailView()
        let presenter: DetailPresenterProtocol & DetailInteractorOutputProtocol = DetailPresenter()
        let interactor: DetailInteractorInputProtocol = DetailInteractor()
        let router: DetailRouterProtocol = DetailRouter()
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.recipeDatailData = recipeDatailData
        guard let view = view as? UIViewController else { return UIViewController() }
        return view

    }
    func presentMapRecipe(from view: DetailViewProtocol?, recipeData: CollectionRecipesAvailable) {
        guard let newView = view as? YPRecipeDetailView else { return }
        let recipeDetail = MapRouter.createMapModule(recipeData)
        recipeDetail.modalPresentationStyle = .overFullScreen
        DispatchQueue.main.async {
            newView.present(recipeDetail, animated: true)
        }
    }
}
