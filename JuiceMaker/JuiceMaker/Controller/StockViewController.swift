//
//  StockViewController.swift
//  JuiceMaker
//
//  Created by Mason Kim on 2023/01/05.
//

import UIKit

class StockViewController: UIViewController {
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    @IBOutlet weak var strawberryStockStepper: UIStepper!
    @IBOutlet weak var bananaStockStepper: UIStepper!
    @IBOutlet weak var pineappleStockStepper: UIStepper!
    @IBOutlet weak var kiwiStockStepper: UIStepper!
    @IBOutlet weak var mangoStockStepper: UIStepper!
    
    lazy var stockLabelByFruit: [Fruit: UILabel] = [
        .strawberry: strawberryStockLabel,
        .banana: bananaStockLabel,
        .pineapple: pineappleStockLabel,
        .kiwi: kiwiStockLabel,
        .mango: mangoStockLabel
    ]
    
    lazy var stockStepperByFruit: [Fruit: UIStepper] = [
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
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        print(sender.value)
    }
    
}
