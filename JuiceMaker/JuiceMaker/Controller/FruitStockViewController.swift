//
//  SecondViewController.swift
//  JuiceMaker
//
//  Created by dopamint on 12/12/23.
//

import UIKit


class FruitStockViewController: FruitStoreViewController {
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabelDict()
        configureFruitStoreUI()
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
}

extension FruitStockViewController {
    func setLabelDict() {
        labelDict = [strawberryLabel: .strawberry, bananaLabel: .banana, pineappleLabel: .pineapple, kiwiLabel: .kiwi, mangoLabel: .mango]
    }
    
    @IBAction func closeButtoonTapped(_ sender: UIBarButtonItem) {
        popFruitStockViewController()
    }
    
    func popFruitStockViewController() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
