//
//  HomeCollectionView.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 10/03/23.
//

import UIKit

extension HomeView: UIRecipeCollectionProtocol {
    func fetchRecipeDetail(_ item: CollectionRecipesAvailable) {
        presenter?.fetchRecipeDetail(item)
    }
}
