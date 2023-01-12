//
//  StockViewController.swift
//  JuiceMaker
//
//  Created by Mason Kim on 2023/01/05.
//

import UIKit

protocol StockViewControllerDelegate: AnyObject {
    func didChangeStock()
}

final class StockViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet private var fruitStockLabels: [UILabel]!
    @IBOutlet private var fruitStockSteppers: [UIStepper]!
    
    weak var delegate: StockViewControllerDelegate?
    private var isStockChanged: Bool = false
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: - Actions
    @IBAction private func stepperValueChanged(_ sender: UIStepper) {
        guard let fruitStepper = sender as? FruitStepperProtocol else { return }
        let fruit = fruitStepper.fruit
        let changedStock = Int(sender.value)
        
        do {
            try FruitStore.shared.setStock(of: fruit, to: changedStock)
        } catch {
            print(error.localizedDescription)
            return
        }
        
        guard let stockLabel = stockLabel(of: fruit) else { return }
        stockLabel.text = String(changedStock)
        
        isStockChanged = true
    }
    
    @IBAction private func closeButtonTapped(_ sender: UIBarButtonItem) {
        if isStockChanged {
            delegate?.didChangeStock()
        }
        
        dismiss(animated: true)
    }
    
    // MARK: - Helpers
    private func configureUI() {
        initializeAllStockLabels()
        initializeAllStockSteppers()
    }
    
    private func stockLabel(of fruit: Fruit) -> UILabel? {
        return fruitStockLabels.first { stockLabel in
            guard let fruitLabel = stockLabel as? FruitLabelProtocol else {
                return false
            }
            return fruitLabel.fruit == fruit
        }
    }
    
    private func initializeAllStockLabels() {
        for stockLabel in fruitStockLabels {
            guard let fruitLabel = stockLabel as? FruitLabelProtocol else { return }
            let fruit = fruitLabel.fruit
            guard let fruitStock = FruitStore.shared.stock[fruit] else { return }
            stockLabel.text = String(fruitStock)
        }
    }
    
    private func stockStepper(of fruit: Fruit) -> UIStepper? {
        return fruitStockSteppers.first { stockStepper in
            guard let fruitLabel = stockStepper as? FruitStepperProtocol else {
                return false
            }
            return fruitLabel.fruit == fruit
        }
    }
    
    private func initializeAllStockSteppers() {
        for stockStepper in fruitStockSteppers {
            guard let fruitStepper = stockStepper as? FruitStepperProtocol else { return }
            let fruit = fruitStepper.fruit
            guard let fruitStock = FruitStore.shared.stock[fruit] else { return }
            stockStepper.value = Double(fruitStock)
        }
    }
}
