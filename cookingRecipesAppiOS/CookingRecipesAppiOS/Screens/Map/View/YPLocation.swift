//
//  YPLocation.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 12/03/23.
//

import UIKit
import CoreLocation

class YPLocation: UIViewController, YPLocationProtocol, CLLocationManagerDelegate {
    var locationManager: CLLocationManager?

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLocation()
    }
    func setupLocation() {
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.distanceFilter = kCLDistanceFilterNone
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.startUpdatingLocation()
    }
}
