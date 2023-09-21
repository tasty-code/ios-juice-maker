//
//  FruitInventoryViewController.swift
//  JuiceMaker
//
//  Created by 김준성 on 2023/09/14.
//

import UIKit

class FruitInventoryViewController: UIViewController {
    private let juiceMaker = JuiceMaker()
    
    @IBOutlet private var fruitsCountLabels: [UILabel]!
    @IBOutlet private var fruitsCountSteppers: [UIStepper]!
    
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
        for index in 0..<fruitsCountSteppers.count {
            fruitsCountSteppers[index].tag = index
        }
    }
    
    private func setEventActionOfStepper(){
        for fruitsCountStepper in fruitsCountSteppers {
            fruitsCountStepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        }
    }
    
    private func setFruitCountToLabel(_ fruit: Fruit) {
        let (fruitType, fruitCount) = fruit
        
        fruitsCountLabels[fruitType.rawValue].text = "\(fruitCount)"
    }
    
    private func setFruitCountToStepperValue(_ fruit: Fruit) {
        let (fruitType, fruitCount) = fruit
        
        fruitsCountSteppers[fruitType.rawValue].value = Double(fruitCount)
    }
}
