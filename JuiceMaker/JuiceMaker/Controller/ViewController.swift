//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var strawberryStock: UILabel!
    @IBOutlet weak var bananaStock: UILabel!
    @IBOutlet weak var pineappleStock: UILabel!
    @IBOutlet weak var kiwiStock: UILabel!
    @IBOutlet weak var mangoStock: UILabel!
    
    var fruitLabelFruitMap: [UILabel: Fruit]!
    var fruitStore = FruitStore(defaultStock: 20)
    var juiceMaker: JuiceMaker<FruitStore>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        juiceMaker = JuiceMaker(fruitStore: fruitStore)

        fruitLabelFruitMap = [
            strawberryStock: .strawberry,
            bananaStock: .banana,
            pineappleStock: .pineapple,
            kiwiStock: .kiwi,
            mangoStock: .mango
        ]
        updateStockValue()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            self.test()
            self.updateStockValue()
        }
    }

    func test() {
        do {
            let juice = try juiceMaker.make(juice: .strawberryJuice)
            print(juice)
        } catch {
            print(error)
        }
       
    }

    func updateStockValue() {
        for (label, fruit) in fruitLabelFruitMap {
            label.text = String(fruitStore.items[fruit, default: 0])
        }
    }

}

