//
//  JuiceMaker - AppDelegate.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let fruitStore = FruitStore(initialCount: 10)
        
        let storyboard = UIStoryboard(name: "Main", bundle: .none)
        let viewController = storyboard.instantiateViewController(
            identifier: JuiceMakerViewController.storyboardIdentifier
        ) { coder in
            return JuiceMakerViewController(coder: coder, fruitStore: fruitStore)
        }
        
        let rootViewController = UINavigationController(rootViewController: viewController)
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        return true
    }
}

