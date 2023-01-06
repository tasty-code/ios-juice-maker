//
//  JuiceMaker - JuiceViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class JuiceViewController: UIViewController {
    private let juiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    lazy var stockLabelByFruit: [Fruit: UILabel] = [
        .strawberry: strawberryStockLabel,
        .banana: bananaStockLabel,
        .pineapple: pineappleStockLabel,
        .kiwi: kiwiStockLabel,
        .mango: mangoStockLabel
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for fruit in Fruit.allCases {
            updateStockLabel(of: fruit)
        }
    }
    
    // 해당 과일만 레이블 업데이트
    func updateStockLabel(of fruit: Fruit) {
        guard let fruitStock = FruitStore.shared.stock[fruit] else { return }
        guard let stockLabel = stockLabelByFruit[fruit] else { return }
        
        stockLabel.text = String(fruitStock)
    }
    
    @IBAction func juiceOrderButtonTapped(_ sender: UIButton) {
        guard let fruitJuice = FruitJuice(rawValue: sender.tag) else { return }
        do {
            try juiceMaker.makeJuice(of: fruitJuice)
            showMakeJuiceCompletedAlert(of: fruitJuice)
            for fruit in fruitJuice.recipe.keys {
                updateStockLabel(of: fruit)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @IBAction func changeStockButtonTapped(_ sender: UIBarButtonItem) {
        guard let stockVC = storyboard?.instantiateViewController(withIdentifier: "StockVC") else { return }
        navigationController?.pushViewController(stockVC, animated: true)
    }
    
    func showMakeJuiceCompletedAlert(of fruitJuice: FruitJuice) {
        let alert = UIAlertController(title: "\(fruitJuice.name) 나왔습니다!", message: "맛있게 드세요!", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "잘 먹을게요", style: .default)
        alert.addAction(confirmAction)
        self.present(alert, animated: true)
    }
}

