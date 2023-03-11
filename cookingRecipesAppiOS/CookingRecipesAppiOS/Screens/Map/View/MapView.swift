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

class MapView: UIViewController {
    var mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.isUserInteractionEnabled = true
        mapView.isRotateEnabled = true
        mapView.showsUserLocation = true
        mapView.mapType = .standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        mapView.register(CustomAnnotationView.self,
                         forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        return mapView
    }()
    private var btnZoomPlus: UIButton = {
        var btnZoomPlus = UIButton()
        btnZoomPlus.translatesAutoresizingMaskIntoConstraints = false
        btnZoomPlus.backgroundColor = .clear
        btnZoomPlus.setImage(UIImage(systemName: "plus")?.withTintColor(.CPWhite100, renderingMode: .alwaysOriginal) ?? UIImage(), for: .normal)
        return btnZoomPlus
    }()
    private var btnZoomRest: UIButton = {
        var btnZoomRest = UIButton()
        btnZoomRest.translatesAutoresizingMaskIntoConstraints = false
        btnZoomRest.backgroundColor = .clear
        btnZoomRest.setImage(UIImage(systemName: "minus")?.withTintColor(.CPWhite100, renderingMode: .alwaysOriginal) ?? UIImage(), for: .normal)
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
    
    // MARK: Properties
    var presenter: MapPresenterProtocol?
    var locationManager: CLLocationManager?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        [mapView, stackView].forEach({view.addSubview($0)})
        view.sendSubviewToBack(mapView)
        NSLayoutConstraint.activate([
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -44),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -26),
            stackView.heightAnchor.constraint(equalToConstant: 88),
            stackView.widthAnchor.constraint(equalToConstant: 30)
        ])
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
        loadInfoLocation()
        guard let location = locationManager?.location?.coordinate else {
            return
        }
        loadAddressMap(lat: 25.6536161, long: -100.4295552)

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
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.startUpdatingLocation()
    }
}

extension MapView: MapViewProtocol {

}
extension MapView: MKMapViewDelegate, CLLocationManagerDelegate {

}


class MapPinStoresAnotations: NSObject, MKAnnotation {
    var identifier = "locations"
    let title: String?
    let rate: String
    let locationName: String
    let coordinate: CLLocationCoordinate2D
    let image: UIImage?
    let idCat: Int?
    let strNameCat: String?
    let icon: String?
    init(title: String, rate:String, locationName: String, coordinate: CLLocationCoordinate2D, imageToPin:UIImage, idCatego: Int, strNameCat: String, icon: String? = nil) {
        self.title = title
        self.rate = rate
        self.locationName = locationName
        self.coordinate = coordinate
        self.image = imageToPin
        self.idCat = idCatego
        self.strNameCat = strNameCat
        self.icon = icon
    }
}
class CustomAnnotationView: MKMarkerAnnotationView {
    var identifier = "CustomAnnotationView"
    var dCalif: Double?
    static let glyphImages: UIImage = {
        let rect = CGRect(origin: .zero, size: CGSize(width: 40, height: 40))
        return UIGraphicsImageRenderer(bounds: rect).image { _ in
            let radius: CGFloat = 11
            let offset: CGFloat = 7
            let insetY: CGFloat = 5
            let center = CGPoint(x: rect.midX, y: rect.maxY - radius - insetY)
            let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0, endAngle: .pi, clockwise: true)
            path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.minY + insetY), controlPoint: CGPoint(x: rect.midX - radius, y: center.y - offset))
            path.addQuadCurve(to: CGPoint(x: rect.midX + radius, y: center.y), controlPoint: CGPoint(x: rect.midX + radius, y: center.y - offset))
            path.close()
            UIColor.clear.setFill()
            path.fill()
        }
    }()
    func drawImageWithProfilePic(pp: UIImage, image: UIImage) -> UIImage {
        let imgView = UIImageView(image: image)
        let picImgView = UIImageView(image: pp)
        picImgView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        imgView.addSubview(picImgView)
        picImgView.center.x = imgView.center.x
        picImgView.center.y = imgView.center.y - 7
        picImgView.layer.cornerRadius = picImgView.frame.width/2
        picImgView.clipsToBounds = true
        imgView.setNeedsLayout()
        picImgView.setNeedsLayout()
        let newImage = imageWithView(view: imgView)
        return newImage
    }

    func imageWithView(view: UIView) -> UIImage {
        var image: UIImage?
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, 0.0)
        if let context = UIGraphicsGetCurrentContext() {
            view.layer.render(in: context)
            image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
        }
        return image ?? UIImage()
    }
    //var imageBase:UIImage = UIImage(gsMyNamed: "iconStore") ?? UIImage()
    override var annotation: MKAnnotation? {
        didSet { configure(for: annotation) }
    }

    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
       // glyphImage = Self.glyphImage
        markerTintColor = UIColor.red
        self.bounds.size = CGSize(width: 40, height: 80)
        image = CPIcon.of(.icClose) ?? UIImage()
        configure(for: annotation)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(for annotation: MKAnnotation?) {
        displayPriority = .required
        if let obj = annotation as? MapPinStoresAnotations {
            markerTintColor = UIColor.blue
            if let icon = obj.icon {
                self.glyphImage = PinImage(named: icon)
            } else if Double(obj.rate) == 4 {
                self.glyphText = obj.rate
            } else {
                self.glyphImage = CPIcon.of(.icPoint)!
            }
        } else {
            self.glyphImage = CPIcon.of(.icDelevery)!
        }
    }
}

class PinImage: UIImage {
    convenience init?(named name: String) {
        self.init(cgImage: CPIcon.of(.icPoint)!.cgImage!)
    }
    override func withRenderingMode(_ renderingMode: UIImage.RenderingMode) -> UIImage {
        return self
    }
}
