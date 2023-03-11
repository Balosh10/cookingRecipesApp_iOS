//
//  DetailProtocols.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 09/03/23.
//  
//

import Foundation
import UIKit

protocol DetailViewProtocol: AnyObject {
    var presenter: DetailPresenterProtocol? { get set }
    func initUI()
    func loadInfoRecipe(detail: CollectionRecipesAvailable,
                        recommendedRecipes: [CollectionRecipesAvailable])
}

protocol DetailRouterProtocol: AnyObject {
    static func createDetailModule(_ recipeDatailData: CollectionRecipesAvailable) -> UIViewController
    func presentMapRecipe(from view: DetailViewProtocol?, recipeData: CollectionRecipesAvailable)
}

protocol DetailPresenterProtocol: AnyObject {
    var view: DetailViewProtocol? { get set }
    var interactor: DetailInteractorInputProtocol? { get set }
    var router: DetailRouterProtocol? { get set }
    func viewDidLoad()
    func presentMapRecipe()
}

protocol DetailInteractorOutputProtocol: AnyObject {
    func loadData(detail: CollectionRecipesAvailable,
                  recommendedRecipes: [CollectionRecipesAvailable])
    func presentMapRecipe(detail: CollectionRecipesAvailable)
}

protocol DetailInteractorInputProtocol: AnyObject {
    var presenter: DetailInteractorOutputProtocol? { get set }
    var recipeDatailData: CollectionRecipesAvailable? { get set }
    func getInfo()
    func getRecipeDetail()
}
