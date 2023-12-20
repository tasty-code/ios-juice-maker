//
//  SecondViewController.swift
//  JuiceMaker
//
//  Created by dopamint on 12/12/23.
//

import UIKit


class FruitStockViewController: UIViewController {
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
    
    private var labelDict: Dictionary<UIStepper, UILabel> = [:]
    private var stepperDict: Dictionary<UIStepper, Fruit> = [:]
    var frutCount: ((Fruit) -> Int)?
    var updateFruitStore: ((Dictionary<Fruit, Int>) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStepperDict()
        setLabelDict()
        labelDict.forEach(setLabelText)
    }
    
}

extension FruitStockViewController {
    @IBAction func closeButtoonTapped(_ sender: UIButton) {
        dismissFruitStockViewController()
    }
    
    @IBAction func stepperTapped(_ sender: UIStepper) {
        guard let label = labelDict[sender] else {
            return
        }
        setLabelText(stepper: sender, label: label)
    }
    
    func dismissFruitStockViewController() {
        let store: Dictionary<Fruit, Int> = stepperDict.reduce(into: [:]) { (fruitStore, property) in
            let (stepper, fruit) = property
            fruitStore[fruit] = Int(stepper.value)
        }
        updateFruitStore?(store)
        self.dismiss(animated: false)
    }
    
    func setLabelDict() {
        labelDict = [strawberryStepper: strawberryLabel, bananaStepper: bananaLabel, pineappleStepper: pineappleLabel, kiwiStepper: kiwiLabel, mangoStepper: mangoLabel]
    }
    
    func setStepperDict() {
        stepperDict = [strawberryStepper : .strawberry, bananaStepper : .banana, pineappleStepper : .pineapple, kiwiStepper : .kiwi, mangoStepper : .mango]
        stepperDict.forEach(setStepper)
    }
    
    func setStepper(stepper: UIStepper, fruit: Fruit) {
        stepper.minimumValue = fruit.minimum
        stepper.maximumValue = fruit.maximum
        stepper.value = Double(frutCount?(fruit) ?? 0)
    }
    
    func setLabelText(stepper: UIStepper, label: UILabel) {
        label.text = String(Int(stepper.value))
    }
}
