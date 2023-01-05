//
//  JuiceMaker - JuiceViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class JuiceViewController: UIViewController {
    private let juiceMaker = JuiceMaker()
    private let buttonTag: [Int: FruitJuice] = [1: .strawberryBanana,
                                                2: .strawberry,
                                                3: .banana,
                                                4: .pineapple,
                                                5: .mangoKiwi,
                                                6: .kiwi,
                                                7: .mango]

    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureStock()
    }
    
    func configureStock() {
        guard let strawberryStock = FruitStore.shared.stock[.strawberry] else { return }
        guard let bananaStock = FruitStore.shared.stock[.banana] else { return }
        guard let pineappleStock = FruitStore.shared.stock[.pineapple] else { return }
        guard let kiwiStock = FruitStore.shared.stock[.kiwi] else { return }
        guard let mangoStock = FruitStore.shared.stock[.mango] else { return }
        
        strawberryStockLabel.text = String(strawberryStock)
        bananaStockLabel.text = String(bananaStock)
        pineappleStockLabel.text = String(pineappleStock)
        kiwiStockLabel.text = String(kiwiStock)
        mangoStockLabel.text = String(mangoStock)
    }

    @IBAction func juiceOrderButtonTapped(_ sender: UIButton) {
        guard let juice = buttonTag[sender.tag] else { return }
        do {
            try juiceMaker.makeJuice(of: juice)
            configureStock()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    @IBAction func changeStockButtonTapped(_ sender: UIBarButtonItem) {
        guard let stockVC = storyboard?.instantiateViewController(withIdentifier: "StockVC") else {
            return
        }
        navigationController?.pushViewController(stockVC, animated: true)
    }
}

