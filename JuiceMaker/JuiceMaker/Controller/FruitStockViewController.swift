//
//  SecondViewController.swift
//  JuiceMaker
//
//  Created by dopamint on 12/12/23.
//

import UIKit


class FruitStockViewController: FruitStoreViewController {
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    private var stepperDict: Dictionary<UIStepper, Fruit> = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabelDict()
        setStepperDict()
        configureFruitStoreUI()
    }
    
}

extension FruitStockViewController {
    @IBAction func closeButtoonTapped(_ sender: UIButton) {
        dismissFruitStockViewController()
    }
    
    @IBAction func stepperTapped(_ sender: UIStepper) {
        guard let fruit = stepperDict[sender] else {
            return
        }
        
        let afterCount: Int = Int(sender.value)
        
        afterCount > fruitStore.fruitCount(fruit: fruit)
            ? fruitStore.warehouse(fruit: fruit, count: 1)
            : fruitStore.release(fruit: fruit, count: 1)
        
        configureFruitStoreUI()
    }
    
    func dismissFruitStockViewController() {
        self.dismiss(animated: false)
    }
    
    func setLabelDict() {
        labelDict = [strawberryLabel: .strawberry, bananaLabel: .banana, pineappleLabel: .pineapple, kiwiLabel: .kiwi, mangoLabel: .mango]
    }
    
    func setStepperDict() {
        stepperDict = [strawberryStepper : .strawberry, bananaStepper : .banana, pineappleStepper : .pineapple, kiwiStepper : .kiwi, mangoStepper : .mango]
        stepperDict.forEach(setStepper)
    }
    
    func setStepper(stepper: UIStepper, fruit: Fruit) {
        stepper.minimumValue = fruit.minimum
        stepper.maximumValue = fruit.maximum
        stepper.value = Double(fruitStore.fruitCount(fruit: fruit))
    }
    
}
