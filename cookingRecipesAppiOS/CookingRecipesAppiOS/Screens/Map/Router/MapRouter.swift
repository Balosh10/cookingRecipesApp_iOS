//
//  MapRouter.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 09/03/23.
//  
//

import Foundation
import UIKit

class MapRouter: MapRouterProtocol {

    class func createMapModule() -> UIViewController {
        let view: MapViewProtocol = MapView()
        let presenter: MapPresenterProtocol & MapInteractorOutputProtocol = MapPresenter()
        let interactor: MapInteractorInputProtocol & MapRemoteDataManagerOutputProtocol = MapInteractor()
        let localDataManager: MapLocalDataManagerInputProtocol = MapLocalDataManager()
        let remoteDataManager: MapRemoteDataManagerInputProtocol = MapRemoteDataManager()
        let router: MapRouterProtocol = MapRouter()
        
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
        return UIStoryboard(name: "MapView", bundle: Bundle.main)
    }
    
}
