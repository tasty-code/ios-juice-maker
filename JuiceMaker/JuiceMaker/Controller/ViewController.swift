//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var strawberryAmount: UILabel!
    @IBOutlet weak var bananaAmount: UILabel!
    @IBOutlet weak var kiwiAmount: UILabel!
    @IBOutlet weak var pineappleAmount: UILabel!
    @IBOutlet weak var mangoAmount: UILabel!
    
    private func updateAmount() {
        strawberryAmount.text = String(Fruit.strawberry.amount)
        bananaAmount.text = String(Fruit.banana.amount)
        kiwiAmount.text = String(Fruit.kiwi.amount)
        pineappleAmount.text = String(Fruit.pineapple.amount)
        mangoAmount.text = String(Fruit.mango.amount)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    

}

