//
//  AddStockViewController.swift
//  JuiceMaker
//
//  Created by jun on 2023/01/12.
//

import UIKit

class AddStockViewController: UIViewController {
    var fruitStore: FruitStore!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func closeButton(_ sender: UIBarButtonItem) {
        self.presentingViewController?.dismiss(animated: true)
    }
}
