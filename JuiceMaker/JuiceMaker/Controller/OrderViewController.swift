//
//  JuiceMaker - OrderViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class OrderViewController: UIViewController {
    let fruitStore = FruitStore.shared
    let juiceMaker = JuiceMaker()
    
    @IBOutlet var fruitCountLabels: [UILabel]!
    @IBOutlet var juiceOrderButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        syncFruitStocks()
    }

    func syncFruitStocks() {
        (0...4).forEach {
            let stock = fruitStore.count(of: Fruits(rawValue: $0)!)
            fruitCountLabels[$0].text = String(stock)
        }
    }

    @IBAction func orderButtonDidTap(_ sender: UIButton) {
        let juice = Juice.allCases[sender.tag]
        guard juiceMaker.checkOrderable(of: juice) else {
            print("\(juice.orderTitle)이 마감되었습니다.")    //MARK: - 에러발생으로 수정
            return
        }
        juiceMaker.startBlending(of: juice)
        syncFruitStocks()
    }
}

