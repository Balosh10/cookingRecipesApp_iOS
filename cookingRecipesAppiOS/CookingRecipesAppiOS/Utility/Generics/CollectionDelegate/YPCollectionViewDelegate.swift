//
//  CollectionViewDelegate.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 09/03/23.
//

import UIKit

class YPCollectionViewDelegate<CELL: UICollectionViewCell, T>: NSObject, UICollectionViewDelegate {
    private var cellIdentifier: String!
    private var items: [T]?
    var configureCell: (CELL, T?) -> Void = {_, _ in }
    init(cellIdentifier: String, items: [T]?, configureCell: @escaping (CELL, T?) -> Void) {
        self.cellIdentifier = cellIdentifier
        self.items =  items
        self.configureCell = configureCell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Collection view at row \(collectionView.tag) selected index path \(indexPath)")
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier,
                                                            for: indexPath) as? CELL else {
            return
        }
        let item = items?[indexPath.row]
        self.configureCell(cell, item)
    }
}
