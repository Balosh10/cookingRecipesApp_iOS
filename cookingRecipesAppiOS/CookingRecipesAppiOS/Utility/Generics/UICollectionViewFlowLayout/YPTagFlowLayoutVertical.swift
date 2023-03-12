//
//  CollectionLayout.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 10/03/23.
//

import UIKit

class YPTagFlowLayoutVertical: UICollectionViewFlowLayout {
    private let height = 200
    private let width = UIScreen.main.bounds.width
    override func prepare() {
        super.prepare()
        scrollDirection = .vertical
        minimumLineSpacing = 10
        minimumInteritemSpacing = 10
        let size = CGSize(width: (Int(width) - 30) / 2, height: height)
        itemSize = size
        sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}
