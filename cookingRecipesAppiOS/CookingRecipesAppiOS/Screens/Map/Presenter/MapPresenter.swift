//
//  MapPresenter.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 09/03/23.
//  
//

import Foundation

class MapPresenter {
    weak var view: MapViewProtocol?
    var interactor: MapInteractorInputProtocol?
    var router: MapRouterProtocol?
    
}

extension MapPresenter: MapPresenterProtocol {
    func viewDidLoad() {
        view?.initUI()
        view?.setupLocation()
    }
}

extension MapPresenter: MapInteractorOutputProtocol {
    
}
