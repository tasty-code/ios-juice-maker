//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    var fruitStore = FruitStore.shared

    @IBOutlet var strawberryQuantityLabel: UILabel!
    @IBOutlet var bananaQuantityLabel: UILabel!
    @IBOutlet var pineappleQuantityLabel: UILabel!
    @IBOutlet var kiwiQuantityLabel: UILabel!
    @IBOutlet var mangoQuantityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayFruitQuantity()
    }
    
    func displayFruitQuantity() {
        if let strawberryQuantity = fruitStore.fruitDictionary["딸기"],
           let bananaQuantity = fruitStore.fruitDictionary["바나나"],
           let pineappleQuantity = fruitStore.fruitDictionary["파인애플"],
           let kiwiQuantity = fruitStore.fruitDictionary["키위"],
           let mangoQuantity = fruitStore.fruitDictionary["망고"]
        {
            strawberryQuantityLabel.text = String(strawberryQuantity)
            bananaQuantityLabel.text = String(bananaQuantity)
            pineappleQuantityLabel.text = String(pineappleQuantity)
            kiwiQuantityLabel.text = String(kiwiQuantity)
            mangoQuantityLabel.text = String(mangoQuantity)
        }
    }
}

