//
//  StockViewController.swift
//  JuiceMaker
//
//  Created by 이보한 on 2023/12/19.
//

import UIKit

final class StockViewController: UIViewController {
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    let fruitStore = FruitStore.shared
    
    private lazy var fruitsLabel: [String: UILabel] = [
        Fruit.strawberry.rawValue : strawberryLabel,
        Fruit.banana.rawValue : bananaLabel,
        Fruit.pineapple.rawValue : pineappleLabel,
        Fruit.kiwi.rawValue : kiwiLabel,
        Fruit.mango.rawValue : mangoLabel
    ]
    
    @IBAction func btnCloseStockView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    private func initView() {
        self.fruitsLabel.forEach { fruit, uiLabel in
            guard let fruitValue = self.fruitStore.fruits[fruit] else {
                return
            }
            uiLabel.text = String(fruitValue)
        }
    }
}
