//
//  UIViewController+Extension.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 10/03/23.
//

import Foundation
import UIKit

@nonobjc extension UIViewController {
    func statusBarView(color: UIColor = UIColor.CPPrincipal) {
        if #available(iOS 13.0, *) {
            let keyWindow = UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .map({$0 as? UIWindowScene})
                .compactMap({$0})
                .first?.windows
                .filter({$0.isKeyWindow}).first
            if keyWindow != nil {
                let statusBar = UIView(frame: (keyWindow?.windowScene?.statusBarManager?.statusBarFrame)!)
                statusBar.backgroundColor = color
                keyWindow?.addSubview(statusBar)
            }
        } else {
            let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView
            if let statusBar = statusBar {
                statusBar.backgroundColor = color
            }
        }
    }
}
