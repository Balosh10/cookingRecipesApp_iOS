//
//  MapPlusAndMinusView.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 11/03/23.
//

import UIKit

protocol YPMapPlusAndMinusDelegate: AnyObject {
    func actionZoom()
    func actionMinus()
}

internal class YPMapPlusAndMinusView: UIView {
    private var btnZoomPlus: UIButton = {
        var btnZoomPlus = UIButton()
        btnZoomPlus.translatesAutoresizingMaskIntoConstraints = false
        btnZoomPlus.backgroundColor = .clear
        let icPlus = UIImage(systemName: "plus")?.withTintColor(.YPWhite100,
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
        let icMinus = UIImage(systemName: "minus")?.withTintColor(.YPWhite100,
                                                                  renderingMode: .alwaysOriginal)
        if let icon = icMinus {
            btnZoomRest.setImage(icon, for: .normal)
        }
        return btnZoomRest
    }()
    private lazy var stackView: UIStackView = {
        var stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 2
        stackView.axis = .vertical
        stackView.backgroundColor = UIColor.YPGray100
        stackView.viewShadow(isRadius: true)
        stackView.distribution = .fillEqually
        return stackView
    }()
    weak var delegate: YPMapPlusAndMinusDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit() {
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        backgroundColor = .YPBase100
        stackView.addArrangedSubview(btnZoomPlus)
        stackView.addArrangedSubview(btnZoomRest)
        btnZoomPlus.addTapGesture { [weak self] in
            guard let self = self else { return }
            self.delegate?.actionZoom()
        }
        btnZoomRest.addTapGesture { [weak self] in
            guard let self = self else { return }
            self.delegate?.actionMinus()
        }
    }
}
