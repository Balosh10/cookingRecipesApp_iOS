//
//  HomeProtocols.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 09/03/23.
//  
//

import Foundation
import UIKit

protocol HomeViewProtocol: AnyObject {
    var presenter: HomePresenterProtocol? { get set }
    func initUI()
    func loadData(recipesAvailable: [CollectionRecipesAvailable])
}

protocol HomeRouterProtocol: AnyObject {
    static func createHomeModule() -> UIViewController
    func presentRecipeDetail(from view: HomeViewProtocol?, recipeData: CollectionRecipesAvailable)
}

protocol HomePresenterProtocol: AnyObject {
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorInputProtocol? { get set }
    var router: HomeRouterProtocol? { get set }
    func viewDidLoad()
    func searchRecipe(text: String?)
    func fetchRecipeDetail(_ item: CollectionRecipesAvailable)
}

protocol HomeInteractorOutputProtocol: AnyObject {
    func loadData(recipesAvailable: [CollectionRecipesAvailable])
}

protocol HomeInteractorInputProtocol: AnyObject {
    var presenter: HomeInteractorOutputProtocol? { get set }
    var localDatamanager: HomeLocalDataManagerInputProtocol? { get set }
    func loadData()
    func searchRecipe(text: String?)
}

protocol HomeLocalDataManagerInputProtocol: AnyObject {
    var allRecipes: [CollectionRecipesAvailable]? { get set }
}
