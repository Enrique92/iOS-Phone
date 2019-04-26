//
//  MainTabBarController.swift
//  AppStore
//
//  Created by Enrique on 2019-04-25.
//  Copyright © 2019 Enrique. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add the navigation controller to the view controller to show the tabs
        viewControllers = [
            createViewController(viewController: UIViewController(), title: "TODAY", imageName: "today"),
            createViewController(viewController: UIViewController(), title: "APPS", imageName: "apps"),
            createViewController(viewController: UIViewController(), title: "GAMES", imageName: "games"),
            createViewController(viewController: SearchViewController(), title: "SEARCH", imageName: "search")
        ]
    }
    
    fileprivate func createViewController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
        viewController.view.backgroundColor = .white
        viewController.navigationItem.title = title
        // Put the VC in the Navigation Controller
        let navController = UINavigationController(rootViewController: viewController)
        // Add title to the tab bar item
        navController.tabBarItem.title = title
        // Add title like a Heading with big letters
        navController.navigationBar.prefersLargeTitles = true
        // Add the image to the tab bar
        viewController.tabBarItem.image = UIImage(named: imageName)
        
        return navController
    }
}
