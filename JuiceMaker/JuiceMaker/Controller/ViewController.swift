//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet var fruitLabels: [UILabel]!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabelText(labels: fruitLabels)
    }

    @IBAction func orderJuice(_ sender: UIButton) {
    }

    private func updateLabelText(labels: [UILabel]) {
        let fruitStore = FruitStore.shared
        for label in labels {
            guard let fruit = Fruits(rawValue: label.tag) else {
                return
            }
            label.text = fruitStore.stock(fruit: fruit)
        }
    }
}

