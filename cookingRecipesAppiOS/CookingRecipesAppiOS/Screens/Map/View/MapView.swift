//
//  MapView.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 09/03/23.
//  
//

import Foundation
import UIKit
import MapKit
import CoreLocation

class MapView: UIViewController, CLLocationManagerDelegate {
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
    private var btnZoomPlus: UIButton = {
        var btnZoomPlus = UIButton()
        btnZoomPlus.translatesAutoresizingMaskIntoConstraints = false
        btnZoomPlus.backgroundColor = .clear
        let icPlus = UIImage(systemName: "plus")?.withTintColor(.CPWhite100,
                                                                  renderingMode: .alwaysOriginal)
        if let icon = icPlus {
            btnZoomPlus.setImage(icon, for: .normal)
        }
        return btnZoomPlus
    }()
    private var btnZoomRest: UIButton = {
        var btnZoomRest = UIButton()
        btnZoomRest.translatesAutoresizingMaskIntoConstraints = false
        btnZoomRest.backgroundColor = .clear
        let icMinus = UIImage(systemName: "minus")?.withTintColor(.CPWhite100,
                                                                  renderingMode: .alwaysOriginal)
        if let icon = icMinus {
            btnZoomRest.setImage(icon, for: .normal)
        }
        return btnZoomRest
    }()
    private lazy var stackView: UIStackView = {
        var stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 4
        stackView.axis = .vertical
        stackView.backgroundColor = UIColor.CPGray100
        stackView.viewShadow(isRadius: true)
        stackView.distribution = .fillEqually
        return stackView
    }()
    private lazy var btnBack: UIButton = {
        var btnBack = UIButton()
        let iconBack = UIImage(systemName: "arrow.backward")?.withTintColor(.CPWhite100, renderingMode: .alwaysOriginal)
        btnBack.setImage(iconBack, for: .normal)
        btnBack.radiusView(radius: 22, .CPPrincipal)
        btnBack.backgroundColor = .CPPrincipal.withAlphaComponent(0.7)
        btnBack.translatesAutoresizingMaskIntoConstraints = false
        return btnBack
    }()
    
    // MARK: Properties
    var presenter: MapPresenterProtocol?
    var locationManager: CLLocationManager?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension MapView: MapViewProtocol {
    func initUI() {
        mapView.delegate = self
        [btnBack, mapView, stackView].forEach({view.addSubview($0)})
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
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -44),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -26),
            stackView.heightAnchor.constraint(equalToConstant: 88),
            stackView.widthAnchor.constraint(equalToConstant: 30)
        ])
        btnBack.addTapGesture { [weak self] in
            self?.dismiss(animated: true)
        }
        stackView.addArrangedSubview(btnZoomPlus)
        stackView.addArrangedSubview(btnZoomRest)
        btnZoomPlus.addTapGesture { [weak self] in
            guard let self = self else { return }
            self.acZoomPlus()
        }
        btnZoomRest.addTapGesture { [weak self] in
            guard let self = self else { return }
            self.acZoomRest()
        }
    }
    func setupLocation() {
        loadInfoLocation()
        guard let location = locationManager?.location?.coordinate else {
            return
        }
        let locationRecipe = CLLocationCoordinate2D.init(latitude: 25.6536161,
                                                   longitude: -100.4295552)
        loadAddressMap(lat: location.latitude, long: location.longitude)
        var allAnotation: [MKAnnotation] = []
        allAnotation.append(YPMapPinStoresAnotations(title: "Demo",
                                                   rate: "5",
                                                   locationName: "nuevo",
                                                   coordinate: locationRecipe,
                                                   imageToPin: CPIcon.of(.icPoint)!))
        
        DispatchQueue.main.async {
            allAnotation.forEach {
                self.mapView.addAnnotation($0)
            }
        }
    }
    func acZoomPlus() {
        var region: MKCoordinateRegion = mapView.region
        region.span.latitudeDelta /= 2.0
        region.span.longitudeDelta /= 2.0
        mapView.setRegion(region, animated: true)
    }
    func acZoomRest() {
        var region: MKCoordinateRegion = mapView.region
        region.span.latitudeDelta = min(region.span.latitudeDelta * 2.0, 180.0)
        region.span.longitudeDelta = min(region.span.longitudeDelta * 2.0, 180.0)
        mapView.setRegion(region, animated: true)
    }
    func loadAddressMap(lat: Double, long: Double) {
        let region = CLLocationCoordinate2D.init(latitude: lat, longitude: long)
        let mRegion = MKCoordinateRegion(center: region, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(mRegion, animated: true)
    }
    func loadInfoLocation() {
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.distanceFilter = kCLDistanceFilterNone
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.startUpdatingLocation()
    }
}
extension MapView: MKMapViewDelegate, MKLocalSearchCompleterDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        var circleRenderer = MKCircleRenderer()
        if let overlay = overlay as? MKCircle {
            circleRenderer = MKCircleRenderer(circle: overlay)
            circleRenderer.fillColor = .CPPrincipal
            circleRenderer.strokeColor = .CPSecundary
            circleRenderer.alpha = 0.5
        }
        return circleRenderer
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            let pin = mapView.view(for: annotation) ?? MKAnnotationView(annotation: annotation, reuseIdentifier: nil)
            pin.image = CPIcon.of(.icPoint)!
            return pin
        } else {
            if let annotation = annotation as? YPCustomAnnotationView {
                let view = MKAnnotationView(annotation: annotation as? MKAnnotation, reuseIdentifier: annotation.identifier)
                view.isEnabled = true
                view.canShowCallout = true
                let btn = UIButton(type: .detailDisclosure)
                view.rightCalloutAccessoryView = btn
            }
        }
        return nil
    }
}
