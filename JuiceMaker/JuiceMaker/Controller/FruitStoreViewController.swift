//
//  FruitStoreViewController.swift
//  JuiceMaker
//
//  Created by 송선진 on 2023/01/11.
//

import UIKit

final class FruitStoreViewController: UIViewController {

    @IBOutlet var fruitLabels: [UILabel]!
    @IBOutlet var fruitSteppers: [UIStepper]!

    let fruitStore = FruitStore.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetting()
    }

    @IBAction func backButtonTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
    @IBAction func stepperTapped(_ sender: UIStepper) {
        fruitLabels.forEach { label in
            if label.tag == sender.tag {
                label.text = Int(sender.value).description
            }
        }
    }
    
    private func initialSetting() {
        Fruits.allCases.forEach { fruit in
            let quantity = fruitStore.stock(fruit: fruit)
            let tag = fruit.rawValue
            fruitLabels[tag].text = String(quantity)
            fruitSteppers[tag].value = Double(quantity)
        }
    }
}

