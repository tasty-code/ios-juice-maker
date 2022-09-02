//
//  JuiceMaker - ViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {
    private let juiceMaker = JuiceMaker()
    
    @IBOutlet weak private var strawberryAmount: UILabel!
    @IBOutlet weak private var bananaAmount: UILabel!
    @IBOutlet weak private var kiwiAmount: UILabel!
    @IBOutlet weak private var pineappleAmount: UILabel!
    @IBOutlet weak private var mangoAmount: UILabel!
    
    @IBOutlet weak private var strawberryBananaOrderButton: orderButton!
    @IBOutlet weak private var strawberryOrderButton: orderButton!
    @IBOutlet weak private var bananaOrderButton: orderButton!
    @IBOutlet weak private var pineappleOrderButton: orderButton!
    @IBOutlet weak private var mangoKiwiOrderButton: orderButton!
    @IBOutlet weak private var kiwiOrderButton: orderButton!
    @IBOutlet weak private var mangoOrderButton: orderButton!
    
    private func convert(optionalValue: Int?) -> String{
        guard let value = optionalValue else { return "nil" }
        return String(value)
    }
    
    private func updateAmount() {
        strawberryAmount.text = convert(optionalValue: juiceMaker.fruitStore.fruits[.strawberry])
        bananaAmount.text = convert(optionalValue: juiceMaker.fruitStore.fruits[.banana])
        kiwiAmount.text = convert(optionalValue: juiceMaker.fruitStore.fruits[.kiwi])
        pineappleAmount.text = convert(optionalValue: juiceMaker.fruitStore.fruits[.pineapple])
        mangoAmount.text = convert(optionalValue: juiceMaker.fruitStore.fruits[.mango])
    }

    @IBAction func didTapOrderButton(_ sender: orderButton) {
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

