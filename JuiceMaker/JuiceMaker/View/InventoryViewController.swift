//
//  InventoryViewController.swift
//  JuiceMaker
//
//  Created by EUNJU on 2023/12/05.
//

import UIKit

final class InventoryViewController: UIViewController {

    private let fruitStore = FruitStore.shared
    
    @IBOutlet weak var strawberryQuantityLabel: UILabel!
    @IBOutlet weak var bananaQuantityLabel: UILabel!
    @IBOutlet weak var pineappleQuantityLabel: UILabel!
    @IBOutlet weak var kiwiQuantityLabel: UILabel!
    @IBOutlet weak var mangoQuantityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    private func configureUI() {
        strawberryQuantityLabel.text = String(fruitStore.fruitContainer[.strawberry, default: 0])
        bananaQuantityLabel.text = String(fruitStore.fruitContainer[.banana, default: 0])
        pineappleQuantityLabel.text = String(fruitStore.fruitContainer[.pineapple, default: 0])
        kiwiQuantityLabel.text = String(fruitStore.fruitContainer[.kiwi, default: 0])
        mangoQuantityLabel.text = String(fruitStore.fruitContainer[.mango, default: 0])
    }
}
