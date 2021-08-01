//
//  CategoriesCoordinator.swift
//  DiscourseClientApp
//
//  Created by José Ángel Rodríguez on 28/7/21.
//

import UIKit
class CategoriesCoordinator: Coordinator {
    var navigator: UINavigationController
    let categoriesUseCases: CategoriesUseCases
    let cateogryDetailUseCases: CategoryDetailUseCases = DataManager(remoteDataManager: RemoteDataManager())
    
    init(navigator: UINavigationController, categoriesUseCases: CategoriesUseCases) {
        self.navigator = navigator
        self.categoriesUseCases = categoriesUseCases
    }
    
    func start() {
        let categoriesViewModel = CategoriesViewModel(useCases: categoriesUseCases)
        let categoriesViewController = CategoriesViewController(viewModel: categoriesViewModel)
        categoriesViewController.title = "Categories"
        categoriesViewModel.view = categoriesViewController
        categoriesViewModel.coordinator = self
        navigator.pushViewController(categoriesViewController, animated: false)
    }
    
    func didSelectCategory(category: Category){
        let categoryDetailCoordinator = CategoryDetailCoordinator(categoryId: category.id, navigator: navigator, useCases: cateogryDetailUseCases)
        categoryDetailCoordinator.start()
    }
}
