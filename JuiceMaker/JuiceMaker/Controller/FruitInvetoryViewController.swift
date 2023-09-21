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
            
            let fruit = Fruit(fruitType, fruitCount)
            setFruitCountToLabel(fruit)
            setFruitCountToStepperValue(fruit)
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
            try juiceMaker.update(fruit)
            
            setFruitCountToLabel(Fruit(fruitType, newFruitCount))
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
    
    private func setFruitCountToLabel(_ fruit: Fruit) {
        let (fruitType, fruitCount) = fruit
        
        switch fruitType {
        case .strawberry:
            strawberryCountLabel.text = "\(fruitCount)"
        case .banana:
            bananaCountLabel.text = "\(fruitCount)"
        case .pineapple:
            pineappleCountLabel.text = "\(fruitCount)"
        case .kiwi:
            kiwiCountLabel.text = "\(fruitCount)"
        case .mango:
            mangoCountLabel.text = "\(fruitCount)"
        }
    }
    
    private func setFruitCountToStepperValue(_ fruit: Fruit) {
        let (fruitType, fruitCount) = fruit
        
        switch fruitType {
        case .strawberry:
            strawberryStepper.value = Double(fruitCount)
        case .banana:
            bananaStepper.value = Double(fruitCount)
        case .pineapple:
            pineappleStepper.value = Double(fruitCount)
        case .kiwi:
            kiwiStepper.value = Double(fruitCount)
        case .mango:
            mangoStepper.value = Double(fruitCount)
        }
    }
}
