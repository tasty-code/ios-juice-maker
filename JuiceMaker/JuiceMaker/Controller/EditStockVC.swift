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
        setUI()
        setSteppersValues()
    }
    
    private func setSteppersValues() {
        for stepper in StepperButtons {
            guard let fruit = Fruits(rawValue: stepper.tag),
                  let fruitStock = FruitStore.shared.fruits[fruit]?.stock else { return }
            let fruitStockDouble = Double(fruitStock)
            stepper.value = fruitStockDouble
        }
    }
    
    private func setUI() {
        editStockViewTitleLabel.text = "재고 추가"
        setFruitLabels()
    }
    
    private func setFruitLabels() {
        for fruitStockLabel in fruitStockLabels {
            guard let fruit = Fruits(rawValue: fruitStockLabel.tag),
                  let fruitStock = FruitStore.shared.fruits[fruit]?.stock else { return }
            let fruitStockDouble = String(fruitStock)
            fruitStockLabel.text = fruitStockDouble
        }
    }
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        for changedFruitStock in fruitStockLabels {
            guard let fruit = Fruits(rawValue: changedFruitStock.tag),
                  let fruitStock = changedFruitStock.text,
                  let changedFruitStock = Int(fruitStock) else { return }
            FruitStore.shared.fruits[fruit]?.stock = changedFruitStock
        }
        print(FruitStore.shared.fruits)
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        let selectedButtonTag = sender.tag
        let pairedLabel = fruitStockLabels[selectedButtonTag]
        pairedLabel.text = String(Int(sender.value))
    }
    
}
