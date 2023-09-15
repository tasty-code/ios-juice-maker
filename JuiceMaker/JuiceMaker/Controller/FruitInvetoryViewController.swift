//
//  FruitInvetoryViweController.swift
//  JuiceMaker
//
//  Created by 김준성 on 2023/09/14.
//

import UIKit

class FruitInventoryViewController: UIViewController {
    private let juiceMaker = JuiceMaker()
    
    @IBOutlet var strawberryCountLabel: UILabel!
    @IBOutlet var bananaCountLabel: UILabel!
    @IBOutlet var pineappleCountLabel: UILabel!
    @IBOutlet var kiwiCountLabel: UILabel!
    @IBOutlet var mangoCountLabel: UILabel!
    
    @IBOutlet var strawberryStepper: UIStepper!
    @IBOutlet var bananaStepper: UIStepper!
    @IBOutlet var pineappleStepper: UIStepper!
    @IBOutlet var kiwiStepper: UIStepper!
    @IBOutlet var mangoStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        strawberryCountLabel.text = "\(FruitStore.shared.strawberry)"
        bananaCountLabel.text = "\(FruitStore.shared.banana)"
        pineappleCountLabel.text = "\(FruitStore.shared.pineapple)"
        kiwiCountLabel.text = "\(FruitStore.shared.kiwi)"
        mangoCountLabel.text = "\(FruitStore.shared.mango)"
        
        strawberryStepper.value = Double(FruitStore.shared.strawberry)
        bananaStepper.value = Double(FruitStore.shared.banana)
        pineappleStepper.value = Double(FruitStore.shared.pineapple)
        kiwiStepper.value = Double(FruitStore.shared.kiwi)
        mangoStepper.value = Double(FruitStore.shared.mango)
        
        strawberryStepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        bananaStepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        pineappleStepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        kiwiStepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        mangoStepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let value = Int(sender.value)
        do {
            if sender == strawberryStepper {
                let fruitCount = FruitStore.shared.strawberry
                if value > fruitCount {
                    try juiceMaker.add(fruitType: .strawberry)
                } else if value < fruitCount {
                    try juiceMaker.sub(fruitType: .strawberry)
                }
                strawberryCountLabel.text = "\(FruitStore.shared.strawberry)"
            } else if sender == bananaStepper {
                let fruitCount = FruitStore.shared.banana
                if value > fruitCount {
                    try juiceMaker.add(fruitType: .banana)
                } else if value < fruitCount {
                    try juiceMaker.sub(fruitType: .banana)
                }
                bananaCountLabel.text = "\(FruitStore.shared.banana)"
            } else if sender == mangoStepper {
                let fruitCount = FruitStore.shared.mango
                if value > fruitCount {
                    try juiceMaker.add(fruitType: .mango)
                } else if value < fruitCount {
                    try juiceMaker.sub(fruitType: .mango)
                }
                mangoCountLabel.text = "\(FruitStore.shared.mango)"
            } else if sender == kiwiStepper {
                let fruitCount = FruitStore.shared.kiwi
                if value > fruitCount {
                    try juiceMaker.add(fruitType: .kiwi)
                } else if value < fruitCount {
                    try juiceMaker.sub(fruitType: .kiwi)
                }
                kiwiCountLabel.text = "\(FruitStore.shared.kiwi)"
            } else if sender == pineappleStepper {
                let fruitCount = FruitStore.shared.pineapple
                if value > fruitCount {
                    try juiceMaker.add(fruitType: .pineapple)
                } else if value < fruitCount {
                    try juiceMaker.sub(fruitType: .pineapple)
                }
                pineappleCountLabel.text = "\(FruitStore.shared.pineapple)"
            }
        } catch {
            return
        }
    }
}
