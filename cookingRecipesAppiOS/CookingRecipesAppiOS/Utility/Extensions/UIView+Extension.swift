//
//  UIView+Extension.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 09/03/23.
//

import UIKit

extension UIView {
    func radiusView(radius: CGFloat = 10.0, _ backgroundColor: UIColor = .CPWhite100) {
        layer.cornerRadius = radius
        clipsToBounds = true
        self.backgroundColor = backgroundColor
    }
    func viewShadow(isRadius: Bool = true) {
        layer.masksToBounds = false
        layer.cornerRadius = isRadius ? 8 :0
        layer.borderWidth = isRadius ? 0.1 : 0.3
        layer.borderColor = UIColor.gray.withAlphaComponent(0.7).cgColor
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 2.0
    }
    func addTapGesture(action: @escaping () -> Void) {
        let tap = MyTapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tap.action = action
        tap.numberOfTapsRequired = 1
        addGestureRecognizer(tap)
        isUserInteractionEnabled = true
    }
    @objc func handleTap(_ sender: MyTapGestureRecognizer) {
        sender.action!()
    }
}
