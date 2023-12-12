//
//  SecondViewController.swift
//  JuiceMaker
//
//  Created by dopamint on 12/12/23.
//

import UIKit


class SecondViewController: UIViewController, FruitStoreViewController {
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    var labels: Dictionary<UILabel, Fruit> = [:]
    var fruitStore: FruitStore = FruitStore.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labels = [strawberryLabel : .strawberry, bananaLabel : .banana, pineappleLabel : .pineapple, kiwiLabel : .kiwi, mangoLabel : .mango]
        configureFruitStoreUI()
    }
}
