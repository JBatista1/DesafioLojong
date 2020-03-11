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
    
    @available(iOS 13.0, *)
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

}
