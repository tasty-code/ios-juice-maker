//
//  SupplyViewController.swift
//  JuiceMaker
//
//

import UIKit

class SupplyViewController: UIViewController {
    
    @IBOutlet private weak var strawberryCount: UILabel!
    @IBOutlet private weak var bananaCount: UILabel!
    @IBOutlet private weak var pineappleCount: UILabel!
    @IBOutlet private weak var kiwiCount: UILabel!
    @IBOutlet private weak var mangoCount: UILabel!
    
    private let fruitStore = FruitStore.shared

    override func viewDidLoad() {
        super.viewDidLoad()

        showFruitsCount()
    }
    
    private func showFruitsCount() {
        strawberryCount.text = fruitStore.storage[FruitStore.Fruit.strawberry]?.description
        bananaCount.text = fruitStore.storage[FruitStore.Fruit.banana]?.description
        pineappleCount.text = fruitStore.storage[FruitStore.Fruit.pineapple]?.description
        kiwiCount.text = fruitStore.storage[FruitStore.Fruit.kiwi]?.description
        mangoCount.text = fruitStore.storage[FruitStore.Fruit.mango]?.description
    }


}
