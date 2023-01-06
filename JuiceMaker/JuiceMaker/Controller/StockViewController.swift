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
    
    lazy var stockLabelByFruit: [Fruit: UILabel] = [
        .strawberry: strawberryStockLabel,
        .banana: bananaStockLabel,
        .pineapple: pineappleStockLabel,
        .kiwi: kiwiStockLabel,
        .mango: mangoStockLabel
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "과일 재고 수정"
        
        for fruit in Fruit.allCases {
            updateStockLabel(of: fruit)
        }
    }
    
    private func updateStockLabel(of fruit: Fruit) {
        guard let fruitStock = FruitStore.shared.stock[fruit] else { return }
        guard let stockLabel = stockLabelByFruit[fruit] else { return }
        
        stockLabel.text = String(fruitStock)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        print(sender.value)
    }
    
}
