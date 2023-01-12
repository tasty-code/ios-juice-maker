//
//  JuiceMaker - JuiceViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class JuiceViewController: UIViewController {
    // MARK: - Properties
    private let juiceMaker = JuiceMaker()
    
    @IBOutlet private var fruitStockLabels: [UILabel]!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateAllStockLabels()
    }
    
    // MARK: - Actions
    @IBAction private func tappedJuiceOrderButton(_ sender: UIButton) {
        guard let button = sender as? JuiceButtonProtocol else { return }
        let fruitJuice = button.fruitJuice
        
        do {
            try juiceMaker.makeJuice(of: fruitJuice)
        } catch StockError.notEnoughToMakeJuice {
            showMakeJuiceFailedAlert()
        } catch {
            print(error.localizedDescription)
        }
        
        showMakeJuiceCompletedAlert(of: fruitJuice)
        updateStockLabels(of: fruitJuice)
    }
    
    @IBAction private func tappedChangeStockButton(_ sender: UIBarButtonItem) {
        moveToStockVC()
    }
    
    // MARK: - Helpers
    private func stockLabel(of fruit: Fruit) -> UILabel? {
        return fruitStockLabels.first { stockLabel in
            guard let fruitLabel = stockLabel as? FruitLabelProtocol else {
                return false
            }
            return fruitLabel.fruit == fruit
        }
    }
    
    private func updateStockLabel(of fruit: Fruit) {
        guard let fruitStock = FruitStore.shared.stock[fruit] else { return }
        guard let stockLabel = stockLabel(of: fruit) else { return }
        
        stockLabel.text = String(fruitStock)
    }
    
    private func updateStockLabels(of fruitJuice: FruitJuice) {
        for fruit in fruitJuice.recipe.keys {
            updateStockLabel(of: fruit)
        }
    }
    
    private func updateAllStockLabels() {
        for stockLabel in fruitStockLabels {
            guard let fruitLabel = stockLabel as? FruitLabelProtocol else { return }
            let fruit = fruitLabel.fruit
            guard let fruitStock = FruitStore.shared.stock[fruit] else { return }
            stockLabel.text = String(fruitStock)
        }
    }
    
    private func showMakeJuiceCompletedAlert(of fruitJuice: FruitJuice) {
        let alert = UIAlertController(title: fruitJuice.servingMessage,
                                      message: Constants.UserMessage.servingJuiceExtra,
                                      preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: Constants.UserMessage.servingJuiceConfirm,
                                          style: .default)
        alert.addAction(confirmAction)
        self.present(alert, animated: true)
    }
    
    private func showMakeJuiceFailedAlert() {
        let stockError = StockError.notEnoughToMakeJuice
        
        let alert = UIAlertController(title: stockError.localizedDescription,
                                      message: stockError.userMessage,
                                      preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: Constants.UserMessage.failedJuiceConfirm,
                                          style: .default) { _ in
            self.moveToStockVC()
        }
        let cancelAction = UIAlertAction(title: Constants.UserMessage.failedJuiceCancel,
                                         style: .cancel)
        alert.addAction(confirmAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true)
    }
    
    private func moveToStockVC() {
        guard let stockVC = storyboard?
            .instantiateViewController(withIdentifier: Constants.Identifier.stockViewController)
                as? StockViewController else { return }
        stockVC.delegate = self

        present(stockVC, animated: true)
    }
}

// MARK: - StockViewControllerDelegate
extension JuiceViewController: StockViewControllerDelegate {
    func didChangeStock() {
        updateAllStockLabels()
    }
}

