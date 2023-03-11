//
//  CPProductionCompaniesView.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 10/03/23.
//

import UIKit

internal class YPRecommendedRecipesView: UIView {
    private lazy var lbTitle: UILabel = {
        var lbTitle = UILabel()
        lbTitle.translatesAutoresizingMaskIntoConstraints = false
        lbTitle.numberOfLines = 0
        lbTitle.text = Localizable.text(.recommendedRecipes)
        lbTitle.textColor = UIColor.CPPrincipal
        lbTitle.font = CPFont.gothamMedium.size(.large)
        return lbTitle
    }()
    private lazy var contentView: UIView = {
        var contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    var recipesAvailableCollectionView: UIRecipeCollectionView = {
        var recipesAvailable = UIRecipeCollectionView(frame: .zero)
        recipesAvailable.translatesAutoresizingMaskIntoConstraints = false
        recipesAvailable.scrollDirection = YPScrollDirection.horizontal.rawValue
        recipesAvailable.layoutIfNeeded()
        return recipesAvailable
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
        addSubview(lbTitle)
        addSubview(contentView)
        contentView.addSubview(recipesAvailableCollectionView)
        NSLayoutConstraint.activate([
            lbTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            lbTitle.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            lbTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            lbTitle.heightAnchor.constraint(equalToConstant: 34),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            contentView.topAnchor.constraint(equalTo: lbTitle.bottomAnchor, constant: 16),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            recipesAvailableCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            recipesAvailableCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            recipesAvailableCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            recipesAvailableCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    func loadData(recipes: [CollectionRecipesAvailable]) {
        recipesAvailableCollectionView.loadData(recipesAvailable: recipes)
    }
}
