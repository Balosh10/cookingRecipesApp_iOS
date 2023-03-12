//
//  MapInteractor.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 09/03/23.
//  
//

import UIKit
import CoreLocation

class YPMapInteractor: YPMapInteractorInputProtocol {
    // MARK: Properties
    weak var presenter: YPMapInteractorOutputProtocol?
    var recipeDatailData: YPCollectionRecipesAvailable?
    func getPlaceOfOriginOfTheRecipe() {
        guard let recipe = recipeDatailData else {
            return
        }
        let region = CLLocationCoordinate2D.init(latitude: recipe.latitude,
                                                 longitude: recipe.longitude)
        let data = YPMapPinStoresAnotations(title: recipe.name,
                                            coordinate: region)
        presenter?.placeOfOriginOfTheRecipe(data)
    }
}
