//
//  SceneDelegate.swift
//  Desafio
//
//  Created by Joao Batista on 04/03/20.
//  Copyright © 2020 Joao Batista. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    private let provider = URLSessionProvider()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = setupTarBar()
        window?.makeKeyAndVisible()
        
    }
    // MARK: Create and set Controllers
    private func setupTarBar() -> UITabBarController {
        let tabBarController = UITabBarController()
        let navigationBar = UINavigationController()
        
        let fundamentals = FundamentalsViewController()
        navigationBar.viewControllers = [fundamentals]
        
        navigationBar.tabBarItem = UITabBarItem(title: "Fundamentos", image: UIImage(named: "fundamentals"), tag: 0)
        let insight = InsightViewController()
        insight.tabBarItem = UITabBarItem(title: "Insight", image: UIImage(named: "insight"), tag: 1)
        
        let tabBarList = [navigationBar, insight]
        tabBarController.viewControllers = tabBarList
        tabBarController.tabBar.barTintColor = UIColor.white
        tabBarController.tabBar.tintColor = UIColor.pinkLight
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)], for: .normal)
        return tabBarController
        
    }
    func sceneDidDisconnect(_ scene: UIScene) {
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}
