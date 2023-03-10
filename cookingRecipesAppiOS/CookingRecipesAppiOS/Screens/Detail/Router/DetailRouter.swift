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

    class func createDetailModule() -> UIViewController {
        let view: DetailViewProtocol = DetailView()
        let presenter: DetailPresenterProtocol & DetailInteractorOutputProtocol = DetailPresenter()
        let interactor: DetailInteractorInputProtocol & DetailRemoteDataManagerOutputProtocol = DetailInteractor()
        let localDataManager: DetailLocalDataManagerInputProtocol = DetailLocalDataManager()
        let remoteDataManager: DetailRemoteDataManagerInputProtocol = DetailRemoteDataManager()
        let router: DetailRouterProtocol = DetailRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.localDatamanager = localDataManager
        interactor.remoteDatamanager = remoteDataManager
        remoteDataManager.remoteRequestHandler = interactor
        
        guard let view = view as? UIViewController else { return UIViewController() }
        return view

    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "DetailView", bundle: Bundle.main)
    }
    
}
