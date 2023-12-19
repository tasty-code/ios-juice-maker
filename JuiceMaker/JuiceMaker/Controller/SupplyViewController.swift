//
//  SupplyViewController.swift
//  JuiceMaker
//
//

import UIKit

class SupplyViewController: UIViewController {
    
    @IBOutlet private weak var strawberryCountLabel: UILabel!
    @IBOutlet private weak var bananaCountLabel: UILabel!
    @IBOutlet private weak var pineappleCountLabel: UILabel!
    @IBOutlet private weak var kiwiCountLabel: UILabel!
    @IBOutlet private weak var mangoCountLabel: UILabel!
    
    private let fruitStore = FruitStore.shared

    override func viewDidLoad() {
        super.viewDidLoad()

        reloadFruitsCount()
    }
    
    private func reloadFruitsCount() {
        strawberryCountLabel.text = String(describing: fruitStore.storage[.strawberry])
        bananaCountLabel.text = String(describing: fruitStore.storage[.banana])
        pineappleCountLabel.text = String(describing: fruitStore.storage[.pineapple])
        kiwiCountLabel.text = String(describing: fruitStore.storage[.kiwi])
        mangoCountLabel.text = String(describing: fruitStore.storage[.mango])
    }


}
