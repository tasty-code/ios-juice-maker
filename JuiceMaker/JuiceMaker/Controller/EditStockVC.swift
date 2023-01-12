//
//  EditStockVC.swift
//  JuiceMaker
//
//  Created by DONGWOOK SEO on 2023/01/06.
//

import UIKit

class EditStockVC: UIViewController {
    
    @IBOutlet var fruitStockLabels: [UILabel]!
    @IBOutlet var StepperButtons: [UIStepper]!
    @IBOutlet weak var editStockViewTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConfigure()
        
    }
    
    private func setSteppersValues() {
        for stepper in StepperButtons {
            guard let stepperButton = stepper as? FruitStockManagable,
            let fruitStock = FruitStore.shared.fruits[stepperButton.fruitName]?.stock else { return }
            let fruitStockDouble = Double(fruitStock)
            stepper.value = fruitStockDouble
        }
    }
    
    private func setConfigure() {
        editStockViewTitleLabel.text = "재고 추가"
        setFruitLabels()
        setSteppersValues()
    }
    
    private func setFruitLabels() {
        for fruitStockLabel in fruitStockLabels {
            guard let label = fruitStockLabel as? FruitStockManagable,
                  let fruitStock = FruitStore.shared.fruits[label.fruitName]?.stock else { return }
            let changeStockIntToString = String(fruitStock)
            fruitStockLabel.text = changeStockIntToString
        }
    }
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        for changedFruitStock in fruitStockLabels {
            guard let fruitStock = changedFruitStock as? FruitStockManagable,
                  let fruitStockLabel = changedFruitStock.text,
                  let changedFruitStock = Int(fruitStockLabel) else { return }
            FruitStore.shared.fruits[fruitStock.fruitName]?.stock = changedFruitStock
        }
        dismiss(animated: true)
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        let selectedButtonTag = sender.tag
        let pairedLabel = fruitStockLabels[selectedButtonTag]
        pairedLabel.text = String(Int(sender.value))
    }
}
