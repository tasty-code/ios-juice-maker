//
//  JuiceMaker - AppDelegate.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let fruitStore = FruitStore(initialCount: 10)
        let viewController = JuiceMakerViewController.instantiate(fruitStore: fruitStore)
        let rootViewController = UINavigationController(rootViewController: viewController)
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }
}

