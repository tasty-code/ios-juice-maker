//
//  DetailViewController.swift
//  JuiceMaker
//
//  Created by Matthew on 12/5/23.
//

import UIKit

class DetailViewController: UIViewController {

    var fruitStore = FruitStore.shared
    
    @IBOutlet weak var quantityStrawberryLabel: UILabel!
    @IBOutlet weak var quantityBananaLabel: UILabel!
    @IBOutlet weak var quantityPineappleLabel: UILabel!
    @IBOutlet weak var quantityKiwiLabel: UILabel!
    @IBOutlet weak var quantityMangoLabel: UILabel!
    
    @IBOutlet weak var remoteStrawberryButton: UIStepper!
    @IBOutlet weak var remoteBananaButton: UIStepper!
    @IBOutlet weak var remotePineappleButton: UIStepper!
    @IBOutlet weak var remoteKiwiButton: UIStepper!
    @IBOutlet weak var remotemangoButton: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabel()
        addTarget()
    }
    
    func addTarget() {
        remoteStrawberryButton.addTarget(self, action: #selector(strawberryStepperValueChanged(_:)), for: .valueChanged)
        remoteBananaButton.addTarget(self, action: #selector(bananaStepperValueChanged(_:)), for: .valueChanged)
        remotePineappleButton.addTarget(self, action: #selector(pineappleStepperValueChanged(_:)), for: .valueChanged)
        remoteKiwiButton.addTarget(self, action: #selector(kiwiStepperValueChanged(_:)), for: .valueChanged)
        remotemangoButton.addTarget(self, action: #selector(mangoStepperValueChanged(_:)), for: .valueChanged)
    }
    
    func setupLabel() {
        quantityStrawberryLabel.text = fruitStore.showFruitQuantity(fruit: FruitType.strawberry)
        quantityBananaLabel.text = fruitStore.showFruitQuantity(fruit: FruitType.banana)
        quantityPineappleLabel.text = fruitStore.showFruitQuantity(fruit: FruitType.pineapple)
        quantityKiwiLabel.text = fruitStore.showFruitQuantity(fruit: FruitType.kiwi)
        quantityMangoLabel.text = fruitStore.showFruitQuantity(fruit: FruitType.mango)
    }
    
    @objc func strawberryStepperValueChanged(_ sender: UIStepper) {
        let currentValue = Int(sender.value)
        let previousValue = Int(sender.tag)
        
        if currentValue > previousValue {
            fruitStore.addFruitQuantity(fruit: FruitType.strawberry)
        } else if currentValue < previousValue {
            fruitStore.deleteFruitQuantity(fruit: FruitType.strawberry)
        }
        
        sender.tag = Int(sender.value)
        setupLabel()
    }
    
    @objc func bananaStepperValueChanged(_ sender: UIStepper) {
        let currentValue = Int(sender.value)
        let previousValue = Int(sender.tag)
        
        if currentValue > previousValue {
            fruitStore.addFruitQuantity(fruit: FruitType.banana)
        } else if currentValue < previousValue {
            fruitStore.deleteFruitQuantity(fruit: FruitType.banana)
        }
        
        sender.tag = Int(sender.value)
        setupLabel()
    }
    
    @objc func pineappleStepperValueChanged(_ sender: UIStepper) {
        let currentValue = Int(sender.value)
        let previousValue = Int(sender.tag)
        
        if currentValue > previousValue {
            fruitStore.addFruitQuantity(fruit: FruitType.pineapple)
        } else if currentValue < previousValue {
            fruitStore.deleteFruitQuantity(fruit: FruitType.pineapple)
        }
        
        sender.tag = Int(sender.value)
        setupLabel()
    }
    
    @objc func kiwiStepperValueChanged(_ sender: UIStepper) {
        let currentValue = Int(sender.value)
        let previousValue = Int(sender.tag)
        
        if currentValue > previousValue {
            fruitStore.addFruitQuantity(fruit: FruitType.kiwi)
        } else if currentValue < previousValue {
            fruitStore.deleteFruitQuantity(fruit: FruitType.kiwi)
        }
        
        sender.tag = Int(sender.value)
        setupLabel()
    }
    
    @objc func mangoStepperValueChanged(_ sender: UIStepper) {
        let currentValue = Int(sender.value)
        let previousValue = Int(sender.tag)
        
        if currentValue > previousValue {
            fruitStore.addFruitQuantity(fruit: FruitType.mango)
        } else if currentValue < previousValue {
            fruitStore.deleteFruitQuantity(fruit: FruitType.mango)
        }
        
        sender.tag = Int(sender.value)
        setupLabel()
    }
    
    
}
