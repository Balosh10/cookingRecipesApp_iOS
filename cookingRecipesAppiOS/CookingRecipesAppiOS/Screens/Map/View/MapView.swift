//
//  MapView.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 09/03/23.
//  
//

import Foundation
import UIKit

class MapView: UIViewController {

    // MARK: Properties
    var presenter: MapPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MapView: MapViewProtocol {
    // TODO: implement view output methods
}
