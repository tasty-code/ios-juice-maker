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
    @IBOutlet weak var bananaOrderButton: orderButton!
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
    
    @IBAction func clickOrderButton(_ sender: orderButton) {
        if sender.juice.canMake {
            JuiceMaker().makeJuice(sender.juice)
            successMakeJuiceAlert(sender.juice)
        } else {
            failMakeJuiceAlert()
        }
        updateAmount()
    }
    
    private func settingOrderButton() {
        strawberryBananaOrderButton.juice = JuiceType.strawberryBanana
        strawberryOrderButton.juice = JuiceType.strawberry
        bananaOrderButton.juice = JuiceType.banana
        pineappleOrderButton.juice = JuiceType.pineapple
        mangoKiwiOrderButton.juice = JuiceType.mangoKiwi
        kiwiOrderButton.juice = JuiceType.kiwi
        mangoOrderButton.juice = JuiceType.mango
    }
    private func initialSetting() {
        updateAmount()
        settingOrderButton()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetting()
    }

    

}

