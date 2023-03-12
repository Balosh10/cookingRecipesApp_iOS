//
//  YPCustomAnnotationView.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 11/03/23.
//

import UIKit
import MapKit

class YPCustomAnnotationView: MKMarkerAnnotationView {
    var identifier = "CustomAnnotationView"
    override var annotation: MKAnnotation? {
        didSet { configure(for: annotation) }
    }
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        markerTintColor = UIColor.YPRed100
        bounds.size = CGSize(width: 40, height: 80)
        configure(for: annotation)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(for annotation: MKAnnotation?) {
        displayPriority = .required
        markerTintColor = UIColor.YPPrincipal
        glyphImage = YPIcon.of(.icRecepe)
    }
}
