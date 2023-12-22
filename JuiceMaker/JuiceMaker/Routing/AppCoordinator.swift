//
//  AppCoordinator.swift
//  JuiceMaker
//
//  Created by Effie on 12/22/23.
//

import UIKit

final class AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    private let navigationController: UINavigationController
    private let fruitStore: FruitStore
    
    init(
        navigationController: UINavigationController,
        fruitStore: FruitStore
    ) {
        self.navigationController = navigationController
        self.fruitStore = fruitStore
    }
    
    func start() {
        let coordinator = JuiceMakerCoordinator(
            navigationController: self.navigationController,
            fruitStore: self.fruitStore
        )
        coordinator.start()
        self.childCoordinators.append(coordinator)
    }
}
