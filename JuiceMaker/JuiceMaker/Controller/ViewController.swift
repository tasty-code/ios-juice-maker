//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    let juiceMaker = JuiceMaker()

    @IBOutlet var stockLabels: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for stock in stockLabels {
            stock.text = String(FruitStore.defaultStock)
        }
    }

    @IBAction func orderButton(_ sender: UIButton) {
        guard let buttonName = sender.currentTitle else {
            return
        }
        let juiceName = buttonName.components(separatedBy: " ")[0]
        for juice in Juice.allCases {
            guard juiceName == juice.rawValue else {
                continue
            }
            do {
                try juiceMaker.makeJuice(juice)
                let recipe = juice.recipe
                for (fruit, _) in recipe {
                    guard let fruitStock = juiceMaker.fruitStore.stockByFruit[fruit] else {
                        throw JuiceMakerError.notExistFruit
                    }
                    stockLabels[fruit.rawValue].text = String(fruitStock)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

