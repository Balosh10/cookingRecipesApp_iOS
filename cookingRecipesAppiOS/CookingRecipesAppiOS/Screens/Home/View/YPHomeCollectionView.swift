//
//  HomeCollectionView.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 10/03/23.
//

import UIKit

extension YPHomeView: UIRecipeCollectionProtocol {
    func fetchRecipeDetail(_ item: YPCollectionRecipesAvailable) {
        UIApplication.shared.currentWindow?.endEditing(true)
        presenter?.fetchRecipeDetail(item)
    }
}
