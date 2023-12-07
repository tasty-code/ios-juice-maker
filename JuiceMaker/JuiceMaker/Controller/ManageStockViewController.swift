//
//  ManageStockViewController.swift
//  JuiceMaker
//
//  Created by 미르 & 미성
//

import UIKit

class ManageStockViewController: UIViewController {

    let fruitStore = FruitStore.shared
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkFruitsStock()

        navigationController?.navigationBar.topItem?.backButtonTitle = "뒤로 가기"
    }
    
    func checkFruitsStock() {
        let stock = fruitStore.fruitStock.compactMapValues { String($0) }
        
        strawberryStockLabel.text = stock[.strawberry]
        bananaStockLabel.text = stock[.banana]
        pineappleStockLabel.text = stock[.pineapple]
        kiwiStockLabel.text = stock[.kiwi]
        mangoStockLabel.text = stock[.mango]
    }
    
}
