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
        setupLabel()
    }

    @IBAction func backButtonTapped(_ sender: UIBarButtonItem) {
    }

    private func setupLabel() {
        fruitLabels.forEach { label in
            guard let fruit = Fruits(rawValue: label.tag) else {
                return
            }
            let quantity = fruitStore.stock(fruit: fruit)
            label.text = String(quantity)
        }
    }
}

