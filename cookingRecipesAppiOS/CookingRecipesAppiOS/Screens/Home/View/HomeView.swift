//
//  HomeView.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 09/03/23.
//  
//

import UIKit

internal class HomeView: UIViewController {

    var searchView: UISearchBar = {
        var search = UISearchBar()
        search.style()
        search.placeholder = Localizable.text(.searchPlaceholder)
        search.translatesAutoresizingMaskIntoConstraints = false
        return search
    }()
    var recipesAvailableCollectionView: UIRecipeCollectionView = {
        var recipesAvailable = UIRecipeCollectionView(frame: .zero)
        recipesAvailable.translatesAutoresizingMaskIntoConstraints = false
        recipesAvailable.scrollDirection = YPScrollDirection.vertical.rawValue
        return recipesAvailable
    }()
    // MARK: Properties
    var presenter: HomePresenterProtocol?
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension HomeView: HomeViewProtocol {
    func initUI() {
        view.backgroundColor = .CPBase100
        searchView.delegate = self
        recipesAvailableCollectionView.delegateRecipe = self
        title = Localizable.text(.recipesAvailable)
        [searchView, recipesAvailableCollectionView].forEach { view.addSubview($0) }
        let topAnchor = navigationItem.titleView?.bottomAnchor ?? view.safeAreaLayoutGuide.topAnchor
        NSLayoutConstraint.activate([
            searchView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            searchView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            searchView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            searchView.bottomAnchor.constraint(equalTo: recipesAvailableCollectionView.topAnchor, constant: -22),
            searchView.heightAnchor.constraint(equalToConstant: 44),
            recipesAvailableCollectionView.topAnchor.constraint(equalTo: searchView.bottomAnchor),
            recipesAvailableCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            recipesAvailableCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            recipesAvailableCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    func loadData(recipesAvailable: [CollectionRecipesAvailable]) {
        recipesAvailableCollectionView.loadData(recipesAvailable: recipesAvailable)
    }
    func showError(message: String) {
        DispatchQueue.main.async {
            CPAlert.shared.alertShow(self, message: message)
        }
    }
}
