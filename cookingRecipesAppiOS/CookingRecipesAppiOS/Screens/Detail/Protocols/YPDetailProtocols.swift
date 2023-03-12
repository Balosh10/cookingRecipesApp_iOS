//
//  DetailProtocols.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 09/03/23.
//  
//

import Foundation
import UIKit

protocol YPDetailViewProtocol: AnyObject {
    var presenter: YPDetailPresenterProtocol? { get set }
    func initUI()
    func loadInfoRecipe(detail: YPCollectionRecipesAvailable,
                        recommendedRecipes: [YPCollectionRecipesAvailable])
}

protocol YPDetailRouterProtocol: AnyObject {
    static func createDetailModule(_ recipeDatailData: YPCollectionRecipesAvailable) -> UIViewController
    func presentMapRecipe(from view: YPDetailViewProtocol?, recipeData: YPCollectionRecipesAvailable)
}

protocol YPDetailPresenterProtocol: AnyObject {
    var view: YPDetailViewProtocol? { get set }
    var interactor: YPDetailInteractorInputProtocol? { get set }
    var router: YPDetailRouterProtocol? { get set }
    func viewDidLoad()
    func presentMapRecipe()
}

protocol YPDetailInteractorOutputProtocol: AnyObject {
    func loadData(detail: YPCollectionRecipesAvailable,
                  recommendedRecipes: [YPCollectionRecipesAvailable])
    func presentMapRecipe(detail: YPCollectionRecipesAvailable)
}

protocol YPDetailInteractorInputProtocol: AnyObject {
    var presenter: YPDetailInteractorOutputProtocol? { get set }
    var recipeDatailData: YPCollectionRecipesAvailable? { get set }
    func getInfo()
    func getRecipeDetail()
}
