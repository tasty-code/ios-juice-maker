//
//  JuiceMakerCoordinator.swift
//  JuiceMaker
//
//  Created by Effie on 12/22/23.
//

import UIKit

protocol Coordinator : AnyObject {
    var childCoordinators : [Coordinator] { get set }
    func start()
}

final class JuiceMakerCoordinator {
    var childCoordinators: [Coordinator] = []
    
    private let navigationController: UINavigationController
    private lazy var fruitStore: FruitStore = FruitStore(initialCount: 10)
    
    init(navigationController: UINavigationController, fruitStore: FruitStore) {
        self.navigationController = navigationController
        self.fruitStore = fruitStore
    }
    
    func start() {
        fruitStore = FruitStore(initialCount: 10)
        let viewController = JuiceMakerViewController.instantiate(
            juiceMakerUseCase: JuiceMaker(fruitStore: fruitStore),
            router: JuiceMakerRouter(dataStore: fruitStore),
            coordinator: self
        )
        self.navigationController.viewControllers = [viewController]
    }
}

protocol JuiceMakerViewControllerDelegate {
    func startStockManaging(completionHandler: @escaping (() -> Void))
}


extension JuiceMakerCoordinator: JuiceMakerViewControllerDelegate {
    func startStockManaging(completionHandler: @escaping (() -> Void)) {
        guard let currentViewController = self.navigationController.viewControllers.last else { return }
        let stockManager = StockManager(fruitStore: fruitStore)
        let stockManagerViewController = StockManagerViewController.instantiate(
            stockManagerUseCase: stockManager,
            dismissingHandler: completionHandler
        )
        let destinationViewController = UINavigationController(rootViewController: stockManagerViewController)
        self.navigationController.present(destinationViewController, animated: true)
    }
}
