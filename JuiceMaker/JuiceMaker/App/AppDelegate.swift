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
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = self.makeRootViewController()
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
    
    private func makeRootViewController() -> UINavigationController {
        let fruitStore = FruitStore(initialCount: 10)
        let viewController = JuiceMakerViewController.instantiate(
            juiceMakerUseCase: JuiceMaker(fruitStore: fruitStore),
            router: JuiceMakerRouter(dataStore: fruitStore)
        )
        return UINavigationController(rootViewController: viewController)
    }
}

