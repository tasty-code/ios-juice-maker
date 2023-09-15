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

    }
    
    @IBAction func strawberryPressed(_ sender: UIStepper) {
        do {
            if sender.value > Double(FruitStore.shared.strawberry) {
                try juiceMaker.add(fruit: Fruit(.strawberry, 1))
            } else if sender.value < Double(FruitStore.shared.strawberry) {
                try juiceMaker.sub(fruit: Fruit(.strawberry, 1))
            }
            strawberryCountLabel.text = "\(FruitStore.shared.strawberry)"
        } catch {
            return
        }
    }
    
    @IBAction func bananaPressed(_ sender: UIStepper) {
        do {
            if sender.value > Double(FruitStore.shared.banana) {
                try juiceMaker.add(fruit: Fruit(.banana, 1))
            } else if sender.value < Double(FruitStore.shared.banana) {
                try juiceMaker.sub(fruit: Fruit(.banana, 1))
            }
            bananaCountLabel.text = "\(FruitStore.shared.banana)"
        } catch {
            return
        }
    }
    
    @IBAction func pineapplePressed(_ sender: UIStepper) {
        do {
            if sender.value > Double(FruitStore.shared.pineapple) {
                try juiceMaker.add(fruit: Fruit(.pineapple, 1))
            } else if sender.value < Double(FruitStore.shared.pineapple) {
                try juiceMaker.sub(fruit: Fruit(.pineapple, 1))
            }
            pineappleCountLabel.text = "\(FruitStore.shared.pineapple)"
        } catch {
            return
        }
    }
    
    @IBAction func kiwiPressed(_ sender: UIStepper) {
        do {
            if sender.value > Double(FruitStore.shared.kiwi) {
                try juiceMaker.add(fruit: Fruit(.kiwi, 1))
            } else if sender.value < Double(FruitStore.shared.kiwi) {
                try juiceMaker.sub(fruit: Fruit(.kiwi, 1))
            }
            kiwiCountLabel.text = "\(FruitStore.shared.kiwi)"
        } catch {
            return
        }
    }
    
    @IBAction func mangoPressed(_ sender: UIStepper) {
        do {
            if sender.value > Double(FruitStore.shared.mango) {
                try juiceMaker.add(fruit: Fruit(.mango, 1))
            } else if sender.value < Double(FruitStore.shared.mango) {
                try juiceMaker.sub(fruit: Fruit(.mango, 1))
            }
            mangoCountLabel.text = "\(FruitStore.shared.mango)"
        } catch {
            return
        }
    }
}
