//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController, FruitStoreViewController {

    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    var labels: Dictionary<UILabel, Fruit> = [:]
    var fruitStore: FruitStore = FruitStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labels = [strawberryLabel : .strawberry, bananaLabel : .banana, pineappleLabel : .pineapple, kiwiLabel : .kiwi, mangoLabel : .mango]
        configureFroutStoreUI()
    }

}

extension ViewController {
    
    func goToStockCangeView() {
        guard let secondVC = storyboard?.instantiateViewController(withIdentifier: ViewID.secondVC.id) as? SecondViewController else { return }
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    @IBAction func stockChangeButtonTapped(_ sender: UIBarButtonItem) {
        goToStockCangeView()
    }
}

