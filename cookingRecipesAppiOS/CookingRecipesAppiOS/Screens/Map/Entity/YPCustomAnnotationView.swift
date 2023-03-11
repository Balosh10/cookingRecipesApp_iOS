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
        markerTintColor = UIColor.CPSecundary
       
        
        self.bounds.size = CGSize(width: 40, height: 80)
        image = CPIcon.of(.icPoint) ?? UIImage()
        configure(for: annotation)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(for annotation: MKAnnotation?) {
        displayPriority = .required
        if let obj = annotation as? YPMapPinStoresAnotations {
            markerTintColor = UIColor.CPSecundary
            glyphImage = CPIcon.of(.icPoint)!
        } else {
            self.glyphImage =  CPIcon.of(.icPoint)!
        }
    }
    
}
