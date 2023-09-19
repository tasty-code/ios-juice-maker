//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController, SendDataDelegate {
    private let juiceMaker = JuiceMaker()
    var currentQuantity: [Fruit : Int] = [:]
    
    @IBOutlet var fruitsLabel: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getStockList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        juiceMaker.stockChanger(currentQuantity)
        getStockList()
    }
    
    @IBAction func showPush() {
        moveToStockVc()
    }
    
    @IBAction func makeOrder(_ sender: UIButton) {
        guard let menu = Juice(rawValue: sender.tag) else {
            return
        }
        let orderResult = juiceMaker.getOrder(menu)
        
        if orderResult.success {
            getStockList()
        }
        resultAlert(orderResult.message, orderResult.success)
    }
    
    func getStockList() {
        self.currentQuantity = juiceMaker.passCurrentList()
        for (fruit, _) in currentQuantity {
            guard let fruitLabelText = currentQuantity[fruit] else {
                return
            }
            fruitsLabel[fruit.rawValue].text = String(fruitLabelText)
        }
    }
    
    func resultAlert(_ message: String, _ isSuccess: Bool) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        
        if isSuccess {
            alert.addAction(okAction)
        } else {
            let cancleAction = UIAlertAction(title: "취소", style: .default)
            let changeAction = UIAlertAction(title: "이동", style: .default, handler: { action in
                self.moveToStockVc()
            })
            alert.addAction(cancleAction)
            alert.addAction(changeAction)
        }
        present(alert, animated: true, completion: nil)
    }
    
    func moveToStockVc() {
        let stockVC = self.storyboard?.instantiateViewController(withIdentifier: "StockViewController") as! StockViewController
        
        stockVC.transferData = currentQuantity
        stockVC.delegate = self
        
        self.navigationController?.pushViewController(stockVC, animated: true)
    }
    
    func recieveData(response: [Fruit : Int]) {
        currentQuantity = response
        print("업데이트 밸류 : \(response)")
    }
}

