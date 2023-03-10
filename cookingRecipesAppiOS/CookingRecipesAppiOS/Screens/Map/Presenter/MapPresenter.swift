//
//  MapPresenter.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 09/03/23.
//  
//

import Foundation

class MapPresenter  {
    
    // MARK: Properties
    weak var view: MapViewProtocol?
    var interactor: MapInteractorInputProtocol?
    var router: MapRouterProtocol?
    
}

extension MapPresenter: MapPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
}

extension MapPresenter: MapInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
