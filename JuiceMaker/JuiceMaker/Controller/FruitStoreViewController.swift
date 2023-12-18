//
//  FruitsStockViewController.swift
//  JuiceMaker
//
//  Created by Kyle& L
//

import UIKit

final class FruitStoreViewController: UIViewController {
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    var fruitStore: FruitStore
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStockLabelUI()
    }
    
    init?(fruitStore: FruitStore, coder: NSCoder) {
        self.fruitStore = fruitStore
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
    }
    
    private func setStockLabelUI() {
        guard
            let strawberryStock = fruitStore.fruitStocks[.strawberry],
            let bananaStock = fruitStore.fruitStocks[.banana],
            let pineappleStock = fruitStore.fruitStocks[.pineapple],
            let kiwiStock = fruitStore.fruitStocks[.kiwi],
            let mangoStock = fruitStore.fruitStocks[.mango]
        else {
            return
        }
        strawberryStockLabel.text = String(strawberryStock)
        bananaStockLabel.text = String(bananaStock)
        pineappleStockLabel.text = String(pineappleStock)
        kiwiStockLabel.text = String(kiwiStock)
        mangoStockLabel.text = String(mangoStock)
    }
}
