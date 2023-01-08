//
//  StockViewController.swift
//  JuiceMaker
//
//  Created by Mason Kim on 2023/01/05.
//

import UIKit

final class StockViewController: UIViewController {

    @IBOutlet var fruitStockLabels: [UILabel]!
    @IBOutlet var fruitStockSteppers: [UIStepper]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    func configureUI() {
        navigationItem.title = "과일 재고 수정"
        
        initializeAllStockLabels()
        initializeAllStockSteppers()
    }
    
    private func stockLabel(of fruit: Fruit) -> UILabel? {
        return fruitStockLabels.first { $0.tag == fruit.rawValue }
    }
    
    private func initializeAllStockLabels() {
        for stockLabel in fruitStockLabels {
            guard let fruit = Fruit(rawValue: stockLabel.tag) else { return }
            guard let fruitStock = FruitStore.shared.stock[fruit] else { return }
            stockLabel.text = String(fruitStock)
        }
    }
    
    private func stockStepper(of fruit: Fruit) -> UIStepper? {
        return fruitStockSteppers.first { $0.tag == fruit.rawValue }
    }
    
    private func initializeAllStockSteppers() {
        for stockStepper in fruitStockSteppers {
            guard let fruit = Fruit(rawValue: stockStepper.tag) else { return }
            guard let fruitStock = FruitStore.shared.stock[fruit] else { return }
            stockStepper.value = Double(fruitStock)
        }
    }
    
    @IBAction private func stepperValueChanged(_ sender: UIStepper) {
        guard let fruit = Fruit(rawValue: sender.tag) else { return }
        let changedStock = Int(sender.value)
        
        FruitStore.shared.setStock(of: fruit, to: changedStock)
        
        guard let stockLabel = stockLabel(of: fruit) else { return }
        stockLabel.text = String(changedStock)
    }
    
}