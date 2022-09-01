//
//  JuiceMaker - ViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let juiceMaker = JuiceMaker()
    
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
        if let strawberryAmountInt = juiceMaker.fruitStore.fruits[.strawberry] {
            strawberryAmount.text = String(strawberryAmountInt)
        }
        if let bananaAmountInt = juiceMaker.fruitStore.fruits[.banana] {
            bananaAmount.text = String(bananaAmountInt)
        }
        if let kiwiAmountInt = juiceMaker.fruitStore.fruits[.kiwi] {
            kiwiAmount.text = String(kiwiAmountInt)
        }
        if let pineappleAmountInt = juiceMaker.fruitStore.fruits[.pineapple] {
            pineappleAmount.text = String(pineappleAmountInt)
        }
        if let mangoAmountInt = juiceMaker.fruitStore.fruits[.mango] {
            mangoAmount.text = String(mangoAmountInt)
        }
    }
    
    @IBAction func clickOrderButton(_ sender: orderButton) {
        if juiceMaker.canMake(sender.juice) {
            juiceMaker.makeJuice(sender.juice)
            successMakeJuiceAlert(sender.juice)
        } else {
            failMakeJuiceAlert()
        }
        updateAmount()
    }
    
    private func settingOrderButton() {
        strawberryBananaOrderButton.juice = JuiceMaker.Juice.strawberryBanana
        strawberryOrderButton.juice = JuiceMaker.Juice.strawberry
        bananaOrderButton.juice = JuiceMaker.Juice.banana
        pineappleOrderButton.juice = JuiceMaker.Juice.pineapple
        mangoKiwiOrderButton.juice = JuiceMaker.Juice.mangoKiwi
        kiwiOrderButton.juice = JuiceMaker.Juice.kiwi
        mangoOrderButton.juice = JuiceMaker.Juice.mango
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

