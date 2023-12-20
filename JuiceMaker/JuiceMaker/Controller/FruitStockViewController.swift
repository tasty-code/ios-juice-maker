//
//  FruitStockViewController.swift
//  JuiceMaker
//
//  Created by Jin-Mac on 12/12/23.
//

import UIKit

protocol FruitStockDelegate: AnyObject {
    func didUpdateFruitStock(fruitStock: [Fruits: Int])
}

class FruitStockViewController: UIViewController {

    weak var delegate: FruitStockDelegate?
    var fruitStock: [Fruits: Int] = [:]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closedStockViewButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}
