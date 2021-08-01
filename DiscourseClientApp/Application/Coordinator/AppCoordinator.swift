//
//  AppCoordinator.swift
//  DiscourseClientApp
//
//  Created by José Ángel Rodríguez on 14/7/21.
//

import UIKit

protocol Coordinator {
    var navigator: UINavigationController { get }
    
    func start()
    func finish()
}

extension Coordinator {
    func finish() {
        navigator.dismiss(animated: true, completion: nil)
    }
}

class AppCoodinator: Coordinator {
    var navigator: UINavigationController = UINavigationController()
    let window : UIWindow
    
    var dataManager = DataManager(remoteDataManager: RemoteDataManager())
    
    init(window: UIWindow) {
        self.window = window
    }
    func start() {
        let tabBarController = UITabBarController()
        tabBarController.tabBar.tintColor = .black
        
        let topicsNavigator = UINavigationController()
        let topicsCoordinator = TopicsCoordinator(navigator: topicsNavigator, topicsUseCases: dataManager)
        topicsCoordinator.start()
        
        // inicializa viewController del tab bar
        let usersNavigator = UINavigationController()
        let usersCoordinator = UsersCoordinator(navigator: usersNavigator, userUseCases: dataManager)
        usersCoordinator.start()
        
        let categoriesNavigator = UINavigationController()
        let categoriesCoordinator = CategoriesCoordinator(navigator: categoriesNavigator, categoriesUseCases: dataManager)
        categoriesCoordinator.start()
        
        
        // viewcontrollers del tabbar
        tabBarController.viewControllers = [usersNavigator, topicsNavigator, categoriesNavigator]
        tabBarController.tabBar.items?.first?.image = UIImage(systemName: "tag")
        tabBarController.tabBar.items?[1].image = UIImage(systemName: "list.dash")
        tabBarController.tabBar.items?[2].image = UIImage(systemName: "person.3")
        
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }
}
