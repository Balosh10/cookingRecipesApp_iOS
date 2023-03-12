//
//  MapProtocols.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 09/03/23.
//  
//

import UIKit

protocol YPMapViewProtocol: AnyObject {
    var presenter: YPMapPresenterProtocol? { get set }
    func initUI()
    func currentUploadLocation()
    func placeOfOriginOfTheRecipe(_ data: YPMapPinStoresAnotations)
}

protocol YPMapRouterProtocol: AnyObject {
    static func createMapModule(_ recipeDatailData: YPCollectionRecipesAvailable) -> UIViewController
}

protocol YPMapPresenterProtocol: AnyObject {
    var view: YPMapViewProtocol? { get set }
    var interactor: YPMapInteractorInputProtocol? { get set }
    var router: YPMapRouterProtocol? { get set }
    func viewDidLoad()
}

protocol YPMapInteractorOutputProtocol: AnyObject {
    func placeOfOriginOfTheRecipe(_ data: YPMapPinStoresAnotations)
}

protocol YPMapInteractorInputProtocol: AnyObject {
    var presenter: YPMapInteractorOutputProtocol? { get set }
    var recipeDatailData: YPCollectionRecipesAvailable? { get set }
    func getPlaceOfOriginOfTheRecipe()
}

protocol YPLocationProtocol: AnyObject {
    func setupLocation()
}
