//
//  FruitsStockViewController.swift
//  JuiceMaker
//
//  Created by Kyle& L
//

import UIKit

class FruitStoreViewController: UIViewController {
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    var strawberryStock: String = ""
    var bananaStock: String = ""
    var pineappleStock: String = ""
    var kiwiStock: String = ""
    var mangoStock: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        strawberryStockLabel.text = strawberryStock
        bananaStockLabel.text = bananaStock
        pineappleStockLabel.text = pineappleStock
        kiwiStockLabel.text = kiwiStock
        mangoStockLabel.text = mangoStock
    }
}
