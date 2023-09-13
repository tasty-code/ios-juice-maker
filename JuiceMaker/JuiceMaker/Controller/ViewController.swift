//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    let juiceMaker: JuiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    @IBOutlet weak var orderJuiceButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.manageFruitStock()
    }

    @IBAction func makeJuice(_ sender: UIButton) {
        guard let id = sender.restorationIdentifier else { return }
        do {
            try juiceMaker.makeJuice(juiceName: id)
            manageFruitStock()
        } catch let error {
            print(error)
        }
    }
    
    private func manageFruitStock() {
        let inventory = juiceMaker.checkFruitStoreInventory()
        
        strawberryStockLabel.text = String(inventory["딸기"] ?? 0)
        bananaStockLabel.text = String(inventory["바나나"] ?? 0)
        kiwiStockLabel.text = String(inventory["키위"] ?? 0)
        pineappleStockLabel.text = String(inventory["파인애플"] ?? 0)
        mangoStockLabel.text = String(inventory["망고"] ?? 0)
    }
}

