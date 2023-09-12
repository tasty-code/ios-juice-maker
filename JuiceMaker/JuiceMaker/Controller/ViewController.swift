//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    private let fruitStore: FruitStore = FruitStore(fruits: [
        FruitStore.Fruit(name: "딸기")
    ])
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    
    
    @IBOutlet weak var strawberryLabel: UILabel!
    
    
    
    
    
    @IBAction func navigationBack(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func updateFruitStock(_ sender: UIButton) {
        fruitStore.updateFruitStock(inputFruit: FruitStore.Fruit(name: "딸기"), count: 13)
        strawberryLabel.text = String(fruitStore.fruitList[0].stock)
    }
}

