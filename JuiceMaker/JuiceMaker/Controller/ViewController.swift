//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    let juiceMaker = JuiceMaker()
    @IBOutlet weak var strawberryStock: UILabel!
    @IBOutlet weak var bananaStock: UILabel!
    @IBOutlet weak var pineappleStock: UILabel!
    @IBOutlet weak var kiwiStock: UILabel!
    @IBOutlet weak var mangoStock: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        strawberryStock.text = String(FruitStore.defaultStock)
        bananaStock.text = String(FruitStore.defaultStock)
        pineappleStock.text = String(FruitStore.defaultStock)
        kiwiStock.text = String(FruitStore.defaultStock)
        mangoStock.text = String(FruitStore.defaultStock)
    }
    
    @IBAction func orderButton(_ sender: UIButton) {
        
    }
}

