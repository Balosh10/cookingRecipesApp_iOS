//
//  RecipesAvailableCollectionViewCell.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 09/03/23.
//

import UIKit

class YPRecipesAvailableCollectionViewCell: UICollectionViewCell {
    private var recipeAvailableImage: YPRoundedImageView = {
        var recipeAvailableImage = YPRoundedImageView()
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
        lbTitle.textColor = UIColor.YPPrincipal
        lbTitle.font = YPFont.gothamMedium.size(.medium)
        return lbTitle
    }()
    private var viewContent: UIView = {
        var contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.viewShadow()
        contentView.backgroundColor = UIColor.YPBase200
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
        [recipeAvailableImage, lbTitle].forEach({viewContent.addSubview($0)})
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
            lbTitle.leadingAnchor.constraint(equalTo: viewContent.leadingAnchor, constant: 8),
            lbTitle.trailingAnchor.constraint(equalTo: viewContent.trailingAnchor),
            lbTitle.centerXAnchor.constraint(equalTo: viewContent.centerXAnchor, constant: -8),
            lbTitle.topAnchor.constraint(equalTo: recipeAvailableImage.bottomAnchor, constant: 8),
            lbTitle.bottomAnchor.constraint(equalTo: viewContent.bottomAnchor, constant: -8)
        ])
    }
    func loadView(item: YPCollectionRecipesAvailable) {
        let rect = CGRect(x: 0, y: 0, width: contentView.frame.width, height: 150)
        recipeAvailableImage.setTopCornerRadius(rect: rect)
        let name = item.name.lowercased().capitalizingFirstLetter()
        lbTitle.attributedText = NSMutableAttributedString().boldText(name, .YPText100, .left)
        if let image = YPIcon.of(YPImagen.init(rawValue: item.imagen) ?? .defaultPlaceholder) {
            recipeAvailableImage.image = image
        }
    }
}
