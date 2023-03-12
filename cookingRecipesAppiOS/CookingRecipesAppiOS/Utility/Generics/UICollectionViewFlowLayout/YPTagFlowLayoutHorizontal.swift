//
//  TagFlowLayoutHorizontal.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 10/03/23.
//

import UIKit

class YPTagFlowLayoutHorizontal: UICollectionViewFlowLayout {
    private let height = 190
    private let width = UIScreen.main.bounds.width
    override func prepare() {
        super.prepare()
        scrollDirection = .horizontal
        minimumLineSpacing = 8
        minimumInteritemSpacing = 8
        let size = CGSize(width: (Int(width) - 60), height: height)
        itemSize = size
        sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }
}
