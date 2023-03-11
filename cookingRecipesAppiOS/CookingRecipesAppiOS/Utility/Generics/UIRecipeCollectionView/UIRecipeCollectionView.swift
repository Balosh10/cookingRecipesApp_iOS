//
//  UIRecipeCollectionView.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 10/03/23.
//

import UIKit
public enum YPScrollDirection: Int {
    case vertical = 0
    case horizontal = 1
}
protocol UIRecipeCollectionProtocol: AnyObject {
    func fetchRecipeDetail(_ item: CollectionRecipesAvailable)
}
@IBDesignable open class UIRecipeCollectionView: UICollectionView {
    @IBInspectable public var scrollDirection: Int = YPScrollDirection.vertical.rawValue {
        didSet {
            switch ScrollDirection.init(rawValue: scrollDirection) {
            case .vertical:
                collectionViewLayout = createCvFlowLayoutVertical
            case .horizontal:
                collectionViewLayout = createCvFlowLayoutHorizontal
            default:
                break
            }
            if let layout = self.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.scrollDirection = ScrollDirection.init(rawValue: scrollDirection) ?? .vertical
            }
        }
    }
    var createCvFlowLayoutVertical: UICollectionViewFlowLayout = {
        let createCvFlowLayout = TagFlowLayoutVertical()
        return createCvFlowLayout
    }()
    var createCvFlowLayoutHorizontal: UICollectionViewFlowLayout = {
        let createCvFlowLayout = TagFlowLayoutHorizontal()
        return createCvFlowLayout
    }()
    weak var delegateRecipe: UIRecipeCollectionProtocol?
    private var cellCollectionViewIdentifier = "RecipesAvailableCollectionViewCell"
    private var collectionDataSource: CollectionViewDataSource<RecipesAvailableCollectionViewCell,
                                                               CollectionRecipesAvailable>!
    private var collectionDelegate: CollectionViewDelegate<RecipesAvailableCollectionViewCell,
                                                           CollectionRecipesAvailable>!
    public required init(frame: CGRect) {
        super.init(frame: frame, collectionViewLayout: createCvFlowLayoutVertical)
        commonInit()
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit() {
        showsHorizontalScrollIndicator = false
        backgroundColor = .clear
    }
    func loadData(recipesAvailable: [CollectionRecipesAvailable]) {
        collectionDataSource = CollectionViewDataSource(cellIdentifier: cellCollectionViewIdentifier,
                                                          items: recipesAvailable,
                                                          configureCell: { cellCollection, itemRecipe in
            guard let data = itemRecipe else { return }
            cellCollection.loadView(item: data)
        })
        collectionDelegate = CollectionViewDelegate(cellIdentifier: cellCollectionViewIdentifier,
                                                      items: recipesAvailable,
                                                      configureCell: { [weak self] _, itemRecipe in
           guard let self = self, let data = itemRecipe else { return }
            self.delegateRecipe?.fetchRecipeDetail(data)
        })
        DispatchQueue.main.async {
            self.dataSource = self.collectionDataSource
            self.delegate = self.collectionDelegate
            self.register(RecipesAvailableCollectionViewCell.self,
                         forCellWithReuseIdentifier: self.cellCollectionViewIdentifier)
            self.reloadData()
        }
    }
}
