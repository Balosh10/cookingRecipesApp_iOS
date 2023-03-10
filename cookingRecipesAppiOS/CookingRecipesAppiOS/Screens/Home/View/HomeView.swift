//
//  HomeView.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 09/03/23.
//  
//

import UIKit

class HomeView: UIViewController {

    private var searchView: UISearchBar = {
        var search = UISearchBar()
        search.style()
        search.placeholder = "Escribe una receta"
        search.translatesAutoresizingMaskIntoConstraints = false
        return search
    }()
    // MARK: Properties
    private var recipesAvailableCollectionView: UICollectionView?
    private var cellCollectionViewIdentifier = "RecipesAvailableCollectionViewCell"
    private var collectionDataSource: CollectionViewDataSource<RecipesAvailableCollectionViewCell,
                                                               CollectionRecipesAvailable>!
    private var collectionDelegate: CollectionViewDelegate<RecipesAvailableCollectionViewCell,
                                                           CollectionRecipesAvailable>!
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
        title = "Recetas disponibles"
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 10
        let size = CGSize(width: (UIScreen.main.bounds.width - 30) / 2, height: 200)
        flowLayout.itemSize = size
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        recipesAvailableCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        recipesAvailableCollectionView?.collectionViewLayout = flowLayout
        recipesAvailableCollectionView?.showsHorizontalScrollIndicator = false
        recipesAvailableCollectionView?.translatesAutoresizingMaskIntoConstraints = false
        recipesAvailableCollectionView?.backgroundColor = .clear
        guard let collection = recipesAvailableCollectionView else {
            return
        }
        [searchView, collection].forEach { view.addSubview($0) }
        let topAnchor = navigationItem.titleView?.bottomAnchor ?? view.safeAreaLayoutGuide.topAnchor
        NSLayoutConstraint.activate([
            searchView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            searchView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            searchView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            searchView.bottomAnchor.constraint(equalTo: collection.topAnchor, constant: -22),
            searchView.heightAnchor.constraint(equalToConstant: 44),
            collection.topAnchor.constraint(equalTo: searchView.bottomAnchor),
            collection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collection.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    func loadData(recipesAvailable: [CollectionRecipesAvailable]) {
        collectionDataSource = CollectionViewDataSource(cellIdentifier: cellCollectionViewIdentifier,
                                                          items: recipesAvailable,
                                                          configureCell: { cellCollection, itemMovie in
            guard let data = itemMovie else { return }
            cellCollection.loadView(item: data)
        })
        collectionDelegate = CollectionViewDelegate(cellIdentifier: cellCollectionViewIdentifier,
                                                      items: recipesAvailable,
                                                      configureCell: { [weak self] cellCollection, itemMovie in
           /*guard let self = self, let id = itemMovie?.id else { return }
            self.presenter?.fetchMovieDetail(id)*/
        })
        DispatchQueue.main.async {
            self.recipesAvailableCollectionView?.dataSource = self.collectionDataSource
            self.recipesAvailableCollectionView?.delegate = self.collectionDelegate
            self.recipesAvailableCollectionView?.register(RecipesAvailableCollectionViewCell.self,
                                              forCellWithReuseIdentifier: self.cellCollectionViewIdentifier)
            self.recipesAvailableCollectionView?.reloadData()
        }
    }
    var collectionViewOffset: CGFloat {
        set { recipesAvailableCollectionView?.contentOffset.x = newValue }
        get { return recipesAvailableCollectionView?.contentOffset.x ?? 0}
    }
    func showError(message: String) {
        DispatchQueue.main.async {
            CPAlert.shared.alertShow(self, message: message)
        }
    }
}
extension HomeView: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar,
                   shouldChangeTextIn range: NSRange,
                   replacementText text: String) -> Bool {
        let searchText = searchBar.text as NSString?
        let textOnly = searchText?.replacingCharacters(in: range, with: text)
        presenter?.searchRecipe(text: textOnly)
        return true
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let image = CPIcon.of(.icClose)?.withTintColor(.CPPrincipal, renderingMode: .alwaysOriginal),
              searchText.count > 0 else {
            presenter?.searchRecipe(text: searchText)
            return
        }
        searchBar.setImage(image, for: .clear, state: .normal)
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            self.presenter?.searchRecipe(text: searchBar.text )
        })
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchView.endEditing(true)
    }
}
