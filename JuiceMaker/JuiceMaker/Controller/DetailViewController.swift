//
//  DetailViewController.swift
//  JuiceMaker
//
//  Created by Matthew on 12/5/23.
//

import UIKit

final class DetailViewController: UIViewController {
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
        addActionButton()
    }
    
    private func addActionButton() {
        remoteStrawberryButton.addTarget(self, action: #selector(strawberryStepperValueChanged(_:)), for: .valueChanged)
        remoteBananaButton.addTarget(self, action: #selector(bananaStepperValueChanged(_:)), for: .valueChanged)
        remotePineappleButton.addTarget(self, action: #selector(pineappleStepperValueChanged(_:)), for: .valueChanged)
        remoteKiwiButton.addTarget(self, action: #selector(kiwiStepperValueChanged(_:)), for: .valueChanged)
        remotemangoButton.addTarget(self, action: #selector(mangoStepperValueChanged(_:)), for: .valueChanged)
    }
    
    private func setupLabel() {
        quantityStrawberryLabel.text = FruitStore.shared.showFruitQuantity(fruit: Fruit.strawberry)
        quantityBananaLabel.text = FruitStore.shared.showFruitQuantity(fruit: Fruit.banana)
        quantityPineappleLabel.text = FruitStore.shared.showFruitQuantity(fruit: Fruit.pineapple)
        quantityKiwiLabel.text = FruitStore.shared.showFruitQuantity(fruit: Fruit.kiwi)
        quantityMangoLabel.text = FruitStore.shared.showFruitQuantity(fruit: Fruit.mango)
    }
    
    @objc
    private func strawberryStepperValueChanged(_ sender: UIStepper) {
        let currentValue = Int(sender.value)
        let previousValue = Int(sender.tag)
        
        if currentValue > previousValue {
            FruitStore.shared.addFruitQuantity(fruit: Fruit.strawberry)
        } else if currentValue < previousValue {
            FruitStore.shared.deleteFruitQuantity(fruit: Fruit.strawberry)
        }
        
        sender.tag = Int(sender.value)
        setupLabel()
    }
    
    @objc
    private func bananaStepperValueChanged(_ sender: UIStepper) {
        let currentValue = Int(sender.value)
        let previousValue = Int(sender.tag)
        
        if currentValue > previousValue {
            FruitStore.shared.addFruitQuantity(fruit: Fruit.banana)
        } else if currentValue < previousValue {
            FruitStore.shared.deleteFruitQuantity(fruit: Fruit.banana)
        }
        
        sender.tag = Int(sender.value)
        setupLabel()
    }
    
    @objc
    private func pineappleStepperValueChanged(_ sender: UIStepper) {
        let currentValue = Int(sender.value)
        let previousValue = Int(sender.tag)
        
        if currentValue > previousValue {
            FruitStore.shared.addFruitQuantity(fruit: Fruit.pineapple)
        } else if currentValue < previousValue {
            FruitStore.shared.deleteFruitQuantity(fruit: Fruit.pineapple)
        }
        
        sender.tag = Int(sender.value)
        setupLabel()
    }
    
    @objc
    private func kiwiStepperValueChanged(_ sender: UIStepper) {
        let currentValue = Int(sender.value)
        let previousValue = Int(sender.tag)
        
//        if currentValue > previousValue ? fruitStore.addFruitQuantity(fruit: FruitType.kiwi) : fruitStore.deleteFruitQuantity(fruit: FruitType.kiwi)
//    }
//        
//        if currentValue > previousValue {
//            fruitStore.addFruitQuantity(fruit: FruitType.kiwi)
//        } else if currentValue < previousValue {
//            fruitStore.deleteFruitQuantity(fruit: FruitType.kiwi)
//        }
        
        sender.tag = Int(sender.value)
        setupLabel()
    }
    
    @objc
    private func mangoStepperValueChanged(_ sender: UIStepper) {
        let currentValue = Int(sender.value)
        let previousValue = Int(sender.tag)
        
        if currentValue > previousValue {
            FruitStore.shared.addFruitQuantity(fruit: Fruit.mango)
        } else if currentValue < previousValue {
            FruitStore.shared.deleteFruitQuantity(fruit: Fruit.mango)
        }
        
        sender.tag = Int(sender.value)
        setupLabel()
    }
    
    
}
