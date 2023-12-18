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

        reloadFruitsCount()
    }
    
    private func reloadFruitsCount() {
        strawberryCount.text = fruitStore.storage[.strawberry]?.description
        bananaCount.text = fruitStore.storage[.banana]?.description
        pineappleCount.text = fruitStore.storage[.pineapple]?.description
        kiwiCount.text = fruitStore.storage[.kiwi]?.description
        mangoCount.text = fruitStore.storage[.mango]?.description
    }


}
