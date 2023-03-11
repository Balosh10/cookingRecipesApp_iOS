//
//  MapInteractor.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 09/03/23.
//  
//

import Foundation

class MapInteractor: MapInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: MapInteractorOutputProtocol?
    var localDatamanager: MapLocalDataManagerInputProtocol?
    var remoteDatamanager: MapRemoteDataManagerInputProtocol?
    var recipeDatailData: CollectionRecipesAvailable? 

}

extension MapInteractor: MapRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
