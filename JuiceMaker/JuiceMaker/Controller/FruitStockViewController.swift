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
    
    @IBOutlet weak var strawberryStepper: FruitStockStepper!
    @IBOutlet weak var bananaStepper: FruitStockStepper!
    @IBOutlet weak var pineappleStepper: FruitStockStepper!
    @IBOutlet weak var kiwiStepper: FruitStockStepper!
    @IBOutlet weak var mangoStepper: FruitStockStepper!
    
    private var stepperDict: Dictionary<FruitStockStepper, Fruit> = [:]
    var onDismissal: (() -> Void)?
    
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
    
    @IBAction func stepperTapped(_ sender: FruitStockStepper) {
        guard let fruit = stepperDict[sender] else {
            return
        }
        
        sender.tappedSign == .plus ? fruitStore.warehouse(fruit: fruit, count: 1) : fruitStore.release(fruit: fruit, count: 1)
        
        configureFruitStoreUI()
    }
    
    func dismissFruitStockViewController() {
        onDismissal?()
        self.dismiss(animated: false)
    }
    
    func setLabelDict() {
        labelDict = [strawberryLabel: .strawberry, bananaLabel: .banana, pineappleLabel: .pineapple, kiwiLabel: .kiwi, mangoLabel: .mango]
    }
    
    func setStepperDict() {
        stepperDict = [strawberryStepper : .strawberry, bananaStepper : .banana, pineappleStepper : .pineapple, kiwiStepper : .kiwi, mangoStepper : .mango]
        stepperDict.forEach(setStepper)
    }
    
    func setStepper(stepper: FruitStockStepper, fruit: Fruit) {
        stepper.minimumValue = fruit.minimum
        stepper.maximumValue = fruit.maximum
        stepper.value = Double(fruitStore.fruitCount(fruit: fruit))
        stepper.oldValue = Double(fruitStore.fruitCount(fruit: fruit))
    }
    
}
