//
//  JuiceMakerCoordinator.swift
//  JuiceMaker
//
//  Created by Effie on 12/22/23.
//

import UIKit

final class JuiceMakerCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    private let navigationController: UINavigationController
    private let fruitStore: FruitStore
    
    init(navigationController: UINavigationController, fruitStore: FruitStore) {
        self.navigationController = navigationController
        self.fruitStore = fruitStore
    }
    
    func start() {
        let viewController = JuiceMakerViewController.instantiate(
            juiceMakerUseCase: JuiceMaker(fruitStore: self.fruitStore),
            coordinator: self
        )
        self.navigationController.viewControllers = [viewController]
    }
}

// MARK: - JuiceMakerViewControllerDelegate Implementation

protocol JuiceMakerViewControllerDelegate: AnyObject {
    func startStockManaging()
}

extension JuiceMakerCoordinator: JuiceMakerViewControllerDelegate {
    func startStockManaging() {
        let coordinator = StockManagerCoordinator(
            navigationController: self.navigationController,
            fruitStore: self.fruitStore
        )
        coordinator.parentCoordinator = self
        coordinator.start()
        self.childCoordinators.append(coordinator)
    }
}

// MARK: - StockManagerCoordinatorDelegate Implementation

protocol StockManagerCoordinatorDelegate {
    func didEndStockManaging(_ coordinator: StockManagerCoordinator)
}

extension JuiceMakerCoordinator: StockManagerCoordinatorDelegate {
    func didEndStockManaging(_ coordinator: StockManagerCoordinator) {
        self.childCoordinators = self.childCoordinators.filter { $0 !== coordinator }
        handleJuiceMakerViewControllerVisibility()
    }
    
    private func handleJuiceMakerViewControllerVisibility() {
        if let viewController = self.navigationController.viewControllers.last as? ModalViewControllerDismissingHandlable {
            viewController.juiceMakerViewControllerWillAppear()
        }
    }
}

// MARK: - ModalViewControllerDismissingHandlable

protocol ModalViewControllerDismissingHandlable {
    func juiceMakerViewControllerWillAppear()
}
