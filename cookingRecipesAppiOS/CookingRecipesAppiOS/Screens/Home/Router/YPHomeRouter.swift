//
//  HomeRouter.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 09/03/23.
//  
//

import Foundation
import UIKit

class YPHomeRouter: YPHomeRouterProtocol {

    class func createHomeModule() -> UIViewController {
        let view: YPHomeViewProtocol = YPHomeView()
        let presenter: YPHomePresenterProtocol & YPHomeInteractorOutputProtocol = YPHomePresenter()
        let interactor: YPHomeInteractorInputProtocol = YPHomeInteractor()
        let router: YPHomeRouterProtocol = YPHomeRouter()
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        guard let view = view as? UIViewController else { return UIViewController() }
        return view
    }
    func presentRecipeDetail(from view: YPHomeViewProtocol?, recipeData: YPCollectionRecipesAvailable) {
        guard let newView = view as? YPHomeView else { return }
        let recipeDetail = YPDetailRouter.createDetailModule(recipeData)
        recipeDetail.modalPresentationStyle = .overFullScreen
        DispatchQueue.main.async {
            newView.present(recipeDetail, animated: true)
        }
    }
}
