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
    
    @IBOutlet weak var strawberryBananaOrderButton: orderButton!
    @IBOutlet weak var strawberryOrderButton: orderButton!
    @IBOutlet weak var BananaOrderButton: orderButton!
    @IBOutlet weak var pineappleOrderButton: orderButton!
    @IBOutlet weak var mangoKiwiOrderButton: orderButton!
    @IBOutlet weak var kiwiOrderButton: orderButton!
    @IBOutlet weak var mangoOrderButton: orderButton!
    
    private func updateAmount() {
        strawberryAmount.text = String(Fruit.strawberry.amount)
        bananaAmount.text = String(Fruit.banana.amount)
        kiwiAmount.text = String(Fruit.kiwi.amount)
        pineappleAmount.text = String(Fruit.pineapple.amount)
        mangoAmount.text = String(Fruit.mango.amount)
    }
    
    private func settingOrderButton() {
        
    }
    private func initialSetting() {
        updateAmount()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetting()
    }

    

}

