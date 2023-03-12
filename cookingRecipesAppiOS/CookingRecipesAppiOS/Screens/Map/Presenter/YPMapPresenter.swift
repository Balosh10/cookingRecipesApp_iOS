//
//  MapPresenter.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 09/03/23.
//  
//

import Foundation
import CoreLocation

class YPMapPresenter {
    weak var view: YPMapViewProtocol?
    var interactor: YPMapInteractorInputProtocol?
    var router: YPMapRouterProtocol?
}

extension YPMapPresenter: YPMapPresenterProtocol {
    func viewDidLoad() {
        view?.initUI()
        interactor?.getPlaceOfOriginOfTheRecipe()
        view?.currentUploadLocation()
    }
}

extension YPMapPresenter: YPMapInteractorOutputProtocol {
    func placeOfOriginOfTheRecipe(_ data: YPMapPinStoresAnotations) {
        view?.placeOfOriginOfTheRecipe(data)
    }
}
