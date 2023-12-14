//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceOrderViewController: UIViewController, StoreViewUpdatable {
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    var labels: Dictionary<UILabel, Fruit> = [:]
    var fruitStore: FruitStore = FruitStore.shared
    private var juiceMaker: JuiceMaker = JuiceMaker()
    private let jucieMenu: [Juice] = Juice.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabels()
        configureFruitStoreUI()
    }

}

extension JuiceOrderViewController {
    func setLabels() {
        labels = [strawberryLabel : .strawberry, bananaLabel : .banana, pineappleLabel : .pineapple, kiwiLabel : .kiwi, mangoLabel : .mango]
    }
    
    func goToStockCangeView() {
        guard let secondVC = storyboard?.instantiateViewController(withIdentifier: ViewID.secondVC.id) as? FruitStockViewController else { return }
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    @IBAction func stockChangeButtonTapped(_ sender: UIBarButtonItem) {
        goToStockCangeView()
    }
    
    @IBAction func juiceButtonTapped(_ sender: UIButton) {
        guard let juice =  juiceMaker.makeJuice(juice: jucieMenu[sender.tag]) else {
            present(Alert.juiceFail(goToStockCangeView).modal, animated: true, completion: nil)
            return
        }
        present(Alert.juiceSucess(juice).modal, animated: true, completion: nil)
        configureFruitStoreUI()
    }
}
