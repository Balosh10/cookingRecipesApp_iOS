//
//  YPRecipeImageView.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 10/03/23.
//

import UIKit
internal class YPRecipeInfoView: UIView {
    private var contentView: UIView = {
        var contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    private var imageRecipe: UIImageView = {
        var logo = UIImageView()
        logo.contentMode = .scaleToFill
        logo.translatesAutoresizingMaskIntoConstraints = false
        return logo
    }()
    private var infoView: UIView = {
        var infoView = UIView()
        infoView.translatesAutoresizingMaskIntoConstraints = false
        infoView.radiusView(radius: 16)
        infoView.backgroundColor = UIColor.YPPrincipal.withAlphaComponent(0.7)
        return infoView
    }()
    private var lbTitle: UILabel = {
        var lbTitle = UILabel()
        lbTitle.translatesAutoresizingMaskIntoConstraints = false
        lbTitle.numberOfLines = 0
        lbTitle.textColor = UIColor.YPWhite100
        lbTitle.font = YPFont.gothamMedium.size(.large)
        return lbTitle
    }()
    private var lbGenres: UILabel = {
        var lbGenres = UILabel()
        lbGenres.translatesAutoresizingMaskIntoConstraints = false
        lbGenres.numberOfLines = 0
        lbGenres.textColor = UIColor.YPWhite100
        lbGenres.font = YPFont.gothamMedium.size(.smail)
        lbGenres.radiusView(radius: 14, .YPBlue100)
        return lbGenres
    }()
    private var lbHours: UILabel = {
        var lbHours = UILabel()
        lbHours.translatesAutoresizingMaskIntoConstraints = false
        lbHours.numberOfLines = 0
        lbHours.textColor = UIColor.YPWhite100
        lbHours.font = YPFont.gothamMedium.size(.smail)
        lbHours.radiusView(radius: 14, .YPPurple100)
        return lbHours
    }()
    private var lbVoteAverage: UILabel = {
        var lbVoteAverage = UILabel()
        lbVoteAverage.translatesAutoresizingMaskIntoConstraints = false
        lbVoteAverage.numberOfLines = 0
        lbVoteAverage.textColor = UIColor.YPWhite100
        lbVoteAverage.font = YPFont.gothamMedium.size(.smail)
        lbVoteAverage.radiusView(radius: 14, .YPYellow100)
        return lbVoteAverage
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit() {
        addSubview(contentView)
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        backgroundColor = .YPBase100
        setupImageBackground()
        addInfoView()
    }
    func setupImageBackground() {
        contentView.addSubview(imageRecipe)
        contentView.sendSubviewToBack(imageRecipe)
        NSLayoutConstraint.activate([
            imageRecipe.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageRecipe.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageRecipe.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageRecipe.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    func addInfoView() {
        [lbTitle, lbGenres, lbHours, lbVoteAverage].forEach({ infoView.addSubview($0) })
        contentView.addSubview(infoView)
        contentView.insertSubview(infoView, at: 2)
        NSLayoutConstraint.activate([
            infoView.heightAnchor.constraint(equalToConstant: 120),
            infoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 22),
            infoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -22),
            infoView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            lbTitle.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 16),
            lbTitle.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 16),
            lbTitle.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -16),
            lbTitle.heightAnchor.constraint(equalToConstant: 44),
            lbGenres.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 16),
            lbGenres.topAnchor.constraint(equalTo: lbTitle.bottomAnchor, constant: 8),
            lbGenres.heightAnchor.constraint(equalToConstant: 30),
            lbHours.leadingAnchor.constraint(equalTo: lbGenres.trailingAnchor, constant: 16),
            lbHours.topAnchor.constraint(equalTo: lbTitle.bottomAnchor, constant: 8),
            lbHours.heightAnchor.constraint(equalToConstant: 30),
            lbVoteAverage.leadingAnchor.constraint(equalTo: lbHours.trailingAnchor, constant: 16),
            lbVoteAverage.topAnchor.constraint(equalTo: lbTitle.bottomAnchor, constant: 8),
            lbVoteAverage.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    func loadInfoRecipe(data: YPCollectionRecipesAvailable) {
        lbTitle.text = data.name
        lbGenres.text = "  \(data.genres)  "
        let message = data.deliveryTime.contains(":") ? Localizable.text(.hour) : Localizable.text(.minute)
        let time = " \(Localizable.text(.dealerDelevery)): \(data.deliveryTime) \(message)  "
        lbHours.attributedText = NSMutableAttributedString(string: time)
        let qualification = NSMutableAttributedString(string: "  \(data.qualification)  ")
        let icStar = createImageText(image: UIImage(systemName: "star.fill") ?? UIImage())
        qualification.append(icStar)
        qualification.append(NSAttributedString(string: "   "))
        lbVoteAverage.attributedText = qualification
        if let image = YPImagen(rawValue: data.imagen) {
            imageRecipe.image =  YPIcon.of(image)
        }
    }
    func createImageText(image: UIImage) -> NSAttributedString {
        let icText = NSTextAttachment()
        let imageIcon = image.withTintColor(.YPWhite100, renderingMode: .alwaysOriginal)
        icText.image = imageIcon
        icText.bounds = CGRect(x: 0, y: -1, width: 12, height: 12)
        let imageAttString = NSAttributedString(attachment: icText)
        return imageAttString
    }
}
