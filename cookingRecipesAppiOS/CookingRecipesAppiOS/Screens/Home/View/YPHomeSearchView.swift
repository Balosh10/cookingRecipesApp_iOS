//
//  HomeSearchView.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 10/03/23.
//

import UIKit

extension YPHomeView: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar,
                   shouldChangeTextIn range: NSRange,
                   replacementText text: String) -> Bool {
        let searchText = searchBar.text as NSString?
        let textOnly = searchText?.replacingCharacters(in: range, with: text)
        presenter?.searchRecipe(text: textOnly)
        return true
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let image = YPIcon.of(.icClose)?.withTintColor(.YPPrincipal, renderingMode: .alwaysOriginal),
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
        searchView.endEditing(true)
    }
}
