//
//  HomeRouter.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 09/03/23.
//  
//

import Foundation
import UIKit

class HomeRouter: HomeRouterProtocol {

    class func createHomeModule() -> UIViewController {
        let view: HomeViewProtocol = HomeView()
        let presenter: HomePresenterProtocol & HomeInteractorOutputProtocol = HomePresenter()
        let interactor: HomeInteractorInputProtocol = HomeInteractor()
        let localDataManager: HomeLocalDataManagerInputProtocol = HomeLocalDataManager()
        let router: HomeRouterProtocol = HomeRouter()
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.localDatamanager = localDataManager
        guard let view = view as? UIViewController else { return UIViewController() }
        return view
    }
    func presentRecipeDetail(from view: HomeViewProtocol?, recipeData: CollectionRecipesAvailable) {
        guard let newView = view as? HomeView else { return }
        let recipeDetail = DetailRouter.createDetailModule(recipeData)
        recipeDetail.modalPresentationStyle = .overFullScreen
        DispatchQueue.main.async {
            newView.present(recipeDetail, animated: true)
        }
    }
}
