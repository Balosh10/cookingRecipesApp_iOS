//
//  MapRouter.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 09/03/23.
//  
//

import Foundation
import UIKit

internal class YPMapRouter: YPMapRouterProtocol {
    class func createMapModule(_ recipeDatailData: YPCollectionRecipesAvailable) -> UIViewController {
        let view: YPMapViewProtocol = YPMapView()
        let presenter: YPMapPresenterProtocol & YPMapInteractorOutputProtocol = YPMapPresenter()
        let interactor: YPMapInteractorInputProtocol  = YPMapInteractor()
        let router: YPMapRouterProtocol = YPMapRouter()
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.recipeDatailData = recipeDatailData
        guard let view = view as? UIViewController else { return UIViewController() }
        return view

    }
}
