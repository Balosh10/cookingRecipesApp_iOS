//
//  MapView.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 09/03/23.
//  
//

import UIKit
import MapKit

class YPMapView: YPLocation {
    var mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.isUserInteractionEnabled = true
        mapView.isRotateEnabled = true
        mapView.showsUserLocation = true
        mapView.mapType = .standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.register(YPCustomAnnotationView.self,
                         forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        return mapView
    }()
    private lazy var btnBack: UIButton = {
        var btnBack = UIButton()
        let iconBack = UIImage(systemName: "arrow.backward")?.withTintColor(.YPWhite100, renderingMode: .alwaysOriginal)
        btnBack.setImage(iconBack, for: .normal)
        btnBack.radiusView(radius: 22, UIColor.YPPrincipal)
        btnBack.backgroundColor = .YPPrincipal.withAlphaComponent(0.8)
        btnBack.translatesAutoresizingMaskIntoConstraints = false
        return btnBack
    }()
    private lazy var mapPlusAndMinusView: YPMapPlusAndMinusView = {
        var mapPlusAndMinusView = YPMapPlusAndMinusView()
        mapPlusAndMinusView.translatesAutoresizingMaskIntoConstraints = false
        mapPlusAndMinusView.backgroundColor = .clear
        return mapPlusAndMinusView
    }()
    // MARK: Properties
    var presenter: YPMapPresenterProtocol?

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension YPMapView: YPMapViewProtocol {
    func initUI() {
        mapView.delegate = self
        mapPlusAndMinusView.delegate = self
        [btnBack, mapView, mapPlusAndMinusView].forEach({view.addSubview($0)})
        view.bringSubviewToFront(btnBack)
        view.sendSubviewToBack(mapView)
        NSLayoutConstraint.activate([
            btnBack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            btnBack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            btnBack.heightAnchor.constraint(equalToConstant: 44),
            btnBack.widthAnchor.constraint(equalToConstant: 44),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mapPlusAndMinusView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -44),
            mapPlusAndMinusView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -26),
            mapPlusAndMinusView.heightAnchor.constraint(equalToConstant: 88),
            mapPlusAndMinusView.widthAnchor.constraint(equalToConstant: 30)
        ])
        btnBack.addTapGesture { [weak self] in
            guard let self = self else {
                return
            }
            self.dismiss(animated: true)
        }
    }
    func currentUploadLocation() {
        #warning("load current location")
        /*guard let location = locationManager?.location?.coordinate else {
            return
        }
        let mRegion = MKCoordinateRegion(center: location, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(mRegion, animated: true)*/
    }
    func placeOfOriginOfTheRecipe(_ data: YPMapPinStoresAnotations) {
        mapView.addAnnotation(data)
        let mRegion = MKCoordinateRegion(center: data.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(mRegion, animated: true)
    }
}
extension YPMapView: MKMapViewDelegate, MKLocalSearchCompleterDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            let pin = mapView.view(for: annotation) ?? MKAnnotationView(annotation: annotation, reuseIdentifier: nil)
            pin.image = YPIcon.of(.icPin)
            return pin
        }
        return nil
    }
}
extension YPMapView: YPMapPlusAndMinusDelegate {
    func actionZoom() {
        var region: MKCoordinateRegion = mapView.region
        region.span.latitudeDelta /= 2.0
        region.span.longitudeDelta /= 2.0
        mapView.setRegion(region, animated: true)
    }
    func actionMinus() {
        var region: MKCoordinateRegion = mapView.region
        region.span.latitudeDelta = min(region.span.latitudeDelta * 2.0, 180.0)
        region.span.longitudeDelta = min(region.span.longitudeDelta * 2.0, 180.0)
        mapView.setRegion(region, animated: true)
    }
}
