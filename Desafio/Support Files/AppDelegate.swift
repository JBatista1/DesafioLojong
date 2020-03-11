//
//  AppDelegate.swift
//  Desafio
//
//  Created by Joao Batista on 04/03/20.
//  Copyright © 2020 Joao Batista. All rights reserved.
//

import AppCenter
import AppCenterAnalytics
import AppCenterCrashes

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        MSAppCenter.start("4b26e7d7-f5e5-4af3-abe3-b3921a299317", withServices:[
                   MSAnalytics.self,
                   MSCrashes.self
               ])
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = setupTarBar()
        window?.makeKeyAndVisible()
        
        return true
    }
    
    
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
    // MARK: UISceneSession Lifecycle
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
}
