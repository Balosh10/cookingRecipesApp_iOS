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
    var recipeDatailData: CollectionRecipesAvailable?

}
