//
//  RoundedImageView.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 09/03/23.
//

import UIKit

@IBDesignable
class YPRoundedImageView: UIImageView {

    @IBInspectable var cornerRadius: CGFloat = 0.0 { didSet { setUpView() } }

    func setUpView() {
        self.clipsToBounds = true
        setTopCornerRadius(rect: self.bounds)
    }

    func setTopCornerRadius(rect: CGRect) {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: [.topLeft, .topRight],
                                cornerRadii: CGSize(width: cornerRadius,
                                                    height: cornerRadius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = rect
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
        self.layer.masksToBounds = true
    }
}
