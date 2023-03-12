//
//  DetailView.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 09/03/23.
//  
//

import Foundation
import UIKit

class YPRecipeDetailView: UIViewController {
    private var contentView: UIView = {
        var viewContent = UIView()
        viewContent.translatesAutoresizingMaskIntoConstraints = false
        viewContent.backgroundColor = .clear
        return viewContent
    }()
    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .clear
        scrollView.bounces = false
        scrollView.indicatorStyle = .white
        return scrollView
    }()
    private var recipeImageView: YPRecipeInfoView = {
        var recipeImageView = YPRecipeInfoView()
        recipeImageView.translatesAutoresizingMaskIntoConstraints = false
        recipeImageView.backgroundColor = .clear
        recipeImageView.contentMode = .scaleToFill
        return recipeImageView
    }()
    private var recommendedRecipesView: YPRecommendedRecipesView = {
        var recommendedRecipesView = YPRecommendedRecipesView()
        recommendedRecipesView.translatesAutoresizingMaskIntoConstraints = false
        recommendedRecipesView.backgroundColor = .clear
        return recommendedRecipesView
    }()
    private var lbOverview: UILabel = {
        var lbOverview = UILabel()
        lbOverview.translatesAutoresizingMaskIntoConstraints = false
        lbOverview.numberOfLines = 0
        lbOverview.textColor = UIColor.YPText100
        lbOverview.font = YPFont.gothamBook.size(.smail)
        return lbOverview
    }()
    private var btnBack: UIButton = {
        var btnBack = UIButton()
        let iconBack = UIImage(systemName: "arrow.backward")?.withTintColor(.YPWhite100,
                                                                            renderingMode: .alwaysOriginal)
        btnBack.setImage(iconBack, for: .normal)
        btnBack.radiusView(radius: 22, .YPPrincipal)
        btnBack.backgroundColor = .YPPrincipal.withAlphaComponent(0.8)
        btnBack.translatesAutoresizingMaskIntoConstraints = false
        return btnBack
    }()
    private var btnLocation: UIButton = {
        var btnLocation = UIButton()
        btnLocation.translatesAutoresizingMaskIntoConstraints = false
        btnLocation.backgroundColor = .clear
        let icLocation = UIImage(systemName: "location")?.withTintColor(.YPWhite100,
                                                                        renderingMode: .alwaysOriginal)
        if let icon = icLocation {
            btnLocation.setImage(icon, for: .normal)
        }
        btnLocation.radiusView(radius: 22, UIColor.YPPrincipal)
        btnLocation.backgroundColor = .YPPrincipal.withAlphaComponent(0.8)
        return btnLocation
    }()
    // MARK: Properties
    var presenter: YPDetailPresenterProtocol?

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension YPRecipeDetailView: YPDetailViewProtocol {
    func initUI() {
        statusBarView(color: UIColor.YPBase100)
        setupScrollView()
        contentViews()
    }
    func setupScrollView() {
        view.backgroundColor = .YPBase100
        [btnBack, btnLocation, scrollView].forEach({ view.addSubview($0)})
        view.bringSubviewToFront(btnBack)
        view.bringSubviewToFront(btnLocation)
        scrollView.bringSubviewToFront(scrollView)
        scrollView.addSubview(contentView)
        scrollView.bringSubviewToFront(contentView)
        NSLayoutConstraint.activate([
            btnLocation.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            btnLocation.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            btnLocation.heightAnchor.constraint(equalToConstant: 44),
            btnLocation.widthAnchor.constraint(equalToConstant: 44),
            btnBack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            btnBack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            btnBack.heightAnchor.constraint(equalToConstant: 44),
            btnBack.widthAnchor.constraint(equalToConstant: 44),
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 1),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
        btnBack.addTapGesture { [weak self] in
            self?.dismiss(animated: true)
        }
        btnLocation.addTapGesture { [weak self] in
            guard let self = self else { return }
            self.presenter?.presentMapRecipe()
        }
    }
    func contentViews() {
        [recipeImageView, lbOverview, recommendedRecipesView].forEach({ contentView.addSubview($0)})
        contentView.bringSubviewToFront(btnBack)
        NSLayoutConstraint.activate([
            recipeImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            recipeImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            recipeImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            recipeImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            recipeImageView.heightAnchor.constraint(equalToConstant: 400),
            lbOverview.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            lbOverview.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 22),
            lbOverview.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -22),
            lbOverview.topAnchor.constraint(equalTo: recipeImageView.bottomAnchor, constant: 24),
            lbOverview.bottomAnchor.constraint(equalTo: recommendedRecipesView.topAnchor, constant: -44),
            recommendedRecipesView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            recommendedRecipesView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            recommendedRecipesView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            recommendedRecipesView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -44),
            recommendedRecipesView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    func loadInfoRecipe(detail: YPCollectionRecipesAvailable,
                        recommendedRecipes: [YPCollectionRecipesAvailable]) {
        recipeImageView.loadInfoRecipe(data: detail)
        let info = NSMutableAttributedString()
        info.append(NSMutableAttributedString().boldText("2023 Marzo 20",
                                                         .YPPrincipal,
                                                         .left,
                                                         .medium))
        info.append(NSMutableAttributedString().normalText("\n\n\(detail.description)",
                                                           .YPText100,
                                                           .left,
                                                           .medium))
        if !detail.ingredients.isEmpty {
            info.append(NSMutableAttributedString().boldText("\n\n\n\(Localizable.text(.ingredients)):\n\n",
                                                               .YPPrincipal,
                                                               .left,
                                                               .medium))
            let icStar = NSTextAttachment()
            let imageIcon = YPIcon.of(.icPoint)!
            icStar.image = imageIcon
            icStar.bounds = CGRect(x: 0, y: -1, width: 6, height: 6)
            let image1String = NSAttributedString(attachment: icStar)
            detail.ingredients.forEach { item in
                info.append(image1String)
                info.append(NSMutableAttributedString().normalText(".- \(item.capitalizingFirstLetter())\n",
                                                                   .YPText100,
                                                                   .left,
                                                                   .medium))
            }
        }
        lbOverview.attributedText = info
        recommendedRecipesView.loadData(recipes: recommendedRecipes)
    }
}
