//
//  UISearchBar.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 09/03/23.
//

import UIKit

extension UISearchBar {
    func setBackgroundColor(withColor: UIColor) {
        if let view: UIView = self.subviews.first {
            for curr in view.subviews {
                guard let searchBarBackgroundClass = NSClassFromString("UISearchBarBackground") else {
                    return
                }
                if curr.isKind(of: searchBarBackgroundClass) {
                    if let imageView = curr as? UIImageView {
                        imageView.backgroundColor = withColor
                        break
                    }
                }
            }
        }
    }
    var textField: UITextField? {
        guard let text = self.value(forKey: "searchField") as? UITextField else {
            return nil
        }
        return text
    }
    func setTextField(color: UIColor) {
        guard let textField = textField else { return }
        switch searchBarStyle {
        case .minimal:
            textField.layer.backgroundColor = color.cgColor
            textField.layer.cornerRadius = 6
        case .prominent, .default: textField.backgroundColor = color
        @unknown default: break
        }
    }
    func style() {
        returnKeyType = .done
        enablesReturnKeyAutomatically = false
        setBackgroundColor(withColor: UIColor.CPRed100)
        tintColor = .white
        backgroundColor = UIColor.CPBase100
        showsBookmarkButton = true
        if let image = UIImage(systemName: "magnifyingglass") {
            setImage(image.withTintColor(.CPPrincipal,
                                         renderingMode: .alwaysOriginal),
                                         for: .bookmark,
                                         state: .normal)
        }
        searchBarStyle = .minimal
        barTintColor = .white
        if #available(iOS 13.0, *) {
            let textField = searchTextField
            textField.leftViewMode = .never
            textField.leftView = nil
            let attributes = [NSAttributedString.Key.foregroundColor: UIColor.CPText100]
            textField.defaultTextAttributes = attributes
            textField.layer.borderWidth = 0
            textField.layer.cornerRadius = 12
            textField.layer.borderColor = UIColor.clear.cgColor
            textField.backgroundColor = .CPBase200
            textField.tintColor = .CPText100
        } else {
            setImage(UIImage(), for: .search, state: .normal)
            setPositionAdjustment(UIOffset(horizontal: -20, vertical: 0), for: .search)
            setTextField(color: .CPBase200)
        }
    }
}
