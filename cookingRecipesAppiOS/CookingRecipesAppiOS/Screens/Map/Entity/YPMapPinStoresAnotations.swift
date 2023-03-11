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
    let rate: String
    let locationName: String
    let coordinate: CLLocationCoordinate2D
    let image: UIImage?
    init(title: String,
         rate: String,
         locationName: String,
         coordinate: CLLocationCoordinate2D,
         imageToPin: UIImage) {
        self.title = title
        self.rate = rate
        self.locationName = locationName
        self.coordinate = coordinate
        self.image = imageToPin
    }
}
