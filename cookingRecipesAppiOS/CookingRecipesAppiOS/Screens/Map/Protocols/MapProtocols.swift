//
//  MapProtocols.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 09/03/23.
//  
//

import Foundation
import UIKit

protocol MapViewProtocol: AnyObject {
    var presenter: MapPresenterProtocol? { get set }
}

protocol MapRouterProtocol: AnyObject {
    static func createMapModule(_ recipeDatailData: CollectionRecipesAvailable) -> UIViewController
}

protocol MapPresenterProtocol: AnyObject {
    var view: MapViewProtocol? { get set }
    var interactor: MapInteractorInputProtocol? { get set }
    var router: MapRouterProtocol? { get set }
    func viewDidLoad()
}

protocol MapInteractorOutputProtocol: AnyObject {
}

protocol MapInteractorInputProtocol: AnyObject {
    var presenter: MapInteractorOutputProtocol? { get set }
    var localDatamanager: MapLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: MapRemoteDataManagerInputProtocol? { get set }
    var recipeDatailData: CollectionRecipesAvailable? { get set }

}

protocol MapDataManagerInputProtocol: AnyObject {
}

protocol MapRemoteDataManagerInputProtocol: AnyObject {
    var remoteRequestHandler: MapRemoteDataManagerOutputProtocol? { get set }
}

protocol MapRemoteDataManagerOutputProtocol: AnyObject {
}

protocol MapLocalDataManagerInputProtocol: AnyObject {
}
