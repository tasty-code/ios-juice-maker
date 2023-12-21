//
//  JuiceMakerRouter.swift
//  JuiceMaker
//
//  Created by Effie on 12/12/23.
//

import UIKit

protocol JuiceMakerRoutable: AnyObject {
    var sourceViewController: JuiceMakerViewController? { get set }
    func routeToNextViewController(dismissingHandler: (() -> Void)?)
}

final class JuiceMakerRouter: JuiceMakerRoutable {
    private let sourceDataStore: FruitStore
    var sourceViewController: JuiceMakerViewController?
    
    init(dataStore: FruitStore) {
        self.sourceDataStore = dataStore
    }
    
    func routeToNextViewController(dismissingHandler: (() -> Void)?) {
        self.routeToStockManager(dismissingHandler: dismissingHandler)
    }
    
    private func routeToStockManager(dismissingHandler: (() -> Void)?) {
        guard let sourceViewController else { return }
        let stockManager = StockManager(fruitStore: sourceDataStore)
        let destinationViewController = StockManagerViewController.instantiate(
            stockManagerUseCase: stockManager,
            dismissingHandler: dismissingHandler
        )
        navigateToStockManager(source: sourceViewController, destination: destinationViewController)
    }
    
    private func navigateToStockManager(
        source: JuiceMakerViewController,
        destination: StockManagerViewController
    ) {
        let navigationController = UINavigationController(rootViewController: destination)
        source.present(navigationController, animated: true)
    }
}

