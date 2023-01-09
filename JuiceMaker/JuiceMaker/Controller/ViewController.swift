//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet var fruitLabels: [UILabel]!
    
    let fruitStore = FruitStore.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabel(labels: fruitLabels)
        fruitStore.textUpdateDelegate = self
    }

    @IBAction func orderJuice(_ sender: UIButton) {
        guard let juice = Menu(rawValue: sender.tag) else {
            return
        }
        JuiceMaker().order(juice: juice)
    }

    private func setupLabel(labels: [UILabel]) {
        fruitLabels.forEach { label in
            guard let fruit = Fruits(rawValue: label.tag) else {
                return
            }
            let quantity = fruitStore.stock(fruit: fruit)
            label.text = String(quantity)
        }
    }
}

extension ViewController: textUpdateDelegate {
    func updateLabel(fruit: Fruits, quantity: Quantity) {
        fruitLabels.forEach { label in
            if label.tag == fruit.rawValue {
                label.text = String(quantity)
            }
        }
    }
}

protocol textUpdateDelegate: AnyObject {
    func updateLabel(fruit: Fruits, quantity: Quantity)
}
