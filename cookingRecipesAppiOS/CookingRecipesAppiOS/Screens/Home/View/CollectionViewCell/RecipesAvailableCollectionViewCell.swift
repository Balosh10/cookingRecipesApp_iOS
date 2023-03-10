//
//  RecipesAvailableCollectionViewCell.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 09/03/23.
//

import UIKit

class RecipesAvailableCollectionViewCell: UICollectionViewCell {
    private var recipeAvailableImage: RoundedImageView = {
        var recipeAvailableImage = RoundedImageView()
        recipeAvailableImage.contentMode = .scaleToFill
        recipeAvailableImage.backgroundColor = .clear
        recipeAvailableImage.translatesAutoresizingMaskIntoConstraints = false
        recipeAvailableImage.radiusView()
        return recipeAvailableImage
    }()
    private var lbTitle: UILabel = {
        var lbTitle = UILabel()
        lbTitle.translatesAutoresizingMaskIntoConstraints = false
        lbTitle.numberOfLines = 0
        lbTitle.textColor = UIColor.CPPrincipal
        lbTitle.font = CPFont.gothamMedium.size(.medium)
        return lbTitle
    }()
    private var dataView: UIView = {
        var dataView = UIView()
        dataView.translatesAutoresizingMaskIntoConstraints = false
        dataView.backgroundColor = .clear
        return dataView
    }()
    private var viewContent: UIView = {
        var contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.viewShadow()
        contentView.backgroundColor = UIColor.CPBase200
        return contentView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupViews() {
        backgroundColor = UIColor.clear
        contentView.addSubview(viewContent)
        [recipeAvailableImage, dataView].forEach({viewContent.addSubview($0)})
        dataView.addSubview(lbTitle)
        NSLayoutConstraint.activate([
            viewContent.leadingAnchor.constraint(equalTo: leadingAnchor),
            viewContent.trailingAnchor.constraint(equalTo: trailingAnchor),
            viewContent.centerXAnchor.constraint(equalTo: centerXAnchor),
            viewContent.topAnchor.constraint(equalTo: topAnchor),
            viewContent.bottomAnchor.constraint(equalTo: bottomAnchor),
            recipeAvailableImage.leadingAnchor.constraint(equalTo: viewContent.leadingAnchor),
            recipeAvailableImage.trailingAnchor.constraint(equalTo: viewContent.trailingAnchor),
            recipeAvailableImage.centerXAnchor.constraint(equalTo: viewContent.centerXAnchor),
            recipeAvailableImage.topAnchor.constraint(equalTo: viewContent.topAnchor),
            recipeAvailableImage.heightAnchor.constraint(equalToConstant: 150),
            dataView.leadingAnchor.constraint(equalTo: viewContent.leadingAnchor),
            dataView.trailingAnchor.constraint(equalTo: viewContent.trailingAnchor),
            dataView.centerXAnchor.constraint(equalTo: viewContent.centerXAnchor),
            dataView.topAnchor.constraint(equalTo: recipeAvailableImage.bottomAnchor),
            dataView.bottomAnchor.constraint(equalTo: viewContent.bottomAnchor),
            lbTitle.leadingAnchor.constraint(equalTo: dataView.leadingAnchor, constant: 8),
            lbTitle.topAnchor.constraint(equalTo: dataView.topAnchor, constant: 8),
            lbTitle.trailingAnchor.constraint(equalTo: dataView.trailingAnchor, constant: -8),
            lbTitle.bottomAnchor.constraint(equalTo: dataView.bottomAnchor, constant: -8)
        ])
    }
    func loadView(item: CollectionRecipesAvailable) {
        recipeAvailableImage.setTopCornerRadius(rect: CGRect(x: 0,
                                                             y: 0,
                                                             width: contentView.frame.width,
                                                              height: 150))
        let name = item.name.lowercased().capitalizingFirstLetter()
        lbTitle.attributedText = NSMutableAttributedString().boldText(name, .CPText100, .left)
        guard let image = CPIcon.of(CpImagen.init(rawValue: item.imagen) ?? .defaultPlaceholder) else {
            return
        }
        recipeAvailableImage.image = image
    }
}
