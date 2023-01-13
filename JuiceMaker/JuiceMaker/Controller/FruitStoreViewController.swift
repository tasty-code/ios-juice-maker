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

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func backButtonTapped(_ sender: UIBarButtonItem) {
        fruitSteppers.forEach { stepper in
            guard let fruit = (stepper as? FruitStepper)?.fruit else { return }
            FruitStore.shared.update(fruit: fruit, quantity: Int(stepper.value))
        }
        self.dismiss(animated: true)
    }
    
    @IBAction func stepperTapped(_ sender: UIStepper) {
        fruitLabels.forEach { label in
            guard let label = label as? FruitLabel, let stepper = sender as? FruitStepper else { return }
            
            if label.fruit == stepper.fruit {
                label.text = Int(sender.value).description
            }
        }
    }
}

