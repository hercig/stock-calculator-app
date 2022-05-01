//
//  AppController.swift
//  stock-calculator-app
//
//  Created by Filip Hercig on 27.04.2022..
//

import UIKit

class AppController {
    
    let window: UIWindow
    
    var navigationController: UINavigationController? {
        window.rootViewController as? UINavigationController
    }

    init(window: UIWindow) {
        self.window = window
        self.window.rootViewController = UINavigationController()
        self.window.makeKeyAndVisible()
    }
}

// MARK: - Public Methods

extension AppController {
    func startApp() {
        let homeRouter = HomeRouter()
        let homeViewModel = HomeViewModel(router: homeRouter)
        let homeViewController = HomeViewController(viewModel: homeViewModel)
        homeRouter.viewController = homeViewController
        
        navigationController?.setViewControllers([homeViewController], animated: true)
    }
}
