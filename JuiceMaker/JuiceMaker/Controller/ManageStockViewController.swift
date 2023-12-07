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
        strawberryStockLabel.text = String(fruitStore.fruitStock[.strawberry] ?? 0)
        bananaStockLabel.text = String(fruitStore.fruitStock[.banana] ?? 0)
        pineappleStockLabel.text = String(fruitStore.fruitStock[.pineapple] ?? 0)
        kiwiStockLabel.text = String(fruitStore.fruitStock[.kiwi] ?? 0)
        mangoStockLabel.text = String(fruitStore.fruitStock[.mango] ?? 0)
    }
    
}
