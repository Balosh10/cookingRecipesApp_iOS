//
//  CollectionViewDataSource.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 09/03/23.
//

import UIKit

class YPCollectionViewDataSource<CELL: UICollectionViewCell, T>: NSObject, UICollectionViewDataSource {
    private var cellIdentifier: String!
    private var items: [T]?
    var configureCell: (CELL, T?) -> Void = {_, _ in }
    init(cellIdentifier: String, items: [T]?, configureCell: @escaping (CELL, T?) -> Void) {
        self.cellIdentifier = cellIdentifier
        self.items = items
        self.configureCell = configureCell
    }
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        items?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier,
                                                            for: indexPath) as? CELL else {
            return UICollectionViewCell()
        }
        let item = self.items?[indexPath.row]
        configureCell(cell, item)
        cell.backgroundColor = .clear
        return cell
    }
}
