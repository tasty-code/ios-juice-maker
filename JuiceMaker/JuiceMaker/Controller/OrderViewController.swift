//
//  JuiceMaker - OrderViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class OrderViewController: UIViewController {
    
    private let fruitStore = FruitStore.shared
    private let juiceMaker = JuiceMaker()
    
    @IBOutlet var fruitCountLabels: [UILabel]!
    @IBOutlet var juiceOrderButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        syncFruitStocks()
    }
    
    @IBAction func orderButtonDidTap(_ sender: UIButton) {
        let juice = Juice.allCases[sender.tag]
        guard juiceMaker.isMakable(menu: juice) else {
            showAlart(menu: juice.orderTitle)
            return
        }
        juiceMaker.startBlending(of: juice)
        syncFruitStocks()
    }
    
    @IBAction func editStockButtonDidTap(_ sender: Any) {
        guard let storeVC = self.storyboard?.instantiateViewController(identifier: "StoreViewController") as? StoreViewController else { return }
        navigationController?.pushViewController(storeVC, animated: true)
    }
    
    private func syncFruitStocks() {
        (0...4).forEach {
            let stock = fruitStore.count(of: Fruits.allCases[$0])
            fruitCountLabels[$0].text = String(stock)
        }
        (0...6).forEach {
            if !juiceMaker.isMakable(menu: Juice.allCases[$0]) {
                juiceOrderButtons[$0].backgroundColor = .lightGray
            }
        }
    }
    
    private func showAlart(menu: String) {
        let alert = UIAlertController(title: "주의", message: "\(menu) 주문이 마감되었습니다.", preferredStyle: .alert)
        let confirm = UIAlertAction(title: "확인", style: .default, handler: nil)
        let close = UIAlertAction(title: "닫기", style: .destructive, handler: nil)
        
        alert.addAction(confirm)
        alert.addAction(close)
        present(alert, animated: true, completion: nil)
    }
}
