//
//  JuiceMaker - SceneDelegate.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
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
    }
}

