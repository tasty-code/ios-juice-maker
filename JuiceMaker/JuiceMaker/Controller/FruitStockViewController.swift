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
    
    @IBOutlet weak var fruitStockSaveButton: UIButton!
    
    private var labelDict: Dictionary<UIStepper, UILabel> = [:]
    private var stepperDict: Dictionary<UIStepper, Fruit> = [:]
    var fruitCount: ((Fruit) -> Int)?
    var updateFruitStore: ((Dictionary<Fruit, Int>) -> Void)?
    var originStockValue: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fruitStockSaveButton.isEnabled = false
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
        fruitStockSaveButton.isEnabled = stepperDict.map { Int($0.key.value) } == originStockValue ? false : true
    }
    
    @IBAction func fruitStockSaveButtonTapped() {
        let store: Dictionary<Fruit, Int> = stepperDict.reduce(into: [:]) {
            (fruitStore, keyValuePair) in
            let (stepper, fruit) = keyValuePair
            fruitStore[fruit] = Int(stepper.value)
        }
        updateFruitStore?(store)
        originStockValue = stepperDict.map { Int($0.key.value) }
        fruitStockSaveButton.isEnabled = false
        makeAlert(title: "알림", message: "재고가 수정되었습니다!")
    }
    
    func dismissFruitStockViewController() {
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
        stepper.value = Double(fruitCount?(fruit) ?? 0)
        originStockValue.append(Int(stepper.value))
    }
    
    func setLabelText(stepper: UIStepper, label: UILabel) {
        label.text = String(Int(stepper.value))
    }
}
