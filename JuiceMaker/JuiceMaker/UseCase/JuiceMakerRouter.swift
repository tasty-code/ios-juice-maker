//
//  JuiceMakerRouter.swift
//  JuiceMaker
//
//  Created by Effie on 12/12/23.
//

import UIKit

final class JuiceMakerRouter {
    private let sourceDataStore: FruitStore
    var sourceViewController: JuiceMakerViewController?
    
    init(dataStore: FruitStore) {
        self.sourceDataStore = dataStore
    }
    
    func routeToStockManager() {
        guard let sourceViewController else { return }
        
        let storyboard = UIStoryboard(name: "Main", bundle: .none)
        let destinationViewController: StockManagerViewController = storyboard.instantiateViewController(
            identifier: StockManagerViewController.storyboardIdentifier
        ) { [weak self] coder in
            guard let self else { return StockManagerViewController(coder: coder) }
            return StockManagerViewController(coder: coder, fruitStore: sourceDataStore)
        }
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

