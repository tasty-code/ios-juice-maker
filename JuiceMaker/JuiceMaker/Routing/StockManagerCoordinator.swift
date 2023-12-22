//
//  StockManagerCoordinator.swift
//  JuiceMaker
//
//  Created by Effie on 12/22/23.
//

import UIKit

final class StockManagerCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var coordinator: StockManagerCoordinatorDelegate?
    
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
        let stockManager = StockManager(fruitStore: fruitStore)
        let stockManagerViewController = StockManagerViewController.instantiate(
            stockManagerUseCase: stockManager,
            coordinator: self
        )
        let destinationViewController = UINavigationController(rootViewController: stockManagerViewController)
        self.navigationController.present(destinationViewController, animated: true)
    }
}

// MARK: - StockManagerViewControllerDelegate Implementation

protocol StockManagerViewControllerDelegate {
    func endStockManaging()
}

extension StockManagerCoordinator: StockManagerViewControllerDelegate {
    func endStockManaging() {
//        guard let viewController = self.navigationController.viewControllers.last else { return }
//        viewController.dismiss(animated: true)
        self.navigationController.dismiss(animated: true)
        self.coordinator?.didEndStockManaging(self)
    }
}
