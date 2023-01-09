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
            alert(failed: juice)
            return
        }
        juiceMaker.startBlending(of: juice)
        syncFruitStocks()
        alert(succeed: juice)
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
    
    private func alert(succeed menu: Juice) {
        let alert = UIAlertController(title: "*\(menu.rawValue)쥬스 나왔습니다!",
                                      message: "맛있게 드세요!",
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: .default)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    private func alert(failed menu: Juice) {
        let alert = UIAlertController(title: nil,
                                      message: "재료가 모자라요.\n재고를 수정할까요?",
                                      preferredStyle: .alert)
        let confirm = UIAlertAction(title: "예", style: .default, handler: nil)
        let close = UIAlertAction(title: "아니요", style: .destructive)
        
        alert.addAction(confirm)
        alert.addAction(close)
        present(alert, animated: true, completion: nil)
    }
}
