//
//  AddStockViewController.swift
//  JuiceMaker
//
//  Created by jun on 2023/01/12.
//

import UIKit

class AddStockViewController: UIViewController {
    var fruitStore: FruitStore!

    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initLabels()
    }

    func initLabels() {
        let strawberryStock = fruitStore.stock(byFruit: .strawberry)
        strawberryStockLabel.text = String(strawberryStock)

        let bananaStock = fruitStore.stock(byFruit: .banana)
        bananaStockLabel.text = String(bananaStock)

        let pineappleStock = fruitStore.stock(byFruit: .pineapple)
        pineappleStockLabel.text = String(pineappleStock)

        let kiwiStock = fruitStore.stock(byFruit: .kiwi)
        kiwiStockLabel.text = String(kiwiStock)

        let mangoStock = fruitStore.stock(byFruit: .mango)
        mangoStockLabel.text = String(mangoStock)
    }

    @IBAction func closeButton(_ sender: UIBarButtonItem) {
        self.presentingViewController?.dismiss(animated: true)
    }
}
