//
//  FruitInventoryViewController.swift
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
        
        strawberryStepper.tag = 0
        bananaStepper.tag = 1
        pineappleStepper.tag = 2
        kiwiStepper.tag = 3
        mangoStepper.tag = 4
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        for fruitType in FruitType.allCases {
            guard let fruitCount = FruitStore.shared.fruitCountList[fruitType] else {
                return
            }
            
            switch fruitType {
            case .strawberry:
                strawberryCountLabel.text = "\(fruitCount)"
                strawberryStepper.value = Double(fruitCount)
            case .banana:
                bananaCountLabel.text = "\(fruitCount)"
                bananaStepper.value = Double(fruitCount)
            case .pineapple:
                pineappleCountLabel.text = "\(fruitCount)"
                pineappleStepper.value = Double(fruitCount)
            case .kiwi:
                kiwiCountLabel.text = "\(fruitCount)"
                kiwiStepper.value = Double(fruitCount)
            case .mango:
                mangoCountLabel.text = "\(fruitCount)"
                mangoStepper.value = Double(fruitCount)
            }
        }
        
        strawberryStepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        bananaStepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        pineappleStepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        kiwiStepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        mangoStepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let newFruitCount = Int(sender.value)
        guard let fruitType = FruitType(rawValue: sender.tag),
              let fruitCount = FruitStore.shared.fruitCountList[fruitType] else {
            return
        }
        do {
            let fruit = Fruit(fruitType, newFruitCount - fruitCount)
            
            switch fruitType {
            case .strawberry:
                try juiceMaker.update(fruit)
                strawberryCountLabel.text = "\(newFruitCount)"
            case .banana:
                try juiceMaker.update(fruit)
                bananaCountLabel.text = "\(newFruitCount)"
            case .pineapple:
                try juiceMaker.update(fruit)
                pineappleCountLabel.text = "\(newFruitCount)"
            case .kiwi:
                try juiceMaker.update(fruit)
                kiwiCountLabel.text = "\(newFruitCount)"
            case .mango:
                try juiceMaker.update(fruit)
                mangoCountLabel.text = "\(newFruitCount)"
            }
        } catch {
            return
        }
    }
}
