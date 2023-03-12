//
//  HomeProtocols.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 09/03/23.
//  
//

import Foundation
import UIKit

protocol YPHomeViewProtocol: AnyObject {
    var presenter: YPHomePresenterProtocol? { get set }
    func initUI()
    func loadData(recipesAvailable: [YPCollectionRecipesAvailable])
}

protocol YPHomeRouterProtocol: AnyObject {
    static func createHomeModule() -> UIViewController
    func presentRecipeDetail(from view: YPHomeViewProtocol?, recipeData: YPCollectionRecipesAvailable)
}

protocol YPHomePresenterProtocol: AnyObject {
    var view: YPHomeViewProtocol? { get set }
    var interactor: YPHomeInteractorInputProtocol? { get set }
    var router: YPHomeRouterProtocol? { get set }
    func viewDidLoad()
    func searchRecipe(text: String?)
    func fetchRecipeDetail(_ item: YPCollectionRecipesAvailable)
}

protocol YPHomeInteractorOutputProtocol: AnyObject {
    func loadData(recipesAvailable: [YPCollectionRecipesAvailable])
}

protocol YPHomeInteractorInputProtocol: AnyObject {
    var presenter: YPHomeInteractorOutputProtocol? { get set }
    func loadData()
    func searchRecipe(text: String?)
}
