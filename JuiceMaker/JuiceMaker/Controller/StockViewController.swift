//
//  StockViewController.swift
//  JuiceMaker
//
//  Created by Mason Kim on 2023/01/05.
//

import UIKit

final class StockViewController: UIViewController {
    
    @IBOutlet weak private var strawberryStockLabel: UILabel!
    @IBOutlet weak private var bananaStockLabel: UILabel!
    @IBOutlet weak private var pineappleStockLabel: UILabel!
    @IBOutlet weak private var kiwiStockLabel: UILabel!
    @IBOutlet weak private var mangoStockLabel: UILabel!

    @IBOutlet weak private var strawberryStockStepper: UIStepper!
    @IBOutlet weak private var bananaStockStepper: UIStepper!
    @IBOutlet weak private var pineappleStockStepper: UIStepper!
    @IBOutlet weak private var kiwiStockStepper: UIStepper!
    @IBOutlet weak private var mangoStockStepper: UIStepper!
    
    private lazy var stockLabelByFruit: [Fruit: UILabel] = [
        .strawberry: strawberryStockLabel,
        .banana: bananaStockLabel,
        .pineapple: pineappleStockLabel,
        .kiwi: kiwiStockLabel,
        .mango: mangoStockLabel
    ]
    
    private lazy var stockStepperByFruit: [Fruit: UIStepper] = [
        .strawberry: strawberryStockStepper,
        .banana: bananaStockStepper,
        .pineapple: pineappleStockStepper,
        .kiwi: kiwiStockStepper,
        .mango: mangoStockStepper,
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "과일 재고 수정"
        
        for fruit in Fruit.allCases {
            updateStockLabel(of: fruit)
            initializeStepperValue(of: fruit)
        }
    }
    
    private func updateStockLabel(of fruit: Fruit) {
        guard let fruitStock = FruitStore.shared.stock[fruit] else { return }
        guard let stockLabel = stockLabelByFruit[fruit] else { return }
        
        stockLabel.text = String(fruitStock)
    }
    
    private func initializeStepperValue(of fruit: Fruit) {
        guard let fruitStock = FruitStore.shared.stock[fruit] else { return }
        guard let stockStepper = stockStepperByFruit[fruit] else { return }
        
        stockStepper.value = Double(fruitStock)
    }
    
    @IBAction private func stepperValueChanged(_ sender: UIStepper) {
        guard let fruit = Fruit(rawValue: sender.tag) else { return }
        let changedStock = Int(sender.value)
        
        FruitStore.shared.setStock(of: fruit, to: changedStock)
        
        guard let stockLabel = stockLabelByFruit[fruit] else { return }
        stockLabel.text = String(changedStock)
    }
    
}
