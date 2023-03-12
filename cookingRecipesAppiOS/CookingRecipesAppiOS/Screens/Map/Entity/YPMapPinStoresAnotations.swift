//
//  YPMapPinStoresAnotations.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 11/03/23.
//

import UIKit
import MapKit

class YPMapPinStoresAnotations: NSObject, MKAnnotation {
    var identifier = "locations"
    let title: String?
    let coordinate: CLLocationCoordinate2D
    init(title: String,
         coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    }
}
