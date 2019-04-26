//
//  AppDelegate.swift
//  Assignment4
//
//  Created by Enrique on 2019-04-24.
//  Copyright © 2019 Enrique. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Create a new window
        window = UIWindow(frame: UIScreen.main.bounds)
        
        // Create each city
        let vancouver = City(name: "Vancouver", temperature: 14.5, icon: "canada", summary: "Sunny", country: "Canada")
        let tokyo = City(name: "Tokyo", temperature: 18, icon: "japan", summary: "Cloudy", country: "Japan")
        let chicago = City(name: "Chicago", temperature: 17, icon: "chicago", summary: "Cloudy", country: "USA")
        let madrid = City(name: "Madrid", temperature: 13, icon: "madrid", summary: "Raining", country: "Spain")
        
        // Controller for each city
        let vanVC = CityViewController()
        vanVC.city = vancouver
        vanVC.view.backgroundColor = UIColor(patternImage: UIImage(named: "vancouver_")!)
        
        let tokVC = CityViewController()
        tokVC.city = tokyo
        tokVC.view.backgroundColor = UIColor(patternImage: UIImage(named: "tokyo_")!)
        
        let chiVC = CityViewController()
        chiVC.city = chicago
        chiVC.view.backgroundColor = UIColor(patternImage: UIImage(named: "chicago_")!)
        
        let madVC = CityViewController()
        madVC.city = madrid
        madVC.view.backgroundColor = UIColor(patternImage: UIImage(named: "madrid_")!)
        
        // Create the tabViewController
        let tabVC = UITabBarController()
        window?.rootViewController = tabVC
        
        // Create the map with the cities
        let citiesVC = [vanVC, tokVC, chiVC, madVC]
        // Add the views controllers to the ViewController(main one)
        tabVC.viewControllers = citiesVC.map {
            UINavigationController(rootViewController: $0)
        }
        
        // Make visible the new window
        window?.makeKeyAndVisible()
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}

