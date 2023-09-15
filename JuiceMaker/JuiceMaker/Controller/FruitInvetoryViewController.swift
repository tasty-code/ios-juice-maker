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
        guard let fruitType = FruitType(rawValue: sender.tag) else {
            return
        }
        do {
            switch fruitType {
            case .strawberry:
                let fruitCount = FruitStore.shared.strawberry
                if value > fruitCount {
                    try juiceMaker.add(fruitType)
                } else if value < fruitCount {
                    try juiceMaker.sub(fruitType)
                }
                strawberryCountLabel.text = "\(FruitStore.shared.strawberry)"
            case .banana:
                let fruitCount = FruitStore.shared.strawberry
                if value > fruitCount {
                    try juiceMaker.add(fruitType)
                } else if value < fruitCount {
                    try juiceMaker.sub(fruitType)
                }
                bananaCountLabel.text = "\(FruitStore.shared.banana)"
            case .pineapple:
                let fruitCount = FruitStore.shared.pineapple
                if value > fruitCount {
                    try juiceMaker.add(fruitType)
                } else if value < fruitCount {
                    try juiceMaker.sub(fruitType)
                }
                pineappleCountLabel.text = "\(FruitStore.shared.pineapple)"
            case .kiwi:
                let fruitCount = FruitStore.shared.kiwi
                if value > fruitCount {
                    try juiceMaker.add(fruitType)
                } else if value < fruitCount {
                    try juiceMaker.sub(fruitType)
                }
                kiwiCountLabel.text = "\(FruitStore.shared.kiwi)"
            case .mango:
                let fruitCount = FruitStore.shared.mango
                if value > fruitCount {
                    try juiceMaker.add(fruitType)
                } else if value < fruitCount {
                    try juiceMaker.sub(fruitType)
                }
                mangoCountLabel.text = "\(FruitStore.shared.mango)"
            }
        } catch {
            return
        }
    }
}
