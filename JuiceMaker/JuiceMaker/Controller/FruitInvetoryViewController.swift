//
//  FruitInventoryViewController.swift
//  JuiceMaker
//
//  Created by 김준성 on 2023/09/14.
//

import UIKit

class FruitInventoryViewController: UIViewController {
    private let juiceMaker = JuiceMaker()
    
    @IBOutlet private var strawberryCountLabel: UILabel!
    @IBOutlet private var bananaCountLabel: UILabel!
    @IBOutlet private var pineappleCountLabel: UILabel!
    @IBOutlet private var kiwiCountLabel: UILabel!
    @IBOutlet private var mangoCountLabel: UILabel!
    
    @IBOutlet private var strawberryStepper: UIStepper!
    @IBOutlet private var bananaStepper: UIStepper!
    @IBOutlet private var pineappleStepper: UIStepper!
    @IBOutlet private var kiwiStepper: UIStepper!
    @IBOutlet private var mangoStepper: UIStepper!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTagOfStepper()
        setEventActionOfStepper()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        for fruitType in FruitType.allCases {
            guard let fruitCount = FruitStore.shared.fruitCounts[fruitType] else {
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
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let newFruitCount = Int(sender.value)
        guard let fruitType = FruitType(rawValue: sender.tag),
              let fruitCount = FruitStore.shared.fruitCounts[fruitType] else {
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
    
    private func setTagOfStepper(){
        strawberryStepper.tag = 0
        bananaStepper.tag = 1
        pineappleStepper.tag = 2
        kiwiStepper.tag = 3
        mangoStepper.tag = 4
    }
    
    private func setEventActionOfStepper(){
        strawberryStepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        bananaStepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        pineappleStepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        kiwiStepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        mangoStepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
    }
}
