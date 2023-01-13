//
//  StoreViewController.swift
//  JuiceMaker
//
//  Created by 조용현 on 2023/01/06.
//

import UIKit

class StoreViewController: UIViewController {
    
    @IBOutlet var fruitStockLabels: [UILabel]!
    @IBOutlet var fruitSteppers: [UIStepper]!
    
    var fruitStore: FruitStore?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeLabelsAndSteppers()
    }
    
    @IBAction func touchesBackButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func touchesStepper(_ sender: UIStepper) {
        guard let fruitStepper = sender as? FruitComponent else { return }
        updateLabel(of: fruitStepper.fruit,
                    to: fruitStepper.stock)
    }
}


//MARK: - Initailize and Update FruitComponent

extension StoreViewController: FruitView {
    func initializeLabelsAndSteppers() {
        guard let labels = fruitStockLabels as? [FruitComponent],
              let steppers = fruitSteppers as? [FruitComponent],
              let stocks = fruitStore?.items else { return }
        update(targets: labels, with: stocks)
        update(targets: steppers, with: stocks)
    }
    
    func updateLabels(of fruits:[Fruit]){
        guard let labels = fruitStockLabels as? [FruitComponent],
              let stocks = fruitStore?.stockInfo(of: fruits) else { return }
        
        update(targets: labels, with: stocks)
    }
    
    func updateLabel(of fruit: Fruit, to stock: Int) {
        guard let fruitLabels = fruitStockLabels as? [FruitComponent],
              var label = fruitLabels.filter({$0.fruit == fruit}).first else { return }
        label.stock = stock
    }
}
