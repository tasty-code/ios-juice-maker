//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    private let juiceMaker = JuiceMaker()
    private var currentQuantity: [Fruit: Int] = [:]
    
    @IBOutlet private var fruitsLabel: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getStockList()
    }
    
    @IBAction private func showPush() {
        moveToStockVc()
    }
    
    @IBAction private func makeOrder(_ sender: UIButton) {
        guard let menu = Juice(rawValue: sender.tag) else {
            return
        }
        let orderResult = juiceMaker.getOrder(menu)
        
        if orderResult.success {
            getStockList()
            successAlert(orderResult.message)
            return
        }
        failAlert(orderResult.message)
    }
    
    private func getStockList() {
        self.currentQuantity = juiceMaker.passCurrentList()
        for (fruit, _) in currentQuantity {
            guard let fruitLabelText = currentQuantity[fruit] else {
                return
            }
            fruitsLabel[fruit.rawValue].text = String(fruitLabelText)
        }
    }
    
    private func successAlert(_ message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    private func failAlert(_ message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let cancleAction = UIAlertAction(title: "취소", style: .default)
        let changeAction = UIAlertAction(title: "이동", style: .default, handler: { action in
            self.moveToStockVc()
        })
        
        alert.addAction(cancleAction)
        alert.addAction(changeAction)
        present(alert, animated: true, completion: nil)
    }
    
    private func moveToStockVc() {
        let stockVC = self.storyboard?.instantiateViewController(withIdentifier: "StockViewController") as! StockViewController
        self.navigationController?.pushViewController(stockVC, animated: true)
    }
}

