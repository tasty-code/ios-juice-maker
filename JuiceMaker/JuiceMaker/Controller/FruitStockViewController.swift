//
//  SecondViewController.swift
//  JuiceMaker
//
//  Created by dopamint on 12/12/23.
//

import UIKit

final class FruitStockViewController: UIViewController {
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
    
    private var stepperByLabel: Dictionary<UIStepper, UILabel> = [:]
    private var stepperByFruit: Dictionary<UIStepper, Fruit> = [:]
//    var fruitCount: ((Fruit) -> Int)?
//    var updateFruitStore: ((Dictionary<Fruit, Int>) -> Void)?
    private var originStockValue: [Int] = []
    weak var delegate: FruitStockDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fruitStockSaveButton.isEnabled = false
        setLabelDict()
        setStepperDict()
    }
}

extension FruitStockViewController {
    @IBAction func closeButtoonTapped(_ sender: UIButton) {
        dismissFruitStockViewController()
    }
    
    @IBAction func stepperTapped(_ sender: UIStepper) {
        guard let label = stepperByLabel[sender] else {
            return
        }   
        setLabelText(stepper: sender, label: label)
        
        var isFruitCountChanged: Bool = false
        var index: Int = 0
        for stepper in stepperByFruit.keys {
            if Int(stepper.value) != originStockValue[index] {
                isFruitCountChanged = true
                break
            }
            index += 1
        }
        
        fruitStockSaveButton.isEnabled = isFruitCountChanged ? true : false
    }
    
    @IBAction func fruitStockSaveButtonTapped() {
        let store: Dictionary<Fruit, Int> = stepperByFruit.reduce(into: [:]) {
            (fruitStore, keyValuePair) in
            let (stepper, fruit) = keyValuePair
            fruitStore[fruit] = Int(stepper.value)
        }
//        updateFruitStore?(store)
        delegate?.updateFruitStore(newFruitStore: store)
        originStockValue = stepperByFruit.map { Int($0.key.value) }
        fruitStockSaveButton.isEnabled = false
        makeAlert(title: "알림", message: "재고가 수정되었습니다!")
    }
    
    private func dismissFruitStockViewController() {
        self.dismiss(animated: false)
    }
    
    private func setLabelDict() {
        stepperByLabel = [strawberryStepper: strawberryLabel, bananaStepper: bananaLabel, pineappleStepper: pineappleLabel, kiwiStepper: kiwiLabel, mangoStepper: mangoLabel]
    }
    
    private func setStepperDict() {
        stepperByFruit = [strawberryStepper: .strawberry, bananaStepper: .banana, pineappleStepper: .pineapple, kiwiStepper: .kiwi, mangoStepper: .mango]
        stepperByFruit.forEach(setStepper)
        stepperByLabel.forEach(setLabelText)
    }
    
    private func setStepper(stepper: UIStepper, fruit: Fruit) {
        stepper.minimumValue = fruit.minimum
        stepper.maximumValue = fruit.maximum
//        stepper.value = Double(fruitCount?(fruit) ?? 0)
        stepper.value = Double(delegate?.fruitCount(fruit: fruit) ?? 0)
        originStockValue.append(Int(stepper.value))
    }
    
    private func setLabelText(stepper: UIStepper, label: UILabel) {
        label.text = String(Int(stepper.value))
    }
}
